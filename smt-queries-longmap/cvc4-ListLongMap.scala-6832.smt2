; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86034 () Bool)

(assert start!86034)

(declare-fun b!996532 () Bool)

(declare-fun res!666648 () Bool)

(declare-fun e!562232 () Bool)

(assert (=> b!996532 (=> (not res!666648) (not e!562232))))

(declare-datatypes ((array!63039 0))(
  ( (array!63040 (arr!30351 (Array (_ BitVec 32) (_ BitVec 64))) (size!30853 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63039)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996532 (= res!666648 (validKeyInArray!0 (select (arr!30351 a!3219) j!170)))))

(declare-fun b!996533 () Bool)

(declare-fun res!666649 () Bool)

(assert (=> b!996533 (=> (not res!666649) (not e!562232))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996533 (= res!666649 (and (= (size!30853 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30853 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30853 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996534 () Bool)

(declare-fun res!666650 () Bool)

(declare-fun e!562233 () Bool)

(assert (=> b!996534 (=> (not res!666650) (not e!562233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63039 (_ BitVec 32)) Bool)

(assert (=> b!996534 (= res!666650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996535 () Bool)

(declare-fun res!666646 () Bool)

(assert (=> b!996535 (=> (not res!666646) (not e!562232))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!996535 (= res!666646 (validKeyInArray!0 k!2224))))

(declare-fun b!996536 () Bool)

(assert (=> b!996536 (= e!562233 false)))

(declare-datatypes ((SeekEntryResult!9283 0))(
  ( (MissingZero!9283 (index!39503 (_ BitVec 32))) (Found!9283 (index!39504 (_ BitVec 32))) (Intermediate!9283 (undefined!10095 Bool) (index!39505 (_ BitVec 32)) (x!86935 (_ BitVec 32))) (Undefined!9283) (MissingVacant!9283 (index!39506 (_ BitVec 32))) )
))
(declare-fun lt!441257 () SeekEntryResult!9283)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63039 (_ BitVec 32)) SeekEntryResult!9283)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996536 (= lt!441257 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30351 a!3219) j!170) mask!3464) (select (arr!30351 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!996538 () Bool)

(declare-fun res!666652 () Bool)

(assert (=> b!996538 (=> (not res!666652) (not e!562233))))

(declare-datatypes ((List!21027 0))(
  ( (Nil!21024) (Cons!21023 (h!22188 (_ BitVec 64)) (t!30028 List!21027)) )
))
(declare-fun arrayNoDuplicates!0 (array!63039 (_ BitVec 32) List!21027) Bool)

(assert (=> b!996538 (= res!666652 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21024))))

(declare-fun b!996539 () Bool)

(declare-fun res!666651 () Bool)

(assert (=> b!996539 (=> (not res!666651) (not e!562232))))

(declare-fun arrayContainsKey!0 (array!63039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996539 (= res!666651 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996540 () Bool)

(declare-fun res!666654 () Bool)

(assert (=> b!996540 (=> (not res!666654) (not e!562233))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996540 (= res!666654 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30853 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30853 a!3219))))))

(declare-fun res!666653 () Bool)

(assert (=> start!86034 (=> (not res!666653) (not e!562232))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86034 (= res!666653 (validMask!0 mask!3464))))

(assert (=> start!86034 e!562232))

(declare-fun array_inv!23475 (array!63039) Bool)

(assert (=> start!86034 (array_inv!23475 a!3219)))

(assert (=> start!86034 true))

(declare-fun b!996537 () Bool)

(assert (=> b!996537 (= e!562232 e!562233)))

(declare-fun res!666647 () Bool)

(assert (=> b!996537 (=> (not res!666647) (not e!562233))))

(declare-fun lt!441256 () SeekEntryResult!9283)

(assert (=> b!996537 (= res!666647 (or (= lt!441256 (MissingVacant!9283 i!1194)) (= lt!441256 (MissingZero!9283 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63039 (_ BitVec 32)) SeekEntryResult!9283)

(assert (=> b!996537 (= lt!441256 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(assert (= (and start!86034 res!666653) b!996533))

(assert (= (and b!996533 res!666649) b!996532))

(assert (= (and b!996532 res!666648) b!996535))

(assert (= (and b!996535 res!666646) b!996539))

(assert (= (and b!996539 res!666651) b!996537))

(assert (= (and b!996537 res!666647) b!996534))

(assert (= (and b!996534 res!666650) b!996538))

(assert (= (and b!996538 res!666652) b!996540))

(assert (= (and b!996540 res!666654) b!996536))

(declare-fun m!923629 () Bool)

(assert (=> b!996538 m!923629))

(declare-fun m!923631 () Bool)

(assert (=> b!996539 m!923631))

(declare-fun m!923633 () Bool)

(assert (=> b!996535 m!923633))

(declare-fun m!923635 () Bool)

(assert (=> b!996536 m!923635))

(assert (=> b!996536 m!923635))

(declare-fun m!923637 () Bool)

(assert (=> b!996536 m!923637))

(assert (=> b!996536 m!923637))

(assert (=> b!996536 m!923635))

(declare-fun m!923639 () Bool)

(assert (=> b!996536 m!923639))

(assert (=> b!996532 m!923635))

(assert (=> b!996532 m!923635))

(declare-fun m!923641 () Bool)

(assert (=> b!996532 m!923641))

(declare-fun m!923643 () Bool)

(assert (=> start!86034 m!923643))

(declare-fun m!923645 () Bool)

(assert (=> start!86034 m!923645))

(declare-fun m!923647 () Bool)

(assert (=> b!996534 m!923647))

(declare-fun m!923649 () Bool)

(assert (=> b!996537 m!923649))

(push 1)

