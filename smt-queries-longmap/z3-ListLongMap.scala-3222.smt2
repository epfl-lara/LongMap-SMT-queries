; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45080 () Bool)

(assert start!45080)

(declare-fun b!494846 () Bool)

(declare-fun e!290346 () Bool)

(declare-fun e!290349 () Bool)

(assert (=> b!494846 (= e!290346 (not e!290349))))

(declare-fun res!297420 () Bool)

(assert (=> b!494846 (=> res!297420 e!290349)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32025 0))(
  ( (array!32026 (arr!15397 (Array (_ BitVec 32) (_ BitVec 64))) (size!15761 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32025)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3864 0))(
  ( (MissingZero!3864 (index!17635 (_ BitVec 32))) (Found!3864 (index!17636 (_ BitVec 32))) (Intermediate!3864 (undefined!4676 Bool) (index!17637 (_ BitVec 32)) (x!46702 (_ BitVec 32))) (Undefined!3864) (MissingVacant!3864 (index!17638 (_ BitVec 32))) )
))
(declare-fun lt!224017 () SeekEntryResult!3864)

(declare-fun lt!224019 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32025 (_ BitVec 32)) SeekEntryResult!3864)

(assert (=> b!494846 (= res!297420 (= lt!224017 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224019 (select (store (arr!15397 a!3235) i!1204 k0!2280) j!176) (array!32026 (store (arr!15397 a!3235) i!1204 k0!2280) (size!15761 a!3235)) mask!3524)))))

(declare-fun lt!224016 () (_ BitVec 32))

(assert (=> b!494846 (= lt!224017 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224016 (select (arr!15397 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!494846 (= lt!224019 (toIndex!0 (select (store (arr!15397 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!494846 (= lt!224016 (toIndex!0 (select (arr!15397 a!3235) j!176) mask!3524))))

(declare-fun lt!224018 () SeekEntryResult!3864)

(assert (=> b!494846 (= lt!224018 (Found!3864 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32025 (_ BitVec 32)) SeekEntryResult!3864)

(assert (=> b!494846 (= lt!224018 (seekEntryOrOpen!0 (select (arr!15397 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32025 (_ BitVec 32)) Bool)

(assert (=> b!494846 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14674 0))(
  ( (Unit!14675) )
))
(declare-fun lt!224015 () Unit!14674)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32025 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14674)

(assert (=> b!494846 (= lt!224015 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!494847 () Bool)

(declare-fun e!290348 () Bool)

(assert (=> b!494847 (= e!290348 e!290346)))

(declare-fun res!297424 () Bool)

(assert (=> b!494847 (=> (not res!297424) (not e!290346))))

(declare-fun lt!224020 () SeekEntryResult!3864)

(assert (=> b!494847 (= res!297424 (or (= lt!224020 (MissingZero!3864 i!1204)) (= lt!224020 (MissingVacant!3864 i!1204))))))

(assert (=> b!494847 (= lt!224020 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!494848 () Bool)

(declare-fun res!297421 () Bool)

(assert (=> b!494848 (=> (not res!297421) (not e!290348))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!494848 (= res!297421 (validKeyInArray!0 (select (arr!15397 a!3235) j!176)))))

(declare-fun res!297419 () Bool)

(assert (=> start!45080 (=> (not res!297419) (not e!290348))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45080 (= res!297419 (validMask!0 mask!3524))))

(assert (=> start!45080 e!290348))

(assert (=> start!45080 true))

(declare-fun array_inv!11193 (array!32025) Bool)

(assert (=> start!45080 (array_inv!11193 a!3235)))

(declare-fun b!494849 () Bool)

(declare-fun res!297417 () Bool)

(assert (=> b!494849 (=> (not res!297417) (not e!290346))))

(declare-datatypes ((List!9555 0))(
  ( (Nil!9552) (Cons!9551 (h!10419 (_ BitVec 64)) (t!15783 List!9555)) )
))
(declare-fun arrayNoDuplicates!0 (array!32025 (_ BitVec 32) List!9555) Bool)

(assert (=> b!494849 (= res!297417 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9552))))

(declare-fun b!494850 () Bool)

(declare-fun res!297423 () Bool)

(assert (=> b!494850 (=> (not res!297423) (not e!290348))))

(declare-fun arrayContainsKey!0 (array!32025 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!494850 (= res!297423 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!494851 () Bool)

(declare-fun res!297416 () Bool)

(assert (=> b!494851 (=> res!297416 e!290349)))

(get-info :version)

(assert (=> b!494851 (= res!297416 (or (not ((_ is Intermediate!3864) lt!224017)) (not (undefined!4676 lt!224017))))))

(declare-fun b!494852 () Bool)

(declare-fun res!297418 () Bool)

(assert (=> b!494852 (=> (not res!297418) (not e!290348))))

(assert (=> b!494852 (= res!297418 (and (= (size!15761 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15761 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15761 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!494853 () Bool)

(declare-fun res!297422 () Bool)

(assert (=> b!494853 (=> (not res!297422) (not e!290346))))

(assert (=> b!494853 (= res!297422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!494854 () Bool)

(assert (=> b!494854 (= e!290349 true)))

(assert (=> b!494854 (= lt!224018 Undefined!3864)))

(declare-fun b!494855 () Bool)

(declare-fun res!297425 () Bool)

(assert (=> b!494855 (=> (not res!297425) (not e!290348))))

(assert (=> b!494855 (= res!297425 (validKeyInArray!0 k0!2280))))

(assert (= (and start!45080 res!297419) b!494852))

(assert (= (and b!494852 res!297418) b!494848))

(assert (= (and b!494848 res!297421) b!494855))

(assert (= (and b!494855 res!297425) b!494850))

(assert (= (and b!494850 res!297423) b!494847))

(assert (= (and b!494847 res!297424) b!494853))

(assert (= (and b!494853 res!297422) b!494849))

(assert (= (and b!494849 res!297417) b!494846))

(assert (= (and b!494846 (not res!297420)) b!494851))

(assert (= (and b!494851 (not res!297416)) b!494854))

(declare-fun m!475971 () Bool)

(assert (=> b!494855 m!475971))

(declare-fun m!475973 () Bool)

(assert (=> start!45080 m!475973))

(declare-fun m!475975 () Bool)

(assert (=> start!45080 m!475975))

(declare-fun m!475977 () Bool)

(assert (=> b!494848 m!475977))

(assert (=> b!494848 m!475977))

(declare-fun m!475979 () Bool)

(assert (=> b!494848 m!475979))

(declare-fun m!475981 () Bool)

(assert (=> b!494853 m!475981))

(declare-fun m!475983 () Bool)

(assert (=> b!494850 m!475983))

(declare-fun m!475985 () Bool)

(assert (=> b!494847 m!475985))

(declare-fun m!475987 () Bool)

(assert (=> b!494846 m!475987))

(declare-fun m!475989 () Bool)

(assert (=> b!494846 m!475989))

(assert (=> b!494846 m!475977))

(declare-fun m!475991 () Bool)

(assert (=> b!494846 m!475991))

(assert (=> b!494846 m!475977))

(declare-fun m!475993 () Bool)

(assert (=> b!494846 m!475993))

(assert (=> b!494846 m!475977))

(declare-fun m!475995 () Bool)

(assert (=> b!494846 m!475995))

(assert (=> b!494846 m!475977))

(declare-fun m!475997 () Bool)

(assert (=> b!494846 m!475997))

(assert (=> b!494846 m!475989))

(declare-fun m!475999 () Bool)

(assert (=> b!494846 m!475999))

(assert (=> b!494846 m!475989))

(declare-fun m!476001 () Bool)

(assert (=> b!494846 m!476001))

(declare-fun m!476003 () Bool)

(assert (=> b!494846 m!476003))

(declare-fun m!476005 () Bool)

(assert (=> b!494849 m!476005))

(check-sat (not b!494850) (not b!494853) (not b!494855) (not b!494849) (not start!45080) (not b!494848) (not b!494846) (not b!494847))
(check-sat)
