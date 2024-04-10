; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122620 () Bool)

(assert start!122620)

(declare-fun b!1420272 () Bool)

(declare-fun res!955706 () Bool)

(declare-fun e!803345 () Bool)

(assert (=> b!1420272 (=> (not res!955706) (not e!803345))))

(declare-datatypes ((array!96985 0))(
  ( (array!96986 (arr!46810 (Array (_ BitVec 32) (_ BitVec 64))) (size!47360 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96985)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96985 (_ BitVec 32)) Bool)

(assert (=> b!1420272 (= res!955706 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1420273 () Bool)

(declare-fun res!955709 () Bool)

(declare-fun e!803344 () Bool)

(assert (=> b!1420273 (=> (not res!955709) (not e!803344))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11095 0))(
  ( (MissingZero!11095 (index!46772 (_ BitVec 32))) (Found!11095 (index!46773 (_ BitVec 32))) (Intermediate!11095 (undefined!11907 Bool) (index!46774 (_ BitVec 32)) (x!128433 (_ BitVec 32))) (Undefined!11095) (MissingVacant!11095 (index!46775 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96985 (_ BitVec 32)) SeekEntryResult!11095)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1420273 (= res!955709 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46810 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) mask!2608) (select (store (arr!46810 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81) (array!96986 (store (arr!46810 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47360 a!2831)) mask!2608) (Intermediate!11095 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(declare-fun b!1420274 () Bool)

(assert (=> b!1420274 (= e!803344 (bvslt mask!2608 #b00000000000000000000000000000000))))

(declare-fun b!1420275 () Bool)

(declare-fun res!955710 () Bool)

(assert (=> b!1420275 (=> (not res!955710) (not e!803345))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1420275 (= res!955710 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47360 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47360 a!2831))))))

(declare-fun b!1420276 () Bool)

(assert (=> b!1420276 (= e!803345 e!803344)))

(declare-fun res!955712 () Bool)

(assert (=> b!1420276 (=> (not res!955712) (not e!803344))))

(declare-fun lt!625899 () SeekEntryResult!11095)

(assert (=> b!1420276 (= res!955712 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46810 a!2831) j!81) mask!2608) (select (arr!46810 a!2831) j!81) a!2831 mask!2608) lt!625899))))

(assert (=> b!1420276 (= lt!625899 (Intermediate!11095 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1420277 () Bool)

(declare-fun res!955705 () Bool)

(assert (=> b!1420277 (=> (not res!955705) (not e!803345))))

(assert (=> b!1420277 (= res!955705 (and (= (size!47360 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47360 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47360 a!2831)) (not (= i!982 j!81))))))

(declare-fun res!955713 () Bool)

(assert (=> start!122620 (=> (not res!955713) (not e!803345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122620 (= res!955713 (validMask!0 mask!2608))))

(assert (=> start!122620 e!803345))

(assert (=> start!122620 true))

(declare-fun array_inv!35838 (array!96985) Bool)

(assert (=> start!122620 (array_inv!35838 a!2831)))

(declare-fun b!1420278 () Bool)

(declare-fun res!955714 () Bool)

(assert (=> b!1420278 (=> (not res!955714) (not e!803345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1420278 (= res!955714 (validKeyInArray!0 (select (arr!46810 a!2831) i!982)))))

(declare-fun b!1420279 () Bool)

(declare-fun res!955708 () Bool)

(assert (=> b!1420279 (=> (not res!955708) (not e!803345))))

(assert (=> b!1420279 (= res!955708 (validKeyInArray!0 (select (arr!46810 a!2831) j!81)))))

(declare-fun b!1420280 () Bool)

(declare-fun res!955707 () Bool)

(assert (=> b!1420280 (=> (not res!955707) (not e!803344))))

(assert (=> b!1420280 (= res!955707 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46810 a!2831) j!81) a!2831 mask!2608) lt!625899))))

(declare-fun b!1420281 () Bool)

(declare-fun res!955711 () Bool)

(assert (=> b!1420281 (=> (not res!955711) (not e!803345))))

(declare-datatypes ((List!33320 0))(
  ( (Nil!33317) (Cons!33316 (h!34618 (_ BitVec 64)) (t!48014 List!33320)) )
))
(declare-fun arrayNoDuplicates!0 (array!96985 (_ BitVec 32) List!33320) Bool)

(assert (=> b!1420281 (= res!955711 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33317))))

(assert (= (and start!122620 res!955713) b!1420277))

(assert (= (and b!1420277 res!955705) b!1420278))

(assert (= (and b!1420278 res!955714) b!1420279))

(assert (= (and b!1420279 res!955708) b!1420272))

(assert (= (and b!1420272 res!955706) b!1420281))

(assert (= (and b!1420281 res!955711) b!1420275))

(assert (= (and b!1420275 res!955710) b!1420276))

(assert (= (and b!1420276 res!955712) b!1420273))

(assert (= (and b!1420273 res!955709) b!1420280))

(assert (= (and b!1420280 res!955707) b!1420274))

(declare-fun m!1310775 () Bool)

(assert (=> b!1420280 m!1310775))

(assert (=> b!1420280 m!1310775))

(declare-fun m!1310777 () Bool)

(assert (=> b!1420280 m!1310777))

(declare-fun m!1310779 () Bool)

(assert (=> b!1420272 m!1310779))

(assert (=> b!1420279 m!1310775))

(assert (=> b!1420279 m!1310775))

(declare-fun m!1310781 () Bool)

(assert (=> b!1420279 m!1310781))

(declare-fun m!1310783 () Bool)

(assert (=> b!1420278 m!1310783))

(assert (=> b!1420278 m!1310783))

(declare-fun m!1310785 () Bool)

(assert (=> b!1420278 m!1310785))

(assert (=> b!1420276 m!1310775))

(assert (=> b!1420276 m!1310775))

(declare-fun m!1310787 () Bool)

(assert (=> b!1420276 m!1310787))

(assert (=> b!1420276 m!1310787))

(assert (=> b!1420276 m!1310775))

(declare-fun m!1310789 () Bool)

(assert (=> b!1420276 m!1310789))

(declare-fun m!1310791 () Bool)

(assert (=> b!1420281 m!1310791))

(declare-fun m!1310793 () Bool)

(assert (=> b!1420273 m!1310793))

(declare-fun m!1310795 () Bool)

(assert (=> b!1420273 m!1310795))

(assert (=> b!1420273 m!1310795))

(declare-fun m!1310797 () Bool)

(assert (=> b!1420273 m!1310797))

(assert (=> b!1420273 m!1310797))

(assert (=> b!1420273 m!1310795))

(declare-fun m!1310799 () Bool)

(assert (=> b!1420273 m!1310799))

(declare-fun m!1310801 () Bool)

(assert (=> start!122620 m!1310801))

(declare-fun m!1310803 () Bool)

(assert (=> start!122620 m!1310803))

(push 1)

(assert (not b!1420278))

(assert (not b!1420279))

(assert (not b!1420273))

(assert (not b!1420281))

(assert (not b!1420276))

(assert (not b!1420280))

(assert (not b!1420272))

(assert (not start!122620))

(check-sat)

