; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131200 () Bool)

(assert start!131200)

(declare-fun res!1052090 () Bool)

(declare-fun e!855852 () Bool)

(assert (=> start!131200 (=> (not res!1052090) (not e!855852))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131200 (= res!1052090 (validMask!0 mask!2480))))

(assert (=> start!131200 e!855852))

(assert (=> start!131200 true))

(declare-datatypes ((array!102035 0))(
  ( (array!102036 (arr!49227 (Array (_ BitVec 32) (_ BitVec 64))) (size!49778 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102035)

(declare-fun array_inv!38508 (array!102035) Bool)

(assert (=> start!131200 (array_inv!38508 a!2792)))

(declare-fun b!1536488 () Bool)

(declare-fun res!1052088 () Bool)

(assert (=> b!1536488 (=> (not res!1052088) (not e!855852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102035 (_ BitVec 32)) Bool)

(assert (=> b!1536488 (= res!1052088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536489 () Bool)

(declare-fun res!1052093 () Bool)

(assert (=> b!1536489 (=> (not res!1052093) (not e!855852))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536489 (= res!1052093 (validKeyInArray!0 (select (arr!49227 a!2792) i!951)))))

(declare-fun b!1536490 () Bool)

(declare-fun res!1052089 () Bool)

(assert (=> b!1536490 (=> (not res!1052089) (not e!855852))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1536490 (= res!1052089 (validKeyInArray!0 (select (arr!49227 a!2792) j!64)))))

(declare-fun b!1536491 () Bool)

(declare-fun res!1052094 () Bool)

(assert (=> b!1536491 (=> (not res!1052094) (not e!855852))))

(declare-datatypes ((List!35688 0))(
  ( (Nil!35685) (Cons!35684 (h!37147 (_ BitVec 64)) (t!50374 List!35688)) )
))
(declare-fun arrayNoDuplicates!0 (array!102035 (_ BitVec 32) List!35688) Bool)

(assert (=> b!1536491 (= res!1052094 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35685))))

(declare-fun b!1536492 () Bool)

(declare-fun res!1052092 () Bool)

(assert (=> b!1536492 (=> (not res!1052092) (not e!855852))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1536492 (= res!1052092 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49778 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49778 a!2792)) (= (select (arr!49227 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536493 () Bool)

(declare-fun res!1052091 () Bool)

(assert (=> b!1536493 (=> (not res!1052091) (not e!855852))))

(assert (=> b!1536493 (= res!1052091 (and (= (size!49778 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49778 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49778 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536494 () Bool)

(assert (=> b!1536494 (= e!855852 false)))

(declare-datatypes ((SeekEntryResult!13254 0))(
  ( (MissingZero!13254 (index!55411 (_ BitVec 32))) (Found!13254 (index!55412 (_ BitVec 32))) (Intermediate!13254 (undefined!14066 Bool) (index!55413 (_ BitVec 32)) (x!137375 (_ BitVec 32))) (Undefined!13254) (MissingVacant!13254 (index!55414 (_ BitVec 32))) )
))
(declare-fun lt!664722 () SeekEntryResult!13254)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102035 (_ BitVec 32)) SeekEntryResult!13254)

(assert (=> b!1536494 (= lt!664722 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49227 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!131200 res!1052090) b!1536493))

(assert (= (and b!1536493 res!1052091) b!1536489))

(assert (= (and b!1536489 res!1052093) b!1536490))

(assert (= (and b!1536490 res!1052089) b!1536488))

(assert (= (and b!1536488 res!1052088) b!1536491))

(assert (= (and b!1536491 res!1052094) b!1536492))

(assert (= (and b!1536492 res!1052092) b!1536494))

(declare-fun m!1419023 () Bool)

(assert (=> b!1536492 m!1419023))

(declare-fun m!1419025 () Bool)

(assert (=> start!131200 m!1419025))

(declare-fun m!1419027 () Bool)

(assert (=> start!131200 m!1419027))

(declare-fun m!1419029 () Bool)

(assert (=> b!1536488 m!1419029))

(declare-fun m!1419031 () Bool)

(assert (=> b!1536489 m!1419031))

(assert (=> b!1536489 m!1419031))

(declare-fun m!1419033 () Bool)

(assert (=> b!1536489 m!1419033))

(declare-fun m!1419035 () Bool)

(assert (=> b!1536490 m!1419035))

(assert (=> b!1536490 m!1419035))

(declare-fun m!1419037 () Bool)

(assert (=> b!1536490 m!1419037))

(assert (=> b!1536494 m!1419035))

(assert (=> b!1536494 m!1419035))

(declare-fun m!1419039 () Bool)

(assert (=> b!1536494 m!1419039))

(declare-fun m!1419041 () Bool)

(assert (=> b!1536491 m!1419041))

(push 1)

(assert (not b!1536491))

(assert (not b!1536494))

(assert (not b!1536488))

(assert (not start!131200))

(assert (not b!1536490))

(assert (not b!1536489))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

