; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86730 () Bool)

(assert start!86730)

(declare-fun b!1005381 () Bool)

(declare-fun res!674475 () Bool)

(declare-fun e!566146 () Bool)

(assert (=> b!1005381 (=> (not res!674475) (not e!566146))))

(declare-datatypes ((array!63429 0))(
  ( (array!63430 (arr!30537 (Array (_ BitVec 32) (_ BitVec 64))) (size!31039 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63429)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63429 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1005381 (= res!674475 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun res!674471 () Bool)

(assert (=> start!86730 (=> (not res!674471) (not e!566146))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86730 (= res!674471 (validMask!0 mask!3464))))

(assert (=> start!86730 e!566146))

(declare-fun array_inv!23661 (array!63429) Bool)

(assert (=> start!86730 (array_inv!23661 a!3219)))

(assert (=> start!86730 true))

(declare-fun b!1005382 () Bool)

(declare-fun res!674472 () Bool)

(declare-fun e!566144 () Bool)

(assert (=> b!1005382 (=> (not res!674472) (not e!566144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63429 (_ BitVec 32)) Bool)

(assert (=> b!1005382 (= res!674472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1005383 () Bool)

(declare-fun res!674473 () Bool)

(assert (=> b!1005383 (=> (not res!674473) (not e!566146))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1005383 (= res!674473 (and (= (size!31039 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31039 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31039 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1005384 () Bool)

(declare-fun res!674474 () Bool)

(assert (=> b!1005384 (=> (not res!674474) (not e!566146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1005384 (= res!674474 (validKeyInArray!0 k!2224))))

(declare-fun b!1005385 () Bool)

(assert (=> b!1005385 (= e!566144 false)))

(declare-fun lt!444539 () Bool)

(declare-datatypes ((List!21213 0))(
  ( (Nil!21210) (Cons!21209 (h!22392 (_ BitVec 64)) (t!30214 List!21213)) )
))
(declare-fun arrayNoDuplicates!0 (array!63429 (_ BitVec 32) List!21213) Bool)

(assert (=> b!1005385 (= lt!444539 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21210))))

(declare-fun b!1005386 () Bool)

(assert (=> b!1005386 (= e!566146 e!566144)))

(declare-fun res!674470 () Bool)

(assert (=> b!1005386 (=> (not res!674470) (not e!566144))))

(declare-datatypes ((SeekEntryResult!9469 0))(
  ( (MissingZero!9469 (index!40247 (_ BitVec 32))) (Found!9469 (index!40248 (_ BitVec 32))) (Intermediate!9469 (undefined!10281 Bool) (index!40249 (_ BitVec 32)) (x!87653 (_ BitVec 32))) (Undefined!9469) (MissingVacant!9469 (index!40250 (_ BitVec 32))) )
))
(declare-fun lt!444538 () SeekEntryResult!9469)

(assert (=> b!1005386 (= res!674470 (or (= lt!444538 (MissingVacant!9469 i!1194)) (= lt!444538 (MissingZero!9469 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63429 (_ BitVec 32)) SeekEntryResult!9469)

(assert (=> b!1005386 (= lt!444538 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1005387 () Bool)

(declare-fun res!674469 () Bool)

(assert (=> b!1005387 (=> (not res!674469) (not e!566146))))

(assert (=> b!1005387 (= res!674469 (validKeyInArray!0 (select (arr!30537 a!3219) j!170)))))

(assert (= (and start!86730 res!674471) b!1005383))

(assert (= (and b!1005383 res!674473) b!1005387))

(assert (= (and b!1005387 res!674469) b!1005384))

(assert (= (and b!1005384 res!674474) b!1005381))

(assert (= (and b!1005381 res!674475) b!1005386))

(assert (= (and b!1005386 res!674470) b!1005382))

(assert (= (and b!1005382 res!674472) b!1005385))

(declare-fun m!930641 () Bool)

(assert (=> b!1005382 m!930641))

(declare-fun m!930643 () Bool)

(assert (=> b!1005385 m!930643))

(declare-fun m!930645 () Bool)

(assert (=> b!1005381 m!930645))

(declare-fun m!930647 () Bool)

(assert (=> b!1005384 m!930647))

(declare-fun m!930649 () Bool)

(assert (=> start!86730 m!930649))

(declare-fun m!930651 () Bool)

(assert (=> start!86730 m!930651))

(declare-fun m!930653 () Bool)

(assert (=> b!1005387 m!930653))

(assert (=> b!1005387 m!930653))

(declare-fun m!930655 () Bool)

(assert (=> b!1005387 m!930655))

(declare-fun m!930657 () Bool)

(assert (=> b!1005386 m!930657))

(push 1)

(assert (not b!1005387))

(assert (not start!86730))

(assert (not b!1005382))

(assert (not b!1005385))

(assert (not b!1005384))

