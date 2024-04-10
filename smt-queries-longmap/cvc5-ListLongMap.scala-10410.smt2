; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122622 () Bool)

(assert start!122622)

(declare-fun b!1420300 () Bool)

(declare-fun res!955736 () Bool)

(declare-fun e!803351 () Bool)

(assert (=> b!1420300 (=> (not res!955736) (not e!803351))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!96987 0))(
  ( (array!96988 (arr!46811 (Array (_ BitVec 32) (_ BitVec 64))) (size!47361 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96987)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11096 0))(
  ( (MissingZero!11096 (index!46776 (_ BitVec 32))) (Found!11096 (index!46777 (_ BitVec 32))) (Intermediate!11096 (undefined!11908 Bool) (index!46778 (_ BitVec 32)) (x!128442 (_ BitVec 32))) (Undefined!11096) (MissingVacant!11096 (index!46779 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96987 (_ BitVec 32)) SeekEntryResult!11096)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420300 (= res!955736 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46811 a!2831) j!81) mask!2608) (select (arr!46811 a!2831) j!81) a!2831 mask!2608) (Intermediate!11096 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420301 () Bool)

(assert (=> b!1420301 (= e!803351 false)))

(declare-fun lt!625902 () SeekEntryResult!11096)

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420301 (= lt!625902 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46811 a!2831) j!81) a!2831 mask!2608))))

(declare-fun b!1420302 () Bool)

(declare-fun res!955735 () Bool)

(assert (=> b!1420302 (=> (not res!955735) (not e!803351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96987 (_ BitVec 32)) Bool)

(assert (=> b!1420302 (= res!955735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420303 () Bool)

(declare-fun res!955739 () Bool)

(assert (=> b!1420303 (=> (not res!955739) (not e!803351))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420303 (= res!955739 (validKeyInArray!0 (select (arr!46811 a!2831) i!982)))))

(declare-fun res!955741 () Bool)

(assert (=> start!122622 (=> (not res!955741) (not e!803351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122622 (= res!955741 (validMask!0 mask!2608))))

(assert (=> start!122622 e!803351))

(assert (=> start!122622 true))

(declare-fun array_inv!35839 (array!96987) Bool)

(assert (=> start!122622 (array_inv!35839 a!2831)))

(declare-fun b!1420304 () Bool)

(declare-fun res!955738 () Bool)

(assert (=> b!1420304 (=> (not res!955738) (not e!803351))))

(assert (=> b!1420304 (= res!955738 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47361 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47361 a!2831))))))

(declare-fun b!1420305 () Bool)

(declare-fun res!955734 () Bool)

(assert (=> b!1420305 (=> (not res!955734) (not e!803351))))

(assert (=> b!1420305 (= res!955734 (validKeyInArray!0 (select (arr!46811 a!2831) j!81)))))

(declare-fun b!1420306 () Bool)

(declare-fun res!955733 () Bool)

(assert (=> b!1420306 (=> (not res!955733) (not e!803351))))

(assert (=> b!1420306 (= res!955733 (and (= (size!47361 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47361 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47361 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420307 () Bool)

(declare-fun res!955740 () Bool)

(assert (=> b!1420307 (=> (not res!955740) (not e!803351))))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(assert (=> b!1420307 (= res!955740 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46811 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46811 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96988 (store (arr!46811 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47361 a!2831)) mask!2608) (Intermediate!11096 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1420308 () Bool)

(declare-fun res!955737 () Bool)

(assert (=> b!1420308 (=> (not res!955737) (not e!803351))))

(declare-datatypes ((List!33321 0))(
  ( (Nil!33318) (Cons!33317 (h!34619 (_ BitVec 64)) (t!48015 List!33321)) )
))
(declare-fun arrayNoDuplicates!0 (array!96987 (_ BitVec 32) List!33321) Bool)

(assert (=> b!1420308 (= res!955737 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33318))))

(assert (= (and start!122622 res!955741) b!1420306))

(assert (= (and b!1420306 res!955733) b!1420303))

(assert (= (and b!1420303 res!955739) b!1420305))

(assert (= (and b!1420305 res!955734) b!1420302))

(assert (= (and b!1420302 res!955735) b!1420308))

(assert (= (and b!1420308 res!955737) b!1420304))

(assert (= (and b!1420304 res!955738) b!1420300))

(assert (= (and b!1420300 res!955736) b!1420307))

(assert (= (and b!1420307 res!955740) b!1420301))

(declare-fun m!1310805 () Bool)

(assert (=> b!1420301 m!1310805))

(assert (=> b!1420301 m!1310805))

(declare-fun m!1310807 () Bool)

(assert (=> b!1420301 m!1310807))

(declare-fun m!1310809 () Bool)

(assert (=> start!122622 m!1310809))

(declare-fun m!1310811 () Bool)

(assert (=> start!122622 m!1310811))

(assert (=> b!1420305 m!1310805))

(assert (=> b!1420305 m!1310805))

(declare-fun m!1310813 () Bool)

(assert (=> b!1420305 m!1310813))

(declare-fun m!1310815 () Bool)

(assert (=> b!1420307 m!1310815))

(declare-fun m!1310817 () Bool)

(assert (=> b!1420307 m!1310817))

(assert (=> b!1420307 m!1310817))

(declare-fun m!1310819 () Bool)

(assert (=> b!1420307 m!1310819))

(assert (=> b!1420307 m!1310819))

(assert (=> b!1420307 m!1310817))

(declare-fun m!1310821 () Bool)

(assert (=> b!1420307 m!1310821))

(declare-fun m!1310823 () Bool)

(assert (=> b!1420303 m!1310823))

(assert (=> b!1420303 m!1310823))

(declare-fun m!1310825 () Bool)

(assert (=> b!1420303 m!1310825))

(declare-fun m!1310827 () Bool)

(assert (=> b!1420308 m!1310827))

(declare-fun m!1310829 () Bool)

(assert (=> b!1420302 m!1310829))

(assert (=> b!1420300 m!1310805))

(assert (=> b!1420300 m!1310805))

(declare-fun m!1310831 () Bool)

(assert (=> b!1420300 m!1310831))

(assert (=> b!1420300 m!1310831))

(assert (=> b!1420300 m!1310805))

(declare-fun m!1310833 () Bool)

(assert (=> b!1420300 m!1310833))

(push 1)

(assert (not b!1420307))

(assert (not start!122622))

(assert (not b!1420300))

(assert (not b!1420301))

(assert (not b!1420303))

(assert (not b!1420308))

(assert (not b!1420305))

(assert (not b!1420302))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

