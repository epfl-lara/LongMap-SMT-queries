; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4332 () Bool)

(assert start!4332)

(declare-fun b_free!1173 () Bool)

(declare-fun b_next!1173 () Bool)

(assert (=> start!4332 (= b_free!1173 (not b_next!1173))))

(declare-fun tp!4947 () Bool)

(declare-fun b_and!1989 () Bool)

(assert (=> start!4332 (= tp!4947 b_and!1989)))

(declare-fun b!33372 () Bool)

(declare-fun e!21196 () Bool)

(declare-datatypes ((array!2267 0))(
  ( (array!2268 (arr!1084 (Array (_ BitVec 32) (_ BitVec 64))) (size!1185 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2267)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!33372 (= e!21196 (not (= (size!1185 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-datatypes ((SeekEntryResult!128 0))(
  ( (MissingZero!128 (index!2634 (_ BitVec 32))) (Found!128 (index!2635 (_ BitVec 32))) (Intermediate!128 (undefined!940 Bool) (index!2636 (_ BitVec 32)) (x!6812 (_ BitVec 32))) (Undefined!128) (MissingVacant!128 (index!2637 (_ BitVec 32))) )
))
(declare-fun lt!12154 () SeekEntryResult!128)

(declare-fun lt!12152 () (_ BitVec 32))

(get-info :version)

(assert (=> b!33372 (and ((_ is Found!128) lt!12154) (= (index!2635 lt!12154) lt!12152))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2267 (_ BitVec 32)) SeekEntryResult!128)

(assert (=> b!33372 (= lt!12154 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!744 0))(
  ( (Unit!745) )
))
(declare-fun lt!12153 () Unit!744)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2267 (_ BitVec 32)) Unit!744)

(assert (=> b!33372 (= lt!12153 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k0!1304 lt!12152 _keys!1833 mask!2294))))

(declare-datatypes ((V!1861 0))(
  ( (V!1862 (val!790 Int)) )
))
(declare-datatypes ((tuple2!1288 0))(
  ( (tuple2!1289 (_1!655 (_ BitVec 64)) (_2!655 V!1861)) )
))
(declare-datatypes ((List!878 0))(
  ( (Nil!875) (Cons!874 (h!1441 tuple2!1288) (t!3577 List!878)) )
))
(declare-datatypes ((ListLongMap!865 0))(
  ( (ListLongMap!866 (toList!448 List!878)) )
))
(declare-fun lt!12156 () ListLongMap!865)

(declare-fun contains!391 (ListLongMap!865 (_ BitVec 64)) Bool)

(assert (=> b!33372 (contains!391 lt!12156 (select (arr!1084 _keys!1833) lt!12152))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!564 0))(
  ( (ValueCellFull!564 (v!1882 V!1861)) (EmptyCell!564) )
))
(declare-datatypes ((array!2269 0))(
  ( (array!2270 (arr!1085 (Array (_ BitVec 32) ValueCell!564)) (size!1186 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2269)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!12155 () Unit!744)

(declare-fun zeroValue!1443 () V!1861)

(declare-fun minValue!1443 () V!1861)

(declare-fun lemmaValidKeyInArrayIsInListMap!60 (array!2267 array!2269 (_ BitVec 32) (_ BitVec 32) V!1861 V!1861 (_ BitVec 32) Int) Unit!744)

(assert (=> b!33372 (= lt!12155 (lemmaValidKeyInArrayIsInListMap!60 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12152 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2267 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33372 (= lt!12152 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33373 () Bool)

(declare-fun e!21195 () Bool)

(declare-fun tp_is_empty!1527 () Bool)

(assert (=> b!33373 (= e!21195 tp_is_empty!1527)))

(declare-fun b!33374 () Bool)

(declare-fun res!20286 () Bool)

(declare-fun e!21197 () Bool)

(assert (=> b!33374 (=> (not res!20286) (not e!21197))))

(assert (=> b!33374 (= res!20286 (and (= (size!1186 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1185 _keys!1833) (size!1186 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!33375 () Bool)

(assert (=> b!33375 (= e!21197 e!21196)))

(declare-fun res!20281 () Bool)

(assert (=> b!33375 (=> (not res!20281) (not e!21196))))

(assert (=> b!33375 (= res!20281 (not (contains!391 lt!12156 k0!1304)))))

(declare-fun getCurrentListMap!274 (array!2267 array!2269 (_ BitVec 32) (_ BitVec 32) V!1861 V!1861 (_ BitVec 32) Int) ListLongMap!865)

(assert (=> b!33375 (= lt!12156 (getCurrentListMap!274 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun res!20283 () Bool)

(assert (=> start!4332 (=> (not res!20283) (not e!21197))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4332 (= res!20283 (validMask!0 mask!2294))))

(assert (=> start!4332 e!21197))

(assert (=> start!4332 true))

(assert (=> start!4332 tp!4947))

(declare-fun e!21194 () Bool)

(declare-fun array_inv!763 (array!2269) Bool)

(assert (=> start!4332 (and (array_inv!763 _values!1501) e!21194)))

(declare-fun array_inv!764 (array!2267) Bool)

(assert (=> start!4332 (array_inv!764 _keys!1833)))

(assert (=> start!4332 tp_is_empty!1527))

(declare-fun b!33376 () Bool)

(declare-fun res!20282 () Bool)

(assert (=> b!33376 (=> (not res!20282) (not e!21197))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33376 (= res!20282 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!1828 () Bool)

(declare-fun mapRes!1828 () Bool)

(assert (=> mapIsEmpty!1828 mapRes!1828))

(declare-fun b!33377 () Bool)

(declare-fun res!20285 () Bool)

(assert (=> b!33377 (=> (not res!20285) (not e!21196))))

(declare-fun arrayContainsKey!0 (array!2267 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33377 (= res!20285 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!33378 () Bool)

(declare-fun e!21198 () Bool)

(assert (=> b!33378 (= e!21198 tp_is_empty!1527)))

(declare-fun b!33379 () Bool)

(declare-fun res!20284 () Bool)

(assert (=> b!33379 (=> (not res!20284) (not e!21197))))

(declare-datatypes ((List!879 0))(
  ( (Nil!876) (Cons!875 (h!1442 (_ BitVec 64)) (t!3578 List!879)) )
))
(declare-fun arrayNoDuplicates!0 (array!2267 (_ BitVec 32) List!879) Bool)

(assert (=> b!33379 (= res!20284 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!876))))

(declare-fun b!33380 () Bool)

(declare-fun res!20287 () Bool)

(assert (=> b!33380 (=> (not res!20287) (not e!21197))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2267 (_ BitVec 32)) Bool)

(assert (=> b!33380 (= res!20287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33381 () Bool)

(assert (=> b!33381 (= e!21194 (and e!21198 mapRes!1828))))

(declare-fun condMapEmpty!1828 () Bool)

(declare-fun mapDefault!1828 () ValueCell!564)

(assert (=> b!33381 (= condMapEmpty!1828 (= (arr!1085 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!564)) mapDefault!1828)))))

(declare-fun mapNonEmpty!1828 () Bool)

(declare-fun tp!4948 () Bool)

(assert (=> mapNonEmpty!1828 (= mapRes!1828 (and tp!4948 e!21195))))

(declare-fun mapRest!1828 () (Array (_ BitVec 32) ValueCell!564))

(declare-fun mapKey!1828 () (_ BitVec 32))

(declare-fun mapValue!1828 () ValueCell!564)

(assert (=> mapNonEmpty!1828 (= (arr!1085 _values!1501) (store mapRest!1828 mapKey!1828 mapValue!1828))))

(assert (= (and start!4332 res!20283) b!33374))

(assert (= (and b!33374 res!20286) b!33380))

(assert (= (and b!33380 res!20287) b!33379))

(assert (= (and b!33379 res!20284) b!33376))

(assert (= (and b!33376 res!20282) b!33375))

(assert (= (and b!33375 res!20281) b!33377))

(assert (= (and b!33377 res!20285) b!33372))

(assert (= (and b!33381 condMapEmpty!1828) mapIsEmpty!1828))

(assert (= (and b!33381 (not condMapEmpty!1828)) mapNonEmpty!1828))

(assert (= (and mapNonEmpty!1828 ((_ is ValueCellFull!564) mapValue!1828)) b!33373))

(assert (= (and b!33381 ((_ is ValueCellFull!564) mapDefault!1828)) b!33378))

(assert (= start!4332 b!33381))

(declare-fun m!26771 () Bool)

(assert (=> b!33380 m!26771))

(declare-fun m!26773 () Bool)

(assert (=> mapNonEmpty!1828 m!26773))

(declare-fun m!26775 () Bool)

(assert (=> b!33379 m!26775))

(declare-fun m!26777 () Bool)

(assert (=> start!4332 m!26777))

(declare-fun m!26779 () Bool)

(assert (=> start!4332 m!26779))

(declare-fun m!26781 () Bool)

(assert (=> start!4332 m!26781))

(declare-fun m!26783 () Bool)

(assert (=> b!33377 m!26783))

(declare-fun m!26785 () Bool)

(assert (=> b!33375 m!26785))

(declare-fun m!26787 () Bool)

(assert (=> b!33375 m!26787))

(declare-fun m!26789 () Bool)

(assert (=> b!33376 m!26789))

(declare-fun m!26791 () Bool)

(assert (=> b!33372 m!26791))

(declare-fun m!26793 () Bool)

(assert (=> b!33372 m!26793))

(declare-fun m!26795 () Bool)

(assert (=> b!33372 m!26795))

(declare-fun m!26797 () Bool)

(assert (=> b!33372 m!26797))

(declare-fun m!26799 () Bool)

(assert (=> b!33372 m!26799))

(declare-fun m!26801 () Bool)

(assert (=> b!33372 m!26801))

(assert (=> b!33372 m!26795))

(check-sat (not b!33376) (not b!33379) (not b_next!1173) b_and!1989 tp_is_empty!1527 (not mapNonEmpty!1828) (not start!4332) (not b!33377) (not b!33375) (not b!33380) (not b!33372))
(check-sat b_and!1989 (not b_next!1173))
