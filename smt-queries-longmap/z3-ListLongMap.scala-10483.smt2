; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123278 () Bool)

(assert start!123278)

(declare-fun b!1429683 () Bool)

(declare-fun res!964322 () Bool)

(declare-fun e!807234 () Bool)

(assert (=> b!1429683 (=> (not res!964322) (not e!807234))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97439 0))(
  ( (array!97440 (arr!47031 (Array (_ BitVec 32) (_ BitVec 64))) (size!47581 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97439)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11310 0))(
  ( (MissingZero!11310 (index!47632 (_ BitVec 32))) (Found!11310 (index!47633 (_ BitVec 32))) (Intermediate!11310 (undefined!12122 Bool) (index!47634 (_ BitVec 32)) (x!129264 (_ BitVec 32))) (Undefined!11310) (MissingVacant!11310 (index!47635 (_ BitVec 32))) )
))
(declare-fun lt!629461 () SeekEntryResult!11310)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97439 (_ BitVec 32)) SeekEntryResult!11310)

(assert (=> b!1429683 (= res!964322 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47031 a!2831) j!81) a!2831 mask!2608) lt!629461))))

(declare-fun b!1429684 () Bool)

(declare-fun e!807236 () Bool)

(declare-fun e!807232 () Bool)

(assert (=> b!1429684 (= e!807236 e!807232)))

(declare-fun res!964323 () Bool)

(assert (=> b!1429684 (=> (not res!964323) (not e!807232))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1429684 (= res!964323 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47031 a!2831) j!81) mask!2608) (select (arr!47031 a!2831) j!81) a!2831 mask!2608) lt!629461))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1429684 (= lt!629461 (Intermediate!11310 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1429685 () Bool)

(declare-fun res!964315 () Bool)

(assert (=> b!1429685 (=> (not res!964315) (not e!807234))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1429685 (= res!964315 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1429686 () Bool)

(declare-fun res!964320 () Bool)

(assert (=> b!1429686 (=> (not res!964320) (not e!807236))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1429686 (= res!964320 (validKeyInArray!0 (select (arr!47031 a!2831) i!982)))))

(declare-fun b!1429687 () Bool)

(declare-fun res!964324 () Bool)

(assert (=> b!1429687 (=> (not res!964324) (not e!807236))))

(assert (=> b!1429687 (= res!964324 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47581 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47581 a!2831))))))

(declare-fun b!1429688 () Bool)

(declare-fun res!964317 () Bool)

(assert (=> b!1429688 (=> (not res!964317) (not e!807236))))

(assert (=> b!1429688 (= res!964317 (validKeyInArray!0 (select (arr!47031 a!2831) j!81)))))

(declare-fun b!1429689 () Bool)

(declare-fun res!964314 () Bool)

(assert (=> b!1429689 (=> (not res!964314) (not e!807236))))

(declare-datatypes ((List!33541 0))(
  ( (Nil!33538) (Cons!33537 (h!34851 (_ BitVec 64)) (t!48235 List!33541)) )
))
(declare-fun arrayNoDuplicates!0 (array!97439 (_ BitVec 32) List!33541) Bool)

(assert (=> b!1429689 (= res!964314 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33538))))

(declare-fun b!1429690 () Bool)

(assert (=> b!1429690 (= e!807234 (not true))))

(declare-fun e!807235 () Bool)

(assert (=> b!1429690 e!807235))

(declare-fun res!964321 () Bool)

(assert (=> b!1429690 (=> (not res!964321) (not e!807235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97439 (_ BitVec 32)) Bool)

(assert (=> b!1429690 (= res!964321 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48366 0))(
  ( (Unit!48367) )
))
(declare-fun lt!629459 () Unit!48366)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97439 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48366)

(assert (=> b!1429690 (= lt!629459 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1429691 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97439 (_ BitVec 32)) SeekEntryResult!11310)

(assert (=> b!1429691 (= e!807235 (= (seekEntryOrOpen!0 (select (arr!47031 a!2831) j!81) a!2831 mask!2608) (Found!11310 j!81)))))

(declare-fun b!1429692 () Bool)

(declare-fun res!964316 () Bool)

(assert (=> b!1429692 (=> (not res!964316) (not e!807236))))

(assert (=> b!1429692 (= res!964316 (and (= (size!47581 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47581 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47581 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1429693 () Bool)

(assert (=> b!1429693 (= e!807232 e!807234)))

(declare-fun res!964319 () Bool)

(assert (=> b!1429693 (=> (not res!964319) (not e!807234))))

(declare-fun lt!629463 () SeekEntryResult!11310)

(declare-fun lt!629460 () (_ BitVec 64))

(declare-fun lt!629462 () array!97439)

(assert (=> b!1429693 (= res!964319 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!629460 mask!2608) lt!629460 lt!629462 mask!2608) lt!629463))))

(assert (=> b!1429693 (= lt!629463 (Intermediate!11310 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1429693 (= lt!629460 (select (store (arr!47031 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1429693 (= lt!629462 (array!97440 (store (arr!47031 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47581 a!2831)))))

(declare-fun res!964312 () Bool)

(assert (=> start!123278 (=> (not res!964312) (not e!807236))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123278 (= res!964312 (validMask!0 mask!2608))))

(assert (=> start!123278 e!807236))

(assert (=> start!123278 true))

(declare-fun array_inv!36059 (array!97439) Bool)

(assert (=> start!123278 (array_inv!36059 a!2831)))

(declare-fun b!1429694 () Bool)

(declare-fun res!964318 () Bool)

(assert (=> b!1429694 (=> (not res!964318) (not e!807236))))

(assert (=> b!1429694 (= res!964318 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1429695 () Bool)

(declare-fun res!964313 () Bool)

(assert (=> b!1429695 (=> (not res!964313) (not e!807234))))

(assert (=> b!1429695 (= res!964313 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!629460 lt!629462 mask!2608) lt!629463))))

(assert (= (and start!123278 res!964312) b!1429692))

(assert (= (and b!1429692 res!964316) b!1429686))

(assert (= (and b!1429686 res!964320) b!1429688))

(assert (= (and b!1429688 res!964317) b!1429694))

(assert (= (and b!1429694 res!964318) b!1429689))

(assert (= (and b!1429689 res!964314) b!1429687))

(assert (= (and b!1429687 res!964324) b!1429684))

(assert (= (and b!1429684 res!964323) b!1429693))

(assert (= (and b!1429693 res!964319) b!1429683))

(assert (= (and b!1429683 res!964322) b!1429695))

(assert (= (and b!1429695 res!964313) b!1429685))

(assert (= (and b!1429685 res!964315) b!1429690))

(assert (= (and b!1429690 res!964321) b!1429691))

(declare-fun m!1319777 () Bool)

(assert (=> b!1429693 m!1319777))

(assert (=> b!1429693 m!1319777))

(declare-fun m!1319779 () Bool)

(assert (=> b!1429693 m!1319779))

(declare-fun m!1319781 () Bool)

(assert (=> b!1429693 m!1319781))

(declare-fun m!1319783 () Bool)

(assert (=> b!1429693 m!1319783))

(declare-fun m!1319785 () Bool)

(assert (=> b!1429684 m!1319785))

(assert (=> b!1429684 m!1319785))

(declare-fun m!1319787 () Bool)

(assert (=> b!1429684 m!1319787))

(assert (=> b!1429684 m!1319787))

(assert (=> b!1429684 m!1319785))

(declare-fun m!1319789 () Bool)

(assert (=> b!1429684 m!1319789))

(assert (=> b!1429691 m!1319785))

(assert (=> b!1429691 m!1319785))

(declare-fun m!1319791 () Bool)

(assert (=> b!1429691 m!1319791))

(declare-fun m!1319793 () Bool)

(assert (=> b!1429694 m!1319793))

(declare-fun m!1319795 () Bool)

(assert (=> b!1429686 m!1319795))

(assert (=> b!1429686 m!1319795))

(declare-fun m!1319797 () Bool)

(assert (=> b!1429686 m!1319797))

(assert (=> b!1429683 m!1319785))

(assert (=> b!1429683 m!1319785))

(declare-fun m!1319799 () Bool)

(assert (=> b!1429683 m!1319799))

(declare-fun m!1319801 () Bool)

(assert (=> b!1429689 m!1319801))

(declare-fun m!1319803 () Bool)

(assert (=> start!123278 m!1319803))

(declare-fun m!1319805 () Bool)

(assert (=> start!123278 m!1319805))

(assert (=> b!1429688 m!1319785))

(assert (=> b!1429688 m!1319785))

(declare-fun m!1319807 () Bool)

(assert (=> b!1429688 m!1319807))

(declare-fun m!1319809 () Bool)

(assert (=> b!1429695 m!1319809))

(declare-fun m!1319811 () Bool)

(assert (=> b!1429690 m!1319811))

(declare-fun m!1319813 () Bool)

(assert (=> b!1429690 m!1319813))

(check-sat (not b!1429686) (not b!1429690) (not start!123278) (not b!1429691) (not b!1429688) (not b!1429683) (not b!1429695) (not b!1429689) (not b!1429693) (not b!1429694) (not b!1429684))
(check-sat)
