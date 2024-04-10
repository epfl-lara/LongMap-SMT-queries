; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131358 () Bool)

(assert start!131358)

(declare-fun b!1540078 () Bool)

(declare-fun res!1056772 () Bool)

(declare-fun e!856574 () Bool)

(assert (=> b!1540078 (=> (not res!1056772) (not e!856574))))

(declare-datatypes ((array!102306 0))(
  ( (array!102307 (arr!49363 (Array (_ BitVec 32) (_ BitVec 64))) (size!49913 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102306)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540078 (= res!1056772 (validKeyInArray!0 (select (arr!49363 a!2792) j!64)))))

(declare-fun b!1540080 () Bool)

(declare-fun res!1056773 () Bool)

(assert (=> b!1540080 (=> (not res!1056773) (not e!856574))))

(declare-datatypes ((List!35837 0))(
  ( (Nil!35834) (Cons!35833 (h!37278 (_ BitVec 64)) (t!50531 List!35837)) )
))
(declare-fun arrayNoDuplicates!0 (array!102306 (_ BitVec 32) List!35837) Bool)

(assert (=> b!1540080 (= res!1056773 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35834))))

(declare-fun b!1540081 () Bool)

(declare-fun res!1056778 () Bool)

(declare-fun e!856575 () Bool)

(assert (=> b!1540081 (=> (not res!1056778) (not e!856575))))

(declare-fun lt!665217 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13489 0))(
  ( (MissingZero!13489 (index!56351 (_ BitVec 32))) (Found!13489 (index!56352 (_ BitVec 32))) (Intermediate!13489 (undefined!14301 Bool) (index!56353 (_ BitVec 32)) (x!138088 (_ BitVec 32))) (Undefined!13489) (MissingVacant!13489 (index!56354 (_ BitVec 32))) )
))
(declare-fun lt!665218 () SeekEntryResult!13489)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102306 (_ BitVec 32)) SeekEntryResult!13489)

(assert (=> b!1540081 (= res!1056778 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!665217 vacantIndex!5 (select (arr!49363 a!2792) j!64) a!2792 mask!2480) lt!665218))))

(declare-fun b!1540082 () Bool)

(declare-fun res!1056776 () Bool)

(assert (=> b!1540082 (=> (not res!1056776) (not e!856574))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540082 (= res!1056776 (and (= (size!49913 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49913 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49913 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1540083 () Bool)

(declare-fun res!1056775 () Bool)

(declare-fun e!856576 () Bool)

(assert (=> b!1540083 (=> (not res!1056775) (not e!856576))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1540083 (= res!1056775 (not (= (select (arr!49363 a!2792) index!463) (select (arr!49363 a!2792) j!64))))))

(declare-fun b!1540084 () Bool)

(declare-fun res!1056774 () Bool)

(assert (=> b!1540084 (=> (not res!1056774) (not e!856574))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102306 (_ BitVec 32)) Bool)

(assert (=> b!1540084 (= res!1056774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540085 () Bool)

(assert (=> b!1540085 (= e!856576 e!856575)))

(declare-fun res!1056770 () Bool)

(assert (=> b!1540085 (=> (not res!1056770) (not e!856575))))

(assert (=> b!1540085 (= res!1056770 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!665217 #b00000000000000000000000000000000) (bvslt lt!665217 (size!49913 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1540085 (= lt!665217 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1540086 () Bool)

(assert (=> b!1540086 (= e!856574 e!856576)))

(declare-fun res!1056768 () Bool)

(assert (=> b!1540086 (=> (not res!1056768) (not e!856576))))

(assert (=> b!1540086 (= res!1056768 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49363 a!2792) j!64) a!2792 mask!2480) lt!665218))))

(assert (=> b!1540086 (= lt!665218 (Found!13489 j!64))))

(declare-fun b!1540079 () Bool)

(declare-fun res!1056769 () Bool)

(assert (=> b!1540079 (=> (not res!1056769) (not e!856574))))

(assert (=> b!1540079 (= res!1056769 (validKeyInArray!0 (select (arr!49363 a!2792) i!951)))))

(declare-fun res!1056777 () Bool)

(assert (=> start!131358 (=> (not res!1056777) (not e!856574))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131358 (= res!1056777 (validMask!0 mask!2480))))

(assert (=> start!131358 e!856574))

(assert (=> start!131358 true))

(declare-fun array_inv!38391 (array!102306) Bool)

(assert (=> start!131358 (array_inv!38391 a!2792)))

(declare-fun b!1540087 () Bool)

(declare-fun res!1056771 () Bool)

(assert (=> b!1540087 (=> (not res!1056771) (not e!856574))))

(assert (=> b!1540087 (= res!1056771 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49913 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49913 a!2792)) (= (select (arr!49363 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540088 () Bool)

(assert (=> b!1540088 (= e!856575 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!510)) (bvsub #b01111111111111111111111111111110 x!510)))))

(assert (= (and start!131358 res!1056777) b!1540082))

(assert (= (and b!1540082 res!1056776) b!1540079))

(assert (= (and b!1540079 res!1056769) b!1540078))

(assert (= (and b!1540078 res!1056772) b!1540084))

(assert (= (and b!1540084 res!1056774) b!1540080))

(assert (= (and b!1540080 res!1056773) b!1540087))

(assert (= (and b!1540087 res!1056771) b!1540086))

(assert (= (and b!1540086 res!1056768) b!1540083))

(assert (= (and b!1540083 res!1056775) b!1540085))

(assert (= (and b!1540085 res!1056770) b!1540081))

(assert (= (and b!1540081 res!1056778) b!1540088))

(declare-fun m!1422187 () Bool)

(assert (=> b!1540079 m!1422187))

(assert (=> b!1540079 m!1422187))

(declare-fun m!1422189 () Bool)

(assert (=> b!1540079 m!1422189))

(declare-fun m!1422191 () Bool)

(assert (=> b!1540081 m!1422191))

(assert (=> b!1540081 m!1422191))

(declare-fun m!1422193 () Bool)

(assert (=> b!1540081 m!1422193))

(declare-fun m!1422195 () Bool)

(assert (=> b!1540084 m!1422195))

(declare-fun m!1422197 () Bool)

(assert (=> b!1540080 m!1422197))

(declare-fun m!1422199 () Bool)

(assert (=> b!1540083 m!1422199))

(assert (=> b!1540083 m!1422191))

(assert (=> b!1540086 m!1422191))

(assert (=> b!1540086 m!1422191))

(declare-fun m!1422201 () Bool)

(assert (=> b!1540086 m!1422201))

(assert (=> b!1540078 m!1422191))

(assert (=> b!1540078 m!1422191))

(declare-fun m!1422203 () Bool)

(assert (=> b!1540078 m!1422203))

(declare-fun m!1422205 () Bool)

(assert (=> b!1540087 m!1422205))

(declare-fun m!1422207 () Bool)

(assert (=> b!1540085 m!1422207))

(declare-fun m!1422209 () Bool)

(assert (=> start!131358 m!1422209))

(declare-fun m!1422211 () Bool)

(assert (=> start!131358 m!1422211))

(push 1)

(assert (not start!131358))

(assert (not b!1540079))

(assert (not b!1540078))

(assert (not b!1540081))

(assert (not b!1540080))

(assert (not b!1540086))

(assert (not b!1540085))

(assert (not b!1540084))

(check-sat)

(pop 1)

(push 1)

(check-sat)

