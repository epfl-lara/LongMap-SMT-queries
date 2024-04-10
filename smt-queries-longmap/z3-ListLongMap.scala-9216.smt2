; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110646 () Bool)

(assert start!110646)

(declare-fun b_free!29481 () Bool)

(declare-fun b_next!29481 () Bool)

(assert (=> start!110646 (= b_free!29481 (not b_next!29481))))

(declare-fun tp!103764 () Bool)

(declare-fun b_and!47689 () Bool)

(assert (=> start!110646 (= tp!103764 b_and!47689)))

(declare-fun res!869118 () Bool)

(declare-fun e!746970 () Bool)

(assert (=> start!110646 (=> (not res!869118) (not e!746970))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110646 (= res!869118 (validMask!0 mask!2040))))

(assert (=> start!110646 e!746970))

(assert (=> start!110646 tp!103764))

(declare-datatypes ((array!87414 0))(
  ( (array!87415 (arr!42187 (Array (_ BitVec 32) (_ BitVec 64))) (size!42737 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87414)

(declare-fun array_inv!31883 (array!87414) Bool)

(assert (=> start!110646 (array_inv!31883 _keys!1628)))

(assert (=> start!110646 true))

(declare-fun tp_is_empty!35211 () Bool)

(assert (=> start!110646 tp_is_empty!35211))

(declare-datatypes ((V!52051 0))(
  ( (V!52052 (val!17680 Int)) )
))
(declare-datatypes ((ValueCell!16707 0))(
  ( (ValueCellFull!16707 (v!20307 V!52051)) (EmptyCell!16707) )
))
(declare-datatypes ((array!87416 0))(
  ( (array!87417 (arr!42188 (Array (_ BitVec 32) ValueCell!16707)) (size!42738 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87416)

(declare-fun e!746969 () Bool)

(declare-fun array_inv!31884 (array!87416) Bool)

(assert (=> start!110646 (and (array_inv!31884 _values!1354) e!746969)))

(declare-fun b!1309235 () Bool)

(assert (=> b!1309235 (= e!746970 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52051)

(declare-fun zeroValue!1296 () V!52051)

(declare-fun lt!585240 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22764 0))(
  ( (tuple2!22765 (_1!11393 (_ BitVec 64)) (_2!11393 V!52051)) )
))
(declare-datatypes ((List!29906 0))(
  ( (Nil!29903) (Cons!29902 (h!31111 tuple2!22764) (t!43512 List!29906)) )
))
(declare-datatypes ((ListLongMap!20421 0))(
  ( (ListLongMap!20422 (toList!10226 List!29906)) )
))
(declare-fun contains!8376 (ListLongMap!20421 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5239 (array!87414 array!87416 (_ BitVec 32) (_ BitVec 32) V!52051 V!52051 (_ BitVec 32) Int) ListLongMap!20421)

(assert (=> b!1309235 (= lt!585240 (contains!8376 (getCurrentListMap!5239 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54445 () Bool)

(declare-fun mapRes!54445 () Bool)

(assert (=> mapIsEmpty!54445 mapRes!54445))

(declare-fun b!1309236 () Bool)

(declare-fun e!746971 () Bool)

(assert (=> b!1309236 (= e!746971 tp_is_empty!35211)))

(declare-fun b!1309237 () Bool)

(assert (=> b!1309237 (= e!746969 (and e!746971 mapRes!54445))))

(declare-fun condMapEmpty!54445 () Bool)

(declare-fun mapDefault!54445 () ValueCell!16707)

(assert (=> b!1309237 (= condMapEmpty!54445 (= (arr!42188 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16707)) mapDefault!54445)))))

(declare-fun b!1309238 () Bool)

(declare-fun e!746972 () Bool)

(assert (=> b!1309238 (= e!746972 tp_is_empty!35211)))

(declare-fun b!1309239 () Bool)

(declare-fun res!869114 () Bool)

(assert (=> b!1309239 (=> (not res!869114) (not e!746970))))

(assert (=> b!1309239 (= res!869114 (and (= (size!42738 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42737 _keys!1628) (size!42738 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309240 () Bool)

(declare-fun res!869117 () Bool)

(assert (=> b!1309240 (=> (not res!869117) (not e!746970))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87414 (_ BitVec 32)) Bool)

(assert (=> b!1309240 (= res!869117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309241 () Bool)

(declare-fun res!869115 () Bool)

(assert (=> b!1309241 (=> (not res!869115) (not e!746970))))

(assert (=> b!1309241 (= res!869115 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42737 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1309242 () Bool)

(declare-fun res!869116 () Bool)

(assert (=> b!1309242 (=> (not res!869116) (not e!746970))))

(declare-datatypes ((List!29907 0))(
  ( (Nil!29904) (Cons!29903 (h!31112 (_ BitVec 64)) (t!43513 List!29907)) )
))
(declare-fun arrayNoDuplicates!0 (array!87414 (_ BitVec 32) List!29907) Bool)

(assert (=> b!1309242 (= res!869116 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29904))))

(declare-fun mapNonEmpty!54445 () Bool)

(declare-fun tp!103765 () Bool)

(assert (=> mapNonEmpty!54445 (= mapRes!54445 (and tp!103765 e!746972))))

(declare-fun mapValue!54445 () ValueCell!16707)

(declare-fun mapKey!54445 () (_ BitVec 32))

(declare-fun mapRest!54445 () (Array (_ BitVec 32) ValueCell!16707))

(assert (=> mapNonEmpty!54445 (= (arr!42188 _values!1354) (store mapRest!54445 mapKey!54445 mapValue!54445))))

(assert (= (and start!110646 res!869118) b!1309239))

(assert (= (and b!1309239 res!869114) b!1309240))

(assert (= (and b!1309240 res!869117) b!1309242))

(assert (= (and b!1309242 res!869116) b!1309241))

(assert (= (and b!1309241 res!869115) b!1309235))

(assert (= (and b!1309237 condMapEmpty!54445) mapIsEmpty!54445))

(assert (= (and b!1309237 (not condMapEmpty!54445)) mapNonEmpty!54445))

(get-info :version)

(assert (= (and mapNonEmpty!54445 ((_ is ValueCellFull!16707) mapValue!54445)) b!1309238))

(assert (= (and b!1309237 ((_ is ValueCellFull!16707) mapDefault!54445)) b!1309236))

(assert (= start!110646 b!1309237))

(declare-fun m!1199383 () Bool)

(assert (=> b!1309235 m!1199383))

(assert (=> b!1309235 m!1199383))

(declare-fun m!1199385 () Bool)

(assert (=> b!1309235 m!1199385))

(declare-fun m!1199387 () Bool)

(assert (=> b!1309242 m!1199387))

(declare-fun m!1199389 () Bool)

(assert (=> start!110646 m!1199389))

(declare-fun m!1199391 () Bool)

(assert (=> start!110646 m!1199391))

(declare-fun m!1199393 () Bool)

(assert (=> start!110646 m!1199393))

(declare-fun m!1199395 () Bool)

(assert (=> b!1309240 m!1199395))

(declare-fun m!1199397 () Bool)

(assert (=> mapNonEmpty!54445 m!1199397))

(check-sat (not mapNonEmpty!54445) (not b_next!29481) (not b!1309242) tp_is_empty!35211 b_and!47689 (not b!1309235) (not start!110646) (not b!1309240))
(check-sat b_and!47689 (not b_next!29481))
