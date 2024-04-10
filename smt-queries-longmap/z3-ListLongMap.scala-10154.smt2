; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119690 () Bool)

(assert start!119690)

(declare-fun b!1394224 () Bool)

(declare-fun res!933635 () Bool)

(declare-fun e!789409 () Bool)

(assert (=> b!1394224 (=> (not res!933635) (not e!789409))))

(declare-datatypes ((array!95372 0))(
  ( (array!95373 (arr!46044 (Array (_ BitVec 32) (_ BitVec 64))) (size!46594 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95372)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394224 (= res!933635 (validKeyInArray!0 (select (arr!46044 a!2901) i!1037)))))

(declare-fun b!1394225 () Bool)

(declare-fun res!933639 () Bool)

(assert (=> b!1394225 (=> (not res!933639) (not e!789409))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95372 (_ BitVec 32)) Bool)

(assert (=> b!1394225 (= res!933639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394226 () Bool)

(declare-fun res!933637 () Bool)

(assert (=> b!1394226 (=> (not res!933637) (not e!789409))))

(declare-datatypes ((List!32563 0))(
  ( (Nil!32560) (Cons!32559 (h!33792 (_ BitVec 64)) (t!47257 List!32563)) )
))
(declare-fun arrayNoDuplicates!0 (array!95372 (_ BitVec 32) List!32563) Bool)

(assert (=> b!1394226 (= res!933637 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32560))))

(declare-fun b!1394227 () Bool)

(declare-fun res!933638 () Bool)

(declare-fun e!789410 () Bool)

(assert (=> b!1394227 (=> res!933638 e!789410)))

(declare-fun lt!612305 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10361 0))(
  ( (MissingZero!10361 (index!43815 (_ BitVec 32))) (Found!10361 (index!43816 (_ BitVec 32))) (Intermediate!10361 (undefined!11173 Bool) (index!43817 (_ BitVec 32)) (x!125485 (_ BitVec 32))) (Undefined!10361) (MissingVacant!10361 (index!43818 (_ BitVec 32))) )
))
(declare-fun lt!612308 () SeekEntryResult!10361)

(assert (=> b!1394227 (= res!933638 (or (bvslt (x!125485 lt!612308) #b00000000000000000000000000000000) (bvsgt (x!125485 lt!612308) #b01111111111111111111111111111110) (bvslt lt!612305 #b00000000000000000000000000000000) (bvsge lt!612305 (size!46594 a!2901)) (bvslt (index!43817 lt!612308) #b00000000000000000000000000000000) (bvsge (index!43817 lt!612308) (size!46594 a!2901)) (not (= lt!612308 (Intermediate!10361 false (index!43817 lt!612308) (x!125485 lt!612308))))))))

(declare-fun b!1394228 () Bool)

(declare-fun res!933632 () Bool)

(assert (=> b!1394228 (=> (not res!933632) (not e!789409))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394228 (= res!933632 (validKeyInArray!0 (select (arr!46044 a!2901) j!112)))))

(declare-fun res!933640 () Bool)

(assert (=> start!119690 (=> (not res!933640) (not e!789409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119690 (= res!933640 (validMask!0 mask!2840))))

(assert (=> start!119690 e!789409))

(assert (=> start!119690 true))

(declare-fun array_inv!35072 (array!95372) Bool)

(assert (=> start!119690 (array_inv!35072 a!2901)))

(declare-fun b!1394229 () Bool)

(assert (=> b!1394229 (= e!789410 true)))

(declare-fun lt!612304 () SeekEntryResult!10361)

(declare-fun lt!612307 () array!95372)

(declare-fun lt!612306 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95372 (_ BitVec 32)) SeekEntryResult!10361)

(assert (=> b!1394229 (= lt!612304 (seekEntryOrOpen!0 lt!612306 lt!612307 mask!2840))))

(declare-datatypes ((Unit!46726 0))(
  ( (Unit!46727) )
))
(declare-fun lt!612309 () Unit!46726)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46726)

(assert (=> b!1394229 (= lt!612309 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612305 (x!125485 lt!612308) (index!43817 lt!612308) mask!2840))))

(declare-fun b!1394230 () Bool)

(declare-fun e!789408 () Bool)

(assert (=> b!1394230 (= e!789409 (not e!789408))))

(declare-fun res!933636 () Bool)

(assert (=> b!1394230 (=> res!933636 e!789408)))

(get-info :version)

(assert (=> b!1394230 (= res!933636 (or (not ((_ is Intermediate!10361) lt!612308)) (undefined!11173 lt!612308)))))

(assert (=> b!1394230 (= lt!612304 (Found!10361 j!112))))

(assert (=> b!1394230 (= lt!612304 (seekEntryOrOpen!0 (select (arr!46044 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1394230 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!612303 () Unit!46726)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46726)

(assert (=> b!1394230 (= lt!612303 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95372 (_ BitVec 32)) SeekEntryResult!10361)

(assert (=> b!1394230 (= lt!612308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612305 (select (arr!46044 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394230 (= lt!612305 (toIndex!0 (select (arr!46044 a!2901) j!112) mask!2840))))

(declare-fun b!1394231 () Bool)

(declare-fun res!933634 () Bool)

(assert (=> b!1394231 (=> (not res!933634) (not e!789409))))

(assert (=> b!1394231 (= res!933634 (and (= (size!46594 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46594 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46594 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394232 () Bool)

(assert (=> b!1394232 (= e!789408 e!789410)))

(declare-fun res!933633 () Bool)

(assert (=> b!1394232 (=> res!933633 e!789410)))

(assert (=> b!1394232 (= res!933633 (not (= lt!612308 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612306 mask!2840) lt!612306 lt!612307 mask!2840))))))

(assert (=> b!1394232 (= lt!612306 (select (store (arr!46044 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394232 (= lt!612307 (array!95373 (store (arr!46044 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46594 a!2901)))))

(assert (= (and start!119690 res!933640) b!1394231))

(assert (= (and b!1394231 res!933634) b!1394224))

(assert (= (and b!1394224 res!933635) b!1394228))

(assert (= (and b!1394228 res!933632) b!1394225))

(assert (= (and b!1394225 res!933639) b!1394226))

(assert (= (and b!1394226 res!933637) b!1394230))

(assert (= (and b!1394230 (not res!933636)) b!1394232))

(assert (= (and b!1394232 (not res!933633)) b!1394227))

(assert (= (and b!1394227 (not res!933638)) b!1394229))

(declare-fun m!1280459 () Bool)

(assert (=> b!1394230 m!1280459))

(declare-fun m!1280461 () Bool)

(assert (=> b!1394230 m!1280461))

(assert (=> b!1394230 m!1280459))

(assert (=> b!1394230 m!1280459))

(declare-fun m!1280463 () Bool)

(assert (=> b!1394230 m!1280463))

(declare-fun m!1280465 () Bool)

(assert (=> b!1394230 m!1280465))

(assert (=> b!1394230 m!1280459))

(declare-fun m!1280467 () Bool)

(assert (=> b!1394230 m!1280467))

(declare-fun m!1280469 () Bool)

(assert (=> b!1394230 m!1280469))

(assert (=> b!1394228 m!1280459))

(assert (=> b!1394228 m!1280459))

(declare-fun m!1280471 () Bool)

(assert (=> b!1394228 m!1280471))

(declare-fun m!1280473 () Bool)

(assert (=> b!1394232 m!1280473))

(assert (=> b!1394232 m!1280473))

(declare-fun m!1280475 () Bool)

(assert (=> b!1394232 m!1280475))

(declare-fun m!1280477 () Bool)

(assert (=> b!1394232 m!1280477))

(declare-fun m!1280479 () Bool)

(assert (=> b!1394232 m!1280479))

(declare-fun m!1280481 () Bool)

(assert (=> start!119690 m!1280481))

(declare-fun m!1280483 () Bool)

(assert (=> start!119690 m!1280483))

(declare-fun m!1280485 () Bool)

(assert (=> b!1394225 m!1280485))

(declare-fun m!1280487 () Bool)

(assert (=> b!1394224 m!1280487))

(assert (=> b!1394224 m!1280487))

(declare-fun m!1280489 () Bool)

(assert (=> b!1394224 m!1280489))

(declare-fun m!1280491 () Bool)

(assert (=> b!1394226 m!1280491))

(declare-fun m!1280493 () Bool)

(assert (=> b!1394229 m!1280493))

(declare-fun m!1280495 () Bool)

(assert (=> b!1394229 m!1280495))

(check-sat (not b!1394225) (not b!1394229) (not b!1394226) (not start!119690) (not b!1394228) (not b!1394224) (not b!1394230) (not b!1394232))
(check-sat)
