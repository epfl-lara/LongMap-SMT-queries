; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5954 () Bool)

(assert start!5954)

(declare-fun b_free!1429 () Bool)

(declare-fun b_next!1429 () Bool)

(assert (=> start!5954 (= b_free!1429 (not b_next!1429))))

(declare-fun tp!5831 () Bool)

(declare-fun b_and!2505 () Bool)

(assert (=> start!5954 (= tp!5831 b_and!2505)))

(declare-fun b!41698 () Bool)

(declare-fun e!26346 () Bool)

(declare-datatypes ((array!2709 0))(
  ( (array!2710 (arr!1298 (Array (_ BitVec 32) (_ BitVec 64))) (size!1450 (_ BitVec 32))) )
))
(declare-fun lt!16864 () array!2709)

(declare-datatypes ((V!2185 0))(
  ( (V!2186 (val!948 Int)) )
))
(declare-datatypes ((tuple2!1532 0))(
  ( (tuple2!1533 (_1!777 (_ BitVec 64)) (_2!777 V!2185)) )
))
(declare-fun lt!16865 () tuple2!1532)

(declare-fun arrayContainsKey!0 (array!2709 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!41698 (= e!26346 (arrayContainsKey!0 lt!16864 (_1!777 lt!16865) #b00000000000000000000000000000000))))

(declare-fun res!24858 () Bool)

(declare-fun e!26345 () Bool)

(assert (=> start!5954 (=> (not res!24858) (not e!26345))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5954 (= res!24858 (validMask!0 mask!853))))

(assert (=> start!5954 e!26345))

(assert (=> start!5954 true))

(assert (=> start!5954 tp!5831))

(declare-fun b!41695 () Bool)

(declare-fun e!26344 () Bool)

(assert (=> b!41695 (= e!26345 (not e!26344))))

(declare-fun res!24857 () Bool)

(assert (=> b!41695 (=> res!24857 e!26344)))

(declare-datatypes ((List!1104 0))(
  ( (Nil!1101) (Cons!1100 (h!1677 tuple2!1532) (t!4029 List!1104)) )
))
(declare-datatypes ((ListLongMap!1103 0))(
  ( (ListLongMap!1104 (toList!567 List!1104)) )
))
(declare-fun lt!16863 () ListLongMap!1103)

(assert (=> b!41695 (= res!24857 (= lt!16863 (ListLongMap!1104 Nil!1101)))))

(declare-datatypes ((ValueCell!662 0))(
  ( (ValueCellFull!662 (v!2033 V!2185)) (EmptyCell!662) )
))
(declare-datatypes ((array!2711 0))(
  ( (array!2712 (arr!1299 (Array (_ BitVec 32) ValueCell!662)) (size!1451 (_ BitVec 32))) )
))
(declare-fun lt!16859 () array!2711)

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!16867 () V!2185)

(declare-datatypes ((LongMapFixedSize!304 0))(
  ( (LongMapFixedSize!305 (defaultEntry!1842 Int) (mask!5261 (_ BitVec 32)) (extraKeys!1733 (_ BitVec 32)) (zeroValue!1760 V!2185) (minValue!1760 V!2185) (_size!201 (_ BitVec 32)) (_keys!3349 array!2709) (_values!1825 array!2711) (_vacant!201 (_ BitVec 32))) )
))
(declare-fun map!744 (LongMapFixedSize!304) ListLongMap!1103)

(assert (=> b!41695 (= lt!16863 (map!744 (LongMapFixedSize!305 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16867 lt!16867 #b00000000000000000000000000000000 lt!16864 lt!16859 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1105 0))(
  ( (Nil!1102) (Cons!1101 (h!1678 (_ BitVec 64)) (t!4030 List!1105)) )
))
(declare-fun arrayNoDuplicates!0 (array!2709 (_ BitVec 32) List!1105) Bool)

(assert (=> b!41695 (arrayNoDuplicates!0 lt!16864 #b00000000000000000000000000000000 Nil!1102)))

(declare-datatypes ((Unit!1071 0))(
  ( (Unit!1072) )
))
(declare-fun lt!16862 () Unit!1071)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2709 (_ BitVec 32) (_ BitVec 32) List!1105) Unit!1071)

(assert (=> b!41695 (= lt!16862 (lemmaArrayNoDuplicatesInAll0Array!0 lt!16864 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1102))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2709 (_ BitVec 32)) Bool)

(assert (=> b!41695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16864 mask!853)))

(declare-fun lt!16861 () Unit!1071)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2709 (_ BitVec 32) (_ BitVec 32)) Unit!1071)

(assert (=> b!41695 (= lt!16861 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16864 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2709 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!41695 (= (arrayCountValidKeys!0 lt!16864 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16860 () Unit!1071)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2709 (_ BitVec 32) (_ BitVec 32)) Unit!1071)

(assert (=> b!41695 (= lt!16860 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16864 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41695 (= lt!16859 (array!2712 ((as const (Array (_ BitVec 32) ValueCell!662)) EmptyCell!662) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!41695 (= lt!16864 (array!2710 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!219 (Int (_ BitVec 64)) V!2185)

(assert (=> b!41695 (= lt!16867 (dynLambda!219 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41697 () Bool)

(assert (=> b!41697 (= e!26344 (and (bvslt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvslt (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111)))))

(assert (=> b!41697 e!26346))

(declare-fun res!24859 () Bool)

(assert (=> b!41697 (=> (not res!24859) (not e!26346))))

(assert (=> b!41697 (= res!24859 (and (not (= (_1!777 lt!16865) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!777 lt!16865) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!16866 () Unit!1071)

(declare-fun lemmaKeyInListMapIsInArray!100 (array!2709 array!2711 (_ BitVec 32) (_ BitVec 32) V!2185 V!2185 (_ BitVec 64) Int) Unit!1071)

(assert (=> b!41697 (= lt!16866 (lemmaKeyInListMapIsInArray!100 lt!16864 lt!16859 mask!853 #b00000000000000000000000000000000 lt!16867 lt!16867 (_1!777 lt!16865) defaultEntry!470))))

(declare-fun head!876 (List!1104) tuple2!1532)

(assert (=> b!41697 (= lt!16865 (head!876 (toList!567 lt!16863)))))

(declare-fun b!41696 () Bool)

(declare-fun res!24860 () Bool)

(assert (=> b!41696 (=> res!24860 e!26344)))

(declare-fun isEmpty!269 (List!1104) Bool)

(assert (=> b!41696 (= res!24860 (isEmpty!269 (toList!567 lt!16863)))))

(assert (= (and start!5954 res!24858) b!41695))

(assert (= (and b!41695 (not res!24857)) b!41696))

(assert (= (and b!41696 (not res!24860)) b!41697))

(assert (= (and b!41697 res!24859) b!41698))

(declare-fun b_lambda!2153 () Bool)

(assert (=> (not b_lambda!2153) (not b!41695)))

(declare-fun t!4028 () Bool)

(declare-fun tb!911 () Bool)

(assert (=> (and start!5954 (= defaultEntry!470 defaultEntry!470) t!4028) tb!911))

(declare-fun result!1573 () Bool)

(declare-fun tp_is_empty!1819 () Bool)

(assert (=> tb!911 (= result!1573 tp_is_empty!1819)))

(assert (=> b!41695 t!4028))

(declare-fun b_and!2507 () Bool)

(assert (= b_and!2505 (and (=> t!4028 result!1573) b_and!2507)))

(declare-fun m!35161 () Bool)

(assert (=> b!41696 m!35161))

(declare-fun m!35163 () Bool)

(assert (=> b!41695 m!35163))

(declare-fun m!35165 () Bool)

(assert (=> b!41695 m!35165))

(declare-fun m!35167 () Bool)

(assert (=> b!41695 m!35167))

(declare-fun m!35169 () Bool)

(assert (=> b!41695 m!35169))

(declare-fun m!35171 () Bool)

(assert (=> b!41695 m!35171))

(declare-fun m!35173 () Bool)

(assert (=> b!41695 m!35173))

(declare-fun m!35175 () Bool)

(assert (=> b!41695 m!35175))

(declare-fun m!35177 () Bool)

(assert (=> b!41695 m!35177))

(declare-fun m!35179 () Bool)

(assert (=> b!41697 m!35179))

(declare-fun m!35181 () Bool)

(assert (=> b!41697 m!35181))

(declare-fun m!35183 () Bool)

(assert (=> start!5954 m!35183))

(declare-fun m!35185 () Bool)

(assert (=> b!41698 m!35185))

(check-sat tp_is_empty!1819 b_and!2507 (not b!41697) (not b_lambda!2153) (not start!5954) (not b!41695) (not b!41698) (not b!41696) (not b_next!1429))
(check-sat b_and!2507 (not b_next!1429))
(get-model)

(declare-fun b_lambda!2159 () Bool)

(assert (= b_lambda!2153 (or (and start!5954 b_free!1429) b_lambda!2159)))

(check-sat tp_is_empty!1819 b_and!2507 (not b!41697) (not start!5954) (not b!41698) (not b!41695) (not b_lambda!2159) (not b!41696) (not b_next!1429))
(check-sat b_and!2507 (not b_next!1429))
(get-model)

(declare-fun bm!3219 () Bool)

(declare-fun call!3222 () (_ BitVec 32))

(assert (=> bm!3219 (= call!3222 (arrayCountValidKeys!0 lt!16864 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!41737 () Bool)

(declare-fun e!26370 () (_ BitVec 32))

(assert (=> b!41737 (= e!26370 (bvadd #b00000000000000000000000000000001 call!3222))))

(declare-fun b!41738 () Bool)

(declare-fun e!26369 () (_ BitVec 32))

(assert (=> b!41738 (= e!26369 e!26370)))

(declare-fun c!5184 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!41738 (= c!5184 (validKeyInArray!0 (select (arr!1298 lt!16864) #b00000000000000000000000000000000)))))

(declare-fun d!7437 () Bool)

(declare-fun lt!16924 () (_ BitVec 32))

(assert (=> d!7437 (and (bvsge lt!16924 #b00000000000000000000000000000000) (bvsle lt!16924 (bvsub (size!1450 lt!16864) #b00000000000000000000000000000000)))))

(assert (=> d!7437 (= lt!16924 e!26369)))

(declare-fun c!5185 () Bool)

(assert (=> d!7437 (= c!5185 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7437 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1450 lt!16864)))))

(assert (=> d!7437 (= (arrayCountValidKeys!0 lt!16864 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!16924)))

(declare-fun b!41739 () Bool)

(assert (=> b!41739 (= e!26370 call!3222)))

(declare-fun b!41740 () Bool)

(assert (=> b!41740 (= e!26369 #b00000000000000000000000000000000)))

(assert (= (and d!7437 c!5185) b!41740))

(assert (= (and d!7437 (not c!5185)) b!41738))

(assert (= (and b!41738 c!5184) b!41737))

(assert (= (and b!41738 (not c!5184)) b!41739))

(assert (= (or b!41737 b!41739) bm!3219))

(declare-fun m!35239 () Bool)

(assert (=> bm!3219 m!35239))

(declare-fun m!35241 () Bool)

(assert (=> b!41738 m!35241))

(assert (=> b!41738 m!35241))

(declare-fun m!35243 () Bool)

(assert (=> b!41738 m!35243))

(assert (=> b!41695 d!7437))

(declare-fun d!7443 () Bool)

(assert (=> d!7443 (arrayNoDuplicates!0 lt!16864 #b00000000000000000000000000000000 Nil!1102)))

(declare-fun lt!16927 () Unit!1071)

(declare-fun choose!111 (array!2709 (_ BitVec 32) (_ BitVec 32) List!1105) Unit!1071)

(assert (=> d!7443 (= lt!16927 (choose!111 lt!16864 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1102))))

(assert (=> d!7443 (= (size!1450 lt!16864) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7443 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!16864 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1102) lt!16927)))

(declare-fun bs!1788 () Bool)

(assert (= bs!1788 d!7443))

(assert (=> bs!1788 m!35173))

(declare-fun m!35245 () Bool)

(assert (=> bs!1788 m!35245))

(assert (=> b!41695 d!7443))

(declare-fun d!7445 () Bool)

(assert (=> d!7445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16864 mask!853)))

(declare-fun lt!16930 () Unit!1071)

(declare-fun choose!34 (array!2709 (_ BitVec 32) (_ BitVec 32)) Unit!1071)

(assert (=> d!7445 (= lt!16930 (choose!34 lt!16864 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7445 (validMask!0 mask!853)))

(assert (=> d!7445 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!16864 mask!853 #b00000000000000000000000000000000) lt!16930)))

(declare-fun bs!1789 () Bool)

(assert (= bs!1789 d!7445))

(assert (=> bs!1789 m!35177))

(declare-fun m!35255 () Bool)

(assert (=> bs!1789 m!35255))

(assert (=> bs!1789 m!35183))

(assert (=> b!41695 d!7445))

(declare-fun b!41775 () Bool)

(declare-fun e!26397 () Bool)

(declare-fun e!26398 () Bool)

(assert (=> b!41775 (= e!26397 e!26398)))

(declare-fun res!24904 () Bool)

(assert (=> b!41775 (=> (not res!24904) (not e!26398))))

(declare-fun e!26399 () Bool)

(assert (=> b!41775 (= res!24904 (not e!26399))))

(declare-fun res!24903 () Bool)

(assert (=> b!41775 (=> (not res!24903) (not e!26399))))

(assert (=> b!41775 (= res!24903 (validKeyInArray!0 (select (arr!1298 lt!16864) #b00000000000000000000000000000000)))))

(declare-fun b!41776 () Bool)

(declare-fun e!26400 () Bool)

(assert (=> b!41776 (= e!26398 e!26400)))

(declare-fun c!5194 () Bool)

(assert (=> b!41776 (= c!5194 (validKeyInArray!0 (select (arr!1298 lt!16864) #b00000000000000000000000000000000)))))

(declare-fun b!41777 () Bool)

(declare-fun contains!538 (List!1105 (_ BitVec 64)) Bool)

(assert (=> b!41777 (= e!26399 (contains!538 Nil!1102 (select (arr!1298 lt!16864) #b00000000000000000000000000000000)))))

(declare-fun bm!3222 () Bool)

(declare-fun call!3225 () Bool)

(assert (=> bm!3222 (= call!3225 (arrayNoDuplicates!0 lt!16864 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5194 (Cons!1101 (select (arr!1298 lt!16864) #b00000000000000000000000000000000) Nil!1102) Nil!1102)))))

(declare-fun d!7455 () Bool)

(declare-fun res!24905 () Bool)

(assert (=> d!7455 (=> res!24905 e!26397)))

(assert (=> d!7455 (= res!24905 (bvsge #b00000000000000000000000000000000 (size!1450 lt!16864)))))

(assert (=> d!7455 (= (arrayNoDuplicates!0 lt!16864 #b00000000000000000000000000000000 Nil!1102) e!26397)))

(declare-fun b!41778 () Bool)

(assert (=> b!41778 (= e!26400 call!3225)))

(declare-fun b!41779 () Bool)

(assert (=> b!41779 (= e!26400 call!3225)))

(assert (= (and d!7455 (not res!24905)) b!41775))

(assert (= (and b!41775 res!24903) b!41777))

(assert (= (and b!41775 res!24904) b!41776))

(assert (= (and b!41776 c!5194) b!41778))

(assert (= (and b!41776 (not c!5194)) b!41779))

(assert (= (or b!41778 b!41779) bm!3222))

(assert (=> b!41775 m!35241))

(assert (=> b!41775 m!35241))

(assert (=> b!41775 m!35243))

(assert (=> b!41776 m!35241))

(assert (=> b!41776 m!35241))

(assert (=> b!41776 m!35243))

(assert (=> b!41777 m!35241))

(assert (=> b!41777 m!35241))

(declare-fun m!35261 () Bool)

(assert (=> b!41777 m!35261))

(assert (=> bm!3222 m!35241))

(declare-fun m!35263 () Bool)

(assert (=> bm!3222 m!35263))

(assert (=> b!41695 d!7455))

(declare-fun d!7469 () Bool)

(declare-fun getCurrentListMap!324 (array!2709 array!2711 (_ BitVec 32) (_ BitVec 32) V!2185 V!2185 (_ BitVec 32) Int) ListLongMap!1103)

(assert (=> d!7469 (= (map!744 (LongMapFixedSize!305 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16867 lt!16867 #b00000000000000000000000000000000 lt!16864 lt!16859 #b00000000000000000000000000000000)) (getCurrentListMap!324 (_keys!3349 (LongMapFixedSize!305 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16867 lt!16867 #b00000000000000000000000000000000 lt!16864 lt!16859 #b00000000000000000000000000000000)) (_values!1825 (LongMapFixedSize!305 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16867 lt!16867 #b00000000000000000000000000000000 lt!16864 lt!16859 #b00000000000000000000000000000000)) (mask!5261 (LongMapFixedSize!305 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16867 lt!16867 #b00000000000000000000000000000000 lt!16864 lt!16859 #b00000000000000000000000000000000)) (extraKeys!1733 (LongMapFixedSize!305 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16867 lt!16867 #b00000000000000000000000000000000 lt!16864 lt!16859 #b00000000000000000000000000000000)) (zeroValue!1760 (LongMapFixedSize!305 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16867 lt!16867 #b00000000000000000000000000000000 lt!16864 lt!16859 #b00000000000000000000000000000000)) (minValue!1760 (LongMapFixedSize!305 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16867 lt!16867 #b00000000000000000000000000000000 lt!16864 lt!16859 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1842 (LongMapFixedSize!305 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!16867 lt!16867 #b00000000000000000000000000000000 lt!16864 lt!16859 #b00000000000000000000000000000000))))))

(declare-fun bs!1794 () Bool)

(assert (= bs!1794 d!7469))

(declare-fun m!35273 () Bool)

(assert (=> bs!1794 m!35273))

(assert (=> b!41695 d!7469))

(declare-fun d!7479 () Bool)

(declare-fun res!24917 () Bool)

(declare-fun e!26424 () Bool)

(assert (=> d!7479 (=> res!24917 e!26424)))

(assert (=> d!7479 (= res!24917 (bvsge #b00000000000000000000000000000000 (size!1450 lt!16864)))))

(assert (=> d!7479 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!16864 mask!853) e!26424)))

(declare-fun b!41812 () Bool)

(declare-fun e!26422 () Bool)

(assert (=> b!41812 (= e!26424 e!26422)))

(declare-fun c!5206 () Bool)

(assert (=> b!41812 (= c!5206 (validKeyInArray!0 (select (arr!1298 lt!16864) #b00000000000000000000000000000000)))))

(declare-fun b!41813 () Bool)

(declare-fun e!26423 () Bool)

(assert (=> b!41813 (= e!26422 e!26423)))

(declare-fun lt!16971 () (_ BitVec 64))

(assert (=> b!41813 (= lt!16971 (select (arr!1298 lt!16864) #b00000000000000000000000000000000))))

(declare-fun lt!16972 () Unit!1071)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2709 (_ BitVec 64) (_ BitVec 32)) Unit!1071)

(assert (=> b!41813 (= lt!16972 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!16864 lt!16971 #b00000000000000000000000000000000))))

(assert (=> b!41813 (arrayContainsKey!0 lt!16864 lt!16971 #b00000000000000000000000000000000)))

(declare-fun lt!16970 () Unit!1071)

(assert (=> b!41813 (= lt!16970 lt!16972)))

(declare-fun res!24916 () Bool)

(declare-datatypes ((SeekEntryResult!169 0))(
  ( (MissingZero!169 (index!2798 (_ BitVec 32))) (Found!169 (index!2799 (_ BitVec 32))) (Intermediate!169 (undefined!981 Bool) (index!2800 (_ BitVec 32)) (x!7939 (_ BitVec 32))) (Undefined!169) (MissingVacant!169 (index!2801 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2709 (_ BitVec 32)) SeekEntryResult!169)

(assert (=> b!41813 (= res!24916 (= (seekEntryOrOpen!0 (select (arr!1298 lt!16864) #b00000000000000000000000000000000) lt!16864 mask!853) (Found!169 #b00000000000000000000000000000000)))))

(assert (=> b!41813 (=> (not res!24916) (not e!26423))))

(declare-fun b!41814 () Bool)

(declare-fun call!3234 () Bool)

(assert (=> b!41814 (= e!26423 call!3234)))

(declare-fun b!41815 () Bool)

(assert (=> b!41815 (= e!26422 call!3234)))

(declare-fun bm!3231 () Bool)

(assert (=> bm!3231 (= call!3234 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!16864 mask!853))))

(assert (= (and d!7479 (not res!24917)) b!41812))

(assert (= (and b!41812 c!5206) b!41813))

(assert (= (and b!41812 (not c!5206)) b!41815))

(assert (= (and b!41813 res!24916) b!41814))

(assert (= (or b!41814 b!41815) bm!3231))

(assert (=> b!41812 m!35241))

(assert (=> b!41812 m!35241))

(assert (=> b!41812 m!35243))

(assert (=> b!41813 m!35241))

(declare-fun m!35291 () Bool)

(assert (=> b!41813 m!35291))

(declare-fun m!35293 () Bool)

(assert (=> b!41813 m!35293))

(assert (=> b!41813 m!35241))

(declare-fun m!35295 () Bool)

(assert (=> b!41813 m!35295))

(declare-fun m!35297 () Bool)

(assert (=> bm!3231 m!35297))

(assert (=> b!41695 d!7479))

(declare-fun d!7487 () Bool)

(assert (=> d!7487 (= (arrayCountValidKeys!0 lt!16864 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!16975 () Unit!1071)

(declare-fun choose!59 (array!2709 (_ BitVec 32) (_ BitVec 32)) Unit!1071)

(assert (=> d!7487 (= lt!16975 (choose!59 lt!16864 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7487 (bvslt (size!1450 lt!16864) #b01111111111111111111111111111111)))

(assert (=> d!7487 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!16864 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!16975)))

(declare-fun bs!1796 () Bool)

(assert (= bs!1796 d!7487))

(assert (=> bs!1796 m!35167))

(declare-fun m!35299 () Bool)

(assert (=> bs!1796 m!35299))

(assert (=> b!41695 d!7487))

(declare-fun d!7489 () Bool)

(assert (=> d!7489 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!5954 d!7489))

(declare-fun d!7497 () Bool)

(declare-fun res!24935 () Bool)

(declare-fun e!26453 () Bool)

(assert (=> d!7497 (=> res!24935 e!26453)))

(assert (=> d!7497 (= res!24935 (= (select (arr!1298 lt!16864) #b00000000000000000000000000000000) (_1!777 lt!16865)))))

(assert (=> d!7497 (= (arrayContainsKey!0 lt!16864 (_1!777 lt!16865) #b00000000000000000000000000000000) e!26453)))

(declare-fun b!41855 () Bool)

(declare-fun e!26454 () Bool)

(assert (=> b!41855 (= e!26453 e!26454)))

(declare-fun res!24936 () Bool)

(assert (=> b!41855 (=> (not res!24936) (not e!26454))))

(assert (=> b!41855 (= res!24936 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1450 lt!16864)))))

(declare-fun b!41856 () Bool)

(assert (=> b!41856 (= e!26454 (arrayContainsKey!0 lt!16864 (_1!777 lt!16865) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7497 (not res!24935)) b!41855))

(assert (= (and b!41855 res!24936) b!41856))

(assert (=> d!7497 m!35241))

(declare-fun m!35311 () Bool)

(assert (=> b!41856 m!35311))

(assert (=> b!41698 d!7497))

(declare-fun d!7501 () Bool)

(declare-fun e!26468 () Bool)

(assert (=> d!7501 e!26468))

(declare-fun c!5223 () Bool)

(assert (=> d!7501 (= c!5223 (and (not (= (_1!777 lt!16865) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!777 lt!16865) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!16993 () Unit!1071)

(declare-fun choose!258 (array!2709 array!2711 (_ BitVec 32) (_ BitVec 32) V!2185 V!2185 (_ BitVec 64) Int) Unit!1071)

(assert (=> d!7501 (= lt!16993 (choose!258 lt!16864 lt!16859 mask!853 #b00000000000000000000000000000000 lt!16867 lt!16867 (_1!777 lt!16865) defaultEntry!470))))

(assert (=> d!7501 (validMask!0 mask!853)))

(assert (=> d!7501 (= (lemmaKeyInListMapIsInArray!100 lt!16864 lt!16859 mask!853 #b00000000000000000000000000000000 lt!16867 lt!16867 (_1!777 lt!16865) defaultEntry!470) lt!16993)))

(declare-fun b!41875 () Bool)

(assert (=> b!41875 (= e!26468 (arrayContainsKey!0 lt!16864 (_1!777 lt!16865) #b00000000000000000000000000000000))))

(declare-fun b!41876 () Bool)

(assert (=> b!41876 (= e!26468 (ite (= (_1!777 lt!16865) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!7501 c!5223) b!41875))

(assert (= (and d!7501 (not c!5223)) b!41876))

(declare-fun m!35321 () Bool)

(assert (=> d!7501 m!35321))

(assert (=> d!7501 m!35183))

(assert (=> b!41875 m!35185))

(assert (=> b!41697 d!7501))

(declare-fun d!7505 () Bool)

(assert (=> d!7505 (= (head!876 (toList!567 lt!16863)) (h!1677 (toList!567 lt!16863)))))

(assert (=> b!41697 d!7505))

(declare-fun d!7507 () Bool)

(get-info :version)

(assert (=> d!7507 (= (isEmpty!269 (toList!567 lt!16863)) ((_ is Nil!1101) (toList!567 lt!16863)))))

(assert (=> b!41696 d!7507))

(check-sat (not d!7469) (not d!7487) (not d!7445) (not b!41775) (not b!41813) (not b!41776) (not bm!3231) (not b_lambda!2159) (not b_next!1429) (not b!41812) (not bm!3219) (not bm!3222) tp_is_empty!1819 (not b!41777) b_and!2507 (not d!7443) (not b!41856) (not b!41738) (not d!7501) (not b!41875))
(check-sat b_and!2507 (not b_next!1429))
