; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48174 () Bool)

(assert start!48174)

(declare-fun b!530494 () Bool)

(declare-fun res!326201 () Bool)

(declare-fun e!309087 () Bool)

(assert (=> b!530494 (=> (not res!326201) (not e!309087))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33599 0))(
  ( (array!33600 (arr!16146 (Array (_ BitVec 32) (_ BitVec 64))) (size!16510 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33599)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530494 (= res!326201 (and (= (size!16510 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16510 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16510 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530495 () Bool)

(declare-fun res!326200 () Bool)

(assert (=> b!530495 (=> (not res!326200) (not e!309087))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530495 (= res!326200 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530496 () Bool)

(declare-fun res!326202 () Bool)

(assert (=> b!530496 (=> (not res!326202) (not e!309087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530496 (= res!326202 (validKeyInArray!0 k!1998))))

(declare-fun res!326203 () Bool)

(assert (=> start!48174 (=> (not res!326203) (not e!309087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48174 (= res!326203 (validMask!0 mask!3216))))

(assert (=> start!48174 e!309087))

(assert (=> start!48174 true))

(declare-fun array_inv!11942 (array!33599) Bool)

(assert (=> start!48174 (array_inv!11942 a!3154)))

(declare-fun b!530497 () Bool)

(declare-fun res!326204 () Bool)

(assert (=> b!530497 (=> (not res!326204) (not e!309087))))

(assert (=> b!530497 (= res!326204 (validKeyInArray!0 (select (arr!16146 a!3154) j!147)))))

(declare-fun b!530498 () Bool)

(assert (=> b!530498 (= e!309087 (bvslt mask!3216 #b00000000000000000000000000000000))))

(assert (= (and start!48174 res!326203) b!530494))

(assert (= (and b!530494 res!326201) b!530497))

(assert (= (and b!530497 res!326204) b!530496))

(assert (= (and b!530496 res!326202) b!530495))

(assert (= (and b!530495 res!326200) b!530498))

(declare-fun m!511077 () Bool)

(assert (=> b!530495 m!511077))

(declare-fun m!511079 () Bool)

(assert (=> b!530496 m!511079))

(declare-fun m!511081 () Bool)

(assert (=> start!48174 m!511081))

(declare-fun m!511083 () Bool)

(assert (=> start!48174 m!511083))

(declare-fun m!511085 () Bool)

(assert (=> b!530497 m!511085))

(assert (=> b!530497 m!511085))

(declare-fun m!511087 () Bool)

(assert (=> b!530497 m!511087))

(push 1)

