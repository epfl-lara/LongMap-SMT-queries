; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130520 () Bool)

(assert start!130520)

(declare-fun b!1531579 () Bool)

(declare-fun e!853406 () Bool)

(declare-fun e!853410 () Bool)

(assert (=> b!1531579 (= e!853406 (not e!853410))))

(declare-fun res!1048719 () Bool)

(assert (=> b!1531579 (=> res!1048719 e!853410)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((array!101699 0))(
  ( (array!101700 (arr!49070 (Array (_ BitVec 32) (_ BitVec 64))) (size!49620 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101699)

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1531579 (= res!1048719 (or (not (= (select (arr!49070 a!2804) j!70) (select (store (arr!49070 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!853407 () Bool)

(assert (=> b!1531579 e!853407))

(declare-fun res!1048720 () Bool)

(assert (=> b!1531579 (=> (not res!1048720) (not e!853407))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101699 (_ BitVec 32)) Bool)

(assert (=> b!1531579 (= res!1048720 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51254 0))(
  ( (Unit!51255) )
))
(declare-fun lt!663295 () Unit!51254)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51254)

(assert (=> b!1531579 (= lt!663295 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531580 () Bool)

(declare-fun res!1048731 () Bool)

(assert (=> b!1531580 (=> (not res!1048731) (not e!853406))))

(declare-datatypes ((SeekEntryResult!13235 0))(
  ( (MissingZero!13235 (index!55335 (_ BitVec 32))) (Found!13235 (index!55336 (_ BitVec 32))) (Intermediate!13235 (undefined!14047 Bool) (index!55337 (_ BitVec 32)) (x!137037 (_ BitVec 32))) (Undefined!13235) (MissingVacant!13235 (index!55338 (_ BitVec 32))) )
))
(declare-fun lt!663296 () SeekEntryResult!13235)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101699 (_ BitVec 32)) SeekEntryResult!13235)

(assert (=> b!1531580 (= res!1048731 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49070 a!2804) j!70) a!2804 mask!2512) lt!663296))))

(declare-fun b!1531581 () Bool)

(declare-fun res!1048721 () Bool)

(declare-fun e!853408 () Bool)

(assert (=> b!1531581 (=> res!1048721 e!853408)))

(declare-fun lt!663297 () (_ BitVec 32))

(assert (=> b!1531581 (= res!1048721 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!663297 (select (arr!49070 a!2804) j!70) a!2804 mask!2512) lt!663296)))))

(declare-fun b!1531583 () Bool)

(declare-fun res!1048728 () Bool)

(declare-fun e!853409 () Bool)

(assert (=> b!1531583 (=> (not res!1048728) (not e!853409))))

(declare-datatypes ((List!35553 0))(
  ( (Nil!35550) (Cons!35549 (h!36994 (_ BitVec 64)) (t!50247 List!35553)) )
))
(declare-fun arrayNoDuplicates!0 (array!101699 (_ BitVec 32) List!35553) Bool)

(assert (=> b!1531583 (= res!1048728 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35550))))

(declare-fun b!1531584 () Bool)

(declare-fun res!1048722 () Bool)

(assert (=> b!1531584 (=> (not res!1048722) (not e!853409))))

(assert (=> b!1531584 (= res!1048722 (and (= (size!49620 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49620 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49620 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531585 () Bool)

(declare-fun res!1048723 () Bool)

(assert (=> b!1531585 (=> (not res!1048723) (not e!853409))))

(assert (=> b!1531585 (= res!1048723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531586 () Bool)

(assert (=> b!1531586 (= e!853408 (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!534)) (bvsub #b01111111111111111111111111111110 x!534)))))

(declare-fun b!1531587 () Bool)

(declare-fun res!1048725 () Bool)

(assert (=> b!1531587 (=> (not res!1048725) (not e!853409))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531587 (= res!1048725 (validKeyInArray!0 (select (arr!49070 a!2804) j!70)))))

(declare-fun b!1531588 () Bool)

(declare-fun res!1048732 () Bool)

(assert (=> b!1531588 (=> (not res!1048732) (not e!853409))))

(assert (=> b!1531588 (= res!1048732 (validKeyInArray!0 (select (arr!49070 a!2804) i!961)))))

(declare-fun b!1531589 () Bool)

(declare-fun res!1048726 () Bool)

(assert (=> b!1531589 (=> (not res!1048726) (not e!853406))))

(declare-fun lt!663298 () SeekEntryResult!13235)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531589 (= res!1048726 (= lt!663298 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49070 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49070 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101700 (store (arr!49070 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49620 a!2804)) mask!2512)))))

(declare-fun b!1531590 () Bool)

(assert (=> b!1531590 (= e!853409 e!853406)))

(declare-fun res!1048727 () Bool)

(assert (=> b!1531590 (=> (not res!1048727) (not e!853406))))

(assert (=> b!1531590 (= res!1048727 (= lt!663298 lt!663296))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1531590 (= lt!663296 (Intermediate!13235 false resIndex!21 resX!21))))

(assert (=> b!1531590 (= lt!663298 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49070 a!2804) j!70) mask!2512) (select (arr!49070 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1531591 () Bool)

(assert (=> b!1531591 (= e!853410 e!853408)))

(declare-fun res!1048729 () Bool)

(assert (=> b!1531591 (=> res!1048729 e!853408)))

(assert (=> b!1531591 (= res!1048729 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!663297 #b00000000000000000000000000000000) (bvsge lt!663297 (size!49620 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531591 (= lt!663297 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1531592 () Bool)

(declare-fun res!1048724 () Bool)

(assert (=> b!1531592 (=> (not res!1048724) (not e!853409))))

(assert (=> b!1531592 (= res!1048724 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49620 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49620 a!2804))))))

(declare-fun res!1048730 () Bool)

(assert (=> start!130520 (=> (not res!1048730) (not e!853409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130520 (= res!1048730 (validMask!0 mask!2512))))

(assert (=> start!130520 e!853409))

(assert (=> start!130520 true))

(declare-fun array_inv!38098 (array!101699) Bool)

(assert (=> start!130520 (array_inv!38098 a!2804)))

(declare-fun b!1531582 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101699 (_ BitVec 32)) SeekEntryResult!13235)

(assert (=> b!1531582 (= e!853407 (= (seekEntry!0 (select (arr!49070 a!2804) j!70) a!2804 mask!2512) (Found!13235 j!70)))))

(assert (= (and start!130520 res!1048730) b!1531584))

(assert (= (and b!1531584 res!1048722) b!1531588))

(assert (= (and b!1531588 res!1048732) b!1531587))

(assert (= (and b!1531587 res!1048725) b!1531585))

(assert (= (and b!1531585 res!1048723) b!1531583))

(assert (= (and b!1531583 res!1048728) b!1531592))

(assert (= (and b!1531592 res!1048724) b!1531590))

(assert (= (and b!1531590 res!1048727) b!1531580))

(assert (= (and b!1531580 res!1048731) b!1531589))

(assert (= (and b!1531589 res!1048726) b!1531579))

(assert (= (and b!1531579 res!1048720) b!1531582))

(assert (= (and b!1531579 (not res!1048719)) b!1531591))

(assert (= (and b!1531591 (not res!1048729)) b!1531581))

(assert (= (and b!1531581 (not res!1048721)) b!1531586))

(declare-fun m!1414239 () Bool)

(assert (=> b!1531590 m!1414239))

(assert (=> b!1531590 m!1414239))

(declare-fun m!1414241 () Bool)

(assert (=> b!1531590 m!1414241))

(assert (=> b!1531590 m!1414241))

(assert (=> b!1531590 m!1414239))

(declare-fun m!1414243 () Bool)

(assert (=> b!1531590 m!1414243))

(assert (=> b!1531581 m!1414239))

(assert (=> b!1531581 m!1414239))

(declare-fun m!1414245 () Bool)

(assert (=> b!1531581 m!1414245))

(declare-fun m!1414247 () Bool)

(assert (=> b!1531591 m!1414247))

(assert (=> b!1531579 m!1414239))

(declare-fun m!1414249 () Bool)

(assert (=> b!1531579 m!1414249))

(declare-fun m!1414251 () Bool)

(assert (=> b!1531579 m!1414251))

(declare-fun m!1414253 () Bool)

(assert (=> b!1531579 m!1414253))

(declare-fun m!1414255 () Bool)

(assert (=> b!1531579 m!1414255))

(assert (=> b!1531582 m!1414239))

(assert (=> b!1531582 m!1414239))

(declare-fun m!1414257 () Bool)

(assert (=> b!1531582 m!1414257))

(declare-fun m!1414259 () Bool)

(assert (=> b!1531583 m!1414259))

(assert (=> b!1531580 m!1414239))

(assert (=> b!1531580 m!1414239))

(declare-fun m!1414261 () Bool)

(assert (=> b!1531580 m!1414261))

(assert (=> b!1531589 m!1414251))

(assert (=> b!1531589 m!1414253))

(assert (=> b!1531589 m!1414253))

(declare-fun m!1414263 () Bool)

(assert (=> b!1531589 m!1414263))

(assert (=> b!1531589 m!1414263))

(assert (=> b!1531589 m!1414253))

(declare-fun m!1414265 () Bool)

(assert (=> b!1531589 m!1414265))

(declare-fun m!1414267 () Bool)

(assert (=> start!130520 m!1414267))

(declare-fun m!1414269 () Bool)

(assert (=> start!130520 m!1414269))

(declare-fun m!1414271 () Bool)

(assert (=> b!1531588 m!1414271))

(assert (=> b!1531588 m!1414271))

(declare-fun m!1414273 () Bool)

(assert (=> b!1531588 m!1414273))

(assert (=> b!1531587 m!1414239))

(assert (=> b!1531587 m!1414239))

(declare-fun m!1414275 () Bool)

(assert (=> b!1531587 m!1414275))

(declare-fun m!1414277 () Bool)

(assert (=> b!1531585 m!1414277))

(push 1)

(assert (not b!1531581))

(assert (not b!1531580))

(assert (not b!1531590))

(assert (not b!1531591))

(assert (not b!1531582))

(assert (not b!1531583))

(assert (not b!1531588))

(assert (not b!1531587))

(assert (not b!1531589))

(assert (not b!1531579))

(assert (not start!130520))

(assert (not b!1531585))

(check-sat)

(pop 1)

(push 1)

(check-sat)

