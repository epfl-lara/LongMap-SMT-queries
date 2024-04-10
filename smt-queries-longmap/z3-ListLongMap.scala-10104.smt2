; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119120 () Bool)

(assert start!119120)

(declare-fun b!1389685 () Bool)

(declare-fun res!929849 () Bool)

(declare-fun e!787123 () Bool)

(assert (=> b!1389685 (=> (not res!929849) (not e!787123))))

(declare-datatypes ((array!95057 0))(
  ( (array!95058 (arr!45894 (Array (_ BitVec 32) (_ BitVec 64))) (size!46444 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95057)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95057 (_ BitVec 32)) Bool)

(assert (=> b!1389685 (= res!929849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389686 () Bool)

(declare-fun res!929850 () Bool)

(assert (=> b!1389686 (=> (not res!929850) (not e!787123))))

(declare-datatypes ((List!32413 0))(
  ( (Nil!32410) (Cons!32409 (h!33627 (_ BitVec 64)) (t!47107 List!32413)) )
))
(declare-fun arrayNoDuplicates!0 (array!95057 (_ BitVec 32) List!32413) Bool)

(assert (=> b!1389686 (= res!929850 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32410))))

(declare-fun res!929851 () Bool)

(assert (=> start!119120 (=> (not res!929851) (not e!787123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119120 (= res!929851 (validMask!0 mask!2840))))

(assert (=> start!119120 e!787123))

(assert (=> start!119120 true))

(declare-fun array_inv!34922 (array!95057) Bool)

(assert (=> start!119120 (array_inv!34922 a!2901)))

(declare-fun b!1389687 () Bool)

(declare-fun res!929846 () Bool)

(assert (=> b!1389687 (=> (not res!929846) (not e!787123))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389687 (= res!929846 (and (= (size!46444 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46444 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46444 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389688 () Bool)

(assert (=> b!1389688 (= e!787123 false)))

(declare-datatypes ((SeekEntryResult!10211 0))(
  ( (MissingZero!10211 (index!43215 (_ BitVec 32))) (Found!10211 (index!43216 (_ BitVec 32))) (Intermediate!10211 (undefined!11023 Bool) (index!43217 (_ BitVec 32)) (x!124905 (_ BitVec 32))) (Undefined!10211) (MissingVacant!10211 (index!43218 (_ BitVec 32))) )
))
(declare-fun lt!610608 () SeekEntryResult!10211)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95057 (_ BitVec 32)) SeekEntryResult!10211)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389688 (= lt!610608 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45894 a!2901) j!112) mask!2840) (select (arr!45894 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389689 () Bool)

(declare-fun res!929847 () Bool)

(assert (=> b!1389689 (=> (not res!929847) (not e!787123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389689 (= res!929847 (validKeyInArray!0 (select (arr!45894 a!2901) i!1037)))))

(declare-fun b!1389690 () Bool)

(declare-fun res!929848 () Bool)

(assert (=> b!1389690 (=> (not res!929848) (not e!787123))))

(assert (=> b!1389690 (= res!929848 (validKeyInArray!0 (select (arr!45894 a!2901) j!112)))))

(assert (= (and start!119120 res!929851) b!1389687))

(assert (= (and b!1389687 res!929846) b!1389689))

(assert (= (and b!1389689 res!929847) b!1389690))

(assert (= (and b!1389690 res!929848) b!1389685))

(assert (= (and b!1389685 res!929849) b!1389686))

(assert (= (and b!1389686 res!929850) b!1389688))

(declare-fun m!1275347 () Bool)

(assert (=> b!1389686 m!1275347))

(declare-fun m!1275349 () Bool)

(assert (=> b!1389688 m!1275349))

(assert (=> b!1389688 m!1275349))

(declare-fun m!1275351 () Bool)

(assert (=> b!1389688 m!1275351))

(assert (=> b!1389688 m!1275351))

(assert (=> b!1389688 m!1275349))

(declare-fun m!1275353 () Bool)

(assert (=> b!1389688 m!1275353))

(declare-fun m!1275355 () Bool)

(assert (=> b!1389685 m!1275355))

(assert (=> b!1389690 m!1275349))

(assert (=> b!1389690 m!1275349))

(declare-fun m!1275357 () Bool)

(assert (=> b!1389690 m!1275357))

(declare-fun m!1275359 () Bool)

(assert (=> start!119120 m!1275359))

(declare-fun m!1275361 () Bool)

(assert (=> start!119120 m!1275361))

(declare-fun m!1275363 () Bool)

(assert (=> b!1389689 m!1275363))

(assert (=> b!1389689 m!1275363))

(declare-fun m!1275365 () Bool)

(assert (=> b!1389689 m!1275365))

(check-sat (not start!119120) (not b!1389686) (not b!1389689) (not b!1389685) (not b!1389688) (not b!1389690))
