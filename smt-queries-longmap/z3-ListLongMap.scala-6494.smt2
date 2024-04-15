; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82786 () Bool)

(assert start!82786)

(declare-fun b_free!18931 () Bool)

(declare-fun b_next!18931 () Bool)

(assert (=> start!82786 (= b_free!18931 (not b_next!18931))))

(declare-fun tp!65923 () Bool)

(declare-fun b_and!30393 () Bool)

(assert (=> start!82786 (= tp!65923 b_and!30393)))

(declare-fun b!965646 () Bool)

(declare-fun res!646426 () Bool)

(declare-fun e!544344 () Bool)

(assert (=> b!965646 (=> (not res!646426) (not e!544344))))

(declare-datatypes ((array!59490 0))(
  ( (array!59491 (arr!28614 (Array (_ BitVec 32) (_ BitVec 64))) (size!29095 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59490)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!965646 (= res!646426 (validKeyInArray!0 (select (arr!28614 _keys!1686) i!803)))))

(declare-fun b!965647 () Bool)

(assert (=> b!965647 (= e!544344 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33969 0))(
  ( (V!33970 (val!10920 Int)) )
))
(declare-datatypes ((ValueCell!10388 0))(
  ( (ValueCellFull!10388 (v!13477 V!33969)) (EmptyCell!10388) )
))
(declare-datatypes ((array!59492 0))(
  ( (array!59493 (arr!28615 (Array (_ BitVec 32) ValueCell!10388)) (size!29096 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59492)

(declare-fun minValue!1342 () V!33969)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun defaultEntry!1403 () Int)

(declare-fun lt!431036 () Bool)

(declare-fun zeroValue!1342 () V!33969)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14108 0))(
  ( (tuple2!14109 (_1!7065 (_ BitVec 64)) (_2!7065 V!33969)) )
))
(declare-datatypes ((List!19914 0))(
  ( (Nil!19911) (Cons!19910 (h!21072 tuple2!14108) (t!28268 List!19914)) )
))
(declare-datatypes ((ListLongMap!12795 0))(
  ( (ListLongMap!12796 (toList!6413 List!19914)) )
))
(declare-fun contains!5458 (ListLongMap!12795 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3575 (array!59490 array!59492 (_ BitVec 32) (_ BitVec 32) V!33969 V!33969 (_ BitVec 32) Int) ListLongMap!12795)

(assert (=> b!965647 (= lt!431036 (contains!5458 (getCurrentListMap!3575 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28614 _keys!1686) i!803)))))

(declare-fun b!965648 () Bool)

(declare-fun res!646422 () Bool)

(assert (=> b!965648 (=> (not res!646422) (not e!544344))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!965648 (= res!646422 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29095 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29095 _keys!1686))))))

(declare-fun b!965649 () Bool)

(declare-fun res!646424 () Bool)

(assert (=> b!965649 (=> (not res!646424) (not e!544344))))

(declare-datatypes ((List!19915 0))(
  ( (Nil!19912) (Cons!19911 (h!21073 (_ BitVec 64)) (t!28269 List!19915)) )
))
(declare-fun arrayNoDuplicates!0 (array!59490 (_ BitVec 32) List!19915) Bool)

(assert (=> b!965649 (= res!646424 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19912))))

(declare-fun mapIsEmpty!34603 () Bool)

(declare-fun mapRes!34603 () Bool)

(assert (=> mapIsEmpty!34603 mapRes!34603))

(declare-fun b!965650 () Bool)

(declare-fun e!544347 () Bool)

(declare-fun e!544346 () Bool)

(assert (=> b!965650 (= e!544347 (and e!544346 mapRes!34603))))

(declare-fun condMapEmpty!34603 () Bool)

(declare-fun mapDefault!34603 () ValueCell!10388)

(assert (=> b!965650 (= condMapEmpty!34603 (= (arr!28615 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10388)) mapDefault!34603)))))

(declare-fun b!965651 () Bool)

(declare-fun tp_is_empty!21739 () Bool)

(assert (=> b!965651 (= e!544346 tp_is_empty!21739)))

(declare-fun b!965652 () Bool)

(declare-fun res!646425 () Bool)

(assert (=> b!965652 (=> (not res!646425) (not e!544344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59490 (_ BitVec 32)) Bool)

(assert (=> b!965652 (= res!646425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!965653 () Bool)

(declare-fun res!646423 () Bool)

(assert (=> b!965653 (=> (not res!646423) (not e!544344))))

(assert (=> b!965653 (= res!646423 (and (= (size!29096 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29095 _keys!1686) (size!29096 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!965654 () Bool)

(declare-fun e!544345 () Bool)

(assert (=> b!965654 (= e!544345 tp_is_empty!21739)))

(declare-fun res!646427 () Bool)

(assert (=> start!82786 (=> (not res!646427) (not e!544344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82786 (= res!646427 (validMask!0 mask!2110))))

(assert (=> start!82786 e!544344))

(assert (=> start!82786 true))

(declare-fun array_inv!22215 (array!59492) Bool)

(assert (=> start!82786 (and (array_inv!22215 _values!1400) e!544347)))

(declare-fun array_inv!22216 (array!59490) Bool)

(assert (=> start!82786 (array_inv!22216 _keys!1686)))

(assert (=> start!82786 tp!65923))

(assert (=> start!82786 tp_is_empty!21739))

(declare-fun mapNonEmpty!34603 () Bool)

(declare-fun tp!65922 () Bool)

(assert (=> mapNonEmpty!34603 (= mapRes!34603 (and tp!65922 e!544345))))

(declare-fun mapKey!34603 () (_ BitVec 32))

(declare-fun mapRest!34603 () (Array (_ BitVec 32) ValueCell!10388))

(declare-fun mapValue!34603 () ValueCell!10388)

(assert (=> mapNonEmpty!34603 (= (arr!28615 _values!1400) (store mapRest!34603 mapKey!34603 mapValue!34603))))

(assert (= (and start!82786 res!646427) b!965653))

(assert (= (and b!965653 res!646423) b!965652))

(assert (= (and b!965652 res!646425) b!965649))

(assert (= (and b!965649 res!646424) b!965648))

(assert (= (and b!965648 res!646422) b!965646))

(assert (= (and b!965646 res!646426) b!965647))

(assert (= (and b!965650 condMapEmpty!34603) mapIsEmpty!34603))

(assert (= (and b!965650 (not condMapEmpty!34603)) mapNonEmpty!34603))

(get-info :version)

(assert (= (and mapNonEmpty!34603 ((_ is ValueCellFull!10388) mapValue!34603)) b!965654))

(assert (= (and b!965650 ((_ is ValueCellFull!10388) mapDefault!34603)) b!965651))

(assert (= start!82786 b!965650))

(declare-fun m!894061 () Bool)

(assert (=> b!965649 m!894061))

(declare-fun m!894063 () Bool)

(assert (=> b!965652 m!894063))

(declare-fun m!894065 () Bool)

(assert (=> b!965646 m!894065))

(assert (=> b!965646 m!894065))

(declare-fun m!894067 () Bool)

(assert (=> b!965646 m!894067))

(declare-fun m!894069 () Bool)

(assert (=> start!82786 m!894069))

(declare-fun m!894071 () Bool)

(assert (=> start!82786 m!894071))

(declare-fun m!894073 () Bool)

(assert (=> start!82786 m!894073))

(declare-fun m!894075 () Bool)

(assert (=> b!965647 m!894075))

(assert (=> b!965647 m!894065))

(assert (=> b!965647 m!894075))

(assert (=> b!965647 m!894065))

(declare-fun m!894077 () Bool)

(assert (=> b!965647 m!894077))

(declare-fun m!894079 () Bool)

(assert (=> mapNonEmpty!34603 m!894079))

(check-sat b_and!30393 tp_is_empty!21739 (not b!965646) (not b_next!18931) (not b!965649) (not mapNonEmpty!34603) (not b!965647) (not b!965652) (not start!82786))
(check-sat b_and!30393 (not b_next!18931))
