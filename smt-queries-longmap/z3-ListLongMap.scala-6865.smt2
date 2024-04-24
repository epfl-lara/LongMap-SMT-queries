; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86620 () Bool)

(assert start!86620)

(declare-fun b!1001674 () Bool)

(declare-fun res!670595 () Bool)

(declare-fun e!564602 () Bool)

(assert (=> b!1001674 (=> (not res!670595) (not e!564602))))

(declare-datatypes ((array!63291 0))(
  ( (array!63292 (arr!30466 (Array (_ BitVec 32) (_ BitVec 64))) (size!30969 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63291)

(declare-datatypes ((List!21113 0))(
  ( (Nil!21110) (Cons!21109 (h!22292 (_ BitVec 64)) (t!30106 List!21113)) )
))
(declare-fun arrayNoDuplicates!0 (array!63291 (_ BitVec 32) List!21113) Bool)

(assert (=> b!1001674 (= res!670595 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21110))))

(declare-fun res!670593 () Bool)

(declare-fun e!564601 () Bool)

(assert (=> start!86620 (=> (not res!670593) (not e!564601))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86620 (= res!670593 (validMask!0 mask!3464))))

(assert (=> start!86620 e!564601))

(declare-fun array_inv!23602 (array!63291) Bool)

(assert (=> start!86620 (array_inv!23602 a!3219)))

(assert (=> start!86620 true))

(declare-fun b!1001675 () Bool)

(declare-fun res!670596 () Bool)

(assert (=> b!1001675 (=> (not res!670596) (not e!564601))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63291 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001675 (= res!670596 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001676 () Bool)

(declare-fun res!670592 () Bool)

(assert (=> b!1001676 (=> (not res!670592) (not e!564601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001676 (= res!670592 (validKeyInArray!0 k0!2224))))

(declare-fun b!1001677 () Bool)

(declare-fun res!670587 () Bool)

(assert (=> b!1001677 (=> (not res!670587) (not e!564601))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001677 (= res!670587 (and (= (size!30969 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30969 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30969 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001678 () Bool)

(declare-fun res!670586 () Bool)

(assert (=> b!1001678 (=> (not res!670586) (not e!564602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63291 (_ BitVec 32)) Bool)

(assert (=> b!1001678 (= res!670586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001679 () Bool)

(declare-fun res!670594 () Bool)

(assert (=> b!1001679 (=> (not res!670594) (not e!564601))))

(assert (=> b!1001679 (= res!670594 (validKeyInArray!0 (select (arr!30466 a!3219) j!170)))))

(declare-fun b!1001680 () Bool)

(assert (=> b!1001680 (= e!564601 e!564602)))

(declare-fun res!670597 () Bool)

(assert (=> b!1001680 (=> (not res!670597) (not e!564602))))

(declare-datatypes ((SeekEntryResult!9334 0))(
  ( (MissingZero!9334 (index!39707 (_ BitVec 32))) (Found!9334 (index!39708 (_ BitVec 32))) (Intermediate!9334 (undefined!10146 Bool) (index!39709 (_ BitVec 32)) (x!87288 (_ BitVec 32))) (Undefined!9334) (MissingVacant!9334 (index!39710 (_ BitVec 32))) )
))
(declare-fun lt!442733 () SeekEntryResult!9334)

(assert (=> b!1001680 (= res!670597 (or (= lt!442733 (MissingVacant!9334 i!1194)) (= lt!442733 (MissingZero!9334 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63291 (_ BitVec 32)) SeekEntryResult!9334)

(assert (=> b!1001680 (= lt!442733 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1001681 () Bool)

(declare-fun res!670598 () Bool)

(assert (=> b!1001681 (=> (not res!670598) (not e!564602))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1001681 (= res!670598 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30969 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30969 a!3219))))))

(declare-fun b!1001682 () Bool)

(declare-fun res!670591 () Bool)

(declare-fun e!564603 () Bool)

(assert (=> b!1001682 (=> (not res!670591) (not e!564603))))

(assert (=> b!1001682 (= res!670591 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvslt index!1507 (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsle x!1245 #b01111111111111111111111111111110)))))

(declare-fun b!1001683 () Bool)

(declare-fun res!670589 () Bool)

(assert (=> b!1001683 (=> (not res!670589) (not e!564603))))

(declare-fun lt!442732 () SeekEntryResult!9334)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63291 (_ BitVec 32)) SeekEntryResult!9334)

(assert (=> b!1001683 (= res!670589 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30466 a!3219) j!170) a!3219 mask!3464) lt!442732))))

(declare-fun b!1001684 () Bool)

(assert (=> b!1001684 (= e!564603 (not (validKeyInArray!0 (select (store (arr!30466 a!3219) i!1194 k0!2224) j!170))))))

(declare-fun b!1001685 () Bool)

(assert (=> b!1001685 (= e!564602 e!564603)))

(declare-fun res!670590 () Bool)

(assert (=> b!1001685 (=> (not res!670590) (not e!564603))))

(declare-fun lt!442731 () SeekEntryResult!9334)

(assert (=> b!1001685 (= res!670590 (= lt!442731 lt!442732))))

(assert (=> b!1001685 (= lt!442732 (Intermediate!9334 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001685 (= lt!442731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30466 a!3219) j!170) mask!3464) (select (arr!30466 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001686 () Bool)

(declare-fun res!670588 () Bool)

(assert (=> b!1001686 (=> (not res!670588) (not e!564603))))

(assert (=> b!1001686 (= res!670588 (not (= lt!442731 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30466 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30466 a!3219) i!1194 k0!2224) j!170) (array!63292 (store (arr!30466 a!3219) i!1194 k0!2224) (size!30969 a!3219)) mask!3464))))))

(assert (= (and start!86620 res!670593) b!1001677))

(assert (= (and b!1001677 res!670587) b!1001679))

(assert (= (and b!1001679 res!670594) b!1001676))

(assert (= (and b!1001676 res!670592) b!1001675))

(assert (= (and b!1001675 res!670596) b!1001680))

(assert (= (and b!1001680 res!670597) b!1001678))

(assert (= (and b!1001678 res!670586) b!1001674))

(assert (= (and b!1001674 res!670595) b!1001681))

(assert (= (and b!1001681 res!670598) b!1001685))

(assert (= (and b!1001685 res!670590) b!1001683))

(assert (= (and b!1001683 res!670589) b!1001686))

(assert (= (and b!1001686 res!670588) b!1001682))

(assert (= (and b!1001682 res!670591) b!1001684))

(declare-fun m!928217 () Bool)

(assert (=> b!1001674 m!928217))

(declare-fun m!928219 () Bool)

(assert (=> b!1001683 m!928219))

(assert (=> b!1001683 m!928219))

(declare-fun m!928221 () Bool)

(assert (=> b!1001683 m!928221))

(declare-fun m!928223 () Bool)

(assert (=> b!1001675 m!928223))

(declare-fun m!928225 () Bool)

(assert (=> b!1001686 m!928225))

(declare-fun m!928227 () Bool)

(assert (=> b!1001686 m!928227))

(assert (=> b!1001686 m!928227))

(declare-fun m!928229 () Bool)

(assert (=> b!1001686 m!928229))

(assert (=> b!1001686 m!928229))

(assert (=> b!1001686 m!928227))

(declare-fun m!928231 () Bool)

(assert (=> b!1001686 m!928231))

(declare-fun m!928233 () Bool)

(assert (=> b!1001676 m!928233))

(assert (=> b!1001684 m!928225))

(assert (=> b!1001684 m!928227))

(assert (=> b!1001684 m!928227))

(declare-fun m!928235 () Bool)

(assert (=> b!1001684 m!928235))

(declare-fun m!928237 () Bool)

(assert (=> b!1001678 m!928237))

(assert (=> b!1001679 m!928219))

(assert (=> b!1001679 m!928219))

(declare-fun m!928239 () Bool)

(assert (=> b!1001679 m!928239))

(declare-fun m!928241 () Bool)

(assert (=> b!1001680 m!928241))

(declare-fun m!928243 () Bool)

(assert (=> start!86620 m!928243))

(declare-fun m!928245 () Bool)

(assert (=> start!86620 m!928245))

(assert (=> b!1001685 m!928219))

(assert (=> b!1001685 m!928219))

(declare-fun m!928247 () Bool)

(assert (=> b!1001685 m!928247))

(assert (=> b!1001685 m!928247))

(assert (=> b!1001685 m!928219))

(declare-fun m!928249 () Bool)

(assert (=> b!1001685 m!928249))

(check-sat (not b!1001674) (not b!1001679) (not b!1001685) (not b!1001683) (not b!1001686) (not b!1001676) (not b!1001680) (not b!1001684) (not b!1001675) (not b!1001678) (not start!86620))
(check-sat)
