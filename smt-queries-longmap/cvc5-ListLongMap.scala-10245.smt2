; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120522 () Bool)

(assert start!120522)

(declare-fun b!1403390 () Bool)

(declare-fun res!941906 () Bool)

(declare-fun e!794618 () Bool)

(assert (=> b!1403390 (=> (not res!941906) (not e!794618))))

(declare-datatypes ((array!95931 0))(
  ( (array!95932 (arr!46316 (Array (_ BitVec 32) (_ BitVec 64))) (size!46866 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95931)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403390 (= res!941906 (validKeyInArray!0 (select (arr!46316 a!2901) j!112)))))

(declare-fun b!1403391 () Bool)

(declare-fun e!794620 () Bool)

(assert (=> b!1403391 (= e!794618 (not e!794620))))

(declare-fun res!941908 () Bool)

(assert (=> b!1403391 (=> res!941908 e!794620)))

(declare-datatypes ((SeekEntryResult!10633 0))(
  ( (MissingZero!10633 (index!44909 (_ BitVec 32))) (Found!10633 (index!44910 (_ BitVec 32))) (Intermediate!10633 (undefined!11445 Bool) (index!44911 (_ BitVec 32)) (x!126524 (_ BitVec 32))) (Undefined!10633) (MissingVacant!10633 (index!44912 (_ BitVec 32))) )
))
(declare-fun lt!618382 () SeekEntryResult!10633)

(assert (=> b!1403391 (= res!941908 (or (not (is-Intermediate!10633 lt!618382)) (undefined!11445 lt!618382)))))

(declare-fun e!794619 () Bool)

(assert (=> b!1403391 e!794619))

(declare-fun res!941901 () Bool)

(assert (=> b!1403391 (=> (not res!941901) (not e!794619))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95931 (_ BitVec 32)) Bool)

(assert (=> b!1403391 (= res!941901 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47270 0))(
  ( (Unit!47271) )
))
(declare-fun lt!618383 () Unit!47270)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95931 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47270)

(assert (=> b!1403391 (= lt!618383 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95931 (_ BitVec 32)) SeekEntryResult!10633)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403391 (= lt!618382 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46316 a!2901) j!112) mask!2840) (select (arr!46316 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403392 () Bool)

(declare-fun res!941902 () Bool)

(assert (=> b!1403392 (=> (not res!941902) (not e!794618))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403392 (= res!941902 (validKeyInArray!0 (select (arr!46316 a!2901) i!1037)))))

(declare-fun b!1403393 () Bool)

(declare-fun res!941904 () Bool)

(assert (=> b!1403393 (=> (not res!941904) (not e!794618))))

(assert (=> b!1403393 (= res!941904 (and (= (size!46866 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46866 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46866 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403394 () Bool)

(assert (=> b!1403394 (= e!794620 true)))

(declare-fun lt!618384 () SeekEntryResult!10633)

(assert (=> b!1403394 (= lt!618384 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46316 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46316 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95932 (store (arr!46316 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46866 a!2901)) mask!2840))))

(declare-fun b!1403395 () Bool)

(declare-fun res!941903 () Bool)

(assert (=> b!1403395 (=> (not res!941903) (not e!794618))))

(assert (=> b!1403395 (= res!941903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403396 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95931 (_ BitVec 32)) SeekEntryResult!10633)

(assert (=> b!1403396 (= e!794619 (= (seekEntryOrOpen!0 (select (arr!46316 a!2901) j!112) a!2901 mask!2840) (Found!10633 j!112)))))

(declare-fun b!1403397 () Bool)

(declare-fun res!941907 () Bool)

(assert (=> b!1403397 (=> (not res!941907) (not e!794618))))

(declare-datatypes ((List!32835 0))(
  ( (Nil!32832) (Cons!32831 (h!34079 (_ BitVec 64)) (t!47529 List!32835)) )
))
(declare-fun arrayNoDuplicates!0 (array!95931 (_ BitVec 32) List!32835) Bool)

(assert (=> b!1403397 (= res!941907 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32832))))

(declare-fun res!941905 () Bool)

(assert (=> start!120522 (=> (not res!941905) (not e!794618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120522 (= res!941905 (validMask!0 mask!2840))))

(assert (=> start!120522 e!794618))

(assert (=> start!120522 true))

(declare-fun array_inv!35344 (array!95931) Bool)

(assert (=> start!120522 (array_inv!35344 a!2901)))

(assert (= (and start!120522 res!941905) b!1403393))

(assert (= (and b!1403393 res!941904) b!1403392))

(assert (= (and b!1403392 res!941902) b!1403390))

(assert (= (and b!1403390 res!941906) b!1403395))

(assert (= (and b!1403395 res!941903) b!1403397))

(assert (= (and b!1403397 res!941907) b!1403391))

(assert (= (and b!1403391 res!941901) b!1403396))

(assert (= (and b!1403391 (not res!941908)) b!1403394))

(declare-fun m!1292007 () Bool)

(assert (=> b!1403390 m!1292007))

(assert (=> b!1403390 m!1292007))

(declare-fun m!1292009 () Bool)

(assert (=> b!1403390 m!1292009))

(assert (=> b!1403391 m!1292007))

(declare-fun m!1292011 () Bool)

(assert (=> b!1403391 m!1292011))

(assert (=> b!1403391 m!1292007))

(declare-fun m!1292013 () Bool)

(assert (=> b!1403391 m!1292013))

(assert (=> b!1403391 m!1292011))

(assert (=> b!1403391 m!1292007))

(declare-fun m!1292015 () Bool)

(assert (=> b!1403391 m!1292015))

(declare-fun m!1292017 () Bool)

(assert (=> b!1403391 m!1292017))

(declare-fun m!1292019 () Bool)

(assert (=> start!120522 m!1292019))

(declare-fun m!1292021 () Bool)

(assert (=> start!120522 m!1292021))

(declare-fun m!1292023 () Bool)

(assert (=> b!1403395 m!1292023))

(declare-fun m!1292025 () Bool)

(assert (=> b!1403392 m!1292025))

(assert (=> b!1403392 m!1292025))

(declare-fun m!1292027 () Bool)

(assert (=> b!1403392 m!1292027))

(assert (=> b!1403396 m!1292007))

(assert (=> b!1403396 m!1292007))

(declare-fun m!1292029 () Bool)

(assert (=> b!1403396 m!1292029))

(declare-fun m!1292031 () Bool)

(assert (=> b!1403397 m!1292031))

(declare-fun m!1292033 () Bool)

(assert (=> b!1403394 m!1292033))

(declare-fun m!1292035 () Bool)

(assert (=> b!1403394 m!1292035))

(assert (=> b!1403394 m!1292035))

(declare-fun m!1292037 () Bool)

(assert (=> b!1403394 m!1292037))

(assert (=> b!1403394 m!1292037))

(assert (=> b!1403394 m!1292035))

(declare-fun m!1292039 () Bool)

(assert (=> b!1403394 m!1292039))

(push 1)

(assert (not b!1403395))

(assert (not b!1403396))

(assert (not start!120522))

(assert (not b!1403390))

(assert (not b!1403397))

(assert (not b!1403392))

(assert (not b!1403391))

(assert (not b!1403394))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

