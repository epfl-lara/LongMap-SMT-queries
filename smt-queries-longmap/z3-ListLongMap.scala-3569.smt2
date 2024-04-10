; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49094 () Bool)

(assert start!49094)

(declare-fun b!540746 () Bool)

(declare-fun res!335633 () Bool)

(declare-fun e!313256 () Bool)

(assert (=> b!540746 (=> (not res!335633) (not e!313256))))

(declare-datatypes ((array!34204 0))(
  ( (array!34205 (arr!16438 (Array (_ BitVec 32) (_ BitVec 64))) (size!16802 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34204)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540746 (= res!335633 (validKeyInArray!0 (select (arr!16438 a!3154) j!147)))))

(declare-fun res!335637 () Bool)

(assert (=> start!49094 (=> (not res!335637) (not e!313256))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49094 (= res!335637 (validMask!0 mask!3216))))

(assert (=> start!49094 e!313256))

(assert (=> start!49094 true))

(declare-fun array_inv!12234 (array!34204) Bool)

(assert (=> start!49094 (array_inv!12234 a!3154)))

(declare-fun b!540747 () Bool)

(declare-fun res!335641 () Bool)

(assert (=> b!540747 (=> (not res!335641) (not e!313256))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34204 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540747 (= res!335641 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540748 () Bool)

(declare-fun e!313257 () Bool)

(assert (=> b!540748 (= e!313257 false)))

(declare-datatypes ((SeekEntryResult!4896 0))(
  ( (MissingZero!4896 (index!21808 (_ BitVec 32))) (Found!4896 (index!21809 (_ BitVec 32))) (Intermediate!4896 (undefined!5708 Bool) (index!21810 (_ BitVec 32)) (x!50723 (_ BitVec 32))) (Undefined!4896) (MissingVacant!4896 (index!21811 (_ BitVec 32))) )
))
(declare-fun lt!247483 () SeekEntryResult!4896)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34204 (_ BitVec 32)) SeekEntryResult!4896)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540748 (= lt!247483 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16438 a!3154) j!147) mask!3216) (select (arr!16438 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540749 () Bool)

(declare-fun res!335634 () Bool)

(assert (=> b!540749 (=> (not res!335634) (not e!313257))))

(declare-datatypes ((List!10557 0))(
  ( (Nil!10554) (Cons!10553 (h!11502 (_ BitVec 64)) (t!16785 List!10557)) )
))
(declare-fun arrayNoDuplicates!0 (array!34204 (_ BitVec 32) List!10557) Bool)

(assert (=> b!540749 (= res!335634 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10554))))

(declare-fun b!540750 () Bool)

(assert (=> b!540750 (= e!313256 e!313257)))

(declare-fun res!335639 () Bool)

(assert (=> b!540750 (=> (not res!335639) (not e!313257))))

(declare-fun lt!247482 () SeekEntryResult!4896)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540750 (= res!335639 (or (= lt!247482 (MissingZero!4896 i!1153)) (= lt!247482 (MissingVacant!4896 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34204 (_ BitVec 32)) SeekEntryResult!4896)

(assert (=> b!540750 (= lt!247482 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540751 () Bool)

(declare-fun res!335636 () Bool)

(assert (=> b!540751 (=> (not res!335636) (not e!313257))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540751 (= res!335636 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16438 a!3154) j!147) a!3154 mask!3216) (Intermediate!4896 false resIndex!32 resX!32)))))

(declare-fun b!540752 () Bool)

(declare-fun res!335635 () Bool)

(assert (=> b!540752 (=> (not res!335635) (not e!313256))))

(assert (=> b!540752 (= res!335635 (and (= (size!16802 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16802 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16802 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540753 () Bool)

(declare-fun res!335642 () Bool)

(assert (=> b!540753 (=> (not res!335642) (not e!313257))))

(assert (=> b!540753 (= res!335642 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16802 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16802 a!3154)) (= (select (arr!16438 a!3154) resIndex!32) (select (arr!16438 a!3154) j!147))))))

(declare-fun b!540754 () Bool)

(declare-fun res!335640 () Bool)

(assert (=> b!540754 (=> (not res!335640) (not e!313257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34204 (_ BitVec 32)) Bool)

(assert (=> b!540754 (= res!335640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540755 () Bool)

(declare-fun res!335638 () Bool)

(assert (=> b!540755 (=> (not res!335638) (not e!313256))))

(assert (=> b!540755 (= res!335638 (validKeyInArray!0 k0!1998))))

(assert (= (and start!49094 res!335637) b!540752))

(assert (= (and b!540752 res!335635) b!540746))

(assert (= (and b!540746 res!335633) b!540755))

(assert (= (and b!540755 res!335638) b!540747))

(assert (= (and b!540747 res!335641) b!540750))

(assert (= (and b!540750 res!335639) b!540754))

(assert (= (and b!540754 res!335640) b!540749))

(assert (= (and b!540749 res!335634) b!540753))

(assert (= (and b!540753 res!335642) b!540751))

(assert (= (and b!540751 res!335636) b!540748))

(declare-fun m!519413 () Bool)

(assert (=> b!540749 m!519413))

(declare-fun m!519415 () Bool)

(assert (=> b!540748 m!519415))

(assert (=> b!540748 m!519415))

(declare-fun m!519417 () Bool)

(assert (=> b!540748 m!519417))

(assert (=> b!540748 m!519417))

(assert (=> b!540748 m!519415))

(declare-fun m!519419 () Bool)

(assert (=> b!540748 m!519419))

(declare-fun m!519421 () Bool)

(assert (=> b!540750 m!519421))

(declare-fun m!519423 () Bool)

(assert (=> b!540754 m!519423))

(assert (=> b!540751 m!519415))

(assert (=> b!540751 m!519415))

(declare-fun m!519425 () Bool)

(assert (=> b!540751 m!519425))

(declare-fun m!519427 () Bool)

(assert (=> b!540755 m!519427))

(declare-fun m!519429 () Bool)

(assert (=> b!540753 m!519429))

(assert (=> b!540753 m!519415))

(declare-fun m!519431 () Bool)

(assert (=> b!540747 m!519431))

(declare-fun m!519433 () Bool)

(assert (=> start!49094 m!519433))

(declare-fun m!519435 () Bool)

(assert (=> start!49094 m!519435))

(assert (=> b!540746 m!519415))

(assert (=> b!540746 m!519415))

(declare-fun m!519437 () Bool)

(assert (=> b!540746 m!519437))

(check-sat (not b!540748) (not b!540754) (not b!540747) (not b!540755) (not b!540750) (not b!540749) (not start!49094) (not b!540751) (not b!540746))
(check-sat)
