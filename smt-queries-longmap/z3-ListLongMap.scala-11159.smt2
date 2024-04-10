; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130438 () Bool)

(assert start!130438)

(declare-fun res!1048200 () Bool)

(declare-fun e!853036 () Bool)

(assert (=> start!130438 (=> (not res!1048200) (not e!853036))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130438 (= res!1048200 (validMask!0 mask!2512))))

(assert (=> start!130438 e!853036))

(assert (=> start!130438 true))

(declare-datatypes ((array!101674 0))(
  ( (array!101675 (arr!49059 (Array (_ BitVec 32) (_ BitVec 64))) (size!49609 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101674)

(declare-fun array_inv!38087 (array!101674) Bool)

(assert (=> start!130438 (array_inv!38087 a!2804)))

(declare-fun b!1530852 () Bool)

(declare-fun res!1048199 () Bool)

(assert (=> b!1530852 (=> (not res!1048199) (not e!853036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101674 (_ BitVec 32)) Bool)

(assert (=> b!1530852 (= res!1048199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1530853 () Bool)

(declare-fun e!853034 () Bool)

(declare-fun e!853035 () Bool)

(assert (=> b!1530853 (= e!853034 (not e!853035))))

(declare-fun res!1048193 () Bool)

(assert (=> b!1530853 (=> res!1048193 e!853035)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1530853 (= res!1048193 (or (not (= (select (arr!49059 a!2804) j!70) (select (store (arr!49059 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!853032 () Bool)

(assert (=> b!1530853 e!853032))

(declare-fun res!1048195 () Bool)

(assert (=> b!1530853 (=> (not res!1048195) (not e!853032))))

(assert (=> b!1530853 (= res!1048195 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51232 0))(
  ( (Unit!51233) )
))
(declare-fun lt!663007 () Unit!51232)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101674 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51232)

(assert (=> b!1530853 (= lt!663007 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1530854 () Bool)

(declare-datatypes ((SeekEntryResult!13224 0))(
  ( (MissingZero!13224 (index!55291 (_ BitVec 32))) (Found!13224 (index!55292 (_ BitVec 32))) (Intermediate!13224 (undefined!14036 Bool) (index!55293 (_ BitVec 32)) (x!136985 (_ BitVec 32))) (Undefined!13224) (MissingVacant!13224 (index!55294 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101674 (_ BitVec 32)) SeekEntryResult!13224)

(assert (=> b!1530854 (= e!853032 (= (seekEntry!0 (select (arr!49059 a!2804) j!70) a!2804 mask!2512) (Found!13224 j!70)))))

(declare-fun b!1530855 () Bool)

(declare-fun res!1048202 () Bool)

(assert (=> b!1530855 (=> (not res!1048202) (not e!853034))))

(declare-fun lt!663004 () SeekEntryResult!13224)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101674 (_ BitVec 32)) SeekEntryResult!13224)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530855 (= res!1048202 (= lt!663004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49059 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49059 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101675 (store (arr!49059 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49609 a!2804)) mask!2512)))))

(declare-fun b!1530856 () Bool)

(declare-fun res!1048201 () Bool)

(assert (=> b!1530856 (=> (not res!1048201) (not e!853036))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1530856 (= res!1048201 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49609 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49609 a!2804))))))

(declare-fun b!1530857 () Bool)

(declare-fun res!1048197 () Bool)

(assert (=> b!1530857 (=> (not res!1048197) (not e!853036))))

(declare-datatypes ((List!35542 0))(
  ( (Nil!35539) (Cons!35538 (h!36980 (_ BitVec 64)) (t!50236 List!35542)) )
))
(declare-fun arrayNoDuplicates!0 (array!101674 (_ BitVec 32) List!35542) Bool)

(assert (=> b!1530857 (= res!1048197 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35539))))

(declare-fun b!1530858 () Bool)

(declare-fun res!1048194 () Bool)

(assert (=> b!1530858 (=> (not res!1048194) (not e!853036))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1530858 (= res!1048194 (validKeyInArray!0 (select (arr!49059 a!2804) i!961)))))

(declare-fun b!1530859 () Bool)

(declare-fun res!1048204 () Bool)

(assert (=> b!1530859 (=> (not res!1048204) (not e!853036))))

(assert (=> b!1530859 (= res!1048204 (and (= (size!49609 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49609 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49609 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1530860 () Bool)

(assert (=> b!1530860 (= e!853036 e!853034)))

(declare-fun res!1048196 () Bool)

(assert (=> b!1530860 (=> (not res!1048196) (not e!853034))))

(declare-fun lt!663006 () SeekEntryResult!13224)

(assert (=> b!1530860 (= res!1048196 (= lt!663004 lt!663006))))

(assert (=> b!1530860 (= lt!663006 (Intermediate!13224 false resIndex!21 resX!21))))

(assert (=> b!1530860 (= lt!663004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49059 a!2804) j!70) mask!2512) (select (arr!49059 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1530861 () Bool)

(assert (=> b!1530861 (= e!853035 true)))

(declare-fun lt!663005 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1530861 (= lt!663005 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1530862 () Bool)

(declare-fun res!1048203 () Bool)

(assert (=> b!1530862 (=> (not res!1048203) (not e!853034))))

(assert (=> b!1530862 (= res!1048203 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49059 a!2804) j!70) a!2804 mask!2512) lt!663006))))

(declare-fun b!1530863 () Bool)

(declare-fun res!1048198 () Bool)

(assert (=> b!1530863 (=> (not res!1048198) (not e!853036))))

(assert (=> b!1530863 (= res!1048198 (validKeyInArray!0 (select (arr!49059 a!2804) j!70)))))

(assert (= (and start!130438 res!1048200) b!1530859))

(assert (= (and b!1530859 res!1048204) b!1530858))

(assert (= (and b!1530858 res!1048194) b!1530863))

(assert (= (and b!1530863 res!1048198) b!1530852))

(assert (= (and b!1530852 res!1048199) b!1530857))

(assert (= (and b!1530857 res!1048197) b!1530856))

(assert (= (and b!1530856 res!1048201) b!1530860))

(assert (= (and b!1530860 res!1048196) b!1530862))

(assert (= (and b!1530862 res!1048203) b!1530855))

(assert (= (and b!1530855 res!1048202) b!1530853))

(assert (= (and b!1530853 res!1048195) b!1530854))

(assert (= (and b!1530853 (not res!1048193)) b!1530861))

(declare-fun m!1413617 () Bool)

(assert (=> b!1530857 m!1413617))

(declare-fun m!1413619 () Bool)

(assert (=> b!1530855 m!1413619))

(declare-fun m!1413621 () Bool)

(assert (=> b!1530855 m!1413621))

(assert (=> b!1530855 m!1413621))

(declare-fun m!1413623 () Bool)

(assert (=> b!1530855 m!1413623))

(assert (=> b!1530855 m!1413623))

(assert (=> b!1530855 m!1413621))

(declare-fun m!1413625 () Bool)

(assert (=> b!1530855 m!1413625))

(declare-fun m!1413627 () Bool)

(assert (=> b!1530853 m!1413627))

(declare-fun m!1413629 () Bool)

(assert (=> b!1530853 m!1413629))

(assert (=> b!1530853 m!1413619))

(assert (=> b!1530853 m!1413621))

(declare-fun m!1413631 () Bool)

(assert (=> b!1530853 m!1413631))

(declare-fun m!1413633 () Bool)

(assert (=> b!1530852 m!1413633))

(assert (=> b!1530860 m!1413627))

(assert (=> b!1530860 m!1413627))

(declare-fun m!1413635 () Bool)

(assert (=> b!1530860 m!1413635))

(assert (=> b!1530860 m!1413635))

(assert (=> b!1530860 m!1413627))

(declare-fun m!1413637 () Bool)

(assert (=> b!1530860 m!1413637))

(declare-fun m!1413639 () Bool)

(assert (=> b!1530858 m!1413639))

(assert (=> b!1530858 m!1413639))

(declare-fun m!1413641 () Bool)

(assert (=> b!1530858 m!1413641))

(declare-fun m!1413643 () Bool)

(assert (=> b!1530861 m!1413643))

(assert (=> b!1530862 m!1413627))

(assert (=> b!1530862 m!1413627))

(declare-fun m!1413645 () Bool)

(assert (=> b!1530862 m!1413645))

(declare-fun m!1413647 () Bool)

(assert (=> start!130438 m!1413647))

(declare-fun m!1413649 () Bool)

(assert (=> start!130438 m!1413649))

(assert (=> b!1530854 m!1413627))

(assert (=> b!1530854 m!1413627))

(declare-fun m!1413651 () Bool)

(assert (=> b!1530854 m!1413651))

(assert (=> b!1530863 m!1413627))

(assert (=> b!1530863 m!1413627))

(declare-fun m!1413653 () Bool)

(assert (=> b!1530863 m!1413653))

(check-sat (not b!1530857) (not b!1530854) (not b!1530860) (not b!1530853) (not b!1530858) (not start!130438) (not b!1530855) (not b!1530852) (not b!1530863) (not b!1530862) (not b!1530861))
(check-sat)
