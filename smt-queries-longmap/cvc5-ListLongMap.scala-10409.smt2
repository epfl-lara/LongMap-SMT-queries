; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122616 () Bool)

(assert start!122616)

(declare-fun b!1420212 () Bool)

(declare-fun res!955654 () Bool)

(declare-fun e!803326 () Bool)

(assert (=> b!1420212 (=> (not res!955654) (not e!803326))))

(declare-datatypes ((array!96981 0))(
  ( (array!96982 (arr!46808 (Array (_ BitVec 32) (_ BitVec 64))) (size!47358 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96981)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420212 (= res!955654 (validKeyInArray!0 (select (arr!46808 a!2831) j!81)))))

(declare-fun b!1420213 () Bool)

(declare-fun e!803325 () Bool)

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1420213 (= e!803325 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun res!955646 () Bool)

(assert (=> start!122616 (=> (not res!955646) (not e!803326))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122616 (= res!955646 (validMask!0 mask!2608))))

(assert (=> start!122616 e!803326))

(assert (=> start!122616 true))

(declare-fun array_inv!35836 (array!96981) Bool)

(assert (=> start!122616 (array_inv!35836 a!2831)))

(declare-fun b!1420214 () Bool)

(declare-fun res!955650 () Bool)

(assert (=> b!1420214 (=> (not res!955650) (not e!803326))))

(declare-datatypes ((List!33318 0))(
  ( (Nil!33315) (Cons!33314 (h!34616 (_ BitVec 64)) (t!48012 List!33318)) )
))
(declare-fun arrayNoDuplicates!0 (array!96981 (_ BitVec 32) List!33318) Bool)

(assert (=> b!1420214 (= res!955650 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33315))))

(declare-fun b!1420215 () Bool)

(declare-fun res!955651 () Bool)

(assert (=> b!1420215 (=> (not res!955651) (not e!803326))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1420215 (= res!955651 (and (= (size!47358 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47358 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47358 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420216 () Bool)

(declare-fun res!955649 () Bool)

(assert (=> b!1420216 (=> (not res!955649) (not e!803326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96981 (_ BitVec 32)) Bool)

(assert (=> b!1420216 (= res!955649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420217 () Bool)

(declare-fun res!955645 () Bool)

(assert (=> b!1420217 (=> (not res!955645) (not e!803326))))

(assert (=> b!1420217 (= res!955645 (validKeyInArray!0 (select (arr!46808 a!2831) i!982)))))

(declare-fun b!1420218 () Bool)

(assert (=> b!1420218 (= e!803326 e!803325)))

(declare-fun res!955652 () Bool)

(assert (=> b!1420218 (=> (not res!955652) (not e!803325))))

(declare-datatypes ((SeekEntryResult!11093 0))(
  ( (MissingZero!11093 (index!46764 (_ BitVec 32))) (Found!11093 (index!46765 (_ BitVec 32))) (Intermediate!11093 (undefined!11905 Bool) (index!46766 (_ BitVec 32)) (x!128431 (_ BitVec 32))) (Undefined!11093) (MissingVacant!11093 (index!46767 (_ BitVec 32))) )
))
(declare-fun lt!625893 () SeekEntryResult!11093)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96981 (_ BitVec 32)) SeekEntryResult!11093)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420218 (= res!955652 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46808 a!2831) j!81) mask!2608) (select (arr!46808 a!2831) j!81) a!2831 mask!2608) lt!625893))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1420218 (= lt!625893 (Intermediate!11093 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420219 () Bool)

(declare-fun res!955647 () Bool)

(assert (=> b!1420219 (=> (not res!955647) (not e!803325))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420219 (= res!955647 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46808 a!2831) j!81) a!2831 mask!2608) lt!625893))))

(declare-fun b!1420220 () Bool)

(declare-fun res!955648 () Bool)

(assert (=> b!1420220 (=> (not res!955648) (not e!803326))))

(assert (=> b!1420220 (= res!955648 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47358 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47358 a!2831))))))

(declare-fun b!1420221 () Bool)

(declare-fun res!955653 () Bool)

(assert (=> b!1420221 (=> (not res!955653) (not e!803325))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1420221 (= res!955653 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46808 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46808 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96982 (store (arr!46808 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47358 a!2831)) mask!2608) (Intermediate!11093 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (= (and start!122616 res!955646) b!1420215))

(assert (= (and b!1420215 res!955651) b!1420217))

(assert (= (and b!1420217 res!955645) b!1420212))

(assert (= (and b!1420212 res!955654) b!1420216))

(assert (= (and b!1420216 res!955649) b!1420214))

(assert (= (and b!1420214 res!955650) b!1420220))

(assert (= (and b!1420220 res!955648) b!1420218))

(assert (= (and b!1420218 res!955652) b!1420221))

(assert (= (and b!1420221 res!955653) b!1420219))

(assert (= (and b!1420219 res!955647) b!1420213))

(declare-fun m!1310715 () Bool)

(assert (=> b!1420219 m!1310715))

(assert (=> b!1420219 m!1310715))

(declare-fun m!1310717 () Bool)

(assert (=> b!1420219 m!1310717))

(declare-fun m!1310719 () Bool)

(assert (=> b!1420214 m!1310719))

(declare-fun m!1310721 () Bool)

(assert (=> b!1420221 m!1310721))

(declare-fun m!1310723 () Bool)

(assert (=> b!1420221 m!1310723))

(assert (=> b!1420221 m!1310723))

(declare-fun m!1310725 () Bool)

(assert (=> b!1420221 m!1310725))

(assert (=> b!1420221 m!1310725))

(assert (=> b!1420221 m!1310723))

(declare-fun m!1310727 () Bool)

(assert (=> b!1420221 m!1310727))

(assert (=> b!1420212 m!1310715))

(assert (=> b!1420212 m!1310715))

(declare-fun m!1310729 () Bool)

(assert (=> b!1420212 m!1310729))

(declare-fun m!1310731 () Bool)

(assert (=> b!1420216 m!1310731))

(declare-fun m!1310733 () Bool)

(assert (=> start!122616 m!1310733))

(declare-fun m!1310735 () Bool)

(assert (=> start!122616 m!1310735))

(assert (=> b!1420218 m!1310715))

(assert (=> b!1420218 m!1310715))

(declare-fun m!1310737 () Bool)

(assert (=> b!1420218 m!1310737))

(assert (=> b!1420218 m!1310737))

(assert (=> b!1420218 m!1310715))

(declare-fun m!1310739 () Bool)

(assert (=> b!1420218 m!1310739))

(declare-fun m!1310741 () Bool)

(assert (=> b!1420217 m!1310741))

(assert (=> b!1420217 m!1310741))

(declare-fun m!1310743 () Bool)

(assert (=> b!1420217 m!1310743))

(push 1)

