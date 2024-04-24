; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4442 () Bool)

(assert start!4442)

(declare-fun b_free!1207 () Bool)

(declare-fun b_next!1207 () Bool)

(assert (=> start!4442 (= b_free!1207 (not b_next!1207))))

(declare-fun tp!5059 () Bool)

(declare-fun b_and!2019 () Bool)

(assert (=> start!4442 (= tp!5059 b_and!2019)))

(declare-fun b!34249 () Bool)

(declare-fun res!20767 () Bool)

(declare-fun e!21735 () Bool)

(assert (=> b!34249 (=> (not res!20767) (not e!21735))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34249 (= res!20767 (validKeyInArray!0 k0!1304))))

(declare-fun b!34250 () Bool)

(declare-fun res!20765 () Bool)

(assert (=> b!34250 (=> (not res!20765) (not e!21735))))

(declare-datatypes ((V!1907 0))(
  ( (V!1908 (val!807 Int)) )
))
(declare-datatypes ((ValueCell!581 0))(
  ( (ValueCellFull!581 (v!1902 V!1907)) (EmptyCell!581) )
))
(declare-datatypes ((array!2323 0))(
  ( (array!2324 (arr!1109 (Array (_ BitVec 32) ValueCell!581)) (size!1210 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2323)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2325 0))(
  ( (array!2326 (arr!1110 (Array (_ BitVec 32) (_ BitVec 64))) (size!1211 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2325)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!34250 (= res!20765 (and (= (size!1210 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1211 _keys!1833) (size!1210 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34251 () Bool)

(assert (=> b!34251 (= e!21735 false)))

(declare-datatypes ((SeekEntryResult!134 0))(
  ( (MissingZero!134 (index!2658 (_ BitVec 32))) (Found!134 (index!2659 (_ BitVec 32))) (Intermediate!134 (undefined!946 Bool) (index!2660 (_ BitVec 32)) (x!6896 (_ BitVec 32))) (Undefined!134) (MissingVacant!134 (index!2661 (_ BitVec 32))) )
))
(declare-fun lt!12724 () SeekEntryResult!134)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2325 (_ BitVec 32)) SeekEntryResult!134)

(assert (=> b!34251 (= lt!12724 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!34252 () Bool)

(declare-fun res!20766 () Bool)

(assert (=> b!34252 (=> (not res!20766) (not e!21735))))

(declare-datatypes ((List!884 0))(
  ( (Nil!881) (Cons!880 (h!1447 (_ BitVec 64)) (t!3583 List!884)) )
))
(declare-fun arrayNoDuplicates!0 (array!2325 (_ BitVec 32) List!884) Bool)

(assert (=> b!34252 (= res!20766 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!881))))

(declare-fun res!20770 () Bool)

(assert (=> start!4442 (=> (not res!20770) (not e!21735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4442 (= res!20770 (validMask!0 mask!2294))))

(assert (=> start!4442 e!21735))

(assert (=> start!4442 true))

(assert (=> start!4442 tp!5059))

(declare-fun e!21736 () Bool)

(declare-fun array_inv!759 (array!2323) Bool)

(assert (=> start!4442 (and (array_inv!759 _values!1501) e!21736)))

(declare-fun array_inv!760 (array!2325) Bool)

(assert (=> start!4442 (array_inv!760 _keys!1833)))

(declare-fun tp_is_empty!1561 () Bool)

(assert (=> start!4442 tp_is_empty!1561))

(declare-fun mapNonEmpty!1888 () Bool)

(declare-fun mapRes!1888 () Bool)

(declare-fun tp!5058 () Bool)

(declare-fun e!21734 () Bool)

(assert (=> mapNonEmpty!1888 (= mapRes!1888 (and tp!5058 e!21734))))

(declare-fun mapValue!1888 () ValueCell!581)

(declare-fun mapKey!1888 () (_ BitVec 32))

(declare-fun mapRest!1888 () (Array (_ BitVec 32) ValueCell!581))

(assert (=> mapNonEmpty!1888 (= (arr!1109 _values!1501) (store mapRest!1888 mapKey!1888 mapValue!1888))))

(declare-fun b!34253 () Bool)

(declare-fun res!20771 () Bool)

(assert (=> b!34253 (=> (not res!20771) (not e!21735))))

(declare-fun arrayContainsKey!0 (array!2325 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34253 (= res!20771 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34254 () Bool)

(declare-fun res!20769 () Bool)

(assert (=> b!34254 (=> (not res!20769) (not e!21735))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1907)

(declare-fun minValue!1443 () V!1907)

(declare-datatypes ((tuple2!1292 0))(
  ( (tuple2!1293 (_1!657 (_ BitVec 64)) (_2!657 V!1907)) )
))
(declare-datatypes ((List!885 0))(
  ( (Nil!882) (Cons!881 (h!1448 tuple2!1292) (t!3584 List!885)) )
))
(declare-datatypes ((ListLongMap!863 0))(
  ( (ListLongMap!864 (toList!447 List!885)) )
))
(declare-fun contains!395 (ListLongMap!863 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!268 (array!2325 array!2323 (_ BitVec 32) (_ BitVec 32) V!1907 V!1907 (_ BitVec 32) Int) ListLongMap!863)

(assert (=> b!34254 (= res!20769 (not (contains!395 (getCurrentListMap!268 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!34255 () Bool)

(assert (=> b!34255 (= e!21734 tp_is_empty!1561)))

(declare-fun b!34256 () Bool)

(declare-fun res!20768 () Bool)

(assert (=> b!34256 (=> (not res!20768) (not e!21735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2325 (_ BitVec 32)) Bool)

(assert (=> b!34256 (= res!20768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34257 () Bool)

(declare-fun e!21737 () Bool)

(assert (=> b!34257 (= e!21736 (and e!21737 mapRes!1888))))

(declare-fun condMapEmpty!1888 () Bool)

(declare-fun mapDefault!1888 () ValueCell!581)

(assert (=> b!34257 (= condMapEmpty!1888 (= (arr!1109 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!581)) mapDefault!1888)))))

(declare-fun b!34258 () Bool)

(assert (=> b!34258 (= e!21737 tp_is_empty!1561)))

(declare-fun mapIsEmpty!1888 () Bool)

(assert (=> mapIsEmpty!1888 mapRes!1888))

(assert (= (and start!4442 res!20770) b!34250))

(assert (= (and b!34250 res!20765) b!34256))

(assert (= (and b!34256 res!20768) b!34252))

(assert (= (and b!34252 res!20766) b!34249))

(assert (= (and b!34249 res!20767) b!34254))

(assert (= (and b!34254 res!20769) b!34253))

(assert (= (and b!34253 res!20771) b!34251))

(assert (= (and b!34257 condMapEmpty!1888) mapIsEmpty!1888))

(assert (= (and b!34257 (not condMapEmpty!1888)) mapNonEmpty!1888))

(get-info :version)

(assert (= (and mapNonEmpty!1888 ((_ is ValueCellFull!581) mapValue!1888)) b!34255))

(assert (= (and b!34257 ((_ is ValueCellFull!581) mapDefault!1888)) b!34258))

(assert (= start!4442 b!34257))

(declare-fun m!27529 () Bool)

(assert (=> b!34254 m!27529))

(assert (=> b!34254 m!27529))

(declare-fun m!27531 () Bool)

(assert (=> b!34254 m!27531))

(declare-fun m!27533 () Bool)

(assert (=> start!4442 m!27533))

(declare-fun m!27535 () Bool)

(assert (=> start!4442 m!27535))

(declare-fun m!27537 () Bool)

(assert (=> start!4442 m!27537))

(declare-fun m!27539 () Bool)

(assert (=> b!34253 m!27539))

(declare-fun m!27541 () Bool)

(assert (=> b!34256 m!27541))

(declare-fun m!27543 () Bool)

(assert (=> b!34251 m!27543))

(declare-fun m!27545 () Bool)

(assert (=> mapNonEmpty!1888 m!27545))

(declare-fun m!27547 () Bool)

(assert (=> b!34252 m!27547))

(declare-fun m!27549 () Bool)

(assert (=> b!34249 m!27549))

(check-sat (not b_next!1207) (not b!34251) (not start!4442) (not b!34249) (not b!34256) (not b!34252) (not b!34254) tp_is_empty!1561 b_and!2019 (not b!34253) (not mapNonEmpty!1888))
(check-sat b_and!2019 (not b_next!1207))
