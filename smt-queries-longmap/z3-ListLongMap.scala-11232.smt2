; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130974 () Bool)

(assert start!130974)

(declare-fun b!1537017 () Bool)

(declare-fun res!1054287 () Bool)

(declare-fun e!855394 () Bool)

(assert (=> b!1537017 (=> (not res!1054287) (not e!855394))))

(declare-datatypes ((array!102070 0))(
  ( (array!102071 (arr!49252 (Array (_ BitVec 32) (_ BitVec 64))) (size!49804 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102070)

(declare-datatypes ((List!35804 0))(
  ( (Nil!35801) (Cons!35800 (h!37246 (_ BitVec 64)) (t!50490 List!35804)) )
))
(declare-fun arrayNoDuplicates!0 (array!102070 (_ BitVec 32) List!35804) Bool)

(assert (=> b!1537017 (= res!1054287 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35801))))

(declare-fun b!1537018 () Bool)

(declare-fun e!855393 () Bool)

(assert (=> b!1537018 (= e!855394 e!855393)))

(declare-fun res!1054296 () Bool)

(assert (=> b!1537018 (=> (not res!1054296) (not e!855393))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13409 0))(
  ( (MissingZero!13409 (index!56031 (_ BitVec 32))) (Found!13409 (index!56032 (_ BitVec 32))) (Intermediate!13409 (undefined!14221 Bool) (index!56033 (_ BitVec 32)) (x!137758 (_ BitVec 32))) (Undefined!13409) (MissingVacant!13409 (index!56034 (_ BitVec 32))) )
))
(declare-fun lt!664390 () SeekEntryResult!13409)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102070 (_ BitVec 32)) SeekEntryResult!13409)

(assert (=> b!1537018 (= res!1054296 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49252 a!2792) j!64) a!2792 mask!2480) lt!664390))))

(assert (=> b!1537018 (= lt!664390 (Found!13409 j!64))))

(declare-fun b!1537019 () Bool)

(declare-fun res!1054288 () Bool)

(assert (=> b!1537019 (=> (not res!1054288) (not e!855394))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102070 (_ BitVec 32)) Bool)

(assert (=> b!1537019 (= res!1054288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537020 () Bool)

(declare-fun res!1054293 () Bool)

(assert (=> b!1537020 (=> (not res!1054293) (not e!855393))))

(assert (=> b!1537020 (= res!1054293 (not (= (select (arr!49252 a!2792) index!463) (select (arr!49252 a!2792) j!64))))))

(declare-fun b!1537021 () Bool)

(declare-fun e!855392 () Bool)

(declare-fun e!855391 () Bool)

(assert (=> b!1537021 (= e!855392 e!855391)))

(declare-fun res!1054295 () Bool)

(assert (=> b!1537021 (=> (not res!1054295) (not e!855391))))

(declare-fun lt!664389 () SeekEntryResult!13409)

(assert (=> b!1537021 (= res!1054295 (= lt!664389 lt!664390))))

(declare-fun lt!664392 () (_ BitVec 32))

(assert (=> b!1537021 (= lt!664389 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664392 vacantIndex!5 (select (arr!49252 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537022 () Bool)

(declare-fun res!1054291 () Bool)

(assert (=> b!1537022 (=> (not res!1054291) (not e!855394))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537022 (= res!1054291 (validKeyInArray!0 (select (arr!49252 a!2792) j!64)))))

(declare-fun b!1537023 () Bool)

(assert (=> b!1537023 (= e!855391 (not true))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537023 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664392 vacantIndex!5 (select (store (arr!49252 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102071 (store (arr!49252 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49804 a!2792)) mask!2480) lt!664389)))

(declare-datatypes ((Unit!51225 0))(
  ( (Unit!51226) )
))
(declare-fun lt!664391 () Unit!51225)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102070 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51225)

(assert (=> b!1537023 (= lt!664391 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664392 vacantIndex!5 mask!2480))))

(declare-fun b!1537025 () Bool)

(declare-fun res!1054294 () Bool)

(assert (=> b!1537025 (=> (not res!1054294) (not e!855394))))

(assert (=> b!1537025 (= res!1054294 (validKeyInArray!0 (select (arr!49252 a!2792) i!951)))))

(declare-fun b!1537026 () Bool)

(declare-fun res!1054292 () Bool)

(assert (=> b!1537026 (=> (not res!1054292) (not e!855394))))

(assert (=> b!1537026 (= res!1054292 (and (= (size!49804 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49804 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49804 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537027 () Bool)

(declare-fun res!1054290 () Bool)

(assert (=> b!1537027 (=> (not res!1054290) (not e!855394))))

(assert (=> b!1537027 (= res!1054290 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49804 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49804 a!2792)) (= (select (arr!49252 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537024 () Bool)

(assert (=> b!1537024 (= e!855393 e!855392)))

(declare-fun res!1054289 () Bool)

(assert (=> b!1537024 (=> (not res!1054289) (not e!855392))))

(assert (=> b!1537024 (= res!1054289 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664392 #b00000000000000000000000000000000) (bvslt lt!664392 (size!49804 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1537024 (= lt!664392 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun res!1054297 () Bool)

(assert (=> start!130974 (=> (not res!1054297) (not e!855394))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130974 (= res!1054297 (validMask!0 mask!2480))))

(assert (=> start!130974 e!855394))

(assert (=> start!130974 true))

(declare-fun array_inv!38485 (array!102070) Bool)

(assert (=> start!130974 (array_inv!38485 a!2792)))

(assert (= (and start!130974 res!1054297) b!1537026))

(assert (= (and b!1537026 res!1054292) b!1537025))

(assert (= (and b!1537025 res!1054294) b!1537022))

(assert (= (and b!1537022 res!1054291) b!1537019))

(assert (= (and b!1537019 res!1054288) b!1537017))

(assert (= (and b!1537017 res!1054287) b!1537027))

(assert (= (and b!1537027 res!1054290) b!1537018))

(assert (= (and b!1537018 res!1054296) b!1537020))

(assert (= (and b!1537020 res!1054293) b!1537024))

(assert (= (and b!1537024 res!1054289) b!1537021))

(assert (= (and b!1537021 res!1054295) b!1537023))

(declare-fun m!1418939 () Bool)

(assert (=> b!1537023 m!1418939))

(declare-fun m!1418941 () Bool)

(assert (=> b!1537023 m!1418941))

(assert (=> b!1537023 m!1418941))

(declare-fun m!1418943 () Bool)

(assert (=> b!1537023 m!1418943))

(declare-fun m!1418945 () Bool)

(assert (=> b!1537023 m!1418945))

(declare-fun m!1418947 () Bool)

(assert (=> b!1537024 m!1418947))

(declare-fun m!1418949 () Bool)

(assert (=> b!1537021 m!1418949))

(assert (=> b!1537021 m!1418949))

(declare-fun m!1418951 () Bool)

(assert (=> b!1537021 m!1418951))

(declare-fun m!1418953 () Bool)

(assert (=> b!1537020 m!1418953))

(assert (=> b!1537020 m!1418949))

(declare-fun m!1418955 () Bool)

(assert (=> start!130974 m!1418955))

(declare-fun m!1418957 () Bool)

(assert (=> start!130974 m!1418957))

(assert (=> b!1537018 m!1418949))

(assert (=> b!1537018 m!1418949))

(declare-fun m!1418959 () Bool)

(assert (=> b!1537018 m!1418959))

(declare-fun m!1418961 () Bool)

(assert (=> b!1537027 m!1418961))

(declare-fun m!1418963 () Bool)

(assert (=> b!1537019 m!1418963))

(declare-fun m!1418965 () Bool)

(assert (=> b!1537025 m!1418965))

(assert (=> b!1537025 m!1418965))

(declare-fun m!1418967 () Bool)

(assert (=> b!1537025 m!1418967))

(assert (=> b!1537022 m!1418949))

(assert (=> b!1537022 m!1418949))

(declare-fun m!1418969 () Bool)

(assert (=> b!1537022 m!1418969))

(declare-fun m!1418971 () Bool)

(assert (=> b!1537017 m!1418971))

(check-sat (not b!1537017) (not b!1537019) (not b!1537018) (not b!1537025) (not start!130974) (not b!1537022) (not b!1537024) (not b!1537021) (not b!1537023))
(check-sat)
