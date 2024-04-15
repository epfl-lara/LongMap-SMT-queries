; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!122732 () Bool)

(assert start!122732)

(declare-fun b!1422222 () Bool)

(declare-fun e!804043 () Bool)

(assert (=> b!1422222 (= e!804043 true)))

(declare-datatypes ((SeekEntryResult!11155 0))(
  ( (MissingZero!11155 (index!47012 (_ BitVec 32))) (Found!11155 (index!47013 (_ BitVec 32))) (Intermediate!11155 (undefined!11967 Bool) (index!47014 (_ BitVec 32)) (x!128650 (_ BitVec 32))) (Undefined!11155) (MissingVacant!11155 (index!47015 (_ BitVec 32))) )
))
(declare-fun lt!626431 () SeekEntryResult!11155)

(declare-datatypes ((array!97050 0))(
  ( (array!97051 (arr!46843 (Array (_ BitVec 32) (_ BitVec 64))) (size!47395 (_ BitVec 32))) )
))
(declare-fun lt!626427 () array!97050)

(declare-fun lt!626429 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun lt!626430 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97050 (_ BitVec 32)) SeekEntryResult!11155)

(assert (=> b!1422222 (= lt!626431 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626429 lt!626430 lt!626427 mask!2608))))

(declare-fun b!1422223 () Bool)

(declare-fun res!957709 () Bool)

(declare-fun e!804044 () Bool)

(assert (=> b!1422223 (=> (not res!957709) (not e!804044))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun a!2831 () array!97050)

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!626432 () SeekEntryResult!11155)

(assert (=> b!1422223 (= res!957709 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46843 a!2831) j!81) a!2831 mask!2608) lt!626432))))

(declare-fun b!1422224 () Bool)

(declare-fun res!957714 () Bool)

(declare-fun e!804042 () Bool)

(assert (=> b!1422224 (=> (not res!957714) (not e!804042))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422224 (= res!957714 (validKeyInArray!0 (select (arr!46843 a!2831) i!982)))))

(declare-fun b!1422225 () Bool)

(declare-fun res!957710 () Bool)

(assert (=> b!1422225 (=> res!957710 e!804043)))

(assert (=> b!1422225 (= res!957710 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626429 (select (arr!46843 a!2831) j!81) a!2831 mask!2608) lt!626432)))))

(declare-fun b!1422226 () Bool)

(declare-fun res!957720 () Bool)

(assert (=> b!1422226 (=> (not res!957720) (not e!804042))))

(assert (=> b!1422226 (= res!957720 (and (= (size!47395 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47395 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47395 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422227 () Bool)

(declare-fun e!804041 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97050 (_ BitVec 32)) SeekEntryResult!11155)

(assert (=> b!1422227 (= e!804041 (= (seekEntryOrOpen!0 (select (arr!46843 a!2831) j!81) a!2831 mask!2608) (Found!11155 j!81)))))

(declare-fun b!1422228 () Bool)

(declare-fun e!804045 () Bool)

(assert (=> b!1422228 (= e!804045 e!804043)))

(declare-fun res!957708 () Bool)

(assert (=> b!1422228 (=> res!957708 e!804043)))

(assert (=> b!1422228 (= res!957708 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626429 #b00000000000000000000000000000000) (bvsge lt!626429 (size!47395 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422228 (= lt!626429 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422229 () Bool)

(declare-fun res!957721 () Bool)

(assert (=> b!1422229 (=> (not res!957721) (not e!804044))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422229 (= res!957721 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422230 () Bool)

(assert (=> b!1422230 (= e!804044 (not e!804045))))

(declare-fun res!957716 () Bool)

(assert (=> b!1422230 (=> res!957716 e!804045)))

(assert (=> b!1422230 (= res!957716 (or (= (select (arr!46843 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46843 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46843 a!2831) index!585) (select (arr!46843 a!2831) j!81)) (= (select (store (arr!46843 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1422230 e!804041))

(declare-fun res!957712 () Bool)

(assert (=> b!1422230 (=> (not res!957712) (not e!804041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97050 (_ BitVec 32)) Bool)

(assert (=> b!1422230 (= res!957712 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!47985 0))(
  ( (Unit!47986) )
))
(declare-fun lt!626426 () Unit!47985)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97050 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47985)

(assert (=> b!1422230 (= lt!626426 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422232 () Bool)

(declare-fun e!804046 () Bool)

(assert (=> b!1422232 (= e!804046 e!804044)))

(declare-fun res!957718 () Bool)

(assert (=> b!1422232 (=> (not res!957718) (not e!804044))))

(declare-fun lt!626428 () SeekEntryResult!11155)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422232 (= res!957718 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626430 mask!2608) lt!626430 lt!626427 mask!2608) lt!626428))))

(assert (=> b!1422232 (= lt!626428 (Intermediate!11155 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422232 (= lt!626430 (select (store (arr!46843 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422232 (= lt!626427 (array!97051 (store (arr!46843 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47395 a!2831)))))

(declare-fun b!1422233 () Bool)

(declare-fun res!957706 () Bool)

(assert (=> b!1422233 (=> (not res!957706) (not e!804042))))

(declare-datatypes ((List!33431 0))(
  ( (Nil!33428) (Cons!33427 (h!34729 (_ BitVec 64)) (t!48117 List!33431)) )
))
(declare-fun arrayNoDuplicates!0 (array!97050 (_ BitVec 32) List!33431) Bool)

(assert (=> b!1422233 (= res!957706 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33428))))

(declare-fun b!1422234 () Bool)

(declare-fun res!957711 () Bool)

(assert (=> b!1422234 (=> (not res!957711) (not e!804044))))

(assert (=> b!1422234 (= res!957711 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626430 lt!626427 mask!2608) lt!626428))))

(declare-fun b!1422235 () Bool)

(declare-fun res!957715 () Bool)

(assert (=> b!1422235 (=> (not res!957715) (not e!804042))))

(assert (=> b!1422235 (= res!957715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422236 () Bool)

(declare-fun res!957707 () Bool)

(assert (=> b!1422236 (=> (not res!957707) (not e!804042))))

(assert (=> b!1422236 (= res!957707 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47395 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47395 a!2831))))))

(declare-fun b!1422237 () Bool)

(declare-fun res!957719 () Bool)

(assert (=> b!1422237 (=> (not res!957719) (not e!804042))))

(assert (=> b!1422237 (= res!957719 (validKeyInArray!0 (select (arr!46843 a!2831) j!81)))))

(declare-fun res!957713 () Bool)

(assert (=> start!122732 (=> (not res!957713) (not e!804042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122732 (= res!957713 (validMask!0 mask!2608))))

(assert (=> start!122732 e!804042))

(assert (=> start!122732 true))

(declare-fun array_inv!36076 (array!97050) Bool)

(assert (=> start!122732 (array_inv!36076 a!2831)))

(declare-fun b!1422231 () Bool)

(assert (=> b!1422231 (= e!804042 e!804046)))

(declare-fun res!957717 () Bool)

(assert (=> b!1422231 (=> (not res!957717) (not e!804046))))

(assert (=> b!1422231 (= res!957717 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46843 a!2831) j!81) mask!2608) (select (arr!46843 a!2831) j!81) a!2831 mask!2608) lt!626432))))

(assert (=> b!1422231 (= lt!626432 (Intermediate!11155 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(assert (= (and start!122732 res!957713) b!1422226))

(assert (= (and b!1422226 res!957720) b!1422224))

(assert (= (and b!1422224 res!957714) b!1422237))

(assert (= (and b!1422237 res!957719) b!1422235))

(assert (= (and b!1422235 res!957715) b!1422233))

(assert (= (and b!1422233 res!957706) b!1422236))

(assert (= (and b!1422236 res!957707) b!1422231))

(assert (= (and b!1422231 res!957717) b!1422232))

(assert (= (and b!1422232 res!957718) b!1422223))

(assert (= (and b!1422223 res!957709) b!1422234))

(assert (= (and b!1422234 res!957711) b!1422229))

(assert (= (and b!1422229 res!957721) b!1422230))

(assert (= (and b!1422230 res!957712) b!1422227))

(assert (= (and b!1422230 (not res!957716)) b!1422228))

(assert (= (and b!1422228 (not res!957708)) b!1422225))

(assert (= (and b!1422225 (not res!957710)) b!1422222))

(declare-fun m!1312299 () Bool)

(assert (=> b!1422223 m!1312299))

(assert (=> b!1422223 m!1312299))

(declare-fun m!1312301 () Bool)

(assert (=> b!1422223 m!1312301))

(declare-fun m!1312303 () Bool)

(assert (=> b!1422230 m!1312303))

(declare-fun m!1312305 () Bool)

(assert (=> b!1422230 m!1312305))

(declare-fun m!1312307 () Bool)

(assert (=> b!1422230 m!1312307))

(declare-fun m!1312309 () Bool)

(assert (=> b!1422230 m!1312309))

(assert (=> b!1422230 m!1312299))

(declare-fun m!1312311 () Bool)

(assert (=> b!1422230 m!1312311))

(declare-fun m!1312313 () Bool)

(assert (=> b!1422233 m!1312313))

(assert (=> b!1422227 m!1312299))

(assert (=> b!1422227 m!1312299))

(declare-fun m!1312315 () Bool)

(assert (=> b!1422227 m!1312315))

(declare-fun m!1312317 () Bool)

(assert (=> b!1422235 m!1312317))

(declare-fun m!1312319 () Bool)

(assert (=> b!1422232 m!1312319))

(assert (=> b!1422232 m!1312319))

(declare-fun m!1312321 () Bool)

(assert (=> b!1422232 m!1312321))

(assert (=> b!1422232 m!1312303))

(declare-fun m!1312323 () Bool)

(assert (=> b!1422232 m!1312323))

(declare-fun m!1312325 () Bool)

(assert (=> b!1422228 m!1312325))

(assert (=> b!1422237 m!1312299))

(assert (=> b!1422237 m!1312299))

(declare-fun m!1312327 () Bool)

(assert (=> b!1422237 m!1312327))

(assert (=> b!1422231 m!1312299))

(assert (=> b!1422231 m!1312299))

(declare-fun m!1312329 () Bool)

(assert (=> b!1422231 m!1312329))

(assert (=> b!1422231 m!1312329))

(assert (=> b!1422231 m!1312299))

(declare-fun m!1312331 () Bool)

(assert (=> b!1422231 m!1312331))

(declare-fun m!1312333 () Bool)

(assert (=> b!1422224 m!1312333))

(assert (=> b!1422224 m!1312333))

(declare-fun m!1312335 () Bool)

(assert (=> b!1422224 m!1312335))

(declare-fun m!1312337 () Bool)

(assert (=> start!122732 m!1312337))

(declare-fun m!1312339 () Bool)

(assert (=> start!122732 m!1312339))

(declare-fun m!1312341 () Bool)

(assert (=> b!1422222 m!1312341))

(assert (=> b!1422225 m!1312299))

(assert (=> b!1422225 m!1312299))

(declare-fun m!1312343 () Bool)

(assert (=> b!1422225 m!1312343))

(declare-fun m!1312345 () Bool)

(assert (=> b!1422234 m!1312345))

(check-sat (not b!1422227) (not b!1422223) (not b!1422233) (not b!1422234) (not b!1422231) (not b!1422230) (not b!1422222) (not start!122732) (not b!1422237) (not b!1422224) (not b!1422235) (not b!1422228) (not b!1422225) (not b!1422232))
(check-sat)
