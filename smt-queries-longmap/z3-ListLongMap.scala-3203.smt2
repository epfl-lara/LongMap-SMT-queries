; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44966 () Bool)

(assert start!44966)

(declare-fun b!493154 () Bool)

(declare-fun e!289662 () Bool)

(declare-fun e!289660 () Bool)

(assert (=> b!493154 (= e!289662 e!289660)))

(declare-fun res!295724 () Bool)

(assert (=> b!493154 (=> (not res!295724) (not e!289660))))

(declare-datatypes ((SeekEntryResult!3807 0))(
  ( (MissingZero!3807 (index!17407 (_ BitVec 32))) (Found!3807 (index!17408 (_ BitVec 32))) (Intermediate!3807 (undefined!4619 Bool) (index!17409 (_ BitVec 32)) (x!46493 (_ BitVec 32))) (Undefined!3807) (MissingVacant!3807 (index!17410 (_ BitVec 32))) )
))
(declare-fun lt!222993 () SeekEntryResult!3807)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493154 (= res!295724 (or (= lt!222993 (MissingZero!3807 i!1204)) (= lt!222993 (MissingVacant!3807 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31911 0))(
  ( (array!31912 (arr!15340 (Array (_ BitVec 32) (_ BitVec 64))) (size!15704 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31911)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31911 (_ BitVec 32)) SeekEntryResult!3807)

(assert (=> b!493154 (= lt!222993 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493155 () Bool)

(declare-fun res!295732 () Bool)

(assert (=> b!493155 (=> (not res!295732) (not e!289662))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493155 (= res!295732 (validKeyInArray!0 (select (arr!15340 a!3235) j!176)))))

(declare-fun b!493156 () Bool)

(declare-fun res!295727 () Bool)

(assert (=> b!493156 (=> (not res!295727) (not e!289660))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31911 (_ BitVec 32)) Bool)

(assert (=> b!493156 (= res!295727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493157 () Bool)

(declare-fun res!295726 () Bool)

(assert (=> b!493157 (=> (not res!295726) (not e!289660))))

(declare-datatypes ((List!9498 0))(
  ( (Nil!9495) (Cons!9494 (h!10362 (_ BitVec 64)) (t!15726 List!9498)) )
))
(declare-fun arrayNoDuplicates!0 (array!31911 (_ BitVec 32) List!9498) Bool)

(assert (=> b!493157 (= res!295726 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9495))))

(declare-fun b!493158 () Bool)

(declare-fun res!295728 () Bool)

(assert (=> b!493158 (=> (not res!295728) (not e!289662))))

(assert (=> b!493158 (= res!295728 (and (= (size!15704 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15704 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15704 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493160 () Bool)

(declare-fun e!289661 () Bool)

(assert (=> b!493160 (= e!289660 (not e!289661))))

(declare-fun res!295733 () Bool)

(assert (=> b!493160 (=> res!295733 e!289661)))

(declare-fun lt!222995 () SeekEntryResult!3807)

(declare-fun lt!222997 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31911 (_ BitVec 32)) SeekEntryResult!3807)

(assert (=> b!493160 (= res!295733 (= lt!222995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222997 (select (store (arr!15340 a!3235) i!1204 k0!2280) j!176) (array!31912 (store (arr!15340 a!3235) i!1204 k0!2280) (size!15704 a!3235)) mask!3524)))))

(declare-fun lt!222994 () (_ BitVec 32))

(assert (=> b!493160 (= lt!222995 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222994 (select (arr!15340 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493160 (= lt!222997 (toIndex!0 (select (store (arr!15340 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493160 (= lt!222994 (toIndex!0 (select (arr!15340 a!3235) j!176) mask!3524))))

(declare-fun e!289658 () Bool)

(assert (=> b!493160 e!289658))

(declare-fun res!295729 () Bool)

(assert (=> b!493160 (=> (not res!295729) (not e!289658))))

(assert (=> b!493160 (= res!295729 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14560 0))(
  ( (Unit!14561) )
))
(declare-fun lt!222996 () Unit!14560)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31911 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14560)

(assert (=> b!493160 (= lt!222996 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493161 () Bool)

(assert (=> b!493161 (= e!289658 (= (seekEntryOrOpen!0 (select (arr!15340 a!3235) j!176) a!3235 mask!3524) (Found!3807 j!176)))))

(declare-fun b!493162 () Bool)

(get-info :version)

(assert (=> b!493162 (= e!289661 (or (not ((_ is Intermediate!3807) lt!222995)) (not (undefined!4619 lt!222995)) (bvsge mask!3524 #b00000000000000000000000000000000)))))

(declare-fun b!493163 () Bool)

(declare-fun res!295731 () Bool)

(assert (=> b!493163 (=> (not res!295731) (not e!289662))))

(declare-fun arrayContainsKey!0 (array!31911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493163 (= res!295731 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!295725 () Bool)

(assert (=> start!44966 (=> (not res!295725) (not e!289662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44966 (= res!295725 (validMask!0 mask!3524))))

(assert (=> start!44966 e!289662))

(assert (=> start!44966 true))

(declare-fun array_inv!11136 (array!31911) Bool)

(assert (=> start!44966 (array_inv!11136 a!3235)))

(declare-fun b!493159 () Bool)

(declare-fun res!295730 () Bool)

(assert (=> b!493159 (=> (not res!295730) (not e!289662))))

(assert (=> b!493159 (= res!295730 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44966 res!295725) b!493158))

(assert (= (and b!493158 res!295728) b!493155))

(assert (= (and b!493155 res!295732) b!493159))

(assert (= (and b!493159 res!295730) b!493163))

(assert (= (and b!493163 res!295731) b!493154))

(assert (= (and b!493154 res!295724) b!493156))

(assert (= (and b!493156 res!295727) b!493157))

(assert (= (and b!493157 res!295726) b!493160))

(assert (= (and b!493160 res!295729) b!493161))

(assert (= (and b!493160 (not res!295733)) b!493162))

(declare-fun m!473919 () Bool)

(assert (=> b!493157 m!473919))

(declare-fun m!473921 () Bool)

(assert (=> b!493160 m!473921))

(declare-fun m!473923 () Bool)

(assert (=> b!493160 m!473923))

(declare-fun m!473925 () Bool)

(assert (=> b!493160 m!473925))

(declare-fun m!473927 () Bool)

(assert (=> b!493160 m!473927))

(declare-fun m!473929 () Bool)

(assert (=> b!493160 m!473929))

(assert (=> b!493160 m!473927))

(declare-fun m!473931 () Bool)

(assert (=> b!493160 m!473931))

(assert (=> b!493160 m!473927))

(assert (=> b!493160 m!473925))

(declare-fun m!473933 () Bool)

(assert (=> b!493160 m!473933))

(declare-fun m!473935 () Bool)

(assert (=> b!493160 m!473935))

(assert (=> b!493160 m!473925))

(declare-fun m!473937 () Bool)

(assert (=> b!493160 m!473937))

(declare-fun m!473939 () Bool)

(assert (=> start!44966 m!473939))

(declare-fun m!473941 () Bool)

(assert (=> start!44966 m!473941))

(assert (=> b!493155 m!473927))

(assert (=> b!493155 m!473927))

(declare-fun m!473943 () Bool)

(assert (=> b!493155 m!473943))

(assert (=> b!493161 m!473927))

(assert (=> b!493161 m!473927))

(declare-fun m!473945 () Bool)

(assert (=> b!493161 m!473945))

(declare-fun m!473947 () Bool)

(assert (=> b!493154 m!473947))

(declare-fun m!473949 () Bool)

(assert (=> b!493156 m!473949))

(declare-fun m!473951 () Bool)

(assert (=> b!493163 m!473951))

(declare-fun m!473953 () Bool)

(assert (=> b!493159 m!473953))

(check-sat (not b!493160) (not b!493157) (not start!44966) (not b!493155) (not b!493154) (not b!493159) (not b!493161) (not b!493163) (not b!493156))
(check-sat)
