; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118578 () Bool)

(assert start!118578)

(declare-fun b!1386229 () Bool)

(declare-fun res!927480 () Bool)

(declare-fun e!785305 () Bool)

(assert (=> b!1386229 (=> (not res!927480) (not e!785305))))

(declare-datatypes ((array!94854 0))(
  ( (array!94855 (arr!45803 (Array (_ BitVec 32) (_ BitVec 64))) (size!46353 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94854)

(declare-datatypes ((List!32331 0))(
  ( (Nil!32328) (Cons!32327 (h!33536 (_ BitVec 64)) (t!47025 List!32331)) )
))
(declare-fun arrayNoDuplicates!0 (array!94854 (_ BitVec 32) List!32331) Bool)

(assert (=> b!1386229 (= res!927480 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32328))))

(declare-fun b!1386230 () Bool)

(declare-datatypes ((Unit!46280 0))(
  ( (Unit!46281) )
))
(declare-fun e!785304 () Unit!46280)

(declare-fun lt!609394 () Unit!46280)

(assert (=> b!1386230 (= e!785304 lt!609394)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lt!609396 () Unit!46280)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94854 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46280)

(assert (=> b!1386230 (= lt!609396 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10146 0))(
  ( (MissingZero!10146 (index!42955 (_ BitVec 32))) (Found!10146 (index!42956 (_ BitVec 32))) (Intermediate!10146 (undefined!10958 Bool) (index!42957 (_ BitVec 32)) (x!124579 (_ BitVec 32))) (Undefined!10146) (MissingVacant!10146 (index!42958 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94854 (_ BitVec 32)) SeekEntryResult!10146)

(assert (=> b!1386230 (= (seekEntryOrOpen!0 (select (arr!45803 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45803 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94855 (store (arr!45803 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46353 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94854 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46280)

(assert (=> b!1386230 (= lt!609394 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94854 (_ BitVec 32)) Bool)

(assert (=> b!1386230 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386231 () Bool)

(declare-fun res!927478 () Bool)

(assert (=> b!1386231 (=> (not res!927478) (not e!785305))))

(assert (=> b!1386231 (= res!927478 (and (not (= (select (arr!45803 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45803 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386232 () Bool)

(declare-fun res!927475 () Bool)

(assert (=> b!1386232 (=> (not res!927475) (not e!785305))))

(assert (=> b!1386232 (= res!927475 (and (= (size!46353 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46353 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46353 a!2938))))))

(declare-fun res!927476 () Bool)

(assert (=> start!118578 (=> (not res!927476) (not e!785305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118578 (= res!927476 (validMask!0 mask!2987))))

(assert (=> start!118578 e!785305))

(assert (=> start!118578 true))

(declare-fun array_inv!34831 (array!94854) Bool)

(assert (=> start!118578 (array_inv!34831 a!2938)))

(declare-fun b!1386233 () Bool)

(declare-fun res!927477 () Bool)

(assert (=> b!1386233 (=> (not res!927477) (not e!785305))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386233 (= res!927477 (validKeyInArray!0 (select (arr!45803 a!2938) i!1065)))))

(declare-fun b!1386234 () Bool)

(declare-fun e!785303 () Bool)

(assert (=> b!1386234 (= e!785303 (validKeyInArray!0 (select (arr!45803 a!2938) startIndex!16)))))

(declare-fun b!1386235 () Bool)

(declare-fun res!927481 () Bool)

(assert (=> b!1386235 (=> (not res!927481) (not e!785305))))

(assert (=> b!1386235 (= res!927481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386236 () Bool)

(declare-fun Unit!46282 () Unit!46280)

(assert (=> b!1386236 (= e!785304 Unit!46282)))

(declare-fun b!1386237 () Bool)

(assert (=> b!1386237 (= e!785305 false)))

(declare-fun lt!609395 () Unit!46280)

(assert (=> b!1386237 (= lt!609395 e!785304)))

(declare-fun c!128817 () Bool)

(assert (=> b!1386237 (= c!128817 e!785303)))

(declare-fun res!927479 () Bool)

(assert (=> b!1386237 (=> (not res!927479) (not e!785303))))

(assert (=> b!1386237 (= res!927479 (not (= startIndex!16 i!1065)))))

(assert (= (and start!118578 res!927476) b!1386232))

(assert (= (and b!1386232 res!927475) b!1386233))

(assert (= (and b!1386233 res!927477) b!1386229))

(assert (= (and b!1386229 res!927480) b!1386235))

(assert (= (and b!1386235 res!927481) b!1386231))

(assert (= (and b!1386231 res!927478) b!1386237))

(assert (= (and b!1386237 res!927479) b!1386234))

(assert (= (and b!1386237 c!128817) b!1386230))

(assert (= (and b!1386237 (not c!128817)) b!1386236))

(declare-fun m!1271571 () Bool)

(assert (=> b!1386233 m!1271571))

(assert (=> b!1386233 m!1271571))

(declare-fun m!1271573 () Bool)

(assert (=> b!1386233 m!1271573))

(declare-fun m!1271575 () Bool)

(assert (=> b!1386230 m!1271575))

(declare-fun m!1271577 () Bool)

(assert (=> b!1386230 m!1271577))

(assert (=> b!1386230 m!1271577))

(declare-fun m!1271579 () Bool)

(assert (=> b!1386230 m!1271579))

(declare-fun m!1271581 () Bool)

(assert (=> b!1386230 m!1271581))

(declare-fun m!1271583 () Bool)

(assert (=> b!1386230 m!1271583))

(declare-fun m!1271585 () Bool)

(assert (=> b!1386230 m!1271585))

(declare-fun m!1271587 () Bool)

(assert (=> b!1386230 m!1271587))

(assert (=> b!1386230 m!1271585))

(declare-fun m!1271589 () Bool)

(assert (=> b!1386230 m!1271589))

(assert (=> b!1386234 m!1271585))

(assert (=> b!1386234 m!1271585))

(declare-fun m!1271591 () Bool)

(assert (=> b!1386234 m!1271591))

(declare-fun m!1271593 () Bool)

(assert (=> b!1386235 m!1271593))

(declare-fun m!1271595 () Bool)

(assert (=> b!1386229 m!1271595))

(assert (=> b!1386231 m!1271571))

(declare-fun m!1271597 () Bool)

(assert (=> start!118578 m!1271597))

(declare-fun m!1271599 () Bool)

(assert (=> start!118578 m!1271599))

(push 1)

(assert (not b!1386233))

(assert (not start!118578))

(assert (not b!1386235))

(assert (not b!1386234))

(assert (not b!1386229))

(assert (not b!1386230))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

