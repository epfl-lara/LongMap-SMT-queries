; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82830 () Bool)

(assert start!82830)

(declare-fun b_free!18957 () Bool)

(declare-fun b_next!18957 () Bool)

(assert (=> start!82830 (= b_free!18957 (not b_next!18957))))

(declare-fun tp!66000 () Bool)

(declare-fun b_and!30445 () Bool)

(assert (=> start!82830 (= tp!66000 b_and!30445)))

(declare-fun b!966236 () Bool)

(declare-fun res!646768 () Bool)

(declare-fun e!544691 () Bool)

(assert (=> b!966236 (=> (not res!646768) (not e!544691))))

(declare-datatypes ((array!59615 0))(
  ( (array!59616 (arr!28676 (Array (_ BitVec 32) (_ BitVec 64))) (size!29155 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59615)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59615 (_ BitVec 32)) Bool)

(assert (=> b!966236 (= res!646768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!646766 () Bool)

(assert (=> start!82830 (=> (not res!646766) (not e!544691))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82830 (= res!646766 (validMask!0 mask!2110))))

(assert (=> start!82830 e!544691))

(assert (=> start!82830 true))

(declare-datatypes ((V!34003 0))(
  ( (V!34004 (val!10933 Int)) )
))
(declare-datatypes ((ValueCell!10401 0))(
  ( (ValueCellFull!10401 (v!13491 V!34003)) (EmptyCell!10401) )
))
(declare-datatypes ((array!59617 0))(
  ( (array!59618 (arr!28677 (Array (_ BitVec 32) ValueCell!10401)) (size!29156 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59617)

(declare-fun e!544689 () Bool)

(declare-fun array_inv!22211 (array!59617) Bool)

(assert (=> start!82830 (and (array_inv!22211 _values!1400) e!544689)))

(declare-fun array_inv!22212 (array!59615) Bool)

(assert (=> start!82830 (array_inv!22212 _keys!1686)))

(assert (=> start!82830 tp!66000))

(declare-fun tp_is_empty!21765 () Bool)

(assert (=> start!82830 tp_is_empty!21765))

(declare-fun b!966237 () Bool)

(assert (=> b!966237 (= e!544691 false)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34003)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun lt!431311 () Bool)

(declare-fun zeroValue!1342 () V!34003)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14062 0))(
  ( (tuple2!14063 (_1!7042 (_ BitVec 64)) (_2!7042 V!34003)) )
))
(declare-datatypes ((List!19904 0))(
  ( (Nil!19901) (Cons!19900 (h!21062 tuple2!14062) (t!28267 List!19904)) )
))
(declare-datatypes ((ListLongMap!12759 0))(
  ( (ListLongMap!12760 (toList!6395 List!19904)) )
))
(declare-fun contains!5496 (ListLongMap!12759 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3628 (array!59615 array!59617 (_ BitVec 32) (_ BitVec 32) V!34003 V!34003 (_ BitVec 32) Int) ListLongMap!12759)

(assert (=> b!966237 (= lt!431311 (contains!5496 (getCurrentListMap!3628 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28676 _keys!1686) i!803)))))

(declare-fun b!966238 () Bool)

(declare-fun res!646771 () Bool)

(assert (=> b!966238 (=> (not res!646771) (not e!544691))))

(declare-datatypes ((List!19905 0))(
  ( (Nil!19902) (Cons!19901 (h!21063 (_ BitVec 64)) (t!28268 List!19905)) )
))
(declare-fun arrayNoDuplicates!0 (array!59615 (_ BitVec 32) List!19905) Bool)

(assert (=> b!966238 (= res!646771 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19902))))

(declare-fun b!966239 () Bool)

(declare-fun e!544688 () Bool)

(assert (=> b!966239 (= e!544688 tp_is_empty!21765)))

(declare-fun mapIsEmpty!34642 () Bool)

(declare-fun mapRes!34642 () Bool)

(assert (=> mapIsEmpty!34642 mapRes!34642))

(declare-fun b!966240 () Bool)

(declare-fun res!646770 () Bool)

(assert (=> b!966240 (=> (not res!646770) (not e!544691))))

(assert (=> b!966240 (= res!646770 (and (= (size!29156 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29155 _keys!1686) (size!29156 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!966241 () Bool)

(declare-fun res!646767 () Bool)

(assert (=> b!966241 (=> (not res!646767) (not e!544691))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!966241 (= res!646767 (validKeyInArray!0 (select (arr!28676 _keys!1686) i!803)))))

(declare-fun b!966242 () Bool)

(declare-fun e!544690 () Bool)

(assert (=> b!966242 (= e!544689 (and e!544690 mapRes!34642))))

(declare-fun condMapEmpty!34642 () Bool)

(declare-fun mapDefault!34642 () ValueCell!10401)

(assert (=> b!966242 (= condMapEmpty!34642 (= (arr!28677 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10401)) mapDefault!34642)))))

(declare-fun b!966243 () Bool)

(assert (=> b!966243 (= e!544690 tp_is_empty!21765)))

(declare-fun b!966244 () Bool)

(declare-fun res!646769 () Bool)

(assert (=> b!966244 (=> (not res!646769) (not e!544691))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!966244 (= res!646769 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29155 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29155 _keys!1686))))))

(declare-fun mapNonEmpty!34642 () Bool)

(declare-fun tp!65999 () Bool)

(assert (=> mapNonEmpty!34642 (= mapRes!34642 (and tp!65999 e!544688))))

(declare-fun mapKey!34642 () (_ BitVec 32))

(declare-fun mapValue!34642 () ValueCell!10401)

(declare-fun mapRest!34642 () (Array (_ BitVec 32) ValueCell!10401))

(assert (=> mapNonEmpty!34642 (= (arr!28677 _values!1400) (store mapRest!34642 mapKey!34642 mapValue!34642))))

(assert (= (and start!82830 res!646766) b!966240))

(assert (= (and b!966240 res!646770) b!966236))

(assert (= (and b!966236 res!646768) b!966238))

(assert (= (and b!966238 res!646771) b!966244))

(assert (= (and b!966244 res!646769) b!966241))

(assert (= (and b!966241 res!646767) b!966237))

(assert (= (and b!966242 condMapEmpty!34642) mapIsEmpty!34642))

(assert (= (and b!966242 (not condMapEmpty!34642)) mapNonEmpty!34642))

(get-info :version)

(assert (= (and mapNonEmpty!34642 ((_ is ValueCellFull!10401) mapValue!34642)) b!966239))

(assert (= (and b!966242 ((_ is ValueCellFull!10401) mapDefault!34642)) b!966243))

(assert (= start!82830 b!966242))

(declare-fun m!895079 () Bool)

(assert (=> b!966241 m!895079))

(assert (=> b!966241 m!895079))

(declare-fun m!895081 () Bool)

(assert (=> b!966241 m!895081))

(declare-fun m!895083 () Bool)

(assert (=> b!966236 m!895083))

(declare-fun m!895085 () Bool)

(assert (=> mapNonEmpty!34642 m!895085))

(declare-fun m!895087 () Bool)

(assert (=> b!966237 m!895087))

(assert (=> b!966237 m!895079))

(assert (=> b!966237 m!895087))

(assert (=> b!966237 m!895079))

(declare-fun m!895089 () Bool)

(assert (=> b!966237 m!895089))

(declare-fun m!895091 () Bool)

(assert (=> start!82830 m!895091))

(declare-fun m!895093 () Bool)

(assert (=> start!82830 m!895093))

(declare-fun m!895095 () Bool)

(assert (=> start!82830 m!895095))

(declare-fun m!895097 () Bool)

(assert (=> b!966238 m!895097))

(check-sat b_and!30445 (not mapNonEmpty!34642) (not b!966241) (not b!966238) (not b!966237) (not b!966236) tp_is_empty!21765 (not b_next!18957) (not start!82830))
(check-sat b_and!30445 (not b_next!18957))
