; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119304 () Bool)

(assert start!119304)

(declare-fun b!1390789 () Bool)

(declare-fun e!787849 () Bool)

(assert (=> b!1390789 (= e!787849 false)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95163 0))(
  ( (array!95164 (arr!45945 (Array (_ BitVec 32) (_ BitVec 64))) (size!46496 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95163)

(declare-datatypes ((SeekEntryResult!10165 0))(
  ( (MissingZero!10165 (index!43031 (_ BitVec 32))) (Found!10165 (index!43032 (_ BitVec 32))) (Intermediate!10165 (undefined!10977 Bool) (index!43033 (_ BitVec 32)) (x!124870 (_ BitVec 32))) (Undefined!10165) (MissingVacant!10165 (index!43034 (_ BitVec 32))) )
))
(declare-fun lt!611000 () SeekEntryResult!10165)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95163 (_ BitVec 32)) SeekEntryResult!10165)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390789 (= lt!611000 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45945 a!2901) j!112) mask!2840) (select (arr!45945 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390790 () Bool)

(declare-fun res!930266 () Bool)

(assert (=> b!1390790 (=> (not res!930266) (not e!787849))))

(declare-datatypes ((List!32451 0))(
  ( (Nil!32448) (Cons!32447 (h!33673 (_ BitVec 64)) (t!47137 List!32451)) )
))
(declare-fun arrayNoDuplicates!0 (array!95163 (_ BitVec 32) List!32451) Bool)

(assert (=> b!1390790 (= res!930266 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32448))))

(declare-fun b!1390791 () Bool)

(declare-fun res!930268 () Bool)

(assert (=> b!1390791 (=> (not res!930268) (not e!787849))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390791 (= res!930268 (validKeyInArray!0 (select (arr!45945 a!2901) i!1037)))))

(declare-fun b!1390792 () Bool)

(declare-fun res!930270 () Bool)

(assert (=> b!1390792 (=> (not res!930270) (not e!787849))))

(assert (=> b!1390792 (= res!930270 (and (= (size!46496 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46496 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46496 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390793 () Bool)

(declare-fun res!930267 () Bool)

(assert (=> b!1390793 (=> (not res!930267) (not e!787849))))

(assert (=> b!1390793 (= res!930267 (validKeyInArray!0 (select (arr!45945 a!2901) j!112)))))

(declare-fun b!1390794 () Bool)

(declare-fun res!930269 () Bool)

(assert (=> b!1390794 (=> (not res!930269) (not e!787849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95163 (_ BitVec 32)) Bool)

(assert (=> b!1390794 (= res!930269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!930271 () Bool)

(assert (=> start!119304 (=> (not res!930271) (not e!787849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119304 (= res!930271 (validMask!0 mask!2840))))

(assert (=> start!119304 e!787849))

(assert (=> start!119304 true))

(declare-fun array_inv!35226 (array!95163) Bool)

(assert (=> start!119304 (array_inv!35226 a!2901)))

(assert (= (and start!119304 res!930271) b!1390792))

(assert (= (and b!1390792 res!930270) b!1390791))

(assert (= (and b!1390791 res!930268) b!1390793))

(assert (= (and b!1390793 res!930267) b!1390794))

(assert (= (and b!1390794 res!930269) b!1390790))

(assert (= (and b!1390790 res!930266) b!1390789))

(declare-fun m!1276679 () Bool)

(assert (=> b!1390794 m!1276679))

(declare-fun m!1276681 () Bool)

(assert (=> b!1390789 m!1276681))

(assert (=> b!1390789 m!1276681))

(declare-fun m!1276683 () Bool)

(assert (=> b!1390789 m!1276683))

(assert (=> b!1390789 m!1276683))

(assert (=> b!1390789 m!1276681))

(declare-fun m!1276685 () Bool)

(assert (=> b!1390789 m!1276685))

(assert (=> b!1390793 m!1276681))

(assert (=> b!1390793 m!1276681))

(declare-fun m!1276687 () Bool)

(assert (=> b!1390793 m!1276687))

(declare-fun m!1276689 () Bool)

(assert (=> start!119304 m!1276689))

(declare-fun m!1276691 () Bool)

(assert (=> start!119304 m!1276691))

(declare-fun m!1276693 () Bool)

(assert (=> b!1390790 m!1276693))

(declare-fun m!1276695 () Bool)

(assert (=> b!1390791 m!1276695))

(assert (=> b!1390791 m!1276695))

(declare-fun m!1276697 () Bool)

(assert (=> b!1390791 m!1276697))

(push 1)

(assert (not b!1390791))

(assert (not b!1390790))

(assert (not b!1390794))

(assert (not b!1390789))

(assert (not b!1390793))

(assert (not start!119304))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

