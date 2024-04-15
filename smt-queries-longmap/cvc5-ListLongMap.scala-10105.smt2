; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119124 () Bool)

(assert start!119124)

(declare-fun res!929890 () Bool)

(declare-fun e!787108 () Bool)

(assert (=> start!119124 (=> (not res!929890) (not e!787108))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119124 (= res!929890 (validMask!0 mask!2840))))

(assert (=> start!119124 e!787108))

(assert (=> start!119124 true))

(declare-datatypes ((array!95014 0))(
  ( (array!95015 (arr!45873 (Array (_ BitVec 32) (_ BitVec 64))) (size!46425 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95014)

(declare-fun array_inv!35106 (array!95014) Bool)

(assert (=> start!119124 (array_inv!35106 a!2901)))

(declare-fun b!1389676 () Bool)

(declare-fun res!929888 () Bool)

(assert (=> b!1389676 (=> (not res!929888) (not e!787108))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389676 (= res!929888 (validKeyInArray!0 (select (arr!45873 a!2901) i!1037)))))

(declare-fun b!1389677 () Bool)

(declare-fun res!929892 () Bool)

(assert (=> b!1389677 (=> (not res!929892) (not e!787108))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95014 (_ BitVec 32)) Bool)

(assert (=> b!1389677 (= res!929892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389678 () Bool)

(declare-fun res!929891 () Bool)

(assert (=> b!1389678 (=> (not res!929891) (not e!787108))))

(declare-datatypes ((List!32470 0))(
  ( (Nil!32467) (Cons!32466 (h!33684 (_ BitVec 64)) (t!47156 List!32470)) )
))
(declare-fun arrayNoDuplicates!0 (array!95014 (_ BitVec 32) List!32470) Bool)

(assert (=> b!1389678 (= res!929891 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32467))))

(declare-fun b!1389679 () Bool)

(assert (=> b!1389679 (= e!787108 false)))

(declare-datatypes ((SeekEntryResult!10216 0))(
  ( (MissingZero!10216 (index!43235 (_ BitVec 32))) (Found!10216 (index!43236 (_ BitVec 32))) (Intermediate!10216 (undefined!11028 Bool) (index!43237 (_ BitVec 32)) (x!124915 (_ BitVec 32))) (Undefined!10216) (MissingVacant!10216 (index!43238 (_ BitVec 32))) )
))
(declare-fun lt!610430 () SeekEntryResult!10216)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95014 (_ BitVec 32)) SeekEntryResult!10216)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389679 (= lt!610430 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45873 a!2901) j!112) mask!2840) (select (arr!45873 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389680 () Bool)

(declare-fun res!929889 () Bool)

(assert (=> b!1389680 (=> (not res!929889) (not e!787108))))

(assert (=> b!1389680 (= res!929889 (validKeyInArray!0 (select (arr!45873 a!2901) j!112)))))

(declare-fun b!1389681 () Bool)

(declare-fun res!929893 () Bool)

(assert (=> b!1389681 (=> (not res!929893) (not e!787108))))

(assert (=> b!1389681 (= res!929893 (and (= (size!46425 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46425 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46425 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119124 res!929890) b!1389681))

(assert (= (and b!1389681 res!929893) b!1389676))

(assert (= (and b!1389676 res!929888) b!1389680))

(assert (= (and b!1389680 res!929889) b!1389677))

(assert (= (and b!1389677 res!929892) b!1389678))

(assert (= (and b!1389678 res!929891) b!1389679))

(declare-fun m!1274891 () Bool)

(assert (=> b!1389677 m!1274891))

(declare-fun m!1274893 () Bool)

(assert (=> b!1389680 m!1274893))

(assert (=> b!1389680 m!1274893))

(declare-fun m!1274895 () Bool)

(assert (=> b!1389680 m!1274895))

(declare-fun m!1274897 () Bool)

(assert (=> b!1389678 m!1274897))

(declare-fun m!1274899 () Bool)

(assert (=> start!119124 m!1274899))

(declare-fun m!1274901 () Bool)

(assert (=> start!119124 m!1274901))

(assert (=> b!1389679 m!1274893))

(assert (=> b!1389679 m!1274893))

(declare-fun m!1274903 () Bool)

(assert (=> b!1389679 m!1274903))

(assert (=> b!1389679 m!1274903))

(assert (=> b!1389679 m!1274893))

(declare-fun m!1274905 () Bool)

(assert (=> b!1389679 m!1274905))

(declare-fun m!1274907 () Bool)

(assert (=> b!1389676 m!1274907))

(assert (=> b!1389676 m!1274907))

(declare-fun m!1274909 () Bool)

(assert (=> b!1389676 m!1274909))

(push 1)

(assert (not b!1389679))

(assert (not b!1389676))

(assert (not b!1389677))

(assert (not b!1389680))

(assert (not b!1389678))

(assert (not start!119124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

