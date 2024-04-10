; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48120 () Bool)

(assert start!48120)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!529939 () Bool)

(declare-datatypes ((array!33556 0))(
  ( (array!33557 (arr!16125 (Array (_ BitVec 32) (_ BitVec 64))) (size!16489 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33556)

(declare-fun e!308792 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4592 0))(
  ( (MissingZero!4592 (index!20592 (_ BitVec 32))) (Found!4592 (index!20593 (_ BitVec 32))) (Intermediate!4592 (undefined!5404 Bool) (index!20594 (_ BitVec 32)) (x!49566 (_ BitVec 32))) (Undefined!4592) (MissingVacant!4592 (index!20595 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33556 (_ BitVec 32)) SeekEntryResult!4592)

(assert (=> b!529939 (= e!308792 (= (seekEntryOrOpen!0 (select (arr!16125 a!3235) j!176) a!3235 mask!3524) (Found!4592 j!176)))))

(declare-fun b!529940 () Bool)

(declare-fun res!325645 () Bool)

(declare-fun e!308791 () Bool)

(assert (=> b!529940 (=> (not res!325645) (not e!308791))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529940 (= res!325645 (validKeyInArray!0 k!2280))))

(declare-fun b!529941 () Bool)

(declare-fun res!325650 () Bool)

(declare-fun e!308790 () Bool)

(assert (=> b!529941 (=> (not res!325650) (not e!308790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33556 (_ BitVec 32)) Bool)

(assert (=> b!529941 (= res!325650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529942 () Bool)

(declare-fun res!325651 () Bool)

(assert (=> b!529942 (=> (not res!325651) (not e!308791))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!529942 (= res!325651 (and (= (size!16489 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16489 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16489 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529944 () Bool)

(declare-fun res!325654 () Bool)

(assert (=> b!529944 (=> (not res!325654) (not e!308790))))

(declare-datatypes ((List!10283 0))(
  ( (Nil!10280) (Cons!10279 (h!11219 (_ BitVec 64)) (t!16511 List!10283)) )
))
(declare-fun arrayNoDuplicates!0 (array!33556 (_ BitVec 32) List!10283) Bool)

(assert (=> b!529944 (= res!325654 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10280))))

(declare-fun b!529945 () Bool)

(declare-fun res!325655 () Bool)

(assert (=> b!529945 (=> (not res!325655) (not e!308791))))

(declare-fun arrayContainsKey!0 (array!33556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529945 (= res!325655 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529946 () Bool)

(assert (=> b!529946 (= e!308791 e!308790)))

(declare-fun res!325646 () Bool)

(assert (=> b!529946 (=> (not res!325646) (not e!308790))))

(declare-fun lt!244370 () SeekEntryResult!4592)

(assert (=> b!529946 (= res!325646 (or (= lt!244370 (MissingZero!4592 i!1204)) (= lt!244370 (MissingVacant!4592 i!1204))))))

(assert (=> b!529946 (= lt!244370 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!529947 () Bool)

(declare-fun e!308788 () Bool)

(declare-fun e!308793 () Bool)

(assert (=> b!529947 (= e!308788 e!308793)))

(declare-fun res!325649 () Bool)

(assert (=> b!529947 (=> res!325649 e!308793)))

(declare-fun lt!244378 () Bool)

(declare-fun lt!244376 () SeekEntryResult!4592)

(assert (=> b!529947 (= res!325649 (or (and (not lt!244378) (undefined!5404 lt!244376)) (and (not lt!244378) (not (undefined!5404 lt!244376)))))))

(assert (=> b!529947 (= lt!244378 (not (is-Intermediate!4592 lt!244376)))))

(declare-fun res!325648 () Bool)

(assert (=> start!48120 (=> (not res!325648) (not e!308791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48120 (= res!325648 (validMask!0 mask!3524))))

(assert (=> start!48120 e!308791))

(assert (=> start!48120 true))

(declare-fun array_inv!11921 (array!33556) Bool)

(assert (=> start!48120 (array_inv!11921 a!3235)))

(declare-fun b!529943 () Bool)

(declare-fun res!325647 () Bool)

(assert (=> b!529943 (=> (not res!325647) (not e!308791))))

(assert (=> b!529943 (= res!325647 (validKeyInArray!0 (select (arr!16125 a!3235) j!176)))))

(declare-fun b!529948 () Bool)

(assert (=> b!529948 (= e!308793 true)))

(declare-fun lt!244373 () SeekEntryResult!4592)

(declare-fun lt!244377 () array!33556)

(declare-fun lt!244375 () (_ BitVec 64))

(assert (=> b!529948 (= lt!244373 (seekEntryOrOpen!0 lt!244375 lt!244377 mask!3524))))

(assert (=> b!529948 false))

(declare-fun b!529949 () Bool)

(assert (=> b!529949 (= e!308790 (not e!308788))))

(declare-fun res!325653 () Bool)

(assert (=> b!529949 (=> res!325653 e!308788)))

(declare-fun lt!244372 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33556 (_ BitVec 32)) SeekEntryResult!4592)

(assert (=> b!529949 (= res!325653 (= lt!244376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244372 lt!244375 lt!244377 mask!3524)))))

(declare-fun lt!244374 () (_ BitVec 32))

(assert (=> b!529949 (= lt!244376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244374 (select (arr!16125 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529949 (= lt!244372 (toIndex!0 lt!244375 mask!3524))))

(assert (=> b!529949 (= lt!244375 (select (store (arr!16125 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!529949 (= lt!244374 (toIndex!0 (select (arr!16125 a!3235) j!176) mask!3524))))

(assert (=> b!529949 (= lt!244377 (array!33557 (store (arr!16125 a!3235) i!1204 k!2280) (size!16489 a!3235)))))

(assert (=> b!529949 e!308792))

(declare-fun res!325652 () Bool)

(assert (=> b!529949 (=> (not res!325652) (not e!308792))))

(assert (=> b!529949 (= res!325652 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16796 0))(
  ( (Unit!16797) )
))
(declare-fun lt!244371 () Unit!16796)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33556 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16796)

(assert (=> b!529949 (= lt!244371 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!48120 res!325648) b!529942))

(assert (= (and b!529942 res!325651) b!529943))

(assert (= (and b!529943 res!325647) b!529940))

(assert (= (and b!529940 res!325645) b!529945))

(assert (= (and b!529945 res!325655) b!529946))

(assert (= (and b!529946 res!325646) b!529941))

(assert (= (and b!529941 res!325650) b!529944))

(assert (= (and b!529944 res!325654) b!529949))

(assert (= (and b!529949 res!325652) b!529939))

(assert (= (and b!529949 (not res!325653)) b!529947))

(assert (= (and b!529947 (not res!325649)) b!529948))

(declare-fun m!510447 () Bool)

(assert (=> b!529943 m!510447))

(assert (=> b!529943 m!510447))

(declare-fun m!510449 () Bool)

(assert (=> b!529943 m!510449))

(declare-fun m!510451 () Bool)

(assert (=> b!529944 m!510451))

(declare-fun m!510453 () Bool)

(assert (=> b!529949 m!510453))

(declare-fun m!510455 () Bool)

(assert (=> b!529949 m!510455))

(declare-fun m!510457 () Bool)

(assert (=> b!529949 m!510457))

(declare-fun m!510459 () Bool)

(assert (=> b!529949 m!510459))

(assert (=> b!529949 m!510447))

(declare-fun m!510461 () Bool)

(assert (=> b!529949 m!510461))

(assert (=> b!529949 m!510447))

(declare-fun m!510463 () Bool)

(assert (=> b!529949 m!510463))

(assert (=> b!529949 m!510447))

(declare-fun m!510465 () Bool)

(assert (=> b!529949 m!510465))

(declare-fun m!510467 () Bool)

(assert (=> b!529949 m!510467))

(declare-fun m!510469 () Bool)

(assert (=> b!529941 m!510469))

(declare-fun m!510471 () Bool)

(assert (=> b!529945 m!510471))

(assert (=> b!529939 m!510447))

(assert (=> b!529939 m!510447))

(declare-fun m!510473 () Bool)

(assert (=> b!529939 m!510473))

(declare-fun m!510475 () Bool)

(assert (=> b!529946 m!510475))

(declare-fun m!510477 () Bool)

(assert (=> b!529948 m!510477))

(declare-fun m!510479 () Bool)

(assert (=> start!48120 m!510479))

(declare-fun m!510481 () Bool)

(assert (=> start!48120 m!510481))

(declare-fun m!510483 () Bool)

(assert (=> b!529940 m!510483))

(push 1)

