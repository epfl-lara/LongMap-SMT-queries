; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130980 () Bool)

(assert start!130980)

(declare-fun b!1536595 () Bool)

(declare-fun e!855250 () Bool)

(declare-fun e!855252 () Bool)

(assert (=> b!1536595 (= e!855250 e!855252)))

(declare-fun res!1053684 () Bool)

(assert (=> b!1536595 (=> (not res!1053684) (not e!855252))))

(declare-datatypes ((array!102078 0))(
  ( (array!102079 (arr!49255 (Array (_ BitVec 32) (_ BitVec 64))) (size!49805 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102078)

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664405 () (_ BitVec 32))

(assert (=> b!1536595 (= res!1053684 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664405 #b00000000000000000000000000000000) (bvslt lt!664405 (size!49805 a!2792))))))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1536595 (= lt!664405 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1536596 () Bool)

(declare-fun res!1053688 () Bool)

(declare-fun e!855249 () Bool)

(assert (=> b!1536596 (=> (not res!1053688) (not e!855249))))

(declare-datatypes ((List!35729 0))(
  ( (Nil!35726) (Cons!35725 (h!37170 (_ BitVec 64)) (t!50423 List!35729)) )
))
(declare-fun arrayNoDuplicates!0 (array!102078 (_ BitVec 32) List!35729) Bool)

(assert (=> b!1536596 (= res!1053688 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35726))))

(declare-fun b!1536597 () Bool)

(assert (=> b!1536597 (= e!855249 e!855250)))

(declare-fun res!1053687 () Bool)

(assert (=> b!1536597 (=> (not res!1053687) (not e!855250))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13387 0))(
  ( (MissingZero!13387 (index!55943 (_ BitVec 32))) (Found!13387 (index!55944 (_ BitVec 32))) (Intermediate!13387 (undefined!14199 Bool) (index!55945 (_ BitVec 32)) (x!137677 (_ BitVec 32))) (Undefined!13387) (MissingVacant!13387 (index!55946 (_ BitVec 32))) )
))
(declare-fun lt!664402 () SeekEntryResult!13387)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102078 (_ BitVec 32)) SeekEntryResult!13387)

(assert (=> b!1536597 (= res!1053687 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49255 a!2792) j!64) a!2792 mask!2480) lt!664402))))

(assert (=> b!1536597 (= lt!664402 (Found!13387 j!64))))

(declare-fun b!1536598 () Bool)

(declare-fun res!1053682 () Bool)

(assert (=> b!1536598 (=> (not res!1053682) (not e!855249))))

(assert (=> b!1536598 (= res!1053682 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49805 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49805 a!2792)) (= (select (arr!49255 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1536599 () Bool)

(declare-fun res!1053691 () Bool)

(assert (=> b!1536599 (=> (not res!1053691) (not e!855250))))

(assert (=> b!1536599 (= res!1053691 (not (= (select (arr!49255 a!2792) index!463) (select (arr!49255 a!2792) j!64))))))

(declare-fun b!1536600 () Bool)

(declare-fun res!1053689 () Bool)

(assert (=> b!1536600 (=> (not res!1053689) (not e!855249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102078 (_ BitVec 32)) Bool)

(assert (=> b!1536600 (= res!1053689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun e!855253 () Bool)

(declare-fun b!1536601 () Bool)

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1536601 (= e!855253 (not (or (bvslt mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (= (select (store (arr!49255 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!664404 () SeekEntryResult!13387)

(assert (=> b!1536601 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664405 vacantIndex!5 (select (store (arr!49255 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) j!64) (array!102079 (store (arr!49255 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49805 a!2792)) mask!2480) lt!664404)))

(declare-datatypes ((Unit!51346 0))(
  ( (Unit!51347) )
))
(declare-fun lt!664403 () Unit!51346)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!102078 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51346)

(assert (=> b!1536601 (= lt!664403 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2792 i!951 j!64 (bvadd #b00000000000000000000000000000001 x!510) lt!664405 vacantIndex!5 mask!2480))))

(declare-fun b!1536602 () Bool)

(declare-fun res!1053685 () Bool)

(assert (=> b!1536602 (=> (not res!1053685) (not e!855249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1536602 (= res!1053685 (validKeyInArray!0 (select (arr!49255 a!2792) j!64)))))

(declare-fun b!1536603 () Bool)

(declare-fun res!1053683 () Bool)

(assert (=> b!1536603 (=> (not res!1053683) (not e!855249))))

(assert (=> b!1536603 (= res!1053683 (validKeyInArray!0 (select (arr!49255 a!2792) i!951)))))

(declare-fun b!1536604 () Bool)

(declare-fun res!1053681 () Bool)

(assert (=> b!1536604 (=> (not res!1053681) (not e!855249))))

(assert (=> b!1536604 (= res!1053681 (and (= (size!49805 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49805 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49805 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1536605 () Bool)

(assert (=> b!1536605 (= e!855252 e!855253)))

(declare-fun res!1053690 () Bool)

(assert (=> b!1536605 (=> (not res!1053690) (not e!855253))))

(assert (=> b!1536605 (= res!1053690 (= lt!664404 lt!664402))))

(assert (=> b!1536605 (= lt!664404 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664405 vacantIndex!5 (select (arr!49255 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1053686 () Bool)

(assert (=> start!130980 (=> (not res!1053686) (not e!855249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130980 (= res!1053686 (validMask!0 mask!2480))))

(assert (=> start!130980 e!855249))

(assert (=> start!130980 true))

(declare-fun array_inv!38283 (array!102078) Bool)

(assert (=> start!130980 (array_inv!38283 a!2792)))

(assert (= (and start!130980 res!1053686) b!1536604))

(assert (= (and b!1536604 res!1053681) b!1536603))

(assert (= (and b!1536603 res!1053683) b!1536602))

(assert (= (and b!1536602 res!1053685) b!1536600))

(assert (= (and b!1536600 res!1053689) b!1536596))

(assert (= (and b!1536596 res!1053688) b!1536598))

(assert (= (and b!1536598 res!1053682) b!1536597))

(assert (= (and b!1536597 res!1053687) b!1536599))

(assert (= (and b!1536599 res!1053691) b!1536595))

(assert (= (and b!1536595 res!1053684) b!1536605))

(assert (= (and b!1536605 res!1053690) b!1536601))

(declare-fun m!1419069 () Bool)

(assert (=> b!1536598 m!1419069))

(declare-fun m!1419071 () Bool)

(assert (=> b!1536595 m!1419071))

(declare-fun m!1419073 () Bool)

(assert (=> b!1536596 m!1419073))

(declare-fun m!1419075 () Bool)

(assert (=> b!1536603 m!1419075))

(assert (=> b!1536603 m!1419075))

(declare-fun m!1419077 () Bool)

(assert (=> b!1536603 m!1419077))

(declare-fun m!1419079 () Bool)

(assert (=> b!1536601 m!1419079))

(declare-fun m!1419081 () Bool)

(assert (=> b!1536601 m!1419081))

(assert (=> b!1536601 m!1419079))

(declare-fun m!1419083 () Bool)

(assert (=> b!1536601 m!1419083))

(declare-fun m!1419085 () Bool)

(assert (=> b!1536601 m!1419085))

(declare-fun m!1419087 () Bool)

(assert (=> b!1536601 m!1419087))

(declare-fun m!1419089 () Bool)

(assert (=> start!130980 m!1419089))

(declare-fun m!1419091 () Bool)

(assert (=> start!130980 m!1419091))

(declare-fun m!1419093 () Bool)

(assert (=> b!1536597 m!1419093))

(assert (=> b!1536597 m!1419093))

(declare-fun m!1419095 () Bool)

(assert (=> b!1536597 m!1419095))

(assert (=> b!1536602 m!1419093))

(assert (=> b!1536602 m!1419093))

(declare-fun m!1419097 () Bool)

(assert (=> b!1536602 m!1419097))

(declare-fun m!1419099 () Bool)

(assert (=> b!1536599 m!1419099))

(assert (=> b!1536599 m!1419093))

(declare-fun m!1419101 () Bool)

(assert (=> b!1536600 m!1419101))

(assert (=> b!1536605 m!1419093))

(assert (=> b!1536605 m!1419093))

(declare-fun m!1419103 () Bool)

(assert (=> b!1536605 m!1419103))

(push 1)

(assert (not b!1536596))

(assert (not b!1536600))

(assert (not start!130980))

(assert (not b!1536595))

(assert (not b!1536597))

(assert (not b!1536603))

(assert (not b!1536602))

(assert (not b!1536601))

(assert (not b!1536605))

(check-sat)

(pop 1)

(push 1)

(check-sat)

