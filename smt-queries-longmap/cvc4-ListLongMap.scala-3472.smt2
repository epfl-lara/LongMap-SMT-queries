; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48178 () Bool)

(assert start!48178)

(declare-fun res!326230 () Bool)

(declare-fun e!309099 () Bool)

(assert (=> start!48178 (=> (not res!326230) (not e!309099))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48178 (= res!326230 (validMask!0 mask!3216))))

(assert (=> start!48178 e!309099))

(assert (=> start!48178 true))

(declare-datatypes ((array!33603 0))(
  ( (array!33604 (arr!16148 (Array (_ BitVec 32) (_ BitVec 64))) (size!16512 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33603)

(declare-fun array_inv!11944 (array!33603) Bool)

(assert (=> start!48178 (array_inv!11944 a!3154)))

(declare-fun b!530524 () Bool)

(assert (=> b!530524 (= e!309099 (bvslt mask!3216 #b00000000000000000000000000000000))))

(declare-fun b!530525 () Bool)

(declare-fun res!326231 () Bool)

(assert (=> b!530525 (=> (not res!326231) (not e!309099))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530525 (= res!326231 (validKeyInArray!0 k!1998))))

(declare-fun b!530526 () Bool)

(declare-fun res!326234 () Bool)

(assert (=> b!530526 (=> (not res!326234) (not e!309099))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530526 (= res!326234 (and (= (size!16512 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16512 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16512 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530527 () Bool)

(declare-fun res!326233 () Bool)

(assert (=> b!530527 (=> (not res!326233) (not e!309099))))

(declare-fun arrayContainsKey!0 (array!33603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530527 (= res!326233 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530528 () Bool)

(declare-fun res!326232 () Bool)

(assert (=> b!530528 (=> (not res!326232) (not e!309099))))

(assert (=> b!530528 (= res!326232 (validKeyInArray!0 (select (arr!16148 a!3154) j!147)))))

(assert (= (and start!48178 res!326230) b!530526))

(assert (= (and b!530526 res!326234) b!530528))

(assert (= (and b!530528 res!326232) b!530525))

(assert (= (and b!530525 res!326231) b!530527))

(assert (= (and b!530527 res!326233) b!530524))

(declare-fun m!511101 () Bool)

(assert (=> start!48178 m!511101))

(declare-fun m!511103 () Bool)

(assert (=> start!48178 m!511103))

(declare-fun m!511105 () Bool)

(assert (=> b!530525 m!511105))

(declare-fun m!511107 () Bool)

(assert (=> b!530527 m!511107))

(declare-fun m!511109 () Bool)

(assert (=> b!530528 m!511109))

(assert (=> b!530528 m!511109))

(declare-fun m!511111 () Bool)

(assert (=> b!530528 m!511111))

(push 1)

(assert (not b!530528))

(assert (not b!530527))

(assert (not b!530525))

