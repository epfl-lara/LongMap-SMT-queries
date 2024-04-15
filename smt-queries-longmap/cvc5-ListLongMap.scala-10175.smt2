; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119976 () Bool)

(assert start!119976)

(declare-fun b!1396609 () Bool)

(declare-fun e!790677 () Bool)

(assert (=> b!1396609 (= e!790677 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!613430 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10426 0))(
  ( (MissingZero!10426 (index!44075 (_ BitVec 32))) (Found!10426 (index!44076 (_ BitVec 32))) (Intermediate!10426 (undefined!11238 Bool) (index!44077 (_ BitVec 32)) (x!125733 (_ BitVec 32))) (Undefined!10426) (MissingVacant!10426 (index!44078 (_ BitVec 32))) )
))
(declare-fun lt!613432 () SeekEntryResult!10426)

(declare-datatypes ((array!95458 0))(
  ( (array!95459 (arr!46083 (Array (_ BitVec 32) (_ BitVec 64))) (size!46635 (_ BitVec 32))) )
))
(declare-fun lt!613435 () array!95458)

(declare-fun lt!613433 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95458 (_ BitVec 32)) SeekEntryResult!10426)

(assert (=> b!1396609 (= lt!613432 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613433 lt!613430 lt!613435 mask!2840))))

(declare-fun a!2901 () array!95458)

(declare-fun e!790676 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1396610 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95458 (_ BitVec 32)) SeekEntryResult!10426)

(assert (=> b!1396610 (= e!790676 (= (seekEntryOrOpen!0 (select (arr!46083 a!2901) j!112) a!2901 mask!2840) (Found!10426 j!112)))))

(declare-fun b!1396611 () Bool)

(declare-fun res!935578 () Bool)

(declare-fun e!790675 () Bool)

(assert (=> b!1396611 (=> (not res!935578) (not e!790675))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95458 (_ BitVec 32)) Bool)

(assert (=> b!1396611 (= res!935578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!935577 () Bool)

(assert (=> start!119976 (=> (not res!935577) (not e!790675))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119976 (= res!935577 (validMask!0 mask!2840))))

(assert (=> start!119976 e!790675))

(assert (=> start!119976 true))

(declare-fun array_inv!35316 (array!95458) Bool)

(assert (=> start!119976 (array_inv!35316 a!2901)))

(declare-fun b!1396612 () Bool)

(declare-fun e!790678 () Bool)

(assert (=> b!1396612 (= e!790675 (not e!790678))))

(declare-fun res!935576 () Bool)

(assert (=> b!1396612 (=> res!935576 e!790678)))

(declare-fun lt!613431 () SeekEntryResult!10426)

(assert (=> b!1396612 (= res!935576 (or (not (is-Intermediate!10426 lt!613431)) (undefined!11238 lt!613431)))))

(assert (=> b!1396612 e!790676))

(declare-fun res!935575 () Bool)

(assert (=> b!1396612 (=> (not res!935575) (not e!790676))))

(assert (=> b!1396612 (= res!935575 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46699 0))(
  ( (Unit!46700) )
))
(declare-fun lt!613434 () Unit!46699)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95458 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46699)

(assert (=> b!1396612 (= lt!613434 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396612 (= lt!613431 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613433 (select (arr!46083 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396612 (= lt!613433 (toIndex!0 (select (arr!46083 a!2901) j!112) mask!2840))))

(declare-fun b!1396613 () Bool)

(declare-fun res!935573 () Bool)

(assert (=> b!1396613 (=> (not res!935573) (not e!790675))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396613 (= res!935573 (validKeyInArray!0 (select (arr!46083 a!2901) j!112)))))

(declare-fun b!1396614 () Bool)

(declare-fun res!935579 () Bool)

(assert (=> b!1396614 (=> (not res!935579) (not e!790675))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1396614 (= res!935579 (validKeyInArray!0 (select (arr!46083 a!2901) i!1037)))))

(declare-fun b!1396615 () Bool)

(declare-fun res!935574 () Bool)

(assert (=> b!1396615 (=> (not res!935574) (not e!790675))))

(assert (=> b!1396615 (= res!935574 (and (= (size!46635 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46635 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46635 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396616 () Bool)

(assert (=> b!1396616 (= e!790678 e!790677)))

(declare-fun res!935581 () Bool)

(assert (=> b!1396616 (=> res!935581 e!790677)))

(declare-fun lt!613436 () SeekEntryResult!10426)

(assert (=> b!1396616 (= res!935581 (or (= lt!613431 lt!613436) (not (is-Intermediate!10426 lt!613436)) (bvslt (x!125733 lt!613431) #b00000000000000000000000000000000) (bvsgt (x!125733 lt!613431) #b01111111111111111111111111111110) (bvslt lt!613433 #b00000000000000000000000000000000) (bvsge lt!613433 (size!46635 a!2901)) (bvslt (index!44077 lt!613431) #b00000000000000000000000000000000) (bvsge (index!44077 lt!613431) (size!46635 a!2901)) (not (= lt!613431 (Intermediate!10426 false (index!44077 lt!613431) (x!125733 lt!613431)))) (not (= lt!613436 (Intermediate!10426 (undefined!11238 lt!613436) (index!44077 lt!613436) (x!125733 lt!613436))))))))

(assert (=> b!1396616 (= lt!613436 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613430 mask!2840) lt!613430 lt!613435 mask!2840))))

(assert (=> b!1396616 (= lt!613430 (select (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396616 (= lt!613435 (array!95459 (store (arr!46083 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46635 a!2901)))))

(declare-fun b!1396617 () Bool)

(declare-fun res!935580 () Bool)

(assert (=> b!1396617 (=> (not res!935580) (not e!790675))))

(declare-datatypes ((List!32680 0))(
  ( (Nil!32677) (Cons!32676 (h!33918 (_ BitVec 64)) (t!47366 List!32680)) )
))
(declare-fun arrayNoDuplicates!0 (array!95458 (_ BitVec 32) List!32680) Bool)

(assert (=> b!1396617 (= res!935580 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32677))))

(assert (= (and start!119976 res!935577) b!1396615))

(assert (= (and b!1396615 res!935574) b!1396614))

(assert (= (and b!1396614 res!935579) b!1396613))

(assert (= (and b!1396613 res!935573) b!1396611))

(assert (= (and b!1396611 res!935578) b!1396617))

(assert (= (and b!1396617 res!935580) b!1396612))

(assert (= (and b!1396612 res!935575) b!1396610))

(assert (= (and b!1396612 (not res!935576)) b!1396616))

(assert (= (and b!1396616 (not res!935581)) b!1396609))

(declare-fun m!1282675 () Bool)

(assert (=> b!1396614 m!1282675))

(assert (=> b!1396614 m!1282675))

(declare-fun m!1282677 () Bool)

(assert (=> b!1396614 m!1282677))

(declare-fun m!1282679 () Bool)

(assert (=> start!119976 m!1282679))

(declare-fun m!1282681 () Bool)

(assert (=> start!119976 m!1282681))

(declare-fun m!1282683 () Bool)

(assert (=> b!1396609 m!1282683))

(declare-fun m!1282685 () Bool)

(assert (=> b!1396613 m!1282685))

(assert (=> b!1396613 m!1282685))

(declare-fun m!1282687 () Bool)

(assert (=> b!1396613 m!1282687))

(declare-fun m!1282689 () Bool)

(assert (=> b!1396617 m!1282689))

(declare-fun m!1282691 () Bool)

(assert (=> b!1396611 m!1282691))

(declare-fun m!1282693 () Bool)

(assert (=> b!1396616 m!1282693))

(assert (=> b!1396616 m!1282693))

(declare-fun m!1282695 () Bool)

(assert (=> b!1396616 m!1282695))

(declare-fun m!1282697 () Bool)

(assert (=> b!1396616 m!1282697))

(declare-fun m!1282699 () Bool)

(assert (=> b!1396616 m!1282699))

(assert (=> b!1396610 m!1282685))

(assert (=> b!1396610 m!1282685))

(declare-fun m!1282701 () Bool)

(assert (=> b!1396610 m!1282701))

(assert (=> b!1396612 m!1282685))

(declare-fun m!1282703 () Bool)

(assert (=> b!1396612 m!1282703))

(assert (=> b!1396612 m!1282685))

(declare-fun m!1282705 () Bool)

(assert (=> b!1396612 m!1282705))

(assert (=> b!1396612 m!1282685))

(declare-fun m!1282707 () Bool)

(assert (=> b!1396612 m!1282707))

(declare-fun m!1282709 () Bool)

(assert (=> b!1396612 m!1282709))

(push 1)

(assert (not b!1396610))

(assert (not start!119976))

(assert (not b!1396612))

(assert (not b!1396614))

(assert (not b!1396613))

(assert (not b!1396617))

(assert (not b!1396616))

(assert (not b!1396611))

(assert (not b!1396609))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

