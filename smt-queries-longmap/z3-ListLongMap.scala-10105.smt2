; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119126 () Bool)

(assert start!119126)

(declare-fun b!1389739 () Bool)

(declare-fun e!787142 () Bool)

(assert (=> b!1389739 (= e!787142 false)))

(declare-datatypes ((array!95063 0))(
  ( (array!95064 (arr!45897 (Array (_ BitVec 32) (_ BitVec 64))) (size!46447 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95063)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10214 0))(
  ( (MissingZero!10214 (index!43227 (_ BitVec 32))) (Found!10214 (index!43228 (_ BitVec 32))) (Intermediate!10214 (undefined!11026 Bool) (index!43229 (_ BitVec 32)) (x!124916 (_ BitVec 32))) (Undefined!10214) (MissingVacant!10214 (index!43230 (_ BitVec 32))) )
))
(declare-fun lt!610617 () SeekEntryResult!10214)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95063 (_ BitVec 32)) SeekEntryResult!10214)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1389739 (= lt!610617 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45897 a!2901) j!112) mask!2840) (select (arr!45897 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1389740 () Bool)

(declare-fun res!929902 () Bool)

(assert (=> b!1389740 (=> (not res!929902) (not e!787142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1389740 (= res!929902 (validKeyInArray!0 (select (arr!45897 a!2901) j!112)))))

(declare-fun res!929903 () Bool)

(assert (=> start!119126 (=> (not res!929903) (not e!787142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119126 (= res!929903 (validMask!0 mask!2840))))

(assert (=> start!119126 e!787142))

(assert (=> start!119126 true))

(declare-fun array_inv!34925 (array!95063) Bool)

(assert (=> start!119126 (array_inv!34925 a!2901)))

(declare-fun b!1389741 () Bool)

(declare-fun res!929905 () Bool)

(assert (=> b!1389741 (=> (not res!929905) (not e!787142))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1389741 (= res!929905 (and (= (size!46447 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46447 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46447 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1389742 () Bool)

(declare-fun res!929904 () Bool)

(assert (=> b!1389742 (=> (not res!929904) (not e!787142))))

(assert (=> b!1389742 (= res!929904 (validKeyInArray!0 (select (arr!45897 a!2901) i!1037)))))

(declare-fun b!1389743 () Bool)

(declare-fun res!929901 () Bool)

(assert (=> b!1389743 (=> (not res!929901) (not e!787142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95063 (_ BitVec 32)) Bool)

(assert (=> b!1389743 (= res!929901 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1389744 () Bool)

(declare-fun res!929900 () Bool)

(assert (=> b!1389744 (=> (not res!929900) (not e!787142))))

(declare-datatypes ((List!32416 0))(
  ( (Nil!32413) (Cons!32412 (h!33630 (_ BitVec 64)) (t!47110 List!32416)) )
))
(declare-fun arrayNoDuplicates!0 (array!95063 (_ BitVec 32) List!32416) Bool)

(assert (=> b!1389744 (= res!929900 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32413))))

(assert (= (and start!119126 res!929903) b!1389741))

(assert (= (and b!1389741 res!929905) b!1389742))

(assert (= (and b!1389742 res!929904) b!1389740))

(assert (= (and b!1389740 res!929902) b!1389743))

(assert (= (and b!1389743 res!929901) b!1389744))

(assert (= (and b!1389744 res!929900) b!1389739))

(declare-fun m!1275407 () Bool)

(assert (=> b!1389740 m!1275407))

(assert (=> b!1389740 m!1275407))

(declare-fun m!1275409 () Bool)

(assert (=> b!1389740 m!1275409))

(declare-fun m!1275411 () Bool)

(assert (=> b!1389742 m!1275411))

(assert (=> b!1389742 m!1275411))

(declare-fun m!1275413 () Bool)

(assert (=> b!1389742 m!1275413))

(declare-fun m!1275415 () Bool)

(assert (=> start!119126 m!1275415))

(declare-fun m!1275417 () Bool)

(assert (=> start!119126 m!1275417))

(declare-fun m!1275419 () Bool)

(assert (=> b!1389743 m!1275419))

(declare-fun m!1275421 () Bool)

(assert (=> b!1389744 m!1275421))

(assert (=> b!1389739 m!1275407))

(assert (=> b!1389739 m!1275407))

(declare-fun m!1275423 () Bool)

(assert (=> b!1389739 m!1275423))

(assert (=> b!1389739 m!1275423))

(assert (=> b!1389739 m!1275407))

(declare-fun m!1275425 () Bool)

(assert (=> b!1389739 m!1275425))

(check-sat (not b!1389742) (not b!1389743) (not start!119126) (not b!1389739) (not b!1389740) (not b!1389744))
