; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109914 () Bool)

(assert start!109914)

(declare-fun b_free!29143 () Bool)

(declare-fun b_next!29143 () Bool)

(assert (=> start!109914 (= b_free!29143 (not b_next!29143))))

(declare-fun tp!102553 () Bool)

(declare-fun b_and!47241 () Bool)

(assert (=> start!109914 (= tp!102553 b_and!47241)))

(declare-fun b!1300569 () Bool)

(declare-fun e!742077 () Bool)

(declare-fun tp_is_empty!34783 () Bool)

(assert (=> b!1300569 (= e!742077 tp_is_empty!34783)))

(declare-fun b!1300570 () Bool)

(declare-fun res!863954 () Bool)

(declare-fun e!742079 () Bool)

(assert (=> b!1300570 (=> (not res!863954) (not e!742079))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86613 0))(
  ( (array!86614 (arr!41801 (Array (_ BitVec 32) (_ BitVec 64))) (size!42352 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86613)

(assert (=> b!1300570 (= res!863954 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42352 _keys!1741))))))

(declare-fun b!1300571 () Bool)

(declare-fun res!863952 () Bool)

(assert (=> b!1300571 (=> (not res!863952) (not e!742079))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1300571 (= res!863952 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1300572 () Bool)

(declare-fun res!863956 () Bool)

(assert (=> b!1300572 (=> (not res!863956) (not e!742079))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51481 0))(
  ( (V!51482 (val!17466 Int)) )
))
(declare-datatypes ((ValueCell!16493 0))(
  ( (ValueCellFull!16493 (v!20066 V!51481)) (EmptyCell!16493) )
))
(declare-datatypes ((array!86615 0))(
  ( (array!86616 (arr!41802 (Array (_ BitVec 32) ValueCell!16493)) (size!42353 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86615)

(assert (=> b!1300572 (= res!863956 (and (= (size!42353 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42352 _keys!1741) (size!42353 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1300573 () Bool)

(declare-fun res!863953 () Bool)

(assert (=> b!1300573 (=> (not res!863953) (not e!742079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300573 (= res!863953 (validKeyInArray!0 (select (arr!41801 _keys!1741) from!2144)))))

(declare-fun b!1300574 () Bool)

(declare-fun res!863950 () Bool)

(assert (=> b!1300574 (=> (not res!863950) (not e!742079))))

(declare-fun k0!1205 () (_ BitVec 64))

(assert (=> b!1300574 (= res!863950 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42352 _keys!1741))))))

(declare-fun mapIsEmpty!53741 () Bool)

(declare-fun mapRes!53741 () Bool)

(assert (=> mapIsEmpty!53741 mapRes!53741))

(declare-fun mapNonEmpty!53741 () Bool)

(declare-fun tp!102554 () Bool)

(assert (=> mapNonEmpty!53741 (= mapRes!53741 (and tp!102554 e!742077))))

(declare-fun mapRest!53741 () (Array (_ BitVec 32) ValueCell!16493))

(declare-fun mapKey!53741 () (_ BitVec 32))

(declare-fun mapValue!53741 () ValueCell!16493)

(assert (=> mapNonEmpty!53741 (= (arr!41802 _values!1445) (store mapRest!53741 mapKey!53741 mapValue!53741))))

(declare-fun b!1300575 () Bool)

(declare-fun res!863955 () Bool)

(assert (=> b!1300575 (=> (not res!863955) (not e!742079))))

(declare-datatypes ((List!29694 0))(
  ( (Nil!29691) (Cons!29690 (h!30908 (_ BitVec 64)) (t!43254 List!29694)) )
))
(declare-fun arrayNoDuplicates!0 (array!86613 (_ BitVec 32) List!29694) Bool)

(assert (=> b!1300575 (= res!863955 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29691))))

(declare-fun minValue!1387 () V!51481)

(declare-fun zeroValue!1387 () V!51481)

(declare-fun b!1300576 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22534 0))(
  ( (tuple2!22535 (_1!11278 (_ BitVec 64)) (_2!11278 V!51481)) )
))
(declare-datatypes ((List!29695 0))(
  ( (Nil!29692) (Cons!29691 (h!30909 tuple2!22534) (t!43255 List!29695)) )
))
(declare-datatypes ((ListLongMap!20199 0))(
  ( (ListLongMap!20200 (toList!10115 List!29695)) )
))
(declare-fun contains!8247 (ListLongMap!20199 (_ BitVec 64)) Bool)

(declare-fun +!4489 (ListLongMap!20199 tuple2!22534) ListLongMap!20199)

(declare-fun getCurrentListMapNoExtraKeys!6129 (array!86613 array!86615 (_ BitVec 32) (_ BitVec 32) V!51481 V!51481 (_ BitVec 32) Int) ListLongMap!20199)

(assert (=> b!1300576 (= e!742079 (not (contains!8247 (+!4489 (+!4489 (getCurrentListMapNoExtraKeys!6129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205)))))

(declare-fun res!863948 () Bool)

(assert (=> start!109914 (=> (not res!863948) (not e!742079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109914 (= res!863948 (validMask!0 mask!2175))))

(assert (=> start!109914 e!742079))

(assert (=> start!109914 tp_is_empty!34783))

(assert (=> start!109914 true))

(declare-fun e!742078 () Bool)

(declare-fun array_inv!31871 (array!86615) Bool)

(assert (=> start!109914 (and (array_inv!31871 _values!1445) e!742078)))

(declare-fun array_inv!31872 (array!86613) Bool)

(assert (=> start!109914 (array_inv!31872 _keys!1741)))

(assert (=> start!109914 tp!102553))

(declare-fun b!1300577 () Bool)

(declare-fun e!742076 () Bool)

(assert (=> b!1300577 (= e!742078 (and e!742076 mapRes!53741))))

(declare-fun condMapEmpty!53741 () Bool)

(declare-fun mapDefault!53741 () ValueCell!16493)

(assert (=> b!1300577 (= condMapEmpty!53741 (= (arr!41802 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16493)) mapDefault!53741)))))

(declare-fun b!1300578 () Bool)

(declare-fun res!863949 () Bool)

(assert (=> b!1300578 (=> (not res!863949) (not e!742079))))

(declare-fun getCurrentListMap!5134 (array!86613 array!86615 (_ BitVec 32) (_ BitVec 32) V!51481 V!51481 (_ BitVec 32) Int) ListLongMap!20199)

(assert (=> b!1300578 (= res!863949 (contains!8247 (getCurrentListMap!5134 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1300579 () Bool)

(declare-fun res!863951 () Bool)

(assert (=> b!1300579 (=> (not res!863951) (not e!742079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86613 (_ BitVec 32)) Bool)

(assert (=> b!1300579 (= res!863951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1300580 () Bool)

(assert (=> b!1300580 (= e!742076 tp_is_empty!34783)))

(assert (= (and start!109914 res!863948) b!1300572))

(assert (= (and b!1300572 res!863956) b!1300579))

(assert (= (and b!1300579 res!863951) b!1300575))

(assert (= (and b!1300575 res!863955) b!1300570))

(assert (= (and b!1300570 res!863954) b!1300578))

(assert (= (and b!1300578 res!863949) b!1300574))

(assert (= (and b!1300574 res!863950) b!1300573))

(assert (= (and b!1300573 res!863953) b!1300571))

(assert (= (and b!1300571 res!863952) b!1300576))

(assert (= (and b!1300577 condMapEmpty!53741) mapIsEmpty!53741))

(assert (= (and b!1300577 (not condMapEmpty!53741)) mapNonEmpty!53741))

(get-info :version)

(assert (= (and mapNonEmpty!53741 ((_ is ValueCellFull!16493) mapValue!53741)) b!1300569))

(assert (= (and b!1300577 ((_ is ValueCellFull!16493) mapDefault!53741)) b!1300580))

(assert (= start!109914 b!1300577))

(declare-fun m!1192085 () Bool)

(assert (=> b!1300576 m!1192085))

(assert (=> b!1300576 m!1192085))

(declare-fun m!1192087 () Bool)

(assert (=> b!1300576 m!1192087))

(assert (=> b!1300576 m!1192087))

(declare-fun m!1192089 () Bool)

(assert (=> b!1300576 m!1192089))

(assert (=> b!1300576 m!1192089))

(declare-fun m!1192091 () Bool)

(assert (=> b!1300576 m!1192091))

(declare-fun m!1192093 () Bool)

(assert (=> b!1300573 m!1192093))

(assert (=> b!1300573 m!1192093))

(declare-fun m!1192095 () Bool)

(assert (=> b!1300573 m!1192095))

(declare-fun m!1192097 () Bool)

(assert (=> start!109914 m!1192097))

(declare-fun m!1192099 () Bool)

(assert (=> start!109914 m!1192099))

(declare-fun m!1192101 () Bool)

(assert (=> start!109914 m!1192101))

(declare-fun m!1192103 () Bool)

(assert (=> b!1300575 m!1192103))

(declare-fun m!1192105 () Bool)

(assert (=> b!1300579 m!1192105))

(declare-fun m!1192107 () Bool)

(assert (=> b!1300578 m!1192107))

(assert (=> b!1300578 m!1192107))

(declare-fun m!1192109 () Bool)

(assert (=> b!1300578 m!1192109))

(declare-fun m!1192111 () Bool)

(assert (=> mapNonEmpty!53741 m!1192111))

(check-sat tp_is_empty!34783 (not mapNonEmpty!53741) (not b_next!29143) b_and!47241 (not b!1300576) (not b!1300573) (not b!1300578) (not start!109914) (not b!1300575) (not b!1300579))
(check-sat b_and!47241 (not b_next!29143))
(get-model)

(declare-fun d!141547 () Bool)

(assert (=> d!141547 (= (validKeyInArray!0 (select (arr!41801 _keys!1741) from!2144)) (and (not (= (select (arr!41801 _keys!1741) from!2144) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!41801 _keys!1741) from!2144) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1300573 d!141547))

(declare-fun d!141549 () Bool)

(declare-fun e!742114 () Bool)

(assert (=> d!141549 e!742114))

(declare-fun res!864013 () Bool)

(assert (=> d!141549 (=> res!864013 e!742114)))

(declare-fun lt!581458 () Bool)

(assert (=> d!141549 (= res!864013 (not lt!581458))))

(declare-fun lt!581459 () Bool)

(assert (=> d!141549 (= lt!581458 lt!581459)))

(declare-datatypes ((Unit!42983 0))(
  ( (Unit!42984) )
))
(declare-fun lt!581457 () Unit!42983)

(declare-fun e!742115 () Unit!42983)

(assert (=> d!141549 (= lt!581457 e!742115)))

(declare-fun c!124881 () Bool)

(assert (=> d!141549 (= c!124881 lt!581459)))

(declare-fun containsKey!719 (List!29695 (_ BitVec 64)) Bool)

(assert (=> d!141549 (= lt!581459 (containsKey!719 (toList!10115 (+!4489 (+!4489 (getCurrentListMapNoExtraKeys!6129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(assert (=> d!141549 (= (contains!8247 (+!4489 (+!4489 (getCurrentListMapNoExtraKeys!6129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k0!1205) lt!581458)))

(declare-fun b!1300659 () Bool)

(declare-fun lt!581456 () Unit!42983)

(assert (=> b!1300659 (= e!742115 lt!581456)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!465 (List!29695 (_ BitVec 64)) Unit!42983)

(assert (=> b!1300659 (= lt!581456 (lemmaContainsKeyImpliesGetValueByKeyDefined!465 (toList!10115 (+!4489 (+!4489 (getCurrentListMapNoExtraKeys!6129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-datatypes ((Option!744 0))(
  ( (Some!743 (v!20069 V!51481)) (None!742) )
))
(declare-fun isDefined!502 (Option!744) Bool)

(declare-fun getValueByKey!693 (List!29695 (_ BitVec 64)) Option!744)

(assert (=> b!1300659 (isDefined!502 (getValueByKey!693 (toList!10115 (+!4489 (+!4489 (getCurrentListMapNoExtraKeys!6129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205))))

(declare-fun b!1300660 () Bool)

(declare-fun Unit!42985 () Unit!42983)

(assert (=> b!1300660 (= e!742115 Unit!42985)))

(declare-fun b!1300661 () Bool)

(assert (=> b!1300661 (= e!742114 (isDefined!502 (getValueByKey!693 (toList!10115 (+!4489 (+!4489 (getCurrentListMapNoExtraKeys!6129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) k0!1205)))))

(assert (= (and d!141549 c!124881) b!1300659))

(assert (= (and d!141549 (not c!124881)) b!1300660))

(assert (= (and d!141549 (not res!864013)) b!1300661))

(declare-fun m!1192169 () Bool)

(assert (=> d!141549 m!1192169))

(declare-fun m!1192171 () Bool)

(assert (=> b!1300659 m!1192171))

(declare-fun m!1192173 () Bool)

(assert (=> b!1300659 m!1192173))

(assert (=> b!1300659 m!1192173))

(declare-fun m!1192175 () Bool)

(assert (=> b!1300659 m!1192175))

(assert (=> b!1300661 m!1192173))

(assert (=> b!1300661 m!1192173))

(assert (=> b!1300661 m!1192175))

(assert (=> b!1300576 d!141549))

(declare-fun d!141551 () Bool)

(declare-fun e!742118 () Bool)

(assert (=> d!141551 e!742118))

(declare-fun res!864019 () Bool)

(assert (=> d!141551 (=> (not res!864019) (not e!742118))))

(declare-fun lt!581470 () ListLongMap!20199)

(assert (=> d!141551 (= res!864019 (contains!8247 lt!581470 (_1!11278 (tuple2!22535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lt!581471 () List!29695)

(assert (=> d!141551 (= lt!581470 (ListLongMap!20200 lt!581471))))

(declare-fun lt!581469 () Unit!42983)

(declare-fun lt!581468 () Unit!42983)

(assert (=> d!141551 (= lt!581469 lt!581468)))

(assert (=> d!141551 (= (getValueByKey!693 lt!581471 (_1!11278 (tuple2!22535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!743 (_2!11278 (tuple2!22535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun lemmaContainsTupThenGetReturnValue!344 (List!29695 (_ BitVec 64) V!51481) Unit!42983)

(assert (=> d!141551 (= lt!581468 (lemmaContainsTupThenGetReturnValue!344 lt!581471 (_1!11278 (tuple2!22535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11278 (tuple2!22535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun insertStrictlySorted!473 (List!29695 (_ BitVec 64) V!51481) List!29695)

(assert (=> d!141551 (= lt!581471 (insertStrictlySorted!473 (toList!10115 (+!4489 (getCurrentListMapNoExtraKeys!6129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (_1!11278 (tuple2!22535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) (_2!11278 (tuple2!22535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(assert (=> d!141551 (= (+!4489 (+!4489 (getCurrentListMapNoExtraKeys!6129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (tuple2!22535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) lt!581470)))

(declare-fun b!1300666 () Bool)

(declare-fun res!864018 () Bool)

(assert (=> b!1300666 (=> (not res!864018) (not e!742118))))

(assert (=> b!1300666 (= res!864018 (= (getValueByKey!693 (toList!10115 lt!581470) (_1!11278 (tuple2!22535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))) (Some!743 (_2!11278 (tuple2!22535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))))

(declare-fun b!1300667 () Bool)

(declare-fun contains!8250 (List!29695 tuple2!22534) Bool)

(assert (=> b!1300667 (= e!742118 (contains!8250 (toList!10115 lt!581470) (tuple2!22535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(assert (= (and d!141551 res!864019) b!1300666))

(assert (= (and b!1300666 res!864018) b!1300667))

(declare-fun m!1192177 () Bool)

(assert (=> d!141551 m!1192177))

(declare-fun m!1192179 () Bool)

(assert (=> d!141551 m!1192179))

(declare-fun m!1192181 () Bool)

(assert (=> d!141551 m!1192181))

(declare-fun m!1192183 () Bool)

(assert (=> d!141551 m!1192183))

(declare-fun m!1192185 () Bool)

(assert (=> b!1300666 m!1192185))

(declare-fun m!1192187 () Bool)

(assert (=> b!1300667 m!1192187))

(assert (=> b!1300576 d!141551))

(declare-fun d!141553 () Bool)

(declare-fun e!742119 () Bool)

(assert (=> d!141553 e!742119))

(declare-fun res!864021 () Bool)

(assert (=> d!141553 (=> (not res!864021) (not e!742119))))

(declare-fun lt!581474 () ListLongMap!20199)

(assert (=> d!141553 (= res!864021 (contains!8247 lt!581474 (_1!11278 (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(declare-fun lt!581475 () List!29695)

(assert (=> d!141553 (= lt!581474 (ListLongMap!20200 lt!581475))))

(declare-fun lt!581473 () Unit!42983)

(declare-fun lt!581472 () Unit!42983)

(assert (=> d!141553 (= lt!581473 lt!581472)))

(assert (=> d!141553 (= (getValueByKey!693 lt!581475 (_1!11278 (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!743 (_2!11278 (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141553 (= lt!581472 (lemmaContainsTupThenGetReturnValue!344 lt!581475 (_1!11278 (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11278 (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141553 (= lt!581475 (insertStrictlySorted!473 (toList!10115 (getCurrentListMapNoExtraKeys!6129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) (_1!11278 (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) (_2!11278 (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))))))

(assert (=> d!141553 (= (+!4489 (getCurrentListMapNoExtraKeys!6129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) lt!581474)))

(declare-fun b!1300668 () Bool)

(declare-fun res!864020 () Bool)

(assert (=> b!1300668 (=> (not res!864020) (not e!742119))))

(assert (=> b!1300668 (= res!864020 (= (getValueByKey!693 (toList!10115 lt!581474) (_1!11278 (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387))) (Some!743 (_2!11278 (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))))

(declare-fun b!1300669 () Bool)

(assert (=> b!1300669 (= e!742119 (contains!8250 (toList!10115 lt!581474) (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(assert (= (and d!141553 res!864021) b!1300668))

(assert (= (and b!1300668 res!864020) b!1300669))

(declare-fun m!1192189 () Bool)

(assert (=> d!141553 m!1192189))

(declare-fun m!1192191 () Bool)

(assert (=> d!141553 m!1192191))

(declare-fun m!1192193 () Bool)

(assert (=> d!141553 m!1192193))

(declare-fun m!1192195 () Bool)

(assert (=> d!141553 m!1192195))

(declare-fun m!1192197 () Bool)

(assert (=> b!1300668 m!1192197))

(declare-fun m!1192199 () Bool)

(assert (=> b!1300669 m!1192199))

(assert (=> b!1300576 d!141553))

(declare-fun b!1300694 () Bool)

(declare-fun e!742136 () Bool)

(assert (=> b!1300694 (= e!742136 (validKeyInArray!0 (select (arr!41801 _keys!1741) from!2144)))))

(assert (=> b!1300694 (bvsge from!2144 #b00000000000000000000000000000000)))

(declare-fun b!1300695 () Bool)

(declare-fun e!742140 () ListLongMap!20199)

(declare-fun call!63638 () ListLongMap!20199)

(assert (=> b!1300695 (= e!742140 call!63638)))

(declare-fun bm!63635 () Bool)

(assert (=> bm!63635 (= call!63638 (getCurrentListMapNoExtraKeys!6129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448))))

(declare-fun e!742139 () Bool)

(declare-fun b!1300696 () Bool)

(declare-fun lt!581492 () ListLongMap!20199)

(assert (=> b!1300696 (= e!742139 (= lt!581492 (getCurrentListMapNoExtraKeys!6129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd from!2144 #b00000000000000000000000000000001) defaultEntry!1448)))))

(declare-fun b!1300697 () Bool)

(assert (=> b!1300697 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42352 _keys!1741)))))

(assert (=> b!1300697 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42353 _values!1445)))))

(declare-fun e!742137 () Bool)

(declare-fun apply!1023 (ListLongMap!20199 (_ BitVec 64)) V!51481)

(declare-fun get!21157 (ValueCell!16493 V!51481) V!51481)

(declare-fun dynLambda!3480 (Int (_ BitVec 64)) V!51481)

(assert (=> b!1300697 (= e!742137 (= (apply!1023 lt!581492 (select (arr!41801 _keys!1741) from!2144)) (get!21157 (select (arr!41802 _values!1445) from!2144) (dynLambda!3480 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1300698 () Bool)

(declare-fun e!742134 () Bool)

(assert (=> b!1300698 (= e!742134 e!742137)))

(assert (=> b!1300698 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42352 _keys!1741)))))

(declare-fun res!864030 () Bool)

(assert (=> b!1300698 (= res!864030 (contains!8247 lt!581492 (select (arr!41801 _keys!1741) from!2144)))))

(assert (=> b!1300698 (=> (not res!864030) (not e!742137))))

(declare-fun d!141555 () Bool)

(declare-fun e!742135 () Bool)

(assert (=> d!141555 e!742135))

(declare-fun res!864033 () Bool)

(assert (=> d!141555 (=> (not res!864033) (not e!742135))))

(assert (=> d!141555 (= res!864033 (not (contains!8247 lt!581492 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!742138 () ListLongMap!20199)

(assert (=> d!141555 (= lt!581492 e!742138)))

(declare-fun c!124893 () Bool)

(assert (=> d!141555 (= c!124893 (bvsge from!2144 (size!42352 _keys!1741)))))

(assert (=> d!141555 (validMask!0 mask!2175)))

(assert (=> d!141555 (= (getCurrentListMapNoExtraKeys!6129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581492)))

(declare-fun b!1300699 () Bool)

(assert (=> b!1300699 (= e!742138 e!742140)))

(declare-fun c!124892 () Bool)

(assert (=> b!1300699 (= c!124892 (validKeyInArray!0 (select (arr!41801 _keys!1741) from!2144)))))

(declare-fun b!1300700 () Bool)

(assert (=> b!1300700 (= e!742138 (ListLongMap!20200 Nil!29692))))

(declare-fun b!1300701 () Bool)

(declare-fun isEmpty!1054 (ListLongMap!20199) Bool)

(assert (=> b!1300701 (= e!742139 (isEmpty!1054 lt!581492))))

(declare-fun b!1300702 () Bool)

(declare-fun lt!581490 () Unit!42983)

(declare-fun lt!581494 () Unit!42983)

(assert (=> b!1300702 (= lt!581490 lt!581494)))

(declare-fun lt!581493 () ListLongMap!20199)

(declare-fun lt!581496 () (_ BitVec 64))

(declare-fun lt!581491 () (_ BitVec 64))

(declare-fun lt!581495 () V!51481)

(assert (=> b!1300702 (not (contains!8247 (+!4489 lt!581493 (tuple2!22535 lt!581491 lt!581495)) lt!581496))))

(declare-fun addStillNotContains!462 (ListLongMap!20199 (_ BitVec 64) V!51481 (_ BitVec 64)) Unit!42983)

(assert (=> b!1300702 (= lt!581494 (addStillNotContains!462 lt!581493 lt!581491 lt!581495 lt!581496))))

(assert (=> b!1300702 (= lt!581496 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1300702 (= lt!581495 (get!21157 (select (arr!41802 _values!1445) from!2144) (dynLambda!3480 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1300702 (= lt!581491 (select (arr!41801 _keys!1741) from!2144))))

(assert (=> b!1300702 (= lt!581493 call!63638)))

(assert (=> b!1300702 (= e!742140 (+!4489 call!63638 (tuple2!22535 (select (arr!41801 _keys!1741) from!2144) (get!21157 (select (arr!41802 _values!1445) from!2144) (dynLambda!3480 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1300703 () Bool)

(assert (=> b!1300703 (= e!742135 e!742134)))

(declare-fun c!124891 () Bool)

(assert (=> b!1300703 (= c!124891 e!742136)))

(declare-fun res!864031 () Bool)

(assert (=> b!1300703 (=> (not res!864031) (not e!742136))))

(assert (=> b!1300703 (= res!864031 (bvslt from!2144 (size!42352 _keys!1741)))))

(declare-fun b!1300704 () Bool)

(declare-fun res!864032 () Bool)

(assert (=> b!1300704 (=> (not res!864032) (not e!742135))))

(assert (=> b!1300704 (= res!864032 (not (contains!8247 lt!581492 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1300705 () Bool)

(assert (=> b!1300705 (= e!742134 e!742139)))

(declare-fun c!124890 () Bool)

(assert (=> b!1300705 (= c!124890 (bvslt from!2144 (size!42352 _keys!1741)))))

(assert (= (and d!141555 c!124893) b!1300700))

(assert (= (and d!141555 (not c!124893)) b!1300699))

(assert (= (and b!1300699 c!124892) b!1300702))

(assert (= (and b!1300699 (not c!124892)) b!1300695))

(assert (= (or b!1300702 b!1300695) bm!63635))

(assert (= (and d!141555 res!864033) b!1300704))

(assert (= (and b!1300704 res!864032) b!1300703))

(assert (= (and b!1300703 res!864031) b!1300694))

(assert (= (and b!1300703 c!124891) b!1300698))

(assert (= (and b!1300703 (not c!124891)) b!1300705))

(assert (= (and b!1300698 res!864030) b!1300697))

(assert (= (and b!1300705 c!124890) b!1300696))

(assert (= (and b!1300705 (not c!124890)) b!1300701))

(declare-fun b_lambda!23143 () Bool)

(assert (=> (not b_lambda!23143) (not b!1300697)))

(declare-fun t!43260 () Bool)

(declare-fun tb!11365 () Bool)

(assert (=> (and start!109914 (= defaultEntry!1448 defaultEntry!1448) t!43260) tb!11365))

(declare-fun result!23743 () Bool)

(assert (=> tb!11365 (= result!23743 tp_is_empty!34783)))

(assert (=> b!1300697 t!43260))

(declare-fun b_and!47247 () Bool)

(assert (= b_and!47241 (and (=> t!43260 result!23743) b_and!47247)))

(declare-fun b_lambda!23145 () Bool)

(assert (=> (not b_lambda!23145) (not b!1300702)))

(assert (=> b!1300702 t!43260))

(declare-fun b_and!47249 () Bool)

(assert (= b_and!47247 (and (=> t!43260 result!23743) b_and!47249)))

(declare-fun m!1192201 () Bool)

(assert (=> b!1300696 m!1192201))

(assert (=> bm!63635 m!1192201))

(assert (=> b!1300694 m!1192093))

(assert (=> b!1300694 m!1192093))

(assert (=> b!1300694 m!1192095))

(declare-fun m!1192203 () Bool)

(assert (=> b!1300702 m!1192203))

(declare-fun m!1192205 () Bool)

(assert (=> b!1300702 m!1192205))

(assert (=> b!1300702 m!1192093))

(declare-fun m!1192207 () Bool)

(assert (=> b!1300702 m!1192207))

(assert (=> b!1300702 m!1192203))

(declare-fun m!1192209 () Bool)

(assert (=> b!1300702 m!1192209))

(assert (=> b!1300702 m!1192207))

(assert (=> b!1300702 m!1192209))

(declare-fun m!1192211 () Bool)

(assert (=> b!1300702 m!1192211))

(declare-fun m!1192213 () Bool)

(assert (=> b!1300702 m!1192213))

(declare-fun m!1192215 () Bool)

(assert (=> b!1300702 m!1192215))

(assert (=> b!1300698 m!1192093))

(assert (=> b!1300698 m!1192093))

(declare-fun m!1192217 () Bool)

(assert (=> b!1300698 m!1192217))

(declare-fun m!1192219 () Bool)

(assert (=> b!1300701 m!1192219))

(assert (=> b!1300697 m!1192093))

(assert (=> b!1300697 m!1192207))

(assert (=> b!1300697 m!1192093))

(declare-fun m!1192221 () Bool)

(assert (=> b!1300697 m!1192221))

(assert (=> b!1300697 m!1192209))

(assert (=> b!1300697 m!1192207))

(assert (=> b!1300697 m!1192209))

(assert (=> b!1300697 m!1192211))

(declare-fun m!1192223 () Bool)

(assert (=> b!1300704 m!1192223))

(declare-fun m!1192225 () Bool)

(assert (=> d!141555 m!1192225))

(assert (=> d!141555 m!1192097))

(assert (=> b!1300699 m!1192093))

(assert (=> b!1300699 m!1192093))

(assert (=> b!1300699 m!1192095))

(assert (=> b!1300576 d!141555))

(declare-fun d!141557 () Bool)

(assert (=> d!141557 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!109914 d!141557))

(declare-fun d!141559 () Bool)

(assert (=> d!141559 (= (array_inv!31871 _values!1445) (bvsge (size!42353 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!109914 d!141559))

(declare-fun d!141561 () Bool)

(assert (=> d!141561 (= (array_inv!31872 _keys!1741) (bvsge (size!42352 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!109914 d!141561))

(declare-fun b!1300716 () Bool)

(declare-fun e!742147 () Bool)

(declare-fun e!742148 () Bool)

(assert (=> b!1300716 (= e!742147 e!742148)))

(declare-fun c!124896 () Bool)

(assert (=> b!1300716 (= c!124896 (validKeyInArray!0 (select (arr!41801 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!63638 () Bool)

(declare-fun call!63641 () Bool)

(assert (=> bm!63638 (= call!63641 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1300717 () Bool)

(declare-fun e!742149 () Bool)

(assert (=> b!1300717 (= e!742148 e!742149)))

(declare-fun lt!581503 () (_ BitVec 64))

(assert (=> b!1300717 (= lt!581503 (select (arr!41801 _keys!1741) #b00000000000000000000000000000000))))

(declare-fun lt!581504 () Unit!42983)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86613 (_ BitVec 64) (_ BitVec 32)) Unit!42983)

(assert (=> b!1300717 (= lt!581504 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!581503 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86613 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1300717 (arrayContainsKey!0 _keys!1741 lt!581503 #b00000000000000000000000000000000)))

(declare-fun lt!581505 () Unit!42983)

(assert (=> b!1300717 (= lt!581505 lt!581504)))

(declare-fun res!864038 () Bool)

(declare-datatypes ((SeekEntryResult!9973 0))(
  ( (MissingZero!9973 (index!42263 (_ BitVec 32))) (Found!9973 (index!42264 (_ BitVec 32))) (Intermediate!9973 (undefined!10785 Bool) (index!42265 (_ BitVec 32)) (x!115408 (_ BitVec 32))) (Undefined!9973) (MissingVacant!9973 (index!42266 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86613 (_ BitVec 32)) SeekEntryResult!9973)

(assert (=> b!1300717 (= res!864038 (= (seekEntryOrOpen!0 (select (arr!41801 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9973 #b00000000000000000000000000000000)))))

(assert (=> b!1300717 (=> (not res!864038) (not e!742149))))

(declare-fun d!141563 () Bool)

(declare-fun res!864039 () Bool)

(assert (=> d!141563 (=> res!864039 e!742147)))

(assert (=> d!141563 (= res!864039 (bvsge #b00000000000000000000000000000000 (size!42352 _keys!1741)))))

(assert (=> d!141563 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!742147)))

(declare-fun b!1300718 () Bool)

(assert (=> b!1300718 (= e!742148 call!63641)))

(declare-fun b!1300719 () Bool)

(assert (=> b!1300719 (= e!742149 call!63641)))

(assert (= (and d!141563 (not res!864039)) b!1300716))

(assert (= (and b!1300716 c!124896) b!1300717))

(assert (= (and b!1300716 (not c!124896)) b!1300718))

(assert (= (and b!1300717 res!864038) b!1300719))

(assert (= (or b!1300719 b!1300718) bm!63638))

(declare-fun m!1192227 () Bool)

(assert (=> b!1300716 m!1192227))

(assert (=> b!1300716 m!1192227))

(declare-fun m!1192229 () Bool)

(assert (=> b!1300716 m!1192229))

(declare-fun m!1192231 () Bool)

(assert (=> bm!63638 m!1192231))

(assert (=> b!1300717 m!1192227))

(declare-fun m!1192233 () Bool)

(assert (=> b!1300717 m!1192233))

(declare-fun m!1192235 () Bool)

(assert (=> b!1300717 m!1192235))

(assert (=> b!1300717 m!1192227))

(declare-fun m!1192237 () Bool)

(assert (=> b!1300717 m!1192237))

(assert (=> b!1300579 d!141563))

(declare-fun d!141565 () Bool)

(declare-fun e!742150 () Bool)

(assert (=> d!141565 e!742150))

(declare-fun res!864040 () Bool)

(assert (=> d!141565 (=> res!864040 e!742150)))

(declare-fun lt!581508 () Bool)

(assert (=> d!141565 (= res!864040 (not lt!581508))))

(declare-fun lt!581509 () Bool)

(assert (=> d!141565 (= lt!581508 lt!581509)))

(declare-fun lt!581507 () Unit!42983)

(declare-fun e!742151 () Unit!42983)

(assert (=> d!141565 (= lt!581507 e!742151)))

(declare-fun c!124897 () Bool)

(assert (=> d!141565 (= c!124897 lt!581509)))

(assert (=> d!141565 (= lt!581509 (containsKey!719 (toList!10115 (getCurrentListMap!5134 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> d!141565 (= (contains!8247 (getCurrentListMap!5134 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205) lt!581508)))

(declare-fun b!1300720 () Bool)

(declare-fun lt!581506 () Unit!42983)

(assert (=> b!1300720 (= e!742151 lt!581506)))

(assert (=> b!1300720 (= lt!581506 (lemmaContainsKeyImpliesGetValueByKeyDefined!465 (toList!10115 (getCurrentListMap!5134 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(assert (=> b!1300720 (isDefined!502 (getValueByKey!693 (toList!10115 (getCurrentListMap!5134 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205))))

(declare-fun b!1300721 () Bool)

(declare-fun Unit!42986 () Unit!42983)

(assert (=> b!1300721 (= e!742151 Unit!42986)))

(declare-fun b!1300722 () Bool)

(assert (=> b!1300722 (= e!742150 (isDefined!502 (getValueByKey!693 (toList!10115 (getCurrentListMap!5134 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448)) k0!1205)))))

(assert (= (and d!141565 c!124897) b!1300720))

(assert (= (and d!141565 (not c!124897)) b!1300721))

(assert (= (and d!141565 (not res!864040)) b!1300722))

(declare-fun m!1192239 () Bool)

(assert (=> d!141565 m!1192239))

(declare-fun m!1192241 () Bool)

(assert (=> b!1300720 m!1192241))

(declare-fun m!1192243 () Bool)

(assert (=> b!1300720 m!1192243))

(assert (=> b!1300720 m!1192243))

(declare-fun m!1192245 () Bool)

(assert (=> b!1300720 m!1192245))

(assert (=> b!1300722 m!1192243))

(assert (=> b!1300722 m!1192243))

(assert (=> b!1300722 m!1192245))

(assert (=> b!1300578 d!141565))

(declare-fun b!1300765 () Bool)

(declare-fun lt!581558 () ListLongMap!20199)

(declare-fun e!742185 () Bool)

(assert (=> b!1300765 (= e!742185 (= (apply!1023 lt!581558 (select (arr!41801 _keys!1741) from!2144)) (get!21157 (select (arr!41802 _values!1445) from!2144) (dynLambda!3480 defaultEntry!1448 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1300765 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42353 _values!1445)))))

(assert (=> b!1300765 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42352 _keys!1741)))))

(declare-fun b!1300767 () Bool)

(declare-fun e!742179 () Bool)

(assert (=> b!1300767 (= e!742179 (= (apply!1023 lt!581558 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!1387))))

(declare-fun b!1300768 () Bool)

(declare-fun e!742178 () Bool)

(assert (=> b!1300768 (= e!742178 e!742179)))

(declare-fun res!864059 () Bool)

(declare-fun call!63657 () Bool)

(assert (=> b!1300768 (= res!864059 call!63657)))

(assert (=> b!1300768 (=> (not res!864059) (not e!742179))))

(declare-fun b!1300769 () Bool)

(declare-fun e!742189 () ListLongMap!20199)

(declare-fun call!63656 () ListLongMap!20199)

(assert (=> b!1300769 (= e!742189 (+!4489 call!63656 (tuple2!22535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)))))

(declare-fun b!1300770 () Bool)

(declare-fun res!864063 () Bool)

(declare-fun e!742182 () Bool)

(assert (=> b!1300770 (=> (not res!864063) (not e!742182))))

(declare-fun e!742183 () Bool)

(assert (=> b!1300770 (= res!864063 e!742183)))

(declare-fun res!864066 () Bool)

(assert (=> b!1300770 (=> res!864066 e!742183)))

(declare-fun e!742188 () Bool)

(assert (=> b!1300770 (= res!864066 (not e!742188))))

(declare-fun res!864064 () Bool)

(assert (=> b!1300770 (=> (not res!864064) (not e!742188))))

(assert (=> b!1300770 (= res!864064 (bvslt from!2144 (size!42352 _keys!1741)))))

(declare-fun call!63659 () ListLongMap!20199)

(declare-fun c!124914 () Bool)

(declare-fun bm!63653 () Bool)

(declare-fun call!63662 () ListLongMap!20199)

(declare-fun call!63661 () ListLongMap!20199)

(declare-fun c!124913 () Bool)

(assert (=> bm!63653 (= call!63656 (+!4489 (ite c!124913 call!63661 (ite c!124914 call!63659 call!63662)) (ite (or c!124913 c!124914) (tuple2!22535 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387) (tuple2!22535 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))))

(declare-fun b!1300771 () Bool)

(declare-fun e!742180 () ListLongMap!20199)

(assert (=> b!1300771 (= e!742180 call!63662)))

(declare-fun bm!63654 () Bool)

(assert (=> bm!63654 (= call!63662 call!63659)))

(declare-fun bm!63655 () Bool)

(assert (=> bm!63655 (= call!63659 call!63661)))

(declare-fun d!141567 () Bool)

(assert (=> d!141567 e!742182))

(declare-fun res!864065 () Bool)

(assert (=> d!141567 (=> (not res!864065) (not e!742182))))

(assert (=> d!141567 (= res!864065 (or (bvsge from!2144 (size!42352 _keys!1741)) (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42352 _keys!1741)))))))

(declare-fun lt!581559 () ListLongMap!20199)

(assert (=> d!141567 (= lt!581558 lt!581559)))

(declare-fun lt!581571 () Unit!42983)

(declare-fun e!742190 () Unit!42983)

(assert (=> d!141567 (= lt!581571 e!742190)))

(declare-fun c!124910 () Bool)

(declare-fun e!742184 () Bool)

(assert (=> d!141567 (= c!124910 e!742184)))

(declare-fun res!864060 () Bool)

(assert (=> d!141567 (=> (not res!864060) (not e!742184))))

(assert (=> d!141567 (= res!864060 (bvslt from!2144 (size!42352 _keys!1741)))))

(assert (=> d!141567 (= lt!581559 e!742189)))

(assert (=> d!141567 (= c!124913 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!141567 (validMask!0 mask!2175)))

(assert (=> d!141567 (= (getCurrentListMap!5134 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) lt!581558)))

(declare-fun b!1300766 () Bool)

(declare-fun lt!581567 () Unit!42983)

(assert (=> b!1300766 (= e!742190 lt!581567)))

(declare-fun lt!581554 () ListLongMap!20199)

(assert (=> b!1300766 (= lt!581554 (getCurrentListMapNoExtraKeys!6129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581569 () (_ BitVec 64))

(assert (=> b!1300766 (= lt!581569 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581557 () (_ BitVec 64))

(assert (=> b!1300766 (= lt!581557 (select (arr!41801 _keys!1741) from!2144))))

(declare-fun lt!581574 () Unit!42983)

(declare-fun addStillContains!1110 (ListLongMap!20199 (_ BitVec 64) V!51481 (_ BitVec 64)) Unit!42983)

(assert (=> b!1300766 (= lt!581574 (addStillContains!1110 lt!581554 lt!581569 zeroValue!1387 lt!581557))))

(assert (=> b!1300766 (contains!8247 (+!4489 lt!581554 (tuple2!22535 lt!581569 zeroValue!1387)) lt!581557)))

(declare-fun lt!581575 () Unit!42983)

(assert (=> b!1300766 (= lt!581575 lt!581574)))

(declare-fun lt!581563 () ListLongMap!20199)

(assert (=> b!1300766 (= lt!581563 (getCurrentListMapNoExtraKeys!6129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581564 () (_ BitVec 64))

(assert (=> b!1300766 (= lt!581564 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581572 () (_ BitVec 64))

(assert (=> b!1300766 (= lt!581572 (select (arr!41801 _keys!1741) from!2144))))

(declare-fun lt!581560 () Unit!42983)

(declare-fun addApplyDifferent!552 (ListLongMap!20199 (_ BitVec 64) V!51481 (_ BitVec 64)) Unit!42983)

(assert (=> b!1300766 (= lt!581560 (addApplyDifferent!552 lt!581563 lt!581564 minValue!1387 lt!581572))))

(assert (=> b!1300766 (= (apply!1023 (+!4489 lt!581563 (tuple2!22535 lt!581564 minValue!1387)) lt!581572) (apply!1023 lt!581563 lt!581572))))

(declare-fun lt!581555 () Unit!42983)

(assert (=> b!1300766 (= lt!581555 lt!581560)))

(declare-fun lt!581566 () ListLongMap!20199)

(assert (=> b!1300766 (= lt!581566 (getCurrentListMapNoExtraKeys!6129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581568 () (_ BitVec 64))

(assert (=> b!1300766 (= lt!581568 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581565 () (_ BitVec 64))

(assert (=> b!1300766 (= lt!581565 (select (arr!41801 _keys!1741) from!2144))))

(declare-fun lt!581570 () Unit!42983)

(assert (=> b!1300766 (= lt!581570 (addApplyDifferent!552 lt!581566 lt!581568 zeroValue!1387 lt!581565))))

(assert (=> b!1300766 (= (apply!1023 (+!4489 lt!581566 (tuple2!22535 lt!581568 zeroValue!1387)) lt!581565) (apply!1023 lt!581566 lt!581565))))

(declare-fun lt!581561 () Unit!42983)

(assert (=> b!1300766 (= lt!581561 lt!581570)))

(declare-fun lt!581562 () ListLongMap!20199)

(assert (=> b!1300766 (= lt!581562 (getCurrentListMapNoExtraKeys!6129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun lt!581573 () (_ BitVec 64))

(assert (=> b!1300766 (= lt!581573 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!581556 () (_ BitVec 64))

(assert (=> b!1300766 (= lt!581556 (select (arr!41801 _keys!1741) from!2144))))

(assert (=> b!1300766 (= lt!581567 (addApplyDifferent!552 lt!581562 lt!581573 minValue!1387 lt!581556))))

(assert (=> b!1300766 (= (apply!1023 (+!4489 lt!581562 (tuple2!22535 lt!581573 minValue!1387)) lt!581556) (apply!1023 lt!581562 lt!581556))))

(declare-fun b!1300772 () Bool)

(assert (=> b!1300772 (= e!742182 e!742178)))

(declare-fun c!124912 () Bool)

(assert (=> b!1300772 (= c!124912 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!63656 () Bool)

(declare-fun call!63658 () ListLongMap!20199)

(assert (=> bm!63656 (= call!63658 call!63656)))

(declare-fun b!1300773 () Bool)

(declare-fun e!742181 () Bool)

(declare-fun e!742186 () Bool)

(assert (=> b!1300773 (= e!742181 e!742186)))

(declare-fun res!864061 () Bool)

(declare-fun call!63660 () Bool)

(assert (=> b!1300773 (= res!864061 call!63660)))

(assert (=> b!1300773 (=> (not res!864061) (not e!742186))))

(declare-fun b!1300774 () Bool)

(assert (=> b!1300774 (= e!742188 (validKeyInArray!0 (select (arr!41801 _keys!1741) from!2144)))))

(declare-fun b!1300775 () Bool)

(declare-fun c!124915 () Bool)

(assert (=> b!1300775 (= c!124915 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!742187 () ListLongMap!20199)

(assert (=> b!1300775 (= e!742187 e!742180)))

(declare-fun b!1300776 () Bool)

(assert (=> b!1300776 (= e!742181 (not call!63660))))

(declare-fun b!1300777 () Bool)

(assert (=> b!1300777 (= e!742183 e!742185)))

(declare-fun res!864067 () Bool)

(assert (=> b!1300777 (=> (not res!864067) (not e!742185))))

(assert (=> b!1300777 (= res!864067 (contains!8247 lt!581558 (select (arr!41801 _keys!1741) from!2144)))))

(assert (=> b!1300777 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42352 _keys!1741)))))

(declare-fun b!1300778 () Bool)

(assert (=> b!1300778 (= e!742180 call!63658)))

(declare-fun b!1300779 () Bool)

(declare-fun res!864062 () Bool)

(assert (=> b!1300779 (=> (not res!864062) (not e!742182))))

(assert (=> b!1300779 (= res!864062 e!742181)))

(declare-fun c!124911 () Bool)

(assert (=> b!1300779 (= c!124911 (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1300780 () Bool)

(assert (=> b!1300780 (= e!742189 e!742187)))

(assert (=> b!1300780 (= c!124914 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1300781 () Bool)

(declare-fun Unit!42987 () Unit!42983)

(assert (=> b!1300781 (= e!742190 Unit!42987)))

(declare-fun bm!63657 () Bool)

(assert (=> bm!63657 (= call!63661 (getCurrentListMapNoExtraKeys!6129 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1300782 () Bool)

(assert (=> b!1300782 (= e!742184 (validKeyInArray!0 (select (arr!41801 _keys!1741) from!2144)))))

(declare-fun b!1300783 () Bool)

(assert (=> b!1300783 (= e!742186 (= (apply!1023 lt!581558 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!1387))))

(declare-fun b!1300784 () Bool)

(assert (=> b!1300784 (= e!742178 (not call!63657))))

(declare-fun bm!63658 () Bool)

(assert (=> bm!63658 (= call!63660 (contains!8247 lt!581558 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!63659 () Bool)

(assert (=> bm!63659 (= call!63657 (contains!8247 lt!581558 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1300785 () Bool)

(assert (=> b!1300785 (= e!742187 call!63658)))

(assert (= (and d!141567 c!124913) b!1300769))

(assert (= (and d!141567 (not c!124913)) b!1300780))

(assert (= (and b!1300780 c!124914) b!1300785))

(assert (= (and b!1300780 (not c!124914)) b!1300775))

(assert (= (and b!1300775 c!124915) b!1300778))

(assert (= (and b!1300775 (not c!124915)) b!1300771))

(assert (= (or b!1300778 b!1300771) bm!63654))

(assert (= (or b!1300785 bm!63654) bm!63655))

(assert (= (or b!1300785 b!1300778) bm!63656))

(assert (= (or b!1300769 bm!63655) bm!63657))

(assert (= (or b!1300769 bm!63656) bm!63653))

(assert (= (and d!141567 res!864060) b!1300782))

(assert (= (and d!141567 c!124910) b!1300766))

(assert (= (and d!141567 (not c!124910)) b!1300781))

(assert (= (and d!141567 res!864065) b!1300770))

(assert (= (and b!1300770 res!864064) b!1300774))

(assert (= (and b!1300770 (not res!864066)) b!1300777))

(assert (= (and b!1300777 res!864067) b!1300765))

(assert (= (and b!1300770 res!864063) b!1300779))

(assert (= (and b!1300779 c!124911) b!1300773))

(assert (= (and b!1300779 (not c!124911)) b!1300776))

(assert (= (and b!1300773 res!864061) b!1300783))

(assert (= (or b!1300773 b!1300776) bm!63658))

(assert (= (and b!1300779 res!864062) b!1300772))

(assert (= (and b!1300772 c!124912) b!1300768))

(assert (= (and b!1300772 (not c!124912)) b!1300784))

(assert (= (and b!1300768 res!864059) b!1300767))

(assert (= (or b!1300768 b!1300784) bm!63659))

(declare-fun b_lambda!23147 () Bool)

(assert (=> (not b_lambda!23147) (not b!1300765)))

(assert (=> b!1300765 t!43260))

(declare-fun b_and!47251 () Bool)

(assert (= b_and!47249 (and (=> t!43260 result!23743) b_and!47251)))

(declare-fun m!1192247 () Bool)

(assert (=> bm!63659 m!1192247))

(declare-fun m!1192249 () Bool)

(assert (=> b!1300766 m!1192249))

(declare-fun m!1192251 () Bool)

(assert (=> b!1300766 m!1192251))

(assert (=> b!1300766 m!1192093))

(declare-fun m!1192253 () Bool)

(assert (=> b!1300766 m!1192253))

(declare-fun m!1192255 () Bool)

(assert (=> b!1300766 m!1192255))

(declare-fun m!1192257 () Bool)

(assert (=> b!1300766 m!1192257))

(declare-fun m!1192259 () Bool)

(assert (=> b!1300766 m!1192259))

(declare-fun m!1192261 () Bool)

(assert (=> b!1300766 m!1192261))

(declare-fun m!1192263 () Bool)

(assert (=> b!1300766 m!1192263))

(declare-fun m!1192265 () Bool)

(assert (=> b!1300766 m!1192265))

(assert (=> b!1300766 m!1192259))

(declare-fun m!1192267 () Bool)

(assert (=> b!1300766 m!1192267))

(declare-fun m!1192269 () Bool)

(assert (=> b!1300766 m!1192269))

(declare-fun m!1192271 () Bool)

(assert (=> b!1300766 m!1192271))

(assert (=> b!1300766 m!1192253))

(declare-fun m!1192273 () Bool)

(assert (=> b!1300766 m!1192273))

(assert (=> b!1300766 m!1192249))

(declare-fun m!1192275 () Bool)

(assert (=> b!1300766 m!1192275))

(assert (=> b!1300766 m!1192085))

(assert (=> b!1300766 m!1192265))

(declare-fun m!1192277 () Bool)

(assert (=> b!1300766 m!1192277))

(declare-fun m!1192279 () Bool)

(assert (=> b!1300769 m!1192279))

(assert (=> bm!63657 m!1192085))

(assert (=> b!1300782 m!1192093))

(assert (=> b!1300782 m!1192093))

(assert (=> b!1300782 m!1192095))

(assert (=> b!1300777 m!1192093))

(assert (=> b!1300777 m!1192093))

(declare-fun m!1192281 () Bool)

(assert (=> b!1300777 m!1192281))

(declare-fun m!1192283 () Bool)

(assert (=> bm!63653 m!1192283))

(declare-fun m!1192285 () Bool)

(assert (=> bm!63658 m!1192285))

(declare-fun m!1192287 () Bool)

(assert (=> b!1300783 m!1192287))

(assert (=> b!1300774 m!1192093))

(assert (=> b!1300774 m!1192093))

(assert (=> b!1300774 m!1192095))

(assert (=> b!1300765 m!1192207))

(assert (=> b!1300765 m!1192207))

(assert (=> b!1300765 m!1192209))

(assert (=> b!1300765 m!1192211))

(assert (=> b!1300765 m!1192209))

(assert (=> b!1300765 m!1192093))

(assert (=> b!1300765 m!1192093))

(declare-fun m!1192289 () Bool)

(assert (=> b!1300765 m!1192289))

(declare-fun m!1192291 () Bool)

(assert (=> b!1300767 m!1192291))

(assert (=> d!141567 m!1192097))

(assert (=> b!1300578 d!141567))

(declare-fun b!1300796 () Bool)

(declare-fun e!742200 () Bool)

(declare-fun call!63665 () Bool)

(assert (=> b!1300796 (= e!742200 call!63665)))

(declare-fun b!1300797 () Bool)

(declare-fun e!742202 () Bool)

(assert (=> b!1300797 (= e!742202 e!742200)))

(declare-fun c!124918 () Bool)

(assert (=> b!1300797 (= c!124918 (validKeyInArray!0 (select (arr!41801 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!63662 () Bool)

(assert (=> bm!63662 (= call!63665 (arrayNoDuplicates!0 _keys!1741 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!124918 (Cons!29690 (select (arr!41801 _keys!1741) #b00000000000000000000000000000000) Nil!29691) Nil!29691)))))

(declare-fun b!1300798 () Bool)

(declare-fun e!742199 () Bool)

(assert (=> b!1300798 (= e!742199 e!742202)))

(declare-fun res!864075 () Bool)

(assert (=> b!1300798 (=> (not res!864075) (not e!742202))))

(declare-fun e!742201 () Bool)

(assert (=> b!1300798 (= res!864075 (not e!742201))))

(declare-fun res!864076 () Bool)

(assert (=> b!1300798 (=> (not res!864076) (not e!742201))))

(assert (=> b!1300798 (= res!864076 (validKeyInArray!0 (select (arr!41801 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1300800 () Bool)

(declare-fun contains!8251 (List!29694 (_ BitVec 64)) Bool)

(assert (=> b!1300800 (= e!742201 (contains!8251 Nil!29691 (select (arr!41801 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1300799 () Bool)

(assert (=> b!1300799 (= e!742200 call!63665)))

(declare-fun d!141569 () Bool)

(declare-fun res!864074 () Bool)

(assert (=> d!141569 (=> res!864074 e!742199)))

(assert (=> d!141569 (= res!864074 (bvsge #b00000000000000000000000000000000 (size!42352 _keys!1741)))))

(assert (=> d!141569 (= (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29691) e!742199)))

(assert (= (and d!141569 (not res!864074)) b!1300798))

(assert (= (and b!1300798 res!864076) b!1300800))

(assert (= (and b!1300798 res!864075) b!1300797))

(assert (= (and b!1300797 c!124918) b!1300796))

(assert (= (and b!1300797 (not c!124918)) b!1300799))

(assert (= (or b!1300796 b!1300799) bm!63662))

(assert (=> b!1300797 m!1192227))

(assert (=> b!1300797 m!1192227))

(assert (=> b!1300797 m!1192229))

(assert (=> bm!63662 m!1192227))

(declare-fun m!1192293 () Bool)

(assert (=> bm!63662 m!1192293))

(assert (=> b!1300798 m!1192227))

(assert (=> b!1300798 m!1192227))

(assert (=> b!1300798 m!1192229))

(assert (=> b!1300800 m!1192227))

(assert (=> b!1300800 m!1192227))

(declare-fun m!1192295 () Bool)

(assert (=> b!1300800 m!1192295))

(assert (=> b!1300575 d!141569))

(declare-fun b!1300808 () Bool)

(declare-fun e!742208 () Bool)

(assert (=> b!1300808 (= e!742208 tp_is_empty!34783)))

(declare-fun mapNonEmpty!53750 () Bool)

(declare-fun mapRes!53750 () Bool)

(declare-fun tp!102569 () Bool)

(declare-fun e!742207 () Bool)

(assert (=> mapNonEmpty!53750 (= mapRes!53750 (and tp!102569 e!742207))))

(declare-fun mapRest!53750 () (Array (_ BitVec 32) ValueCell!16493))

(declare-fun mapKey!53750 () (_ BitVec 32))

(declare-fun mapValue!53750 () ValueCell!16493)

(assert (=> mapNonEmpty!53750 (= mapRest!53741 (store mapRest!53750 mapKey!53750 mapValue!53750))))

(declare-fun b!1300807 () Bool)

(assert (=> b!1300807 (= e!742207 tp_is_empty!34783)))

(declare-fun condMapEmpty!53750 () Bool)

(declare-fun mapDefault!53750 () ValueCell!16493)

(assert (=> mapNonEmpty!53741 (= condMapEmpty!53750 (= mapRest!53741 ((as const (Array (_ BitVec 32) ValueCell!16493)) mapDefault!53750)))))

(assert (=> mapNonEmpty!53741 (= tp!102554 (and e!742208 mapRes!53750))))

(declare-fun mapIsEmpty!53750 () Bool)

(assert (=> mapIsEmpty!53750 mapRes!53750))

(assert (= (and mapNonEmpty!53741 condMapEmpty!53750) mapIsEmpty!53750))

(assert (= (and mapNonEmpty!53741 (not condMapEmpty!53750)) mapNonEmpty!53750))

(assert (= (and mapNonEmpty!53750 ((_ is ValueCellFull!16493) mapValue!53750)) b!1300807))

(assert (= (and mapNonEmpty!53741 ((_ is ValueCellFull!16493) mapDefault!53750)) b!1300808))

(declare-fun m!1192297 () Bool)

(assert (=> mapNonEmpty!53750 m!1192297))

(declare-fun b_lambda!23149 () Bool)

(assert (= b_lambda!23145 (or (and start!109914 b_free!29143) b_lambda!23149)))

(declare-fun b_lambda!23151 () Bool)

(assert (= b_lambda!23143 (or (and start!109914 b_free!29143) b_lambda!23151)))

(declare-fun b_lambda!23153 () Bool)

(assert (= b_lambda!23147 (or (and start!109914 b_free!29143) b_lambda!23153)))

(check-sat (not b!1300720) (not b!1300782) (not b!1300699) (not d!141567) (not b!1300777) (not b!1300659) (not b!1300667) (not b_next!29143) (not bm!63658) (not bm!63638) (not b!1300774) (not d!141565) (not b!1300797) (not b!1300798) (not b!1300698) (not b!1300666) (not b!1300661) tp_is_empty!34783 (not b!1300701) (not bm!63662) (not mapNonEmpty!53750) (not b!1300767) (not b!1300702) (not bm!63635) (not d!141553) (not d!141549) (not b_lambda!23149) b_and!47251 (not bm!63657) (not d!141551) (not bm!63659) (not b!1300769) (not b!1300696) (not b!1300716) (not b!1300722) (not b!1300783) (not b_lambda!23151) (not d!141555) (not b!1300765) (not b!1300800) (not b!1300697) (not bm!63653) (not b!1300704) (not b!1300669) (not b!1300717) (not b!1300668) (not b_lambda!23153) (not b!1300766) (not b!1300694))
(check-sat b_and!47251 (not b_next!29143))
