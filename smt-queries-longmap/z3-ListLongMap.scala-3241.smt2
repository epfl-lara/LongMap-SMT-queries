; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45240 () Bool)

(assert start!45240)

(declare-fun b!496710 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32138 0))(
  ( (array!32139 (arr!15452 (Array (_ BitVec 32) (_ BitVec 64))) (size!15817 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32138)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!291197 () Bool)

(declare-datatypes ((SeekEntryResult!3916 0))(
  ( (MissingZero!3916 (index!17843 (_ BitVec 32))) (Found!3916 (index!17844 (_ BitVec 32))) (Intermediate!3916 (undefined!4728 Bool) (index!17845 (_ BitVec 32)) (x!46907 (_ BitVec 32))) (Undefined!3916) (MissingVacant!3916 (index!17846 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32138 (_ BitVec 32)) SeekEntryResult!3916)

(assert (=> b!496710 (= e!291197 (= (seekEntryOrOpen!0 (select (arr!15452 a!3235) j!176) a!3235 mask!3524) (Found!3916 j!176)))))

(declare-fun b!496711 () Bool)

(declare-fun e!291198 () Bool)

(assert (=> b!496711 (= e!291198 true)))

(declare-fun lt!224757 () SeekEntryResult!3916)

(assert (=> b!496711 (and (bvslt (x!46907 lt!224757) #b01111111111111111111111111111110) (or (= (select (arr!15452 a!3235) (index!17845 lt!224757)) (select (arr!15452 a!3235) j!176)) (= (select (arr!15452 a!3235) (index!17845 lt!224757)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15452 a!3235) (index!17845 lt!224757)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!299243 () Bool)

(declare-fun e!291196 () Bool)

(assert (=> start!45240 (=> (not res!299243) (not e!291196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45240 (= res!299243 (validMask!0 mask!3524))))

(assert (=> start!45240 e!291196))

(assert (=> start!45240 true))

(declare-fun array_inv!11335 (array!32138) Bool)

(assert (=> start!45240 (array_inv!11335 a!3235)))

(declare-fun b!496712 () Bool)

(declare-fun res!299241 () Bool)

(assert (=> b!496712 (=> res!299241 e!291198)))

(get-info :version)

(assert (=> b!496712 (= res!299241 (or (undefined!4728 lt!224757) (not ((_ is Intermediate!3916) lt!224757))))))

(declare-fun b!496713 () Bool)

(declare-fun e!291195 () Bool)

(assert (=> b!496713 (= e!291196 e!291195)))

(declare-fun res!299239 () Bool)

(assert (=> b!496713 (=> (not res!299239) (not e!291195))))

(declare-fun lt!224754 () SeekEntryResult!3916)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!496713 (= res!299239 (or (= lt!224754 (MissingZero!3916 i!1204)) (= lt!224754 (MissingVacant!3916 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!496713 (= lt!224754 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!496714 () Bool)

(declare-fun res!299240 () Bool)

(assert (=> b!496714 (=> (not res!299240) (not e!291195))))

(declare-datatypes ((List!9649 0))(
  ( (Nil!9646) (Cons!9645 (h!10516 (_ BitVec 64)) (t!15868 List!9649)) )
))
(declare-fun arrayNoDuplicates!0 (array!32138 (_ BitVec 32) List!9649) Bool)

(assert (=> b!496714 (= res!299240 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9646))))

(declare-fun b!496715 () Bool)

(declare-fun res!299248 () Bool)

(assert (=> b!496715 (=> (not res!299248) (not e!291196))))

(declare-fun arrayContainsKey!0 (array!32138 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496715 (= res!299248 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496716 () Bool)

(declare-fun res!299242 () Bool)

(assert (=> b!496716 (=> (not res!299242) (not e!291195))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32138 (_ BitVec 32)) Bool)

(assert (=> b!496716 (= res!299242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496717 () Bool)

(declare-fun res!299245 () Bool)

(assert (=> b!496717 (=> (not res!299245) (not e!291196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496717 (= res!299245 (validKeyInArray!0 k0!2280))))

(declare-fun b!496718 () Bool)

(declare-fun res!299247 () Bool)

(assert (=> b!496718 (=> (not res!299247) (not e!291196))))

(assert (=> b!496718 (= res!299247 (validKeyInArray!0 (select (arr!15452 a!3235) j!176)))))

(declare-fun b!496719 () Bool)

(declare-fun res!299249 () Bool)

(assert (=> b!496719 (=> (not res!299249) (not e!291196))))

(assert (=> b!496719 (= res!299249 (and (= (size!15817 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15817 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15817 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!496720 () Bool)

(assert (=> b!496720 (= e!291195 (not e!291198))))

(declare-fun res!299246 () Bool)

(assert (=> b!496720 (=> res!299246 e!291198)))

(declare-fun lt!224758 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32138 (_ BitVec 32)) SeekEntryResult!3916)

(assert (=> b!496720 (= res!299246 (= lt!224757 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224758 (select (store (arr!15452 a!3235) i!1204 k0!2280) j!176) (array!32139 (store (arr!15452 a!3235) i!1204 k0!2280) (size!15817 a!3235)) mask!3524)))))

(declare-fun lt!224756 () (_ BitVec 32))

(assert (=> b!496720 (= lt!224757 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224756 (select (arr!15452 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496720 (= lt!224758 (toIndex!0 (select (store (arr!15452 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!496720 (= lt!224756 (toIndex!0 (select (arr!15452 a!3235) j!176) mask!3524))))

(assert (=> b!496720 e!291197))

(declare-fun res!299244 () Bool)

(assert (=> b!496720 (=> (not res!299244) (not e!291197))))

(assert (=> b!496720 (= res!299244 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14764 0))(
  ( (Unit!14765) )
))
(declare-fun lt!224755 () Unit!14764)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32138 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14764)

(assert (=> b!496720 (= lt!224755 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45240 res!299243) b!496719))

(assert (= (and b!496719 res!299249) b!496718))

(assert (= (and b!496718 res!299247) b!496717))

(assert (= (and b!496717 res!299245) b!496715))

(assert (= (and b!496715 res!299248) b!496713))

(assert (= (and b!496713 res!299239) b!496716))

(assert (= (and b!496716 res!299242) b!496714))

(assert (= (and b!496714 res!299240) b!496720))

(assert (= (and b!496720 res!299244) b!496710))

(assert (= (and b!496720 (not res!299246)) b!496712))

(assert (= (and b!496712 (not res!299241)) b!496711))

(declare-fun m!477547 () Bool)

(assert (=> b!496716 m!477547))

(declare-fun m!477549 () Bool)

(assert (=> b!496715 m!477549))

(declare-fun m!477551 () Bool)

(assert (=> start!45240 m!477551))

(declare-fun m!477553 () Bool)

(assert (=> start!45240 m!477553))

(declare-fun m!477555 () Bool)

(assert (=> b!496718 m!477555))

(assert (=> b!496718 m!477555))

(declare-fun m!477557 () Bool)

(assert (=> b!496718 m!477557))

(declare-fun m!477559 () Bool)

(assert (=> b!496717 m!477559))

(declare-fun m!477561 () Bool)

(assert (=> b!496711 m!477561))

(assert (=> b!496711 m!477555))

(declare-fun m!477563 () Bool)

(assert (=> b!496713 m!477563))

(assert (=> b!496710 m!477555))

(assert (=> b!496710 m!477555))

(declare-fun m!477565 () Bool)

(assert (=> b!496710 m!477565))

(declare-fun m!477567 () Bool)

(assert (=> b!496720 m!477567))

(declare-fun m!477569 () Bool)

(assert (=> b!496720 m!477569))

(declare-fun m!477571 () Bool)

(assert (=> b!496720 m!477571))

(assert (=> b!496720 m!477555))

(declare-fun m!477573 () Bool)

(assert (=> b!496720 m!477573))

(assert (=> b!496720 m!477555))

(declare-fun m!477575 () Bool)

(assert (=> b!496720 m!477575))

(assert (=> b!496720 m!477571))

(declare-fun m!477577 () Bool)

(assert (=> b!496720 m!477577))

(assert (=> b!496720 m!477571))

(declare-fun m!477579 () Bool)

(assert (=> b!496720 m!477579))

(assert (=> b!496720 m!477555))

(declare-fun m!477581 () Bool)

(assert (=> b!496720 m!477581))

(declare-fun m!477583 () Bool)

(assert (=> b!496714 m!477583))

(check-sat (not b!496715) (not b!496716) (not b!496710) (not b!496714) (not b!496713) (not b!496717) (not start!45240) (not b!496718) (not b!496720))
(check-sat)
