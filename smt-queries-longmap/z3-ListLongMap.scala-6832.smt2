; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86032 () Bool)

(assert start!86032)

(declare-fun b!996505 () Bool)

(declare-fun res!666625 () Bool)

(declare-fun e!562225 () Bool)

(assert (=> b!996505 (=> (not res!666625) (not e!562225))))

(declare-datatypes ((array!63037 0))(
  ( (array!63038 (arr!30350 (Array (_ BitVec 32) (_ BitVec 64))) (size!30852 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63037)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63037 (_ BitVec 32)) Bool)

(assert (=> b!996505 (= res!666625 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996506 () Bool)

(declare-fun res!666623 () Bool)

(declare-fun e!562223 () Bool)

(assert (=> b!996506 (=> (not res!666623) (not e!562223))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996506 (= res!666623 (validKeyInArray!0 (select (arr!30350 a!3219) j!170)))))

(declare-fun b!996507 () Bool)

(assert (=> b!996507 (= e!562223 e!562225)))

(declare-fun res!666626 () Bool)

(assert (=> b!996507 (=> (not res!666626) (not e!562225))))

(declare-datatypes ((SeekEntryResult!9282 0))(
  ( (MissingZero!9282 (index!39499 (_ BitVec 32))) (Found!9282 (index!39500 (_ BitVec 32))) (Intermediate!9282 (undefined!10094 Bool) (index!39501 (_ BitVec 32)) (x!86934 (_ BitVec 32))) (Undefined!9282) (MissingVacant!9282 (index!39502 (_ BitVec 32))) )
))
(declare-fun lt!441251 () SeekEntryResult!9282)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996507 (= res!666626 (or (= lt!441251 (MissingVacant!9282 i!1194)) (= lt!441251 (MissingZero!9282 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63037 (_ BitVec 32)) SeekEntryResult!9282)

(assert (=> b!996507 (= lt!441251 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!666620 () Bool)

(assert (=> start!86032 (=> (not res!666620) (not e!562223))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86032 (= res!666620 (validMask!0 mask!3464))))

(assert (=> start!86032 e!562223))

(declare-fun array_inv!23474 (array!63037) Bool)

(assert (=> start!86032 (array_inv!23474 a!3219)))

(assert (=> start!86032 true))

(declare-fun b!996508 () Bool)

(declare-fun res!666619 () Bool)

(assert (=> b!996508 (=> (not res!666619) (not e!562225))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996508 (= res!666619 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30852 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30852 a!3219))))))

(declare-fun b!996509 () Bool)

(declare-fun res!666627 () Bool)

(assert (=> b!996509 (=> (not res!666627) (not e!562223))))

(declare-fun arrayContainsKey!0 (array!63037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996509 (= res!666627 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996510 () Bool)

(declare-fun res!666622 () Bool)

(assert (=> b!996510 (=> (not res!666622) (not e!562223))))

(assert (=> b!996510 (= res!666622 (validKeyInArray!0 k0!2224))))

(declare-fun b!996511 () Bool)

(declare-fun res!666621 () Bool)

(assert (=> b!996511 (=> (not res!666621) (not e!562225))))

(declare-datatypes ((List!21026 0))(
  ( (Nil!21023) (Cons!21022 (h!22187 (_ BitVec 64)) (t!30027 List!21026)) )
))
(declare-fun arrayNoDuplicates!0 (array!63037 (_ BitVec 32) List!21026) Bool)

(assert (=> b!996511 (= res!666621 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21023))))

(declare-fun b!996512 () Bool)

(declare-fun res!666624 () Bool)

(assert (=> b!996512 (=> (not res!666624) (not e!562223))))

(assert (=> b!996512 (= res!666624 (and (= (size!30852 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30852 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30852 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996513 () Bool)

(assert (=> b!996513 (= e!562225 false)))

(declare-fun lt!441250 () SeekEntryResult!9282)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63037 (_ BitVec 32)) SeekEntryResult!9282)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996513 (= lt!441250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30350 a!3219) j!170) mask!3464) (select (arr!30350 a!3219) j!170) a!3219 mask!3464))))

(assert (= (and start!86032 res!666620) b!996512))

(assert (= (and b!996512 res!666624) b!996506))

(assert (= (and b!996506 res!666623) b!996510))

(assert (= (and b!996510 res!666622) b!996509))

(assert (= (and b!996509 res!666627) b!996507))

(assert (= (and b!996507 res!666626) b!996505))

(assert (= (and b!996505 res!666625) b!996511))

(assert (= (and b!996511 res!666621) b!996508))

(assert (= (and b!996508 res!666619) b!996513))

(declare-fun m!923607 () Bool)

(assert (=> b!996507 m!923607))

(declare-fun m!923609 () Bool)

(assert (=> b!996510 m!923609))

(declare-fun m!923611 () Bool)

(assert (=> b!996509 m!923611))

(declare-fun m!923613 () Bool)

(assert (=> start!86032 m!923613))

(declare-fun m!923615 () Bool)

(assert (=> start!86032 m!923615))

(declare-fun m!923617 () Bool)

(assert (=> b!996513 m!923617))

(assert (=> b!996513 m!923617))

(declare-fun m!923619 () Bool)

(assert (=> b!996513 m!923619))

(assert (=> b!996513 m!923619))

(assert (=> b!996513 m!923617))

(declare-fun m!923621 () Bool)

(assert (=> b!996513 m!923621))

(declare-fun m!923623 () Bool)

(assert (=> b!996511 m!923623))

(assert (=> b!996506 m!923617))

(assert (=> b!996506 m!923617))

(declare-fun m!923625 () Bool)

(assert (=> b!996506 m!923625))

(declare-fun m!923627 () Bool)

(assert (=> b!996505 m!923627))

(check-sat (not b!996510) (not b!996509) (not b!996505) (not b!996507) (not b!996513) (not start!86032) (not b!996511) (not b!996506))
(check-sat)
