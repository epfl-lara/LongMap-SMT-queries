; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110724 () Bool)

(assert start!110724)

(declare-fun b_free!29559 () Bool)

(declare-fun b_next!29559 () Bool)

(assert (=> start!110724 (= b_free!29559 (not b_next!29559))))

(declare-fun tp!103998 () Bool)

(declare-fun b_and!47767 () Bool)

(assert (=> start!110724 (= tp!103998 b_and!47767)))

(declare-fun mapIsEmpty!54562 () Bool)

(declare-fun mapRes!54562 () Bool)

(assert (=> mapIsEmpty!54562 mapRes!54562))

(declare-fun res!869941 () Bool)

(declare-fun e!747557 () Bool)

(assert (=> start!110724 (=> (not res!869941) (not e!747557))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110724 (= res!869941 (validMask!0 mask!2040))))

(assert (=> start!110724 e!747557))

(assert (=> start!110724 tp!103998))

(declare-datatypes ((array!87566 0))(
  ( (array!87567 (arr!42263 (Array (_ BitVec 32) (_ BitVec 64))) (size!42813 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87566)

(declare-fun array_inv!31937 (array!87566) Bool)

(assert (=> start!110724 (array_inv!31937 _keys!1628)))

(assert (=> start!110724 true))

(declare-fun tp_is_empty!35289 () Bool)

(assert (=> start!110724 tp_is_empty!35289))

(declare-datatypes ((V!52155 0))(
  ( (V!52156 (val!17719 Int)) )
))
(declare-datatypes ((ValueCell!16746 0))(
  ( (ValueCellFull!16746 (v!20346 V!52155)) (EmptyCell!16746) )
))
(declare-datatypes ((array!87568 0))(
  ( (array!87569 (arr!42264 (Array (_ BitVec 32) ValueCell!16746)) (size!42814 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87568)

(declare-fun e!747556 () Bool)

(declare-fun array_inv!31938 (array!87568) Bool)

(assert (=> start!110724 (and (array_inv!31938 _values!1354) e!747556)))

(declare-fun b!1310407 () Bool)

(declare-fun res!869940 () Bool)

(assert (=> b!1310407 (=> (not res!869940) (not e!747557))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1310407 (= res!869940 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42813 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310408 () Bool)

(declare-fun res!869943 () Bool)

(assert (=> b!1310408 (=> (not res!869943) (not e!747557))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310408 (= res!869943 (validKeyInArray!0 (select (arr!42263 _keys!1628) from!2020)))))

(declare-fun mapNonEmpty!54562 () Bool)

(declare-fun tp!103999 () Bool)

(declare-fun e!747555 () Bool)

(assert (=> mapNonEmpty!54562 (= mapRes!54562 (and tp!103999 e!747555))))

(declare-fun mapRest!54562 () (Array (_ BitVec 32) ValueCell!16746))

(declare-fun mapKey!54562 () (_ BitVec 32))

(declare-fun mapValue!54562 () ValueCell!16746)

(assert (=> mapNonEmpty!54562 (= (arr!42264 _values!1354) (store mapRest!54562 mapKey!54562 mapValue!54562))))

(declare-fun b!1310409 () Bool)

(declare-fun res!869935 () Bool)

(assert (=> b!1310409 (=> (not res!869935) (not e!747557))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun zeroValue!1296 () V!52155)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun minValue!1296 () V!52155)

(declare-datatypes ((tuple2!22828 0))(
  ( (tuple2!22829 (_1!11425 (_ BitVec 64)) (_2!11425 V!52155)) )
))
(declare-datatypes ((List!29966 0))(
  ( (Nil!29963) (Cons!29962 (h!31171 tuple2!22828) (t!43572 List!29966)) )
))
(declare-datatypes ((ListLongMap!20485 0))(
  ( (ListLongMap!20486 (toList!10258 List!29966)) )
))
(declare-fun contains!8408 (ListLongMap!20485 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5271 (array!87566 array!87568 (_ BitVec 32) (_ BitVec 32) V!52155 V!52155 (_ BitVec 32) Int) ListLongMap!20485)

(assert (=> b!1310409 (= res!869935 (contains!8408 (getCurrentListMap!5271 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1310410 () Bool)

(assert (=> b!1310410 (= e!747557 (not true))))

(assert (=> b!1310410 (contains!8408 (getCurrentListMap!5271 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43334 0))(
  ( (Unit!43335) )
))
(declare-fun lt!585357 () Unit!43334)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!13 (array!87566 array!87568 (_ BitVec 32) (_ BitVec 32) V!52155 V!52155 (_ BitVec 64) (_ BitVec 32) Int) Unit!43334)

(assert (=> b!1310410 (= lt!585357 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXMin!13 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1310411 () Bool)

(declare-fun res!869942 () Bool)

(assert (=> b!1310411 (=> (not res!869942) (not e!747557))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87566 (_ BitVec 32)) Bool)

(assert (=> b!1310411 (= res!869942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310412 () Bool)

(declare-fun res!869939 () Bool)

(assert (=> b!1310412 (=> (not res!869939) (not e!747557))))

(assert (=> b!1310412 (= res!869939 (not (= (select (arr!42263 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1310413 () Bool)

(assert (=> b!1310413 (= e!747555 tp_is_empty!35289)))

(declare-fun b!1310414 () Bool)

(declare-fun e!747554 () Bool)

(assert (=> b!1310414 (= e!747556 (and e!747554 mapRes!54562))))

(declare-fun condMapEmpty!54562 () Bool)

(declare-fun mapDefault!54562 () ValueCell!16746)

(assert (=> b!1310414 (= condMapEmpty!54562 (= (arr!42264 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16746)) mapDefault!54562)))))

(declare-fun b!1310415 () Bool)

(declare-fun res!869938 () Bool)

(assert (=> b!1310415 (=> (not res!869938) (not e!747557))))

(assert (=> b!1310415 (= res!869938 (and (= (size!42814 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42813 _keys!1628) (size!42814 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310416 () Bool)

(declare-fun res!869937 () Bool)

(assert (=> b!1310416 (=> (not res!869937) (not e!747557))))

(assert (=> b!1310416 (= res!869937 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1310417 () Bool)

(assert (=> b!1310417 (= e!747554 tp_is_empty!35289)))

(declare-fun b!1310418 () Bool)

(declare-fun res!869936 () Bool)

(assert (=> b!1310418 (=> (not res!869936) (not e!747557))))

(declare-datatypes ((List!29967 0))(
  ( (Nil!29964) (Cons!29963 (h!31172 (_ BitVec 64)) (t!43573 List!29967)) )
))
(declare-fun arrayNoDuplicates!0 (array!87566 (_ BitVec 32) List!29967) Bool)

(assert (=> b!1310418 (= res!869936 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29964))))

(assert (= (and start!110724 res!869941) b!1310415))

(assert (= (and b!1310415 res!869938) b!1310411))

(assert (= (and b!1310411 res!869942) b!1310418))

(assert (= (and b!1310418 res!869936) b!1310407))

(assert (= (and b!1310407 res!869940) b!1310409))

(assert (= (and b!1310409 res!869935) b!1310412))

(assert (= (and b!1310412 res!869939) b!1310408))

(assert (= (and b!1310408 res!869943) b!1310416))

(assert (= (and b!1310416 res!869937) b!1310410))

(assert (= (and b!1310414 condMapEmpty!54562) mapIsEmpty!54562))

(assert (= (and b!1310414 (not condMapEmpty!54562)) mapNonEmpty!54562))

(get-info :version)

(assert (= (and mapNonEmpty!54562 ((_ is ValueCellFull!16746) mapValue!54562)) b!1310413))

(assert (= (and b!1310414 ((_ is ValueCellFull!16746) mapDefault!54562)) b!1310417))

(assert (= start!110724 b!1310414))

(declare-fun m!1200197 () Bool)

(assert (=> b!1310408 m!1200197))

(assert (=> b!1310408 m!1200197))

(declare-fun m!1200199 () Bool)

(assert (=> b!1310408 m!1200199))

(declare-fun m!1200201 () Bool)

(assert (=> b!1310410 m!1200201))

(assert (=> b!1310410 m!1200201))

(declare-fun m!1200203 () Bool)

(assert (=> b!1310410 m!1200203))

(declare-fun m!1200205 () Bool)

(assert (=> b!1310410 m!1200205))

(declare-fun m!1200207 () Bool)

(assert (=> b!1310411 m!1200207))

(declare-fun m!1200209 () Bool)

(assert (=> b!1310418 m!1200209))

(declare-fun m!1200211 () Bool)

(assert (=> b!1310409 m!1200211))

(assert (=> b!1310409 m!1200211))

(declare-fun m!1200213 () Bool)

(assert (=> b!1310409 m!1200213))

(assert (=> b!1310412 m!1200197))

(declare-fun m!1200215 () Bool)

(assert (=> start!110724 m!1200215))

(declare-fun m!1200217 () Bool)

(assert (=> start!110724 m!1200217))

(declare-fun m!1200219 () Bool)

(assert (=> start!110724 m!1200219))

(declare-fun m!1200221 () Bool)

(assert (=> mapNonEmpty!54562 m!1200221))

(check-sat (not b_next!29559) (not start!110724) (not b!1310411) tp_is_empty!35289 (not b!1310418) b_and!47767 (not b!1310410) (not mapNonEmpty!54562) (not b!1310408) (not b!1310409))
(check-sat b_and!47767 (not b_next!29559))
