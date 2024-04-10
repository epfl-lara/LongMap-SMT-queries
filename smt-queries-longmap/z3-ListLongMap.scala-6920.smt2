; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86938 () Bool)

(assert start!86938)

(declare-fun b!1008473 () Bool)

(declare-fun e!567433 () Bool)

(declare-fun e!567431 () Bool)

(assert (=> b!1008473 (= e!567433 e!567431)))

(declare-fun res!677375 () Bool)

(assert (=> b!1008473 (=> (not res!677375) (not e!567431))))

(declare-datatypes ((SeekEntryResult!9546 0))(
  ( (MissingZero!9546 (index!40555 (_ BitVec 32))) (Found!9546 (index!40556 (_ BitVec 32))) (Intermediate!9546 (undefined!10358 Bool) (index!40557 (_ BitVec 32)) (x!87944 (_ BitVec 32))) (Undefined!9546) (MissingVacant!9546 (index!40558 (_ BitVec 32))) )
))
(declare-fun lt!445718 () SeekEntryResult!9546)

(declare-fun lt!445717 () SeekEntryResult!9546)

(assert (=> b!1008473 (= res!677375 (= lt!445718 lt!445717))))

(declare-datatypes ((array!63586 0))(
  ( (array!63587 (arr!30614 (Array (_ BitVec 32) (_ BitVec 64))) (size!31116 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63586)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63586 (_ BitVec 32)) SeekEntryResult!9546)

(assert (=> b!1008473 (= lt!445718 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30614 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008474 () Bool)

(declare-fun res!677377 () Bool)

(declare-fun e!567432 () Bool)

(assert (=> b!1008474 (=> (not res!677377) (not e!567432))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008474 (= res!677377 (validKeyInArray!0 k0!2224))))

(declare-fun res!677378 () Bool)

(assert (=> start!86938 (=> (not res!677378) (not e!567432))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86938 (= res!677378 (validMask!0 mask!3464))))

(assert (=> start!86938 e!567432))

(declare-fun array_inv!23738 (array!63586) Bool)

(assert (=> start!86938 (array_inv!23738 a!3219)))

(assert (=> start!86938 true))

(declare-fun b!1008475 () Bool)

(declare-fun res!677370 () Bool)

(declare-fun e!567430 () Bool)

(assert (=> b!1008475 (=> (not res!677370) (not e!567430))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008475 (= res!677370 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31116 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31116 a!3219))))))

(declare-fun b!1008476 () Bool)

(declare-fun res!677366 () Bool)

(assert (=> b!1008476 (=> (not res!677366) (not e!567432))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008476 (= res!677366 (and (= (size!31116 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31116 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31116 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008477 () Bool)

(declare-fun res!677367 () Bool)

(assert (=> b!1008477 (=> (not res!677367) (not e!567432))))

(assert (=> b!1008477 (= res!677367 (validKeyInArray!0 (select (arr!30614 a!3219) j!170)))))

(declare-fun b!1008478 () Bool)

(declare-fun e!567428 () Bool)

(assert (=> b!1008478 (= e!567431 e!567428)))

(declare-fun res!677372 () Bool)

(assert (=> b!1008478 (=> (not res!677372) (not e!567428))))

(declare-fun lt!445720 () SeekEntryResult!9546)

(declare-fun lt!445715 () (_ BitVec 64))

(declare-fun lt!445716 () array!63586)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008478 (= res!677372 (not (= lt!445720 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445715 mask!3464) lt!445715 lt!445716 mask!3464))))))

(assert (=> b!1008478 (= lt!445715 (select (store (arr!30614 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1008478 (= lt!445716 (array!63587 (store (arr!30614 a!3219) i!1194 k0!2224) (size!31116 a!3219)))))

(declare-fun b!1008479 () Bool)

(assert (=> b!1008479 (= e!567428 false)))

(declare-fun lt!445721 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008479 (= lt!445721 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008480 () Bool)

(declare-fun res!677373 () Bool)

(assert (=> b!1008480 (=> (not res!677373) (not e!567428))))

(assert (=> b!1008480 (= res!677373 (not (= lt!445718 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445715 lt!445716 mask!3464))))))

(declare-fun b!1008481 () Bool)

(assert (=> b!1008481 (= e!567432 e!567430)))

(declare-fun res!677374 () Bool)

(assert (=> b!1008481 (=> (not res!677374) (not e!567430))))

(declare-fun lt!445719 () SeekEntryResult!9546)

(assert (=> b!1008481 (= res!677374 (or (= lt!445719 (MissingVacant!9546 i!1194)) (= lt!445719 (MissingZero!9546 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63586 (_ BitVec 32)) SeekEntryResult!9546)

(assert (=> b!1008481 (= lt!445719 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1008482 () Bool)

(declare-fun res!677379 () Bool)

(assert (=> b!1008482 (=> (not res!677379) (not e!567430))))

(declare-datatypes ((List!21290 0))(
  ( (Nil!21287) (Cons!21286 (h!22472 (_ BitVec 64)) (t!30291 List!21290)) )
))
(declare-fun arrayNoDuplicates!0 (array!63586 (_ BitVec 32) List!21290) Bool)

(assert (=> b!1008482 (= res!677379 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21287))))

(declare-fun b!1008483 () Bool)

(declare-fun res!677371 () Bool)

(assert (=> b!1008483 (=> (not res!677371) (not e!567432))))

(declare-fun arrayContainsKey!0 (array!63586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008483 (= res!677371 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008484 () Bool)

(assert (=> b!1008484 (= e!567430 e!567433)))

(declare-fun res!677368 () Bool)

(assert (=> b!1008484 (=> (not res!677368) (not e!567433))))

(assert (=> b!1008484 (= res!677368 (= lt!445720 lt!445717))))

(assert (=> b!1008484 (= lt!445717 (Intermediate!9546 false resIndex!38 resX!38))))

(assert (=> b!1008484 (= lt!445720 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30614 a!3219) j!170) mask!3464) (select (arr!30614 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008485 () Bool)

(declare-fun res!677369 () Bool)

(assert (=> b!1008485 (=> (not res!677369) (not e!567428))))

(assert (=> b!1008485 (= res!677369 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008486 () Bool)

(declare-fun res!677376 () Bool)

(assert (=> b!1008486 (=> (not res!677376) (not e!567430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63586 (_ BitVec 32)) Bool)

(assert (=> b!1008486 (= res!677376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(assert (= (and start!86938 res!677378) b!1008476))

(assert (= (and b!1008476 res!677366) b!1008477))

(assert (= (and b!1008477 res!677367) b!1008474))

(assert (= (and b!1008474 res!677377) b!1008483))

(assert (= (and b!1008483 res!677371) b!1008481))

(assert (= (and b!1008481 res!677374) b!1008486))

(assert (= (and b!1008486 res!677376) b!1008482))

(assert (= (and b!1008482 res!677379) b!1008475))

(assert (= (and b!1008475 res!677370) b!1008484))

(assert (= (and b!1008484 res!677368) b!1008473))

(assert (= (and b!1008473 res!677375) b!1008478))

(assert (= (and b!1008478 res!677372) b!1008480))

(assert (= (and b!1008480 res!677373) b!1008485))

(assert (= (and b!1008485 res!677369) b!1008479))

(declare-fun m!933215 () Bool)

(assert (=> b!1008483 m!933215))

(declare-fun m!933217 () Bool)

(assert (=> start!86938 m!933217))

(declare-fun m!933219 () Bool)

(assert (=> start!86938 m!933219))

(declare-fun m!933221 () Bool)

(assert (=> b!1008480 m!933221))

(declare-fun m!933223 () Bool)

(assert (=> b!1008481 m!933223))

(declare-fun m!933225 () Bool)

(assert (=> b!1008479 m!933225))

(declare-fun m!933227 () Bool)

(assert (=> b!1008484 m!933227))

(assert (=> b!1008484 m!933227))

(declare-fun m!933229 () Bool)

(assert (=> b!1008484 m!933229))

(assert (=> b!1008484 m!933229))

(assert (=> b!1008484 m!933227))

(declare-fun m!933231 () Bool)

(assert (=> b!1008484 m!933231))

(declare-fun m!933233 () Bool)

(assert (=> b!1008486 m!933233))

(declare-fun m!933235 () Bool)

(assert (=> b!1008474 m!933235))

(assert (=> b!1008477 m!933227))

(assert (=> b!1008477 m!933227))

(declare-fun m!933237 () Bool)

(assert (=> b!1008477 m!933237))

(declare-fun m!933239 () Bool)

(assert (=> b!1008478 m!933239))

(assert (=> b!1008478 m!933239))

(declare-fun m!933241 () Bool)

(assert (=> b!1008478 m!933241))

(declare-fun m!933243 () Bool)

(assert (=> b!1008478 m!933243))

(declare-fun m!933245 () Bool)

(assert (=> b!1008478 m!933245))

(declare-fun m!933247 () Bool)

(assert (=> b!1008482 m!933247))

(assert (=> b!1008473 m!933227))

(assert (=> b!1008473 m!933227))

(declare-fun m!933249 () Bool)

(assert (=> b!1008473 m!933249))

(check-sat (not b!1008480) (not b!1008478) (not b!1008483) (not b!1008473) (not b!1008474) (not b!1008477) (not b!1008479) (not b!1008482) (not b!1008486) (not start!86938) (not b!1008481) (not b!1008484))
(check-sat)
