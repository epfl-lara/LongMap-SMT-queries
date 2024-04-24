; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111718 () Bool)

(assert start!111718)

(declare-fun b_free!30151 () Bool)

(declare-fun b_next!30151 () Bool)

(assert (=> start!111718 (= b_free!30151 (not b_next!30151))))

(declare-fun tp!105928 () Bool)

(declare-fun b_and!48463 () Bool)

(assert (=> start!111718 (= tp!105928 b_and!48463)))

(declare-fun b!1321159 () Bool)

(declare-fun res!876507 () Bool)

(declare-fun e!753814 () Bool)

(assert (=> b!1321159 (=> (not res!876507) (not e!753814))))

(declare-datatypes ((array!88951 0))(
  ( (array!88952 (arr!42945 (Array (_ BitVec 32) (_ BitVec 64))) (size!43496 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88951)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!53065 0))(
  ( (V!53066 (val!18060 Int)) )
))
(declare-fun zeroValue!1279 () V!53065)

(declare-datatypes ((ValueCell!17087 0))(
  ( (ValueCellFull!17087 (v!20685 V!53065)) (EmptyCell!17087) )
))
(declare-datatypes ((array!88953 0))(
  ( (array!88954 (arr!42946 (Array (_ BitVec 32) ValueCell!17087)) (size!43497 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88953)

(declare-fun minValue!1279 () V!53065)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23284 0))(
  ( (tuple2!23285 (_1!11653 (_ BitVec 64)) (_2!11653 V!53065)) )
))
(declare-datatypes ((List!30440 0))(
  ( (Nil!30437) (Cons!30436 (h!31654 tuple2!23284) (t!44132 List!30440)) )
))
(declare-datatypes ((ListLongMap!20949 0))(
  ( (ListLongMap!20950 (toList!10490 List!30440)) )
))
(declare-fun contains!8657 (ListLongMap!20949 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5486 (array!88951 array!88953 (_ BitVec 32) (_ BitVec 32) V!53065 V!53065 (_ BitVec 32) Int) ListLongMap!20949)

(assert (=> b!1321159 (= res!876507 (contains!8657 (getCurrentListMap!5486 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321160 () Bool)

(assert (=> b!1321160 (= e!753814 (not true))))

(declare-fun lt!587228 () ListLongMap!20949)

(assert (=> b!1321160 (contains!8657 lt!587228 k0!1164)))

(declare-datatypes ((Unit!43441 0))(
  ( (Unit!43442) )
))
(declare-fun lt!587230 () Unit!43441)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!132 ((_ BitVec 64) (_ BitVec 64) V!53065 ListLongMap!20949) Unit!43441)

(assert (=> b!1321160 (= lt!587230 (lemmaInListMapAfterAddingDiffThenInBefore!132 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587228))))

(declare-fun lt!587231 () ListLongMap!20949)

(assert (=> b!1321160 (contains!8657 lt!587231 k0!1164)))

(declare-fun lt!587229 () Unit!43441)

(assert (=> b!1321160 (= lt!587229 (lemmaInListMapAfterAddingDiffThenInBefore!132 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587231))))

(declare-fun +!4577 (ListLongMap!20949 tuple2!23284) ListLongMap!20949)

(assert (=> b!1321160 (= lt!587231 (+!4577 lt!587228 (tuple2!23285 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6216 (array!88951 array!88953 (_ BitVec 32) (_ BitVec 32) V!53065 V!53065 (_ BitVec 32) Int) ListLongMap!20949)

(declare-fun get!21622 (ValueCell!17087 V!53065) V!53065)

(declare-fun dynLambda!3531 (Int (_ BitVec 64)) V!53065)

(assert (=> b!1321160 (= lt!587228 (+!4577 (getCurrentListMapNoExtraKeys!6216 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23285 (select (arr!42945 _keys!1609) from!2000) (get!21622 (select (arr!42946 _values!1337) from!2000) (dynLambda!3531 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1321161 () Bool)

(declare-fun e!753813 () Bool)

(declare-fun e!753816 () Bool)

(declare-fun mapRes!55604 () Bool)

(assert (=> b!1321161 (= e!753813 (and e!753816 mapRes!55604))))

(declare-fun condMapEmpty!55604 () Bool)

(declare-fun mapDefault!55604 () ValueCell!17087)

(assert (=> b!1321161 (= condMapEmpty!55604 (= (arr!42946 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17087)) mapDefault!55604)))))

(declare-fun b!1321162 () Bool)

(declare-fun res!876512 () Bool)

(assert (=> b!1321162 (=> (not res!876512) (not e!753814))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321162 (= res!876512 (validKeyInArray!0 (select (arr!42945 _keys!1609) from!2000)))))

(declare-fun mapIsEmpty!55604 () Bool)

(assert (=> mapIsEmpty!55604 mapRes!55604))

(declare-fun b!1321164 () Bool)

(declare-fun res!876514 () Bool)

(assert (=> b!1321164 (=> (not res!876514) (not e!753814))))

(declare-datatypes ((List!30441 0))(
  ( (Nil!30438) (Cons!30437 (h!31655 (_ BitVec 64)) (t!44133 List!30441)) )
))
(declare-fun arrayNoDuplicates!0 (array!88951 (_ BitVec 32) List!30441) Bool)

(assert (=> b!1321164 (= res!876514 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30438))))

(declare-fun mapNonEmpty!55604 () Bool)

(declare-fun tp!105929 () Bool)

(declare-fun e!753815 () Bool)

(assert (=> mapNonEmpty!55604 (= mapRes!55604 (and tp!105929 e!753815))))

(declare-fun mapKey!55604 () (_ BitVec 32))

(declare-fun mapRest!55604 () (Array (_ BitVec 32) ValueCell!17087))

(declare-fun mapValue!55604 () ValueCell!17087)

(assert (=> mapNonEmpty!55604 (= (arr!42946 _values!1337) (store mapRest!55604 mapKey!55604 mapValue!55604))))

(declare-fun b!1321165 () Bool)

(declare-fun res!876511 () Bool)

(assert (=> b!1321165 (=> (not res!876511) (not e!753814))))

(assert (=> b!1321165 (= res!876511 (not (= (select (arr!42945 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321166 () Bool)

(declare-fun res!876508 () Bool)

(assert (=> b!1321166 (=> (not res!876508) (not e!753814))))

(assert (=> b!1321166 (= res!876508 (and (= (size!43497 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43496 _keys!1609) (size!43497 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321167 () Bool)

(declare-fun res!876510 () Bool)

(assert (=> b!1321167 (=> (not res!876510) (not e!753814))))

(assert (=> b!1321167 (= res!876510 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43496 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321168 () Bool)

(declare-fun res!876513 () Bool)

(assert (=> b!1321168 (=> (not res!876513) (not e!753814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88951 (_ BitVec 32)) Bool)

(assert (=> b!1321168 (= res!876513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321169 () Bool)

(declare-fun tp_is_empty!35971 () Bool)

(assert (=> b!1321169 (= e!753815 tp_is_empty!35971)))

(declare-fun b!1321163 () Bool)

(assert (=> b!1321163 (= e!753816 tp_is_empty!35971)))

(declare-fun res!876509 () Bool)

(assert (=> start!111718 (=> (not res!876509) (not e!753814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111718 (= res!876509 (validMask!0 mask!2019))))

(assert (=> start!111718 e!753814))

(declare-fun array_inv!32697 (array!88951) Bool)

(assert (=> start!111718 (array_inv!32697 _keys!1609)))

(assert (=> start!111718 true))

(assert (=> start!111718 tp_is_empty!35971))

(declare-fun array_inv!32698 (array!88953) Bool)

(assert (=> start!111718 (and (array_inv!32698 _values!1337) e!753813)))

(assert (=> start!111718 tp!105928))

(assert (= (and start!111718 res!876509) b!1321166))

(assert (= (and b!1321166 res!876508) b!1321168))

(assert (= (and b!1321168 res!876513) b!1321164))

(assert (= (and b!1321164 res!876514) b!1321167))

(assert (= (and b!1321167 res!876510) b!1321159))

(assert (= (and b!1321159 res!876507) b!1321165))

(assert (= (and b!1321165 res!876511) b!1321162))

(assert (= (and b!1321162 res!876512) b!1321160))

(assert (= (and b!1321161 condMapEmpty!55604) mapIsEmpty!55604))

(assert (= (and b!1321161 (not condMapEmpty!55604)) mapNonEmpty!55604))

(get-info :version)

(assert (= (and mapNonEmpty!55604 ((_ is ValueCellFull!17087) mapValue!55604)) b!1321169))

(assert (= (and b!1321161 ((_ is ValueCellFull!17087) mapDefault!55604)) b!1321163))

(assert (= start!111718 b!1321161))

(declare-fun b_lambda!23471 () Bool)

(assert (=> (not b_lambda!23471) (not b!1321160)))

(declare-fun t!44131 () Bool)

(declare-fun tb!11495 () Bool)

(assert (=> (and start!111718 (= defaultEntry!1340 defaultEntry!1340) t!44131) tb!11495))

(declare-fun result!24053 () Bool)

(assert (=> tb!11495 (= result!24053 tp_is_empty!35971)))

(assert (=> b!1321160 t!44131))

(declare-fun b_and!48465 () Bool)

(assert (= b_and!48463 (and (=> t!44131 result!24053) b_and!48465)))

(declare-fun m!1209089 () Bool)

(assert (=> b!1321168 m!1209089))

(declare-fun m!1209091 () Bool)

(assert (=> b!1321162 m!1209091))

(assert (=> b!1321162 m!1209091))

(declare-fun m!1209093 () Bool)

(assert (=> b!1321162 m!1209093))

(declare-fun m!1209095 () Bool)

(assert (=> start!111718 m!1209095))

(declare-fun m!1209097 () Bool)

(assert (=> start!111718 m!1209097))

(declare-fun m!1209099 () Bool)

(assert (=> start!111718 m!1209099))

(declare-fun m!1209101 () Bool)

(assert (=> mapNonEmpty!55604 m!1209101))

(assert (=> b!1321165 m!1209091))

(declare-fun m!1209103 () Bool)

(assert (=> b!1321159 m!1209103))

(assert (=> b!1321159 m!1209103))

(declare-fun m!1209105 () Bool)

(assert (=> b!1321159 m!1209105))

(declare-fun m!1209107 () Bool)

(assert (=> b!1321160 m!1209107))

(declare-fun m!1209109 () Bool)

(assert (=> b!1321160 m!1209109))

(assert (=> b!1321160 m!1209109))

(declare-fun m!1209111 () Bool)

(assert (=> b!1321160 m!1209111))

(declare-fun m!1209113 () Bool)

(assert (=> b!1321160 m!1209113))

(declare-fun m!1209115 () Bool)

(assert (=> b!1321160 m!1209115))

(declare-fun m!1209117 () Bool)

(assert (=> b!1321160 m!1209117))

(declare-fun m!1209119 () Bool)

(assert (=> b!1321160 m!1209119))

(assert (=> b!1321160 m!1209117))

(declare-fun m!1209121 () Bool)

(assert (=> b!1321160 m!1209121))

(declare-fun m!1209123 () Bool)

(assert (=> b!1321160 m!1209123))

(assert (=> b!1321160 m!1209091))

(assert (=> b!1321160 m!1209121))

(declare-fun m!1209125 () Bool)

(assert (=> b!1321160 m!1209125))

(declare-fun m!1209127 () Bool)

(assert (=> b!1321164 m!1209127))

(check-sat (not b!1321159) (not b!1321160) (not b_lambda!23471) (not start!111718) (not mapNonEmpty!55604) (not b!1321162) tp_is_empty!35971 b_and!48465 (not b!1321168) (not b_next!30151) (not b!1321164))
(check-sat b_and!48465 (not b_next!30151))
