; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48814 () Bool)

(assert start!48814)

(declare-fun b!537353 () Bool)

(declare-fun res!332566 () Bool)

(declare-fun e!311766 () Bool)

(assert (=> b!537353 (=> (not res!332566) (not e!311766))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34026 0))(
  ( (array!34027 (arr!16352 (Array (_ BitVec 32) (_ BitVec 64))) (size!16716 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34026)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4810 0))(
  ( (MissingZero!4810 (index!21464 (_ BitVec 32))) (Found!4810 (index!21465 (_ BitVec 32))) (Intermediate!4810 (undefined!5622 Bool) (index!21466 (_ BitVec 32)) (x!50393 (_ BitVec 32))) (Undefined!4810) (MissingVacant!4810 (index!21467 (_ BitVec 32))) )
))
(declare-fun lt!246379 () SeekEntryResult!4810)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34026 (_ BitVec 32)) SeekEntryResult!4810)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537353 (= res!332566 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16352 a!3154) j!147) mask!3216) (select (arr!16352 a!3154) j!147) a!3154 mask!3216) lt!246379))))

(declare-fun b!537355 () Bool)

(declare-fun e!311769 () Bool)

(declare-fun e!311765 () Bool)

(assert (=> b!537355 (= e!311769 e!311765)))

(declare-fun res!332569 () Bool)

(assert (=> b!537355 (=> (not res!332569) (not e!311765))))

(declare-fun lt!246377 () SeekEntryResult!4810)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537355 (= res!332569 (or (= lt!246377 (MissingZero!4810 i!1153)) (= lt!246377 (MissingVacant!4810 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34026 (_ BitVec 32)) SeekEntryResult!4810)

(assert (=> b!537355 (= lt!246377 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!537356 () Bool)

(declare-fun res!332562 () Bool)

(assert (=> b!537356 (=> (not res!332562) (not e!311769))))

(assert (=> b!537356 (= res!332562 (and (= (size!16716 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16716 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16716 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537357 () Bool)

(declare-fun res!332568 () Bool)

(assert (=> b!537357 (=> (not res!332568) (not e!311769))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537357 (= res!332568 (validKeyInArray!0 (select (arr!16352 a!3154) j!147)))))

(declare-fun b!537358 () Bool)

(declare-fun res!332570 () Bool)

(assert (=> b!537358 (=> (not res!332570) (not e!311765))))

(declare-datatypes ((List!10471 0))(
  ( (Nil!10468) (Cons!10467 (h!11410 (_ BitVec 64)) (t!16699 List!10471)) )
))
(declare-fun arrayNoDuplicates!0 (array!34026 (_ BitVec 32) List!10471) Bool)

(assert (=> b!537358 (= res!332570 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10468))))

(declare-fun b!537359 () Bool)

(declare-fun res!332565 () Bool)

(assert (=> b!537359 (=> (not res!332565) (not e!311765))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537359 (= res!332565 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16716 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16716 a!3154)) (= (select (arr!16352 a!3154) resIndex!32) (select (arr!16352 a!3154) j!147))))))

(declare-fun b!537360 () Bool)

(declare-fun res!332563 () Bool)

(assert (=> b!537360 (=> (not res!332563) (not e!311769))))

(assert (=> b!537360 (= res!332563 (validKeyInArray!0 k!1998))))

(declare-fun b!537361 () Bool)

(declare-fun res!332561 () Bool)

(assert (=> b!537361 (=> (not res!332561) (not e!311769))))

(declare-fun arrayContainsKey!0 (array!34026 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537361 (= res!332561 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!332558 () Bool)

(assert (=> start!48814 (=> (not res!332558) (not e!311769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48814 (= res!332558 (validMask!0 mask!3216))))

(assert (=> start!48814 e!311769))

(assert (=> start!48814 true))

(declare-fun array_inv!12148 (array!34026) Bool)

(assert (=> start!48814 (array_inv!12148 a!3154)))

(declare-fun b!537354 () Bool)

(declare-fun e!311768 () Bool)

(assert (=> b!537354 (= e!311766 e!311768)))

(declare-fun res!332560 () Bool)

(assert (=> b!537354 (=> (not res!332560) (not e!311768))))

(declare-fun lt!246376 () (_ BitVec 32))

(assert (=> b!537354 (= res!332560 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246376 #b00000000000000000000000000000000) (bvslt lt!246376 (size!16716 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537354 (= lt!246376 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537362 () Bool)

(assert (=> b!537362 (= e!311768 false)))

(declare-fun lt!246378 () SeekEntryResult!4810)

(assert (=> b!537362 (= lt!246378 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246376 (select (arr!16352 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537363 () Bool)

(declare-fun res!332567 () Bool)

(assert (=> b!537363 (=> (not res!332567) (not e!311766))))

(assert (=> b!537363 (= res!332567 (and (not (= (select (arr!16352 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16352 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16352 a!3154) index!1177) (select (arr!16352 a!3154) j!147)))))))

(declare-fun b!537364 () Bool)

(assert (=> b!537364 (= e!311765 e!311766)))

(declare-fun res!332564 () Bool)

(assert (=> b!537364 (=> (not res!332564) (not e!311766))))

(assert (=> b!537364 (= res!332564 (= lt!246379 (Intermediate!4810 false resIndex!32 resX!32)))))

(assert (=> b!537364 (= lt!246379 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16352 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537365 () Bool)

(declare-fun res!332559 () Bool)

(assert (=> b!537365 (=> (not res!332559) (not e!311765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34026 (_ BitVec 32)) Bool)

(assert (=> b!537365 (= res!332559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48814 res!332558) b!537356))

(assert (= (and b!537356 res!332562) b!537357))

(assert (= (and b!537357 res!332568) b!537360))

(assert (= (and b!537360 res!332563) b!537361))

(assert (= (and b!537361 res!332561) b!537355))

(assert (= (and b!537355 res!332569) b!537365))

(assert (= (and b!537365 res!332559) b!537358))

(assert (= (and b!537358 res!332570) b!537359))

(assert (= (and b!537359 res!332565) b!537364))

(assert (= (and b!537364 res!332564) b!537353))

(assert (= (and b!537353 res!332566) b!537363))

(assert (= (and b!537363 res!332567) b!537354))

(assert (= (and b!537354 res!332560) b!537362))

(declare-fun m!516601 () Bool)

(assert (=> b!537359 m!516601))

(declare-fun m!516603 () Bool)

(assert (=> b!537359 m!516603))

(assert (=> b!537364 m!516603))

(assert (=> b!537364 m!516603))

(declare-fun m!516605 () Bool)

(assert (=> b!537364 m!516605))

(assert (=> b!537357 m!516603))

(assert (=> b!537357 m!516603))

(declare-fun m!516607 () Bool)

(assert (=> b!537357 m!516607))

(declare-fun m!516609 () Bool)

(assert (=> b!537358 m!516609))

(declare-fun m!516611 () Bool)

(assert (=> b!537354 m!516611))

(declare-fun m!516613 () Bool)

(assert (=> b!537363 m!516613))

(assert (=> b!537363 m!516603))

(declare-fun m!516615 () Bool)

(assert (=> start!48814 m!516615))

(declare-fun m!516617 () Bool)

(assert (=> start!48814 m!516617))

(assert (=> b!537362 m!516603))

(assert (=> b!537362 m!516603))

(declare-fun m!516619 () Bool)

(assert (=> b!537362 m!516619))

(declare-fun m!516621 () Bool)

(assert (=> b!537360 m!516621))

(declare-fun m!516623 () Bool)

(assert (=> b!537361 m!516623))

(declare-fun m!516625 () Bool)

(assert (=> b!537365 m!516625))

(declare-fun m!516627 () Bool)

(assert (=> b!537355 m!516627))

(assert (=> b!537353 m!516603))

(assert (=> b!537353 m!516603))

(declare-fun m!516629 () Bool)

(assert (=> b!537353 m!516629))

(assert (=> b!537353 m!516629))

(assert (=> b!537353 m!516603))

(declare-fun m!516631 () Bool)

(assert (=> b!537353 m!516631))

(push 1)

(assert (not b!537358))

(assert (not b!537362))

(assert (not b!537354))

(assert (not b!537364))

(assert (not b!537355))

(assert (not b!537361))

