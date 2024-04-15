; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48162 () Bool)

(assert start!48162)

(declare-fun b!530223 () Bool)

(declare-fun res!326072 () Bool)

(declare-fun e!308913 () Bool)

(assert (=> b!530223 (=> (not res!326072) (not e!308913))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33597 0))(
  ( (array!33598 (arr!16145 (Array (_ BitVec 32) (_ BitVec 64))) (size!16510 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33597)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530223 (= res!326072 (and (= (size!16510 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16510 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16510 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!326073 () Bool)

(assert (=> start!48162 (=> (not res!326073) (not e!308913))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48162 (= res!326073 (validMask!0 mask!3216))))

(assert (=> start!48162 e!308913))

(assert (=> start!48162 true))

(declare-fun array_inv!12028 (array!33597) Bool)

(assert (=> start!48162 (array_inv!12028 a!3154)))

(declare-fun b!530224 () Bool)

(assert (=> b!530224 (= e!308913 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun b!530225 () Bool)

(declare-fun res!326071 () Bool)

(assert (=> b!530225 (=> (not res!326071) (not e!308913))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33597 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530225 (= res!326071 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530226 () Bool)

(declare-fun res!326075 () Bool)

(assert (=> b!530226 (=> (not res!326075) (not e!308913))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530226 (= res!326075 (validKeyInArray!0 k0!1998))))

(declare-fun b!530227 () Bool)

(declare-fun res!326074 () Bool)

(assert (=> b!530227 (=> (not res!326074) (not e!308913))))

(assert (=> b!530227 (= res!326074 (validKeyInArray!0 (select (arr!16145 a!3154) j!147)))))

(assert (= (and start!48162 res!326073) b!530223))

(assert (= (and b!530223 res!326072) b!530227))

(assert (= (and b!530227 res!326074) b!530226))

(assert (= (and b!530226 res!326075) b!530225))

(assert (= (and b!530225 res!326071) b!530224))

(declare-fun m!510325 () Bool)

(assert (=> start!48162 m!510325))

(declare-fun m!510327 () Bool)

(assert (=> start!48162 m!510327))

(declare-fun m!510329 () Bool)

(assert (=> b!530225 m!510329))

(declare-fun m!510331 () Bool)

(assert (=> b!530226 m!510331))

(declare-fun m!510333 () Bool)

(assert (=> b!530227 m!510333))

(assert (=> b!530227 m!510333))

(declare-fun m!510335 () Bool)

(assert (=> b!530227 m!510335))

(check-sat (not b!530226) (not b!530225) (not start!48162) (not b!530227))
(check-sat)
