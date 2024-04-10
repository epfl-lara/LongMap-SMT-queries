; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46244 () Bool)

(assert start!46244)

(declare-fun b!512150 () Bool)

(declare-fun res!312820 () Bool)

(declare-fun e!299151 () Bool)

(assert (=> b!512150 (=> (not res!312820) (not e!299151))))

(declare-datatypes ((array!32898 0))(
  ( (array!32899 (arr!15826 (Array (_ BitVec 32) (_ BitVec 64))) (size!16190 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32898)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32898 (_ BitVec 32)) Bool)

(assert (=> b!512150 (= res!312820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512151 () Bool)

(declare-fun res!312821 () Bool)

(declare-fun e!299148 () Bool)

(assert (=> b!512151 (=> (not res!312821) (not e!299148))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512151 (= res!312821 (validKeyInArray!0 (select (arr!15826 a!3235) j!176)))))

(declare-fun b!512152 () Bool)

(declare-fun res!312817 () Bool)

(assert (=> b!512152 (=> (not res!312817) (not e!299148))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512152 (= res!312817 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512153 () Bool)

(declare-fun e!299150 () Bool)

(assert (=> b!512153 (= e!299151 (not e!299150))))

(declare-fun res!312818 () Bool)

(assert (=> b!512153 (=> res!312818 e!299150)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!234412 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4293 0))(
  ( (MissingZero!4293 (index!19360 (_ BitVec 32))) (Found!4293 (index!19361 (_ BitVec 32))) (Intermediate!4293 (undefined!5105 Bool) (index!19362 (_ BitVec 32)) (x!48308 (_ BitVec 32))) (Undefined!4293) (MissingVacant!4293 (index!19363 (_ BitVec 32))) )
))
(declare-fun lt!234407 () SeekEntryResult!4293)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32898 (_ BitVec 32)) SeekEntryResult!4293)

(assert (=> b!512153 (= res!312818 (= lt!234407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234412 (select (store (arr!15826 a!3235) i!1204 k0!2280) j!176) (array!32899 (store (arr!15826 a!3235) i!1204 k0!2280) (size!16190 a!3235)) mask!3524)))))

(declare-fun lt!234410 () (_ BitVec 32))

(assert (=> b!512153 (= lt!234407 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234410 (select (arr!15826 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512153 (= lt!234412 (toIndex!0 (select (store (arr!15826 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512153 (= lt!234410 (toIndex!0 (select (arr!15826 a!3235) j!176) mask!3524))))

(declare-fun lt!234411 () SeekEntryResult!4293)

(assert (=> b!512153 (= lt!234411 (Found!4293 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32898 (_ BitVec 32)) SeekEntryResult!4293)

(assert (=> b!512153 (= lt!234411 (seekEntryOrOpen!0 (select (arr!15826 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!512153 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15844 0))(
  ( (Unit!15845) )
))
(declare-fun lt!234409 () Unit!15844)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32898 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15844)

(assert (=> b!512153 (= lt!234409 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512154 () Bool)

(declare-fun res!312813 () Bool)

(assert (=> b!512154 (=> (not res!312813) (not e!299151))))

(declare-datatypes ((List!9984 0))(
  ( (Nil!9981) (Cons!9980 (h!10860 (_ BitVec 64)) (t!16212 List!9984)) )
))
(declare-fun arrayNoDuplicates!0 (array!32898 (_ BitVec 32) List!9984) Bool)

(assert (=> b!512154 (= res!312813 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9981))))

(declare-fun b!512155 () Bool)

(declare-fun res!312815 () Bool)

(assert (=> b!512155 (=> res!312815 e!299150)))

(get-info :version)

(assert (=> b!512155 (= res!312815 (or (not ((_ is Intermediate!4293) lt!234407)) (not (undefined!5105 lt!234407))))))

(declare-fun b!512156 () Bool)

(assert (=> b!512156 (= e!299148 e!299151)))

(declare-fun res!312812 () Bool)

(assert (=> b!512156 (=> (not res!312812) (not e!299151))))

(declare-fun lt!234408 () SeekEntryResult!4293)

(assert (=> b!512156 (= res!312812 (or (= lt!234408 (MissingZero!4293 i!1204)) (= lt!234408 (MissingVacant!4293 i!1204))))))

(assert (=> b!512156 (= lt!234408 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!512157 () Bool)

(declare-fun res!312814 () Bool)

(assert (=> b!512157 (=> (not res!312814) (not e!299148))))

(assert (=> b!512157 (= res!312814 (validKeyInArray!0 k0!2280))))

(declare-fun res!312819 () Bool)

(assert (=> start!46244 (=> (not res!312819) (not e!299148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46244 (= res!312819 (validMask!0 mask!3524))))

(assert (=> start!46244 e!299148))

(assert (=> start!46244 true))

(declare-fun array_inv!11622 (array!32898) Bool)

(assert (=> start!46244 (array_inv!11622 a!3235)))

(declare-fun b!512158 () Bool)

(declare-fun res!312816 () Bool)

(assert (=> b!512158 (=> (not res!312816) (not e!299148))))

(assert (=> b!512158 (= res!312816 (and (= (size!16190 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16190 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16190 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512159 () Bool)

(assert (=> b!512159 (= e!299150 true)))

(assert (=> b!512159 (= lt!234411 Undefined!4293)))

(assert (= (and start!46244 res!312819) b!512158))

(assert (= (and b!512158 res!312816) b!512151))

(assert (= (and b!512151 res!312821) b!512157))

(assert (= (and b!512157 res!312814) b!512152))

(assert (= (and b!512152 res!312817) b!512156))

(assert (= (and b!512156 res!312812) b!512150))

(assert (= (and b!512150 res!312820) b!512154))

(assert (= (and b!512154 res!312813) b!512153))

(assert (= (and b!512153 (not res!312818)) b!512155))

(assert (= (and b!512155 (not res!312815)) b!512159))

(declare-fun m!493749 () Bool)

(assert (=> b!512151 m!493749))

(assert (=> b!512151 m!493749))

(declare-fun m!493751 () Bool)

(assert (=> b!512151 m!493751))

(declare-fun m!493753 () Bool)

(assert (=> b!512156 m!493753))

(declare-fun m!493755 () Bool)

(assert (=> b!512154 m!493755))

(declare-fun m!493757 () Bool)

(assert (=> b!512152 m!493757))

(declare-fun m!493759 () Bool)

(assert (=> b!512150 m!493759))

(declare-fun m!493761 () Bool)

(assert (=> start!46244 m!493761))

(declare-fun m!493763 () Bool)

(assert (=> start!46244 m!493763))

(declare-fun m!493765 () Bool)

(assert (=> b!512157 m!493765))

(declare-fun m!493767 () Bool)

(assert (=> b!512153 m!493767))

(declare-fun m!493769 () Bool)

(assert (=> b!512153 m!493769))

(declare-fun m!493771 () Bool)

(assert (=> b!512153 m!493771))

(assert (=> b!512153 m!493749))

(declare-fun m!493773 () Bool)

(assert (=> b!512153 m!493773))

(assert (=> b!512153 m!493749))

(declare-fun m!493775 () Bool)

(assert (=> b!512153 m!493775))

(assert (=> b!512153 m!493749))

(declare-fun m!493777 () Bool)

(assert (=> b!512153 m!493777))

(assert (=> b!512153 m!493771))

(declare-fun m!493779 () Bool)

(assert (=> b!512153 m!493779))

(assert (=> b!512153 m!493771))

(declare-fun m!493781 () Bool)

(assert (=> b!512153 m!493781))

(assert (=> b!512153 m!493749))

(declare-fun m!493783 () Bool)

(assert (=> b!512153 m!493783))

(check-sat (not start!46244) (not b!512151) (not b!512153) (not b!512154) (not b!512152) (not b!512150) (not b!512156) (not b!512157))
(check-sat)
