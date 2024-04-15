; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6192 () Bool)

(assert start!6192)

(declare-fun res!25150 () Bool)

(declare-fun e!26714 () Bool)

(assert (=> start!6192 (=> (not res!25150) (not e!26714))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6192 (= res!25150 (validMask!0 mask!853))))

(assert (=> start!6192 e!26714))

(assert (=> start!6192 true))

(declare-fun b!42206 () Bool)

(assert (=> b!42206 (= e!26714 (not (bvslt (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111)))))

(declare-datatypes ((array!2777 0))(
  ( (array!2778 (arr!1332 (Array (_ BitVec 32) (_ BitVec 64))) (size!1499 (_ BitVec 32))) )
))
(declare-fun lt!17466 () array!2777)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2777 (_ BitVec 32)) Bool)

(assert (=> b!42206 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17466 mask!853)))

(declare-datatypes ((Unit!1128 0))(
  ( (Unit!1129) )
))
(declare-fun lt!17468 () Unit!1128)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2777 (_ BitVec 32) (_ BitVec 32)) Unit!1128)

(assert (=> b!42206 (= lt!17468 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17466 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2777 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42206 (= (arrayCountValidKeys!0 lt!17466 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17467 () Unit!1128)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2777 (_ BitVec 32) (_ BitVec 32)) Unit!1128)

(assert (=> b!42206 (= lt!17467 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17466 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42206 (= lt!17466 (array!2778 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!6192 res!25150) b!42206))

(declare-fun m!35817 () Bool)

(assert (=> start!6192 m!35817))

(declare-fun m!35819 () Bool)

(assert (=> b!42206 m!35819))

(declare-fun m!35821 () Bool)

(assert (=> b!42206 m!35821))

(declare-fun m!35823 () Bool)

(assert (=> b!42206 m!35823))

(declare-fun m!35825 () Bool)

(assert (=> b!42206 m!35825))

(push 1)

(assert (not b!42206))

(assert (not start!6192))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!3295 () Bool)

(declare-fun call!3298 () Bool)

(assert (=> bm!3295 (= call!3298 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!17466 mask!853))))

(declare-fun b!42226 () Bool)

(declare-fun e!26731 () Bool)

(declare-fun e!26732 () Bool)

(assert (=> b!42226 (= e!26731 e!26732)))

(declare-fun lt!17490 () (_ BitVec 64))

(assert (=> b!42226 (= lt!17490 (select (arr!1332 lt!17466) #b00000000000000000000000000000000))))

(declare-fun lt!17491 () Unit!1128)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2777 (_ BitVec 64) (_ BitVec 32)) Unit!1128)

(assert (=> b!42226 (= lt!17491 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!17466 lt!17490 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!42226 (arrayContainsKey!0 lt!17466 lt!17490 #b00000000000000000000000000000000)))

(declare-fun lt!17492 () Unit!1128)

(assert (=> b!42226 (= lt!17492 lt!17491)))

(declare-fun res!25163 () Bool)

(declare-datatypes ((SeekEntryResult!186 0))(
  ( (MissingZero!186 (index!2866 (_ BitVec 32))) (Found!186 (index!2867 (_ BitVec 32))) (Intermediate!186 (undefined!998 Bool) (index!2868 (_ BitVec 32)) (x!8094 (_ BitVec 32))) (Undefined!186) (MissingVacant!186 (index!2869 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2777 (_ BitVec 32)) SeekEntryResult!186)

(assert (=> b!42226 (= res!25163 (= (seekEntryOrOpen!0 (select (arr!1332 lt!17466) #b00000000000000000000000000000000) lt!17466 mask!853) (Found!186 #b00000000000000000000000000000000)))))

(assert (=> b!42226 (=> (not res!25163) (not e!26732))))

(declare-fun b!42227 () Bool)

(assert (=> b!42227 (= e!26731 call!3298)))

(declare-fun d!7609 () Bool)

(declare-fun res!25162 () Bool)

(declare-fun e!26730 () Bool)

(assert (=> d!7609 (=> res!25162 e!26730)))

(assert (=> d!7609 (= res!25162 (bvsge #b00000000000000000000000000000000 (size!1499 lt!17466)))))

(assert (=> d!7609 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17466 mask!853) e!26730)))

(declare-fun b!42228 () Bool)

(assert (=> b!42228 (= e!26732 call!3298)))

(declare-fun b!42229 () Bool)

(assert (=> b!42229 (= e!26730 e!26731)))

(declare-fun c!5281 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!42229 (= c!5281 (validKeyInArray!0 (select (arr!1332 lt!17466) #b00000000000000000000000000000000)))))

(assert (= (and d!7609 (not res!25162)) b!42229))

(assert (= (and b!42229 c!5281) b!42226))

(assert (= (and b!42229 (not c!5281)) b!42227))

(assert (= (and b!42226 res!25163) b!42228))

(assert (= (or b!42228 b!42227) bm!3295))

(declare-fun m!35837 () Bool)

(assert (=> bm!3295 m!35837))

(declare-fun m!35839 () Bool)

(assert (=> b!42226 m!35839))

(declare-fun m!35841 () Bool)

(assert (=> b!42226 m!35841))

(declare-fun m!35843 () Bool)

(assert (=> b!42226 m!35843))

(assert (=> b!42226 m!35839))

(declare-fun m!35845 () Bool)

(assert (=> b!42226 m!35845))

(assert (=> b!42229 m!35839))

(assert (=> b!42229 m!35839))

(declare-fun m!35847 () Bool)

(assert (=> b!42229 m!35847))

(assert (=> b!42206 d!7609))

(declare-fun d!7611 () Bool)

(assert (=> d!7611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17466 mask!853)))

(declare-fun lt!17498 () Unit!1128)

(declare-fun choose!34 (array!2777 (_ BitVec 32) (_ BitVec 32)) Unit!1128)

(assert (=> d!7611 (= lt!17498 (choose!34 lt!17466 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7611 (validMask!0 mask!853)))

(assert (=> d!7611 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17466 mask!853 #b00000000000000000000000000000000) lt!17498)))

(declare-fun bs!1852 () Bool)

(assert (= bs!1852 d!7611))

(assert (=> bs!1852 m!35819))

(declare-fun m!35861 () Bool)

(assert (=> bs!1852 m!35861))

(assert (=> bs!1852 m!35817))

(assert (=> b!42206 d!7611))

(declare-fun bm!3299 () Bool)

(declare-fun call!3302 () (_ BitVec 32))

(assert (=> bm!3299 (= call!3302 (arrayCountValidKeys!0 lt!17466 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!42243 () Bool)

(declare-fun e!26740 () (_ BitVec 32))

(assert (=> b!42243 (= e!26740 call!3302)))

(declare-fun b!42244 () Bool)

(declare-fun e!26741 () (_ BitVec 32))

(assert (=> b!42244 (= e!26741 e!26740)))

(declare-fun c!5287 () Bool)

(assert (=> b!42244 (= c!5287 (validKeyInArray!0 (select (arr!1332 lt!17466) #b00000000000000000000000000000000)))))

(declare-fun b!42245 () Bool)

(assert (=> b!42245 (= e!26740 (bvadd #b00000000000000000000000000000001 call!3302))))

(declare-fun b!42242 () Bool)

(assert (=> b!42242 (= e!26741 #b00000000000000000000000000000000)))

(declare-fun d!7617 () Bool)

(declare-fun lt!17504 () (_ BitVec 32))

(assert (=> d!7617 (and (bvsge lt!17504 #b00000000000000000000000000000000) (bvsle lt!17504 (bvsub (size!1499 lt!17466) #b00000000000000000000000000000000)))))

(assert (=> d!7617 (= lt!17504 e!26741)))

(declare-fun c!5288 () Bool)

(assert (=> d!7617 (= c!5288 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7617 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1499 lt!17466)))))

(assert (=> d!7617 (= (arrayCountValidKeys!0 lt!17466 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17504)))

(assert (= (and d!7617 c!5288) b!42242))

(assert (= (and d!7617 (not c!5288)) b!42244))

(assert (= (and b!42244 c!5287) b!42245))

(assert (= (and b!42244 (not c!5287)) b!42243))

(assert (= (or b!42245 b!42243) bm!3299))

(declare-fun m!35865 () Bool)

(assert (=> bm!3299 m!35865))

(assert (=> b!42244 m!35839))

(assert (=> b!42244 m!35839))

(assert (=> b!42244 m!35847))

(assert (=> b!42206 d!7617))

(declare-fun d!7621 () Bool)

(assert (=> d!7621 (= (arrayCountValidKeys!0 lt!17466 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17513 () Unit!1128)

(declare-fun choose!59 (array!2777 (_ BitVec 32) (_ BitVec 32)) Unit!1128)

(assert (=> d!7621 (= lt!17513 (choose!59 lt!17466 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7621 (bvslt (size!1499 lt!17466) #b01111111111111111111111111111111)))

(assert (=> d!7621 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17466 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!17513)))

(declare-fun bs!1854 () Bool)

(assert (= bs!1854 d!7621))

(assert (=> bs!1854 m!35823))

(declare-fun m!35867 () Bool)

(assert (=> bs!1854 m!35867))

(assert (=> b!42206 d!7621))

(declare-fun d!7623 () Bool)

(assert (=> d!7623 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!6192 d!7623))

(push 1)

(assert (not bm!3295))

(assert (not d!7611))

(assert (not b!42244))

(assert (not b!42229))

(assert (not bm!3299))

(assert (not b!42226))

(assert (not d!7621))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

