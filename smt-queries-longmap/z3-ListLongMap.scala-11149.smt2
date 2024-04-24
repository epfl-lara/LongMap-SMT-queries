; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130638 () Bool)

(assert start!130638)

(declare-fun b!1531464 () Bool)

(declare-fun res!1047692 () Bool)

(declare-fun e!853641 () Bool)

(assert (=> b!1531464 (=> (not res!1047692) (not e!853641))))

(declare-datatypes ((SeekEntryResult!13139 0))(
  ( (MissingZero!13139 (index!54951 (_ BitVec 32))) (Found!13139 (index!54952 (_ BitVec 32))) (Intermediate!13139 (undefined!13951 Bool) (index!54953 (_ BitVec 32)) (x!136849 (_ BitVec 32))) (Undefined!13139) (MissingVacant!13139 (index!54954 (_ BitVec 32))) )
))
(declare-fun lt!663222 () SeekEntryResult!13139)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101725 0))(
  ( (array!101726 (arr!49081 (Array (_ BitVec 32) (_ BitVec 64))) (size!49632 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101725)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101725 (_ BitVec 32)) SeekEntryResult!13139)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531464 (= res!1047692 (= lt!663222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49081 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49081 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101726 (store (arr!49081 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49632 a!2804)) mask!2512)))))

(declare-fun b!1531465 () Bool)

(declare-fun res!1047691 () Bool)

(declare-fun e!853639 () Bool)

(assert (=> b!1531465 (=> (not res!1047691) (not e!853639))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1531465 (= res!1047691 (validKeyInArray!0 (select (arr!49081 a!2804) i!961)))))

(declare-fun b!1531466 () Bool)

(declare-fun res!1047686 () Bool)

(assert (=> b!1531466 (=> (not res!1047686) (not e!853639))))

(declare-datatypes ((List!35551 0))(
  ( (Nil!35548) (Cons!35547 (h!37001 (_ BitVec 64)) (t!50237 List!35551)) )
))
(declare-fun arrayNoDuplicates!0 (array!101725 (_ BitVec 32) List!35551) Bool)

(assert (=> b!1531466 (= res!1047686 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35548))))

(declare-fun b!1531467 () Bool)

(declare-fun res!1047687 () Bool)

(assert (=> b!1531467 (=> (not res!1047687) (not e!853639))))

(assert (=> b!1531467 (= res!1047687 (validKeyInArray!0 (select (arr!49081 a!2804) j!70)))))

(declare-fun b!1531468 () Bool)

(declare-fun e!853640 () Bool)

(assert (=> b!1531468 (= e!853640 true)))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!663221 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1531468 (= lt!663221 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1531469 () Bool)

(assert (=> b!1531469 (= e!853639 e!853641)))

(declare-fun res!1047690 () Bool)

(assert (=> b!1531469 (=> (not res!1047690) (not e!853641))))

(declare-fun lt!663219 () SeekEntryResult!13139)

(assert (=> b!1531469 (= res!1047690 (= lt!663222 lt!663219))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1531469 (= lt!663219 (Intermediate!13139 false resIndex!21 resX!21))))

(assert (=> b!1531469 (= lt!663222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49081 a!2804) j!70) mask!2512) (select (arr!49081 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1047688 () Bool)

(assert (=> start!130638 (=> (not res!1047688) (not e!853639))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130638 (= res!1047688 (validMask!0 mask!2512))))

(assert (=> start!130638 e!853639))

(assert (=> start!130638 true))

(declare-fun array_inv!38362 (array!101725) Bool)

(assert (=> start!130638 (array_inv!38362 a!2804)))

(declare-fun b!1531470 () Bool)

(declare-fun res!1047689 () Bool)

(assert (=> b!1531470 (=> (not res!1047689) (not e!853641))))

(assert (=> b!1531470 (= res!1047689 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49081 a!2804) j!70) a!2804 mask!2512) lt!663219))))

(declare-fun b!1531471 () Bool)

(declare-fun res!1047695 () Bool)

(assert (=> b!1531471 (=> (not res!1047695) (not e!853639))))

(assert (=> b!1531471 (= res!1047695 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49632 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49632 a!2804))))))

(declare-fun b!1531472 () Bool)

(declare-fun res!1047693 () Bool)

(assert (=> b!1531472 (=> (not res!1047693) (not e!853639))))

(assert (=> b!1531472 (= res!1047693 (and (= (size!49632 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49632 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49632 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1531473 () Bool)

(assert (=> b!1531473 (= e!853641 (not e!853640))))

(declare-fun res!1047694 () Bool)

(assert (=> b!1531473 (=> res!1047694 e!853640)))

(assert (=> b!1531473 (= res!1047694 (or (not (= (select (arr!49081 a!2804) j!70) (select (store (arr!49081 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!853638 () Bool)

(assert (=> b!1531473 e!853638))

(declare-fun res!1047685 () Bool)

(assert (=> b!1531473 (=> (not res!1047685) (not e!853638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101725 (_ BitVec 32)) Bool)

(assert (=> b!1531473 (= res!1047685 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51097 0))(
  ( (Unit!51098) )
))
(declare-fun lt!663220 () Unit!51097)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101725 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51097)

(assert (=> b!1531473 (= lt!663220 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1531474 () Bool)

(declare-fun res!1047696 () Bool)

(assert (=> b!1531474 (=> (not res!1047696) (not e!853639))))

(assert (=> b!1531474 (= res!1047696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1531475 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101725 (_ BitVec 32)) SeekEntryResult!13139)

(assert (=> b!1531475 (= e!853638 (= (seekEntry!0 (select (arr!49081 a!2804) j!70) a!2804 mask!2512) (Found!13139 j!70)))))

(assert (= (and start!130638 res!1047688) b!1531472))

(assert (= (and b!1531472 res!1047693) b!1531465))

(assert (= (and b!1531465 res!1047691) b!1531467))

(assert (= (and b!1531467 res!1047687) b!1531474))

(assert (= (and b!1531474 res!1047696) b!1531466))

(assert (= (and b!1531466 res!1047686) b!1531471))

(assert (= (and b!1531471 res!1047695) b!1531469))

(assert (= (and b!1531469 res!1047690) b!1531470))

(assert (= (and b!1531470 res!1047689) b!1531464))

(assert (= (and b!1531464 res!1047692) b!1531473))

(assert (= (and b!1531473 res!1047685) b!1531475))

(assert (= (and b!1531473 (not res!1047694)) b!1531468))

(declare-fun m!1414243 () Bool)

(assert (=> start!130638 m!1414243))

(declare-fun m!1414245 () Bool)

(assert (=> start!130638 m!1414245))

(declare-fun m!1414247 () Bool)

(assert (=> b!1531468 m!1414247))

(declare-fun m!1414249 () Bool)

(assert (=> b!1531473 m!1414249))

(declare-fun m!1414251 () Bool)

(assert (=> b!1531473 m!1414251))

(declare-fun m!1414253 () Bool)

(assert (=> b!1531473 m!1414253))

(declare-fun m!1414255 () Bool)

(assert (=> b!1531473 m!1414255))

(declare-fun m!1414257 () Bool)

(assert (=> b!1531473 m!1414257))

(assert (=> b!1531467 m!1414249))

(assert (=> b!1531467 m!1414249))

(declare-fun m!1414259 () Bool)

(assert (=> b!1531467 m!1414259))

(assert (=> b!1531464 m!1414253))

(assert (=> b!1531464 m!1414255))

(assert (=> b!1531464 m!1414255))

(declare-fun m!1414261 () Bool)

(assert (=> b!1531464 m!1414261))

(assert (=> b!1531464 m!1414261))

(assert (=> b!1531464 m!1414255))

(declare-fun m!1414263 () Bool)

(assert (=> b!1531464 m!1414263))

(assert (=> b!1531469 m!1414249))

(assert (=> b!1531469 m!1414249))

(declare-fun m!1414265 () Bool)

(assert (=> b!1531469 m!1414265))

(assert (=> b!1531469 m!1414265))

(assert (=> b!1531469 m!1414249))

(declare-fun m!1414267 () Bool)

(assert (=> b!1531469 m!1414267))

(declare-fun m!1414269 () Bool)

(assert (=> b!1531465 m!1414269))

(assert (=> b!1531465 m!1414269))

(declare-fun m!1414271 () Bool)

(assert (=> b!1531465 m!1414271))

(declare-fun m!1414273 () Bool)

(assert (=> b!1531474 m!1414273))

(assert (=> b!1531470 m!1414249))

(assert (=> b!1531470 m!1414249))

(declare-fun m!1414275 () Bool)

(assert (=> b!1531470 m!1414275))

(declare-fun m!1414277 () Bool)

(assert (=> b!1531466 m!1414277))

(assert (=> b!1531475 m!1414249))

(assert (=> b!1531475 m!1414249))

(declare-fun m!1414279 () Bool)

(assert (=> b!1531475 m!1414279))

(check-sat (not start!130638) (not b!1531473) (not b!1531474) (not b!1531470) (not b!1531469) (not b!1531468) (not b!1531464) (not b!1531465) (not b!1531467) (not b!1531475) (not b!1531466))
(check-sat)
