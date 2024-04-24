; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119862 () Bool)

(assert start!119862)

(declare-fun b!1395167 () Bool)

(declare-fun res!933898 () Bool)

(declare-fun e!790052 () Bool)

(assert (=> b!1395167 (=> (not res!933898) (not e!790052))))

(declare-datatypes ((array!95466 0))(
  ( (array!95467 (arr!46089 (Array (_ BitVec 32) (_ BitVec 64))) (size!46640 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95466)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1395167 (= res!933898 (validKeyInArray!0 (select (arr!46089 a!2901) i!1037)))))

(declare-fun b!1395168 () Bool)

(declare-fun res!933892 () Bool)

(assert (=> b!1395168 (=> (not res!933892) (not e!790052))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1395168 (= res!933892 (validKeyInArray!0 (select (arr!46089 a!2901) j!112)))))

(declare-fun b!1395169 () Bool)

(declare-fun res!933894 () Bool)

(assert (=> b!1395169 (=> (not res!933894) (not e!790052))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95466 (_ BitVec 32)) Bool)

(assert (=> b!1395169 (= res!933894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1395170 () Bool)

(declare-fun e!790051 () Bool)

(assert (=> b!1395170 (= e!790052 (not e!790051))))

(declare-fun res!933896 () Bool)

(assert (=> b!1395170 (=> res!933896 e!790051)))

(declare-datatypes ((SeekEntryResult!10309 0))(
  ( (MissingZero!10309 (index!43607 (_ BitVec 32))) (Found!10309 (index!43608 (_ BitVec 32))) (Intermediate!10309 (undefined!11121 Bool) (index!43609 (_ BitVec 32)) (x!125428 (_ BitVec 32))) (Undefined!10309) (MissingVacant!10309 (index!43610 (_ BitVec 32))) )
))
(declare-fun lt!612609 () SeekEntryResult!10309)

(assert (=> b!1395170 (= res!933896 (or (not (is-Intermediate!10309 lt!612609)) (undefined!11121 lt!612609)))))

(declare-fun e!790049 () Bool)

(assert (=> b!1395170 e!790049))

(declare-fun res!933897 () Bool)

(assert (=> b!1395170 (=> (not res!933897) (not e!790049))))

(assert (=> b!1395170 (= res!933897 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46649 0))(
  ( (Unit!46650) )
))
(declare-fun lt!612611 () Unit!46649)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95466 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46649)

(assert (=> b!1395170 (= lt!612611 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95466 (_ BitVec 32)) SeekEntryResult!10309)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1395170 (= lt!612609 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46089 a!2901) j!112) mask!2840) (select (arr!46089 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1395171 () Bool)

(assert (=> b!1395171 (= e!790051 true)))

(declare-fun lt!612610 () SeekEntryResult!10309)

(assert (=> b!1395171 (= lt!612610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46089 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46089 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95467 (store (arr!46089 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46640 a!2901)) mask!2840))))

(declare-fun b!1395172 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95466 (_ BitVec 32)) SeekEntryResult!10309)

(assert (=> b!1395172 (= e!790049 (= (seekEntryOrOpen!0 (select (arr!46089 a!2901) j!112) a!2901 mask!2840) (Found!10309 j!112)))))

(declare-fun b!1395173 () Bool)

(declare-fun res!933891 () Bool)

(assert (=> b!1395173 (=> (not res!933891) (not e!790052))))

(assert (=> b!1395173 (= res!933891 (and (= (size!46640 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46640 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46640 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!933893 () Bool)

(assert (=> start!119862 (=> (not res!933893) (not e!790052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119862 (= res!933893 (validMask!0 mask!2840))))

(assert (=> start!119862 e!790052))

(assert (=> start!119862 true))

(declare-fun array_inv!35370 (array!95466) Bool)

(assert (=> start!119862 (array_inv!35370 a!2901)))

(declare-fun b!1395174 () Bool)

(declare-fun res!933895 () Bool)

(assert (=> b!1395174 (=> (not res!933895) (not e!790052))))

(declare-datatypes ((List!32595 0))(
  ( (Nil!32592) (Cons!32591 (h!33832 (_ BitVec 64)) (t!47281 List!32595)) )
))
(declare-fun arrayNoDuplicates!0 (array!95466 (_ BitVec 32) List!32595) Bool)

(assert (=> b!1395174 (= res!933895 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32592))))

(assert (= (and start!119862 res!933893) b!1395173))

(assert (= (and b!1395173 res!933891) b!1395167))

(assert (= (and b!1395167 res!933898) b!1395168))

(assert (= (and b!1395168 res!933892) b!1395169))

(assert (= (and b!1395169 res!933894) b!1395174))

(assert (= (and b!1395174 res!933895) b!1395170))

(assert (= (and b!1395170 res!933897) b!1395172))

(assert (= (and b!1395170 (not res!933896)) b!1395171))

(declare-fun m!1281555 () Bool)

(assert (=> start!119862 m!1281555))

(declare-fun m!1281557 () Bool)

(assert (=> start!119862 m!1281557))

(declare-fun m!1281559 () Bool)

(assert (=> b!1395170 m!1281559))

(declare-fun m!1281561 () Bool)

(assert (=> b!1395170 m!1281561))

(assert (=> b!1395170 m!1281559))

(declare-fun m!1281563 () Bool)

(assert (=> b!1395170 m!1281563))

(assert (=> b!1395170 m!1281561))

(assert (=> b!1395170 m!1281559))

(declare-fun m!1281565 () Bool)

(assert (=> b!1395170 m!1281565))

(declare-fun m!1281567 () Bool)

(assert (=> b!1395170 m!1281567))

(declare-fun m!1281569 () Bool)

(assert (=> b!1395171 m!1281569))

(declare-fun m!1281571 () Bool)

(assert (=> b!1395171 m!1281571))

(assert (=> b!1395171 m!1281571))

(declare-fun m!1281573 () Bool)

(assert (=> b!1395171 m!1281573))

(assert (=> b!1395171 m!1281573))

(assert (=> b!1395171 m!1281571))

(declare-fun m!1281575 () Bool)

(assert (=> b!1395171 m!1281575))

(declare-fun m!1281577 () Bool)

(assert (=> b!1395169 m!1281577))

(assert (=> b!1395168 m!1281559))

(assert (=> b!1395168 m!1281559))

(declare-fun m!1281579 () Bool)

(assert (=> b!1395168 m!1281579))

(assert (=> b!1395172 m!1281559))

(assert (=> b!1395172 m!1281559))

(declare-fun m!1281581 () Bool)

(assert (=> b!1395172 m!1281581))

(declare-fun m!1281583 () Bool)

(assert (=> b!1395167 m!1281583))

(assert (=> b!1395167 m!1281583))

(declare-fun m!1281585 () Bool)

(assert (=> b!1395167 m!1281585))

(declare-fun m!1281587 () Bool)

(assert (=> b!1395174 m!1281587))

(push 1)

(assert (not b!1395167))

(assert (not b!1395171))

(assert (not b!1395169))

(assert (not b!1395174))

(assert (not b!1395172))

(assert (not b!1395168))

(assert (not b!1395170))

(assert (not start!119862))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

