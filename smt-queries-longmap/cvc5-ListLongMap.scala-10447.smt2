; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122844 () Bool)

(assert start!122844)

(declare-fun res!960306 () Bool)

(declare-fun e!805177 () Bool)

(assert (=> start!122844 (=> (not res!960306) (not e!805177))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122844 (= res!960306 (validMask!0 mask!2608))))

(assert (=> start!122844 e!805177))

(assert (=> start!122844 true))

(declare-datatypes ((array!97162 0))(
  ( (array!97163 (arr!46899 (Array (_ BitVec 32) (_ BitVec 64))) (size!47451 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97162)

(declare-fun array_inv!36132 (array!97162) Bool)

(assert (=> start!122844 (array_inv!36132 a!2831)))

(declare-fun b!1424822 () Bool)

(declare-fun res!960310 () Bool)

(assert (=> b!1424822 (=> (not res!960310) (not e!805177))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424822 (= res!960310 (validKeyInArray!0 (select (arr!46899 a!2831) j!81)))))

(declare-fun b!1424823 () Bool)

(declare-fun res!960307 () Bool)

(assert (=> b!1424823 (=> (not res!960307) (not e!805177))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424823 (= res!960307 (validKeyInArray!0 (select (arr!46899 a!2831) i!982)))))

(declare-fun b!1424824 () Bool)

(assert (=> b!1424824 (= e!805177 false)))

(declare-fun lt!627554 () Bool)

(declare-datatypes ((List!33487 0))(
  ( (Nil!33484) (Cons!33483 (h!34785 (_ BitVec 64)) (t!48173 List!33487)) )
))
(declare-fun arrayNoDuplicates!0 (array!97162 (_ BitVec 32) List!33487) Bool)

(assert (=> b!1424824 (= lt!627554 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33484))))

(declare-fun b!1424825 () Bool)

(declare-fun res!960309 () Bool)

(assert (=> b!1424825 (=> (not res!960309) (not e!805177))))

(assert (=> b!1424825 (= res!960309 (and (= (size!47451 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47451 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47451 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424826 () Bool)

(declare-fun res!960308 () Bool)

(assert (=> b!1424826 (=> (not res!960308) (not e!805177))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97162 (_ BitVec 32)) Bool)

(assert (=> b!1424826 (= res!960308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122844 res!960306) b!1424825))

(assert (= (and b!1424825 res!960309) b!1424823))

(assert (= (and b!1424823 res!960307) b!1424822))

(assert (= (and b!1424822 res!960310) b!1424826))

(assert (= (and b!1424826 res!960308) b!1424824))

(declare-fun m!1314923 () Bool)

(assert (=> b!1424824 m!1314923))

(declare-fun m!1314925 () Bool)

(assert (=> b!1424822 m!1314925))

(assert (=> b!1424822 m!1314925))

(declare-fun m!1314927 () Bool)

(assert (=> b!1424822 m!1314927))

(declare-fun m!1314929 () Bool)

(assert (=> b!1424826 m!1314929))

(declare-fun m!1314931 () Bool)

(assert (=> start!122844 m!1314931))

(declare-fun m!1314933 () Bool)

(assert (=> start!122844 m!1314933))

(declare-fun m!1314935 () Bool)

(assert (=> b!1424823 m!1314935))

(assert (=> b!1424823 m!1314935))

(declare-fun m!1314937 () Bool)

(assert (=> b!1424823 m!1314937))

(push 1)

(assert (not b!1424824))

(assert (not b!1424826))

(assert (not b!1424822))

(assert (not b!1424823))

(assert (not start!122844))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

