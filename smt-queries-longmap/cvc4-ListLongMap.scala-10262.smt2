; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120628 () Bool)

(assert start!120628)

(declare-fun b!1404439 () Bool)

(declare-fun res!942954 () Bool)

(declare-fun e!795040 () Bool)

(assert (=> b!1404439 (=> (not res!942954) (not e!795040))))

(declare-datatypes ((array!96037 0))(
  ( (array!96038 (arr!46369 (Array (_ BitVec 32) (_ BitVec 64))) (size!46919 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96037)

(declare-datatypes ((List!32888 0))(
  ( (Nil!32885) (Cons!32884 (h!34132 (_ BitVec 64)) (t!47582 List!32888)) )
))
(declare-fun arrayNoDuplicates!0 (array!96037 (_ BitVec 32) List!32888) Bool)

(assert (=> b!1404439 (= res!942954 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32885))))

(declare-fun b!1404440 () Bool)

(declare-fun res!942951 () Bool)

(assert (=> b!1404440 (=> (not res!942951) (not e!795040))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96037 (_ BitVec 32)) Bool)

(assert (=> b!1404440 (= res!942951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404441 () Bool)

(declare-fun res!942955 () Bool)

(assert (=> b!1404441 (=> (not res!942955) (not e!795040))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404441 (= res!942955 (validKeyInArray!0 (select (arr!46369 a!2901) j!112)))))

(declare-fun b!1404443 () Bool)

(declare-fun res!942950 () Bool)

(assert (=> b!1404443 (=> (not res!942950) (not e!795040))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404443 (= res!942950 (validKeyInArray!0 (select (arr!46369 a!2901) i!1037)))))

(declare-fun b!1404444 () Bool)

(assert (=> b!1404444 (= e!795040 (not true))))

(assert (=> b!1404444 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47334 0))(
  ( (Unit!47335) )
))
(declare-fun lt!618654 () Unit!47334)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96037 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47334)

(assert (=> b!1404444 (= lt!618654 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10680 0))(
  ( (MissingZero!10680 (index!45097 (_ BitVec 32))) (Found!10680 (index!45098 (_ BitVec 32))) (Intermediate!10680 (undefined!11492 Bool) (index!45099 (_ BitVec 32)) (x!126707 (_ BitVec 32))) (Undefined!10680) (MissingVacant!10680 (index!45100 (_ BitVec 32))) )
))
(declare-fun lt!618653 () SeekEntryResult!10680)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96037 (_ BitVec 32)) SeekEntryResult!10680)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404444 (= lt!618653 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46369 a!2901) j!112) mask!2840) (select (arr!46369 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1404442 () Bool)

(declare-fun res!942953 () Bool)

(assert (=> b!1404442 (=> (not res!942953) (not e!795040))))

(assert (=> b!1404442 (= res!942953 (and (= (size!46919 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46919 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46919 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!942952 () Bool)

(assert (=> start!120628 (=> (not res!942952) (not e!795040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120628 (= res!942952 (validMask!0 mask!2840))))

(assert (=> start!120628 e!795040))

(assert (=> start!120628 true))

(declare-fun array_inv!35397 (array!96037) Bool)

(assert (=> start!120628 (array_inv!35397 a!2901)))

(assert (= (and start!120628 res!942952) b!1404442))

(assert (= (and b!1404442 res!942953) b!1404443))

(assert (= (and b!1404443 res!942950) b!1404441))

(assert (= (and b!1404441 res!942955) b!1404440))

(assert (= (and b!1404440 res!942951) b!1404439))

(assert (= (and b!1404439 res!942954) b!1404444))

(declare-fun m!1293285 () Bool)

(assert (=> start!120628 m!1293285))

(declare-fun m!1293287 () Bool)

(assert (=> start!120628 m!1293287))

(declare-fun m!1293289 () Bool)

(assert (=> b!1404439 m!1293289))

(declare-fun m!1293291 () Bool)

(assert (=> b!1404443 m!1293291))

(assert (=> b!1404443 m!1293291))

(declare-fun m!1293293 () Bool)

(assert (=> b!1404443 m!1293293))

(declare-fun m!1293295 () Bool)

(assert (=> b!1404441 m!1293295))

(assert (=> b!1404441 m!1293295))

(declare-fun m!1293297 () Bool)

(assert (=> b!1404441 m!1293297))

(declare-fun m!1293299 () Bool)

(assert (=> b!1404440 m!1293299))

(assert (=> b!1404444 m!1293295))

(declare-fun m!1293301 () Bool)

(assert (=> b!1404444 m!1293301))

(assert (=> b!1404444 m!1293295))

(declare-fun m!1293303 () Bool)

(assert (=> b!1404444 m!1293303))

(assert (=> b!1404444 m!1293301))

(assert (=> b!1404444 m!1293295))

(declare-fun m!1293305 () Bool)

(assert (=> b!1404444 m!1293305))

(declare-fun m!1293307 () Bool)

(assert (=> b!1404444 m!1293307))

(push 1)

(assert (not b!1404439))

(assert (not b!1404443))

(assert (not b!1404444))

(assert (not b!1404441))

(assert (not start!120628))

(assert (not b!1404440))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

