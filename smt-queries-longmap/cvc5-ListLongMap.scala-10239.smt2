; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120678 () Bool)

(assert start!120678)

(declare-fun res!941973 () Bool)

(declare-fun e!795167 () Bool)

(assert (=> start!120678 (=> (not res!941973) (not e!795167))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120678 (= res!941973 (validMask!0 mask!2840))))

(assert (=> start!120678 e!795167))

(assert (=> start!120678 true))

(declare-datatypes ((array!96009 0))(
  ( (array!96010 (arr!46353 (Array (_ BitVec 32) (_ BitVec 64))) (size!46904 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96009)

(declare-fun array_inv!35634 (array!96009) Bool)

(assert (=> start!120678 (array_inv!35634 a!2901)))

(declare-fun b!1404146 () Bool)

(declare-fun res!941974 () Bool)

(assert (=> b!1404146 (=> (not res!941974) (not e!795167))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404146 (= res!941974 (validKeyInArray!0 (select (arr!46353 a!2901) i!1037)))))

(declare-fun b!1404147 () Bool)

(declare-fun e!795166 () Bool)

(assert (=> b!1404147 (= e!795166 true)))

(declare-datatypes ((SeekEntryResult!10573 0))(
  ( (MissingZero!10573 (index!44669 (_ BitVec 32))) (Found!10573 (index!44670 (_ BitVec 32))) (Intermediate!10573 (undefined!11385 Bool) (index!44671 (_ BitVec 32)) (x!126435 (_ BitVec 32))) (Undefined!10573) (MissingVacant!10573 (index!44672 (_ BitVec 32))) )
))
(declare-fun lt!618636 () SeekEntryResult!10573)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96009 (_ BitVec 32)) SeekEntryResult!10573)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404147 (= lt!618636 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46353 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46353 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96010 (store (arr!46353 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46904 a!2901)) mask!2840))))

(declare-fun b!1404148 () Bool)

(declare-fun res!941979 () Bool)

(assert (=> b!1404148 (=> (not res!941979) (not e!795167))))

(assert (=> b!1404148 (= res!941979 (and (= (size!46904 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46904 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46904 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404149 () Bool)

(declare-fun res!941975 () Bool)

(assert (=> b!1404149 (=> (not res!941975) (not e!795167))))

(assert (=> b!1404149 (= res!941975 (validKeyInArray!0 (select (arr!46353 a!2901) j!112)))))

(declare-fun b!1404150 () Bool)

(declare-fun res!941977 () Bool)

(assert (=> b!1404150 (=> (not res!941977) (not e!795167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96009 (_ BitVec 32)) Bool)

(assert (=> b!1404150 (= res!941977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!795165 () Bool)

(declare-fun b!1404151 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96009 (_ BitVec 32)) SeekEntryResult!10573)

(assert (=> b!1404151 (= e!795165 (= (seekEntryOrOpen!0 (select (arr!46353 a!2901) j!112) a!2901 mask!2840) (Found!10573 j!112)))))

(declare-fun b!1404152 () Bool)

(declare-fun res!941978 () Bool)

(assert (=> b!1404152 (=> (not res!941978) (not e!795167))))

(declare-datatypes ((List!32859 0))(
  ( (Nil!32856) (Cons!32855 (h!34111 (_ BitVec 64)) (t!47545 List!32859)) )
))
(declare-fun arrayNoDuplicates!0 (array!96009 (_ BitVec 32) List!32859) Bool)

(assert (=> b!1404152 (= res!941978 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32856))))

(declare-fun b!1404153 () Bool)

(assert (=> b!1404153 (= e!795167 (not e!795166))))

(declare-fun res!941980 () Bool)

(assert (=> b!1404153 (=> res!941980 e!795166)))

(declare-fun lt!618637 () SeekEntryResult!10573)

(assert (=> b!1404153 (= res!941980 (or (not (is-Intermediate!10573 lt!618637)) (undefined!11385 lt!618637)))))

(assert (=> b!1404153 e!795165))

(declare-fun res!941976 () Bool)

(assert (=> b!1404153 (=> (not res!941976) (not e!795165))))

(assert (=> b!1404153 (= res!941976 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47177 0))(
  ( (Unit!47178) )
))
(declare-fun lt!618638 () Unit!47177)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96009 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47177)

(assert (=> b!1404153 (= lt!618638 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1404153 (= lt!618637 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46353 a!2901) j!112) mask!2840) (select (arr!46353 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120678 res!941973) b!1404148))

(assert (= (and b!1404148 res!941979) b!1404146))

(assert (= (and b!1404146 res!941974) b!1404149))

(assert (= (and b!1404149 res!941975) b!1404150))

(assert (= (and b!1404150 res!941977) b!1404152))

(assert (= (and b!1404152 res!941978) b!1404153))

(assert (= (and b!1404153 res!941976) b!1404151))

(assert (= (and b!1404153 (not res!941980)) b!1404147))

(declare-fun m!1292835 () Bool)

(assert (=> b!1404150 m!1292835))

(declare-fun m!1292837 () Bool)

(assert (=> b!1404146 m!1292837))

(assert (=> b!1404146 m!1292837))

(declare-fun m!1292839 () Bool)

(assert (=> b!1404146 m!1292839))

(declare-fun m!1292841 () Bool)

(assert (=> b!1404153 m!1292841))

(declare-fun m!1292843 () Bool)

(assert (=> b!1404153 m!1292843))

(assert (=> b!1404153 m!1292841))

(declare-fun m!1292845 () Bool)

(assert (=> b!1404153 m!1292845))

(assert (=> b!1404153 m!1292843))

(assert (=> b!1404153 m!1292841))

(declare-fun m!1292847 () Bool)

(assert (=> b!1404153 m!1292847))

(declare-fun m!1292849 () Bool)

(assert (=> b!1404153 m!1292849))

(declare-fun m!1292851 () Bool)

(assert (=> b!1404147 m!1292851))

(declare-fun m!1292853 () Bool)

(assert (=> b!1404147 m!1292853))

(assert (=> b!1404147 m!1292853))

(declare-fun m!1292855 () Bool)

(assert (=> b!1404147 m!1292855))

(assert (=> b!1404147 m!1292855))

(assert (=> b!1404147 m!1292853))

(declare-fun m!1292857 () Bool)

(assert (=> b!1404147 m!1292857))

(declare-fun m!1292859 () Bool)

(assert (=> start!120678 m!1292859))

(declare-fun m!1292861 () Bool)

(assert (=> start!120678 m!1292861))

(declare-fun m!1292863 () Bool)

(assert (=> b!1404152 m!1292863))

(assert (=> b!1404151 m!1292841))

(assert (=> b!1404151 m!1292841))

(declare-fun m!1292865 () Bool)

(assert (=> b!1404151 m!1292865))

(assert (=> b!1404149 m!1292841))

(assert (=> b!1404149 m!1292841))

(declare-fun m!1292867 () Bool)

(assert (=> b!1404149 m!1292867))

(push 1)

(assert (not b!1404146))

(assert (not b!1404149))

(assert (not b!1404147))

(assert (not start!120678))

(assert (not b!1404151))

(assert (not b!1404153))

(assert (not b!1404152))

(assert (not b!1404150))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

