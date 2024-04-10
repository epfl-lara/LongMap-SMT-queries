; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122628 () Bool)

(assert start!122628)

(declare-fun b!1420383 () Bool)

(declare-fun res!955820 () Bool)

(declare-fun e!803370 () Bool)

(assert (=> b!1420383 (=> (not res!955820) (not e!803370))))

(declare-datatypes ((array!96993 0))(
  ( (array!96994 (arr!46814 (Array (_ BitVec 32) (_ BitVec 64))) (size!47364 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96993)

(declare-datatypes ((List!33324 0))(
  ( (Nil!33321) (Cons!33320 (h!34622 (_ BitVec 64)) (t!48018 List!33324)) )
))
(declare-fun arrayNoDuplicates!0 (array!96993 (_ BitVec 32) List!33324) Bool)

(assert (=> b!1420383 (= res!955820 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33321))))

(declare-fun b!1420384 () Bool)

(declare-fun res!955819 () Bool)

(assert (=> b!1420384 (=> (not res!955819) (not e!803370))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96993 (_ BitVec 32)) Bool)

(assert (=> b!1420384 (= res!955819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420386 () Bool)

(declare-fun res!955817 () Bool)

(assert (=> b!1420386 (=> (not res!955817) (not e!803370))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420386 (= res!955817 (and (= (size!47364 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47364 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47364 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420387 () Bool)

(declare-fun res!955823 () Bool)

(declare-fun e!803371 () Bool)

(assert (=> b!1420387 (=> (not res!955823) (not e!803371))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11099 0))(
  ( (MissingZero!11099 (index!46788 (_ BitVec 32))) (Found!11099 (index!46789 (_ BitVec 32))) (Intermediate!11099 (undefined!11911 Bool) (index!46790 (_ BitVec 32)) (x!128453 (_ BitVec 32))) (Undefined!11099) (MissingVacant!11099 (index!46791 (_ BitVec 32))) )
))
(declare-fun lt!625911 () SeekEntryResult!11099)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96993 (_ BitVec 32)) SeekEntryResult!11099)

(assert (=> b!1420387 (= res!955823 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46814 a!2831) j!81) a!2831 mask!2608) lt!625911))))

(declare-fun b!1420388 () Bool)

(declare-fun res!955825 () Bool)

(assert (=> b!1420388 (=> (not res!955825) (not e!803370))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420388 (= res!955825 (validKeyInArray!0 (select (arr!46814 a!2831) i!982)))))

(declare-fun b!1420389 () Bool)

(assert (=> b!1420389 (= e!803370 e!803371)))

(declare-fun res!955821 () Bool)

(assert (=> b!1420389 (=> (not res!955821) (not e!803371))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420389 (= res!955821 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46814 a!2831) j!81) mask!2608) (select (arr!46814 a!2831) j!81) a!2831 mask!2608) lt!625911))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1420389 (= lt!625911 (Intermediate!11099 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420390 () Bool)

(assert (=> b!1420390 (= e!803371 (and (bvsge mask!2608 #b00000000000000000000000000000000) (bvsge index!585 (bvadd #b00000000000000000000000000000001 mask!2608))))))

(declare-fun b!1420391 () Bool)

(declare-fun res!955818 () Bool)

(assert (=> b!1420391 (=> (not res!955818) (not e!803370))))

(assert (=> b!1420391 (= res!955818 (validKeyInArray!0 (select (arr!46814 a!2831) j!81)))))

(declare-fun b!1420392 () Bool)

(declare-fun res!955824 () Bool)

(assert (=> b!1420392 (=> (not res!955824) (not e!803371))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1420392 (= res!955824 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46814 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46814 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96994 (store (arr!46814 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47364 a!2831)) mask!2608) (Intermediate!11099 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1420385 () Bool)

(declare-fun res!955822 () Bool)

(assert (=> b!1420385 (=> (not res!955822) (not e!803370))))

(assert (=> b!1420385 (= res!955822 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47364 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47364 a!2831))))))

(declare-fun res!955816 () Bool)

(assert (=> start!122628 (=> (not res!955816) (not e!803370))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122628 (= res!955816 (validMask!0 mask!2608))))

(assert (=> start!122628 e!803370))

(assert (=> start!122628 true))

(declare-fun array_inv!35842 (array!96993) Bool)

(assert (=> start!122628 (array_inv!35842 a!2831)))

(assert (= (and start!122628 res!955816) b!1420386))

(assert (= (and b!1420386 res!955817) b!1420388))

(assert (= (and b!1420388 res!955825) b!1420391))

(assert (= (and b!1420391 res!955818) b!1420384))

(assert (= (and b!1420384 res!955819) b!1420383))

(assert (= (and b!1420383 res!955820) b!1420385))

(assert (= (and b!1420385 res!955822) b!1420389))

(assert (= (and b!1420389 res!955821) b!1420392))

(assert (= (and b!1420392 res!955824) b!1420387))

(assert (= (and b!1420387 res!955823) b!1420390))

(declare-fun m!1310895 () Bool)

(assert (=> b!1420383 m!1310895))

(declare-fun m!1310897 () Bool)

(assert (=> b!1420387 m!1310897))

(assert (=> b!1420387 m!1310897))

(declare-fun m!1310899 () Bool)

(assert (=> b!1420387 m!1310899))

(assert (=> b!1420389 m!1310897))

(assert (=> b!1420389 m!1310897))

(declare-fun m!1310901 () Bool)

(assert (=> b!1420389 m!1310901))

(assert (=> b!1420389 m!1310901))

(assert (=> b!1420389 m!1310897))

(declare-fun m!1310903 () Bool)

(assert (=> b!1420389 m!1310903))

(declare-fun m!1310905 () Bool)

(assert (=> b!1420392 m!1310905))

(declare-fun m!1310907 () Bool)

(assert (=> b!1420392 m!1310907))

(assert (=> b!1420392 m!1310907))

(declare-fun m!1310909 () Bool)

(assert (=> b!1420392 m!1310909))

(assert (=> b!1420392 m!1310909))

(assert (=> b!1420392 m!1310907))

(declare-fun m!1310911 () Bool)

(assert (=> b!1420392 m!1310911))

(declare-fun m!1310913 () Bool)

(assert (=> b!1420384 m!1310913))

(declare-fun m!1310915 () Bool)

(assert (=> start!122628 m!1310915))

(declare-fun m!1310917 () Bool)

(assert (=> start!122628 m!1310917))

(assert (=> b!1420391 m!1310897))

(assert (=> b!1420391 m!1310897))

(declare-fun m!1310919 () Bool)

(assert (=> b!1420391 m!1310919))

(declare-fun m!1310921 () Bool)

(assert (=> b!1420388 m!1310921))

(assert (=> b!1420388 m!1310921))

(declare-fun m!1310923 () Bool)

(assert (=> b!1420388 m!1310923))

(push 1)

(assert (not b!1420391))

(assert (not b!1420392))

(assert (not b!1420384))

(assert (not b!1420387))

(assert (not b!1420388))

(assert (not start!122628))

(assert (not b!1420389))

(assert (not b!1420383))

(check-sat)

(pop 1)

(push 1)

(check-sat)

