; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112118 () Bool)

(assert start!112118)

(declare-fun b_free!30493 () Bool)

(declare-fun b_next!30493 () Bool)

(assert (=> start!112118 (= b_free!30493 (not b_next!30493))))

(declare-fun tp!106958 () Bool)

(declare-fun b_and!49083 () Bool)

(assert (=> start!112118 (= tp!106958 b_and!49083)))

(declare-fun b!1327207 () Bool)

(declare-fun res!880514 () Bool)

(declare-fun e!756640 () Bool)

(assert (=> b!1327207 (=> (not res!880514) (not e!756640))))

(declare-datatypes ((array!89627 0))(
  ( (array!89628 (arr!43282 (Array (_ BitVec 32) (_ BitVec 64))) (size!43833 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89627)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53521 0))(
  ( (V!53522 (val!18231 Int)) )
))
(declare-datatypes ((ValueCell!17258 0))(
  ( (ValueCellFull!17258 (v!20859 V!53521)) (EmptyCell!17258) )
))
(declare-datatypes ((array!89629 0))(
  ( (array!89630 (arr!43283 (Array (_ BitVec 32) ValueCell!17258)) (size!43834 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89629)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1327207 (= res!880514 (and (= (size!43834 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43833 _keys!1609) (size!43834 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56121 () Bool)

(declare-fun mapRes!56121 () Bool)

(assert (=> mapIsEmpty!56121 mapRes!56121))

(declare-fun b!1327208 () Bool)

(declare-fun res!880515 () Bool)

(assert (=> b!1327208 (=> (not res!880515) (not e!756640))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89627 (_ BitVec 32)) Bool)

(assert (=> b!1327208 (= res!880515 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1327210 () Bool)

(declare-fun e!756637 () Bool)

(declare-fun tp_is_empty!36313 () Bool)

(assert (=> b!1327210 (= e!756637 tp_is_empty!36313)))

(declare-fun b!1327211 () Bool)

(declare-fun res!880512 () Bool)

(assert (=> b!1327211 (=> (not res!880512) (not e!756640))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1327211 (= res!880512 (validKeyInArray!0 (select (arr!43282 _keys!1609) from!2000)))))

(declare-fun b!1327212 () Bool)

(declare-fun res!880517 () Bool)

(assert (=> b!1327212 (=> (not res!880517) (not e!756640))))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1327212 (= res!880517 (not (= (select (arr!43282 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapNonEmpty!56121 () Bool)

(declare-fun tp!106959 () Bool)

(assert (=> mapNonEmpty!56121 (= mapRes!56121 (and tp!106959 e!756637))))

(declare-fun mapValue!56121 () ValueCell!17258)

(declare-fun mapRest!56121 () (Array (_ BitVec 32) ValueCell!17258))

(declare-fun mapKey!56121 () (_ BitVec 32))

(assert (=> mapNonEmpty!56121 (= (arr!43283 _values!1337) (store mapRest!56121 mapKey!56121 mapValue!56121))))

(declare-fun b!1327213 () Bool)

(assert (=> b!1327213 (= e!756640 (not true))))

(declare-datatypes ((tuple2!23552 0))(
  ( (tuple2!23553 (_1!11787 (_ BitVec 64)) (_2!11787 V!53521)) )
))
(declare-datatypes ((List!30703 0))(
  ( (Nil!30700) (Cons!30699 (h!31917 tuple2!23552) (t!44659 List!30703)) )
))
(declare-datatypes ((ListLongMap!21217 0))(
  ( (ListLongMap!21218 (toList!10624 List!30703)) )
))
(declare-fun lt!590343 () ListLongMap!21217)

(declare-fun contains!8792 (ListLongMap!21217 (_ BitVec 64)) Bool)

(assert (=> b!1327213 (contains!8792 lt!590343 k0!1164)))

(declare-fun zeroValue!1279 () V!53521)

(declare-datatypes ((Unit!43629 0))(
  ( (Unit!43630) )
))
(declare-fun lt!590345 () Unit!43629)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!218 ((_ BitVec 64) (_ BitVec 64) V!53521 ListLongMap!21217) Unit!43629)

(assert (=> b!1327213 (= lt!590345 (lemmaInListMapAfterAddingDiffThenInBefore!218 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!590343))))

(declare-fun lt!590344 () ListLongMap!21217)

(assert (=> b!1327213 (contains!8792 lt!590344 k0!1164)))

(declare-fun minValue!1279 () V!53521)

(declare-fun lt!590342 () Unit!43629)

(assert (=> b!1327213 (= lt!590342 (lemmaInListMapAfterAddingDiffThenInBefore!218 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!590344))))

(declare-fun +!4668 (ListLongMap!21217 tuple2!23552) ListLongMap!21217)

(assert (=> b!1327213 (= lt!590344 (+!4668 lt!590343 (tuple2!23553 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6312 (array!89627 array!89629 (_ BitVec 32) (_ BitVec 32) V!53521 V!53521 (_ BitVec 32) Int) ListLongMap!21217)

(declare-fun get!21830 (ValueCell!17258 V!53521) V!53521)

(declare-fun dynLambda!3622 (Int (_ BitVec 64)) V!53521)

(assert (=> b!1327213 (= lt!590343 (+!4668 (getCurrentListMapNoExtraKeys!6312 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23553 (select (arr!43282 _keys!1609) from!2000) (get!21830 (select (arr!43283 _values!1337) from!2000) (dynLambda!3622 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!880513 () Bool)

(assert (=> start!112118 (=> (not res!880513) (not e!756640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112118 (= res!880513 (validMask!0 mask!2019))))

(assert (=> start!112118 e!756640))

(declare-fun array_inv!32937 (array!89627) Bool)

(assert (=> start!112118 (array_inv!32937 _keys!1609)))

(assert (=> start!112118 true))

(assert (=> start!112118 tp_is_empty!36313))

(declare-fun e!756638 () Bool)

(declare-fun array_inv!32938 (array!89629) Bool)

(assert (=> start!112118 (and (array_inv!32938 _values!1337) e!756638)))

(assert (=> start!112118 tp!106958))

(declare-fun b!1327209 () Bool)

(declare-fun e!756636 () Bool)

(assert (=> b!1327209 (= e!756638 (and e!756636 mapRes!56121))))

(declare-fun condMapEmpty!56121 () Bool)

(declare-fun mapDefault!56121 () ValueCell!17258)

(assert (=> b!1327209 (= condMapEmpty!56121 (= (arr!43283 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17258)) mapDefault!56121)))))

(declare-fun b!1327214 () Bool)

(declare-fun res!880518 () Bool)

(assert (=> b!1327214 (=> (not res!880518) (not e!756640))))

(declare-fun getCurrentListMap!5603 (array!89627 array!89629 (_ BitVec 32) (_ BitVec 32) V!53521 V!53521 (_ BitVec 32) Int) ListLongMap!21217)

(assert (=> b!1327214 (= res!880518 (contains!8792 (getCurrentListMap!5603 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1327215 () Bool)

(declare-fun res!880516 () Bool)

(assert (=> b!1327215 (=> (not res!880516) (not e!756640))))

(declare-datatypes ((List!30704 0))(
  ( (Nil!30701) (Cons!30700 (h!31918 (_ BitVec 64)) (t!44660 List!30704)) )
))
(declare-fun arrayNoDuplicates!0 (array!89627 (_ BitVec 32) List!30704) Bool)

(assert (=> b!1327215 (= res!880516 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30701))))

(declare-fun b!1327216 () Bool)

(assert (=> b!1327216 (= e!756636 tp_is_empty!36313)))

(declare-fun b!1327217 () Bool)

(declare-fun res!880511 () Bool)

(assert (=> b!1327217 (=> (not res!880511) (not e!756640))))

(assert (=> b!1327217 (= res!880511 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43833 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112118 res!880513) b!1327207))

(assert (= (and b!1327207 res!880514) b!1327208))

(assert (= (and b!1327208 res!880515) b!1327215))

(assert (= (and b!1327215 res!880516) b!1327217))

(assert (= (and b!1327217 res!880511) b!1327214))

(assert (= (and b!1327214 res!880518) b!1327212))

(assert (= (and b!1327212 res!880517) b!1327211))

(assert (= (and b!1327211 res!880512) b!1327213))

(assert (= (and b!1327209 condMapEmpty!56121) mapIsEmpty!56121))

(assert (= (and b!1327209 (not condMapEmpty!56121)) mapNonEmpty!56121))

(get-info :version)

(assert (= (and mapNonEmpty!56121 ((_ is ValueCellFull!17258) mapValue!56121)) b!1327210))

(assert (= (and b!1327209 ((_ is ValueCellFull!17258) mapDefault!56121)) b!1327216))

(assert (= start!112118 b!1327209))

(declare-fun b_lambda!23765 () Bool)

(assert (=> (not b_lambda!23765) (not b!1327213)))

(declare-fun t!44658 () Bool)

(declare-fun tb!11759 () Bool)

(assert (=> (and start!112118 (= defaultEntry!1340 defaultEntry!1340) t!44658) tb!11759))

(declare-fun result!24583 () Bool)

(assert (=> tb!11759 (= result!24583 tp_is_empty!36313)))

(assert (=> b!1327213 t!44658))

(declare-fun b_and!49085 () Bool)

(assert (= b_and!49083 (and (=> t!44658 result!24583) b_and!49085)))

(declare-fun m!1216407 () Bool)

(assert (=> start!112118 m!1216407))

(declare-fun m!1216409 () Bool)

(assert (=> start!112118 m!1216409))

(declare-fun m!1216411 () Bool)

(assert (=> start!112118 m!1216411))

(declare-fun m!1216413 () Bool)

(assert (=> b!1327215 m!1216413))

(declare-fun m!1216415 () Bool)

(assert (=> b!1327213 m!1216415))

(declare-fun m!1216417 () Bool)

(assert (=> b!1327213 m!1216417))

(declare-fun m!1216419 () Bool)

(assert (=> b!1327213 m!1216419))

(declare-fun m!1216421 () Bool)

(assert (=> b!1327213 m!1216421))

(declare-fun m!1216423 () Bool)

(assert (=> b!1327213 m!1216423))

(declare-fun m!1216425 () Bool)

(assert (=> b!1327213 m!1216425))

(declare-fun m!1216427 () Bool)

(assert (=> b!1327213 m!1216427))

(declare-fun m!1216429 () Bool)

(assert (=> b!1327213 m!1216429))

(assert (=> b!1327213 m!1216427))

(assert (=> b!1327213 m!1216419))

(declare-fun m!1216431 () Bool)

(assert (=> b!1327213 m!1216431))

(declare-fun m!1216433 () Bool)

(assert (=> b!1327213 m!1216433))

(assert (=> b!1327213 m!1216421))

(declare-fun m!1216435 () Bool)

(assert (=> b!1327213 m!1216435))

(declare-fun m!1216437 () Bool)

(assert (=> b!1327208 m!1216437))

(assert (=> b!1327211 m!1216433))

(assert (=> b!1327211 m!1216433))

(declare-fun m!1216439 () Bool)

(assert (=> b!1327211 m!1216439))

(declare-fun m!1216441 () Bool)

(assert (=> mapNonEmpty!56121 m!1216441))

(assert (=> b!1327212 m!1216433))

(declare-fun m!1216443 () Bool)

(assert (=> b!1327214 m!1216443))

(assert (=> b!1327214 m!1216443))

(declare-fun m!1216445 () Bool)

(assert (=> b!1327214 m!1216445))

(check-sat (not b!1327211) b_and!49085 (not start!112118) (not b!1327208) (not b!1327214) (not b_lambda!23765) tp_is_empty!36313 (not b!1327213) (not b_next!30493) (not b!1327215) (not mapNonEmpty!56121))
(check-sat b_and!49085 (not b_next!30493))
