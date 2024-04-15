; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111100 () Bool)

(assert start!111100)

(declare-fun b_free!29935 () Bool)

(declare-fun b_next!29935 () Bool)

(assert (=> start!111100 (= b_free!29935 (not b_next!29935))))

(declare-fun tp!105128 () Bool)

(declare-fun b_and!48125 () Bool)

(assert (=> start!111100 (= tp!105128 b_and!48125)))

(declare-fun b!1315360 () Bool)

(declare-fun res!873241 () Bool)

(declare-fun e!750340 () Bool)

(assert (=> b!1315360 (=> (not res!873241) (not e!750340))))

(declare-datatypes ((array!88203 0))(
  ( (array!88204 (arr!42582 (Array (_ BitVec 32) (_ BitVec 64))) (size!43134 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88203)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88203 (_ BitVec 32)) Bool)

(assert (=> b!1315360 (= res!873241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315361 () Bool)

(assert (=> b!1315361 (= e!750340 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((V!52657 0))(
  ( (V!52658 (val!17907 Int)) )
))
(declare-fun minValue!1296 () V!52657)

(declare-datatypes ((ValueCell!16934 0))(
  ( (ValueCellFull!16934 (v!20533 V!52657)) (EmptyCell!16934) )
))
(declare-datatypes ((array!88205 0))(
  ( (array!88206 (arr!42583 (Array (_ BitVec 32) ValueCell!16934)) (size!43135 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88205)

(declare-fun zeroValue!1296 () V!52657)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585726 () Bool)

(declare-datatypes ((tuple2!23188 0))(
  ( (tuple2!23189 (_1!11605 (_ BitVec 64)) (_2!11605 V!52657)) )
))
(declare-datatypes ((List!30303 0))(
  ( (Nil!30300) (Cons!30299 (h!31508 tuple2!23188) (t!43901 List!30303)) )
))
(declare-datatypes ((ListLongMap!20845 0))(
  ( (ListLongMap!20846 (toList!10438 List!30303)) )
))
(declare-fun contains!8515 (ListLongMap!20845 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5333 (array!88203 array!88205 (_ BitVec 32) (_ BitVec 32) V!52657 V!52657 (_ BitVec 32) Int) ListLongMap!20845)

(assert (=> b!1315361 (= lt!585726 (contains!8515 (getCurrentListMap!5333 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315362 () Bool)

(declare-fun res!873238 () Bool)

(assert (=> b!1315362 (=> (not res!873238) (not e!750340))))

(assert (=> b!1315362 (= res!873238 (and (= (size!43135 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43134 _keys!1628) (size!43135 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1315363 () Bool)

(declare-fun res!873240 () Bool)

(assert (=> b!1315363 (=> (not res!873240) (not e!750340))))

(declare-datatypes ((List!30304 0))(
  ( (Nil!30301) (Cons!30300 (h!31509 (_ BitVec 64)) (t!43902 List!30304)) )
))
(declare-fun arrayNoDuplicates!0 (array!88203 (_ BitVec 32) List!30304) Bool)

(assert (=> b!1315363 (= res!873240 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30301))))

(declare-fun mapIsEmpty!55126 () Bool)

(declare-fun mapRes!55126 () Bool)

(assert (=> mapIsEmpty!55126 mapRes!55126))

(declare-fun b!1315364 () Bool)

(declare-fun res!873237 () Bool)

(assert (=> b!1315364 (=> (not res!873237) (not e!750340))))

(assert (=> b!1315364 (= res!873237 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43134 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1315365 () Bool)

(declare-fun e!750341 () Bool)

(declare-fun tp_is_empty!35665 () Bool)

(assert (=> b!1315365 (= e!750341 tp_is_empty!35665)))

(declare-fun res!873239 () Bool)

(assert (=> start!111100 (=> (not res!873239) (not e!750340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111100 (= res!873239 (validMask!0 mask!2040))))

(assert (=> start!111100 e!750340))

(assert (=> start!111100 tp!105128))

(declare-fun array_inv!32347 (array!88203) Bool)

(assert (=> start!111100 (array_inv!32347 _keys!1628)))

(assert (=> start!111100 true))

(assert (=> start!111100 tp_is_empty!35665))

(declare-fun e!750344 () Bool)

(declare-fun array_inv!32348 (array!88205) Bool)

(assert (=> start!111100 (and (array_inv!32348 _values!1354) e!750344)))

(declare-fun mapNonEmpty!55126 () Bool)

(declare-fun tp!105127 () Bool)

(declare-fun e!750342 () Bool)

(assert (=> mapNonEmpty!55126 (= mapRes!55126 (and tp!105127 e!750342))))

(declare-fun mapRest!55126 () (Array (_ BitVec 32) ValueCell!16934))

(declare-fun mapKey!55126 () (_ BitVec 32))

(declare-fun mapValue!55126 () ValueCell!16934)

(assert (=> mapNonEmpty!55126 (= (arr!42583 _values!1354) (store mapRest!55126 mapKey!55126 mapValue!55126))))

(declare-fun b!1315366 () Bool)

(assert (=> b!1315366 (= e!750344 (and e!750341 mapRes!55126))))

(declare-fun condMapEmpty!55126 () Bool)

(declare-fun mapDefault!55126 () ValueCell!16934)

(assert (=> b!1315366 (= condMapEmpty!55126 (= (arr!42583 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16934)) mapDefault!55126)))))

(declare-fun b!1315367 () Bool)

(assert (=> b!1315367 (= e!750342 tp_is_empty!35665)))

(assert (= (and start!111100 res!873239) b!1315362))

(assert (= (and b!1315362 res!873238) b!1315360))

(assert (= (and b!1315360 res!873241) b!1315363))

(assert (= (and b!1315363 res!873240) b!1315364))

(assert (= (and b!1315364 res!873237) b!1315361))

(assert (= (and b!1315366 condMapEmpty!55126) mapIsEmpty!55126))

(assert (= (and b!1315366 (not condMapEmpty!55126)) mapNonEmpty!55126))

(get-info :version)

(assert (= (and mapNonEmpty!55126 ((_ is ValueCellFull!16934) mapValue!55126)) b!1315367))

(assert (= (and b!1315366 ((_ is ValueCellFull!16934) mapDefault!55126)) b!1315365))

(assert (= start!111100 b!1315366))

(declare-fun m!1203111 () Bool)

(assert (=> start!111100 m!1203111))

(declare-fun m!1203113 () Bool)

(assert (=> start!111100 m!1203113))

(declare-fun m!1203115 () Bool)

(assert (=> start!111100 m!1203115))

(declare-fun m!1203117 () Bool)

(assert (=> b!1315360 m!1203117))

(declare-fun m!1203119 () Bool)

(assert (=> b!1315363 m!1203119))

(declare-fun m!1203121 () Bool)

(assert (=> mapNonEmpty!55126 m!1203121))

(declare-fun m!1203123 () Bool)

(assert (=> b!1315361 m!1203123))

(assert (=> b!1315361 m!1203123))

(declare-fun m!1203125 () Bool)

(assert (=> b!1315361 m!1203125))

(check-sat b_and!48125 (not b!1315363) (not b!1315360) tp_is_empty!35665 (not mapNonEmpty!55126) (not b!1315361) (not start!111100) (not b_next!29935))
(check-sat b_and!48125 (not b_next!29935))
