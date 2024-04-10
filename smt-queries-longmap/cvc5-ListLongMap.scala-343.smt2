; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6238 () Bool)

(assert start!6238)

(declare-fun res!25209 () Bool)

(declare-fun e!26827 () Bool)

(assert (=> start!6238 (=> (not res!25209) (not e!26827))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6238 (= res!25209 (validMask!0 mask!853))))

(assert (=> start!6238 e!26827))

(assert (=> start!6238 true))

(declare-fun b!42373 () Bool)

(assert (=> b!42373 (= e!26827 (not (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))))

(declare-datatypes ((array!2813 0))(
  ( (array!2814 (arr!1350 (Array (_ BitVec 32) (_ BitVec 64))) (size!1520 (_ BitVec 32))) )
))
(declare-fun lt!17583 () array!2813)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2813 (_ BitVec 32)) Bool)

(assert (=> b!42373 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17583 mask!853)))

(declare-datatypes ((Unit!1131 0))(
  ( (Unit!1132) )
))
(declare-fun lt!17584 () Unit!1131)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2813 (_ BitVec 32) (_ BitVec 32)) Unit!1131)

(assert (=> b!42373 (= lt!17584 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17583 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2813 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42373 (= (arrayCountValidKeys!0 lt!17583 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17585 () Unit!1131)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2813 (_ BitVec 32) (_ BitVec 32)) Unit!1131)

(assert (=> b!42373 (= lt!17585 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17583 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42373 (= lt!17583 (array!2814 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6238 res!25209) b!42373))

(declare-fun m!36017 () Bool)

(assert (=> start!6238 m!36017))

(declare-fun m!36019 () Bool)

(assert (=> b!42373 m!36019))

(declare-fun m!36021 () Bool)

(assert (=> b!42373 m!36021))

(declare-fun m!36023 () Bool)

(assert (=> b!42373 m!36023))

(declare-fun m!36025 () Bool)

(assert (=> b!42373 m!36025))

(push 1)

(assert (not b!42373))

(assert (not start!6238))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!42396 () Bool)

(declare-fun e!26847 () Bool)

(declare-fun call!3319 () Bool)

(assert (=> b!42396 (= e!26847 call!3319)))

(declare-fun b!42397 () Bool)

(declare-fun e!26846 () Bool)

(declare-fun e!26848 () Bool)

(assert (=> b!42397 (= e!26846 e!26848)))

(declare-fun c!5335 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42397 (= c!5335 (validKeyInArray!0 (select (arr!1350 lt!17583) #b00000000000000000000000000000000)))))

(declare-fun b!42398 () Bool)

(assert (=> b!42398 (= e!26848 call!3319)))

(declare-fun b!42399 () Bool)

(assert (=> b!42399 (= e!26848 e!26847)))

(declare-fun lt!17616 () (_ BitVec 64))

(assert (=> b!42399 (= lt!17616 (select (arr!1350 lt!17583) #b00000000000000000000000000000000))))

(declare-fun lt!17617 () Unit!1131)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2813 (_ BitVec 64) (_ BitVec 32)) Unit!1131)

(assert (=> b!42399 (= lt!17617 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17583 lt!17616 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42399 (arrayContainsKey!0 lt!17583 lt!17616 #b00000000000000000000000000000000)))

(declare-fun lt!17618 () Unit!1131)

(assert (=> b!42399 (= lt!17618 lt!17617)))

(declare-fun res!25224 () Bool)

(declare-datatypes ((SeekEntryResult!185 0))(
  ( (MissingZero!185 (index!2862 (_ BitVec 32))) (Found!185 (index!2863 (_ BitVec 32))) (Intermediate!185 (undefined!997 Bool) (index!2864 (_ BitVec 32)) (x!8110 (_ BitVec 32))) (Undefined!185) (MissingVacant!185 (index!2865 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2813 (_ BitVec 32)) SeekEntryResult!185)

(assert (=> b!42399 (= res!25224 (= (seekEntryOrOpen!0 (select (arr!1350 lt!17583) #b00000000000000000000000000000000) lt!17583 mask!853) (Found!185 #b00000000000000000000000000000000)))))

(assert (=> b!42399 (=> (not res!25224) (not e!26847))))

(declare-fun d!7681 () Bool)

(declare-fun res!25225 () Bool)

(assert (=> d!7681 (=> res!25225 e!26846)))

(assert (=> d!7681 (= res!25225 (bvsge #b00000000000000000000000000000000 (size!1520 lt!17583)))))

(assert (=> d!7681 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17583 mask!853) e!26846)))

(declare-fun bm!3316 () Bool)

(assert (=> bm!3316 (= call!3319 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17583 mask!853))))

(assert (= (and d!7681 (not res!25225)) b!42397))

(assert (= (and b!42397 c!5335) b!42399))

(assert (= (and b!42397 (not c!5335)) b!42398))

(assert (= (and b!42399 res!25224) b!42396))

(assert (= (or b!42396 b!42398) bm!3316))

(declare-fun m!36047 () Bool)

(assert (=> b!42397 m!36047))

(assert (=> b!42397 m!36047))

(declare-fun m!36049 () Bool)

(assert (=> b!42397 m!36049))

(assert (=> b!42399 m!36047))

(declare-fun m!36051 () Bool)

(assert (=> b!42399 m!36051))

(declare-fun m!36053 () Bool)

(assert (=> b!42399 m!36053))

(assert (=> b!42399 m!36047))

(declare-fun m!36055 () Bool)

(assert (=> b!42399 m!36055))

(declare-fun m!36057 () Bool)

(assert (=> bm!3316 m!36057))

(assert (=> b!42373 d!7681))

(declare-fun d!7687 () Bool)

(assert (=> d!7687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17583 mask!853)))

(declare-fun lt!17630 () Unit!1131)

(declare-fun choose!34 (array!2813 (_ BitVec 32) (_ BitVec 32)) Unit!1131)

(assert (=> d!7687 (= lt!17630 (choose!34 lt!17583 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7687 (validMask!0 mask!853)))

(assert (=> d!7687 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17583 mask!853 #b00000000000000000000000000000000) lt!17630)))

(declare-fun bs!1866 () Bool)

(assert (= bs!1866 d!7687))

(assert (=> bs!1866 m!36019))

(declare-fun m!36071 () Bool)

(assert (=> bs!1866 m!36071))

(assert (=> bs!1866 m!36017))

(assert (=> b!42373 d!7687))

(declare-fun b!42432 () Bool)

(declare-fun e!26869 () (_ BitVec 32))

(declare-fun call!3328 () (_ BitVec 32))

(assert (=> b!42432 (= e!26869 (bvadd #b00000000000000000000000000000001 call!3328))))

(declare-fun bm!3325 () Bool)

(assert (=> bm!3325 (= call!3328 (arrayCountValidKeys!0 lt!17583 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42433 () Bool)

(declare-fun e!26870 () (_ BitVec 32))

(assert (=> b!42433 (= e!26870 #b00000000000000000000000000000000)))

(declare-fun b!42435 () Bool)

(assert (=> b!42435 (= e!26870 e!26869)))

(declare-fun c!5348 () Bool)

(assert (=> b!42435 (= c!5348 (validKeyInArray!0 (select (arr!1350 lt!17583) #b00000000000000000000000000000000)))))

(declare-fun b!42434 () Bool)

(assert (=> b!42434 (= e!26869 call!3328)))

(declare-fun d!7691 () Bool)

(declare-fun lt!17641 () (_ BitVec 32))

(assert (=> d!7691 (and (bvsge lt!17641 #b00000000000000000000000000000000) (bvsle lt!17641 (bvsub (size!1520 lt!17583) #b00000000000000000000000000000000)))))

(assert (=> d!7691 (= lt!17641 e!26870)))

(declare-fun c!5349 () Bool)

(assert (=> d!7691 (= c!5349 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7691 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1520 lt!17583)))))

(assert (=> d!7691 (= (arrayCountValidKeys!0 lt!17583 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17641)))

(assert (= (and d!7691 c!5349) b!42433))

(assert (= (and d!7691 (not c!5349)) b!42435))

(assert (= (and b!42435 c!5348) b!42432))

(assert (= (and b!42435 (not c!5348)) b!42434))

(assert (= (or b!42432 b!42434) bm!3325))

(declare-fun m!36087 () Bool)

(assert (=> bm!3325 m!36087))

(assert (=> b!42435 m!36047))

(assert (=> b!42435 m!36047))

(assert (=> b!42435 m!36049))

(assert (=> b!42373 d!7691))

(declare-fun d!7697 () Bool)

(assert (=> d!7697 (= (arrayCountValidKeys!0 lt!17583 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17648 () Unit!1131)

(declare-fun choose!59 (array!2813 (_ BitVec 32) (_ BitVec 32)) Unit!1131)

(assert (=> d!7697 (= lt!17648 (choose!59 lt!17583 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7697 (bvslt (size!1520 lt!17583) #b01111111111111111111111111111111)))

(assert (=> d!7697 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17583 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17648)))

(declare-fun bs!1869 () Bool)

(assert (= bs!1869 d!7697))

(assert (=> bs!1869 m!36023))

(declare-fun m!36093 () Bool)

(assert (=> bs!1869 m!36093))

(assert (=> b!42373 d!7697))

(declare-fun d!7703 () Bool)

(assert (=> d!7703 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6238 d!7703))

(push 1)

