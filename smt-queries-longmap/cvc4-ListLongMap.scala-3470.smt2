; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48154 () Bool)

(assert start!48154)

(declare-fun res!326152 () Bool)

(declare-fun e!309062 () Bool)

(assert (=> start!48154 (=> (not res!326152) (not e!309062))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48154 (= res!326152 (validMask!0 mask!3216))))

(assert (=> start!48154 e!309062))

(assert (=> start!48154 true))

(declare-datatypes ((array!33590 0))(
  ( (array!33591 (arr!16142 (Array (_ BitVec 32) (_ BitVec 64))) (size!16506 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33590)

(declare-fun array_inv!11938 (array!33590) Bool)

(assert (=> start!48154 (array_inv!11938 a!3154)))

(declare-fun b!530445 () Bool)

(declare-fun res!326150 () Bool)

(assert (=> b!530445 (=> (not res!326150) (not e!309062))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530445 (= res!326150 (validKeyInArray!0 (select (arr!16142 a!3154) j!147)))))

(declare-fun b!530446 () Bool)

(declare-fun res!326153 () Bool)

(assert (=> b!530446 (=> (not res!326153) (not e!309062))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!530446 (= res!326153 (validKeyInArray!0 k!1998))))

(declare-fun b!530444 () Bool)

(declare-fun res!326151 () Bool)

(assert (=> b!530444 (=> (not res!326151) (not e!309062))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530444 (= res!326151 (and (= (size!16506 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16506 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16506 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530447 () Bool)

(assert (=> b!530447 (= e!309062 (bvsge #b00000000000000000000000000000000 (size!16506 a!3154)))))

(assert (= (and start!48154 res!326152) b!530444))

(assert (= (and b!530444 res!326151) b!530445))

(assert (= (and b!530445 res!326150) b!530446))

(assert (= (and b!530446 res!326153) b!530447))

(declare-fun m!511037 () Bool)

(assert (=> start!48154 m!511037))

(declare-fun m!511039 () Bool)

(assert (=> start!48154 m!511039))

(declare-fun m!511041 () Bool)

(assert (=> b!530445 m!511041))

(assert (=> b!530445 m!511041))

(declare-fun m!511043 () Bool)

(assert (=> b!530445 m!511043))

(declare-fun m!511045 () Bool)

(assert (=> b!530446 m!511045))

(push 1)

(assert (not b!530446))

(assert (not b!530445))

(assert (not start!48154))

(check-sat)

(pop 1)

(push 1)

(check-sat)

