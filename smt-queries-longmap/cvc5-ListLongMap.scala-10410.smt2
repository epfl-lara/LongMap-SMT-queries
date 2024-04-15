; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122622 () Bool)

(assert start!122622)

(declare-fun b!1420273 () Bool)

(declare-fun e!803324 () Bool)

(assert (=> b!1420273 (= e!803324 false)))

(declare-datatypes ((SeekEntryResult!11100 0))(
  ( (MissingZero!11100 (index!46792 (_ BitVec 32))) (Found!11100 (index!46793 (_ BitVec 32))) (Intermediate!11100 (undefined!11912 Bool) (index!46794 (_ BitVec 32)) (x!128443 (_ BitVec 32))) (Undefined!11100) (MissingVacant!11100 (index!46795 (_ BitVec 32))) )
))
(declare-fun lt!625718 () SeekEntryResult!11100)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96940 0))(
  ( (array!96941 (arr!46788 (Array (_ BitVec 32) (_ BitVec 64))) (size!47340 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96940)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96940 (_ BitVec 32)) SeekEntryResult!11100)

(assert (=> b!1420273 (= lt!625718 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46788 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1420274 () Bool)

(declare-fun res!955758 () Bool)

(assert (=> b!1420274 (=> (not res!955758) (not e!803324))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1420274 (= res!955758 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47340 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47340 a!2831))))))

(declare-fun b!1420275 () Bool)

(declare-fun res!955765 () Bool)

(assert (=> b!1420275 (=> (not res!955765) (not e!803324))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420275 (= res!955765 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46788 a!2831) j!81) mask!2608) (select (arr!46788 a!2831) j!81) a!2831 mask!2608) (Intermediate!11100 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420276 () Bool)

(declare-fun res!955761 () Bool)

(assert (=> b!1420276 (=> (not res!955761) (not e!803324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420276 (= res!955761 (validKeyInArray!0 (select (arr!46788 a!2831) j!81)))))

(declare-fun b!1420277 () Bool)

(declare-fun res!955764 () Bool)

(assert (=> b!1420277 (=> (not res!955764) (not e!803324))))

(declare-datatypes ((List!33376 0))(
  ( (Nil!33373) (Cons!33372 (h!34674 (_ BitVec 64)) (t!48062 List!33376)) )
))
(declare-fun arrayNoDuplicates!0 (array!96940 (_ BitVec 32) List!33376) Bool)

(assert (=> b!1420277 (= res!955764 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33373))))

(declare-fun res!955763 () Bool)

(assert (=> start!122622 (=> (not res!955763) (not e!803324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122622 (= res!955763 (validMask!0 mask!2608))))

(assert (=> start!122622 e!803324))

(assert (=> start!122622 true))

(declare-fun array_inv!36021 (array!96940) Bool)

(assert (=> start!122622 (array_inv!36021 a!2831)))

(declare-fun b!1420278 () Bool)

(declare-fun res!955757 () Bool)

(assert (=> b!1420278 (=> (not res!955757) (not e!803324))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420278 (= res!955757 (and (= (size!47340 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47340 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47340 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420279 () Bool)

(declare-fun res!955759 () Bool)

(assert (=> b!1420279 (=> (not res!955759) (not e!803324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96940 (_ BitVec 32)) Bool)

(assert (=> b!1420279 (= res!955759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420280 () Bool)

(declare-fun res!955762 () Bool)

(assert (=> b!1420280 (=> (not res!955762) (not e!803324))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1420280 (= res!955762 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46788 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46788 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96941 (store (arr!46788 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47340 a!2831)) mask!2608) (Intermediate!11100 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1420281 () Bool)

(declare-fun res!955760 () Bool)

(assert (=> b!1420281 (=> (not res!955760) (not e!803324))))

(assert (=> b!1420281 (= res!955760 (validKeyInArray!0 (select (arr!46788 a!2831) i!982)))))

(assert (= (and start!122622 res!955763) b!1420278))

(assert (= (and b!1420278 res!955757) b!1420281))

(assert (= (and b!1420281 res!955760) b!1420276))

(assert (= (and b!1420276 res!955761) b!1420279))

(assert (= (and b!1420279 res!955759) b!1420277))

(assert (= (and b!1420277 res!955764) b!1420274))

(assert (= (and b!1420274 res!955758) b!1420275))

(assert (= (and b!1420275 res!955765) b!1420280))

(assert (= (and b!1420280 res!955762) b!1420273))

(declare-fun m!1310313 () Bool)

(assert (=> b!1420281 m!1310313))

(assert (=> b!1420281 m!1310313))

(declare-fun m!1310315 () Bool)

(assert (=> b!1420281 m!1310315))

(declare-fun m!1310317 () Bool)

(assert (=> start!122622 m!1310317))

(declare-fun m!1310319 () Bool)

(assert (=> start!122622 m!1310319))

(declare-fun m!1310321 () Bool)

(assert (=> b!1420273 m!1310321))

(assert (=> b!1420273 m!1310321))

(declare-fun m!1310323 () Bool)

(assert (=> b!1420273 m!1310323))

(declare-fun m!1310325 () Bool)

(assert (=> b!1420279 m!1310325))

(assert (=> b!1420275 m!1310321))

(assert (=> b!1420275 m!1310321))

(declare-fun m!1310327 () Bool)

(assert (=> b!1420275 m!1310327))

(assert (=> b!1420275 m!1310327))

(assert (=> b!1420275 m!1310321))

(declare-fun m!1310329 () Bool)

(assert (=> b!1420275 m!1310329))

(declare-fun m!1310331 () Bool)

(assert (=> b!1420277 m!1310331))

(declare-fun m!1310333 () Bool)

(assert (=> b!1420280 m!1310333))

(declare-fun m!1310335 () Bool)

(assert (=> b!1420280 m!1310335))

(assert (=> b!1420280 m!1310335))

(declare-fun m!1310337 () Bool)

(assert (=> b!1420280 m!1310337))

(assert (=> b!1420280 m!1310337))

(assert (=> b!1420280 m!1310335))

(declare-fun m!1310339 () Bool)

(assert (=> b!1420280 m!1310339))

(assert (=> b!1420276 m!1310321))

(assert (=> b!1420276 m!1310321))

(declare-fun m!1310341 () Bool)

(assert (=> b!1420276 m!1310341))

(push 1)

(assert (not b!1420277))

(assert (not start!122622))

(assert (not b!1420279))

(assert (not b!1420280))

(assert (not b!1420276))

(assert (not b!1420275))

(assert (not b!1420273))

(assert (not b!1420281))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

