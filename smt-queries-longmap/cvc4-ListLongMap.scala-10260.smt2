; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120616 () Bool)

(assert start!120616)

(declare-fun b!1404331 () Bool)

(declare-fun res!942845 () Bool)

(declare-fun e!795004 () Bool)

(assert (=> b!1404331 (=> (not res!942845) (not e!795004))))

(declare-datatypes ((array!96025 0))(
  ( (array!96026 (arr!46363 (Array (_ BitVec 32) (_ BitVec 64))) (size!46913 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96025)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404331 (= res!942845 (validKeyInArray!0 (select (arr!46363 a!2901) i!1037)))))

(declare-fun b!1404332 () Bool)

(declare-fun res!942842 () Bool)

(assert (=> b!1404332 (=> (not res!942842) (not e!795004))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1404332 (= res!942842 (validKeyInArray!0 (select (arr!46363 a!2901) j!112)))))

(declare-fun res!942843 () Bool)

(assert (=> start!120616 (=> (not res!942843) (not e!795004))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120616 (= res!942843 (validMask!0 mask!2840))))

(assert (=> start!120616 e!795004))

(assert (=> start!120616 true))

(declare-fun array_inv!35391 (array!96025) Bool)

(assert (=> start!120616 (array_inv!35391 a!2901)))

(declare-fun b!1404333 () Bool)

(declare-fun res!942846 () Bool)

(assert (=> b!1404333 (=> (not res!942846) (not e!795004))))

(assert (=> b!1404333 (= res!942846 (and (= (size!46913 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46913 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46913 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404334 () Bool)

(declare-fun res!942844 () Bool)

(assert (=> b!1404334 (=> (not res!942844) (not e!795004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96025 (_ BitVec 32)) Bool)

(assert (=> b!1404334 (= res!942844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404335 () Bool)

(assert (=> b!1404335 (= e!795004 (and (bvsle #b00000000000000000000000000000000 (size!46913 a!2901)) (bvsgt j!112 (size!46913 a!2901))))))

(declare-datatypes ((SeekEntryResult!10674 0))(
  ( (MissingZero!10674 (index!45073 (_ BitVec 32))) (Found!10674 (index!45074 (_ BitVec 32))) (Intermediate!10674 (undefined!11486 Bool) (index!45075 (_ BitVec 32)) (x!126685 (_ BitVec 32))) (Undefined!10674) (MissingVacant!10674 (index!45076 (_ BitVec 32))) )
))
(declare-fun lt!618627 () SeekEntryResult!10674)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96025 (_ BitVec 32)) SeekEntryResult!10674)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404335 (= lt!618627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46363 a!2901) j!112) mask!2840) (select (arr!46363 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404336 () Bool)

(declare-fun res!942847 () Bool)

(assert (=> b!1404336 (=> (not res!942847) (not e!795004))))

(declare-datatypes ((List!32882 0))(
  ( (Nil!32879) (Cons!32878 (h!34126 (_ BitVec 64)) (t!47576 List!32882)) )
))
(declare-fun arrayNoDuplicates!0 (array!96025 (_ BitVec 32) List!32882) Bool)

(assert (=> b!1404336 (= res!942847 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32879))))

(assert (= (and start!120616 res!942843) b!1404333))

(assert (= (and b!1404333 res!942846) b!1404331))

(assert (= (and b!1404331 res!942845) b!1404332))

(assert (= (and b!1404332 res!942842) b!1404334))

(assert (= (and b!1404334 res!942844) b!1404336))

(assert (= (and b!1404336 res!942847) b!1404335))

(declare-fun m!1293157 () Bool)

(assert (=> b!1404336 m!1293157))

(declare-fun m!1293159 () Bool)

(assert (=> b!1404332 m!1293159))

(assert (=> b!1404332 m!1293159))

(declare-fun m!1293161 () Bool)

(assert (=> b!1404332 m!1293161))

(declare-fun m!1293163 () Bool)

(assert (=> start!120616 m!1293163))

(declare-fun m!1293165 () Bool)

(assert (=> start!120616 m!1293165))

(declare-fun m!1293167 () Bool)

(assert (=> b!1404334 m!1293167))

(assert (=> b!1404335 m!1293159))

(assert (=> b!1404335 m!1293159))

(declare-fun m!1293169 () Bool)

(assert (=> b!1404335 m!1293169))

(assert (=> b!1404335 m!1293169))

(assert (=> b!1404335 m!1293159))

(declare-fun m!1293171 () Bool)

(assert (=> b!1404335 m!1293171))

(declare-fun m!1293173 () Bool)

(assert (=> b!1404331 m!1293173))

(assert (=> b!1404331 m!1293173))

(declare-fun m!1293175 () Bool)

(assert (=> b!1404331 m!1293175))

(push 1)

(assert (not b!1404331))

(assert (not b!1404335))

(assert (not b!1404334))

(assert (not b!1404336))

(assert (not b!1404332))

(assert (not start!120616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

