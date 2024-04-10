; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118570 () Bool)

(assert start!118570)

(declare-fun b!1386141 () Bool)

(declare-fun res!927397 () Bool)

(declare-fun e!785275 () Bool)

(assert (=> b!1386141 (=> (not res!927397) (not e!785275))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94846 0))(
  ( (array!94847 (arr!45799 (Array (_ BitVec 32) (_ BitVec 64))) (size!46349 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94846)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1386141 (= res!927397 (and (= (size!46349 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46349 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46349 a!2938))))))

(declare-fun b!1386142 () Bool)

(assert (=> b!1386142 (= e!785275 (not (or (bvsgt #b00000000000000000000000000000000 (size!46349 a!2938)) (bvsle startIndex!16 (size!46349 a!2938)))))))

(declare-datatypes ((SeekEntryResult!10142 0))(
  ( (MissingZero!10142 (index!42939 (_ BitVec 32))) (Found!10142 (index!42940 (_ BitVec 32))) (Intermediate!10142 (undefined!10954 Bool) (index!42941 (_ BitVec 32)) (x!124559 (_ BitVec 32))) (Undefined!10142) (MissingVacant!10142 (index!42942 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94846 (_ BitVec 32)) SeekEntryResult!10142)

(assert (=> b!1386142 (= (seekEntryOrOpen!0 (select (arr!45799 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45799 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94847 (store (arr!45799 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46349 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46272 0))(
  ( (Unit!46273) )
))
(declare-fun lt!609378 () Unit!46272)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94846 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46272)

(assert (=> b!1386142 (= lt!609378 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1386143 () Bool)

(declare-fun res!927392 () Bool)

(assert (=> b!1386143 (=> (not res!927392) (not e!785275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386143 (= res!927392 (validKeyInArray!0 (select (arr!45799 a!2938) i!1065)))))

(declare-fun b!1386144 () Bool)

(declare-fun res!927395 () Bool)

(assert (=> b!1386144 (=> (not res!927395) (not e!785275))))

(assert (=> b!1386144 (= res!927395 (and (not (= (select (arr!45799 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45799 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1386145 () Bool)

(declare-fun res!927393 () Bool)

(assert (=> b!1386145 (=> (not res!927393) (not e!785275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94846 (_ BitVec 32)) Bool)

(assert (=> b!1386145 (= res!927393 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!927391 () Bool)

(assert (=> start!118570 (=> (not res!927391) (not e!785275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118570 (= res!927391 (validMask!0 mask!2987))))

(assert (=> start!118570 e!785275))

(assert (=> start!118570 true))

(declare-fun array_inv!34827 (array!94846) Bool)

(assert (=> start!118570 (array_inv!34827 a!2938)))

(declare-fun b!1386146 () Bool)

(declare-fun res!927394 () Bool)

(assert (=> b!1386146 (=> (not res!927394) (not e!785275))))

(assert (=> b!1386146 (= res!927394 (validKeyInArray!0 (select (arr!45799 a!2938) startIndex!16)))))

(declare-fun b!1386147 () Bool)

(declare-fun res!927396 () Bool)

(assert (=> b!1386147 (=> (not res!927396) (not e!785275))))

(declare-datatypes ((List!32327 0))(
  ( (Nil!32324) (Cons!32323 (h!33532 (_ BitVec 64)) (t!47021 List!32327)) )
))
(declare-fun arrayNoDuplicates!0 (array!94846 (_ BitVec 32) List!32327) Bool)

(assert (=> b!1386147 (= res!927396 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32324))))

(assert (= (and start!118570 res!927391) b!1386141))

(assert (= (and b!1386141 res!927397) b!1386143))

(assert (= (and b!1386143 res!927392) b!1386147))

(assert (= (and b!1386147 res!927396) b!1386145))

(assert (= (and b!1386145 res!927393) b!1386144))

(assert (= (and b!1386144 res!927395) b!1386146))

(assert (= (and b!1386146 res!927394) b!1386142))

(declare-fun m!1271467 () Bool)

(assert (=> start!118570 m!1271467))

(declare-fun m!1271469 () Bool)

(assert (=> start!118570 m!1271469))

(declare-fun m!1271471 () Bool)

(assert (=> b!1386145 m!1271471))

(declare-fun m!1271473 () Bool)

(assert (=> b!1386142 m!1271473))

(assert (=> b!1386142 m!1271473))

(declare-fun m!1271475 () Bool)

(assert (=> b!1386142 m!1271475))

(declare-fun m!1271477 () Bool)

(assert (=> b!1386142 m!1271477))

(declare-fun m!1271479 () Bool)

(assert (=> b!1386142 m!1271479))

(declare-fun m!1271481 () Bool)

(assert (=> b!1386142 m!1271481))

(assert (=> b!1386142 m!1271481))

(declare-fun m!1271483 () Bool)

(assert (=> b!1386142 m!1271483))

(declare-fun m!1271485 () Bool)

(assert (=> b!1386147 m!1271485))

(declare-fun m!1271487 () Bool)

(assert (=> b!1386143 m!1271487))

(assert (=> b!1386143 m!1271487))

(declare-fun m!1271489 () Bool)

(assert (=> b!1386143 m!1271489))

(assert (=> b!1386146 m!1271481))

(assert (=> b!1386146 m!1271481))

(declare-fun m!1271491 () Bool)

(assert (=> b!1386146 m!1271491))

(assert (=> b!1386144 m!1271487))

(push 1)

(assert (not b!1386145))

(assert (not b!1386143))

(assert (not b!1386142))

(assert (not start!118570))

(assert (not b!1386147))

(assert (not b!1386146))

(check-sat)

(pop 1)

(push 1)

(check-sat)

