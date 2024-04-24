; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86122 () Bool)

(assert start!86122)

(declare-fun b!996770 () Bool)

(declare-fun res!666405 () Bool)

(declare-fun e!562551 () Bool)

(assert (=> b!996770 (=> (not res!666405) (not e!562551))))

(declare-datatypes ((array!63042 0))(
  ( (array!63043 (arr!30349 (Array (_ BitVec 32) (_ BitVec 64))) (size!30852 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63042)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63042 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996770 (= res!666405 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun res!666409 () Bool)

(assert (=> start!86122 (=> (not res!666409) (not e!562551))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86122 (= res!666409 (validMask!0 mask!3464))))

(assert (=> start!86122 e!562551))

(declare-fun array_inv!23485 (array!63042) Bool)

(assert (=> start!86122 (array_inv!23485 a!3219)))

(assert (=> start!86122 true))

(declare-fun b!996771 () Bool)

(declare-fun res!666410 () Bool)

(assert (=> b!996771 (=> (not res!666410) (not e!562551))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996771 (= res!666410 (validKeyInArray!0 k0!2224))))

(declare-fun b!996772 () Bool)

(declare-fun e!562549 () Bool)

(assert (=> b!996772 (= e!562549 false)))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!441431 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996772 (= lt!441431 (toIndex!0 (select (arr!30349 a!3219) j!170) mask!3464))))

(declare-fun b!996773 () Bool)

(declare-fun res!666413 () Bool)

(assert (=> b!996773 (=> (not res!666413) (not e!562551))))

(assert (=> b!996773 (= res!666413 (validKeyInArray!0 (select (arr!30349 a!3219) j!170)))))

(declare-fun b!996774 () Bool)

(declare-fun res!666411 () Bool)

(assert (=> b!996774 (=> (not res!666411) (not e!562551))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996774 (= res!666411 (and (= (size!30852 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30852 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30852 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996775 () Bool)

(declare-fun res!666408 () Bool)

(assert (=> b!996775 (=> (not res!666408) (not e!562549))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996775 (= res!666408 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30852 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30852 a!3219))))))

(declare-fun b!996776 () Bool)

(assert (=> b!996776 (= e!562551 e!562549)))

(declare-fun res!666407 () Bool)

(assert (=> b!996776 (=> (not res!666407) (not e!562549))))

(declare-datatypes ((SeekEntryResult!9217 0))(
  ( (MissingZero!9217 (index!39239 (_ BitVec 32))) (Found!9217 (index!39240 (_ BitVec 32))) (Intermediate!9217 (undefined!10029 Bool) (index!39241 (_ BitVec 32)) (x!86832 (_ BitVec 32))) (Undefined!9217) (MissingVacant!9217 (index!39242 (_ BitVec 32))) )
))
(declare-fun lt!441430 () SeekEntryResult!9217)

(assert (=> b!996776 (= res!666407 (or (= lt!441430 (MissingVacant!9217 i!1194)) (= lt!441430 (MissingZero!9217 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63042 (_ BitVec 32)) SeekEntryResult!9217)

(assert (=> b!996776 (= lt!441430 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!996777 () Bool)

(declare-fun res!666412 () Bool)

(assert (=> b!996777 (=> (not res!666412) (not e!562549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63042 (_ BitVec 32)) Bool)

(assert (=> b!996777 (= res!666412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996778 () Bool)

(declare-fun res!666406 () Bool)

(assert (=> b!996778 (=> (not res!666406) (not e!562549))))

(declare-datatypes ((List!20996 0))(
  ( (Nil!20993) (Cons!20992 (h!22160 (_ BitVec 64)) (t!29989 List!20996)) )
))
(declare-fun arrayNoDuplicates!0 (array!63042 (_ BitVec 32) List!20996) Bool)

(assert (=> b!996778 (= res!666406 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!20993))))

(assert (= (and start!86122 res!666409) b!996774))

(assert (= (and b!996774 res!666411) b!996773))

(assert (= (and b!996773 res!666413) b!996771))

(assert (= (and b!996771 res!666410) b!996770))

(assert (= (and b!996770 res!666405) b!996776))

(assert (= (and b!996776 res!666407) b!996777))

(assert (= (and b!996777 res!666412) b!996778))

(assert (= (and b!996778 res!666406) b!996775))

(assert (= (and b!996775 res!666408) b!996772))

(declare-fun m!924467 () Bool)

(assert (=> b!996772 m!924467))

(assert (=> b!996772 m!924467))

(declare-fun m!924469 () Bool)

(assert (=> b!996772 m!924469))

(declare-fun m!924471 () Bool)

(assert (=> b!996778 m!924471))

(assert (=> b!996773 m!924467))

(assert (=> b!996773 m!924467))

(declare-fun m!924473 () Bool)

(assert (=> b!996773 m!924473))

(declare-fun m!924475 () Bool)

(assert (=> start!86122 m!924475))

(declare-fun m!924477 () Bool)

(assert (=> start!86122 m!924477))

(declare-fun m!924479 () Bool)

(assert (=> b!996776 m!924479))

(declare-fun m!924481 () Bool)

(assert (=> b!996770 m!924481))

(declare-fun m!924483 () Bool)

(assert (=> b!996777 m!924483))

(declare-fun m!924485 () Bool)

(assert (=> b!996771 m!924485))

(check-sat (not b!996770) (not b!996776) (not b!996773) (not b!996778) (not b!996771) (not b!996772) (not b!996777) (not start!86122))
(check-sat)
