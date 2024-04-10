; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119350 () Bool)

(assert start!119350)

(declare-fun b!1391373 () Bool)

(declare-fun res!931240 () Bool)

(declare-fun e!787912 () Bool)

(assert (=> b!1391373 (=> (not res!931240) (not e!787912))))

(declare-datatypes ((array!95185 0))(
  ( (array!95186 (arr!45955 (Array (_ BitVec 32) (_ BitVec 64))) (size!46505 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95185)

(declare-datatypes ((List!32474 0))(
  ( (Nil!32471) (Cons!32470 (h!33694 (_ BitVec 64)) (t!47168 List!32474)) )
))
(declare-fun arrayNoDuplicates!0 (array!95185 (_ BitVec 32) List!32474) Bool)

(assert (=> b!1391373 (= res!931240 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32471))))

(declare-fun b!1391375 () Bool)

(declare-fun res!931242 () Bool)

(assert (=> b!1391375 (=> (not res!931242) (not e!787912))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1391375 (= res!931242 (validKeyInArray!0 (select (arr!45955 a!2901) i!1037)))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun b!1391376 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun e!787911 () Bool)

(declare-datatypes ((SeekEntryResult!10272 0))(
  ( (MissingZero!10272 (index!43459 (_ BitVec 32))) (Found!10272 (index!43460 (_ BitVec 32))) (Intermediate!10272 (undefined!11084 Bool) (index!43461 (_ BitVec 32)) (x!125138 (_ BitVec 32))) (Undefined!10272) (MissingVacant!10272 (index!43462 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95185 (_ BitVec 32)) SeekEntryResult!10272)

(assert (=> b!1391376 (= e!787911 (= (seekEntryOrOpen!0 (select (arr!45955 a!2901) j!112) a!2901 mask!2840) (Found!10272 j!112)))))

(declare-fun b!1391377 () Bool)

(declare-fun res!931245 () Bool)

(assert (=> b!1391377 (=> (not res!931245) (not e!787912))))

(assert (=> b!1391377 (= res!931245 (and (= (size!46505 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46505 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46505 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!931246 () Bool)

(assert (=> start!119350 (=> (not res!931246) (not e!787912))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119350 (= res!931246 (validMask!0 mask!2840))))

(assert (=> start!119350 e!787912))

(assert (=> start!119350 true))

(declare-fun array_inv!34983 (array!95185) Bool)

(assert (=> start!119350 (array_inv!34983 a!2901)))

(declare-fun b!1391374 () Bool)

(assert (=> b!1391374 (= e!787912 (not true))))

(assert (=> b!1391374 e!787911))

(declare-fun res!931244 () Bool)

(assert (=> b!1391374 (=> (not res!931244) (not e!787911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95185 (_ BitVec 32)) Bool)

(assert (=> b!1391374 (= res!931244 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46548 0))(
  ( (Unit!46549) )
))
(declare-fun lt!611186 () Unit!46548)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46548)

(assert (=> b!1391374 (= lt!611186 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!611187 () SeekEntryResult!10272)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95185 (_ BitVec 32)) SeekEntryResult!10272)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1391374 (= lt!611187 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45955 a!2901) j!112) mask!2840) (select (arr!45955 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1391378 () Bool)

(declare-fun res!931241 () Bool)

(assert (=> b!1391378 (=> (not res!931241) (not e!787912))))

(assert (=> b!1391378 (= res!931241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1391379 () Bool)

(declare-fun res!931243 () Bool)

(assert (=> b!1391379 (=> (not res!931243) (not e!787912))))

(assert (=> b!1391379 (= res!931243 (validKeyInArray!0 (select (arr!45955 a!2901) j!112)))))

(assert (= (and start!119350 res!931246) b!1391377))

(assert (= (and b!1391377 res!931245) b!1391375))

(assert (= (and b!1391375 res!931242) b!1391379))

(assert (= (and b!1391379 res!931243) b!1391378))

(assert (= (and b!1391378 res!931241) b!1391373))

(assert (= (and b!1391373 res!931240) b!1391374))

(assert (= (and b!1391374 res!931244) b!1391376))

(declare-fun m!1277137 () Bool)

(assert (=> b!1391373 m!1277137))

(declare-fun m!1277139 () Bool)

(assert (=> b!1391378 m!1277139))

(declare-fun m!1277141 () Bool)

(assert (=> b!1391374 m!1277141))

(declare-fun m!1277143 () Bool)

(assert (=> b!1391374 m!1277143))

(assert (=> b!1391374 m!1277141))

(declare-fun m!1277145 () Bool)

(assert (=> b!1391374 m!1277145))

(assert (=> b!1391374 m!1277143))

(assert (=> b!1391374 m!1277141))

(declare-fun m!1277147 () Bool)

(assert (=> b!1391374 m!1277147))

(declare-fun m!1277149 () Bool)

(assert (=> b!1391374 m!1277149))

(assert (=> b!1391379 m!1277141))

(assert (=> b!1391379 m!1277141))

(declare-fun m!1277151 () Bool)

(assert (=> b!1391379 m!1277151))

(assert (=> b!1391376 m!1277141))

(assert (=> b!1391376 m!1277141))

(declare-fun m!1277153 () Bool)

(assert (=> b!1391376 m!1277153))

(declare-fun m!1277155 () Bool)

(assert (=> start!119350 m!1277155))

(declare-fun m!1277157 () Bool)

(assert (=> start!119350 m!1277157))

(declare-fun m!1277159 () Bool)

(assert (=> b!1391375 m!1277159))

(assert (=> b!1391375 m!1277159))

(declare-fun m!1277161 () Bool)

(assert (=> b!1391375 m!1277161))

(push 1)

(assert (not start!119350))

(assert (not b!1391378))

(assert (not b!1391373))

(assert (not b!1391376))

(assert (not b!1391374))

(assert (not b!1391379))

(assert (not b!1391375))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

