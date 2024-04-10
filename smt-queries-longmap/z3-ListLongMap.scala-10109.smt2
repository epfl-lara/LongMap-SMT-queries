; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119150 () Bool)

(assert start!119150)

(declare-fun b!1389955 () Bool)

(declare-fun res!930119 () Bool)

(declare-fun e!787214 () Bool)

(assert (=> b!1389955 (=> (not res!930119) (not e!787214))))

(declare-datatypes ((array!95087 0))(
  ( (array!95088 (arr!45909 (Array (_ BitVec 32) (_ BitVec 64))) (size!46459 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95087)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95087 (_ BitVec 32)) Bool)

(assert (=> b!1389955 (= res!930119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389956 () Bool)

(declare-fun res!930121 () Bool)

(assert (=> b!1389956 (=> (not res!930121) (not e!787214))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1389956 (= res!930121 (and (= (size!46459 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46459 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46459 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389957 () Bool)

(declare-fun res!930117 () Bool)

(assert (=> b!1389957 (=> (not res!930117) (not e!787214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389957 (= res!930117 (validKeyInArray!0 (select (arr!45909 a!2901) j!112)))))

(declare-fun b!1389958 () Bool)

(assert (=> b!1389958 (= e!787214 (not true))))

(assert (=> b!1389958 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46456 0))(
  ( (Unit!46457) )
))
(declare-fun lt!610685 () Unit!46456)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95087 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46456)

(assert (=> b!1389958 (= lt!610685 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10226 0))(
  ( (MissingZero!10226 (index!43275 (_ BitVec 32))) (Found!10226 (index!43276 (_ BitVec 32))) (Intermediate!10226 (undefined!11038 Bool) (index!43277 (_ BitVec 32)) (x!124960 (_ BitVec 32))) (Undefined!10226) (MissingVacant!10226 (index!43278 (_ BitVec 32))) )
))
(declare-fun lt!610686 () SeekEntryResult!10226)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95087 (_ BitVec 32)) SeekEntryResult!10226)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389958 (= lt!610686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45909 a!2901) j!112) mask!2840) (select (arr!45909 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389960 () Bool)

(declare-fun res!930118 () Bool)

(assert (=> b!1389960 (=> (not res!930118) (not e!787214))))

(declare-datatypes ((List!32428 0))(
  ( (Nil!32425) (Cons!32424 (h!33642 (_ BitVec 64)) (t!47122 List!32428)) )
))
(declare-fun arrayNoDuplicates!0 (array!95087 (_ BitVec 32) List!32428) Bool)

(assert (=> b!1389960 (= res!930118 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32425))))

(declare-fun res!930116 () Bool)

(assert (=> start!119150 (=> (not res!930116) (not e!787214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119150 (= res!930116 (validMask!0 mask!2840))))

(assert (=> start!119150 e!787214))

(assert (=> start!119150 true))

(declare-fun array_inv!34937 (array!95087) Bool)

(assert (=> start!119150 (array_inv!34937 a!2901)))

(declare-fun b!1389959 () Bool)

(declare-fun res!930120 () Bool)

(assert (=> b!1389959 (=> (not res!930120) (not e!787214))))

(assert (=> b!1389959 (= res!930120 (validKeyInArray!0 (select (arr!45909 a!2901) i!1037)))))

(assert (= (and start!119150 res!930116) b!1389956))

(assert (= (and b!1389956 res!930121) b!1389959))

(assert (= (and b!1389959 res!930120) b!1389957))

(assert (= (and b!1389957 res!930117) b!1389955))

(assert (= (and b!1389955 res!930119) b!1389960))

(assert (= (and b!1389960 res!930118) b!1389958))

(declare-fun m!1275687 () Bool)

(assert (=> b!1389958 m!1275687))

(declare-fun m!1275689 () Bool)

(assert (=> b!1389958 m!1275689))

(assert (=> b!1389958 m!1275687))

(declare-fun m!1275691 () Bool)

(assert (=> b!1389958 m!1275691))

(assert (=> b!1389958 m!1275689))

(assert (=> b!1389958 m!1275687))

(declare-fun m!1275693 () Bool)

(assert (=> b!1389958 m!1275693))

(declare-fun m!1275695 () Bool)

(assert (=> b!1389958 m!1275695))

(declare-fun m!1275697 () Bool)

(assert (=> b!1389955 m!1275697))

(declare-fun m!1275699 () Bool)

(assert (=> start!119150 m!1275699))

(declare-fun m!1275701 () Bool)

(assert (=> start!119150 m!1275701))

(declare-fun m!1275703 () Bool)

(assert (=> b!1389960 m!1275703))

(declare-fun m!1275705 () Bool)

(assert (=> b!1389959 m!1275705))

(assert (=> b!1389959 m!1275705))

(declare-fun m!1275707 () Bool)

(assert (=> b!1389959 m!1275707))

(assert (=> b!1389957 m!1275687))

(assert (=> b!1389957 m!1275687))

(declare-fun m!1275709 () Bool)

(assert (=> b!1389957 m!1275709))

(check-sat (not b!1389960) (not start!119150) (not b!1389959) (not b!1389955) (not b!1389957) (not b!1389958))
