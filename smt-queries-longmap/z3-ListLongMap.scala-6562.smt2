; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83238 () Bool)

(assert start!83238)

(declare-fun b_free!19249 () Bool)

(declare-fun b_next!19249 () Bool)

(assert (=> start!83238 (= b_free!19249 (not b_next!19249))))

(declare-fun tp!67027 () Bool)

(declare-fun b_and!30711 () Bool)

(assert (=> start!83238 (= tp!67027 b_and!30711)))

(declare-fun b!971300 () Bool)

(declare-fun res!650178 () Bool)

(declare-fun e!547519 () Bool)

(assert (=> b!971300 (=> (not res!650178) (not e!547519))))

(declare-datatypes ((array!60278 0))(
  ( (array!60279 (arr!29003 (Array (_ BitVec 32) (_ BitVec 64))) (size!29484 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60278)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!971300 (= res!650178 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29484 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29484 _keys!1717))))))

(declare-fun b!971301 () Bool)

(declare-fun res!650180 () Bool)

(assert (=> b!971301 (=> (not res!650180) (not e!547519))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34513 0))(
  ( (V!34514 (val!11124 Int)) )
))
(declare-datatypes ((ValueCell!10592 0))(
  ( (ValueCellFull!10592 (v!13682 V!34513)) (EmptyCell!10592) )
))
(declare-datatypes ((array!60280 0))(
  ( (array!60281 (arr!29004 (Array (_ BitVec 32) ValueCell!10592)) (size!29485 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60280)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!971301 (= res!650180 (and (= (size!29485 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29484 _keys!1717) (size!29485 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!971302 () Bool)

(declare-fun res!650179 () Bool)

(assert (=> b!971302 (=> (not res!650179) (not e!547519))))

(declare-fun zeroValue!1367 () V!34513)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34513)

(declare-datatypes ((tuple2!14348 0))(
  ( (tuple2!14349 (_1!7185 (_ BitVec 64)) (_2!7185 V!34513)) )
))
(declare-datatypes ((List!20162 0))(
  ( (Nil!20159) (Cons!20158 (h!21320 tuple2!14348) (t!28516 List!20162)) )
))
(declare-datatypes ((ListLongMap!13035 0))(
  ( (ListLongMap!13036 (toList!6533 List!20162)) )
))
(declare-fun contains!5576 (ListLongMap!13035 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3695 (array!60278 array!60280 (_ BitVec 32) (_ BitVec 32) V!34513 V!34513 (_ BitVec 32) Int) ListLongMap!13035)

(assert (=> b!971302 (= res!650179 (contains!5576 (getCurrentListMap!3695 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29003 _keys!1717) i!822)))))

(declare-fun b!971303 () Bool)

(declare-fun e!547521 () Bool)

(declare-fun e!547517 () Bool)

(declare-fun mapRes!35230 () Bool)

(assert (=> b!971303 (= e!547521 (and e!547517 mapRes!35230))))

(declare-fun condMapEmpty!35230 () Bool)

(declare-fun mapDefault!35230 () ValueCell!10592)

(assert (=> b!971303 (= condMapEmpty!35230 (= (arr!29004 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10592)) mapDefault!35230)))))

(declare-fun b!971304 () Bool)

(declare-fun e!547520 () Bool)

(declare-fun tp_is_empty!22147 () Bool)

(assert (=> b!971304 (= e!547520 tp_is_empty!22147)))

(declare-fun res!650181 () Bool)

(assert (=> start!83238 (=> (not res!650181) (not e!547519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83238 (= res!650181 (validMask!0 mask!2147))))

(assert (=> start!83238 e!547519))

(assert (=> start!83238 true))

(declare-fun array_inv!22505 (array!60280) Bool)

(assert (=> start!83238 (and (array_inv!22505 _values!1425) e!547521)))

(assert (=> start!83238 tp_is_empty!22147))

(assert (=> start!83238 tp!67027))

(declare-fun array_inv!22506 (array!60278) Bool)

(assert (=> start!83238 (array_inv!22506 _keys!1717)))

(declare-fun mapIsEmpty!35230 () Bool)

(assert (=> mapIsEmpty!35230 mapRes!35230))

(declare-fun b!971305 () Bool)

(declare-fun res!650176 () Bool)

(assert (=> b!971305 (=> (not res!650176) (not e!547519))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60278 (_ BitVec 32)) Bool)

(assert (=> b!971305 (= res!650176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971306 () Bool)

(assert (=> b!971306 (= e!547517 tp_is_empty!22147)))

(declare-fun b!971307 () Bool)

(declare-fun res!650177 () Bool)

(assert (=> b!971307 (=> (not res!650177) (not e!547519))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971307 (= res!650177 (validKeyInArray!0 (select (arr!29003 _keys!1717) i!822)))))

(declare-fun b!971308 () Bool)

(assert (=> b!971308 (= e!547519 false)))

(declare-fun lt!431607 () ListLongMap!13035)

(assert (=> b!971308 (= lt!431607 (getCurrentListMap!3695 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun mapNonEmpty!35230 () Bool)

(declare-fun tp!67026 () Bool)

(assert (=> mapNonEmpty!35230 (= mapRes!35230 (and tp!67026 e!547520))))

(declare-fun mapKey!35230 () (_ BitVec 32))

(declare-fun mapRest!35230 () (Array (_ BitVec 32) ValueCell!10592))

(declare-fun mapValue!35230 () ValueCell!10592)

(assert (=> mapNonEmpty!35230 (= (arr!29004 _values!1425) (store mapRest!35230 mapKey!35230 mapValue!35230))))

(declare-fun b!971309 () Bool)

(declare-fun res!650182 () Bool)

(assert (=> b!971309 (=> (not res!650182) (not e!547519))))

(declare-datatypes ((List!20163 0))(
  ( (Nil!20160) (Cons!20159 (h!21321 (_ BitVec 64)) (t!28517 List!20163)) )
))
(declare-fun arrayNoDuplicates!0 (array!60278 (_ BitVec 32) List!20163) Bool)

(assert (=> b!971309 (= res!650182 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20160))))

(assert (= (and start!83238 res!650181) b!971301))

(assert (= (and b!971301 res!650180) b!971305))

(assert (= (and b!971305 res!650176) b!971309))

(assert (= (and b!971309 res!650182) b!971300))

(assert (= (and b!971300 res!650178) b!971307))

(assert (= (and b!971307 res!650177) b!971302))

(assert (= (and b!971302 res!650179) b!971308))

(assert (= (and b!971303 condMapEmpty!35230) mapIsEmpty!35230))

(assert (= (and b!971303 (not condMapEmpty!35230)) mapNonEmpty!35230))

(get-info :version)

(assert (= (and mapNonEmpty!35230 ((_ is ValueCellFull!10592) mapValue!35230)) b!971304))

(assert (= (and b!971303 ((_ is ValueCellFull!10592) mapDefault!35230)) b!971306))

(assert (= start!83238 b!971303))

(declare-fun m!898211 () Bool)

(assert (=> b!971302 m!898211))

(declare-fun m!898213 () Bool)

(assert (=> b!971302 m!898213))

(assert (=> b!971302 m!898211))

(assert (=> b!971302 m!898213))

(declare-fun m!898215 () Bool)

(assert (=> b!971302 m!898215))

(declare-fun m!898217 () Bool)

(assert (=> b!971309 m!898217))

(declare-fun m!898219 () Bool)

(assert (=> start!83238 m!898219))

(declare-fun m!898221 () Bool)

(assert (=> start!83238 m!898221))

(declare-fun m!898223 () Bool)

(assert (=> start!83238 m!898223))

(declare-fun m!898225 () Bool)

(assert (=> b!971308 m!898225))

(declare-fun m!898227 () Bool)

(assert (=> mapNonEmpty!35230 m!898227))

(declare-fun m!898229 () Bool)

(assert (=> b!971305 m!898229))

(assert (=> b!971307 m!898213))

(assert (=> b!971307 m!898213))

(declare-fun m!898231 () Bool)

(assert (=> b!971307 m!898231))

(check-sat (not b!971307) tp_is_empty!22147 (not start!83238) (not b!971302) (not b!971308) b_and!30711 (not b_next!19249) (not b!971309) (not mapNonEmpty!35230) (not b!971305))
(check-sat b_and!30711 (not b_next!19249))
