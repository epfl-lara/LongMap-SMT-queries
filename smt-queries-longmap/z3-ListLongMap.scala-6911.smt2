; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87112 () Bool)

(assert start!87112)

(declare-fun b!1008543 () Bool)

(declare-fun res!676678 () Bool)

(declare-fun e!567731 () Bool)

(assert (=> b!1008543 (=> (not res!676678) (not e!567731))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!445608 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9472 0))(
  ( (MissingZero!9472 (index!40259 (_ BitVec 32))) (Found!9472 (index!40260 (_ BitVec 32))) (Intermediate!9472 (undefined!10284 Bool) (index!40261 (_ BitVec 32)) (x!87818 (_ BitVec 32))) (Undefined!9472) (MissingVacant!9472 (index!40262 (_ BitVec 32))) )
))
(declare-fun lt!445613 () SeekEntryResult!9472)

(declare-datatypes ((array!63579 0))(
  ( (array!63580 (arr!30604 (Array (_ BitVec 32) (_ BitVec 64))) (size!31107 (_ BitVec 32))) )
))
(declare-fun lt!445609 () array!63579)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63579 (_ BitVec 32)) SeekEntryResult!9472)

(assert (=> b!1008543 (= res!676678 (not (= lt!445613 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445608 lt!445609 mask!3464))))))

(declare-fun b!1008544 () Bool)

(declare-fun res!676679 () Bool)

(declare-fun e!567732 () Bool)

(assert (=> b!1008544 (=> (not res!676679) (not e!567732))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun a!3219 () array!63579)

(assert (=> b!1008544 (= res!676679 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31107 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31107 a!3219))))))

(declare-fun b!1008545 () Bool)

(declare-fun res!676683 () Bool)

(assert (=> b!1008545 (=> (not res!676683) (not e!567732))))

(declare-datatypes ((List!21251 0))(
  ( (Nil!21248) (Cons!21247 (h!22442 (_ BitVec 64)) (t!30244 List!21251)) )
))
(declare-fun arrayNoDuplicates!0 (array!63579 (_ BitVec 32) List!21251) Bool)

(assert (=> b!1008545 (= res!676683 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21248))))

(declare-fun b!1008546 () Bool)

(declare-fun res!676681 () Bool)

(assert (=> b!1008546 (=> (not res!676681) (not e!567732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63579 (_ BitVec 32)) Bool)

(assert (=> b!1008546 (= res!676681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008547 () Bool)

(declare-fun e!567730 () Bool)

(declare-fun e!567729 () Bool)

(assert (=> b!1008547 (= e!567730 e!567729)))

(declare-fun res!676688 () Bool)

(assert (=> b!1008547 (=> (not res!676688) (not e!567729))))

(declare-fun lt!445607 () SeekEntryResult!9472)

(assert (=> b!1008547 (= res!676688 (= lt!445613 lt!445607))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1008547 (= lt!445613 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30604 a!3219) j!170) a!3219 mask!3464))))

(declare-fun res!676675 () Bool)

(declare-fun e!567728 () Bool)

(assert (=> start!87112 (=> (not res!676675) (not e!567728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!87112 (= res!676675 (validMask!0 mask!3464))))

(assert (=> start!87112 e!567728))

(declare-fun array_inv!23740 (array!63579) Bool)

(assert (=> start!87112 (array_inv!23740 a!3219)))

(assert (=> start!87112 true))

(declare-fun b!1008548 () Bool)

(assert (=> b!1008548 (= e!567728 e!567732)))

(declare-fun res!676677 () Bool)

(assert (=> b!1008548 (=> (not res!676677) (not e!567732))))

(declare-fun lt!445612 () SeekEntryResult!9472)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008548 (= res!676677 (or (= lt!445612 (MissingVacant!9472 i!1194)) (= lt!445612 (MissingZero!9472 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63579 (_ BitVec 32)) SeekEntryResult!9472)

(assert (=> b!1008548 (= lt!445612 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1008549 () Bool)

(declare-fun res!676686 () Bool)

(assert (=> b!1008549 (=> (not res!676686) (not e!567728))))

(assert (=> b!1008549 (= res!676686 (and (= (size!31107 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31107 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31107 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008550 () Bool)

(declare-fun res!676682 () Bool)

(assert (=> b!1008550 (=> (not res!676682) (not e!567728))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008550 (= res!676682 (validKeyInArray!0 (select (arr!30604 a!3219) j!170)))))

(declare-fun b!1008551 () Bool)

(assert (=> b!1008551 (= e!567731 false)))

(declare-fun lt!445610 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008551 (= lt!445610 (nextIndex!0 index!1507 (bvadd #b00000000000000000000000000000001 x!1245) mask!3464))))

(declare-fun b!1008552 () Bool)

(declare-fun res!676687 () Bool)

(assert (=> b!1008552 (=> (not res!676687) (not e!567728))))

(assert (=> b!1008552 (= res!676687 (validKeyInArray!0 k0!2224))))

(declare-fun b!1008553 () Bool)

(declare-fun res!676684 () Bool)

(assert (=> b!1008553 (=> (not res!676684) (not e!567728))))

(declare-fun arrayContainsKey!0 (array!63579 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008553 (= res!676684 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008554 () Bool)

(declare-fun res!676685 () Bool)

(assert (=> b!1008554 (=> (not res!676685) (not e!567731))))

(assert (=> b!1008554 (= res!676685 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008555 () Bool)

(assert (=> b!1008555 (= e!567732 e!567730)))

(declare-fun res!676680 () Bool)

(assert (=> b!1008555 (=> (not res!676680) (not e!567730))))

(declare-fun lt!445611 () SeekEntryResult!9472)

(assert (=> b!1008555 (= res!676680 (= lt!445611 lt!445607))))

(assert (=> b!1008555 (= lt!445607 (Intermediate!9472 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008555 (= lt!445611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30604 a!3219) j!170) mask!3464) (select (arr!30604 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008556 () Bool)

(assert (=> b!1008556 (= e!567729 e!567731)))

(declare-fun res!676676 () Bool)

(assert (=> b!1008556 (=> (not res!676676) (not e!567731))))

(assert (=> b!1008556 (= res!676676 (not (= lt!445611 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445608 mask!3464) lt!445608 lt!445609 mask!3464))))))

(assert (=> b!1008556 (= lt!445608 (select (store (arr!30604 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1008556 (= lt!445609 (array!63580 (store (arr!30604 a!3219) i!1194 k0!2224) (size!31107 a!3219)))))

(assert (= (and start!87112 res!676675) b!1008549))

(assert (= (and b!1008549 res!676686) b!1008550))

(assert (= (and b!1008550 res!676682) b!1008552))

(assert (= (and b!1008552 res!676687) b!1008553))

(assert (= (and b!1008553 res!676684) b!1008548))

(assert (= (and b!1008548 res!676677) b!1008546))

(assert (= (and b!1008546 res!676681) b!1008545))

(assert (= (and b!1008545 res!676683) b!1008544))

(assert (= (and b!1008544 res!676679) b!1008555))

(assert (= (and b!1008555 res!676680) b!1008547))

(assert (= (and b!1008547 res!676688) b!1008556))

(assert (= (and b!1008556 res!676676) b!1008543))

(assert (= (and b!1008543 res!676678) b!1008554))

(assert (= (and b!1008554 res!676685) b!1008551))

(declare-fun m!933731 () Bool)

(assert (=> b!1008555 m!933731))

(assert (=> b!1008555 m!933731))

(declare-fun m!933733 () Bool)

(assert (=> b!1008555 m!933733))

(assert (=> b!1008555 m!933733))

(assert (=> b!1008555 m!933731))

(declare-fun m!933735 () Bool)

(assert (=> b!1008555 m!933735))

(declare-fun m!933737 () Bool)

(assert (=> b!1008556 m!933737))

(assert (=> b!1008556 m!933737))

(declare-fun m!933739 () Bool)

(assert (=> b!1008556 m!933739))

(declare-fun m!933741 () Bool)

(assert (=> b!1008556 m!933741))

(declare-fun m!933743 () Bool)

(assert (=> b!1008556 m!933743))

(assert (=> b!1008550 m!933731))

(assert (=> b!1008550 m!933731))

(declare-fun m!933745 () Bool)

(assert (=> b!1008550 m!933745))

(declare-fun m!933747 () Bool)

(assert (=> b!1008551 m!933747))

(declare-fun m!933749 () Bool)

(assert (=> b!1008546 m!933749))

(declare-fun m!933751 () Bool)

(assert (=> b!1008552 m!933751))

(assert (=> b!1008547 m!933731))

(assert (=> b!1008547 m!933731))

(declare-fun m!933753 () Bool)

(assert (=> b!1008547 m!933753))

(declare-fun m!933755 () Bool)

(assert (=> b!1008553 m!933755))

(declare-fun m!933757 () Bool)

(assert (=> b!1008545 m!933757))

(declare-fun m!933759 () Bool)

(assert (=> b!1008548 m!933759))

(declare-fun m!933761 () Bool)

(assert (=> b!1008543 m!933761))

(declare-fun m!933763 () Bool)

(assert (=> start!87112 m!933763))

(declare-fun m!933765 () Bool)

(assert (=> start!87112 m!933765))

(check-sat (not b!1008550) (not b!1008548) (not b!1008545) (not b!1008556) (not b!1008547) (not start!87112) (not b!1008555) (not b!1008551) (not b!1008552) (not b!1008546) (not b!1008543) (not b!1008553))
(check-sat)
