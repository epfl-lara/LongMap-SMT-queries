; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45980 () Bool)

(assert start!45980)

(declare-fun b!509028 () Bool)

(declare-fun res!309874 () Bool)

(declare-fun e!297741 () Bool)

(assert (=> b!509028 (=> (not res!309874) (not e!297741))))

(declare-datatypes ((array!32691 0))(
  ( (array!32692 (arr!15724 (Array (_ BitVec 32) (_ BitVec 64))) (size!16088 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32691)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509028 (= res!309874 (validKeyInArray!0 (select (arr!15724 a!3235) j!176)))))

(declare-fun b!509029 () Bool)

(declare-fun res!309881 () Bool)

(declare-fun e!297738 () Bool)

(assert (=> b!509029 (=> (not res!309881) (not e!297738))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32691 (_ BitVec 32)) Bool)

(assert (=> b!509029 (= res!309881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509030 () Bool)

(declare-fun res!309873 () Bool)

(assert (=> b!509030 (=> (not res!309873) (not e!297741))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!509030 (= res!309873 (validKeyInArray!0 k0!2280))))

(declare-fun res!309877 () Bool)

(assert (=> start!45980 (=> (not res!309877) (not e!297741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45980 (= res!309877 (validMask!0 mask!3524))))

(assert (=> start!45980 e!297741))

(assert (=> start!45980 true))

(declare-fun array_inv!11520 (array!32691) Bool)

(assert (=> start!45980 (array_inv!11520 a!3235)))

(declare-fun b!509031 () Bool)

(declare-fun res!309876 () Bool)

(assert (=> b!509031 (=> (not res!309876) (not e!297741))))

(declare-fun arrayContainsKey!0 (array!32691 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509031 (= res!309876 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!509032 () Bool)

(declare-fun res!309879 () Bool)

(assert (=> b!509032 (=> (not res!309879) (not e!297738))))

(declare-datatypes ((List!9882 0))(
  ( (Nil!9879) (Cons!9878 (h!10755 (_ BitVec 64)) (t!16110 List!9882)) )
))
(declare-fun arrayNoDuplicates!0 (array!32691 (_ BitVec 32) List!9882) Bool)

(assert (=> b!509032 (= res!309879 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9879))))

(declare-fun b!509033 () Bool)

(declare-fun res!309875 () Bool)

(assert (=> b!509033 (=> (not res!309875) (not e!297741))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!509033 (= res!309875 (and (= (size!16088 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16088 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16088 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509034 () Bool)

(assert (=> b!509034 (= e!297738 (not true))))

(declare-datatypes ((SeekEntryResult!4191 0))(
  ( (MissingZero!4191 (index!18952 (_ BitVec 32))) (Found!4191 (index!18953 (_ BitVec 32))) (Intermediate!4191 (undefined!5003 Bool) (index!18954 (_ BitVec 32)) (x!47928 (_ BitVec 32))) (Undefined!4191) (MissingVacant!4191 (index!18955 (_ BitVec 32))) )
))
(declare-fun lt!232443 () SeekEntryResult!4191)

(declare-fun lt!232444 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32691 (_ BitVec 32)) SeekEntryResult!4191)

(assert (=> b!509034 (= lt!232443 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232444 (select (store (arr!15724 a!3235) i!1204 k0!2280) j!176) (array!32692 (store (arr!15724 a!3235) i!1204 k0!2280) (size!16088 a!3235)) mask!3524))))

(declare-fun lt!232445 () SeekEntryResult!4191)

(declare-fun lt!232447 () (_ BitVec 32))

(assert (=> b!509034 (= lt!232445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!232447 (select (arr!15724 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509034 (= lt!232444 (toIndex!0 (select (store (arr!15724 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!509034 (= lt!232447 (toIndex!0 (select (arr!15724 a!3235) j!176) mask!3524))))

(declare-fun e!297739 () Bool)

(assert (=> b!509034 e!297739))

(declare-fun res!309880 () Bool)

(assert (=> b!509034 (=> (not res!309880) (not e!297739))))

(assert (=> b!509034 (= res!309880 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15640 0))(
  ( (Unit!15641) )
))
(declare-fun lt!232442 () Unit!15640)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32691 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15640)

(assert (=> b!509034 (= lt!232442 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!509035 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32691 (_ BitVec 32)) SeekEntryResult!4191)

(assert (=> b!509035 (= e!297739 (= (seekEntryOrOpen!0 (select (arr!15724 a!3235) j!176) a!3235 mask!3524) (Found!4191 j!176)))))

(declare-fun b!509036 () Bool)

(assert (=> b!509036 (= e!297741 e!297738)))

(declare-fun res!309878 () Bool)

(assert (=> b!509036 (=> (not res!309878) (not e!297738))))

(declare-fun lt!232446 () SeekEntryResult!4191)

(assert (=> b!509036 (= res!309878 (or (= lt!232446 (MissingZero!4191 i!1204)) (= lt!232446 (MissingVacant!4191 i!1204))))))

(assert (=> b!509036 (= lt!232446 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45980 res!309877) b!509033))

(assert (= (and b!509033 res!309875) b!509028))

(assert (= (and b!509028 res!309874) b!509030))

(assert (= (and b!509030 res!309873) b!509031))

(assert (= (and b!509031 res!309876) b!509036))

(assert (= (and b!509036 res!309878) b!509029))

(assert (= (and b!509029 res!309881) b!509032))

(assert (= (and b!509032 res!309879) b!509034))

(assert (= (and b!509034 res!309880) b!509035))

(declare-fun m!489777 () Bool)

(assert (=> b!509035 m!489777))

(assert (=> b!509035 m!489777))

(declare-fun m!489779 () Bool)

(assert (=> b!509035 m!489779))

(declare-fun m!489781 () Bool)

(assert (=> b!509031 m!489781))

(declare-fun m!489783 () Bool)

(assert (=> b!509030 m!489783))

(declare-fun m!489785 () Bool)

(assert (=> b!509034 m!489785))

(declare-fun m!489787 () Bool)

(assert (=> b!509034 m!489787))

(assert (=> b!509034 m!489777))

(declare-fun m!489789 () Bool)

(assert (=> b!509034 m!489789))

(assert (=> b!509034 m!489777))

(declare-fun m!489791 () Bool)

(assert (=> b!509034 m!489791))

(declare-fun m!489793 () Bool)

(assert (=> b!509034 m!489793))

(declare-fun m!489795 () Bool)

(assert (=> b!509034 m!489795))

(assert (=> b!509034 m!489793))

(declare-fun m!489797 () Bool)

(assert (=> b!509034 m!489797))

(assert (=> b!509034 m!489793))

(assert (=> b!509034 m!489777))

(declare-fun m!489799 () Bool)

(assert (=> b!509034 m!489799))

(declare-fun m!489801 () Bool)

(assert (=> b!509032 m!489801))

(declare-fun m!489803 () Bool)

(assert (=> b!509029 m!489803))

(declare-fun m!489805 () Bool)

(assert (=> b!509036 m!489805))

(assert (=> b!509028 m!489777))

(assert (=> b!509028 m!489777))

(declare-fun m!489807 () Bool)

(assert (=> b!509028 m!489807))

(declare-fun m!489809 () Bool)

(assert (=> start!45980 m!489809))

(declare-fun m!489811 () Bool)

(assert (=> start!45980 m!489811))

(check-sat (not start!45980) (not b!509029) (not b!509035) (not b!509028) (not b!509030) (not b!509036) (not b!509034) (not b!509031) (not b!509032))
(check-sat)
