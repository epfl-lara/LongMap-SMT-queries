; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122624 () Bool)

(assert start!122624)

(declare-fun b!1420327 () Bool)

(declare-fun res!955762 () Bool)

(declare-fun e!803356 () Bool)

(assert (=> b!1420327 (=> (not res!955762) (not e!803356))))

(declare-datatypes ((array!96989 0))(
  ( (array!96990 (arr!46812 (Array (_ BitVec 32) (_ BitVec 64))) (size!47362 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96989)

(declare-datatypes ((List!33322 0))(
  ( (Nil!33319) (Cons!33318 (h!34620 (_ BitVec 64)) (t!48016 List!33322)) )
))
(declare-fun arrayNoDuplicates!0 (array!96989 (_ BitVec 32) List!33322) Bool)

(assert (=> b!1420327 (= res!955762 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33319))))

(declare-fun b!1420329 () Bool)

(declare-fun res!955768 () Bool)

(assert (=> b!1420329 (=> (not res!955768) (not e!803356))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11097 0))(
  ( (MissingZero!11097 (index!46780 (_ BitVec 32))) (Found!11097 (index!46781 (_ BitVec 32))) (Intermediate!11097 (undefined!11909 Bool) (index!46782 (_ BitVec 32)) (x!128443 (_ BitVec 32))) (Undefined!11097) (MissingVacant!11097 (index!46783 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96989 (_ BitVec 32)) SeekEntryResult!11097)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420329 (= res!955768 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46812 a!2831) j!81) mask!2608) (select (arr!46812 a!2831) j!81) a!2831 mask!2608) (Intermediate!11097 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420328 () Bool)

(declare-fun res!955761 () Bool)

(assert (=> b!1420328 (=> (not res!955761) (not e!803356))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420328 (= res!955761 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47362 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47362 a!2831))))))

(declare-fun res!955765 () Bool)

(assert (=> start!122624 (=> (not res!955765) (not e!803356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122624 (= res!955765 (validMask!0 mask!2608))))

(assert (=> start!122624 e!803356))

(assert (=> start!122624 true))

(declare-fun array_inv!35840 (array!96989) Bool)

(assert (=> start!122624 (array_inv!35840 a!2831)))

(declare-fun b!1420330 () Bool)

(declare-fun res!955763 () Bool)

(assert (=> b!1420330 (=> (not res!955763) (not e!803356))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420330 (= res!955763 (and (= (size!47362 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47362 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47362 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420331 () Bool)

(declare-fun res!955764 () Bool)

(assert (=> b!1420331 (=> (not res!955764) (not e!803356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420331 (= res!955764 (validKeyInArray!0 (select (arr!46812 a!2831) i!982)))))

(declare-fun b!1420332 () Bool)

(assert (=> b!1420332 (= e!803356 false)))

(declare-fun lt!625905 () SeekEntryResult!11097)

(assert (=> b!1420332 (= lt!625905 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46812 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1420333 () Bool)

(declare-fun res!955767 () Bool)

(assert (=> b!1420333 (=> (not res!955767) (not e!803356))))

(assert (=> b!1420333 (= res!955767 (validKeyInArray!0 (select (arr!46812 a!2831) j!81)))))

(declare-fun b!1420334 () Bool)

(declare-fun res!955760 () Bool)

(assert (=> b!1420334 (=> (not res!955760) (not e!803356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96989 (_ BitVec 32)) Bool)

(assert (=> b!1420334 (= res!955760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420335 () Bool)

(declare-fun res!955766 () Bool)

(assert (=> b!1420335 (=> (not res!955766) (not e!803356))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1420335 (= res!955766 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46812 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46812 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96990 (store (arr!46812 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47362 a!2831)) mask!2608) (Intermediate!11097 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (= (and start!122624 res!955765) b!1420330))

(assert (= (and b!1420330 res!955763) b!1420331))

(assert (= (and b!1420331 res!955764) b!1420333))

(assert (= (and b!1420333 res!955767) b!1420334))

(assert (= (and b!1420334 res!955760) b!1420327))

(assert (= (and b!1420327 res!955762) b!1420328))

(assert (= (and b!1420328 res!955761) b!1420329))

(assert (= (and b!1420329 res!955768) b!1420335))

(assert (= (and b!1420335 res!955766) b!1420332))

(declare-fun m!1310835 () Bool)

(assert (=> b!1420331 m!1310835))

(assert (=> b!1420331 m!1310835))

(declare-fun m!1310837 () Bool)

(assert (=> b!1420331 m!1310837))

(declare-fun m!1310839 () Bool)

(assert (=> b!1420327 m!1310839))

(declare-fun m!1310841 () Bool)

(assert (=> b!1420332 m!1310841))

(assert (=> b!1420332 m!1310841))

(declare-fun m!1310843 () Bool)

(assert (=> b!1420332 m!1310843))

(assert (=> b!1420329 m!1310841))

(assert (=> b!1420329 m!1310841))

(declare-fun m!1310845 () Bool)

(assert (=> b!1420329 m!1310845))

(assert (=> b!1420329 m!1310845))

(assert (=> b!1420329 m!1310841))

(declare-fun m!1310847 () Bool)

(assert (=> b!1420329 m!1310847))

(assert (=> b!1420333 m!1310841))

(assert (=> b!1420333 m!1310841))

(declare-fun m!1310849 () Bool)

(assert (=> b!1420333 m!1310849))

(declare-fun m!1310851 () Bool)

(assert (=> start!122624 m!1310851))

(declare-fun m!1310853 () Bool)

(assert (=> start!122624 m!1310853))

(declare-fun m!1310855 () Bool)

(assert (=> b!1420334 m!1310855))

(declare-fun m!1310857 () Bool)

(assert (=> b!1420335 m!1310857))

(declare-fun m!1310859 () Bool)

(assert (=> b!1420335 m!1310859))

(assert (=> b!1420335 m!1310859))

(declare-fun m!1310861 () Bool)

(assert (=> b!1420335 m!1310861))

(assert (=> b!1420335 m!1310861))

(assert (=> b!1420335 m!1310859))

(declare-fun m!1310863 () Bool)

(assert (=> b!1420335 m!1310863))

(check-sat (not b!1420327) (not b!1420334) (not b!1420332) (not b!1420333) (not b!1420335) (not b!1420331) (not start!122624) (not b!1420329))
