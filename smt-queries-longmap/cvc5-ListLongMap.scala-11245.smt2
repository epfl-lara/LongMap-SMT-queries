; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131092 () Bool)

(assert start!131092)

(declare-fun b!1538102 () Bool)

(declare-fun res!1055269 () Bool)

(declare-fun e!855793 () Bool)

(assert (=> b!1538102 (=> (not res!1055269) (not e!855793))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102155 0))(
  ( (array!102156 (arr!49293 (Array (_ BitVec 32) (_ BitVec 64))) (size!49845 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102155)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13444 0))(
  ( (MissingZero!13444 (index!56171 (_ BitVec 32))) (Found!13444 (index!56172 (_ BitVec 32))) (Intermediate!13444 (undefined!14256 Bool) (index!56173 (_ BitVec 32)) (x!137900 (_ BitVec 32))) (Undefined!13444) (MissingVacant!13444 (index!56174 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102155 (_ BitVec 32)) SeekEntryResult!13444)

(assert (=> b!1538102 (= res!1055269 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49293 a!2792) j!64) a!2792 mask!2480) (Found!13444 j!64)))))

(declare-fun b!1538103 () Bool)

(declare-fun res!1055265 () Bool)

(assert (=> b!1538103 (=> (not res!1055265) (not e!855793))))

(assert (=> b!1538103 (= res!1055265 (not (= (select (arr!49293 a!2792) index!463) (select (arr!49293 a!2792) j!64))))))

(declare-fun b!1538104 () Bool)

(declare-fun res!1055270 () Bool)

(assert (=> b!1538104 (=> (not res!1055270) (not e!855793))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538104 (= res!1055270 (validKeyInArray!0 (select (arr!49293 a!2792) j!64)))))

(declare-fun b!1538105 () Bool)

(declare-fun res!1055267 () Bool)

(assert (=> b!1538105 (=> (not res!1055267) (not e!855793))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538105 (= res!1055267 (validKeyInArray!0 (select (arr!49293 a!2792) i!951)))))

(declare-fun b!1538106 () Bool)

(assert (=> b!1538106 (= e!855793 false)))

(declare-fun lt!664611 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538106 (= lt!664611 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun res!1055272 () Bool)

(assert (=> start!131092 (=> (not res!1055272) (not e!855793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131092 (= res!1055272 (validMask!0 mask!2480))))

(assert (=> start!131092 e!855793))

(assert (=> start!131092 true))

(declare-fun array_inv!38526 (array!102155) Bool)

(assert (=> start!131092 (array_inv!38526 a!2792)))

(declare-fun b!1538107 () Bool)

(declare-fun res!1055264 () Bool)

(assert (=> b!1538107 (=> (not res!1055264) (not e!855793))))

(assert (=> b!1538107 (= res!1055264 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49845 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49845 a!2792)) (= (select (arr!49293 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538108 () Bool)

(declare-fun res!1055268 () Bool)

(assert (=> b!1538108 (=> (not res!1055268) (not e!855793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102155 (_ BitVec 32)) Bool)

(assert (=> b!1538108 (= res!1055268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538109 () Bool)

(declare-fun res!1055266 () Bool)

(assert (=> b!1538109 (=> (not res!1055266) (not e!855793))))

(assert (=> b!1538109 (= res!1055266 (and (= (size!49845 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49845 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49845 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538110 () Bool)

(declare-fun res!1055271 () Bool)

(assert (=> b!1538110 (=> (not res!1055271) (not e!855793))))

(declare-datatypes ((List!35845 0))(
  ( (Nil!35842) (Cons!35841 (h!37287 (_ BitVec 64)) (t!50531 List!35845)) )
))
(declare-fun arrayNoDuplicates!0 (array!102155 (_ BitVec 32) List!35845) Bool)

(assert (=> b!1538110 (= res!1055271 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35842))))

(assert (= (and start!131092 res!1055272) b!1538109))

(assert (= (and b!1538109 res!1055266) b!1538105))

(assert (= (and b!1538105 res!1055267) b!1538104))

(assert (= (and b!1538104 res!1055270) b!1538108))

(assert (= (and b!1538108 res!1055268) b!1538110))

(assert (= (and b!1538110 res!1055271) b!1538107))

(assert (= (and b!1538107 res!1055264) b!1538102))

(assert (= (and b!1538102 res!1055269) b!1538103))

(assert (= (and b!1538103 res!1055265) b!1538106))

(declare-fun m!1419959 () Bool)

(assert (=> b!1538105 m!1419959))

(assert (=> b!1538105 m!1419959))

(declare-fun m!1419961 () Bool)

(assert (=> b!1538105 m!1419961))

(declare-fun m!1419963 () Bool)

(assert (=> b!1538106 m!1419963))

(declare-fun m!1419965 () Bool)

(assert (=> start!131092 m!1419965))

(declare-fun m!1419967 () Bool)

(assert (=> start!131092 m!1419967))

(declare-fun m!1419969 () Bool)

(assert (=> b!1538102 m!1419969))

(assert (=> b!1538102 m!1419969))

(declare-fun m!1419971 () Bool)

(assert (=> b!1538102 m!1419971))

(declare-fun m!1419973 () Bool)

(assert (=> b!1538110 m!1419973))

(declare-fun m!1419975 () Bool)

(assert (=> b!1538107 m!1419975))

(declare-fun m!1419977 () Bool)

(assert (=> b!1538103 m!1419977))

(assert (=> b!1538103 m!1419969))

(assert (=> b!1538104 m!1419969))

(assert (=> b!1538104 m!1419969))

(declare-fun m!1419979 () Bool)

(assert (=> b!1538104 m!1419979))

(declare-fun m!1419981 () Bool)

(assert (=> b!1538108 m!1419981))

(push 1)

(assert (not b!1538110))

(assert (not b!1538108))

(assert (not b!1538106))

(assert (not b!1538105))

(assert (not start!131092))

(assert (not b!1538102))

(assert (not b!1538104))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

