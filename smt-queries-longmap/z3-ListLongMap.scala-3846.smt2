; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52874 () Bool)

(assert start!52874)

(declare-fun b!576271 () Bool)

(declare-fun e!331509 () Bool)

(declare-fun e!331512 () Bool)

(assert (=> b!576271 (= e!331509 e!331512)))

(declare-fun res!364655 () Bool)

(assert (=> b!576271 (=> (not res!364655) (not e!331512))))

(declare-datatypes ((SeekEntryResult!5713 0))(
  ( (MissingZero!5713 (index!25079 (_ BitVec 32))) (Found!5713 (index!25080 (_ BitVec 32))) (Intermediate!5713 (undefined!6525 Bool) (index!25081 (_ BitVec 32)) (x!53979 (_ BitVec 32))) (Undefined!5713) (MissingVacant!5713 (index!25082 (_ BitVec 32))) )
))
(declare-fun lt!263463 () SeekEntryResult!5713)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!576271 (= res!364655 (or (= lt!263463 (MissingZero!5713 i!1132)) (= lt!263463 (MissingVacant!5713 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35971 0))(
  ( (array!35972 (arr!17267 (Array (_ BitVec 32) (_ BitVec 64))) (size!17632 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35971)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35971 (_ BitVec 32)) SeekEntryResult!5713)

(assert (=> b!576271 (= lt!263463 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun res!364647 () Bool)

(assert (=> start!52874 (=> (not res!364647) (not e!331509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52874 (= res!364647 (validMask!0 mask!3119))))

(assert (=> start!52874 e!331509))

(assert (=> start!52874 true))

(declare-fun array_inv!13150 (array!35971) Bool)

(assert (=> start!52874 (array_inv!13150 a!3118)))

(declare-fun b!576272 () Bool)

(declare-fun res!364648 () Bool)

(assert (=> b!576272 (=> (not res!364648) (not e!331509))))

(declare-fun arrayContainsKey!0 (array!35971 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576272 (= res!364648 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576273 () Bool)

(declare-fun res!364651 () Bool)

(assert (=> b!576273 (=> (not res!364651) (not e!331512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35971 (_ BitVec 32)) Bool)

(assert (=> b!576273 (= res!364651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576274 () Bool)

(declare-fun res!364650 () Bool)

(assert (=> b!576274 (=> (not res!364650) (not e!331512))))

(declare-datatypes ((List!11386 0))(
  ( (Nil!11383) (Cons!11382 (h!12424 (_ BitVec 64)) (t!17605 List!11386)) )
))
(declare-fun arrayNoDuplicates!0 (array!35971 (_ BitVec 32) List!11386) Bool)

(assert (=> b!576274 (= res!364650 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11383))))

(declare-fun b!576275 () Bool)

(declare-fun res!364653 () Bool)

(assert (=> b!576275 (=> (not res!364653) (not e!331509))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!576275 (= res!364653 (and (= (size!17632 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17632 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17632 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576276 () Bool)

(declare-fun e!331508 () Bool)

(assert (=> b!576276 (= e!331512 e!331508)))

(declare-fun res!364646 () Bool)

(assert (=> b!576276 (=> (not res!364646) (not e!331508))))

(declare-fun lt!263462 () array!35971)

(declare-fun lt!263468 () SeekEntryResult!5713)

(declare-fun lt!263469 () (_ BitVec 64))

(declare-fun lt!263465 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35971 (_ BitVec 32)) SeekEntryResult!5713)

(assert (=> b!576276 (= res!364646 (= lt!263468 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263465 lt!263469 lt!263462 mask!3119)))))

(declare-fun lt!263467 () (_ BitVec 32))

(assert (=> b!576276 (= lt!263468 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263467 (select (arr!17267 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576276 (= lt!263465 (toIndex!0 lt!263469 mask!3119))))

(assert (=> b!576276 (= lt!263469 (select (store (arr!17267 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!576276 (= lt!263467 (toIndex!0 (select (arr!17267 a!3118) j!142) mask!3119))))

(assert (=> b!576276 (= lt!263462 (array!35972 (store (arr!17267 a!3118) i!1132 k0!1914) (size!17632 a!3118)))))

(declare-fun b!576277 () Bool)

(declare-fun res!364652 () Bool)

(assert (=> b!576277 (=> (not res!364652) (not e!331509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576277 (= res!364652 (validKeyInArray!0 (select (arr!17267 a!3118) j!142)))))

(declare-fun b!576278 () Bool)

(declare-fun e!331511 () Bool)

(declare-fun lt!263466 () SeekEntryResult!5713)

(assert (=> b!576278 (= e!331511 (= lt!263466 (seekEntryOrOpen!0 lt!263469 lt!263462 mask!3119)))))

(declare-fun b!576279 () Bool)

(declare-fun res!364654 () Bool)

(assert (=> b!576279 (=> (not res!364654) (not e!331509))))

(assert (=> b!576279 (= res!364654 (validKeyInArray!0 k0!1914))))

(declare-fun b!576280 () Bool)

(assert (=> b!576280 (= e!331508 (not e!331511))))

(declare-fun res!364649 () Bool)

(assert (=> b!576280 (=> res!364649 e!331511)))

(declare-fun lt!263470 () Bool)

(assert (=> b!576280 (= res!364649 (or (and (not lt!263470) (undefined!6525 lt!263468)) (and (not lt!263470) (not (undefined!6525 lt!263468)))))))

(get-info :version)

(assert (=> b!576280 (= lt!263470 (not ((_ is Intermediate!5713) lt!263468)))))

(assert (=> b!576280 (= lt!263466 (Found!5713 j!142))))

(assert (=> b!576280 (= lt!263466 (seekEntryOrOpen!0 (select (arr!17267 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!576280 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18114 0))(
  ( (Unit!18115) )
))
(declare-fun lt!263464 () Unit!18114)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18114)

(assert (=> b!576280 (= lt!263464 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52874 res!364647) b!576275))

(assert (= (and b!576275 res!364653) b!576277))

(assert (= (and b!576277 res!364652) b!576279))

(assert (= (and b!576279 res!364654) b!576272))

(assert (= (and b!576272 res!364648) b!576271))

(assert (= (and b!576271 res!364655) b!576273))

(assert (= (and b!576273 res!364651) b!576274))

(assert (= (and b!576274 res!364650) b!576276))

(assert (= (and b!576276 res!364646) b!576280))

(assert (= (and b!576280 (not res!364649)) b!576278))

(declare-fun m!554753 () Bool)

(assert (=> b!576278 m!554753))

(declare-fun m!554755 () Bool)

(assert (=> b!576271 m!554755))

(declare-fun m!554757 () Bool)

(assert (=> b!576279 m!554757))

(declare-fun m!554759 () Bool)

(assert (=> b!576280 m!554759))

(assert (=> b!576280 m!554759))

(declare-fun m!554761 () Bool)

(assert (=> b!576280 m!554761))

(declare-fun m!554763 () Bool)

(assert (=> b!576280 m!554763))

(declare-fun m!554765 () Bool)

(assert (=> b!576280 m!554765))

(assert (=> b!576276 m!554759))

(declare-fun m!554767 () Bool)

(assert (=> b!576276 m!554767))

(declare-fun m!554769 () Bool)

(assert (=> b!576276 m!554769))

(assert (=> b!576276 m!554759))

(declare-fun m!554771 () Bool)

(assert (=> b!576276 m!554771))

(declare-fun m!554773 () Bool)

(assert (=> b!576276 m!554773))

(declare-fun m!554775 () Bool)

(assert (=> b!576276 m!554775))

(assert (=> b!576276 m!554759))

(declare-fun m!554777 () Bool)

(assert (=> b!576276 m!554777))

(declare-fun m!554779 () Bool)

(assert (=> b!576273 m!554779))

(declare-fun m!554781 () Bool)

(assert (=> b!576274 m!554781))

(declare-fun m!554783 () Bool)

(assert (=> start!52874 m!554783))

(declare-fun m!554785 () Bool)

(assert (=> start!52874 m!554785))

(assert (=> b!576277 m!554759))

(assert (=> b!576277 m!554759))

(declare-fun m!554787 () Bool)

(assert (=> b!576277 m!554787))

(declare-fun m!554789 () Bool)

(assert (=> b!576272 m!554789))

(check-sat (not b!576278) (not b!576279) (not b!576271) (not b!576276) (not start!52874) (not b!576274) (not b!576277) (not b!576280) (not b!576272) (not b!576273))
(check-sat)
(get-model)

(declare-fun d!85195 () Bool)

(assert (=> d!85195 (= (validKeyInArray!0 k0!1914) (and (not (= k0!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!576279 d!85195))

(declare-fun bm!32704 () Bool)

(declare-fun call!32707 () Bool)

(declare-fun c!66180 () Bool)

(assert (=> bm!32704 (= call!32707 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66180 (Cons!11382 (select (arr!17267 a!3118) #b00000000000000000000000000000000) Nil!11383) Nil!11383)))))

(declare-fun d!85197 () Bool)

(declare-fun res!364722 () Bool)

(declare-fun e!331552 () Bool)

(assert (=> d!85197 (=> res!364722 e!331552)))

(assert (=> d!85197 (= res!364722 (bvsge #b00000000000000000000000000000000 (size!17632 a!3118)))))

(assert (=> d!85197 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11383) e!331552)))

(declare-fun b!576351 () Bool)

(declare-fun e!331554 () Bool)

(declare-fun contains!2878 (List!11386 (_ BitVec 64)) Bool)

(assert (=> b!576351 (= e!331554 (contains!2878 Nil!11383 (select (arr!17267 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!576352 () Bool)

(declare-fun e!331551 () Bool)

(declare-fun e!331553 () Bool)

(assert (=> b!576352 (= e!331551 e!331553)))

(assert (=> b!576352 (= c!66180 (validKeyInArray!0 (select (arr!17267 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!576353 () Bool)

(assert (=> b!576353 (= e!331553 call!32707)))

(declare-fun b!576354 () Bool)

(assert (=> b!576354 (= e!331552 e!331551)))

(declare-fun res!364724 () Bool)

(assert (=> b!576354 (=> (not res!364724) (not e!331551))))

(assert (=> b!576354 (= res!364724 (not e!331554))))

(declare-fun res!364723 () Bool)

(assert (=> b!576354 (=> (not res!364723) (not e!331554))))

(assert (=> b!576354 (= res!364723 (validKeyInArray!0 (select (arr!17267 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!576355 () Bool)

(assert (=> b!576355 (= e!331553 call!32707)))

(assert (= (and d!85197 (not res!364722)) b!576354))

(assert (= (and b!576354 res!364723) b!576351))

(assert (= (and b!576354 res!364724) b!576352))

(assert (= (and b!576352 c!66180) b!576353))

(assert (= (and b!576352 (not c!66180)) b!576355))

(assert (= (or b!576353 b!576355) bm!32704))

(declare-fun m!554867 () Bool)

(assert (=> bm!32704 m!554867))

(declare-fun m!554869 () Bool)

(assert (=> bm!32704 m!554869))

(assert (=> b!576351 m!554867))

(assert (=> b!576351 m!554867))

(declare-fun m!554871 () Bool)

(assert (=> b!576351 m!554871))

(assert (=> b!576352 m!554867))

(assert (=> b!576352 m!554867))

(declare-fun m!554873 () Bool)

(assert (=> b!576352 m!554873))

(assert (=> b!576354 m!554867))

(assert (=> b!576354 m!554867))

(assert (=> b!576354 m!554873))

(assert (=> b!576274 d!85197))

(declare-fun d!85199 () Bool)

(assert (=> d!85199 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52874 d!85199))

(declare-fun d!85201 () Bool)

(assert (=> d!85201 (= (array_inv!13150 a!3118) (bvsge (size!17632 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52874 d!85201))

(declare-fun d!85203 () Bool)

(declare-fun res!364729 () Bool)

(declare-fun e!331559 () Bool)

(assert (=> d!85203 (=> res!364729 e!331559)))

(assert (=> d!85203 (= res!364729 (= (select (arr!17267 a!3118) #b00000000000000000000000000000000) k0!1914))))

(assert (=> d!85203 (= (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000) e!331559)))

(declare-fun b!576360 () Bool)

(declare-fun e!331560 () Bool)

(assert (=> b!576360 (= e!331559 e!331560)))

(declare-fun res!364730 () Bool)

(assert (=> b!576360 (=> (not res!364730) (not e!331560))))

(assert (=> b!576360 (= res!364730 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17632 a!3118)))))

(declare-fun b!576361 () Bool)

(assert (=> b!576361 (= e!331560 (arrayContainsKey!0 a!3118 k0!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85203 (not res!364729)) b!576360))

(assert (= (and b!576360 res!364730) b!576361))

(assert (=> d!85203 m!554867))

(declare-fun m!554875 () Bool)

(assert (=> b!576361 m!554875))

(assert (=> b!576272 d!85203))

(declare-fun b!576370 () Bool)

(declare-fun e!331568 () Bool)

(declare-fun e!331569 () Bool)

(assert (=> b!576370 (= e!331568 e!331569)))

(declare-fun lt!263531 () (_ BitVec 64))

(assert (=> b!576370 (= lt!263531 (select (arr!17267 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!263533 () Unit!18114)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35971 (_ BitVec 64) (_ BitVec 32)) Unit!18114)

(assert (=> b!576370 (= lt!263533 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!263531 #b00000000000000000000000000000000))))

(assert (=> b!576370 (arrayContainsKey!0 a!3118 lt!263531 #b00000000000000000000000000000000)))

(declare-fun lt!263532 () Unit!18114)

(assert (=> b!576370 (= lt!263532 lt!263533)))

(declare-fun res!364735 () Bool)

(assert (=> b!576370 (= res!364735 (= (seekEntryOrOpen!0 (select (arr!17267 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5713 #b00000000000000000000000000000000)))))

(assert (=> b!576370 (=> (not res!364735) (not e!331569))))

(declare-fun d!85205 () Bool)

(declare-fun res!364736 () Bool)

(declare-fun e!331567 () Bool)

(assert (=> d!85205 (=> res!364736 e!331567)))

(assert (=> d!85205 (= res!364736 (bvsge #b00000000000000000000000000000000 (size!17632 a!3118)))))

(assert (=> d!85205 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!331567)))

(declare-fun bm!32707 () Bool)

(declare-fun call!32710 () Bool)

(assert (=> bm!32707 (= call!32710 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!576371 () Bool)

(assert (=> b!576371 (= e!331568 call!32710)))

(declare-fun b!576372 () Bool)

(assert (=> b!576372 (= e!331567 e!331568)))

(declare-fun c!66183 () Bool)

(assert (=> b!576372 (= c!66183 (validKeyInArray!0 (select (arr!17267 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!576373 () Bool)

(assert (=> b!576373 (= e!331569 call!32710)))

(assert (= (and d!85205 (not res!364736)) b!576372))

(assert (= (and b!576372 c!66183) b!576370))

(assert (= (and b!576372 (not c!66183)) b!576371))

(assert (= (and b!576370 res!364735) b!576373))

(assert (= (or b!576373 b!576371) bm!32707))

(assert (=> b!576370 m!554867))

(declare-fun m!554877 () Bool)

(assert (=> b!576370 m!554877))

(declare-fun m!554879 () Bool)

(assert (=> b!576370 m!554879))

(assert (=> b!576370 m!554867))

(declare-fun m!554881 () Bool)

(assert (=> b!576370 m!554881))

(declare-fun m!554883 () Bool)

(assert (=> bm!32707 m!554883))

(assert (=> b!576372 m!554867))

(assert (=> b!576372 m!554867))

(assert (=> b!576372 m!554873))

(assert (=> b!576273 d!85205))

(declare-fun b!576422 () Bool)

(declare-fun c!66204 () Bool)

(declare-fun lt!263550 () (_ BitVec 64))

(assert (=> b!576422 (= c!66204 (= lt!263550 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!331596 () SeekEntryResult!5713)

(declare-fun e!331598 () SeekEntryResult!5713)

(assert (=> b!576422 (= e!331596 e!331598)))

(declare-fun b!576423 () Bool)

(declare-fun e!331597 () SeekEntryResult!5713)

(assert (=> b!576423 (= e!331597 Undefined!5713)))

(declare-fun d!85209 () Bool)

(declare-fun lt!263548 () SeekEntryResult!5713)

(assert (=> d!85209 (and (or ((_ is Undefined!5713) lt!263548) (not ((_ is Found!5713) lt!263548)) (and (bvsge (index!25080 lt!263548) #b00000000000000000000000000000000) (bvslt (index!25080 lt!263548) (size!17632 lt!263462)))) (or ((_ is Undefined!5713) lt!263548) ((_ is Found!5713) lt!263548) (not ((_ is MissingZero!5713) lt!263548)) (and (bvsge (index!25079 lt!263548) #b00000000000000000000000000000000) (bvslt (index!25079 lt!263548) (size!17632 lt!263462)))) (or ((_ is Undefined!5713) lt!263548) ((_ is Found!5713) lt!263548) ((_ is MissingZero!5713) lt!263548) (not ((_ is MissingVacant!5713) lt!263548)) (and (bvsge (index!25082 lt!263548) #b00000000000000000000000000000000) (bvslt (index!25082 lt!263548) (size!17632 lt!263462)))) (or ((_ is Undefined!5713) lt!263548) (ite ((_ is Found!5713) lt!263548) (= (select (arr!17267 lt!263462) (index!25080 lt!263548)) lt!263469) (ite ((_ is MissingZero!5713) lt!263548) (= (select (arr!17267 lt!263462) (index!25079 lt!263548)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5713) lt!263548) (= (select (arr!17267 lt!263462) (index!25082 lt!263548)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85209 (= lt!263548 e!331597)))

(declare-fun c!66202 () Bool)

(declare-fun lt!263549 () SeekEntryResult!5713)

(assert (=> d!85209 (= c!66202 (and ((_ is Intermediate!5713) lt!263549) (undefined!6525 lt!263549)))))

(assert (=> d!85209 (= lt!263549 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!263469 mask!3119) lt!263469 lt!263462 mask!3119))))

(assert (=> d!85209 (validMask!0 mask!3119)))

(assert (=> d!85209 (= (seekEntryOrOpen!0 lt!263469 lt!263462 mask!3119) lt!263548)))

(declare-fun b!576424 () Bool)

(assert (=> b!576424 (= e!331597 e!331596)))

(assert (=> b!576424 (= lt!263550 (select (arr!17267 lt!263462) (index!25081 lt!263549)))))

(declare-fun c!66203 () Bool)

(assert (=> b!576424 (= c!66203 (= lt!263550 lt!263469))))

(declare-fun b!576425 () Bool)

(assert (=> b!576425 (= e!331596 (Found!5713 (index!25081 lt!263549)))))

(declare-fun b!576426 () Bool)

(assert (=> b!576426 (= e!331598 (MissingZero!5713 (index!25081 lt!263549)))))

(declare-fun b!576427 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35971 (_ BitVec 32)) SeekEntryResult!5713)

(assert (=> b!576427 (= e!331598 (seekKeyOrZeroReturnVacant!0 (x!53979 lt!263549) (index!25081 lt!263549) (index!25081 lt!263549) lt!263469 lt!263462 mask!3119))))

(assert (= (and d!85209 c!66202) b!576423))

(assert (= (and d!85209 (not c!66202)) b!576424))

(assert (= (and b!576424 c!66203) b!576425))

(assert (= (and b!576424 (not c!66203)) b!576422))

(assert (= (and b!576422 c!66204) b!576426))

(assert (= (and b!576422 (not c!66204)) b!576427))

(assert (=> d!85209 m!554775))

(declare-fun m!554901 () Bool)

(assert (=> d!85209 m!554901))

(declare-fun m!554903 () Bool)

(assert (=> d!85209 m!554903))

(declare-fun m!554905 () Bool)

(assert (=> d!85209 m!554905))

(assert (=> d!85209 m!554775))

(declare-fun m!554907 () Bool)

(assert (=> d!85209 m!554907))

(assert (=> d!85209 m!554783))

(declare-fun m!554909 () Bool)

(assert (=> b!576424 m!554909))

(declare-fun m!554911 () Bool)

(assert (=> b!576427 m!554911))

(assert (=> b!576278 d!85209))

(declare-fun b!576428 () Bool)

(declare-fun c!66207 () Bool)

(declare-fun lt!263553 () (_ BitVec 64))

(assert (=> b!576428 (= c!66207 (= lt!263553 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!331599 () SeekEntryResult!5713)

(declare-fun e!331601 () SeekEntryResult!5713)

(assert (=> b!576428 (= e!331599 e!331601)))

(declare-fun b!576429 () Bool)

(declare-fun e!331600 () SeekEntryResult!5713)

(assert (=> b!576429 (= e!331600 Undefined!5713)))

(declare-fun d!85217 () Bool)

(declare-fun lt!263551 () SeekEntryResult!5713)

(assert (=> d!85217 (and (or ((_ is Undefined!5713) lt!263551) (not ((_ is Found!5713) lt!263551)) (and (bvsge (index!25080 lt!263551) #b00000000000000000000000000000000) (bvslt (index!25080 lt!263551) (size!17632 a!3118)))) (or ((_ is Undefined!5713) lt!263551) ((_ is Found!5713) lt!263551) (not ((_ is MissingZero!5713) lt!263551)) (and (bvsge (index!25079 lt!263551) #b00000000000000000000000000000000) (bvslt (index!25079 lt!263551) (size!17632 a!3118)))) (or ((_ is Undefined!5713) lt!263551) ((_ is Found!5713) lt!263551) ((_ is MissingZero!5713) lt!263551) (not ((_ is MissingVacant!5713) lt!263551)) (and (bvsge (index!25082 lt!263551) #b00000000000000000000000000000000) (bvslt (index!25082 lt!263551) (size!17632 a!3118)))) (or ((_ is Undefined!5713) lt!263551) (ite ((_ is Found!5713) lt!263551) (= (select (arr!17267 a!3118) (index!25080 lt!263551)) k0!1914) (ite ((_ is MissingZero!5713) lt!263551) (= (select (arr!17267 a!3118) (index!25079 lt!263551)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5713) lt!263551) (= (select (arr!17267 a!3118) (index!25082 lt!263551)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85217 (= lt!263551 e!331600)))

(declare-fun c!66205 () Bool)

(declare-fun lt!263552 () SeekEntryResult!5713)

(assert (=> d!85217 (= c!66205 (and ((_ is Intermediate!5713) lt!263552) (undefined!6525 lt!263552)))))

(assert (=> d!85217 (= lt!263552 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1914 mask!3119) k0!1914 a!3118 mask!3119))))

(assert (=> d!85217 (validMask!0 mask!3119)))

(assert (=> d!85217 (= (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119) lt!263551)))

(declare-fun b!576430 () Bool)

(assert (=> b!576430 (= e!331600 e!331599)))

(assert (=> b!576430 (= lt!263553 (select (arr!17267 a!3118) (index!25081 lt!263552)))))

(declare-fun c!66206 () Bool)

(assert (=> b!576430 (= c!66206 (= lt!263553 k0!1914))))

(declare-fun b!576431 () Bool)

(assert (=> b!576431 (= e!331599 (Found!5713 (index!25081 lt!263552)))))

(declare-fun b!576432 () Bool)

(assert (=> b!576432 (= e!331601 (MissingZero!5713 (index!25081 lt!263552)))))

(declare-fun b!576433 () Bool)

(assert (=> b!576433 (= e!331601 (seekKeyOrZeroReturnVacant!0 (x!53979 lt!263552) (index!25081 lt!263552) (index!25081 lt!263552) k0!1914 a!3118 mask!3119))))

(assert (= (and d!85217 c!66205) b!576429))

(assert (= (and d!85217 (not c!66205)) b!576430))

(assert (= (and b!576430 c!66206) b!576431))

(assert (= (and b!576430 (not c!66206)) b!576428))

(assert (= (and b!576428 c!66207) b!576432))

(assert (= (and b!576428 (not c!66207)) b!576433))

(declare-fun m!554913 () Bool)

(assert (=> d!85217 m!554913))

(declare-fun m!554915 () Bool)

(assert (=> d!85217 m!554915))

(declare-fun m!554917 () Bool)

(assert (=> d!85217 m!554917))

(declare-fun m!554919 () Bool)

(assert (=> d!85217 m!554919))

(assert (=> d!85217 m!554913))

(declare-fun m!554921 () Bool)

(assert (=> d!85217 m!554921))

(assert (=> d!85217 m!554783))

(declare-fun m!554923 () Bool)

(assert (=> b!576430 m!554923))

(declare-fun m!554925 () Bool)

(assert (=> b!576433 m!554925))

(assert (=> b!576271 d!85217))

(declare-fun b!576482 () Bool)

(declare-fun e!331627 () SeekEntryResult!5713)

(declare-fun e!331630 () SeekEntryResult!5713)

(assert (=> b!576482 (= e!331627 e!331630)))

(declare-fun c!66229 () Bool)

(declare-fun lt!263585 () (_ BitVec 64))

(assert (=> b!576482 (= c!66229 (or (= lt!263585 lt!263469) (= (bvadd lt!263585 lt!263585) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!576483 () Bool)

(declare-fun lt!263586 () SeekEntryResult!5713)

(assert (=> b!576483 (and (bvsge (index!25081 lt!263586) #b00000000000000000000000000000000) (bvslt (index!25081 lt!263586) (size!17632 lt!263462)))))

(declare-fun res!364756 () Bool)

(assert (=> b!576483 (= res!364756 (= (select (arr!17267 lt!263462) (index!25081 lt!263586)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!331631 () Bool)

(assert (=> b!576483 (=> res!364756 e!331631)))

(declare-fun b!576484 () Bool)

(declare-fun e!331629 () Bool)

(declare-fun e!331628 () Bool)

(assert (=> b!576484 (= e!331629 e!331628)))

(declare-fun res!364758 () Bool)

(assert (=> b!576484 (= res!364758 (and ((_ is Intermediate!5713) lt!263586) (not (undefined!6525 lt!263586)) (bvslt (x!53979 lt!263586) #b01111111111111111111111111111110) (bvsge (x!53979 lt!263586) #b00000000000000000000000000000000) (bvsge (x!53979 lt!263586) #b00000000000000000000000000000000)))))

(assert (=> b!576484 (=> (not res!364758) (not e!331628))))

(declare-fun b!576485 () Bool)

(assert (=> b!576485 (= e!331627 (Intermediate!5713 true lt!263465 #b00000000000000000000000000000000))))

(declare-fun b!576486 () Bool)

(assert (=> b!576486 (= e!331629 (bvsge (x!53979 lt!263586) #b01111111111111111111111111111110))))

(declare-fun b!576487 () Bool)

(assert (=> b!576487 (and (bvsge (index!25081 lt!263586) #b00000000000000000000000000000000) (bvslt (index!25081 lt!263586) (size!17632 lt!263462)))))

(declare-fun res!364757 () Bool)

(assert (=> b!576487 (= res!364757 (= (select (arr!17267 lt!263462) (index!25081 lt!263586)) lt!263469))))

(assert (=> b!576487 (=> res!364757 e!331631)))

(assert (=> b!576487 (= e!331628 e!331631)))

(declare-fun b!576489 () Bool)

(assert (=> b!576489 (and (bvsge (index!25081 lt!263586) #b00000000000000000000000000000000) (bvslt (index!25081 lt!263586) (size!17632 lt!263462)))))

(assert (=> b!576489 (= e!331631 (= (select (arr!17267 lt!263462) (index!25081 lt!263586)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!576490 () Bool)

(assert (=> b!576490 (= e!331630 (Intermediate!5713 false lt!263465 #b00000000000000000000000000000000))))

(declare-fun b!576488 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576488 (= e!331630 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!263465 #b00000000000000000000000000000000 mask!3119) lt!263469 lt!263462 mask!3119))))

(declare-fun d!85219 () Bool)

(assert (=> d!85219 e!331629))

(declare-fun c!66231 () Bool)

(assert (=> d!85219 (= c!66231 (and ((_ is Intermediate!5713) lt!263586) (undefined!6525 lt!263586)))))

(assert (=> d!85219 (= lt!263586 e!331627)))

(declare-fun c!66230 () Bool)

(assert (=> d!85219 (= c!66230 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!85219 (= lt!263585 (select (arr!17267 lt!263462) lt!263465))))

(assert (=> d!85219 (validMask!0 mask!3119)))

(assert (=> d!85219 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263465 lt!263469 lt!263462 mask!3119) lt!263586)))

(assert (= (and d!85219 c!66230) b!576485))

(assert (= (and d!85219 (not c!66230)) b!576482))

(assert (= (and b!576482 c!66229) b!576490))

(assert (= (and b!576482 (not c!66229)) b!576488))

(assert (= (and d!85219 c!66231) b!576486))

(assert (= (and d!85219 (not c!66231)) b!576484))

(assert (= (and b!576484 res!364758) b!576487))

(assert (= (and b!576487 (not res!364757)) b!576483))

(assert (= (and b!576483 (not res!364756)) b!576489))

(declare-fun m!554941 () Bool)

(assert (=> d!85219 m!554941))

(assert (=> d!85219 m!554783))

(declare-fun m!554943 () Bool)

(assert (=> b!576488 m!554943))

(assert (=> b!576488 m!554943))

(declare-fun m!554945 () Bool)

(assert (=> b!576488 m!554945))

(declare-fun m!554947 () Bool)

(assert (=> b!576489 m!554947))

(assert (=> b!576487 m!554947))

(assert (=> b!576483 m!554947))

(assert (=> b!576276 d!85219))

(declare-fun b!576501 () Bool)

(declare-fun e!331636 () SeekEntryResult!5713)

(declare-fun e!331639 () SeekEntryResult!5713)

(assert (=> b!576501 (= e!331636 e!331639)))

(declare-fun lt!263587 () (_ BitVec 64))

(declare-fun c!66236 () Bool)

(assert (=> b!576501 (= c!66236 (or (= lt!263587 (select (arr!17267 a!3118) j!142)) (= (bvadd lt!263587 lt!263587) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!576502 () Bool)

(declare-fun lt!263588 () SeekEntryResult!5713)

(assert (=> b!576502 (and (bvsge (index!25081 lt!263588) #b00000000000000000000000000000000) (bvslt (index!25081 lt!263588) (size!17632 a!3118)))))

(declare-fun res!364759 () Bool)

(assert (=> b!576502 (= res!364759 (= (select (arr!17267 a!3118) (index!25081 lt!263588)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!331640 () Bool)

(assert (=> b!576502 (=> res!364759 e!331640)))

(declare-fun b!576503 () Bool)

(declare-fun e!331638 () Bool)

(declare-fun e!331637 () Bool)

(assert (=> b!576503 (= e!331638 e!331637)))

(declare-fun res!364761 () Bool)

(assert (=> b!576503 (= res!364761 (and ((_ is Intermediate!5713) lt!263588) (not (undefined!6525 lt!263588)) (bvslt (x!53979 lt!263588) #b01111111111111111111111111111110) (bvsge (x!53979 lt!263588) #b00000000000000000000000000000000) (bvsge (x!53979 lt!263588) #b00000000000000000000000000000000)))))

(assert (=> b!576503 (=> (not res!364761) (not e!331637))))

(declare-fun b!576504 () Bool)

(assert (=> b!576504 (= e!331636 (Intermediate!5713 true lt!263467 #b00000000000000000000000000000000))))

(declare-fun b!576505 () Bool)

(assert (=> b!576505 (= e!331638 (bvsge (x!53979 lt!263588) #b01111111111111111111111111111110))))

(declare-fun b!576506 () Bool)

(assert (=> b!576506 (and (bvsge (index!25081 lt!263588) #b00000000000000000000000000000000) (bvslt (index!25081 lt!263588) (size!17632 a!3118)))))

(declare-fun res!364760 () Bool)

(assert (=> b!576506 (= res!364760 (= (select (arr!17267 a!3118) (index!25081 lt!263588)) (select (arr!17267 a!3118) j!142)))))

(assert (=> b!576506 (=> res!364760 e!331640)))

(assert (=> b!576506 (= e!331637 e!331640)))

(declare-fun b!576508 () Bool)

(assert (=> b!576508 (and (bvsge (index!25081 lt!263588) #b00000000000000000000000000000000) (bvslt (index!25081 lt!263588) (size!17632 a!3118)))))

(assert (=> b!576508 (= e!331640 (= (select (arr!17267 a!3118) (index!25081 lt!263588)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!576509 () Bool)

(assert (=> b!576509 (= e!331639 (Intermediate!5713 false lt!263467 #b00000000000000000000000000000000))))

(declare-fun b!576507 () Bool)

(assert (=> b!576507 (= e!331639 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!263467 #b00000000000000000000000000000000 mask!3119) (select (arr!17267 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!85227 () Bool)

(assert (=> d!85227 e!331638))

(declare-fun c!66238 () Bool)

(assert (=> d!85227 (= c!66238 (and ((_ is Intermediate!5713) lt!263588) (undefined!6525 lt!263588)))))

(assert (=> d!85227 (= lt!263588 e!331636)))

(declare-fun c!66237 () Bool)

(assert (=> d!85227 (= c!66237 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!85227 (= lt!263587 (select (arr!17267 a!3118) lt!263467))))

(assert (=> d!85227 (validMask!0 mask!3119)))

(assert (=> d!85227 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263467 (select (arr!17267 a!3118) j!142) a!3118 mask!3119) lt!263588)))

(assert (= (and d!85227 c!66237) b!576504))

(assert (= (and d!85227 (not c!66237)) b!576501))

(assert (= (and b!576501 c!66236) b!576509))

(assert (= (and b!576501 (not c!66236)) b!576507))

(assert (= (and d!85227 c!66238) b!576505))

(assert (= (and d!85227 (not c!66238)) b!576503))

(assert (= (and b!576503 res!364761) b!576506))

(assert (= (and b!576506 (not res!364760)) b!576502))

(assert (= (and b!576502 (not res!364759)) b!576508))

(declare-fun m!554949 () Bool)

(assert (=> d!85227 m!554949))

(assert (=> d!85227 m!554783))

(declare-fun m!554951 () Bool)

(assert (=> b!576507 m!554951))

(assert (=> b!576507 m!554951))

(assert (=> b!576507 m!554759))

(declare-fun m!554953 () Bool)

(assert (=> b!576507 m!554953))

(declare-fun m!554955 () Bool)

(assert (=> b!576508 m!554955))

(assert (=> b!576506 m!554955))

(assert (=> b!576502 m!554955))

(assert (=> b!576276 d!85227))

(declare-fun d!85229 () Bool)

(declare-fun lt!263601 () (_ BitVec 32))

(declare-fun lt!263600 () (_ BitVec 32))

(assert (=> d!85229 (= lt!263601 (bvmul (bvxor lt!263600 (bvlshr lt!263600 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85229 (= lt!263600 ((_ extract 31 0) (bvand (bvxor lt!263469 (bvlshr lt!263469 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85229 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!364768 (let ((h!12428 ((_ extract 31 0) (bvand (bvxor lt!263469 (bvlshr lt!263469 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53986 (bvmul (bvxor h!12428 (bvlshr h!12428 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53986 (bvlshr x!53986 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!364768 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!364768 #b00000000000000000000000000000000))))))

(assert (=> d!85229 (= (toIndex!0 lt!263469 mask!3119) (bvand (bvxor lt!263601 (bvlshr lt!263601 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!576276 d!85229))

(declare-fun d!85237 () Bool)

(declare-fun lt!263603 () (_ BitVec 32))

(declare-fun lt!263602 () (_ BitVec 32))

(assert (=> d!85237 (= lt!263603 (bvmul (bvxor lt!263602 (bvlshr lt!263602 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85237 (= lt!263602 ((_ extract 31 0) (bvand (bvxor (select (arr!17267 a!3118) j!142) (bvlshr (select (arr!17267 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85237 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!364768 (let ((h!12428 ((_ extract 31 0) (bvand (bvxor (select (arr!17267 a!3118) j!142) (bvlshr (select (arr!17267 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53986 (bvmul (bvxor h!12428 (bvlshr h!12428 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53986 (bvlshr x!53986 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!364768 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!364768 #b00000000000000000000000000000000))))))

(assert (=> d!85237 (= (toIndex!0 (select (arr!17267 a!3118) j!142) mask!3119) (bvand (bvxor lt!263603 (bvlshr lt!263603 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!576276 d!85237))

(declare-fun d!85239 () Bool)

(assert (=> d!85239 (= (validKeyInArray!0 (select (arr!17267 a!3118) j!142)) (and (not (= (select (arr!17267 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17267 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!576277 d!85239))

(declare-fun b!576548 () Bool)

(declare-fun c!66252 () Bool)

(declare-fun lt!263606 () (_ BitVec 64))

(assert (=> b!576548 (= c!66252 (= lt!263606 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!331666 () SeekEntryResult!5713)

(declare-fun e!331668 () SeekEntryResult!5713)

(assert (=> b!576548 (= e!331666 e!331668)))

(declare-fun b!576549 () Bool)

(declare-fun e!331667 () SeekEntryResult!5713)

(assert (=> b!576549 (= e!331667 Undefined!5713)))

(declare-fun d!85241 () Bool)

(declare-fun lt!263604 () SeekEntryResult!5713)

(assert (=> d!85241 (and (or ((_ is Undefined!5713) lt!263604) (not ((_ is Found!5713) lt!263604)) (and (bvsge (index!25080 lt!263604) #b00000000000000000000000000000000) (bvslt (index!25080 lt!263604) (size!17632 a!3118)))) (or ((_ is Undefined!5713) lt!263604) ((_ is Found!5713) lt!263604) (not ((_ is MissingZero!5713) lt!263604)) (and (bvsge (index!25079 lt!263604) #b00000000000000000000000000000000) (bvslt (index!25079 lt!263604) (size!17632 a!3118)))) (or ((_ is Undefined!5713) lt!263604) ((_ is Found!5713) lt!263604) ((_ is MissingZero!5713) lt!263604) (not ((_ is MissingVacant!5713) lt!263604)) (and (bvsge (index!25082 lt!263604) #b00000000000000000000000000000000) (bvslt (index!25082 lt!263604) (size!17632 a!3118)))) (or ((_ is Undefined!5713) lt!263604) (ite ((_ is Found!5713) lt!263604) (= (select (arr!17267 a!3118) (index!25080 lt!263604)) (select (arr!17267 a!3118) j!142)) (ite ((_ is MissingZero!5713) lt!263604) (= (select (arr!17267 a!3118) (index!25079 lt!263604)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5713) lt!263604) (= (select (arr!17267 a!3118) (index!25082 lt!263604)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85241 (= lt!263604 e!331667)))

(declare-fun c!66250 () Bool)

(declare-fun lt!263605 () SeekEntryResult!5713)

(assert (=> d!85241 (= c!66250 (and ((_ is Intermediate!5713) lt!263605) (undefined!6525 lt!263605)))))

(assert (=> d!85241 (= lt!263605 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17267 a!3118) j!142) mask!3119) (select (arr!17267 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85241 (validMask!0 mask!3119)))

(assert (=> d!85241 (= (seekEntryOrOpen!0 (select (arr!17267 a!3118) j!142) a!3118 mask!3119) lt!263604)))

(declare-fun b!576550 () Bool)

(assert (=> b!576550 (= e!331667 e!331666)))

(assert (=> b!576550 (= lt!263606 (select (arr!17267 a!3118) (index!25081 lt!263605)))))

(declare-fun c!66251 () Bool)

(assert (=> b!576550 (= c!66251 (= lt!263606 (select (arr!17267 a!3118) j!142)))))

(declare-fun b!576551 () Bool)

(assert (=> b!576551 (= e!331666 (Found!5713 (index!25081 lt!263605)))))

(declare-fun b!576552 () Bool)

(assert (=> b!576552 (= e!331668 (MissingZero!5713 (index!25081 lt!263605)))))

(declare-fun b!576553 () Bool)

(assert (=> b!576553 (= e!331668 (seekKeyOrZeroReturnVacant!0 (x!53979 lt!263605) (index!25081 lt!263605) (index!25081 lt!263605) (select (arr!17267 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!85241 c!66250) b!576549))

(assert (= (and d!85241 (not c!66250)) b!576550))

(assert (= (and b!576550 c!66251) b!576551))

(assert (= (and b!576550 (not c!66251)) b!576548))

(assert (= (and b!576548 c!66252) b!576552))

(assert (= (and b!576548 (not c!66252)) b!576553))

(assert (=> d!85241 m!554759))

(assert (=> d!85241 m!554777))

(declare-fun m!554989 () Bool)

(assert (=> d!85241 m!554989))

(declare-fun m!554991 () Bool)

(assert (=> d!85241 m!554991))

(declare-fun m!554993 () Bool)

(assert (=> d!85241 m!554993))

(assert (=> d!85241 m!554777))

(assert (=> d!85241 m!554759))

(declare-fun m!554995 () Bool)

(assert (=> d!85241 m!554995))

(assert (=> d!85241 m!554783))

(declare-fun m!554997 () Bool)

(assert (=> b!576550 m!554997))

(assert (=> b!576553 m!554759))

(declare-fun m!554999 () Bool)

(assert (=> b!576553 m!554999))

(assert (=> b!576280 d!85241))

(declare-fun b!576554 () Bool)

(declare-fun e!331670 () Bool)

(declare-fun e!331671 () Bool)

(assert (=> b!576554 (= e!331670 e!331671)))

(declare-fun lt!263607 () (_ BitVec 64))

(assert (=> b!576554 (= lt!263607 (select (arr!17267 a!3118) j!142))))

(declare-fun lt!263609 () Unit!18114)

(assert (=> b!576554 (= lt!263609 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!263607 j!142))))

(assert (=> b!576554 (arrayContainsKey!0 a!3118 lt!263607 #b00000000000000000000000000000000)))

(declare-fun lt!263608 () Unit!18114)

(assert (=> b!576554 (= lt!263608 lt!263609)))

(declare-fun res!364782 () Bool)

(assert (=> b!576554 (= res!364782 (= (seekEntryOrOpen!0 (select (arr!17267 a!3118) j!142) a!3118 mask!3119) (Found!5713 j!142)))))

(assert (=> b!576554 (=> (not res!364782) (not e!331671))))

(declare-fun d!85245 () Bool)

(declare-fun res!364783 () Bool)

(declare-fun e!331669 () Bool)

(assert (=> d!85245 (=> res!364783 e!331669)))

(assert (=> d!85245 (= res!364783 (bvsge j!142 (size!17632 a!3118)))))

(assert (=> d!85245 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!331669)))

(declare-fun call!32711 () Bool)

(declare-fun bm!32708 () Bool)

(assert (=> bm!32708 (= call!32711 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!576555 () Bool)

(assert (=> b!576555 (= e!331670 call!32711)))

(declare-fun b!576556 () Bool)

(assert (=> b!576556 (= e!331669 e!331670)))

(declare-fun c!66253 () Bool)

(assert (=> b!576556 (= c!66253 (validKeyInArray!0 (select (arr!17267 a!3118) j!142)))))

(declare-fun b!576557 () Bool)

(assert (=> b!576557 (= e!331671 call!32711)))

(assert (= (and d!85245 (not res!364783)) b!576556))

(assert (= (and b!576556 c!66253) b!576554))

(assert (= (and b!576556 (not c!66253)) b!576555))

(assert (= (and b!576554 res!364782) b!576557))

(assert (= (or b!576557 b!576555) bm!32708))

(assert (=> b!576554 m!554759))

(declare-fun m!555001 () Bool)

(assert (=> b!576554 m!555001))

(declare-fun m!555003 () Bool)

(assert (=> b!576554 m!555003))

(assert (=> b!576554 m!554759))

(assert (=> b!576554 m!554761))

(declare-fun m!555005 () Bool)

(assert (=> bm!32708 m!555005))

(assert (=> b!576556 m!554759))

(assert (=> b!576556 m!554759))

(assert (=> b!576556 m!554787))

(assert (=> b!576280 d!85245))

(declare-fun d!85247 () Bool)

(assert (=> d!85247 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!263620 () Unit!18114)

(declare-fun choose!38 (array!35971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18114)

(assert (=> d!85247 (= lt!263620 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85247 (validMask!0 mask!3119)))

(assert (=> d!85247 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!263620)))

(declare-fun bs!17788 () Bool)

(assert (= bs!17788 d!85247))

(assert (=> bs!17788 m!554763))

(declare-fun m!555013 () Bool)

(assert (=> bs!17788 m!555013))

(assert (=> bs!17788 m!554783))

(assert (=> b!576280 d!85247))

(check-sat (not d!85241) (not d!85209) (not b!576553) (not d!85247) (not bm!32707) (not b!576556) (not b!576554) (not d!85219) (not b!576427) (not b!576433) (not b!576488) (not d!85227) (not bm!32708) (not bm!32704) (not b!576372) (not b!576370) (not b!576351) (not b!576354) (not b!576507) (not b!576352) (not b!576361) (not d!85217))
(check-sat)
