; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130946 () Bool)

(assert start!130946)

(declare-fun b!1536034 () Bool)

(declare-fun e!854994 () Bool)

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1536034 (= e!854994 (not (bvsge mask!2480 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!13370 0))(
  ( (MissingZero!13370 (index!55875 (_ BitVec 32))) (Found!13370 (index!55876 (_ BitVec 32))) (Intermediate!13370 (undefined!14182 Bool) (index!55877 (_ BitVec 32)) (x!137620 (_ BitVec 32))) (Undefined!13370) (MissingVacant!13370 (index!55878 (_ BitVec 32))) )
))
(declare-fun lt!664199 () SeekEntryResult!13370)

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664201 () (_ BitVec 32))

(declare-datatypes ((array!102044 0))(
  ( (array!102045 (arr!49238 (Array (_ BitVec 32) (_ BitVec 64))) (size!49788 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102044)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102044 (_ BitVec 32)) SeekEntryResult!13370)

(assert (=> b!1536034 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664201 vacantIndex!5 (select (store (arr!49238 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102045 (store (arr!49238 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49788 a!2792)) mask!2480) lt!664199)))

(declare-datatypes ((Unit!51312 0))(
  ( (Unit!51313) )
))
(declare-fun lt!664198 () Unit!51312)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102044 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51312)

(assert (=> b!1536034 (= lt!664198 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664201 vacantIndex!5 mask!2480))))

(declare-fun b!1536035 () Bool)

(declare-fun res!1053124 () Bool)

(declare-fun e!854997 () Bool)

(assert (=> b!1536035 (=> (not res!1053124) (not e!854997))))

(declare-datatypes ((List!35712 0))(
  ( (Nil!35709) (Cons!35708 (h!37153 (_ BitVec 64)) (t!50406 List!35712)) )
))
(declare-fun arrayNoDuplicates!0 (array!102044 (_ BitVec 32) List!35712) Bool)

(assert (=> b!1536035 (= res!1053124 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35709))))

(declare-fun b!1536036 () Bool)

(declare-fun res!1053128 () Bool)

(assert (=> b!1536036 (=> (not res!1053128) (not e!854997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102044 (_ BitVec 32)) Bool)

(assert (=> b!1536036 (= res!1053128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536037 () Bool)

(declare-fun e!854996 () Bool)

(assert (=> b!1536037 (= e!854997 e!854996)))

(declare-fun res!1053125 () Bool)

(assert (=> b!1536037 (=> (not res!1053125) (not e!854996))))

(declare-fun lt!664200 () SeekEntryResult!13370)

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536037 (= res!1053125 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49238 a!2792) j!64) a!2792 mask!2480) lt!664200))))

(assert (=> b!1536037 (= lt!664200 (Found!13370 j!64))))

(declare-fun b!1536038 () Bool)

(declare-fun e!854998 () Bool)

(assert (=> b!1536038 (= e!854998 e!854994)))

(declare-fun res!1053130 () Bool)

(assert (=> b!1536038 (=> (not res!1053130) (not e!854994))))

(assert (=> b!1536038 (= res!1053130 (= lt!664199 lt!664200))))

(assert (=> b!1536038 (= lt!664199 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664201 vacantIndex!5 (select (arr!49238 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536039 () Bool)

(declare-fun res!1053120 () Bool)

(assert (=> b!1536039 (=> (not res!1053120) (not e!854997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536039 (= res!1053120 (validKeyInArray!0 (select (arr!49238 a!2792) i!951)))))

(declare-fun b!1536040 () Bool)

(assert (=> b!1536040 (= e!854996 e!854998)))

(declare-fun res!1053127 () Bool)

(assert (=> b!1536040 (=> (not res!1053127) (not e!854998))))

(assert (=> b!1536040 (= res!1053127 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664201 #b00000000000000000000000000000000) (bvslt lt!664201 (size!49788 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536040 (= lt!664201 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536041 () Bool)

(declare-fun res!1053126 () Bool)

(assert (=> b!1536041 (=> (not res!1053126) (not e!854997))))

(assert (=> b!1536041 (= res!1053126 (and (= (size!49788 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49788 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49788 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536043 () Bool)

(declare-fun res!1053123 () Bool)

(assert (=> b!1536043 (=> (not res!1053123) (not e!854997))))

(assert (=> b!1536043 (= res!1053123 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49788 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49788 a!2792)) (= (select (arr!49238 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536044 () Bool)

(declare-fun res!1053122 () Bool)

(assert (=> b!1536044 (=> (not res!1053122) (not e!854997))))

(assert (=> b!1536044 (= res!1053122 (validKeyInArray!0 (select (arr!49238 a!2792) j!64)))))

(declare-fun res!1053129 () Bool)

(assert (=> start!130946 (=> (not res!1053129) (not e!854997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130946 (= res!1053129 (validMask!0 mask!2480))))

(assert (=> start!130946 e!854997))

(assert (=> start!130946 true))

(declare-fun array_inv!38266 (array!102044) Bool)

(assert (=> start!130946 (array_inv!38266 a!2792)))

(declare-fun b!1536042 () Bool)

(declare-fun res!1053121 () Bool)

(assert (=> b!1536042 (=> (not res!1053121) (not e!854996))))

(assert (=> b!1536042 (= res!1053121 (not (= (select (arr!49238 a!2792) index!463) (select (arr!49238 a!2792) j!64))))))

(assert (= (and start!130946 res!1053129) b!1536041))

(assert (= (and b!1536041 res!1053126) b!1536039))

(assert (= (and b!1536039 res!1053120) b!1536044))

(assert (= (and b!1536044 res!1053122) b!1536036))

(assert (= (and b!1536036 res!1053128) b!1536035))

(assert (= (and b!1536035 res!1053124) b!1536043))

(assert (= (and b!1536043 res!1053123) b!1536037))

(assert (= (and b!1536037 res!1053125) b!1536042))

(assert (= (and b!1536042 res!1053121) b!1536040))

(assert (= (and b!1536040 res!1053127) b!1536038))

(assert (= (and b!1536038 res!1053130) b!1536034))

(declare-fun m!1418487 () Bool)

(assert (=> b!1536039 m!1418487))

(assert (=> b!1536039 m!1418487))

(declare-fun m!1418489 () Bool)

(assert (=> b!1536039 m!1418489))

(declare-fun m!1418491 () Bool)

(assert (=> start!130946 m!1418491))

(declare-fun m!1418493 () Bool)

(assert (=> start!130946 m!1418493))

(declare-fun m!1418495 () Bool)

(assert (=> b!1536035 m!1418495))

(declare-fun m!1418497 () Bool)

(assert (=> b!1536036 m!1418497))

(declare-fun m!1418499 () Bool)

(assert (=> b!1536034 m!1418499))

(declare-fun m!1418501 () Bool)

(assert (=> b!1536034 m!1418501))

(assert (=> b!1536034 m!1418501))

(declare-fun m!1418503 () Bool)

(assert (=> b!1536034 m!1418503))

(declare-fun m!1418505 () Bool)

(assert (=> b!1536034 m!1418505))

(declare-fun m!1418507 () Bool)

(assert (=> b!1536043 m!1418507))

(declare-fun m!1418509 () Bool)

(assert (=> b!1536040 m!1418509))

(declare-fun m!1418511 () Bool)

(assert (=> b!1536044 m!1418511))

(assert (=> b!1536044 m!1418511))

(declare-fun m!1418513 () Bool)

(assert (=> b!1536044 m!1418513))

(assert (=> b!1536037 m!1418511))

(assert (=> b!1536037 m!1418511))

(declare-fun m!1418515 () Bool)

(assert (=> b!1536037 m!1418515))

(declare-fun m!1418517 () Bool)

(assert (=> b!1536042 m!1418517))

(assert (=> b!1536042 m!1418511))

(assert (=> b!1536038 m!1418511))

(assert (=> b!1536038 m!1418511))

(declare-fun m!1418519 () Bool)

(assert (=> b!1536038 m!1418519))

(push 1)

