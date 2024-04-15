; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86736 () Bool)

(assert start!86736)

(declare-fun b!1005352 () Bool)

(declare-fun e!566078 () Bool)

(declare-fun e!566077 () Bool)

(assert (=> b!1005352 (= e!566078 e!566077)))

(declare-fun res!674572 () Bool)

(assert (=> b!1005352 (=> (not res!674572) (not e!566077))))

(declare-datatypes ((SeekEntryResult!9470 0))(
  ( (MissingZero!9470 (index!40251 (_ BitVec 32))) (Found!9470 (index!40252 (_ BitVec 32))) (Intermediate!9470 (undefined!10282 Bool) (index!40253 (_ BitVec 32)) (x!87673 (_ BitVec 32))) (Undefined!9470) (MissingVacant!9470 (index!40254 (_ BitVec 32))) )
))
(declare-fun lt!444349 () SeekEntryResult!9470)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005352 (= res!674572 (or (= lt!444349 (MissingVacant!9470 i!1194)) (= lt!444349 (MissingZero!9470 i!1194))))))

(declare-datatypes ((array!63382 0))(
  ( (array!63383 (arr!30513 (Array (_ BitVec 32) (_ BitVec 64))) (size!31017 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63382)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63382 (_ BitVec 32)) SeekEntryResult!9470)

(assert (=> b!1005352 (= lt!444349 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!674568 () Bool)

(assert (=> start!86736 (=> (not res!674568) (not e!566078))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86736 (= res!674568 (validMask!0 mask!3464))))

(assert (=> start!86736 e!566078))

(declare-fun array_inv!23656 (array!63382) Bool)

(assert (=> start!86736 (array_inv!23656 a!3219)))

(assert (=> start!86736 true))

(declare-fun b!1005353 () Bool)

(declare-fun res!674565 () Bool)

(assert (=> b!1005353 (=> (not res!674565) (not e!566078))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005353 (= res!674565 (validKeyInArray!0 k0!2224))))

(declare-fun b!1005354 () Bool)

(declare-fun res!674566 () Bool)

(assert (=> b!1005354 (=> (not res!674566) (not e!566078))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1005354 (= res!674566 (validKeyInArray!0 (select (arr!30513 a!3219) j!170)))))

(declare-fun b!1005355 () Bool)

(declare-fun res!674569 () Bool)

(assert (=> b!1005355 (=> (not res!674569) (not e!566078))))

(assert (=> b!1005355 (= res!674569 (and (= (size!31017 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31017 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31017 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005356 () Bool)

(declare-fun res!674573 () Bool)

(assert (=> b!1005356 (=> (not res!674573) (not e!566078))))

(declare-fun arrayContainsKey!0 (array!63382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005356 (= res!674573 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1005357 () Bool)

(declare-fun res!674567 () Bool)

(assert (=> b!1005357 (=> (not res!674567) (not e!566077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63382 (_ BitVec 32)) Bool)

(assert (=> b!1005357 (= res!674567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005358 () Bool)

(declare-fun res!674570 () Bool)

(assert (=> b!1005358 (=> (not res!674570) (not e!566077))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1005358 (= res!674570 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31017 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31017 a!3219))))))

(declare-fun b!1005359 () Bool)

(assert (=> b!1005359 (= e!566077 false)))

(declare-fun lt!444348 () SeekEntryResult!9470)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63382 (_ BitVec 32)) SeekEntryResult!9470)

(assert (=> b!1005359 (= lt!444348 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30513 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1005360 () Bool)

(declare-fun res!674564 () Bool)

(assert (=> b!1005360 (=> (not res!674564) (not e!566077))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1005360 (= res!674564 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30513 a!3219) j!170) mask!3464) (select (arr!30513 a!3219) j!170) a!3219 mask!3464) (Intermediate!9470 false resIndex!38 resX!38)))))

(declare-fun b!1005361 () Bool)

(declare-fun res!674571 () Bool)

(assert (=> b!1005361 (=> (not res!674571) (not e!566077))))

(declare-datatypes ((List!21255 0))(
  ( (Nil!21252) (Cons!21251 (h!22434 (_ BitVec 64)) (t!30247 List!21255)) )
))
(declare-fun arrayNoDuplicates!0 (array!63382 (_ BitVec 32) List!21255) Bool)

(assert (=> b!1005361 (= res!674571 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21252))))

(assert (= (and start!86736 res!674568) b!1005355))

(assert (= (and b!1005355 res!674569) b!1005354))

(assert (= (and b!1005354 res!674566) b!1005353))

(assert (= (and b!1005353 res!674565) b!1005356))

(assert (= (and b!1005356 res!674573) b!1005352))

(assert (= (and b!1005352 res!674572) b!1005357))

(assert (= (and b!1005357 res!674567) b!1005361))

(assert (= (and b!1005361 res!674571) b!1005358))

(assert (= (and b!1005358 res!674570) b!1005360))

(assert (= (and b!1005360 res!674564) b!1005359))

(declare-fun m!930055 () Bool)

(assert (=> b!1005354 m!930055))

(assert (=> b!1005354 m!930055))

(declare-fun m!930057 () Bool)

(assert (=> b!1005354 m!930057))

(declare-fun m!930059 () Bool)

(assert (=> b!1005357 m!930059))

(declare-fun m!930061 () Bool)

(assert (=> b!1005353 m!930061))

(assert (=> b!1005360 m!930055))

(assert (=> b!1005360 m!930055))

(declare-fun m!930063 () Bool)

(assert (=> b!1005360 m!930063))

(assert (=> b!1005360 m!930063))

(assert (=> b!1005360 m!930055))

(declare-fun m!930065 () Bool)

(assert (=> b!1005360 m!930065))

(declare-fun m!930067 () Bool)

(assert (=> b!1005356 m!930067))

(declare-fun m!930069 () Bool)

(assert (=> b!1005352 m!930069))

(declare-fun m!930071 () Bool)

(assert (=> start!86736 m!930071))

(declare-fun m!930073 () Bool)

(assert (=> start!86736 m!930073))

(declare-fun m!930075 () Bool)

(assert (=> b!1005361 m!930075))

(assert (=> b!1005359 m!930055))

(assert (=> b!1005359 m!930055))

(declare-fun m!930077 () Bool)

(assert (=> b!1005359 m!930077))

(check-sat (not b!1005359) (not b!1005360) (not start!86736) (not b!1005356) (not b!1005357) (not b!1005354) (not b!1005352) (not b!1005361) (not b!1005353))
(check-sat)
