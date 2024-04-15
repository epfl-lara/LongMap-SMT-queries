; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86136 () Bool)

(assert start!86136)

(declare-fun b!997424 () Bool)

(declare-fun res!667508 () Bool)

(declare-fun e!562550 () Bool)

(assert (=> b!997424 (=> (not res!667508) (not e!562550))))

(declare-datatypes ((array!63037 0))(
  ( (array!63038 (arr!30348 (Array (_ BitVec 32) (_ BitVec 64))) (size!30852 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63037)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997424 (= res!667508 (and (= (size!30852 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30852 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30852 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997425 () Bool)

(declare-fun res!667507 () Bool)

(assert (=> b!997425 (=> (not res!667507) (not e!562550))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997425 (= res!667507 (validKeyInArray!0 k0!2224))))

(declare-fun b!997426 () Bool)

(declare-fun e!562548 () Bool)

(assert (=> b!997426 (= e!562550 e!562548)))

(declare-fun res!667505 () Bool)

(assert (=> b!997426 (=> (not res!667505) (not e!562548))))

(declare-datatypes ((SeekEntryResult!9305 0))(
  ( (MissingZero!9305 (index!39591 (_ BitVec 32))) (Found!9305 (index!39592 (_ BitVec 32))) (Intermediate!9305 (undefined!10117 Bool) (index!39593 (_ BitVec 32)) (x!87038 (_ BitVec 32))) (Undefined!9305) (MissingVacant!9305 (index!39594 (_ BitVec 32))) )
))
(declare-fun lt!441261 () SeekEntryResult!9305)

(assert (=> b!997426 (= res!667505 (or (= lt!441261 (MissingVacant!9305 i!1194)) (= lt!441261 (MissingZero!9305 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63037 (_ BitVec 32)) SeekEntryResult!9305)

(assert (=> b!997426 (= lt!441261 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!997427 () Bool)

(declare-fun res!667506 () Bool)

(assert (=> b!997427 (=> (not res!667506) (not e!562550))))

(declare-fun arrayContainsKey!0 (array!63037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997427 (= res!667506 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997428 () Bool)

(declare-fun res!667504 () Bool)

(assert (=> b!997428 (=> (not res!667504) (not e!562548))))

(declare-datatypes ((List!21090 0))(
  ( (Nil!21087) (Cons!21086 (h!22254 (_ BitVec 64)) (t!30082 List!21090)) )
))
(declare-fun arrayNoDuplicates!0 (array!63037 (_ BitVec 32) List!21090) Bool)

(assert (=> b!997428 (= res!667504 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21087))))

(declare-fun b!997429 () Bool)

(assert (=> b!997429 (= e!562548 false)))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!441262 () SeekEntryResult!9305)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63037 (_ BitVec 32)) SeekEntryResult!9305)

(assert (=> b!997429 (= lt!441262 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30348 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997430 () Bool)

(declare-fun res!667503 () Bool)

(assert (=> b!997430 (=> (not res!667503) (not e!562550))))

(assert (=> b!997430 (= res!667503 (validKeyInArray!0 (select (arr!30348 a!3219) j!170)))))

(declare-fun res!667502 () Bool)

(assert (=> start!86136 (=> (not res!667502) (not e!562550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86136 (= res!667502 (validMask!0 mask!3464))))

(assert (=> start!86136 e!562550))

(declare-fun array_inv!23491 (array!63037) Bool)

(assert (=> start!86136 (array_inv!23491 a!3219)))

(assert (=> start!86136 true))

(declare-fun b!997423 () Bool)

(declare-fun res!667509 () Bool)

(assert (=> b!997423 (=> (not res!667509) (not e!562548))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997423 (= res!667509 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30852 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30852 a!3219))))))

(declare-fun b!997431 () Bool)

(declare-fun res!667511 () Bool)

(assert (=> b!997431 (=> (not res!667511) (not e!562548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63037 (_ BitVec 32)) Bool)

(assert (=> b!997431 (= res!667511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!997432 () Bool)

(declare-fun res!667510 () Bool)

(assert (=> b!997432 (=> (not res!667510) (not e!562548))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997432 (= res!667510 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30348 a!3219) j!170) mask!3464) (select (arr!30348 a!3219) j!170) a!3219 mask!3464) (Intermediate!9305 false resIndex!38 resX!38)))))

(assert (= (and start!86136 res!667502) b!997424))

(assert (= (and b!997424 res!667508) b!997430))

(assert (= (and b!997430 res!667503) b!997425))

(assert (= (and b!997425 res!667507) b!997427))

(assert (= (and b!997427 res!667506) b!997426))

(assert (= (and b!997426 res!667505) b!997431))

(assert (= (and b!997431 res!667511) b!997428))

(assert (= (and b!997428 res!667504) b!997423))

(assert (= (and b!997423 res!667509) b!997432))

(assert (= (and b!997432 res!667510) b!997429))

(declare-fun m!923683 () Bool)

(assert (=> b!997430 m!923683))

(assert (=> b!997430 m!923683))

(declare-fun m!923685 () Bool)

(assert (=> b!997430 m!923685))

(declare-fun m!923687 () Bool)

(assert (=> start!86136 m!923687))

(declare-fun m!923689 () Bool)

(assert (=> start!86136 m!923689))

(assert (=> b!997432 m!923683))

(assert (=> b!997432 m!923683))

(declare-fun m!923691 () Bool)

(assert (=> b!997432 m!923691))

(assert (=> b!997432 m!923691))

(assert (=> b!997432 m!923683))

(declare-fun m!923693 () Bool)

(assert (=> b!997432 m!923693))

(declare-fun m!923695 () Bool)

(assert (=> b!997426 m!923695))

(declare-fun m!923697 () Bool)

(assert (=> b!997428 m!923697))

(declare-fun m!923699 () Bool)

(assert (=> b!997425 m!923699))

(assert (=> b!997429 m!923683))

(assert (=> b!997429 m!923683))

(declare-fun m!923701 () Bool)

(assert (=> b!997429 m!923701))

(declare-fun m!923703 () Bool)

(assert (=> b!997431 m!923703))

(declare-fun m!923705 () Bool)

(assert (=> b!997427 m!923705))

(check-sat (not b!997429) (not b!997426) (not b!997425) (not b!997427) (not b!997431) (not b!997430) (not start!86136) (not b!997432) (not b!997428))
(check-sat)
