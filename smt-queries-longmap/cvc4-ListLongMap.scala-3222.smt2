; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45082 () Bool)

(assert start!45082)

(declare-fun b!494876 () Bool)

(declare-fun res!297447 () Bool)

(declare-fun e!290360 () Bool)

(assert (=> b!494876 (=> (not res!297447) (not e!290360))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494876 (= res!297447 (validKeyInArray!0 k!2280))))

(declare-fun b!494877 () Bool)

(declare-fun res!297446 () Bool)

(declare-fun e!290358 () Bool)

(assert (=> b!494877 (=> (not res!297446) (not e!290358))))

(declare-datatypes ((array!32027 0))(
  ( (array!32028 (arr!15398 (Array (_ BitVec 32) (_ BitVec 64))) (size!15762 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32027)

(declare-datatypes ((List!9556 0))(
  ( (Nil!9553) (Cons!9552 (h!10420 (_ BitVec 64)) (t!15784 List!9556)) )
))
(declare-fun arrayNoDuplicates!0 (array!32027 (_ BitVec 32) List!9556) Bool)

(assert (=> b!494877 (= res!297446 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9553))))

(declare-fun b!494878 () Bool)

(declare-fun res!297451 () Bool)

(assert (=> b!494878 (=> (not res!297451) (not e!290358))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32027 (_ BitVec 32)) Bool)

(assert (=> b!494878 (= res!297451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494880 () Bool)

(declare-fun res!297448 () Bool)

(assert (=> b!494880 (=> (not res!297448) (not e!290360))))

(declare-fun arrayContainsKey!0 (array!32027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494880 (= res!297448 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494881 () Bool)

(assert (=> b!494881 (= e!290360 e!290358)))

(declare-fun res!297455 () Bool)

(assert (=> b!494881 (=> (not res!297455) (not e!290358))))

(declare-datatypes ((SeekEntryResult!3865 0))(
  ( (MissingZero!3865 (index!17639 (_ BitVec 32))) (Found!3865 (index!17640 (_ BitVec 32))) (Intermediate!3865 (undefined!4677 Bool) (index!17641 (_ BitVec 32)) (x!46703 (_ BitVec 32))) (Undefined!3865) (MissingVacant!3865 (index!17642 (_ BitVec 32))) )
))
(declare-fun lt!224033 () SeekEntryResult!3865)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494881 (= res!297455 (or (= lt!224033 (MissingZero!3865 i!1204)) (= lt!224033 (MissingVacant!3865 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32027 (_ BitVec 32)) SeekEntryResult!3865)

(assert (=> b!494881 (= lt!224033 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!494882 () Bool)

(declare-fun res!297450 () Bool)

(declare-fun e!290359 () Bool)

(assert (=> b!494882 (=> res!297450 e!290359)))

(declare-fun lt!224036 () SeekEntryResult!3865)

(assert (=> b!494882 (= res!297450 (or (not (is-Intermediate!3865 lt!224036)) (not (undefined!4677 lt!224036))))))

(declare-fun b!494883 () Bool)

(declare-fun res!297449 () Bool)

(assert (=> b!494883 (=> (not res!297449) (not e!290360))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494883 (= res!297449 (validKeyInArray!0 (select (arr!15398 a!3235) j!176)))))

(declare-fun b!494884 () Bool)

(assert (=> b!494884 (= e!290358 (not e!290359))))

(declare-fun res!297453 () Bool)

(assert (=> b!494884 (=> res!297453 e!290359)))

(declare-fun lt!224035 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32027 (_ BitVec 32)) SeekEntryResult!3865)

(assert (=> b!494884 (= res!297453 (= lt!224036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224035 (select (store (arr!15398 a!3235) i!1204 k!2280) j!176) (array!32028 (store (arr!15398 a!3235) i!1204 k!2280) (size!15762 a!3235)) mask!3524)))))

(declare-fun lt!224034 () (_ BitVec 32))

(assert (=> b!494884 (= lt!224036 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224034 (select (arr!15398 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494884 (= lt!224035 (toIndex!0 (select (store (arr!15398 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!494884 (= lt!224034 (toIndex!0 (select (arr!15398 a!3235) j!176) mask!3524))))

(declare-fun lt!224037 () SeekEntryResult!3865)

(assert (=> b!494884 (= lt!224037 (Found!3865 j!176))))

(assert (=> b!494884 (= lt!224037 (seekEntryOrOpen!0 (select (arr!15398 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!494884 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14676 0))(
  ( (Unit!14677) )
))
(declare-fun lt!224038 () Unit!14676)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32027 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14676)

(assert (=> b!494884 (= lt!224038 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494885 () Bool)

(declare-fun res!297452 () Bool)

(assert (=> b!494885 (=> (not res!297452) (not e!290360))))

(assert (=> b!494885 (= res!297452 (and (= (size!15762 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15762 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15762 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!297454 () Bool)

(assert (=> start!45082 (=> (not res!297454) (not e!290360))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45082 (= res!297454 (validMask!0 mask!3524))))

(assert (=> start!45082 e!290360))

(assert (=> start!45082 true))

(declare-fun array_inv!11194 (array!32027) Bool)

(assert (=> start!45082 (array_inv!11194 a!3235)))

(declare-fun b!494879 () Bool)

(assert (=> b!494879 (= e!290359 true)))

(assert (=> b!494879 (= lt!224037 Undefined!3865)))

(assert (= (and start!45082 res!297454) b!494885))

(assert (= (and b!494885 res!297452) b!494883))

(assert (= (and b!494883 res!297449) b!494876))

(assert (= (and b!494876 res!297447) b!494880))

(assert (= (and b!494880 res!297448) b!494881))

(assert (= (and b!494881 res!297455) b!494878))

(assert (= (and b!494878 res!297451) b!494877))

(assert (= (and b!494877 res!297446) b!494884))

(assert (= (and b!494884 (not res!297453)) b!494882))

(assert (= (and b!494882 (not res!297450)) b!494879))

(declare-fun m!476007 () Bool)

(assert (=> b!494878 m!476007))

(declare-fun m!476009 () Bool)

(assert (=> b!494884 m!476009))

(declare-fun m!476011 () Bool)

(assert (=> b!494884 m!476011))

(declare-fun m!476013 () Bool)

(assert (=> b!494884 m!476013))

(declare-fun m!476015 () Bool)

(assert (=> b!494884 m!476015))

(declare-fun m!476017 () Bool)

(assert (=> b!494884 m!476017))

(assert (=> b!494884 m!476015))

(declare-fun m!476019 () Bool)

(assert (=> b!494884 m!476019))

(assert (=> b!494884 m!476015))

(declare-fun m!476021 () Bool)

(assert (=> b!494884 m!476021))

(assert (=> b!494884 m!476013))

(declare-fun m!476023 () Bool)

(assert (=> b!494884 m!476023))

(assert (=> b!494884 m!476013))

(declare-fun m!476025 () Bool)

(assert (=> b!494884 m!476025))

(assert (=> b!494884 m!476015))

(declare-fun m!476027 () Bool)

(assert (=> b!494884 m!476027))

(declare-fun m!476029 () Bool)

(assert (=> b!494880 m!476029))

(assert (=> b!494883 m!476015))

(assert (=> b!494883 m!476015))

(declare-fun m!476031 () Bool)

(assert (=> b!494883 m!476031))

(declare-fun m!476033 () Bool)

(assert (=> b!494876 m!476033))

(declare-fun m!476035 () Bool)

(assert (=> start!45082 m!476035))

(declare-fun m!476037 () Bool)

(assert (=> start!45082 m!476037))

(declare-fun m!476039 () Bool)

(assert (=> b!494881 m!476039))

(declare-fun m!476041 () Bool)

(assert (=> b!494877 m!476041))

(push 1)

