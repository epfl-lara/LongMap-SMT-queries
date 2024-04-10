; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122676 () Bool)

(assert start!122676)

(declare-fun b!1421107 () Bool)

(declare-fun res!956547 () Bool)

(declare-fun e!803627 () Bool)

(assert (=> b!1421107 (=> (not res!956547) (not e!803627))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1421107 (= res!956547 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1421109 () Bool)

(declare-fun res!956542 () Bool)

(declare-fun e!803624 () Bool)

(assert (=> b!1421109 (=> (not res!956542) (not e!803624))))

(declare-datatypes ((array!97041 0))(
  ( (array!97042 (arr!46838 (Array (_ BitVec 32) (_ BitVec 64))) (size!47388 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97041)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97041 (_ BitVec 32)) Bool)

(assert (=> b!1421109 (= res!956542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1421110 () Bool)

(declare-fun res!956548 () Bool)

(assert (=> b!1421110 (=> (not res!956548) (not e!803624))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1421110 (= res!956548 (validKeyInArray!0 (select (arr!46838 a!2831) j!81)))))

(declare-fun b!1421111 () Bool)

(declare-fun res!956545 () Bool)

(assert (=> b!1421111 (=> (not res!956545) (not e!803624))))

(declare-datatypes ((List!33348 0))(
  ( (Nil!33345) (Cons!33344 (h!34646 (_ BitVec 64)) (t!48042 List!33348)) )
))
(declare-fun arrayNoDuplicates!0 (array!97041 (_ BitVec 32) List!33348) Bool)

(assert (=> b!1421111 (= res!956545 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33345))))

(declare-fun b!1421112 () Bool)

(declare-fun e!803626 () Bool)

(assert (=> b!1421112 (= e!803624 e!803626)))

(declare-fun res!956544 () Bool)

(assert (=> b!1421112 (=> (not res!956544) (not e!803626))))

(declare-datatypes ((SeekEntryResult!11123 0))(
  ( (MissingZero!11123 (index!46884 (_ BitVec 32))) (Found!11123 (index!46885 (_ BitVec 32))) (Intermediate!11123 (undefined!11935 Bool) (index!46886 (_ BitVec 32)) (x!128541 (_ BitVec 32))) (Undefined!11123) (MissingVacant!11123 (index!46887 (_ BitVec 32))) )
))
(declare-fun lt!626126 () SeekEntryResult!11123)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97041 (_ BitVec 32)) SeekEntryResult!11123)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1421112 (= res!956544 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46838 a!2831) j!81) mask!2608) (select (arr!46838 a!2831) j!81) a!2831 mask!2608) lt!626126))))

(assert (=> b!1421112 (= lt!626126 (Intermediate!11123 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1421108 () Bool)

(declare-fun res!956543 () Bool)

(assert (=> b!1421108 (=> (not res!956543) (not e!803624))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1421108 (= res!956543 (validKeyInArray!0 (select (arr!46838 a!2831) i!982)))))

(declare-fun res!956549 () Bool)

(assert (=> start!122676 (=> (not res!956549) (not e!803624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122676 (= res!956549 (validMask!0 mask!2608))))

(assert (=> start!122676 e!803624))

(assert (=> start!122676 true))

(declare-fun array_inv!35866 (array!97041) Bool)

(assert (=> start!122676 (array_inv!35866 a!2831)))

(declare-fun b!1421113 () Bool)

(assert (=> b!1421113 (= e!803626 e!803627)))

(declare-fun res!956546 () Bool)

(assert (=> b!1421113 (=> (not res!956546) (not e!803627))))

(declare-fun lt!626129 () (_ BitVec 64))

(declare-fun lt!626127 () array!97041)

(declare-fun lt!626128 () SeekEntryResult!11123)

(assert (=> b!1421113 (= res!956546 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626129 mask!2608) lt!626129 lt!626127 mask!2608) lt!626128))))

(assert (=> b!1421113 (= lt!626128 (Intermediate!11123 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1421113 (= lt!626129 (select (store (arr!46838 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1421113 (= lt!626127 (array!97042 (store (arr!46838 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47388 a!2831)))))

(declare-fun b!1421114 () Bool)

(declare-fun res!956551 () Bool)

(assert (=> b!1421114 (=> (not res!956551) (not e!803627))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1421114 (= res!956551 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626129 lt!626127 mask!2608) lt!626128))))

(declare-fun b!1421115 () Bool)

(declare-fun res!956540 () Bool)

(assert (=> b!1421115 (=> (not res!956540) (not e!803627))))

(assert (=> b!1421115 (= res!956540 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46838 a!2831) j!81) a!2831 mask!2608) lt!626126))))

(declare-fun b!1421116 () Bool)

(declare-fun res!956550 () Bool)

(assert (=> b!1421116 (=> (not res!956550) (not e!803624))))

(assert (=> b!1421116 (= res!956550 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47388 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47388 a!2831))))))

(declare-fun b!1421117 () Bool)

(assert (=> b!1421117 (= e!803627 (not true))))

(assert (=> b!1421117 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608)))

(declare-datatypes ((Unit!48082 0))(
  ( (Unit!48083) )
))
(declare-fun lt!626130 () Unit!48082)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97041 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48082)

(assert (=> b!1421117 (= lt!626130 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1421118 () Bool)

(declare-fun res!956541 () Bool)

(assert (=> b!1421118 (=> (not res!956541) (not e!803624))))

(assert (=> b!1421118 (= res!956541 (and (= (size!47388 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47388 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47388 a!2831)) (not (= i!982 j!81))))))

(assert (= (and start!122676 res!956549) b!1421118))

(assert (= (and b!1421118 res!956541) b!1421108))

(assert (= (and b!1421108 res!956543) b!1421110))

(assert (= (and b!1421110 res!956548) b!1421109))

(assert (= (and b!1421109 res!956542) b!1421111))

(assert (= (and b!1421111 res!956545) b!1421116))

(assert (= (and b!1421116 res!956550) b!1421112))

(assert (= (and b!1421112 res!956544) b!1421113))

(assert (= (and b!1421113 res!956546) b!1421115))

(assert (= (and b!1421115 res!956540) b!1421114))

(assert (= (and b!1421114 res!956551) b!1421107))

(assert (= (and b!1421107 res!956547) b!1421117))

(declare-fun m!1311651 () Bool)

(assert (=> b!1421115 m!1311651))

(assert (=> b!1421115 m!1311651))

(declare-fun m!1311653 () Bool)

(assert (=> b!1421115 m!1311653))

(assert (=> b!1421112 m!1311651))

(assert (=> b!1421112 m!1311651))

(declare-fun m!1311655 () Bool)

(assert (=> b!1421112 m!1311655))

(assert (=> b!1421112 m!1311655))

(assert (=> b!1421112 m!1311651))

(declare-fun m!1311657 () Bool)

(assert (=> b!1421112 m!1311657))

(declare-fun m!1311659 () Bool)

(assert (=> b!1421114 m!1311659))

(declare-fun m!1311661 () Bool)

(assert (=> b!1421113 m!1311661))

(assert (=> b!1421113 m!1311661))

(declare-fun m!1311663 () Bool)

(assert (=> b!1421113 m!1311663))

(declare-fun m!1311665 () Bool)

(assert (=> b!1421113 m!1311665))

(declare-fun m!1311667 () Bool)

(assert (=> b!1421113 m!1311667))

(declare-fun m!1311669 () Bool)

(assert (=> start!122676 m!1311669))

(declare-fun m!1311671 () Bool)

(assert (=> start!122676 m!1311671))

(declare-fun m!1311673 () Bool)

(assert (=> b!1421117 m!1311673))

(declare-fun m!1311675 () Bool)

(assert (=> b!1421117 m!1311675))

(assert (=> b!1421110 m!1311651))

(assert (=> b!1421110 m!1311651))

(declare-fun m!1311677 () Bool)

(assert (=> b!1421110 m!1311677))

(declare-fun m!1311679 () Bool)

(assert (=> b!1421109 m!1311679))

(declare-fun m!1311681 () Bool)

(assert (=> b!1421108 m!1311681))

(assert (=> b!1421108 m!1311681))

(declare-fun m!1311683 () Bool)

(assert (=> b!1421108 m!1311683))

(declare-fun m!1311685 () Bool)

(assert (=> b!1421111 m!1311685))

(push 1)

