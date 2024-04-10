; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120358 () Bool)

(assert start!120358)

(declare-fun b!1400915 () Bool)

(declare-fun res!939434 () Bool)

(declare-fun e!793204 () Bool)

(assert (=> b!1400915 (=> (not res!939434) (not e!793204))))

(declare-datatypes ((array!95767 0))(
  ( (array!95768 (arr!46234 (Array (_ BitVec 32) (_ BitVec 64))) (size!46784 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95767)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400915 (= res!939434 (validKeyInArray!0 (select (arr!46234 a!2901) i!1037)))))

(declare-fun b!1400916 () Bool)

(declare-fun e!793203 () Bool)

(assert (=> b!1400916 (= e!793203 true)))

(declare-fun lt!616550 () (_ BitVec 64))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!616553 () (_ BitVec 32))

(declare-fun lt!616557 () array!95767)

(declare-datatypes ((SeekEntryResult!10551 0))(
  ( (MissingZero!10551 (index!44581 (_ BitVec 32))) (Found!10551 (index!44582 (_ BitVec 32))) (Intermediate!10551 (undefined!11363 Bool) (index!44583 (_ BitVec 32)) (x!126218 (_ BitVec 32))) (Undefined!10551) (MissingVacant!10551 (index!44584 (_ BitVec 32))) )
))
(declare-fun lt!616552 () SeekEntryResult!10551)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95767 (_ BitVec 32)) SeekEntryResult!10551)

(assert (=> b!1400916 (= lt!616552 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616553 lt!616550 lt!616557 mask!2840))))

(declare-fun b!1400917 () Bool)

(declare-fun e!793200 () Bool)

(assert (=> b!1400917 (= e!793204 (not e!793200))))

(declare-fun res!939426 () Bool)

(assert (=> b!1400917 (=> res!939426 e!793200)))

(declare-fun lt!616556 () SeekEntryResult!10551)

(assert (=> b!1400917 (= res!939426 (or (not (is-Intermediate!10551 lt!616556)) (undefined!11363 lt!616556)))))

(declare-fun e!793201 () Bool)

(assert (=> b!1400917 e!793201))

(declare-fun res!939431 () Bool)

(assert (=> b!1400917 (=> (not res!939431) (not e!793201))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95767 (_ BitVec 32)) Bool)

(assert (=> b!1400917 (= res!939431 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47106 0))(
  ( (Unit!47107) )
))
(declare-fun lt!616555 () Unit!47106)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47106)

(assert (=> b!1400917 (= lt!616555 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400917 (= lt!616556 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616553 (select (arr!46234 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400917 (= lt!616553 (toIndex!0 (select (arr!46234 a!2901) j!112) mask!2840))))

(declare-fun b!1400918 () Bool)

(declare-fun res!939432 () Bool)

(assert (=> b!1400918 (=> (not res!939432) (not e!793204))))

(assert (=> b!1400918 (= res!939432 (validKeyInArray!0 (select (arr!46234 a!2901) j!112)))))

(declare-fun res!939430 () Bool)

(assert (=> start!120358 (=> (not res!939430) (not e!793204))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120358 (= res!939430 (validMask!0 mask!2840))))

(assert (=> start!120358 e!793204))

(assert (=> start!120358 true))

(declare-fun array_inv!35262 (array!95767) Bool)

(assert (=> start!120358 (array_inv!35262 a!2901)))

(declare-fun b!1400919 () Bool)

(declare-fun e!793199 () Bool)

(assert (=> b!1400919 (= e!793199 e!793203)))

(declare-fun res!939429 () Bool)

(assert (=> b!1400919 (=> res!939429 e!793203)))

(declare-fun lt!616551 () SeekEntryResult!10551)

(assert (=> b!1400919 (= res!939429 (or (bvslt (x!126218 lt!616556) #b00000000000000000000000000000000) (bvsgt (x!126218 lt!616556) #b01111111111111111111111111111110) (bvslt (x!126218 lt!616551) #b00000000000000000000000000000000) (bvsgt (x!126218 lt!616551) #b01111111111111111111111111111110) (bvslt lt!616553 #b00000000000000000000000000000000) (bvsge lt!616553 (size!46784 a!2901)) (bvslt (index!44583 lt!616556) #b00000000000000000000000000000000) (bvsge (index!44583 lt!616556) (size!46784 a!2901)) (bvslt (index!44583 lt!616551) #b00000000000000000000000000000000) (bvsge (index!44583 lt!616551) (size!46784 a!2901)) (not (= lt!616556 (Intermediate!10551 false (index!44583 lt!616556) (x!126218 lt!616556)))) (not (= lt!616551 (Intermediate!10551 false (index!44583 lt!616551) (x!126218 lt!616551))))))))

(declare-fun e!793202 () Bool)

(assert (=> b!1400919 e!793202))

(declare-fun res!939435 () Bool)

(assert (=> b!1400919 (=> (not res!939435) (not e!793202))))

(assert (=> b!1400919 (= res!939435 (and (not (undefined!11363 lt!616551)) (= (index!44583 lt!616551) i!1037) (bvslt (x!126218 lt!616551) (x!126218 lt!616556)) (= (select (store (arr!46234 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44583 lt!616551)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616554 () Unit!47106)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47106)

(assert (=> b!1400919 (= lt!616554 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616553 (x!126218 lt!616556) (index!44583 lt!616556) (x!126218 lt!616551) (index!44583 lt!616551) (undefined!11363 lt!616551) mask!2840))))

(declare-fun b!1400920 () Bool)

(declare-fun res!939436 () Bool)

(assert (=> b!1400920 (=> (not res!939436) (not e!793204))))

(assert (=> b!1400920 (= res!939436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400921 () Bool)

(assert (=> b!1400921 (= e!793200 e!793199)))

(declare-fun res!939428 () Bool)

(assert (=> b!1400921 (=> res!939428 e!793199)))

(assert (=> b!1400921 (= res!939428 (or (= lt!616556 lt!616551) (not (is-Intermediate!10551 lt!616551))))))

(assert (=> b!1400921 (= lt!616551 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616550 mask!2840) lt!616550 lt!616557 mask!2840))))

(assert (=> b!1400921 (= lt!616550 (select (store (arr!46234 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400921 (= lt!616557 (array!95768 (store (arr!46234 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46784 a!2901)))))

(declare-fun b!1400922 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95767 (_ BitVec 32)) SeekEntryResult!10551)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95767 (_ BitVec 32)) SeekEntryResult!10551)

(assert (=> b!1400922 (= e!793202 (= (seekEntryOrOpen!0 lt!616550 lt!616557 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126218 lt!616551) (index!44583 lt!616551) (index!44583 lt!616551) (select (arr!46234 a!2901) j!112) lt!616557 mask!2840)))))

(declare-fun b!1400923 () Bool)

(declare-fun res!939427 () Bool)

(assert (=> b!1400923 (=> (not res!939427) (not e!793204))))

(declare-datatypes ((List!32753 0))(
  ( (Nil!32750) (Cons!32749 (h!33997 (_ BitVec 64)) (t!47447 List!32753)) )
))
(declare-fun arrayNoDuplicates!0 (array!95767 (_ BitVec 32) List!32753) Bool)

(assert (=> b!1400923 (= res!939427 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32750))))

(declare-fun b!1400924 () Bool)

(declare-fun res!939433 () Bool)

(assert (=> b!1400924 (=> (not res!939433) (not e!793204))))

(assert (=> b!1400924 (= res!939433 (and (= (size!46784 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46784 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46784 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400925 () Bool)

(assert (=> b!1400925 (= e!793201 (= (seekEntryOrOpen!0 (select (arr!46234 a!2901) j!112) a!2901 mask!2840) (Found!10551 j!112)))))

(assert (= (and start!120358 res!939430) b!1400924))

(assert (= (and b!1400924 res!939433) b!1400915))

(assert (= (and b!1400915 res!939434) b!1400918))

(assert (= (and b!1400918 res!939432) b!1400920))

(assert (= (and b!1400920 res!939436) b!1400923))

(assert (= (and b!1400923 res!939427) b!1400917))

(assert (= (and b!1400917 res!939431) b!1400925))

(assert (= (and b!1400917 (not res!939426)) b!1400921))

(assert (= (and b!1400921 (not res!939428)) b!1400919))

(assert (= (and b!1400919 res!939435) b!1400922))

(assert (= (and b!1400919 (not res!939429)) b!1400916))

(declare-fun m!1288525 () Bool)

(assert (=> b!1400919 m!1288525))

(declare-fun m!1288527 () Bool)

(assert (=> b!1400919 m!1288527))

(declare-fun m!1288529 () Bool)

(assert (=> b!1400919 m!1288529))

(declare-fun m!1288531 () Bool)

(assert (=> b!1400923 m!1288531))

(declare-fun m!1288533 () Bool)

(assert (=> b!1400918 m!1288533))

(assert (=> b!1400918 m!1288533))

(declare-fun m!1288535 () Bool)

(assert (=> b!1400918 m!1288535))

(declare-fun m!1288537 () Bool)

(assert (=> b!1400921 m!1288537))

(assert (=> b!1400921 m!1288537))

(declare-fun m!1288539 () Bool)

(assert (=> b!1400921 m!1288539))

(assert (=> b!1400921 m!1288525))

(declare-fun m!1288541 () Bool)

(assert (=> b!1400921 m!1288541))

(declare-fun m!1288543 () Bool)

(assert (=> b!1400922 m!1288543))

(assert (=> b!1400922 m!1288533))

(assert (=> b!1400922 m!1288533))

(declare-fun m!1288545 () Bool)

(assert (=> b!1400922 m!1288545))

(declare-fun m!1288547 () Bool)

(assert (=> b!1400915 m!1288547))

(assert (=> b!1400915 m!1288547))

(declare-fun m!1288549 () Bool)

(assert (=> b!1400915 m!1288549))

(declare-fun m!1288551 () Bool)

(assert (=> b!1400916 m!1288551))

(declare-fun m!1288553 () Bool)

(assert (=> start!120358 m!1288553))

(declare-fun m!1288555 () Bool)

(assert (=> start!120358 m!1288555))

(assert (=> b!1400925 m!1288533))

(assert (=> b!1400925 m!1288533))

(declare-fun m!1288557 () Bool)

(assert (=> b!1400925 m!1288557))

(declare-fun m!1288559 () Bool)

(assert (=> b!1400920 m!1288559))

(assert (=> b!1400917 m!1288533))

(declare-fun m!1288561 () Bool)

(assert (=> b!1400917 m!1288561))

(assert (=> b!1400917 m!1288533))

(assert (=> b!1400917 m!1288533))

(declare-fun m!1288563 () Bool)

(assert (=> b!1400917 m!1288563))

(declare-fun m!1288565 () Bool)

(assert (=> b!1400917 m!1288565))

(declare-fun m!1288567 () Bool)

(assert (=> b!1400917 m!1288567))

(push 1)

