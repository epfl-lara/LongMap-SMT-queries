; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122606 () Bool)

(assert start!122606)

(declare-fun b!1420079 () Bool)

(declare-fun e!803293 () Bool)

(assert (=> b!1420079 (= e!803293 false)))

(declare-datatypes ((array!96971 0))(
  ( (array!96972 (arr!46803 (Array (_ BitVec 32) (_ BitVec 64))) (size!47353 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96971)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun i!982 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11088 0))(
  ( (MissingZero!11088 (index!46744 (_ BitVec 32))) (Found!11088 (index!46745 (_ BitVec 32))) (Intermediate!11088 (undefined!11900 Bool) (index!46746 (_ BitVec 32)) (x!128410 (_ BitVec 32))) (Undefined!11088) (MissingVacant!11088 (index!46747 (_ BitVec 32))) )
))
(declare-fun lt!625878 () SeekEntryResult!11088)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96971 (_ BitVec 32)) SeekEntryResult!11088)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420079 (= lt!625878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46803 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46803 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96972 (store (arr!46803 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47353 a!2831)) mask!2608))))

(declare-fun b!1420080 () Bool)

(declare-fun res!955515 () Bool)

(assert (=> b!1420080 (=> (not res!955515) (not e!803293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420080 (= res!955515 (validKeyInArray!0 (select (arr!46803 a!2831) j!81)))))

(declare-fun b!1420081 () Bool)

(declare-fun res!955514 () Bool)

(assert (=> b!1420081 (=> (not res!955514) (not e!803293))))

(assert (=> b!1420081 (= res!955514 (validKeyInArray!0 (select (arr!46803 a!2831) i!982)))))

(declare-fun b!1420082 () Bool)

(declare-fun res!955512 () Bool)

(assert (=> b!1420082 (=> (not res!955512) (not e!803293))))

(declare-datatypes ((List!33313 0))(
  ( (Nil!33310) (Cons!33309 (h!34611 (_ BitVec 64)) (t!48007 List!33313)) )
))
(declare-fun arrayNoDuplicates!0 (array!96971 (_ BitVec 32) List!33313) Bool)

(assert (=> b!1420082 (= res!955512 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33310))))

(declare-fun res!955516 () Bool)

(assert (=> start!122606 (=> (not res!955516) (not e!803293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122606 (= res!955516 (validMask!0 mask!2608))))

(assert (=> start!122606 e!803293))

(assert (=> start!122606 true))

(declare-fun array_inv!35831 (array!96971) Bool)

(assert (=> start!122606 (array_inv!35831 a!2831)))

(declare-fun b!1420083 () Bool)

(declare-fun res!955518 () Bool)

(assert (=> b!1420083 (=> (not res!955518) (not e!803293))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1420083 (= res!955518 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46803 a!2831) j!81) mask!2608) (select (arr!46803 a!2831) j!81) a!2831 mask!2608) (Intermediate!11088 false intermediateBeforeIndex!13 intermediateBeforeX!13)))))

(declare-fun b!1420084 () Bool)

(declare-fun res!955519 () Bool)

(assert (=> b!1420084 (=> (not res!955519) (not e!803293))))

(assert (=> b!1420084 (= res!955519 (and (= (size!47353 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47353 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47353 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1420085 () Bool)

(declare-fun res!955513 () Bool)

(assert (=> b!1420085 (=> (not res!955513) (not e!803293))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420085 (= res!955513 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47353 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47353 a!2831))))))

(declare-fun b!1420086 () Bool)

(declare-fun res!955517 () Bool)

(assert (=> b!1420086 (=> (not res!955517) (not e!803293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96971 (_ BitVec 32)) Bool)

(assert (=> b!1420086 (= res!955517 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(assert (= (and start!122606 res!955516) b!1420084))

(assert (= (and b!1420084 res!955519) b!1420081))

(assert (= (and b!1420081 res!955514) b!1420080))

(assert (= (and b!1420080 res!955515) b!1420086))

(assert (= (and b!1420086 res!955517) b!1420082))

(assert (= (and b!1420082 res!955512) b!1420085))

(assert (= (and b!1420085 res!955513) b!1420083))

(assert (= (and b!1420083 res!955518) b!1420079))

(declare-fun m!1310569 () Bool)

(assert (=> b!1420083 m!1310569))

(assert (=> b!1420083 m!1310569))

(declare-fun m!1310571 () Bool)

(assert (=> b!1420083 m!1310571))

(assert (=> b!1420083 m!1310571))

(assert (=> b!1420083 m!1310569))

(declare-fun m!1310573 () Bool)

(assert (=> b!1420083 m!1310573))

(assert (=> b!1420080 m!1310569))

(assert (=> b!1420080 m!1310569))

(declare-fun m!1310575 () Bool)

(assert (=> b!1420080 m!1310575))

(declare-fun m!1310577 () Bool)

(assert (=> b!1420081 m!1310577))

(assert (=> b!1420081 m!1310577))

(declare-fun m!1310579 () Bool)

(assert (=> b!1420081 m!1310579))

(declare-fun m!1310581 () Bool)

(assert (=> b!1420082 m!1310581))

(declare-fun m!1310583 () Bool)

(assert (=> b!1420086 m!1310583))

(declare-fun m!1310585 () Bool)

(assert (=> start!122606 m!1310585))

(declare-fun m!1310587 () Bool)

(assert (=> start!122606 m!1310587))

(declare-fun m!1310589 () Bool)

(assert (=> b!1420079 m!1310589))

(declare-fun m!1310591 () Bool)

(assert (=> b!1420079 m!1310591))

(assert (=> b!1420079 m!1310591))

(declare-fun m!1310593 () Bool)

(assert (=> b!1420079 m!1310593))

(assert (=> b!1420079 m!1310593))

(assert (=> b!1420079 m!1310591))

(declare-fun m!1310595 () Bool)

(assert (=> b!1420079 m!1310595))

(check-sat (not b!1420086) (not start!122606) (not b!1420082) (not b!1420080) (not b!1420079) (not b!1420083) (not b!1420081))
