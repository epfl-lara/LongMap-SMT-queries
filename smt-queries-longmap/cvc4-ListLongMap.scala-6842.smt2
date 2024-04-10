; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86148 () Bool)

(assert start!86148)

(declare-fun b!997701 () Bool)

(declare-fun res!667665 () Bool)

(declare-fun e!562699 () Bool)

(assert (=> b!997701 (=> (not res!667665) (not e!562699))))

(declare-datatypes ((array!63102 0))(
  ( (array!63103 (arr!30381 (Array (_ BitVec 32) (_ BitVec 64))) (size!30883 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63102)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!997701 (= res!667665 (and (= (size!30883 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30883 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30883 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!997702 () Bool)

(declare-fun res!667657 () Bool)

(declare-fun e!562698 () Bool)

(assert (=> b!997702 (=> (not res!667657) (not e!562698))))

(declare-datatypes ((List!21057 0))(
  ( (Nil!21054) (Cons!21053 (h!22221 (_ BitVec 64)) (t!30058 List!21057)) )
))
(declare-fun arrayNoDuplicates!0 (array!63102 (_ BitVec 32) List!21057) Bool)

(assert (=> b!997702 (= res!667657 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21054))))

(declare-fun b!997703 () Bool)

(declare-fun res!667660 () Bool)

(assert (=> b!997703 (=> (not res!667660) (not e!562699))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!997703 (= res!667660 (validKeyInArray!0 k!2224))))

(declare-fun b!997704 () Bool)

(declare-fun res!667663 () Bool)

(assert (=> b!997704 (=> (not res!667663) (not e!562699))))

(declare-fun arrayContainsKey!0 (array!63102 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!997704 (= res!667663 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!997705 () Bool)

(assert (=> b!997705 (= e!562699 e!562698)))

(declare-fun res!667662 () Bool)

(assert (=> b!997705 (=> (not res!667662) (not e!562698))))

(declare-datatypes ((SeekEntryResult!9313 0))(
  ( (MissingZero!9313 (index!39623 (_ BitVec 32))) (Found!9313 (index!39624 (_ BitVec 32))) (Intermediate!9313 (undefined!10125 Bool) (index!39625 (_ BitVec 32)) (x!87051 (_ BitVec 32))) (Undefined!9313) (MissingVacant!9313 (index!39626 (_ BitVec 32))) )
))
(declare-fun lt!441505 () SeekEntryResult!9313)

(assert (=> b!997705 (= res!667662 (or (= lt!441505 (MissingVacant!9313 i!1194)) (= lt!441505 (MissingZero!9313 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63102 (_ BitVec 32)) SeekEntryResult!9313)

(assert (=> b!997705 (= lt!441505 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!997706 () Bool)

(declare-fun res!667659 () Bool)

(assert (=> b!997706 (=> (not res!667659) (not e!562698))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!997706 (= res!667659 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30883 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30883 a!3219))))))

(declare-fun b!997707 () Bool)

(declare-fun res!667656 () Bool)

(assert (=> b!997707 (=> (not res!667656) (not e!562699))))

(assert (=> b!997707 (= res!667656 (validKeyInArray!0 (select (arr!30381 a!3219) j!170)))))

(declare-fun b!997708 () Bool)

(declare-fun res!667661 () Bool)

(assert (=> b!997708 (=> (not res!667661) (not e!562698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63102 (_ BitVec 32)) Bool)

(assert (=> b!997708 (= res!667661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!667664 () Bool)

(assert (=> start!86148 (=> (not res!667664) (not e!562699))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86148 (= res!667664 (validMask!0 mask!3464))))

(assert (=> start!86148 e!562699))

(declare-fun array_inv!23505 (array!63102) Bool)

(assert (=> start!86148 (array_inv!23505 a!3219)))

(assert (=> start!86148 true))

(declare-fun b!997709 () Bool)

(assert (=> b!997709 (= e!562698 false)))

(declare-fun lt!441506 () SeekEntryResult!9313)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63102 (_ BitVec 32)) SeekEntryResult!9313)

(assert (=> b!997709 (= lt!441506 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30381 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!997710 () Bool)

(declare-fun res!667658 () Bool)

(assert (=> b!997710 (=> (not res!667658) (not e!562698))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!997710 (= res!667658 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30381 a!3219) j!170) mask!3464) (select (arr!30381 a!3219) j!170) a!3219 mask!3464) (Intermediate!9313 false resIndex!38 resX!38)))))

(assert (= (and start!86148 res!667664) b!997701))

(assert (= (and b!997701 res!667665) b!997707))

(assert (= (and b!997707 res!667656) b!997703))

(assert (= (and b!997703 res!667660) b!997704))

(assert (= (and b!997704 res!667663) b!997705))

(assert (= (and b!997705 res!667662) b!997708))

(assert (= (and b!997708 res!667661) b!997702))

(assert (= (and b!997702 res!667657) b!997706))

(assert (= (and b!997706 res!667659) b!997710))

(assert (= (and b!997710 res!667658) b!997709))

(declare-fun m!924461 () Bool)

(assert (=> b!997710 m!924461))

(assert (=> b!997710 m!924461))

(declare-fun m!924463 () Bool)

(assert (=> b!997710 m!924463))

(assert (=> b!997710 m!924463))

(assert (=> b!997710 m!924461))

(declare-fun m!924465 () Bool)

(assert (=> b!997710 m!924465))

(assert (=> b!997709 m!924461))

(assert (=> b!997709 m!924461))

(declare-fun m!924467 () Bool)

(assert (=> b!997709 m!924467))

(assert (=> b!997707 m!924461))

(assert (=> b!997707 m!924461))

(declare-fun m!924469 () Bool)

(assert (=> b!997707 m!924469))

(declare-fun m!924471 () Bool)

(assert (=> b!997702 m!924471))

(declare-fun m!924473 () Bool)

(assert (=> b!997704 m!924473))

(declare-fun m!924475 () Bool)

(assert (=> b!997705 m!924475))

(declare-fun m!924477 () Bool)

(assert (=> start!86148 m!924477))

(declare-fun m!924479 () Bool)

(assert (=> start!86148 m!924479))

(declare-fun m!924481 () Bool)

(assert (=> b!997703 m!924481))

(declare-fun m!924483 () Bool)

(assert (=> b!997708 m!924483))

(push 1)

