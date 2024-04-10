; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48150 () Bool)

(assert start!48150)

(declare-fun b!530421 () Bool)

(declare-fun res!326129 () Bool)

(declare-fun e!309050 () Bool)

(assert (=> b!530421 (=> (not res!326129) (not e!309050))))

(declare-datatypes ((array!33586 0))(
  ( (array!33587 (arr!16140 (Array (_ BitVec 32) (_ BitVec 64))) (size!16504 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33586)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530421 (= res!326129 (validKeyInArray!0 (select (arr!16140 a!3154) j!147)))))

(declare-fun b!530423 () Bool)

(assert (=> b!530423 (= e!309050 (bvsge #b00000000000000000000000000000000 (size!16504 a!3154)))))

(declare-fun res!326128 () Bool)

(assert (=> start!48150 (=> (not res!326128) (not e!309050))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48150 (= res!326128 (validMask!0 mask!3216))))

(assert (=> start!48150 e!309050))

(assert (=> start!48150 true))

(declare-fun array_inv!11936 (array!33586) Bool)

(assert (=> start!48150 (array_inv!11936 a!3154)))

(declare-fun b!530422 () Bool)

(declare-fun res!326126 () Bool)

(assert (=> b!530422 (=> (not res!326126) (not e!309050))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!530422 (= res!326126 (validKeyInArray!0 k!1998))))

(declare-fun b!530420 () Bool)

(declare-fun res!326127 () Bool)

(assert (=> b!530420 (=> (not res!326127) (not e!309050))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530420 (= res!326127 (and (= (size!16504 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16504 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16504 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48150 res!326128) b!530420))

(assert (= (and b!530420 res!326127) b!530421))

(assert (= (and b!530421 res!326129) b!530422))

(assert (= (and b!530422 res!326126) b!530423))

(declare-fun m!511017 () Bool)

(assert (=> b!530421 m!511017))

(assert (=> b!530421 m!511017))

(declare-fun m!511019 () Bool)

(assert (=> b!530421 m!511019))

(declare-fun m!511021 () Bool)

(assert (=> start!48150 m!511021))

(declare-fun m!511023 () Bool)

(assert (=> start!48150 m!511023))

(declare-fun m!511025 () Bool)

(assert (=> b!530422 m!511025))

(push 1)

(assert (not b!530421))

(assert (not b!530422))

(assert (not start!48150))

(check-sat)

(pop 1)

(push 1)

(check-sat)

