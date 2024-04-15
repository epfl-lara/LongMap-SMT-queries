; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131102 () Bool)

(assert start!131102)

(declare-fun b!1538237 () Bool)

(declare-fun res!1055406 () Bool)

(declare-fun e!855823 () Bool)

(assert (=> b!1538237 (=> (not res!1055406) (not e!855823))))

(declare-datatypes ((array!102165 0))(
  ( (array!102166 (arr!49298 (Array (_ BitVec 32) (_ BitVec 64))) (size!49850 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102165)

(declare-datatypes ((List!35850 0))(
  ( (Nil!35847) (Cons!35846 (h!37292 (_ BitVec 64)) (t!50536 List!35850)) )
))
(declare-fun arrayNoDuplicates!0 (array!102165 (_ BitVec 32) List!35850) Bool)

(assert (=> b!1538237 (= res!1055406 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35847))))

(declare-fun res!1055403 () Bool)

(assert (=> start!131102 (=> (not res!1055403) (not e!855823))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131102 (= res!1055403 (validMask!0 mask!2480))))

(assert (=> start!131102 e!855823))

(assert (=> start!131102 true))

(declare-fun array_inv!38531 (array!102165) Bool)

(assert (=> start!131102 (array_inv!38531 a!2792)))

(declare-fun b!1538238 () Bool)

(declare-fun res!1055401 () Bool)

(assert (=> b!1538238 (=> (not res!1055401) (not e!855823))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538238 (= res!1055401 (validKeyInArray!0 (select (arr!49298 a!2792) j!64)))))

(declare-fun b!1538239 () Bool)

(declare-fun res!1055405 () Bool)

(assert (=> b!1538239 (=> (not res!1055405) (not e!855823))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538239 (= res!1055405 (not (= (select (arr!49298 a!2792) index!463) (select (arr!49298 a!2792) j!64))))))

(declare-fun b!1538240 () Bool)

(assert (=> b!1538240 (= e!855823 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664626 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538240 (= lt!664626 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538241 () Bool)

(declare-fun res!1055404 () Bool)

(assert (=> b!1538241 (=> (not res!1055404) (not e!855823))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1538241 (= res!1055404 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49850 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49850 a!2792)) (= (select (arr!49298 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538242 () Bool)

(declare-fun res!1055400 () Bool)

(assert (=> b!1538242 (=> (not res!1055400) (not e!855823))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538242 (= res!1055400 (validKeyInArray!0 (select (arr!49298 a!2792) i!951)))))

(declare-fun b!1538243 () Bool)

(declare-fun res!1055399 () Bool)

(assert (=> b!1538243 (=> (not res!1055399) (not e!855823))))

(declare-datatypes ((SeekEntryResult!13449 0))(
  ( (MissingZero!13449 (index!56191 (_ BitVec 32))) (Found!13449 (index!56192 (_ BitVec 32))) (Intermediate!13449 (undefined!14261 Bool) (index!56193 (_ BitVec 32)) (x!137921 (_ BitVec 32))) (Undefined!13449) (MissingVacant!13449 (index!56194 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102165 (_ BitVec 32)) SeekEntryResult!13449)

(assert (=> b!1538243 (= res!1055399 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49298 a!2792) j!64) a!2792 mask!2480) (Found!13449 j!64)))))

(declare-fun b!1538244 () Bool)

(declare-fun res!1055407 () Bool)

(assert (=> b!1538244 (=> (not res!1055407) (not e!855823))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102165 (_ BitVec 32)) Bool)

(assert (=> b!1538244 (= res!1055407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538245 () Bool)

(declare-fun res!1055402 () Bool)

(assert (=> b!1538245 (=> (not res!1055402) (not e!855823))))

(assert (=> b!1538245 (= res!1055402 (and (= (size!49850 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49850 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49850 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131102 res!1055403) b!1538245))

(assert (= (and b!1538245 res!1055402) b!1538242))

(assert (= (and b!1538242 res!1055400) b!1538238))

(assert (= (and b!1538238 res!1055401) b!1538244))

(assert (= (and b!1538244 res!1055407) b!1538237))

(assert (= (and b!1538237 res!1055406) b!1538241))

(assert (= (and b!1538241 res!1055404) b!1538243))

(assert (= (and b!1538243 res!1055399) b!1538239))

(assert (= (and b!1538239 res!1055405) b!1538240))

(declare-fun m!1420079 () Bool)

(assert (=> b!1538243 m!1420079))

(assert (=> b!1538243 m!1420079))

(declare-fun m!1420081 () Bool)

(assert (=> b!1538243 m!1420081))

(assert (=> b!1538238 m!1420079))

(assert (=> b!1538238 m!1420079))

(declare-fun m!1420083 () Bool)

(assert (=> b!1538238 m!1420083))

(declare-fun m!1420085 () Bool)

(assert (=> b!1538241 m!1420085))

(declare-fun m!1420087 () Bool)

(assert (=> b!1538237 m!1420087))

(declare-fun m!1420089 () Bool)

(assert (=> b!1538240 m!1420089))

(declare-fun m!1420091 () Bool)

(assert (=> start!131102 m!1420091))

(declare-fun m!1420093 () Bool)

(assert (=> start!131102 m!1420093))

(declare-fun m!1420095 () Bool)

(assert (=> b!1538244 m!1420095))

(declare-fun m!1420097 () Bool)

(assert (=> b!1538239 m!1420097))

(assert (=> b!1538239 m!1420079))

(declare-fun m!1420099 () Bool)

(assert (=> b!1538242 m!1420099))

(assert (=> b!1538242 m!1420099))

(declare-fun m!1420101 () Bool)

(assert (=> b!1538242 m!1420101))

(push 1)

(assert (not b!1538237))

(assert (not b!1538238))

(assert (not start!131102))

(assert (not b!1538242))

(assert (not b!1538243))

(assert (not b!1538240))

(assert (not b!1538244))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

