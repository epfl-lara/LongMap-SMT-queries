; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130916 () Bool)

(assert start!130916)

(declare-fun b!1535573 () Bool)

(declare-fun res!1052660 () Bool)

(declare-fun e!854839 () Bool)

(assert (=> b!1535573 (=> (not res!1052660) (not e!854839))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102014 0))(
  ( (array!102015 (arr!49223 (Array (_ BitVec 32) (_ BitVec 64))) (size!49773 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102014)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13355 0))(
  ( (MissingZero!13355 (index!55815 (_ BitVec 32))) (Found!13355 (index!55816 (_ BitVec 32))) (Intermediate!13355 (undefined!14167 Bool) (index!55817 (_ BitVec 32)) (x!137565 (_ BitVec 32))) (Undefined!13355) (MissingVacant!13355 (index!55818 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102014 (_ BitVec 32)) SeekEntryResult!13355)

(assert (=> b!1535573 (= res!1052660 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49223 a!2792) j!64) a!2792 mask!2480) (Found!13355 j!64)))))

(declare-fun b!1535574 () Bool)

(declare-fun e!854838 () Bool)

(assert (=> b!1535574 (= e!854838 false)))

(declare-fun lt!664087 () (_ BitVec 32))

(declare-fun lt!664086 () SeekEntryResult!13355)

(assert (=> b!1535574 (= lt!664086 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664087 vacantIndex!5 (select (arr!49223 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535575 () Bool)

(declare-fun res!1052666 () Bool)

(assert (=> b!1535575 (=> (not res!1052666) (not e!854839))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535575 (= res!1052666 (validKeyInArray!0 (select (arr!49223 a!2792) j!64)))))

(declare-fun b!1535576 () Bool)

(declare-fun res!1052665 () Bool)

(assert (=> b!1535576 (=> (not res!1052665) (not e!854839))))

(declare-datatypes ((List!35697 0))(
  ( (Nil!35694) (Cons!35693 (h!37138 (_ BitVec 64)) (t!50391 List!35697)) )
))
(declare-fun arrayNoDuplicates!0 (array!102014 (_ BitVec 32) List!35697) Bool)

(assert (=> b!1535576 (= res!1052665 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35694))))

(declare-fun b!1535577 () Bool)

(declare-fun res!1052659 () Bool)

(assert (=> b!1535577 (=> (not res!1052659) (not e!854839))))

(assert (=> b!1535577 (= res!1052659 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49773 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49773 a!2792)) (= (select (arr!49223 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535578 () Bool)

(declare-fun res!1052662 () Bool)

(assert (=> b!1535578 (=> (not res!1052662) (not e!854839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102014 (_ BitVec 32)) Bool)

(assert (=> b!1535578 (= res!1052662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535579 () Bool)

(declare-fun res!1052668 () Bool)

(assert (=> b!1535579 (=> (not res!1052668) (not e!854839))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535579 (= res!1052668 (and (= (size!49773 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49773 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49773 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535581 () Bool)

(assert (=> b!1535581 (= e!854839 e!854838)))

(declare-fun res!1052667 () Bool)

(assert (=> b!1535581 (=> (not res!1052667) (not e!854838))))

(assert (=> b!1535581 (= res!1052667 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664087 #b00000000000000000000000000000000) (bvslt lt!664087 (size!49773 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535581 (= lt!664087 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535582 () Bool)

(declare-fun res!1052661 () Bool)

(assert (=> b!1535582 (=> (not res!1052661) (not e!854839))))

(assert (=> b!1535582 (= res!1052661 (validKeyInArray!0 (select (arr!49223 a!2792) i!951)))))

(declare-fun b!1535580 () Bool)

(declare-fun res!1052664 () Bool)

(assert (=> b!1535580 (=> (not res!1052664) (not e!854839))))

(assert (=> b!1535580 (= res!1052664 (not (= (select (arr!49223 a!2792) index!463) (select (arr!49223 a!2792) j!64))))))

(declare-fun res!1052663 () Bool)

(assert (=> start!130916 (=> (not res!1052663) (not e!854839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130916 (= res!1052663 (validMask!0 mask!2480))))

(assert (=> start!130916 e!854839))

(assert (=> start!130916 true))

(declare-fun array_inv!38251 (array!102014) Bool)

(assert (=> start!130916 (array_inv!38251 a!2792)))

(assert (= (and start!130916 res!1052663) b!1535579))

(assert (= (and b!1535579 res!1052668) b!1535582))

(assert (= (and b!1535582 res!1052661) b!1535575))

(assert (= (and b!1535575 res!1052666) b!1535578))

(assert (= (and b!1535578 res!1052662) b!1535576))

(assert (= (and b!1535576 res!1052665) b!1535577))

(assert (= (and b!1535577 res!1052659) b!1535573))

(assert (= (and b!1535573 res!1052660) b!1535580))

(assert (= (and b!1535580 res!1052664) b!1535581))

(assert (= (and b!1535581 res!1052667) b!1535574))

(declare-fun m!1418073 () Bool)

(assert (=> start!130916 m!1418073))

(declare-fun m!1418075 () Bool)

(assert (=> start!130916 m!1418075))

(declare-fun m!1418077 () Bool)

(assert (=> b!1535573 m!1418077))

(assert (=> b!1535573 m!1418077))

(declare-fun m!1418079 () Bool)

(assert (=> b!1535573 m!1418079))

(declare-fun m!1418081 () Bool)

(assert (=> b!1535581 m!1418081))

(assert (=> b!1535575 m!1418077))

(assert (=> b!1535575 m!1418077))

(declare-fun m!1418083 () Bool)

(assert (=> b!1535575 m!1418083))

(declare-fun m!1418085 () Bool)

(assert (=> b!1535578 m!1418085))

(declare-fun m!1418087 () Bool)

(assert (=> b!1535576 m!1418087))

(declare-fun m!1418089 () Bool)

(assert (=> b!1535582 m!1418089))

(assert (=> b!1535582 m!1418089))

(declare-fun m!1418091 () Bool)

(assert (=> b!1535582 m!1418091))

(declare-fun m!1418093 () Bool)

(assert (=> b!1535577 m!1418093))

(declare-fun m!1418095 () Bool)

(assert (=> b!1535580 m!1418095))

(assert (=> b!1535580 m!1418077))

(assert (=> b!1535574 m!1418077))

(assert (=> b!1535574 m!1418077))

(declare-fun m!1418097 () Bool)

(assert (=> b!1535574 m!1418097))

(push 1)

