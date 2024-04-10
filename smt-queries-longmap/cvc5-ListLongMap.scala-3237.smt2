; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45228 () Bool)

(assert start!45228)

(declare-fun b!496585 () Bool)

(declare-fun res!298974 () Bool)

(declare-fun e!291191 () Bool)

(assert (=> b!496585 (=> (not res!298974) (not e!291191))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496585 (= res!298974 (validKeyInArray!0 k!2280))))

(declare-fun b!496586 () Bool)

(declare-fun res!298972 () Bool)

(declare-fun e!291192 () Bool)

(assert (=> b!496586 (=> res!298972 e!291192)))

(declare-datatypes ((SeekEntryResult!3908 0))(
  ( (MissingZero!3908 (index!17811 (_ BitVec 32))) (Found!3908 (index!17812 (_ BitVec 32))) (Intermediate!3908 (undefined!4720 Bool) (index!17813 (_ BitVec 32)) (x!46872 (_ BitVec 32))) (Undefined!3908) (MissingVacant!3908 (index!17814 (_ BitVec 32))) )
))
(declare-fun lt!224808 () SeekEntryResult!3908)

(assert (=> b!496586 (= res!298972 (or (undefined!4720 lt!224808) (not (is-Intermediate!3908 lt!224808))))))

(declare-fun b!496587 () Bool)

(declare-fun e!291189 () Bool)

(assert (=> b!496587 (= e!291189 (not e!291192))))

(declare-fun res!298978 () Bool)

(assert (=> b!496587 (=> res!298978 e!291192)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32116 0))(
  ( (array!32117 (arr!15441 (Array (_ BitVec 32) (_ BitVec 64))) (size!15805 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32116)

(declare-fun lt!224811 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32116 (_ BitVec 32)) SeekEntryResult!3908)

(assert (=> b!496587 (= res!298978 (= lt!224808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224811 (select (store (arr!15441 a!3235) i!1204 k!2280) j!176) (array!32117 (store (arr!15441 a!3235) i!1204 k!2280) (size!15805 a!3235)) mask!3524)))))

(declare-fun lt!224812 () (_ BitVec 32))

(assert (=> b!496587 (= lt!224808 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224812 (select (arr!15441 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496587 (= lt!224811 (toIndex!0 (select (store (arr!15441 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496587 (= lt!224812 (toIndex!0 (select (arr!15441 a!3235) j!176) mask!3524))))

(declare-fun e!291190 () Bool)

(assert (=> b!496587 e!291190))

(declare-fun res!298980 () Bool)

(assert (=> b!496587 (=> (not res!298980) (not e!291190))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32116 (_ BitVec 32)) Bool)

(assert (=> b!496587 (= res!298980 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14762 0))(
  ( (Unit!14763) )
))
(declare-fun lt!224810 () Unit!14762)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32116 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14762)

(assert (=> b!496587 (= lt!224810 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496588 () Bool)

(declare-fun res!298976 () Bool)

(assert (=> b!496588 (=> (not res!298976) (not e!291191))))

(assert (=> b!496588 (= res!298976 (and (= (size!15805 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15805 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15805 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496589 () Bool)

(assert (=> b!496589 (= e!291191 e!291189)))

(declare-fun res!298979 () Bool)

(assert (=> b!496589 (=> (not res!298979) (not e!291189))))

(declare-fun lt!224809 () SeekEntryResult!3908)

(assert (=> b!496589 (= res!298979 (or (= lt!224809 (MissingZero!3908 i!1204)) (= lt!224809 (MissingVacant!3908 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32116 (_ BitVec 32)) SeekEntryResult!3908)

(assert (=> b!496589 (= lt!224809 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!496590 () Bool)

(assert (=> b!496590 (= e!291192 true)))

(assert (=> b!496590 (and (bvslt (x!46872 lt!224808) #b01111111111111111111111111111110) (or (= (select (arr!15441 a!3235) (index!17813 lt!224808)) (select (arr!15441 a!3235) j!176)) (= (select (arr!15441 a!3235) (index!17813 lt!224808)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15441 a!3235) (index!17813 lt!224808)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496591 () Bool)

(declare-fun res!298981 () Bool)

(assert (=> b!496591 (=> (not res!298981) (not e!291189))))

(declare-datatypes ((List!9599 0))(
  ( (Nil!9596) (Cons!9595 (h!10466 (_ BitVec 64)) (t!15827 List!9599)) )
))
(declare-fun arrayNoDuplicates!0 (array!32116 (_ BitVec 32) List!9599) Bool)

(assert (=> b!496591 (= res!298981 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9596))))

(declare-fun b!496592 () Bool)

(assert (=> b!496592 (= e!291190 (= (seekEntryOrOpen!0 (select (arr!15441 a!3235) j!176) a!3235 mask!3524) (Found!3908 j!176)))))

(declare-fun b!496593 () Bool)

(declare-fun res!298973 () Bool)

(assert (=> b!496593 (=> (not res!298973) (not e!291191))))

(assert (=> b!496593 (= res!298973 (validKeyInArray!0 (select (arr!15441 a!3235) j!176)))))

(declare-fun b!496594 () Bool)

(declare-fun res!298982 () Bool)

(assert (=> b!496594 (=> (not res!298982) (not e!291191))))

(declare-fun arrayContainsKey!0 (array!32116 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496594 (= res!298982 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496595 () Bool)

(declare-fun res!298977 () Bool)

(assert (=> b!496595 (=> (not res!298977) (not e!291189))))

(assert (=> b!496595 (= res!298977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!298975 () Bool)

(assert (=> start!45228 (=> (not res!298975) (not e!291191))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45228 (= res!298975 (validMask!0 mask!3524))))

(assert (=> start!45228 e!291191))

(assert (=> start!45228 true))

(declare-fun array_inv!11237 (array!32116) Bool)

(assert (=> start!45228 (array_inv!11237 a!3235)))

(assert (= (and start!45228 res!298975) b!496588))

(assert (= (and b!496588 res!298976) b!496593))

(assert (= (and b!496593 res!298973) b!496585))

(assert (= (and b!496585 res!298974) b!496594))

(assert (= (and b!496594 res!298982) b!496589))

(assert (= (and b!496589 res!298979) b!496595))

(assert (= (and b!496595 res!298977) b!496591))

(assert (= (and b!496591 res!298981) b!496587))

(assert (= (and b!496587 res!298980) b!496592))

(assert (= (and b!496587 (not res!298978)) b!496586))

(assert (= (and b!496586 (not res!298972)) b!496590))

(declare-fun m!477843 () Bool)

(assert (=> b!496589 m!477843))

(declare-fun m!477845 () Bool)

(assert (=> b!496593 m!477845))

(assert (=> b!496593 m!477845))

(declare-fun m!477847 () Bool)

(assert (=> b!496593 m!477847))

(declare-fun m!477849 () Bool)

(assert (=> b!496585 m!477849))

(assert (=> b!496587 m!477845))

(declare-fun m!477851 () Bool)

(assert (=> b!496587 m!477851))

(declare-fun m!477853 () Bool)

(assert (=> b!496587 m!477853))

(declare-fun m!477855 () Bool)

(assert (=> b!496587 m!477855))

(declare-fun m!477857 () Bool)

(assert (=> b!496587 m!477857))

(assert (=> b!496587 m!477845))

(declare-fun m!477859 () Bool)

(assert (=> b!496587 m!477859))

(assert (=> b!496587 m!477857))

(declare-fun m!477861 () Bool)

(assert (=> b!496587 m!477861))

(assert (=> b!496587 m!477845))

(declare-fun m!477863 () Bool)

(assert (=> b!496587 m!477863))

(assert (=> b!496587 m!477857))

(declare-fun m!477865 () Bool)

(assert (=> b!496587 m!477865))

(assert (=> b!496592 m!477845))

(assert (=> b!496592 m!477845))

(declare-fun m!477867 () Bool)

(assert (=> b!496592 m!477867))

(declare-fun m!477869 () Bool)

(assert (=> b!496594 m!477869))

(declare-fun m!477871 () Bool)

(assert (=> b!496595 m!477871))

(declare-fun m!477873 () Bool)

(assert (=> b!496590 m!477873))

(assert (=> b!496590 m!477845))

(declare-fun m!477875 () Bool)

(assert (=> b!496591 m!477875))

(declare-fun m!477877 () Bool)

(assert (=> start!45228 m!477877))

(declare-fun m!477879 () Bool)

(assert (=> start!45228 m!477879))

(push 1)

