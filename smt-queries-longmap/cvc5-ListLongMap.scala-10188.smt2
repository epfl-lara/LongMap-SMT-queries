; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120054 () Bool)

(assert start!120054)

(declare-fun b!1397689 () Bool)

(declare-fun res!936606 () Bool)

(declare-fun e!791273 () Bool)

(assert (=> b!1397689 (=> (not res!936606) (not e!791273))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95583 0))(
  ( (array!95584 (arr!46145 (Array (_ BitVec 32) (_ BitVec 64))) (size!46695 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95583)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397689 (= res!936606 (and (= (size!46695 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46695 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46695 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397690 () Bool)

(declare-fun e!791272 () Bool)

(assert (=> b!1397690 (= e!791273 (not e!791272))))

(declare-fun res!936607 () Bool)

(assert (=> b!1397690 (=> res!936607 e!791272)))

(declare-datatypes ((SeekEntryResult!10462 0))(
  ( (MissingZero!10462 (index!44219 (_ BitVec 32))) (Found!10462 (index!44220 (_ BitVec 32))) (Intermediate!10462 (undefined!11274 Bool) (index!44221 (_ BitVec 32)) (x!125876 (_ BitVec 32))) (Undefined!10462) (MissingVacant!10462 (index!44222 (_ BitVec 32))) )
))
(declare-fun lt!614402 () SeekEntryResult!10462)

(assert (=> b!1397690 (= res!936607 (or (not (is-Intermediate!10462 lt!614402)) (undefined!11274 lt!614402)))))

(declare-fun e!791271 () Bool)

(assert (=> b!1397690 e!791271))

(declare-fun res!936610 () Bool)

(assert (=> b!1397690 (=> (not res!936610) (not e!791271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95583 (_ BitVec 32)) Bool)

(assert (=> b!1397690 (= res!936610 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46928 0))(
  ( (Unit!46929) )
))
(declare-fun lt!614401 () Unit!46928)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95583 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46928)

(assert (=> b!1397690 (= lt!614401 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614403 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95583 (_ BitVec 32)) SeekEntryResult!10462)

(assert (=> b!1397690 (= lt!614402 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614403 (select (arr!46145 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397690 (= lt!614403 (toIndex!0 (select (arr!46145 a!2901) j!112) mask!2840))))

(declare-fun b!1397691 () Bool)

(declare-fun e!791269 () Bool)

(assert (=> b!1397691 (= e!791272 e!791269)))

(declare-fun res!936602 () Bool)

(assert (=> b!1397691 (=> res!936602 e!791269)))

(declare-fun lt!614397 () SeekEntryResult!10462)

(assert (=> b!1397691 (= res!936602 (or (= lt!614402 lt!614397) (not (is-Intermediate!10462 lt!614397)) (bvslt (x!125876 lt!614402) #b00000000000000000000000000000000) (bvsgt (x!125876 lt!614402) #b01111111111111111111111111111110) (bvslt lt!614403 #b00000000000000000000000000000000) (bvsge lt!614403 (size!46695 a!2901)) (bvslt (index!44221 lt!614402) #b00000000000000000000000000000000) (bvsge (index!44221 lt!614402) (size!46695 a!2901)) (not (= lt!614402 (Intermediate!10462 false (index!44221 lt!614402) (x!125876 lt!614402)))) (not (= lt!614397 (Intermediate!10462 (undefined!11274 lt!614397) (index!44221 lt!614397) (x!125876 lt!614397))))))))

(declare-fun lt!614398 () (_ BitVec 64))

(declare-fun lt!614399 () array!95583)

(assert (=> b!1397691 (= lt!614397 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614398 mask!2840) lt!614398 lt!614399 mask!2840))))

(assert (=> b!1397691 (= lt!614398 (select (store (arr!46145 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397691 (= lt!614399 (array!95584 (store (arr!46145 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46695 a!2901)))))

(declare-fun b!1397692 () Bool)

(declare-fun res!936609 () Bool)

(assert (=> b!1397692 (=> (not res!936609) (not e!791273))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397692 (= res!936609 (validKeyInArray!0 (select (arr!46145 a!2901) j!112)))))

(declare-fun b!1397693 () Bool)

(declare-fun res!936604 () Bool)

(assert (=> b!1397693 (=> (not res!936604) (not e!791273))))

(assert (=> b!1397693 (= res!936604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397694 () Bool)

(assert (=> b!1397694 (= e!791269 true)))

(declare-fun lt!614400 () SeekEntryResult!10462)

(assert (=> b!1397694 (= lt!614400 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614403 lt!614398 lt!614399 mask!2840))))

(declare-fun res!936603 () Bool)

(assert (=> start!120054 (=> (not res!936603) (not e!791273))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120054 (= res!936603 (validMask!0 mask!2840))))

(assert (=> start!120054 e!791273))

(assert (=> start!120054 true))

(declare-fun array_inv!35173 (array!95583) Bool)

(assert (=> start!120054 (array_inv!35173 a!2901)))

(declare-fun b!1397695 () Bool)

(declare-fun res!936605 () Bool)

(assert (=> b!1397695 (=> (not res!936605) (not e!791273))))

(declare-datatypes ((List!32664 0))(
  ( (Nil!32661) (Cons!32660 (h!33902 (_ BitVec 64)) (t!47358 List!32664)) )
))
(declare-fun arrayNoDuplicates!0 (array!95583 (_ BitVec 32) List!32664) Bool)

(assert (=> b!1397695 (= res!936605 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32661))))

(declare-fun b!1397696 () Bool)

(declare-fun res!936608 () Bool)

(assert (=> b!1397696 (=> (not res!936608) (not e!791273))))

(assert (=> b!1397696 (= res!936608 (validKeyInArray!0 (select (arr!46145 a!2901) i!1037)))))

(declare-fun b!1397697 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95583 (_ BitVec 32)) SeekEntryResult!10462)

(assert (=> b!1397697 (= e!791271 (= (seekEntryOrOpen!0 (select (arr!46145 a!2901) j!112) a!2901 mask!2840) (Found!10462 j!112)))))

(assert (= (and start!120054 res!936603) b!1397689))

(assert (= (and b!1397689 res!936606) b!1397696))

(assert (= (and b!1397696 res!936608) b!1397692))

(assert (= (and b!1397692 res!936609) b!1397693))

(assert (= (and b!1397693 res!936604) b!1397695))

(assert (= (and b!1397695 res!936605) b!1397690))

(assert (= (and b!1397690 res!936610) b!1397697))

(assert (= (and b!1397690 (not res!936607)) b!1397691))

(assert (= (and b!1397691 (not res!936602)) b!1397694))

(declare-fun m!1284543 () Bool)

(assert (=> b!1397693 m!1284543))

(declare-fun m!1284545 () Bool)

(assert (=> b!1397690 m!1284545))

(declare-fun m!1284547 () Bool)

(assert (=> b!1397690 m!1284547))

(assert (=> b!1397690 m!1284545))

(declare-fun m!1284549 () Bool)

(assert (=> b!1397690 m!1284549))

(assert (=> b!1397690 m!1284545))

(declare-fun m!1284551 () Bool)

(assert (=> b!1397690 m!1284551))

(declare-fun m!1284553 () Bool)

(assert (=> b!1397690 m!1284553))

(assert (=> b!1397697 m!1284545))

(assert (=> b!1397697 m!1284545))

(declare-fun m!1284555 () Bool)

(assert (=> b!1397697 m!1284555))

(declare-fun m!1284557 () Bool)

(assert (=> b!1397691 m!1284557))

(assert (=> b!1397691 m!1284557))

(declare-fun m!1284559 () Bool)

(assert (=> b!1397691 m!1284559))

(declare-fun m!1284561 () Bool)

(assert (=> b!1397691 m!1284561))

(declare-fun m!1284563 () Bool)

(assert (=> b!1397691 m!1284563))

(declare-fun m!1284565 () Bool)

(assert (=> b!1397695 m!1284565))

(assert (=> b!1397692 m!1284545))

(assert (=> b!1397692 m!1284545))

(declare-fun m!1284567 () Bool)

(assert (=> b!1397692 m!1284567))

(declare-fun m!1284569 () Bool)

(assert (=> b!1397696 m!1284569))

(assert (=> b!1397696 m!1284569))

(declare-fun m!1284571 () Bool)

(assert (=> b!1397696 m!1284571))

(declare-fun m!1284573 () Bool)

(assert (=> b!1397694 m!1284573))

(declare-fun m!1284575 () Bool)

(assert (=> start!120054 m!1284575))

(declare-fun m!1284577 () Bool)

(assert (=> start!120054 m!1284577))

(push 1)

