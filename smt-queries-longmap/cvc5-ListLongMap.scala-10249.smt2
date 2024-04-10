; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120546 () Bool)

(assert start!120546)

(declare-fun b!1403658 () Bool)

(declare-fun res!942170 () Bool)

(declare-fun e!794743 () Bool)

(assert (=> b!1403658 (=> (not res!942170) (not e!794743))))

(declare-datatypes ((array!95955 0))(
  ( (array!95956 (arr!46328 (Array (_ BitVec 32) (_ BitVec 64))) (size!46878 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95955)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403658 (= res!942170 (validKeyInArray!0 (select (arr!46328 a!2901) i!1037)))))

(declare-fun b!1403659 () Bool)

(declare-fun res!942174 () Bool)

(assert (=> b!1403659 (=> (not res!942174) (not e!794743))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403659 (= res!942174 (and (= (size!46878 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46878 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46878 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403660 () Bool)

(assert (=> b!1403660 (= e!794743 (not true))))

(declare-fun e!794744 () Bool)

(assert (=> b!1403660 e!794744))

(declare-fun res!942169 () Bool)

(assert (=> b!1403660 (=> (not res!942169) (not e!794744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95955 (_ BitVec 32)) Bool)

(assert (=> b!1403660 (= res!942169 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47294 0))(
  ( (Unit!47295) )
))
(declare-fun lt!618471 () Unit!47294)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47294)

(assert (=> b!1403660 (= lt!618471 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10645 0))(
  ( (MissingZero!10645 (index!44957 (_ BitVec 32))) (Found!10645 (index!44958 (_ BitVec 32))) (Intermediate!10645 (undefined!11457 Bool) (index!44959 (_ BitVec 32)) (x!126568 (_ BitVec 32))) (Undefined!10645) (MissingVacant!10645 (index!44960 (_ BitVec 32))) )
))
(declare-fun lt!618470 () SeekEntryResult!10645)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95955 (_ BitVec 32)) SeekEntryResult!10645)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403660 (= lt!618470 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46328 a!2901) j!112) mask!2840) (select (arr!46328 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403661 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95955 (_ BitVec 32)) SeekEntryResult!10645)

(assert (=> b!1403661 (= e!794744 (= (seekEntryOrOpen!0 (select (arr!46328 a!2901) j!112) a!2901 mask!2840) (Found!10645 j!112)))))

(declare-fun b!1403662 () Bool)

(declare-fun res!942171 () Bool)

(assert (=> b!1403662 (=> (not res!942171) (not e!794743))))

(assert (=> b!1403662 (= res!942171 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403663 () Bool)

(declare-fun res!942172 () Bool)

(assert (=> b!1403663 (=> (not res!942172) (not e!794743))))

(declare-datatypes ((List!32847 0))(
  ( (Nil!32844) (Cons!32843 (h!34091 (_ BitVec 64)) (t!47541 List!32847)) )
))
(declare-fun arrayNoDuplicates!0 (array!95955 (_ BitVec 32) List!32847) Bool)

(assert (=> b!1403663 (= res!942172 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32844))))

(declare-fun b!1403664 () Bool)

(declare-fun res!942173 () Bool)

(assert (=> b!1403664 (=> (not res!942173) (not e!794743))))

(assert (=> b!1403664 (= res!942173 (validKeyInArray!0 (select (arr!46328 a!2901) j!112)))))

(declare-fun res!942175 () Bool)

(assert (=> start!120546 (=> (not res!942175) (not e!794743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120546 (= res!942175 (validMask!0 mask!2840))))

(assert (=> start!120546 e!794743))

(assert (=> start!120546 true))

(declare-fun array_inv!35356 (array!95955) Bool)

(assert (=> start!120546 (array_inv!35356 a!2901)))

(assert (= (and start!120546 res!942175) b!1403659))

(assert (= (and b!1403659 res!942174) b!1403658))

(assert (= (and b!1403658 res!942170) b!1403664))

(assert (= (and b!1403664 res!942173) b!1403662))

(assert (= (and b!1403662 res!942171) b!1403663))

(assert (= (and b!1403663 res!942172) b!1403660))

(assert (= (and b!1403660 res!942169) b!1403661))

(declare-fun m!1292367 () Bool)

(assert (=> b!1403664 m!1292367))

(assert (=> b!1403664 m!1292367))

(declare-fun m!1292369 () Bool)

(assert (=> b!1403664 m!1292369))

(assert (=> b!1403661 m!1292367))

(assert (=> b!1403661 m!1292367))

(declare-fun m!1292371 () Bool)

(assert (=> b!1403661 m!1292371))

(declare-fun m!1292373 () Bool)

(assert (=> b!1403658 m!1292373))

(assert (=> b!1403658 m!1292373))

(declare-fun m!1292375 () Bool)

(assert (=> b!1403658 m!1292375))

(declare-fun m!1292377 () Bool)

(assert (=> b!1403663 m!1292377))

(declare-fun m!1292379 () Bool)

(assert (=> b!1403662 m!1292379))

(assert (=> b!1403660 m!1292367))

(declare-fun m!1292381 () Bool)

(assert (=> b!1403660 m!1292381))

(assert (=> b!1403660 m!1292367))

(declare-fun m!1292383 () Bool)

(assert (=> b!1403660 m!1292383))

(assert (=> b!1403660 m!1292381))

(assert (=> b!1403660 m!1292367))

(declare-fun m!1292385 () Bool)

(assert (=> b!1403660 m!1292385))

(declare-fun m!1292387 () Bool)

(assert (=> b!1403660 m!1292387))

(declare-fun m!1292389 () Bool)

(assert (=> start!120546 m!1292389))

(declare-fun m!1292391 () Bool)

(assert (=> start!120546 m!1292391))

(push 1)

(assert (not start!120546))

(assert (not b!1403661))

(assert (not b!1403658))

(assert (not b!1403660))

(assert (not b!1403663))

(assert (not b!1403662))

(assert (not b!1403664))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

