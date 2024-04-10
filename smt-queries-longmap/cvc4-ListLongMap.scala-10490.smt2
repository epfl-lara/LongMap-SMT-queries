; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123520 () Bool)

(assert start!123520)

(declare-fun b!1431773 () Bool)

(declare-fun res!965637 () Bool)

(declare-fun e!808319 () Bool)

(assert (=> b!1431773 (=> (not res!965637) (not e!808319))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97492 0))(
  ( (array!97493 (arr!47053 (Array (_ BitVec 32) (_ BitVec 64))) (size!47603 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97492)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1431773 (= res!965637 (and (= (size!47603 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47603 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47603 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1431774 () Bool)

(declare-fun res!965639 () Bool)

(assert (=> b!1431774 (=> (not res!965639) (not e!808319))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97492 (_ BitVec 32)) Bool)

(assert (=> b!1431774 (= res!965639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1431775 () Bool)

(declare-fun res!965647 () Bool)

(assert (=> b!1431775 (=> (not res!965647) (not e!808319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1431775 (= res!965647 (validKeyInArray!0 (select (arr!47053 a!2831) j!81)))))

(declare-fun b!1431777 () Bool)

(declare-fun res!965646 () Bool)

(declare-fun e!808315 () Bool)

(assert (=> b!1431777 (=> (not res!965646) (not e!808315))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1431777 (= res!965646 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1431778 () Bool)

(declare-fun res!965641 () Bool)

(assert (=> b!1431778 (=> (not res!965641) (not e!808315))))

(declare-datatypes ((SeekEntryResult!11332 0))(
  ( (MissingZero!11332 (index!47720 (_ BitVec 32))) (Found!11332 (index!47721 (_ BitVec 32))) (Intermediate!11332 (undefined!12144 Bool) (index!47722 (_ BitVec 32)) (x!129366 (_ BitVec 32))) (Undefined!11332) (MissingVacant!11332 (index!47723 (_ BitVec 32))) )
))
(declare-fun lt!630307 () SeekEntryResult!11332)

(declare-fun lt!630308 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!630309 () array!97492)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97492 (_ BitVec 32)) SeekEntryResult!11332)

(assert (=> b!1431778 (= res!965641 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630308 lt!630309 mask!2608) lt!630307))))

(declare-fun b!1431779 () Bool)

(declare-fun e!808314 () Bool)

(assert (=> b!1431779 (= e!808314 e!808315)))

(declare-fun res!965644 () Bool)

(assert (=> b!1431779 (=> (not res!965644) (not e!808315))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431779 (= res!965644 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630308 mask!2608) lt!630308 lt!630309 mask!2608) lt!630307))))

(assert (=> b!1431779 (= lt!630307 (Intermediate!11332 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1431779 (= lt!630308 (select (store (arr!47053 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1431779 (= lt!630309 (array!97493 (store (arr!47053 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47603 a!2831)))))

(declare-fun b!1431780 () Bool)

(declare-fun res!965642 () Bool)

(assert (=> b!1431780 (=> (not res!965642) (not e!808319))))

(assert (=> b!1431780 (= res!965642 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47603 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47603 a!2831))))))

(declare-fun b!1431781 () Bool)

(declare-fun e!808316 () Bool)

(assert (=> b!1431781 (= e!808316 true)))

(declare-fun lt!630310 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1431781 (= lt!630310 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1431782 () Bool)

(declare-fun res!965645 () Bool)

(assert (=> b!1431782 (=> (not res!965645) (not e!808319))))

(declare-datatypes ((List!33563 0))(
  ( (Nil!33560) (Cons!33559 (h!34882 (_ BitVec 64)) (t!48257 List!33563)) )
))
(declare-fun arrayNoDuplicates!0 (array!97492 (_ BitVec 32) List!33563) Bool)

(assert (=> b!1431782 (= res!965645 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33560))))

(declare-fun b!1431783 () Bool)

(assert (=> b!1431783 (= e!808319 e!808314)))

(declare-fun res!965643 () Bool)

(assert (=> b!1431783 (=> (not res!965643) (not e!808314))))

(declare-fun lt!630312 () SeekEntryResult!11332)

(assert (=> b!1431783 (= res!965643 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47053 a!2831) j!81) mask!2608) (select (arr!47053 a!2831) j!81) a!2831 mask!2608) lt!630312))))

(assert (=> b!1431783 (= lt!630312 (Intermediate!11332 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1431784 () Bool)

(declare-fun res!965649 () Bool)

(assert (=> b!1431784 (=> (not res!965649) (not e!808315))))

(assert (=> b!1431784 (= res!965649 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47053 a!2831) j!81) a!2831 mask!2608) lt!630312))))

(declare-fun res!965640 () Bool)

(assert (=> start!123520 (=> (not res!965640) (not e!808319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123520 (= res!965640 (validMask!0 mask!2608))))

(assert (=> start!123520 e!808319))

(assert (=> start!123520 true))

(declare-fun array_inv!36081 (array!97492) Bool)

(assert (=> start!123520 (array_inv!36081 a!2831)))

(declare-fun b!1431776 () Bool)

(assert (=> b!1431776 (= e!808315 (not e!808316))))

(declare-fun res!965650 () Bool)

(assert (=> b!1431776 (=> res!965650 e!808316)))

(assert (=> b!1431776 (= res!965650 (or (= (select (arr!47053 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47053 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47053 a!2831) index!585) (select (arr!47053 a!2831) j!81)) (= (select (store (arr!47053 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808317 () Bool)

(assert (=> b!1431776 e!808317))

(declare-fun res!965648 () Bool)

(assert (=> b!1431776 (=> (not res!965648) (not e!808317))))

(assert (=> b!1431776 (= res!965648 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48410 0))(
  ( (Unit!48411) )
))
(declare-fun lt!630311 () Unit!48410)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97492 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48410)

(assert (=> b!1431776 (= lt!630311 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1431785 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97492 (_ BitVec 32)) SeekEntryResult!11332)

(assert (=> b!1431785 (= e!808317 (= (seekEntryOrOpen!0 (select (arr!47053 a!2831) j!81) a!2831 mask!2608) (Found!11332 j!81)))))

(declare-fun b!1431786 () Bool)

(declare-fun res!965638 () Bool)

(assert (=> b!1431786 (=> (not res!965638) (not e!808319))))

(assert (=> b!1431786 (= res!965638 (validKeyInArray!0 (select (arr!47053 a!2831) i!982)))))

(assert (= (and start!123520 res!965640) b!1431773))

(assert (= (and b!1431773 res!965637) b!1431786))

(assert (= (and b!1431786 res!965638) b!1431775))

(assert (= (and b!1431775 res!965647) b!1431774))

(assert (= (and b!1431774 res!965639) b!1431782))

(assert (= (and b!1431782 res!965645) b!1431780))

(assert (= (and b!1431780 res!965642) b!1431783))

(assert (= (and b!1431783 res!965643) b!1431779))

(assert (= (and b!1431779 res!965644) b!1431784))

(assert (= (and b!1431784 res!965649) b!1431778))

(assert (= (and b!1431778 res!965641) b!1431777))

(assert (= (and b!1431777 res!965646) b!1431776))

(assert (= (and b!1431776 res!965648) b!1431785))

(assert (= (and b!1431776 (not res!965650)) b!1431781))

(declare-fun m!1321549 () Bool)

(assert (=> b!1431778 m!1321549))

(declare-fun m!1321551 () Bool)

(assert (=> b!1431775 m!1321551))

(assert (=> b!1431775 m!1321551))

(declare-fun m!1321553 () Bool)

(assert (=> b!1431775 m!1321553))

(assert (=> b!1431785 m!1321551))

(assert (=> b!1431785 m!1321551))

(declare-fun m!1321555 () Bool)

(assert (=> b!1431785 m!1321555))

(declare-fun m!1321557 () Bool)

(assert (=> start!123520 m!1321557))

(declare-fun m!1321559 () Bool)

(assert (=> start!123520 m!1321559))

(declare-fun m!1321561 () Bool)

(assert (=> b!1431786 m!1321561))

(assert (=> b!1431786 m!1321561))

(declare-fun m!1321563 () Bool)

(assert (=> b!1431786 m!1321563))

(assert (=> b!1431784 m!1321551))

(assert (=> b!1431784 m!1321551))

(declare-fun m!1321565 () Bool)

(assert (=> b!1431784 m!1321565))

(declare-fun m!1321567 () Bool)

(assert (=> b!1431779 m!1321567))

(assert (=> b!1431779 m!1321567))

(declare-fun m!1321569 () Bool)

(assert (=> b!1431779 m!1321569))

(declare-fun m!1321571 () Bool)

(assert (=> b!1431779 m!1321571))

(declare-fun m!1321573 () Bool)

(assert (=> b!1431779 m!1321573))

(declare-fun m!1321575 () Bool)

(assert (=> b!1431782 m!1321575))

(assert (=> b!1431776 m!1321571))

(declare-fun m!1321577 () Bool)

(assert (=> b!1431776 m!1321577))

(declare-fun m!1321579 () Bool)

(assert (=> b!1431776 m!1321579))

(declare-fun m!1321581 () Bool)

(assert (=> b!1431776 m!1321581))

(assert (=> b!1431776 m!1321551))

(declare-fun m!1321583 () Bool)

(assert (=> b!1431776 m!1321583))

(assert (=> b!1431783 m!1321551))

(assert (=> b!1431783 m!1321551))

(declare-fun m!1321585 () Bool)

(assert (=> b!1431783 m!1321585))

(assert (=> b!1431783 m!1321585))

(assert (=> b!1431783 m!1321551))

(declare-fun m!1321587 () Bool)

(assert (=> b!1431783 m!1321587))

(declare-fun m!1321589 () Bool)

(assert (=> b!1431774 m!1321589))

(declare-fun m!1321591 () Bool)

(assert (=> b!1431781 m!1321591))

(push 1)

