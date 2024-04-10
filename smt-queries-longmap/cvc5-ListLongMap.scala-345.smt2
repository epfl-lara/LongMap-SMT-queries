; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6316 () Bool)

(assert start!6316)

(declare-fun b!42584 () Bool)

(declare-fun res!25314 () Bool)

(declare-fun e!26979 () Bool)

(assert (=> b!42584 (=> res!25314 e!26979)))

(declare-datatypes ((List!1145 0))(
  ( (Nil!1142) (Cons!1141 (h!1718 (_ BitVec 64)) (t!4092 List!1145)) )
))
(declare-fun contains!556 (List!1145 (_ BitVec 64)) Bool)

(assert (=> b!42584 (= res!25314 (contains!556 Nil!1142 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42585 () Bool)

(declare-fun res!25313 () Bool)

(assert (=> b!42585 (=> res!25313 e!26979)))

(assert (=> b!42585 (= res!25313 (contains!556 Nil!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42583 () Bool)

(declare-fun e!26980 () Bool)

(assert (=> b!42583 (= e!26980 (not e!26979))))

(declare-fun res!25311 () Bool)

(assert (=> b!42583 (=> res!25311 e!26979)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!42583 (= res!25311 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2825 0))(
  ( (array!2826 (arr!1356 (Array (_ BitVec 32) (_ BitVec 64))) (size!1532 (_ BitVec 32))) )
))
(declare-fun lt!17758 () array!2825)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2825 (_ BitVec 32)) Bool)

(assert (=> b!42583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17758 mask!853)))

(declare-datatypes ((Unit!1143 0))(
  ( (Unit!1144) )
))
(declare-fun lt!17757 () Unit!1143)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2825 (_ BitVec 32) (_ BitVec 32)) Unit!1143)

(assert (=> b!42583 (= lt!17757 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17758 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2825 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42583 (= (arrayCountValidKeys!0 lt!17758 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17759 () Unit!1143)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2825 (_ BitVec 32) (_ BitVec 32)) Unit!1143)

(assert (=> b!42583 (= lt!17759 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17758 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42583 (= lt!17758 (array!2826 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42586 () Bool)

(declare-fun noDuplicate!34 (List!1145) Bool)

(assert (=> b!42586 (= e!26979 (noDuplicate!34 Nil!1142))))

(declare-fun res!25312 () Bool)

(assert (=> start!6316 (=> (not res!25312) (not e!26980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6316 (= res!25312 (validMask!0 mask!853))))

(assert (=> start!6316 e!26980))

(assert (=> start!6316 true))

(assert (= (and start!6316 res!25312) b!42583))

(assert (= (and b!42583 (not res!25311)) b!42584))

(assert (= (and b!42584 (not res!25314)) b!42585))

(assert (= (and b!42585 (not res!25313)) b!42586))

(declare-fun m!36227 () Bool)

(assert (=> b!42586 m!36227))

(declare-fun m!36229 () Bool)

(assert (=> b!42583 m!36229))

(declare-fun m!36231 () Bool)

(assert (=> b!42583 m!36231))

(declare-fun m!36233 () Bool)

(assert (=> b!42583 m!36233))

(declare-fun m!36235 () Bool)

(assert (=> b!42583 m!36235))

(declare-fun m!36237 () Bool)

(assert (=> b!42584 m!36237))

(declare-fun m!36239 () Bool)

(assert (=> b!42585 m!36239))

(declare-fun m!36241 () Bool)

(assert (=> start!6316 m!36241))

(push 1)

(assert (not b!42585))

(assert (not start!6316))

(assert (not b!42586))

(assert (not b!42584))

(assert (not b!42583))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!7757 () Bool)

(assert (=> d!7757 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6316 d!7757))

(declare-fun d!7763 () Bool)

(declare-fun lt!17795 () Bool)

(declare-fun content!37 (List!1145) (Set (_ BitVec 64)))

(assert (=> d!7763 (= lt!17795 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!37 Nil!1142)))))

(declare-fun e!27016 () Bool)

(assert (=> d!7763 (= lt!17795 e!27016)))

(declare-fun res!25358 () Bool)

(assert (=> d!7763 (=> (not res!25358) (not e!27016))))

(assert (=> d!7763 (= res!25358 (is-Cons!1141 Nil!1142))))

(assert (=> d!7763 (= (contains!556 Nil!1142 #b0000000000000000000000000000000000000000000000000000000000000000) lt!17795)))

(declare-fun b!42637 () Bool)

(declare-fun e!27015 () Bool)

(assert (=> b!42637 (= e!27016 e!27015)))

(declare-fun res!25357 () Bool)

(assert (=> b!42637 (=> res!25357 e!27015)))

(assert (=> b!42637 (= res!25357 (= (h!1718 Nil!1142) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42638 () Bool)

(assert (=> b!42638 (= e!27015 (contains!556 (t!4092 Nil!1142) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7763 res!25358) b!42637))

(assert (= (and b!42637 (not res!25357)) b!42638))

(declare-fun m!36281 () Bool)

(assert (=> d!7763 m!36281))

(declare-fun m!36283 () Bool)

(assert (=> d!7763 m!36283))

(declare-fun m!36285 () Bool)

(assert (=> b!42638 m!36285))

(assert (=> b!42584 d!7763))

(declare-fun b!42671 () Bool)

(declare-fun e!27037 () Bool)

(declare-fun e!27038 () Bool)

(assert (=> b!42671 (= e!27037 e!27038)))

(declare-fun lt!17820 () (_ BitVec 64))

(assert (=> b!42671 (= lt!17820 (select (arr!1356 lt!17758) #b00000000000000000000000000000000))))

(declare-fun lt!17819 () Unit!1143)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2825 (_ BitVec 64) (_ BitVec 32)) Unit!1143)

(assert (=> b!42671 (= lt!17819 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17758 lt!17820 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2825 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42671 (arrayContainsKey!0 lt!17758 lt!17820 #b00000000000000000000000000000000)))

(declare-fun lt!17818 () Unit!1143)

(assert (=> b!42671 (= lt!17818 lt!17819)))

(declare-fun res!25368 () Bool)

(declare-datatypes ((SeekEntryResult!191 0))(
  ( (MissingZero!191 (index!2886 (_ BitVec 32))) (Found!191 (index!2887 (_ BitVec 32))) (Intermediate!191 (undefined!1003 Bool) (index!2888 (_ BitVec 32)) (x!8132 (_ BitVec 32))) (Undefined!191) (MissingVacant!191 (index!2889 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2825 (_ BitVec 32)) SeekEntryResult!191)

(assert (=> b!42671 (= res!25368 (= (seekEntryOrOpen!0 (select (arr!1356 lt!17758) #b00000000000000000000000000000000) lt!17758 mask!853) (Found!191 #b00000000000000000000000000000000)))))

(assert (=> b!42671 (=> (not res!25368) (not e!27038))))

(declare-fun b!42672 () Bool)

(declare-fun e!27039 () Bool)

(assert (=> b!42672 (= e!27039 e!27037)))

(declare-fun c!5401 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42672 (= c!5401 (validKeyInArray!0 (select (arr!1356 lt!17758) #b00000000000000000000000000000000)))))

(declare-fun b!42673 () Bool)

(declare-fun call!3363 () Bool)

(assert (=> b!42673 (= e!27037 call!3363)))

(declare-fun b!42674 () Bool)

(assert (=> b!42674 (= e!27038 call!3363)))

(declare-fun d!7765 () Bool)

(declare-fun res!25367 () Bool)

(assert (=> d!7765 (=> res!25367 e!27039)))

(assert (=> d!7765 (= res!25367 (bvsge #b00000000000000000000000000000000 (size!1532 lt!17758)))))

(assert (=> d!7765 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17758 mask!853) e!27039)))

(declare-fun bm!3360 () Bool)

(assert (=> bm!3360 (= call!3363 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17758 mask!853))))

(assert (= (and d!7765 (not res!25367)) b!42672))

(assert (= (and b!42672 c!5401) b!42671))

(assert (= (and b!42672 (not c!5401)) b!42673))

(assert (= (and b!42671 res!25368) b!42674))

(assert (= (or b!42674 b!42673) bm!3360))

(declare-fun m!36315 () Bool)

(assert (=> b!42671 m!36315))

(declare-fun m!36317 () Bool)

(assert (=> b!42671 m!36317))

(declare-fun m!36319 () Bool)

(assert (=> b!42671 m!36319))

(assert (=> b!42671 m!36315))

(declare-fun m!36321 () Bool)

(assert (=> b!42671 m!36321))

(assert (=> b!42672 m!36315))

(assert (=> b!42672 m!36315))

(declare-fun m!36323 () Bool)

(assert (=> b!42672 m!36323))

(declare-fun m!36325 () Bool)

(assert (=> bm!3360 m!36325))

(assert (=> b!42583 d!7765))

(declare-fun d!7775 () Bool)

(assert (=> d!7775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17758 mask!853)))

(declare-fun lt!17831 () Unit!1143)

(declare-fun choose!34 (array!2825 (_ BitVec 32) (_ BitVec 32)) Unit!1143)

(assert (=> d!7775 (= lt!17831 (choose!34 lt!17758 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7775 (validMask!0 mask!853)))

(assert (=> d!7775 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17758 mask!853 #b00000000000000000000000000000000) lt!17831)))

(declare-fun bs!1888 () Bool)

(assert (= bs!1888 d!7775))

(assert (=> bs!1888 m!36229))

(declare-fun m!36335 () Bool)

(assert (=> bs!1888 m!36335))

(assert (=> bs!1888 m!36241))

(assert (=> b!42583 d!7775))

(declare-fun b!42711 () Bool)

(declare-fun e!27069 () (_ BitVec 32))

(declare-fun call!3368 () (_ BitVec 32))

(assert (=> b!42711 (= e!27069 call!3368)))

(declare-fun b!42712 () Bool)

(declare-fun e!27068 () (_ BitVec 32))

(assert (=> b!42712 (= e!27068 e!27069)))

(declare-fun c!5410 () Bool)

(assert (=> b!42712 (= c!5410 (validKeyInArray!0 (select (arr!1356 lt!17758) #b00000000000000000000000000000000)))))

(declare-fun b!42713 () Bool)

(assert (=> b!42713 (= e!27068 #b00000000000000000000000000000000)))

(declare-fun d!7785 () Bool)

(declare-fun lt!17838 () (_ BitVec 32))

(assert (=> d!7785 (and (bvsge lt!17838 #b00000000000000000000000000000000) (bvsle lt!17838 (bvsub (size!1532 lt!17758) #b00000000000000000000000000000000)))))

(assert (=> d!7785 (= lt!17838 e!27068)))

(declare-fun c!5411 () Bool)

(assert (=> d!7785 (= c!5411 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7785 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1532 lt!17758)))))

(assert (=> d!7785 (= (arrayCountValidKeys!0 lt!17758 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17838)))

(declare-fun b!42714 () Bool)

(assert (=> b!42714 (= e!27069 (bvadd #b00000000000000000000000000000001 call!3368))))

(declare-fun bm!3365 () Bool)

(assert (=> bm!3365 (= call!3368 (arrayCountValidKeys!0 lt!17758 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and d!7785 c!5411) b!42713))

(assert (= (and d!7785 (not c!5411)) b!42712))

(assert (= (and b!42712 c!5410) b!42714))

(assert (= (and b!42712 (not c!5410)) b!42711))

(assert (= (or b!42714 b!42711) bm!3365))

(assert (=> b!42712 m!36315))

(assert (=> b!42712 m!36315))

(assert (=> b!42712 m!36323))

(declare-fun m!36355 () Bool)

(assert (=> bm!3365 m!36355))

(assert (=> b!42583 d!7785))

(declare-fun d!7795 () Bool)

(assert (=> d!7795 (= (arrayCountValidKeys!0 lt!17758 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17841 () Unit!1143)

(declare-fun choose!59 (array!2825 (_ BitVec 32) (_ BitVec 32)) Unit!1143)

(assert (=> d!7795 (= lt!17841 (choose!59 lt!17758 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7795 (bvslt (size!1532 lt!17758) #b01111111111111111111111111111111)))

(assert (=> d!7795 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17758 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17841)))

(declare-fun bs!1889 () Bool)

(assert (= bs!1889 d!7795))

(assert (=> bs!1889 m!36233))

(declare-fun m!36357 () Bool)

(assert (=> bs!1889 m!36357))

(assert (=> b!42583 d!7795))

(declare-fun d!7797 () Bool)

(declare-fun res!25393 () Bool)

(declare-fun e!27074 () Bool)

(assert (=> d!7797 (=> res!25393 e!27074)))

(assert (=> d!7797 (= res!25393 (is-Nil!1142 Nil!1142))))

(assert (=> d!7797 (= (noDuplicate!34 Nil!1142) e!27074)))

(declare-fun b!42719 () Bool)

(declare-fun e!27075 () Bool)

(assert (=> b!42719 (= e!27074 e!27075)))

(declare-fun res!25394 () Bool)

(assert (=> b!42719 (=> (not res!25394) (not e!27075))))

(assert (=> b!42719 (= res!25394 (not (contains!556 (t!4092 Nil!1142) (h!1718 Nil!1142))))))

(declare-fun b!42720 () Bool)

(assert (=> b!42720 (= e!27075 (noDuplicate!34 (t!4092 Nil!1142)))))

(assert (= (and d!7797 (not res!25393)) b!42719))

(assert (= (and b!42719 res!25394) b!42720))

(declare-fun m!36359 () Bool)

(assert (=> b!42719 m!36359))

(declare-fun m!36361 () Bool)

(assert (=> b!42720 m!36361))

(assert (=> b!42586 d!7797))

(declare-fun d!7799 () Bool)

(declare-fun lt!17842 () Bool)

(assert (=> d!7799 (= lt!17842 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!37 Nil!1142)))))

(declare-fun e!27077 () Bool)

(assert (=> d!7799 (= lt!17842 e!27077)))

(declare-fun res!25396 () Bool)

(assert (=> d!7799 (=> (not res!25396) (not e!27077))))

(assert (=> d!7799 (= res!25396 (is-Cons!1141 Nil!1142))))

(assert (=> d!7799 (= (contains!556 Nil!1142 #b1000000000000000000000000000000000000000000000000000000000000000) lt!17842)))

(declare-fun b!42721 () Bool)

(declare-fun e!27076 () Bool)

(assert (=> b!42721 (= e!27077 e!27076)))

(declare-fun res!25395 () Bool)

(assert (=> b!42721 (=> res!25395 e!27076)))

(assert (=> b!42721 (= res!25395 (= (h!1718 Nil!1142) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!42722 () Bool)

(assert (=> b!42722 (= e!27076 (contains!556 (t!4092 Nil!1142) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7799 res!25396) b!42721))

(assert (= (and b!42721 (not res!25395)) b!42722))

(assert (=> d!7799 m!36281))

(declare-fun m!36363 () Bool)

(assert (=> d!7799 m!36363))

(declare-fun m!36365 () Bool)

(assert (=> b!42722 m!36365))

(assert (=> b!42585 d!7799))

(push 1)

