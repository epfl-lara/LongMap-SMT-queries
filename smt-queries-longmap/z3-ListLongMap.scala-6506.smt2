; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82858 () Bool)

(assert start!82858)

(declare-fun b_free!19003 () Bool)

(declare-fun b_next!19003 () Bool)

(assert (=> start!82858 (= b_free!19003 (not b_next!19003))))

(declare-fun tp!66139 () Bool)

(declare-fun b_and!30465 () Bool)

(assert (=> start!82858 (= tp!66139 b_and!30465)))

(declare-fun b!966649 () Bool)

(declare-fun e!544886 () Bool)

(declare-fun tp_is_empty!21811 () Bool)

(assert (=> b!966649 (= e!544886 tp_is_empty!21811)))

(declare-fun b!966650 () Bool)

(declare-fun res!647103 () Bool)

(declare-fun e!544885 () Bool)

(assert (=> b!966650 (=> (not res!647103) (not e!544885))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!34065 0))(
  ( (V!34066 (val!10956 Int)) )
))
(declare-datatypes ((ValueCell!10424 0))(
  ( (ValueCellFull!10424 (v!13513 V!34065)) (EmptyCell!10424) )
))
(declare-datatypes ((array!59628 0))(
  ( (array!59629 (arr!28683 (Array (_ BitVec 32) ValueCell!10424)) (size!29164 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59628)

(declare-datatypes ((array!59630 0))(
  ( (array!59631 (arr!28684 (Array (_ BitVec 32) (_ BitVec 64))) (size!29165 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59630)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!966650 (= res!647103 (and (= (size!29164 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29165 _keys!1686) (size!29164 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun res!647107 () Bool)

(assert (=> start!82858 (=> (not res!647107) (not e!544885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82858 (= res!647107 (validMask!0 mask!2110))))

(assert (=> start!82858 e!544885))

(assert (=> start!82858 true))

(declare-fun e!544888 () Bool)

(declare-fun array_inv!22271 (array!59628) Bool)

(assert (=> start!82858 (and (array_inv!22271 _values!1400) e!544888)))

(declare-fun array_inv!22272 (array!59630) Bool)

(assert (=> start!82858 (array_inv!22272 _keys!1686)))

(assert (=> start!82858 tp!66139))

(assert (=> start!82858 tp_is_empty!21811))

(declare-fun b!966651 () Bool)

(declare-fun e!544884 () Bool)

(assert (=> b!966651 (= e!544884 tp_is_empty!21811)))

(declare-fun b!966652 () Bool)

(declare-fun res!647108 () Bool)

(assert (=> b!966652 (=> (not res!647108) (not e!544885))))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966652 (= res!647108 (validKeyInArray!0 (select (arr!28684 _keys!1686) i!803)))))

(declare-fun mapNonEmpty!34711 () Bool)

(declare-fun mapRes!34711 () Bool)

(declare-fun tp!66138 () Bool)

(assert (=> mapNonEmpty!34711 (= mapRes!34711 (and tp!66138 e!544884))))

(declare-fun mapKey!34711 () (_ BitVec 32))

(declare-fun mapRest!34711 () (Array (_ BitVec 32) ValueCell!10424))

(declare-fun mapValue!34711 () ValueCell!10424)

(assert (=> mapNonEmpty!34711 (= (arr!28683 _values!1400) (store mapRest!34711 mapKey!34711 mapValue!34711))))

(declare-fun b!966653 () Bool)

(assert (=> b!966653 (= e!544885 (not true))))

(declare-fun minValue!1342 () V!34065)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34065)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14158 0))(
  ( (tuple2!14159 (_1!7090 (_ BitVec 64)) (_2!7090 V!34065)) )
))
(declare-datatypes ((List!19965 0))(
  ( (Nil!19962) (Cons!19961 (h!21123 tuple2!14158) (t!28319 List!19965)) )
))
(declare-datatypes ((ListLongMap!12845 0))(
  ( (ListLongMap!12846 (toList!6438 List!19965)) )
))
(declare-fun contains!5483 (ListLongMap!12845 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3600 (array!59630 array!59628 (_ BitVec 32) (_ BitVec 32) V!34065 V!34065 (_ BitVec 32) Int) ListLongMap!12845)

(assert (=> b!966653 (contains!5483 (getCurrentListMap!3600 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28684 _keys!1686) i!803))))

(declare-datatypes ((Unit!32172 0))(
  ( (Unit!32173) )
))
(declare-fun lt!431135 () Unit!32172)

(declare-fun lemmaInListMapFromThenInFromMinusOne!50 (array!59630 array!59628 (_ BitVec 32) (_ BitVec 32) V!34065 V!34065 (_ BitVec 32) (_ BitVec 32) Int) Unit!32172)

(assert (=> b!966653 (= lt!431135 (lemmaInListMapFromThenInFromMinusOne!50 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!966654 () Bool)

(declare-fun res!647102 () Bool)

(assert (=> b!966654 (=> (not res!647102) (not e!544885))))

(assert (=> b!966654 (= res!647102 (contains!5483 (getCurrentListMap!3600 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28684 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34711 () Bool)

(assert (=> mapIsEmpty!34711 mapRes!34711))

(declare-fun b!966655 () Bool)

(declare-fun res!647105 () Bool)

(assert (=> b!966655 (=> (not res!647105) (not e!544885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59630 (_ BitVec 32)) Bool)

(assert (=> b!966655 (= res!647105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!966656 () Bool)

(declare-fun res!647106 () Bool)

(assert (=> b!966656 (=> (not res!647106) (not e!544885))))

(declare-datatypes ((List!19966 0))(
  ( (Nil!19963) (Cons!19962 (h!21124 (_ BitVec 64)) (t!28320 List!19966)) )
))
(declare-fun arrayNoDuplicates!0 (array!59630 (_ BitVec 32) List!19966) Bool)

(assert (=> b!966656 (= res!647106 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19963))))

(declare-fun b!966657 () Bool)

(assert (=> b!966657 (= e!544888 (and e!544886 mapRes!34711))))

(declare-fun condMapEmpty!34711 () Bool)

(declare-fun mapDefault!34711 () ValueCell!10424)

(assert (=> b!966657 (= condMapEmpty!34711 (= (arr!28683 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10424)) mapDefault!34711)))))

(declare-fun b!966658 () Bool)

(declare-fun res!647101 () Bool)

(assert (=> b!966658 (=> (not res!647101) (not e!544885))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966658 (= res!647101 (bvsgt from!2084 newFrom!159))))

(declare-fun b!966659 () Bool)

(declare-fun res!647104 () Bool)

(assert (=> b!966659 (=> (not res!647104) (not e!544885))))

(assert (=> b!966659 (= res!647104 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29165 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29165 _keys!1686))))))

(assert (= (and start!82858 res!647107) b!966650))

(assert (= (and b!966650 res!647103) b!966655))

(assert (= (and b!966655 res!647105) b!966656))

(assert (= (and b!966656 res!647106) b!966659))

(assert (= (and b!966659 res!647104) b!966652))

(assert (= (and b!966652 res!647108) b!966654))

(assert (= (and b!966654 res!647102) b!966658))

(assert (= (and b!966658 res!647101) b!966653))

(assert (= (and b!966657 condMapEmpty!34711) mapIsEmpty!34711))

(assert (= (and b!966657 (not condMapEmpty!34711)) mapNonEmpty!34711))

(get-info :version)

(assert (= (and mapNonEmpty!34711 ((_ is ValueCellFull!10424) mapValue!34711)) b!966651))

(assert (= (and b!966657 ((_ is ValueCellFull!10424) mapDefault!34711)) b!966649))

(assert (= start!82858 b!966657))

(declare-fun m!894799 () Bool)

(assert (=> b!966652 m!894799))

(assert (=> b!966652 m!894799))

(declare-fun m!894801 () Bool)

(assert (=> b!966652 m!894801))

(declare-fun m!894803 () Bool)

(assert (=> b!966656 m!894803))

(declare-fun m!894805 () Bool)

(assert (=> b!966655 m!894805))

(declare-fun m!894807 () Bool)

(assert (=> b!966653 m!894807))

(assert (=> b!966653 m!894799))

(assert (=> b!966653 m!894807))

(assert (=> b!966653 m!894799))

(declare-fun m!894809 () Bool)

(assert (=> b!966653 m!894809))

(declare-fun m!894811 () Bool)

(assert (=> b!966653 m!894811))

(declare-fun m!894813 () Bool)

(assert (=> b!966654 m!894813))

(assert (=> b!966654 m!894799))

(assert (=> b!966654 m!894813))

(assert (=> b!966654 m!894799))

(declare-fun m!894815 () Bool)

(assert (=> b!966654 m!894815))

(declare-fun m!894817 () Bool)

(assert (=> mapNonEmpty!34711 m!894817))

(declare-fun m!894819 () Bool)

(assert (=> start!82858 m!894819))

(declare-fun m!894821 () Bool)

(assert (=> start!82858 m!894821))

(declare-fun m!894823 () Bool)

(assert (=> start!82858 m!894823))

(check-sat (not mapNonEmpty!34711) (not start!82858) (not b!966652) (not b_next!19003) (not b!966653) tp_is_empty!21811 (not b!966655) (not b!966656) b_and!30465 (not b!966654))
(check-sat b_and!30465 (not b_next!19003))
