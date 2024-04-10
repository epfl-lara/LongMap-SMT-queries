; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120612 () Bool)

(assert start!120612)

(declare-fun b!1404295 () Bool)

(declare-fun res!942810 () Bool)

(declare-fun e!794993 () Bool)

(assert (=> b!1404295 (=> (not res!942810) (not e!794993))))

(declare-datatypes ((array!96021 0))(
  ( (array!96022 (arr!46361 (Array (_ BitVec 32) (_ BitVec 64))) (size!46911 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96021)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96021 (_ BitVec 32)) Bool)

(assert (=> b!1404295 (= res!942810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404296 () Bool)

(declare-fun res!942807 () Bool)

(assert (=> b!1404296 (=> (not res!942807) (not e!794993))))

(declare-datatypes ((List!32880 0))(
  ( (Nil!32877) (Cons!32876 (h!34124 (_ BitVec 64)) (t!47574 List!32880)) )
))
(declare-fun arrayNoDuplicates!0 (array!96021 (_ BitVec 32) List!32880) Bool)

(assert (=> b!1404296 (= res!942807 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32877))))

(declare-fun b!1404297 () Bool)

(declare-fun res!942809 () Bool)

(assert (=> b!1404297 (=> (not res!942809) (not e!794993))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404297 (= res!942809 (validKeyInArray!0 (select (arr!46361 a!2901) i!1037)))))

(declare-fun res!942811 () Bool)

(assert (=> start!120612 (=> (not res!942811) (not e!794993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120612 (= res!942811 (validMask!0 mask!2840))))

(assert (=> start!120612 e!794993))

(assert (=> start!120612 true))

(declare-fun array_inv!35389 (array!96021) Bool)

(assert (=> start!120612 (array_inv!35389 a!2901)))

(declare-fun b!1404298 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404298 (= e!794993 (and (bvsle #b00000000000000000000000000000000 (size!46911 a!2901)) (bvsgt j!112 (size!46911 a!2901))))))

(declare-datatypes ((SeekEntryResult!10672 0))(
  ( (MissingZero!10672 (index!45065 (_ BitVec 32))) (Found!10672 (index!45066 (_ BitVec 32))) (Intermediate!10672 (undefined!11484 Bool) (index!45067 (_ BitVec 32)) (x!126683 (_ BitVec 32))) (Undefined!10672) (MissingVacant!10672 (index!45068 (_ BitVec 32))) )
))
(declare-fun lt!618621 () SeekEntryResult!10672)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96021 (_ BitVec 32)) SeekEntryResult!10672)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404298 (= lt!618621 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46361 a!2901) j!112) mask!2840) (select (arr!46361 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404299 () Bool)

(declare-fun res!942806 () Bool)

(assert (=> b!1404299 (=> (not res!942806) (not e!794993))))

(assert (=> b!1404299 (= res!942806 (validKeyInArray!0 (select (arr!46361 a!2901) j!112)))))

(declare-fun b!1404300 () Bool)

(declare-fun res!942808 () Bool)

(assert (=> b!1404300 (=> (not res!942808) (not e!794993))))

(assert (=> b!1404300 (= res!942808 (and (= (size!46911 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46911 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46911 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120612 res!942811) b!1404300))

(assert (= (and b!1404300 res!942808) b!1404297))

(assert (= (and b!1404297 res!942809) b!1404299))

(assert (= (and b!1404299 res!942806) b!1404295))

(assert (= (and b!1404295 res!942810) b!1404296))

(assert (= (and b!1404296 res!942807) b!1404298))

(declare-fun m!1293117 () Bool)

(assert (=> b!1404295 m!1293117))

(declare-fun m!1293119 () Bool)

(assert (=> start!120612 m!1293119))

(declare-fun m!1293121 () Bool)

(assert (=> start!120612 m!1293121))

(declare-fun m!1293123 () Bool)

(assert (=> b!1404296 m!1293123))

(declare-fun m!1293125 () Bool)

(assert (=> b!1404299 m!1293125))

(assert (=> b!1404299 m!1293125))

(declare-fun m!1293127 () Bool)

(assert (=> b!1404299 m!1293127))

(assert (=> b!1404298 m!1293125))

(assert (=> b!1404298 m!1293125))

(declare-fun m!1293129 () Bool)

(assert (=> b!1404298 m!1293129))

(assert (=> b!1404298 m!1293129))

(assert (=> b!1404298 m!1293125))

(declare-fun m!1293131 () Bool)

(assert (=> b!1404298 m!1293131))

(declare-fun m!1293133 () Bool)

(assert (=> b!1404297 m!1293133))

(assert (=> b!1404297 m!1293133))

(declare-fun m!1293135 () Bool)

(assert (=> b!1404297 m!1293135))

(push 1)

(assert (not b!1404297))

(assert (not b!1404298))

(assert (not b!1404296))

(assert (not b!1404295))

(assert (not start!120612))

(assert (not b!1404299))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

