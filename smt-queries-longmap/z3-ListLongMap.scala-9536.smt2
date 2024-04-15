; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113078 () Bool)

(assert start!113078)

(declare-fun b_free!31129 () Bool)

(declare-fun b_next!31129 () Bool)

(assert (=> start!113078 (= b_free!31129 (not b_next!31129))))

(declare-fun tp!109192 () Bool)

(declare-fun b_and!50147 () Bool)

(assert (=> start!113078 (= tp!109192 b_and!50147)))

(declare-fun b!1340275 () Bool)

(declare-fun res!889110 () Bool)

(declare-fun e!763412 () Bool)

(assert (=> b!1340275 (=> (not res!889110) (not e!763412))))

(declare-datatypes ((array!91053 0))(
  ( (array!91054 (arr!43983 (Array (_ BitVec 32) (_ BitVec 64))) (size!44535 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91053)

(declare-datatypes ((List!31199 0))(
  ( (Nil!31196) (Cons!31195 (h!32404 (_ BitVec 64)) (t!45531 List!31199)) )
))
(declare-fun arrayNoDuplicates!0 (array!91053 (_ BitVec 32) List!31199) Bool)

(assert (=> b!1340275 (= res!889110 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31196))))

(declare-fun mapIsEmpty!57400 () Bool)

(declare-fun mapRes!57400 () Bool)

(assert (=> mapIsEmpty!57400 mapRes!57400))

(declare-fun b!1340276 () Bool)

(declare-fun res!889115 () Bool)

(assert (=> b!1340276 (=> (not res!889115) (not e!763412))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54609 0))(
  ( (V!54610 (val!18639 Int)) )
))
(declare-datatypes ((ValueCell!17666 0))(
  ( (ValueCellFull!17666 (v!21286 V!54609)) (EmptyCell!17666) )
))
(declare-datatypes ((array!91055 0))(
  ( (array!91056 (arr!43984 (Array (_ BitVec 32) ValueCell!17666)) (size!44536 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91055)

(assert (=> b!1340276 (= res!889115 (and (= (size!44536 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44535 _keys!1571) (size!44536 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1340277 () Bool)

(declare-fun e!763415 () Bool)

(declare-fun tp_is_empty!37129 () Bool)

(assert (=> b!1340277 (= e!763415 tp_is_empty!37129)))

(declare-fun b!1340278 () Bool)

(declare-fun e!763413 () Bool)

(assert (=> b!1340278 (= e!763413 (and e!763415 mapRes!57400))))

(declare-fun condMapEmpty!57400 () Bool)

(declare-fun mapDefault!57400 () ValueCell!17666)

(assert (=> b!1340278 (= condMapEmpty!57400 (= (arr!43984 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17666)) mapDefault!57400)))))

(declare-fun b!1340279 () Bool)

(declare-fun res!889112 () Bool)

(assert (=> b!1340279 (=> (not res!889112) (not e!763412))))

(assert (=> b!1340279 (= res!889112 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!889109 () Bool)

(assert (=> start!113078 (=> (not res!889109) (not e!763412))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113078 (= res!889109 (validMask!0 mask!1977))))

(assert (=> start!113078 e!763412))

(assert (=> start!113078 tp_is_empty!37129))

(assert (=> start!113078 true))

(declare-fun array_inv!33355 (array!91053) Bool)

(assert (=> start!113078 (array_inv!33355 _keys!1571)))

(declare-fun array_inv!33356 (array!91055) Bool)

(assert (=> start!113078 (and (array_inv!33356 _values!1303) e!763413)))

(assert (=> start!113078 tp!109192))

(declare-fun b!1340280 () Bool)

(declare-fun res!889113 () Bool)

(assert (=> b!1340280 (=> (not res!889113) (not e!763412))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1340280 (= res!889113 (not (= (select (arr!43983 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1340281 () Bool)

(assert (=> b!1340281 (= e!763412 false)))

(declare-fun minValue!1245 () V!54609)

(declare-fun zeroValue!1245 () V!54609)

(declare-fun defaultEntry!1306 () Int)

(declare-fun lt!593793 () Bool)

(declare-datatypes ((tuple2!24048 0))(
  ( (tuple2!24049 (_1!12035 (_ BitVec 64)) (_2!12035 V!54609)) )
))
(declare-datatypes ((List!31200 0))(
  ( (Nil!31197) (Cons!31196 (h!32405 tuple2!24048) (t!45532 List!31200)) )
))
(declare-datatypes ((ListLongMap!21705 0))(
  ( (ListLongMap!21706 (toList!10868 List!31200)) )
))
(declare-fun contains!8973 (ListLongMap!21705 (_ BitVec 64)) Bool)

(declare-fun +!4776 (ListLongMap!21705 tuple2!24048) ListLongMap!21705)

(declare-fun getCurrentListMapNoExtraKeys!6419 (array!91053 array!91055 (_ BitVec 32) (_ BitVec 32) V!54609 V!54609 (_ BitVec 32) Int) ListLongMap!21705)

(declare-fun get!22192 (ValueCell!17666 V!54609) V!54609)

(declare-fun dynLambda!3706 (Int (_ BitVec 64)) V!54609)

(assert (=> b!1340281 (= lt!593793 (contains!8973 (+!4776 (+!4776 (getCurrentListMapNoExtraKeys!6419 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24049 (select (arr!43983 _keys!1571) from!1960) (get!22192 (select (arr!43984 _values!1303) from!1960) (dynLambda!3706 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!24049 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142))))

(declare-fun b!1340282 () Bool)

(declare-fun res!889117 () Bool)

(assert (=> b!1340282 (=> (not res!889117) (not e!763412))))

(declare-fun getCurrentListMap!5721 (array!91053 array!91055 (_ BitVec 32) (_ BitVec 32) V!54609 V!54609 (_ BitVec 32) Int) ListLongMap!21705)

(assert (=> b!1340282 (= res!889117 (contains!8973 (getCurrentListMap!5721 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1340283 () Bool)

(declare-fun e!763414 () Bool)

(assert (=> b!1340283 (= e!763414 tp_is_empty!37129)))

(declare-fun b!1340284 () Bool)

(declare-fun res!889111 () Bool)

(assert (=> b!1340284 (=> (not res!889111) (not e!763412))))

(assert (=> b!1340284 (= res!889111 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44535 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340285 () Bool)

(declare-fun res!889116 () Bool)

(assert (=> b!1340285 (=> (not res!889116) (not e!763412))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340285 (= res!889116 (validKeyInArray!0 (select (arr!43983 _keys!1571) from!1960)))))

(declare-fun b!1340286 () Bool)

(declare-fun res!889114 () Bool)

(assert (=> b!1340286 (=> (not res!889114) (not e!763412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91053 (_ BitVec 32)) Bool)

(assert (=> b!1340286 (= res!889114 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57400 () Bool)

(declare-fun tp!109193 () Bool)

(assert (=> mapNonEmpty!57400 (= mapRes!57400 (and tp!109193 e!763414))))

(declare-fun mapKey!57400 () (_ BitVec 32))

(declare-fun mapValue!57400 () ValueCell!17666)

(declare-fun mapRest!57400 () (Array (_ BitVec 32) ValueCell!17666))

(assert (=> mapNonEmpty!57400 (= (arr!43984 _values!1303) (store mapRest!57400 mapKey!57400 mapValue!57400))))

(assert (= (and start!113078 res!889109) b!1340276))

(assert (= (and b!1340276 res!889115) b!1340286))

(assert (= (and b!1340286 res!889114) b!1340275))

(assert (= (and b!1340275 res!889110) b!1340284))

(assert (= (and b!1340284 res!889111) b!1340282))

(assert (= (and b!1340282 res!889117) b!1340280))

(assert (= (and b!1340280 res!889113) b!1340285))

(assert (= (and b!1340285 res!889116) b!1340279))

(assert (= (and b!1340279 res!889112) b!1340281))

(assert (= (and b!1340278 condMapEmpty!57400) mapIsEmpty!57400))

(assert (= (and b!1340278 (not condMapEmpty!57400)) mapNonEmpty!57400))

(get-info :version)

(assert (= (and mapNonEmpty!57400 ((_ is ValueCellFull!17666) mapValue!57400)) b!1340283))

(assert (= (and b!1340278 ((_ is ValueCellFull!17666) mapDefault!57400)) b!1340277))

(assert (= start!113078 b!1340278))

(declare-fun b_lambda!24295 () Bool)

(assert (=> (not b_lambda!24295) (not b!1340281)))

(declare-fun t!45530 () Bool)

(declare-fun tb!12135 () Bool)

(assert (=> (and start!113078 (= defaultEntry!1306 defaultEntry!1306) t!45530) tb!12135))

(declare-fun result!25369 () Bool)

(assert (=> tb!12135 (= result!25369 tp_is_empty!37129)))

(assert (=> b!1340281 t!45530))

(declare-fun b_and!50149 () Bool)

(assert (= b_and!50147 (and (=> t!45530 result!25369) b_and!50149)))

(declare-fun m!1227595 () Bool)

(assert (=> b!1340281 m!1227595))

(declare-fun m!1227597 () Bool)

(assert (=> b!1340281 m!1227597))

(declare-fun m!1227599 () Bool)

(assert (=> b!1340281 m!1227599))

(declare-fun m!1227601 () Bool)

(assert (=> b!1340281 m!1227601))

(declare-fun m!1227603 () Bool)

(assert (=> b!1340281 m!1227603))

(declare-fun m!1227605 () Bool)

(assert (=> b!1340281 m!1227605))

(assert (=> b!1340281 m!1227599))

(declare-fun m!1227607 () Bool)

(assert (=> b!1340281 m!1227607))

(assert (=> b!1340281 m!1227601))

(assert (=> b!1340281 m!1227603))

(declare-fun m!1227609 () Bool)

(assert (=> b!1340281 m!1227609))

(assert (=> b!1340281 m!1227607))

(assert (=> b!1340281 m!1227595))

(declare-fun m!1227611 () Bool)

(assert (=> start!113078 m!1227611))

(declare-fun m!1227613 () Bool)

(assert (=> start!113078 m!1227613))

(declare-fun m!1227615 () Bool)

(assert (=> start!113078 m!1227615))

(assert (=> b!1340285 m!1227609))

(assert (=> b!1340285 m!1227609))

(declare-fun m!1227617 () Bool)

(assert (=> b!1340285 m!1227617))

(declare-fun m!1227619 () Bool)

(assert (=> mapNonEmpty!57400 m!1227619))

(declare-fun m!1227621 () Bool)

(assert (=> b!1340275 m!1227621))

(assert (=> b!1340280 m!1227609))

(declare-fun m!1227623 () Bool)

(assert (=> b!1340286 m!1227623))

(declare-fun m!1227625 () Bool)

(assert (=> b!1340282 m!1227625))

(assert (=> b!1340282 m!1227625))

(declare-fun m!1227627 () Bool)

(assert (=> b!1340282 m!1227627))

(check-sat (not b!1340282) (not start!113078) (not b_lambda!24295) (not b!1340281) b_and!50149 (not mapNonEmpty!57400) (not b!1340285) (not b!1340275) tp_is_empty!37129 (not b!1340286) (not b_next!31129))
(check-sat b_and!50149 (not b_next!31129))
