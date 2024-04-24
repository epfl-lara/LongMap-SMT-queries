; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119808 () Bool)

(assert start!119808)

(declare-fun b!1394519 () Bool)

(declare-fun res!933246 () Bool)

(declare-fun e!789728 () Bool)

(assert (=> b!1394519 (=> (not res!933246) (not e!789728))))

(declare-datatypes ((array!95412 0))(
  ( (array!95413 (arr!46062 (Array (_ BitVec 32) (_ BitVec 64))) (size!46613 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95412)

(declare-datatypes ((List!32568 0))(
  ( (Nil!32565) (Cons!32564 (h!33805 (_ BitVec 64)) (t!47254 List!32568)) )
))
(declare-fun arrayNoDuplicates!0 (array!95412 (_ BitVec 32) List!32568) Bool)

(assert (=> b!1394519 (= res!933246 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32565))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1394520 () Bool)

(declare-fun e!789726 () Bool)

(declare-datatypes ((SeekEntryResult!10282 0))(
  ( (MissingZero!10282 (index!43499 (_ BitVec 32))) (Found!10282 (index!43500 (_ BitVec 32))) (Intermediate!10282 (undefined!11094 Bool) (index!43501 (_ BitVec 32)) (x!125329 (_ BitVec 32))) (Undefined!10282) (MissingVacant!10282 (index!43502 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95412 (_ BitVec 32)) SeekEntryResult!10282)

(assert (=> b!1394520 (= e!789726 (= (seekEntryOrOpen!0 (select (arr!46062 a!2901) j!112) a!2901 mask!2840) (Found!10282 j!112)))))

(declare-fun b!1394521 () Bool)

(declare-fun res!933247 () Bool)

(assert (=> b!1394521 (=> (not res!933247) (not e!789728))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394521 (= res!933247 (validKeyInArray!0 (select (arr!46062 a!2901) i!1037)))))

(declare-fun b!1394522 () Bool)

(declare-fun res!933244 () Bool)

(assert (=> b!1394522 (=> (not res!933244) (not e!789728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95412 (_ BitVec 32)) Bool)

(assert (=> b!1394522 (= res!933244 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394524 () Bool)

(declare-fun e!789727 () Bool)

(assert (=> b!1394524 (= e!789728 (not e!789727))))

(declare-fun res!933250 () Bool)

(assert (=> b!1394524 (=> res!933250 e!789727)))

(declare-fun lt!612366 () SeekEntryResult!10282)

(assert (=> b!1394524 (= res!933250 (or (not (is-Intermediate!10282 lt!612366)) (undefined!11094 lt!612366)))))

(assert (=> b!1394524 e!789726))

(declare-fun res!933245 () Bool)

(assert (=> b!1394524 (=> (not res!933245) (not e!789726))))

(assert (=> b!1394524 (= res!933245 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46595 0))(
  ( (Unit!46596) )
))
(declare-fun lt!612367 () Unit!46595)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95412 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46595)

(assert (=> b!1394524 (= lt!612367 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95412 (_ BitVec 32)) SeekEntryResult!10282)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394524 (= lt!612366 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46062 a!2901) j!112) mask!2840) (select (arr!46062 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394525 () Bool)

(declare-fun res!933243 () Bool)

(assert (=> b!1394525 (=> (not res!933243) (not e!789728))))

(assert (=> b!1394525 (= res!933243 (validKeyInArray!0 (select (arr!46062 a!2901) j!112)))))

(declare-fun b!1394526 () Bool)

(declare-fun res!933248 () Bool)

(assert (=> b!1394526 (=> (not res!933248) (not e!789728))))

(assert (=> b!1394526 (= res!933248 (and (= (size!46613 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46613 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46613 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!933249 () Bool)

(assert (=> start!119808 (=> (not res!933249) (not e!789728))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119808 (= res!933249 (validMask!0 mask!2840))))

(assert (=> start!119808 e!789728))

(assert (=> start!119808 true))

(declare-fun array_inv!35343 (array!95412) Bool)

(assert (=> start!119808 (array_inv!35343 a!2901)))

(declare-fun b!1394523 () Bool)

(assert (=> b!1394523 (= e!789727 true)))

(declare-fun lt!612368 () SeekEntryResult!10282)

(assert (=> b!1394523 (= lt!612368 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46062 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46062 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95413 (store (arr!46062 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46613 a!2901)) mask!2840))))

(assert (= (and start!119808 res!933249) b!1394526))

(assert (= (and b!1394526 res!933248) b!1394521))

(assert (= (and b!1394521 res!933247) b!1394525))

(assert (= (and b!1394525 res!933243) b!1394522))

(assert (= (and b!1394522 res!933244) b!1394519))

(assert (= (and b!1394519 res!933246) b!1394524))

(assert (= (and b!1394524 res!933245) b!1394520))

(assert (= (and b!1394524 (not res!933250)) b!1394523))

(declare-fun m!1280637 () Bool)

(assert (=> b!1394523 m!1280637))

(declare-fun m!1280639 () Bool)

(assert (=> b!1394523 m!1280639))

(assert (=> b!1394523 m!1280639))

(declare-fun m!1280641 () Bool)

(assert (=> b!1394523 m!1280641))

(assert (=> b!1394523 m!1280641))

(assert (=> b!1394523 m!1280639))

(declare-fun m!1280643 () Bool)

(assert (=> b!1394523 m!1280643))

(declare-fun m!1280645 () Bool)

(assert (=> b!1394522 m!1280645))

(declare-fun m!1280647 () Bool)

(assert (=> b!1394520 m!1280647))

(assert (=> b!1394520 m!1280647))

(declare-fun m!1280649 () Bool)

(assert (=> b!1394520 m!1280649))

(declare-fun m!1280651 () Bool)

(assert (=> b!1394519 m!1280651))

(declare-fun m!1280653 () Bool)

(assert (=> start!119808 m!1280653))

(declare-fun m!1280655 () Bool)

(assert (=> start!119808 m!1280655))

(assert (=> b!1394525 m!1280647))

(assert (=> b!1394525 m!1280647))

(declare-fun m!1280657 () Bool)

(assert (=> b!1394525 m!1280657))

(assert (=> b!1394524 m!1280647))

(declare-fun m!1280659 () Bool)

(assert (=> b!1394524 m!1280659))

(assert (=> b!1394524 m!1280647))

(declare-fun m!1280661 () Bool)

(assert (=> b!1394524 m!1280661))

(assert (=> b!1394524 m!1280659))

(assert (=> b!1394524 m!1280647))

(declare-fun m!1280663 () Bool)

(assert (=> b!1394524 m!1280663))

(declare-fun m!1280665 () Bool)

(assert (=> b!1394524 m!1280665))

(declare-fun m!1280667 () Bool)

(assert (=> b!1394521 m!1280667))

(assert (=> b!1394521 m!1280667))

(declare-fun m!1280669 () Bool)

(assert (=> b!1394521 m!1280669))

(push 1)

(assert (not b!1394525))

(assert (not b!1394521))

(assert (not b!1394523))

(assert (not b!1394524))

(assert (not b!1394519))

(assert (not b!1394520))

(assert (not start!119808))

(assert (not b!1394522))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

