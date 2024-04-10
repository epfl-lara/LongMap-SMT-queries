; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48160 () Bool)

(assert start!48160)

(declare-fun res!326189 () Bool)

(declare-fun e!309080 () Bool)

(assert (=> start!48160 (=> (not res!326189) (not e!309080))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48160 (= res!326189 (validMask!0 mask!3216))))

(assert (=> start!48160 e!309080))

(assert (=> start!48160 true))

(declare-datatypes ((array!33596 0))(
  ( (array!33597 (arr!16145 (Array (_ BitVec 32) (_ BitVec 64))) (size!16509 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33596)

(declare-fun array_inv!11941 (array!33596) Bool)

(assert (=> start!48160 (array_inv!11941 a!3154)))

(declare-fun b!530480 () Bool)

(declare-fun res!326187 () Bool)

(assert (=> b!530480 (=> (not res!326187) (not e!309080))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530480 (= res!326187 (and (= (size!16509 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16509 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16509 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530481 () Bool)

(declare-fun res!326186 () Bool)

(assert (=> b!530481 (=> (not res!326186) (not e!309080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530481 (= res!326186 (validKeyInArray!0 (select (arr!16145 a!3154) j!147)))))

(declare-fun b!530483 () Bool)

(assert (=> b!530483 (= e!309080 (and (bvslt #b00000000000000000000000000000000 (size!16509 a!3154)) (bvsge (size!16509 a!3154) #b01111111111111111111111111111111)))))

(declare-fun b!530482 () Bool)

(declare-fun res!326188 () Bool)

(assert (=> b!530482 (=> (not res!326188) (not e!309080))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!530482 (= res!326188 (validKeyInArray!0 k!1998))))

(assert (= (and start!48160 res!326189) b!530480))

(assert (= (and b!530480 res!326187) b!530481))

(assert (= (and b!530481 res!326186) b!530482))

(assert (= (and b!530482 res!326188) b!530483))

(declare-fun m!511067 () Bool)

(assert (=> start!48160 m!511067))

(declare-fun m!511069 () Bool)

(assert (=> start!48160 m!511069))

(declare-fun m!511071 () Bool)

(assert (=> b!530481 m!511071))

(assert (=> b!530481 m!511071))

(declare-fun m!511073 () Bool)

(assert (=> b!530481 m!511073))

(declare-fun m!511075 () Bool)

(assert (=> b!530482 m!511075))

(push 1)

(assert (not b!530482))

(assert (not b!530481))

(assert (not start!48160))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

