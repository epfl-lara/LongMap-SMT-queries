; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50426 () Bool)

(assert start!50426)

(declare-fun res!344293 () Bool)

(declare-fun e!318288 () Bool)

(assert (=> start!50426 (=> (not res!344293) (not e!318288))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50426 (= res!344293 (validMask!0 mask!3119))))

(assert (=> start!50426 e!318288))

(assert (=> start!50426 true))

(declare-datatypes ((array!34765 0))(
  ( (array!34766 (arr!16695 (Array (_ BitVec 32) (_ BitVec 64))) (size!17059 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34765)

(declare-fun array_inv!12491 (array!34765) Bool)

(assert (=> start!50426 (array_inv!12491 a!3118)))

(declare-fun b!551513 () Bool)

(declare-fun res!344295 () Bool)

(assert (=> b!551513 (=> (not res!344295) (not e!318288))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!551513 (= res!344295 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!551514 () Bool)

(declare-fun res!344298 () Bool)

(declare-fun e!318291 () Bool)

(assert (=> b!551514 (=> (not res!344298) (not e!318291))))

(declare-datatypes ((List!10775 0))(
  ( (Nil!10772) (Cons!10771 (h!11750 (_ BitVec 64)) (t!17003 List!10775)) )
))
(declare-fun arrayNoDuplicates!0 (array!34765 (_ BitVec 32) List!10775) Bool)

(assert (=> b!551514 (= res!344298 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10772))))

(declare-fun b!551515 () Bool)

(assert (=> b!551515 (= e!318288 e!318291)))

(declare-fun res!344297 () Bool)

(assert (=> b!551515 (=> (not res!344297) (not e!318291))))

(declare-datatypes ((SeekEntryResult!5144 0))(
  ( (MissingZero!5144 (index!22803 (_ BitVec 32))) (Found!5144 (index!22804 (_ BitVec 32))) (Intermediate!5144 (undefined!5956 Bool) (index!22805 (_ BitVec 32)) (x!51734 (_ BitVec 32))) (Undefined!5144) (MissingVacant!5144 (index!22806 (_ BitVec 32))) )
))
(declare-fun lt!250845 () SeekEntryResult!5144)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!551515 (= res!344297 (or (= lt!250845 (MissingZero!5144 i!1132)) (= lt!250845 (MissingVacant!5144 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34765 (_ BitVec 32)) SeekEntryResult!5144)

(assert (=> b!551515 (= lt!250845 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!551516 () Bool)

(declare-fun res!344291 () Bool)

(assert (=> b!551516 (=> (not res!344291) (not e!318288))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!551516 (= res!344291 (and (= (size!17059 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17059 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17059 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!551517 () Bool)

(declare-fun res!344296 () Bool)

(assert (=> b!551517 (=> (not res!344296) (not e!318288))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!551517 (= res!344296 (validKeyInArray!0 k!1914))))

(declare-fun b!551518 () Bool)

(declare-fun res!344299 () Bool)

(assert (=> b!551518 (=> (not res!344299) (not e!318288))))

(assert (=> b!551518 (= res!344299 (validKeyInArray!0 (select (arr!16695 a!3118) j!142)))))

(declare-fun b!551519 () Bool)

(declare-fun res!344292 () Bool)

(assert (=> b!551519 (=> (not res!344292) (not e!318291))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34765 (_ BitVec 32)) SeekEntryResult!5144)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551519 (= res!344292 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16695 a!3118) j!142) mask!3119) (select (arr!16695 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16695 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16695 a!3118) i!1132 k!1914) j!142) (array!34766 (store (arr!16695 a!3118) i!1132 k!1914) (size!17059 a!3118)) mask!3119)))))

(declare-fun b!551520 () Bool)

(assert (=> b!551520 (= e!318291 (not (or (bvslt mask!3119 #b00000000000000000000000000000000) (bvsle mask!3119 #b00111111111111111111111111111111))))))

(declare-fun e!318289 () Bool)

(assert (=> b!551520 e!318289))

(declare-fun res!344300 () Bool)

(assert (=> b!551520 (=> (not res!344300) (not e!318289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34765 (_ BitVec 32)) Bool)

(assert (=> b!551520 (= res!344300 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17062 0))(
  ( (Unit!17063) )
))
(declare-fun lt!250846 () Unit!17062)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34765 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17062)

(assert (=> b!551520 (= lt!250846 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!551521 () Bool)

(declare-fun res!344294 () Bool)

(assert (=> b!551521 (=> (not res!344294) (not e!318291))))

(assert (=> b!551521 (= res!344294 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!551522 () Bool)

(assert (=> b!551522 (= e!318289 (= (seekEntryOrOpen!0 (select (arr!16695 a!3118) j!142) a!3118 mask!3119) (Found!5144 j!142)))))

(assert (= (and start!50426 res!344293) b!551516))

(assert (= (and b!551516 res!344291) b!551518))

(assert (= (and b!551518 res!344299) b!551517))

(assert (= (and b!551517 res!344296) b!551513))

(assert (= (and b!551513 res!344295) b!551515))

(assert (= (and b!551515 res!344297) b!551521))

(assert (= (and b!551521 res!344294) b!551514))

(assert (= (and b!551514 res!344298) b!551519))

(assert (= (and b!551519 res!344292) b!551520))

(assert (= (and b!551520 res!344300) b!551522))

(declare-fun m!528513 () Bool)

(assert (=> start!50426 m!528513))

(declare-fun m!528515 () Bool)

(assert (=> start!50426 m!528515))

(declare-fun m!528517 () Bool)

(assert (=> b!551515 m!528517))

(declare-fun m!528519 () Bool)

(assert (=> b!551521 m!528519))

(declare-fun m!528521 () Bool)

(assert (=> b!551514 m!528521))

(declare-fun m!528523 () Bool)

(assert (=> b!551518 m!528523))

(assert (=> b!551518 m!528523))

(declare-fun m!528525 () Bool)

(assert (=> b!551518 m!528525))

(declare-fun m!528527 () Bool)

(assert (=> b!551520 m!528527))

(declare-fun m!528529 () Bool)

(assert (=> b!551520 m!528529))

(declare-fun m!528531 () Bool)

(assert (=> b!551513 m!528531))

(assert (=> b!551522 m!528523))

(assert (=> b!551522 m!528523))

(declare-fun m!528533 () Bool)

(assert (=> b!551522 m!528533))

(declare-fun m!528535 () Bool)

(assert (=> b!551517 m!528535))

(assert (=> b!551519 m!528523))

(declare-fun m!528537 () Bool)

(assert (=> b!551519 m!528537))

(assert (=> b!551519 m!528523))

(declare-fun m!528539 () Bool)

(assert (=> b!551519 m!528539))

(declare-fun m!528541 () Bool)

(assert (=> b!551519 m!528541))

(assert (=> b!551519 m!528539))

(declare-fun m!528543 () Bool)

(assert (=> b!551519 m!528543))

(assert (=> b!551519 m!528537))

(assert (=> b!551519 m!528523))

(declare-fun m!528545 () Bool)

(assert (=> b!551519 m!528545))

(declare-fun m!528547 () Bool)

(assert (=> b!551519 m!528547))

(assert (=> b!551519 m!528539))

(assert (=> b!551519 m!528541))

(push 1)

(assert (not b!551522))

(assert (not b!551513))

(assert (not b!551515))

(assert (not start!50426))

(assert (not b!551520))

(assert (not b!551517))

(assert (not b!551521))

(assert (not b!551519))

(assert (not b!551518))

(assert (not b!551514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!551618 () Bool)

(declare-fun e!318337 () Bool)

(declare-fun call!32291 () Bool)

(assert (=> b!551618 (= e!318337 call!32291)))

(declare-fun b!551619 () Bool)

(declare-fun e!318339 () Bool)

(assert (=> b!551619 (= e!318339 call!32291)))

(declare-fun bm!32288 () Bool)

(assert (=> bm!32288 (= call!32291 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!83007 () Bool)

(declare-fun res!344375 () Bool)

(declare-fun e!318338 () Bool)

(assert (=> d!83007 (=> res!344375 e!318338)))

(assert (=> d!83007 (= res!344375 (bvsge #b00000000000000000000000000000000 (size!17059 a!3118)))))

(assert (=> d!83007 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!318338)))

(declare-fun b!551620 () Bool)

(assert (=> b!551620 (= e!318338 e!318337)))

(declare-fun c!63956 () Bool)

(assert (=> b!551620 (= c!63956 (validKeyInArray!0 (select (arr!16695 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551621 () Bool)

(assert (=> b!551621 (= e!318337 e!318339)))

(declare-fun lt!250871 () (_ BitVec 64))

(assert (=> b!551621 (= lt!250871 (select (arr!16695 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!250872 () Unit!17062)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34765 (_ BitVec 64) (_ BitVec 32)) Unit!17062)

(assert (=> b!551621 (= lt!250872 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250871 #b00000000000000000000000000000000))))

(assert (=> b!551621 (arrayContainsKey!0 a!3118 lt!250871 #b00000000000000000000000000000000)))

(declare-fun lt!250873 () Unit!17062)

(assert (=> b!551621 (= lt!250873 lt!250872)))

(declare-fun res!344376 () Bool)

(assert (=> b!551621 (= res!344376 (= (seekEntryOrOpen!0 (select (arr!16695 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5144 #b00000000000000000000000000000000)))))

(assert (=> b!551621 (=> (not res!344376) (not e!318339))))

(assert (= (and d!83007 (not res!344375)) b!551620))

(assert (= (and b!551620 c!63956) b!551621))

(assert (= (and b!551620 (not c!63956)) b!551618))

(assert (= (and b!551621 res!344376) b!551619))

(assert (= (or b!551619 b!551618) bm!32288))

(declare-fun m!528629 () Bool)

(assert (=> bm!32288 m!528629))

(declare-fun m!528631 () Bool)

(assert (=> b!551620 m!528631))

(assert (=> b!551620 m!528631))

(declare-fun m!528633 () Bool)

(assert (=> b!551620 m!528633))

(assert (=> b!551621 m!528631))

(declare-fun m!528635 () Bool)

(assert (=> b!551621 m!528635))

(declare-fun m!528637 () Bool)

(assert (=> b!551621 m!528637))

(assert (=> b!551621 m!528631))

(declare-fun m!528639 () Bool)

(assert (=> b!551621 m!528639))

(assert (=> b!551521 d!83007))

(declare-fun b!551692 () Bool)

(declare-fun c!63979 () Bool)

(declare-fun lt!250907 () (_ BitVec 64))

(assert (=> b!551692 (= c!63979 (= lt!250907 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318386 () SeekEntryResult!5144)

(declare-fun e!318388 () SeekEntryResult!5144)

(assert (=> b!551692 (= e!318386 e!318388)))

(declare-fun b!551693 () Bool)

(declare-fun e!318387 () SeekEntryResult!5144)

(assert (=> b!551693 (= e!318387 Undefined!5144)))

(declare-fun b!551694 () Bool)

(declare-fun lt!250906 () SeekEntryResult!5144)

(assert (=> b!551694 (= e!318388 (MissingZero!5144 (index!22805 lt!250906)))))

(declare-fun b!551695 () Bool)

(assert (=> b!551695 (= e!318387 e!318386)))

(assert (=> b!551695 (= lt!250907 (select (arr!16695 a!3118) (index!22805 lt!250906)))))

(declare-fun c!63981 () Bool)

(assert (=> b!551695 (= c!63981 (= lt!250907 k!1914))))

(declare-fun b!551696 () Bool)

(assert (=> b!551696 (= e!318386 (Found!5144 (index!22805 lt!250906)))))

(declare-fun d!83015 () Bool)

(declare-fun lt!250905 () SeekEntryResult!5144)

(assert (=> d!83015 (and (or (is-Undefined!5144 lt!250905) (not (is-Found!5144 lt!250905)) (and (bvsge (index!22804 lt!250905) #b00000000000000000000000000000000) (bvslt (index!22804 lt!250905) (size!17059 a!3118)))) (or (is-Undefined!5144 lt!250905) (is-Found!5144 lt!250905) (not (is-MissingZero!5144 lt!250905)) (and (bvsge (index!22803 lt!250905) #b00000000000000000000000000000000) (bvslt (index!22803 lt!250905) (size!17059 a!3118)))) (or (is-Undefined!5144 lt!250905) (is-Found!5144 lt!250905) (is-MissingZero!5144 lt!250905) (not (is-MissingVacant!5144 lt!250905)) (and (bvsge (index!22806 lt!250905) #b00000000000000000000000000000000) (bvslt (index!22806 lt!250905) (size!17059 a!3118)))) (or (is-Undefined!5144 lt!250905) (ite (is-Found!5144 lt!250905) (= (select (arr!16695 a!3118) (index!22804 lt!250905)) k!1914) (ite (is-MissingZero!5144 lt!250905) (= (select (arr!16695 a!3118) (index!22803 lt!250905)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5144 lt!250905) (= (select (arr!16695 a!3118) (index!22806 lt!250905)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83015 (= lt!250905 e!318387)))

(declare-fun c!63980 () Bool)

(assert (=> d!83015 (= c!63980 (and (is-Intermediate!5144 lt!250906) (undefined!5956 lt!250906)))))

(assert (=> d!83015 (= lt!250906 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!83015 (validMask!0 mask!3119)))

(assert (=> d!83015 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!250905)))

(declare-fun b!551691 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34765 (_ BitVec 32)) SeekEntryResult!5144)

(assert (=> b!551691 (= e!318388 (seekKeyOrZeroReturnVacant!0 (x!51734 lt!250906) (index!22805 lt!250906) (index!22805 lt!250906) k!1914 a!3118 mask!3119))))

(assert (= (and d!83015 c!63980) b!551693))

(assert (= (and d!83015 (not c!63980)) b!551695))

(assert (= (and b!551695 c!63981) b!551696))

(assert (= (and b!551695 (not c!63981)) b!551692))

(assert (= (and b!551692 c!63979) b!551694))

(assert (= (and b!551692 (not c!63979)) b!551691))

(declare-fun m!528667 () Bool)

(assert (=> b!551695 m!528667))

(declare-fun m!528669 () Bool)

(assert (=> d!83015 m!528669))

(declare-fun m!528671 () Bool)

(assert (=> d!83015 m!528671))

(assert (=> d!83015 m!528513))

(assert (=> d!83015 m!528671))

(declare-fun m!528673 () Bool)

(assert (=> d!83015 m!528673))

(declare-fun m!528675 () Bool)

(assert (=> d!83015 m!528675))

(declare-fun m!528677 () Bool)

(assert (=> d!83015 m!528677))

(declare-fun m!528679 () Bool)

(assert (=> b!551691 m!528679))

(assert (=> b!551515 d!83015))

(declare-fun b!551697 () Bool)

(declare-fun e!318389 () Bool)

(declare-fun call!32296 () Bool)

(assert (=> b!551697 (= e!318389 call!32296)))

(declare-fun b!551698 () Bool)

(declare-fun e!318391 () Bool)

(assert (=> b!551698 (= e!318391 call!32296)))

(declare-fun bm!32293 () Bool)

(assert (=> bm!32293 (= call!32296 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun d!83033 () Bool)

(declare-fun res!344402 () Bool)

(declare-fun e!318390 () Bool)

(assert (=> d!83033 (=> res!344402 e!318390)))

(assert (=> d!83033 (= res!344402 (bvsge j!142 (size!17059 a!3118)))))

(assert (=> d!83033 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!318390)))

(declare-fun b!551699 () Bool)

(assert (=> b!551699 (= e!318390 e!318389)))

(declare-fun c!63982 () Bool)

(assert (=> b!551699 (= c!63982 (validKeyInArray!0 (select (arr!16695 a!3118) j!142)))))

(declare-fun b!551700 () Bool)

(assert (=> b!551700 (= e!318389 e!318391)))

(declare-fun lt!250908 () (_ BitVec 64))

(assert (=> b!551700 (= lt!250908 (select (arr!16695 a!3118) j!142))))

(declare-fun lt!250909 () Unit!17062)

(assert (=> b!551700 (= lt!250909 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!250908 j!142))))

(assert (=> b!551700 (arrayContainsKey!0 a!3118 lt!250908 #b00000000000000000000000000000000)))

(declare-fun lt!250910 () Unit!17062)

(assert (=> b!551700 (= lt!250910 lt!250909)))

(declare-fun res!344403 () Bool)

(assert (=> b!551700 (= res!344403 (= (seekEntryOrOpen!0 (select (arr!16695 a!3118) j!142) a!3118 mask!3119) (Found!5144 j!142)))))

(assert (=> b!551700 (=> (not res!344403) (not e!318391))))

(assert (= (and d!83033 (not res!344402)) b!551699))

(assert (= (and b!551699 c!63982) b!551700))

(assert (= (and b!551699 (not c!63982)) b!551697))

(assert (= (and b!551700 res!344403) b!551698))

(assert (= (or b!551698 b!551697) bm!32293))

(declare-fun m!528681 () Bool)

(assert (=> bm!32293 m!528681))

(assert (=> b!551699 m!528523))

(assert (=> b!551699 m!528523))

(assert (=> b!551699 m!528525))

(assert (=> b!551700 m!528523))

(declare-fun m!528683 () Bool)

(assert (=> b!551700 m!528683))

(declare-fun m!528685 () Bool)

(assert (=> b!551700 m!528685))

(assert (=> b!551700 m!528523))

(assert (=> b!551700 m!528533))

(assert (=> b!551520 d!83033))

(declare-fun d!83035 () Bool)

(assert (=> d!83035 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!250916 () Unit!17062)

(declare-fun choose!38 (array!34765 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17062)

(assert (=> d!83035 (= lt!250916 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83035 (validMask!0 mask!3119)))

(assert (=> d!83035 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!250916)))

(declare-fun bs!17182 () Bool)

(assert (= bs!17182 d!83035))

(assert (=> bs!17182 m!528527))

(declare-fun m!528699 () Bool)

(assert (=> bs!17182 m!528699))

(assert (=> bs!17182 m!528513))

(assert (=> b!551520 d!83035))

(declare-fun b!551740 () Bool)

(declare-fun e!318421 () Bool)

(declare-fun e!318422 () Bool)

(assert (=> b!551740 (= e!318421 e!318422)))

(declare-fun res!344423 () Bool)

(assert (=> b!551740 (=> (not res!344423) (not e!318422))))

(declare-fun e!318424 () Bool)

(assert (=> b!551740 (= res!344423 (not e!318424))))

(declare-fun res!344424 () Bool)

(assert (=> b!551740 (=> (not res!344424) (not e!318424))))

(assert (=> b!551740 (= res!344424 (validKeyInArray!0 (select (arr!16695 a!3118) #b00000000000000000000000000000000)))))

(declare-fun bm!32301 () Bool)

(declare-fun call!32304 () Bool)

(declare-fun c!63993 () Bool)

(assert (=> bm!32301 (= call!32304 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63993 (Cons!10771 (select (arr!16695 a!3118) #b00000000000000000000000000000000) Nil!10772) Nil!10772)))))

(declare-fun b!551742 () Bool)

(declare-fun e!318423 () Bool)

(assert (=> b!551742 (= e!318423 call!32304)))

(declare-fun b!551743 () Bool)

(assert (=> b!551743 (= e!318422 e!318423)))

(assert (=> b!551743 (= c!63993 (validKeyInArray!0 (select (arr!16695 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!551744 () Bool)

(declare-fun contains!2840 (List!10775 (_ BitVec 64)) Bool)

(assert (=> b!551744 (= e!318424 (contains!2840 Nil!10772 (select (arr!16695 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83041 () Bool)

(declare-fun res!344425 () Bool)

(assert (=> d!83041 (=> res!344425 e!318421)))

(assert (=> d!83041 (= res!344425 (bvsge #b00000000000000000000000000000000 (size!17059 a!3118)))))

(assert (=> d!83041 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10772) e!318421)))

(declare-fun b!551741 () Bool)

(assert (=> b!551741 (= e!318423 call!32304)))

(assert (= (and d!83041 (not res!344425)) b!551740))

(assert (= (and b!551740 res!344424) b!551744))

(assert (= (and b!551740 res!344423) b!551743))

(assert (= (and b!551743 c!63993) b!551742))

(assert (= (and b!551743 (not c!63993)) b!551741))

(assert (= (or b!551742 b!551741) bm!32301))

(assert (=> b!551740 m!528631))

(assert (=> b!551740 m!528631))

(assert (=> b!551740 m!528633))

(assert (=> bm!32301 m!528631))

(declare-fun m!528727 () Bool)

(assert (=> bm!32301 m!528727))

(assert (=> b!551743 m!528631))

(assert (=> b!551743 m!528631))

(assert (=> b!551743 m!528633))

(assert (=> b!551744 m!528631))

(assert (=> b!551744 m!528631))

(declare-fun m!528729 () Bool)

(assert (=> b!551744 m!528729))

(assert (=> b!551514 d!83041))

(declare-fun b!551802 () Bool)

(declare-fun e!318465 () Bool)

(declare-fun lt!250950 () SeekEntryResult!5144)

(assert (=> b!551802 (= e!318465 (bvsge (x!51734 lt!250950) #b01111111111111111111111111111110))))

(declare-fun b!551803 () Bool)

(assert (=> b!551803 (and (bvsge (index!22805 lt!250950) #b00000000000000000000000000000000) (bvslt (index!22805 lt!250950) (size!17059 a!3118)))))

(declare-fun res!344450 () Bool)

(assert (=> b!551803 (= res!344450 (= (select (arr!16695 a!3118) (index!22805 lt!250950)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318464 () Bool)

(assert (=> b!551803 (=> res!344450 e!318464)))

(declare-fun b!551804 () Bool)

(assert (=> b!551804 (and (bvsge (index!22805 lt!250950) #b00000000000000000000000000000000) (bvslt (index!22805 lt!250950) (size!17059 a!3118)))))

(assert (=> b!551804 (= e!318464 (= (select (arr!16695 a!3118) (index!22805 lt!250950)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!551805 () Bool)

(declare-fun e!318462 () Bool)

(assert (=> b!551805 (= e!318465 e!318462)))

(declare-fun res!344451 () Bool)

(assert (=> b!551805 (= res!344451 (and (is-Intermediate!5144 lt!250950) (not (undefined!5956 lt!250950)) (bvslt (x!51734 lt!250950) #b01111111111111111111111111111110) (bvsge (x!51734 lt!250950) #b00000000000000000000000000000000) (bvsge (x!51734 lt!250950) #b00000000000000000000000000000000)))))

(assert (=> b!551805 (=> (not res!344451) (not e!318462))))

(declare-fun e!318463 () SeekEntryResult!5144)

(declare-fun b!551806 () Bool)

(assert (=> b!551806 (= e!318463 (Intermediate!5144 false (toIndex!0 (select (arr!16695 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun e!318461 () SeekEntryResult!5144)

(declare-fun b!551807 () Bool)

(assert (=> b!551807 (= e!318461 (Intermediate!5144 true (toIndex!0 (select (arr!16695 a!3118) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551808 () Bool)

(assert (=> b!551808 (and (bvsge (index!22805 lt!250950) #b00000000000000000000000000000000) (bvslt (index!22805 lt!250950) (size!17059 a!3118)))))

(declare-fun res!344449 () Bool)

(assert (=> b!551808 (= res!344449 (= (select (arr!16695 a!3118) (index!22805 lt!250950)) (select (arr!16695 a!3118) j!142)))))

(assert (=> b!551808 (=> res!344449 e!318464)))

(assert (=> b!551808 (= e!318462 e!318464)))

(declare-fun b!551809 () Bool)

(assert (=> b!551809 (= e!318461 e!318463)))

(declare-fun c!64011 () Bool)

(declare-fun lt!250949 () (_ BitVec 64))

(assert (=> b!551809 (= c!64011 (or (= lt!250949 (select (arr!16695 a!3118) j!142)) (= (bvadd lt!250949 lt!250949) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!551810 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!551810 (= e!318463 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16695 a!3118) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (arr!16695 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!83057 () Bool)

(assert (=> d!83057 e!318465))

(declare-fun c!64013 () Bool)

(assert (=> d!83057 (= c!64013 (and (is-Intermediate!5144 lt!250950) (undefined!5956 lt!250950)))))

(assert (=> d!83057 (= lt!250950 e!318461)))

(declare-fun c!64012 () Bool)

(assert (=> d!83057 (= c!64012 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83057 (= lt!250949 (select (arr!16695 a!3118) (toIndex!0 (select (arr!16695 a!3118) j!142) mask!3119)))))

(assert (=> d!83057 (validMask!0 mask!3119)))

(assert (=> d!83057 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16695 a!3118) j!142) mask!3119) (select (arr!16695 a!3118) j!142) a!3118 mask!3119) lt!250950)))

(assert (= (and d!83057 c!64012) b!551807))

(assert (= (and d!83057 (not c!64012)) b!551809))

(assert (= (and b!551809 c!64011) b!551806))

(assert (= (and b!551809 (not c!64011)) b!551810))

(assert (= (and d!83057 c!64013) b!551802))

(assert (= (and d!83057 (not c!64013)) b!551805))

(assert (= (and b!551805 res!344451) b!551808))

(assert (= (and b!551808 (not res!344449)) b!551803))

(assert (= (and b!551803 (not res!344450)) b!551804))

(assert (=> b!551810 m!528537))

(declare-fun m!528751 () Bool)

(assert (=> b!551810 m!528751))

(assert (=> b!551810 m!528751))

(assert (=> b!551810 m!528523))

(declare-fun m!528753 () Bool)

(assert (=> b!551810 m!528753))

(declare-fun m!528755 () Bool)

(assert (=> b!551804 m!528755))

(assert (=> d!83057 m!528537))

(declare-fun m!528757 () Bool)

(assert (=> d!83057 m!528757))

(assert (=> d!83057 m!528513))

(assert (=> b!551803 m!528755))

(assert (=> b!551808 m!528755))

(assert (=> b!551519 d!83057))

(declare-fun d!83067 () Bool)

(declare-fun lt!250958 () (_ BitVec 32))

(declare-fun lt!250957 () (_ BitVec 32))

(assert (=> d!83067 (= lt!250958 (bvmul (bvxor lt!250957 (bvlshr lt!250957 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83067 (= lt!250957 ((_ extract 31 0) (bvand (bvxor (select (arr!16695 a!3118) j!142) (bvlshr (select (arr!16695 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83067 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344455 (let ((h!11754 ((_ extract 31 0) (bvand (bvxor (select (arr!16695 a!3118) j!142) (bvlshr (select (arr!16695 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51741 (bvmul (bvxor h!11754 (bvlshr h!11754 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51741 (bvlshr x!51741 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344455 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344455 #b00000000000000000000000000000000))))))

(assert (=> d!83067 (= (toIndex!0 (select (arr!16695 a!3118) j!142) mask!3119) (bvand (bvxor lt!250958 (bvlshr lt!250958 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!551519 d!83067))

(declare-fun b!551820 () Bool)

(declare-fun e!318475 () Bool)

(declare-fun lt!250964 () SeekEntryResult!5144)

(assert (=> b!551820 (= e!318475 (bvsge (x!51734 lt!250964) #b01111111111111111111111111111110))))

(declare-fun b!551821 () Bool)

(assert (=> b!551821 (and (bvsge (index!22805 lt!250964) #b00000000000000000000000000000000) (bvslt (index!22805 lt!250964) (size!17059 (array!34766 (store (arr!16695 a!3118) i!1132 k!1914) (size!17059 a!3118)))))))

(declare-fun res!344458 () Bool)

(assert (=> b!551821 (= res!344458 (= (select (arr!16695 (array!34766 (store (arr!16695 a!3118) i!1132 k!1914) (size!17059 a!3118))) (index!22805 lt!250964)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318474 () Bool)

(assert (=> b!551821 (=> res!344458 e!318474)))

(declare-fun b!551822 () Bool)

(assert (=> b!551822 (and (bvsge (index!22805 lt!250964) #b00000000000000000000000000000000) (bvslt (index!22805 lt!250964) (size!17059 (array!34766 (store (arr!16695 a!3118) i!1132 k!1914) (size!17059 a!3118)))))))

(assert (=> b!551822 (= e!318474 (= (select (arr!16695 (array!34766 (store (arr!16695 a!3118) i!1132 k!1914) (size!17059 a!3118))) (index!22805 lt!250964)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!551823 () Bool)

(declare-fun e!318472 () Bool)

(assert (=> b!551823 (= e!318475 e!318472)))

(declare-fun res!344459 () Bool)

(assert (=> b!551823 (= res!344459 (and (is-Intermediate!5144 lt!250964) (not (undefined!5956 lt!250964)) (bvslt (x!51734 lt!250964) #b01111111111111111111111111111110) (bvsge (x!51734 lt!250964) #b00000000000000000000000000000000) (bvsge (x!51734 lt!250964) #b00000000000000000000000000000000)))))

(assert (=> b!551823 (=> (not res!344459) (not e!318472))))

(declare-fun e!318473 () SeekEntryResult!5144)

(declare-fun b!551824 () Bool)

(assert (=> b!551824 (= e!318473 (Intermediate!5144 false (toIndex!0 (select (store (arr!16695 a!3118) i!1132 k!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551825 () Bool)

(declare-fun e!318471 () SeekEntryResult!5144)

(assert (=> b!551825 (= e!318471 (Intermediate!5144 true (toIndex!0 (select (store (arr!16695 a!3118) i!1132 k!1914) j!142) mask!3119) #b00000000000000000000000000000000))))

(declare-fun b!551826 () Bool)

(assert (=> b!551826 (and (bvsge (index!22805 lt!250964) #b00000000000000000000000000000000) (bvslt (index!22805 lt!250964) (size!17059 (array!34766 (store (arr!16695 a!3118) i!1132 k!1914) (size!17059 a!3118)))))))

(declare-fun res!344457 () Bool)

(assert (=> b!551826 (= res!344457 (= (select (arr!16695 (array!34766 (store (arr!16695 a!3118) i!1132 k!1914) (size!17059 a!3118))) (index!22805 lt!250964)) (select (store (arr!16695 a!3118) i!1132 k!1914) j!142)))))

(assert (=> b!551826 (=> res!344457 e!318474)))

(assert (=> b!551826 (= e!318472 e!318474)))

(declare-fun b!551827 () Bool)

(assert (=> b!551827 (= e!318471 e!318473)))

(declare-fun lt!250963 () (_ BitVec 64))

(declare-fun c!64017 () Bool)

(assert (=> b!551827 (= c!64017 (or (= lt!250963 (select (store (arr!16695 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!250963 lt!250963) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!551828 () Bool)

(assert (=> b!551828 (= e!318473 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!16695 a!3118) i!1132 k!1914) j!142) mask!3119) #b00000000000000000000000000000000 mask!3119) (select (store (arr!16695 a!3118) i!1132 k!1914) j!142) (array!34766 (store (arr!16695 a!3118) i!1132 k!1914) (size!17059 a!3118)) mask!3119))))

(declare-fun d!83071 () Bool)

(assert (=> d!83071 e!318475))

(declare-fun c!64019 () Bool)

(assert (=> d!83071 (= c!64019 (and (is-Intermediate!5144 lt!250964) (undefined!5956 lt!250964)))))

(assert (=> d!83071 (= lt!250964 e!318471)))

(declare-fun c!64018 () Bool)

(assert (=> d!83071 (= c!64018 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83071 (= lt!250963 (select (arr!16695 (array!34766 (store (arr!16695 a!3118) i!1132 k!1914) (size!17059 a!3118))) (toIndex!0 (select (store (arr!16695 a!3118) i!1132 k!1914) j!142) mask!3119)))))

(assert (=> d!83071 (validMask!0 mask!3119)))

(assert (=> d!83071 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16695 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!16695 a!3118) i!1132 k!1914) j!142) (array!34766 (store (arr!16695 a!3118) i!1132 k!1914) (size!17059 a!3118)) mask!3119) lt!250964)))

(assert (= (and d!83071 c!64018) b!551825))

(assert (= (and d!83071 (not c!64018)) b!551827))

(assert (= (and b!551827 c!64017) b!551824))

(assert (= (and b!551827 (not c!64017)) b!551828))

(assert (= (and d!83071 c!64019) b!551820))

(assert (= (and d!83071 (not c!64019)) b!551823))

(assert (= (and b!551823 res!344459) b!551826))

(assert (= (and b!551826 (not res!344457)) b!551821))

(assert (= (and b!551821 (not res!344458)) b!551822))

(assert (=> b!551828 m!528541))

(declare-fun m!528767 () Bool)

(assert (=> b!551828 m!528767))

(assert (=> b!551828 m!528767))

(assert (=> b!551828 m!528539))

(declare-fun m!528769 () Bool)

(assert (=> b!551828 m!528769))

(declare-fun m!528771 () Bool)

(assert (=> b!551822 m!528771))

(assert (=> d!83071 m!528541))

(declare-fun m!528773 () Bool)

(assert (=> d!83071 m!528773))

(assert (=> d!83071 m!528513))

(assert (=> b!551821 m!528771))

(assert (=> b!551826 m!528771))

(assert (=> b!551519 d!83071))

(declare-fun d!83075 () Bool)

(declare-fun lt!250970 () (_ BitVec 32))

(declare-fun lt!250969 () (_ BitVec 32))

(assert (=> d!83075 (= lt!250970 (bvmul (bvxor lt!250969 (bvlshr lt!250969 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83075 (= lt!250969 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16695 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16695 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83075 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!344455 (let ((h!11754 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16695 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16695 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!51741 (bvmul (bvxor h!11754 (bvlshr h!11754 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!51741 (bvlshr x!51741 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!344455 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!344455 #b00000000000000000000000000000000))))))

(assert (=> d!83075 (= (toIndex!0 (select (store (arr!16695 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!250970 (bvlshr lt!250970 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!551519 d!83075))

(declare-fun d!83077 () Bool)

(assert (=> d!83077 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!50426 d!83077))

(declare-fun d!83083 () Bool)

(assert (=> d!83083 (= (array_inv!12491 a!3118) (bvsge (size!17059 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!50426 d!83083))

(declare-fun d!83085 () Bool)

(declare-fun res!344467 () Bool)

(declare-fun e!318485 () Bool)

(assert (=> d!83085 (=> res!344467 e!318485)))

(assert (=> d!83085 (= res!344467 (= (select (arr!16695 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!83085 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!318485)))

(declare-fun b!551842 () Bool)

(declare-fun e!318486 () Bool)

(assert (=> b!551842 (= e!318485 e!318486)))

(declare-fun res!344468 () Bool)

(assert (=> b!551842 (=> (not res!344468) (not e!318486))))

(assert (=> b!551842 (= res!344468 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17059 a!3118)))))

(declare-fun b!551843 () Bool)

(assert (=> b!551843 (= e!318486 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83085 (not res!344467)) b!551842))

(assert (= (and b!551842 res!344468) b!551843))

(assert (=> d!83085 m!528631))

(declare-fun m!528783 () Bool)

(assert (=> b!551843 m!528783))

(assert (=> b!551513 d!83085))

(declare-fun d!83087 () Bool)

(assert (=> d!83087 (= (validKeyInArray!0 (select (arr!16695 a!3118) j!142)) (and (not (= (select (arr!16695 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16695 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!551518 d!83087))

(declare-fun d!83089 () Bool)

(assert (=> d!83089 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!551517 d!83089))

(declare-fun b!551845 () Bool)

(declare-fun c!64023 () Bool)

(declare-fun lt!250975 () (_ BitVec 64))

(assert (=> b!551845 (= c!64023 (= lt!250975 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!318487 () SeekEntryResult!5144)

(declare-fun e!318489 () SeekEntryResult!5144)

(assert (=> b!551845 (= e!318487 e!318489)))

(declare-fun b!551846 () Bool)

(declare-fun e!318488 () SeekEntryResult!5144)

(assert (=> b!551846 (= e!318488 Undefined!5144)))

(declare-fun b!551847 () Bool)

(declare-fun lt!250974 () SeekEntryResult!5144)

(assert (=> b!551847 (= e!318489 (MissingZero!5144 (index!22805 lt!250974)))))

(declare-fun b!551848 () Bool)

(assert (=> b!551848 (= e!318488 e!318487)))

(assert (=> b!551848 (= lt!250975 (select (arr!16695 a!3118) (index!22805 lt!250974)))))

(declare-fun c!64025 () Bool)

(assert (=> b!551848 (= c!64025 (= lt!250975 (select (arr!16695 a!3118) j!142)))))

(declare-fun b!551849 () Bool)

(assert (=> b!551849 (= e!318487 (Found!5144 (index!22805 lt!250974)))))

(declare-fun d!83091 () Bool)

(declare-fun lt!250973 () SeekEntryResult!5144)

(assert (=> d!83091 (and (or (is-Undefined!5144 lt!250973) (not (is-Found!5144 lt!250973)) (and (bvsge (index!22804 lt!250973) #b00000000000000000000000000000000) (bvslt (index!22804 lt!250973) (size!17059 a!3118)))) (or (is-Undefined!5144 lt!250973) (is-Found!5144 lt!250973) (not (is-MissingZero!5144 lt!250973)) (and (bvsge (index!22803 lt!250973) #b00000000000000000000000000000000) (bvslt (index!22803 lt!250973) (size!17059 a!3118)))) (or (is-Undefined!5144 lt!250973) (is-Found!5144 lt!250973) (is-MissingZero!5144 lt!250973) (not (is-MissingVacant!5144 lt!250973)) (and (bvsge (index!22806 lt!250973) #b00000000000000000000000000000000) (bvslt (index!22806 lt!250973) (size!17059 a!3118)))) (or (is-Undefined!5144 lt!250973) (ite (is-Found!5144 lt!250973) (= (select (arr!16695 a!3118) (index!22804 lt!250973)) (select (arr!16695 a!3118) j!142)) (ite (is-MissingZero!5144 lt!250973) (= (select (arr!16695 a!3118) (index!22803 lt!250973)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5144 lt!250973) (= (select (arr!16695 a!3118) (index!22806 lt!250973)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83091 (= lt!250973 e!318488)))

(declare-fun c!64024 () Bool)

(assert (=> d!83091 (= c!64024 (and (is-Intermediate!5144 lt!250974) (undefined!5956 lt!250974)))))

(assert (=> d!83091 (= lt!250974 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16695 a!3118) j!142) mask!3119) (select (arr!16695 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83091 (validMask!0 mask!3119)))

(assert (=> d!83091 (= (seekEntryOrOpen!0 (select (arr!16695 a!3118) j!142) a!3118 mask!3119) lt!250973)))

(declare-fun b!551844 () Bool)

(assert (=> b!551844 (= e!318489 (seekKeyOrZeroReturnVacant!0 (x!51734 lt!250974) (index!22805 lt!250974) (index!22805 lt!250974) (select (arr!16695 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!83091 c!64024) b!551846))

(assert (= (and d!83091 (not c!64024)) b!551848))

(assert (= (and b!551848 c!64025) b!551849))

(assert (= (and b!551848 (not c!64025)) b!551845))

(assert (= (and b!551845 c!64023) b!551847))

(assert (= (and b!551845 (not c!64023)) b!551844))

(declare-fun m!528785 () Bool)

(assert (=> b!551848 m!528785))

(declare-fun m!528787 () Bool)

(assert (=> d!83091 m!528787))

(assert (=> d!83091 m!528523))

(assert (=> d!83091 m!528537))

(assert (=> d!83091 m!528513))

(assert (=> d!83091 m!528537))

(assert (=> d!83091 m!528523))

(assert (=> d!83091 m!528545))

(declare-fun m!528789 () Bool)

(assert (=> d!83091 m!528789))

(declare-fun m!528791 () Bool)

(assert (=> d!83091 m!528791))

(assert (=> b!551844 m!528523))

(declare-fun m!528793 () Bool)

(assert (=> b!551844 m!528793))

(assert (=> b!551522 d!83091))

(push 1)

