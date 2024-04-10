; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48176 () Bool)

(assert start!48176)

(declare-fun res!326219 () Bool)

(declare-fun e!309092 () Bool)

(assert (=> start!48176 (=> (not res!326219) (not e!309092))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48176 (= res!326219 (validMask!0 mask!3216))))

(assert (=> start!48176 e!309092))

(assert (=> start!48176 true))

(declare-datatypes ((array!33601 0))(
  ( (array!33602 (arr!16147 (Array (_ BitVec 32) (_ BitVec 64))) (size!16511 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33601)

(declare-fun array_inv!11943 (array!33601) Bool)

(assert (=> start!48176 (array_inv!11943 a!3154)))

(declare-fun b!530509 () Bool)

(declare-fun res!326218 () Bool)

(assert (=> b!530509 (=> (not res!326218) (not e!309092))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530509 (= res!326218 (and (= (size!16511 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16511 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16511 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530510 () Bool)

(assert (=> b!530510 (= e!309092 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun b!530511 () Bool)

(declare-fun res!326216 () Bool)

(assert (=> b!530511 (=> (not res!326216) (not e!309092))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530511 (= res!326216 (validKeyInArray!0 k0!1998))))

(declare-fun b!530512 () Bool)

(declare-fun res!326217 () Bool)

(assert (=> b!530512 (=> (not res!326217) (not e!309092))))

(declare-fun arrayContainsKey!0 (array!33601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530512 (= res!326217 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530513 () Bool)

(declare-fun res!326215 () Bool)

(assert (=> b!530513 (=> (not res!326215) (not e!309092))))

(assert (=> b!530513 (= res!326215 (validKeyInArray!0 (select (arr!16147 a!3154) j!147)))))

(assert (= (and start!48176 res!326219) b!530509))

(assert (= (and b!530509 res!326218) b!530513))

(assert (= (and b!530513 res!326215) b!530511))

(assert (= (and b!530511 res!326216) b!530512))

(assert (= (and b!530512 res!326217) b!530510))

(declare-fun m!511089 () Bool)

(assert (=> start!48176 m!511089))

(declare-fun m!511091 () Bool)

(assert (=> start!48176 m!511091))

(declare-fun m!511093 () Bool)

(assert (=> b!530511 m!511093))

(declare-fun m!511095 () Bool)

(assert (=> b!530512 m!511095))

(declare-fun m!511097 () Bool)

(assert (=> b!530513 m!511097))

(assert (=> b!530513 m!511097))

(declare-fun m!511099 () Bool)

(assert (=> b!530513 m!511099))

(check-sat (not start!48176) (not b!530513) (not b!530512) (not b!530511))
(check-sat)
