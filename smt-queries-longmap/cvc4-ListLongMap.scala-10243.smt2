; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120514 () Bool)

(assert start!120514)

(declare-fun b!1403294 () Bool)

(declare-fun res!941812 () Bool)

(declare-fun e!794573 () Bool)

(assert (=> b!1403294 (=> (not res!941812) (not e!794573))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95923 0))(
  ( (array!95924 (arr!46312 (Array (_ BitVec 32) (_ BitVec 64))) (size!46862 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95923)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403294 (= res!941812 (and (= (size!46862 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46862 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46862 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!941807 () Bool)

(assert (=> start!120514 (=> (not res!941807) (not e!794573))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120514 (= res!941807 (validMask!0 mask!2840))))

(assert (=> start!120514 e!794573))

(assert (=> start!120514 true))

(declare-fun array_inv!35340 (array!95923) Bool)

(assert (=> start!120514 (array_inv!35340 a!2901)))

(declare-fun b!1403295 () Bool)

(declare-fun e!794571 () Bool)

(assert (=> b!1403295 (= e!794571 true)))

(declare-datatypes ((SeekEntryResult!10629 0))(
  ( (MissingZero!10629 (index!44893 (_ BitVec 32))) (Found!10629 (index!44894 (_ BitVec 32))) (Intermediate!10629 (undefined!11441 Bool) (index!44895 (_ BitVec 32)) (x!126504 (_ BitVec 32))) (Undefined!10629) (MissingVacant!10629 (index!44896 (_ BitVec 32))) )
))
(declare-fun lt!618347 () SeekEntryResult!10629)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95923 (_ BitVec 32)) SeekEntryResult!10629)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403295 (= lt!618347 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46312 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46312 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95924 (store (arr!46312 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46862 a!2901)) mask!2840))))

(declare-fun b!1403296 () Bool)

(declare-fun res!941809 () Bool)

(assert (=> b!1403296 (=> (not res!941809) (not e!794573))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95923 (_ BitVec 32)) Bool)

(assert (=> b!1403296 (= res!941809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403297 () Bool)

(assert (=> b!1403297 (= e!794573 (not e!794571))))

(declare-fun res!941811 () Bool)

(assert (=> b!1403297 (=> res!941811 e!794571)))

(declare-fun lt!618348 () SeekEntryResult!10629)

(assert (=> b!1403297 (= res!941811 (or (not (is-Intermediate!10629 lt!618348)) (undefined!11441 lt!618348)))))

(declare-fun e!794572 () Bool)

(assert (=> b!1403297 e!794572))

(declare-fun res!941808 () Bool)

(assert (=> b!1403297 (=> (not res!941808) (not e!794572))))

(assert (=> b!1403297 (= res!941808 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47262 0))(
  ( (Unit!47263) )
))
(declare-fun lt!618346 () Unit!47262)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95923 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47262)

(assert (=> b!1403297 (= lt!618346 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1403297 (= lt!618348 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46312 a!2901) j!112) mask!2840) (select (arr!46312 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403298 () Bool)

(declare-fun res!941806 () Bool)

(assert (=> b!1403298 (=> (not res!941806) (not e!794573))))

(declare-datatypes ((List!32831 0))(
  ( (Nil!32828) (Cons!32827 (h!34075 (_ BitVec 64)) (t!47525 List!32831)) )
))
(declare-fun arrayNoDuplicates!0 (array!95923 (_ BitVec 32) List!32831) Bool)

(assert (=> b!1403298 (= res!941806 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32828))))

(declare-fun b!1403299 () Bool)

(declare-fun res!941810 () Bool)

(assert (=> b!1403299 (=> (not res!941810) (not e!794573))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403299 (= res!941810 (validKeyInArray!0 (select (arr!46312 a!2901) j!112)))))

(declare-fun b!1403300 () Bool)

(declare-fun res!941805 () Bool)

(assert (=> b!1403300 (=> (not res!941805) (not e!794573))))

(assert (=> b!1403300 (= res!941805 (validKeyInArray!0 (select (arr!46312 a!2901) i!1037)))))

(declare-fun b!1403301 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95923 (_ BitVec 32)) SeekEntryResult!10629)

(assert (=> b!1403301 (= e!794572 (= (seekEntryOrOpen!0 (select (arr!46312 a!2901) j!112) a!2901 mask!2840) (Found!10629 j!112)))))

(assert (= (and start!120514 res!941807) b!1403294))

(assert (= (and b!1403294 res!941812) b!1403300))

(assert (= (and b!1403300 res!941805) b!1403299))

(assert (= (and b!1403299 res!941810) b!1403296))

(assert (= (and b!1403296 res!941809) b!1403298))

(assert (= (and b!1403298 res!941806) b!1403297))

(assert (= (and b!1403297 res!941808) b!1403301))

(assert (= (and b!1403297 (not res!941811)) b!1403295))

(declare-fun m!1291871 () Bool)

(assert (=> b!1403300 m!1291871))

(assert (=> b!1403300 m!1291871))

(declare-fun m!1291873 () Bool)

(assert (=> b!1403300 m!1291873))

(declare-fun m!1291875 () Bool)

(assert (=> b!1403296 m!1291875))

(declare-fun m!1291877 () Bool)

(assert (=> b!1403297 m!1291877))

(declare-fun m!1291879 () Bool)

(assert (=> b!1403297 m!1291879))

(assert (=> b!1403297 m!1291877))

(declare-fun m!1291881 () Bool)

(assert (=> b!1403297 m!1291881))

(assert (=> b!1403297 m!1291879))

(assert (=> b!1403297 m!1291877))

(declare-fun m!1291883 () Bool)

(assert (=> b!1403297 m!1291883))

(declare-fun m!1291885 () Bool)

(assert (=> b!1403297 m!1291885))

(declare-fun m!1291887 () Bool)

(assert (=> start!120514 m!1291887))

(declare-fun m!1291889 () Bool)

(assert (=> start!120514 m!1291889))

(assert (=> b!1403301 m!1291877))

(assert (=> b!1403301 m!1291877))

(declare-fun m!1291891 () Bool)

(assert (=> b!1403301 m!1291891))

(declare-fun m!1291893 () Bool)

(assert (=> b!1403298 m!1291893))

(declare-fun m!1291895 () Bool)

(assert (=> b!1403295 m!1291895))

(declare-fun m!1291897 () Bool)

(assert (=> b!1403295 m!1291897))

(assert (=> b!1403295 m!1291897))

(declare-fun m!1291899 () Bool)

(assert (=> b!1403295 m!1291899))

(assert (=> b!1403295 m!1291899))

(assert (=> b!1403295 m!1291897))

(declare-fun m!1291901 () Bool)

(assert (=> b!1403295 m!1291901))

(assert (=> b!1403299 m!1291877))

(assert (=> b!1403299 m!1291877))

(declare-fun m!1291903 () Bool)

(assert (=> b!1403299 m!1291903))

(push 1)

(assert (not b!1403296))

(assert (not b!1403300))

(assert (not b!1403295))

(assert (not b!1403298))

(assert (not b!1403299))

(assert (not b!1403301))

(assert (not b!1403297))

(assert (not start!120514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

