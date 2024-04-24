; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86584 () Bool)

(assert start!86584)

(declare-fun b!1001049 () Bool)

(declare-fun e!564387 () Bool)

(declare-fun e!564385 () Bool)

(assert (=> b!1001049 (= e!564387 e!564385)))

(declare-fun res!669971 () Bool)

(assert (=> b!1001049 (=> (not res!669971) (not e!564385))))

(declare-datatypes ((array!63255 0))(
  ( (array!63256 (arr!30448 (Array (_ BitVec 32) (_ BitVec 64))) (size!30951 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63255)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9316 0))(
  ( (MissingZero!9316 (index!39635 (_ BitVec 32))) (Found!9316 (index!39636 (_ BitVec 32))) (Intermediate!9316 (undefined!10128 Bool) (index!39637 (_ BitVec 32)) (x!87222 (_ BitVec 32))) (Undefined!9316) (MissingVacant!9316 (index!39638 (_ BitVec 32))) )
))
(declare-fun lt!442570 () SeekEntryResult!9316)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63255 (_ BitVec 32)) SeekEntryResult!9316)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001049 (= res!669971 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30448 a!3219) j!170) mask!3464) (select (arr!30448 a!3219) j!170) a!3219 mask!3464) lt!442570))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001049 (= lt!442570 (Intermediate!9316 false resIndex!38 resX!38))))

(declare-fun b!1001050 () Bool)

(declare-fun res!669970 () Bool)

(assert (=> b!1001050 (=> (not res!669970) (not e!564387))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1001050 (= res!669970 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30951 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30951 a!3219))))))

(declare-fun res!669961 () Bool)

(declare-fun e!564384 () Bool)

(assert (=> start!86584 (=> (not res!669961) (not e!564384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86584 (= res!669961 (validMask!0 mask!3464))))

(assert (=> start!86584 e!564384))

(declare-fun array_inv!23584 (array!63255) Bool)

(assert (=> start!86584 (array_inv!23584 a!3219)))

(assert (=> start!86584 true))

(declare-fun b!1001051 () Bool)

(declare-fun res!669965 () Bool)

(assert (=> b!1001051 (=> (not res!669965) (not e!564384))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001051 (= res!669965 (validKeyInArray!0 (select (arr!30448 a!3219) j!170)))))

(declare-fun b!1001052 () Bool)

(declare-fun res!669964 () Bool)

(assert (=> b!1001052 (=> (not res!669964) (not e!564387))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63255 (_ BitVec 32)) Bool)

(assert (=> b!1001052 (= res!669964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001053 () Bool)

(assert (=> b!1001053 (= e!564385 false)))

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun lt!442569 () SeekEntryResult!9316)

(assert (=> b!1001053 (= lt!442569 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30448 a!3219) i!1194 k0!2224) j!170) mask!3464) (select (store (arr!30448 a!3219) i!1194 k0!2224) j!170) (array!63256 (store (arr!30448 a!3219) i!1194 k0!2224) (size!30951 a!3219)) mask!3464))))

(declare-fun b!1001054 () Bool)

(assert (=> b!1001054 (= e!564384 e!564387)))

(declare-fun res!669963 () Bool)

(assert (=> b!1001054 (=> (not res!669963) (not e!564387))))

(declare-fun lt!442571 () SeekEntryResult!9316)

(assert (=> b!1001054 (= res!669963 (or (= lt!442571 (MissingVacant!9316 i!1194)) (= lt!442571 (MissingZero!9316 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63255 (_ BitVec 32)) SeekEntryResult!9316)

(assert (=> b!1001054 (= lt!442571 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1001055 () Bool)

(declare-fun res!669967 () Bool)

(assert (=> b!1001055 (=> (not res!669967) (not e!564384))))

(assert (=> b!1001055 (= res!669967 (and (= (size!30951 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30951 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30951 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001056 () Bool)

(declare-fun res!669969 () Bool)

(assert (=> b!1001056 (=> (not res!669969) (not e!564384))))

(assert (=> b!1001056 (= res!669969 (validKeyInArray!0 k0!2224))))

(declare-fun b!1001057 () Bool)

(declare-fun res!669962 () Bool)

(assert (=> b!1001057 (=> (not res!669962) (not e!564387))))

(declare-datatypes ((List!21095 0))(
  ( (Nil!21092) (Cons!21091 (h!22274 (_ BitVec 64)) (t!30088 List!21095)) )
))
(declare-fun arrayNoDuplicates!0 (array!63255 (_ BitVec 32) List!21095) Bool)

(assert (=> b!1001057 (= res!669962 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21092))))

(declare-fun b!1001058 () Bool)

(declare-fun res!669966 () Bool)

(assert (=> b!1001058 (=> (not res!669966) (not e!564384))))

(declare-fun arrayContainsKey!0 (array!63255 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001058 (= res!669966 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001059 () Bool)

(declare-fun res!669968 () Bool)

(assert (=> b!1001059 (=> (not res!669968) (not e!564385))))

(assert (=> b!1001059 (= res!669968 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30448 a!3219) j!170) a!3219 mask!3464) lt!442570))))

(assert (= (and start!86584 res!669961) b!1001055))

(assert (= (and b!1001055 res!669967) b!1001051))

(assert (= (and b!1001051 res!669965) b!1001056))

(assert (= (and b!1001056 res!669969) b!1001058))

(assert (= (and b!1001058 res!669966) b!1001054))

(assert (= (and b!1001054 res!669963) b!1001052))

(assert (= (and b!1001052 res!669964) b!1001057))

(assert (= (and b!1001057 res!669962) b!1001050))

(assert (= (and b!1001050 res!669970) b!1001049))

(assert (= (and b!1001049 res!669971) b!1001059))

(assert (= (and b!1001059 res!669968) b!1001053))

(declare-fun m!927641 () Bool)

(assert (=> b!1001053 m!927641))

(declare-fun m!927643 () Bool)

(assert (=> b!1001053 m!927643))

(assert (=> b!1001053 m!927643))

(declare-fun m!927645 () Bool)

(assert (=> b!1001053 m!927645))

(assert (=> b!1001053 m!927645))

(assert (=> b!1001053 m!927643))

(declare-fun m!927647 () Bool)

(assert (=> b!1001053 m!927647))

(declare-fun m!927649 () Bool)

(assert (=> b!1001051 m!927649))

(assert (=> b!1001051 m!927649))

(declare-fun m!927651 () Bool)

(assert (=> b!1001051 m!927651))

(declare-fun m!927653 () Bool)

(assert (=> b!1001058 m!927653))

(assert (=> b!1001049 m!927649))

(assert (=> b!1001049 m!927649))

(declare-fun m!927655 () Bool)

(assert (=> b!1001049 m!927655))

(assert (=> b!1001049 m!927655))

(assert (=> b!1001049 m!927649))

(declare-fun m!927657 () Bool)

(assert (=> b!1001049 m!927657))

(declare-fun m!927659 () Bool)

(assert (=> b!1001052 m!927659))

(assert (=> b!1001059 m!927649))

(assert (=> b!1001059 m!927649))

(declare-fun m!927661 () Bool)

(assert (=> b!1001059 m!927661))

(declare-fun m!927663 () Bool)

(assert (=> b!1001054 m!927663))

(declare-fun m!927665 () Bool)

(assert (=> b!1001057 m!927665))

(declare-fun m!927667 () Bool)

(assert (=> start!86584 m!927667))

(declare-fun m!927669 () Bool)

(assert (=> start!86584 m!927669))

(declare-fun m!927671 () Bool)

(assert (=> b!1001056 m!927671))

(check-sat (not b!1001053) (not b!1001056) (not b!1001051) (not b!1001058) (not b!1001052) (not b!1001049) (not b!1001057) (not start!86584) (not b!1001059) (not b!1001054))
(check-sat)
