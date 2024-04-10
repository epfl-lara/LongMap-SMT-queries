; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5502 () Bool)

(assert start!5502)

(declare-fun b_free!1359 () Bool)

(declare-fun b_next!1359 () Bool)

(assert (=> start!5502 (= b_free!1359 (not b_next!1359))))

(declare-fun tp!5726 () Bool)

(declare-fun b_and!2331 () Bool)

(assert (=> start!5502 (= tp!5726 b_and!2331)))

(declare-fun res!23547 () Bool)

(declare-fun e!24861 () Bool)

(assert (=> start!5502 (=> (not res!23547) (not e!24861))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5502 (= res!23547 (validMask!0 mask!853))))

(assert (=> start!5502 e!24861))

(assert (=> start!5502 true))

(assert (=> start!5502 tp!5726))

(declare-fun b!39158 () Bool)

(declare-fun e!24862 () Bool)

(assert (=> b!39158 (= e!24861 (not e!24862))))

(declare-fun res!23546 () Bool)

(assert (=> b!39158 (=> res!23546 e!24862)))

(declare-datatypes ((array!2583 0))(
  ( (array!2584 (arr!1235 (Array (_ BitVec 32) (_ BitVec 64))) (size!1357 (_ BitVec 32))) )
))
(declare-datatypes ((V!2091 0))(
  ( (V!2092 (val!913 Int)) )
))
(declare-datatypes ((ValueCell!627 0))(
  ( (ValueCellFull!627 (v!1985 V!2091)) (EmptyCell!627) )
))
(declare-datatypes ((array!2585 0))(
  ( (array!2586 (arr!1236 (Array (_ BitVec 32) ValueCell!627)) (size!1358 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!234 0))(
  ( (LongMapFixedSize!235 (defaultEntry!1795 Int) (mask!5142 (_ BitVec 32)) (extraKeys!1686 (_ BitVec 32)) (zeroValue!1713 V!2091) (minValue!1713 V!2091) (_size!166 (_ BitVec 32)) (_keys!3266 array!2583) (_values!1778 array!2585) (_vacant!166 (_ BitVec 32))) )
))
(declare-fun lt!14709 () LongMapFixedSize!234)

(declare-datatypes ((tuple2!1480 0))(
  ( (tuple2!1481 (_1!751 (_ BitVec 64)) (_2!751 V!2091)) )
))
(declare-datatypes ((List!1048 0))(
  ( (Nil!1045) (Cons!1044 (h!1615 tuple2!1480) (t!3891 List!1048)) )
))
(declare-datatypes ((ListLongMap!1057 0))(
  ( (ListLongMap!1058 (toList!544 List!1048)) )
))
(declare-fun map!685 (LongMapFixedSize!234) ListLongMap!1057)

(assert (=> b!39158 (= res!23546 (= (map!685 lt!14709) (ListLongMap!1058 Nil!1045)))))

(declare-fun lt!14713 () array!2583)

(declare-datatypes ((List!1049 0))(
  ( (Nil!1046) (Cons!1045 (h!1616 (_ BitVec 64)) (t!3892 List!1049)) )
))
(declare-fun arrayNoDuplicates!0 (array!2583 (_ BitVec 32) List!1049) Bool)

(assert (=> b!39158 (arrayNoDuplicates!0 lt!14713 #b00000000000000000000000000000000 Nil!1046)))

(declare-datatypes ((Unit!967 0))(
  ( (Unit!968) )
))
(declare-fun lt!14712 () Unit!967)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2583 (_ BitVec 32) (_ BitVec 32) List!1049) Unit!967)

(assert (=> b!39158 (= lt!14712 (lemmaArrayNoDuplicatesInAll0Array!0 lt!14713 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2583 (_ BitVec 32)) Bool)

(assert (=> b!39158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14713 mask!853)))

(declare-fun lt!14710 () Unit!967)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2583 (_ BitVec 32) (_ BitVec 32)) Unit!967)

(assert (=> b!39158 (= lt!14710 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14713 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2583 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!39158 (= (arrayCountValidKeys!0 lt!14713 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14711 () Unit!967)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2583 (_ BitVec 32) (_ BitVec 32)) Unit!967)

(assert (=> b!39158 (= lt!14711 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14713 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!14714 () V!2091)

(assert (=> b!39158 (= lt!14709 (LongMapFixedSize!235 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!14714 lt!14714 #b00000000000000000000000000000000 lt!14713 (array!2586 ((as const (Array (_ BitVec 32) ValueCell!627)) EmptyCell!627) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))

(assert (=> b!39158 (= lt!14713 (array!2584 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!188 (Int (_ BitVec 64)) V!2091)

(assert (=> b!39158 (= lt!14714 (dynLambda!188 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39159 () Bool)

(declare-fun valid!116 (LongMapFixedSize!234) Bool)

(assert (=> b!39159 (= e!24862 (valid!116 lt!14709))))

(assert (= (and start!5502 res!23547) b!39158))

(assert (= (and b!39158 (not res!23546)) b!39159))

(declare-fun b_lambda!2023 () Bool)

(assert (=> (not b_lambda!2023) (not b!39158)))

(declare-fun t!3890 () Bool)

(declare-fun tb!829 () Bool)

(assert (=> (and start!5502 (= defaultEntry!470 defaultEntry!470) t!3890) tb!829))

(declare-fun result!1421 () Bool)

(declare-fun tp_is_empty!1749 () Bool)

(assert (=> tb!829 (= result!1421 tp_is_empty!1749)))

(assert (=> b!39158 t!3890))

(declare-fun b_and!2333 () Bool)

(assert (= b_and!2331 (and (=> t!3890 result!1421) b_and!2333)))

(declare-fun m!31863 () Bool)

(assert (=> start!5502 m!31863))

(declare-fun m!31865 () Bool)

(assert (=> b!39158 m!31865))

(declare-fun m!31867 () Bool)

(assert (=> b!39158 m!31867))

(declare-fun m!31869 () Bool)

(assert (=> b!39158 m!31869))

(declare-fun m!31871 () Bool)

(assert (=> b!39158 m!31871))

(declare-fun m!31873 () Bool)

(assert (=> b!39158 m!31873))

(declare-fun m!31875 () Bool)

(assert (=> b!39158 m!31875))

(declare-fun m!31877 () Bool)

(assert (=> b!39158 m!31877))

(declare-fun m!31879 () Bool)

(assert (=> b!39158 m!31879))

(declare-fun m!31881 () Bool)

(assert (=> b!39159 m!31881))

(check-sat (not start!5502) (not b!39158) tp_is_empty!1749 b_and!2333 (not b_next!1359) (not b_lambda!2023) (not b!39159))
(check-sat b_and!2333 (not b_next!1359))
(get-model)

(declare-fun b_lambda!2031 () Bool)

(assert (= b_lambda!2023 (or (and start!5502 b_free!1359) b_lambda!2031)))

(check-sat (not b!39159) (not start!5502) tp_is_empty!1749 b_and!2333 (not b_next!1359) (not b_lambda!2031) (not b!39158))
(check-sat b_and!2333 (not b_next!1359))
(get-model)

(declare-fun d!6527 () Bool)

(assert (=> d!6527 (arrayNoDuplicates!0 lt!14713 #b00000000000000000000000000000000 Nil!1046)))

(declare-fun lt!14738 () Unit!967)

(declare-fun choose!111 (array!2583 (_ BitVec 32) (_ BitVec 32) List!1049) Unit!967)

(assert (=> d!6527 (= lt!14738 (choose!111 lt!14713 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1046))))

(assert (=> d!6527 (= (size!1357 lt!14713) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!6527 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!14713 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1046) lt!14738)))

(declare-fun bs!1628 () Bool)

(assert (= bs!1628 d!6527))

(assert (=> bs!1628 m!31877))

(declare-fun m!31921 () Bool)

(assert (=> bs!1628 m!31921))

(assert (=> b!39158 d!6527))

(declare-fun d!6533 () Bool)

(assert (=> d!6533 (= (arrayCountValidKeys!0 lt!14713 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14743 () Unit!967)

(declare-fun choose!59 (array!2583 (_ BitVec 32) (_ BitVec 32)) Unit!967)

(assert (=> d!6533 (= lt!14743 (choose!59 lt!14713 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6533 (bvslt (size!1357 lt!14713) #b01111111111111111111111111111111)))

(assert (=> d!6533 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14713 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14743)))

(declare-fun bs!1629 () Bool)

(assert (= bs!1629 d!6533))

(assert (=> bs!1629 m!31865))

(declare-fun m!31923 () Bool)

(assert (=> bs!1629 m!31923))

(assert (=> b!39158 d!6533))

(declare-fun b!39210 () Bool)

(declare-fun e!24896 () Bool)

(declare-fun call!2971 () Bool)

(assert (=> b!39210 (= e!24896 call!2971)))

(declare-fun b!39211 () Bool)

(declare-fun e!24898 () Bool)

(assert (=> b!39211 (= e!24898 call!2971)))

(declare-fun bm!2968 () Bool)

(assert (=> bm!2968 (= call!2971 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14713 mask!853))))

(declare-fun b!39212 () Bool)

(declare-fun e!24897 () Bool)

(assert (=> b!39212 (= e!24897 e!24896)))

(declare-fun c!4603 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!39212 (= c!4603 (validKeyInArray!0 (select (arr!1235 lt!14713) #b00000000000000000000000000000000)))))

(declare-fun b!39213 () Bool)

(assert (=> b!39213 (= e!24896 e!24898)))

(declare-fun lt!14761 () (_ BitVec 64))

(assert (=> b!39213 (= lt!14761 (select (arr!1235 lt!14713) #b00000000000000000000000000000000))))

(declare-fun lt!14762 () Unit!967)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2583 (_ BitVec 64) (_ BitVec 32)) Unit!967)

(assert (=> b!39213 (= lt!14762 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14713 lt!14761 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2583 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!39213 (arrayContainsKey!0 lt!14713 lt!14761 #b00000000000000000000000000000000)))

(declare-fun lt!14760 () Unit!967)

(assert (=> b!39213 (= lt!14760 lt!14762)))

(declare-fun res!23580 () Bool)

(declare-datatypes ((SeekEntryResult!170 0))(
  ( (MissingZero!170 (index!2802 (_ BitVec 32))) (Found!170 (index!2803 (_ BitVec 32))) (Intermediate!170 (undefined!982 Bool) (index!2804 (_ BitVec 32)) (x!7656 (_ BitVec 32))) (Undefined!170) (MissingVacant!170 (index!2805 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2583 (_ BitVec 32)) SeekEntryResult!170)

(assert (=> b!39213 (= res!23580 (= (seekEntryOrOpen!0 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) lt!14713 mask!853) (Found!170 #b00000000000000000000000000000000)))))

(assert (=> b!39213 (=> (not res!23580) (not e!24898))))

(declare-fun d!6535 () Bool)

(declare-fun res!23581 () Bool)

(assert (=> d!6535 (=> res!23581 e!24897)))

(assert (=> d!6535 (= res!23581 (bvsge #b00000000000000000000000000000000 (size!1357 lt!14713)))))

(assert (=> d!6535 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14713 mask!853) e!24897)))

(assert (= (and d!6535 (not res!23581)) b!39212))

(assert (= (and b!39212 c!4603) b!39213))

(assert (= (and b!39212 (not c!4603)) b!39210))

(assert (= (and b!39213 res!23580) b!39211))

(assert (= (or b!39211 b!39210) bm!2968))

(declare-fun m!31929 () Bool)

(assert (=> bm!2968 m!31929))

(declare-fun m!31931 () Bool)

(assert (=> b!39212 m!31931))

(assert (=> b!39212 m!31931))

(declare-fun m!31933 () Bool)

(assert (=> b!39212 m!31933))

(assert (=> b!39213 m!31931))

(declare-fun m!31935 () Bool)

(assert (=> b!39213 m!31935))

(declare-fun m!31937 () Bool)

(assert (=> b!39213 m!31937))

(assert (=> b!39213 m!31931))

(declare-fun m!31939 () Bool)

(assert (=> b!39213 m!31939))

(assert (=> b!39158 d!6535))

(declare-fun d!6543 () Bool)

(declare-fun getCurrentListMap!309 (array!2583 array!2585 (_ BitVec 32) (_ BitVec 32) V!2091 V!2091 (_ BitVec 32) Int) ListLongMap!1057)

(assert (=> d!6543 (= (map!685 lt!14709) (getCurrentListMap!309 (_keys!3266 lt!14709) (_values!1778 lt!14709) (mask!5142 lt!14709) (extraKeys!1686 lt!14709) (zeroValue!1713 lt!14709) (minValue!1713 lt!14709) #b00000000000000000000000000000000 (defaultEntry!1795 lt!14709)))))

(declare-fun bs!1633 () Bool)

(assert (= bs!1633 d!6543))

(declare-fun m!31955 () Bool)

(assert (=> bs!1633 m!31955))

(assert (=> b!39158 d!6543))

(declare-fun d!6549 () Bool)

(declare-fun res!23591 () Bool)

(declare-fun e!24918 () Bool)

(assert (=> d!6549 (=> res!23591 e!24918)))

(assert (=> d!6549 (= res!23591 (bvsge #b00000000000000000000000000000000 (size!1357 lt!14713)))))

(assert (=> d!6549 (= (arrayNoDuplicates!0 lt!14713 #b00000000000000000000000000000000 Nil!1046) e!24918)))

(declare-fun b!39240 () Bool)

(declare-fun e!24916 () Bool)

(declare-fun e!24919 () Bool)

(assert (=> b!39240 (= e!24916 e!24919)))

(declare-fun c!4613 () Bool)

(assert (=> b!39240 (= c!4613 (validKeyInArray!0 (select (arr!1235 lt!14713) #b00000000000000000000000000000000)))))

(declare-fun b!39241 () Bool)

(declare-fun call!2978 () Bool)

(assert (=> b!39241 (= e!24919 call!2978)))

(declare-fun b!39242 () Bool)

(assert (=> b!39242 (= e!24918 e!24916)))

(declare-fun res!23592 () Bool)

(assert (=> b!39242 (=> (not res!23592) (not e!24916))))

(declare-fun e!24917 () Bool)

(assert (=> b!39242 (= res!23592 (not e!24917))))

(declare-fun res!23590 () Bool)

(assert (=> b!39242 (=> (not res!23590) (not e!24917))))

(assert (=> b!39242 (= res!23590 (validKeyInArray!0 (select (arr!1235 lt!14713) #b00000000000000000000000000000000)))))

(declare-fun bm!2975 () Bool)

(assert (=> bm!2975 (= call!2978 (arrayNoDuplicates!0 lt!14713 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4613 (Cons!1045 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) Nil!1046) Nil!1046)))))

(declare-fun b!39243 () Bool)

(assert (=> b!39243 (= e!24919 call!2978)))

(declare-fun b!39244 () Bool)

(declare-fun contains!505 (List!1049 (_ BitVec 64)) Bool)

(assert (=> b!39244 (= e!24917 (contains!505 Nil!1046 (select (arr!1235 lt!14713) #b00000000000000000000000000000000)))))

(assert (= (and d!6549 (not res!23591)) b!39242))

(assert (= (and b!39242 res!23590) b!39244))

(assert (= (and b!39242 res!23592) b!39240))

(assert (= (and b!39240 c!4613) b!39243))

(assert (= (and b!39240 (not c!4613)) b!39241))

(assert (= (or b!39243 b!39241) bm!2975))

(assert (=> b!39240 m!31931))

(assert (=> b!39240 m!31931))

(assert (=> b!39240 m!31933))

(assert (=> b!39242 m!31931))

(assert (=> b!39242 m!31931))

(assert (=> b!39242 m!31933))

(assert (=> bm!2975 m!31931))

(declare-fun m!31963 () Bool)

(assert (=> bm!2975 m!31963))

(assert (=> b!39244 m!31931))

(assert (=> b!39244 m!31931))

(declare-fun m!31965 () Bool)

(assert (=> b!39244 m!31965))

(assert (=> b!39158 d!6549))

(declare-fun b!39280 () Bool)

(declare-fun e!24945 () (_ BitVec 32))

(declare-fun call!2987 () (_ BitVec 32))

(assert (=> b!39280 (= e!24945 call!2987)))

(declare-fun b!39281 () Bool)

(declare-fun e!24946 () (_ BitVec 32))

(assert (=> b!39281 (= e!24946 e!24945)))

(declare-fun c!4625 () Bool)

(assert (=> b!39281 (= c!4625 (validKeyInArray!0 (select (arr!1235 lt!14713) #b00000000000000000000000000000000)))))

(declare-fun b!39282 () Bool)

(assert (=> b!39282 (= e!24945 (bvadd #b00000000000000000000000000000001 call!2987))))

(declare-fun d!6557 () Bool)

(declare-fun lt!14783 () (_ BitVec 32))

(assert (=> d!6557 (and (bvsge lt!14783 #b00000000000000000000000000000000) (bvsle lt!14783 (bvsub (size!1357 lt!14713) #b00000000000000000000000000000000)))))

(assert (=> d!6557 (= lt!14783 e!24946)))

(declare-fun c!4624 () Bool)

(assert (=> d!6557 (= c!4624 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6557 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1357 lt!14713)))))

(assert (=> d!6557 (= (arrayCountValidKeys!0 lt!14713 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!14783)))

(declare-fun bm!2984 () Bool)

(assert (=> bm!2984 (= call!2987 (arrayCountValidKeys!0 lt!14713 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!39283 () Bool)

(assert (=> b!39283 (= e!24946 #b00000000000000000000000000000000)))

(assert (= (and d!6557 c!4624) b!39283))

(assert (= (and d!6557 (not c!4624)) b!39281))

(assert (= (and b!39281 c!4625) b!39282))

(assert (= (and b!39281 (not c!4625)) b!39280))

(assert (= (or b!39282 b!39280) bm!2984))

(assert (=> b!39281 m!31931))

(assert (=> b!39281 m!31931))

(assert (=> b!39281 m!31933))

(declare-fun m!31979 () Bool)

(assert (=> bm!2984 m!31979))

(assert (=> b!39158 d!6557))

(declare-fun d!6563 () Bool)

(assert (=> d!6563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14713 mask!853)))

(declare-fun lt!14789 () Unit!967)

(declare-fun choose!34 (array!2583 (_ BitVec 32) (_ BitVec 32)) Unit!967)

(assert (=> d!6563 (= lt!14789 (choose!34 lt!14713 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!6563 (validMask!0 mask!853)))

(assert (=> d!6563 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14713 mask!853 #b00000000000000000000000000000000) lt!14789)))

(declare-fun bs!1636 () Bool)

(assert (= bs!1636 d!6563))

(assert (=> bs!1636 m!31873))

(declare-fun m!31991 () Bool)

(assert (=> bs!1636 m!31991))

(assert (=> bs!1636 m!31863))

(assert (=> b!39158 d!6563))

(declare-fun d!6569 () Bool)

(declare-fun res!23623 () Bool)

(declare-fun e!24958 () Bool)

(assert (=> d!6569 (=> (not res!23623) (not e!24958))))

(declare-fun simpleValid!25 (LongMapFixedSize!234) Bool)

(assert (=> d!6569 (= res!23623 (simpleValid!25 lt!14709))))

(assert (=> d!6569 (= (valid!116 lt!14709) e!24958)))

(declare-fun b!39311 () Bool)

(declare-fun res!23624 () Bool)

(assert (=> b!39311 (=> (not res!23624) (not e!24958))))

(assert (=> b!39311 (= res!23624 (= (arrayCountValidKeys!0 (_keys!3266 lt!14709) #b00000000000000000000000000000000 (size!1357 (_keys!3266 lt!14709))) (_size!166 lt!14709)))))

(declare-fun b!39312 () Bool)

(declare-fun res!23625 () Bool)

(assert (=> b!39312 (=> (not res!23625) (not e!24958))))

(assert (=> b!39312 (= res!23625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3266 lt!14709) (mask!5142 lt!14709)))))

(declare-fun b!39313 () Bool)

(assert (=> b!39313 (= e!24958 (arrayNoDuplicates!0 (_keys!3266 lt!14709) #b00000000000000000000000000000000 Nil!1046))))

(assert (= (and d!6569 res!23623) b!39311))

(assert (= (and b!39311 res!23624) b!39312))

(assert (= (and b!39312 res!23625) b!39313))

(declare-fun m!31997 () Bool)

(assert (=> d!6569 m!31997))

(declare-fun m!31999 () Bool)

(assert (=> b!39311 m!31999))

(declare-fun m!32001 () Bool)

(assert (=> b!39312 m!32001))

(declare-fun m!32003 () Bool)

(assert (=> b!39313 m!32003))

(assert (=> b!39159 d!6569))

(declare-fun d!6573 () Bool)

(assert (=> d!6573 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!5502 d!6573))

(check-sat (not d!6563) (not b!39242) (not b!39212) (not b!39213) (not d!6533) (not b_lambda!2031) (not b!39312) tp_is_empty!1749 (not b!39240) (not d!6527) (not b_next!1359) (not b!39244) (not b!39313) (not d!6569) (not b!39311) (not bm!2968) (not bm!2984) (not bm!2975) b_and!2333 (not b!39281) (not d!6543))
(check-sat b_and!2333 (not b_next!1359))
(get-model)

(declare-fun b!39322 () Bool)

(declare-fun e!24965 () (_ BitVec 32))

(declare-fun call!2993 () (_ BitVec 32))

(assert (=> b!39322 (= e!24965 call!2993)))

(declare-fun b!39323 () Bool)

(declare-fun e!24966 () (_ BitVec 32))

(assert (=> b!39323 (= e!24966 e!24965)))

(declare-fun c!4635 () Bool)

(assert (=> b!39323 (= c!4635 (validKeyInArray!0 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39324 () Bool)

(assert (=> b!39324 (= e!24965 (bvadd #b00000000000000000000000000000001 call!2993))))

(declare-fun d!6583 () Bool)

(declare-fun lt!14802 () (_ BitVec 32))

(assert (=> d!6583 (and (bvsge lt!14802 #b00000000000000000000000000000000) (bvsle lt!14802 (bvsub (size!1357 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!6583 (= lt!14802 e!24966)))

(declare-fun c!4634 () Bool)

(assert (=> d!6583 (= c!4634 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6583 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1357 lt!14713)))))

(assert (=> d!6583 (= (arrayCountValidKeys!0 lt!14713 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!14802)))

(declare-fun bm!2990 () Bool)

(assert (=> bm!2990 (= call!2993 (arrayCountValidKeys!0 lt!14713 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!39325 () Bool)

(assert (=> b!39325 (= e!24966 #b00000000000000000000000000000000)))

(assert (= (and d!6583 c!4634) b!39325))

(assert (= (and d!6583 (not c!4634)) b!39323))

(assert (= (and b!39323 c!4635) b!39324))

(assert (= (and b!39323 (not c!4635)) b!39322))

(assert (= (or b!39324 b!39322) bm!2990))

(declare-fun m!32029 () Bool)

(assert (=> b!39323 m!32029))

(assert (=> b!39323 m!32029))

(declare-fun m!32031 () Bool)

(assert (=> b!39323 m!32031))

(declare-fun m!32033 () Bool)

(assert (=> bm!2990 m!32033))

(assert (=> bm!2984 d!6583))

(assert (=> d!6527 d!6549))

(declare-fun d!6587 () Bool)

(assert (=> d!6587 (arrayNoDuplicates!0 lt!14713 #b00000000000000000000000000000000 Nil!1046)))

(assert (=> d!6587 true))

(declare-fun res!23635 () Unit!967)

(assert (=> d!6587 (= (choose!111 lt!14713 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1046) res!23635)))

(declare-fun bs!1641 () Bool)

(assert (= bs!1641 d!6587))

(assert (=> bs!1641 m!31877))

(assert (=> d!6527 d!6587))

(declare-fun d!6593 () Bool)

(assert (=> d!6593 (= (validKeyInArray!0 (select (arr!1235 lt!14713) #b00000000000000000000000000000000)) (and (not (= (select (arr!1235 lt!14713) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1235 lt!14713) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39240 d!6593))

(assert (=> d!6563 d!6535))

(declare-fun d!6595 () Bool)

(assert (=> d!6595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14713 mask!853)))

(assert (=> d!6595 true))

(declare-fun _$30!45 () Unit!967)

(assert (=> d!6595 (= (choose!34 lt!14713 mask!853 #b00000000000000000000000000000000) _$30!45)))

(declare-fun bs!1642 () Bool)

(assert (= bs!1642 d!6595))

(assert (=> bs!1642 m!31873))

(assert (=> d!6563 d!6595))

(assert (=> d!6563 d!6573))

(declare-fun b!39360 () Bool)

(declare-fun e!24982 () Bool)

(assert (=> b!39360 (= e!24982 (and (bvsge (extraKeys!1686 lt!14709) #b00000000000000000000000000000000) (bvsle (extraKeys!1686 lt!14709) #b00000000000000000000000000000011) (bvsge (_vacant!166 lt!14709) #b00000000000000000000000000000000)))))

(declare-fun b!39358 () Bool)

(declare-fun res!23665 () Bool)

(assert (=> b!39358 (=> (not res!23665) (not e!24982))))

(declare-fun size!1374 (LongMapFixedSize!234) (_ BitVec 32))

(assert (=> b!39358 (= res!23665 (bvsge (size!1374 lt!14709) (_size!166 lt!14709)))))

(declare-fun b!39359 () Bool)

(declare-fun res!23664 () Bool)

(assert (=> b!39359 (=> (not res!23664) (not e!24982))))

(assert (=> b!39359 (= res!23664 (= (size!1374 lt!14709) (bvadd (_size!166 lt!14709) (bvsdiv (bvadd (extraKeys!1686 lt!14709) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!6599 () Bool)

(declare-fun res!23662 () Bool)

(assert (=> d!6599 (=> (not res!23662) (not e!24982))))

(assert (=> d!6599 (= res!23662 (validMask!0 (mask!5142 lt!14709)))))

(assert (=> d!6599 (= (simpleValid!25 lt!14709) e!24982)))

(declare-fun b!39357 () Bool)

(declare-fun res!23663 () Bool)

(assert (=> b!39357 (=> (not res!23663) (not e!24982))))

(assert (=> b!39357 (= res!23663 (and (= (size!1358 (_values!1778 lt!14709)) (bvadd (mask!5142 lt!14709) #b00000000000000000000000000000001)) (= (size!1357 (_keys!3266 lt!14709)) (size!1358 (_values!1778 lt!14709))) (bvsge (_size!166 lt!14709) #b00000000000000000000000000000000) (bvsle (_size!166 lt!14709) (bvadd (mask!5142 lt!14709) #b00000000000000000000000000000001))))))

(assert (= (and d!6599 res!23662) b!39357))

(assert (= (and b!39357 res!23663) b!39358))

(assert (= (and b!39358 res!23665) b!39359))

(assert (= (and b!39359 res!23664) b!39360))

(declare-fun m!32047 () Bool)

(assert (=> b!39358 m!32047))

(assert (=> b!39359 m!32047))

(declare-fun m!32049 () Bool)

(assert (=> d!6599 m!32049))

(assert (=> d!6569 d!6599))

(assert (=> b!39281 d!6593))

(declare-fun b!39517 () Bool)

(declare-fun c!4680 () Bool)

(assert (=> b!39517 (= c!4680 (and (not (= (bvand (extraKeys!1686 lt!14709) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1686 lt!14709) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!25085 () ListLongMap!1057)

(declare-fun e!25088 () ListLongMap!1057)

(assert (=> b!39517 (= e!25085 e!25088)))

(declare-fun call!3034 () ListLongMap!1057)

(declare-fun call!3033 () ListLongMap!1057)

(declare-fun bm!3027 () Bool)

(declare-fun call!3030 () ListLongMap!1057)

(declare-fun c!4683 () Bool)

(declare-fun c!4684 () Bool)

(declare-fun call!3032 () ListLongMap!1057)

(declare-fun +!61 (ListLongMap!1057 tuple2!1480) ListLongMap!1057)

(assert (=> bm!3027 (= call!3033 (+!61 (ite c!4684 call!3034 (ite c!4683 call!3030 call!3032)) (ite (or c!4684 c!4683) (tuple2!1481 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1713 lt!14709)) (tuple2!1481 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1713 lt!14709)))))))

(declare-fun bm!3028 () Bool)

(declare-fun call!3031 () Bool)

(declare-fun lt!14920 () ListLongMap!1057)

(declare-fun contains!506 (ListLongMap!1057 (_ BitVec 64)) Bool)

(assert (=> bm!3028 (= call!3031 (contains!506 lt!14920 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!3029 () Bool)

(declare-fun call!3036 () ListLongMap!1057)

(assert (=> bm!3029 (= call!3036 call!3033)))

(declare-fun b!39518 () Bool)

(declare-fun e!25087 () Bool)

(declare-fun e!25083 () Bool)

(assert (=> b!39518 (= e!25087 e!25083)))

(declare-fun res!23746 () Bool)

(assert (=> b!39518 (= res!23746 call!3031)))

(assert (=> b!39518 (=> (not res!23746) (not e!25083))))

(declare-fun b!39519 () Bool)

(assert (=> b!39519 (= e!25087 (not call!3031))))

(declare-fun b!39520 () Bool)

(declare-fun e!25084 () Bool)

(assert (=> b!39520 (= e!25084 (validKeyInArray!0 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)))))

(declare-fun b!39522 () Bool)

(declare-fun e!25080 () ListLongMap!1057)

(assert (=> b!39522 (= e!25080 (+!61 call!3033 (tuple2!1481 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1713 lt!14709))))))

(declare-fun b!39523 () Bool)

(declare-fun e!25091 () Bool)

(declare-fun e!25089 () Bool)

(assert (=> b!39523 (= e!25091 e!25089)))

(declare-fun res!23747 () Bool)

(assert (=> b!39523 (=> (not res!23747) (not e!25089))))

(assert (=> b!39523 (= res!23747 (contains!506 lt!14920 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)))))

(assert (=> b!39523 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1357 (_keys!3266 lt!14709))))))

(declare-fun b!39524 () Bool)

(assert (=> b!39524 (= e!25088 call!3036)))

(declare-fun bm!3030 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!30 (array!2583 array!2585 (_ BitVec 32) (_ BitVec 32) V!2091 V!2091 (_ BitVec 32) Int) ListLongMap!1057)

(assert (=> bm!3030 (= call!3034 (getCurrentListMapNoExtraKeys!30 (_keys!3266 lt!14709) (_values!1778 lt!14709) (mask!5142 lt!14709) (extraKeys!1686 lt!14709) (zeroValue!1713 lt!14709) (minValue!1713 lt!14709) #b00000000000000000000000000000000 (defaultEntry!1795 lt!14709)))))

(declare-fun b!39525 () Bool)

(declare-fun e!25082 () Bool)

(assert (=> b!39525 (= e!25082 (validKeyInArray!0 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)))))

(declare-fun b!39526 () Bool)

(declare-fun e!25090 () Unit!967)

(declare-fun lt!14934 () Unit!967)

(assert (=> b!39526 (= e!25090 lt!14934)))

(declare-fun lt!14930 () ListLongMap!1057)

(assert (=> b!39526 (= lt!14930 (getCurrentListMapNoExtraKeys!30 (_keys!3266 lt!14709) (_values!1778 lt!14709) (mask!5142 lt!14709) (extraKeys!1686 lt!14709) (zeroValue!1713 lt!14709) (minValue!1713 lt!14709) #b00000000000000000000000000000000 (defaultEntry!1795 lt!14709)))))

(declare-fun lt!14935 () (_ BitVec 64))

(assert (=> b!39526 (= lt!14935 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14922 () (_ BitVec 64))

(assert (=> b!39526 (= lt!14922 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000))))

(declare-fun lt!14925 () Unit!967)

(declare-fun addStillContains!28 (ListLongMap!1057 (_ BitVec 64) V!2091 (_ BitVec 64)) Unit!967)

(assert (=> b!39526 (= lt!14925 (addStillContains!28 lt!14930 lt!14935 (zeroValue!1713 lt!14709) lt!14922))))

(assert (=> b!39526 (contains!506 (+!61 lt!14930 (tuple2!1481 lt!14935 (zeroValue!1713 lt!14709))) lt!14922)))

(declare-fun lt!14919 () Unit!967)

(assert (=> b!39526 (= lt!14919 lt!14925)))

(declare-fun lt!14938 () ListLongMap!1057)

(assert (=> b!39526 (= lt!14938 (getCurrentListMapNoExtraKeys!30 (_keys!3266 lt!14709) (_values!1778 lt!14709) (mask!5142 lt!14709) (extraKeys!1686 lt!14709) (zeroValue!1713 lt!14709) (minValue!1713 lt!14709) #b00000000000000000000000000000000 (defaultEntry!1795 lt!14709)))))

(declare-fun lt!14918 () (_ BitVec 64))

(assert (=> b!39526 (= lt!14918 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14937 () (_ BitVec 64))

(assert (=> b!39526 (= lt!14937 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000))))

(declare-fun lt!14936 () Unit!967)

(declare-fun addApplyDifferent!28 (ListLongMap!1057 (_ BitVec 64) V!2091 (_ BitVec 64)) Unit!967)

(assert (=> b!39526 (= lt!14936 (addApplyDifferent!28 lt!14938 lt!14918 (minValue!1713 lt!14709) lt!14937))))

(declare-fun apply!52 (ListLongMap!1057 (_ BitVec 64)) V!2091)

(assert (=> b!39526 (= (apply!52 (+!61 lt!14938 (tuple2!1481 lt!14918 (minValue!1713 lt!14709))) lt!14937) (apply!52 lt!14938 lt!14937))))

(declare-fun lt!14928 () Unit!967)

(assert (=> b!39526 (= lt!14928 lt!14936)))

(declare-fun lt!14931 () ListLongMap!1057)

(assert (=> b!39526 (= lt!14931 (getCurrentListMapNoExtraKeys!30 (_keys!3266 lt!14709) (_values!1778 lt!14709) (mask!5142 lt!14709) (extraKeys!1686 lt!14709) (zeroValue!1713 lt!14709) (minValue!1713 lt!14709) #b00000000000000000000000000000000 (defaultEntry!1795 lt!14709)))))

(declare-fun lt!14929 () (_ BitVec 64))

(assert (=> b!39526 (= lt!14929 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14923 () (_ BitVec 64))

(assert (=> b!39526 (= lt!14923 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000))))

(declare-fun lt!14939 () Unit!967)

(assert (=> b!39526 (= lt!14939 (addApplyDifferent!28 lt!14931 lt!14929 (zeroValue!1713 lt!14709) lt!14923))))

(assert (=> b!39526 (= (apply!52 (+!61 lt!14931 (tuple2!1481 lt!14929 (zeroValue!1713 lt!14709))) lt!14923) (apply!52 lt!14931 lt!14923))))

(declare-fun lt!14926 () Unit!967)

(assert (=> b!39526 (= lt!14926 lt!14939)))

(declare-fun lt!14932 () ListLongMap!1057)

(assert (=> b!39526 (= lt!14932 (getCurrentListMapNoExtraKeys!30 (_keys!3266 lt!14709) (_values!1778 lt!14709) (mask!5142 lt!14709) (extraKeys!1686 lt!14709) (zeroValue!1713 lt!14709) (minValue!1713 lt!14709) #b00000000000000000000000000000000 (defaultEntry!1795 lt!14709)))))

(declare-fun lt!14933 () (_ BitVec 64))

(assert (=> b!39526 (= lt!14933 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14921 () (_ BitVec 64))

(assert (=> b!39526 (= lt!14921 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000))))

(assert (=> b!39526 (= lt!14934 (addApplyDifferent!28 lt!14932 lt!14933 (minValue!1713 lt!14709) lt!14921))))

(assert (=> b!39526 (= (apply!52 (+!61 lt!14932 (tuple2!1481 lt!14933 (minValue!1713 lt!14709))) lt!14921) (apply!52 lt!14932 lt!14921))))

(declare-fun b!39527 () Bool)

(declare-fun e!25086 () Bool)

(declare-fun e!25079 () Bool)

(assert (=> b!39527 (= e!25086 e!25079)))

(declare-fun res!23743 () Bool)

(declare-fun call!3035 () Bool)

(assert (=> b!39527 (= res!23743 call!3035)))

(assert (=> b!39527 (=> (not res!23743) (not e!25079))))

(declare-fun bm!3031 () Bool)

(assert (=> bm!3031 (= call!3030 call!3034)))

(declare-fun b!39528 () Bool)

(assert (=> b!39528 (= e!25083 (= (apply!52 lt!14920 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1713 lt!14709)))))

(declare-fun b!39529 () Bool)

(declare-fun get!689 (ValueCell!627 V!2091) V!2091)

(assert (=> b!39529 (= e!25089 (= (apply!52 lt!14920 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)) (get!689 (select (arr!1236 (_values!1778 lt!14709)) #b00000000000000000000000000000000) (dynLambda!188 (defaultEntry!1795 lt!14709) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39529 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1358 (_values!1778 lt!14709))))))

(assert (=> b!39529 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1357 (_keys!3266 lt!14709))))))

(declare-fun b!39530 () Bool)

(assert (=> b!39530 (= e!25085 call!3036)))

(declare-fun bm!3032 () Bool)

(assert (=> bm!3032 (= call!3032 call!3030)))

(declare-fun b!39531 () Bool)

(declare-fun Unit!971 () Unit!967)

(assert (=> b!39531 (= e!25090 Unit!971)))

(declare-fun b!39532 () Bool)

(assert (=> b!39532 (= e!25079 (= (apply!52 lt!14920 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1713 lt!14709)))))

(declare-fun b!39533 () Bool)

(assert (=> b!39533 (= e!25088 call!3032)))

(declare-fun bm!3033 () Bool)

(assert (=> bm!3033 (= call!3035 (contains!506 lt!14920 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39534 () Bool)

(declare-fun res!23750 () Bool)

(declare-fun e!25081 () Bool)

(assert (=> b!39534 (=> (not res!23750) (not e!25081))))

(assert (=> b!39534 (= res!23750 e!25087)))

(declare-fun c!4682 () Bool)

(assert (=> b!39534 (= c!4682 (not (= (bvand (extraKeys!1686 lt!14709) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!39535 () Bool)

(declare-fun res!23745 () Bool)

(assert (=> b!39535 (=> (not res!23745) (not e!25081))))

(assert (=> b!39535 (= res!23745 e!25091)))

(declare-fun res!23748 () Bool)

(assert (=> b!39535 (=> res!23748 e!25091)))

(assert (=> b!39535 (= res!23748 (not e!25082))))

(declare-fun res!23742 () Bool)

(assert (=> b!39535 (=> (not res!23742) (not e!25082))))

(assert (=> b!39535 (= res!23742 (bvslt #b00000000000000000000000000000000 (size!1357 (_keys!3266 lt!14709))))))

(declare-fun b!39521 () Bool)

(assert (=> b!39521 (= e!25086 (not call!3035))))

(declare-fun d!6605 () Bool)

(assert (=> d!6605 e!25081))

(declare-fun res!23749 () Bool)

(assert (=> d!6605 (=> (not res!23749) (not e!25081))))

(assert (=> d!6605 (= res!23749 (or (bvsge #b00000000000000000000000000000000 (size!1357 (_keys!3266 lt!14709))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1357 (_keys!3266 lt!14709))))))))

(declare-fun lt!14924 () ListLongMap!1057)

(assert (=> d!6605 (= lt!14920 lt!14924)))

(declare-fun lt!14927 () Unit!967)

(assert (=> d!6605 (= lt!14927 e!25090)))

(declare-fun c!4685 () Bool)

(assert (=> d!6605 (= c!4685 e!25084)))

(declare-fun res!23744 () Bool)

(assert (=> d!6605 (=> (not res!23744) (not e!25084))))

(assert (=> d!6605 (= res!23744 (bvslt #b00000000000000000000000000000000 (size!1357 (_keys!3266 lt!14709))))))

(assert (=> d!6605 (= lt!14924 e!25080)))

(assert (=> d!6605 (= c!4684 (and (not (= (bvand (extraKeys!1686 lt!14709) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1686 lt!14709) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!6605 (validMask!0 (mask!5142 lt!14709))))

(assert (=> d!6605 (= (getCurrentListMap!309 (_keys!3266 lt!14709) (_values!1778 lt!14709) (mask!5142 lt!14709) (extraKeys!1686 lt!14709) (zeroValue!1713 lt!14709) (minValue!1713 lt!14709) #b00000000000000000000000000000000 (defaultEntry!1795 lt!14709)) lt!14920)))

(declare-fun b!39536 () Bool)

(assert (=> b!39536 (= e!25080 e!25085)))

(assert (=> b!39536 (= c!4683 (and (not (= (bvand (extraKeys!1686 lt!14709) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1686 lt!14709) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!39537 () Bool)

(assert (=> b!39537 (= e!25081 e!25086)))

(declare-fun c!4681 () Bool)

(assert (=> b!39537 (= c!4681 (not (= (bvand (extraKeys!1686 lt!14709) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!6605 c!4684) b!39522))

(assert (= (and d!6605 (not c!4684)) b!39536))

(assert (= (and b!39536 c!4683) b!39530))

(assert (= (and b!39536 (not c!4683)) b!39517))

(assert (= (and b!39517 c!4680) b!39524))

(assert (= (and b!39517 (not c!4680)) b!39533))

(assert (= (or b!39524 b!39533) bm!3032))

(assert (= (or b!39530 bm!3032) bm!3031))

(assert (= (or b!39530 b!39524) bm!3029))

(assert (= (or b!39522 bm!3031) bm!3030))

(assert (= (or b!39522 bm!3029) bm!3027))

(assert (= (and d!6605 res!23744) b!39520))

(assert (= (and d!6605 c!4685) b!39526))

(assert (= (and d!6605 (not c!4685)) b!39531))

(assert (= (and d!6605 res!23749) b!39535))

(assert (= (and b!39535 res!23742) b!39525))

(assert (= (and b!39535 (not res!23748)) b!39523))

(assert (= (and b!39523 res!23747) b!39529))

(assert (= (and b!39535 res!23745) b!39534))

(assert (= (and b!39534 c!4682) b!39518))

(assert (= (and b!39534 (not c!4682)) b!39519))

(assert (= (and b!39518 res!23746) b!39528))

(assert (= (or b!39518 b!39519) bm!3028))

(assert (= (and b!39534 res!23750) b!39537))

(assert (= (and b!39537 c!4681) b!39527))

(assert (= (and b!39537 (not c!4681)) b!39521))

(assert (= (and b!39527 res!23743) b!39532))

(assert (= (or b!39527 b!39521) bm!3033))

(declare-fun b_lambda!2033 () Bool)

(assert (=> (not b_lambda!2033) (not b!39529)))

(declare-fun tb!833 () Bool)

(declare-fun t!3898 () Bool)

(assert (=> (and start!5502 (= defaultEntry!470 (defaultEntry!1795 lt!14709)) t!3898) tb!833))

(declare-fun result!1429 () Bool)

(assert (=> tb!833 (= result!1429 tp_is_empty!1749)))

(assert (=> b!39529 t!3898))

(declare-fun b_and!2339 () Bool)

(assert (= b_and!2333 (and (=> t!3898 result!1429) b_and!2339)))

(declare-fun m!32119 () Bool)

(assert (=> b!39529 m!32119))

(declare-fun m!32121 () Bool)

(assert (=> b!39529 m!32121))

(declare-fun m!32123 () Bool)

(assert (=> b!39529 m!32123))

(declare-fun m!32125 () Bool)

(assert (=> b!39529 m!32125))

(assert (=> b!39529 m!32119))

(assert (=> b!39529 m!32121))

(declare-fun m!32127 () Bool)

(assert (=> b!39529 m!32127))

(assert (=> b!39529 m!32123))

(declare-fun m!32129 () Bool)

(assert (=> bm!3027 m!32129))

(declare-fun m!32131 () Bool)

(assert (=> bm!3033 m!32131))

(declare-fun m!32133 () Bool)

(assert (=> bm!3028 m!32133))

(assert (=> d!6605 m!32049))

(declare-fun m!32135 () Bool)

(assert (=> b!39528 m!32135))

(declare-fun m!32137 () Bool)

(assert (=> b!39526 m!32137))

(declare-fun m!32139 () Bool)

(assert (=> b!39526 m!32139))

(declare-fun m!32141 () Bool)

(assert (=> b!39526 m!32141))

(declare-fun m!32143 () Bool)

(assert (=> b!39526 m!32143))

(declare-fun m!32145 () Bool)

(assert (=> b!39526 m!32145))

(declare-fun m!32147 () Bool)

(assert (=> b!39526 m!32147))

(declare-fun m!32149 () Bool)

(assert (=> b!39526 m!32149))

(declare-fun m!32151 () Bool)

(assert (=> b!39526 m!32151))

(assert (=> b!39526 m!32149))

(assert (=> b!39526 m!32145))

(declare-fun m!32153 () Bool)

(assert (=> b!39526 m!32153))

(declare-fun m!32155 () Bool)

(assert (=> b!39526 m!32155))

(declare-fun m!32157 () Bool)

(assert (=> b!39526 m!32157))

(declare-fun m!32159 () Bool)

(assert (=> b!39526 m!32159))

(declare-fun m!32161 () Bool)

(assert (=> b!39526 m!32161))

(declare-fun m!32163 () Bool)

(assert (=> b!39526 m!32163))

(assert (=> b!39526 m!32157))

(declare-fun m!32165 () Bool)

(assert (=> b!39526 m!32165))

(declare-fun m!32167 () Bool)

(assert (=> b!39526 m!32167))

(assert (=> b!39526 m!32139))

(assert (=> b!39526 m!32123))

(declare-fun m!32169 () Bool)

(assert (=> b!39522 m!32169))

(assert (=> b!39520 m!32123))

(assert (=> b!39520 m!32123))

(declare-fun m!32171 () Bool)

(assert (=> b!39520 m!32171))

(assert (=> b!39525 m!32123))

(assert (=> b!39525 m!32123))

(assert (=> b!39525 m!32171))

(assert (=> b!39523 m!32123))

(assert (=> b!39523 m!32123))

(declare-fun m!32173 () Bool)

(assert (=> b!39523 m!32173))

(assert (=> bm!3030 m!32165))

(declare-fun m!32175 () Bool)

(assert (=> b!39532 m!32175))

(assert (=> d!6543 d!6605))

(assert (=> b!39242 d!6593))

(declare-fun b!39538 () Bool)

(declare-fun e!25092 () Bool)

(declare-fun call!3037 () Bool)

(assert (=> b!39538 (= e!25092 call!3037)))

(declare-fun b!39539 () Bool)

(declare-fun e!25094 () Bool)

(assert (=> b!39539 (= e!25094 call!3037)))

(declare-fun bm!3034 () Bool)

(assert (=> bm!3034 (= call!3037 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14713 mask!853))))

(declare-fun b!39540 () Bool)

(declare-fun e!25093 () Bool)

(assert (=> b!39540 (= e!25093 e!25092)))

(declare-fun c!4686 () Bool)

(assert (=> b!39540 (= c!4686 (validKeyInArray!0 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39541 () Bool)

(assert (=> b!39541 (= e!25092 e!25094)))

(declare-fun lt!14941 () (_ BitVec 64))

(assert (=> b!39541 (= lt!14941 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!14942 () Unit!967)

(assert (=> b!39541 (= lt!14942 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14713 lt!14941 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!39541 (arrayContainsKey!0 lt!14713 lt!14941 #b00000000000000000000000000000000)))

(declare-fun lt!14940 () Unit!967)

(assert (=> b!39541 (= lt!14940 lt!14942)))

(declare-fun res!23751 () Bool)

(assert (=> b!39541 (= res!23751 (= (seekEntryOrOpen!0 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14713 mask!853) (Found!170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!39541 (=> (not res!23751) (not e!25094))))

(declare-fun d!6641 () Bool)

(declare-fun res!23752 () Bool)

(assert (=> d!6641 (=> res!23752 e!25093)))

(assert (=> d!6641 (= res!23752 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1357 lt!14713)))))

(assert (=> d!6641 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!14713 mask!853) e!25093)))

(assert (= (and d!6641 (not res!23752)) b!39540))

(assert (= (and b!39540 c!4686) b!39541))

(assert (= (and b!39540 (not c!4686)) b!39538))

(assert (= (and b!39541 res!23751) b!39539))

(assert (= (or b!39539 b!39538) bm!3034))

(declare-fun m!32177 () Bool)

(assert (=> bm!3034 m!32177))

(assert (=> b!39540 m!32029))

(assert (=> b!39540 m!32029))

(assert (=> b!39540 m!32031))

(assert (=> b!39541 m!32029))

(declare-fun m!32179 () Bool)

(assert (=> b!39541 m!32179))

(declare-fun m!32181 () Bool)

(assert (=> b!39541 m!32181))

(assert (=> b!39541 m!32029))

(declare-fun m!32183 () Bool)

(assert (=> b!39541 m!32183))

(assert (=> bm!2968 d!6641))

(assert (=> d!6533 d!6557))

(declare-fun d!6643 () Bool)

(assert (=> d!6643 (= (arrayCountValidKeys!0 lt!14713 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!6643 true))

(declare-fun _$88!34 () Unit!967)

(assert (=> d!6643 (= (choose!59 lt!14713 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!34)))

(declare-fun bs!1648 () Bool)

(assert (= bs!1648 d!6643))

(assert (=> bs!1648 m!31865))

(assert (=> d!6533 d!6643))

(declare-fun d!6645 () Bool)

(declare-fun res!23754 () Bool)

(declare-fun e!25097 () Bool)

(assert (=> d!6645 (=> res!23754 e!25097)))

(assert (=> d!6645 (= res!23754 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1357 lt!14713)))))

(assert (=> d!6645 (= (arrayNoDuplicates!0 lt!14713 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4613 (Cons!1045 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) Nil!1046) Nil!1046)) e!25097)))

(declare-fun b!39542 () Bool)

(declare-fun e!25095 () Bool)

(declare-fun e!25098 () Bool)

(assert (=> b!39542 (= e!25095 e!25098)))

(declare-fun c!4687 () Bool)

(assert (=> b!39542 (= c!4687 (validKeyInArray!0 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39543 () Bool)

(declare-fun call!3038 () Bool)

(assert (=> b!39543 (= e!25098 call!3038)))

(declare-fun b!39544 () Bool)

(assert (=> b!39544 (= e!25097 e!25095)))

(declare-fun res!23755 () Bool)

(assert (=> b!39544 (=> (not res!23755) (not e!25095))))

(declare-fun e!25096 () Bool)

(assert (=> b!39544 (= res!23755 (not e!25096))))

(declare-fun res!23753 () Bool)

(assert (=> b!39544 (=> (not res!23753) (not e!25096))))

(assert (=> b!39544 (= res!23753 (validKeyInArray!0 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3035 () Bool)

(assert (=> bm!3035 (= call!3038 (arrayNoDuplicates!0 lt!14713 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4687 (Cons!1045 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4613 (Cons!1045 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) Nil!1046) Nil!1046)) (ite c!4613 (Cons!1045 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) Nil!1046) Nil!1046))))))

(declare-fun b!39545 () Bool)

(assert (=> b!39545 (= e!25098 call!3038)))

(declare-fun b!39546 () Bool)

(assert (=> b!39546 (= e!25096 (contains!505 (ite c!4613 (Cons!1045 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) Nil!1046) Nil!1046) (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6645 (not res!23754)) b!39544))

(assert (= (and b!39544 res!23753) b!39546))

(assert (= (and b!39544 res!23755) b!39542))

(assert (= (and b!39542 c!4687) b!39545))

(assert (= (and b!39542 (not c!4687)) b!39543))

(assert (= (or b!39545 b!39543) bm!3035))

(assert (=> b!39542 m!32029))

(assert (=> b!39542 m!32029))

(assert (=> b!39542 m!32031))

(assert (=> b!39544 m!32029))

(assert (=> b!39544 m!32029))

(assert (=> b!39544 m!32031))

(assert (=> bm!3035 m!32029))

(declare-fun m!32185 () Bool)

(assert (=> bm!3035 m!32185))

(assert (=> b!39546 m!32029))

(assert (=> b!39546 m!32029))

(declare-fun m!32187 () Bool)

(assert (=> b!39546 m!32187))

(assert (=> bm!2975 d!6645))

(assert (=> b!39212 d!6593))

(declare-fun d!6647 () Bool)

(declare-fun res!23757 () Bool)

(declare-fun e!25101 () Bool)

(assert (=> d!6647 (=> res!23757 e!25101)))

(assert (=> d!6647 (= res!23757 (bvsge #b00000000000000000000000000000000 (size!1357 (_keys!3266 lt!14709))))))

(assert (=> d!6647 (= (arrayNoDuplicates!0 (_keys!3266 lt!14709) #b00000000000000000000000000000000 Nil!1046) e!25101)))

(declare-fun b!39547 () Bool)

(declare-fun e!25099 () Bool)

(declare-fun e!25102 () Bool)

(assert (=> b!39547 (= e!25099 e!25102)))

(declare-fun c!4688 () Bool)

(assert (=> b!39547 (= c!4688 (validKeyInArray!0 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)))))

(declare-fun b!39548 () Bool)

(declare-fun call!3039 () Bool)

(assert (=> b!39548 (= e!25102 call!3039)))

(declare-fun b!39549 () Bool)

(assert (=> b!39549 (= e!25101 e!25099)))

(declare-fun res!23758 () Bool)

(assert (=> b!39549 (=> (not res!23758) (not e!25099))))

(declare-fun e!25100 () Bool)

(assert (=> b!39549 (= res!23758 (not e!25100))))

(declare-fun res!23756 () Bool)

(assert (=> b!39549 (=> (not res!23756) (not e!25100))))

(assert (=> b!39549 (= res!23756 (validKeyInArray!0 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)))))

(declare-fun bm!3036 () Bool)

(assert (=> bm!3036 (= call!3039 (arrayNoDuplicates!0 (_keys!3266 lt!14709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4688 (Cons!1045 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000) Nil!1046) Nil!1046)))))

(declare-fun b!39550 () Bool)

(assert (=> b!39550 (= e!25102 call!3039)))

(declare-fun b!39551 () Bool)

(assert (=> b!39551 (= e!25100 (contains!505 Nil!1046 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)))))

(assert (= (and d!6647 (not res!23757)) b!39549))

(assert (= (and b!39549 res!23756) b!39551))

(assert (= (and b!39549 res!23758) b!39547))

(assert (= (and b!39547 c!4688) b!39550))

(assert (= (and b!39547 (not c!4688)) b!39548))

(assert (= (or b!39550 b!39548) bm!3036))

(assert (=> b!39547 m!32123))

(assert (=> b!39547 m!32123))

(assert (=> b!39547 m!32171))

(assert (=> b!39549 m!32123))

(assert (=> b!39549 m!32123))

(assert (=> b!39549 m!32171))

(assert (=> bm!3036 m!32123))

(declare-fun m!32189 () Bool)

(assert (=> bm!3036 m!32189))

(assert (=> b!39551 m!32123))

(assert (=> b!39551 m!32123))

(declare-fun m!32191 () Bool)

(assert (=> b!39551 m!32191))

(assert (=> b!39313 d!6647))

(declare-fun d!6649 () Bool)

(assert (=> d!6649 (arrayContainsKey!0 lt!14713 lt!14761 #b00000000000000000000000000000000)))

(declare-fun lt!14967 () Unit!967)

(declare-fun choose!13 (array!2583 (_ BitVec 64) (_ BitVec 32)) Unit!967)

(assert (=> d!6649 (= lt!14967 (choose!13 lt!14713 lt!14761 #b00000000000000000000000000000000))))

(assert (=> d!6649 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!6649 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14713 lt!14761 #b00000000000000000000000000000000) lt!14967)))

(declare-fun bs!1649 () Bool)

(assert (= bs!1649 d!6649))

(assert (=> bs!1649 m!31937))

(declare-fun m!32193 () Bool)

(assert (=> bs!1649 m!32193))

(assert (=> b!39213 d!6649))

(declare-fun d!6651 () Bool)

(declare-fun res!23772 () Bool)

(declare-fun e!25122 () Bool)

(assert (=> d!6651 (=> res!23772 e!25122)))

(assert (=> d!6651 (= res!23772 (= (select (arr!1235 lt!14713) #b00000000000000000000000000000000) lt!14761))))

(assert (=> d!6651 (= (arrayContainsKey!0 lt!14713 lt!14761 #b00000000000000000000000000000000) e!25122)))

(declare-fun b!39581 () Bool)

(declare-fun e!25123 () Bool)

(assert (=> b!39581 (= e!25122 e!25123)))

(declare-fun res!23773 () Bool)

(assert (=> b!39581 (=> (not res!23773) (not e!25123))))

(assert (=> b!39581 (= res!23773 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1357 lt!14713)))))

(declare-fun b!39582 () Bool)

(assert (=> b!39582 (= e!25123 (arrayContainsKey!0 lt!14713 lt!14761 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6651 (not res!23772)) b!39581))

(assert (= (and b!39581 res!23773) b!39582))

(assert (=> d!6651 m!31931))

(declare-fun m!32251 () Bool)

(assert (=> b!39582 m!32251))

(assert (=> b!39213 d!6651))

(declare-fun b!39637 () Bool)

(declare-fun e!25157 () SeekEntryResult!170)

(declare-fun lt!15019 () SeekEntryResult!170)

(assert (=> b!39637 (= e!25157 (MissingZero!170 (index!2804 lt!15019)))))

(declare-fun b!39638 () Bool)

(declare-fun c!4716 () Bool)

(declare-fun lt!15021 () (_ BitVec 64))

(assert (=> b!39638 (= c!4716 (= lt!15021 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25158 () SeekEntryResult!170)

(assert (=> b!39638 (= e!25158 e!25157)))

(declare-fun b!39639 () Bool)

(assert (=> b!39639 (= e!25158 (Found!170 (index!2804 lt!15019)))))

(declare-fun b!39640 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2583 (_ BitVec 32)) SeekEntryResult!170)

(assert (=> b!39640 (= e!25157 (seekKeyOrZeroReturnVacant!0 (x!7656 lt!15019) (index!2804 lt!15019) (index!2804 lt!15019) (select (arr!1235 lt!14713) #b00000000000000000000000000000000) lt!14713 mask!853))))

(declare-fun d!6655 () Bool)

(declare-fun lt!15020 () SeekEntryResult!170)

(get-info :version)

(assert (=> d!6655 (and (or ((_ is Undefined!170) lt!15020) (not ((_ is Found!170) lt!15020)) (and (bvsge (index!2803 lt!15020) #b00000000000000000000000000000000) (bvslt (index!2803 lt!15020) (size!1357 lt!14713)))) (or ((_ is Undefined!170) lt!15020) ((_ is Found!170) lt!15020) (not ((_ is MissingZero!170) lt!15020)) (and (bvsge (index!2802 lt!15020) #b00000000000000000000000000000000) (bvslt (index!2802 lt!15020) (size!1357 lt!14713)))) (or ((_ is Undefined!170) lt!15020) ((_ is Found!170) lt!15020) ((_ is MissingZero!170) lt!15020) (not ((_ is MissingVacant!170) lt!15020)) (and (bvsge (index!2805 lt!15020) #b00000000000000000000000000000000) (bvslt (index!2805 lt!15020) (size!1357 lt!14713)))) (or ((_ is Undefined!170) lt!15020) (ite ((_ is Found!170) lt!15020) (= (select (arr!1235 lt!14713) (index!2803 lt!15020)) (select (arr!1235 lt!14713) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!170) lt!15020) (= (select (arr!1235 lt!14713) (index!2802 lt!15020)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!170) lt!15020) (= (select (arr!1235 lt!14713) (index!2805 lt!15020)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!25156 () SeekEntryResult!170)

(assert (=> d!6655 (= lt!15020 e!25156)))

(declare-fun c!4717 () Bool)

(assert (=> d!6655 (= c!4717 (and ((_ is Intermediate!170) lt!15019) (undefined!982 lt!15019)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2583 (_ BitVec 32)) SeekEntryResult!170)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!6655 (= lt!15019 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) mask!853) (select (arr!1235 lt!14713) #b00000000000000000000000000000000) lt!14713 mask!853))))

(assert (=> d!6655 (validMask!0 mask!853)))

(assert (=> d!6655 (= (seekEntryOrOpen!0 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) lt!14713 mask!853) lt!15020)))

(declare-fun b!39641 () Bool)

(assert (=> b!39641 (= e!25156 Undefined!170)))

(declare-fun b!39642 () Bool)

(assert (=> b!39642 (= e!25156 e!25158)))

(assert (=> b!39642 (= lt!15021 (select (arr!1235 lt!14713) (index!2804 lt!15019)))))

(declare-fun c!4715 () Bool)

(assert (=> b!39642 (= c!4715 (= lt!15021 (select (arr!1235 lt!14713) #b00000000000000000000000000000000)))))

(assert (= (and d!6655 c!4717) b!39641))

(assert (= (and d!6655 (not c!4717)) b!39642))

(assert (= (and b!39642 c!4715) b!39639))

(assert (= (and b!39642 (not c!4715)) b!39638))

(assert (= (and b!39638 c!4716) b!39637))

(assert (= (and b!39638 (not c!4716)) b!39640))

(assert (=> b!39640 m!31931))

(declare-fun m!32253 () Bool)

(assert (=> b!39640 m!32253))

(declare-fun m!32255 () Bool)

(assert (=> d!6655 m!32255))

(assert (=> d!6655 m!31931))

(declare-fun m!32257 () Bool)

(assert (=> d!6655 m!32257))

(assert (=> d!6655 m!31863))

(assert (=> d!6655 m!32257))

(assert (=> d!6655 m!31931))

(declare-fun m!32259 () Bool)

(assert (=> d!6655 m!32259))

(declare-fun m!32261 () Bool)

(assert (=> d!6655 m!32261))

(declare-fun m!32263 () Bool)

(assert (=> d!6655 m!32263))

(declare-fun m!32265 () Bool)

(assert (=> b!39642 m!32265))

(assert (=> b!39213 d!6655))

(declare-fun d!6657 () Bool)

(declare-fun lt!15046 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!29 (List!1049) (InoxSet (_ BitVec 64)))

(assert (=> d!6657 (= lt!15046 (select (content!29 Nil!1046) (select (arr!1235 lt!14713) #b00000000000000000000000000000000)))))

(declare-fun e!25177 () Bool)

(assert (=> d!6657 (= lt!15046 e!25177)))

(declare-fun res!23805 () Bool)

(assert (=> d!6657 (=> (not res!23805) (not e!25177))))

(assert (=> d!6657 (= res!23805 ((_ is Cons!1045) Nil!1046))))

(assert (=> d!6657 (= (contains!505 Nil!1046 (select (arr!1235 lt!14713) #b00000000000000000000000000000000)) lt!15046)))

(declare-fun b!39668 () Bool)

(declare-fun e!25176 () Bool)

(assert (=> b!39668 (= e!25177 e!25176)))

(declare-fun res!23806 () Bool)

(assert (=> b!39668 (=> res!23806 e!25176)))

(assert (=> b!39668 (= res!23806 (= (h!1616 Nil!1046) (select (arr!1235 lt!14713) #b00000000000000000000000000000000)))))

(declare-fun b!39669 () Bool)

(assert (=> b!39669 (= e!25176 (contains!505 (t!3892 Nil!1046) (select (arr!1235 lt!14713) #b00000000000000000000000000000000)))))

(assert (= (and d!6657 res!23805) b!39668))

(assert (= (and b!39668 (not res!23806)) b!39669))

(declare-fun m!32267 () Bool)

(assert (=> d!6657 m!32267))

(assert (=> d!6657 m!31931))

(declare-fun m!32269 () Bool)

(assert (=> d!6657 m!32269))

(assert (=> b!39669 m!31931))

(declare-fun m!32271 () Bool)

(assert (=> b!39669 m!32271))

(assert (=> b!39244 d!6657))

(declare-fun b!39670 () Bool)

(declare-fun e!25178 () Bool)

(declare-fun call!3069 () Bool)

(assert (=> b!39670 (= e!25178 call!3069)))

(declare-fun b!39671 () Bool)

(declare-fun e!25180 () Bool)

(assert (=> b!39671 (= e!25180 call!3069)))

(declare-fun bm!3066 () Bool)

(assert (=> bm!3066 (= call!3069 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3266 lt!14709) (mask!5142 lt!14709)))))

(declare-fun b!39672 () Bool)

(declare-fun e!25179 () Bool)

(assert (=> b!39672 (= e!25179 e!25178)))

(declare-fun c!4724 () Bool)

(assert (=> b!39672 (= c!4724 (validKeyInArray!0 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)))))

(declare-fun b!39673 () Bool)

(assert (=> b!39673 (= e!25178 e!25180)))

(declare-fun lt!15048 () (_ BitVec 64))

(assert (=> b!39673 (= lt!15048 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000))))

(declare-fun lt!15049 () Unit!967)

(assert (=> b!39673 (= lt!15049 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3266 lt!14709) lt!15048 #b00000000000000000000000000000000))))

(assert (=> b!39673 (arrayContainsKey!0 (_keys!3266 lt!14709) lt!15048 #b00000000000000000000000000000000)))

(declare-fun lt!15047 () Unit!967)

(assert (=> b!39673 (= lt!15047 lt!15049)))

(declare-fun res!23807 () Bool)

(assert (=> b!39673 (= res!23807 (= (seekEntryOrOpen!0 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000) (_keys!3266 lt!14709) (mask!5142 lt!14709)) (Found!170 #b00000000000000000000000000000000)))))

(assert (=> b!39673 (=> (not res!23807) (not e!25180))))

(declare-fun d!6659 () Bool)

(declare-fun res!23808 () Bool)

(assert (=> d!6659 (=> res!23808 e!25179)))

(assert (=> d!6659 (= res!23808 (bvsge #b00000000000000000000000000000000 (size!1357 (_keys!3266 lt!14709))))))

(assert (=> d!6659 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3266 lt!14709) (mask!5142 lt!14709)) e!25179)))

(assert (= (and d!6659 (not res!23808)) b!39672))

(assert (= (and b!39672 c!4724) b!39673))

(assert (= (and b!39672 (not c!4724)) b!39670))

(assert (= (and b!39673 res!23807) b!39671))

(assert (= (or b!39671 b!39670) bm!3066))

(declare-fun m!32273 () Bool)

(assert (=> bm!3066 m!32273))

(assert (=> b!39672 m!32123))

(assert (=> b!39672 m!32123))

(assert (=> b!39672 m!32171))

(assert (=> b!39673 m!32123))

(declare-fun m!32275 () Bool)

(assert (=> b!39673 m!32275))

(declare-fun m!32277 () Bool)

(assert (=> b!39673 m!32277))

(assert (=> b!39673 m!32123))

(declare-fun m!32279 () Bool)

(assert (=> b!39673 m!32279))

(assert (=> b!39312 d!6659))

(declare-fun b!39674 () Bool)

(declare-fun e!25181 () (_ BitVec 32))

(declare-fun call!3070 () (_ BitVec 32))

(assert (=> b!39674 (= e!25181 call!3070)))

(declare-fun b!39675 () Bool)

(declare-fun e!25182 () (_ BitVec 32))

(assert (=> b!39675 (= e!25182 e!25181)))

(declare-fun c!4726 () Bool)

(assert (=> b!39675 (= c!4726 (validKeyInArray!0 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)))))

(declare-fun b!39676 () Bool)

(assert (=> b!39676 (= e!25181 (bvadd #b00000000000000000000000000000001 call!3070))))

(declare-fun d!6661 () Bool)

(declare-fun lt!15050 () (_ BitVec 32))

(assert (=> d!6661 (and (bvsge lt!15050 #b00000000000000000000000000000000) (bvsle lt!15050 (bvsub (size!1357 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)))))

(assert (=> d!6661 (= lt!15050 e!25182)))

(declare-fun c!4725 () Bool)

(assert (=> d!6661 (= c!4725 (bvsge #b00000000000000000000000000000000 (size!1357 (_keys!3266 lt!14709))))))

(assert (=> d!6661 (and (bvsle #b00000000000000000000000000000000 (size!1357 (_keys!3266 lt!14709))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1357 (_keys!3266 lt!14709)) (size!1357 (_keys!3266 lt!14709))))))

(assert (=> d!6661 (= (arrayCountValidKeys!0 (_keys!3266 lt!14709) #b00000000000000000000000000000000 (size!1357 (_keys!3266 lt!14709))) lt!15050)))

(declare-fun bm!3067 () Bool)

(assert (=> bm!3067 (= call!3070 (arrayCountValidKeys!0 (_keys!3266 lt!14709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1357 (_keys!3266 lt!14709))))))

(declare-fun b!39677 () Bool)

(assert (=> b!39677 (= e!25182 #b00000000000000000000000000000000)))

(assert (= (and d!6661 c!4725) b!39677))

(assert (= (and d!6661 (not c!4725)) b!39675))

(assert (= (and b!39675 c!4726) b!39676))

(assert (= (and b!39675 (not c!4726)) b!39674))

(assert (= (or b!39676 b!39674) bm!3067))

(assert (=> b!39675 m!32123))

(assert (=> b!39675 m!32123))

(assert (=> b!39675 m!32171))

(declare-fun m!32293 () Bool)

(assert (=> bm!3067 m!32293))

(assert (=> b!39311 d!6661))

(check-sat (not b!39358) (not bm!3033) (not b!39673) (not b!39529) (not b!39582) (not bm!3030) (not b!39675) (not b!39540) (not b!39525) (not b!39359) (not b!39640) (not bm!3036) (not b!39541) (not d!6657) (not d!6595) (not bm!3034) (not b!39669) (not bm!3066) (not b!39532) (not b!39546) (not b!39549) (not b!39547) (not d!6655) (not b!39520) (not b!39672) b_and!2339 (not b!39544) (not bm!3067) (not b!39522) (not bm!3035) (not b_lambda!2033) (not b!39551) (not b_lambda!2031) (not d!6587) (not bm!3027) (not b!39526) tp_is_empty!1749 (not b!39542) (not b!39528) (not d!6599) (not bm!2990) (not d!6605) (not bm!3028) (not b!39323) (not d!6649) (not d!6643) (not b!39523) (not b_next!1359))
(check-sat b_and!2339 (not b_next!1359))
(get-model)

(declare-fun d!6757 () Bool)

(declare-fun lt!15175 () Bool)

(assert (=> d!6757 (= lt!15175 (select (content!29 Nil!1046) (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)))))

(declare-fun e!25299 () Bool)

(assert (=> d!6757 (= lt!15175 e!25299)))

(declare-fun res!23882 () Bool)

(assert (=> d!6757 (=> (not res!23882) (not e!25299))))

(assert (=> d!6757 (= res!23882 ((_ is Cons!1045) Nil!1046))))

(assert (=> d!6757 (= (contains!505 Nil!1046 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)) lt!15175)))

(declare-fun b!39866 () Bool)

(declare-fun e!25298 () Bool)

(assert (=> b!39866 (= e!25299 e!25298)))

(declare-fun res!23883 () Bool)

(assert (=> b!39866 (=> res!23883 e!25298)))

(assert (=> b!39866 (= res!23883 (= (h!1616 Nil!1046) (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)))))

(declare-fun b!39867 () Bool)

(assert (=> b!39867 (= e!25298 (contains!505 (t!3892 Nil!1046) (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)))))

(assert (= (and d!6757 res!23882) b!39866))

(assert (= (and b!39866 (not res!23883)) b!39867))

(assert (=> d!6757 m!32267))

(assert (=> d!6757 m!32123))

(declare-fun m!32605 () Bool)

(assert (=> d!6757 m!32605))

(assert (=> b!39867 m!32123))

(declare-fun m!32607 () Bool)

(assert (=> b!39867 m!32607))

(assert (=> b!39551 d!6757))

(declare-fun d!6761 () Bool)

(declare-fun lt!15177 () Bool)

(assert (=> d!6761 (= lt!15177 (select (content!29 (ite c!4613 (Cons!1045 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) Nil!1046) Nil!1046)) (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!25303 () Bool)

(assert (=> d!6761 (= lt!15177 e!25303)))

(declare-fun res!23884 () Bool)

(assert (=> d!6761 (=> (not res!23884) (not e!25303))))

(assert (=> d!6761 (= res!23884 ((_ is Cons!1045) (ite c!4613 (Cons!1045 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) Nil!1046) Nil!1046)))))

(assert (=> d!6761 (= (contains!505 (ite c!4613 (Cons!1045 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) Nil!1046) Nil!1046) (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!15177)))

(declare-fun b!39872 () Bool)

(declare-fun e!25302 () Bool)

(assert (=> b!39872 (= e!25303 e!25302)))

(declare-fun res!23885 () Bool)

(assert (=> b!39872 (=> res!23885 e!25302)))

(assert (=> b!39872 (= res!23885 (= (h!1616 (ite c!4613 (Cons!1045 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) Nil!1046) Nil!1046)) (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39873 () Bool)

(assert (=> b!39873 (= e!25302 (contains!505 (t!3892 (ite c!4613 (Cons!1045 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) Nil!1046) Nil!1046)) (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6761 res!23884) b!39872))

(assert (= (and b!39872 (not res!23885)) b!39873))

(declare-fun m!32611 () Bool)

(assert (=> d!6761 m!32611))

(assert (=> d!6761 m!32029))

(declare-fun m!32613 () Bool)

(assert (=> d!6761 m!32613))

(assert (=> b!39873 m!32029))

(declare-fun m!32615 () Bool)

(assert (=> b!39873 m!32615))

(assert (=> b!39546 d!6761))

(declare-fun d!6765 () Bool)

(declare-fun res!23887 () Bool)

(declare-fun e!25306 () Bool)

(assert (=> d!6765 (=> res!23887 e!25306)))

(assert (=> d!6765 (= res!23887 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1357 (_keys!3266 lt!14709))))))

(assert (=> d!6765 (= (arrayNoDuplicates!0 (_keys!3266 lt!14709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4688 (Cons!1045 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000) Nil!1046) Nil!1046)) e!25306)))

(declare-fun b!39874 () Bool)

(declare-fun e!25304 () Bool)

(declare-fun e!25307 () Bool)

(assert (=> b!39874 (= e!25304 e!25307)))

(declare-fun c!4786 () Bool)

(assert (=> b!39874 (= c!4786 (validKeyInArray!0 (select (arr!1235 (_keys!3266 lt!14709)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!39875 () Bool)

(declare-fun call!3081 () Bool)

(assert (=> b!39875 (= e!25307 call!3081)))

(declare-fun b!39876 () Bool)

(assert (=> b!39876 (= e!25306 e!25304)))

(declare-fun res!23888 () Bool)

(assert (=> b!39876 (=> (not res!23888) (not e!25304))))

(declare-fun e!25305 () Bool)

(assert (=> b!39876 (= res!23888 (not e!25305))))

(declare-fun res!23886 () Bool)

(assert (=> b!39876 (=> (not res!23886) (not e!25305))))

(assert (=> b!39876 (= res!23886 (validKeyInArray!0 (select (arr!1235 (_keys!3266 lt!14709)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3078 () Bool)

(assert (=> bm!3078 (= call!3081 (arrayNoDuplicates!0 (_keys!3266 lt!14709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4786 (Cons!1045 (select (arr!1235 (_keys!3266 lt!14709)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4688 (Cons!1045 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000) Nil!1046) Nil!1046)) (ite c!4688 (Cons!1045 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000) Nil!1046) Nil!1046))))))

(declare-fun b!39877 () Bool)

(assert (=> b!39877 (= e!25307 call!3081)))

(declare-fun b!39878 () Bool)

(assert (=> b!39878 (= e!25305 (contains!505 (ite c!4688 (Cons!1045 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000) Nil!1046) Nil!1046) (select (arr!1235 (_keys!3266 lt!14709)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6765 (not res!23887)) b!39876))

(assert (= (and b!39876 res!23886) b!39878))

(assert (= (and b!39876 res!23888) b!39874))

(assert (= (and b!39874 c!4786) b!39877))

(assert (= (and b!39874 (not c!4786)) b!39875))

(assert (= (or b!39877 b!39875) bm!3078))

(declare-fun m!32619 () Bool)

(assert (=> b!39874 m!32619))

(assert (=> b!39874 m!32619))

(declare-fun m!32623 () Bool)

(assert (=> b!39874 m!32623))

(assert (=> b!39876 m!32619))

(assert (=> b!39876 m!32619))

(assert (=> b!39876 m!32623))

(assert (=> bm!3078 m!32619))

(declare-fun m!32625 () Bool)

(assert (=> bm!3078 m!32625))

(assert (=> b!39878 m!32619))

(assert (=> b!39878 m!32619))

(declare-fun m!32627 () Bool)

(assert (=> b!39878 m!32627))

(assert (=> bm!3036 d!6765))

(declare-fun d!6773 () Bool)

(declare-fun res!23892 () Bool)

(declare-fun e!25315 () Bool)

(assert (=> d!6773 (=> res!23892 e!25315)))

(assert (=> d!6773 (= res!23892 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1357 lt!14713)))))

(assert (=> d!6773 (= (arrayNoDuplicates!0 lt!14713 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4687 (Cons!1045 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4613 (Cons!1045 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) Nil!1046) Nil!1046)) (ite c!4613 (Cons!1045 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) Nil!1046) Nil!1046))) e!25315)))

(declare-fun b!39887 () Bool)

(declare-fun e!25313 () Bool)

(declare-fun e!25316 () Bool)

(assert (=> b!39887 (= e!25313 e!25316)))

(declare-fun c!4790 () Bool)

(assert (=> b!39887 (= c!4790 (validKeyInArray!0 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!39888 () Bool)

(declare-fun call!3082 () Bool)

(assert (=> b!39888 (= e!25316 call!3082)))

(declare-fun b!39889 () Bool)

(assert (=> b!39889 (= e!25315 e!25313)))

(declare-fun res!23893 () Bool)

(assert (=> b!39889 (=> (not res!23893) (not e!25313))))

(declare-fun e!25314 () Bool)

(assert (=> b!39889 (= res!23893 (not e!25314))))

(declare-fun res!23891 () Bool)

(assert (=> b!39889 (=> (not res!23891) (not e!25314))))

(assert (=> b!39889 (= res!23891 (validKeyInArray!0 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!3079 () Bool)

(assert (=> bm!3079 (= call!3082 (arrayNoDuplicates!0 lt!14713 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!4790 (Cons!1045 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!4687 (Cons!1045 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4613 (Cons!1045 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) Nil!1046) Nil!1046)) (ite c!4613 (Cons!1045 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) Nil!1046) Nil!1046))) (ite c!4687 (Cons!1045 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4613 (Cons!1045 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) Nil!1046) Nil!1046)) (ite c!4613 (Cons!1045 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) Nil!1046) Nil!1046)))))))

(declare-fun b!39890 () Bool)

(assert (=> b!39890 (= e!25316 call!3082)))

(declare-fun b!39891 () Bool)

(assert (=> b!39891 (= e!25314 (contains!505 (ite c!4687 (Cons!1045 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4613 (Cons!1045 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) Nil!1046) Nil!1046)) (ite c!4613 (Cons!1045 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) Nil!1046) Nil!1046)) (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!6773 (not res!23892)) b!39889))

(assert (= (and b!39889 res!23891) b!39891))

(assert (= (and b!39889 res!23893) b!39887))

(assert (= (and b!39887 c!4790) b!39890))

(assert (= (and b!39887 (not c!4790)) b!39888))

(assert (= (or b!39890 b!39888) bm!3079))

(declare-fun m!32649 () Bool)

(assert (=> b!39887 m!32649))

(assert (=> b!39887 m!32649))

(declare-fun m!32651 () Bool)

(assert (=> b!39887 m!32651))

(assert (=> b!39889 m!32649))

(assert (=> b!39889 m!32649))

(assert (=> b!39889 m!32651))

(assert (=> bm!3079 m!32649))

(declare-fun m!32655 () Bool)

(assert (=> bm!3079 m!32655))

(assert (=> b!39891 m!32649))

(assert (=> b!39891 m!32649))

(declare-fun m!32657 () Bool)

(assert (=> b!39891 m!32657))

(assert (=> bm!3035 d!6773))

(declare-fun d!6779 () Bool)

(declare-datatypes ((Option!105 0))(
  ( (Some!104 (v!1991 V!2091)) (None!103) )
))
(declare-fun get!695 (Option!105) V!2091)

(declare-fun getValueByKey!99 (List!1048 (_ BitVec 64)) Option!105)

(assert (=> d!6779 (= (apply!52 lt!14920 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)) (get!695 (getValueByKey!99 (toList!544 lt!14920) (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000))))))

(declare-fun bs!1664 () Bool)

(assert (= bs!1664 d!6779))

(assert (=> bs!1664 m!32123))

(declare-fun m!32659 () Bool)

(assert (=> bs!1664 m!32659))

(assert (=> bs!1664 m!32659))

(declare-fun m!32661 () Bool)

(assert (=> bs!1664 m!32661))

(assert (=> b!39529 d!6779))

(declare-fun d!6781 () Bool)

(declare-fun c!4794 () Bool)

(assert (=> d!6781 (= c!4794 ((_ is ValueCellFull!627) (select (arr!1236 (_values!1778 lt!14709)) #b00000000000000000000000000000000)))))

(declare-fun e!25323 () V!2091)

(assert (=> d!6781 (= (get!689 (select (arr!1236 (_values!1778 lt!14709)) #b00000000000000000000000000000000) (dynLambda!188 (defaultEntry!1795 lt!14709) #b0000000000000000000000000000000000000000000000000000000000000000)) e!25323)))

(declare-fun b!39901 () Bool)

(declare-fun get!696 (ValueCell!627 V!2091) V!2091)

(assert (=> b!39901 (= e!25323 (get!696 (select (arr!1236 (_values!1778 lt!14709)) #b00000000000000000000000000000000) (dynLambda!188 (defaultEntry!1795 lt!14709) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!39902 () Bool)

(declare-fun get!697 (ValueCell!627 V!2091) V!2091)

(assert (=> b!39902 (= e!25323 (get!697 (select (arr!1236 (_values!1778 lt!14709)) #b00000000000000000000000000000000) (dynLambda!188 (defaultEntry!1795 lt!14709) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!6781 c!4794) b!39901))

(assert (= (and d!6781 (not c!4794)) b!39902))

(assert (=> b!39901 m!32119))

(assert (=> b!39901 m!32121))

(declare-fun m!32663 () Bool)

(assert (=> b!39901 m!32663))

(assert (=> b!39902 m!32119))

(assert (=> b!39902 m!32121))

(declare-fun m!32665 () Bool)

(assert (=> b!39902 m!32665))

(assert (=> b!39529 d!6781))

(declare-fun d!6783 () Bool)

(assert (=> d!6783 (= (validKeyInArray!0 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39544 d!6783))

(assert (=> d!6587 d!6549))

(declare-fun b!39938 () Bool)

(declare-fun e!25350 () SeekEntryResult!170)

(assert (=> b!39938 (= e!25350 (Intermediate!170 true (toIndex!0 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!39939 () Bool)

(declare-fun e!25349 () SeekEntryResult!170)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!39939 (= e!25349 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000 mask!853) (select (arr!1235 lt!14713) #b00000000000000000000000000000000) lt!14713 mask!853))))

(declare-fun b!39941 () Bool)

(declare-fun lt!15198 () SeekEntryResult!170)

(assert (=> b!39941 (and (bvsge (index!2804 lt!15198) #b00000000000000000000000000000000) (bvslt (index!2804 lt!15198) (size!1357 lt!14713)))))

(declare-fun res!23910 () Bool)

(assert (=> b!39941 (= res!23910 (= (select (arr!1235 lt!14713) (index!2804 lt!15198)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25348 () Bool)

(assert (=> b!39941 (=> res!23910 e!25348)))

(declare-fun b!39942 () Bool)

(declare-fun e!25347 () Bool)

(assert (=> b!39942 (= e!25347 (bvsge (x!7656 lt!15198) #b01111111111111111111111111111110))))

(declare-fun b!39943 () Bool)

(assert (=> b!39943 (= e!25350 e!25349)))

(declare-fun c!4808 () Bool)

(declare-fun lt!15197 () (_ BitVec 64))

(assert (=> b!39943 (= c!4808 (or (= lt!15197 (select (arr!1235 lt!14713) #b00000000000000000000000000000000)) (= (bvadd lt!15197 lt!15197) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!39944 () Bool)

(assert (=> b!39944 (and (bvsge (index!2804 lt!15198) #b00000000000000000000000000000000) (bvslt (index!2804 lt!15198) (size!1357 lt!14713)))))

(assert (=> b!39944 (= e!25348 (= (select (arr!1235 lt!14713) (index!2804 lt!15198)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!39945 () Bool)

(assert (=> b!39945 (and (bvsge (index!2804 lt!15198) #b00000000000000000000000000000000) (bvslt (index!2804 lt!15198) (size!1357 lt!14713)))))

(declare-fun res!23912 () Bool)

(assert (=> b!39945 (= res!23912 (= (select (arr!1235 lt!14713) (index!2804 lt!15198)) (select (arr!1235 lt!14713) #b00000000000000000000000000000000)))))

(assert (=> b!39945 (=> res!23912 e!25348)))

(declare-fun e!25346 () Bool)

(assert (=> b!39945 (= e!25346 e!25348)))

(declare-fun b!39946 () Bool)

(assert (=> b!39946 (= e!25349 (Intermediate!170 false (toIndex!0 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!39940 () Bool)

(assert (=> b!39940 (= e!25347 e!25346)))

(declare-fun res!23911 () Bool)

(assert (=> b!39940 (= res!23911 (and ((_ is Intermediate!170) lt!15198) (not (undefined!982 lt!15198)) (bvslt (x!7656 lt!15198) #b01111111111111111111111111111110) (bvsge (x!7656 lt!15198) #b00000000000000000000000000000000) (bvsge (x!7656 lt!15198) #b00000000000000000000000000000000)))))

(assert (=> b!39940 (=> (not res!23911) (not e!25346))))

(declare-fun d!6785 () Bool)

(assert (=> d!6785 e!25347))

(declare-fun c!4806 () Bool)

(assert (=> d!6785 (= c!4806 (and ((_ is Intermediate!170) lt!15198) (undefined!982 lt!15198)))))

(assert (=> d!6785 (= lt!15198 e!25350)))

(declare-fun c!4807 () Bool)

(assert (=> d!6785 (= c!4807 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!6785 (= lt!15197 (select (arr!1235 lt!14713) (toIndex!0 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) mask!853)))))

(assert (=> d!6785 (validMask!0 mask!853)))

(assert (=> d!6785 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) mask!853) (select (arr!1235 lt!14713) #b00000000000000000000000000000000) lt!14713 mask!853) lt!15198)))

(assert (= (and d!6785 c!4807) b!39938))

(assert (= (and d!6785 (not c!4807)) b!39943))

(assert (= (and b!39943 c!4808) b!39946))

(assert (= (and b!39943 (not c!4808)) b!39939))

(assert (= (and d!6785 c!4806) b!39942))

(assert (= (and d!6785 (not c!4806)) b!39940))

(assert (= (and b!39940 res!23911) b!39945))

(assert (= (and b!39945 (not res!23912)) b!39941))

(assert (= (and b!39941 (not res!23910)) b!39944))

(declare-fun m!32705 () Bool)

(assert (=> b!39941 m!32705))

(assert (=> b!39939 m!32257))

(declare-fun m!32707 () Bool)

(assert (=> b!39939 m!32707))

(assert (=> b!39939 m!32707))

(assert (=> b!39939 m!31931))

(declare-fun m!32709 () Bool)

(assert (=> b!39939 m!32709))

(assert (=> d!6785 m!32257))

(declare-fun m!32711 () Bool)

(assert (=> d!6785 m!32711))

(assert (=> d!6785 m!31863))

(assert (=> b!39944 m!32705))

(assert (=> b!39945 m!32705))

(assert (=> d!6655 d!6785))

(declare-fun d!6805 () Bool)

(declare-fun lt!15204 () (_ BitVec 32))

(declare-fun lt!15203 () (_ BitVec 32))

(assert (=> d!6805 (= lt!15204 (bvmul (bvxor lt!15203 (bvlshr lt!15203 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!6805 (= lt!15203 ((_ extract 31 0) (bvand (bvxor (select (arr!1235 lt!14713) #b00000000000000000000000000000000) (bvlshr (select (arr!1235 lt!14713) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!6805 (and (bvsge mask!853 #b00000000000000000000000000000000) (let ((res!23913 (let ((h!1620 ((_ extract 31 0) (bvand (bvxor (select (arr!1235 lt!14713) #b00000000000000000000000000000000) (bvlshr (select (arr!1235 lt!14713) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!7679 (bvmul (bvxor h!1620 (bvlshr h!1620 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!7679 (bvlshr x!7679 #b00000000000000000000000000001101)) mask!853))))) (and (bvslt res!23913 (bvadd mask!853 #b00000000000000000000000000000001)) (bvsge res!23913 #b00000000000000000000000000000000))))))

(assert (=> d!6805 (= (toIndex!0 (select (arr!1235 lt!14713) #b00000000000000000000000000000000) mask!853) (bvand (bvxor lt!15204 (bvlshr lt!15204 #b00000000000000000000000000001101)) mask!853))))

(assert (=> d!6655 d!6805))

(assert (=> d!6655 d!6573))

(declare-fun d!6807 () Bool)

(assert (=> d!6807 (= (validKeyInArray!0 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!39549 d!6807))

(declare-fun d!6809 () Bool)

(assert (=> d!6809 (= (apply!52 lt!14920 #b0000000000000000000000000000000000000000000000000000000000000000) (get!695 (getValueByKey!99 (toList!544 lt!14920) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1667 () Bool)

(assert (= bs!1667 d!6809))

(declare-fun m!32713 () Bool)

(assert (=> bs!1667 m!32713))

(assert (=> bs!1667 m!32713))

(declare-fun m!32715 () Bool)

(assert (=> bs!1667 m!32715))

(assert (=> b!39528 d!6809))

(assert (=> b!39542 d!6783))

(declare-fun d!6811 () Bool)

(assert (=> d!6811 (arrayContainsKey!0 (_keys!3266 lt!14709) lt!15048 #b00000000000000000000000000000000)))

(declare-fun lt!15205 () Unit!967)

(assert (=> d!6811 (= lt!15205 (choose!13 (_keys!3266 lt!14709) lt!15048 #b00000000000000000000000000000000))))

(assert (=> d!6811 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!6811 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3266 lt!14709) lt!15048 #b00000000000000000000000000000000) lt!15205)))

(declare-fun bs!1668 () Bool)

(assert (= bs!1668 d!6811))

(assert (=> bs!1668 m!32277))

(declare-fun m!32717 () Bool)

(assert (=> bs!1668 m!32717))

(assert (=> b!39673 d!6811))

(declare-fun d!6813 () Bool)

(declare-fun res!23914 () Bool)

(declare-fun e!25351 () Bool)

(assert (=> d!6813 (=> res!23914 e!25351)))

(assert (=> d!6813 (= res!23914 (= (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000) lt!15048))))

(assert (=> d!6813 (= (arrayContainsKey!0 (_keys!3266 lt!14709) lt!15048 #b00000000000000000000000000000000) e!25351)))

(declare-fun b!39947 () Bool)

(declare-fun e!25352 () Bool)

(assert (=> b!39947 (= e!25351 e!25352)))

(declare-fun res!23915 () Bool)

(assert (=> b!39947 (=> (not res!23915) (not e!25352))))

(assert (=> b!39947 (= res!23915 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1357 (_keys!3266 lt!14709))))))

(declare-fun b!39948 () Bool)

(assert (=> b!39948 (= e!25352 (arrayContainsKey!0 (_keys!3266 lt!14709) lt!15048 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6813 (not res!23914)) b!39947))

(assert (= (and b!39947 res!23915) b!39948))

(assert (=> d!6813 m!32123))

(declare-fun m!32719 () Bool)

(assert (=> b!39948 m!32719))

(assert (=> b!39673 d!6813))

(declare-fun b!39949 () Bool)

(declare-fun e!25354 () SeekEntryResult!170)

(declare-fun lt!15206 () SeekEntryResult!170)

(assert (=> b!39949 (= e!25354 (MissingZero!170 (index!2804 lt!15206)))))

(declare-fun b!39950 () Bool)

(declare-fun c!4810 () Bool)

(declare-fun lt!15208 () (_ BitVec 64))

(assert (=> b!39950 (= c!4810 (= lt!15208 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25355 () SeekEntryResult!170)

(assert (=> b!39950 (= e!25355 e!25354)))

(declare-fun b!39951 () Bool)

(assert (=> b!39951 (= e!25355 (Found!170 (index!2804 lt!15206)))))

(declare-fun b!39952 () Bool)

(assert (=> b!39952 (= e!25354 (seekKeyOrZeroReturnVacant!0 (x!7656 lt!15206) (index!2804 lt!15206) (index!2804 lt!15206) (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000) (_keys!3266 lt!14709) (mask!5142 lt!14709)))))

(declare-fun d!6815 () Bool)

(declare-fun lt!15207 () SeekEntryResult!170)

(assert (=> d!6815 (and (or ((_ is Undefined!170) lt!15207) (not ((_ is Found!170) lt!15207)) (and (bvsge (index!2803 lt!15207) #b00000000000000000000000000000000) (bvslt (index!2803 lt!15207) (size!1357 (_keys!3266 lt!14709))))) (or ((_ is Undefined!170) lt!15207) ((_ is Found!170) lt!15207) (not ((_ is MissingZero!170) lt!15207)) (and (bvsge (index!2802 lt!15207) #b00000000000000000000000000000000) (bvslt (index!2802 lt!15207) (size!1357 (_keys!3266 lt!14709))))) (or ((_ is Undefined!170) lt!15207) ((_ is Found!170) lt!15207) ((_ is MissingZero!170) lt!15207) (not ((_ is MissingVacant!170) lt!15207)) (and (bvsge (index!2805 lt!15207) #b00000000000000000000000000000000) (bvslt (index!2805 lt!15207) (size!1357 (_keys!3266 lt!14709))))) (or ((_ is Undefined!170) lt!15207) (ite ((_ is Found!170) lt!15207) (= (select (arr!1235 (_keys!3266 lt!14709)) (index!2803 lt!15207)) (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!170) lt!15207) (= (select (arr!1235 (_keys!3266 lt!14709)) (index!2802 lt!15207)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!170) lt!15207) (= (select (arr!1235 (_keys!3266 lt!14709)) (index!2805 lt!15207)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!25353 () SeekEntryResult!170)

(assert (=> d!6815 (= lt!15207 e!25353)))

(declare-fun c!4811 () Bool)

(assert (=> d!6815 (= c!4811 (and ((_ is Intermediate!170) lt!15206) (undefined!982 lt!15206)))))

(assert (=> d!6815 (= lt!15206 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000) (mask!5142 lt!14709)) (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000) (_keys!3266 lt!14709) (mask!5142 lt!14709)))))

(assert (=> d!6815 (validMask!0 (mask!5142 lt!14709))))

(assert (=> d!6815 (= (seekEntryOrOpen!0 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000) (_keys!3266 lt!14709) (mask!5142 lt!14709)) lt!15207)))

(declare-fun b!39953 () Bool)

(assert (=> b!39953 (= e!25353 Undefined!170)))

(declare-fun b!39954 () Bool)

(assert (=> b!39954 (= e!25353 e!25355)))

(assert (=> b!39954 (= lt!15208 (select (arr!1235 (_keys!3266 lt!14709)) (index!2804 lt!15206)))))

(declare-fun c!4809 () Bool)

(assert (=> b!39954 (= c!4809 (= lt!15208 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)))))

(assert (= (and d!6815 c!4811) b!39953))

(assert (= (and d!6815 (not c!4811)) b!39954))

(assert (= (and b!39954 c!4809) b!39951))

(assert (= (and b!39954 (not c!4809)) b!39950))

(assert (= (and b!39950 c!4810) b!39949))

(assert (= (and b!39950 (not c!4810)) b!39952))

(assert (=> b!39952 m!32123))

(declare-fun m!32721 () Bool)

(assert (=> b!39952 m!32721))

(declare-fun m!32723 () Bool)

(assert (=> d!6815 m!32723))

(assert (=> d!6815 m!32123))

(declare-fun m!32725 () Bool)

(assert (=> d!6815 m!32725))

(assert (=> d!6815 m!32049))

(assert (=> d!6815 m!32725))

(assert (=> d!6815 m!32123))

(declare-fun m!32727 () Bool)

(assert (=> d!6815 m!32727))

(declare-fun m!32729 () Bool)

(assert (=> d!6815 m!32729))

(declare-fun m!32731 () Bool)

(assert (=> d!6815 m!32731))

(declare-fun m!32733 () Bool)

(assert (=> b!39954 m!32733))

(assert (=> b!39673 d!6815))

(assert (=> d!6643 d!6557))

(declare-fun d!6817 () Bool)

(assert (=> d!6817 (= (size!1374 lt!14709) (bvadd (_size!166 lt!14709) (bvsdiv (bvadd (extraKeys!1686 lt!14709) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!39359 d!6817))

(assert (=> b!39672 d!6807))

(assert (=> b!39547 d!6807))

(assert (=> b!39358 d!6817))

(declare-fun d!6819 () Bool)

(assert (=> d!6819 (contains!506 (+!61 lt!14930 (tuple2!1481 lt!14935 (zeroValue!1713 lt!14709))) lt!14922)))

(declare-fun lt!15211 () Unit!967)

(declare-fun choose!244 (ListLongMap!1057 (_ BitVec 64) V!2091 (_ BitVec 64)) Unit!967)

(assert (=> d!6819 (= lt!15211 (choose!244 lt!14930 lt!14935 (zeroValue!1713 lt!14709) lt!14922))))

(assert (=> d!6819 (contains!506 lt!14930 lt!14922)))

(assert (=> d!6819 (= (addStillContains!28 lt!14930 lt!14935 (zeroValue!1713 lt!14709) lt!14922) lt!15211)))

(declare-fun bs!1669 () Bool)

(assert (= bs!1669 d!6819))

(assert (=> bs!1669 m!32157))

(assert (=> bs!1669 m!32157))

(assert (=> bs!1669 m!32159))

(declare-fun m!32735 () Bool)

(assert (=> bs!1669 m!32735))

(declare-fun m!32737 () Bool)

(assert (=> bs!1669 m!32737))

(assert (=> b!39526 d!6819))

(declare-fun d!6821 () Bool)

(assert (=> d!6821 (= (apply!52 (+!61 lt!14931 (tuple2!1481 lt!14929 (zeroValue!1713 lt!14709))) lt!14923) (get!695 (getValueByKey!99 (toList!544 (+!61 lt!14931 (tuple2!1481 lt!14929 (zeroValue!1713 lt!14709)))) lt!14923)))))

(declare-fun bs!1670 () Bool)

(assert (= bs!1670 d!6821))

(declare-fun m!32739 () Bool)

(assert (=> bs!1670 m!32739))

(assert (=> bs!1670 m!32739))

(declare-fun m!32741 () Bool)

(assert (=> bs!1670 m!32741))

(assert (=> b!39526 d!6821))

(declare-fun d!6823 () Bool)

(declare-fun e!25373 () Bool)

(assert (=> d!6823 e!25373))

(declare-fun res!23930 () Bool)

(assert (=> d!6823 (=> (not res!23930) (not e!25373))))

(declare-fun lt!15228 () ListLongMap!1057)

(assert (=> d!6823 (= res!23930 (contains!506 lt!15228 (_1!751 (tuple2!1481 lt!14933 (minValue!1713 lt!14709)))))))

(declare-fun lt!15226 () List!1048)

(assert (=> d!6823 (= lt!15228 (ListLongMap!1058 lt!15226))))

(declare-fun lt!15227 () Unit!967)

(declare-fun lt!15229 () Unit!967)

(assert (=> d!6823 (= lt!15227 lt!15229)))

(assert (=> d!6823 (= (getValueByKey!99 lt!15226 (_1!751 (tuple2!1481 lt!14933 (minValue!1713 lt!14709)))) (Some!104 (_2!751 (tuple2!1481 lt!14933 (minValue!1713 lt!14709)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!24 (List!1048 (_ BitVec 64) V!2091) Unit!967)

(assert (=> d!6823 (= lt!15229 (lemmaContainsTupThenGetReturnValue!24 lt!15226 (_1!751 (tuple2!1481 lt!14933 (minValue!1713 lt!14709))) (_2!751 (tuple2!1481 lt!14933 (minValue!1713 lt!14709)))))))

(declare-fun insertStrictlySorted!21 (List!1048 (_ BitVec 64) V!2091) List!1048)

(assert (=> d!6823 (= lt!15226 (insertStrictlySorted!21 (toList!544 lt!14932) (_1!751 (tuple2!1481 lt!14933 (minValue!1713 lt!14709))) (_2!751 (tuple2!1481 lt!14933 (minValue!1713 lt!14709)))))))

(assert (=> d!6823 (= (+!61 lt!14932 (tuple2!1481 lt!14933 (minValue!1713 lt!14709))) lt!15228)))

(declare-fun b!39987 () Bool)

(declare-fun res!23929 () Bool)

(assert (=> b!39987 (=> (not res!23929) (not e!25373))))

(assert (=> b!39987 (= res!23929 (= (getValueByKey!99 (toList!544 lt!15228) (_1!751 (tuple2!1481 lt!14933 (minValue!1713 lt!14709)))) (Some!104 (_2!751 (tuple2!1481 lt!14933 (minValue!1713 lt!14709))))))))

(declare-fun b!39988 () Bool)

(declare-fun contains!510 (List!1048 tuple2!1480) Bool)

(assert (=> b!39988 (= e!25373 (contains!510 (toList!544 lt!15228) (tuple2!1481 lt!14933 (minValue!1713 lt!14709))))))

(assert (= (and d!6823 res!23930) b!39987))

(assert (= (and b!39987 res!23929) b!39988))

(declare-fun m!32751 () Bool)

(assert (=> d!6823 m!32751))

(declare-fun m!32753 () Bool)

(assert (=> d!6823 m!32753))

(declare-fun m!32755 () Bool)

(assert (=> d!6823 m!32755))

(declare-fun m!32757 () Bool)

(assert (=> d!6823 m!32757))

(declare-fun m!32759 () Bool)

(assert (=> b!39987 m!32759))

(declare-fun m!32761 () Bool)

(assert (=> b!39988 m!32761))

(assert (=> b!39526 d!6823))

(declare-fun d!6827 () Bool)

(assert (=> d!6827 (= (apply!52 (+!61 lt!14938 (tuple2!1481 lt!14918 (minValue!1713 lt!14709))) lt!14937) (apply!52 lt!14938 lt!14937))))

(declare-fun lt!15238 () Unit!967)

(declare-fun choose!245 (ListLongMap!1057 (_ BitVec 64) V!2091 (_ BitVec 64)) Unit!967)

(assert (=> d!6827 (= lt!15238 (choose!245 lt!14938 lt!14918 (minValue!1713 lt!14709) lt!14937))))

(declare-fun e!25376 () Bool)

(assert (=> d!6827 e!25376))

(declare-fun res!23934 () Bool)

(assert (=> d!6827 (=> (not res!23934) (not e!25376))))

(assert (=> d!6827 (= res!23934 (contains!506 lt!14938 lt!14937))))

(assert (=> d!6827 (= (addApplyDifferent!28 lt!14938 lt!14918 (minValue!1713 lt!14709) lt!14937) lt!15238)))

(declare-fun b!39992 () Bool)

(assert (=> b!39992 (= e!25376 (not (= lt!14937 lt!14918)))))

(assert (= (and d!6827 res!23934) b!39992))

(assert (=> d!6827 m!32149))

(assert (=> d!6827 m!32151))

(assert (=> d!6827 m!32167))

(assert (=> d!6827 m!32149))

(declare-fun m!32763 () Bool)

(assert (=> d!6827 m!32763))

(declare-fun m!32765 () Bool)

(assert (=> d!6827 m!32765))

(assert (=> b!39526 d!6827))

(declare-fun d!6831 () Bool)

(assert (=> d!6831 (= (apply!52 lt!14932 lt!14921) (get!695 (getValueByKey!99 (toList!544 lt!14932) lt!14921)))))

(declare-fun bs!1671 () Bool)

(assert (= bs!1671 d!6831))

(declare-fun m!32769 () Bool)

(assert (=> bs!1671 m!32769))

(assert (=> bs!1671 m!32769))

(declare-fun m!32773 () Bool)

(assert (=> bs!1671 m!32773))

(assert (=> b!39526 d!6831))

(declare-fun d!6835 () Bool)

(declare-fun e!25379 () Bool)

(assert (=> d!6835 e!25379))

(declare-fun res!23938 () Bool)

(assert (=> d!6835 (=> (not res!23938) (not e!25379))))

(declare-fun lt!15242 () ListLongMap!1057)

(assert (=> d!6835 (= res!23938 (contains!506 lt!15242 (_1!751 (tuple2!1481 lt!14935 (zeroValue!1713 lt!14709)))))))

(declare-fun lt!15240 () List!1048)

(assert (=> d!6835 (= lt!15242 (ListLongMap!1058 lt!15240))))

(declare-fun lt!15241 () Unit!967)

(declare-fun lt!15243 () Unit!967)

(assert (=> d!6835 (= lt!15241 lt!15243)))

(assert (=> d!6835 (= (getValueByKey!99 lt!15240 (_1!751 (tuple2!1481 lt!14935 (zeroValue!1713 lt!14709)))) (Some!104 (_2!751 (tuple2!1481 lt!14935 (zeroValue!1713 lt!14709)))))))

(assert (=> d!6835 (= lt!15243 (lemmaContainsTupThenGetReturnValue!24 lt!15240 (_1!751 (tuple2!1481 lt!14935 (zeroValue!1713 lt!14709))) (_2!751 (tuple2!1481 lt!14935 (zeroValue!1713 lt!14709)))))))

(assert (=> d!6835 (= lt!15240 (insertStrictlySorted!21 (toList!544 lt!14930) (_1!751 (tuple2!1481 lt!14935 (zeroValue!1713 lt!14709))) (_2!751 (tuple2!1481 lt!14935 (zeroValue!1713 lt!14709)))))))

(assert (=> d!6835 (= (+!61 lt!14930 (tuple2!1481 lt!14935 (zeroValue!1713 lt!14709))) lt!15242)))

(declare-fun b!39995 () Bool)

(declare-fun res!23937 () Bool)

(assert (=> b!39995 (=> (not res!23937) (not e!25379))))

(assert (=> b!39995 (= res!23937 (= (getValueByKey!99 (toList!544 lt!15242) (_1!751 (tuple2!1481 lt!14935 (zeroValue!1713 lt!14709)))) (Some!104 (_2!751 (tuple2!1481 lt!14935 (zeroValue!1713 lt!14709))))))))

(declare-fun b!39996 () Bool)

(assert (=> b!39996 (= e!25379 (contains!510 (toList!544 lt!15242) (tuple2!1481 lt!14935 (zeroValue!1713 lt!14709))))))

(assert (= (and d!6835 res!23938) b!39995))

(assert (= (and b!39995 res!23937) b!39996))

(declare-fun m!32775 () Bool)

(assert (=> d!6835 m!32775))

(declare-fun m!32777 () Bool)

(assert (=> d!6835 m!32777))

(declare-fun m!32779 () Bool)

(assert (=> d!6835 m!32779))

(declare-fun m!32781 () Bool)

(assert (=> d!6835 m!32781))

(declare-fun m!32783 () Bool)

(assert (=> b!39995 m!32783))

(declare-fun m!32785 () Bool)

(assert (=> b!39996 m!32785))

(assert (=> b!39526 d!6835))

(declare-fun d!6837 () Bool)

(assert (=> d!6837 (= (apply!52 (+!61 lt!14931 (tuple2!1481 lt!14929 (zeroValue!1713 lt!14709))) lt!14923) (apply!52 lt!14931 lt!14923))))

(declare-fun lt!15244 () Unit!967)

(assert (=> d!6837 (= lt!15244 (choose!245 lt!14931 lt!14929 (zeroValue!1713 lt!14709) lt!14923))))

(declare-fun e!25380 () Bool)

(assert (=> d!6837 e!25380))

(declare-fun res!23939 () Bool)

(assert (=> d!6837 (=> (not res!23939) (not e!25380))))

(assert (=> d!6837 (= res!23939 (contains!506 lt!14931 lt!14923))))

(assert (=> d!6837 (= (addApplyDifferent!28 lt!14931 lt!14929 (zeroValue!1713 lt!14709) lt!14923) lt!15244)))

(declare-fun b!39997 () Bool)

(assert (=> b!39997 (= e!25380 (not (= lt!14923 lt!14929)))))

(assert (= (and d!6837 res!23939) b!39997))

(assert (=> d!6837 m!32145))

(assert (=> d!6837 m!32147))

(assert (=> d!6837 m!32155))

(assert (=> d!6837 m!32145))

(declare-fun m!32787 () Bool)

(assert (=> d!6837 m!32787))

(declare-fun m!32789 () Bool)

(assert (=> d!6837 m!32789))

(assert (=> b!39526 d!6837))

(declare-fun d!6839 () Bool)

(assert (=> d!6839 (= (apply!52 (+!61 lt!14938 (tuple2!1481 lt!14918 (minValue!1713 lt!14709))) lt!14937) (get!695 (getValueByKey!99 (toList!544 (+!61 lt!14938 (tuple2!1481 lt!14918 (minValue!1713 lt!14709)))) lt!14937)))))

(declare-fun bs!1672 () Bool)

(assert (= bs!1672 d!6839))

(declare-fun m!32791 () Bool)

(assert (=> bs!1672 m!32791))

(assert (=> bs!1672 m!32791))

(declare-fun m!32793 () Bool)

(assert (=> bs!1672 m!32793))

(assert (=> b!39526 d!6839))

(declare-fun d!6841 () Bool)

(assert (=> d!6841 (= (apply!52 (+!61 lt!14932 (tuple2!1481 lt!14933 (minValue!1713 lt!14709))) lt!14921) (apply!52 lt!14932 lt!14921))))

(declare-fun lt!15245 () Unit!967)

(assert (=> d!6841 (= lt!15245 (choose!245 lt!14932 lt!14933 (minValue!1713 lt!14709) lt!14921))))

(declare-fun e!25381 () Bool)

(assert (=> d!6841 e!25381))

(declare-fun res!23940 () Bool)

(assert (=> d!6841 (=> (not res!23940) (not e!25381))))

(assert (=> d!6841 (= res!23940 (contains!506 lt!14932 lt!14921))))

(assert (=> d!6841 (= (addApplyDifferent!28 lt!14932 lt!14933 (minValue!1713 lt!14709) lt!14921) lt!15245)))

(declare-fun b!39998 () Bool)

(assert (=> b!39998 (= e!25381 (not (= lt!14921 lt!14933)))))

(assert (= (and d!6841 res!23940) b!39998))

(assert (=> d!6841 m!32139))

(assert (=> d!6841 m!32141))

(assert (=> d!6841 m!32163))

(assert (=> d!6841 m!32139))

(declare-fun m!32795 () Bool)

(assert (=> d!6841 m!32795))

(declare-fun m!32797 () Bool)

(assert (=> d!6841 m!32797))

(assert (=> b!39526 d!6841))

(declare-fun d!6843 () Bool)

(assert (=> d!6843 (= (apply!52 lt!14931 lt!14923) (get!695 (getValueByKey!99 (toList!544 lt!14931) lt!14923)))))

(declare-fun bs!1673 () Bool)

(assert (= bs!1673 d!6843))

(declare-fun m!32799 () Bool)

(assert (=> bs!1673 m!32799))

(assert (=> bs!1673 m!32799))

(declare-fun m!32801 () Bool)

(assert (=> bs!1673 m!32801))

(assert (=> b!39526 d!6843))

(declare-fun d!6845 () Bool)

(assert (=> d!6845 (= (apply!52 lt!14938 lt!14937) (get!695 (getValueByKey!99 (toList!544 lt!14938) lt!14937)))))

(declare-fun bs!1674 () Bool)

(assert (= bs!1674 d!6845))

(declare-fun m!32803 () Bool)

(assert (=> bs!1674 m!32803))

(assert (=> bs!1674 m!32803))

(declare-fun m!32805 () Bool)

(assert (=> bs!1674 m!32805))

(assert (=> b!39526 d!6845))

(declare-fun d!6847 () Bool)

(declare-fun e!25387 () Bool)

(assert (=> d!6847 e!25387))

(declare-fun res!23943 () Bool)

(assert (=> d!6847 (=> res!23943 e!25387)))

(declare-fun lt!15255 () Bool)

(assert (=> d!6847 (= res!23943 (not lt!15255))))

(declare-fun lt!15257 () Bool)

(assert (=> d!6847 (= lt!15255 lt!15257)))

(declare-fun lt!15254 () Unit!967)

(declare-fun e!25386 () Unit!967)

(assert (=> d!6847 (= lt!15254 e!25386)))

(declare-fun c!4823 () Bool)

(assert (=> d!6847 (= c!4823 lt!15257)))

(declare-fun containsKey!67 (List!1048 (_ BitVec 64)) Bool)

(assert (=> d!6847 (= lt!15257 (containsKey!67 (toList!544 (+!61 lt!14930 (tuple2!1481 lt!14935 (zeroValue!1713 lt!14709)))) lt!14922))))

(assert (=> d!6847 (= (contains!506 (+!61 lt!14930 (tuple2!1481 lt!14935 (zeroValue!1713 lt!14709))) lt!14922) lt!15255)))

(declare-fun b!40005 () Bool)

(declare-fun lt!15259 () Unit!967)

(assert (=> b!40005 (= e!25386 lt!15259)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!55 (List!1048 (_ BitVec 64)) Unit!967)

(assert (=> b!40005 (= lt!15259 (lemmaContainsKeyImpliesGetValueByKeyDefined!55 (toList!544 (+!61 lt!14930 (tuple2!1481 lt!14935 (zeroValue!1713 lt!14709)))) lt!14922))))

(declare-fun isDefined!56 (Option!105) Bool)

(assert (=> b!40005 (isDefined!56 (getValueByKey!99 (toList!544 (+!61 lt!14930 (tuple2!1481 lt!14935 (zeroValue!1713 lt!14709)))) lt!14922))))

(declare-fun b!40006 () Bool)

(declare-fun Unit!978 () Unit!967)

(assert (=> b!40006 (= e!25386 Unit!978)))

(declare-fun b!40007 () Bool)

(assert (=> b!40007 (= e!25387 (isDefined!56 (getValueByKey!99 (toList!544 (+!61 lt!14930 (tuple2!1481 lt!14935 (zeroValue!1713 lt!14709)))) lt!14922)))))

(assert (= (and d!6847 c!4823) b!40005))

(assert (= (and d!6847 (not c!4823)) b!40006))

(assert (= (and d!6847 (not res!23943)) b!40007))

(declare-fun m!32807 () Bool)

(assert (=> d!6847 m!32807))

(declare-fun m!32809 () Bool)

(assert (=> b!40005 m!32809))

(declare-fun m!32811 () Bool)

(assert (=> b!40005 m!32811))

(assert (=> b!40005 m!32811))

(declare-fun m!32813 () Bool)

(assert (=> b!40005 m!32813))

(assert (=> b!40007 m!32811))

(assert (=> b!40007 m!32811))

(assert (=> b!40007 m!32813))

(assert (=> b!39526 d!6847))

(declare-fun d!6849 () Bool)

(assert (=> d!6849 (= (apply!52 (+!61 lt!14932 (tuple2!1481 lt!14933 (minValue!1713 lt!14709))) lt!14921) (get!695 (getValueByKey!99 (toList!544 (+!61 lt!14932 (tuple2!1481 lt!14933 (minValue!1713 lt!14709)))) lt!14921)))))

(declare-fun bs!1675 () Bool)

(assert (= bs!1675 d!6849))

(declare-fun m!32815 () Bool)

(assert (=> bs!1675 m!32815))

(assert (=> bs!1675 m!32815))

(declare-fun m!32817 () Bool)

(assert (=> bs!1675 m!32817))

(assert (=> b!39526 d!6849))

(declare-fun d!6851 () Bool)

(declare-fun e!25394 () Bool)

(assert (=> d!6851 e!25394))

(declare-fun res!23945 () Bool)

(assert (=> d!6851 (=> (not res!23945) (not e!25394))))

(declare-fun lt!15264 () ListLongMap!1057)

(assert (=> d!6851 (= res!23945 (contains!506 lt!15264 (_1!751 (tuple2!1481 lt!14929 (zeroValue!1713 lt!14709)))))))

(declare-fun lt!15262 () List!1048)

(assert (=> d!6851 (= lt!15264 (ListLongMap!1058 lt!15262))))

(declare-fun lt!15263 () Unit!967)

(declare-fun lt!15265 () Unit!967)

(assert (=> d!6851 (= lt!15263 lt!15265)))

(assert (=> d!6851 (= (getValueByKey!99 lt!15262 (_1!751 (tuple2!1481 lt!14929 (zeroValue!1713 lt!14709)))) (Some!104 (_2!751 (tuple2!1481 lt!14929 (zeroValue!1713 lt!14709)))))))

(assert (=> d!6851 (= lt!15265 (lemmaContainsTupThenGetReturnValue!24 lt!15262 (_1!751 (tuple2!1481 lt!14929 (zeroValue!1713 lt!14709))) (_2!751 (tuple2!1481 lt!14929 (zeroValue!1713 lt!14709)))))))

(assert (=> d!6851 (= lt!15262 (insertStrictlySorted!21 (toList!544 lt!14931) (_1!751 (tuple2!1481 lt!14929 (zeroValue!1713 lt!14709))) (_2!751 (tuple2!1481 lt!14929 (zeroValue!1713 lt!14709)))))))

(assert (=> d!6851 (= (+!61 lt!14931 (tuple2!1481 lt!14929 (zeroValue!1713 lt!14709))) lt!15264)))

(declare-fun b!40020 () Bool)

(declare-fun res!23944 () Bool)

(assert (=> b!40020 (=> (not res!23944) (not e!25394))))

(assert (=> b!40020 (= res!23944 (= (getValueByKey!99 (toList!544 lt!15264) (_1!751 (tuple2!1481 lt!14929 (zeroValue!1713 lt!14709)))) (Some!104 (_2!751 (tuple2!1481 lt!14929 (zeroValue!1713 lt!14709))))))))

(declare-fun b!40021 () Bool)

(assert (=> b!40021 (= e!25394 (contains!510 (toList!544 lt!15264) (tuple2!1481 lt!14929 (zeroValue!1713 lt!14709))))))

(assert (= (and d!6851 res!23945) b!40020))

(assert (= (and b!40020 res!23944) b!40021))

(declare-fun m!32819 () Bool)

(assert (=> d!6851 m!32819))

(declare-fun m!32821 () Bool)

(assert (=> d!6851 m!32821))

(declare-fun m!32823 () Bool)

(assert (=> d!6851 m!32823))

(declare-fun m!32825 () Bool)

(assert (=> d!6851 m!32825))

(declare-fun m!32827 () Bool)

(assert (=> b!40020 m!32827))

(declare-fun m!32829 () Bool)

(assert (=> b!40021 m!32829))

(assert (=> b!39526 d!6851))

(declare-fun d!6853 () Bool)

(declare-fun e!25395 () Bool)

(assert (=> d!6853 e!25395))

(declare-fun res!23947 () Bool)

(assert (=> d!6853 (=> (not res!23947) (not e!25395))))

(declare-fun lt!15268 () ListLongMap!1057)

(assert (=> d!6853 (= res!23947 (contains!506 lt!15268 (_1!751 (tuple2!1481 lt!14918 (minValue!1713 lt!14709)))))))

(declare-fun lt!15266 () List!1048)

(assert (=> d!6853 (= lt!15268 (ListLongMap!1058 lt!15266))))

(declare-fun lt!15267 () Unit!967)

(declare-fun lt!15269 () Unit!967)

(assert (=> d!6853 (= lt!15267 lt!15269)))

(assert (=> d!6853 (= (getValueByKey!99 lt!15266 (_1!751 (tuple2!1481 lt!14918 (minValue!1713 lt!14709)))) (Some!104 (_2!751 (tuple2!1481 lt!14918 (minValue!1713 lt!14709)))))))

(assert (=> d!6853 (= lt!15269 (lemmaContainsTupThenGetReturnValue!24 lt!15266 (_1!751 (tuple2!1481 lt!14918 (minValue!1713 lt!14709))) (_2!751 (tuple2!1481 lt!14918 (minValue!1713 lt!14709)))))))

(assert (=> d!6853 (= lt!15266 (insertStrictlySorted!21 (toList!544 lt!14938) (_1!751 (tuple2!1481 lt!14918 (minValue!1713 lt!14709))) (_2!751 (tuple2!1481 lt!14918 (minValue!1713 lt!14709)))))))

(assert (=> d!6853 (= (+!61 lt!14938 (tuple2!1481 lt!14918 (minValue!1713 lt!14709))) lt!15268)))

(declare-fun b!40022 () Bool)

(declare-fun res!23946 () Bool)

(assert (=> b!40022 (=> (not res!23946) (not e!25395))))

(assert (=> b!40022 (= res!23946 (= (getValueByKey!99 (toList!544 lt!15268) (_1!751 (tuple2!1481 lt!14918 (minValue!1713 lt!14709)))) (Some!104 (_2!751 (tuple2!1481 lt!14918 (minValue!1713 lt!14709))))))))

(declare-fun b!40023 () Bool)

(assert (=> b!40023 (= e!25395 (contains!510 (toList!544 lt!15268) (tuple2!1481 lt!14918 (minValue!1713 lt!14709))))))

(assert (= (and d!6853 res!23947) b!40022))

(assert (= (and b!40022 res!23946) b!40023))

(declare-fun m!32831 () Bool)

(assert (=> d!6853 m!32831))

(declare-fun m!32833 () Bool)

(assert (=> d!6853 m!32833))

(declare-fun m!32835 () Bool)

(assert (=> d!6853 m!32835))

(declare-fun m!32837 () Bool)

(assert (=> d!6853 m!32837))

(declare-fun m!32839 () Bool)

(assert (=> b!40022 m!32839))

(declare-fun m!32841 () Bool)

(assert (=> b!40023 m!32841))

(assert (=> b!39526 d!6853))

(declare-fun b!40108 () Bool)

(declare-fun e!25452 () Bool)

(declare-fun e!25450 () Bool)

(assert (=> b!40108 (= e!25452 e!25450)))

(declare-fun c!4859 () Bool)

(declare-fun e!25448 () Bool)

(assert (=> b!40108 (= c!4859 e!25448)))

(declare-fun res!23982 () Bool)

(assert (=> b!40108 (=> (not res!23982) (not e!25448))))

(assert (=> b!40108 (= res!23982 (bvslt #b00000000000000000000000000000000 (size!1357 (_keys!3266 lt!14709))))))

(declare-fun b!40109 () Bool)

(declare-fun lt!15332 () Unit!967)

(declare-fun lt!15333 () Unit!967)

(assert (=> b!40109 (= lt!15332 lt!15333)))

(declare-fun lt!15337 () (_ BitVec 64))

(declare-fun lt!15338 () (_ BitVec 64))

(declare-fun lt!15334 () V!2091)

(declare-fun lt!15335 () ListLongMap!1057)

(assert (=> b!40109 (not (contains!506 (+!61 lt!15335 (tuple2!1481 lt!15338 lt!15334)) lt!15337))))

(declare-fun addStillNotContains!5 (ListLongMap!1057 (_ BitVec 64) V!2091 (_ BitVec 64)) Unit!967)

(assert (=> b!40109 (= lt!15333 (addStillNotContains!5 lt!15335 lt!15338 lt!15334 lt!15337))))

(assert (=> b!40109 (= lt!15337 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!40109 (= lt!15334 (get!689 (select (arr!1236 (_values!1778 lt!14709)) #b00000000000000000000000000000000) (dynLambda!188 (defaultEntry!1795 lt!14709) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!40109 (= lt!15338 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000))))

(declare-fun call!3091 () ListLongMap!1057)

(assert (=> b!40109 (= lt!15335 call!3091)))

(declare-fun e!25451 () ListLongMap!1057)

(assert (=> b!40109 (= e!25451 (+!61 call!3091 (tuple2!1481 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000) (get!689 (select (arr!1236 (_values!1778 lt!14709)) #b00000000000000000000000000000000) (dynLambda!188 (defaultEntry!1795 lt!14709) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!40110 () Bool)

(declare-fun e!25449 () Bool)

(assert (=> b!40110 (= e!25450 e!25449)))

(declare-fun c!4858 () Bool)

(assert (=> b!40110 (= c!4858 (bvslt #b00000000000000000000000000000000 (size!1357 (_keys!3266 lt!14709))))))

(declare-fun b!40111 () Bool)

(declare-fun lt!15336 () ListLongMap!1057)

(assert (=> b!40111 (= e!25449 (= lt!15336 (getCurrentListMapNoExtraKeys!30 (_keys!3266 lt!14709) (_values!1778 lt!14709) (mask!5142 lt!14709) (extraKeys!1686 lt!14709) (zeroValue!1713 lt!14709) (minValue!1713 lt!14709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1795 lt!14709))))))

(declare-fun b!40112 () Bool)

(declare-fun e!25453 () ListLongMap!1057)

(assert (=> b!40112 (= e!25453 e!25451)))

(declare-fun c!4857 () Bool)

(assert (=> b!40112 (= c!4857 (validKeyInArray!0 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)))))

(declare-fun bm!3088 () Bool)

(assert (=> bm!3088 (= call!3091 (getCurrentListMapNoExtraKeys!30 (_keys!3266 lt!14709) (_values!1778 lt!14709) (mask!5142 lt!14709) (extraKeys!1686 lt!14709) (zeroValue!1713 lt!14709) (minValue!1713 lt!14709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1795 lt!14709)))))

(declare-fun b!40113 () Bool)

(assert (=> b!40113 (= e!25451 call!3091)))

(declare-fun b!40114 () Bool)

(declare-fun isEmpty!228 (ListLongMap!1057) Bool)

(assert (=> b!40114 (= e!25449 (isEmpty!228 lt!15336))))

(declare-fun b!40115 () Bool)

(assert (=> b!40115 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1357 (_keys!3266 lt!14709))))))

(assert (=> b!40115 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1358 (_values!1778 lt!14709))))))

(declare-fun e!25454 () Bool)

(assert (=> b!40115 (= e!25454 (= (apply!52 lt!15336 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)) (get!689 (select (arr!1236 (_values!1778 lt!14709)) #b00000000000000000000000000000000) (dynLambda!188 (defaultEntry!1795 lt!14709) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!40107 () Bool)

(declare-fun res!23980 () Bool)

(assert (=> b!40107 (=> (not res!23980) (not e!25452))))

(assert (=> b!40107 (= res!23980 (not (contains!506 lt!15336 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!6855 () Bool)

(assert (=> d!6855 e!25452))

(declare-fun res!23979 () Bool)

(assert (=> d!6855 (=> (not res!23979) (not e!25452))))

(assert (=> d!6855 (= res!23979 (not (contains!506 lt!15336 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6855 (= lt!15336 e!25453)))

(declare-fun c!4856 () Bool)

(assert (=> d!6855 (= c!4856 (bvsge #b00000000000000000000000000000000 (size!1357 (_keys!3266 lt!14709))))))

(assert (=> d!6855 (validMask!0 (mask!5142 lt!14709))))

(assert (=> d!6855 (= (getCurrentListMapNoExtraKeys!30 (_keys!3266 lt!14709) (_values!1778 lt!14709) (mask!5142 lt!14709) (extraKeys!1686 lt!14709) (zeroValue!1713 lt!14709) (minValue!1713 lt!14709) #b00000000000000000000000000000000 (defaultEntry!1795 lt!14709)) lt!15336)))

(declare-fun b!40116 () Bool)

(assert (=> b!40116 (= e!25450 e!25454)))

(assert (=> b!40116 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1357 (_keys!3266 lt!14709))))))

(declare-fun res!23981 () Bool)

(assert (=> b!40116 (= res!23981 (contains!506 lt!15336 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)))))

(assert (=> b!40116 (=> (not res!23981) (not e!25454))))

(declare-fun b!40117 () Bool)

(assert (=> b!40117 (= e!25453 (ListLongMap!1058 Nil!1045))))

(declare-fun b!40118 () Bool)

(assert (=> b!40118 (= e!25448 (validKeyInArray!0 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)))))

(assert (=> b!40118 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (= (and d!6855 c!4856) b!40117))

(assert (= (and d!6855 (not c!4856)) b!40112))

(assert (= (and b!40112 c!4857) b!40109))

(assert (= (and b!40112 (not c!4857)) b!40113))

(assert (= (or b!40109 b!40113) bm!3088))

(assert (= (and d!6855 res!23979) b!40107))

(assert (= (and b!40107 res!23980) b!40108))

(assert (= (and b!40108 res!23982) b!40118))

(assert (= (and b!40108 c!4859) b!40116))

(assert (= (and b!40108 (not c!4859)) b!40110))

(assert (= (and b!40116 res!23981) b!40115))

(assert (= (and b!40110 c!4858) b!40111))

(assert (= (and b!40110 (not c!4858)) b!40114))

(declare-fun b_lambda!2045 () Bool)

(assert (=> (not b_lambda!2045) (not b!40109)))

(assert (=> b!40109 t!3898))

(declare-fun b_and!2349 () Bool)

(assert (= b_and!2339 (and (=> t!3898 result!1429) b_and!2349)))

(declare-fun b_lambda!2047 () Bool)

(assert (=> (not b_lambda!2047) (not b!40115)))

(assert (=> b!40115 t!3898))

(declare-fun b_and!2351 () Bool)

(assert (= b_and!2349 (and (=> t!3898 result!1429) b_and!2351)))

(declare-fun m!32943 () Bool)

(assert (=> bm!3088 m!32943))

(declare-fun m!32945 () Bool)

(assert (=> b!40107 m!32945))

(declare-fun m!32947 () Bool)

(assert (=> d!6855 m!32947))

(assert (=> d!6855 m!32049))

(assert (=> b!40118 m!32123))

(assert (=> b!40118 m!32123))

(assert (=> b!40118 m!32171))

(declare-fun m!32949 () Bool)

(assert (=> b!40114 m!32949))

(assert (=> b!40112 m!32123))

(assert (=> b!40112 m!32123))

(assert (=> b!40112 m!32171))

(assert (=> b!40116 m!32123))

(assert (=> b!40116 m!32123))

(declare-fun m!32951 () Bool)

(assert (=> b!40116 m!32951))

(assert (=> b!40109 m!32121))

(declare-fun m!32953 () Bool)

(assert (=> b!40109 m!32953))

(assert (=> b!40109 m!32123))

(assert (=> b!40109 m!32119))

(assert (=> b!40109 m!32953))

(declare-fun m!32955 () Bool)

(assert (=> b!40109 m!32955))

(declare-fun m!32957 () Bool)

(assert (=> b!40109 m!32957))

(assert (=> b!40109 m!32119))

(assert (=> b!40109 m!32121))

(assert (=> b!40109 m!32127))

(declare-fun m!32959 () Bool)

(assert (=> b!40109 m!32959))

(assert (=> b!40115 m!32123))

(declare-fun m!32961 () Bool)

(assert (=> b!40115 m!32961))

(assert (=> b!40115 m!32121))

(assert (=> b!40115 m!32123))

(assert (=> b!40115 m!32119))

(assert (=> b!40115 m!32119))

(assert (=> b!40115 m!32121))

(assert (=> b!40115 m!32127))

(assert (=> b!40111 m!32943))

(assert (=> b!39526 d!6855))

(declare-fun b!40119 () Bool)

(declare-fun e!25455 () Bool)

(declare-fun call!3092 () Bool)

(assert (=> b!40119 (= e!25455 call!3092)))

(declare-fun b!40120 () Bool)

(declare-fun e!25457 () Bool)

(assert (=> b!40120 (= e!25457 call!3092)))

(declare-fun bm!3089 () Bool)

(assert (=> bm!3089 (= call!3092 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3266 lt!14709) (mask!5142 lt!14709)))))

(declare-fun b!40121 () Bool)

(declare-fun e!25456 () Bool)

(assert (=> b!40121 (= e!25456 e!25455)))

(declare-fun c!4860 () Bool)

(assert (=> b!40121 (= c!4860 (validKeyInArray!0 (select (arr!1235 (_keys!3266 lt!14709)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40122 () Bool)

(assert (=> b!40122 (= e!25455 e!25457)))

(declare-fun lt!15340 () (_ BitVec 64))

(assert (=> b!40122 (= lt!15340 (select (arr!1235 (_keys!3266 lt!14709)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!15341 () Unit!967)

(assert (=> b!40122 (= lt!15341 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3266 lt!14709) lt!15340 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!40122 (arrayContainsKey!0 (_keys!3266 lt!14709) lt!15340 #b00000000000000000000000000000000)))

(declare-fun lt!15339 () Unit!967)

(assert (=> b!40122 (= lt!15339 lt!15341)))

(declare-fun res!23983 () Bool)

(assert (=> b!40122 (= res!23983 (= (seekEntryOrOpen!0 (select (arr!1235 (_keys!3266 lt!14709)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3266 lt!14709) (mask!5142 lt!14709)) (Found!170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!40122 (=> (not res!23983) (not e!25457))))

(declare-fun d!6899 () Bool)

(declare-fun res!23984 () Bool)

(assert (=> d!6899 (=> res!23984 e!25456)))

(assert (=> d!6899 (= res!23984 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1357 (_keys!3266 lt!14709))))))

(assert (=> d!6899 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3266 lt!14709) (mask!5142 lt!14709)) e!25456)))

(assert (= (and d!6899 (not res!23984)) b!40121))

(assert (= (and b!40121 c!4860) b!40122))

(assert (= (and b!40121 (not c!4860)) b!40119))

(assert (= (and b!40122 res!23983) b!40120))

(assert (= (or b!40120 b!40119) bm!3089))

(declare-fun m!32963 () Bool)

(assert (=> bm!3089 m!32963))

(assert (=> b!40121 m!32619))

(assert (=> b!40121 m!32619))

(assert (=> b!40121 m!32623))

(assert (=> b!40122 m!32619))

(declare-fun m!32965 () Bool)

(assert (=> b!40122 m!32965))

(declare-fun m!32967 () Bool)

(assert (=> b!40122 m!32967))

(assert (=> b!40122 m!32619))

(declare-fun m!32969 () Bool)

(assert (=> b!40122 m!32969))

(assert (=> bm!3066 d!6899))

(declare-fun d!6901 () Bool)

(declare-fun res!23985 () Bool)

(declare-fun e!25458 () Bool)

(assert (=> d!6901 (=> res!23985 e!25458)))

(assert (=> d!6901 (= res!23985 (= (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14761))))

(assert (=> d!6901 (= (arrayContainsKey!0 lt!14713 lt!14761 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!25458)))

(declare-fun b!40123 () Bool)

(declare-fun e!25459 () Bool)

(assert (=> b!40123 (= e!25458 e!25459)))

(declare-fun res!23986 () Bool)

(assert (=> b!40123 (=> (not res!23986) (not e!25459))))

(assert (=> b!40123 (= res!23986 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1357 lt!14713)))))

(declare-fun b!40124 () Bool)

(assert (=> b!40124 (= e!25459 (arrayContainsKey!0 lt!14713 lt!14761 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!6901 (not res!23985)) b!40123))

(assert (= (and b!40123 res!23986) b!40124))

(assert (=> d!6901 m!32029))

(declare-fun m!32971 () Bool)

(assert (=> b!40124 m!32971))

(assert (=> b!39582 d!6901))

(declare-fun d!6903 () Bool)

(assert (not d!6903))

(assert (=> b!39669 d!6903))

(declare-fun b!40137 () Bool)

(declare-fun e!25468 () SeekEntryResult!170)

(assert (=> b!40137 (= e!25468 (Found!170 (index!2804 lt!15019)))))

(declare-fun b!40138 () Bool)

(declare-fun e!25466 () SeekEntryResult!170)

(assert (=> b!40138 (= e!25466 (MissingVacant!170 (index!2804 lt!15019)))))

(declare-fun b!40139 () Bool)

(declare-fun e!25467 () SeekEntryResult!170)

(assert (=> b!40139 (= e!25467 Undefined!170)))

(declare-fun b!40140 () Bool)

(declare-fun c!4869 () Bool)

(declare-fun lt!15346 () (_ BitVec 64))

(assert (=> b!40140 (= c!4869 (= lt!15346 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!40140 (= e!25468 e!25466)))

(declare-fun d!6905 () Bool)

(declare-fun lt!15347 () SeekEntryResult!170)

(assert (=> d!6905 (and (or ((_ is Undefined!170) lt!15347) (not ((_ is Found!170) lt!15347)) (and (bvsge (index!2803 lt!15347) #b00000000000000000000000000000000) (bvslt (index!2803 lt!15347) (size!1357 lt!14713)))) (or ((_ is Undefined!170) lt!15347) ((_ is Found!170) lt!15347) (not ((_ is MissingVacant!170) lt!15347)) (not (= (index!2805 lt!15347) (index!2804 lt!15019))) (and (bvsge (index!2805 lt!15347) #b00000000000000000000000000000000) (bvslt (index!2805 lt!15347) (size!1357 lt!14713)))) (or ((_ is Undefined!170) lt!15347) (ite ((_ is Found!170) lt!15347) (= (select (arr!1235 lt!14713) (index!2803 lt!15347)) (select (arr!1235 lt!14713) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!170) lt!15347) (= (index!2805 lt!15347) (index!2804 lt!15019)) (= (select (arr!1235 lt!14713) (index!2805 lt!15347)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!6905 (= lt!15347 e!25467)))

(declare-fun c!4867 () Bool)

(assert (=> d!6905 (= c!4867 (bvsge (x!7656 lt!15019) #b01111111111111111111111111111110))))

(assert (=> d!6905 (= lt!15346 (select (arr!1235 lt!14713) (index!2804 lt!15019)))))

(assert (=> d!6905 (validMask!0 mask!853)))

(assert (=> d!6905 (= (seekKeyOrZeroReturnVacant!0 (x!7656 lt!15019) (index!2804 lt!15019) (index!2804 lt!15019) (select (arr!1235 lt!14713) #b00000000000000000000000000000000) lt!14713 mask!853) lt!15347)))

(declare-fun b!40141 () Bool)

(assert (=> b!40141 (= e!25466 (seekKeyOrZeroReturnVacant!0 (bvadd (x!7656 lt!15019) #b00000000000000000000000000000001) (nextIndex!0 (index!2804 lt!15019) (x!7656 lt!15019) mask!853) (index!2804 lt!15019) (select (arr!1235 lt!14713) #b00000000000000000000000000000000) lt!14713 mask!853))))

(declare-fun b!40142 () Bool)

(assert (=> b!40142 (= e!25467 e!25468)))

(declare-fun c!4868 () Bool)

(assert (=> b!40142 (= c!4868 (= lt!15346 (select (arr!1235 lt!14713) #b00000000000000000000000000000000)))))

(assert (= (and d!6905 c!4867) b!40139))

(assert (= (and d!6905 (not c!4867)) b!40142))

(assert (= (and b!40142 c!4868) b!40137))

(assert (= (and b!40142 (not c!4868)) b!40140))

(assert (= (and b!40140 c!4869) b!40138))

(assert (= (and b!40140 (not c!4869)) b!40141))

(declare-fun m!32973 () Bool)

(assert (=> d!6905 m!32973))

(declare-fun m!32975 () Bool)

(assert (=> d!6905 m!32975))

(assert (=> d!6905 m!32265))

(assert (=> d!6905 m!31863))

(declare-fun m!32977 () Bool)

(assert (=> b!40141 m!32977))

(assert (=> b!40141 m!32977))

(assert (=> b!40141 m!31931))

(declare-fun m!32979 () Bool)

(assert (=> b!40141 m!32979))

(assert (=> b!39640 d!6905))

(assert (=> b!39525 d!6807))

(assert (=> bm!3030 d!6855))

(declare-fun b!40143 () Bool)

(declare-fun e!25469 () (_ BitVec 32))

(declare-fun call!3093 () (_ BitVec 32))

(assert (=> b!40143 (= e!25469 call!3093)))

(declare-fun b!40144 () Bool)

(declare-fun e!25470 () (_ BitVec 32))

(assert (=> b!40144 (= e!25470 e!25469)))

(declare-fun c!4871 () Bool)

(assert (=> b!40144 (= c!4871 (validKeyInArray!0 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!40145 () Bool)

(assert (=> b!40145 (= e!25469 (bvadd #b00000000000000000000000000000001 call!3093))))

(declare-fun d!6907 () Bool)

(declare-fun lt!15348 () (_ BitVec 32))

(assert (=> d!6907 (and (bvsge lt!15348 #b00000000000000000000000000000000) (bvsle lt!15348 (bvsub (size!1357 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!6907 (= lt!15348 e!25470)))

(declare-fun c!4870 () Bool)

(assert (=> d!6907 (= c!4870 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6907 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1357 lt!14713)))))

(assert (=> d!6907 (= (arrayCountValidKeys!0 lt!14713 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!15348)))

(declare-fun bm!3090 () Bool)

(assert (=> bm!3090 (= call!3093 (arrayCountValidKeys!0 lt!14713 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!40146 () Bool)

(assert (=> b!40146 (= e!25470 #b00000000000000000000000000000000)))

(assert (= (and d!6907 c!4870) b!40146))

(assert (= (and d!6907 (not c!4870)) b!40144))

(assert (= (and b!40144 c!4871) b!40145))

(assert (= (and b!40144 (not c!4871)) b!40143))

(assert (= (or b!40145 b!40143) bm!3090))

(assert (=> b!40144 m!32649))

(assert (=> b!40144 m!32649))

(assert (=> b!40144 m!32651))

(declare-fun m!32981 () Bool)

(assert (=> bm!3090 m!32981))

(assert (=> bm!2990 d!6907))

(declare-fun d!6909 () Bool)

(declare-fun e!25472 () Bool)

(assert (=> d!6909 e!25472))

(declare-fun res!23987 () Bool)

(assert (=> d!6909 (=> res!23987 e!25472)))

(declare-fun lt!15350 () Bool)

(assert (=> d!6909 (= res!23987 (not lt!15350))))

(declare-fun lt!15351 () Bool)

(assert (=> d!6909 (= lt!15350 lt!15351)))

(declare-fun lt!15349 () Unit!967)

(declare-fun e!25471 () Unit!967)

(assert (=> d!6909 (= lt!15349 e!25471)))

(declare-fun c!4872 () Bool)

(assert (=> d!6909 (= c!4872 lt!15351)))

(assert (=> d!6909 (= lt!15351 (containsKey!67 (toList!544 lt!14920) (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)))))

(assert (=> d!6909 (= (contains!506 lt!14920 (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)) lt!15350)))

(declare-fun b!40147 () Bool)

(declare-fun lt!15352 () Unit!967)

(assert (=> b!40147 (= e!25471 lt!15352)))

(assert (=> b!40147 (= lt!15352 (lemmaContainsKeyImpliesGetValueByKeyDefined!55 (toList!544 lt!14920) (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)))))

(assert (=> b!40147 (isDefined!56 (getValueByKey!99 (toList!544 lt!14920) (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000)))))

(declare-fun b!40148 () Bool)

(declare-fun Unit!979 () Unit!967)

(assert (=> b!40148 (= e!25471 Unit!979)))

(declare-fun b!40149 () Bool)

(assert (=> b!40149 (= e!25472 (isDefined!56 (getValueByKey!99 (toList!544 lt!14920) (select (arr!1235 (_keys!3266 lt!14709)) #b00000000000000000000000000000000))))))

(assert (= (and d!6909 c!4872) b!40147))

(assert (= (and d!6909 (not c!4872)) b!40148))

(assert (= (and d!6909 (not res!23987)) b!40149))

(assert (=> d!6909 m!32123))

(declare-fun m!32983 () Bool)

(assert (=> d!6909 m!32983))

(assert (=> b!40147 m!32123))

(declare-fun m!32985 () Bool)

(assert (=> b!40147 m!32985))

(assert (=> b!40147 m!32123))

(assert (=> b!40147 m!32659))

(assert (=> b!40147 m!32659))

(declare-fun m!32987 () Bool)

(assert (=> b!40147 m!32987))

(assert (=> b!40149 m!32123))

(assert (=> b!40149 m!32659))

(assert (=> b!40149 m!32659))

(assert (=> b!40149 m!32987))

(assert (=> b!39523 d!6909))

(declare-fun d!6911 () Bool)

(assert (=> d!6911 (= (content!29 Nil!1046) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!6657 d!6911))

(assert (=> b!39323 d!6783))

(declare-fun d!6913 () Bool)

(declare-fun e!25473 () Bool)

(assert (=> d!6913 e!25473))

(declare-fun res!23989 () Bool)

(assert (=> d!6913 (=> (not res!23989) (not e!25473))))

(declare-fun lt!15355 () ListLongMap!1057)

(assert (=> d!6913 (= res!23989 (contains!506 lt!15355 (_1!751 (tuple2!1481 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1713 lt!14709)))))))

(declare-fun lt!15353 () List!1048)

(assert (=> d!6913 (= lt!15355 (ListLongMap!1058 lt!15353))))

(declare-fun lt!15354 () Unit!967)

(declare-fun lt!15356 () Unit!967)

(assert (=> d!6913 (= lt!15354 lt!15356)))

(assert (=> d!6913 (= (getValueByKey!99 lt!15353 (_1!751 (tuple2!1481 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1713 lt!14709)))) (Some!104 (_2!751 (tuple2!1481 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1713 lt!14709)))))))

(assert (=> d!6913 (= lt!15356 (lemmaContainsTupThenGetReturnValue!24 lt!15353 (_1!751 (tuple2!1481 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1713 lt!14709))) (_2!751 (tuple2!1481 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1713 lt!14709)))))))

(assert (=> d!6913 (= lt!15353 (insertStrictlySorted!21 (toList!544 call!3033) (_1!751 (tuple2!1481 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1713 lt!14709))) (_2!751 (tuple2!1481 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1713 lt!14709)))))))

(assert (=> d!6913 (= (+!61 call!3033 (tuple2!1481 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1713 lt!14709))) lt!15355)))

(declare-fun b!40150 () Bool)

(declare-fun res!23988 () Bool)

(assert (=> b!40150 (=> (not res!23988) (not e!25473))))

(assert (=> b!40150 (= res!23988 (= (getValueByKey!99 (toList!544 lt!15355) (_1!751 (tuple2!1481 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1713 lt!14709)))) (Some!104 (_2!751 (tuple2!1481 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1713 lt!14709))))))))

(declare-fun b!40151 () Bool)

(assert (=> b!40151 (= e!25473 (contains!510 (toList!544 lt!15355) (tuple2!1481 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1713 lt!14709))))))

(assert (= (and d!6913 res!23989) b!40150))

(assert (= (and b!40150 res!23988) b!40151))

(declare-fun m!32989 () Bool)

(assert (=> d!6913 m!32989))

(declare-fun m!32991 () Bool)

(assert (=> d!6913 m!32991))

(declare-fun m!32993 () Bool)

(assert (=> d!6913 m!32993))

(declare-fun m!32995 () Bool)

(assert (=> d!6913 m!32995))

(declare-fun m!32997 () Bool)

(assert (=> b!40150 m!32997))

(declare-fun m!32999 () Bool)

(assert (=> b!40151 m!32999))

(assert (=> b!39522 d!6913))

(declare-fun d!6915 () Bool)

(assert (=> d!6915 (= (validMask!0 (mask!5142 lt!14709)) (and (or (= (mask!5142 lt!14709) #b00000000000000000000000000000111) (= (mask!5142 lt!14709) #b00000000000000000000000000001111) (= (mask!5142 lt!14709) #b00000000000000000000000000011111) (= (mask!5142 lt!14709) #b00000000000000000000000000111111) (= (mask!5142 lt!14709) #b00000000000000000000000001111111) (= (mask!5142 lt!14709) #b00000000000000000000000011111111) (= (mask!5142 lt!14709) #b00000000000000000000000111111111) (= (mask!5142 lt!14709) #b00000000000000000000001111111111) (= (mask!5142 lt!14709) #b00000000000000000000011111111111) (= (mask!5142 lt!14709) #b00000000000000000000111111111111) (= (mask!5142 lt!14709) #b00000000000000000001111111111111) (= (mask!5142 lt!14709) #b00000000000000000011111111111111) (= (mask!5142 lt!14709) #b00000000000000000111111111111111) (= (mask!5142 lt!14709) #b00000000000000001111111111111111) (= (mask!5142 lt!14709) #b00000000000000011111111111111111) (= (mask!5142 lt!14709) #b00000000000000111111111111111111) (= (mask!5142 lt!14709) #b00000000000001111111111111111111) (= (mask!5142 lt!14709) #b00000000000011111111111111111111) (= (mask!5142 lt!14709) #b00000000000111111111111111111111) (= (mask!5142 lt!14709) #b00000000001111111111111111111111) (= (mask!5142 lt!14709) #b00000000011111111111111111111111) (= (mask!5142 lt!14709) #b00000000111111111111111111111111) (= (mask!5142 lt!14709) #b00000001111111111111111111111111) (= (mask!5142 lt!14709) #b00000011111111111111111111111111) (= (mask!5142 lt!14709) #b00000111111111111111111111111111) (= (mask!5142 lt!14709) #b00001111111111111111111111111111) (= (mask!5142 lt!14709) #b00011111111111111111111111111111) (= (mask!5142 lt!14709) #b00111111111111111111111111111111)) (bvsle (mask!5142 lt!14709) #b00111111111111111111111111111111)))))

(assert (=> d!6599 d!6915))

(assert (=> b!39520 d!6807))

(declare-fun d!6917 () Bool)

(assert (=> d!6917 (arrayContainsKey!0 lt!14713 lt!14941 #b00000000000000000000000000000000)))

(declare-fun lt!15371 () Unit!967)

(assert (=> d!6917 (= lt!15371 (choose!13 lt!14713 lt!14941 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!6917 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!6917 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14713 lt!14941 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15371)))

(declare-fun bs!1679 () Bool)

(assert (= bs!1679 d!6917))

(assert (=> bs!1679 m!32181))

(declare-fun m!33001 () Bool)

(assert (=> bs!1679 m!33001))

(assert (=> b!39541 d!6917))

(declare-fun d!6919 () Bool)

(declare-fun res!23990 () Bool)

(declare-fun e!25478 () Bool)

(assert (=> d!6919 (=> res!23990 e!25478)))

(assert (=> d!6919 (= res!23990 (= (select (arr!1235 lt!14713) #b00000000000000000000000000000000) lt!14941))))

(assert (=> d!6919 (= (arrayContainsKey!0 lt!14713 lt!14941 #b00000000000000000000000000000000) e!25478)))

(declare-fun b!40160 () Bool)

(declare-fun e!25479 () Bool)

(assert (=> b!40160 (= e!25478 e!25479)))

(declare-fun res!23991 () Bool)

(assert (=> b!40160 (=> (not res!23991) (not e!25479))))

(assert (=> b!40160 (= res!23991 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1357 lt!14713)))))

(declare-fun b!40161 () Bool)

(assert (=> b!40161 (= e!25479 (arrayContainsKey!0 lt!14713 lt!14941 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!6919 (not res!23990)) b!40160))

(assert (= (and b!40160 res!23991) b!40161))

(assert (=> d!6919 m!31931))

(declare-fun m!33003 () Bool)

(assert (=> b!40161 m!33003))

(assert (=> b!39541 d!6919))

(declare-fun b!40162 () Bool)

(declare-fun e!25481 () SeekEntryResult!170)

(declare-fun lt!15372 () SeekEntryResult!170)

(assert (=> b!40162 (= e!25481 (MissingZero!170 (index!2804 lt!15372)))))

(declare-fun b!40163 () Bool)

(declare-fun c!4878 () Bool)

(declare-fun lt!15374 () (_ BitVec 64))

(assert (=> b!40163 (= c!4878 (= lt!15374 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25482 () SeekEntryResult!170)

(assert (=> b!40163 (= e!25482 e!25481)))

(declare-fun b!40164 () Bool)

(assert (=> b!40164 (= e!25482 (Found!170 (index!2804 lt!15372)))))

(declare-fun b!40165 () Bool)

(assert (=> b!40165 (= e!25481 (seekKeyOrZeroReturnVacant!0 (x!7656 lt!15372) (index!2804 lt!15372) (index!2804 lt!15372) (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14713 mask!853))))

(declare-fun d!6921 () Bool)

(declare-fun lt!15373 () SeekEntryResult!170)

(assert (=> d!6921 (and (or ((_ is Undefined!170) lt!15373) (not ((_ is Found!170) lt!15373)) (and (bvsge (index!2803 lt!15373) #b00000000000000000000000000000000) (bvslt (index!2803 lt!15373) (size!1357 lt!14713)))) (or ((_ is Undefined!170) lt!15373) ((_ is Found!170) lt!15373) (not ((_ is MissingZero!170) lt!15373)) (and (bvsge (index!2802 lt!15373) #b00000000000000000000000000000000) (bvslt (index!2802 lt!15373) (size!1357 lt!14713)))) (or ((_ is Undefined!170) lt!15373) ((_ is Found!170) lt!15373) ((_ is MissingZero!170) lt!15373) (not ((_ is MissingVacant!170) lt!15373)) (and (bvsge (index!2805 lt!15373) #b00000000000000000000000000000000) (bvslt (index!2805 lt!15373) (size!1357 lt!14713)))) (or ((_ is Undefined!170) lt!15373) (ite ((_ is Found!170) lt!15373) (= (select (arr!1235 lt!14713) (index!2803 lt!15373)) (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!170) lt!15373) (= (select (arr!1235 lt!14713) (index!2802 lt!15373)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!170) lt!15373) (= (select (arr!1235 lt!14713) (index!2805 lt!15373)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!25480 () SeekEntryResult!170)

(assert (=> d!6921 (= lt!15373 e!25480)))

(declare-fun c!4879 () Bool)

(assert (=> d!6921 (= c!4879 (and ((_ is Intermediate!170) lt!15372) (undefined!982 lt!15372)))))

(assert (=> d!6921 (= lt!15372 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!853) (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14713 mask!853))))

(assert (=> d!6921 (validMask!0 mask!853)))

(assert (=> d!6921 (= (seekEntryOrOpen!0 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!14713 mask!853) lt!15373)))

(declare-fun b!40166 () Bool)

(assert (=> b!40166 (= e!25480 Undefined!170)))

(declare-fun b!40167 () Bool)

(assert (=> b!40167 (= e!25480 e!25482)))

(assert (=> b!40167 (= lt!15374 (select (arr!1235 lt!14713) (index!2804 lt!15372)))))

(declare-fun c!4877 () Bool)

(assert (=> b!40167 (= c!4877 (= lt!15374 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!6921 c!4879) b!40166))

(assert (= (and d!6921 (not c!4879)) b!40167))

(assert (= (and b!40167 c!4877) b!40164))

(assert (= (and b!40167 (not c!4877)) b!40163))

(assert (= (and b!40163 c!4878) b!40162))

(assert (= (and b!40163 (not c!4878)) b!40165))

(assert (=> b!40165 m!32029))

(declare-fun m!33005 () Bool)

(assert (=> b!40165 m!33005))

(declare-fun m!33007 () Bool)

(assert (=> d!6921 m!33007))

(assert (=> d!6921 m!32029))

(declare-fun m!33009 () Bool)

(assert (=> d!6921 m!33009))

(assert (=> d!6921 m!31863))

(assert (=> d!6921 m!33009))

(assert (=> d!6921 m!32029))

(declare-fun m!33011 () Bool)

(assert (=> d!6921 m!33011))

(declare-fun m!33013 () Bool)

(assert (=> d!6921 m!33013))

(declare-fun m!33015 () Bool)

(assert (=> d!6921 m!33015))

(declare-fun m!33017 () Bool)

(assert (=> b!40167 m!33017))

(assert (=> b!39541 d!6921))

(assert (=> b!39540 d!6783))

(assert (=> d!6649 d!6651))

(declare-fun d!6923 () Bool)

(assert (=> d!6923 (arrayContainsKey!0 lt!14713 lt!14761 #b00000000000000000000000000000000)))

(assert (=> d!6923 true))

(declare-fun _$60!338 () Unit!967)

(assert (=> d!6923 (= (choose!13 lt!14713 lt!14761 #b00000000000000000000000000000000) _$60!338)))

(declare-fun bs!1680 () Bool)

(assert (= bs!1680 d!6923))

(assert (=> bs!1680 m!31937))

(assert (=> d!6649 d!6923))

(declare-fun b!40184 () Bool)

(declare-fun e!25493 () Bool)

(declare-fun call!3096 () Bool)

(assert (=> b!40184 (= e!25493 call!3096)))

(declare-fun b!40185 () Bool)

(declare-fun e!25495 () Bool)

(assert (=> b!40185 (= e!25495 call!3096)))

(declare-fun bm!3093 () Bool)

(assert (=> bm!3093 (= call!3096 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14713 mask!853))))

(declare-fun b!40186 () Bool)

(declare-fun e!25494 () Bool)

(assert (=> b!40186 (= e!25494 e!25493)))

(declare-fun c!4884 () Bool)

(assert (=> b!40186 (= c!4884 (validKeyInArray!0 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!40187 () Bool)

(assert (=> b!40187 (= e!25493 e!25495)))

(declare-fun lt!15376 () (_ BitVec 64))

(assert (=> b!40187 (= lt!15376 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!15377 () Unit!967)

(assert (=> b!40187 (= lt!15377 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!14713 lt!15376 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!40187 (arrayContainsKey!0 lt!14713 lt!15376 #b00000000000000000000000000000000)))

(declare-fun lt!15375 () Unit!967)

(assert (=> b!40187 (= lt!15375 lt!15377)))

(declare-fun res!24000 () Bool)

(assert (=> b!40187 (= res!24000 (= (seekEntryOrOpen!0 (select (arr!1235 lt!14713) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!14713 mask!853) (Found!170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!40187 (=> (not res!24000) (not e!25495))))

(declare-fun d!6925 () Bool)

(declare-fun res!24001 () Bool)

(assert (=> d!6925 (=> res!24001 e!25494)))

(assert (=> d!6925 (= res!24001 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1357 lt!14713)))))

(assert (=> d!6925 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!14713 mask!853) e!25494)))

(assert (= (and d!6925 (not res!24001)) b!40186))

(assert (= (and b!40186 c!4884) b!40187))

(assert (= (and b!40186 (not c!4884)) b!40184))

(assert (= (and b!40187 res!24000) b!40185))

(assert (= (or b!40185 b!40184) bm!3093))

(declare-fun m!33019 () Bool)

(assert (=> bm!3093 m!33019))

(assert (=> b!40186 m!32649))

(assert (=> b!40186 m!32649))

(assert (=> b!40186 m!32651))

(assert (=> b!40187 m!32649))

(declare-fun m!33021 () Bool)

(assert (=> b!40187 m!33021))

(declare-fun m!33023 () Bool)

(assert (=> b!40187 m!33023))

(assert (=> b!40187 m!32649))

(declare-fun m!33025 () Bool)

(assert (=> b!40187 m!33025))

(assert (=> bm!3034 d!6925))

(assert (=> d!6595 d!6535))

(declare-fun b!40188 () Bool)

(declare-fun e!25496 () (_ BitVec 32))

(declare-fun call!3097 () (_ BitVec 32))

