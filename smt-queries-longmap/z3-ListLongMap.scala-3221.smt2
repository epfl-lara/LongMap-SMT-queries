; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45062 () Bool)

(assert start!45062)

(declare-fun b!494665 () Bool)

(declare-fun e!290262 () Bool)

(assert (=> b!494665 (= e!290262 true)))

(declare-datatypes ((SeekEntryResult!3811 0))(
  ( (MissingZero!3811 (index!17423 (_ BitVec 32))) (Found!3811 (index!17424 (_ BitVec 32))) (Intermediate!3811 (undefined!4623 Bool) (index!17425 (_ BitVec 32)) (x!46638 (_ BitVec 32))) (Undefined!3811) (MissingVacant!3811 (index!17426 (_ BitVec 32))) )
))
(declare-fun lt!223960 () SeekEntryResult!3811)

(assert (=> b!494665 (= lt!223960 Undefined!3811)))

(declare-fun b!494666 () Bool)

(declare-fun res!297296 () Bool)

(declare-fun e!290261 () Bool)

(assert (=> b!494666 (=> (not res!297296) (not e!290261))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494666 (= res!297296 (validKeyInArray!0 k0!2280))))

(declare-fun b!494667 () Bool)

(declare-fun e!290260 () Bool)

(assert (=> b!494667 (= e!290261 e!290260)))

(declare-fun res!297292 () Bool)

(assert (=> b!494667 (=> (not res!297292) (not e!290260))))

(declare-fun lt!223959 () SeekEntryResult!3811)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!494667 (= res!297292 (or (= lt!223959 (MissingZero!3811 i!1204)) (= lt!223959 (MissingVacant!3811 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32008 0))(
  ( (array!32009 (arr!15388 (Array (_ BitVec 32) (_ BitVec 64))) (size!15752 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32008)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32008 (_ BitVec 32)) SeekEntryResult!3811)

(assert (=> b!494667 (= lt!223959 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494669 () Bool)

(declare-fun res!297289 () Bool)

(assert (=> b!494669 (=> res!297289 e!290262)))

(declare-fun lt!223958 () SeekEntryResult!3811)

(get-info :version)

(assert (=> b!494669 (= res!297289 (or (not ((_ is Intermediate!3811) lt!223958)) (not (undefined!4623 lt!223958))))))

(declare-fun b!494670 () Bool)

(declare-fun res!297290 () Bool)

(assert (=> b!494670 (=> (not res!297290) (not e!290261))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!494670 (= res!297290 (validKeyInArray!0 (select (arr!15388 a!3235) j!176)))))

(declare-fun b!494668 () Bool)

(declare-fun res!297291 () Bool)

(assert (=> b!494668 (=> (not res!297291) (not e!290261))))

(assert (=> b!494668 (= res!297291 (and (= (size!15752 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15752 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15752 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!297298 () Bool)

(assert (=> start!45062 (=> (not res!297298) (not e!290261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45062 (= res!297298 (validMask!0 mask!3524))))

(assert (=> start!45062 e!290261))

(assert (=> start!45062 true))

(declare-fun array_inv!11247 (array!32008) Bool)

(assert (=> start!45062 (array_inv!11247 a!3235)))

(declare-fun b!494671 () Bool)

(declare-fun res!297295 () Bool)

(assert (=> b!494671 (=> (not res!297295) (not e!290261))))

(declare-fun arrayContainsKey!0 (array!32008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494671 (= res!297295 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494672 () Bool)

(assert (=> b!494672 (= e!290260 (not e!290262))))

(declare-fun res!297297 () Bool)

(assert (=> b!494672 (=> res!297297 e!290262)))

(declare-fun lt!223957 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32008 (_ BitVec 32)) SeekEntryResult!3811)

(assert (=> b!494672 (= res!297297 (= lt!223958 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223957 (select (store (arr!15388 a!3235) i!1204 k0!2280) j!176) (array!32009 (store (arr!15388 a!3235) i!1204 k0!2280) (size!15752 a!3235)) mask!3524)))))

(declare-fun lt!223955 () (_ BitVec 32))

(assert (=> b!494672 (= lt!223958 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223955 (select (arr!15388 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494672 (= lt!223957 (toIndex!0 (select (store (arr!15388 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494672 (= lt!223955 (toIndex!0 (select (arr!15388 a!3235) j!176) mask!3524))))

(assert (=> b!494672 (= lt!223960 (Found!3811 j!176))))

(assert (=> b!494672 (= lt!223960 (seekEntryOrOpen!0 (select (arr!15388 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32008 (_ BitVec 32)) Bool)

(assert (=> b!494672 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14629 0))(
  ( (Unit!14630) )
))
(declare-fun lt!223956 () Unit!14629)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32008 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14629)

(assert (=> b!494672 (= lt!223956 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494673 () Bool)

(declare-fun res!297294 () Bool)

(assert (=> b!494673 (=> (not res!297294) (not e!290260))))

(declare-datatypes ((List!9453 0))(
  ( (Nil!9450) (Cons!9449 (h!10317 (_ BitVec 64)) (t!15673 List!9453)) )
))
(declare-fun arrayNoDuplicates!0 (array!32008 (_ BitVec 32) List!9453) Bool)

(assert (=> b!494673 (= res!297294 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9450))))

(declare-fun b!494674 () Bool)

(declare-fun res!297293 () Bool)

(assert (=> b!494674 (=> (not res!297293) (not e!290260))))

(assert (=> b!494674 (= res!297293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45062 res!297298) b!494668))

(assert (= (and b!494668 res!297291) b!494670))

(assert (= (and b!494670 res!297290) b!494666))

(assert (= (and b!494666 res!297296) b!494671))

(assert (= (and b!494671 res!297295) b!494667))

(assert (= (and b!494667 res!297292) b!494674))

(assert (= (and b!494674 res!297293) b!494673))

(assert (= (and b!494673 res!297294) b!494672))

(assert (= (and b!494672 (not res!297297)) b!494669))

(assert (= (and b!494669 (not res!297289)) b!494665))

(declare-fun m!476011 () Bool)

(assert (=> start!45062 m!476011))

(declare-fun m!476013 () Bool)

(assert (=> start!45062 m!476013))

(declare-fun m!476015 () Bool)

(assert (=> b!494672 m!476015))

(declare-fun m!476017 () Bool)

(assert (=> b!494672 m!476017))

(declare-fun m!476019 () Bool)

(assert (=> b!494672 m!476019))

(declare-fun m!476021 () Bool)

(assert (=> b!494672 m!476021))

(declare-fun m!476023 () Bool)

(assert (=> b!494672 m!476023))

(assert (=> b!494672 m!476019))

(declare-fun m!476025 () Bool)

(assert (=> b!494672 m!476025))

(assert (=> b!494672 m!476021))

(declare-fun m!476027 () Bool)

(assert (=> b!494672 m!476027))

(assert (=> b!494672 m!476021))

(declare-fun m!476029 () Bool)

(assert (=> b!494672 m!476029))

(assert (=> b!494672 m!476019))

(declare-fun m!476031 () Bool)

(assert (=> b!494672 m!476031))

(assert (=> b!494672 m!476021))

(declare-fun m!476033 () Bool)

(assert (=> b!494672 m!476033))

(declare-fun m!476035 () Bool)

(assert (=> b!494666 m!476035))

(assert (=> b!494670 m!476021))

(assert (=> b!494670 m!476021))

(declare-fun m!476037 () Bool)

(assert (=> b!494670 m!476037))

(declare-fun m!476039 () Bool)

(assert (=> b!494667 m!476039))

(declare-fun m!476041 () Bool)

(assert (=> b!494671 m!476041))

(declare-fun m!476043 () Bool)

(assert (=> b!494674 m!476043))

(declare-fun m!476045 () Bool)

(assert (=> b!494673 m!476045))

(check-sat (not start!45062) (not b!494666) (not b!494667) (not b!494674) (not b!494671) (not b!494673) (not b!494672) (not b!494670))
(check-sat)
