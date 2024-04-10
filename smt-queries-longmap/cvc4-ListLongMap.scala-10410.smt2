; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122626 () Bool)

(assert start!122626)

(declare-fun b!1420354 () Bool)

(declare-fun res!955790 () Bool)

(declare-fun e!803363 () Bool)

(assert (=> b!1420354 (=> (not res!955790) (not e!803363))))

(declare-datatypes ((array!96991 0))(
  ( (array!96992 (arr!46813 (Array (_ BitVec 32) (_ BitVec 64))) (size!47363 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96991)

(declare-datatypes ((List!33323 0))(
  ( (Nil!33320) (Cons!33319 (h!34621 (_ BitVec 64)) (t!48017 List!33323)) )
))
(declare-fun arrayNoDuplicates!0 (array!96991 (_ BitVec 32) List!33323) Bool)

(assert (=> b!1420354 (= res!955790 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33320))))

(declare-fun res!955791 () Bool)

(assert (=> start!122626 (=> (not res!955791) (not e!803363))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122626 (= res!955791 (validMask!0 mask!2608))))

(assert (=> start!122626 e!803363))

(assert (=> start!122626 true))

(declare-fun array_inv!35841 (array!96991) Bool)

(assert (=> start!122626 (array_inv!35841 a!2831)))

(declare-fun b!1420355 () Bool)

(declare-fun res!955787 () Bool)

(assert (=> b!1420355 (=> (not res!955787) (not e!803363))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420355 (= res!955787 (validKeyInArray!0 (select (arr!46813 a!2831) i!982)))))

(declare-fun b!1420356 () Bool)

(declare-fun res!955788 () Bool)

(assert (=> b!1420356 (=> (not res!955788) (not e!803363))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420356 (= res!955788 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47363 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47363 a!2831))))))

(declare-fun b!1420357 () Bool)

(assert (=> b!1420357 (= e!803363 false)))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11098 0))(
  ( (MissingZero!11098 (index!46784 (_ BitVec 32))) (Found!11098 (index!46785 (_ BitVec 32))) (Intermediate!11098 (undefined!11910 Bool) (index!46786 (_ BitVec 32)) (x!128444 (_ BitVec 32))) (Undefined!11098) (MissingVacant!11098 (index!46787 (_ BitVec 32))) )
))
(declare-fun lt!625908 () SeekEntryResult!11098)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96991 (_ BitVec 32)) SeekEntryResult!11098)

(assert (=> b!1420357 (= lt!625908 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46813 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1420358 () Bool)

(declare-fun res!955795 () Bool)

(assert (=> b!1420358 (=> (not res!955795) (not e!803363))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420358 (= res!955795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46813 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46813 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96992 (store (arr!46813 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47363 a!2831)) mask!2608) (Intermediate!11098 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1420359 () Bool)

(declare-fun res!955794 () Bool)

(assert (=> b!1420359 (=> (not res!955794) (not e!803363))))

(assert (=> b!1420359 (= res!955794 (and (= (size!47363 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47363 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47363 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420360 () Bool)

(declare-fun res!955793 () Bool)

(assert (=> b!1420360 (=> (not res!955793) (not e!803363))))

(assert (=> b!1420360 (= res!955793 (validKeyInArray!0 (select (arr!46813 a!2831) j!81)))))

(declare-fun b!1420361 () Bool)

(declare-fun res!955789 () Bool)

(assert (=> b!1420361 (=> (not res!955789) (not e!803363))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96991 (_ BitVec 32)) Bool)

(assert (=> b!1420361 (= res!955789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420362 () Bool)

(declare-fun res!955792 () Bool)

(assert (=> b!1420362 (=> (not res!955792) (not e!803363))))

(assert (=> b!1420362 (= res!955792 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46813 a!2831) j!81) mask!2608) (select (arr!46813 a!2831) j!81) a!2831 mask!2608) (Intermediate!11098 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(assert (= (and start!122626 res!955791) b!1420359))

(assert (= (and b!1420359 res!955794) b!1420355))

(assert (= (and b!1420355 res!955787) b!1420360))

(assert (= (and b!1420360 res!955793) b!1420361))

(assert (= (and b!1420361 res!955789) b!1420354))

(assert (= (and b!1420354 res!955790) b!1420356))

(assert (= (and b!1420356 res!955788) b!1420362))

(assert (= (and b!1420362 res!955792) b!1420358))

(assert (= (and b!1420358 res!955795) b!1420357))

(declare-fun m!1310865 () Bool)

(assert (=> start!122626 m!1310865))

(declare-fun m!1310867 () Bool)

(assert (=> start!122626 m!1310867))

(declare-fun m!1310869 () Bool)

(assert (=> b!1420354 m!1310869))

(declare-fun m!1310871 () Bool)

(assert (=> b!1420361 m!1310871))

(declare-fun m!1310873 () Bool)

(assert (=> b!1420358 m!1310873))

(declare-fun m!1310875 () Bool)

(assert (=> b!1420358 m!1310875))

(assert (=> b!1420358 m!1310875))

(declare-fun m!1310877 () Bool)

(assert (=> b!1420358 m!1310877))

(assert (=> b!1420358 m!1310877))

(assert (=> b!1420358 m!1310875))

(declare-fun m!1310879 () Bool)

(assert (=> b!1420358 m!1310879))

(declare-fun m!1310881 () Bool)

(assert (=> b!1420360 m!1310881))

(assert (=> b!1420360 m!1310881))

(declare-fun m!1310883 () Bool)

(assert (=> b!1420360 m!1310883))

(assert (=> b!1420357 m!1310881))

(assert (=> b!1420357 m!1310881))

(declare-fun m!1310885 () Bool)

(assert (=> b!1420357 m!1310885))

(assert (=> b!1420362 m!1310881))

(assert (=> b!1420362 m!1310881))

(declare-fun m!1310887 () Bool)

(assert (=> b!1420362 m!1310887))

(assert (=> b!1420362 m!1310887))

(assert (=> b!1420362 m!1310881))

(declare-fun m!1310889 () Bool)

(assert (=> b!1420362 m!1310889))

(declare-fun m!1310891 () Bool)

(assert (=> b!1420355 m!1310891))

(assert (=> b!1420355 m!1310891))

(declare-fun m!1310893 () Bool)

(assert (=> b!1420355 m!1310893))

(push 1)

(assert (not b!1420362))

(assert (not b!1420361))

(assert (not b!1420360))

(assert (not b!1420354))

(assert (not b!1420358))

(assert (not b!1420355))

(assert (not start!122626))

(assert (not b!1420357))

(check-sat)

(pop 1)

