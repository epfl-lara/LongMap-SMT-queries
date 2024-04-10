; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6656 () Bool)

(assert start!6656)

(declare-fun b_free!1511 () Bool)

(declare-fun b_next!1511 () Bool)

(assert (=> start!6656 (= b_free!1511 (not b_next!1511))))

(declare-fun tp!5954 () Bool)

(declare-fun b_and!2695 () Bool)

(assert (=> start!6656 (= tp!5954 b_and!2695)))

(declare-fun b!43877 () Bool)

(declare-fun e!27811 () Bool)

(declare-fun e!27810 () Bool)

(assert (=> b!43877 (= e!27811 (not e!27810))))

(declare-fun res!25965 () Bool)

(assert (=> b!43877 (=> res!25965 e!27810)))

(declare-datatypes ((V!2321 0))(
  ( (V!2322 (val!989 Int)) )
))
(declare-datatypes ((tuple2!1632 0))(
  ( (tuple2!1633 (_1!827 (_ BitVec 64)) (_2!827 V!2321)) )
))
(declare-datatypes ((List!1206 0))(
  ( (Nil!1203) (Cons!1202 (h!1779 tuple2!1632) (t!4219 List!1206)) )
))
(declare-datatypes ((ListLongMap!1209 0))(
  ( (ListLongMap!1210 (toList!620 List!1206)) )
))
(declare-fun lt!19147 () ListLongMap!1209)

(assert (=> b!43877 (= res!25965 (= lt!19147 (ListLongMap!1210 Nil!1203)))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-datatypes ((ValueCell!703 0))(
  ( (ValueCellFull!703 (v!2085 V!2321)) (EmptyCell!703) )
))
(declare-datatypes ((array!2947 0))(
  ( (array!2948 (arr!1417 (Array (_ BitVec 32) ValueCell!703)) (size!1614 (_ BitVec 32))) )
))
(declare-fun lt!19145 () array!2947)

(declare-datatypes ((array!2949 0))(
  ( (array!2950 (arr!1418 (Array (_ BitVec 32) (_ BitVec 64))) (size!1615 (_ BitVec 32))) )
))
(declare-fun lt!19150 () array!2949)

(declare-fun lt!19146 () V!2321)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((LongMapFixedSize!386 0))(
  ( (LongMapFixedSize!387 (defaultEntry!1892 Int) (mask!5458 (_ BitVec 32)) (extraKeys!1783 (_ BitVec 32)) (zeroValue!1810 V!2321) (minValue!1810 V!2321) (_size!242 (_ BitVec 32)) (_keys!3453 array!2949) (_values!1875 array!2947) (_vacant!242 (_ BitVec 32))) )
))
(declare-fun map!839 (LongMapFixedSize!386) ListLongMap!1209)

(assert (=> b!43877 (= lt!19147 (map!839 (LongMapFixedSize!387 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19146 lt!19146 #b00000000000000000000000000000000 lt!19150 lt!19145 #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1207 0))(
  ( (Nil!1204) (Cons!1203 (h!1780 (_ BitVec 64)) (t!4220 List!1207)) )
))
(declare-fun arrayNoDuplicates!0 (array!2949 (_ BitVec 32) List!1207) Bool)

(assert (=> b!43877 (arrayNoDuplicates!0 lt!19150 #b00000000000000000000000000000000 Nil!1204)))

(declare-datatypes ((Unit!1227 0))(
  ( (Unit!1228) )
))
(declare-fun lt!19144 () Unit!1227)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2949 (_ BitVec 32) (_ BitVec 32) List!1207) Unit!1227)

(assert (=> b!43877 (= lt!19144 (lemmaArrayNoDuplicatesInAll0Array!0 lt!19150 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1204))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2949 (_ BitVec 32)) Bool)

(assert (=> b!43877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19150 mask!853)))

(declare-fun lt!19142 () Unit!1227)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2949 (_ BitVec 32) (_ BitVec 32)) Unit!1227)

(assert (=> b!43877 (= lt!19142 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19150 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2949 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!43877 (= (arrayCountValidKeys!0 lt!19150 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19149 () Unit!1227)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2949 (_ BitVec 32) (_ BitVec 32)) Unit!1227)

(assert (=> b!43877 (= lt!19149 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19150 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!43877 (= lt!19145 (array!2948 ((as const (Array (_ BitVec 32) ValueCell!703)) EmptyCell!703) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!43877 (= lt!19150 (array!2950 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!264 (Int (_ BitVec 64)) V!2321)

(assert (=> b!43877 (= lt!19146 (dynLambda!264 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!25964 () Bool)

(assert (=> start!6656 (=> (not res!25964) (not e!27811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6656 (= res!25964 (validMask!0 mask!853))))

(assert (=> start!6656 e!27811))

(assert (=> start!6656 true))

(assert (=> start!6656 tp!5954))

(declare-fun b!43880 () Bool)

(declare-fun e!27809 () Bool)

(declare-fun lt!19143 () tuple2!1632)

(declare-fun arrayContainsKey!0 (array!2949 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!43880 (= e!27809 (arrayContainsKey!0 lt!19150 (_1!827 lt!19143) #b00000000000000000000000000000000))))

(declare-fun b!43878 () Bool)

(declare-fun res!25963 () Bool)

(assert (=> b!43878 (=> res!25963 e!27810)))

(declare-fun isEmpty!287 (List!1206) Bool)

(assert (=> b!43878 (= res!25963 (isEmpty!287 (toList!620 lt!19147)))))

(declare-fun b!43879 () Bool)

(assert (=> b!43879 (= e!27810 false)))

(declare-fun lt!19151 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!2949 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!43879 (= lt!19151 (arrayScanForKey!0 lt!19150 (_1!827 lt!19143) #b00000000000000000000000000000000))))

(assert (=> b!43879 e!27809))

(declare-fun res!25962 () Bool)

(assert (=> b!43879 (=> (not res!25962) (not e!27809))))

(assert (=> b!43879 (= res!25962 (and (not (= (_1!827 lt!19143) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (_1!827 lt!19143) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!19148 () Unit!1227)

(declare-fun lemmaKeyInListMapIsInArray!105 (array!2949 array!2947 (_ BitVec 32) (_ BitVec 32) V!2321 V!2321 (_ BitVec 64) Int) Unit!1227)

(assert (=> b!43879 (= lt!19148 (lemmaKeyInListMapIsInArray!105 lt!19150 lt!19145 mask!853 #b00000000000000000000000000000000 lt!19146 lt!19146 (_1!827 lt!19143) defaultEntry!470))))

(declare-fun head!892 (List!1206) tuple2!1632)

(assert (=> b!43879 (= lt!19143 (head!892 (toList!620 lt!19147)))))

(assert (= (and start!6656 res!25964) b!43877))

(assert (= (and b!43877 (not res!25965)) b!43878))

(assert (= (and b!43878 (not res!25963)) b!43879))

(assert (= (and b!43879 res!25962) b!43880))

(declare-fun b_lambda!2301 () Bool)

(assert (=> (not b_lambda!2301) (not b!43877)))

(declare-fun t!4218 () Bool)

(declare-fun tb!999 () Bool)

(assert (=> (and start!6656 (= defaultEntry!470 defaultEntry!470) t!4218) tb!999))

(declare-fun result!1743 () Bool)

(declare-fun tp_is_empty!1901 () Bool)

(assert (=> tb!999 (= result!1743 tp_is_empty!1901)))

(assert (=> b!43877 t!4218))

(declare-fun b_and!2697 () Bool)

(assert (= b_and!2695 (and (=> t!4218 result!1743) b_and!2697)))

(declare-fun m!38137 () Bool)

(assert (=> b!43878 m!38137))

(declare-fun m!38139 () Bool)

(assert (=> start!6656 m!38139))

(declare-fun m!38141 () Bool)

(assert (=> b!43880 m!38141))

(declare-fun m!38143 () Bool)

(assert (=> b!43877 m!38143))

(declare-fun m!38145 () Bool)

(assert (=> b!43877 m!38145))

(declare-fun m!38147 () Bool)

(assert (=> b!43877 m!38147))

(declare-fun m!38149 () Bool)

(assert (=> b!43877 m!38149))

(declare-fun m!38151 () Bool)

(assert (=> b!43877 m!38151))

(declare-fun m!38153 () Bool)

(assert (=> b!43877 m!38153))

(declare-fun m!38155 () Bool)

(assert (=> b!43877 m!38155))

(declare-fun m!38157 () Bool)

(assert (=> b!43877 m!38157))

(declare-fun m!38159 () Bool)

(assert (=> b!43879 m!38159))

(declare-fun m!38161 () Bool)

(assert (=> b!43879 m!38161))

(declare-fun m!38163 () Bool)

(assert (=> b!43879 m!38163))

(push 1)

(assert (not b!43880))

(assert tp_is_empty!1901)

(assert (not b_lambda!2301))

(assert b_and!2697)

(assert (not start!6656))

(assert (not b!43877))

(assert (not b_next!1511))

(assert (not b!43879))

(assert (not b!43878))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2697)

(assert (not b_next!1511))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!2305 () Bool)

(assert (= b_lambda!2301 (or (and start!6656 b_free!1511) b_lambda!2305)))

(push 1)

(assert (not b_lambda!2305))

(assert (not b!43880))

(assert tp_is_empty!1901)

(assert b_and!2697)

(assert (not start!6656))

(assert (not b!43877))

(assert (not b_next!1511))

(assert (not b!43879))

(assert (not b!43878))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2697)

(assert (not b_next!1511))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!8199 () Bool)

(assert (=> d!8199 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6656 d!8199))

(declare-fun b!43905 () Bool)

(declare-fun e!27832 () Bool)

(declare-fun e!27830 () Bool)

(assert (=> b!43905 (= e!27832 e!27830)))

(declare-fun res!25978 () Bool)

(assert (=> b!43905 (=> (not res!25978) (not e!27830))))

(declare-fun e!27829 () Bool)

(assert (=> b!43905 (= res!25978 (not e!27829))))

(declare-fun res!25979 () Bool)

(assert (=> b!43905 (=> (not res!25979) (not e!27829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!43905 (= res!25979 (validKeyInArray!0 (select (arr!1418 lt!19150) #b00000000000000000000000000000000)))))

(declare-fun b!43906 () Bool)

(declare-fun contains!571 (List!1207 (_ BitVec 64)) Bool)

(assert (=> b!43906 (= e!27829 (contains!571 Nil!1204 (select (arr!1418 lt!19150) #b00000000000000000000000000000000)))))

(declare-fun b!43907 () Bool)

(declare-fun e!27831 () Bool)

(assert (=> b!43907 (= e!27830 e!27831)))

(declare-fun c!5684 () Bool)

(assert (=> b!43907 (= c!5684 (validKeyInArray!0 (select (arr!1418 lt!19150) #b00000000000000000000000000000000)))))

(declare-fun b!43908 () Bool)

(declare-fun call!3530 () Bool)

(assert (=> b!43908 (= e!27831 call!3530)))

(declare-fun d!8205 () Bool)

(declare-fun res!25980 () Bool)

(assert (=> d!8205 (=> res!25980 e!27832)))

(assert (=> d!8205 (= res!25980 (bvsge #b00000000000000000000000000000000 (size!1615 lt!19150)))))

(assert (=> d!8205 (= (arrayNoDuplicates!0 lt!19150 #b00000000000000000000000000000000 Nil!1204) e!27832)))

(declare-fun b!43909 () Bool)

(assert (=> b!43909 (= e!27831 call!3530)))

(declare-fun bm!3527 () Bool)

(assert (=> bm!3527 (= call!3530 (arrayNoDuplicates!0 lt!19150 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5684 (Cons!1203 (select (arr!1418 lt!19150) #b00000000000000000000000000000000) Nil!1204) Nil!1204)))))

(assert (= (and d!8205 (not res!25980)) b!43905))

(assert (= (and b!43905 res!25979) b!43906))

(assert (= (and b!43905 res!25978) b!43907))

(assert (= (and b!43907 c!5684) b!43908))

(assert (= (and b!43907 (not c!5684)) b!43909))

(assert (= (or b!43908 b!43909) bm!3527))

(declare-fun m!38179 () Bool)

(assert (=> b!43905 m!38179))

(assert (=> b!43905 m!38179))

(declare-fun m!38181 () Bool)

(assert (=> b!43905 m!38181))

(assert (=> b!43906 m!38179))

(assert (=> b!43906 m!38179))

(declare-fun m!38183 () Bool)

(assert (=> b!43906 m!38183))

(assert (=> b!43907 m!38179))

(assert (=> b!43907 m!38179))

(assert (=> b!43907 m!38181))

(assert (=> bm!3527 m!38179))

(declare-fun m!38185 () Bool)

(assert (=> bm!3527 m!38185))

(assert (=> b!43877 d!8205))

(declare-fun d!8211 () Bool)

(assert (=> d!8211 (= (arrayCountValidKeys!0 lt!19150 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!19169 () Unit!1227)

(declare-fun choose!59 (array!2949 (_ BitVec 32) (_ BitVec 32)) Unit!1227)

(assert (=> d!8211 (= lt!19169 (choose!59 lt!19150 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8211 (bvslt (size!1615 lt!19150) #b01111111111111111111111111111111)))

(assert (=> d!8211 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!19150 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19169)))

(declare-fun bs!1991 () Bool)

(assert (= bs!1991 d!8211))

(assert (=> bs!1991 m!38143))

(declare-fun m!38189 () Bool)

(assert (=> bs!1991 m!38189))

(assert (=> b!43877 d!8211))

(declare-fun d!8215 () Bool)

(assert (=> d!8215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19150 mask!853)))

(declare-fun lt!19172 () Unit!1227)

(declare-fun choose!34 (array!2949 (_ BitVec 32) (_ BitVec 32)) Unit!1227)

(assert (=> d!8215 (= lt!19172 (choose!34 lt!19150 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!8215 (validMask!0 mask!853)))

(assert (=> d!8215 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!19150 mask!853 #b00000000000000000000000000000000) lt!19172)))

(declare-fun bs!1992 () Bool)

(assert (= bs!1992 d!8215))

(assert (=> bs!1992 m!38151))

(declare-fun m!38199 () Bool)

(assert (=> bs!1992 m!38199))

(assert (=> bs!1992 m!38139))

(assert (=> b!43877 d!8215))

(declare-fun b!43945 () Bool)

(declare-fun e!27858 () (_ BitVec 32))

(assert (=> b!43945 (= e!27858 #b00000000000000000000000000000000)))

(declare-fun b!43946 () Bool)

(declare-fun e!27859 () (_ BitVec 32))

(assert (=> b!43946 (= e!27858 e!27859)))

(declare-fun c!5695 () Bool)

(assert (=> b!43946 (= c!5695 (validKeyInArray!0 (select (arr!1418 lt!19150) #b00000000000000000000000000000000)))))

(declare-fun bm!3536 () Bool)

(declare-fun call!3539 () (_ BitVec 32))

(assert (=> bm!3536 (= call!3539 (arrayCountValidKeys!0 lt!19150 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!43947 () Bool)

(assert (=> b!43947 (= e!27859 call!3539)))

(declare-fun b!43948 () Bool)

(assert (=> b!43948 (= e!27859 (bvadd #b00000000000000000000000000000001 call!3539))))

(declare-fun d!8219 () Bool)

(declare-fun lt!19184 () (_ BitVec 32))

(assert (=> d!8219 (and (bvsge lt!19184 #b00000000000000000000000000000000) (bvsle lt!19184 (bvsub (size!1615 lt!19150) #b00000000000000000000000000000000)))))

(assert (=> d!8219 (= lt!19184 e!27858)))

(declare-fun c!5696 () Bool)

(assert (=> d!8219 (= c!5696 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!8219 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1615 lt!19150)))))

(assert (=> d!8219 (= (arrayCountValidKeys!0 lt!19150 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!19184)))

(assert (= (and d!8219 c!5696) b!43945))

(assert (= (and d!8219 (not c!5696)) b!43946))

(assert (= (and b!43946 c!5695) b!43948))

(assert (= (and b!43946 (not c!5695)) b!43947))

(assert (= (or b!43948 b!43947) bm!3536))

(assert (=> b!43946 m!38179))

(assert (=> b!43946 m!38179))

(assert (=> b!43946 m!38181))

(declare-fun m!38211 () Bool)

(assert (=> bm!3536 m!38211))

(assert (=> b!43877 d!8219))

(declare-fun d!8225 () Bool)

(assert (=> d!8225 (arrayNoDuplicates!0 lt!19150 #b00000000000000000000000000000000 Nil!1204)))

(declare-fun lt!19192 () Unit!1227)

(declare-fun choose!111 (array!2949 (_ BitVec 32) (_ BitVec 32) List!1207) Unit!1227)

(assert (=> d!8225 (= lt!19192 (choose!111 lt!19150 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1204))))

(assert (=> d!8225 (= (size!1615 lt!19150) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!8225 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!19150 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1204) lt!19192)))

(declare-fun bs!1995 () Bool)

(assert (= bs!1995 d!8225))

(assert (=> bs!1995 m!38157))

(declare-fun m!38215 () Bool)

(assert (=> bs!1995 m!38215))

(assert (=> b!43877 d!8225))

(declare-fun d!8229 () Bool)

(declare-fun getCurrentListMap!354 (array!2949 array!2947 (_ BitVec 32) (_ BitVec 32) V!2321 V!2321 (_ BitVec 32) Int) ListLongMap!1209)

(assert (=> d!8229 (= (map!839 (LongMapFixedSize!387 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19146 lt!19146 #b00000000000000000000000000000000 lt!19150 lt!19145 #b00000000000000000000000000000000)) (getCurrentListMap!354 (_keys!3453 (LongMapFixedSize!387 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19146 lt!19146 #b00000000000000000000000000000000 lt!19150 lt!19145 #b00000000000000000000000000000000)) (_values!1875 (LongMapFixedSize!387 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19146 lt!19146 #b00000000000000000000000000000000 lt!19150 lt!19145 #b00000000000000000000000000000000)) (mask!5458 (LongMapFixedSize!387 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19146 lt!19146 #b00000000000000000000000000000000 lt!19150 lt!19145 #b00000000000000000000000000000000)) (extraKeys!1783 (LongMapFixedSize!387 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19146 lt!19146 #b00000000000000000000000000000000 lt!19150 lt!19145 #b00000000000000000000000000000000)) (zeroValue!1810 (LongMapFixedSize!387 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19146 lt!19146 #b00000000000000000000000000000000 lt!19150 lt!19145 #b00000000000000000000000000000000)) (minValue!1810 (LongMapFixedSize!387 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19146 lt!19146 #b00000000000000000000000000000000 lt!19150 lt!19145 #b00000000000000000000000000000000)) #b00000000000000000000000000000000 (defaultEntry!1892 (LongMapFixedSize!387 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!19146 lt!19146 #b00000000000000000000000000000000 lt!19150 lt!19145 #b00000000000000000000000000000000))))))

(declare-fun bs!1997 () Bool)

(assert (= bs!1997 d!8229))

(declare-fun m!38225 () Bool)

(assert (=> bs!1997 m!38225))

(assert (=> b!43877 d!8229))

(declare-fun d!8237 () Bool)

(declare-fun res!26009 () Bool)

(declare-fun e!27885 () Bool)

(assert (=> d!8237 (=> res!26009 e!27885)))

(assert (=> d!8237 (= res!26009 (bvsge #b00000000000000000000000000000000 (size!1615 lt!19150)))))

(assert (=> d!8237 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!19150 mask!853) e!27885)))

(declare-fun b!43984 () Bool)

(declare-fun e!27886 () Bool)

(declare-fun call!3548 () Bool)

(assert (=> b!43984 (= e!27886 call!3548)))

(declare-fun b!43985 () Bool)

(assert (=> b!43985 (= e!27885 e!27886)))

(declare-fun c!5708 () Bool)

(assert (=> b!43985 (= c!5708 (validKeyInArray!0 (select (arr!1418 lt!19150) #b00000000000000000000000000000000)))))

(declare-fun bm!3545 () Bool)

(assert (=> bm!3545 (= call!3548 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!19150 mask!853))))

(declare-fun b!43986 () Bool)

(declare-fun e!27884 () Bool)

(assert (=> b!43986 (= e!27884 call!3548)))

(declare-fun b!43987 () Bool)

(assert (=> b!43987 (= e!27886 e!27884)))

(declare-fun lt!19209 () (_ BitVec 64))

(assert (=> b!43987 (= lt!19209 (select (arr!1418 lt!19150) #b00000000000000000000000000000000))))

(declare-fun lt!19210 () Unit!1227)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2949 (_ BitVec 64) (_ BitVec 32)) Unit!1227)

(assert (=> b!43987 (= lt!19210 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!19150 lt!19209 #b00000000000000000000000000000000))))

(assert (=> b!43987 (arrayContainsKey!0 lt!19150 lt!19209 #b00000000000000000000000000000000)))

(declare-fun lt!19211 () Unit!1227)

(assert (=> b!43987 (= lt!19211 lt!19210)))

(declare-fun res!26010 () Bool)

(declare-datatypes ((SeekEntryResult!201 0))(
  ( (MissingZero!201 (index!2926 (_ BitVec 32))) (Found!201 (index!2927 (_ BitVec 32))) (Intermediate!201 (undefined!1013 Bool) (index!2928 (_ BitVec 32)) (x!8322 (_ BitVec 32))) (Undefined!201) (MissingVacant!201 (index!2929 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2949 (_ BitVec 32)) SeekEntryResult!201)

(assert (=> b!43987 (= res!26010 (= (seekEntryOrOpen!0 (select (arr!1418 lt!19150) #b00000000000000000000000000000000) lt!19150 mask!853) (Found!201 #b00000000000000000000000000000000)))))

(assert (=> b!43987 (=> (not res!26010) (not e!27884))))

(assert (= (and d!8237 (not res!26009)) b!43985))

(assert (= (and b!43985 c!5708) b!43987))

(assert (= (and b!43985 (not c!5708)) b!43984))

(assert (= (and b!43987 res!26010) b!43986))

(assert (= (or b!43986 b!43984) bm!3545))

(assert (=> b!43985 m!38179))

(assert (=> b!43985 m!38179))

(assert (=> b!43985 m!38181))

(declare-fun m!38233 () Bool)

(assert (=> bm!3545 m!38233))

(assert (=> b!43987 m!38179))

(declare-fun m!38235 () Bool)

(assert (=> b!43987 m!38235))

(declare-fun m!38237 () Bool)

(assert (=> b!43987 m!38237))

(assert (=> b!43987 m!38179))

(declare-fun m!38239 () Bool)

(assert (=> b!43987 m!38239))

(assert (=> b!43877 d!8237))

(declare-fun d!8245 () Bool)

(assert (=> d!8245 (= (isEmpty!287 (toList!620 lt!19147)) (is-Nil!1203 (toList!620 lt!19147)))))

(assert (=> b!43878 d!8245))

(declare-fun d!8247 () Bool)

(declare-fun res!26015 () Bool)

(declare-fun e!27897 () Bool)

(assert (=> d!8247 (=> res!26015 e!27897)))

(assert (=> d!8247 (= res!26015 (= (select (arr!1418 lt!19150) #b00000000000000000000000000000000) (_1!827 lt!19143)))))

(assert (=> d!8247 (= (arrayContainsKey!0 lt!19150 (_1!827 lt!19143) #b00000000000000000000000000000000) e!27897)))

(declare-fun b!44004 () Bool)

(declare-fun e!27898 () Bool)

(assert (=> b!44004 (= e!27897 e!27898)))

(declare-fun res!26016 () Bool)

(assert (=> b!44004 (=> (not res!26016) (not e!27898))))

(assert (=> b!44004 (= res!26016 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1615 lt!19150)))))

(declare-fun b!44005 () Bool)

(assert (=> b!44005 (= e!27898 (arrayContainsKey!0 lt!19150 (_1!827 lt!19143) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!8247 (not res!26015)) b!44004))

(assert (= (and b!44004 res!26016) b!44005))

(assert (=> d!8247 m!38179))

