; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122912 () Bool)

(assert start!122912)

(declare-fun b!1425669 () Bool)

(declare-fun e!805420 () Bool)

(declare-fun e!805418 () Bool)

(assert (=> b!1425669 (= e!805420 e!805418)))

(declare-fun res!961104 () Bool)

(assert (=> b!1425669 (=> (not res!961104) (not e!805418))))

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((array!97277 0))(
  ( (array!97278 (arr!46956 (Array (_ BitVec 32) (_ BitVec 64))) (size!47506 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97277)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11235 0))(
  ( (MissingZero!11235 (index!47332 (_ BitVec 32))) (Found!11235 (index!47333 (_ BitVec 32))) (Intermediate!11235 (undefined!12047 Bool) (index!47334 (_ BitVec 32)) (x!128965 (_ BitVec 32))) (Undefined!11235) (MissingVacant!11235 (index!47335 (_ BitVec 32))) )
))
(declare-fun lt!627857 () SeekEntryResult!11235)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97277 (_ BitVec 32)) SeekEntryResult!11235)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1425669 (= res!961104 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46956 a!2831) j!81) mask!2608) (select (arr!46956 a!2831) j!81) a!2831 mask!2608) lt!627857))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1425669 (= lt!627857 (Intermediate!11235 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun res!961108 () Bool)

(assert (=> start!122912 (=> (not res!961108) (not e!805420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122912 (= res!961108 (validMask!0 mask!2608))))

(assert (=> start!122912 e!805420))

(assert (=> start!122912 true))

(declare-fun array_inv!35984 (array!97277) Bool)

(assert (=> start!122912 (array_inv!35984 a!2831)))

(declare-fun b!1425670 () Bool)

(declare-fun res!961110 () Bool)

(assert (=> b!1425670 (=> (not res!961110) (not e!805420))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1425670 (= res!961110 (validKeyInArray!0 (select (arr!46956 a!2831) j!81)))))

(declare-fun b!1425671 () Bool)

(declare-fun res!961103 () Bool)

(assert (=> b!1425671 (=> (not res!961103) (not e!805420))))

(declare-datatypes ((List!33466 0))(
  ( (Nil!33463) (Cons!33462 (h!34764 (_ BitVec 64)) (t!48160 List!33466)) )
))
(declare-fun arrayNoDuplicates!0 (array!97277 (_ BitVec 32) List!33466) Bool)

(assert (=> b!1425671 (= res!961103 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33463))))

(declare-fun b!1425672 () Bool)

(declare-fun e!805419 () Bool)

(assert (=> b!1425672 (= e!805419 false)))

(declare-fun lt!627858 () array!97277)

(declare-fun lt!627856 () (_ BitVec 64))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun lt!627855 () SeekEntryResult!11235)

(assert (=> b!1425672 (= lt!627855 (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627856 lt!627858 mask!2608))))

(declare-fun b!1425673 () Bool)

(declare-fun res!961107 () Bool)

(assert (=> b!1425673 (=> (not res!961107) (not e!805420))))

(assert (=> b!1425673 (= res!961107 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47506 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47506 a!2831))))))

(declare-fun b!1425674 () Bool)

(declare-fun res!961109 () Bool)

(assert (=> b!1425674 (=> (not res!961109) (not e!805420))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1425674 (= res!961109 (validKeyInArray!0 (select (arr!46956 a!2831) i!982)))))

(declare-fun b!1425675 () Bool)

(declare-fun res!961102 () Bool)

(assert (=> b!1425675 (=> (not res!961102) (not e!805420))))

(assert (=> b!1425675 (= res!961102 (and (= (size!47506 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47506 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47506 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1425676 () Bool)

(declare-fun res!961105 () Bool)

(assert (=> b!1425676 (=> (not res!961105) (not e!805419))))

(assert (=> b!1425676 (= res!961105 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46956 a!2831) j!81) a!2831 mask!2608) lt!627857))))

(declare-fun b!1425677 () Bool)

(declare-fun res!961111 () Bool)

(assert (=> b!1425677 (=> (not res!961111) (not e!805420))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97277 (_ BitVec 32)) Bool)

(assert (=> b!1425677 (= res!961111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1425678 () Bool)

(assert (=> b!1425678 (= e!805418 e!805419)))

(declare-fun res!961106 () Bool)

(assert (=> b!1425678 (=> (not res!961106) (not e!805419))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1425678 (= res!961106 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627856 mask!2608) lt!627856 lt!627858 mask!2608) (Intermediate!11235 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13)))))

(assert (=> b!1425678 (= lt!627856 (select (store (arr!46956 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1425678 (= lt!627858 (array!97278 (store (arr!46956 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47506 a!2831)))))

(assert (= (and start!122912 res!961108) b!1425675))

(assert (= (and b!1425675 res!961102) b!1425674))

(assert (= (and b!1425674 res!961109) b!1425670))

(assert (= (and b!1425670 res!961110) b!1425677))

(assert (= (and b!1425677 res!961111) b!1425671))

(assert (= (and b!1425671 res!961103) b!1425673))

(assert (= (and b!1425673 res!961107) b!1425669))

(assert (= (and b!1425669 res!961104) b!1425678))

(assert (= (and b!1425678 res!961106) b!1425676))

(assert (= (and b!1425676 res!961105) b!1425672))

(declare-fun m!1316267 () Bool)

(assert (=> b!1425672 m!1316267))

(declare-fun m!1316269 () Bool)

(assert (=> b!1425677 m!1316269))

(declare-fun m!1316271 () Bool)

(assert (=> b!1425670 m!1316271))

(assert (=> b!1425670 m!1316271))

(declare-fun m!1316273 () Bool)

(assert (=> b!1425670 m!1316273))

(declare-fun m!1316275 () Bool)

(assert (=> start!122912 m!1316275))

(declare-fun m!1316277 () Bool)

(assert (=> start!122912 m!1316277))

(assert (=> b!1425676 m!1316271))

(assert (=> b!1425676 m!1316271))

(declare-fun m!1316279 () Bool)

(assert (=> b!1425676 m!1316279))

(declare-fun m!1316281 () Bool)

(assert (=> b!1425671 m!1316281))

(declare-fun m!1316283 () Bool)

(assert (=> b!1425678 m!1316283))

(assert (=> b!1425678 m!1316283))

(declare-fun m!1316285 () Bool)

(assert (=> b!1425678 m!1316285))

(declare-fun m!1316287 () Bool)

(assert (=> b!1425678 m!1316287))

(declare-fun m!1316289 () Bool)

(assert (=> b!1425678 m!1316289))

(assert (=> b!1425669 m!1316271))

(assert (=> b!1425669 m!1316271))

(declare-fun m!1316291 () Bool)

(assert (=> b!1425669 m!1316291))

(assert (=> b!1425669 m!1316291))

(assert (=> b!1425669 m!1316271))

(declare-fun m!1316293 () Bool)

(assert (=> b!1425669 m!1316293))

(declare-fun m!1316295 () Bool)

(assert (=> b!1425674 m!1316295))

(assert (=> b!1425674 m!1316295))

(declare-fun m!1316297 () Bool)

(assert (=> b!1425674 m!1316297))

(check-sat (not b!1425677) (not b!1425674) (not b!1425676) (not b!1425669) (not start!122912) (not b!1425671) (not b!1425670) (not b!1425678) (not b!1425672))
(check-sat)
