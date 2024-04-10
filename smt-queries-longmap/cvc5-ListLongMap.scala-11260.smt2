; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131354 () Bool)

(assert start!131354)

(declare-fun b!1540012 () Bool)

(declare-fun res!1056712 () Bool)

(declare-fun e!856549 () Bool)

(assert (=> b!1540012 (=> (not res!1056712) (not e!856549))))

(declare-datatypes ((array!102302 0))(
  ( (array!102303 (arr!49361 (Array (_ BitVec 32) (_ BitVec 64))) (size!49911 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102302)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540012 (= res!1056712 (validKeyInArray!0 (select (arr!49361 a!2792) i!951)))))

(declare-fun b!1540013 () Bool)

(declare-fun res!1056707 () Bool)

(assert (=> b!1540013 (=> (not res!1056707) (not e!856549))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1540013 (= res!1056707 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49911 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49911 a!2792)) (= (select (arr!49361 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1056702 () Bool)

(assert (=> start!131354 (=> (not res!1056702) (not e!856549))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131354 (= res!1056702 (validMask!0 mask!2480))))

(assert (=> start!131354 e!856549))

(assert (=> start!131354 true))

(declare-fun array_inv!38389 (array!102302) Bool)

(assert (=> start!131354 (array_inv!38389 a!2792)))

(declare-fun b!1540014 () Bool)

(declare-fun e!856550 () Bool)

(assert (=> b!1540014 (= e!856549 e!856550)))

(declare-fun res!1056708 () Bool)

(assert (=> b!1540014 (=> (not res!1056708) (not e!856550))))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13487 0))(
  ( (MissingZero!13487 (index!56343 (_ BitVec 32))) (Found!13487 (index!56344 (_ BitVec 32))) (Intermediate!13487 (undefined!14299 Bool) (index!56345 (_ BitVec 32)) (x!138086 (_ BitVec 32))) (Undefined!13487) (MissingVacant!13487 (index!56346 (_ BitVec 32))) )
))
(declare-fun lt!665206 () SeekEntryResult!13487)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102302 (_ BitVec 32)) SeekEntryResult!13487)

(assert (=> b!1540014 (= res!1056708 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49361 a!2792) j!64) a!2792 mask!2480) lt!665206))))

(assert (=> b!1540014 (= lt!665206 (Found!13487 j!64))))

(declare-fun b!1540015 () Bool)

(declare-fun e!856552 () Bool)

(assert (=> b!1540015 (= e!856552 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!510)) (bvsub #b01111111111111111111111111111110 x!510)))))

(declare-fun b!1540016 () Bool)

(declare-fun res!1056705 () Bool)

(assert (=> b!1540016 (=> (not res!1056705) (not e!856549))))

(assert (=> b!1540016 (= res!1056705 (validKeyInArray!0 (select (arr!49361 a!2792) j!64)))))

(declare-fun b!1540017 () Bool)

(declare-fun res!1056711 () Bool)

(assert (=> b!1540017 (=> (not res!1056711) (not e!856550))))

(assert (=> b!1540017 (= res!1056711 (not (= (select (arr!49361 a!2792) index!463) (select (arr!49361 a!2792) j!64))))))

(declare-fun b!1540018 () Bool)

(declare-fun res!1056703 () Bool)

(assert (=> b!1540018 (=> (not res!1056703) (not e!856549))))

(declare-datatypes ((List!35835 0))(
  ( (Nil!35832) (Cons!35831 (h!37276 (_ BitVec 64)) (t!50529 List!35835)) )
))
(declare-fun arrayNoDuplicates!0 (array!102302 (_ BitVec 32) List!35835) Bool)

(assert (=> b!1540018 (= res!1056703 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35832))))

(declare-fun b!1540019 () Bool)

(declare-fun res!1056704 () Bool)

(assert (=> b!1540019 (=> (not res!1056704) (not e!856549))))

(assert (=> b!1540019 (= res!1056704 (and (= (size!49911 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49911 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49911 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540020 () Bool)

(assert (=> b!1540020 (= e!856550 e!856552)))

(declare-fun res!1056706 () Bool)

(assert (=> b!1540020 (=> (not res!1056706) (not e!856552))))

(declare-fun lt!665205 () (_ BitVec 32))

(assert (=> b!1540020 (= res!1056706 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665205 #b00000000000000000000000000000000) (bvslt lt!665205 (size!49911 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540020 (= lt!665205 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540021 () Bool)

(declare-fun res!1056710 () Bool)

(assert (=> b!1540021 (=> (not res!1056710) (not e!856552))))

(assert (=> b!1540021 (= res!1056710 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665205 vacantIndex!5 (select (arr!49361 a!2792) j!64) a!2792 mask!2480) lt!665206))))

(declare-fun b!1540022 () Bool)

(declare-fun res!1056709 () Bool)

(assert (=> b!1540022 (=> (not res!1056709) (not e!856549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102302 (_ BitVec 32)) Bool)

(assert (=> b!1540022 (= res!1056709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!131354 res!1056702) b!1540019))

(assert (= (and b!1540019 res!1056704) b!1540012))

(assert (= (and b!1540012 res!1056712) b!1540016))

(assert (= (and b!1540016 res!1056705) b!1540022))

(assert (= (and b!1540022 res!1056709) b!1540018))

(assert (= (and b!1540018 res!1056703) b!1540013))

(assert (= (and b!1540013 res!1056707) b!1540014))

(assert (= (and b!1540014 res!1056708) b!1540017))

(assert (= (and b!1540017 res!1056711) b!1540020))

(assert (= (and b!1540020 res!1056706) b!1540021))

(assert (= (and b!1540021 res!1056710) b!1540015))

(declare-fun m!1422135 () Bool)

(assert (=> b!1540017 m!1422135))

(declare-fun m!1422137 () Bool)

(assert (=> b!1540017 m!1422137))

(assert (=> b!1540021 m!1422137))

(assert (=> b!1540021 m!1422137))

(declare-fun m!1422139 () Bool)

(assert (=> b!1540021 m!1422139))

(assert (=> b!1540016 m!1422137))

(assert (=> b!1540016 m!1422137))

(declare-fun m!1422141 () Bool)

(assert (=> b!1540016 m!1422141))

(declare-fun m!1422143 () Bool)

(assert (=> b!1540013 m!1422143))

(declare-fun m!1422145 () Bool)

(assert (=> b!1540022 m!1422145))

(declare-fun m!1422147 () Bool)

(assert (=> b!1540018 m!1422147))

(assert (=> b!1540014 m!1422137))

(assert (=> b!1540014 m!1422137))

(declare-fun m!1422149 () Bool)

(assert (=> b!1540014 m!1422149))

(declare-fun m!1422151 () Bool)

(assert (=> b!1540012 m!1422151))

(assert (=> b!1540012 m!1422151))

(declare-fun m!1422153 () Bool)

(assert (=> b!1540012 m!1422153))

(declare-fun m!1422155 () Bool)

(assert (=> b!1540020 m!1422155))

(declare-fun m!1422157 () Bool)

(assert (=> start!131354 m!1422157))

(declare-fun m!1422159 () Bool)

(assert (=> start!131354 m!1422159))

(push 1)

(assert (not b!1540022))

(assert (not b!1540014))

(assert (not b!1540020))

(assert (not b!1540012))

(assert (not b!1540016))

(assert (not b!1540018))

(assert (not start!131354))

(assert (not b!1540021))

(check-sat)

(pop 1)

(push 1)

(check-sat)

