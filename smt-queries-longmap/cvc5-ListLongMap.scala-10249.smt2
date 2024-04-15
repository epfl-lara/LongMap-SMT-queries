; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120546 () Bool)

(assert start!120546)

(declare-fun b!1403619 () Bool)

(declare-fun res!942181 () Bool)

(declare-fun e!794721 () Bool)

(assert (=> b!1403619 (=> (not res!942181) (not e!794721))))

(declare-datatypes ((array!95908 0))(
  ( (array!95909 (arr!46305 (Array (_ BitVec 32) (_ BitVec 64))) (size!46857 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95908)

(declare-datatypes ((List!32902 0))(
  ( (Nil!32899) (Cons!32898 (h!34146 (_ BitVec 64)) (t!47588 List!32902)) )
))
(declare-fun arrayNoDuplicates!0 (array!95908 (_ BitVec 32) List!32902) Bool)

(assert (=> b!1403619 (= res!942181 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32899))))

(declare-fun b!1403620 () Bool)

(declare-fun res!942187 () Bool)

(assert (=> b!1403620 (=> (not res!942187) (not e!794721))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403620 (= res!942187 (and (= (size!46857 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46857 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46857 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403621 () Bool)

(assert (=> b!1403621 (= e!794721 (not true))))

(declare-fun e!794722 () Bool)

(assert (=> b!1403621 e!794722))

(declare-fun res!942186 () Bool)

(assert (=> b!1403621 (=> (not res!942186) (not e!794722))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95908 (_ BitVec 32)) Bool)

(assert (=> b!1403621 (= res!942186 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47143 0))(
  ( (Unit!47144) )
))
(declare-fun lt!618292 () Unit!47143)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95908 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47143)

(assert (=> b!1403621 (= lt!618292 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10648 0))(
  ( (MissingZero!10648 (index!44969 (_ BitVec 32))) (Found!10648 (index!44970 (_ BitVec 32))) (Intermediate!10648 (undefined!11460 Bool) (index!44971 (_ BitVec 32)) (x!126568 (_ BitVec 32))) (Undefined!10648) (MissingVacant!10648 (index!44972 (_ BitVec 32))) )
))
(declare-fun lt!618293 () SeekEntryResult!10648)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95908 (_ BitVec 32)) SeekEntryResult!10648)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403621 (= lt!618293 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46305 a!2901) j!112) mask!2840) (select (arr!46305 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403622 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95908 (_ BitVec 32)) SeekEntryResult!10648)

(assert (=> b!1403622 (= e!794722 (= (seekEntryOrOpen!0 (select (arr!46305 a!2901) j!112) a!2901 mask!2840) (Found!10648 j!112)))))

(declare-fun b!1403623 () Bool)

(declare-fun res!942183 () Bool)

(assert (=> b!1403623 (=> (not res!942183) (not e!794721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403623 (= res!942183 (validKeyInArray!0 (select (arr!46305 a!2901) j!112)))))

(declare-fun res!942184 () Bool)

(assert (=> start!120546 (=> (not res!942184) (not e!794721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120546 (= res!942184 (validMask!0 mask!2840))))

(assert (=> start!120546 e!794721))

(assert (=> start!120546 true))

(declare-fun array_inv!35538 (array!95908) Bool)

(assert (=> start!120546 (array_inv!35538 a!2901)))

(declare-fun b!1403624 () Bool)

(declare-fun res!942185 () Bool)

(assert (=> b!1403624 (=> (not res!942185) (not e!794721))))

(assert (=> b!1403624 (= res!942185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403625 () Bool)

(declare-fun res!942182 () Bool)

(assert (=> b!1403625 (=> (not res!942182) (not e!794721))))

(assert (=> b!1403625 (= res!942182 (validKeyInArray!0 (select (arr!46305 a!2901) i!1037)))))

(assert (= (and start!120546 res!942184) b!1403620))

(assert (= (and b!1403620 res!942187) b!1403625))

(assert (= (and b!1403625 res!942182) b!1403623))

(assert (= (and b!1403623 res!942183) b!1403624))

(assert (= (and b!1403624 res!942185) b!1403619))

(assert (= (and b!1403619 res!942181) b!1403621))

(assert (= (and b!1403621 res!942186) b!1403622))

(declare-fun m!1291883 () Bool)

(assert (=> b!1403623 m!1291883))

(assert (=> b!1403623 m!1291883))

(declare-fun m!1291885 () Bool)

(assert (=> b!1403623 m!1291885))

(declare-fun m!1291887 () Bool)

(assert (=> b!1403619 m!1291887))

(declare-fun m!1291889 () Bool)

(assert (=> start!120546 m!1291889))

(declare-fun m!1291891 () Bool)

(assert (=> start!120546 m!1291891))

(declare-fun m!1291893 () Bool)

(assert (=> b!1403624 m!1291893))

(declare-fun m!1291895 () Bool)

(assert (=> b!1403625 m!1291895))

(assert (=> b!1403625 m!1291895))

(declare-fun m!1291897 () Bool)

(assert (=> b!1403625 m!1291897))

(assert (=> b!1403621 m!1291883))

(declare-fun m!1291899 () Bool)

(assert (=> b!1403621 m!1291899))

(assert (=> b!1403621 m!1291883))

(declare-fun m!1291901 () Bool)

(assert (=> b!1403621 m!1291901))

(assert (=> b!1403621 m!1291899))

(assert (=> b!1403621 m!1291883))

(declare-fun m!1291903 () Bool)

(assert (=> b!1403621 m!1291903))

(declare-fun m!1291905 () Bool)

(assert (=> b!1403621 m!1291905))

(assert (=> b!1403622 m!1291883))

(assert (=> b!1403622 m!1291883))

(declare-fun m!1291907 () Bool)

(assert (=> b!1403622 m!1291907))

(push 1)

(assert (not b!1403623))

(assert (not start!120546))

(assert (not b!1403621))

(assert (not b!1403625))

(assert (not b!1403619))

(assert (not b!1403622))

(assert (not b!1403624))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

