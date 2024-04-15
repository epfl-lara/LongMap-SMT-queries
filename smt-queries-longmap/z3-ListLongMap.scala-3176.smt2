; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44670 () Bool)

(assert start!44670)

(declare-fun b!490028 () Bool)

(declare-fun res!293106 () Bool)

(declare-fun e!288069 () Bool)

(assert (=> b!490028 (=> (not res!293106) (not e!288069))))

(declare-datatypes ((array!31739 0))(
  ( (array!31740 (arr!15257 (Array (_ BitVec 32) (_ BitVec 64))) (size!15622 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31739)

(declare-datatypes ((List!9454 0))(
  ( (Nil!9451) (Cons!9450 (h!10312 (_ BitVec 64)) (t!15673 List!9454)) )
))
(declare-fun arrayNoDuplicates!0 (array!31739 (_ BitVec 32) List!9454) Bool)

(assert (=> b!490028 (= res!293106 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9451))))

(declare-fun b!490029 () Bool)

(declare-fun e!288070 () Bool)

(assert (=> b!490029 (= e!288070 e!288069)))

(declare-fun res!293114 () Bool)

(assert (=> b!490029 (=> (not res!293114) (not e!288069))))

(declare-datatypes ((SeekEntryResult!3721 0))(
  ( (MissingZero!3721 (index!17063 (_ BitVec 32))) (Found!3721 (index!17064 (_ BitVec 32))) (Intermediate!3721 (undefined!4533 Bool) (index!17065 (_ BitVec 32)) (x!46174 (_ BitVec 32))) (Undefined!3721) (MissingVacant!3721 (index!17066 (_ BitVec 32))) )
))
(declare-fun lt!221170 () SeekEntryResult!3721)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490029 (= res!293114 (or (= lt!221170 (MissingZero!3721 i!1204)) (= lt!221170 (MissingVacant!3721 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31739 (_ BitVec 32)) SeekEntryResult!3721)

(assert (=> b!490029 (= lt!221170 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490030 () Bool)

(declare-fun res!293108 () Bool)

(assert (=> b!490030 (=> (not res!293108) (not e!288069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31739 (_ BitVec 32)) Bool)

(assert (=> b!490030 (= res!293108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490031 () Bool)

(declare-fun res!293110 () Bool)

(assert (=> b!490031 (=> (not res!293110) (not e!288070))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!490031 (= res!293110 (and (= (size!15622 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15622 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15622 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!293109 () Bool)

(assert (=> start!44670 (=> (not res!293109) (not e!288070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44670 (= res!293109 (validMask!0 mask!3524))))

(assert (=> start!44670 e!288070))

(assert (=> start!44670 true))

(declare-fun array_inv!11140 (array!31739) Bool)

(assert (=> start!44670 (array_inv!11140 a!3235)))

(declare-fun b!490032 () Bool)

(declare-fun res!293112 () Bool)

(assert (=> b!490032 (=> (not res!293112) (not e!288070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490032 (= res!293112 (validKeyInArray!0 (select (arr!15257 a!3235) j!176)))))

(declare-fun b!490033 () Bool)

(assert (=> b!490033 (= e!288069 (not true))))

(declare-fun lt!221167 () (_ BitVec 32))

(declare-fun lt!221165 () SeekEntryResult!3721)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31739 (_ BitVec 32)) SeekEntryResult!3721)

(assert (=> b!490033 (= lt!221165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221167 (select (store (arr!15257 a!3235) i!1204 k0!2280) j!176) (array!31740 (store (arr!15257 a!3235) i!1204 k0!2280) (size!15622 a!3235)) mask!3524))))

(declare-fun lt!221166 () SeekEntryResult!3721)

(declare-fun lt!221168 () (_ BitVec 32))

(assert (=> b!490033 (= lt!221166 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221168 (select (arr!15257 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490033 (= lt!221167 (toIndex!0 (select (store (arr!15257 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!490033 (= lt!221168 (toIndex!0 (select (arr!15257 a!3235) j!176) mask!3524))))

(declare-fun e!288071 () Bool)

(assert (=> b!490033 e!288071))

(declare-fun res!293113 () Bool)

(assert (=> b!490033 (=> (not res!293113) (not e!288071))))

(assert (=> b!490033 (= res!293113 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14374 0))(
  ( (Unit!14375) )
))
(declare-fun lt!221169 () Unit!14374)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31739 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14374)

(assert (=> b!490033 (= lt!221169 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490034 () Bool)

(declare-fun res!293107 () Bool)

(assert (=> b!490034 (=> (not res!293107) (not e!288070))))

(assert (=> b!490034 (= res!293107 (validKeyInArray!0 k0!2280))))

(declare-fun b!490035 () Bool)

(declare-fun res!293111 () Bool)

(assert (=> b!490035 (=> (not res!293111) (not e!288070))))

(declare-fun arrayContainsKey!0 (array!31739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490035 (= res!293111 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490036 () Bool)

(assert (=> b!490036 (= e!288071 (= (seekEntryOrOpen!0 (select (arr!15257 a!3235) j!176) a!3235 mask!3524) (Found!3721 j!176)))))

(assert (= (and start!44670 res!293109) b!490031))

(assert (= (and b!490031 res!293110) b!490032))

(assert (= (and b!490032 res!293112) b!490034))

(assert (= (and b!490034 res!293107) b!490035))

(assert (= (and b!490035 res!293111) b!490029))

(assert (= (and b!490029 res!293114) b!490030))

(assert (= (and b!490030 res!293108) b!490028))

(assert (= (and b!490028 res!293106) b!490033))

(assert (= (and b!490033 res!293113) b!490036))

(declare-fun m!469609 () Bool)

(assert (=> start!44670 m!469609))

(declare-fun m!469611 () Bool)

(assert (=> start!44670 m!469611))

(declare-fun m!469613 () Bool)

(assert (=> b!490035 m!469613))

(declare-fun m!469615 () Bool)

(assert (=> b!490030 m!469615))

(declare-fun m!469617 () Bool)

(assert (=> b!490033 m!469617))

(declare-fun m!469619 () Bool)

(assert (=> b!490033 m!469619))

(declare-fun m!469621 () Bool)

(assert (=> b!490033 m!469621))

(declare-fun m!469623 () Bool)

(assert (=> b!490033 m!469623))

(declare-fun m!469625 () Bool)

(assert (=> b!490033 m!469625))

(declare-fun m!469627 () Bool)

(assert (=> b!490033 m!469627))

(assert (=> b!490033 m!469623))

(assert (=> b!490033 m!469617))

(declare-fun m!469629 () Bool)

(assert (=> b!490033 m!469629))

(assert (=> b!490033 m!469617))

(declare-fun m!469631 () Bool)

(assert (=> b!490033 m!469631))

(assert (=> b!490033 m!469623))

(declare-fun m!469633 () Bool)

(assert (=> b!490033 m!469633))

(declare-fun m!469635 () Bool)

(assert (=> b!490034 m!469635))

(assert (=> b!490032 m!469617))

(assert (=> b!490032 m!469617))

(declare-fun m!469637 () Bool)

(assert (=> b!490032 m!469637))

(assert (=> b!490036 m!469617))

(assert (=> b!490036 m!469617))

(declare-fun m!469639 () Bool)

(assert (=> b!490036 m!469639))

(declare-fun m!469641 () Bool)

(assert (=> b!490029 m!469641))

(declare-fun m!469643 () Bool)

(assert (=> b!490028 m!469643))

(check-sat (not b!490034) (not b!490030) (not b!490029) (not b!490028) (not start!44670) (not b!490032) (not b!490036) (not b!490035) (not b!490033))
(check-sat)
