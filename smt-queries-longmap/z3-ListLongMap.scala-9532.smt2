; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113278 () Bool)

(assert start!113278)

(declare-fun b_free!31105 () Bool)

(declare-fun b_next!31105 () Bool)

(assert (=> start!113278 (= b_free!31105 (not b_next!31105))))

(declare-fun tp!109119 () Bool)

(declare-fun b_and!50137 () Bool)

(assert (=> start!113278 (= tp!109119 b_and!50137)))

(declare-fun mapNonEmpty!57364 () Bool)

(declare-fun mapRes!57364 () Bool)

(declare-fun tp!109120 () Bool)

(declare-fun e!764109 () Bool)

(assert (=> mapNonEmpty!57364 (= mapRes!57364 (and tp!109120 e!764109))))

(declare-datatypes ((V!54577 0))(
  ( (V!54578 (val!18627 Int)) )
))
(declare-datatypes ((ValueCell!17654 0))(
  ( (ValueCellFull!17654 (v!21270 V!54577)) (EmptyCell!17654) )
))
(declare-fun mapRest!57364 () (Array (_ BitVec 32) ValueCell!17654))

(declare-fun mapValue!57364 () ValueCell!17654)

(declare-fun mapKey!57364 () (_ BitVec 32))

(declare-datatypes ((array!91187 0))(
  ( (array!91188 (arr!44045 (Array (_ BitVec 32) ValueCell!17654)) (size!44596 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91187)

(assert (=> mapNonEmpty!57364 (= (arr!44045 _values!1303) (store mapRest!57364 mapKey!57364 mapValue!57364))))

(declare-fun b!1341279 () Bool)

(declare-fun e!764107 () Bool)

(assert (=> b!1341279 (= e!764107 false)))

(declare-fun minValue!1245 () V!54577)

(declare-fun lt!594428 () Bool)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91189 0))(
  ( (array!91190 (arr!44046 (Array (_ BitVec 32) (_ BitVec 64))) (size!44597 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91189)

(declare-fun zeroValue!1245 () V!54577)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24032 0))(
  ( (tuple2!24033 (_1!12027 (_ BitVec 64)) (_2!12027 V!54577)) )
))
(declare-datatypes ((List!31188 0))(
  ( (Nil!31185) (Cons!31184 (h!32402 tuple2!24032) (t!45512 List!31188)) )
))
(declare-datatypes ((ListLongMap!21697 0))(
  ( (ListLongMap!21698 (toList!10864 List!31188)) )
))
(declare-fun contains!9052 (ListLongMap!21697 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5817 (array!91189 array!91187 (_ BitVec 32) (_ BitVec 32) V!54577 V!54577 (_ BitVec 32) Int) ListLongMap!21697)

(assert (=> b!1341279 (= lt!594428 (contains!9052 (getCurrentListMap!5817 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341280 () Bool)

(declare-fun res!889406 () Bool)

(assert (=> b!1341280 (=> (not res!889406) (not e!764107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91189 (_ BitVec 32)) Bool)

(assert (=> b!1341280 (= res!889406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57364 () Bool)

(assert (=> mapIsEmpty!57364 mapRes!57364))

(declare-fun b!1341281 () Bool)

(declare-fun res!889409 () Bool)

(assert (=> b!1341281 (=> (not res!889409) (not e!764107))))

(assert (=> b!1341281 (= res!889409 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44597 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341282 () Bool)

(declare-fun tp_is_empty!37105 () Bool)

(assert (=> b!1341282 (= e!764109 tp_is_empty!37105)))

(declare-fun res!889407 () Bool)

(assert (=> start!113278 (=> (not res!889407) (not e!764107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113278 (= res!889407 (validMask!0 mask!1977))))

(assert (=> start!113278 e!764107))

(assert (=> start!113278 tp_is_empty!37105))

(assert (=> start!113278 true))

(declare-fun array_inv!33473 (array!91189) Bool)

(assert (=> start!113278 (array_inv!33473 _keys!1571)))

(declare-fun e!764108 () Bool)

(declare-fun array_inv!33474 (array!91187) Bool)

(assert (=> start!113278 (and (array_inv!33474 _values!1303) e!764108)))

(assert (=> start!113278 tp!109119))

(declare-fun b!1341283 () Bool)

(declare-fun res!889408 () Bool)

(assert (=> b!1341283 (=> (not res!889408) (not e!764107))))

(assert (=> b!1341283 (= res!889408 (and (= (size!44596 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44597 _keys!1571) (size!44596 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341284 () Bool)

(declare-fun res!889405 () Bool)

(assert (=> b!1341284 (=> (not res!889405) (not e!764107))))

(declare-datatypes ((List!31189 0))(
  ( (Nil!31186) (Cons!31185 (h!32403 (_ BitVec 64)) (t!45513 List!31189)) )
))
(declare-fun arrayNoDuplicates!0 (array!91189 (_ BitVec 32) List!31189) Bool)

(assert (=> b!1341284 (= res!889405 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31186))))

(declare-fun b!1341285 () Bool)

(declare-fun e!764111 () Bool)

(assert (=> b!1341285 (= e!764111 tp_is_empty!37105)))

(declare-fun b!1341286 () Bool)

(assert (=> b!1341286 (= e!764108 (and e!764111 mapRes!57364))))

(declare-fun condMapEmpty!57364 () Bool)

(declare-fun mapDefault!57364 () ValueCell!17654)

(assert (=> b!1341286 (= condMapEmpty!57364 (= (arr!44045 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17654)) mapDefault!57364)))))

(assert (= (and start!113278 res!889407) b!1341283))

(assert (= (and b!1341283 res!889408) b!1341280))

(assert (= (and b!1341280 res!889406) b!1341284))

(assert (= (and b!1341284 res!889405) b!1341281))

(assert (= (and b!1341281 res!889409) b!1341279))

(assert (= (and b!1341286 condMapEmpty!57364) mapIsEmpty!57364))

(assert (= (and b!1341286 (not condMapEmpty!57364)) mapNonEmpty!57364))

(get-info :version)

(assert (= (and mapNonEmpty!57364 ((_ is ValueCellFull!17654) mapValue!57364)) b!1341282))

(assert (= (and b!1341286 ((_ is ValueCellFull!17654) mapDefault!57364)) b!1341285))

(assert (= start!113278 b!1341286))

(declare-fun m!1229451 () Bool)

(assert (=> b!1341284 m!1229451))

(declare-fun m!1229453 () Bool)

(assert (=> start!113278 m!1229453))

(declare-fun m!1229455 () Bool)

(assert (=> start!113278 m!1229455))

(declare-fun m!1229457 () Bool)

(assert (=> start!113278 m!1229457))

(declare-fun m!1229459 () Bool)

(assert (=> b!1341280 m!1229459))

(declare-fun m!1229461 () Bool)

(assert (=> mapNonEmpty!57364 m!1229461))

(declare-fun m!1229463 () Bool)

(assert (=> b!1341279 m!1229463))

(assert (=> b!1341279 m!1229463))

(declare-fun m!1229465 () Bool)

(assert (=> b!1341279 m!1229465))

(check-sat (not b_next!31105) (not start!113278) (not mapNonEmpty!57364) (not b!1341280) b_and!50137 tp_is_empty!37105 (not b!1341284) (not b!1341279))
(check-sat b_and!50137 (not b_next!31105))
