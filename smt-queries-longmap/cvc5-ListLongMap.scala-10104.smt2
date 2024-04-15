; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119118 () Bool)

(assert start!119118)

(declare-fun res!929835 () Bool)

(declare-fun e!787090 () Bool)

(assert (=> start!119118 (=> (not res!929835) (not e!787090))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119118 (= res!929835 (validMask!0 mask!2840))))

(assert (=> start!119118 e!787090))

(assert (=> start!119118 true))

(declare-datatypes ((array!95008 0))(
  ( (array!95009 (arr!45870 (Array (_ BitVec 32) (_ BitVec 64))) (size!46422 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95008)

(declare-fun array_inv!35103 (array!95008) Bool)

(assert (=> start!119118 (array_inv!35103 a!2901)))

(declare-fun b!1389622 () Bool)

(declare-fun res!929837 () Bool)

(assert (=> b!1389622 (=> (not res!929837) (not e!787090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95008 (_ BitVec 32)) Bool)

(assert (=> b!1389622 (= res!929837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389623 () Bool)

(declare-fun res!929838 () Bool)

(assert (=> b!1389623 (=> (not res!929838) (not e!787090))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389623 (= res!929838 (and (= (size!46422 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46422 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46422 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389624 () Bool)

(declare-fun res!929839 () Bool)

(assert (=> b!1389624 (=> (not res!929839) (not e!787090))))

(declare-datatypes ((List!32467 0))(
  ( (Nil!32464) (Cons!32463 (h!33681 (_ BitVec 64)) (t!47153 List!32467)) )
))
(declare-fun arrayNoDuplicates!0 (array!95008 (_ BitVec 32) List!32467) Bool)

(assert (=> b!1389624 (= res!929839 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32464))))

(declare-fun b!1389625 () Bool)

(declare-fun res!929834 () Bool)

(assert (=> b!1389625 (=> (not res!929834) (not e!787090))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389625 (= res!929834 (validKeyInArray!0 (select (arr!45870 a!2901) i!1037)))))

(declare-fun b!1389626 () Bool)

(declare-fun res!929836 () Bool)

(assert (=> b!1389626 (=> (not res!929836) (not e!787090))))

(assert (=> b!1389626 (= res!929836 (validKeyInArray!0 (select (arr!45870 a!2901) j!112)))))

(declare-fun b!1389627 () Bool)

(assert (=> b!1389627 (= e!787090 false)))

(declare-datatypes ((SeekEntryResult!10213 0))(
  ( (MissingZero!10213 (index!43223 (_ BitVec 32))) (Found!10213 (index!43224 (_ BitVec 32))) (Intermediate!10213 (undefined!11025 Bool) (index!43225 (_ BitVec 32)) (x!124904 (_ BitVec 32))) (Undefined!10213) (MissingVacant!10213 (index!43226 (_ BitVec 32))) )
))
(declare-fun lt!610421 () SeekEntryResult!10213)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95008 (_ BitVec 32)) SeekEntryResult!10213)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389627 (= lt!610421 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45870 a!2901) j!112) mask!2840) (select (arr!45870 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119118 res!929835) b!1389623))

(assert (= (and b!1389623 res!929838) b!1389625))

(assert (= (and b!1389625 res!929834) b!1389626))

(assert (= (and b!1389626 res!929836) b!1389622))

(assert (= (and b!1389622 res!929837) b!1389624))

(assert (= (and b!1389624 res!929839) b!1389627))

(declare-fun m!1274831 () Bool)

(assert (=> b!1389624 m!1274831))

(declare-fun m!1274833 () Bool)

(assert (=> b!1389626 m!1274833))

(assert (=> b!1389626 m!1274833))

(declare-fun m!1274835 () Bool)

(assert (=> b!1389626 m!1274835))

(declare-fun m!1274837 () Bool)

(assert (=> start!119118 m!1274837))

(declare-fun m!1274839 () Bool)

(assert (=> start!119118 m!1274839))

(declare-fun m!1274841 () Bool)

(assert (=> b!1389625 m!1274841))

(assert (=> b!1389625 m!1274841))

(declare-fun m!1274843 () Bool)

(assert (=> b!1389625 m!1274843))

(declare-fun m!1274845 () Bool)

(assert (=> b!1389622 m!1274845))

(assert (=> b!1389627 m!1274833))

(assert (=> b!1389627 m!1274833))

(declare-fun m!1274847 () Bool)

(assert (=> b!1389627 m!1274847))

(assert (=> b!1389627 m!1274847))

(assert (=> b!1389627 m!1274833))

(declare-fun m!1274849 () Bool)

(assert (=> b!1389627 m!1274849))

(push 1)

(assert (not b!1389625))

(assert (not b!1389624))

(assert (not start!119118))

(assert (not b!1389627))

(assert (not b!1389622))

(assert (not b!1389626))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

