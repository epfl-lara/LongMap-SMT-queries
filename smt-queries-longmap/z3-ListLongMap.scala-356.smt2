; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6740 () Bool)

(assert start!6740)

(declare-fun b_free!1513 () Bool)

(declare-fun b_next!1513 () Bool)

(assert (=> start!6740 (= b_free!1513 (not b_next!1513))))

(declare-fun tp!5957 () Bool)

(declare-fun b_and!2697 () Bool)

(assert (=> start!6740 (= tp!5957 b_and!2697)))

(declare-fun b!44007 () Bool)

(declare-fun e!27901 () Bool)

(declare-fun e!27900 () Bool)

(assert (=> b!44007 (= e!27901 (not e!27900))))

(declare-fun res!26010 () Bool)

(assert (=> b!44007 (=> (not res!26010) (not e!27900))))

(declare-datatypes ((array!2937 0))(
  ( (array!2938 (arr!1412 (Array (_ BitVec 32) (_ BitVec 64))) (size!1615 (_ BitVec 32))) )
))
(declare-datatypes ((V!2325 0))(
  ( (V!2326 (val!990 Int)) )
))
(declare-datatypes ((ValueCell!704 0))(
  ( (ValueCellFull!704 (v!2087 V!2325)) (EmptyCell!704) )
))
(declare-datatypes ((array!2939 0))(
  ( (array!2940 (arr!1413 (Array (_ BitVec 32) ValueCell!704)) (size!1616 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!388 0))(
  ( (LongMapFixedSize!389 (defaultEntry!1896 Int) (mask!5473 (_ BitVec 32)) (extraKeys!1787 (_ BitVec 32)) (zeroValue!1814 V!2325) (minValue!1814 V!2325) (_size!243 (_ BitVec 32)) (_keys!3463 array!2937) (_values!1879 array!2939) (_vacant!243 (_ BitVec 32))) )
))
(declare-fun lt!19216 () LongMapFixedSize!388)

(declare-fun valid!138 (LongMapFixedSize!388) Bool)

(assert (=> b!44007 (= res!26010 (valid!138 lt!19216))))

(declare-datatypes ((Unit!1239 0))(
  ( (Unit!1240) )
))
(declare-fun lt!19218 () Unit!1239)

(declare-fun e!27903 () Unit!1239)

(assert (=> b!44007 (= lt!19218 e!27903)))

(declare-fun c!5719 () Bool)

(declare-fun lt!19225 () Bool)

(assert (=> b!44007 (= c!5719 lt!19225)))

(declare-datatypes ((tuple2!1616 0))(
  ( (tuple2!1617 (_1!819 (_ BitVec 64)) (_2!819 V!2325)) )
))
(declare-datatypes ((List!1194 0))(
  ( (Nil!1191) (Cons!1190 (h!1767 tuple2!1616) (t!4209 List!1194)) )
))
(declare-datatypes ((ListLongMap!1187 0))(
  ( (ListLongMap!1188 (toList!609 List!1194)) )
))
(declare-fun lt!19221 () ListLongMap!1187)

(assert (=> b!44007 (= lt!19225 (not (= lt!19221 (ListLongMap!1188 Nil!1191))))))

(declare-fun map!842 (LongMapFixedSize!388) ListLongMap!1187)

(assert (=> b!44007 (= lt!19221 (map!842 lt!19216))))

(declare-fun lt!19228 () array!2937)

(declare-datatypes ((List!1195 0))(
  ( (Nil!1192) (Cons!1191 (h!1768 (_ BitVec 64)) (t!4210 List!1195)) )
))
(declare-fun arrayNoDuplicates!0 (array!2937 (_ BitVec 32) List!1195) Bool)

(assert (=> b!44007 (arrayNoDuplicates!0 lt!19228 #b00000000000000000000000000000000 Nil!1192)))

(declare-fun lt!19217 () Unit!1239)

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2937 (_ BitVec 32) (_ BitVec 32) List!1195) Unit!1239)

(assert (=> b!44007 (= lt!19217 (lemmaArrayNoDuplicatesInAll0Array!0 lt!19228 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1192))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2937 (_ BitVec 32)) Bool)

(assert (=> b!44007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19228 mask!853)))

(declare-fun lt!19219 () Unit!1239)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2937 (_ BitVec 32) (_ BitVec 32)) Unit!1239)

(assert (=> b!44007 (= lt!19219 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19228 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2937 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!44007 (= (arrayCountValidKeys!0 lt!19228 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19220 () Unit!1239)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2937 (_ BitVec 32) (_ BitVec 32)) Unit!1239)

(assert (=> b!44007 (= lt!19220 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19228 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun defaultEntry!470 () Int)

(declare-fun lt!19222 () array!2939)

(declare-fun lt!19223 () V!2325)

(assert (=> b!44007 (= lt!19216 (LongMapFixedSize!389 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19223 lt!19223 #b00000000000000000000000000000000 lt!19228 lt!19222 #b00000000000000000000000000000000))))

(assert (=> b!44007 (= lt!19222 (array!2940 ((as const (Array (_ BitVec 32) ValueCell!704)) EmptyCell!704) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!44007 (= lt!19228 (array!2938 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!261 (Int (_ BitVec 64)) V!2325)

(assert (=> b!44007 (= lt!19223 (dynLambda!261 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44008 () Bool)

(declare-fun Unit!1241 () Unit!1239)

(assert (=> b!44008 (= e!27903 Unit!1241)))

(declare-fun lt!19227 () tuple2!1616)

(declare-fun head!891 (List!1194) tuple2!1616)

(assert (=> b!44008 (= lt!19227 (head!891 (toList!609 lt!19221)))))

(declare-fun lt!19224 () Unit!1239)

(declare-fun lemmaKeyInListMapIsInArray!112 (array!2937 array!2939 (_ BitVec 32) (_ BitVec 32) V!2325 V!2325 (_ BitVec 64) Int) Unit!1239)

(assert (=> b!44008 (= lt!19224 (lemmaKeyInListMapIsInArray!112 lt!19228 lt!19222 mask!853 #b00000000000000000000000000000000 lt!19223 lt!19223 (_1!819 lt!19227) defaultEntry!470))))

(declare-fun res!26012 () Bool)

(assert (=> b!44008 (= res!26012 (and (not (= (_1!819 lt!19227) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!819 lt!19227) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!27902 () Bool)

(assert (=> b!44008 (=> (not res!26012) (not e!27902))))

(assert (=> b!44008 e!27902))

(declare-fun lt!19226 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2937 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!44008 (= lt!19226 (arrayScanForKey!0 lt!19228 (_1!819 lt!19227) #b00000000000000000000000000000000))))

(assert (=> b!44008 false))

(declare-fun b!44009 () Bool)

(assert (=> b!44009 (= e!27900 (not lt!19225))))

(declare-fun res!26011 () Bool)

(assert (=> start!6740 (=> (not res!26011) (not e!27901))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6740 (= res!26011 (validMask!0 mask!853))))

(assert (=> start!6740 e!27901))

(assert (=> start!6740 true))

(assert (=> start!6740 tp!5957))

(declare-fun b!44010 () Bool)

(declare-fun arrayContainsKey!0 (array!2937 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!44010 (= e!27902 (arrayContainsKey!0 lt!19228 (_1!819 lt!19227) #b00000000000000000000000000000000))))

(declare-fun b!44011 () Bool)

(declare-fun Unit!1242 () Unit!1239)

(assert (=> b!44011 (= e!27903 Unit!1242)))

(assert (= (and start!6740 res!26011) b!44007))

(assert (= (and b!44007 c!5719) b!44008))

(assert (= (and b!44007 (not c!5719)) b!44011))

(assert (= (and b!44008 res!26012) b!44010))

(assert (= (and b!44007 res!26010) b!44009))

(declare-fun b_lambda!2309 () Bool)

(assert (=> (not b_lambda!2309) (not b!44007)))

(declare-fun t!4208 () Bool)

(declare-fun tb!1001 () Bool)

(assert (=> (and start!6740 (= defaultEntry!470 defaultEntry!470) t!4208) tb!1001))

(declare-fun result!1747 () Bool)

(declare-fun tp_is_empty!1903 () Bool)

(assert (=> tb!1001 (= result!1747 tp_is_empty!1903)))

(assert (=> b!44007 t!4208))

(declare-fun b_and!2699 () Bool)

(assert (= b_and!2697 (and (=> t!4208 result!1747) b_and!2699)))

(declare-fun m!38143 () Bool)

(assert (=> b!44007 m!38143))

(declare-fun m!38145 () Bool)

(assert (=> b!44007 m!38145))

(declare-fun m!38147 () Bool)

(assert (=> b!44007 m!38147))

(declare-fun m!38149 () Bool)

(assert (=> b!44007 m!38149))

(declare-fun m!38151 () Bool)

(assert (=> b!44007 m!38151))

(declare-fun m!38153 () Bool)

(assert (=> b!44007 m!38153))

(declare-fun m!38155 () Bool)

(assert (=> b!44007 m!38155))

(declare-fun m!38157 () Bool)

(assert (=> b!44007 m!38157))

(declare-fun m!38159 () Bool)

(assert (=> b!44007 m!38159))

(declare-fun m!38161 () Bool)

(assert (=> b!44008 m!38161))

(declare-fun m!38163 () Bool)

(assert (=> b!44008 m!38163))

(declare-fun m!38165 () Bool)

(assert (=> b!44008 m!38165))

(declare-fun m!38167 () Bool)

(assert (=> start!6740 m!38167))

(declare-fun m!38169 () Bool)

(assert (=> b!44010 m!38169))

(check-sat tp_is_empty!1903 (not b!44007) (not start!6740) (not b_lambda!2309) (not b_next!1513) (not b!44010) b_and!2699 (not b!44008))
(check-sat b_and!2699 (not b_next!1513))
(get-model)

(declare-fun b_lambda!2319 () Bool)

(assert (= b_lambda!2309 (or (and start!6740 b_free!1513) b_lambda!2319)))

(check-sat tp_is_empty!1903 (not b!44007) (not start!6740) (not b_lambda!2319) (not b_next!1513) (not b!44010) b_and!2699 (not b!44008))
(check-sat b_and!2699 (not b_next!1513))
(get-model)

(declare-fun d!8271 () Bool)

(declare-fun res!26047 () Bool)

(declare-fun e!27942 () Bool)

(assert (=> d!8271 (=> res!26047 e!27942)))

(assert (=> d!8271 (= res!26047 (= (select (arr!1412 lt!19228) #b00000000000000000000000000000000) (_1!819 lt!19227)))))

(assert (=> d!8271 (= (arrayContainsKey!0 lt!19228 (_1!819 lt!19227) #b00000000000000000000000000000000) e!27942)))

(declare-fun b!44068 () Bool)

(declare-fun e!27943 () Bool)

(assert (=> b!44068 (= e!27942 e!27943)))

(declare-fun res!26048 () Bool)

(assert (=> b!44068 (=> (not res!26048) (not e!27943))))

(assert (=> b!44068 (= res!26048 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1615 lt!19228)))))

(declare-fun b!44069 () Bool)

(assert (=> b!44069 (= e!27943 (arrayContainsKey!0 lt!19228 (_1!819 lt!19227) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8271 (not res!26047)) b!44068))

(assert (= (and b!44068 res!26048) b!44069))

(declare-fun m!38233 () Bool)

(assert (=> d!8271 m!38233))

(declare-fun m!38235 () Bool)

(assert (=> b!44069 m!38235))

(assert (=> b!44010 d!8271))

(declare-fun d!8273 () Bool)

(assert (=> d!8273 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6740 d!8273))

(declare-fun d!8283 () Bool)

(assert (=> d!8283 (= (arrayCountValidKeys!0 lt!19228 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19321 () Unit!1239)

(declare-fun choose!59 (array!2937 (_ BitVec 32) (_ BitVec 32)) Unit!1239)

(assert (=> d!8283 (= lt!19321 (choose!59 lt!19228 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8283 (bvslt (size!1615 lt!19228) #b01111111111111111111111111111111)))

(assert (=> d!8283 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19228 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19321)))

(declare-fun bs!2005 () Bool)

(assert (= bs!2005 d!8283))

(assert (=> bs!2005 m!38159))

(declare-fun m!38257 () Bool)

(assert (=> bs!2005 m!38257))

(assert (=> b!44007 d!8283))

(declare-fun b!44118 () Bool)

(declare-fun e!27977 () Bool)

(declare-fun call!3546 () Bool)

(assert (=> b!44118 (= e!27977 call!3546)))

(declare-fun b!44119 () Bool)

(declare-fun e!27976 () Bool)

(assert (=> b!44119 (= e!27976 e!27977)))

(declare-fun c!5743 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!44119 (= c!5743 (validKeyInArray!0 (select (arr!1412 lt!19228) #b00000000000000000000000000000000)))))

(declare-fun b!44120 () Bool)

(assert (=> b!44120 (= e!27977 call!3546)))

(declare-fun d!8285 () Bool)

(declare-fun res!26067 () Bool)

(declare-fun e!27975 () Bool)

(assert (=> d!8285 (=> res!26067 e!27975)))

(assert (=> d!8285 (= res!26067 (bvsge #b00000000000000000000000000000000 (size!1615 lt!19228)))))

(assert (=> d!8285 (= (arrayNoDuplicates!0 lt!19228 #b00000000000000000000000000000000 Nil!1192) e!27975)))

(declare-fun b!44121 () Bool)

(declare-fun e!27978 () Bool)

(declare-fun contains!565 (List!1195 (_ BitVec 64)) Bool)

(assert (=> b!44121 (= e!27978 (contains!565 Nil!1192 (select (arr!1412 lt!19228) #b00000000000000000000000000000000)))))

(declare-fun bm!3543 () Bool)

(assert (=> bm!3543 (= call!3546 (arrayNoDuplicates!0 lt!19228 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5743 (Cons!1191 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) Nil!1192) Nil!1192)))))

(declare-fun b!44122 () Bool)

(assert (=> b!44122 (= e!27975 e!27976)))

(declare-fun res!26068 () Bool)

(assert (=> b!44122 (=> (not res!26068) (not e!27976))))

(assert (=> b!44122 (= res!26068 (not e!27978))))

(declare-fun res!26069 () Bool)

(assert (=> b!44122 (=> (not res!26069) (not e!27978))))

(assert (=> b!44122 (= res!26069 (validKeyInArray!0 (select (arr!1412 lt!19228) #b00000000000000000000000000000000)))))

(assert (= (and d!8285 (not res!26067)) b!44122))

(assert (= (and b!44122 res!26069) b!44121))

(assert (= (and b!44122 res!26068) b!44119))

(assert (= (and b!44119 c!5743) b!44120))

(assert (= (and b!44119 (not c!5743)) b!44118))

(assert (= (or b!44120 b!44118) bm!3543))

(assert (=> b!44119 m!38233))

(assert (=> b!44119 m!38233))

(declare-fun m!38263 () Bool)

(assert (=> b!44119 m!38263))

(assert (=> b!44121 m!38233))

(assert (=> b!44121 m!38233))

(declare-fun m!38265 () Bool)

(assert (=> b!44121 m!38265))

(assert (=> bm!3543 m!38233))

(declare-fun m!38267 () Bool)

(assert (=> bm!3543 m!38267))

(assert (=> b!44122 m!38233))

(assert (=> b!44122 m!38233))

(assert (=> b!44122 m!38263))

(assert (=> b!44007 d!8285))

(declare-fun d!8291 () Bool)

(assert (=> d!8291 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19228 mask!853)))

(declare-fun lt!19333 () Unit!1239)

(declare-fun choose!34 (array!2937 (_ BitVec 32) (_ BitVec 32)) Unit!1239)

(assert (=> d!8291 (= lt!19333 (choose!34 lt!19228 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!8291 (validMask!0 mask!853)))

(assert (=> d!8291 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19228 mask!853 #b00000000000000000000000000000000) lt!19333)))

(declare-fun bs!2006 () Bool)

(assert (= bs!2006 d!8291))

(assert (=> bs!2006 m!38145))

(declare-fun m!38273 () Bool)

(assert (=> bs!2006 m!38273))

(assert (=> bs!2006 m!38167))

(assert (=> b!44007 d!8291))

(declare-fun d!8293 () Bool)

(assert (=> d!8293 (arrayNoDuplicates!0 lt!19228 #b00000000000000000000000000000000 Nil!1192)))

(declare-fun lt!19336 () Unit!1239)

(declare-fun choose!111 (array!2937 (_ BitVec 32) (_ BitVec 32) List!1195) Unit!1239)

(assert (=> d!8293 (= lt!19336 (choose!111 lt!19228 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1192))))

(assert (=> d!8293 (= (size!1615 lt!19228) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!8293 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!19228 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1192) lt!19336)))

(declare-fun bs!2008 () Bool)

(assert (= bs!2008 d!8293))

(assert (=> bs!2008 m!38143))

(declare-fun m!38281 () Bool)

(assert (=> bs!2008 m!38281))

(assert (=> b!44007 d!8293))

(declare-fun b!44155 () Bool)

(declare-fun e!28001 () Bool)

(declare-fun call!3555 () Bool)

(assert (=> b!44155 (= e!28001 call!3555)))

(declare-fun bm!3552 () Bool)

(assert (=> bm!3552 (= call!3555 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!19228 mask!853))))

(declare-fun b!44156 () Bool)

(declare-fun e!28000 () Bool)

(assert (=> b!44156 (= e!28000 call!3555)))

(declare-fun d!8299 () Bool)

(declare-fun res!26080 () Bool)

(declare-fun e!28002 () Bool)

(assert (=> d!8299 (=> res!26080 e!28002)))

(assert (=> d!8299 (= res!26080 (bvsge #b00000000000000000000000000000000 (size!1615 lt!19228)))))

(assert (=> d!8299 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19228 mask!853) e!28002)))

(declare-fun b!44157 () Bool)

(assert (=> b!44157 (= e!28000 e!28001)))

(declare-fun lt!19353 () (_ BitVec 64))

(assert (=> b!44157 (= lt!19353 (select (arr!1412 lt!19228) #b00000000000000000000000000000000))))

(declare-fun lt!19354 () Unit!1239)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2937 (_ BitVec 64) (_ BitVec 32)) Unit!1239)

(assert (=> b!44157 (= lt!19354 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19228 lt!19353 #b00000000000000000000000000000000))))

(assert (=> b!44157 (arrayContainsKey!0 lt!19228 lt!19353 #b00000000000000000000000000000000)))

(declare-fun lt!19352 () Unit!1239)

(assert (=> b!44157 (= lt!19352 lt!19354)))

(declare-fun res!26081 () Bool)

(declare-datatypes ((SeekEntryResult!197 0))(
  ( (MissingZero!197 (index!2910 (_ BitVec 32))) (Found!197 (index!2911 (_ BitVec 32))) (Intermediate!197 (undefined!1009 Bool) (index!2912 (_ BitVec 32)) (x!8351 (_ BitVec 32))) (Undefined!197) (MissingVacant!197 (index!2913 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2937 (_ BitVec 32)) SeekEntryResult!197)

(assert (=> b!44157 (= res!26081 (= (seekEntryOrOpen!0 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) lt!19228 mask!853) (Found!197 #b00000000000000000000000000000000)))))

(assert (=> b!44157 (=> (not res!26081) (not e!28001))))

(declare-fun b!44158 () Bool)

(assert (=> b!44158 (= e!28002 e!28000)))

(declare-fun c!5755 () Bool)

(assert (=> b!44158 (= c!5755 (validKeyInArray!0 (select (arr!1412 lt!19228) #b00000000000000000000000000000000)))))

(assert (= (and d!8299 (not res!26080)) b!44158))

(assert (= (and b!44158 c!5755) b!44157))

(assert (= (and b!44158 (not c!5755)) b!44156))

(assert (= (and b!44157 res!26081) b!44155))

(assert (= (or b!44155 b!44156) bm!3552))

(declare-fun m!38293 () Bool)

(assert (=> bm!3552 m!38293))

(assert (=> b!44157 m!38233))

(declare-fun m!38295 () Bool)

(assert (=> b!44157 m!38295))

(declare-fun m!38297 () Bool)

(assert (=> b!44157 m!38297))

(assert (=> b!44157 m!38233))

(declare-fun m!38299 () Bool)

(assert (=> b!44157 m!38299))

(assert (=> b!44158 m!38233))

(assert (=> b!44158 m!38233))

(assert (=> b!44158 m!38263))

(assert (=> b!44007 d!8299))

(declare-fun d!8309 () Bool)

(declare-fun getCurrentListMap!339 (array!2937 array!2939 (_ BitVec 32) (_ BitVec 32) V!2325 V!2325 (_ BitVec 32) Int) ListLongMap!1187)

(assert (=> d!8309 (= (map!842 lt!19216) (getCurrentListMap!339 (_keys!3463 lt!19216) (_values!1879 lt!19216) (mask!5473 lt!19216) (extraKeys!1787 lt!19216) (zeroValue!1814 lt!19216) (minValue!1814 lt!19216) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19216)))))

(declare-fun bs!2013 () Bool)

(assert (= bs!2013 d!8309))

(declare-fun m!38305 () Bool)

(assert (=> bs!2013 m!38305))

(assert (=> b!44007 d!8309))

(declare-fun b!44185 () Bool)

(declare-fun e!28022 () (_ BitVec 32))

(declare-fun call!3561 () (_ BitVec 32))

(assert (=> b!44185 (= e!28022 (bvadd #b00000000000000000000000000000001 call!3561))))

(declare-fun b!44186 () Bool)

(assert (=> b!44186 (= e!28022 call!3561)))

(declare-fun b!44187 () Bool)

(declare-fun e!28023 () (_ BitVec 32))

(assert (=> b!44187 (= e!28023 #b00000000000000000000000000000000)))

(declare-fun b!44188 () Bool)

(assert (=> b!44188 (= e!28023 e!28022)))

(declare-fun c!5763 () Bool)

(assert (=> b!44188 (= c!5763 (validKeyInArray!0 (select (arr!1412 lt!19228) #b00000000000000000000000000000000)))))

(declare-fun d!8315 () Bool)

(declare-fun lt!19372 () (_ BitVec 32))

(assert (=> d!8315 (and (bvsge lt!19372 #b00000000000000000000000000000000) (bvsle lt!19372 (bvsub (size!1615 lt!19228) #b00000000000000000000000000000000)))))

(assert (=> d!8315 (= lt!19372 e!28023)))

(declare-fun c!5764 () Bool)

(assert (=> d!8315 (= c!5764 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8315 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1615 lt!19228)))))

(assert (=> d!8315 (= (arrayCountValidKeys!0 lt!19228 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19372)))

(declare-fun bm!3558 () Bool)

(assert (=> bm!3558 (= call!3561 (arrayCountValidKeys!0 lt!19228 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!8315 c!5764) b!44187))

(assert (= (and d!8315 (not c!5764)) b!44188))

(assert (= (and b!44188 c!5763) b!44185))

(assert (= (and b!44188 (not c!5763)) b!44186))

(assert (= (or b!44185 b!44186) bm!3558))

(assert (=> b!44188 m!38233))

(assert (=> b!44188 m!38233))

(assert (=> b!44188 m!38263))

(declare-fun m!38317 () Bool)

(assert (=> bm!3558 m!38317))

(assert (=> b!44007 d!8315))

(declare-fun d!8323 () Bool)

(declare-fun res!26109 () Bool)

(declare-fun e!28031 () Bool)

(assert (=> d!8323 (=> (not res!26109) (not e!28031))))

(declare-fun simpleValid!32 (LongMapFixedSize!388) Bool)

(assert (=> d!8323 (= res!26109 (simpleValid!32 lt!19216))))

(assert (=> d!8323 (= (valid!138 lt!19216) e!28031)))

(declare-fun b!44208 () Bool)

(declare-fun res!26110 () Bool)

(assert (=> b!44208 (=> (not res!26110) (not e!28031))))

(assert (=> b!44208 (= res!26110 (= (arrayCountValidKeys!0 (_keys!3463 lt!19216) #b00000000000000000000000000000000 (size!1615 (_keys!3463 lt!19216))) (_size!243 lt!19216)))))

(declare-fun b!44209 () Bool)

(declare-fun res!26111 () Bool)

(assert (=> b!44209 (=> (not res!26111) (not e!28031))))

(assert (=> b!44209 (= res!26111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3463 lt!19216) (mask!5473 lt!19216)))))

(declare-fun b!44210 () Bool)

(assert (=> b!44210 (= e!28031 (arrayNoDuplicates!0 (_keys!3463 lt!19216) #b00000000000000000000000000000000 Nil!1192))))

(assert (= (and d!8323 res!26109) b!44208))

(assert (= (and b!44208 res!26110) b!44209))

(assert (= (and b!44209 res!26111) b!44210))

(declare-fun m!38327 () Bool)

(assert (=> d!8323 m!38327))

(declare-fun m!38329 () Bool)

(assert (=> b!44208 m!38329))

(declare-fun m!38331 () Bool)

(assert (=> b!44209 m!38331))

(declare-fun m!38333 () Bool)

(assert (=> b!44210 m!38333))

(assert (=> b!44007 d!8323))

(declare-fun d!8329 () Bool)

(assert (=> d!8329 (= (head!891 (toList!609 lt!19221)) (h!1767 (toList!609 lt!19221)))))

(assert (=> b!44008 d!8329))

(declare-fun d!8335 () Bool)

(declare-fun e!28046 () Bool)

(assert (=> d!8335 e!28046))

(declare-fun c!5775 () Bool)

(assert (=> d!8335 (= c!5775 (and (not (= (_1!819 lt!19227) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!819 lt!19227) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!19384 () Unit!1239)

(declare-fun choose!270 (array!2937 array!2939 (_ BitVec 32) (_ BitVec 32) V!2325 V!2325 (_ BitVec 64) Int) Unit!1239)

(assert (=> d!8335 (= lt!19384 (choose!270 lt!19228 lt!19222 mask!853 #b00000000000000000000000000000000 lt!19223 lt!19223 (_1!819 lt!19227) defaultEntry!470))))

(assert (=> d!8335 (validMask!0 mask!853)))

(assert (=> d!8335 (= (lemmaKeyInListMapIsInArray!112 lt!19228 lt!19222 mask!853 #b00000000000000000000000000000000 lt!19223 lt!19223 (_1!819 lt!19227) defaultEntry!470) lt!19384)))

(declare-fun b!44233 () Bool)

(assert (=> b!44233 (= e!28046 (arrayContainsKey!0 lt!19228 (_1!819 lt!19227) #b00000000000000000000000000000000))))

(declare-fun b!44234 () Bool)

(assert (=> b!44234 (= e!28046 (ite (= (_1!819 lt!19227) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!8335 c!5775) b!44233))

(assert (= (and d!8335 (not c!5775)) b!44234))

(declare-fun m!38343 () Bool)

(assert (=> d!8335 m!38343))

(assert (=> d!8335 m!38167))

(assert (=> b!44233 m!38169))

(assert (=> b!44008 d!8335))

(declare-fun d!8337 () Bool)

(declare-fun lt!19387 () (_ BitVec 32))

(assert (=> d!8337 (and (or (bvslt lt!19387 #b00000000000000000000000000000000) (bvsge lt!19387 (size!1615 lt!19228)) (and (bvsge lt!19387 #b00000000000000000000000000000000) (bvslt lt!19387 (size!1615 lt!19228)))) (bvsge lt!19387 #b00000000000000000000000000000000) (bvslt lt!19387 (size!1615 lt!19228)) (= (select (arr!1412 lt!19228) lt!19387) (_1!819 lt!19227)))))

(declare-fun e!28053 () (_ BitVec 32))

(assert (=> d!8337 (= lt!19387 e!28053)))

(declare-fun c!5779 () Bool)

(assert (=> d!8337 (= c!5779 (= (select (arr!1412 lt!19228) #b00000000000000000000000000000000) (_1!819 lt!19227)))))

(assert (=> d!8337 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1615 lt!19228)) (bvslt (size!1615 lt!19228) #b01111111111111111111111111111111))))

(assert (=> d!8337 (= (arrayScanForKey!0 lt!19228 (_1!819 lt!19227) #b00000000000000000000000000000000) lt!19387)))

(declare-fun b!44244 () Bool)

(assert (=> b!44244 (= e!28053 #b00000000000000000000000000000000)))

(declare-fun b!44245 () Bool)

(assert (=> b!44245 (= e!28053 (arrayScanForKey!0 lt!19228 (_1!819 lt!19227) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8337 c!5779) b!44244))

(assert (= (and d!8337 (not c!5779)) b!44245))

(declare-fun m!38349 () Bool)

(assert (=> d!8337 m!38349))

(assert (=> d!8337 m!38233))

(declare-fun m!38351 () Bool)

(assert (=> b!44245 m!38351))

(assert (=> b!44008 d!8337))

(check-sat (not b!44157) (not bm!3552) (not b!44210) (not d!8335) (not d!8291) (not b_lambda!2319) (not bm!3543) (not d!8293) (not b!44233) (not b!44069) (not b_next!1513) (not b!44122) (not b!44208) (not d!8283) (not b!44119) (not bm!3558) tp_is_empty!1903 (not b!44188) b_and!2699 (not d!8309) (not b!44158) (not b!44245) (not d!8323) (not b!44121) (not b!44209))
(check-sat b_and!2699 (not b_next!1513))
(get-model)

(declare-fun b!44253 () Bool)

(declare-fun e!28062 () Bool)

(declare-fun call!3566 () Bool)

(assert (=> b!44253 (= e!28062 call!3566)))

(declare-fun b!44254 () Bool)

(declare-fun e!28061 () Bool)

(assert (=> b!44254 (= e!28061 e!28062)))

(declare-fun c!5781 () Bool)

(assert (=> b!44254 (= c!5781 (validKeyInArray!0 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44255 () Bool)

(assert (=> b!44255 (= e!28062 call!3566)))

(declare-fun d!8351 () Bool)

(declare-fun res!26126 () Bool)

(declare-fun e!28060 () Bool)

(assert (=> d!8351 (=> res!26126 e!28060)))

(assert (=> d!8351 (= res!26126 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1615 lt!19228)))))

(assert (=> d!8351 (= (arrayNoDuplicates!0 lt!19228 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5743 (Cons!1191 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) Nil!1192) Nil!1192)) e!28060)))

(declare-fun b!44256 () Bool)

(declare-fun e!28063 () Bool)

(assert (=> b!44256 (= e!28063 (contains!565 (ite c!5743 (Cons!1191 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) Nil!1192) Nil!1192) (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3563 () Bool)

(assert (=> bm!3563 (= call!3566 (arrayNoDuplicates!0 lt!19228 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5781 (Cons!1191 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5743 (Cons!1191 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) Nil!1192) Nil!1192)) (ite c!5743 (Cons!1191 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) Nil!1192) Nil!1192))))))

(declare-fun b!44257 () Bool)

(assert (=> b!44257 (= e!28060 e!28061)))

(declare-fun res!26127 () Bool)

(assert (=> b!44257 (=> (not res!26127) (not e!28061))))

(assert (=> b!44257 (= res!26127 (not e!28063))))

(declare-fun res!26128 () Bool)

(assert (=> b!44257 (=> (not res!26128) (not e!28063))))

(assert (=> b!44257 (= res!26128 (validKeyInArray!0 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!8351 (not res!26126)) b!44257))

(assert (= (and b!44257 res!26128) b!44256))

(assert (= (and b!44257 res!26127) b!44254))

(assert (= (and b!44254 c!5781) b!44255))

(assert (= (and b!44254 (not c!5781)) b!44253))

(assert (= (or b!44255 b!44253) bm!3563))

(declare-fun m!38365 () Bool)

(assert (=> b!44254 m!38365))

(assert (=> b!44254 m!38365))

(declare-fun m!38367 () Bool)

(assert (=> b!44254 m!38367))

(assert (=> b!44256 m!38365))

(assert (=> b!44256 m!38365))

(declare-fun m!38369 () Bool)

(assert (=> b!44256 m!38369))

(assert (=> bm!3563 m!38365))

(declare-fun m!38371 () Bool)

(assert (=> bm!3563 m!38371))

(assert (=> b!44257 m!38365))

(assert (=> b!44257 m!38365))

(assert (=> b!44257 m!38367))

(assert (=> bm!3543 d!8351))

(declare-fun d!8353 () Bool)

(assert (=> d!8353 (= (validKeyInArray!0 (select (arr!1412 lt!19228) #b00000000000000000000000000000000)) (and (not (= (select (arr!1412 lt!19228) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1412 lt!19228) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44122 d!8353))

(declare-fun b!44258 () Bool)

(declare-fun e!28064 () (_ BitVec 32))

(declare-fun call!3567 () (_ BitVec 32))

(assert (=> b!44258 (= e!28064 (bvadd #b00000000000000000000000000000001 call!3567))))

(declare-fun b!44259 () Bool)

(assert (=> b!44259 (= e!28064 call!3567)))

(declare-fun b!44260 () Bool)

(declare-fun e!28065 () (_ BitVec 32))

(assert (=> b!44260 (= e!28065 #b00000000000000000000000000000000)))

(declare-fun b!44261 () Bool)

(assert (=> b!44261 (= e!28065 e!28064)))

(declare-fun c!5782 () Bool)

(assert (=> b!44261 (= c!5782 (validKeyInArray!0 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)))))

(declare-fun d!8355 () Bool)

(declare-fun lt!19391 () (_ BitVec 32))

(assert (=> d!8355 (and (bvsge lt!19391 #b00000000000000000000000000000000) (bvsle lt!19391 (bvsub (size!1615 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)))))

(assert (=> d!8355 (= lt!19391 e!28065)))

(declare-fun c!5783 () Bool)

(assert (=> d!8355 (= c!5783 (bvsge #b00000000000000000000000000000000 (size!1615 (_keys!3463 lt!19216))))))

(assert (=> d!8355 (and (bvsle #b00000000000000000000000000000000 (size!1615 (_keys!3463 lt!19216))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1615 (_keys!3463 lt!19216)) (size!1615 (_keys!3463 lt!19216))))))

(assert (=> d!8355 (= (arrayCountValidKeys!0 (_keys!3463 lt!19216) #b00000000000000000000000000000000 (size!1615 (_keys!3463 lt!19216))) lt!19391)))

(declare-fun bm!3564 () Bool)

(assert (=> bm!3564 (= call!3567 (arrayCountValidKeys!0 (_keys!3463 lt!19216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1615 (_keys!3463 lt!19216))))))

(assert (= (and d!8355 c!5783) b!44260))

(assert (= (and d!8355 (not c!5783)) b!44261))

(assert (= (and b!44261 c!5782) b!44258))

(assert (= (and b!44261 (not c!5782)) b!44259))

(assert (= (or b!44258 b!44259) bm!3564))

(declare-fun m!38373 () Bool)

(assert (=> b!44261 m!38373))

(assert (=> b!44261 m!38373))

(declare-fun m!38375 () Bool)

(assert (=> b!44261 m!38375))

(declare-fun m!38377 () Bool)

(assert (=> bm!3564 m!38377))

(assert (=> b!44208 d!8355))

(declare-fun b!44264 () Bool)

(declare-fun e!28067 () Bool)

(declare-fun call!3568 () Bool)

(assert (=> b!44264 (= e!28067 call!3568)))

(declare-fun bm!3565 () Bool)

(assert (=> bm!3565 (= call!3568 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3463 lt!19216) (mask!5473 lt!19216)))))

(declare-fun b!44265 () Bool)

(declare-fun e!28066 () Bool)

(assert (=> b!44265 (= e!28066 call!3568)))

(declare-fun d!8357 () Bool)

(declare-fun res!26129 () Bool)

(declare-fun e!28068 () Bool)

(assert (=> d!8357 (=> res!26129 e!28068)))

(assert (=> d!8357 (= res!26129 (bvsge #b00000000000000000000000000000000 (size!1615 (_keys!3463 lt!19216))))))

(assert (=> d!8357 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3463 lt!19216) (mask!5473 lt!19216)) e!28068)))

(declare-fun b!44266 () Bool)

(assert (=> b!44266 (= e!28066 e!28067)))

(declare-fun lt!19397 () (_ BitVec 64))

(assert (=> b!44266 (= lt!19397 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000))))

(declare-fun lt!19398 () Unit!1239)

(assert (=> b!44266 (= lt!19398 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3463 lt!19216) lt!19397 #b00000000000000000000000000000000))))

(assert (=> b!44266 (arrayContainsKey!0 (_keys!3463 lt!19216) lt!19397 #b00000000000000000000000000000000)))

(declare-fun lt!19396 () Unit!1239)

(assert (=> b!44266 (= lt!19396 lt!19398)))

(declare-fun res!26130 () Bool)

(assert (=> b!44266 (= res!26130 (= (seekEntryOrOpen!0 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000) (_keys!3463 lt!19216) (mask!5473 lt!19216)) (Found!197 #b00000000000000000000000000000000)))))

(assert (=> b!44266 (=> (not res!26130) (not e!28067))))

(declare-fun b!44267 () Bool)

(assert (=> b!44267 (= e!28068 e!28066)))

(declare-fun c!5784 () Bool)

(assert (=> b!44267 (= c!5784 (validKeyInArray!0 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)))))

(assert (= (and d!8357 (not res!26129)) b!44267))

(assert (= (and b!44267 c!5784) b!44266))

(assert (= (and b!44267 (not c!5784)) b!44265))

(assert (= (and b!44266 res!26130) b!44264))

(assert (= (or b!44264 b!44265) bm!3565))

(declare-fun m!38379 () Bool)

(assert (=> bm!3565 m!38379))

(assert (=> b!44266 m!38373))

(declare-fun m!38381 () Bool)

(assert (=> b!44266 m!38381))

(declare-fun m!38383 () Bool)

(assert (=> b!44266 m!38383))

(assert (=> b!44266 m!38373))

(declare-fun m!38385 () Bool)

(assert (=> b!44266 m!38385))

(assert (=> b!44267 m!38373))

(assert (=> b!44267 m!38373))

(assert (=> b!44267 m!38375))

(assert (=> b!44209 d!8357))

(assert (=> b!44233 d!8271))

(declare-fun d!8361 () Bool)

(declare-fun e!28080 () Bool)

(assert (=> d!8361 e!28080))

(declare-fun c!5796 () Bool)

(assert (=> d!8361 (= c!5796 (and (not (= (_1!819 lt!19227) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!819 lt!19227) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!8361 true))

(declare-fun _$15!83 () Unit!1239)

(assert (=> d!8361 (= (choose!270 lt!19228 lt!19222 mask!853 #b00000000000000000000000000000000 lt!19223 lt!19223 (_1!819 lt!19227) defaultEntry!470) _$15!83)))

(declare-fun b!44288 () Bool)

(assert (=> b!44288 (= e!28080 (arrayContainsKey!0 lt!19228 (_1!819 lt!19227) #b00000000000000000000000000000000))))

(declare-fun b!44289 () Bool)

(assert (=> b!44289 (= e!28080 (ite (= (_1!819 lt!19227) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand #b00000000000000000000000000000000 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and d!8361 c!5796) b!44288))

(assert (= (and d!8361 (not c!5796)) b!44289))

(assert (=> b!44288 m!38169))

(assert (=> d!8335 d!8361))

(assert (=> d!8335 d!8273))

(declare-fun b!44436 () Bool)

(declare-fun e!28175 () Unit!1239)

(declare-fun Unit!1251 () Unit!1239)

(assert (=> b!44436 (= e!28175 Unit!1251)))

(declare-fun bm!3596 () Bool)

(declare-fun call!3602 () ListLongMap!1187)

(declare-fun call!3605 () ListLongMap!1187)

(declare-fun call!3601 () ListLongMap!1187)

(declare-fun call!3604 () ListLongMap!1187)

(declare-fun c!5843 () Bool)

(declare-fun c!5844 () Bool)

(declare-fun +!69 (ListLongMap!1187 tuple2!1616) ListLongMap!1187)

(assert (=> bm!3596 (= call!3601 (+!69 (ite c!5844 call!3604 (ite c!5843 call!3602 call!3605)) (ite (or c!5844 c!5843) (tuple2!1617 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19216)) (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216)))))))

(declare-fun b!44437 () Bool)

(declare-fun e!28171 () Bool)

(declare-fun e!28167 () Bool)

(assert (=> b!44437 (= e!28171 e!28167)))

(declare-fun c!5839 () Bool)

(assert (=> b!44437 (= c!5839 (not (= (bvand (extraKeys!1787 lt!19216) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!8365 () Bool)

(assert (=> d!8365 e!28171))

(declare-fun res!26200 () Bool)

(assert (=> d!8365 (=> (not res!26200) (not e!28171))))

(assert (=> d!8365 (= res!26200 (or (bvsge #b00000000000000000000000000000000 (size!1615 (_keys!3463 lt!19216))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1615 (_keys!3463 lt!19216))))))))

(declare-fun lt!19486 () ListLongMap!1187)

(declare-fun lt!19491 () ListLongMap!1187)

(assert (=> d!8365 (= lt!19486 lt!19491)))

(declare-fun lt!19482 () Unit!1239)

(assert (=> d!8365 (= lt!19482 e!28175)))

(declare-fun c!5842 () Bool)

(declare-fun e!28172 () Bool)

(assert (=> d!8365 (= c!5842 e!28172)))

(declare-fun res!26201 () Bool)

(assert (=> d!8365 (=> (not res!26201) (not e!28172))))

(assert (=> d!8365 (= res!26201 (bvslt #b00000000000000000000000000000000 (size!1615 (_keys!3463 lt!19216))))))

(declare-fun e!28170 () ListLongMap!1187)

(assert (=> d!8365 (= lt!19491 e!28170)))

(assert (=> d!8365 (= c!5844 (and (not (= (bvand (extraKeys!1787 lt!19216) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1787 lt!19216) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!8365 (validMask!0 (mask!5473 lt!19216))))

(assert (=> d!8365 (= (getCurrentListMap!339 (_keys!3463 lt!19216) (_values!1879 lt!19216) (mask!5473 lt!19216) (extraKeys!1787 lt!19216) (zeroValue!1814 lt!19216) (minValue!1814 lt!19216) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19216)) lt!19486)))

(declare-fun b!44438 () Bool)

(declare-fun e!28165 () ListLongMap!1187)

(assert (=> b!44438 (= e!28170 e!28165)))

(assert (=> b!44438 (= c!5843 (and (not (= (bvand (extraKeys!1787 lt!19216) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1787 lt!19216) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!44439 () Bool)

(declare-fun e!28163 () Bool)

(declare-fun e!28166 () Bool)

(assert (=> b!44439 (= e!28163 e!28166)))

(declare-fun res!26196 () Bool)

(assert (=> b!44439 (=> (not res!26196) (not e!28166))))

(declare-fun contains!568 (ListLongMap!1187 (_ BitVec 64)) Bool)

(assert (=> b!44439 (= res!26196 (contains!568 lt!19486 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)))))

(assert (=> b!44439 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1615 (_keys!3463 lt!19216))))))

(declare-fun b!44440 () Bool)

(declare-fun call!3599 () Bool)

(assert (=> b!44440 (= e!28167 (not call!3599))))

(declare-fun b!44441 () Bool)

(declare-fun res!26198 () Bool)

(assert (=> b!44441 (=> (not res!26198) (not e!28171))))

(declare-fun e!28173 () Bool)

(assert (=> b!44441 (= res!26198 e!28173)))

(declare-fun c!5840 () Bool)

(assert (=> b!44441 (= c!5840 (not (= (bvand (extraKeys!1787 lt!19216) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!44442 () Bool)

(declare-fun e!28164 () Bool)

(assert (=> b!44442 (= e!28167 e!28164)))

(declare-fun res!26204 () Bool)

(assert (=> b!44442 (= res!26204 call!3599)))

(assert (=> b!44442 (=> (not res!26204) (not e!28164))))

(declare-fun b!44443 () Bool)

(declare-fun res!26197 () Bool)

(assert (=> b!44443 (=> (not res!26197) (not e!28171))))

(assert (=> b!44443 (= res!26197 e!28163)))

(declare-fun res!26202 () Bool)

(assert (=> b!44443 (=> res!26202 e!28163)))

(declare-fun e!28168 () Bool)

(assert (=> b!44443 (= res!26202 (not e!28168))))

(declare-fun res!26203 () Bool)

(assert (=> b!44443 (=> (not res!26203) (not e!28168))))

(assert (=> b!44443 (= res!26203 (bvslt #b00000000000000000000000000000000 (size!1615 (_keys!3463 lt!19216))))))

(declare-fun b!44444 () Bool)

(assert (=> b!44444 (= e!28170 (+!69 call!3601 (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216))))))

(declare-fun b!44445 () Bool)

(assert (=> b!44445 (= e!28172 (validKeyInArray!0 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)))))

(declare-fun b!44446 () Bool)

(declare-fun call!3603 () ListLongMap!1187)

(assert (=> b!44446 (= e!28165 call!3603)))

(declare-fun b!44447 () Bool)

(declare-fun apply!61 (ListLongMap!1187 (_ BitVec 64)) V!2325)

(declare-fun get!801 (ValueCell!704 V!2325) V!2325)

(assert (=> b!44447 (= e!28166 (= (apply!61 lt!19486 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)) (get!801 (select (arr!1413 (_values!1879 lt!19216)) #b00000000000000000000000000000000) (dynLambda!261 (defaultEntry!1896 lt!19216) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44447 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1616 (_values!1879 lt!19216))))))

(assert (=> b!44447 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1615 (_keys!3463 lt!19216))))))

(declare-fun b!44448 () Bool)

(declare-fun call!3600 () Bool)

(assert (=> b!44448 (= e!28173 (not call!3600))))

(declare-fun b!44449 () Bool)

(declare-fun e!28174 () ListLongMap!1187)

(assert (=> b!44449 (= e!28174 call!3605)))

(declare-fun bm!3597 () Bool)

(assert (=> bm!3597 (= call!3600 (contains!568 lt!19486 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44450 () Bool)

(declare-fun e!28169 () Bool)

(assert (=> b!44450 (= e!28173 e!28169)))

(declare-fun res!26199 () Bool)

(assert (=> b!44450 (= res!26199 call!3600)))

(assert (=> b!44450 (=> (not res!26199) (not e!28169))))

(declare-fun bm!3598 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!39 (array!2937 array!2939 (_ BitVec 32) (_ BitVec 32) V!2325 V!2325 (_ BitVec 32) Int) ListLongMap!1187)

(assert (=> bm!3598 (= call!3604 (getCurrentListMapNoExtraKeys!39 (_keys!3463 lt!19216) (_values!1879 lt!19216) (mask!5473 lt!19216) (extraKeys!1787 lt!19216) (zeroValue!1814 lt!19216) (minValue!1814 lt!19216) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19216)))))

(declare-fun bm!3599 () Bool)

(assert (=> bm!3599 (= call!3602 call!3604)))

(declare-fun b!44451 () Bool)

(assert (=> b!44451 (= e!28174 call!3603)))

(declare-fun bm!3600 () Bool)

(assert (=> bm!3600 (= call!3599 (contains!568 lt!19486 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44452 () Bool)

(assert (=> b!44452 (= e!28169 (= (apply!61 lt!19486 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1814 lt!19216)))))

(declare-fun b!44453 () Bool)

(assert (=> b!44453 (= e!28164 (= (apply!61 lt!19486 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1814 lt!19216)))))

(declare-fun bm!3601 () Bool)

(assert (=> bm!3601 (= call!3603 call!3601)))

(declare-fun b!44454 () Bool)

(declare-fun c!5841 () Bool)

(assert (=> b!44454 (= c!5841 (and (not (= (bvand (extraKeys!1787 lt!19216) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1787 lt!19216) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!44454 (= e!28165 e!28174)))

(declare-fun b!44455 () Bool)

(declare-fun lt!19488 () Unit!1239)

(assert (=> b!44455 (= e!28175 lt!19488)))

(declare-fun lt!19481 () ListLongMap!1187)

(assert (=> b!44455 (= lt!19481 (getCurrentListMapNoExtraKeys!39 (_keys!3463 lt!19216) (_values!1879 lt!19216) (mask!5473 lt!19216) (extraKeys!1787 lt!19216) (zeroValue!1814 lt!19216) (minValue!1814 lt!19216) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19216)))))

(declare-fun lt!19476 () (_ BitVec 64))

(assert (=> b!44455 (= lt!19476 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19485 () (_ BitVec 64))

(assert (=> b!44455 (= lt!19485 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000))))

(declare-fun lt!19477 () Unit!1239)

(declare-fun addStillContains!37 (ListLongMap!1187 (_ BitVec 64) V!2325 (_ BitVec 64)) Unit!1239)

(assert (=> b!44455 (= lt!19477 (addStillContains!37 lt!19481 lt!19476 (zeroValue!1814 lt!19216) lt!19485))))

(assert (=> b!44455 (contains!568 (+!69 lt!19481 (tuple2!1617 lt!19476 (zeroValue!1814 lt!19216))) lt!19485)))

(declare-fun lt!19495 () Unit!1239)

(assert (=> b!44455 (= lt!19495 lt!19477)))

(declare-fun lt!19490 () ListLongMap!1187)

(assert (=> b!44455 (= lt!19490 (getCurrentListMapNoExtraKeys!39 (_keys!3463 lt!19216) (_values!1879 lt!19216) (mask!5473 lt!19216) (extraKeys!1787 lt!19216) (zeroValue!1814 lt!19216) (minValue!1814 lt!19216) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19216)))))

(declare-fun lt!19492 () (_ BitVec 64))

(assert (=> b!44455 (= lt!19492 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19487 () (_ BitVec 64))

(assert (=> b!44455 (= lt!19487 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000))))

(declare-fun lt!19483 () Unit!1239)

(declare-fun addApplyDifferent!37 (ListLongMap!1187 (_ BitVec 64) V!2325 (_ BitVec 64)) Unit!1239)

(assert (=> b!44455 (= lt!19483 (addApplyDifferent!37 lt!19490 lt!19492 (minValue!1814 lt!19216) lt!19487))))

(assert (=> b!44455 (= (apply!61 (+!69 lt!19490 (tuple2!1617 lt!19492 (minValue!1814 lt!19216))) lt!19487) (apply!61 lt!19490 lt!19487))))

(declare-fun lt!19493 () Unit!1239)

(assert (=> b!44455 (= lt!19493 lt!19483)))

(declare-fun lt!19479 () ListLongMap!1187)

(assert (=> b!44455 (= lt!19479 (getCurrentListMapNoExtraKeys!39 (_keys!3463 lt!19216) (_values!1879 lt!19216) (mask!5473 lt!19216) (extraKeys!1787 lt!19216) (zeroValue!1814 lt!19216) (minValue!1814 lt!19216) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19216)))))

(declare-fun lt!19484 () (_ BitVec 64))

(assert (=> b!44455 (= lt!19484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19497 () (_ BitVec 64))

(assert (=> b!44455 (= lt!19497 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000))))

(declare-fun lt!19478 () Unit!1239)

(assert (=> b!44455 (= lt!19478 (addApplyDifferent!37 lt!19479 lt!19484 (zeroValue!1814 lt!19216) lt!19497))))

(assert (=> b!44455 (= (apply!61 (+!69 lt!19479 (tuple2!1617 lt!19484 (zeroValue!1814 lt!19216))) lt!19497) (apply!61 lt!19479 lt!19497))))

(declare-fun lt!19494 () Unit!1239)

(assert (=> b!44455 (= lt!19494 lt!19478)))

(declare-fun lt!19496 () ListLongMap!1187)

(assert (=> b!44455 (= lt!19496 (getCurrentListMapNoExtraKeys!39 (_keys!3463 lt!19216) (_values!1879 lt!19216) (mask!5473 lt!19216) (extraKeys!1787 lt!19216) (zeroValue!1814 lt!19216) (minValue!1814 lt!19216) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19216)))))

(declare-fun lt!19489 () (_ BitVec 64))

(assert (=> b!44455 (= lt!19489 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!19480 () (_ BitVec 64))

(assert (=> b!44455 (= lt!19480 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000))))

(assert (=> b!44455 (= lt!19488 (addApplyDifferent!37 lt!19496 lt!19489 (minValue!1814 lt!19216) lt!19480))))

(assert (=> b!44455 (= (apply!61 (+!69 lt!19496 (tuple2!1617 lt!19489 (minValue!1814 lt!19216))) lt!19480) (apply!61 lt!19496 lt!19480))))

(declare-fun bm!3602 () Bool)

(assert (=> bm!3602 (= call!3605 call!3602)))

(declare-fun b!44456 () Bool)

(assert (=> b!44456 (= e!28168 (validKeyInArray!0 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)))))

(assert (= (and d!8365 c!5844) b!44444))

(assert (= (and d!8365 (not c!5844)) b!44438))

(assert (= (and b!44438 c!5843) b!44446))

(assert (= (and b!44438 (not c!5843)) b!44454))

(assert (= (and b!44454 c!5841) b!44451))

(assert (= (and b!44454 (not c!5841)) b!44449))

(assert (= (or b!44451 b!44449) bm!3602))

(assert (= (or b!44446 bm!3602) bm!3599))

(assert (= (or b!44446 b!44451) bm!3601))

(assert (= (or b!44444 bm!3599) bm!3598))

(assert (= (or b!44444 bm!3601) bm!3596))

(assert (= (and d!8365 res!26201) b!44445))

(assert (= (and d!8365 c!5842) b!44455))

(assert (= (and d!8365 (not c!5842)) b!44436))

(assert (= (and d!8365 res!26200) b!44443))

(assert (= (and b!44443 res!26203) b!44456))

(assert (= (and b!44443 (not res!26202)) b!44439))

(assert (= (and b!44439 res!26196) b!44447))

(assert (= (and b!44443 res!26197) b!44441))

(assert (= (and b!44441 c!5840) b!44450))

(assert (= (and b!44441 (not c!5840)) b!44448))

(assert (= (and b!44450 res!26199) b!44452))

(assert (= (or b!44450 b!44448) bm!3597))

(assert (= (and b!44441 res!26198) b!44437))

(assert (= (and b!44437 c!5839) b!44442))

(assert (= (and b!44437 (not c!5839)) b!44440))

(assert (= (and b!44442 res!26204) b!44453))

(assert (= (or b!44442 b!44440) bm!3600))

(declare-fun b_lambda!2321 () Bool)

(assert (=> (not b_lambda!2321) (not b!44447)))

(declare-fun t!4220 () Bool)

(declare-fun tb!1007 () Bool)

(assert (=> (and start!6740 (= defaultEntry!470 (defaultEntry!1896 lt!19216)) t!4220) tb!1007))

(declare-fun result!1759 () Bool)

(assert (=> tb!1007 (= result!1759 tp_is_empty!1903)))

(assert (=> b!44447 t!4220))

(declare-fun b_and!2709 () Bool)

(assert (= b_and!2699 (and (=> t!4220 result!1759) b_and!2709)))

(declare-fun m!38475 () Bool)

(assert (=> b!44444 m!38475))

(assert (=> b!44445 m!38373))

(assert (=> b!44445 m!38373))

(assert (=> b!44445 m!38375))

(declare-fun m!38477 () Bool)

(assert (=> d!8365 m!38477))

(assert (=> b!44439 m!38373))

(assert (=> b!44439 m!38373))

(declare-fun m!38479 () Bool)

(assert (=> b!44439 m!38479))

(declare-fun m!38481 () Bool)

(assert (=> bm!3600 m!38481))

(declare-fun m!38483 () Bool)

(assert (=> b!44452 m!38483))

(declare-fun m!38485 () Bool)

(assert (=> bm!3597 m!38485))

(declare-fun m!38487 () Bool)

(assert (=> bm!3596 m!38487))

(declare-fun m!38489 () Bool)

(assert (=> b!44455 m!38489))

(declare-fun m!38491 () Bool)

(assert (=> b!44455 m!38491))

(declare-fun m!38493 () Bool)

(assert (=> b!44455 m!38493))

(declare-fun m!38495 () Bool)

(assert (=> b!44455 m!38495))

(declare-fun m!38497 () Bool)

(assert (=> b!44455 m!38497))

(declare-fun m!38499 () Bool)

(assert (=> b!44455 m!38499))

(declare-fun m!38501 () Bool)

(assert (=> b!44455 m!38501))

(assert (=> b!44455 m!38373))

(assert (=> b!44455 m!38499))

(declare-fun m!38503 () Bool)

(assert (=> b!44455 m!38503))

(declare-fun m!38505 () Bool)

(assert (=> b!44455 m!38505))

(declare-fun m!38507 () Bool)

(assert (=> b!44455 m!38507))

(declare-fun m!38509 () Bool)

(assert (=> b!44455 m!38509))

(declare-fun m!38511 () Bool)

(assert (=> b!44455 m!38511))

(declare-fun m!38513 () Bool)

(assert (=> b!44455 m!38513))

(declare-fun m!38515 () Bool)

(assert (=> b!44455 m!38515))

(declare-fun m!38517 () Bool)

(assert (=> b!44455 m!38517))

(assert (=> b!44455 m!38491))

(assert (=> b!44455 m!38495))

(assert (=> b!44455 m!38517))

(declare-fun m!38519 () Bool)

(assert (=> b!44455 m!38519))

(assert (=> b!44456 m!38373))

(assert (=> b!44456 m!38373))

(assert (=> b!44456 m!38375))

(declare-fun m!38521 () Bool)

(assert (=> b!44453 m!38521))

(assert (=> b!44447 m!38373))

(declare-fun m!38523 () Bool)

(assert (=> b!44447 m!38523))

(declare-fun m!38525 () Bool)

(assert (=> b!44447 m!38525))

(declare-fun m!38527 () Bool)

(assert (=> b!44447 m!38527))

(assert (=> b!44447 m!38373))

(assert (=> b!44447 m!38527))

(assert (=> b!44447 m!38525))

(declare-fun m!38529 () Bool)

(assert (=> b!44447 m!38529))

(assert (=> bm!3598 m!38501))

(assert (=> d!8309 d!8365))

(declare-fun d!8409 () Bool)

(assert (=> d!8409 (arrayContainsKey!0 lt!19228 lt!19353 #b00000000000000000000000000000000)))

(declare-fun lt!19540 () Unit!1239)

(declare-fun choose!13 (array!2937 (_ BitVec 64) (_ BitVec 32)) Unit!1239)

(assert (=> d!8409 (= lt!19540 (choose!13 lt!19228 lt!19353 #b00000000000000000000000000000000))))

(assert (=> d!8409 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!8409 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19228 lt!19353 #b00000000000000000000000000000000) lt!19540)))

(declare-fun bs!2023 () Bool)

(assert (= bs!2023 d!8409))

(assert (=> bs!2023 m!38297))

(declare-fun m!38531 () Bool)

(assert (=> bs!2023 m!38531))

(assert (=> b!44157 d!8409))

(declare-fun d!8411 () Bool)

(declare-fun res!26217 () Bool)

(declare-fun e!28188 () Bool)

(assert (=> d!8411 (=> res!26217 e!28188)))

(assert (=> d!8411 (= res!26217 (= (select (arr!1412 lt!19228) #b00000000000000000000000000000000) lt!19353))))

(assert (=> d!8411 (= (arrayContainsKey!0 lt!19228 lt!19353 #b00000000000000000000000000000000) e!28188)))

(declare-fun b!44471 () Bool)

(declare-fun e!28189 () Bool)

(assert (=> b!44471 (= e!28188 e!28189)))

(declare-fun res!26218 () Bool)

(assert (=> b!44471 (=> (not res!26218) (not e!28189))))

(assert (=> b!44471 (= res!26218 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1615 lt!19228)))))

(declare-fun b!44472 () Bool)

(assert (=> b!44472 (= e!28189 (arrayContainsKey!0 lt!19228 lt!19353 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8411 (not res!26217)) b!44471))

(assert (= (and b!44471 res!26218) b!44472))

(assert (=> d!8411 m!38233))

(declare-fun m!38533 () Bool)

(assert (=> b!44472 m!38533))

(assert (=> b!44157 d!8411))

(declare-fun b!44520 () Bool)

(declare-fun e!28215 () SeekEntryResult!197)

(declare-fun lt!19563 () SeekEntryResult!197)

(assert (=> b!44520 (= e!28215 (MissingZero!197 (index!2912 lt!19563)))))

(declare-fun b!44521 () Bool)

(declare-fun e!28214 () SeekEntryResult!197)

(assert (=> b!44521 (= e!28214 (Found!197 (index!2912 lt!19563)))))

(declare-fun b!44522 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2937 (_ BitVec 32)) SeekEntryResult!197)

(assert (=> b!44522 (= e!28215 (seekKeyOrZeroReturnVacant!0 (x!8351 lt!19563) (index!2912 lt!19563) (index!2912 lt!19563) (select (arr!1412 lt!19228) #b00000000000000000000000000000000) lt!19228 mask!853))))

(declare-fun b!44523 () Bool)

(declare-fun c!5867 () Bool)

(declare-fun lt!19564 () (_ BitVec 64))

(assert (=> b!44523 (= c!5867 (= lt!19564 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!44523 (= e!28214 e!28215)))

(declare-fun b!44524 () Bool)

(declare-fun e!28216 () SeekEntryResult!197)

(assert (=> b!44524 (= e!28216 e!28214)))

(assert (=> b!44524 (= lt!19564 (select (arr!1412 lt!19228) (index!2912 lt!19563)))))

(declare-fun c!5865 () Bool)

(assert (=> b!44524 (= c!5865 (= lt!19564 (select (arr!1412 lt!19228) #b00000000000000000000000000000000)))))

(declare-fun b!44519 () Bool)

(assert (=> b!44519 (= e!28216 Undefined!197)))

(declare-fun d!8413 () Bool)

(declare-fun lt!19565 () SeekEntryResult!197)

(get-info :version)

(assert (=> d!8413 (and (or ((_ is Undefined!197) lt!19565) (not ((_ is Found!197) lt!19565)) (and (bvsge (index!2911 lt!19565) #b00000000000000000000000000000000) (bvslt (index!2911 lt!19565) (size!1615 lt!19228)))) (or ((_ is Undefined!197) lt!19565) ((_ is Found!197) lt!19565) (not ((_ is MissingZero!197) lt!19565)) (and (bvsge (index!2910 lt!19565) #b00000000000000000000000000000000) (bvslt (index!2910 lt!19565) (size!1615 lt!19228)))) (or ((_ is Undefined!197) lt!19565) ((_ is Found!197) lt!19565) ((_ is MissingZero!197) lt!19565) (not ((_ is MissingVacant!197) lt!19565)) (and (bvsge (index!2913 lt!19565) #b00000000000000000000000000000000) (bvslt (index!2913 lt!19565) (size!1615 lt!19228)))) (or ((_ is Undefined!197) lt!19565) (ite ((_ is Found!197) lt!19565) (= (select (arr!1412 lt!19228) (index!2911 lt!19565)) (select (arr!1412 lt!19228) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!197) lt!19565) (= (select (arr!1412 lt!19228) (index!2910 lt!19565)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!197) lt!19565) (= (select (arr!1412 lt!19228) (index!2913 lt!19565)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!8413 (= lt!19565 e!28216)))

(declare-fun c!5866 () Bool)

(assert (=> d!8413 (= c!5866 (and ((_ is Intermediate!197) lt!19563) (undefined!1009 lt!19563)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2937 (_ BitVec 32)) SeekEntryResult!197)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!8413 (= lt!19563 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) mask!853) (select (arr!1412 lt!19228) #b00000000000000000000000000000000) lt!19228 mask!853))))

(assert (=> d!8413 (validMask!0 mask!853)))

(assert (=> d!8413 (= (seekEntryOrOpen!0 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) lt!19228 mask!853) lt!19565)))

(assert (= (and d!8413 c!5866) b!44519))

(assert (= (and d!8413 (not c!5866)) b!44524))

(assert (= (and b!44524 c!5865) b!44521))

(assert (= (and b!44524 (not c!5865)) b!44523))

(assert (= (and b!44523 c!5867) b!44520))

(assert (= (and b!44523 (not c!5867)) b!44522))

(assert (=> b!44522 m!38233))

(declare-fun m!38535 () Bool)

(assert (=> b!44522 m!38535))

(declare-fun m!38537 () Bool)

(assert (=> b!44524 m!38537))

(declare-fun m!38539 () Bool)

(assert (=> d!8413 m!38539))

(assert (=> d!8413 m!38233))

(declare-fun m!38541 () Bool)

(assert (=> d!8413 m!38541))

(assert (=> d!8413 m!38541))

(assert (=> d!8413 m!38233))

(declare-fun m!38543 () Bool)

(assert (=> d!8413 m!38543))

(assert (=> d!8413 m!38167))

(declare-fun m!38545 () Bool)

(assert (=> d!8413 m!38545))

(declare-fun m!38547 () Bool)

(assert (=> d!8413 m!38547))

(assert (=> b!44157 d!8413))

(assert (=> b!44158 d!8353))

(assert (=> d!8291 d!8299))

(declare-fun d!8415 () Bool)

(assert (=> d!8415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19228 mask!853)))

(assert (=> d!8415 true))

(declare-fun _$30!75 () Unit!1239)

(assert (=> d!8415 (= (choose!34 lt!19228 mask!853 #b00000000000000000000000000000000) _$30!75)))

(declare-fun bs!2024 () Bool)

(assert (= bs!2024 d!8415))

(assert (=> bs!2024 m!38145))

(assert (=> d!8291 d!8415))

(assert (=> d!8291 d!8273))

(declare-fun d!8417 () Bool)

(declare-fun lt!19618 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!44 (List!1195) (InoxSet (_ BitVec 64)))

(assert (=> d!8417 (= lt!19618 (select (content!44 Nil!1192) (select (arr!1412 lt!19228) #b00000000000000000000000000000000)))))

(declare-fun e!28251 () Bool)

(assert (=> d!8417 (= lt!19618 e!28251)))

(declare-fun res!26256 () Bool)

(assert (=> d!8417 (=> (not res!26256) (not e!28251))))

(assert (=> d!8417 (= res!26256 ((_ is Cons!1191) Nil!1192))))

(assert (=> d!8417 (= (contains!565 Nil!1192 (select (arr!1412 lt!19228) #b00000000000000000000000000000000)) lt!19618)))

(declare-fun b!44574 () Bool)

(declare-fun e!28250 () Bool)

(assert (=> b!44574 (= e!28251 e!28250)))

(declare-fun res!26257 () Bool)

(assert (=> b!44574 (=> res!26257 e!28250)))

(assert (=> b!44574 (= res!26257 (= (h!1768 Nil!1192) (select (arr!1412 lt!19228) #b00000000000000000000000000000000)))))

(declare-fun b!44575 () Bool)

(assert (=> b!44575 (= e!28250 (contains!565 (t!4210 Nil!1192) (select (arr!1412 lt!19228) #b00000000000000000000000000000000)))))

(assert (= (and d!8417 res!26256) b!44574))

(assert (= (and b!44574 (not res!26257)) b!44575))

(declare-fun m!38603 () Bool)

(assert (=> d!8417 m!38603))

(assert (=> d!8417 m!38233))

(declare-fun m!38605 () Bool)

(assert (=> d!8417 m!38605))

(assert (=> b!44575 m!38233))

(declare-fun m!38607 () Bool)

(assert (=> b!44575 m!38607))

(assert (=> b!44121 d!8417))

(declare-fun d!8421 () Bool)

(declare-fun lt!19620 () (_ BitVec 32))

(assert (=> d!8421 (and (or (bvslt lt!19620 #b00000000000000000000000000000000) (bvsge lt!19620 (size!1615 lt!19228)) (and (bvsge lt!19620 #b00000000000000000000000000000000) (bvslt lt!19620 (size!1615 lt!19228)))) (bvsge lt!19620 #b00000000000000000000000000000000) (bvslt lt!19620 (size!1615 lt!19228)) (= (select (arr!1412 lt!19228) lt!19620) (_1!819 lt!19227)))))

(declare-fun e!28253 () (_ BitVec 32))

(assert (=> d!8421 (= lt!19620 e!28253)))

(declare-fun c!5879 () Bool)

(assert (=> d!8421 (= c!5879 (= (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_1!819 lt!19227)))))

(assert (=> d!8421 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1615 lt!19228)) (bvslt (size!1615 lt!19228) #b01111111111111111111111111111111))))

(assert (=> d!8421 (= (arrayScanForKey!0 lt!19228 (_1!819 lt!19227) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19620)))

(declare-fun b!44578 () Bool)

(assert (=> b!44578 (= e!28253 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))

(declare-fun b!44579 () Bool)

(assert (=> b!44579 (= e!28253 (arrayScanForKey!0 lt!19228 (_1!819 lt!19227) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8421 c!5879) b!44578))

(assert (= (and d!8421 (not c!5879)) b!44579))

(declare-fun m!38613 () Bool)

(assert (=> d!8421 m!38613))

(assert (=> d!8421 m!38365))

(declare-fun m!38615 () Bool)

(assert (=> b!44579 m!38615))

(assert (=> b!44245 d!8421))

(declare-fun b!44584 () Bool)

(declare-fun e!28256 () (_ BitVec 32))

(declare-fun call!3632 () (_ BitVec 32))

(assert (=> b!44584 (= e!28256 (bvadd #b00000000000000000000000000000001 call!3632))))

(declare-fun b!44585 () Bool)

(assert (=> b!44585 (= e!28256 call!3632)))

(declare-fun b!44586 () Bool)

(declare-fun e!28257 () (_ BitVec 32))

(assert (=> b!44586 (= e!28257 #b00000000000000000000000000000000)))

(declare-fun b!44587 () Bool)

(assert (=> b!44587 (= e!28257 e!28256)))

(declare-fun c!5882 () Bool)

(assert (=> b!44587 (= c!5882 (validKeyInArray!0 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!8425 () Bool)

(declare-fun lt!19622 () (_ BitVec 32))

(assert (=> d!8425 (and (bvsge lt!19622 #b00000000000000000000000000000000) (bvsle lt!19622 (bvsub (size!1615 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!8425 (= lt!19622 e!28257)))

(declare-fun c!5883 () Bool)

(assert (=> d!8425 (= c!5883 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8425 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1615 lt!19228)))))

(assert (=> d!8425 (= (arrayCountValidKeys!0 lt!19228 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!19622)))

(declare-fun bm!3629 () Bool)

(assert (=> bm!3629 (= call!3632 (arrayCountValidKeys!0 lt!19228 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!8425 c!5883) b!44586))

(assert (= (and d!8425 (not c!5883)) b!44587))

(assert (= (and b!44587 c!5882) b!44584))

(assert (= (and b!44587 (not c!5882)) b!44585))

(assert (= (or b!44584 b!44585) bm!3629))

(assert (=> b!44587 m!38365))

(assert (=> b!44587 m!38365))

(assert (=> b!44587 m!38367))

(declare-fun m!38619 () Bool)

(assert (=> bm!3629 m!38619))

(assert (=> bm!3558 d!8425))

(assert (=> b!44188 d!8353))

(declare-fun b!44629 () Bool)

(declare-fun res!26284 () Bool)

(declare-fun e!28282 () Bool)

(assert (=> b!44629 (=> (not res!26284) (not e!28282))))

(declare-fun size!1635 (LongMapFixedSize!388) (_ BitVec 32))

(assert (=> b!44629 (= res!26284 (= (size!1635 lt!19216) (bvadd (_size!243 lt!19216) (bvsdiv (bvadd (extraKeys!1787 lt!19216) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!44628 () Bool)

(declare-fun res!26283 () Bool)

(assert (=> b!44628 (=> (not res!26283) (not e!28282))))

(assert (=> b!44628 (= res!26283 (bvsge (size!1635 lt!19216) (_size!243 lt!19216)))))

(declare-fun b!44627 () Bool)

(declare-fun res!26286 () Bool)

(assert (=> b!44627 (=> (not res!26286) (not e!28282))))

(assert (=> b!44627 (= res!26286 (and (= (size!1616 (_values!1879 lt!19216)) (bvadd (mask!5473 lt!19216) #b00000000000000000000000000000001)) (= (size!1615 (_keys!3463 lt!19216)) (size!1616 (_values!1879 lt!19216))) (bvsge (_size!243 lt!19216) #b00000000000000000000000000000000) (bvsle (_size!243 lt!19216) (bvadd (mask!5473 lt!19216) #b00000000000000000000000000000001))))))

(declare-fun d!8429 () Bool)

(declare-fun res!26285 () Bool)

(assert (=> d!8429 (=> (not res!26285) (not e!28282))))

(assert (=> d!8429 (= res!26285 (validMask!0 (mask!5473 lt!19216)))))

(assert (=> d!8429 (= (simpleValid!32 lt!19216) e!28282)))

(declare-fun b!44630 () Bool)

(assert (=> b!44630 (= e!28282 (and (bvsge (extraKeys!1787 lt!19216) #b00000000000000000000000000000000) (bvsle (extraKeys!1787 lt!19216) #b00000000000000000000000000000011) (bvsge (_vacant!243 lt!19216) #b00000000000000000000000000000000)))))

(assert (= (and d!8429 res!26285) b!44627))

(assert (= (and b!44627 res!26286) b!44628))

(assert (= (and b!44628 res!26283) b!44629))

(assert (= (and b!44629 res!26284) b!44630))

(declare-fun m!38635 () Bool)

(assert (=> b!44629 m!38635))

(assert (=> b!44628 m!38635))

(assert (=> d!8429 m!38477))

(assert (=> d!8323 d!8429))

(declare-fun b!44631 () Bool)

(declare-fun e!28284 () Bool)

(declare-fun call!3641 () Bool)

(assert (=> b!44631 (= e!28284 call!3641)))

(declare-fun bm!3638 () Bool)

(assert (=> bm!3638 (= call!3641 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!19228 mask!853))))

(declare-fun b!44632 () Bool)

(declare-fun e!28283 () Bool)

(assert (=> b!44632 (= e!28283 call!3641)))

(declare-fun d!8435 () Bool)

(declare-fun res!26287 () Bool)

(declare-fun e!28285 () Bool)

(assert (=> d!8435 (=> res!26287 e!28285)))

(assert (=> d!8435 (= res!26287 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1615 lt!19228)))))

(assert (=> d!8435 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!19228 mask!853) e!28285)))

(declare-fun b!44633 () Bool)

(assert (=> b!44633 (= e!28283 e!28284)))

(declare-fun lt!19652 () (_ BitVec 64))

(assert (=> b!44633 (= lt!19652 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!19653 () Unit!1239)

(assert (=> b!44633 (= lt!19653 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19228 lt!19652 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!44633 (arrayContainsKey!0 lt!19228 lt!19652 #b00000000000000000000000000000000)))

(declare-fun lt!19651 () Unit!1239)

(assert (=> b!44633 (= lt!19651 lt!19653)))

(declare-fun res!26288 () Bool)

(assert (=> b!44633 (= res!26288 (= (seekEntryOrOpen!0 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19228 mask!853) (Found!197 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!44633 (=> (not res!26288) (not e!28284))))

(declare-fun b!44634 () Bool)

(assert (=> b!44634 (= e!28285 e!28283)))

(declare-fun c!5891 () Bool)

(assert (=> b!44634 (= c!5891 (validKeyInArray!0 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!8435 (not res!26287)) b!44634))

(assert (= (and b!44634 c!5891) b!44633))

(assert (= (and b!44634 (not c!5891)) b!44632))

(assert (= (and b!44633 res!26288) b!44631))

(assert (= (or b!44631 b!44632) bm!3638))

(declare-fun m!38637 () Bool)

(assert (=> bm!3638 m!38637))

(assert (=> b!44633 m!38365))

(declare-fun m!38639 () Bool)

(assert (=> b!44633 m!38639))

(declare-fun m!38641 () Bool)

(assert (=> b!44633 m!38641))

(assert (=> b!44633 m!38365))

(declare-fun m!38643 () Bool)

(assert (=> b!44633 m!38643))

(assert (=> b!44634 m!38365))

(assert (=> b!44634 m!38365))

(assert (=> b!44634 m!38367))

(assert (=> bm!3552 d!8435))

(assert (=> b!44119 d!8353))

(declare-fun d!8437 () Bool)

(declare-fun res!26292 () Bool)

(declare-fun e!28286 () Bool)

(assert (=> d!8437 (=> res!26292 e!28286)))

(assert (=> d!8437 (= res!26292 (= (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_1!819 lt!19227)))))

(assert (=> d!8437 (= (arrayContainsKey!0 lt!19228 (_1!819 lt!19227) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!28286)))

(declare-fun b!44635 () Bool)

(declare-fun e!28287 () Bool)

(assert (=> b!44635 (= e!28286 e!28287)))

(declare-fun res!26293 () Bool)

(assert (=> b!44635 (=> (not res!26293) (not e!28287))))

(assert (=> b!44635 (= res!26293 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1615 lt!19228)))))

(declare-fun b!44636 () Bool)

(assert (=> b!44636 (= e!28287 (arrayContainsKey!0 lt!19228 (_1!819 lt!19227) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8437 (not res!26292)) b!44635))

(assert (= (and b!44635 res!26293) b!44636))

(assert (=> d!8437 m!38365))

(declare-fun m!38645 () Bool)

(assert (=> b!44636 m!38645))

(assert (=> b!44069 d!8437))

(declare-fun b!44637 () Bool)

(declare-fun e!28290 () Bool)

(declare-fun call!3642 () Bool)

(assert (=> b!44637 (= e!28290 call!3642)))

(declare-fun b!44638 () Bool)

(declare-fun e!28289 () Bool)

(assert (=> b!44638 (= e!28289 e!28290)))

(declare-fun c!5892 () Bool)

(assert (=> b!44638 (= c!5892 (validKeyInArray!0 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)))))

(declare-fun b!44639 () Bool)

(assert (=> b!44639 (= e!28290 call!3642)))

(declare-fun d!8439 () Bool)

(declare-fun res!26294 () Bool)

(declare-fun e!28288 () Bool)

(assert (=> d!8439 (=> res!26294 e!28288)))

(assert (=> d!8439 (= res!26294 (bvsge #b00000000000000000000000000000000 (size!1615 (_keys!3463 lt!19216))))))

(assert (=> d!8439 (= (arrayNoDuplicates!0 (_keys!3463 lt!19216) #b00000000000000000000000000000000 Nil!1192) e!28288)))

(declare-fun b!44640 () Bool)

(declare-fun e!28291 () Bool)

(assert (=> b!44640 (= e!28291 (contains!565 Nil!1192 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)))))

(declare-fun bm!3639 () Bool)

(assert (=> bm!3639 (= call!3642 (arrayNoDuplicates!0 (_keys!3463 lt!19216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5892 (Cons!1191 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000) Nil!1192) Nil!1192)))))

(declare-fun b!44641 () Bool)

(assert (=> b!44641 (= e!28288 e!28289)))

(declare-fun res!26295 () Bool)

(assert (=> b!44641 (=> (not res!26295) (not e!28289))))

(assert (=> b!44641 (= res!26295 (not e!28291))))

(declare-fun res!26296 () Bool)

(assert (=> b!44641 (=> (not res!26296) (not e!28291))))

(assert (=> b!44641 (= res!26296 (validKeyInArray!0 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)))))

(assert (= (and d!8439 (not res!26294)) b!44641))

(assert (= (and b!44641 res!26296) b!44640))

(assert (= (and b!44641 res!26295) b!44638))

(assert (= (and b!44638 c!5892) b!44639))

(assert (= (and b!44638 (not c!5892)) b!44637))

(assert (= (or b!44639 b!44637) bm!3639))

(assert (=> b!44638 m!38373))

(assert (=> b!44638 m!38373))

(assert (=> b!44638 m!38375))

(assert (=> b!44640 m!38373))

(assert (=> b!44640 m!38373))

(declare-fun m!38655 () Bool)

(assert (=> b!44640 m!38655))

(assert (=> bm!3639 m!38373))

(declare-fun m!38663 () Bool)

(assert (=> bm!3639 m!38663))

(assert (=> b!44641 m!38373))

(assert (=> b!44641 m!38373))

(assert (=> b!44641 m!38375))

(assert (=> b!44210 d!8439))

(assert (=> d!8293 d!8285))

(declare-fun d!8441 () Bool)

(assert (=> d!8441 (arrayNoDuplicates!0 lt!19228 #b00000000000000000000000000000000 Nil!1192)))

(assert (=> d!8441 true))

(declare-fun res!26299 () Unit!1239)

(assert (=> d!8441 (= (choose!111 lt!19228 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1192) res!26299)))

(declare-fun bs!2026 () Bool)

(assert (= bs!2026 d!8441))

(assert (=> bs!2026 m!38143))

(assert (=> d!8293 d!8441))

(assert (=> d!8283 d!8315))

(declare-fun d!8445 () Bool)

(assert (=> d!8445 (= (arrayCountValidKeys!0 lt!19228 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!8445 true))

(declare-fun _$88!61 () Unit!1239)

(assert (=> d!8445 (= (choose!59 lt!19228 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!61)))

(declare-fun bs!2027 () Bool)

(assert (= bs!2027 d!8445))

(assert (=> bs!2027 m!38159))

(assert (=> d!8283 d!8445))

(check-sat (not d!8409) (not b!44257) (not b!44629) (not b!44472) (not b!44266) (not b!44455) (not b!44267) (not bm!3639) (not b_lambda!2321) (not b_lambda!2319) (not b!44453) (not b!44587) (not d!8429) b_and!2709 (not bm!3629) (not bm!3564) (not bm!3596) (not bm!3597) (not b!44633) (not b!44445) (not bm!3563) tp_is_empty!1903 (not d!8365) (not b!44288) (not bm!3638) (not b!44641) (not b!44640) (not bm!3600) (not bm!3598) (not b!44522) (not b!44439) (not b!44447) (not bm!3565) (not d!8445) (not b!44575) (not b!44628) (not b!44256) (not d!8417) (not b!44636) (not b!44456) (not b!44254) (not b!44444) (not b!44634) (not b!44579) (not b_next!1513) (not b!44638) (not d!8413) (not b!44452) (not d!8415) (not b!44261) (not d!8441))
(check-sat b_and!2709 (not b_next!1513))
(get-model)

(declare-fun d!8453 () Bool)

(declare-fun lt!19658 () Bool)

(assert (=> d!8453 (= lt!19658 (select (content!44 (ite c!5743 (Cons!1191 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) Nil!1192) Nil!1192)) (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun e!28304 () Bool)

(assert (=> d!8453 (= lt!19658 e!28304)))

(declare-fun res!26307 () Bool)

(assert (=> d!8453 (=> (not res!26307) (not e!28304))))

(assert (=> d!8453 (= res!26307 ((_ is Cons!1191) (ite c!5743 (Cons!1191 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) Nil!1192) Nil!1192)))))

(assert (=> d!8453 (= (contains!565 (ite c!5743 (Cons!1191 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) Nil!1192) Nil!1192) (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!19658)))

(declare-fun b!44657 () Bool)

(declare-fun e!28303 () Bool)

(assert (=> b!44657 (= e!28304 e!28303)))

(declare-fun res!26308 () Bool)

(assert (=> b!44657 (=> res!26308 e!28303)))

(assert (=> b!44657 (= res!26308 (= (h!1768 (ite c!5743 (Cons!1191 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) Nil!1192) Nil!1192)) (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44658 () Bool)

(assert (=> b!44658 (= e!28303 (contains!565 (t!4210 (ite c!5743 (Cons!1191 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) Nil!1192) Nil!1192)) (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!8453 res!26307) b!44657))

(assert (= (and b!44657 (not res!26308)) b!44658))

(declare-fun m!38725 () Bool)

(assert (=> d!8453 m!38725))

(assert (=> d!8453 m!38365))

(declare-fun m!38727 () Bool)

(assert (=> d!8453 m!38727))

(assert (=> b!44658 m!38365))

(declare-fun m!38729 () Bool)

(assert (=> b!44658 m!38729))

(assert (=> b!44256 d!8453))

(assert (=> b!44288 d!8271))

(assert (=> d!8415 d!8299))

(declare-fun d!8455 () Bool)

(declare-fun res!26309 () Bool)

(declare-fun e!28305 () Bool)

(assert (=> d!8455 (=> res!26309 e!28305)))

(assert (=> d!8455 (= res!26309 (= (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (_1!819 lt!19227)))))

(assert (=> d!8455 (= (arrayContainsKey!0 lt!19228 (_1!819 lt!19227) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) e!28305)))

(declare-fun b!44659 () Bool)

(declare-fun e!28306 () Bool)

(assert (=> b!44659 (= e!28305 e!28306)))

(declare-fun res!26310 () Bool)

(assert (=> b!44659 (=> (not res!26310) (not e!28306))))

(assert (=> b!44659 (= res!26310 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1615 lt!19228)))))

(declare-fun b!44660 () Bool)

(assert (=> b!44660 (= e!28306 (arrayContainsKey!0 lt!19228 (_1!819 lt!19227) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8455 (not res!26309)) b!44659))

(assert (= (and b!44659 res!26310) b!44660))

(declare-fun m!38731 () Bool)

(assert (=> d!8455 m!38731))

(declare-fun m!38733 () Bool)

(assert (=> b!44660 m!38733))

(assert (=> b!44636 d!8455))

(declare-fun d!8457 () Bool)

(declare-fun lt!19659 () (_ BitVec 32))

(assert (=> d!8457 (and (or (bvslt lt!19659 #b00000000000000000000000000000000) (bvsge lt!19659 (size!1615 lt!19228)) (and (bvsge lt!19659 #b00000000000000000000000000000000) (bvslt lt!19659 (size!1615 lt!19228)))) (bvsge lt!19659 #b00000000000000000000000000000000) (bvslt lt!19659 (size!1615 lt!19228)) (= (select (arr!1412 lt!19228) lt!19659) (_1!819 lt!19227)))))

(declare-fun e!28307 () (_ BitVec 32))

(assert (=> d!8457 (= lt!19659 e!28307)))

(declare-fun c!5897 () Bool)

(assert (=> d!8457 (= c!5897 (= (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (_1!819 lt!19227)))))

(assert (=> d!8457 (and (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1615 lt!19228)) (bvslt (size!1615 lt!19228) #b01111111111111111111111111111111))))

(assert (=> d!8457 (= (arrayScanForKey!0 lt!19228 (_1!819 lt!19227) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!19659)))

(declare-fun b!44661 () Bool)

(assert (=> b!44661 (= e!28307 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))

(declare-fun b!44662 () Bool)

(assert (=> b!44662 (= e!28307 (arrayScanForKey!0 lt!19228 (_1!819 lt!19227) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8457 c!5897) b!44661))

(assert (= (and d!8457 (not c!5897)) b!44662))

(declare-fun m!38735 () Bool)

(assert (=> d!8457 m!38735))

(assert (=> d!8457 m!38731))

(declare-fun m!38737 () Bool)

(assert (=> b!44662 m!38737))

(assert (=> b!44579 d!8457))

(declare-fun d!8459 () Bool)

(declare-fun e!28312 () Bool)

(assert (=> d!8459 e!28312))

(declare-fun res!26313 () Bool)

(assert (=> d!8459 (=> res!26313 e!28312)))

(declare-fun lt!19669 () Bool)

(assert (=> d!8459 (= res!26313 (not lt!19669))))

(declare-fun lt!19671 () Bool)

(assert (=> d!8459 (= lt!19669 lt!19671)))

(declare-fun lt!19668 () Unit!1239)

(declare-fun e!28313 () Unit!1239)

(assert (=> d!8459 (= lt!19668 e!28313)))

(declare-fun c!5900 () Bool)

(assert (=> d!8459 (= c!5900 lt!19671)))

(declare-fun containsKey!75 (List!1194 (_ BitVec 64)) Bool)

(assert (=> d!8459 (= lt!19671 (containsKey!75 (toList!609 lt!19486) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8459 (= (contains!568 lt!19486 #b1000000000000000000000000000000000000000000000000000000000000000) lt!19669)))

(declare-fun b!44669 () Bool)

(declare-fun lt!19670 () Unit!1239)

(assert (=> b!44669 (= e!28313 lt!19670)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!63 (List!1194 (_ BitVec 64)) Unit!1239)

(assert (=> b!44669 (= lt!19670 (lemmaContainsKeyImpliesGetValueByKeyDefined!63 (toList!609 lt!19486) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!114 0))(
  ( (Some!113 (v!2093 V!2325)) (None!112) )
))
(declare-fun isDefined!64 (Option!114) Bool)

(declare-fun getValueByKey!108 (List!1194 (_ BitVec 64)) Option!114)

(assert (=> b!44669 (isDefined!64 (getValueByKey!108 (toList!609 lt!19486) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44670 () Bool)

(declare-fun Unit!1254 () Unit!1239)

(assert (=> b!44670 (= e!28313 Unit!1254)))

(declare-fun b!44671 () Bool)

(assert (=> b!44671 (= e!28312 (isDefined!64 (getValueByKey!108 (toList!609 lt!19486) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8459 c!5900) b!44669))

(assert (= (and d!8459 (not c!5900)) b!44670))

(assert (= (and d!8459 (not res!26313)) b!44671))

(declare-fun m!38739 () Bool)

(assert (=> d!8459 m!38739))

(declare-fun m!38741 () Bool)

(assert (=> b!44669 m!38741))

(declare-fun m!38743 () Bool)

(assert (=> b!44669 m!38743))

(assert (=> b!44669 m!38743))

(declare-fun m!38745 () Bool)

(assert (=> b!44669 m!38745))

(assert (=> b!44671 m!38743))

(assert (=> b!44671 m!38743))

(assert (=> b!44671 m!38745))

(assert (=> bm!3600 d!8459))

(declare-fun d!8461 () Bool)

(assert (=> d!8461 (= (validKeyInArray!0 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44641 d!8461))

(declare-fun d!8463 () Bool)

(declare-fun e!28314 () Bool)

(assert (=> d!8463 e!28314))

(declare-fun res!26314 () Bool)

(assert (=> d!8463 (=> res!26314 e!28314)))

(declare-fun lt!19673 () Bool)

(assert (=> d!8463 (= res!26314 (not lt!19673))))

(declare-fun lt!19675 () Bool)

(assert (=> d!8463 (= lt!19673 lt!19675)))

(declare-fun lt!19672 () Unit!1239)

(declare-fun e!28315 () Unit!1239)

(assert (=> d!8463 (= lt!19672 e!28315)))

(declare-fun c!5901 () Bool)

(assert (=> d!8463 (= c!5901 lt!19675)))

(assert (=> d!8463 (= lt!19675 (containsKey!75 (toList!609 lt!19486) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!8463 (= (contains!568 lt!19486 #b0000000000000000000000000000000000000000000000000000000000000000) lt!19673)))

(declare-fun b!44672 () Bool)

(declare-fun lt!19674 () Unit!1239)

(assert (=> b!44672 (= e!28315 lt!19674)))

(assert (=> b!44672 (= lt!19674 (lemmaContainsKeyImpliesGetValueByKeyDefined!63 (toList!609 lt!19486) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!44672 (isDefined!64 (getValueByKey!108 (toList!609 lt!19486) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44673 () Bool)

(declare-fun Unit!1255 () Unit!1239)

(assert (=> b!44673 (= e!28315 Unit!1255)))

(declare-fun b!44674 () Bool)

(assert (=> b!44674 (= e!28314 (isDefined!64 (getValueByKey!108 (toList!609 lt!19486) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8463 c!5901) b!44672))

(assert (= (and d!8463 (not c!5901)) b!44673))

(assert (= (and d!8463 (not res!26314)) b!44674))

(declare-fun m!38747 () Bool)

(assert (=> d!8463 m!38747))

(declare-fun m!38749 () Bool)

(assert (=> b!44672 m!38749))

(declare-fun m!38751 () Bool)

(assert (=> b!44672 m!38751))

(assert (=> b!44672 m!38751))

(declare-fun m!38753 () Bool)

(assert (=> b!44672 m!38753))

(assert (=> b!44674 m!38751))

(assert (=> b!44674 m!38751))

(assert (=> b!44674 m!38753))

(assert (=> bm!3597 d!8463))

(declare-fun d!8465 () Bool)

(assert (=> d!8465 (arrayContainsKey!0 (_keys!3463 lt!19216) lt!19397 #b00000000000000000000000000000000)))

(declare-fun lt!19676 () Unit!1239)

(assert (=> d!8465 (= lt!19676 (choose!13 (_keys!3463 lt!19216) lt!19397 #b00000000000000000000000000000000))))

(assert (=> d!8465 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!8465 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3463 lt!19216) lt!19397 #b00000000000000000000000000000000) lt!19676)))

(declare-fun bs!2028 () Bool)

(assert (= bs!2028 d!8465))

(assert (=> bs!2028 m!38383))

(declare-fun m!38755 () Bool)

(assert (=> bs!2028 m!38755))

(assert (=> b!44266 d!8465))

(declare-fun d!8467 () Bool)

(declare-fun res!26315 () Bool)

(declare-fun e!28316 () Bool)

(assert (=> d!8467 (=> res!26315 e!28316)))

(assert (=> d!8467 (= res!26315 (= (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000) lt!19397))))

(assert (=> d!8467 (= (arrayContainsKey!0 (_keys!3463 lt!19216) lt!19397 #b00000000000000000000000000000000) e!28316)))

(declare-fun b!44675 () Bool)

(declare-fun e!28317 () Bool)

(assert (=> b!44675 (= e!28316 e!28317)))

(declare-fun res!26316 () Bool)

(assert (=> b!44675 (=> (not res!26316) (not e!28317))))

(assert (=> b!44675 (= res!26316 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1615 (_keys!3463 lt!19216))))))

(declare-fun b!44676 () Bool)

(assert (=> b!44676 (= e!28317 (arrayContainsKey!0 (_keys!3463 lt!19216) lt!19397 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8467 (not res!26315)) b!44675))

(assert (= (and b!44675 res!26316) b!44676))

(assert (=> d!8467 m!38373))

(declare-fun m!38757 () Bool)

(assert (=> b!44676 m!38757))

(assert (=> b!44266 d!8467))

(declare-fun b!44678 () Bool)

(declare-fun e!28319 () SeekEntryResult!197)

(declare-fun lt!19677 () SeekEntryResult!197)

(assert (=> b!44678 (= e!28319 (MissingZero!197 (index!2912 lt!19677)))))

(declare-fun b!44679 () Bool)

(declare-fun e!28318 () SeekEntryResult!197)

(assert (=> b!44679 (= e!28318 (Found!197 (index!2912 lt!19677)))))

(declare-fun b!44680 () Bool)

(assert (=> b!44680 (= e!28319 (seekKeyOrZeroReturnVacant!0 (x!8351 lt!19677) (index!2912 lt!19677) (index!2912 lt!19677) (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000) (_keys!3463 lt!19216) (mask!5473 lt!19216)))))

(declare-fun b!44681 () Bool)

(declare-fun c!5904 () Bool)

(declare-fun lt!19678 () (_ BitVec 64))

(assert (=> b!44681 (= c!5904 (= lt!19678 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!44681 (= e!28318 e!28319)))

(declare-fun b!44682 () Bool)

(declare-fun e!28320 () SeekEntryResult!197)

(assert (=> b!44682 (= e!28320 e!28318)))

(assert (=> b!44682 (= lt!19678 (select (arr!1412 (_keys!3463 lt!19216)) (index!2912 lt!19677)))))

(declare-fun c!5902 () Bool)

(assert (=> b!44682 (= c!5902 (= lt!19678 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)))))

(declare-fun b!44677 () Bool)

(assert (=> b!44677 (= e!28320 Undefined!197)))

(declare-fun d!8469 () Bool)

(declare-fun lt!19679 () SeekEntryResult!197)

(assert (=> d!8469 (and (or ((_ is Undefined!197) lt!19679) (not ((_ is Found!197) lt!19679)) (and (bvsge (index!2911 lt!19679) #b00000000000000000000000000000000) (bvslt (index!2911 lt!19679) (size!1615 (_keys!3463 lt!19216))))) (or ((_ is Undefined!197) lt!19679) ((_ is Found!197) lt!19679) (not ((_ is MissingZero!197) lt!19679)) (and (bvsge (index!2910 lt!19679) #b00000000000000000000000000000000) (bvslt (index!2910 lt!19679) (size!1615 (_keys!3463 lt!19216))))) (or ((_ is Undefined!197) lt!19679) ((_ is Found!197) lt!19679) ((_ is MissingZero!197) lt!19679) (not ((_ is MissingVacant!197) lt!19679)) (and (bvsge (index!2913 lt!19679) #b00000000000000000000000000000000) (bvslt (index!2913 lt!19679) (size!1615 (_keys!3463 lt!19216))))) (or ((_ is Undefined!197) lt!19679) (ite ((_ is Found!197) lt!19679) (= (select (arr!1412 (_keys!3463 lt!19216)) (index!2911 lt!19679)) (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!197) lt!19679) (= (select (arr!1412 (_keys!3463 lt!19216)) (index!2910 lt!19679)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!197) lt!19679) (= (select (arr!1412 (_keys!3463 lt!19216)) (index!2913 lt!19679)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!8469 (= lt!19679 e!28320)))

(declare-fun c!5903 () Bool)

(assert (=> d!8469 (= c!5903 (and ((_ is Intermediate!197) lt!19677) (undefined!1009 lt!19677)))))

(assert (=> d!8469 (= lt!19677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000) (mask!5473 lt!19216)) (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000) (_keys!3463 lt!19216) (mask!5473 lt!19216)))))

(assert (=> d!8469 (validMask!0 (mask!5473 lt!19216))))

(assert (=> d!8469 (= (seekEntryOrOpen!0 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000) (_keys!3463 lt!19216) (mask!5473 lt!19216)) lt!19679)))

(assert (= (and d!8469 c!5903) b!44677))

(assert (= (and d!8469 (not c!5903)) b!44682))

(assert (= (and b!44682 c!5902) b!44679))

(assert (= (and b!44682 (not c!5902)) b!44681))

(assert (= (and b!44681 c!5904) b!44678))

(assert (= (and b!44681 (not c!5904)) b!44680))

(assert (=> b!44680 m!38373))

(declare-fun m!38759 () Bool)

(assert (=> b!44680 m!38759))

(declare-fun m!38761 () Bool)

(assert (=> b!44682 m!38761))

(declare-fun m!38763 () Bool)

(assert (=> d!8469 m!38763))

(assert (=> d!8469 m!38373))

(declare-fun m!38765 () Bool)

(assert (=> d!8469 m!38765))

(assert (=> d!8469 m!38765))

(assert (=> d!8469 m!38373))

(declare-fun m!38767 () Bool)

(assert (=> d!8469 m!38767))

(assert (=> d!8469 m!38477))

(declare-fun m!38769 () Bool)

(assert (=> d!8469 m!38769))

(declare-fun m!38771 () Bool)

(assert (=> d!8469 m!38771))

(assert (=> b!44266 d!8469))

(declare-fun d!8471 () Bool)

(assert (=> d!8471 (= (validKeyInArray!0 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!44254 d!8471))

(assert (=> b!44267 d!8461))

(declare-fun b!44707 () Bool)

(declare-fun e!28341 () Bool)

(declare-fun lt!19696 () ListLongMap!1187)

(declare-fun isEmpty!293 (ListLongMap!1187) Bool)

(assert (=> b!44707 (= e!28341 (isEmpty!293 lt!19696))))

(declare-fun b!44708 () Bool)

(declare-fun e!28335 () Bool)

(declare-fun e!28336 () Bool)

(assert (=> b!44708 (= e!28335 e!28336)))

(declare-fun c!5915 () Bool)

(declare-fun e!28339 () Bool)

(assert (=> b!44708 (= c!5915 e!28339)))

(declare-fun res!26327 () Bool)

(assert (=> b!44708 (=> (not res!26327) (not e!28339))))

(assert (=> b!44708 (= res!26327 (bvslt #b00000000000000000000000000000000 (size!1615 (_keys!3463 lt!19216))))))

(declare-fun b!44709 () Bool)

(assert (=> b!44709 (= e!28339 (validKeyInArray!0 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)))))

(assert (=> b!44709 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!8473 () Bool)

(assert (=> d!8473 e!28335))

(declare-fun res!26326 () Bool)

(assert (=> d!8473 (=> (not res!26326) (not e!28335))))

(assert (=> d!8473 (= res!26326 (not (contains!568 lt!19696 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!28340 () ListLongMap!1187)

(assert (=> d!8473 (= lt!19696 e!28340)))

(declare-fun c!5916 () Bool)

(assert (=> d!8473 (= c!5916 (bvsge #b00000000000000000000000000000000 (size!1615 (_keys!3463 lt!19216))))))

(assert (=> d!8473 (validMask!0 (mask!5473 lt!19216))))

(assert (=> d!8473 (= (getCurrentListMapNoExtraKeys!39 (_keys!3463 lt!19216) (_values!1879 lt!19216) (mask!5473 lt!19216) (extraKeys!1787 lt!19216) (zeroValue!1814 lt!19216) (minValue!1814 lt!19216) #b00000000000000000000000000000000 (defaultEntry!1896 lt!19216)) lt!19696)))

(declare-fun b!44710 () Bool)

(assert (=> b!44710 (= e!28340 (ListLongMap!1188 Nil!1191))))

(declare-fun b!44711 () Bool)

(assert (=> b!44711 (= e!28341 (= lt!19696 (getCurrentListMapNoExtraKeys!39 (_keys!3463 lt!19216) (_values!1879 lt!19216) (mask!5473 lt!19216) (extraKeys!1787 lt!19216) (zeroValue!1814 lt!19216) (minValue!1814 lt!19216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1896 lt!19216))))))

(declare-fun bm!3645 () Bool)

(declare-fun call!3648 () ListLongMap!1187)

(assert (=> bm!3645 (= call!3648 (getCurrentListMapNoExtraKeys!39 (_keys!3463 lt!19216) (_values!1879 lt!19216) (mask!5473 lt!19216) (extraKeys!1787 lt!19216) (zeroValue!1814 lt!19216) (minValue!1814 lt!19216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1896 lt!19216)))))

(declare-fun b!44712 () Bool)

(declare-fun lt!19699 () Unit!1239)

(declare-fun lt!19697 () Unit!1239)

(assert (=> b!44712 (= lt!19699 lt!19697)))

(declare-fun lt!19695 () (_ BitVec 64))

(declare-fun lt!19700 () (_ BitVec 64))

(declare-fun lt!19698 () V!2325)

(declare-fun lt!19694 () ListLongMap!1187)

(assert (=> b!44712 (not (contains!568 (+!69 lt!19694 (tuple2!1617 lt!19700 lt!19698)) lt!19695))))

(declare-fun addStillNotContains!13 (ListLongMap!1187 (_ BitVec 64) V!2325 (_ BitVec 64)) Unit!1239)

(assert (=> b!44712 (= lt!19697 (addStillNotContains!13 lt!19694 lt!19700 lt!19698 lt!19695))))

(assert (=> b!44712 (= lt!19695 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!44712 (= lt!19698 (get!801 (select (arr!1413 (_values!1879 lt!19216)) #b00000000000000000000000000000000) (dynLambda!261 (defaultEntry!1896 lt!19216) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!44712 (= lt!19700 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000))))

(assert (=> b!44712 (= lt!19694 call!3648)))

(declare-fun e!28338 () ListLongMap!1187)

(assert (=> b!44712 (= e!28338 (+!69 call!3648 (tuple2!1617 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000) (get!801 (select (arr!1413 (_values!1879 lt!19216)) #b00000000000000000000000000000000) (dynLambda!261 (defaultEntry!1896 lt!19216) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!44713 () Bool)

(assert (=> b!44713 (= e!28338 call!3648)))

(declare-fun b!44714 () Bool)

(assert (=> b!44714 (= e!28340 e!28338)))

(declare-fun c!5914 () Bool)

(assert (=> b!44714 (= c!5914 (validKeyInArray!0 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)))))

(declare-fun b!44715 () Bool)

(declare-fun e!28337 () Bool)

(assert (=> b!44715 (= e!28336 e!28337)))

(assert (=> b!44715 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1615 (_keys!3463 lt!19216))))))

(declare-fun res!26325 () Bool)

(assert (=> b!44715 (= res!26325 (contains!568 lt!19696 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)))))

(assert (=> b!44715 (=> (not res!26325) (not e!28337))))

(declare-fun b!44716 () Bool)

(assert (=> b!44716 (= e!28336 e!28341)))

(declare-fun c!5913 () Bool)

(assert (=> b!44716 (= c!5913 (bvslt #b00000000000000000000000000000000 (size!1615 (_keys!3463 lt!19216))))))

(declare-fun b!44717 () Bool)

(assert (=> b!44717 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1615 (_keys!3463 lt!19216))))))

(assert (=> b!44717 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1616 (_values!1879 lt!19216))))))

(assert (=> b!44717 (= e!28337 (= (apply!61 lt!19696 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)) (get!801 (select (arr!1413 (_values!1879 lt!19216)) #b00000000000000000000000000000000) (dynLambda!261 (defaultEntry!1896 lt!19216) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!44718 () Bool)

(declare-fun res!26328 () Bool)

(assert (=> b!44718 (=> (not res!26328) (not e!28335))))

(assert (=> b!44718 (= res!26328 (not (contains!568 lt!19696 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8473 c!5916) b!44710))

(assert (= (and d!8473 (not c!5916)) b!44714))

(assert (= (and b!44714 c!5914) b!44712))

(assert (= (and b!44714 (not c!5914)) b!44713))

(assert (= (or b!44712 b!44713) bm!3645))

(assert (= (and d!8473 res!26326) b!44718))

(assert (= (and b!44718 res!26328) b!44708))

(assert (= (and b!44708 res!26327) b!44709))

(assert (= (and b!44708 c!5915) b!44715))

(assert (= (and b!44708 (not c!5915)) b!44716))

(assert (= (and b!44715 res!26325) b!44717))

(assert (= (and b!44716 c!5913) b!44711))

(assert (= (and b!44716 (not c!5913)) b!44707))

(declare-fun b_lambda!2327 () Bool)

(assert (=> (not b_lambda!2327) (not b!44712)))

(assert (=> b!44712 t!4220))

(declare-fun b_and!2715 () Bool)

(assert (= b_and!2709 (and (=> t!4220 result!1759) b_and!2715)))

(declare-fun b_lambda!2329 () Bool)

(assert (=> (not b_lambda!2329) (not b!44717)))

(assert (=> b!44717 t!4220))

(declare-fun b_and!2717 () Bool)

(assert (= b_and!2715 (and (=> t!4220 result!1759) b_and!2717)))

(declare-fun m!38773 () Bool)

(assert (=> b!44711 m!38773))

(declare-fun m!38775 () Bool)

(assert (=> b!44712 m!38775))

(declare-fun m!38777 () Bool)

(assert (=> b!44712 m!38777))

(declare-fun m!38779 () Bool)

(assert (=> b!44712 m!38779))

(assert (=> b!44712 m!38525))

(assert (=> b!44712 m!38373))

(assert (=> b!44712 m!38775))

(assert (=> b!44712 m!38527))

(assert (=> b!44712 m!38525))

(assert (=> b!44712 m!38529))

(declare-fun m!38781 () Bool)

(assert (=> b!44712 m!38781))

(assert (=> b!44712 m!38527))

(declare-fun m!38783 () Bool)

(assert (=> b!44707 m!38783))

(assert (=> b!44714 m!38373))

(assert (=> b!44714 m!38373))

(assert (=> b!44714 m!38375))

(declare-fun m!38785 () Bool)

(assert (=> b!44718 m!38785))

(declare-fun m!38787 () Bool)

(assert (=> d!8473 m!38787))

(assert (=> d!8473 m!38477))

(assert (=> b!44715 m!38373))

(assert (=> b!44715 m!38373))

(declare-fun m!38789 () Bool)

(assert (=> b!44715 m!38789))

(assert (=> b!44717 m!38373))

(declare-fun m!38791 () Bool)

(assert (=> b!44717 m!38791))

(assert (=> b!44717 m!38525))

(assert (=> b!44717 m!38373))

(assert (=> b!44717 m!38527))

(assert (=> b!44717 m!38525))

(assert (=> b!44717 m!38529))

(assert (=> b!44717 m!38527))

(assert (=> bm!3645 m!38773))

(assert (=> b!44709 m!38373))

(assert (=> b!44709 m!38373))

(assert (=> b!44709 m!38375))

(assert (=> bm!3598 d!8473))

(declare-fun d!8477 () Bool)

(assert (=> d!8477 (= (size!1635 lt!19216) (bvadd (_size!243 lt!19216) (bvsdiv (bvadd (extraKeys!1787 lt!19216) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!44629 d!8477))

(assert (=> b!44638 d!8461))

(assert (=> b!44628 d!8477))

(assert (=> b!44634 d!8471))

(declare-fun d!8479 () Bool)

(assert (=> d!8479 (= (validMask!0 (mask!5473 lt!19216)) (and (or (= (mask!5473 lt!19216) #b00000000000000000000000000000111) (= (mask!5473 lt!19216) #b00000000000000000000000000001111) (= (mask!5473 lt!19216) #b00000000000000000000000000011111) (= (mask!5473 lt!19216) #b00000000000000000000000000111111) (= (mask!5473 lt!19216) #b00000000000000000000000001111111) (= (mask!5473 lt!19216) #b00000000000000000000000011111111) (= (mask!5473 lt!19216) #b00000000000000000000000111111111) (= (mask!5473 lt!19216) #b00000000000000000000001111111111) (= (mask!5473 lt!19216) #b00000000000000000000011111111111) (= (mask!5473 lt!19216) #b00000000000000000000111111111111) (= (mask!5473 lt!19216) #b00000000000000000001111111111111) (= (mask!5473 lt!19216) #b00000000000000000011111111111111) (= (mask!5473 lt!19216) #b00000000000000000111111111111111) (= (mask!5473 lt!19216) #b00000000000000001111111111111111) (= (mask!5473 lt!19216) #b00000000000000011111111111111111) (= (mask!5473 lt!19216) #b00000000000000111111111111111111) (= (mask!5473 lt!19216) #b00000000000001111111111111111111) (= (mask!5473 lt!19216) #b00000000000011111111111111111111) (= (mask!5473 lt!19216) #b00000000000111111111111111111111) (= (mask!5473 lt!19216) #b00000000001111111111111111111111) (= (mask!5473 lt!19216) #b00000000011111111111111111111111) (= (mask!5473 lt!19216) #b00000000111111111111111111111111) (= (mask!5473 lt!19216) #b00000001111111111111111111111111) (= (mask!5473 lt!19216) #b00000011111111111111111111111111) (= (mask!5473 lt!19216) #b00000111111111111111111111111111) (= (mask!5473 lt!19216) #b00001111111111111111111111111111) (= (mask!5473 lt!19216) #b00011111111111111111111111111111) (= (mask!5473 lt!19216) #b00111111111111111111111111111111)) (bvsle (mask!5473 lt!19216) #b00111111111111111111111111111111)))))

(assert (=> d!8429 d!8479))

(declare-fun b!44719 () Bool)

(declare-fun e!28343 () Bool)

(declare-fun call!3649 () Bool)

(assert (=> b!44719 (= e!28343 call!3649)))

(declare-fun bm!3646 () Bool)

(assert (=> bm!3646 (= call!3649 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3463 lt!19216) (mask!5473 lt!19216)))))

(declare-fun b!44720 () Bool)

(declare-fun e!28342 () Bool)

(assert (=> b!44720 (= e!28342 call!3649)))

(declare-fun d!8481 () Bool)

(declare-fun res!26329 () Bool)

(declare-fun e!28344 () Bool)

(assert (=> d!8481 (=> res!26329 e!28344)))

(assert (=> d!8481 (= res!26329 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1615 (_keys!3463 lt!19216))))))

(assert (=> d!8481 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3463 lt!19216) (mask!5473 lt!19216)) e!28344)))

(declare-fun b!44721 () Bool)

(assert (=> b!44721 (= e!28342 e!28343)))

(declare-fun lt!19702 () (_ BitVec 64))

(assert (=> b!44721 (= lt!19702 (select (arr!1412 (_keys!3463 lt!19216)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!19703 () Unit!1239)

(assert (=> b!44721 (= lt!19703 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3463 lt!19216) lt!19702 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!44721 (arrayContainsKey!0 (_keys!3463 lt!19216) lt!19702 #b00000000000000000000000000000000)))

(declare-fun lt!19701 () Unit!1239)

(assert (=> b!44721 (= lt!19701 lt!19703)))

(declare-fun res!26330 () Bool)

(assert (=> b!44721 (= res!26330 (= (seekEntryOrOpen!0 (select (arr!1412 (_keys!3463 lt!19216)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3463 lt!19216) (mask!5473 lt!19216)) (Found!197 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!44721 (=> (not res!26330) (not e!28343))))

(declare-fun b!44722 () Bool)

(assert (=> b!44722 (= e!28344 e!28342)))

(declare-fun c!5917 () Bool)

(assert (=> b!44722 (= c!5917 (validKeyInArray!0 (select (arr!1412 (_keys!3463 lt!19216)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!8481 (not res!26329)) b!44722))

(assert (= (and b!44722 c!5917) b!44721))

(assert (= (and b!44722 (not c!5917)) b!44720))

(assert (= (and b!44721 res!26330) b!44719))

(assert (= (or b!44719 b!44720) bm!3646))

(declare-fun m!38793 () Bool)

(assert (=> bm!3646 m!38793))

(declare-fun m!38795 () Bool)

(assert (=> b!44721 m!38795))

(declare-fun m!38797 () Bool)

(assert (=> b!44721 m!38797))

(declare-fun m!38799 () Bool)

(assert (=> b!44721 m!38799))

(assert (=> b!44721 m!38795))

(declare-fun m!38801 () Bool)

(assert (=> b!44721 m!38801))

(assert (=> b!44722 m!38795))

(assert (=> b!44722 m!38795))

(declare-fun m!38803 () Bool)

(assert (=> b!44722 m!38803))

(assert (=> bm!3565 d!8481))

(declare-fun d!8483 () Bool)

(assert (=> d!8483 (arrayContainsKey!0 lt!19228 lt!19652 #b00000000000000000000000000000000)))

(declare-fun lt!19704 () Unit!1239)

(assert (=> d!8483 (= lt!19704 (choose!13 lt!19228 lt!19652 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!8483 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!8483 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19228 lt!19652 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19704)))

(declare-fun bs!2029 () Bool)

(assert (= bs!2029 d!8483))

(assert (=> bs!2029 m!38641))

(declare-fun m!38805 () Bool)

(assert (=> bs!2029 m!38805))

(assert (=> b!44633 d!8483))

(declare-fun d!8485 () Bool)

(declare-fun res!26331 () Bool)

(declare-fun e!28345 () Bool)

(assert (=> d!8485 (=> res!26331 e!28345)))

(assert (=> d!8485 (= res!26331 (= (select (arr!1412 lt!19228) #b00000000000000000000000000000000) lt!19652))))

(assert (=> d!8485 (= (arrayContainsKey!0 lt!19228 lt!19652 #b00000000000000000000000000000000) e!28345)))

(declare-fun b!44723 () Bool)

(declare-fun e!28346 () Bool)

(assert (=> b!44723 (= e!28345 e!28346)))

(declare-fun res!26332 () Bool)

(assert (=> b!44723 (=> (not res!26332) (not e!28346))))

(assert (=> b!44723 (= res!26332 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1615 lt!19228)))))

(declare-fun b!44724 () Bool)

(assert (=> b!44724 (= e!28346 (arrayContainsKey!0 lt!19228 lt!19652 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8485 (not res!26331)) b!44723))

(assert (= (and b!44723 res!26332) b!44724))

(assert (=> d!8485 m!38233))

(declare-fun m!38807 () Bool)

(assert (=> b!44724 m!38807))

(assert (=> b!44633 d!8485))

(declare-fun b!44726 () Bool)

(declare-fun e!28348 () SeekEntryResult!197)

(declare-fun lt!19705 () SeekEntryResult!197)

(assert (=> b!44726 (= e!28348 (MissingZero!197 (index!2912 lt!19705)))))

(declare-fun b!44727 () Bool)

(declare-fun e!28347 () SeekEntryResult!197)

(assert (=> b!44727 (= e!28347 (Found!197 (index!2912 lt!19705)))))

(declare-fun b!44728 () Bool)

(assert (=> b!44728 (= e!28348 (seekKeyOrZeroReturnVacant!0 (x!8351 lt!19705) (index!2912 lt!19705) (index!2912 lt!19705) (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19228 mask!853))))

(declare-fun b!44729 () Bool)

(declare-fun c!5920 () Bool)

(declare-fun lt!19706 () (_ BitVec 64))

(assert (=> b!44729 (= c!5920 (= lt!19706 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!44729 (= e!28347 e!28348)))

(declare-fun b!44730 () Bool)

(declare-fun e!28349 () SeekEntryResult!197)

(assert (=> b!44730 (= e!28349 e!28347)))

(assert (=> b!44730 (= lt!19706 (select (arr!1412 lt!19228) (index!2912 lt!19705)))))

(declare-fun c!5918 () Bool)

(assert (=> b!44730 (= c!5918 (= lt!19706 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44725 () Bool)

(assert (=> b!44725 (= e!28349 Undefined!197)))

(declare-fun d!8487 () Bool)

(declare-fun lt!19707 () SeekEntryResult!197)

(assert (=> d!8487 (and (or ((_ is Undefined!197) lt!19707) (not ((_ is Found!197) lt!19707)) (and (bvsge (index!2911 lt!19707) #b00000000000000000000000000000000) (bvslt (index!2911 lt!19707) (size!1615 lt!19228)))) (or ((_ is Undefined!197) lt!19707) ((_ is Found!197) lt!19707) (not ((_ is MissingZero!197) lt!19707)) (and (bvsge (index!2910 lt!19707) #b00000000000000000000000000000000) (bvslt (index!2910 lt!19707) (size!1615 lt!19228)))) (or ((_ is Undefined!197) lt!19707) ((_ is Found!197) lt!19707) ((_ is MissingZero!197) lt!19707) (not ((_ is MissingVacant!197) lt!19707)) (and (bvsge (index!2913 lt!19707) #b00000000000000000000000000000000) (bvslt (index!2913 lt!19707) (size!1615 lt!19228)))) (or ((_ is Undefined!197) lt!19707) (ite ((_ is Found!197) lt!19707) (= (select (arr!1412 lt!19228) (index!2911 lt!19707)) (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite ((_ is MissingZero!197) lt!19707) (= (select (arr!1412 lt!19228) (index!2910 lt!19707)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!197) lt!19707) (= (select (arr!1412 lt!19228) (index!2913 lt!19707)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!8487 (= lt!19707 e!28349)))

(declare-fun c!5919 () Bool)

(assert (=> d!8487 (= c!5919 (and ((_ is Intermediate!197) lt!19705) (undefined!1009 lt!19705)))))

(assert (=> d!8487 (= lt!19705 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!853) (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19228 mask!853))))

(assert (=> d!8487 (validMask!0 mask!853)))

(assert (=> d!8487 (= (seekEntryOrOpen!0 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19228 mask!853) lt!19707)))

(assert (= (and d!8487 c!5919) b!44725))

(assert (= (and d!8487 (not c!5919)) b!44730))

(assert (= (and b!44730 c!5918) b!44727))

(assert (= (and b!44730 (not c!5918)) b!44729))

(assert (= (and b!44729 c!5920) b!44726))

(assert (= (and b!44729 (not c!5920)) b!44728))

(assert (=> b!44728 m!38365))

(declare-fun m!38809 () Bool)

(assert (=> b!44728 m!38809))

(declare-fun m!38811 () Bool)

(assert (=> b!44730 m!38811))

(declare-fun m!38813 () Bool)

(assert (=> d!8487 m!38813))

(assert (=> d!8487 m!38365))

(declare-fun m!38815 () Bool)

(assert (=> d!8487 m!38815))

(assert (=> d!8487 m!38815))

(assert (=> d!8487 m!38365))

(declare-fun m!38817 () Bool)

(assert (=> d!8487 m!38817))

(assert (=> d!8487 m!38167))

(declare-fun m!38819 () Bool)

(assert (=> d!8487 m!38819))

(declare-fun m!38821 () Bool)

(assert (=> d!8487 m!38821))

(assert (=> b!44633 d!8487))

(declare-fun d!8489 () Bool)

(assert (not d!8489))

(assert (=> b!44575 d!8489))

(declare-fun d!8491 () Bool)

(declare-fun e!28367 () Bool)

(assert (=> d!8491 e!28367))

(declare-fun c!5927 () Bool)

(declare-fun lt!19724 () SeekEntryResult!197)

(assert (=> d!8491 (= c!5927 (and ((_ is Intermediate!197) lt!19724) (undefined!1009 lt!19724)))))

(declare-fun e!28363 () SeekEntryResult!197)

(assert (=> d!8491 (= lt!19724 e!28363)))

(declare-fun c!5928 () Bool)

(assert (=> d!8491 (= c!5928 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!19725 () (_ BitVec 64))

(assert (=> d!8491 (= lt!19725 (select (arr!1412 lt!19228) (toIndex!0 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) mask!853)))))

(assert (=> d!8491 (validMask!0 mask!853)))

(assert (=> d!8491 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) mask!853) (select (arr!1412 lt!19228) #b00000000000000000000000000000000) lt!19228 mask!853) lt!19724)))

(declare-fun b!44755 () Bool)

(declare-fun e!28365 () SeekEntryResult!197)

(assert (=> b!44755 (= e!28363 e!28365)))

(declare-fun c!5929 () Bool)

(assert (=> b!44755 (= c!5929 (or (= lt!19725 (select (arr!1412 lt!19228) #b00000000000000000000000000000000)) (= (bvadd lt!19725 lt!19725) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!44756 () Bool)

(assert (=> b!44756 (and (bvsge (index!2912 lt!19724) #b00000000000000000000000000000000) (bvslt (index!2912 lt!19724) (size!1615 lt!19228)))))

(declare-fun res!26346 () Bool)

(assert (=> b!44756 (= res!26346 (= (select (arr!1412 lt!19228) (index!2912 lt!19724)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!28366 () Bool)

(assert (=> b!44756 (=> res!26346 e!28366)))

(declare-fun b!44757 () Bool)

(assert (=> b!44757 (and (bvsge (index!2912 lt!19724) #b00000000000000000000000000000000) (bvslt (index!2912 lt!19724) (size!1615 lt!19228)))))

(assert (=> b!44757 (= e!28366 (= (select (arr!1412 lt!19228) (index!2912 lt!19724)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!44758 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!44758 (= e!28365 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) mask!853) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!853) (select (arr!1412 lt!19228) #b00000000000000000000000000000000) lt!19228 mask!853))))

(declare-fun b!44759 () Bool)

(assert (=> b!44759 (and (bvsge (index!2912 lt!19724) #b00000000000000000000000000000000) (bvslt (index!2912 lt!19724) (size!1615 lt!19228)))))

(declare-fun res!26347 () Bool)

(assert (=> b!44759 (= res!26347 (= (select (arr!1412 lt!19228) (index!2912 lt!19724)) (select (arr!1412 lt!19228) #b00000000000000000000000000000000)))))

(assert (=> b!44759 (=> res!26347 e!28366)))

(declare-fun e!28364 () Bool)

(assert (=> b!44759 (= e!28364 e!28366)))

(declare-fun b!44760 () Bool)

(assert (=> b!44760 (= e!28363 (Intermediate!197 true (toIndex!0 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!44761 () Bool)

(assert (=> b!44761 (= e!28367 (bvsge (x!8351 lt!19724) #b01111111111111111111111111111110))))

(declare-fun b!44762 () Bool)

(assert (=> b!44762 (= e!28367 e!28364)))

(declare-fun res!26345 () Bool)

(assert (=> b!44762 (= res!26345 (and ((_ is Intermediate!197) lt!19724) (not (undefined!1009 lt!19724)) (bvslt (x!8351 lt!19724) #b01111111111111111111111111111110) (bvsge (x!8351 lt!19724) #b00000000000000000000000000000000) (bvsge (x!8351 lt!19724) #b00000000000000000000000000000000)))))

(assert (=> b!44762 (=> (not res!26345) (not e!28364))))

(declare-fun b!44763 () Bool)

(assert (=> b!44763 (= e!28365 (Intermediate!197 false (toIndex!0 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(assert (= (and d!8491 c!5928) b!44760))

(assert (= (and d!8491 (not c!5928)) b!44755))

(assert (= (and b!44755 c!5929) b!44763))

(assert (= (and b!44755 (not c!5929)) b!44758))

(assert (= (and d!8491 c!5927) b!44761))

(assert (= (and d!8491 (not c!5927)) b!44762))

(assert (= (and b!44762 res!26345) b!44759))

(assert (= (and b!44759 (not res!26347)) b!44756))

(assert (= (and b!44756 (not res!26346)) b!44757))

(declare-fun m!38839 () Bool)

(assert (=> b!44759 m!38839))

(assert (=> b!44758 m!38541))

(declare-fun m!38841 () Bool)

(assert (=> b!44758 m!38841))

(assert (=> b!44758 m!38841))

(assert (=> b!44758 m!38233))

(declare-fun m!38843 () Bool)

(assert (=> b!44758 m!38843))

(assert (=> b!44756 m!38839))

(assert (=> b!44757 m!38839))

(assert (=> d!8491 m!38541))

(declare-fun m!38845 () Bool)

(assert (=> d!8491 m!38845))

(assert (=> d!8491 m!38167))

(assert (=> d!8413 d!8491))

(declare-fun d!8497 () Bool)

(declare-fun lt!19731 () (_ BitVec 32))

(declare-fun lt!19730 () (_ BitVec 32))

(assert (=> d!8497 (= lt!19731 (bvmul (bvxor lt!19730 (bvlshr lt!19730 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!8497 (= lt!19730 ((_ extract 31 0) (bvand (bvxor (select (arr!1412 lt!19228) #b00000000000000000000000000000000) (bvlshr (select (arr!1412 lt!19228) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!8497 (and (bvsge mask!853 #b00000000000000000000000000000000) (let ((res!26348 (let ((h!1773 ((_ extract 31 0) (bvand (bvxor (select (arr!1412 lt!19228) #b00000000000000000000000000000000) (bvlshr (select (arr!1412 lt!19228) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!8371 (bvmul (bvxor h!1773 (bvlshr h!1773 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!8371 (bvlshr x!8371 #b00000000000000000000000000001101)) mask!853))))) (and (bvslt res!26348 (bvadd mask!853 #b00000000000000000000000000000001)) (bvsge res!26348 #b00000000000000000000000000000000))))))

(assert (=> d!8497 (= (toIndex!0 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) mask!853) (bvand (bvxor lt!19731 (bvlshr lt!19731 #b00000000000000000000000000001101)) mask!853))))

(assert (=> d!8413 d!8497))

(assert (=> d!8413 d!8273))

(assert (=> b!44445 d!8461))

(declare-fun b!44814 () Bool)

(declare-fun e!28398 () SeekEntryResult!197)

(assert (=> b!44814 (= e!28398 (MissingVacant!197 (index!2912 lt!19563)))))

(declare-fun b!44815 () Bool)

(declare-fun e!28396 () SeekEntryResult!197)

(assert (=> b!44815 (= e!28396 Undefined!197)))

(declare-fun d!8499 () Bool)

(declare-fun lt!19762 () SeekEntryResult!197)

(assert (=> d!8499 (and (or ((_ is Undefined!197) lt!19762) (not ((_ is Found!197) lt!19762)) (and (bvsge (index!2911 lt!19762) #b00000000000000000000000000000000) (bvslt (index!2911 lt!19762) (size!1615 lt!19228)))) (or ((_ is Undefined!197) lt!19762) ((_ is Found!197) lt!19762) (not ((_ is MissingVacant!197) lt!19762)) (not (= (index!2913 lt!19762) (index!2912 lt!19563))) (and (bvsge (index!2913 lt!19762) #b00000000000000000000000000000000) (bvslt (index!2913 lt!19762) (size!1615 lt!19228)))) (or ((_ is Undefined!197) lt!19762) (ite ((_ is Found!197) lt!19762) (= (select (arr!1412 lt!19228) (index!2911 lt!19762)) (select (arr!1412 lt!19228) #b00000000000000000000000000000000)) (and ((_ is MissingVacant!197) lt!19762) (= (index!2913 lt!19762) (index!2912 lt!19563)) (= (select (arr!1412 lt!19228) (index!2913 lt!19762)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!8499 (= lt!19762 e!28396)))

(declare-fun c!5950 () Bool)

(assert (=> d!8499 (= c!5950 (bvsge (x!8351 lt!19563) #b01111111111111111111111111111110))))

(declare-fun lt!19761 () (_ BitVec 64))

(assert (=> d!8499 (= lt!19761 (select (arr!1412 lt!19228) (index!2912 lt!19563)))))

(assert (=> d!8499 (validMask!0 mask!853)))

(assert (=> d!8499 (= (seekKeyOrZeroReturnVacant!0 (x!8351 lt!19563) (index!2912 lt!19563) (index!2912 lt!19563) (select (arr!1412 lt!19228) #b00000000000000000000000000000000) lt!19228 mask!853) lt!19762)))

(declare-fun b!44816 () Bool)

(declare-fun e!28397 () SeekEntryResult!197)

(assert (=> b!44816 (= e!28397 (Found!197 (index!2912 lt!19563)))))

(declare-fun b!44817 () Bool)

(assert (=> b!44817 (= e!28396 e!28397)))

(declare-fun c!5949 () Bool)

(assert (=> b!44817 (= c!5949 (= lt!19761 (select (arr!1412 lt!19228) #b00000000000000000000000000000000)))))

(declare-fun b!44818 () Bool)

(declare-fun c!5948 () Bool)

(assert (=> b!44818 (= c!5948 (= lt!19761 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!44818 (= e!28397 e!28398)))

(declare-fun b!44819 () Bool)

(assert (=> b!44819 (= e!28398 (seekKeyOrZeroReturnVacant!0 (bvadd (x!8351 lt!19563) #b00000000000000000000000000000001) (nextIndex!0 (index!2912 lt!19563) (bvadd (x!8351 lt!19563) #b00000000000000000000000000000001) mask!853) (index!2912 lt!19563) (select (arr!1412 lt!19228) #b00000000000000000000000000000000) lt!19228 mask!853))))

(assert (= (and d!8499 c!5950) b!44815))

(assert (= (and d!8499 (not c!5950)) b!44817))

(assert (= (and b!44817 c!5949) b!44816))

(assert (= (and b!44817 (not c!5949)) b!44818))

(assert (= (and b!44818 c!5948) b!44814))

(assert (= (and b!44818 (not c!5948)) b!44819))

(declare-fun m!38883 () Bool)

(assert (=> d!8499 m!38883))

(declare-fun m!38885 () Bool)

(assert (=> d!8499 m!38885))

(assert (=> d!8499 m!38537))

(assert (=> d!8499 m!38167))

(declare-fun m!38887 () Bool)

(assert (=> b!44819 m!38887))

(assert (=> b!44819 m!38887))

(assert (=> b!44819 m!38233))

(declare-fun m!38889 () Bool)

(assert (=> b!44819 m!38889))

(assert (=> b!44522 d!8499))

(declare-fun b!44820 () Bool)

(declare-fun e!28401 () Bool)

(declare-fun call!3653 () Bool)

(assert (=> b!44820 (= e!28401 call!3653)))

(declare-fun b!44821 () Bool)

(declare-fun e!28400 () Bool)

(assert (=> b!44821 (= e!28400 e!28401)))

(declare-fun c!5951 () Bool)

(assert (=> b!44821 (= c!5951 (validKeyInArray!0 (select (arr!1412 (_keys!3463 lt!19216)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!44822 () Bool)

(assert (=> b!44822 (= e!28401 call!3653)))

(declare-fun d!8507 () Bool)

(declare-fun res!26363 () Bool)

(declare-fun e!28399 () Bool)

(assert (=> d!8507 (=> res!26363 e!28399)))

(assert (=> d!8507 (= res!26363 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1615 (_keys!3463 lt!19216))))))

(assert (=> d!8507 (= (arrayNoDuplicates!0 (_keys!3463 lt!19216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5892 (Cons!1191 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000) Nil!1192) Nil!1192)) e!28399)))

(declare-fun b!44823 () Bool)

(declare-fun e!28402 () Bool)

(assert (=> b!44823 (= e!28402 (contains!565 (ite c!5892 (Cons!1191 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000) Nil!1192) Nil!1192) (select (arr!1412 (_keys!3463 lt!19216)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3650 () Bool)

(assert (=> bm!3650 (= call!3653 (arrayNoDuplicates!0 (_keys!3463 lt!19216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5951 (Cons!1191 (select (arr!1412 (_keys!3463 lt!19216)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5892 (Cons!1191 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000) Nil!1192) Nil!1192)) (ite c!5892 (Cons!1191 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000) Nil!1192) Nil!1192))))))

(declare-fun b!44824 () Bool)

(assert (=> b!44824 (= e!28399 e!28400)))

(declare-fun res!26364 () Bool)

(assert (=> b!44824 (=> (not res!26364) (not e!28400))))

(assert (=> b!44824 (= res!26364 (not e!28402))))

(declare-fun res!26365 () Bool)

(assert (=> b!44824 (=> (not res!26365) (not e!28402))))

(assert (=> b!44824 (= res!26365 (validKeyInArray!0 (select (arr!1412 (_keys!3463 lt!19216)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!8507 (not res!26363)) b!44824))

(assert (= (and b!44824 res!26365) b!44823))

(assert (= (and b!44824 res!26364) b!44821))

(assert (= (and b!44821 c!5951) b!44822))

(assert (= (and b!44821 (not c!5951)) b!44820))

(assert (= (or b!44822 b!44820) bm!3650))

(assert (=> b!44821 m!38795))

(assert (=> b!44821 m!38795))

(assert (=> b!44821 m!38803))

(assert (=> b!44823 m!38795))

(assert (=> b!44823 m!38795))

(declare-fun m!38891 () Bool)

(assert (=> b!44823 m!38891))

(assert (=> bm!3650 m!38795))

(declare-fun m!38893 () Bool)

(assert (=> bm!3650 m!38893))

(assert (=> b!44824 m!38795))

(assert (=> b!44824 m!38795))

(assert (=> b!44824 m!38803))

(assert (=> bm!3639 d!8507))

(declare-fun d!8509 () Bool)

(declare-fun lt!19763 () Bool)

(assert (=> d!8509 (= lt!19763 (select (content!44 Nil!1192) (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)))))

(declare-fun e!28404 () Bool)

(assert (=> d!8509 (= lt!19763 e!28404)))

(declare-fun res!26366 () Bool)

(assert (=> d!8509 (=> (not res!26366) (not e!28404))))

(assert (=> d!8509 (= res!26366 ((_ is Cons!1191) Nil!1192))))

(assert (=> d!8509 (= (contains!565 Nil!1192 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)) lt!19763)))

(declare-fun b!44825 () Bool)

(declare-fun e!28403 () Bool)

(assert (=> b!44825 (= e!28404 e!28403)))

(declare-fun res!26367 () Bool)

(assert (=> b!44825 (=> res!26367 e!28403)))

(assert (=> b!44825 (= res!26367 (= (h!1768 Nil!1192) (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)))))

(declare-fun b!44826 () Bool)

(assert (=> b!44826 (= e!28403 (contains!565 (t!4210 Nil!1192) (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)))))

(assert (= (and d!8509 res!26366) b!44825))

(assert (= (and b!44825 (not res!26367)) b!44826))

(assert (=> d!8509 m!38603))

(assert (=> d!8509 m!38373))

(declare-fun m!38895 () Bool)

(assert (=> d!8509 m!38895))

(assert (=> b!44826 m!38373))

(declare-fun m!38897 () Bool)

(assert (=> b!44826 m!38897))

(assert (=> b!44640 d!8509))

(declare-fun d!8511 () Bool)

(declare-fun get!805 (Option!114) V!2325)

(assert (=> d!8511 (= (apply!61 lt!19486 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)) (get!805 (getValueByKey!108 (toList!609 lt!19486) (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000))))))

(declare-fun bs!2032 () Bool)

(assert (= bs!2032 d!8511))

(assert (=> bs!2032 m!38373))

(declare-fun m!38899 () Bool)

(assert (=> bs!2032 m!38899))

(assert (=> bs!2032 m!38899))

(declare-fun m!38901 () Bool)

(assert (=> bs!2032 m!38901))

(assert (=> b!44447 d!8511))

(declare-fun d!8513 () Bool)

(declare-fun c!5954 () Bool)

(assert (=> d!8513 (= c!5954 ((_ is ValueCellFull!704) (select (arr!1413 (_values!1879 lt!19216)) #b00000000000000000000000000000000)))))

(declare-fun e!28410 () V!2325)

(assert (=> d!8513 (= (get!801 (select (arr!1413 (_values!1879 lt!19216)) #b00000000000000000000000000000000) (dynLambda!261 (defaultEntry!1896 lt!19216) #b0000000000000000000000000000000000000000000000000000000000000000)) e!28410)))

(declare-fun b!44835 () Bool)

(declare-fun get!806 (ValueCell!704 V!2325) V!2325)

(assert (=> b!44835 (= e!28410 (get!806 (select (arr!1413 (_values!1879 lt!19216)) #b00000000000000000000000000000000) (dynLambda!261 (defaultEntry!1896 lt!19216) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!44836 () Bool)

(declare-fun get!807 (ValueCell!704 V!2325) V!2325)

(assert (=> b!44836 (= e!28410 (get!807 (select (arr!1413 (_values!1879 lt!19216)) #b00000000000000000000000000000000) (dynLambda!261 (defaultEntry!1896 lt!19216) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!8513 c!5954) b!44835))

(assert (= (and d!8513 (not c!5954)) b!44836))

(assert (=> b!44835 m!38527))

(assert (=> b!44835 m!38525))

(declare-fun m!38911 () Bool)

(assert (=> b!44835 m!38911))

(assert (=> b!44836 m!38527))

(assert (=> b!44836 m!38525))

(declare-fun m!38913 () Bool)

(assert (=> b!44836 m!38913))

(assert (=> b!44447 d!8513))

(assert (=> d!8441 d!8285))

(assert (=> d!8445 d!8315))

(declare-fun d!8519 () Bool)

(declare-fun e!28420 () Bool)

(assert (=> d!8519 e!28420))

(declare-fun res!26381 () Bool)

(assert (=> d!8519 (=> (not res!26381) (not e!28420))))

(declare-fun lt!19794 () ListLongMap!1187)

(assert (=> d!8519 (= res!26381 (contains!568 lt!19794 (_1!819 (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216)))))))

(declare-fun lt!19791 () List!1194)

(assert (=> d!8519 (= lt!19794 (ListLongMap!1188 lt!19791))))

(declare-fun lt!19793 () Unit!1239)

(declare-fun lt!19792 () Unit!1239)

(assert (=> d!8519 (= lt!19793 lt!19792)))

(assert (=> d!8519 (= (getValueByKey!108 lt!19791 (_1!819 (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216)))) (Some!113 (_2!819 (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!33 (List!1194 (_ BitVec 64) V!2325) Unit!1239)

(assert (=> d!8519 (= lt!19792 (lemmaContainsTupThenGetReturnValue!33 lt!19791 (_1!819 (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216))) (_2!819 (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216)))))))

(declare-fun insertStrictlySorted!30 (List!1194 (_ BitVec 64) V!2325) List!1194)

(assert (=> d!8519 (= lt!19791 (insertStrictlySorted!30 (toList!609 call!3601) (_1!819 (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216))) (_2!819 (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216)))))))

(assert (=> d!8519 (= (+!69 call!3601 (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216))) lt!19794)))

(declare-fun b!44852 () Bool)

(declare-fun res!26380 () Bool)

(assert (=> b!44852 (=> (not res!26380) (not e!28420))))

(assert (=> b!44852 (= res!26380 (= (getValueByKey!108 (toList!609 lt!19794) (_1!819 (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216)))) (Some!113 (_2!819 (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216))))))))

(declare-fun b!44853 () Bool)

(declare-fun contains!572 (List!1194 tuple2!1616) Bool)

(assert (=> b!44853 (= e!28420 (contains!572 (toList!609 lt!19794) (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216))))))

(assert (= (and d!8519 res!26381) b!44852))

(assert (= (and b!44852 res!26380) b!44853))

(declare-fun m!38939 () Bool)

(assert (=> d!8519 m!38939))

(declare-fun m!38943 () Bool)

(assert (=> d!8519 m!38943))

(declare-fun m!38947 () Bool)

(assert (=> d!8519 m!38947))

(declare-fun m!38951 () Bool)

(assert (=> d!8519 m!38951))

(declare-fun m!38955 () Bool)

(assert (=> b!44852 m!38955))

(declare-fun m!38957 () Bool)

(assert (=> b!44853 m!38957))

(assert (=> b!44444 d!8519))

(assert (=> b!44261 d!8461))

(assert (=> b!44456 d!8461))

(declare-fun b!44856 () Bool)

(declare-fun e!28423 () Bool)

(declare-fun call!3654 () Bool)

(assert (=> b!44856 (= e!28423 call!3654)))

(declare-fun bm!3651 () Bool)

(assert (=> bm!3651 (= call!3654 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!19228 mask!853))))

(declare-fun b!44857 () Bool)

(declare-fun e!28422 () Bool)

(assert (=> b!44857 (= e!28422 call!3654)))

(declare-fun d!8527 () Bool)

(declare-fun res!26384 () Bool)

(declare-fun e!28424 () Bool)

(assert (=> d!8527 (=> res!26384 e!28424)))

(assert (=> d!8527 (= res!26384 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1615 lt!19228)))))

(assert (=> d!8527 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!19228 mask!853) e!28424)))

(declare-fun b!44858 () Bool)

(assert (=> b!44858 (= e!28422 e!28423)))

(declare-fun lt!19800 () (_ BitVec 64))

(assert (=> b!44858 (= lt!19800 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!19801 () Unit!1239)

(assert (=> b!44858 (= lt!19801 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19228 lt!19800 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!44858 (arrayContainsKey!0 lt!19228 lt!19800 #b00000000000000000000000000000000)))

(declare-fun lt!19799 () Unit!1239)

(assert (=> b!44858 (= lt!19799 lt!19801)))

(declare-fun res!26385 () Bool)

(assert (=> b!44858 (= res!26385 (= (seekEntryOrOpen!0 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!19228 mask!853) (Found!197 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!44858 (=> (not res!26385) (not e!28423))))

(declare-fun b!44859 () Bool)

(assert (=> b!44859 (= e!28424 e!28422)))

(declare-fun c!5958 () Bool)

(assert (=> b!44859 (= c!5958 (validKeyInArray!0 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!8527 (not res!26384)) b!44859))

(assert (= (and b!44859 c!5958) b!44858))

(assert (= (and b!44859 (not c!5958)) b!44857))

(assert (= (and b!44858 res!26385) b!44856))

(assert (= (or b!44856 b!44857) bm!3651))

(declare-fun m!38967 () Bool)

(assert (=> bm!3651 m!38967))

(assert (=> b!44858 m!38731))

(declare-fun m!38969 () Bool)

(assert (=> b!44858 m!38969))

(declare-fun m!38971 () Bool)

(assert (=> b!44858 m!38971))

(assert (=> b!44858 m!38731))

(declare-fun m!38973 () Bool)

(assert (=> b!44858 m!38973))

(assert (=> b!44859 m!38731))

(assert (=> b!44859 m!38731))

(declare-fun m!38976 () Bool)

(assert (=> b!44859 m!38976))

(assert (=> bm!3638 d!8527))

(declare-fun d!8533 () Bool)

(declare-fun res!26387 () Bool)

(declare-fun e!28426 () Bool)

(assert (=> d!8533 (=> res!26387 e!28426)))

(assert (=> d!8533 (= res!26387 (= (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!19353))))

(assert (=> d!8533 (= (arrayContainsKey!0 lt!19228 lt!19353 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!28426)))

(declare-fun b!44861 () Bool)

(declare-fun e!28427 () Bool)

(assert (=> b!44861 (= e!28426 e!28427)))

(declare-fun res!26388 () Bool)

(assert (=> b!44861 (=> (not res!26388) (not e!28427))))

(assert (=> b!44861 (= res!26388 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1615 lt!19228)))))

(declare-fun b!44862 () Bool)

(assert (=> b!44862 (= e!28427 (arrayContainsKey!0 lt!19228 lt!19353 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!8533 (not res!26387)) b!44861))

(assert (= (and b!44861 res!26388) b!44862))

(assert (=> d!8533 m!38365))

(declare-fun m!38985 () Bool)

(assert (=> b!44862 m!38985))

(assert (=> b!44472 d!8533))

(declare-fun d!8539 () Bool)

(assert (=> d!8539 (= (apply!61 lt!19490 lt!19487) (get!805 (getValueByKey!108 (toList!609 lt!19490) lt!19487)))))

(declare-fun bs!2037 () Bool)

(assert (= bs!2037 d!8539))

(declare-fun m!38987 () Bool)

(assert (=> bs!2037 m!38987))

(assert (=> bs!2037 m!38987))

(declare-fun m!38991 () Bool)

(assert (=> bs!2037 m!38991))

(assert (=> b!44455 d!8539))

(declare-fun d!8541 () Bool)

(assert (=> d!8541 (= (apply!61 (+!69 lt!19496 (tuple2!1617 lt!19489 (minValue!1814 lt!19216))) lt!19480) (apply!61 lt!19496 lt!19480))))

(declare-fun lt!19813 () Unit!1239)

(declare-fun choose!274 (ListLongMap!1187 (_ BitVec 64) V!2325 (_ BitVec 64)) Unit!1239)

(assert (=> d!8541 (= lt!19813 (choose!274 lt!19496 lt!19489 (minValue!1814 lt!19216) lt!19480))))

(declare-fun e!28433 () Bool)

(assert (=> d!8541 e!28433))

(declare-fun res!26393 () Bool)

(assert (=> d!8541 (=> (not res!26393) (not e!28433))))

(assert (=> d!8541 (= res!26393 (contains!568 lt!19496 lt!19480))))

(assert (=> d!8541 (= (addApplyDifferent!37 lt!19496 lt!19489 (minValue!1814 lt!19216) lt!19480) lt!19813)))

(declare-fun b!44871 () Bool)

(assert (=> b!44871 (= e!28433 (not (= lt!19480 lt!19489)))))

(assert (= (and d!8541 res!26393) b!44871))

(assert (=> d!8541 m!38517))

(assert (=> d!8541 m!38489))

(assert (=> d!8541 m!38517))

(assert (=> d!8541 m!38519))

(declare-fun m!39007 () Bool)

(assert (=> d!8541 m!39007))

(declare-fun m!39009 () Bool)

(assert (=> d!8541 m!39009))

(assert (=> b!44455 d!8541))

(declare-fun d!8555 () Bool)

(assert (=> d!8555 (= (apply!61 lt!19496 lt!19480) (get!805 (getValueByKey!108 (toList!609 lt!19496) lt!19480)))))

(declare-fun bs!2039 () Bool)

(assert (= bs!2039 d!8555))

(declare-fun m!39013 () Bool)

(assert (=> bs!2039 m!39013))

(assert (=> bs!2039 m!39013))

(declare-fun m!39019 () Bool)

(assert (=> bs!2039 m!39019))

(assert (=> b!44455 d!8555))

(declare-fun d!8561 () Bool)

(assert (=> d!8561 (= (apply!61 (+!69 lt!19496 (tuple2!1617 lt!19489 (minValue!1814 lt!19216))) lt!19480) (get!805 (getValueByKey!108 (toList!609 (+!69 lt!19496 (tuple2!1617 lt!19489 (minValue!1814 lt!19216)))) lt!19480)))))

(declare-fun bs!2040 () Bool)

(assert (= bs!2040 d!8561))

(declare-fun m!39021 () Bool)

(assert (=> bs!2040 m!39021))

(assert (=> bs!2040 m!39021))

(declare-fun m!39023 () Bool)

(assert (=> bs!2040 m!39023))

(assert (=> b!44455 d!8561))

(declare-fun d!8565 () Bool)

(declare-fun e!28435 () Bool)

(assert (=> d!8565 e!28435))

(declare-fun res!26395 () Bool)

(assert (=> d!8565 (=> (not res!26395) (not e!28435))))

(declare-fun lt!19818 () ListLongMap!1187)

(assert (=> d!8565 (= res!26395 (contains!568 lt!19818 (_1!819 (tuple2!1617 lt!19489 (minValue!1814 lt!19216)))))))

(declare-fun lt!19815 () List!1194)

(assert (=> d!8565 (= lt!19818 (ListLongMap!1188 lt!19815))))

(declare-fun lt!19817 () Unit!1239)

(declare-fun lt!19816 () Unit!1239)

(assert (=> d!8565 (= lt!19817 lt!19816)))

(assert (=> d!8565 (= (getValueByKey!108 lt!19815 (_1!819 (tuple2!1617 lt!19489 (minValue!1814 lt!19216)))) (Some!113 (_2!819 (tuple2!1617 lt!19489 (minValue!1814 lt!19216)))))))

(assert (=> d!8565 (= lt!19816 (lemmaContainsTupThenGetReturnValue!33 lt!19815 (_1!819 (tuple2!1617 lt!19489 (minValue!1814 lt!19216))) (_2!819 (tuple2!1617 lt!19489 (minValue!1814 lt!19216)))))))

(assert (=> d!8565 (= lt!19815 (insertStrictlySorted!30 (toList!609 lt!19496) (_1!819 (tuple2!1617 lt!19489 (minValue!1814 lt!19216))) (_2!819 (tuple2!1617 lt!19489 (minValue!1814 lt!19216)))))))

(assert (=> d!8565 (= (+!69 lt!19496 (tuple2!1617 lt!19489 (minValue!1814 lt!19216))) lt!19818)))

(declare-fun b!44874 () Bool)

(declare-fun res!26394 () Bool)

(assert (=> b!44874 (=> (not res!26394) (not e!28435))))

(assert (=> b!44874 (= res!26394 (= (getValueByKey!108 (toList!609 lt!19818) (_1!819 (tuple2!1617 lt!19489 (minValue!1814 lt!19216)))) (Some!113 (_2!819 (tuple2!1617 lt!19489 (minValue!1814 lt!19216))))))))

(declare-fun b!44875 () Bool)

(assert (=> b!44875 (= e!28435 (contains!572 (toList!609 lt!19818) (tuple2!1617 lt!19489 (minValue!1814 lt!19216))))))

(assert (= (and d!8565 res!26395) b!44874))

(assert (= (and b!44874 res!26394) b!44875))

(declare-fun m!39025 () Bool)

(assert (=> d!8565 m!39025))

(declare-fun m!39027 () Bool)

(assert (=> d!8565 m!39027))

(declare-fun m!39029 () Bool)

(assert (=> d!8565 m!39029))

(declare-fun m!39031 () Bool)

(assert (=> d!8565 m!39031))

(declare-fun m!39033 () Bool)

(assert (=> b!44874 m!39033))

(declare-fun m!39035 () Bool)

(assert (=> b!44875 m!39035))

(assert (=> b!44455 d!8565))

(declare-fun d!8569 () Bool)

(declare-fun e!28438 () Bool)

(assert (=> d!8569 e!28438))

(declare-fun res!26396 () Bool)

(assert (=> d!8569 (=> res!26396 e!28438)))

(declare-fun lt!19821 () Bool)

(assert (=> d!8569 (= res!26396 (not lt!19821))))

(declare-fun lt!19823 () Bool)

(assert (=> d!8569 (= lt!19821 lt!19823)))

(declare-fun lt!19820 () Unit!1239)

(declare-fun e!28439 () Unit!1239)

(assert (=> d!8569 (= lt!19820 e!28439)))

(declare-fun c!5963 () Bool)

(assert (=> d!8569 (= c!5963 lt!19823)))

(assert (=> d!8569 (= lt!19823 (containsKey!75 (toList!609 (+!69 lt!19481 (tuple2!1617 lt!19476 (zeroValue!1814 lt!19216)))) lt!19485))))

(assert (=> d!8569 (= (contains!568 (+!69 lt!19481 (tuple2!1617 lt!19476 (zeroValue!1814 lt!19216))) lt!19485) lt!19821)))

(declare-fun b!44880 () Bool)

(declare-fun lt!19822 () Unit!1239)

(assert (=> b!44880 (= e!28439 lt!19822)))

(assert (=> b!44880 (= lt!19822 (lemmaContainsKeyImpliesGetValueByKeyDefined!63 (toList!609 (+!69 lt!19481 (tuple2!1617 lt!19476 (zeroValue!1814 lt!19216)))) lt!19485))))

(assert (=> b!44880 (isDefined!64 (getValueByKey!108 (toList!609 (+!69 lt!19481 (tuple2!1617 lt!19476 (zeroValue!1814 lt!19216)))) lt!19485))))

(declare-fun b!44881 () Bool)

(declare-fun Unit!1259 () Unit!1239)

(assert (=> b!44881 (= e!28439 Unit!1259)))

(declare-fun b!44882 () Bool)

(assert (=> b!44882 (= e!28438 (isDefined!64 (getValueByKey!108 (toList!609 (+!69 lt!19481 (tuple2!1617 lt!19476 (zeroValue!1814 lt!19216)))) lt!19485)))))

(assert (= (and d!8569 c!5963) b!44880))

(assert (= (and d!8569 (not c!5963)) b!44881))

(assert (= (and d!8569 (not res!26396)) b!44882))

(declare-fun m!39041 () Bool)

(assert (=> d!8569 m!39041))

(declare-fun m!39043 () Bool)

(assert (=> b!44880 m!39043))

(declare-fun m!39045 () Bool)

(assert (=> b!44880 m!39045))

(assert (=> b!44880 m!39045))

(declare-fun m!39047 () Bool)

(assert (=> b!44880 m!39047))

(assert (=> b!44882 m!39045))

(assert (=> b!44882 m!39045))

(assert (=> b!44882 m!39047))

(assert (=> b!44455 d!8569))

(declare-fun d!8573 () Bool)

(assert (=> d!8573 (= (apply!61 lt!19479 lt!19497) (get!805 (getValueByKey!108 (toList!609 lt!19479) lt!19497)))))

(declare-fun bs!2042 () Bool)

(assert (= bs!2042 d!8573))

(declare-fun m!39051 () Bool)

(assert (=> bs!2042 m!39051))

(assert (=> bs!2042 m!39051))

(declare-fun m!39053 () Bool)

(assert (=> bs!2042 m!39053))

(assert (=> b!44455 d!8573))

(declare-fun d!8577 () Bool)

(assert (=> d!8577 (= (apply!61 (+!69 lt!19490 (tuple2!1617 lt!19492 (minValue!1814 lt!19216))) lt!19487) (apply!61 lt!19490 lt!19487))))

(declare-fun lt!19824 () Unit!1239)

(assert (=> d!8577 (= lt!19824 (choose!274 lt!19490 lt!19492 (minValue!1814 lt!19216) lt!19487))))

(declare-fun e!28444 () Bool)

(assert (=> d!8577 e!28444))

(declare-fun res!26400 () Bool)

(assert (=> d!8577 (=> (not res!26400) (not e!28444))))

(assert (=> d!8577 (= res!26400 (contains!568 lt!19490 lt!19487))))

(assert (=> d!8577 (= (addApplyDifferent!37 lt!19490 lt!19492 (minValue!1814 lt!19216) lt!19487) lt!19824)))

(declare-fun b!44888 () Bool)

(assert (=> b!44888 (= e!28444 (not (= lt!19487 lt!19492)))))

(assert (= (and d!8577 res!26400) b!44888))

(assert (=> d!8577 m!38499))

(assert (=> d!8577 m!38513))

(assert (=> d!8577 m!38499))

(assert (=> d!8577 m!38503))

(declare-fun m!39055 () Bool)

(assert (=> d!8577 m!39055))

(declare-fun m!39057 () Bool)

(assert (=> d!8577 m!39057))

(assert (=> b!44455 d!8577))

(assert (=> b!44455 d!8473))

(declare-fun d!8579 () Bool)

(declare-fun e!28445 () Bool)

(assert (=> d!8579 e!28445))

(declare-fun res!26402 () Bool)

(assert (=> d!8579 (=> (not res!26402) (not e!28445))))

(declare-fun lt!19828 () ListLongMap!1187)

(assert (=> d!8579 (= res!26402 (contains!568 lt!19828 (_1!819 (tuple2!1617 lt!19492 (minValue!1814 lt!19216)))))))

(declare-fun lt!19825 () List!1194)

(assert (=> d!8579 (= lt!19828 (ListLongMap!1188 lt!19825))))

(declare-fun lt!19827 () Unit!1239)

(declare-fun lt!19826 () Unit!1239)

(assert (=> d!8579 (= lt!19827 lt!19826)))

(assert (=> d!8579 (= (getValueByKey!108 lt!19825 (_1!819 (tuple2!1617 lt!19492 (minValue!1814 lt!19216)))) (Some!113 (_2!819 (tuple2!1617 lt!19492 (minValue!1814 lt!19216)))))))

(assert (=> d!8579 (= lt!19826 (lemmaContainsTupThenGetReturnValue!33 lt!19825 (_1!819 (tuple2!1617 lt!19492 (minValue!1814 lt!19216))) (_2!819 (tuple2!1617 lt!19492 (minValue!1814 lt!19216)))))))

(assert (=> d!8579 (= lt!19825 (insertStrictlySorted!30 (toList!609 lt!19490) (_1!819 (tuple2!1617 lt!19492 (minValue!1814 lt!19216))) (_2!819 (tuple2!1617 lt!19492 (minValue!1814 lt!19216)))))))

(assert (=> d!8579 (= (+!69 lt!19490 (tuple2!1617 lt!19492 (minValue!1814 lt!19216))) lt!19828)))

(declare-fun b!44889 () Bool)

(declare-fun res!26401 () Bool)

(assert (=> b!44889 (=> (not res!26401) (not e!28445))))

(assert (=> b!44889 (= res!26401 (= (getValueByKey!108 (toList!609 lt!19828) (_1!819 (tuple2!1617 lt!19492 (minValue!1814 lt!19216)))) (Some!113 (_2!819 (tuple2!1617 lt!19492 (minValue!1814 lt!19216))))))))

(declare-fun b!44890 () Bool)

(assert (=> b!44890 (= e!28445 (contains!572 (toList!609 lt!19828) (tuple2!1617 lt!19492 (minValue!1814 lt!19216))))))

(assert (= (and d!8579 res!26402) b!44889))

(assert (= (and b!44889 res!26401) b!44890))

(declare-fun m!39063 () Bool)

(assert (=> d!8579 m!39063))

(declare-fun m!39065 () Bool)

(assert (=> d!8579 m!39065))

(declare-fun m!39067 () Bool)

(assert (=> d!8579 m!39067))

(declare-fun m!39069 () Bool)

(assert (=> d!8579 m!39069))

(declare-fun m!39071 () Bool)

(assert (=> b!44889 m!39071))

(declare-fun m!39073 () Bool)

(assert (=> b!44890 m!39073))

(assert (=> b!44455 d!8579))

(declare-fun d!8585 () Bool)

(declare-fun e!28446 () Bool)

(assert (=> d!8585 e!28446))

(declare-fun res!26404 () Bool)

(assert (=> d!8585 (=> (not res!26404) (not e!28446))))

(declare-fun lt!19833 () ListLongMap!1187)

(assert (=> d!8585 (= res!26404 (contains!568 lt!19833 (_1!819 (tuple2!1617 lt!19476 (zeroValue!1814 lt!19216)))))))

(declare-fun lt!19830 () List!1194)

(assert (=> d!8585 (= lt!19833 (ListLongMap!1188 lt!19830))))

(declare-fun lt!19832 () Unit!1239)

(declare-fun lt!19831 () Unit!1239)

(assert (=> d!8585 (= lt!19832 lt!19831)))

(assert (=> d!8585 (= (getValueByKey!108 lt!19830 (_1!819 (tuple2!1617 lt!19476 (zeroValue!1814 lt!19216)))) (Some!113 (_2!819 (tuple2!1617 lt!19476 (zeroValue!1814 lt!19216)))))))

(assert (=> d!8585 (= lt!19831 (lemmaContainsTupThenGetReturnValue!33 lt!19830 (_1!819 (tuple2!1617 lt!19476 (zeroValue!1814 lt!19216))) (_2!819 (tuple2!1617 lt!19476 (zeroValue!1814 lt!19216)))))))

(assert (=> d!8585 (= lt!19830 (insertStrictlySorted!30 (toList!609 lt!19481) (_1!819 (tuple2!1617 lt!19476 (zeroValue!1814 lt!19216))) (_2!819 (tuple2!1617 lt!19476 (zeroValue!1814 lt!19216)))))))

(assert (=> d!8585 (= (+!69 lt!19481 (tuple2!1617 lt!19476 (zeroValue!1814 lt!19216))) lt!19833)))

(declare-fun b!44891 () Bool)

(declare-fun res!26403 () Bool)

(assert (=> b!44891 (=> (not res!26403) (not e!28446))))

(assert (=> b!44891 (= res!26403 (= (getValueByKey!108 (toList!609 lt!19833) (_1!819 (tuple2!1617 lt!19476 (zeroValue!1814 lt!19216)))) (Some!113 (_2!819 (tuple2!1617 lt!19476 (zeroValue!1814 lt!19216))))))))

(declare-fun b!44892 () Bool)

(assert (=> b!44892 (= e!28446 (contains!572 (toList!609 lt!19833) (tuple2!1617 lt!19476 (zeroValue!1814 lt!19216))))))

(assert (= (and d!8585 res!26404) b!44891))

(assert (= (and b!44891 res!26403) b!44892))

(declare-fun m!39077 () Bool)

(assert (=> d!8585 m!39077))

(declare-fun m!39079 () Bool)

(assert (=> d!8585 m!39079))

(declare-fun m!39083 () Bool)

(assert (=> d!8585 m!39083))

(declare-fun m!39085 () Bool)

(assert (=> d!8585 m!39085))

(declare-fun m!39087 () Bool)

(assert (=> b!44891 m!39087))

(declare-fun m!39089 () Bool)

(assert (=> b!44892 m!39089))

(assert (=> b!44455 d!8585))

(declare-fun d!8591 () Bool)

(assert (=> d!8591 (= (apply!61 (+!69 lt!19479 (tuple2!1617 lt!19484 (zeroValue!1814 lt!19216))) lt!19497) (apply!61 lt!19479 lt!19497))))

(declare-fun lt!19837 () Unit!1239)

(assert (=> d!8591 (= lt!19837 (choose!274 lt!19479 lt!19484 (zeroValue!1814 lt!19216) lt!19497))))

(declare-fun e!28452 () Bool)

(assert (=> d!8591 e!28452))

(declare-fun res!26407 () Bool)

(assert (=> d!8591 (=> (not res!26407) (not e!28452))))

(assert (=> d!8591 (= res!26407 (contains!568 lt!19479 lt!19497))))

(assert (=> d!8591 (= (addApplyDifferent!37 lt!19479 lt!19484 (zeroValue!1814 lt!19216) lt!19497) lt!19837)))

(declare-fun b!44901 () Bool)

(assert (=> b!44901 (= e!28452 (not (= lt!19497 lt!19484)))))

(assert (= (and d!8591 res!26407) b!44901))

(assert (=> d!8591 m!38491))

(assert (=> d!8591 m!38505))

(assert (=> d!8591 m!38491))

(assert (=> d!8591 m!38493))

(declare-fun m!39091 () Bool)

(assert (=> d!8591 m!39091))

(declare-fun m!39093 () Bool)

(assert (=> d!8591 m!39093))

(assert (=> b!44455 d!8591))

(declare-fun d!8593 () Bool)

(assert (=> d!8593 (contains!568 (+!69 lt!19481 (tuple2!1617 lt!19476 (zeroValue!1814 lt!19216))) lt!19485)))

(declare-fun lt!19862 () Unit!1239)

(declare-fun choose!275 (ListLongMap!1187 (_ BitVec 64) V!2325 (_ BitVec 64)) Unit!1239)

(assert (=> d!8593 (= lt!19862 (choose!275 lt!19481 lt!19476 (zeroValue!1814 lt!19216) lt!19485))))

(assert (=> d!8593 (contains!568 lt!19481 lt!19485)))

(assert (=> d!8593 (= (addStillContains!37 lt!19481 lt!19476 (zeroValue!1814 lt!19216) lt!19485) lt!19862)))

(declare-fun bs!2045 () Bool)

(assert (= bs!2045 d!8593))

(assert (=> bs!2045 m!38495))

(assert (=> bs!2045 m!38495))

(assert (=> bs!2045 m!38497))

(declare-fun m!39159 () Bool)

(assert (=> bs!2045 m!39159))

(declare-fun m!39161 () Bool)

(assert (=> bs!2045 m!39161))

(assert (=> b!44455 d!8593))

(declare-fun d!8613 () Bool)

(assert (=> d!8613 (= (apply!61 (+!69 lt!19490 (tuple2!1617 lt!19492 (minValue!1814 lt!19216))) lt!19487) (get!805 (getValueByKey!108 (toList!609 (+!69 lt!19490 (tuple2!1617 lt!19492 (minValue!1814 lt!19216)))) lt!19487)))))

(declare-fun bs!2046 () Bool)

(assert (= bs!2046 d!8613))

(declare-fun m!39163 () Bool)

(assert (=> bs!2046 m!39163))

(assert (=> bs!2046 m!39163))

(declare-fun m!39165 () Bool)

(assert (=> bs!2046 m!39165))

(assert (=> b!44455 d!8613))

(declare-fun d!8615 () Bool)

(assert (=> d!8615 (= (apply!61 (+!69 lt!19479 (tuple2!1617 lt!19484 (zeroValue!1814 lt!19216))) lt!19497) (get!805 (getValueByKey!108 (toList!609 (+!69 lt!19479 (tuple2!1617 lt!19484 (zeroValue!1814 lt!19216)))) lt!19497)))))

(declare-fun bs!2047 () Bool)

(assert (= bs!2047 d!8615))

(declare-fun m!39177 () Bool)

(assert (=> bs!2047 m!39177))

(assert (=> bs!2047 m!39177))

(declare-fun m!39183 () Bool)

(assert (=> bs!2047 m!39183))

(assert (=> b!44455 d!8615))

(declare-fun d!8617 () Bool)

(declare-fun e!28472 () Bool)

(assert (=> d!8617 e!28472))

(declare-fun res!26423 () Bool)

(assert (=> d!8617 (=> (not res!26423) (not e!28472))))

(declare-fun lt!19869 () ListLongMap!1187)

(assert (=> d!8617 (= res!26423 (contains!568 lt!19869 (_1!819 (tuple2!1617 lt!19484 (zeroValue!1814 lt!19216)))))))

(declare-fun lt!19866 () List!1194)

(assert (=> d!8617 (= lt!19869 (ListLongMap!1188 lt!19866))))

(declare-fun lt!19868 () Unit!1239)

(declare-fun lt!19867 () Unit!1239)

(assert (=> d!8617 (= lt!19868 lt!19867)))

(assert (=> d!8617 (= (getValueByKey!108 lt!19866 (_1!819 (tuple2!1617 lt!19484 (zeroValue!1814 lt!19216)))) (Some!113 (_2!819 (tuple2!1617 lt!19484 (zeroValue!1814 lt!19216)))))))

(assert (=> d!8617 (= lt!19867 (lemmaContainsTupThenGetReturnValue!33 lt!19866 (_1!819 (tuple2!1617 lt!19484 (zeroValue!1814 lt!19216))) (_2!819 (tuple2!1617 lt!19484 (zeroValue!1814 lt!19216)))))))

(assert (=> d!8617 (= lt!19866 (insertStrictlySorted!30 (toList!609 lt!19479) (_1!819 (tuple2!1617 lt!19484 (zeroValue!1814 lt!19216))) (_2!819 (tuple2!1617 lt!19484 (zeroValue!1814 lt!19216)))))))

(assert (=> d!8617 (= (+!69 lt!19479 (tuple2!1617 lt!19484 (zeroValue!1814 lt!19216))) lt!19869)))

(declare-fun b!44931 () Bool)

(declare-fun res!26422 () Bool)

(assert (=> b!44931 (=> (not res!26422) (not e!28472))))

(assert (=> b!44931 (= res!26422 (= (getValueByKey!108 (toList!609 lt!19869) (_1!819 (tuple2!1617 lt!19484 (zeroValue!1814 lt!19216)))) (Some!113 (_2!819 (tuple2!1617 lt!19484 (zeroValue!1814 lt!19216))))))))

(declare-fun b!44932 () Bool)

(assert (=> b!44932 (= e!28472 (contains!572 (toList!609 lt!19869) (tuple2!1617 lt!19484 (zeroValue!1814 lt!19216))))))

(assert (= (and d!8617 res!26423) b!44931))

(assert (= (and b!44931 res!26422) b!44932))

(declare-fun m!39187 () Bool)

(assert (=> d!8617 m!39187))

(declare-fun m!39189 () Bool)

(assert (=> d!8617 m!39189))

(declare-fun m!39191 () Bool)

(assert (=> d!8617 m!39191))

(declare-fun m!39193 () Bool)

(assert (=> d!8617 m!39193))

(declare-fun m!39197 () Bool)

(assert (=> b!44931 m!39197))

(declare-fun m!39199 () Bool)

(assert (=> b!44932 m!39199))

(assert (=> b!44455 d!8617))

(declare-fun b!44942 () Bool)

(declare-fun e!28480 () (_ BitVec 32))

(declare-fun call!3660 () (_ BitVec 32))

(assert (=> b!44942 (= e!28480 (bvadd #b00000000000000000000000000000001 call!3660))))

(declare-fun b!44943 () Bool)

(assert (=> b!44943 (= e!28480 call!3660)))

(declare-fun b!44944 () Bool)

(declare-fun e!28481 () (_ BitVec 32))

(assert (=> b!44944 (= e!28481 #b00000000000000000000000000000000)))

(declare-fun b!44945 () Bool)

(assert (=> b!44945 (= e!28481 e!28480)))

(declare-fun c!5977 () Bool)

(assert (=> b!44945 (= c!5977 (validKeyInArray!0 (select (arr!1412 (_keys!3463 lt!19216)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!8623 () Bool)

(declare-fun lt!19873 () (_ BitVec 32))

(assert (=> d!8623 (and (bvsge lt!19873 #b00000000000000000000000000000000) (bvsle lt!19873 (bvsub (size!1615 (_keys!3463 lt!19216)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!8623 (= lt!19873 e!28481)))

(declare-fun c!5978 () Bool)

(assert (=> d!8623 (= c!5978 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1615 (_keys!3463 lt!19216))))))

(assert (=> d!8623 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1615 (_keys!3463 lt!19216))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1615 (_keys!3463 lt!19216)) (size!1615 (_keys!3463 lt!19216))))))

(assert (=> d!8623 (= (arrayCountValidKeys!0 (_keys!3463 lt!19216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1615 (_keys!3463 lt!19216))) lt!19873)))

(declare-fun bm!3657 () Bool)

(assert (=> bm!3657 (= call!3660 (arrayCountValidKeys!0 (_keys!3463 lt!19216) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1615 (_keys!3463 lt!19216))))))

(assert (= (and d!8623 c!5978) b!44944))

(assert (= (and d!8623 (not c!5978)) b!44945))

(assert (= (and b!44945 c!5977) b!44942))

(assert (= (and b!44945 (not c!5977)) b!44943))

(assert (= (or b!44942 b!44943) bm!3657))

(assert (=> b!44945 m!38795))

(assert (=> b!44945 m!38795))

(assert (=> b!44945 m!38803))

(declare-fun m!39211 () Bool)

(assert (=> bm!3657 m!39211))

(assert (=> bm!3564 d!8623))

(declare-fun d!8627 () Bool)

(declare-fun e!28482 () Bool)

(assert (=> d!8627 e!28482))

(declare-fun res!26429 () Bool)

(assert (=> d!8627 (=> res!26429 e!28482)))

(declare-fun lt!19875 () Bool)

(assert (=> d!8627 (= res!26429 (not lt!19875))))

(declare-fun lt!19877 () Bool)

(assert (=> d!8627 (= lt!19875 lt!19877)))

(declare-fun lt!19874 () Unit!1239)

(declare-fun e!28483 () Unit!1239)

(assert (=> d!8627 (= lt!19874 e!28483)))

(declare-fun c!5979 () Bool)

(assert (=> d!8627 (= c!5979 lt!19877)))

(assert (=> d!8627 (= lt!19877 (containsKey!75 (toList!609 lt!19486) (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)))))

(assert (=> d!8627 (= (contains!568 lt!19486 (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)) lt!19875)))

(declare-fun b!44946 () Bool)

(declare-fun lt!19876 () Unit!1239)

(assert (=> b!44946 (= e!28483 lt!19876)))

(assert (=> b!44946 (= lt!19876 (lemmaContainsKeyImpliesGetValueByKeyDefined!63 (toList!609 lt!19486) (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)))))

(assert (=> b!44946 (isDefined!64 (getValueByKey!108 (toList!609 lt!19486) (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000)))))

(declare-fun b!44947 () Bool)

(declare-fun Unit!1260 () Unit!1239)

(assert (=> b!44947 (= e!28483 Unit!1260)))

(declare-fun b!44948 () Bool)

(assert (=> b!44948 (= e!28482 (isDefined!64 (getValueByKey!108 (toList!609 lt!19486) (select (arr!1412 (_keys!3463 lt!19216)) #b00000000000000000000000000000000))))))

(assert (= (and d!8627 c!5979) b!44946))

(assert (= (and d!8627 (not c!5979)) b!44947))

(assert (= (and d!8627 (not res!26429)) b!44948))

(assert (=> d!8627 m!38373))

(declare-fun m!39217 () Bool)

(assert (=> d!8627 m!39217))

(assert (=> b!44946 m!38373))

(declare-fun m!39219 () Bool)

(assert (=> b!44946 m!39219))

(assert (=> b!44946 m!38373))

(assert (=> b!44946 m!38899))

(assert (=> b!44946 m!38899))

(declare-fun m!39223 () Bool)

(assert (=> b!44946 m!39223))

(assert (=> b!44948 m!38373))

(assert (=> b!44948 m!38899))

(assert (=> b!44948 m!38899))

(assert (=> b!44948 m!39223))

(assert (=> b!44439 d!8627))

(declare-fun d!8635 () Bool)

(assert (=> d!8635 (= (content!44 Nil!1192) ((as const (Array (_ BitVec 64) Bool)) false))))

(assert (=> d!8417 d!8635))

(declare-fun b!44961 () Bool)

(declare-fun e!28497 () Bool)

(declare-fun call!3662 () Bool)

(assert (=> b!44961 (= e!28497 call!3662)))

(declare-fun b!44962 () Bool)

(declare-fun e!28496 () Bool)

(assert (=> b!44962 (= e!28496 e!28497)))

(declare-fun c!5981 () Bool)

(assert (=> b!44962 (= c!5981 (validKeyInArray!0 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!44963 () Bool)

(assert (=> b!44963 (= e!28497 call!3662)))

(declare-fun d!8643 () Bool)

(declare-fun res!26440 () Bool)

(declare-fun e!28495 () Bool)

(assert (=> d!8643 (=> res!26440 e!28495)))

(assert (=> d!8643 (= res!26440 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1615 lt!19228)))))

(assert (=> d!8643 (= (arrayNoDuplicates!0 lt!19228 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5781 (Cons!1191 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5743 (Cons!1191 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) Nil!1192) Nil!1192)) (ite c!5743 (Cons!1191 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) Nil!1192) Nil!1192))) e!28495)))

(declare-fun b!44964 () Bool)

(declare-fun e!28498 () Bool)

(assert (=> b!44964 (= e!28498 (contains!565 (ite c!5781 (Cons!1191 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5743 (Cons!1191 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) Nil!1192) Nil!1192)) (ite c!5743 (Cons!1191 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) Nil!1192) Nil!1192)) (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!3659 () Bool)

(assert (=> bm!3659 (= call!3662 (arrayNoDuplicates!0 lt!19228 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5981 (Cons!1191 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!5781 (Cons!1191 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5743 (Cons!1191 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) Nil!1192) Nil!1192)) (ite c!5743 (Cons!1191 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) Nil!1192) Nil!1192))) (ite c!5781 (Cons!1191 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5743 (Cons!1191 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) Nil!1192) Nil!1192)) (ite c!5743 (Cons!1191 (select (arr!1412 lt!19228) #b00000000000000000000000000000000) Nil!1192) Nil!1192)))))))

(declare-fun b!44965 () Bool)

(assert (=> b!44965 (= e!28495 e!28496)))

(declare-fun res!26441 () Bool)

(assert (=> b!44965 (=> (not res!26441) (not e!28496))))

(assert (=> b!44965 (= res!26441 (not e!28498))))

(declare-fun res!26442 () Bool)

(assert (=> b!44965 (=> (not res!26442) (not e!28498))))

(assert (=> b!44965 (= res!26442 (validKeyInArray!0 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!8643 (not res!26440)) b!44965))

(assert (= (and b!44965 res!26442) b!44964))

(assert (= (and b!44965 res!26441) b!44962))

(assert (= (and b!44962 c!5981) b!44963))

(assert (= (and b!44962 (not c!5981)) b!44961))

(assert (= (or b!44963 b!44961) bm!3659))

(assert (=> b!44962 m!38731))

(assert (=> b!44962 m!38731))

(assert (=> b!44962 m!38976))

(assert (=> b!44964 m!38731))

(assert (=> b!44964 m!38731))

(declare-fun m!39247 () Bool)

(assert (=> b!44964 m!39247))

(assert (=> bm!3659 m!38731))

(declare-fun m!39253 () Bool)

(assert (=> bm!3659 m!39253))

(assert (=> b!44965 m!38731))

(assert (=> b!44965 m!38731))

(assert (=> b!44965 m!38976))

(assert (=> bm!3563 d!8643))

(assert (=> b!44257 d!8471))

(assert (=> d!8409 d!8411))

(declare-fun d!8649 () Bool)

(assert (=> d!8649 (arrayContainsKey!0 lt!19228 lt!19353 #b00000000000000000000000000000000)))

(assert (=> d!8649 true))

(declare-fun _$60!350 () Unit!1239)

(assert (=> d!8649 (= (choose!13 lt!19228 lt!19353 #b00000000000000000000000000000000) _$60!350)))

(declare-fun bs!2050 () Bool)

(assert (= bs!2050 d!8649))

(assert (=> bs!2050 m!38297))

(assert (=> d!8409 d!8649))

(declare-fun d!8655 () Bool)

(assert (=> d!8655 (= (apply!61 lt!19486 #b0000000000000000000000000000000000000000000000000000000000000000) (get!805 (getValueByKey!108 (toList!609 lt!19486) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2051 () Bool)

(assert (= bs!2051 d!8655))

(assert (=> bs!2051 m!38751))

(assert (=> bs!2051 m!38751))

(declare-fun m!39279 () Bool)

(assert (=> bs!2051 m!39279))

(assert (=> b!44452 d!8655))

(assert (=> b!44587 d!8471))

(declare-fun d!8659 () Bool)

(assert (=> d!8659 (= (apply!61 lt!19486 #b1000000000000000000000000000000000000000000000000000000000000000) (get!805 (getValueByKey!108 (toList!609 lt!19486) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!2052 () Bool)

(assert (= bs!2052 d!8659))

(assert (=> bs!2052 m!38743))

(assert (=> bs!2052 m!38743))

(declare-fun m!39281 () Bool)

(assert (=> bs!2052 m!39281))

(assert (=> b!44453 d!8659))

(assert (=> d!8365 d!8479))

(declare-fun d!8661 () Bool)

(declare-fun e!28510 () Bool)

(assert (=> d!8661 e!28510))

(declare-fun res!26450 () Bool)

(assert (=> d!8661 (=> (not res!26450) (not e!28510))))

(declare-fun lt!19894 () ListLongMap!1187)

(assert (=> d!8661 (= res!26450 (contains!568 lt!19894 (_1!819 (ite (or c!5844 c!5843) (tuple2!1617 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19216)) (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216))))))))

(declare-fun lt!19891 () List!1194)

(assert (=> d!8661 (= lt!19894 (ListLongMap!1188 lt!19891))))

(declare-fun lt!19893 () Unit!1239)

(declare-fun lt!19892 () Unit!1239)

(assert (=> d!8661 (= lt!19893 lt!19892)))

(assert (=> d!8661 (= (getValueByKey!108 lt!19891 (_1!819 (ite (or c!5844 c!5843) (tuple2!1617 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19216)) (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216))))) (Some!113 (_2!819 (ite (or c!5844 c!5843) (tuple2!1617 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19216)) (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216))))))))

(assert (=> d!8661 (= lt!19892 (lemmaContainsTupThenGetReturnValue!33 lt!19891 (_1!819 (ite (or c!5844 c!5843) (tuple2!1617 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19216)) (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216)))) (_2!819 (ite (or c!5844 c!5843) (tuple2!1617 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19216)) (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216))))))))

(assert (=> d!8661 (= lt!19891 (insertStrictlySorted!30 (toList!609 (ite c!5844 call!3604 (ite c!5843 call!3602 call!3605))) (_1!819 (ite (or c!5844 c!5843) (tuple2!1617 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19216)) (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216)))) (_2!819 (ite (or c!5844 c!5843) (tuple2!1617 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19216)) (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216))))))))

(assert (=> d!8661 (= (+!69 (ite c!5844 call!3604 (ite c!5843 call!3602 call!3605)) (ite (or c!5844 c!5843) (tuple2!1617 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19216)) (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216)))) lt!19894)))

(declare-fun b!44982 () Bool)

(declare-fun res!26449 () Bool)

(assert (=> b!44982 (=> (not res!26449) (not e!28510))))

(assert (=> b!44982 (= res!26449 (= (getValueByKey!108 (toList!609 lt!19894) (_1!819 (ite (or c!5844 c!5843) (tuple2!1617 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19216)) (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216))))) (Some!113 (_2!819 (ite (or c!5844 c!5843) (tuple2!1617 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19216)) (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216)))))))))

(declare-fun b!44983 () Bool)

(assert (=> b!44983 (= e!28510 (contains!572 (toList!609 lt!19894) (ite (or c!5844 c!5843) (tuple2!1617 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1814 lt!19216)) (tuple2!1617 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1814 lt!19216)))))))

(assert (= (and d!8661 res!26450) b!44982))

(assert (= (and b!44982 res!26449) b!44983))

(declare-fun m!39287 () Bool)

(assert (=> d!8661 m!39287))

(declare-fun m!39289 () Bool)

(assert (=> d!8661 m!39289))

(declare-fun m!39291 () Bool)

(assert (=> d!8661 m!39291))

(declare-fun m!39293 () Bool)

(assert (=> d!8661 m!39293))

(declare-fun m!39295 () Bool)

(assert (=> b!44982 m!39295))

(declare-fun m!39297 () Bool)

(assert (=> b!44983 m!39297))

(assert (=> bm!3596 d!8661))

(declare-fun b!44984 () Bool)

(declare-fun e!28511 () (_ BitVec 32))

(declare-fun call!3664 () (_ BitVec 32))

(assert (=> b!44984 (= e!28511 (bvadd #b00000000000000000000000000000001 call!3664))))

(declare-fun b!44985 () Bool)

(assert (=> b!44985 (= e!28511 call!3664)))

(declare-fun b!44986 () Bool)

(declare-fun e!28512 () (_ BitVec 32))

(assert (=> b!44986 (= e!28512 #b00000000000000000000000000000000)))

(declare-fun b!44987 () Bool)

(assert (=> b!44987 (= e!28512 e!28511)))

(declare-fun c!5987 () Bool)

(assert (=> b!44987 (= c!5987 (validKeyInArray!0 (select (arr!1412 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun d!8665 () Bool)

(declare-fun lt!19895 () (_ BitVec 32))

(assert (=> d!8665 (and (bvsge lt!19895 #b00000000000000000000000000000000) (bvsle lt!19895 (bvsub (size!1615 lt!19228) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!8665 (= lt!19895 e!28512)))

(declare-fun c!5988 () Bool)

(assert (=> d!8665 (= c!5988 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8665 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1615 lt!19228)))))

(assert (=> d!8665 (= (arrayCountValidKeys!0 lt!19228 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!19895)))

(declare-fun bm!3661 () Bool)

(assert (=> bm!3661 (= call!3664 (arrayCountValidKeys!0 lt!19228 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!8665 c!5988) b!44986))

(assert (= (and d!8665 (not c!5988)) b!44987))

(assert (= (and b!44987 c!5987) b!44984))

(assert (= (and b!44987 (not c!5987)) b!44985))

(assert (= (or b!44984 b!44985) bm!3661))

(assert (=> b!44987 m!38731))

(assert (=> b!44987 m!38731))

(assert (=> b!44987 m!38976))

(declare-fun m!39299 () Bool)

(assert (=> bm!3661 m!39299))

(assert (=> bm!3629 d!8665))

(declare-fun b_lambda!2335 () Bool)

(assert (= b_lambda!2321 (or (and start!6740 b_free!1513 (= defaultEntry!470 (defaultEntry!1896 lt!19216))) b_lambda!2335)))

(check-sat (not d!8573) (not b!44672) (not b!44660) (not b!44964) (not b!44875) (not d!8469) (not d!8487) (not d!8593) (not b!44714) (not b!44824) (not b_lambda!2329) (not b!44821) (not b_lambda!2327) (not b!44890) (not b!44965) (not b!44658) (not d!8617) (not b!44882) (not bm!3661) tp_is_empty!1903 (not b!44676) (not b!44721) (not d!8555) (not b!44858) (not d!8591) (not bm!3650) (not b!44717) (not bm!3659) (not d!8483) (not b!44707) (not d!8655) (not bm!3651) (not d!8473) (not d!8465) (not bm!3646) (not d!8627) (not d!8539) (not b!44718) (not b!44889) (not b!44932) (not d!8565) (not b!44852) (not d!8579) (not b!44826) (not d!8541) b_and!2717 (not d!8499) (not b!44724) (not b!44945) (not b!44987) (not d!8585) (not d!8463) (not b!44711) (not b!44662) (not b_lambda!2319) (not d!8491) (not d!8569) (not d!8509) (not b!44709) (not b_lambda!2335) (not b!44948) (not b!44728) (not b!44853) (not b!44722) (not d!8613) (not d!8577) (not b!44823) (not bm!3645) (not b!44680) (not b!44862) (not d!8459) (not b!44758) (not b!44892) (not d!8511) (not b!44669) (not b!44874) (not d!8519) (not bm!3657) (not b!44836) (not b!44671) (not b!44712) (not b_next!1513) (not b!44962) (not b!44982) (not b!44819) (not b!44891) (not d!8649) (not b!44931) (not d!8615) (not b!44946) (not d!8659) (not b!44674) (not b!44880) (not b!44835) (not d!8661) (not b!44859) (not b!44983) (not d!8561) (not b!44715) (not d!8453))
(check-sat b_and!2717 (not b_next!1513))
