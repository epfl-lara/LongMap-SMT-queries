; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45628 () Bool)

(assert start!45628)

(declare-fun b!502942 () Bool)

(declare-fun res!304302 () Bool)

(declare-fun e!294559 () Bool)

(assert (=> b!502942 (=> (not res!304302) (not e!294559))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502942 (= res!304302 (validKeyInArray!0 k!2280))))

(declare-fun b!502943 () Bool)

(declare-fun res!304308 () Bool)

(assert (=> b!502943 (=> (not res!304308) (not e!294559))))

(declare-datatypes ((array!32384 0))(
  ( (array!32385 (arr!15572 (Array (_ BitVec 32) (_ BitVec 64))) (size!15936 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32384)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!502943 (= res!304308 (validKeyInArray!0 (select (arr!15572 a!3235) j!176)))))

(declare-fun res!304299 () Bool)

(assert (=> start!45628 (=> (not res!304299) (not e!294559))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45628 (= res!304299 (validMask!0 mask!3524))))

(assert (=> start!45628 e!294559))

(assert (=> start!45628 true))

(declare-fun array_inv!11368 (array!32384) Bool)

(assert (=> start!45628 (array_inv!11368 a!3235)))

(declare-fun b!502944 () Bool)

(declare-fun e!294562 () Bool)

(assert (=> b!502944 (= e!294562 true)))

(declare-fun lt!228703 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4039 0))(
  ( (MissingZero!4039 (index!18344 (_ BitVec 32))) (Found!4039 (index!18345 (_ BitVec 32))) (Intermediate!4039 (undefined!4851 Bool) (index!18346 (_ BitVec 32)) (x!47368 (_ BitVec 32))) (Undefined!4039) (MissingVacant!4039 (index!18347 (_ BitVec 32))) )
))
(declare-fun lt!228712 () SeekEntryResult!4039)

(declare-fun lt!228710 () array!32384)

(declare-fun lt!228708 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32384 (_ BitVec 32)) SeekEntryResult!4039)

(assert (=> b!502944 (= lt!228712 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228703 lt!228708 lt!228710 mask!3524))))

(declare-fun b!502945 () Bool)

(declare-fun e!294564 () Bool)

(assert (=> b!502945 (= e!294564 false)))

(declare-fun b!502946 () Bool)

(declare-fun res!304313 () Bool)

(assert (=> b!502946 (=> res!304313 e!294562)))

(declare-fun e!294561 () Bool)

(assert (=> b!502946 (= res!304313 e!294561)))

(declare-fun res!304310 () Bool)

(assert (=> b!502946 (=> (not res!304310) (not e!294561))))

(declare-fun lt!228706 () SeekEntryResult!4039)

(assert (=> b!502946 (= res!304310 (bvsgt #b00000000000000000000000000000000 (x!47368 lt!228706)))))

(declare-fun b!502947 () Bool)

(declare-fun res!304303 () Bool)

(assert (=> b!502947 (=> (not res!304303) (not e!294559))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502947 (= res!304303 (and (= (size!15936 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15936 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15936 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502948 () Bool)

(declare-fun res!304305 () Bool)

(declare-fun e!294566 () Bool)

(assert (=> b!502948 (=> res!304305 e!294566)))

(assert (=> b!502948 (= res!304305 (or (undefined!4851 lt!228706) (not (is-Intermediate!4039 lt!228706))))))

(declare-fun b!502949 () Bool)

(assert (=> b!502949 (= e!294566 e!294562)))

(declare-fun res!304312 () Bool)

(assert (=> b!502949 (=> res!304312 e!294562)))

(assert (=> b!502949 (= res!304312 (or (bvsgt (x!47368 lt!228706) #b01111111111111111111111111111110) (bvslt lt!228703 #b00000000000000000000000000000000) (bvsge lt!228703 (size!15936 a!3235)) (bvslt (index!18346 lt!228706) #b00000000000000000000000000000000) (bvsge (index!18346 lt!228706) (size!15936 a!3235)) (not (= lt!228706 (Intermediate!4039 false (index!18346 lt!228706) (x!47368 lt!228706))))))))

(assert (=> b!502949 (= (index!18346 lt!228706) i!1204)))

(declare-datatypes ((Unit!15232 0))(
  ( (Unit!15233) )
))
(declare-fun lt!228702 () Unit!15232)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32384 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15232)

(assert (=> b!502949 (= lt!228702 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228703 #b00000000000000000000000000000000 (index!18346 lt!228706) (x!47368 lt!228706) mask!3524))))

(assert (=> b!502949 (and (or (= (select (arr!15572 a!3235) (index!18346 lt!228706)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15572 a!3235) (index!18346 lt!228706)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15572 a!3235) (index!18346 lt!228706)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15572 a!3235) (index!18346 lt!228706)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228709 () Unit!15232)

(declare-fun e!294560 () Unit!15232)

(assert (=> b!502949 (= lt!228709 e!294560)))

(declare-fun c!59600 () Bool)

(assert (=> b!502949 (= c!59600 (= (select (arr!15572 a!3235) (index!18346 lt!228706)) (select (arr!15572 a!3235) j!176)))))

(assert (=> b!502949 (and (bvslt (x!47368 lt!228706) #b01111111111111111111111111111110) (or (= (select (arr!15572 a!3235) (index!18346 lt!228706)) (select (arr!15572 a!3235) j!176)) (= (select (arr!15572 a!3235) (index!18346 lt!228706)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15572 a!3235) (index!18346 lt!228706)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502950 () Bool)

(declare-fun Unit!15234 () Unit!15232)

(assert (=> b!502950 (= e!294560 Unit!15234)))

(declare-fun e!294563 () Bool)

(declare-fun b!502951 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32384 (_ BitVec 32)) SeekEntryResult!4039)

(assert (=> b!502951 (= e!294563 (= (seekEntryOrOpen!0 (select (arr!15572 a!3235) j!176) a!3235 mask!3524) (Found!4039 j!176)))))

(declare-fun b!502952 () Bool)

(declare-fun res!304300 () Bool)

(declare-fun e!294567 () Bool)

(assert (=> b!502952 (=> (not res!304300) (not e!294567))))

(declare-datatypes ((List!9730 0))(
  ( (Nil!9727) (Cons!9726 (h!10603 (_ BitVec 64)) (t!15958 List!9730)) )
))
(declare-fun arrayNoDuplicates!0 (array!32384 (_ BitVec 32) List!9730) Bool)

(assert (=> b!502952 (= res!304300 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9727))))

(declare-fun b!502953 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32384 (_ BitVec 32)) SeekEntryResult!4039)

(assert (=> b!502953 (= e!294561 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228703 (index!18346 lt!228706) (select (arr!15572 a!3235) j!176) a!3235 mask!3524) (Found!4039 j!176))))))

(declare-fun b!502954 () Bool)

(assert (=> b!502954 (= e!294567 (not e!294566))))

(declare-fun res!304309 () Bool)

(assert (=> b!502954 (=> res!304309 e!294566)))

(declare-fun lt!228705 () (_ BitVec 32))

(assert (=> b!502954 (= res!304309 (= lt!228706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228705 lt!228708 lt!228710 mask!3524)))))

(assert (=> b!502954 (= lt!228706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228703 (select (arr!15572 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502954 (= lt!228705 (toIndex!0 lt!228708 mask!3524))))

(assert (=> b!502954 (= lt!228708 (select (store (arr!15572 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!502954 (= lt!228703 (toIndex!0 (select (arr!15572 a!3235) j!176) mask!3524))))

(assert (=> b!502954 (= lt!228710 (array!32385 (store (arr!15572 a!3235) i!1204 k!2280) (size!15936 a!3235)))))

(assert (=> b!502954 e!294563))

(declare-fun res!304311 () Bool)

(assert (=> b!502954 (=> (not res!304311) (not e!294563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32384 (_ BitVec 32)) Bool)

(assert (=> b!502954 (= res!304311 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228707 () Unit!15232)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32384 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15232)

(assert (=> b!502954 (= lt!228707 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502955 () Bool)

(declare-fun res!304304 () Bool)

(assert (=> b!502955 (=> (not res!304304) (not e!294559))))

(declare-fun arrayContainsKey!0 (array!32384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502955 (= res!304304 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502956 () Bool)

(declare-fun Unit!15235 () Unit!15232)

(assert (=> b!502956 (= e!294560 Unit!15235)))

(declare-fun lt!228704 () Unit!15232)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32384 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15232)

(assert (=> b!502956 (= lt!228704 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228703 #b00000000000000000000000000000000 (index!18346 lt!228706) (x!47368 lt!228706) mask!3524))))

(declare-fun res!304307 () Bool)

(assert (=> b!502956 (= res!304307 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228703 lt!228708 lt!228710 mask!3524) (Intermediate!4039 false (index!18346 lt!228706) (x!47368 lt!228706))))))

(assert (=> b!502956 (=> (not res!304307) (not e!294564))))

(assert (=> b!502956 e!294564))

(declare-fun b!502957 () Bool)

(assert (=> b!502957 (= e!294559 e!294567)))

(declare-fun res!304306 () Bool)

(assert (=> b!502957 (=> (not res!304306) (not e!294567))))

(declare-fun lt!228711 () SeekEntryResult!4039)

(assert (=> b!502957 (= res!304306 (or (= lt!228711 (MissingZero!4039 i!1204)) (= lt!228711 (MissingVacant!4039 i!1204))))))

(assert (=> b!502957 (= lt!228711 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!502958 () Bool)

(declare-fun res!304301 () Bool)

(assert (=> b!502958 (=> (not res!304301) (not e!294567))))

(assert (=> b!502958 (= res!304301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45628 res!304299) b!502947))

(assert (= (and b!502947 res!304303) b!502943))

(assert (= (and b!502943 res!304308) b!502942))

(assert (= (and b!502942 res!304302) b!502955))

(assert (= (and b!502955 res!304304) b!502957))

(assert (= (and b!502957 res!304306) b!502958))

(assert (= (and b!502958 res!304301) b!502952))

(assert (= (and b!502952 res!304300) b!502954))

(assert (= (and b!502954 res!304311) b!502951))

(assert (= (and b!502954 (not res!304309)) b!502948))

(assert (= (and b!502948 (not res!304305)) b!502949))

(assert (= (and b!502949 c!59600) b!502956))

(assert (= (and b!502949 (not c!59600)) b!502950))

(assert (= (and b!502956 res!304307) b!502945))

(assert (= (and b!502949 (not res!304312)) b!502946))

(assert (= (and b!502946 res!304310) b!502953))

(assert (= (and b!502946 (not res!304313)) b!502944))

(declare-fun m!483827 () Bool)

(assert (=> b!502954 m!483827))

(declare-fun m!483829 () Bool)

(assert (=> b!502954 m!483829))

(declare-fun m!483831 () Bool)

(assert (=> b!502954 m!483831))

(declare-fun m!483833 () Bool)

(assert (=> b!502954 m!483833))

(declare-fun m!483835 () Bool)

(assert (=> b!502954 m!483835))

(declare-fun m!483837 () Bool)

(assert (=> b!502954 m!483837))

(assert (=> b!502954 m!483835))

(declare-fun m!483839 () Bool)

(assert (=> b!502954 m!483839))

(declare-fun m!483841 () Bool)

(assert (=> b!502954 m!483841))

(assert (=> b!502954 m!483835))

(declare-fun m!483843 () Bool)

(assert (=> b!502954 m!483843))

(declare-fun m!483845 () Bool)

(assert (=> b!502944 m!483845))

(declare-fun m!483847 () Bool)

(assert (=> b!502952 m!483847))

(assert (=> b!502951 m!483835))

(assert (=> b!502951 m!483835))

(declare-fun m!483849 () Bool)

(assert (=> b!502951 m!483849))

(declare-fun m!483851 () Bool)

(assert (=> b!502942 m!483851))

(assert (=> b!502953 m!483835))

(assert (=> b!502953 m!483835))

(declare-fun m!483853 () Bool)

(assert (=> b!502953 m!483853))

(declare-fun m!483855 () Bool)

(assert (=> b!502957 m!483855))

(declare-fun m!483857 () Bool)

(assert (=> b!502949 m!483857))

(declare-fun m!483859 () Bool)

(assert (=> b!502949 m!483859))

(assert (=> b!502949 m!483835))

(declare-fun m!483861 () Bool)

(assert (=> b!502955 m!483861))

(declare-fun m!483863 () Bool)

(assert (=> b!502958 m!483863))

(declare-fun m!483865 () Bool)

(assert (=> b!502956 m!483865))

(assert (=> b!502956 m!483845))

(assert (=> b!502943 m!483835))

(assert (=> b!502943 m!483835))

(declare-fun m!483867 () Bool)

(assert (=> b!502943 m!483867))

(declare-fun m!483869 () Bool)

(assert (=> start!45628 m!483869))

(declare-fun m!483871 () Bool)

(assert (=> start!45628 m!483871))

(push 1)

