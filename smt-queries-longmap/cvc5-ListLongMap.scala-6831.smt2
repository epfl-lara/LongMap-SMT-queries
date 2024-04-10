; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86024 () Bool)

(assert start!86024)

(declare-fun b!996397 () Bool)

(declare-fun res!666512 () Bool)

(declare-fun e!562189 () Bool)

(assert (=> b!996397 (=> (not res!666512) (not e!562189))))

(declare-datatypes ((array!63029 0))(
  ( (array!63030 (arr!30346 (Array (_ BitVec 32) (_ BitVec 64))) (size!30848 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63029)

(declare-datatypes ((List!21022 0))(
  ( (Nil!21019) (Cons!21018 (h!22183 (_ BitVec 64)) (t!30023 List!21022)) )
))
(declare-fun arrayNoDuplicates!0 (array!63029 (_ BitVec 32) List!21022) Bool)

(assert (=> b!996397 (= res!666512 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21019))))

(declare-fun b!996398 () Bool)

(assert (=> b!996398 (= e!562189 false)))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun lt!441226 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!996398 (= lt!441226 (toIndex!0 (select (arr!30346 a!3219) j!170) mask!3464))))

(declare-fun res!666515 () Bool)

(declare-fun e!562187 () Bool)

(assert (=> start!86024 (=> (not res!666515) (not e!562187))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86024 (= res!666515 (validMask!0 mask!3464))))

(assert (=> start!86024 e!562187))

(declare-fun array_inv!23470 (array!63029) Bool)

(assert (=> start!86024 (array_inv!23470 a!3219)))

(assert (=> start!86024 true))

(declare-fun b!996399 () Bool)

(assert (=> b!996399 (= e!562187 e!562189)))

(declare-fun res!666516 () Bool)

(assert (=> b!996399 (=> (not res!666516) (not e!562189))))

(declare-datatypes ((SeekEntryResult!9278 0))(
  ( (MissingZero!9278 (index!39483 (_ BitVec 32))) (Found!9278 (index!39484 (_ BitVec 32))) (Intermediate!9278 (undefined!10090 Bool) (index!39485 (_ BitVec 32)) (x!86922 (_ BitVec 32))) (Undefined!9278) (MissingVacant!9278 (index!39486 (_ BitVec 32))) )
))
(declare-fun lt!441227 () SeekEntryResult!9278)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!996399 (= res!666516 (or (= lt!441227 (MissingVacant!9278 i!1194)) (= lt!441227 (MissingZero!9278 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63029 (_ BitVec 32)) SeekEntryResult!9278)

(assert (=> b!996399 (= lt!441227 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!996400 () Bool)

(declare-fun res!666519 () Bool)

(assert (=> b!996400 (=> (not res!666519) (not e!562189))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!996400 (= res!666519 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30848 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30848 a!3219))))))

(declare-fun b!996401 () Bool)

(declare-fun res!666517 () Bool)

(assert (=> b!996401 (=> (not res!666517) (not e!562187))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!996401 (= res!666517 (validKeyInArray!0 (select (arr!30346 a!3219) j!170)))))

(declare-fun b!996402 () Bool)

(declare-fun res!666511 () Bool)

(assert (=> b!996402 (=> (not res!666511) (not e!562189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63029 (_ BitVec 32)) Bool)

(assert (=> b!996402 (= res!666511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!996403 () Bool)

(declare-fun res!666513 () Bool)

(assert (=> b!996403 (=> (not res!666513) (not e!562187))))

(declare-fun arrayContainsKey!0 (array!63029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!996403 (= res!666513 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!996404 () Bool)

(declare-fun res!666518 () Bool)

(assert (=> b!996404 (=> (not res!666518) (not e!562187))))

(assert (=> b!996404 (= res!666518 (and (= (size!30848 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30848 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30848 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!996405 () Bool)

(declare-fun res!666514 () Bool)

(assert (=> b!996405 (=> (not res!666514) (not e!562187))))

(assert (=> b!996405 (= res!666514 (validKeyInArray!0 k!2224))))

(assert (= (and start!86024 res!666515) b!996404))

(assert (= (and b!996404 res!666518) b!996401))

(assert (= (and b!996401 res!666517) b!996405))

(assert (= (and b!996405 res!666514) b!996403))

(assert (= (and b!996403 res!666513) b!996399))

(assert (= (and b!996399 res!666516) b!996402))

(assert (= (and b!996402 res!666511) b!996397))

(assert (= (and b!996397 res!666512) b!996400))

(assert (= (and b!996400 res!666519) b!996398))

(declare-fun m!923525 () Bool)

(assert (=> start!86024 m!923525))

(declare-fun m!923527 () Bool)

(assert (=> start!86024 m!923527))

(declare-fun m!923529 () Bool)

(assert (=> b!996403 m!923529))

(declare-fun m!923531 () Bool)

(assert (=> b!996398 m!923531))

(assert (=> b!996398 m!923531))

(declare-fun m!923533 () Bool)

(assert (=> b!996398 m!923533))

(declare-fun m!923535 () Bool)

(assert (=> b!996405 m!923535))

(declare-fun m!923537 () Bool)

(assert (=> b!996399 m!923537))

(declare-fun m!923539 () Bool)

(assert (=> b!996397 m!923539))

(assert (=> b!996401 m!923531))

(assert (=> b!996401 m!923531))

(declare-fun m!923541 () Bool)

(assert (=> b!996401 m!923541))

(declare-fun m!923543 () Bool)

(assert (=> b!996402 m!923543))

(push 1)

