; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120516 () Bool)

(assert start!120516)

(declare-fun b!1403318 () Bool)

(declare-fun e!794582 () Bool)

(declare-fun e!794585 () Bool)

(assert (=> b!1403318 (= e!794582 (not e!794585))))

(declare-fun res!941834 () Bool)

(assert (=> b!1403318 (=> res!941834 e!794585)))

(declare-datatypes ((SeekEntryResult!10630 0))(
  ( (MissingZero!10630 (index!44897 (_ BitVec 32))) (Found!10630 (index!44898 (_ BitVec 32))) (Intermediate!10630 (undefined!11442 Bool) (index!44899 (_ BitVec 32)) (x!126513 (_ BitVec 32))) (Undefined!10630) (MissingVacant!10630 (index!44900 (_ BitVec 32))) )
))
(declare-fun lt!618356 () SeekEntryResult!10630)

(assert (=> b!1403318 (= res!941834 (or (not (is-Intermediate!10630 lt!618356)) (undefined!11442 lt!618356)))))

(declare-fun e!794583 () Bool)

(assert (=> b!1403318 e!794583))

(declare-fun res!941829 () Bool)

(assert (=> b!1403318 (=> (not res!941829) (not e!794583))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95925 0))(
  ( (array!95926 (arr!46313 (Array (_ BitVec 32) (_ BitVec 64))) (size!46863 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95925)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95925 (_ BitVec 32)) Bool)

(assert (=> b!1403318 (= res!941829 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47264 0))(
  ( (Unit!47265) )
))
(declare-fun lt!618355 () Unit!47264)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95925 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47264)

(assert (=> b!1403318 (= lt!618355 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95925 (_ BitVec 32)) SeekEntryResult!10630)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403318 (= lt!618356 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46313 a!2901) j!112) mask!2840) (select (arr!46313 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403319 () Bool)

(declare-fun res!941836 () Bool)

(assert (=> b!1403319 (=> (not res!941836) (not e!794582))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403319 (= res!941836 (and (= (size!46863 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46863 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46863 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403320 () Bool)

(declare-fun res!941835 () Bool)

(assert (=> b!1403320 (=> (not res!941835) (not e!794582))))

(assert (=> b!1403320 (= res!941835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403321 () Bool)

(assert (=> b!1403321 (= e!794585 true)))

(declare-fun lt!618357 () SeekEntryResult!10630)

(assert (=> b!1403321 (= lt!618357 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46313 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46313 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95926 (store (arr!46313 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46863 a!2901)) mask!2840))))

(declare-fun b!1403322 () Bool)

(declare-fun res!941830 () Bool)

(assert (=> b!1403322 (=> (not res!941830) (not e!794582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403322 (= res!941830 (validKeyInArray!0 (select (arr!46313 a!2901) j!112)))))

(declare-fun res!941833 () Bool)

(assert (=> start!120516 (=> (not res!941833) (not e!794582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120516 (= res!941833 (validMask!0 mask!2840))))

(assert (=> start!120516 e!794582))

(assert (=> start!120516 true))

(declare-fun array_inv!35341 (array!95925) Bool)

(assert (=> start!120516 (array_inv!35341 a!2901)))

(declare-fun b!1403323 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95925 (_ BitVec 32)) SeekEntryResult!10630)

(assert (=> b!1403323 (= e!794583 (= (seekEntryOrOpen!0 (select (arr!46313 a!2901) j!112) a!2901 mask!2840) (Found!10630 j!112)))))

(declare-fun b!1403324 () Bool)

(declare-fun res!941832 () Bool)

(assert (=> b!1403324 (=> (not res!941832) (not e!794582))))

(declare-datatypes ((List!32832 0))(
  ( (Nil!32829) (Cons!32828 (h!34076 (_ BitVec 64)) (t!47526 List!32832)) )
))
(declare-fun arrayNoDuplicates!0 (array!95925 (_ BitVec 32) List!32832) Bool)

(assert (=> b!1403324 (= res!941832 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32829))))

(declare-fun b!1403325 () Bool)

(declare-fun res!941831 () Bool)

(assert (=> b!1403325 (=> (not res!941831) (not e!794582))))

(assert (=> b!1403325 (= res!941831 (validKeyInArray!0 (select (arr!46313 a!2901) i!1037)))))

(assert (= (and start!120516 res!941833) b!1403319))

(assert (= (and b!1403319 res!941836) b!1403325))

(assert (= (and b!1403325 res!941831) b!1403322))

(assert (= (and b!1403322 res!941830) b!1403320))

(assert (= (and b!1403320 res!941835) b!1403324))

(assert (= (and b!1403324 res!941832) b!1403318))

(assert (= (and b!1403318 res!941829) b!1403323))

(assert (= (and b!1403318 (not res!941834)) b!1403321))

(declare-fun m!1291905 () Bool)

(assert (=> b!1403322 m!1291905))

(assert (=> b!1403322 m!1291905))

(declare-fun m!1291907 () Bool)

(assert (=> b!1403322 m!1291907))

(declare-fun m!1291909 () Bool)

(assert (=> b!1403321 m!1291909))

(declare-fun m!1291911 () Bool)

(assert (=> b!1403321 m!1291911))

(assert (=> b!1403321 m!1291911))

(declare-fun m!1291913 () Bool)

(assert (=> b!1403321 m!1291913))

(assert (=> b!1403321 m!1291913))

(assert (=> b!1403321 m!1291911))

(declare-fun m!1291915 () Bool)

(assert (=> b!1403321 m!1291915))

(assert (=> b!1403318 m!1291905))

(declare-fun m!1291917 () Bool)

(assert (=> b!1403318 m!1291917))

(assert (=> b!1403318 m!1291905))

(declare-fun m!1291919 () Bool)

(assert (=> b!1403318 m!1291919))

(assert (=> b!1403318 m!1291917))

(assert (=> b!1403318 m!1291905))

(declare-fun m!1291921 () Bool)

(assert (=> b!1403318 m!1291921))

(declare-fun m!1291923 () Bool)

(assert (=> b!1403318 m!1291923))

(declare-fun m!1291925 () Bool)

(assert (=> b!1403325 m!1291925))

(assert (=> b!1403325 m!1291925))

(declare-fun m!1291927 () Bool)

(assert (=> b!1403325 m!1291927))

(declare-fun m!1291929 () Bool)

(assert (=> b!1403320 m!1291929))

(assert (=> b!1403323 m!1291905))

(assert (=> b!1403323 m!1291905))

(declare-fun m!1291931 () Bool)

(assert (=> b!1403323 m!1291931))

(declare-fun m!1291933 () Bool)

(assert (=> start!120516 m!1291933))

(declare-fun m!1291935 () Bool)

(assert (=> start!120516 m!1291935))

(declare-fun m!1291937 () Bool)

(assert (=> b!1403324 m!1291937))

(push 1)

(assert (not b!1403322))

(assert (not b!1403325))

(assert (not b!1403321))

(assert (not b!1403320))

(assert (not b!1403318))

(assert (not b!1403323))

(assert (not b!1403324))

(assert (not start!120516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

