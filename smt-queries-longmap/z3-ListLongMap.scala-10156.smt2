; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119696 () Bool)

(assert start!119696)

(declare-fun b!1394278 () Bool)

(declare-fun e!789429 () Bool)

(declare-fun e!789431 () Bool)

(assert (=> b!1394278 (= e!789429 (not e!789431))))

(declare-fun res!933737 () Bool)

(assert (=> b!1394278 (=> res!933737 e!789431)))

(declare-datatypes ((SeekEntryResult!10367 0))(
  ( (MissingZero!10367 (index!43839 (_ BitVec 32))) (Found!10367 (index!43840 (_ BitVec 32))) (Intermediate!10367 (undefined!11179 Bool) (index!43841 (_ BitVec 32)) (x!125504 (_ BitVec 32))) (Undefined!10367) (MissingVacant!10367 (index!43842 (_ BitVec 32))) )
))
(declare-fun lt!612224 () SeekEntryResult!10367)

(get-info :version)

(assert (=> b!1394278 (= res!933737 (or (not ((_ is Intermediate!10367) lt!612224)) (undefined!11179 lt!612224)))))

(declare-fun lt!612223 () SeekEntryResult!10367)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394278 (= lt!612223 (Found!10367 j!112))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95331 0))(
  ( (array!95332 (arr!46024 (Array (_ BitVec 32) (_ BitVec 64))) (size!46576 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95331)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95331 (_ BitVec 32)) SeekEntryResult!10367)

(assert (=> b!1394278 (= lt!612223 (seekEntryOrOpen!0 (select (arr!46024 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95331 (_ BitVec 32)) Bool)

(assert (=> b!1394278 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!46581 0))(
  ( (Unit!46582) )
))
(declare-fun lt!612222 () Unit!46581)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95331 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46581)

(assert (=> b!1394278 (= lt!612222 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!612218 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95331 (_ BitVec 32)) SeekEntryResult!10367)

(assert (=> b!1394278 (= lt!612224 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!612218 (select (arr!46024 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394278 (= lt!612218 (toIndex!0 (select (arr!46024 a!2901) j!112) mask!2840))))

(declare-fun res!933738 () Bool)

(assert (=> start!119696 (=> (not res!933738) (not e!789429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119696 (= res!933738 (validMask!0 mask!2840))))

(assert (=> start!119696 e!789429))

(assert (=> start!119696 true))

(declare-fun array_inv!35257 (array!95331) Bool)

(assert (=> start!119696 (array_inv!35257 a!2901)))

(declare-fun b!1394279 () Bool)

(declare-fun res!933744 () Bool)

(assert (=> b!1394279 (=> (not res!933744) (not e!789429))))

(declare-datatypes ((List!32621 0))(
  ( (Nil!32618) (Cons!32617 (h!33850 (_ BitVec 64)) (t!47307 List!32621)) )
))
(declare-fun arrayNoDuplicates!0 (array!95331 (_ BitVec 32) List!32621) Bool)

(assert (=> b!1394279 (= res!933744 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32618))))

(declare-fun b!1394280 () Bool)

(declare-fun res!933739 () Bool)

(assert (=> b!1394280 (=> (not res!933739) (not e!789429))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394280 (= res!933739 (validKeyInArray!0 (select (arr!46024 a!2901) i!1037)))))

(declare-fun b!1394281 () Bool)

(declare-fun res!933745 () Bool)

(assert (=> b!1394281 (=> (not res!933745) (not e!789429))))

(assert (=> b!1394281 (= res!933745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394282 () Bool)

(declare-fun res!933742 () Bool)

(assert (=> b!1394282 (=> (not res!933742) (not e!789429))))

(assert (=> b!1394282 (= res!933742 (validKeyInArray!0 (select (arr!46024 a!2901) j!112)))))

(declare-fun b!1394283 () Bool)

(declare-fun res!933743 () Bool)

(assert (=> b!1394283 (=> (not res!933743) (not e!789429))))

(assert (=> b!1394283 (= res!933743 (and (= (size!46576 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46576 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46576 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394284 () Bool)

(declare-fun res!933740 () Bool)

(declare-fun e!789428 () Bool)

(assert (=> b!1394284 (=> res!933740 e!789428)))

(assert (=> b!1394284 (= res!933740 (or (bvslt (x!125504 lt!612224) #b00000000000000000000000000000000) (bvsgt (x!125504 lt!612224) #b01111111111111111111111111111110) (bvslt lt!612218 #b00000000000000000000000000000000) (bvsge lt!612218 (size!46576 a!2901)) (bvslt (index!43841 lt!612224) #b00000000000000000000000000000000) (bvsge (index!43841 lt!612224) (size!46576 a!2901)) (not (= lt!612224 (Intermediate!10367 false (index!43841 lt!612224) (x!125504 lt!612224))))))))

(declare-fun b!1394285 () Bool)

(assert (=> b!1394285 (= e!789431 e!789428)))

(declare-fun res!933741 () Bool)

(assert (=> b!1394285 (=> res!933741 e!789428)))

(declare-fun lt!612221 () (_ BitVec 64))

(declare-fun lt!612219 () array!95331)

(assert (=> b!1394285 (= res!933741 (not (= lt!612224 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!612221 mask!2840) lt!612221 lt!612219 mask!2840))))))

(assert (=> b!1394285 (= lt!612221 (select (store (arr!46024 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1394285 (= lt!612219 (array!95332 (store (arr!46024 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46576 a!2901)))))

(declare-fun b!1394286 () Bool)

(assert (=> b!1394286 (= e!789428 true)))

(assert (=> b!1394286 (= lt!612223 (seekEntryOrOpen!0 lt!612221 lt!612219 mask!2840))))

(declare-fun lt!612220 () Unit!46581)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!95331 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46581)

(assert (=> b!1394286 (= lt!612220 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!612218 (x!125504 lt!612224) (index!43841 lt!612224) mask!2840))))

(assert (= (and start!119696 res!933738) b!1394283))

(assert (= (and b!1394283 res!933743) b!1394280))

(assert (= (and b!1394280 res!933739) b!1394282))

(assert (= (and b!1394282 res!933742) b!1394281))

(assert (= (and b!1394281 res!933745) b!1394279))

(assert (= (and b!1394279 res!933744) b!1394278))

(assert (= (and b!1394278 (not res!933737)) b!1394285))

(assert (= (and b!1394285 (not res!933741)) b!1394284))

(assert (= (and b!1394284 (not res!933740)) b!1394286))

(declare-fun m!1280113 () Bool)

(assert (=> b!1394285 m!1280113))

(assert (=> b!1394285 m!1280113))

(declare-fun m!1280115 () Bool)

(assert (=> b!1394285 m!1280115))

(declare-fun m!1280117 () Bool)

(assert (=> b!1394285 m!1280117))

(declare-fun m!1280119 () Bool)

(assert (=> b!1394285 m!1280119))

(declare-fun m!1280121 () Bool)

(assert (=> b!1394282 m!1280121))

(assert (=> b!1394282 m!1280121))

(declare-fun m!1280123 () Bool)

(assert (=> b!1394282 m!1280123))

(declare-fun m!1280125 () Bool)

(assert (=> b!1394280 m!1280125))

(assert (=> b!1394280 m!1280125))

(declare-fun m!1280127 () Bool)

(assert (=> b!1394280 m!1280127))

(declare-fun m!1280129 () Bool)

(assert (=> b!1394281 m!1280129))

(declare-fun m!1280131 () Bool)

(assert (=> b!1394286 m!1280131))

(declare-fun m!1280133 () Bool)

(assert (=> b!1394286 m!1280133))

(declare-fun m!1280135 () Bool)

(assert (=> start!119696 m!1280135))

(declare-fun m!1280137 () Bool)

(assert (=> start!119696 m!1280137))

(declare-fun m!1280139 () Bool)

(assert (=> b!1394279 m!1280139))

(assert (=> b!1394278 m!1280121))

(declare-fun m!1280141 () Bool)

(assert (=> b!1394278 m!1280141))

(assert (=> b!1394278 m!1280121))

(declare-fun m!1280143 () Bool)

(assert (=> b!1394278 m!1280143))

(assert (=> b!1394278 m!1280121))

(declare-fun m!1280145 () Bool)

(assert (=> b!1394278 m!1280145))

(assert (=> b!1394278 m!1280121))

(declare-fun m!1280147 () Bool)

(assert (=> b!1394278 m!1280147))

(declare-fun m!1280149 () Bool)

(assert (=> b!1394278 m!1280149))

(check-sat (not b!1394279) (not start!119696) (not b!1394278) (not b!1394282) (not b!1394286) (not b!1394285) (not b!1394281) (not b!1394280))
(check-sat)
