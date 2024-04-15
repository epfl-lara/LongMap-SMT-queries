; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122912 () Bool)

(assert start!122912)

(declare-fun b!1425649 () Bool)

(declare-fun res!961135 () Bool)

(declare-fun e!805406 () Bool)

(assert (=> b!1425649 (=> (not res!961135) (not e!805406))))

(declare-datatypes ((array!97230 0))(
  ( (array!97231 (arr!46933 (Array (_ BitVec 32) (_ BitVec 64))) (size!47485 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97230)

(declare-datatypes ((List!33521 0))(
  ( (Nil!33518) (Cons!33517 (h!34819 (_ BitVec 64)) (t!48207 List!33521)) )
))
(declare-fun arrayNoDuplicates!0 (array!97230 (_ BitVec 32) List!33521) Bool)

(assert (=> b!1425649 (= res!961135 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33518))))

(declare-fun b!1425650 () Bool)

(declare-fun res!961132 () Bool)

(assert (=> b!1425650 (=> (not res!961132) (not e!805406))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425650 (= res!961132 (validKeyInArray!0 (select (arr!46933 a!2831) j!81)))))

(declare-fun b!1425651 () Bool)

(declare-fun res!961141 () Bool)

(declare-fun e!805404 () Bool)

(assert (=> b!1425651 (=> (not res!961141) (not e!805404))))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11239 0))(
  ( (MissingZero!11239 (index!47348 (_ BitVec 32))) (Found!11239 (index!47349 (_ BitVec 32))) (Intermediate!11239 (undefined!12051 Bool) (index!47350 (_ BitVec 32)) (x!128974 (_ BitVec 32))) (Undefined!11239) (MissingVacant!11239 (index!47351 (_ BitVec 32))) )
))
(declare-fun lt!627691 () SeekEntryResult!11239)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97230 (_ BitVec 32)) SeekEntryResult!11239)

(assert (=> b!1425651 (= res!961141 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46933 a!2831) j!81) a!2831 mask!2608) lt!627691))))

(declare-fun b!1425652 () Bool)

(declare-fun res!961133 () Bool)

(assert (=> b!1425652 (=> (not res!961133) (not e!805406))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425652 (= res!961133 (and (= (size!47485 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47485 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47485 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425653 () Bool)

(declare-fun res!961139 () Bool)

(assert (=> b!1425653 (=> (not res!961139) (not e!805406))))

(assert (=> b!1425653 (= res!961139 (validKeyInArray!0 (select (arr!46933 a!2831) i!982)))))

(declare-fun res!961137 () Bool)

(assert (=> start!122912 (=> (not res!961137) (not e!805406))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122912 (= res!961137 (validMask!0 mask!2608))))

(assert (=> start!122912 e!805406))

(assert (=> start!122912 true))

(declare-fun array_inv!36166 (array!97230) Bool)

(assert (=> start!122912 (array_inv!36166 a!2831)))

(declare-fun b!1425648 () Bool)

(declare-fun res!961140 () Bool)

(assert (=> b!1425648 (=> (not res!961140) (not e!805406))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(assert (=> b!1425648 (= res!961140 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47485 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47485 a!2831))))))

(declare-fun b!1425654 () Bool)

(declare-fun res!961134 () Bool)

(assert (=> b!1425654 (=> (not res!961134) (not e!805406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97230 (_ BitVec 32)) Bool)

(assert (=> b!1425654 (= res!961134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425655 () Bool)

(declare-fun e!805403 () Bool)

(assert (=> b!1425655 (= e!805403 e!805404)))

(declare-fun res!961138 () Bool)

(assert (=> b!1425655 (=> (not res!961138) (not e!805404))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun lt!627692 () (_ BitVec 64))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(declare-fun lt!627689 () array!97230)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425655 (= res!961138 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627692 mask!2608) lt!627692 lt!627689 mask!2608) (Intermediate!11239 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1425655 (= lt!627692 (select (store (arr!46933 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425655 (= lt!627689 (array!97231 (store (arr!46933 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47485 a!2831)))))

(declare-fun b!1425656 () Bool)

(assert (=> b!1425656 (= e!805406 e!805403)))

(declare-fun res!961136 () Bool)

(assert (=> b!1425656 (=> (not res!961136) (not e!805403))))

(assert (=> b!1425656 (= res!961136 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46933 a!2831) j!81) mask!2608) (select (arr!46933 a!2831) j!81) a!2831 mask!2608) lt!627691))))

(assert (=> b!1425656 (= lt!627691 (Intermediate!11239 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1425657 () Bool)

(assert (=> b!1425657 (= e!805404 false)))

(declare-fun lt!627690 () SeekEntryResult!11239)

(assert (=> b!1425657 (= lt!627690 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627692 lt!627689 mask!2608))))

(assert (= (and start!122912 res!961137) b!1425652))

(assert (= (and b!1425652 res!961133) b!1425653))

(assert (= (and b!1425653 res!961139) b!1425650))

(assert (= (and b!1425650 res!961132) b!1425654))

(assert (= (and b!1425654 res!961134) b!1425649))

(assert (= (and b!1425649 res!961135) b!1425648))

(assert (= (and b!1425648 res!961140) b!1425656))

(assert (= (and b!1425656 res!961136) b!1425655))

(assert (= (and b!1425655 res!961138) b!1425651))

(assert (= (and b!1425651 res!961141) b!1425657))

(declare-fun m!1315779 () Bool)

(assert (=> start!122912 m!1315779))

(declare-fun m!1315781 () Bool)

(assert (=> start!122912 m!1315781))

(declare-fun m!1315783 () Bool)

(assert (=> b!1425653 m!1315783))

(assert (=> b!1425653 m!1315783))

(declare-fun m!1315785 () Bool)

(assert (=> b!1425653 m!1315785))

(declare-fun m!1315787 () Bool)

(assert (=> b!1425655 m!1315787))

(assert (=> b!1425655 m!1315787))

(declare-fun m!1315789 () Bool)

(assert (=> b!1425655 m!1315789))

(declare-fun m!1315791 () Bool)

(assert (=> b!1425655 m!1315791))

(declare-fun m!1315793 () Bool)

(assert (=> b!1425655 m!1315793))

(declare-fun m!1315795 () Bool)

(assert (=> b!1425654 m!1315795))

(declare-fun m!1315797 () Bool)

(assert (=> b!1425656 m!1315797))

(assert (=> b!1425656 m!1315797))

(declare-fun m!1315799 () Bool)

(assert (=> b!1425656 m!1315799))

(assert (=> b!1425656 m!1315799))

(assert (=> b!1425656 m!1315797))

(declare-fun m!1315801 () Bool)

(assert (=> b!1425656 m!1315801))

(assert (=> b!1425651 m!1315797))

(assert (=> b!1425651 m!1315797))

(declare-fun m!1315803 () Bool)

(assert (=> b!1425651 m!1315803))

(declare-fun m!1315805 () Bool)

(assert (=> b!1425657 m!1315805))

(assert (=> b!1425650 m!1315797))

(assert (=> b!1425650 m!1315797))

(declare-fun m!1315807 () Bool)

(assert (=> b!1425650 m!1315807))

(declare-fun m!1315809 () Bool)

(assert (=> b!1425649 m!1315809))

(check-sat (not b!1425656) (not b!1425657) (not b!1425649) (not b!1425650) (not b!1425651) (not start!122912) (not b!1425654) (not b!1425655) (not b!1425653))
(check-sat)
