; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120598 () Bool)

(assert start!120598)

(declare-fun b!1404124 () Bool)

(declare-fun res!942687 () Bool)

(declare-fun e!794924 () Bool)

(assert (=> b!1404124 (=> (not res!942687) (not e!794924))))

(declare-datatypes ((array!95960 0))(
  ( (array!95961 (arr!46331 (Array (_ BitVec 32) (_ BitVec 64))) (size!46883 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95960)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1404124 (= res!942687 (validKeyInArray!0 (select (arr!46331 a!2901) j!112)))))

(declare-fun b!1404125 () Bool)

(declare-fun res!942691 () Bool)

(assert (=> b!1404125 (=> (not res!942691) (not e!794924))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1404125 (= res!942691 (and (= (size!46883 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46883 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46883 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1404126 () Bool)

(declare-fun res!942689 () Bool)

(assert (=> b!1404126 (=> (not res!942689) (not e!794924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95960 (_ BitVec 32)) Bool)

(assert (=> b!1404126 (= res!942689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1404127 () Bool)

(assert (=> b!1404127 (= e!794924 false)))

(declare-datatypes ((SeekEntryResult!10668 0))(
  ( (MissingZero!10668 (index!45049 (_ BitVec 32))) (Found!10668 (index!45050 (_ BitVec 32))) (Intermediate!10668 (undefined!11480 Bool) (index!45051 (_ BitVec 32)) (x!126660 (_ BitVec 32))) (Undefined!10668) (MissingVacant!10668 (index!45052 (_ BitVec 32))) )
))
(declare-fun lt!618416 () SeekEntryResult!10668)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95960 (_ BitVec 32)) SeekEntryResult!10668)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1404127 (= lt!618416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46331 a!2901) j!112) mask!2840) (select (arr!46331 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!942690 () Bool)

(assert (=> start!120598 (=> (not res!942690) (not e!794924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120598 (= res!942690 (validMask!0 mask!2840))))

(assert (=> start!120598 e!794924))

(assert (=> start!120598 true))

(declare-fun array_inv!35564 (array!95960) Bool)

(assert (=> start!120598 (array_inv!35564 a!2901)))

(declare-fun b!1404128 () Bool)

(declare-fun res!942686 () Bool)

(assert (=> b!1404128 (=> (not res!942686) (not e!794924))))

(declare-datatypes ((List!32928 0))(
  ( (Nil!32925) (Cons!32924 (h!34172 (_ BitVec 64)) (t!47614 List!32928)) )
))
(declare-fun arrayNoDuplicates!0 (array!95960 (_ BitVec 32) List!32928) Bool)

(assert (=> b!1404128 (= res!942686 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32925))))

(declare-fun b!1404129 () Bool)

(declare-fun res!942688 () Bool)

(assert (=> b!1404129 (=> (not res!942688) (not e!794924))))

(assert (=> b!1404129 (= res!942688 (validKeyInArray!0 (select (arr!46331 a!2901) i!1037)))))

(assert (= (and start!120598 res!942690) b!1404125))

(assert (= (and b!1404125 res!942691) b!1404129))

(assert (= (and b!1404129 res!942688) b!1404124))

(assert (= (and b!1404124 res!942687) b!1404126))

(assert (= (and b!1404126 res!942689) b!1404128))

(assert (= (and b!1404128 res!942686) b!1404127))

(declare-fun m!1292481 () Bool)

(assert (=> b!1404128 m!1292481))

(declare-fun m!1292483 () Bool)

(assert (=> b!1404126 m!1292483))

(declare-fun m!1292485 () Bool)

(assert (=> start!120598 m!1292485))

(declare-fun m!1292487 () Bool)

(assert (=> start!120598 m!1292487))

(declare-fun m!1292489 () Bool)

(assert (=> b!1404127 m!1292489))

(assert (=> b!1404127 m!1292489))

(declare-fun m!1292491 () Bool)

(assert (=> b!1404127 m!1292491))

(assert (=> b!1404127 m!1292491))

(assert (=> b!1404127 m!1292489))

(declare-fun m!1292493 () Bool)

(assert (=> b!1404127 m!1292493))

(declare-fun m!1292495 () Bool)

(assert (=> b!1404129 m!1292495))

(assert (=> b!1404129 m!1292495))

(declare-fun m!1292497 () Bool)

(assert (=> b!1404129 m!1292497))

(assert (=> b!1404124 m!1292489))

(assert (=> b!1404124 m!1292489))

(declare-fun m!1292499 () Bool)

(assert (=> b!1404124 m!1292499))

(push 1)

(assert (not b!1404129))

(assert (not b!1404126))

(assert (not b!1404127))

(assert (not start!120598))

(assert (not b!1404128))

(assert (not b!1404124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

