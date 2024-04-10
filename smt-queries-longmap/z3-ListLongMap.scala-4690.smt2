; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65202 () Bool)

(assert start!65202)

(declare-fun b!738052 () Bool)

(declare-fun res!496144 () Bool)

(declare-fun e!412780 () Bool)

(assert (=> b!738052 (=> (not res!496144) (not e!412780))))

(declare-datatypes ((array!41375 0))(
  ( (array!41376 (arr!19801 (Array (_ BitVec 32) (_ BitVec 64))) (size!20222 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41375)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738052 (= res!496144 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738053 () Bool)

(declare-fun res!496149 () Bool)

(declare-fun e!412779 () Bool)

(assert (=> b!738053 (=> (not res!496149) (not e!412779))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41375 (_ BitVec 32)) Bool)

(assert (=> b!738053 (= res!496149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738054 () Bool)

(declare-fun res!496147 () Bool)

(assert (=> b!738054 (=> (not res!496147) (not e!412779))))

(declare-datatypes ((List!13803 0))(
  ( (Nil!13800) (Cons!13799 (h!14871 (_ BitVec 64)) (t!20118 List!13803)) )
))
(declare-fun arrayNoDuplicates!0 (array!41375 (_ BitVec 32) List!13803) Bool)

(assert (=> b!738054 (= res!496147 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13800))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!738055 () Bool)

(declare-fun e!412786 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7401 0))(
  ( (MissingZero!7401 (index!31972 (_ BitVec 32))) (Found!7401 (index!31973 (_ BitVec 32))) (Intermediate!7401 (undefined!8213 Bool) (index!31974 (_ BitVec 32)) (x!62967 (_ BitVec 32))) (Undefined!7401) (MissingVacant!7401 (index!31975 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41375 (_ BitVec 32)) SeekEntryResult!7401)

(assert (=> b!738055 (= e!412786 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19801 a!3186) j!159) a!3186 mask!3328) (Found!7401 j!159)))))

(declare-fun b!738056 () Bool)

(declare-fun e!412784 () Bool)

(declare-fun e!412789 () Bool)

(assert (=> b!738056 (= e!412784 e!412789)))

(declare-fun res!496139 () Bool)

(assert (=> b!738056 (=> (not res!496139) (not e!412789))))

(declare-fun lt!327545 () SeekEntryResult!7401)

(declare-fun lt!327550 () SeekEntryResult!7401)

(assert (=> b!738056 (= res!496139 (= lt!327545 lt!327550))))

(declare-fun lt!327544 () (_ BitVec 64))

(declare-fun lt!327549 () array!41375)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41375 (_ BitVec 32)) SeekEntryResult!7401)

(assert (=> b!738056 (= lt!327550 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327544 lt!327549 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738056 (= lt!327545 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327544 mask!3328) lt!327544 lt!327549 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!738056 (= lt!327544 (select (store (arr!19801 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!738056 (= lt!327549 (array!41376 (store (arr!19801 a!3186) i!1173 k0!2102) (size!20222 a!3186)))))

(declare-fun b!738057 () Bool)

(declare-fun res!496153 () Bool)

(assert (=> b!738057 (=> (not res!496153) (not e!412780))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738057 (= res!496153 (validKeyInArray!0 (select (arr!19801 a!3186) j!159)))))

(declare-fun res!496148 () Bool)

(assert (=> start!65202 (=> (not res!496148) (not e!412780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65202 (= res!496148 (validMask!0 mask!3328))))

(assert (=> start!65202 e!412780))

(assert (=> start!65202 true))

(declare-fun array_inv!15597 (array!41375) Bool)

(assert (=> start!65202 (array_inv!15597 a!3186)))

(declare-fun b!738058 () Bool)

(declare-fun lt!327539 () SeekEntryResult!7401)

(assert (=> b!738058 (= e!412786 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19801 a!3186) j!159) a!3186 mask!3328) lt!327539))))

(declare-fun b!738059 () Bool)

(declare-fun e!412785 () Bool)

(assert (=> b!738059 (= e!412785 true)))

(declare-fun lt!327546 () (_ BitVec 32))

(declare-fun lt!327551 () SeekEntryResult!7401)

(assert (=> b!738059 (= lt!327551 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327546 lt!327544 lt!327549 mask!3328))))

(declare-fun b!738060 () Bool)

(declare-fun res!496138 () Bool)

(assert (=> b!738060 (=> (not res!496138) (not e!412779))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!738060 (= res!496138 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20222 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20222 a!3186))))))

(declare-fun b!738061 () Bool)

(declare-fun e!412781 () Bool)

(assert (=> b!738061 (= e!412781 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327546 (select (arr!19801 a!3186) j!159) a!3186 mask!3328) lt!327539)))))

(declare-fun b!738062 () Bool)

(assert (=> b!738062 (= e!412780 e!412779)))

(declare-fun res!496142 () Bool)

(assert (=> b!738062 (=> (not res!496142) (not e!412779))))

(declare-fun lt!327540 () SeekEntryResult!7401)

(assert (=> b!738062 (= res!496142 (or (= lt!327540 (MissingZero!7401 i!1173)) (= lt!327540 (MissingVacant!7401 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41375 (_ BitVec 32)) SeekEntryResult!7401)

(assert (=> b!738062 (= lt!327540 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!738063 () Bool)

(declare-fun res!496154 () Bool)

(assert (=> b!738063 (=> (not res!496154) (not e!412784))))

(assert (=> b!738063 (= res!496154 e!412786)))

(declare-fun c!81340 () Bool)

(assert (=> b!738063 (= c!81340 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!738064 () Bool)

(declare-fun e!412783 () Bool)

(assert (=> b!738064 (= e!412789 (not e!412783))))

(declare-fun res!496145 () Bool)

(assert (=> b!738064 (=> res!496145 e!412783)))

(get-info :version)

(assert (=> b!738064 (= res!496145 (or (not ((_ is Intermediate!7401) lt!327550)) (bvsge x!1131 (x!62967 lt!327550))))))

(declare-fun lt!327538 () SeekEntryResult!7401)

(assert (=> b!738064 (= lt!327538 (Found!7401 j!159))))

(declare-fun e!412782 () Bool)

(assert (=> b!738064 e!412782))

(declare-fun res!496141 () Bool)

(assert (=> b!738064 (=> (not res!496141) (not e!412782))))

(assert (=> b!738064 (= res!496141 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25200 0))(
  ( (Unit!25201) )
))
(declare-fun lt!327543 () Unit!25200)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41375 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25200)

(assert (=> b!738064 (= lt!327543 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!738065 () Bool)

(declare-fun e!412787 () Bool)

(assert (=> b!738065 (= e!412782 e!412787)))

(declare-fun res!496140 () Bool)

(assert (=> b!738065 (=> (not res!496140) (not e!412787))))

(declare-fun lt!327548 () SeekEntryResult!7401)

(assert (=> b!738065 (= res!496140 (= (seekEntryOrOpen!0 (select (arr!19801 a!3186) j!159) a!3186 mask!3328) lt!327548))))

(assert (=> b!738065 (= lt!327548 (Found!7401 j!159))))

(declare-fun b!738066 () Bool)

(declare-fun res!496143 () Bool)

(assert (=> b!738066 (=> (not res!496143) (not e!412784))))

(assert (=> b!738066 (= res!496143 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19801 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!738067 () Bool)

(assert (=> b!738067 (= e!412779 e!412784)))

(declare-fun res!496137 () Bool)

(assert (=> b!738067 (=> (not res!496137) (not e!412784))))

(assert (=> b!738067 (= res!496137 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19801 a!3186) j!159) mask!3328) (select (arr!19801 a!3186) j!159) a!3186 mask!3328) lt!327539))))

(assert (=> b!738067 (= lt!327539 (Intermediate!7401 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738068 () Bool)

(declare-fun res!496146 () Bool)

(assert (=> b!738068 (=> (not res!496146) (not e!412780))))

(assert (=> b!738068 (= res!496146 (validKeyInArray!0 k0!2102))))

(declare-fun b!738069 () Bool)

(assert (=> b!738069 (= e!412787 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19801 a!3186) j!159) a!3186 mask!3328) lt!327548))))

(declare-fun b!738070 () Bool)

(declare-fun e!412788 () Unit!25200)

(declare-fun Unit!25202 () Unit!25200)

(assert (=> b!738070 (= e!412788 Unit!25202)))

(declare-fun lt!327541 () SeekEntryResult!7401)

(assert (=> b!738070 (= lt!327541 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19801 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!738070 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327546 resIntermediateIndex!5 (select (arr!19801 a!3186) j!159) a!3186 mask!3328) lt!327538)))

(declare-fun b!738071 () Bool)

(declare-fun res!496152 () Bool)

(assert (=> b!738071 (=> res!496152 e!412785)))

(assert (=> b!738071 (= res!496152 e!412781)))

(declare-fun c!81338 () Bool)

(declare-fun lt!327542 () Bool)

(assert (=> b!738071 (= c!81338 lt!327542)))

(declare-fun b!738072 () Bool)

(declare-fun res!496151 () Bool)

(assert (=> b!738072 (=> (not res!496151) (not e!412780))))

(assert (=> b!738072 (= res!496151 (and (= (size!20222 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20222 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20222 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738073 () Bool)

(assert (=> b!738073 (= e!412781 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327546 resIntermediateIndex!5 (select (arr!19801 a!3186) j!159) a!3186 mask!3328) lt!327538)))))

(declare-fun b!738074 () Bool)

(assert (=> b!738074 (= e!412783 e!412785)))

(declare-fun res!496150 () Bool)

(assert (=> b!738074 (=> res!496150 e!412785)))

(assert (=> b!738074 (= res!496150 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327546 #b00000000000000000000000000000000) (bvsge lt!327546 (size!20222 a!3186))))))

(declare-fun lt!327547 () Unit!25200)

(assert (=> b!738074 (= lt!327547 e!412788)))

(declare-fun c!81339 () Bool)

(assert (=> b!738074 (= c!81339 lt!327542)))

(assert (=> b!738074 (= lt!327542 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738074 (= lt!327546 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!738075 () Bool)

(declare-fun Unit!25203 () Unit!25200)

(assert (=> b!738075 (= e!412788 Unit!25203)))

(assert (=> b!738075 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327546 (select (arr!19801 a!3186) j!159) a!3186 mask!3328) lt!327539)))

(assert (= (and start!65202 res!496148) b!738072))

(assert (= (and b!738072 res!496151) b!738057))

(assert (= (and b!738057 res!496153) b!738068))

(assert (= (and b!738068 res!496146) b!738052))

(assert (= (and b!738052 res!496144) b!738062))

(assert (= (and b!738062 res!496142) b!738053))

(assert (= (and b!738053 res!496149) b!738054))

(assert (= (and b!738054 res!496147) b!738060))

(assert (= (and b!738060 res!496138) b!738067))

(assert (= (and b!738067 res!496137) b!738066))

(assert (= (and b!738066 res!496143) b!738063))

(assert (= (and b!738063 c!81340) b!738058))

(assert (= (and b!738063 (not c!81340)) b!738055))

(assert (= (and b!738063 res!496154) b!738056))

(assert (= (and b!738056 res!496139) b!738064))

(assert (= (and b!738064 res!496141) b!738065))

(assert (= (and b!738065 res!496140) b!738069))

(assert (= (and b!738064 (not res!496145)) b!738074))

(assert (= (and b!738074 c!81339) b!738075))

(assert (= (and b!738074 (not c!81339)) b!738070))

(assert (= (and b!738074 (not res!496150)) b!738071))

(assert (= (and b!738071 c!81338) b!738061))

(assert (= (and b!738071 (not c!81338)) b!738073))

(assert (= (and b!738071 (not res!496152)) b!738059))

(declare-fun m!689779 () Bool)

(assert (=> b!738062 m!689779))

(declare-fun m!689781 () Bool)

(assert (=> b!738067 m!689781))

(assert (=> b!738067 m!689781))

(declare-fun m!689783 () Bool)

(assert (=> b!738067 m!689783))

(assert (=> b!738067 m!689783))

(assert (=> b!738067 m!689781))

(declare-fun m!689785 () Bool)

(assert (=> b!738067 m!689785))

(assert (=> b!738061 m!689781))

(assert (=> b!738061 m!689781))

(declare-fun m!689787 () Bool)

(assert (=> b!738061 m!689787))

(declare-fun m!689789 () Bool)

(assert (=> b!738054 m!689789))

(assert (=> b!738070 m!689781))

(assert (=> b!738070 m!689781))

(declare-fun m!689791 () Bool)

(assert (=> b!738070 m!689791))

(assert (=> b!738070 m!689781))

(declare-fun m!689793 () Bool)

(assert (=> b!738070 m!689793))

(declare-fun m!689795 () Bool)

(assert (=> b!738068 m!689795))

(assert (=> b!738065 m!689781))

(assert (=> b!738065 m!689781))

(declare-fun m!689797 () Bool)

(assert (=> b!738065 m!689797))

(assert (=> b!738058 m!689781))

(assert (=> b!738058 m!689781))

(declare-fun m!689799 () Bool)

(assert (=> b!738058 m!689799))

(declare-fun m!689801 () Bool)

(assert (=> b!738052 m!689801))

(assert (=> b!738055 m!689781))

(assert (=> b!738055 m!689781))

(assert (=> b!738055 m!689791))

(declare-fun m!689803 () Bool)

(assert (=> b!738066 m!689803))

(declare-fun m!689805 () Bool)

(assert (=> b!738059 m!689805))

(declare-fun m!689807 () Bool)

(assert (=> b!738064 m!689807))

(declare-fun m!689809 () Bool)

(assert (=> b!738064 m!689809))

(assert (=> b!738073 m!689781))

(assert (=> b!738073 m!689781))

(assert (=> b!738073 m!689793))

(assert (=> b!738069 m!689781))

(assert (=> b!738069 m!689781))

(declare-fun m!689811 () Bool)

(assert (=> b!738069 m!689811))

(assert (=> b!738075 m!689781))

(assert (=> b!738075 m!689781))

(assert (=> b!738075 m!689787))

(declare-fun m!689813 () Bool)

(assert (=> start!65202 m!689813))

(declare-fun m!689815 () Bool)

(assert (=> start!65202 m!689815))

(declare-fun m!689817 () Bool)

(assert (=> b!738056 m!689817))

(declare-fun m!689819 () Bool)

(assert (=> b!738056 m!689819))

(declare-fun m!689821 () Bool)

(assert (=> b!738056 m!689821))

(declare-fun m!689823 () Bool)

(assert (=> b!738056 m!689823))

(assert (=> b!738056 m!689817))

(declare-fun m!689825 () Bool)

(assert (=> b!738056 m!689825))

(declare-fun m!689827 () Bool)

(assert (=> b!738053 m!689827))

(assert (=> b!738057 m!689781))

(assert (=> b!738057 m!689781))

(declare-fun m!689829 () Bool)

(assert (=> b!738057 m!689829))

(declare-fun m!689831 () Bool)

(assert (=> b!738074 m!689831))

(check-sat (not b!738062) (not b!738056) (not b!738059) (not b!738068) (not b!738058) (not b!738075) (not b!738065) (not b!738061) (not b!738064) (not b!738067) (not b!738074) (not b!738055) (not b!738073) (not b!738057) (not b!738070) (not b!738052) (not b!738054) (not start!65202) (not b!738053) (not b!738069))
(check-sat)
