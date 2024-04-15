; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44676 () Bool)

(assert start!44676)

(declare-fun b!490109 () Bool)

(declare-fun e!288105 () Bool)

(declare-fun e!288107 () Bool)

(assert (=> b!490109 (= e!288105 e!288107)))

(declare-fun res!293195 () Bool)

(assert (=> b!490109 (=> (not res!293195) (not e!288107))))

(declare-datatypes ((SeekEntryResult!3724 0))(
  ( (MissingZero!3724 (index!17075 (_ BitVec 32))) (Found!3724 (index!17076 (_ BitVec 32))) (Intermediate!3724 (undefined!4536 Bool) (index!17077 (_ BitVec 32)) (x!46185 (_ BitVec 32))) (Undefined!3724) (MissingVacant!3724 (index!17078 (_ BitVec 32))) )
))
(declare-fun lt!221220 () SeekEntryResult!3724)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490109 (= res!293195 (or (= lt!221220 (MissingZero!3724 i!1204)) (= lt!221220 (MissingVacant!3724 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31745 0))(
  ( (array!31746 (arr!15260 (Array (_ BitVec 32) (_ BitVec 64))) (size!15625 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31745)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31745 (_ BitVec 32)) SeekEntryResult!3724)

(assert (=> b!490109 (= lt!221220 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490110 () Bool)

(declare-fun res!293187 () Bool)

(assert (=> b!490110 (=> (not res!293187) (not e!288105))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490110 (= res!293187 (validKeyInArray!0 (select (arr!15260 a!3235) j!176)))))

(declare-fun b!490111 () Bool)

(declare-fun res!293192 () Bool)

(assert (=> b!490111 (=> (not res!293192) (not e!288107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31745 (_ BitVec 32)) Bool)

(assert (=> b!490111 (= res!293192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490112 () Bool)

(declare-fun res!293188 () Bool)

(assert (=> b!490112 (=> (not res!293188) (not e!288107))))

(declare-datatypes ((List!9457 0))(
  ( (Nil!9454) (Cons!9453 (h!10315 (_ BitVec 64)) (t!15676 List!9457)) )
))
(declare-fun arrayNoDuplicates!0 (array!31745 (_ BitVec 32) List!9457) Bool)

(assert (=> b!490112 (= res!293188 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9454))))

(declare-fun b!490113 () Bool)

(declare-fun res!293189 () Bool)

(assert (=> b!490113 (=> (not res!293189) (not e!288105))))

(assert (=> b!490113 (= res!293189 (validKeyInArray!0 k0!2280))))

(declare-fun b!490114 () Bool)

(declare-fun e!288108 () Bool)

(assert (=> b!490114 (= e!288108 (= (seekEntryOrOpen!0 (select (arr!15260 a!3235) j!176) a!3235 mask!3524) (Found!3724 j!176)))))

(declare-fun b!490115 () Bool)

(declare-fun res!293193 () Bool)

(assert (=> b!490115 (=> (not res!293193) (not e!288105))))

(assert (=> b!490115 (= res!293193 (and (= (size!15625 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15625 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15625 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!293191 () Bool)

(assert (=> start!44676 (=> (not res!293191) (not e!288105))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44676 (= res!293191 (validMask!0 mask!3524))))

(assert (=> start!44676 e!288105))

(assert (=> start!44676 true))

(declare-fun array_inv!11143 (array!31745) Bool)

(assert (=> start!44676 (array_inv!11143 a!3235)))

(declare-fun b!490116 () Bool)

(assert (=> b!490116 (= e!288107 (not true))))

(declare-fun lt!221224 () SeekEntryResult!3724)

(declare-fun lt!221222 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31745 (_ BitVec 32)) SeekEntryResult!3724)

(assert (=> b!490116 (= lt!221224 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221222 (select (store (arr!15260 a!3235) i!1204 k0!2280) j!176) (array!31746 (store (arr!15260 a!3235) i!1204 k0!2280) (size!15625 a!3235)) mask!3524))))

(declare-fun lt!221221 () (_ BitVec 32))

(declare-fun lt!221223 () SeekEntryResult!3724)

(assert (=> b!490116 (= lt!221223 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221221 (select (arr!15260 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490116 (= lt!221222 (toIndex!0 (select (store (arr!15260 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!490116 (= lt!221221 (toIndex!0 (select (arr!15260 a!3235) j!176) mask!3524))))

(assert (=> b!490116 e!288108))

(declare-fun res!293194 () Bool)

(assert (=> b!490116 (=> (not res!293194) (not e!288108))))

(assert (=> b!490116 (= res!293194 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14380 0))(
  ( (Unit!14381) )
))
(declare-fun lt!221219 () Unit!14380)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31745 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14380)

(assert (=> b!490116 (= lt!221219 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!490117 () Bool)

(declare-fun res!293190 () Bool)

(assert (=> b!490117 (=> (not res!293190) (not e!288105))))

(declare-fun arrayContainsKey!0 (array!31745 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490117 (= res!293190 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44676 res!293191) b!490115))

(assert (= (and b!490115 res!293193) b!490110))

(assert (= (and b!490110 res!293187) b!490113))

(assert (= (and b!490113 res!293189) b!490117))

(assert (= (and b!490117 res!293190) b!490109))

(assert (= (and b!490109 res!293195) b!490111))

(assert (= (and b!490111 res!293192) b!490112))

(assert (= (and b!490112 res!293188) b!490116))

(assert (= (and b!490116 res!293194) b!490114))

(declare-fun m!469717 () Bool)

(assert (=> start!44676 m!469717))

(declare-fun m!469719 () Bool)

(assert (=> start!44676 m!469719))

(declare-fun m!469721 () Bool)

(assert (=> b!490117 m!469721))

(declare-fun m!469723 () Bool)

(assert (=> b!490109 m!469723))

(declare-fun m!469725 () Bool)

(assert (=> b!490116 m!469725))

(declare-fun m!469727 () Bool)

(assert (=> b!490116 m!469727))

(declare-fun m!469729 () Bool)

(assert (=> b!490116 m!469729))

(declare-fun m!469731 () Bool)

(assert (=> b!490116 m!469731))

(assert (=> b!490116 m!469725))

(declare-fun m!469733 () Bool)

(assert (=> b!490116 m!469733))

(assert (=> b!490116 m!469725))

(declare-fun m!469735 () Bool)

(assert (=> b!490116 m!469735))

(assert (=> b!490116 m!469731))

(declare-fun m!469737 () Bool)

(assert (=> b!490116 m!469737))

(assert (=> b!490116 m!469731))

(declare-fun m!469739 () Bool)

(assert (=> b!490116 m!469739))

(declare-fun m!469741 () Bool)

(assert (=> b!490116 m!469741))

(declare-fun m!469743 () Bool)

(assert (=> b!490111 m!469743))

(assert (=> b!490110 m!469725))

(assert (=> b!490110 m!469725))

(declare-fun m!469745 () Bool)

(assert (=> b!490110 m!469745))

(assert (=> b!490114 m!469725))

(assert (=> b!490114 m!469725))

(declare-fun m!469747 () Bool)

(assert (=> b!490114 m!469747))

(declare-fun m!469749 () Bool)

(assert (=> b!490112 m!469749))

(declare-fun m!469751 () Bool)

(assert (=> b!490113 m!469751))

(check-sat (not b!490109) (not b!490111) (not start!44676) (not b!490110) (not b!490112) (not b!490116) (not b!490114) (not b!490113) (not b!490117))
(check-sat)
