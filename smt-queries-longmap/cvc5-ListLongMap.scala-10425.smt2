; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122712 () Bool)

(assert start!122712)

(declare-fun b!1421772 () Bool)

(declare-fun res!957264 () Bool)

(declare-fun e!803852 () Bool)

(assert (=> b!1421772 (=> (not res!957264) (not e!803852))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97030 0))(
  ( (array!97031 (arr!46833 (Array (_ BitVec 32) (_ BitVec 64))) (size!47385 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97030)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421772 (= res!957264 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47385 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47385 a!2831))))))

(declare-fun e!803853 () Bool)

(declare-fun b!1421773 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11145 0))(
  ( (MissingZero!11145 (index!46972 (_ BitVec 32))) (Found!11145 (index!46973 (_ BitVec 32))) (Intermediate!11145 (undefined!11957 Bool) (index!46974 (_ BitVec 32)) (x!128608 (_ BitVec 32))) (Undefined!11145) (MissingVacant!11145 (index!46975 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97030 (_ BitVec 32)) SeekEntryResult!11145)

(assert (=> b!1421773 (= e!803853 (= (seekEntryOrOpen!0 (select (arr!46833 a!2831) j!81) a!2831 mask!2608) (Found!11145 j!81)))))

(declare-fun b!1421774 () Bool)

(declare-fun res!957256 () Bool)

(assert (=> b!1421774 (=> (not res!957256) (not e!803852))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421774 (= res!957256 (and (= (size!47385 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47385 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47385 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1421775 () Bool)

(declare-fun res!957260 () Bool)

(declare-fun e!803851 () Bool)

(assert (=> b!1421775 (=> (not res!957260) (not e!803851))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421775 (= res!957260 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421776 () Bool)

(declare-fun res!957259 () Bool)

(assert (=> b!1421776 (=> (not res!957259) (not e!803851))))

(declare-fun lt!626239 () SeekEntryResult!11145)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97030 (_ BitVec 32)) SeekEntryResult!11145)

(assert (=> b!1421776 (= res!957259 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46833 a!2831) j!81) a!2831 mask!2608) lt!626239))))

(declare-fun b!1421777 () Bool)

(declare-fun res!957266 () Bool)

(assert (=> b!1421777 (=> (not res!957266) (not e!803852))))

(declare-datatypes ((List!33421 0))(
  ( (Nil!33418) (Cons!33417 (h!34719 (_ BitVec 64)) (t!48107 List!33421)) )
))
(declare-fun arrayNoDuplicates!0 (array!97030 (_ BitVec 32) List!33421) Bool)

(assert (=> b!1421777 (= res!957266 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33418))))

(declare-fun b!1421778 () Bool)

(assert (=> b!1421778 (= e!803851 (not (or (= (select (arr!46833 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46833 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46833 a!2831) index!585) (select (arr!46833 a!2831) j!81)) (= (select (store (arr!46833 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!2608 #b00000000000000000000000000000000) (bvslt index!585 (bvadd #b00000000000000000000000000000001 mask!2608)))))))

(assert (=> b!1421778 e!803853))

(declare-fun res!957258 () Bool)

(assert (=> b!1421778 (=> (not res!957258) (not e!803853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97030 (_ BitVec 32)) Bool)

(assert (=> b!1421778 (= res!957258 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!47965 0))(
  ( (Unit!47966) )
))
(declare-fun lt!626236 () Unit!47965)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97030 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47965)

(assert (=> b!1421778 (= lt!626236 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421779 () Bool)

(declare-fun res!957265 () Bool)

(assert (=> b!1421779 (=> (not res!957265) (not e!803852))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421779 (= res!957265 (validKeyInArray!0 (select (arr!46833 a!2831) j!81)))))

(declare-fun b!1421780 () Bool)

(declare-fun res!957257 () Bool)

(assert (=> b!1421780 (=> (not res!957257) (not e!803852))))

(assert (=> b!1421780 (= res!957257 (validKeyInArray!0 (select (arr!46833 a!2831) i!982)))))

(declare-fun b!1421781 () Bool)

(declare-fun e!803854 () Bool)

(assert (=> b!1421781 (= e!803854 e!803851)))

(declare-fun res!957267 () Bool)

(assert (=> b!1421781 (=> (not res!957267) (not e!803851))))

(declare-fun lt!626237 () SeekEntryResult!11145)

(declare-fun lt!626238 () (_ BitVec 64))

(declare-fun lt!626240 () array!97030)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421781 (= res!957267 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626238 mask!2608) lt!626238 lt!626240 mask!2608) lt!626237))))

(assert (=> b!1421781 (= lt!626237 (Intermediate!11145 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421781 (= lt!626238 (select (store (arr!46833 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421781 (= lt!626240 (array!97031 (store (arr!46833 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47385 a!2831)))))

(declare-fun b!1421782 () Bool)

(assert (=> b!1421782 (= e!803852 e!803854)))

(declare-fun res!957262 () Bool)

(assert (=> b!1421782 (=> (not res!957262) (not e!803854))))

(assert (=> b!1421782 (= res!957262 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46833 a!2831) j!81) mask!2608) (select (arr!46833 a!2831) j!81) a!2831 mask!2608) lt!626239))))

(assert (=> b!1421782 (= lt!626239 (Intermediate!11145 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!957263 () Bool)

(assert (=> start!122712 (=> (not res!957263) (not e!803852))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122712 (= res!957263 (validMask!0 mask!2608))))

(assert (=> start!122712 e!803852))

(assert (=> start!122712 true))

(declare-fun array_inv!36066 (array!97030) Bool)

(assert (=> start!122712 (array_inv!36066 a!2831)))

(declare-fun b!1421783 () Bool)

(declare-fun res!957261 () Bool)

(assert (=> b!1421783 (=> (not res!957261) (not e!803851))))

(assert (=> b!1421783 (= res!957261 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626238 lt!626240 mask!2608) lt!626237))))

(declare-fun b!1421784 () Bool)

(declare-fun res!957268 () Bool)

(assert (=> b!1421784 (=> (not res!957268) (not e!803852))))

(assert (=> b!1421784 (= res!957268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122712 res!957263) b!1421774))

(assert (= (and b!1421774 res!957256) b!1421780))

(assert (= (and b!1421780 res!957257) b!1421779))

(assert (= (and b!1421779 res!957265) b!1421784))

(assert (= (and b!1421784 res!957268) b!1421777))

(assert (= (and b!1421777 res!957266) b!1421772))

(assert (= (and b!1421772 res!957264) b!1421782))

(assert (= (and b!1421782 res!957262) b!1421781))

(assert (= (and b!1421781 res!957267) b!1421776))

(assert (= (and b!1421776 res!957259) b!1421783))

(assert (= (and b!1421783 res!957261) b!1421775))

(assert (= (and b!1421775 res!957260) b!1421778))

(assert (= (and b!1421778 res!957258) b!1421773))

(declare-fun m!1311855 () Bool)

(assert (=> start!122712 m!1311855))

(declare-fun m!1311857 () Bool)

(assert (=> start!122712 m!1311857))

(declare-fun m!1311859 () Bool)

(assert (=> b!1421776 m!1311859))

(assert (=> b!1421776 m!1311859))

(declare-fun m!1311861 () Bool)

(assert (=> b!1421776 m!1311861))

(declare-fun m!1311863 () Bool)

(assert (=> b!1421783 m!1311863))

(assert (=> b!1421773 m!1311859))

(assert (=> b!1421773 m!1311859))

(declare-fun m!1311865 () Bool)

(assert (=> b!1421773 m!1311865))

(declare-fun m!1311867 () Bool)

(assert (=> b!1421780 m!1311867))

(assert (=> b!1421780 m!1311867))

(declare-fun m!1311869 () Bool)

(assert (=> b!1421780 m!1311869))

(declare-fun m!1311871 () Bool)

(assert (=> b!1421784 m!1311871))

(declare-fun m!1311873 () Bool)

(assert (=> b!1421778 m!1311873))

(declare-fun m!1311875 () Bool)

(assert (=> b!1421778 m!1311875))

(declare-fun m!1311877 () Bool)

(assert (=> b!1421778 m!1311877))

(declare-fun m!1311879 () Bool)

(assert (=> b!1421778 m!1311879))

(assert (=> b!1421778 m!1311859))

(declare-fun m!1311881 () Bool)

(assert (=> b!1421778 m!1311881))

(declare-fun m!1311883 () Bool)

(assert (=> b!1421777 m!1311883))

(assert (=> b!1421782 m!1311859))

(assert (=> b!1421782 m!1311859))

(declare-fun m!1311885 () Bool)

(assert (=> b!1421782 m!1311885))

(assert (=> b!1421782 m!1311885))

(assert (=> b!1421782 m!1311859))

(declare-fun m!1311887 () Bool)

(assert (=> b!1421782 m!1311887))

(assert (=> b!1421779 m!1311859))

(assert (=> b!1421779 m!1311859))

(declare-fun m!1311889 () Bool)

(assert (=> b!1421779 m!1311889))

(declare-fun m!1311891 () Bool)

(assert (=> b!1421781 m!1311891))

(assert (=> b!1421781 m!1311891))

(declare-fun m!1311893 () Bool)

(assert (=> b!1421781 m!1311893))

(assert (=> b!1421781 m!1311873))

(declare-fun m!1311895 () Bool)

(assert (=> b!1421781 m!1311895))

(push 1)

(assert (not b!1421779))

(assert (not b!1421777))

(assert (not b!1421782))

(assert (not b!1421773))

(assert (not b!1421784))

(assert (not start!122712))

(assert (not b!1421781))

(assert (not b!1421783))

(assert (not b!1421776))

(assert (not b!1421778))

(assert (not b!1421780))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

