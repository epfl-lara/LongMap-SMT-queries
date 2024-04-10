; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48152 () Bool)

(assert start!48152)

(declare-fun res!326138 () Bool)

(declare-fun e!309056 () Bool)

(assert (=> start!48152 (=> (not res!326138) (not e!309056))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48152 (= res!326138 (validMask!0 mask!3216))))

(assert (=> start!48152 e!309056))

(assert (=> start!48152 true))

(declare-datatypes ((array!33588 0))(
  ( (array!33589 (arr!16141 (Array (_ BitVec 32) (_ BitVec 64))) (size!16505 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33588)

(declare-fun array_inv!11937 (array!33588) Bool)

(assert (=> start!48152 (array_inv!11937 a!3154)))

(declare-fun b!530435 () Bool)

(assert (=> b!530435 (= e!309056 (bvsge #b00000000000000000000000000000000 (size!16505 a!3154)))))

(declare-fun b!530433 () Bool)

(declare-fun res!326140 () Bool)

(assert (=> b!530433 (=> (not res!326140) (not e!309056))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530433 (= res!326140 (validKeyInArray!0 (select (arr!16141 a!3154) j!147)))))

(declare-fun b!530432 () Bool)

(declare-fun res!326141 () Bool)

(assert (=> b!530432 (=> (not res!326141) (not e!309056))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530432 (= res!326141 (and (= (size!16505 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16505 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16505 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530434 () Bool)

(declare-fun res!326139 () Bool)

(assert (=> b!530434 (=> (not res!326139) (not e!309056))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!530434 (= res!326139 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48152 res!326138) b!530432))

(assert (= (and b!530432 res!326141) b!530433))

(assert (= (and b!530433 res!326140) b!530434))

(assert (= (and b!530434 res!326139) b!530435))

(declare-fun m!511027 () Bool)

(assert (=> start!48152 m!511027))

(declare-fun m!511029 () Bool)

(assert (=> start!48152 m!511029))

(declare-fun m!511031 () Bool)

(assert (=> b!530433 m!511031))

(assert (=> b!530433 m!511031))

(declare-fun m!511033 () Bool)

(assert (=> b!530433 m!511033))

(declare-fun m!511035 () Bool)

(assert (=> b!530434 m!511035))

(check-sat (not b!530434) (not b!530433) (not start!48152))
(check-sat)
