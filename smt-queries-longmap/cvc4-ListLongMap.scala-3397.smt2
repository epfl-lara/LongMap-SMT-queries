; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46918 () Bool)

(assert start!46918)

(declare-fun b!517612 () Bool)

(declare-fun res!316814 () Bool)

(declare-fun e!302043 () Bool)

(assert (=> b!517612 (=> (not res!316814) (not e!302043))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517612 (= res!316814 (validKeyInArray!0 k!2280))))

(declare-fun b!517613 () Bool)

(declare-fun res!316812 () Bool)

(declare-fun e!302044 () Bool)

(assert (=> b!517613 (=> res!316812 e!302044)))

(declare-datatypes ((SeekEntryResult!4390 0))(
  ( (MissingZero!4390 (index!19748 (_ BitVec 32))) (Found!4390 (index!19749 (_ BitVec 32))) (Intermediate!4390 (undefined!5202 Bool) (index!19750 (_ BitVec 32)) (x!48709 (_ BitVec 32))) (Undefined!4390) (MissingVacant!4390 (index!19751 (_ BitVec 32))) )
))
(declare-fun lt!236945 () SeekEntryResult!4390)

(assert (=> b!517613 (= res!316812 (or (undefined!5202 lt!236945) (not (is-Intermediate!4390 lt!236945))))))

(declare-fun b!517614 () Bool)

(declare-fun e!302045 () Bool)

(assert (=> b!517614 (= e!302043 e!302045)))

(declare-fun res!316815 () Bool)

(assert (=> b!517614 (=> (not res!316815) (not e!302045))))

(declare-fun lt!236947 () SeekEntryResult!4390)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!517614 (= res!316815 (or (= lt!236947 (MissingZero!4390 i!1204)) (= lt!236947 (MissingVacant!4390 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33116 0))(
  ( (array!33117 (arr!15923 (Array (_ BitVec 32) (_ BitVec 64))) (size!16287 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33116)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33116 (_ BitVec 32)) SeekEntryResult!4390)

(assert (=> b!517614 (= lt!236947 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!316817 () Bool)

(assert (=> start!46918 (=> (not res!316817) (not e!302043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46918 (= res!316817 (validMask!0 mask!3524))))

(assert (=> start!46918 e!302043))

(assert (=> start!46918 true))

(declare-fun array_inv!11719 (array!33116) Bool)

(assert (=> start!46918 (array_inv!11719 a!3235)))

(declare-fun lt!236944 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!517615 () Bool)

(assert (=> b!517615 (= e!302044 (or (not (= (select (arr!15923 a!3235) (index!19750 lt!236945)) (select (arr!15923 a!3235) j!176))) (bvsgt (x!48709 lt!236945) #b01111111111111111111111111111110) (bvsgt #b00000000000000000000000000000000 (x!48709 lt!236945)) (bvslt lt!236944 #b00000000000000000000000000000000) (bvsge lt!236944 (size!16287 a!3235)) (and (bvsge (index!19750 lt!236945) #b00000000000000000000000000000000) (bvslt (index!19750 lt!236945) (size!16287 a!3235)))))))

(assert (=> b!517615 (and (bvslt (x!48709 lt!236945) #b01111111111111111111111111111110) (or (= (select (arr!15923 a!3235) (index!19750 lt!236945)) (select (arr!15923 a!3235) j!176)) (= (select (arr!15923 a!3235) (index!19750 lt!236945)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15923 a!3235) (index!19750 lt!236945)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517616 () Bool)

(declare-fun e!302046 () Bool)

(assert (=> b!517616 (= e!302046 (= (seekEntryOrOpen!0 (select (arr!15923 a!3235) j!176) a!3235 mask!3524) (Found!4390 j!176)))))

(declare-fun b!517617 () Bool)

(declare-fun res!316811 () Bool)

(assert (=> b!517617 (=> (not res!316811) (not e!302043))))

(declare-fun arrayContainsKey!0 (array!33116 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517617 (= res!316811 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!517618 () Bool)

(declare-fun res!316818 () Bool)

(assert (=> b!517618 (=> (not res!316818) (not e!302045))))

(declare-datatypes ((List!10081 0))(
  ( (Nil!10078) (Cons!10077 (h!10981 (_ BitVec 64)) (t!16309 List!10081)) )
))
(declare-fun arrayNoDuplicates!0 (array!33116 (_ BitVec 32) List!10081) Bool)

(assert (=> b!517618 (= res!316818 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10078))))

(declare-fun b!517619 () Bool)

(declare-fun res!316816 () Bool)

(assert (=> b!517619 (=> (not res!316816) (not e!302043))))

(assert (=> b!517619 (= res!316816 (and (= (size!16287 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16287 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16287 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!517620 () Bool)

(declare-fun res!316813 () Bool)

(assert (=> b!517620 (=> (not res!316813) (not e!302043))))

(assert (=> b!517620 (= res!316813 (validKeyInArray!0 (select (arr!15923 a!3235) j!176)))))

(declare-fun b!517621 () Bool)

(declare-fun res!316819 () Bool)

(assert (=> b!517621 (=> (not res!316819) (not e!302045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33116 (_ BitVec 32)) Bool)

(assert (=> b!517621 (= res!316819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!517622 () Bool)

(assert (=> b!517622 (= e!302045 (not e!302044))))

(declare-fun res!316810 () Bool)

(assert (=> b!517622 (=> res!316810 e!302044)))

(declare-fun lt!236946 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33116 (_ BitVec 32)) SeekEntryResult!4390)

(assert (=> b!517622 (= res!316810 (= lt!236945 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236946 (select (store (arr!15923 a!3235) i!1204 k!2280) j!176) (array!33117 (store (arr!15923 a!3235) i!1204 k!2280) (size!16287 a!3235)) mask!3524)))))

(assert (=> b!517622 (= lt!236945 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236944 (select (arr!15923 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517622 (= lt!236946 (toIndex!0 (select (store (arr!15923 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!517622 (= lt!236944 (toIndex!0 (select (arr!15923 a!3235) j!176) mask!3524))))

(assert (=> b!517622 e!302046))

(declare-fun res!316820 () Bool)

(assert (=> b!517622 (=> (not res!316820) (not e!302046))))

(assert (=> b!517622 (= res!316820 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16038 0))(
  ( (Unit!16039) )
))
(declare-fun lt!236943 () Unit!16038)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16038)

(assert (=> b!517622 (= lt!236943 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46918 res!316817) b!517619))

(assert (= (and b!517619 res!316816) b!517620))

(assert (= (and b!517620 res!316813) b!517612))

(assert (= (and b!517612 res!316814) b!517617))

(assert (= (and b!517617 res!316811) b!517614))

(assert (= (and b!517614 res!316815) b!517621))

(assert (= (and b!517621 res!316819) b!517618))

(assert (= (and b!517618 res!316818) b!517622))

(assert (= (and b!517622 res!316820) b!517616))

(assert (= (and b!517622 (not res!316810)) b!517613))

(assert (= (and b!517613 (not res!316812)) b!517615))

(declare-fun m!499015 () Bool)

(assert (=> b!517618 m!499015))

(declare-fun m!499017 () Bool)

(assert (=> b!517614 m!499017))

(declare-fun m!499019 () Bool)

(assert (=> b!517622 m!499019))

(declare-fun m!499021 () Bool)

(assert (=> b!517622 m!499021))

(declare-fun m!499023 () Bool)

(assert (=> b!517622 m!499023))

(declare-fun m!499025 () Bool)

(assert (=> b!517622 m!499025))

(assert (=> b!517622 m!499023))

(declare-fun m!499027 () Bool)

(assert (=> b!517622 m!499027))

(assert (=> b!517622 m!499023))

(declare-fun m!499029 () Bool)

(assert (=> b!517622 m!499029))

(assert (=> b!517622 m!499021))

(declare-fun m!499031 () Bool)

(assert (=> b!517622 m!499031))

(declare-fun m!499033 () Bool)

(assert (=> b!517622 m!499033))

(assert (=> b!517622 m!499021))

(declare-fun m!499035 () Bool)

(assert (=> b!517622 m!499035))

(declare-fun m!499037 () Bool)

(assert (=> b!517617 m!499037))

(declare-fun m!499039 () Bool)

(assert (=> b!517612 m!499039))

(declare-fun m!499041 () Bool)

(assert (=> b!517615 m!499041))

(assert (=> b!517615 m!499023))

(declare-fun m!499043 () Bool)

(assert (=> start!46918 m!499043))

(declare-fun m!499045 () Bool)

(assert (=> start!46918 m!499045))

(assert (=> b!517616 m!499023))

(assert (=> b!517616 m!499023))

(declare-fun m!499047 () Bool)

(assert (=> b!517616 m!499047))

(assert (=> b!517620 m!499023))

(assert (=> b!517620 m!499023))

(declare-fun m!499049 () Bool)

(assert (=> b!517620 m!499049))

(declare-fun m!499051 () Bool)

(assert (=> b!517621 m!499051))

(push 1)

(assert (not b!517617))

(assert (not b!517616))

(assert (not b!517620))

(assert (not start!46918))

(assert (not b!517612))

(assert (not b!517614))

(assert (not b!517621))

(assert (not b!517622))

(assert (not b!517618))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79767 () Bool)

(assert (=> d!79767 (= (validKeyInArray!0 (select (arr!15923 a!3235) j!176)) (and (not (= (select (arr!15923 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15923 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!517620 d!79767))

(declare-fun b!517664 () Bool)

(declare-fun e!302074 () Bool)

(declare-fun call!31688 () Bool)

(assert (=> b!517664 (= e!302074 call!31688)))

(declare-fun bm!31685 () Bool)

(assert (=> bm!31685 (= call!31688 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!517665 () Bool)

(declare-fun e!302076 () Bool)

(assert (=> b!517665 (= e!302076 call!31688)))

(declare-fun d!79771 () Bool)

(declare-fun res!316835 () Bool)

(declare-fun e!302075 () Bool)

(assert (=> d!79771 (=> res!316835 e!302075)))

(assert (=> d!79771 (= res!316835 (bvsge #b00000000000000000000000000000000 (size!16287 a!3235)))))

(assert (=> d!79771 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!302075)))

(declare-fun b!517666 () Bool)

(assert (=> b!517666 (= e!302075 e!302076)))

(declare-fun c!60707 () Bool)

(assert (=> b!517666 (= c!60707 (validKeyInArray!0 (select (arr!15923 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!517667 () Bool)

(assert (=> b!517667 (= e!302076 e!302074)))

(declare-fun lt!236964 () (_ BitVec 64))

(assert (=> b!517667 (= lt!236964 (select (arr!15923 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!236963 () Unit!16038)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33116 (_ BitVec 64) (_ BitVec 32)) Unit!16038)

(assert (=> b!517667 (= lt!236963 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236964 #b00000000000000000000000000000000))))

(assert (=> b!517667 (arrayContainsKey!0 a!3235 lt!236964 #b00000000000000000000000000000000)))

(declare-fun lt!236965 () Unit!16038)

(assert (=> b!517667 (= lt!236965 lt!236963)))

(declare-fun res!316834 () Bool)

(assert (=> b!517667 (= res!316834 (= (seekEntryOrOpen!0 (select (arr!15923 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4390 #b00000000000000000000000000000000)))))

(assert (=> b!517667 (=> (not res!316834) (not e!302074))))

(assert (= (and d!79771 (not res!316835)) b!517666))

(assert (= (and b!517666 c!60707) b!517667))

(assert (= (and b!517666 (not c!60707)) b!517665))

(assert (= (and b!517667 res!316834) b!517664))

(assert (= (or b!517664 b!517665) bm!31685))

(declare-fun m!499073 () Bool)

(assert (=> bm!31685 m!499073))

(declare-fun m!499075 () Bool)

(assert (=> b!517666 m!499075))

(assert (=> b!517666 m!499075))

(declare-fun m!499077 () Bool)

(assert (=> b!517666 m!499077))

(assert (=> b!517667 m!499075))

(declare-fun m!499079 () Bool)

(assert (=> b!517667 m!499079))

(declare-fun m!499081 () Bool)

(assert (=> b!517667 m!499081))

(assert (=> b!517667 m!499075))

(declare-fun m!499083 () Bool)

(assert (=> b!517667 m!499083))

(assert (=> b!517621 d!79771))

(declare-fun e!302112 () SeekEntryResult!4390)

(declare-fun b!517714 () Bool)

(declare-fun lt!237000 () SeekEntryResult!4390)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33116 (_ BitVec 32)) SeekEntryResult!4390)

(assert (=> b!517714 (= e!302112 (seekKeyOrZeroReturnVacant!0 (x!48709 lt!237000) (index!19750 lt!237000) (index!19750 lt!237000) (select (arr!15923 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!517715 () Bool)

(assert (=> b!517715 (= e!302112 (MissingZero!4390 (index!19750 lt!237000)))))

(declare-fun d!79777 () Bool)

(declare-fun lt!237001 () SeekEntryResult!4390)

(assert (=> d!79777 (and (or (is-Undefined!4390 lt!237001) (not (is-Found!4390 lt!237001)) (and (bvsge (index!19749 lt!237001) #b00000000000000000000000000000000) (bvslt (index!19749 lt!237001) (size!16287 a!3235)))) (or (is-Undefined!4390 lt!237001) (is-Found!4390 lt!237001) (not (is-MissingZero!4390 lt!237001)) (and (bvsge (index!19748 lt!237001) #b00000000000000000000000000000000) (bvslt (index!19748 lt!237001) (size!16287 a!3235)))) (or (is-Undefined!4390 lt!237001) (is-Found!4390 lt!237001) (is-MissingZero!4390 lt!237001) (not (is-MissingVacant!4390 lt!237001)) (and (bvsge (index!19751 lt!237001) #b00000000000000000000000000000000) (bvslt (index!19751 lt!237001) (size!16287 a!3235)))) (or (is-Undefined!4390 lt!237001) (ite (is-Found!4390 lt!237001) (= (select (arr!15923 a!3235) (index!19749 lt!237001)) (select (arr!15923 a!3235) j!176)) (ite (is-MissingZero!4390 lt!237001) (= (select (arr!15923 a!3235) (index!19748 lt!237001)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4390 lt!237001) (= (select (arr!15923 a!3235) (index!19751 lt!237001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!302111 () SeekEntryResult!4390)

(assert (=> d!79777 (= lt!237001 e!302111)))

(declare-fun c!60723 () Bool)

(assert (=> d!79777 (= c!60723 (and (is-Intermediate!4390 lt!237000) (undefined!5202 lt!237000)))))

(assert (=> d!79777 (= lt!237000 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15923 a!3235) j!176) mask!3524) (select (arr!15923 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79777 (validMask!0 mask!3524)))

(assert (=> d!79777 (= (seekEntryOrOpen!0 (select (arr!15923 a!3235) j!176) a!3235 mask!3524) lt!237001)))

(declare-fun b!517716 () Bool)

(assert (=> b!517716 (= e!302111 Undefined!4390)))

(declare-fun b!517717 () Bool)

(declare-fun c!60721 () Bool)

(declare-fun lt!236999 () (_ BitVec 64))

(assert (=> b!517717 (= c!60721 (= lt!236999 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302110 () SeekEntryResult!4390)

(assert (=> b!517717 (= e!302110 e!302112)))

(declare-fun b!517718 () Bool)

(assert (=> b!517718 (= e!302111 e!302110)))

(assert (=> b!517718 (= lt!236999 (select (arr!15923 a!3235) (index!19750 lt!237000)))))

(declare-fun c!60722 () Bool)

(assert (=> b!517718 (= c!60722 (= lt!236999 (select (arr!15923 a!3235) j!176)))))

(declare-fun b!517719 () Bool)

(assert (=> b!517719 (= e!302110 (Found!4390 (index!19750 lt!237000)))))

(assert (= (and d!79777 c!60723) b!517716))

(assert (= (and d!79777 (not c!60723)) b!517718))

(assert (= (and b!517718 c!60722) b!517719))

(assert (= (and b!517718 (not c!60722)) b!517717))

(assert (= (and b!517717 c!60721) b!517715))

(assert (= (and b!517717 (not c!60721)) b!517714))

(assert (=> b!517714 m!499023))

(declare-fun m!499113 () Bool)

(assert (=> b!517714 m!499113))

(declare-fun m!499115 () Bool)

(assert (=> d!79777 m!499115))

(assert (=> d!79777 m!499025))

(assert (=> d!79777 m!499023))

(declare-fun m!499117 () Bool)

(assert (=> d!79777 m!499117))

(declare-fun m!499119 () Bool)

(assert (=> d!79777 m!499119))

(assert (=> d!79777 m!499023))

(assert (=> d!79777 m!499025))

(assert (=> d!79777 m!499043))

(declare-fun m!499121 () Bool)

(assert (=> d!79777 m!499121))

(declare-fun m!499123 () Bool)

(assert (=> b!517718 m!499123))

(assert (=> b!517616 d!79777))

(declare-fun b!517775 () Bool)

(declare-fun lt!237024 () SeekEntryResult!4390)

(assert (=> b!517775 (and (bvsge (index!19750 lt!237024) #b00000000000000000000000000000000) (bvslt (index!19750 lt!237024) (size!16287 a!3235)))))

(declare-fun e!302151 () Bool)

(assert (=> b!517775 (= e!302151 (= (select (arr!15923 a!3235) (index!19750 lt!237024)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!517776 () Bool)

(declare-fun e!302147 () SeekEntryResult!4390)

(assert (=> b!517776 (= e!302147 (Intermediate!4390 false lt!236944 #b00000000000000000000000000000000))))

(declare-fun b!517777 () Bool)

(declare-fun e!302150 () SeekEntryResult!4390)

(assert (=> b!517777 (= e!302150 (Intermediate!4390 true lt!236944 #b00000000000000000000000000000000))))

(declare-fun b!517778 () Bool)

(declare-fun e!302149 () Bool)

(declare-fun e!302148 () Bool)

(assert (=> b!517778 (= e!302149 e!302148)))

(declare-fun res!316882 () Bool)

(assert (=> b!517778 (= res!316882 (and (is-Intermediate!4390 lt!237024) (not (undefined!5202 lt!237024)) (bvslt (x!48709 lt!237024) #b01111111111111111111111111111110) (bvsge (x!48709 lt!237024) #b00000000000000000000000000000000) (bvsge (x!48709 lt!237024) #b00000000000000000000000000000000)))))

(assert (=> b!517778 (=> (not res!316882) (not e!302148))))

(declare-fun b!517779 () Bool)

(assert (=> b!517779 (= e!302150 e!302147)))

(declare-fun c!60742 () Bool)

(declare-fun lt!237023 () (_ BitVec 64))

(assert (=> b!517779 (= c!60742 (or (= lt!237023 (select (arr!15923 a!3235) j!176)) (= (bvadd lt!237023 lt!237023) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79797 () Bool)

(assert (=> d!79797 e!302149))

(declare-fun c!60740 () Bool)

(assert (=> d!79797 (= c!60740 (and (is-Intermediate!4390 lt!237024) (undefined!5202 lt!237024)))))

(assert (=> d!79797 (= lt!237024 e!302150)))

(declare-fun c!60741 () Bool)

(assert (=> d!79797 (= c!60741 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79797 (= lt!237023 (select (arr!15923 a!3235) lt!236944))))

(assert (=> d!79797 (validMask!0 mask!3524)))

(assert (=> d!79797 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236944 (select (arr!15923 a!3235) j!176) a!3235 mask!3524) lt!237024)))

(declare-fun b!517780 () Bool)

(assert (=> b!517780 (= e!302149 (bvsge (x!48709 lt!237024) #b01111111111111111111111111111110))))

(declare-fun b!517781 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517781 (= e!302147 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236944 #b00000000000000000000000000000000 mask!3524) (select (arr!15923 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!517782 () Bool)

(assert (=> b!517782 (and (bvsge (index!19750 lt!237024) #b00000000000000000000000000000000) (bvslt (index!19750 lt!237024) (size!16287 a!3235)))))

(declare-fun res!316881 () Bool)

(assert (=> b!517782 (= res!316881 (= (select (arr!15923 a!3235) (index!19750 lt!237024)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517782 (=> res!316881 e!302151)))

(declare-fun b!517783 () Bool)

(assert (=> b!517783 (and (bvsge (index!19750 lt!237024) #b00000000000000000000000000000000) (bvslt (index!19750 lt!237024) (size!16287 a!3235)))))

(declare-fun res!316883 () Bool)

(assert (=> b!517783 (= res!316883 (= (select (arr!15923 a!3235) (index!19750 lt!237024)) (select (arr!15923 a!3235) j!176)))))

(assert (=> b!517783 (=> res!316883 e!302151)))

(assert (=> b!517783 (= e!302148 e!302151)))

(assert (= (and d!79797 c!60741) b!517777))

(assert (= (and d!79797 (not c!60741)) b!517779))

(assert (= (and b!517779 c!60742) b!517776))

(assert (= (and b!517779 (not c!60742)) b!517781))

(assert (= (and d!79797 c!60740) b!517780))

(assert (= (and d!79797 (not c!60740)) b!517778))

(assert (= (and b!517778 res!316882) b!517783))

(assert (= (and b!517783 (not res!316883)) b!517782))

(assert (= (and b!517782 (not res!316881)) b!517775))

(declare-fun m!499141 () Bool)

(assert (=> b!517783 m!499141))

(declare-fun m!499143 () Bool)

(assert (=> b!517781 m!499143))

(assert (=> b!517781 m!499143))

(assert (=> b!517781 m!499023))

(declare-fun m!499145 () Bool)

(assert (=> b!517781 m!499145))

(declare-fun m!499147 () Bool)

(assert (=> d!79797 m!499147))

(assert (=> d!79797 m!499043))

(assert (=> b!517775 m!499141))

(assert (=> b!517782 m!499141))

(assert (=> b!517622 d!79797))

(declare-fun d!79811 () Bool)

(declare-fun lt!237044 () (_ BitVec 32))

(declare-fun lt!237043 () (_ BitVec 32))

(assert (=> d!79811 (= lt!237044 (bvmul (bvxor lt!237043 (bvlshr lt!237043 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79811 (= lt!237043 ((_ extract 31 0) (bvand (bvxor (select (arr!15923 a!3235) j!176) (bvlshr (select (arr!15923 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79811 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316884 (let ((h!10984 ((_ extract 31 0) (bvand (bvxor (select (arr!15923 a!3235) j!176) (bvlshr (select (arr!15923 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48714 (bvmul (bvxor h!10984 (bvlshr h!10984 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48714 (bvlshr x!48714 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316884 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316884 #b00000000000000000000000000000000))))))

(assert (=> d!79811 (= (toIndex!0 (select (arr!15923 a!3235) j!176) mask!3524) (bvand (bvxor lt!237044 (bvlshr lt!237044 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!517622 d!79811))

(declare-fun d!79821 () Bool)

(assert (=> d!79821 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!237049 () Unit!16038)

(declare-fun choose!38 (array!33116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16038)

(assert (=> d!79821 (= lt!237049 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79821 (validMask!0 mask!3524)))

(assert (=> d!79821 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!237049)))

(declare-fun bs!16343 () Bool)

(assert (= bs!16343 d!79821))

(assert (=> bs!16343 m!499029))

(declare-fun m!499179 () Bool)

(assert (=> bs!16343 m!499179))

(assert (=> bs!16343 m!499043))

(assert (=> b!517622 d!79821))

(declare-fun d!79823 () Bool)

(declare-fun lt!237051 () (_ BitVec 32))

(declare-fun lt!237050 () (_ BitVec 32))

(assert (=> d!79823 (= lt!237051 (bvmul (bvxor lt!237050 (bvlshr lt!237050 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79823 (= lt!237050 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15923 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15923 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79823 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316884 (let ((h!10984 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15923 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15923 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48714 (bvmul (bvxor h!10984 (bvlshr h!10984 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48714 (bvlshr x!48714 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316884 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316884 #b00000000000000000000000000000000))))))

(assert (=> d!79823 (= (toIndex!0 (select (store (arr!15923 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!237051 (bvlshr lt!237051 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!517622 d!79823))

(declare-fun b!517826 () Bool)

(declare-fun lt!237053 () SeekEntryResult!4390)

(assert (=> b!517826 (and (bvsge (index!19750 lt!237053) #b00000000000000000000000000000000) (bvslt (index!19750 lt!237053) (size!16287 (array!33117 (store (arr!15923 a!3235) i!1204 k!2280) (size!16287 a!3235)))))))

(declare-fun e!302179 () Bool)

(assert (=> b!517826 (= e!302179 (= (select (arr!15923 (array!33117 (store (arr!15923 a!3235) i!1204 k!2280) (size!16287 a!3235))) (index!19750 lt!237053)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!517827 () Bool)

(declare-fun e!302175 () SeekEntryResult!4390)

(assert (=> b!517827 (= e!302175 (Intermediate!4390 false lt!236946 #b00000000000000000000000000000000))))

(declare-fun b!517828 () Bool)

(declare-fun e!302178 () SeekEntryResult!4390)

(assert (=> b!517828 (= e!302178 (Intermediate!4390 true lt!236946 #b00000000000000000000000000000000))))

(declare-fun b!517829 () Bool)

(declare-fun e!302177 () Bool)

(declare-fun e!302176 () Bool)

(assert (=> b!517829 (= e!302177 e!302176)))

(declare-fun res!316898 () Bool)

(assert (=> b!517829 (= res!316898 (and (is-Intermediate!4390 lt!237053) (not (undefined!5202 lt!237053)) (bvslt (x!48709 lt!237053) #b01111111111111111111111111111110) (bvsge (x!48709 lt!237053) #b00000000000000000000000000000000) (bvsge (x!48709 lt!237053) #b00000000000000000000000000000000)))))

(assert (=> b!517829 (=> (not res!316898) (not e!302176))))

(declare-fun b!517830 () Bool)

(assert (=> b!517830 (= e!302178 e!302175)))

(declare-fun c!60760 () Bool)

(declare-fun lt!237052 () (_ BitVec 64))

(assert (=> b!517830 (= c!60760 (or (= lt!237052 (select (store (arr!15923 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!237052 lt!237052) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79827 () Bool)

(assert (=> d!79827 e!302177))

(declare-fun c!60758 () Bool)

(assert (=> d!79827 (= c!60758 (and (is-Intermediate!4390 lt!237053) (undefined!5202 lt!237053)))))

(assert (=> d!79827 (= lt!237053 e!302178)))

(declare-fun c!60759 () Bool)

(assert (=> d!79827 (= c!60759 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79827 (= lt!237052 (select (arr!15923 (array!33117 (store (arr!15923 a!3235) i!1204 k!2280) (size!16287 a!3235))) lt!236946))))

(assert (=> d!79827 (validMask!0 mask!3524)))

(assert (=> d!79827 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236946 (select (store (arr!15923 a!3235) i!1204 k!2280) j!176) (array!33117 (store (arr!15923 a!3235) i!1204 k!2280) (size!16287 a!3235)) mask!3524) lt!237053)))

(declare-fun b!517831 () Bool)

(assert (=> b!517831 (= e!302177 (bvsge (x!48709 lt!237053) #b01111111111111111111111111111110))))

(declare-fun b!517832 () Bool)

(assert (=> b!517832 (= e!302175 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236946 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15923 a!3235) i!1204 k!2280) j!176) (array!33117 (store (arr!15923 a!3235) i!1204 k!2280) (size!16287 a!3235)) mask!3524))))

(declare-fun b!517833 () Bool)

(assert (=> b!517833 (and (bvsge (index!19750 lt!237053) #b00000000000000000000000000000000) (bvslt (index!19750 lt!237053) (size!16287 (array!33117 (store (arr!15923 a!3235) i!1204 k!2280) (size!16287 a!3235)))))))

(declare-fun res!316897 () Bool)

(assert (=> b!517833 (= res!316897 (= (select (arr!15923 (array!33117 (store (arr!15923 a!3235) i!1204 k!2280) (size!16287 a!3235))) (index!19750 lt!237053)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!517833 (=> res!316897 e!302179)))

(declare-fun b!517834 () Bool)

(assert (=> b!517834 (and (bvsge (index!19750 lt!237053) #b00000000000000000000000000000000) (bvslt (index!19750 lt!237053) (size!16287 (array!33117 (store (arr!15923 a!3235) i!1204 k!2280) (size!16287 a!3235)))))))

(declare-fun res!316899 () Bool)

(assert (=> b!517834 (= res!316899 (= (select (arr!15923 (array!33117 (store (arr!15923 a!3235) i!1204 k!2280) (size!16287 a!3235))) (index!19750 lt!237053)) (select (store (arr!15923 a!3235) i!1204 k!2280) j!176)))))

(assert (=> b!517834 (=> res!316899 e!302179)))

(assert (=> b!517834 (= e!302176 e!302179)))

(assert (= (and d!79827 c!60759) b!517828))

(assert (= (and d!79827 (not c!60759)) b!517830))

(assert (= (and b!517830 c!60760) b!517827))

(assert (= (and b!517830 (not c!60760)) b!517832))

(assert (= (and d!79827 c!60758) b!517831))

(assert (= (and d!79827 (not c!60758)) b!517829))

(assert (= (and b!517829 res!316898) b!517834))

(assert (= (and b!517834 (not res!316899)) b!517833))

(assert (= (and b!517833 (not res!316897)) b!517826))

(declare-fun m!499183 () Bool)

(assert (=> b!517834 m!499183))

(declare-fun m!499185 () Bool)

(assert (=> b!517832 m!499185))

(assert (=> b!517832 m!499185))

(assert (=> b!517832 m!499021))

(declare-fun m!499187 () Bool)

(assert (=> b!517832 m!499187))

(declare-fun m!499189 () Bool)

(assert (=> d!79827 m!499189))

(assert (=> d!79827 m!499043))

(assert (=> b!517826 m!499183))

(assert (=> b!517833 m!499183))

(assert (=> b!517622 d!79827))

(declare-fun b!517835 () Bool)

(declare-fun e!302180 () Bool)

(declare-fun call!31697 () Bool)

(assert (=> b!517835 (= e!302180 call!31697)))

(declare-fun bm!31694 () Bool)

(assert (=> bm!31694 (= call!31697 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!517836 () Bool)

(declare-fun e!302182 () Bool)

(assert (=> b!517836 (= e!302182 call!31697)))

(declare-fun d!79829 () Bool)

(declare-fun res!316901 () Bool)

(declare-fun e!302181 () Bool)

(assert (=> d!79829 (=> res!316901 e!302181)))

(assert (=> d!79829 (= res!316901 (bvsge j!176 (size!16287 a!3235)))))

(assert (=> d!79829 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!302181)))

(declare-fun b!517837 () Bool)

(assert (=> b!517837 (= e!302181 e!302182)))

(declare-fun c!60761 () Bool)

(assert (=> b!517837 (= c!60761 (validKeyInArray!0 (select (arr!15923 a!3235) j!176)))))

(declare-fun b!517838 () Bool)

(assert (=> b!517838 (= e!302182 e!302180)))

(declare-fun lt!237055 () (_ BitVec 64))

(assert (=> b!517838 (= lt!237055 (select (arr!15923 a!3235) j!176))))

(declare-fun lt!237054 () Unit!16038)

(assert (=> b!517838 (= lt!237054 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!237055 j!176))))

(assert (=> b!517838 (arrayContainsKey!0 a!3235 lt!237055 #b00000000000000000000000000000000)))

(declare-fun lt!237056 () Unit!16038)

(assert (=> b!517838 (= lt!237056 lt!237054)))

(declare-fun res!316900 () Bool)

(assert (=> b!517838 (= res!316900 (= (seekEntryOrOpen!0 (select (arr!15923 a!3235) j!176) a!3235 mask!3524) (Found!4390 j!176)))))

(assert (=> b!517838 (=> (not res!316900) (not e!302180))))

(assert (= (and d!79829 (not res!316901)) b!517837))

(assert (= (and b!517837 c!60761) b!517838))

(assert (= (and b!517837 (not c!60761)) b!517836))

(assert (= (and b!517838 res!316900) b!517835))

(assert (= (or b!517835 b!517836) bm!31694))

(declare-fun m!499191 () Bool)

(assert (=> bm!31694 m!499191))

(assert (=> b!517837 m!499023))

(assert (=> b!517837 m!499023))

(assert (=> b!517837 m!499049))

(assert (=> b!517838 m!499023))

(declare-fun m!499193 () Bool)

(assert (=> b!517838 m!499193))

(declare-fun m!499195 () Bool)

(assert (=> b!517838 m!499195))

(assert (=> b!517838 m!499023))

(assert (=> b!517838 m!499047))

(assert (=> b!517622 d!79829))

(declare-fun d!79831 () Bool)

(assert (=> d!79831 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46918 d!79831))

(declare-fun d!79837 () Bool)

(assert (=> d!79837 (= (array_inv!11719 a!3235) (bvsge (size!16287 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46918 d!79837))

(declare-fun d!79839 () Bool)

(declare-fun res!316909 () Bool)

(declare-fun e!302192 () Bool)

(assert (=> d!79839 (=> res!316909 e!302192)))

(assert (=> d!79839 (= res!316909 (= (select (arr!15923 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!79839 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!302192)))

(declare-fun b!517852 () Bool)

(declare-fun e!302193 () Bool)

(assert (=> b!517852 (= e!302192 e!302193)))

(declare-fun res!316910 () Bool)

(assert (=> b!517852 (=> (not res!316910) (not e!302193))))

(assert (=> b!517852 (= res!316910 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16287 a!3235)))))

(declare-fun b!517853 () Bool)

(assert (=> b!517853 (= e!302193 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79839 (not res!316909)) b!517852))

(assert (= (and b!517852 res!316910) b!517853))

(assert (=> d!79839 m!499075))

(declare-fun m!499207 () Bool)

(assert (=> b!517853 m!499207))

(assert (=> b!517617 d!79839))

(declare-fun d!79841 () Bool)

(assert (=> d!79841 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!517612 d!79841))

(declare-fun bm!31697 () Bool)

(declare-fun call!31700 () Bool)

(declare-fun c!60773 () Bool)

(assert (=> bm!31697 (= call!31700 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60773 (Cons!10077 (select (arr!15923 a!3235) #b00000000000000000000000000000000) Nil!10078) Nil!10078)))))

(declare-fun b!517876 () Bool)

(declare-fun e!302210 () Bool)

(assert (=> b!517876 (= e!302210 call!31700)))

(declare-fun b!517877 () Bool)

(declare-fun e!302209 () Bool)

(declare-fun contains!2748 (List!10081 (_ BitVec 64)) Bool)

(assert (=> b!517877 (= e!302209 (contains!2748 Nil!10078 (select (arr!15923 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79843 () Bool)

(declare-fun res!316919 () Bool)

(declare-fun e!302208 () Bool)

(assert (=> d!79843 (=> res!316919 e!302208)))

(assert (=> d!79843 (= res!316919 (bvsge #b00000000000000000000000000000000 (size!16287 a!3235)))))

(assert (=> d!79843 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10078) e!302208)))

(declare-fun b!517878 () Bool)

(assert (=> b!517878 (= e!302210 call!31700)))

(declare-fun b!517879 () Bool)

(declare-fun e!302211 () Bool)

(assert (=> b!517879 (= e!302211 e!302210)))

(assert (=> b!517879 (= c!60773 (validKeyInArray!0 (select (arr!15923 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!517880 () Bool)

(assert (=> b!517880 (= e!302208 e!302211)))

(declare-fun res!316918 () Bool)

(assert (=> b!517880 (=> (not res!316918) (not e!302211))))

(assert (=> b!517880 (= res!316918 (not e!302209))))

(declare-fun res!316917 () Bool)

(assert (=> b!517880 (=> (not res!316917) (not e!302209))))

(assert (=> b!517880 (= res!316917 (validKeyInArray!0 (select (arr!15923 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79843 (not res!316919)) b!517880))

(assert (= (and b!517880 res!316917) b!517877))

(assert (= (and b!517880 res!316918) b!517879))

(assert (= (and b!517879 c!60773) b!517878))

(assert (= (and b!517879 (not c!60773)) b!517876))

(assert (= (or b!517878 b!517876) bm!31697))

(assert (=> bm!31697 m!499075))

(declare-fun m!499209 () Bool)

(assert (=> bm!31697 m!499209))

(assert (=> b!517877 m!499075))

(assert (=> b!517877 m!499075))

(declare-fun m!499211 () Bool)

(assert (=> b!517877 m!499211))

(assert (=> b!517879 m!499075))

(assert (=> b!517879 m!499075))

(assert (=> b!517879 m!499077))

(assert (=> b!517880 m!499075))

(assert (=> b!517880 m!499075))

(assert (=> b!517880 m!499077))

(assert (=> b!517618 d!79843))

(declare-fun b!517881 () Bool)

(declare-fun e!302214 () SeekEntryResult!4390)

(declare-fun lt!237069 () SeekEntryResult!4390)

(assert (=> b!517881 (= e!302214 (seekKeyOrZeroReturnVacant!0 (x!48709 lt!237069) (index!19750 lt!237069) (index!19750 lt!237069) k!2280 a!3235 mask!3524))))

(declare-fun b!517882 () Bool)

(assert (=> b!517882 (= e!302214 (MissingZero!4390 (index!19750 lt!237069)))))

(declare-fun d!79845 () Bool)

(declare-fun lt!237070 () SeekEntryResult!4390)

(assert (=> d!79845 (and (or (is-Undefined!4390 lt!237070) (not (is-Found!4390 lt!237070)) (and (bvsge (index!19749 lt!237070) #b00000000000000000000000000000000) (bvslt (index!19749 lt!237070) (size!16287 a!3235)))) (or (is-Undefined!4390 lt!237070) (is-Found!4390 lt!237070) (not (is-MissingZero!4390 lt!237070)) (and (bvsge (index!19748 lt!237070) #b00000000000000000000000000000000) (bvslt (index!19748 lt!237070) (size!16287 a!3235)))) (or (is-Undefined!4390 lt!237070) (is-Found!4390 lt!237070) (is-MissingZero!4390 lt!237070) (not (is-MissingVacant!4390 lt!237070)) (and (bvsge (index!19751 lt!237070) #b00000000000000000000000000000000) (bvslt (index!19751 lt!237070) (size!16287 a!3235)))) (or (is-Undefined!4390 lt!237070) (ite (is-Found!4390 lt!237070) (= (select (arr!15923 a!3235) (index!19749 lt!237070)) k!2280) (ite (is-MissingZero!4390 lt!237070) (= (select (arr!15923 a!3235) (index!19748 lt!237070)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4390 lt!237070) (= (select (arr!15923 a!3235) (index!19751 lt!237070)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!302213 () SeekEntryResult!4390)

(assert (=> d!79845 (= lt!237070 e!302213)))

(declare-fun c!60776 () Bool)

(assert (=> d!79845 (= c!60776 (and (is-Intermediate!4390 lt!237069) (undefined!5202 lt!237069)))))

(assert (=> d!79845 (= lt!237069 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2280 mask!3524) k!2280 a!3235 mask!3524))))

(assert (=> d!79845 (validMask!0 mask!3524)))

(assert (=> d!79845 (= (seekEntryOrOpen!0 k!2280 a!3235 mask!3524) lt!237070)))

(declare-fun b!517883 () Bool)

(assert (=> b!517883 (= e!302213 Undefined!4390)))

(declare-fun b!517884 () Bool)

(declare-fun c!60774 () Bool)

(declare-fun lt!237068 () (_ BitVec 64))

(assert (=> b!517884 (= c!60774 (= lt!237068 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!302212 () SeekEntryResult!4390)

(assert (=> b!517884 (= e!302212 e!302214)))

(declare-fun b!517885 () Bool)

(assert (=> b!517885 (= e!302213 e!302212)))

(assert (=> b!517885 (= lt!237068 (select (arr!15923 a!3235) (index!19750 lt!237069)))))

(declare-fun c!60775 () Bool)

(assert (=> b!517885 (= c!60775 (= lt!237068 k!2280))))

(declare-fun b!517886 () Bool)

(assert (=> b!517886 (= e!302212 (Found!4390 (index!19750 lt!237069)))))

(assert (= (and d!79845 c!60776) b!517883))

(assert (= (and d!79845 (not c!60776)) b!517885))

(assert (= (and b!517885 c!60775) b!517886))

(assert (= (and b!517885 (not c!60775)) b!517884))

(assert (= (and b!517884 c!60774) b!517882))

(assert (= (and b!517884 (not c!60774)) b!517881))

(declare-fun m!499213 () Bool)

(assert (=> b!517881 m!499213))

(declare-fun m!499215 () Bool)

(assert (=> d!79845 m!499215))

(declare-fun m!499217 () Bool)

(assert (=> d!79845 m!499217))

(declare-fun m!499219 () Bool)

(assert (=> d!79845 m!499219))

(declare-fun m!499221 () Bool)

(assert (=> d!79845 m!499221))

(assert (=> d!79845 m!499217))

(assert (=> d!79845 m!499043))

(declare-fun m!499223 () Bool)

(assert (=> d!79845 m!499223))

(declare-fun m!499225 () Bool)

(assert (=> b!517885 m!499225))

(assert (=> b!517614 d!79845))

(push 1)

(assert (not b!517853))

(assert (not b!517781))

(assert (not bm!31694))

(assert (not d!79845))

(assert (not b!517880))

(assert (not b!517667))

(assert (not b!517832))

(assert (not b!517877))

(assert (not bm!31685))

(assert (not b!517714))

(assert (not d!79777))

(assert (not d!79827))

(assert (not b!517838))

(assert (not b!517837))

(assert (not b!517881))

(assert (not bm!31697))

(assert (not b!517666))

(assert (not d!79821))

(assert (not d!79797))

(assert (not b!517879))

(check-sat)

(pop 1)

(push 1)

(check-sat)

