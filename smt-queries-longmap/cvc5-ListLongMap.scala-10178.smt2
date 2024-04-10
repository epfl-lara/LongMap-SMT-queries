; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119994 () Bool)

(assert start!119994)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95523 0))(
  ( (array!95524 (arr!46115 (Array (_ BitVec 32) (_ BitVec 64))) (size!46665 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95523)

(declare-fun b!1396879 () Bool)

(declare-fun e!790821 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10432 0))(
  ( (MissingZero!10432 (index!44099 (_ BitVec 32))) (Found!10432 (index!44100 (_ BitVec 32))) (Intermediate!10432 (undefined!11244 Bool) (index!44101 (_ BitVec 32)) (x!125766 (_ BitVec 32))) (Undefined!10432) (MissingVacant!10432 (index!44102 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95523 (_ BitVec 32)) SeekEntryResult!10432)

(assert (=> b!1396879 (= e!790821 (= (seekEntryOrOpen!0 (select (arr!46115 a!2901) j!112) a!2901 mask!2840) (Found!10432 j!112)))))

(declare-fun b!1396880 () Bool)

(declare-fun e!790820 () Bool)

(assert (=> b!1396880 (= e!790820 true)))

(declare-fun lt!613772 () (_ BitVec 32))

(declare-fun lt!613768 () array!95523)

(declare-fun lt!613773 () SeekEntryResult!10432)

(declare-fun lt!613770 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95523 (_ BitVec 32)) SeekEntryResult!10432)

(assert (=> b!1396880 (= lt!613773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613772 lt!613770 lt!613768 mask!2840))))

(declare-fun b!1396881 () Bool)

(declare-fun e!790823 () Bool)

(assert (=> b!1396881 (= e!790823 e!790820)))

(declare-fun res!935799 () Bool)

(assert (=> b!1396881 (=> res!935799 e!790820)))

(declare-fun lt!613767 () SeekEntryResult!10432)

(declare-fun lt!613771 () SeekEntryResult!10432)

(assert (=> b!1396881 (= res!935799 (or (= lt!613767 lt!613771) (not (is-Intermediate!10432 lt!613771)) (bvslt (x!125766 lt!613767) #b00000000000000000000000000000000) (bvsgt (x!125766 lt!613767) #b01111111111111111111111111111110) (bvslt lt!613772 #b00000000000000000000000000000000) (bvsge lt!613772 (size!46665 a!2901)) (bvslt (index!44101 lt!613767) #b00000000000000000000000000000000) (bvsge (index!44101 lt!613767) (size!46665 a!2901)) (not (= lt!613767 (Intermediate!10432 false (index!44101 lt!613767) (x!125766 lt!613767)))) (not (= lt!613771 (Intermediate!10432 (undefined!11244 lt!613771) (index!44101 lt!613771) (x!125766 lt!613771))))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396881 (= lt!613771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!613770 mask!2840) lt!613770 lt!613768 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1396881 (= lt!613770 (select (store (arr!46115 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1396881 (= lt!613768 (array!95524 (store (arr!46115 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46665 a!2901)))))

(declare-fun b!1396882 () Bool)

(declare-fun res!935796 () Bool)

(declare-fun e!790819 () Bool)

(assert (=> b!1396882 (=> (not res!935796) (not e!790819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95523 (_ BitVec 32)) Bool)

(assert (=> b!1396882 (= res!935796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1396883 () Bool)

(declare-fun res!935798 () Bool)

(assert (=> b!1396883 (=> (not res!935798) (not e!790819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396883 (= res!935798 (validKeyInArray!0 (select (arr!46115 a!2901) j!112)))))

(declare-fun b!1396884 () Bool)

(declare-fun res!935797 () Bool)

(assert (=> b!1396884 (=> (not res!935797) (not e!790819))))

(assert (=> b!1396884 (= res!935797 (validKeyInArray!0 (select (arr!46115 a!2901) i!1037)))))

(declare-fun res!935795 () Bool)

(assert (=> start!119994 (=> (not res!935795) (not e!790819))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119994 (= res!935795 (validMask!0 mask!2840))))

(assert (=> start!119994 e!790819))

(assert (=> start!119994 true))

(declare-fun array_inv!35143 (array!95523) Bool)

(assert (=> start!119994 (array_inv!35143 a!2901)))

(declare-fun b!1396885 () Bool)

(declare-fun res!935800 () Bool)

(assert (=> b!1396885 (=> (not res!935800) (not e!790819))))

(declare-datatypes ((List!32634 0))(
  ( (Nil!32631) (Cons!32630 (h!33872 (_ BitVec 64)) (t!47328 List!32634)) )
))
(declare-fun arrayNoDuplicates!0 (array!95523 (_ BitVec 32) List!32634) Bool)

(assert (=> b!1396885 (= res!935800 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32631))))

(declare-fun b!1396886 () Bool)

(assert (=> b!1396886 (= e!790819 (not e!790823))))

(declare-fun res!935793 () Bool)

(assert (=> b!1396886 (=> res!935793 e!790823)))

(assert (=> b!1396886 (= res!935793 (or (not (is-Intermediate!10432 lt!613767)) (undefined!11244 lt!613767)))))

(assert (=> b!1396886 e!790821))

(declare-fun res!935794 () Bool)

(assert (=> b!1396886 (=> (not res!935794) (not e!790821))))

(assert (=> b!1396886 (= res!935794 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46868 0))(
  ( (Unit!46869) )
))
(declare-fun lt!613769 () Unit!46868)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95523 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46868)

(assert (=> b!1396886 (= lt!613769 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1396886 (= lt!613767 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!613772 (select (arr!46115 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1396886 (= lt!613772 (toIndex!0 (select (arr!46115 a!2901) j!112) mask!2840))))

(declare-fun b!1396887 () Bool)

(declare-fun res!935792 () Bool)

(assert (=> b!1396887 (=> (not res!935792) (not e!790819))))

(assert (=> b!1396887 (= res!935792 (and (= (size!46665 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46665 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46665 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!119994 res!935795) b!1396887))

(assert (= (and b!1396887 res!935792) b!1396884))

(assert (= (and b!1396884 res!935797) b!1396883))

(assert (= (and b!1396883 res!935798) b!1396882))

(assert (= (and b!1396882 res!935796) b!1396885))

(assert (= (and b!1396885 res!935800) b!1396886))

(assert (= (and b!1396886 res!935794) b!1396879))

(assert (= (and b!1396886 (not res!935793)) b!1396881))

(assert (= (and b!1396881 (not res!935799)) b!1396880))

(declare-fun m!1283463 () Bool)

(assert (=> b!1396881 m!1283463))

(assert (=> b!1396881 m!1283463))

(declare-fun m!1283465 () Bool)

(assert (=> b!1396881 m!1283465))

(declare-fun m!1283467 () Bool)

(assert (=> b!1396881 m!1283467))

(declare-fun m!1283469 () Bool)

(assert (=> b!1396881 m!1283469))

(declare-fun m!1283471 () Bool)

(assert (=> b!1396879 m!1283471))

(assert (=> b!1396879 m!1283471))

(declare-fun m!1283473 () Bool)

(assert (=> b!1396879 m!1283473))

(declare-fun m!1283475 () Bool)

(assert (=> b!1396884 m!1283475))

(assert (=> b!1396884 m!1283475))

(declare-fun m!1283477 () Bool)

(assert (=> b!1396884 m!1283477))

(assert (=> b!1396883 m!1283471))

(assert (=> b!1396883 m!1283471))

(declare-fun m!1283479 () Bool)

(assert (=> b!1396883 m!1283479))

(declare-fun m!1283481 () Bool)

(assert (=> b!1396880 m!1283481))

(assert (=> b!1396886 m!1283471))

(declare-fun m!1283483 () Bool)

(assert (=> b!1396886 m!1283483))

(assert (=> b!1396886 m!1283471))

(declare-fun m!1283485 () Bool)

(assert (=> b!1396886 m!1283485))

(assert (=> b!1396886 m!1283471))

(declare-fun m!1283487 () Bool)

(assert (=> b!1396886 m!1283487))

(declare-fun m!1283489 () Bool)

(assert (=> b!1396886 m!1283489))

(declare-fun m!1283491 () Bool)

(assert (=> b!1396882 m!1283491))

(declare-fun m!1283493 () Bool)

(assert (=> b!1396885 m!1283493))

(declare-fun m!1283495 () Bool)

(assert (=> start!119994 m!1283495))

(declare-fun m!1283497 () Bool)

(assert (=> start!119994 m!1283497))

(push 1)

