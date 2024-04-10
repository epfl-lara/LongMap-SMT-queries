; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46348 () Bool)

(assert start!46348)

(declare-fun b!513100 () Bool)

(declare-fun res!313588 () Bool)

(declare-fun e!299619 () Bool)

(assert (=> b!513100 (=> (not res!313588) (not e!299619))))

(declare-datatypes ((array!32945 0))(
  ( (array!32946 (arr!15848 (Array (_ BitVec 32) (_ BitVec 64))) (size!16212 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32945)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32945 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!513100 (= res!313588 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!513101 () Bool)

(declare-fun res!313587 () Bool)

(assert (=> b!513101 (=> (not res!313587) (not e!299619))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!513101 (= res!313587 (and (= (size!16212 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16212 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16212 a!3235)) (not (= i!1204 j!176))))))

(declare-fun e!299618 () Bool)

(declare-fun b!513102 () Bool)

(declare-datatypes ((SeekEntryResult!4315 0))(
  ( (MissingZero!4315 (index!19448 (_ BitVec 32))) (Found!4315 (index!19449 (_ BitVec 32))) (Intermediate!4315 (undefined!5127 Bool) (index!19450 (_ BitVec 32)) (x!48392 (_ BitVec 32))) (Undefined!4315) (MissingVacant!4315 (index!19451 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32945 (_ BitVec 32)) SeekEntryResult!4315)

(assert (=> b!513102 (= e!299618 (= (seekEntryOrOpen!0 (select (arr!15848 a!3235) j!176) a!3235 mask!3524) (Found!4315 j!176)))))

(declare-fun b!513103 () Bool)

(declare-fun res!313586 () Bool)

(declare-fun e!299617 () Bool)

(assert (=> b!513103 (=> (not res!313586) (not e!299617))))

(declare-datatypes ((List!10006 0))(
  ( (Nil!10003) (Cons!10002 (h!10885 (_ BitVec 64)) (t!16234 List!10006)) )
))
(declare-fun arrayNoDuplicates!0 (array!32945 (_ BitVec 32) List!10006) Bool)

(assert (=> b!513103 (= res!313586 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10003))))

(declare-fun b!513104 () Bool)

(declare-fun e!299616 () Bool)

(declare-fun lt!234915 () SeekEntryResult!4315)

(assert (=> b!513104 (= e!299616 (and (bvsge (index!19450 lt!234915) #b00000000000000000000000000000000) (bvslt (index!19450 lt!234915) (size!16212 a!3235))))))

(assert (=> b!513104 (bvslt (x!48392 lt!234915) #b01111111111111111111111111111110)))

(declare-fun b!513105 () Bool)

(declare-fun res!313579 () Bool)

(assert (=> b!513105 (=> (not res!313579) (not e!299619))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!513105 (= res!313579 (validKeyInArray!0 (select (arr!15848 a!3235) j!176)))))

(declare-fun b!513106 () Bool)

(declare-fun res!313589 () Bool)

(assert (=> b!513106 (=> (not res!313589) (not e!299617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32945 (_ BitVec 32)) Bool)

(assert (=> b!513106 (= res!313589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!513107 () Bool)

(declare-fun res!313580 () Bool)

(assert (=> b!513107 (=> res!313580 e!299616)))

(assert (=> b!513107 (= res!313580 (or (undefined!5127 lt!234915) (not (is-Intermediate!4315 lt!234915))))))

(declare-fun b!513108 () Bool)

(assert (=> b!513108 (= e!299619 e!299617)))

(declare-fun res!313582 () Bool)

(assert (=> b!513108 (=> (not res!313582) (not e!299617))))

(declare-fun lt!234918 () SeekEntryResult!4315)

(assert (=> b!513108 (= res!313582 (or (= lt!234918 (MissingZero!4315 i!1204)) (= lt!234918 (MissingVacant!4315 i!1204))))))

(assert (=> b!513108 (= lt!234918 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!313583 () Bool)

(assert (=> start!46348 (=> (not res!313583) (not e!299619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46348 (= res!313583 (validMask!0 mask!3524))))

(assert (=> start!46348 e!299619))

(assert (=> start!46348 true))

(declare-fun array_inv!11644 (array!32945) Bool)

(assert (=> start!46348 (array_inv!11644 a!3235)))

(declare-fun b!513109 () Bool)

(assert (=> b!513109 (= e!299617 (not e!299616))))

(declare-fun res!313585 () Bool)

(assert (=> b!513109 (=> res!313585 e!299616)))

(declare-fun lt!234919 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32945 (_ BitVec 32)) SeekEntryResult!4315)

(assert (=> b!513109 (= res!313585 (= lt!234915 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234919 (select (store (arr!15848 a!3235) i!1204 k!2280) j!176) (array!32946 (store (arr!15848 a!3235) i!1204 k!2280) (size!16212 a!3235)) mask!3524)))))

(declare-fun lt!234916 () (_ BitVec 32))

(assert (=> b!513109 (= lt!234915 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234916 (select (arr!15848 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513109 (= lt!234919 (toIndex!0 (select (store (arr!15848 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!513109 (= lt!234916 (toIndex!0 (select (arr!15848 a!3235) j!176) mask!3524))))

(assert (=> b!513109 e!299618))

(declare-fun res!313584 () Bool)

(assert (=> b!513109 (=> (not res!313584) (not e!299618))))

(assert (=> b!513109 (= res!313584 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15888 0))(
  ( (Unit!15889) )
))
(declare-fun lt!234917 () Unit!15888)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15888)

(assert (=> b!513109 (= lt!234917 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!513110 () Bool)

(declare-fun res!313581 () Bool)

(assert (=> b!513110 (=> (not res!313581) (not e!299619))))

(assert (=> b!513110 (= res!313581 (validKeyInArray!0 k!2280))))

(assert (= (and start!46348 res!313583) b!513101))

(assert (= (and b!513101 res!313587) b!513105))

(assert (= (and b!513105 res!313579) b!513110))

(assert (= (and b!513110 res!313581) b!513100))

(assert (= (and b!513100 res!313588) b!513108))

(assert (= (and b!513108 res!313582) b!513106))

(assert (= (and b!513106 res!313589) b!513103))

(assert (= (and b!513103 res!313586) b!513109))

(assert (= (and b!513109 res!313584) b!513102))

(assert (= (and b!513109 (not res!313585)) b!513107))

(assert (= (and b!513107 (not res!313580)) b!513104))

(declare-fun m!494745 () Bool)

(assert (=> b!513106 m!494745))

(declare-fun m!494747 () Bool)

(assert (=> b!513110 m!494747))

(declare-fun m!494749 () Bool)

(assert (=> b!513105 m!494749))

(assert (=> b!513105 m!494749))

(declare-fun m!494751 () Bool)

(assert (=> b!513105 m!494751))

(declare-fun m!494753 () Bool)

(assert (=> start!46348 m!494753))

(declare-fun m!494755 () Bool)

(assert (=> start!46348 m!494755))

(declare-fun m!494757 () Bool)

(assert (=> b!513100 m!494757))

(assert (=> b!513102 m!494749))

(assert (=> b!513102 m!494749))

(declare-fun m!494759 () Bool)

(assert (=> b!513102 m!494759))

(declare-fun m!494761 () Bool)

(assert (=> b!513103 m!494761))

(declare-fun m!494763 () Bool)

(assert (=> b!513108 m!494763))

(declare-fun m!494765 () Bool)

(assert (=> b!513109 m!494765))

(declare-fun m!494767 () Bool)

(assert (=> b!513109 m!494767))

(declare-fun m!494769 () Bool)

(assert (=> b!513109 m!494769))

(assert (=> b!513109 m!494749))

(declare-fun m!494771 () Bool)

(assert (=> b!513109 m!494771))

(assert (=> b!513109 m!494749))

(declare-fun m!494773 () Bool)

(assert (=> b!513109 m!494773))

(assert (=> b!513109 m!494769))

(declare-fun m!494775 () Bool)

(assert (=> b!513109 m!494775))

(assert (=> b!513109 m!494749))

(declare-fun m!494777 () Bool)

(assert (=> b!513109 m!494777))

(assert (=> b!513109 m!494769))

(declare-fun m!494779 () Bool)

(assert (=> b!513109 m!494779))

(push 1)

(assert (not b!513105))

(assert (not start!46348))

(assert (not b!513100))

(assert (not b!513108))

(assert (not b!513110))

(assert (not b!513103))

(assert (not b!513109))

(assert (not b!513102))

(assert (not b!513106))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!513182 () Bool)

(declare-fun c!60073 () Bool)

(declare-fun lt!234957 () (_ BitVec 64))

(assert (=> b!513182 (= c!60073 (= lt!234957 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299664 () SeekEntryResult!4315)

(declare-fun e!299662 () SeekEntryResult!4315)

(assert (=> b!513182 (= e!299664 e!299662)))

(declare-fun b!513183 () Bool)

(declare-fun lt!234958 () SeekEntryResult!4315)

(assert (=> b!513183 (= e!299662 (MissingZero!4315 (index!19450 lt!234958)))))

(declare-fun b!513184 () Bool)

(declare-fun e!299663 () SeekEntryResult!4315)

(assert (=> b!513184 (= e!299663 Undefined!4315)))

(declare-fun b!513185 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32945 (_ BitVec 32)) SeekEntryResult!4315)

(assert (=> b!513185 (= e!299662 (seekKeyOrZeroReturnVacant!0 (x!48392 lt!234958) (index!19450 lt!234958) (index!19450 lt!234958) (select (arr!15848 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!513187 () Bool)

(assert (=> b!513187 (= e!299663 e!299664)))

(assert (=> b!513187 (= lt!234957 (select (arr!15848 a!3235) (index!19450 lt!234958)))))

(declare-fun c!60071 () Bool)

(assert (=> b!513187 (= c!60071 (= lt!234957 (select (arr!15848 a!3235) j!176)))))

(declare-fun b!513186 () Bool)

(assert (=> b!513186 (= e!299664 (Found!4315 (index!19450 lt!234958)))))

(declare-fun d!79091 () Bool)

(declare-fun lt!234956 () SeekEntryResult!4315)

(assert (=> d!79091 (and (or (is-Undefined!4315 lt!234956) (not (is-Found!4315 lt!234956)) (and (bvsge (index!19449 lt!234956) #b00000000000000000000000000000000) (bvslt (index!19449 lt!234956) (size!16212 a!3235)))) (or (is-Undefined!4315 lt!234956) (is-Found!4315 lt!234956) (not (is-MissingZero!4315 lt!234956)) (and (bvsge (index!19448 lt!234956) #b00000000000000000000000000000000) (bvslt (index!19448 lt!234956) (size!16212 a!3235)))) (or (is-Undefined!4315 lt!234956) (is-Found!4315 lt!234956) (is-MissingZero!4315 lt!234956) (not (is-MissingVacant!4315 lt!234956)) (and (bvsge (index!19451 lt!234956) #b00000000000000000000000000000000) (bvslt (index!19451 lt!234956) (size!16212 a!3235)))) (or (is-Undefined!4315 lt!234956) (ite (is-Found!4315 lt!234956) (= (select (arr!15848 a!3235) (index!19449 lt!234956)) (select (arr!15848 a!3235) j!176)) (ite (is-MissingZero!4315 lt!234956) (= (select (arr!15848 a!3235) (index!19448 lt!234956)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4315 lt!234956) (= (select (arr!15848 a!3235) (index!19451 lt!234956)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79091 (= lt!234956 e!299663)))

(declare-fun c!60072 () Bool)

(assert (=> d!79091 (= c!60072 (and (is-Intermediate!4315 lt!234958) (undefined!5127 lt!234958)))))

(assert (=> d!79091 (= lt!234958 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15848 a!3235) j!176) mask!3524) (select (arr!15848 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79091 (validMask!0 mask!3524)))

(assert (=> d!79091 (= (seekEntryOrOpen!0 (select (arr!15848 a!3235) j!176) a!3235 mask!3524) lt!234956)))

(assert (= (and d!79091 c!60072) b!513184))

(assert (= (and d!79091 (not c!60072)) b!513187))

(assert (= (and b!513187 c!60071) b!513186))

(assert (= (and b!513187 (not c!60071)) b!513182))

(assert (= (and b!513182 c!60073) b!513183))

(assert (= (and b!513182 (not c!60073)) b!513185))

(assert (=> b!513185 m!494749))

(declare-fun m!494813 () Bool)

(assert (=> b!513185 m!494813))

(declare-fun m!494815 () Bool)

(assert (=> b!513187 m!494815))

(declare-fun m!494817 () Bool)

(assert (=> d!79091 m!494817))

(assert (=> d!79091 m!494773))

(assert (=> d!79091 m!494749))

(declare-fun m!494819 () Bool)

(assert (=> d!79091 m!494819))

(assert (=> d!79091 m!494749))

(assert (=> d!79091 m!494773))

(declare-fun m!494821 () Bool)

(assert (=> d!79091 m!494821))

(assert (=> d!79091 m!494753))

(declare-fun m!494823 () Bool)

(assert (=> d!79091 m!494823))

(assert (=> b!513102 d!79091))

(declare-fun b!513200 () Bool)

(declare-fun e!299674 () Bool)

(declare-fun call!31544 () Bool)

(assert (=> b!513200 (= e!299674 call!31544)))

(declare-fun b!513201 () Bool)

(declare-fun e!299676 () Bool)

(declare-fun e!299675 () Bool)

(assert (=> b!513201 (= e!299676 e!299675)))

(declare-fun c!60077 () Bool)

(assert (=> b!513201 (= c!60077 (validKeyInArray!0 (select (arr!15848 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79101 () Bool)

(declare-fun res!313612 () Bool)

(assert (=> d!79101 (=> res!313612 e!299676)))

(assert (=> d!79101 (= res!313612 (bvsge #b00000000000000000000000000000000 (size!16212 a!3235)))))

(assert (=> d!79101 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!299676)))

(declare-fun bm!31541 () Bool)

(assert (=> bm!31541 (= call!31544 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!513202 () Bool)

(assert (=> b!513202 (= e!299675 e!299674)))

(declare-fun lt!234976 () (_ BitVec 64))

(assert (=> b!513202 (= lt!234976 (select (arr!15848 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!234974 () Unit!15888)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32945 (_ BitVec 64) (_ BitVec 32)) Unit!15888)

(assert (=> b!513202 (= lt!234974 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!234976 #b00000000000000000000000000000000))))

(assert (=> b!513202 (arrayContainsKey!0 a!3235 lt!234976 #b00000000000000000000000000000000)))

(declare-fun lt!234975 () Unit!15888)

(assert (=> b!513202 (= lt!234975 lt!234974)))

(declare-fun res!313611 () Bool)

(assert (=> b!513202 (= res!313611 (= (seekEntryOrOpen!0 (select (arr!15848 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4315 #b00000000000000000000000000000000)))))

(assert (=> b!513202 (=> (not res!313611) (not e!299674))))

(declare-fun b!513203 () Bool)

(assert (=> b!513203 (= e!299675 call!31544)))

(assert (= (and d!79101 (not res!313612)) b!513201))

(assert (= (and b!513201 c!60077) b!513202))

(assert (= (and b!513201 (not c!60077)) b!513203))

(assert (= (and b!513202 res!313611) b!513200))

(assert (= (or b!513200 b!513203) bm!31541))

(declare-fun m!494831 () Bool)

(assert (=> b!513201 m!494831))

(assert (=> b!513201 m!494831))

(declare-fun m!494833 () Bool)

(assert (=> b!513201 m!494833))

(declare-fun m!494835 () Bool)

(assert (=> bm!31541 m!494835))

(assert (=> b!513202 m!494831))

(declare-fun m!494837 () Bool)

(assert (=> b!513202 m!494837))

(declare-fun m!494839 () Bool)

(assert (=> b!513202 m!494839))

(assert (=> b!513202 m!494831))

(declare-fun m!494841 () Bool)

(assert (=> b!513202 m!494841))

(assert (=> b!513106 d!79101))

(declare-fun d!79107 () Bool)

(declare-fun res!313617 () Bool)

(declare-fun e!299681 () Bool)

(assert (=> d!79107 (=> res!313617 e!299681)))

(assert (=> d!79107 (= res!313617 (= (select (arr!15848 a!3235) #b00000000000000000000000000000000) k!2280))))

(assert (=> d!79107 (= (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000) e!299681)))

(declare-fun b!513208 () Bool)

(declare-fun e!299682 () Bool)

(assert (=> b!513208 (= e!299681 e!299682)))

(declare-fun res!313618 () Bool)

(assert (=> b!513208 (=> (not res!313618) (not e!299682))))

(assert (=> b!513208 (= res!313618 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16212 a!3235)))))

(declare-fun b!513209 () Bool)

(assert (=> b!513209 (= e!299682 (arrayContainsKey!0 a!3235 k!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79107 (not res!313617)) b!513208))

(assert (= (and b!513208 res!313618) b!513209))

(assert (=> d!79107 m!494831))

(declare-fun m!494843 () Bool)

(assert (=> b!513209 m!494843))

(assert (=> b!513100 d!79107))

(declare-fun d!79109 () Bool)

(assert (=> d!79109 (= (validKeyInArray!0 (select (arr!15848 a!3235) j!176)) (and (not (= (select (arr!15848 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15848 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513105 d!79109))

(declare-fun d!79111 () Bool)

(assert (=> d!79111 (= (validKeyInArray!0 k!2280) (and (not (= k!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!513110 d!79111))

(declare-fun d!79113 () Bool)

(assert (=> d!79113 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46348 d!79113))

(declare-fun d!79117 () Bool)

(assert (=> d!79117 (= (array_inv!11644 a!3235) (bvsge (size!16212 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46348 d!79117))

(declare-fun d!79119 () Bool)

(declare-fun lt!235001 () (_ BitVec 32))

(declare-fun lt!235000 () (_ BitVec 32))

(assert (=> d!79119 (= lt!235001 (bvmul (bvxor lt!235000 (bvlshr lt!235000 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79119 (= lt!235000 ((_ extract 31 0) (bvand (bvxor (select (arr!15848 a!3235) j!176) (bvlshr (select (arr!15848 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79119 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313637 (let ((h!10888 ((_ extract 31 0) (bvand (bvxor (select (arr!15848 a!3235) j!176) (bvlshr (select (arr!15848 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48397 (bvmul (bvxor h!10888 (bvlshr h!10888 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48397 (bvlshr x!48397 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313637 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313637 #b00000000000000000000000000000000))))))

(assert (=> d!79119 (= (toIndex!0 (select (arr!15848 a!3235) j!176) mask!3524) (bvand (bvxor lt!235001 (bvlshr lt!235001 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513109 d!79119))

(declare-fun b!513273 () Bool)

(declare-fun e!299718 () Bool)

(declare-fun call!31545 () Bool)

(assert (=> b!513273 (= e!299718 call!31545)))

(declare-fun b!513274 () Bool)

(declare-fun e!299720 () Bool)

(declare-fun e!299719 () Bool)

(assert (=> b!513274 (= e!299720 e!299719)))

(declare-fun c!60099 () Bool)

(assert (=> b!513274 (= c!60099 (validKeyInArray!0 (select (arr!15848 a!3235) j!176)))))

(declare-fun d!79131 () Bool)

(declare-fun res!313642 () Bool)

(assert (=> d!79131 (=> res!313642 e!299720)))

(assert (=> d!79131 (= res!313642 (bvsge j!176 (size!16212 a!3235)))))

(assert (=> d!79131 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!299720)))

(declare-fun bm!31542 () Bool)

(assert (=> bm!31542 (= call!31545 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!513275 () Bool)

(assert (=> b!513275 (= e!299719 e!299718)))

(declare-fun lt!235004 () (_ BitVec 64))

(assert (=> b!513275 (= lt!235004 (select (arr!15848 a!3235) j!176))))

(declare-fun lt!235002 () Unit!15888)

(assert (=> b!513275 (= lt!235002 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!235004 j!176))))

(assert (=> b!513275 (arrayContainsKey!0 a!3235 lt!235004 #b00000000000000000000000000000000)))

(declare-fun lt!235003 () Unit!15888)

(assert (=> b!513275 (= lt!235003 lt!235002)))

(declare-fun res!313641 () Bool)

(assert (=> b!513275 (= res!313641 (= (seekEntryOrOpen!0 (select (arr!15848 a!3235) j!176) a!3235 mask!3524) (Found!4315 j!176)))))

(assert (=> b!513275 (=> (not res!313641) (not e!299718))))

(declare-fun b!513276 () Bool)

(assert (=> b!513276 (= e!299719 call!31545)))

(assert (= (and d!79131 (not res!313642)) b!513274))

(assert (= (and b!513274 c!60099) b!513275))

(assert (= (and b!513274 (not c!60099)) b!513276))

(assert (= (and b!513275 res!313641) b!513273))

(assert (= (or b!513273 b!513276) bm!31542))

(assert (=> b!513274 m!494749))

(assert (=> b!513274 m!494749))

(assert (=> b!513274 m!494751))

(declare-fun m!494871 () Bool)

(assert (=> bm!31542 m!494871))

(assert (=> b!513275 m!494749))

(declare-fun m!494873 () Bool)

(assert (=> b!513275 m!494873))

(declare-fun m!494875 () Bool)

(assert (=> b!513275 m!494875))

(assert (=> b!513275 m!494749))

(assert (=> b!513275 m!494759))

(assert (=> b!513109 d!79131))

(declare-fun d!79133 () Bool)

(declare-fun e!299778 () Bool)

(assert (=> d!79133 e!299778))

(declare-fun c!60122 () Bool)

(declare-fun lt!235037 () SeekEntryResult!4315)

(assert (=> d!79133 (= c!60122 (and (is-Intermediate!4315 lt!235037) (undefined!5127 lt!235037)))))

(declare-fun e!299777 () SeekEntryResult!4315)

(assert (=> d!79133 (= lt!235037 e!299777)))

(declare-fun c!60123 () Bool)

(assert (=> d!79133 (= c!60123 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235038 () (_ BitVec 64))

(assert (=> d!79133 (= lt!235038 (select (arr!15848 a!3235) lt!234916))))

(assert (=> d!79133 (validMask!0 mask!3524)))

(assert (=> d!79133 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234916 (select (arr!15848 a!3235) j!176) a!3235 mask!3524) lt!235037)))

(declare-fun b!513358 () Bool)

(assert (=> b!513358 (and (bvsge (index!19450 lt!235037) #b00000000000000000000000000000000) (bvslt (index!19450 lt!235037) (size!16212 a!3235)))))

(declare-fun res!313680 () Bool)

(assert (=> b!513358 (= res!313680 (= (select (arr!15848 a!3235) (index!19450 lt!235037)) (select (arr!15848 a!3235) j!176)))))

(declare-fun e!299779 () Bool)

(assert (=> b!513358 (=> res!313680 e!299779)))

(declare-fun e!299780 () Bool)

(assert (=> b!513358 (= e!299780 e!299779)))

(declare-fun b!513359 () Bool)

(assert (=> b!513359 (= e!299777 (Intermediate!4315 true lt!234916 #b00000000000000000000000000000000))))

(declare-fun b!513360 () Bool)

(assert (=> b!513360 (= e!299778 (bvsge (x!48392 lt!235037) #b01111111111111111111111111111110))))

(declare-fun b!513361 () Bool)

(declare-fun e!299781 () SeekEntryResult!4315)

(assert (=> b!513361 (= e!299781 (Intermediate!4315 false lt!234916 #b00000000000000000000000000000000))))

(declare-fun b!513362 () Bool)

(assert (=> b!513362 (and (bvsge (index!19450 lt!235037) #b00000000000000000000000000000000) (bvslt (index!19450 lt!235037) (size!16212 a!3235)))))

(assert (=> b!513362 (= e!299779 (= (select (arr!15848 a!3235) (index!19450 lt!235037)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!513363 () Bool)

(assert (=> b!513363 (and (bvsge (index!19450 lt!235037) #b00000000000000000000000000000000) (bvslt (index!19450 lt!235037) (size!16212 a!3235)))))

(declare-fun res!313681 () Bool)

(assert (=> b!513363 (= res!313681 (= (select (arr!15848 a!3235) (index!19450 lt!235037)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513363 (=> res!313681 e!299779)))

(declare-fun b!513364 () Bool)

(assert (=> b!513364 (= e!299778 e!299780)))

(declare-fun res!313682 () Bool)

(assert (=> b!513364 (= res!313682 (and (is-Intermediate!4315 lt!235037) (not (undefined!5127 lt!235037)) (bvslt (x!48392 lt!235037) #b01111111111111111111111111111110) (bvsge (x!48392 lt!235037) #b00000000000000000000000000000000) (bvsge (x!48392 lt!235037) #b00000000000000000000000000000000)))))

(assert (=> b!513364 (=> (not res!313682) (not e!299780))))

(declare-fun b!513365 () Bool)

(assert (=> b!513365 (= e!299777 e!299781)))

(declare-fun c!60124 () Bool)

(assert (=> b!513365 (= c!60124 (or (= lt!235038 (select (arr!15848 a!3235) j!176)) (= (bvadd lt!235038 lt!235038) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!513366 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!513366 (= e!299781 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234916 #b00000000000000000000000000000000 mask!3524) (select (arr!15848 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!79133 c!60123) b!513359))

(assert (= (and d!79133 (not c!60123)) b!513365))

(assert (= (and b!513365 c!60124) b!513361))

(assert (= (and b!513365 (not c!60124)) b!513366))

(assert (= (and d!79133 c!60122) b!513360))

(assert (= (and d!79133 (not c!60122)) b!513364))

(assert (= (and b!513364 res!313682) b!513358))

(assert (= (and b!513358 (not res!313680)) b!513363))

(assert (= (and b!513363 (not res!313681)) b!513362))

(declare-fun m!494945 () Bool)

(assert (=> b!513366 m!494945))

(assert (=> b!513366 m!494945))

(assert (=> b!513366 m!494749))

(declare-fun m!494947 () Bool)

(assert (=> b!513366 m!494947))

(declare-fun m!494949 () Bool)

(assert (=> b!513363 m!494949))

(declare-fun m!494951 () Bool)

(assert (=> d!79133 m!494951))

(assert (=> d!79133 m!494753))

(assert (=> b!513362 m!494949))

(assert (=> b!513358 m!494949))

(assert (=> b!513109 d!79133))

(declare-fun d!79153 () Bool)

(declare-fun e!299783 () Bool)

(assert (=> d!79153 e!299783))

(declare-fun c!60125 () Bool)

(declare-fun lt!235039 () SeekEntryResult!4315)

(assert (=> d!79153 (= c!60125 (and (is-Intermediate!4315 lt!235039) (undefined!5127 lt!235039)))))

(declare-fun e!299782 () SeekEntryResult!4315)

(assert (=> d!79153 (= lt!235039 e!299782)))

(declare-fun c!60126 () Bool)

(assert (=> d!79153 (= c!60126 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!235040 () (_ BitVec 64))

(assert (=> d!79153 (= lt!235040 (select (arr!15848 (array!32946 (store (arr!15848 a!3235) i!1204 k!2280) (size!16212 a!3235))) lt!234919))))

(assert (=> d!79153 (validMask!0 mask!3524)))

(assert (=> d!79153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234919 (select (store (arr!15848 a!3235) i!1204 k!2280) j!176) (array!32946 (store (arr!15848 a!3235) i!1204 k!2280) (size!16212 a!3235)) mask!3524) lt!235039)))

(declare-fun b!513367 () Bool)

(assert (=> b!513367 (and (bvsge (index!19450 lt!235039) #b00000000000000000000000000000000) (bvslt (index!19450 lt!235039) (size!16212 (array!32946 (store (arr!15848 a!3235) i!1204 k!2280) (size!16212 a!3235)))))))

(declare-fun res!313683 () Bool)

(assert (=> b!513367 (= res!313683 (= (select (arr!15848 (array!32946 (store (arr!15848 a!3235) i!1204 k!2280) (size!16212 a!3235))) (index!19450 lt!235039)) (select (store (arr!15848 a!3235) i!1204 k!2280) j!176)))))

(declare-fun e!299784 () Bool)

(assert (=> b!513367 (=> res!313683 e!299784)))

(declare-fun e!299785 () Bool)

(assert (=> b!513367 (= e!299785 e!299784)))

(declare-fun b!513368 () Bool)

(assert (=> b!513368 (= e!299782 (Intermediate!4315 true lt!234919 #b00000000000000000000000000000000))))

(declare-fun b!513369 () Bool)

(assert (=> b!513369 (= e!299783 (bvsge (x!48392 lt!235039) #b01111111111111111111111111111110))))

(declare-fun b!513370 () Bool)

(declare-fun e!299786 () SeekEntryResult!4315)

(assert (=> b!513370 (= e!299786 (Intermediate!4315 false lt!234919 #b00000000000000000000000000000000))))

(declare-fun b!513371 () Bool)

(assert (=> b!513371 (and (bvsge (index!19450 lt!235039) #b00000000000000000000000000000000) (bvslt (index!19450 lt!235039) (size!16212 (array!32946 (store (arr!15848 a!3235) i!1204 k!2280) (size!16212 a!3235)))))))

(assert (=> b!513371 (= e!299784 (= (select (arr!15848 (array!32946 (store (arr!15848 a!3235) i!1204 k!2280) (size!16212 a!3235))) (index!19450 lt!235039)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!513372 () Bool)

(assert (=> b!513372 (and (bvsge (index!19450 lt!235039) #b00000000000000000000000000000000) (bvslt (index!19450 lt!235039) (size!16212 (array!32946 (store (arr!15848 a!3235) i!1204 k!2280) (size!16212 a!3235)))))))

(declare-fun res!313684 () Bool)

(assert (=> b!513372 (= res!313684 (= (select (arr!15848 (array!32946 (store (arr!15848 a!3235) i!1204 k!2280) (size!16212 a!3235))) (index!19450 lt!235039)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!513372 (=> res!313684 e!299784)))

(declare-fun b!513373 () Bool)

(assert (=> b!513373 (= e!299783 e!299785)))

(declare-fun res!313685 () Bool)

(assert (=> b!513373 (= res!313685 (and (is-Intermediate!4315 lt!235039) (not (undefined!5127 lt!235039)) (bvslt (x!48392 lt!235039) #b01111111111111111111111111111110) (bvsge (x!48392 lt!235039) #b00000000000000000000000000000000) (bvsge (x!48392 lt!235039) #b00000000000000000000000000000000)))))

(assert (=> b!513373 (=> (not res!313685) (not e!299785))))

(declare-fun b!513374 () Bool)

(assert (=> b!513374 (= e!299782 e!299786)))

(declare-fun c!60127 () Bool)

(assert (=> b!513374 (= c!60127 (or (= lt!235040 (select (store (arr!15848 a!3235) i!1204 k!2280) j!176)) (= (bvadd lt!235040 lt!235040) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!513375 () Bool)

(assert (=> b!513375 (= e!299786 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234919 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15848 a!3235) i!1204 k!2280) j!176) (array!32946 (store (arr!15848 a!3235) i!1204 k!2280) (size!16212 a!3235)) mask!3524))))

(assert (= (and d!79153 c!60126) b!513368))

(assert (= (and d!79153 (not c!60126)) b!513374))

(assert (= (and b!513374 c!60127) b!513370))

(assert (= (and b!513374 (not c!60127)) b!513375))

(assert (= (and d!79153 c!60125) b!513369))

(assert (= (and d!79153 (not c!60125)) b!513373))

(assert (= (and b!513373 res!313685) b!513367))

(assert (= (and b!513367 (not res!313683)) b!513372))

(assert (= (and b!513372 (not res!313684)) b!513371))

(declare-fun m!494953 () Bool)

(assert (=> b!513375 m!494953))

(assert (=> b!513375 m!494953))

(assert (=> b!513375 m!494769))

(declare-fun m!494955 () Bool)

(assert (=> b!513375 m!494955))

(declare-fun m!494957 () Bool)

(assert (=> b!513372 m!494957))

(declare-fun m!494959 () Bool)

(assert (=> d!79153 m!494959))

(assert (=> d!79153 m!494753))

(assert (=> b!513371 m!494957))

(assert (=> b!513367 m!494957))

(assert (=> b!513109 d!79153))

(declare-fun d!79155 () Bool)

(assert (=> d!79155 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!235043 () Unit!15888)

(declare-fun choose!38 (array!32945 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15888)

(assert (=> d!79155 (= lt!235043 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79155 (validMask!0 mask!3524)))

(assert (=> d!79155 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!235043)))

(declare-fun bs!16248 () Bool)

(assert (= bs!16248 d!79155))

(assert (=> bs!16248 m!494777))

(declare-fun m!494965 () Bool)

(assert (=> bs!16248 m!494965))

(assert (=> bs!16248 m!494753))

(assert (=> b!513109 d!79155))

(declare-fun d!79161 () Bool)

(declare-fun lt!235045 () (_ BitVec 32))

(declare-fun lt!235044 () (_ BitVec 32))

(assert (=> d!79161 (= lt!235045 (bvmul (bvxor lt!235044 (bvlshr lt!235044 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79161 (= lt!235044 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15848 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15848 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79161 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313637 (let ((h!10888 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15848 a!3235) i!1204 k!2280) j!176) (bvlshr (select (store (arr!15848 a!3235) i!1204 k!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48397 (bvmul (bvxor h!10888 (bvlshr h!10888 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48397 (bvlshr x!48397 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313637 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313637 #b00000000000000000000000000000000))))))

(assert (=> d!79161 (= (toIndex!0 (select (store (arr!15848 a!3235) i!1204 k!2280) j!176) mask!3524) (bvand (bvxor lt!235045 (bvlshr lt!235045 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!513109 d!79161))

(declare-fun b!513391 () Bool)

(declare-fun e!299799 () Bool)

(declare-fun call!31556 () Bool)

(assert (=> b!513391 (= e!299799 call!31556)))

(declare-fun bm!31553 () Bool)

(declare-fun c!60131 () Bool)

(assert (=> bm!31553 (= call!31556 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60131 (Cons!10002 (select (arr!15848 a!3235) #b00000000000000000000000000000000) Nil!10003) Nil!10003)))))

(declare-fun b!513392 () Bool)

(declare-fun e!299802 () Bool)

(declare-fun e!299801 () Bool)

(assert (=> b!513392 (= e!299802 e!299801)))

(declare-fun res!313695 () Bool)

(assert (=> b!513392 (=> (not res!313695) (not e!299801))))

(declare-fun e!299800 () Bool)

(assert (=> b!513392 (= res!313695 (not e!299800))))

(declare-fun res!313696 () Bool)

(assert (=> b!513392 (=> (not res!313696) (not e!299800))))

(assert (=> b!513392 (= res!313696 (validKeyInArray!0 (select (arr!15848 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!513393 () Bool)

