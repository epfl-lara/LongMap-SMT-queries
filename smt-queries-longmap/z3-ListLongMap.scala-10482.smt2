; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123272 () Bool)

(assert start!123272)

(declare-fun b!1429566 () Bool)

(declare-fun res!964203 () Bool)

(declare-fun e!807190 () Bool)

(assert (=> b!1429566 (=> (not res!964203) (not e!807190))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429566 (= res!964203 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun res!964196 () Bool)

(declare-fun e!807191 () Bool)

(assert (=> start!123272 (=> (not res!964196) (not e!807191))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123272 (= res!964196 (validMask!0 mask!2608))))

(assert (=> start!123272 e!807191))

(assert (=> start!123272 true))

(declare-datatypes ((array!97433 0))(
  ( (array!97434 (arr!47028 (Array (_ BitVec 32) (_ BitVec 64))) (size!47578 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97433)

(declare-fun array_inv!36056 (array!97433) Bool)

(assert (=> start!123272 (array_inv!36056 a!2831)))

(declare-fun b!1429567 () Bool)

(declare-fun res!964205 () Bool)

(assert (=> b!1429567 (=> (not res!964205) (not e!807190))))

(declare-datatypes ((SeekEntryResult!11307 0))(
  ( (MissingZero!11307 (index!47620 (_ BitVec 32))) (Found!11307 (index!47621 (_ BitVec 32))) (Intermediate!11307 (undefined!12119 Bool) (index!47622 (_ BitVec 32)) (x!129253 (_ BitVec 32))) (Undefined!11307) (MissingVacant!11307 (index!47623 (_ BitVec 32))) )
))
(declare-fun lt!629418 () SeekEntryResult!11307)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97433 (_ BitVec 32)) SeekEntryResult!11307)

(assert (=> b!1429567 (= res!964205 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47028 a!2831) j!81) a!2831 mask!2608) lt!629418))))

(declare-fun b!1429568 () Bool)

(declare-fun e!807187 () Bool)

(assert (=> b!1429568 (= e!807191 e!807187)))

(declare-fun res!964201 () Bool)

(assert (=> b!1429568 (=> (not res!964201) (not e!807187))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429568 (= res!964201 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47028 a!2831) j!81) mask!2608) (select (arr!47028 a!2831) j!81) a!2831 mask!2608) lt!629418))))

(assert (=> b!1429568 (= lt!629418 (Intermediate!11307 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429569 () Bool)

(assert (=> b!1429569 (= e!807190 (not true))))

(declare-fun e!807188 () Bool)

(assert (=> b!1429569 e!807188))

(declare-fun res!964204 () Bool)

(assert (=> b!1429569 (=> (not res!964204) (not e!807188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97433 (_ BitVec 32)) Bool)

(assert (=> b!1429569 (= res!964204 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48360 0))(
  ( (Unit!48361) )
))
(declare-fun lt!629414 () Unit!48360)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97433 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48360)

(assert (=> b!1429569 (= lt!629414 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429570 () Bool)

(assert (=> b!1429570 (= e!807187 e!807190)))

(declare-fun res!964195 () Bool)

(assert (=> b!1429570 (=> (not res!964195) (not e!807190))))

(declare-fun lt!629417 () array!97433)

(declare-fun lt!629415 () (_ BitVec 64))

(declare-fun lt!629416 () SeekEntryResult!11307)

(assert (=> b!1429570 (= res!964195 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629415 mask!2608) lt!629415 lt!629417 mask!2608) lt!629416))))

(assert (=> b!1429570 (= lt!629416 (Intermediate!11307 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1429570 (= lt!629415 (select (store (arr!47028 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429570 (= lt!629417 (array!97434 (store (arr!47028 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47578 a!2831)))))

(declare-fun b!1429571 () Bool)

(declare-fun res!964206 () Bool)

(assert (=> b!1429571 (=> (not res!964206) (not e!807191))))

(assert (=> b!1429571 (= res!964206 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47578 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47578 a!2831))))))

(declare-fun b!1429572 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97433 (_ BitVec 32)) SeekEntryResult!11307)

(assert (=> b!1429572 (= e!807188 (= (seekEntryOrOpen!0 (select (arr!47028 a!2831) j!81) a!2831 mask!2608) (Found!11307 j!81)))))

(declare-fun b!1429573 () Bool)

(declare-fun res!964197 () Bool)

(assert (=> b!1429573 (=> (not res!964197) (not e!807191))))

(declare-datatypes ((List!33538 0))(
  ( (Nil!33535) (Cons!33534 (h!34848 (_ BitVec 64)) (t!48232 List!33538)) )
))
(declare-fun arrayNoDuplicates!0 (array!97433 (_ BitVec 32) List!33538) Bool)

(assert (=> b!1429573 (= res!964197 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33535))))

(declare-fun b!1429574 () Bool)

(declare-fun res!964202 () Bool)

(assert (=> b!1429574 (=> (not res!964202) (not e!807191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429574 (= res!964202 (validKeyInArray!0 (select (arr!47028 a!2831) j!81)))))

(declare-fun b!1429575 () Bool)

(declare-fun res!964199 () Bool)

(assert (=> b!1429575 (=> (not res!964199) (not e!807191))))

(assert (=> b!1429575 (= res!964199 (validKeyInArray!0 (select (arr!47028 a!2831) i!982)))))

(declare-fun b!1429576 () Bool)

(declare-fun res!964200 () Bool)

(assert (=> b!1429576 (=> (not res!964200) (not e!807191))))

(assert (=> b!1429576 (= res!964200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429577 () Bool)

(declare-fun res!964207 () Bool)

(assert (=> b!1429577 (=> (not res!964207) (not e!807190))))

(assert (=> b!1429577 (= res!964207 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629415 lt!629417 mask!2608) lt!629416))))

(declare-fun b!1429578 () Bool)

(declare-fun res!964198 () Bool)

(assert (=> b!1429578 (=> (not res!964198) (not e!807191))))

(assert (=> b!1429578 (= res!964198 (and (= (size!47578 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47578 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47578 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!123272 res!964196) b!1429578))

(assert (= (and b!1429578 res!964198) b!1429575))

(assert (= (and b!1429575 res!964199) b!1429574))

(assert (= (and b!1429574 res!964202) b!1429576))

(assert (= (and b!1429576 res!964200) b!1429573))

(assert (= (and b!1429573 res!964197) b!1429571))

(assert (= (and b!1429571 res!964206) b!1429568))

(assert (= (and b!1429568 res!964201) b!1429570))

(assert (= (and b!1429570 res!964195) b!1429567))

(assert (= (and b!1429567 res!964205) b!1429577))

(assert (= (and b!1429577 res!964207) b!1429566))

(assert (= (and b!1429566 res!964203) b!1429569))

(assert (= (and b!1429569 res!964204) b!1429572))

(declare-fun m!1319663 () Bool)

(assert (=> b!1429573 m!1319663))

(declare-fun m!1319665 () Bool)

(assert (=> b!1429570 m!1319665))

(assert (=> b!1429570 m!1319665))

(declare-fun m!1319667 () Bool)

(assert (=> b!1429570 m!1319667))

(declare-fun m!1319669 () Bool)

(assert (=> b!1429570 m!1319669))

(declare-fun m!1319671 () Bool)

(assert (=> b!1429570 m!1319671))

(declare-fun m!1319673 () Bool)

(assert (=> b!1429568 m!1319673))

(assert (=> b!1429568 m!1319673))

(declare-fun m!1319675 () Bool)

(assert (=> b!1429568 m!1319675))

(assert (=> b!1429568 m!1319675))

(assert (=> b!1429568 m!1319673))

(declare-fun m!1319677 () Bool)

(assert (=> b!1429568 m!1319677))

(declare-fun m!1319679 () Bool)

(assert (=> b!1429577 m!1319679))

(declare-fun m!1319681 () Bool)

(assert (=> start!123272 m!1319681))

(declare-fun m!1319683 () Bool)

(assert (=> start!123272 m!1319683))

(declare-fun m!1319685 () Bool)

(assert (=> b!1429575 m!1319685))

(assert (=> b!1429575 m!1319685))

(declare-fun m!1319687 () Bool)

(assert (=> b!1429575 m!1319687))

(assert (=> b!1429572 m!1319673))

(assert (=> b!1429572 m!1319673))

(declare-fun m!1319689 () Bool)

(assert (=> b!1429572 m!1319689))

(declare-fun m!1319691 () Bool)

(assert (=> b!1429576 m!1319691))

(declare-fun m!1319693 () Bool)

(assert (=> b!1429569 m!1319693))

(declare-fun m!1319695 () Bool)

(assert (=> b!1429569 m!1319695))

(assert (=> b!1429574 m!1319673))

(assert (=> b!1429574 m!1319673))

(declare-fun m!1319697 () Bool)

(assert (=> b!1429574 m!1319697))

(assert (=> b!1429567 m!1319673))

(assert (=> b!1429567 m!1319673))

(declare-fun m!1319699 () Bool)

(assert (=> b!1429567 m!1319699))

(check-sat (not b!1429572) (not b!1429567) (not b!1429573) (not b!1429576) (not start!123272) (not b!1429570) (not b!1429575) (not b!1429577) (not b!1429569) (not b!1429568) (not b!1429574))
(check-sat)
