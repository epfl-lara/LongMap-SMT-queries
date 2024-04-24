; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131206 () Bool)

(assert start!131206)

(declare-fun b!1536551 () Bool)

(declare-fun res!1052155 () Bool)

(declare-fun e!855870 () Bool)

(assert (=> b!1536551 (=> (not res!1052155) (not e!855870))))

(declare-datatypes ((array!102041 0))(
  ( (array!102042 (arr!49230 (Array (_ BitVec 32) (_ BitVec 64))) (size!49781 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102041)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536551 (= res!1052155 (validKeyInArray!0 (select (arr!49230 a!2792) i!951)))))

(declare-fun b!1536552 () Bool)

(assert (=> b!1536552 (= e!855870 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13257 0))(
  ( (MissingZero!13257 (index!55423 (_ BitVec 32))) (Found!13257 (index!55424 (_ BitVec 32))) (Intermediate!13257 (undefined!14069 Bool) (index!55425 (_ BitVec 32)) (x!137386 (_ BitVec 32))) (Undefined!13257) (MissingVacant!13257 (index!55426 (_ BitVec 32))) )
))
(declare-fun lt!664731 () SeekEntryResult!13257)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102041 (_ BitVec 32)) SeekEntryResult!13257)

(assert (=> b!1536552 (= lt!664731 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49230 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1536553 () Bool)

(declare-fun res!1052157 () Bool)

(assert (=> b!1536553 (=> (not res!1052157) (not e!855870))))

(assert (=> b!1536553 (= res!1052157 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49781 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49781 a!2792)) (= (select (arr!49230 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536554 () Bool)

(declare-fun res!1052151 () Bool)

(assert (=> b!1536554 (=> (not res!1052151) (not e!855870))))

(declare-datatypes ((List!35691 0))(
  ( (Nil!35688) (Cons!35687 (h!37150 (_ BitVec 64)) (t!50377 List!35691)) )
))
(declare-fun arrayNoDuplicates!0 (array!102041 (_ BitVec 32) List!35691) Bool)

(assert (=> b!1536554 (= res!1052151 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35688))))

(declare-fun b!1536555 () Bool)

(declare-fun res!1052153 () Bool)

(assert (=> b!1536555 (=> (not res!1052153) (not e!855870))))

(assert (=> b!1536555 (= res!1052153 (and (= (size!49781 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49781 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49781 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1052156 () Bool)

(assert (=> start!131206 (=> (not res!1052156) (not e!855870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131206 (= res!1052156 (validMask!0 mask!2480))))

(assert (=> start!131206 e!855870))

(assert (=> start!131206 true))

(declare-fun array_inv!38511 (array!102041) Bool)

(assert (=> start!131206 (array_inv!38511 a!2792)))

(declare-fun b!1536556 () Bool)

(declare-fun res!1052152 () Bool)

(assert (=> b!1536556 (=> (not res!1052152) (not e!855870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102041 (_ BitVec 32)) Bool)

(assert (=> b!1536556 (= res!1052152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1536557 () Bool)

(declare-fun res!1052154 () Bool)

(assert (=> b!1536557 (=> (not res!1052154) (not e!855870))))

(assert (=> b!1536557 (= res!1052154 (validKeyInArray!0 (select (arr!49230 a!2792) j!64)))))

(assert (= (and start!131206 res!1052156) b!1536555))

(assert (= (and b!1536555 res!1052153) b!1536551))

(assert (= (and b!1536551 res!1052155) b!1536557))

(assert (= (and b!1536557 res!1052154) b!1536556))

(assert (= (and b!1536556 res!1052152) b!1536554))

(assert (= (and b!1536554 res!1052151) b!1536553))

(assert (= (and b!1536553 res!1052157) b!1536552))

(declare-fun m!1419083 () Bool)

(assert (=> start!131206 m!1419083))

(declare-fun m!1419085 () Bool)

(assert (=> start!131206 m!1419085))

(declare-fun m!1419087 () Bool)

(assert (=> b!1536554 m!1419087))

(declare-fun m!1419089 () Bool)

(assert (=> b!1536551 m!1419089))

(assert (=> b!1536551 m!1419089))

(declare-fun m!1419091 () Bool)

(assert (=> b!1536551 m!1419091))

(declare-fun m!1419093 () Bool)

(assert (=> b!1536557 m!1419093))

(assert (=> b!1536557 m!1419093))

(declare-fun m!1419095 () Bool)

(assert (=> b!1536557 m!1419095))

(assert (=> b!1536552 m!1419093))

(assert (=> b!1536552 m!1419093))

(declare-fun m!1419097 () Bool)

(assert (=> b!1536552 m!1419097))

(declare-fun m!1419099 () Bool)

(assert (=> b!1536556 m!1419099))

(declare-fun m!1419101 () Bool)

(assert (=> b!1536553 m!1419101))

(push 1)

(assert (not b!1536556))

(assert (not b!1536552))

(assert (not b!1536554))

(assert (not start!131206))

(assert (not b!1536557))

(assert (not b!1536551))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

