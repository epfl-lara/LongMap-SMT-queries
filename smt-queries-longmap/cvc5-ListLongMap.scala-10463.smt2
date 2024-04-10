; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122940 () Bool)

(assert start!122940)

(declare-fun b!1426107 () Bool)

(declare-fun res!961547 () Bool)

(declare-fun e!805587 () Bool)

(assert (=> b!1426107 (=> (not res!961547) (not e!805587))))

(declare-datatypes ((array!97305 0))(
  ( (array!97306 (arr!46970 (Array (_ BitVec 32) (_ BitVec 64))) (size!47520 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97305)

(declare-datatypes ((List!33480 0))(
  ( (Nil!33477) (Cons!33476 (h!34778 (_ BitVec 64)) (t!48174 List!33480)) )
))
(declare-fun arrayNoDuplicates!0 (array!97305 (_ BitVec 32) List!33480) Bool)

(assert (=> b!1426107 (= res!961547 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33477))))

(declare-fun b!1426108 () Bool)

(declare-fun res!961549 () Bool)

(assert (=> b!1426108 (=> (not res!961549) (not e!805587))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1426108 (= res!961549 (and (= (size!47520 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47520 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47520 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1426109 () Bool)

(declare-fun e!805589 () Bool)

(assert (=> b!1426109 (= e!805589 false)))

(declare-fun lt!628024 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11249 0))(
  ( (MissingZero!11249 (index!47388 (_ BitVec 32))) (Found!11249 (index!47389 (_ BitVec 32))) (Intermediate!11249 (undefined!12061 Bool) (index!47390 (_ BitVec 32)) (x!129019 (_ BitVec 32))) (Undefined!11249) (MissingVacant!11249 (index!47391 (_ BitVec 32))) )
))
(declare-fun lt!628023 () SeekEntryResult!11249)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!628025 () array!97305)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97305 (_ BitVec 32)) SeekEntryResult!11249)

(assert (=> b!1426109 (= lt!628023 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!628024 lt!628025 mask!2608))))

(declare-fun b!1426110 () Bool)

(declare-fun res!961544 () Bool)

(assert (=> b!1426110 (=> (not res!961544) (not e!805587))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1426110 (= res!961544 (validKeyInArray!0 (select (arr!46970 a!2831) j!81)))))

(declare-fun b!1426111 () Bool)

(declare-fun res!961546 () Bool)

(assert (=> b!1426111 (=> (not res!961546) (not e!805587))))

(assert (=> b!1426111 (= res!961546 (validKeyInArray!0 (select (arr!46970 a!2831) i!982)))))

(declare-fun b!1426112 () Bool)

(declare-fun e!805586 () Bool)

(assert (=> b!1426112 (= e!805587 e!805586)))

(declare-fun res!961543 () Bool)

(assert (=> b!1426112 (=> (not res!961543) (not e!805586))))

(declare-fun lt!628026 () SeekEntryResult!11249)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1426112 (= res!961543 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46970 a!2831) j!81) mask!2608) (select (arr!46970 a!2831) j!81) a!2831 mask!2608) lt!628026))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1426112 (= lt!628026 (Intermediate!11249 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1426114 () Bool)

(declare-fun res!961548 () Bool)

(assert (=> b!1426114 (=> (not res!961548) (not e!805587))))

(assert (=> b!1426114 (= res!961548 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47520 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47520 a!2831))))))

(declare-fun b!1426115 () Bool)

(assert (=> b!1426115 (= e!805586 e!805589)))

(declare-fun res!961540 () Bool)

(assert (=> b!1426115 (=> (not res!961540) (not e!805589))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1426115 (= res!961540 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!628024 mask!2608) lt!628024 lt!628025 mask!2608) (Intermediate!11249 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1426115 (= lt!628024 (select (store (arr!46970 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1426115 (= lt!628025 (array!97306 (store (arr!46970 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47520 a!2831)))))

(declare-fun b!1426116 () Bool)

(declare-fun res!961541 () Bool)

(assert (=> b!1426116 (=> (not res!961541) (not e!805589))))

(assert (=> b!1426116 (= res!961541 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46970 a!2831) j!81) a!2831 mask!2608) lt!628026))))

(declare-fun res!961542 () Bool)

(assert (=> start!122940 (=> (not res!961542) (not e!805587))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122940 (= res!961542 (validMask!0 mask!2608))))

(assert (=> start!122940 e!805587))

(assert (=> start!122940 true))

(declare-fun array_inv!35998 (array!97305) Bool)

(assert (=> start!122940 (array_inv!35998 a!2831)))

(declare-fun b!1426113 () Bool)

(declare-fun res!961545 () Bool)

(assert (=> b!1426113 (=> (not res!961545) (not e!805587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97305 (_ BitVec 32)) Bool)

(assert (=> b!1426113 (= res!961545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122940 res!961542) b!1426108))

(assert (= (and b!1426108 res!961549) b!1426111))

(assert (= (and b!1426111 res!961546) b!1426110))

(assert (= (and b!1426110 res!961544) b!1426113))

(assert (= (and b!1426113 res!961545) b!1426107))

(assert (= (and b!1426107 res!961547) b!1426114))

(assert (= (and b!1426114 res!961548) b!1426112))

(assert (= (and b!1426112 res!961543) b!1426115))

(assert (= (and b!1426115 res!961540) b!1426116))

(assert (= (and b!1426116 res!961541) b!1426109))

(declare-fun m!1316715 () Bool)

(assert (=> b!1426110 m!1316715))

(assert (=> b!1426110 m!1316715))

(declare-fun m!1316717 () Bool)

(assert (=> b!1426110 m!1316717))

(declare-fun m!1316719 () Bool)

(assert (=> b!1426109 m!1316719))

(declare-fun m!1316721 () Bool)

(assert (=> b!1426111 m!1316721))

(assert (=> b!1426111 m!1316721))

(declare-fun m!1316723 () Bool)

(assert (=> b!1426111 m!1316723))

(declare-fun m!1316725 () Bool)

(assert (=> start!122940 m!1316725))

(declare-fun m!1316727 () Bool)

(assert (=> start!122940 m!1316727))

(assert (=> b!1426112 m!1316715))

(assert (=> b!1426112 m!1316715))

(declare-fun m!1316729 () Bool)

(assert (=> b!1426112 m!1316729))

(assert (=> b!1426112 m!1316729))

(assert (=> b!1426112 m!1316715))

(declare-fun m!1316731 () Bool)

(assert (=> b!1426112 m!1316731))

(declare-fun m!1316733 () Bool)

(assert (=> b!1426107 m!1316733))

(assert (=> b!1426116 m!1316715))

(assert (=> b!1426116 m!1316715))

(declare-fun m!1316735 () Bool)

(assert (=> b!1426116 m!1316735))

(declare-fun m!1316737 () Bool)

(assert (=> b!1426113 m!1316737))

(declare-fun m!1316739 () Bool)

(assert (=> b!1426115 m!1316739))

(assert (=> b!1426115 m!1316739))

(declare-fun m!1316741 () Bool)

(assert (=> b!1426115 m!1316741))

(declare-fun m!1316743 () Bool)

(assert (=> b!1426115 m!1316743))

(declare-fun m!1316745 () Bool)

(assert (=> b!1426115 m!1316745))

(push 1)

