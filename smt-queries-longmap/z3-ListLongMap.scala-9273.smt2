; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111210 () Bool)

(assert start!111210)

(declare-fun b_free!29821 () Bool)

(declare-fun b_next!29821 () Bool)

(assert (=> start!111210 (= b_free!29821 (not b_next!29821))))

(declare-fun tp!104784 () Bool)

(declare-fun b_and!48031 () Bool)

(assert (=> start!111210 (= tp!104784 b_and!48031)))

(declare-fun res!872858 () Bool)

(declare-fun e!750363 () Bool)

(assert (=> start!111210 (=> (not res!872858) (not e!750363))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111210 (= res!872858 (validMask!0 mask!2040))))

(assert (=> start!111210 e!750363))

(assert (=> start!111210 tp!104784))

(declare-datatypes ((array!88131 0))(
  ( (array!88132 (arr!42541 (Array (_ BitVec 32) (_ BitVec 64))) (size!43092 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88131)

(declare-fun array_inv!32397 (array!88131) Bool)

(assert (=> start!111210 (array_inv!32397 _keys!1628)))

(assert (=> start!111210 true))

(declare-fun tp_is_empty!35551 () Bool)

(assert (=> start!111210 tp_is_empty!35551))

(declare-datatypes ((V!52505 0))(
  ( (V!52506 (val!17850 Int)) )
))
(declare-datatypes ((ValueCell!16877 0))(
  ( (ValueCellFull!16877 (v!20472 V!52505)) (EmptyCell!16877) )
))
(declare-datatypes ((array!88133 0))(
  ( (array!88134 (arr!42542 (Array (_ BitVec 32) ValueCell!16877)) (size!43093 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88133)

(declare-fun e!750364 () Bool)

(declare-fun array_inv!32398 (array!88133) Bool)

(assert (=> start!111210 (and (array_inv!32398 _values!1354) e!750364)))

(declare-fun b!1315289 () Bool)

(declare-fun e!750361 () Bool)

(declare-fun mapRes!54955 () Bool)

(assert (=> b!1315289 (= e!750364 (and e!750361 mapRes!54955))))

(declare-fun condMapEmpty!54955 () Bool)

(declare-fun mapDefault!54955 () ValueCell!16877)

(assert (=> b!1315289 (= condMapEmpty!54955 (= (arr!42542 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16877)) mapDefault!54955)))))

(declare-fun b!1315290 () Bool)

(declare-fun res!872861 () Bool)

(assert (=> b!1315290 (=> (not res!872861) (not e!750363))))

(declare-datatypes ((List!30194 0))(
  ( (Nil!30191) (Cons!30190 (h!31408 (_ BitVec 64)) (t!43792 List!30194)) )
))
(declare-fun arrayNoDuplicates!0 (array!88131 (_ BitVec 32) List!30194) Bool)

(assert (=> b!1315290 (= res!872861 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30191))))

(declare-fun mapNonEmpty!54955 () Bool)

(declare-fun tp!104785 () Bool)

(declare-fun e!750362 () Bool)

(assert (=> mapNonEmpty!54955 (= mapRes!54955 (and tp!104785 e!750362))))

(declare-fun mapValue!54955 () ValueCell!16877)

(declare-fun mapRest!54955 () (Array (_ BitVec 32) ValueCell!16877))

(declare-fun mapKey!54955 () (_ BitVec 32))

(assert (=> mapNonEmpty!54955 (= (arr!42542 _values!1354) (store mapRest!54955 mapKey!54955 mapValue!54955))))

(declare-fun b!1315291 () Bool)

(declare-fun res!872859 () Bool)

(assert (=> b!1315291 (=> (not res!872859) (not e!750363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88131 (_ BitVec 32)) Bool)

(assert (=> b!1315291 (= res!872859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1315292 () Bool)

(assert (=> b!1315292 (= e!750362 tp_is_empty!35551)))

(declare-fun b!1315293 () Bool)

(assert (=> b!1315293 (= e!750363 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52505)

(declare-fun zeroValue!1296 () V!52505)

(declare-fun lt!586217 () Bool)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23042 0))(
  ( (tuple2!23043 (_1!11532 (_ BitVec 64)) (_2!11532 V!52505)) )
))
(declare-datatypes ((List!30195 0))(
  ( (Nil!30192) (Cons!30191 (h!31409 tuple2!23042) (t!43793 List!30195)) )
))
(declare-datatypes ((ListLongMap!20707 0))(
  ( (ListLongMap!20708 (toList!10369 List!30195)) )
))
(declare-fun contains!8531 (ListLongMap!20707 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5373 (array!88131 array!88133 (_ BitVec 32) (_ BitVec 32) V!52505 V!52505 (_ BitVec 32) Int) ListLongMap!20707)

(assert (=> b!1315293 (= lt!586217 (contains!8531 (getCurrentListMap!5373 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1315294 () Bool)

(declare-fun res!872857 () Bool)

(assert (=> b!1315294 (=> (not res!872857) (not e!750363))))

(assert (=> b!1315294 (= res!872857 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43092 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54955 () Bool)

(assert (=> mapIsEmpty!54955 mapRes!54955))

(declare-fun b!1315295 () Bool)

(assert (=> b!1315295 (= e!750361 tp_is_empty!35551)))

(declare-fun b!1315296 () Bool)

(declare-fun res!872860 () Bool)

(assert (=> b!1315296 (=> (not res!872860) (not e!750363))))

(assert (=> b!1315296 (= res!872860 (and (= (size!43093 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43092 _keys!1628) (size!43093 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(assert (= (and start!111210 res!872858) b!1315296))

(assert (= (and b!1315296 res!872860) b!1315291))

(assert (= (and b!1315291 res!872859) b!1315290))

(assert (= (and b!1315290 res!872861) b!1315294))

(assert (= (and b!1315294 res!872857) b!1315293))

(assert (= (and b!1315289 condMapEmpty!54955) mapIsEmpty!54955))

(assert (= (and b!1315289 (not condMapEmpty!54955)) mapNonEmpty!54955))

(get-info :version)

(assert (= (and mapNonEmpty!54955 ((_ is ValueCellFull!16877) mapValue!54955)) b!1315292))

(assert (= (and b!1315289 ((_ is ValueCellFull!16877) mapDefault!54955)) b!1315295))

(assert (= start!111210 b!1315289))

(declare-fun m!1204253 () Bool)

(assert (=> b!1315290 m!1204253))

(declare-fun m!1204255 () Bool)

(assert (=> mapNonEmpty!54955 m!1204255))

(declare-fun m!1204257 () Bool)

(assert (=> b!1315291 m!1204257))

(declare-fun m!1204259 () Bool)

(assert (=> b!1315293 m!1204259))

(assert (=> b!1315293 m!1204259))

(declare-fun m!1204261 () Bool)

(assert (=> b!1315293 m!1204261))

(declare-fun m!1204263 () Bool)

(assert (=> start!111210 m!1204263))

(declare-fun m!1204265 () Bool)

(assert (=> start!111210 m!1204265))

(declare-fun m!1204267 () Bool)

(assert (=> start!111210 m!1204267))

(check-sat (not b!1315291) (not b!1315293) (not b_next!29821) (not b!1315290) (not start!111210) (not mapNonEmpty!54955) b_and!48031 tp_is_empty!35551)
(check-sat b_and!48031 (not b_next!29821))
