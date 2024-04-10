; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119102 () Bool)

(assert start!119102)

(declare-fun b!1389523 () Bool)

(declare-fun res!929684 () Bool)

(declare-fun e!787069 () Bool)

(assert (=> b!1389523 (=> (not res!929684) (not e!787069))))

(declare-datatypes ((array!95039 0))(
  ( (array!95040 (arr!45885 (Array (_ BitVec 32) (_ BitVec 64))) (size!46435 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95039)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95039 (_ BitVec 32)) Bool)

(assert (=> b!1389523 (= res!929684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!929687 () Bool)

(assert (=> start!119102 (=> (not res!929687) (not e!787069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119102 (= res!929687 (validMask!0 mask!2840))))

(assert (=> start!119102 e!787069))

(assert (=> start!119102 true))

(declare-fun array_inv!34913 (array!95039) Bool)

(assert (=> start!119102 (array_inv!34913 a!2901)))

(declare-fun b!1389524 () Bool)

(declare-fun res!929689 () Bool)

(assert (=> b!1389524 (=> (not res!929689) (not e!787069))))

(declare-datatypes ((List!32404 0))(
  ( (Nil!32401) (Cons!32400 (h!33618 (_ BitVec 64)) (t!47098 List!32404)) )
))
(declare-fun arrayNoDuplicates!0 (array!95039 (_ BitVec 32) List!32404) Bool)

(assert (=> b!1389524 (= res!929689 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32401))))

(declare-fun b!1389525 () Bool)

(declare-fun res!929685 () Bool)

(assert (=> b!1389525 (=> (not res!929685) (not e!787069))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389525 (= res!929685 (validKeyInArray!0 (select (arr!45885 a!2901) i!1037)))))

(declare-fun b!1389526 () Bool)

(declare-fun res!929686 () Bool)

(assert (=> b!1389526 (=> (not res!929686) (not e!787069))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389526 (= res!929686 (and (= (size!46435 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46435 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46435 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389527 () Bool)

(assert (=> b!1389527 (= e!787069 false)))

(declare-datatypes ((SeekEntryResult!10202 0))(
  ( (MissingZero!10202 (index!43179 (_ BitVec 32))) (Found!10202 (index!43180 (_ BitVec 32))) (Intermediate!10202 (undefined!11014 Bool) (index!43181 (_ BitVec 32)) (x!124872 (_ BitVec 32))) (Undefined!10202) (MissingVacant!10202 (index!43182 (_ BitVec 32))) )
))
(declare-fun lt!610581 () SeekEntryResult!10202)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95039 (_ BitVec 32)) SeekEntryResult!10202)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389527 (= lt!610581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45885 a!2901) j!112) mask!2840) (select (arr!45885 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389528 () Bool)

(declare-fun res!929688 () Bool)

(assert (=> b!1389528 (=> (not res!929688) (not e!787069))))

(assert (=> b!1389528 (= res!929688 (validKeyInArray!0 (select (arr!45885 a!2901) j!112)))))

(assert (= (and start!119102 res!929687) b!1389526))

(assert (= (and b!1389526 res!929686) b!1389525))

(assert (= (and b!1389525 res!929685) b!1389528))

(assert (= (and b!1389528 res!929688) b!1389523))

(assert (= (and b!1389523 res!929684) b!1389524))

(assert (= (and b!1389524 res!929689) b!1389527))

(declare-fun m!1275167 () Bool)

(assert (=> b!1389528 m!1275167))

(assert (=> b!1389528 m!1275167))

(declare-fun m!1275169 () Bool)

(assert (=> b!1389528 m!1275169))

(assert (=> b!1389527 m!1275167))

(assert (=> b!1389527 m!1275167))

(declare-fun m!1275171 () Bool)

(assert (=> b!1389527 m!1275171))

(assert (=> b!1389527 m!1275171))

(assert (=> b!1389527 m!1275167))

(declare-fun m!1275173 () Bool)

(assert (=> b!1389527 m!1275173))

(declare-fun m!1275175 () Bool)

(assert (=> b!1389524 m!1275175))

(declare-fun m!1275177 () Bool)

(assert (=> b!1389525 m!1275177))

(assert (=> b!1389525 m!1275177))

(declare-fun m!1275179 () Bool)

(assert (=> b!1389525 m!1275179))

(declare-fun m!1275181 () Bool)

(assert (=> start!119102 m!1275181))

(declare-fun m!1275183 () Bool)

(assert (=> start!119102 m!1275183))

(declare-fun m!1275185 () Bool)

(assert (=> b!1389523 m!1275185))

(check-sat (not b!1389528) (not b!1389523) (not start!119102) (not b!1389524) (not b!1389527) (not b!1389525))
