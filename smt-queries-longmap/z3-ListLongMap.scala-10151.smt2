; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119672 () Bool)

(assert start!119672)

(declare-fun b!1394003 () Bool)

(declare-fun res!933415 () Bool)

(declare-fun e!789299 () Bool)

(assert (=> b!1394003 (=> (not res!933415) (not e!789299))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95354 0))(
  ( (array!95355 (arr!46035 (Array (_ BitVec 32) (_ BitVec 64))) (size!46585 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95354)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1394003 (= res!933415 (and (= (size!46585 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46585 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46585 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1394004 () Bool)

(declare-fun res!933413 () Bool)

(assert (=> b!1394004 (=> (not res!933413) (not e!789299))))

(declare-datatypes ((List!32554 0))(
  ( (Nil!32551) (Cons!32550 (h!33783 (_ BitVec 64)) (t!47248 List!32554)) )
))
(declare-fun arrayNoDuplicates!0 (array!95354 (_ BitVec 32) List!32554) Bool)

(assert (=> b!1394004 (= res!933413 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32551))))

(declare-fun b!1394005 () Bool)

(declare-fun res!933412 () Bool)

(assert (=> b!1394005 (=> (not res!933412) (not e!789299))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1394005 (= res!933412 (validKeyInArray!0 (select (arr!46035 a!2901) j!112)))))

(declare-fun b!1394006 () Bool)

(declare-fun e!789302 () Bool)

(assert (=> b!1394006 (= e!789299 (not e!789302))))

(declare-fun res!933414 () Bool)

(assert (=> b!1394006 (=> res!933414 e!789302)))

(declare-datatypes ((SeekEntryResult!10352 0))(
  ( (MissingZero!10352 (index!43779 (_ BitVec 32))) (Found!10352 (index!43780 (_ BitVec 32))) (Intermediate!10352 (undefined!11164 Bool) (index!43781 (_ BitVec 32)) (x!125452 (_ BitVec 32))) (Undefined!10352) (MissingVacant!10352 (index!43782 (_ BitVec 32))) )
))
(declare-fun lt!612202 () SeekEntryResult!10352)

(get-info :version)

(assert (=> b!1394006 (= res!933414 (or (not ((_ is Intermediate!10352) lt!612202)) (undefined!11164 lt!612202)))))

(declare-fun e!789301 () Bool)

(assert (=> b!1394006 e!789301))

(declare-fun res!933416 () Bool)

(assert (=> b!1394006 (=> (not res!933416) (not e!789301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95354 (_ BitVec 32)) Bool)

(assert (=> b!1394006 (= res!933416 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46708 0))(
  ( (Unit!46709) )
))
(declare-fun lt!612204 () Unit!46708)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95354 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46708)

(assert (=> b!1394006 (= lt!612204 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95354 (_ BitVec 32)) SeekEntryResult!10352)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1394006 (= lt!612202 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46035 a!2901) j!112) mask!2840) (select (arr!46035 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1394007 () Bool)

(declare-fun res!933417 () Bool)

(assert (=> b!1394007 (=> (not res!933417) (not e!789299))))

(assert (=> b!1394007 (= res!933417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1394008 () Bool)

(declare-fun res!933418 () Bool)

(assert (=> b!1394008 (=> (not res!933418) (not e!789299))))

(assert (=> b!1394008 (= res!933418 (validKeyInArray!0 (select (arr!46035 a!2901) i!1037)))))

(declare-fun b!1394009 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95354 (_ BitVec 32)) SeekEntryResult!10352)

(assert (=> b!1394009 (= e!789301 (= (seekEntryOrOpen!0 (select (arr!46035 a!2901) j!112) a!2901 mask!2840) (Found!10352 j!112)))))

(declare-fun res!933411 () Bool)

(assert (=> start!119672 (=> (not res!933411) (not e!789299))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119672 (= res!933411 (validMask!0 mask!2840))))

(assert (=> start!119672 e!789299))

(assert (=> start!119672 true))

(declare-fun array_inv!35063 (array!95354) Bool)

(assert (=> start!119672 (array_inv!35063 a!2901)))

(declare-fun b!1394010 () Bool)

(assert (=> b!1394010 (= e!789302 true)))

(declare-fun lt!612203 () SeekEntryResult!10352)

(assert (=> b!1394010 (= lt!612203 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46035 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46035 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95355 (store (arr!46035 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46585 a!2901)) mask!2840))))

(assert (= (and start!119672 res!933411) b!1394003))

(assert (= (and b!1394003 res!933415) b!1394008))

(assert (= (and b!1394008 res!933418) b!1394005))

(assert (= (and b!1394005 res!933412) b!1394007))

(assert (= (and b!1394007 res!933417) b!1394004))

(assert (= (and b!1394004 res!933413) b!1394006))

(assert (= (and b!1394006 res!933416) b!1394009))

(assert (= (and b!1394006 (not res!933414)) b!1394010))

(declare-fun m!1280149 () Bool)

(assert (=> start!119672 m!1280149))

(declare-fun m!1280151 () Bool)

(assert (=> start!119672 m!1280151))

(declare-fun m!1280153 () Bool)

(assert (=> b!1394004 m!1280153))

(declare-fun m!1280155 () Bool)

(assert (=> b!1394010 m!1280155))

(declare-fun m!1280157 () Bool)

(assert (=> b!1394010 m!1280157))

(assert (=> b!1394010 m!1280157))

(declare-fun m!1280159 () Bool)

(assert (=> b!1394010 m!1280159))

(assert (=> b!1394010 m!1280159))

(assert (=> b!1394010 m!1280157))

(declare-fun m!1280161 () Bool)

(assert (=> b!1394010 m!1280161))

(declare-fun m!1280163 () Bool)

(assert (=> b!1394008 m!1280163))

(assert (=> b!1394008 m!1280163))

(declare-fun m!1280165 () Bool)

(assert (=> b!1394008 m!1280165))

(declare-fun m!1280167 () Bool)

(assert (=> b!1394006 m!1280167))

(declare-fun m!1280169 () Bool)

(assert (=> b!1394006 m!1280169))

(assert (=> b!1394006 m!1280167))

(declare-fun m!1280171 () Bool)

(assert (=> b!1394006 m!1280171))

(assert (=> b!1394006 m!1280169))

(assert (=> b!1394006 m!1280167))

(declare-fun m!1280173 () Bool)

(assert (=> b!1394006 m!1280173))

(declare-fun m!1280175 () Bool)

(assert (=> b!1394006 m!1280175))

(declare-fun m!1280177 () Bool)

(assert (=> b!1394007 m!1280177))

(assert (=> b!1394009 m!1280167))

(assert (=> b!1394009 m!1280167))

(declare-fun m!1280179 () Bool)

(assert (=> b!1394009 m!1280179))

(assert (=> b!1394005 m!1280167))

(assert (=> b!1394005 m!1280167))

(declare-fun m!1280181 () Bool)

(assert (=> b!1394005 m!1280181))

(check-sat (not b!1394007) (not b!1394005) (not b!1394010) (not start!119672) (not b!1394006) (not b!1394008) (not b!1394004) (not b!1394009))
