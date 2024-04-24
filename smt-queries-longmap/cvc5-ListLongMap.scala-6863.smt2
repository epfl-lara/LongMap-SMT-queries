; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86612 () Bool)

(assert start!86612)

(declare-fun b!1001528 () Bool)

(declare-fun res!670448 () Bool)

(declare-fun e!564555 () Bool)

(assert (=> b!1001528 (=> (not res!670448) (not e!564555))))

(declare-datatypes ((array!63283 0))(
  ( (array!63284 (arr!30462 (Array (_ BitVec 32) (_ BitVec 64))) (size!30965 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63283)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9330 0))(
  ( (MissingZero!9330 (index!39691 (_ BitVec 32))) (Found!9330 (index!39692 (_ BitVec 32))) (Intermediate!9330 (undefined!10142 Bool) (index!39693 (_ BitVec 32)) (x!87268 (_ BitVec 32))) (Undefined!9330) (MissingVacant!9330 (index!39694 (_ BitVec 32))) )
))
(declare-fun lt!442696 () SeekEntryResult!9330)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63283 (_ BitVec 32)) SeekEntryResult!9330)

(assert (=> b!1001528 (= res!670448 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30462 a!3219) j!170) a!3219 mask!3464) lt!442696))))

(declare-fun b!1001529 () Bool)

(declare-fun res!670449 () Bool)

(declare-fun e!564553 () Bool)

(assert (=> b!1001529 (=> (not res!670449) (not e!564553))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1001529 (= res!670449 (and (= (size!30965 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30965 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30965 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1001530 () Bool)

(declare-fun res!670447 () Bool)

(declare-fun e!564554 () Bool)

(assert (=> b!1001530 (=> (not res!670447) (not e!564554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63283 (_ BitVec 32)) Bool)

(assert (=> b!1001530 (= res!670447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1001531 () Bool)

(declare-fun res!670442 () Bool)

(assert (=> b!1001531 (=> (not res!670442) (not e!564553))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1001531 (= res!670442 (validKeyInArray!0 (select (arr!30462 a!3219) j!170)))))

(declare-fun b!1001532 () Bool)

(declare-fun res!670441 () Bool)

(assert (=> b!1001532 (=> (not res!670441) (not e!564555))))

(declare-fun lt!442697 () SeekEntryResult!9330)

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1001532 (= res!670441 (not (= lt!442697 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!30462 a!3219) i!1194 k!2224) j!170) mask!3464) (select (store (arr!30462 a!3219) i!1194 k!2224) j!170) (array!63284 (store (arr!30462 a!3219) i!1194 k!2224) (size!30965 a!3219)) mask!3464))))))

(declare-fun res!670444 () Bool)

(assert (=> start!86612 (=> (not res!670444) (not e!564553))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86612 (= res!670444 (validMask!0 mask!3464))))

(assert (=> start!86612 e!564553))

(declare-fun array_inv!23598 (array!63283) Bool)

(assert (=> start!86612 (array_inv!23598 a!3219)))

(assert (=> start!86612 true))

(declare-fun b!1001533 () Bool)

(declare-fun res!670445 () Bool)

(assert (=> b!1001533 (=> (not res!670445) (not e!564553))))

(assert (=> b!1001533 (= res!670445 (validKeyInArray!0 k!2224))))

(declare-fun b!1001534 () Bool)

(declare-fun res!670450 () Bool)

(assert (=> b!1001534 (=> (not res!670450) (not e!564553))))

(declare-fun arrayContainsKey!0 (array!63283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1001534 (= res!670450 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1001535 () Bool)

(assert (=> b!1001535 (= e!564554 e!564555)))

(declare-fun res!670440 () Bool)

(assert (=> b!1001535 (=> (not res!670440) (not e!564555))))

(assert (=> b!1001535 (= res!670440 (= lt!442697 lt!442696))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1001535 (= lt!442696 (Intermediate!9330 false resIndex!38 resX!38))))

(assert (=> b!1001535 (= lt!442697 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30462 a!3219) j!170) mask!3464) (select (arr!30462 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1001536 () Bool)

(assert (=> b!1001536 (= e!564553 e!564554)))

(declare-fun res!670451 () Bool)

(assert (=> b!1001536 (=> (not res!670451) (not e!564554))))

(declare-fun lt!442695 () SeekEntryResult!9330)

(assert (=> b!1001536 (= res!670451 (or (= lt!442695 (MissingVacant!9330 i!1194)) (= lt!442695 (MissingZero!9330 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63283 (_ BitVec 32)) SeekEntryResult!9330)

(assert (=> b!1001536 (= lt!442695 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1001537 () Bool)

(assert (=> b!1001537 (= e!564555 (and (bvsge mask!3464 #b00000000000000000000000000000000) (bvsge index!1507 (bvadd #b00000000000000000000000000000001 mask!3464))))))

(declare-fun b!1001538 () Bool)

(declare-fun res!670443 () Bool)

(assert (=> b!1001538 (=> (not res!670443) (not e!564554))))

(assert (=> b!1001538 (= res!670443 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30965 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30965 a!3219))))))

(declare-fun b!1001539 () Bool)

(declare-fun res!670446 () Bool)

(assert (=> b!1001539 (=> (not res!670446) (not e!564554))))

(declare-datatypes ((List!21109 0))(
  ( (Nil!21106) (Cons!21105 (h!22288 (_ BitVec 64)) (t!30102 List!21109)) )
))
(declare-fun arrayNoDuplicates!0 (array!63283 (_ BitVec 32) List!21109) Bool)

(assert (=> b!1001539 (= res!670446 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21106))))

(assert (= (and start!86612 res!670444) b!1001529))

(assert (= (and b!1001529 res!670449) b!1001531))

(assert (= (and b!1001531 res!670442) b!1001533))

(assert (= (and b!1001533 res!670445) b!1001534))

(assert (= (and b!1001534 res!670450) b!1001536))

(assert (= (and b!1001536 res!670451) b!1001530))

(assert (= (and b!1001530 res!670447) b!1001539))

(assert (= (and b!1001539 res!670446) b!1001538))

(assert (= (and b!1001538 res!670443) b!1001535))

(assert (= (and b!1001535 res!670440) b!1001528))

(assert (= (and b!1001528 res!670448) b!1001532))

(assert (= (and b!1001532 res!670441) b!1001537))

(declare-fun m!928089 () Bool)

(assert (=> b!1001532 m!928089))

(declare-fun m!928091 () Bool)

(assert (=> b!1001532 m!928091))

(assert (=> b!1001532 m!928091))

(declare-fun m!928093 () Bool)

(assert (=> b!1001532 m!928093))

(assert (=> b!1001532 m!928093))

(assert (=> b!1001532 m!928091))

(declare-fun m!928095 () Bool)

(assert (=> b!1001532 m!928095))

(declare-fun m!928097 () Bool)

(assert (=> b!1001530 m!928097))

(declare-fun m!928099 () Bool)

(assert (=> b!1001528 m!928099))

(assert (=> b!1001528 m!928099))

(declare-fun m!928101 () Bool)

(assert (=> b!1001528 m!928101))

(declare-fun m!928103 () Bool)

(assert (=> b!1001534 m!928103))

(declare-fun m!928105 () Bool)

(assert (=> b!1001533 m!928105))

(declare-fun m!928107 () Bool)

(assert (=> start!86612 m!928107))

(declare-fun m!928109 () Bool)

(assert (=> start!86612 m!928109))

(assert (=> b!1001535 m!928099))

(assert (=> b!1001535 m!928099))

(declare-fun m!928111 () Bool)

(assert (=> b!1001535 m!928111))

(assert (=> b!1001535 m!928111))

(assert (=> b!1001535 m!928099))

(declare-fun m!928113 () Bool)

(assert (=> b!1001535 m!928113))

(assert (=> b!1001531 m!928099))

(assert (=> b!1001531 m!928099))

(declare-fun m!928115 () Bool)

(assert (=> b!1001531 m!928115))

(declare-fun m!928117 () Bool)

(assert (=> b!1001536 m!928117))

(declare-fun m!928119 () Bool)

(assert (=> b!1001539 m!928119))

(push 1)

(assert (not b!1001536))

(assert (not b!1001533))

(assert (not b!1001539))

(assert (not b!1001528))

(assert (not b!1001530))

(assert (not b!1001534))

(assert (not b!1001531))

(assert (not start!86612))

(assert (not b!1001535))

(assert (not b!1001532))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

