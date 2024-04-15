; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29992 () Bool)

(assert start!29992)

(declare-fun b!300879 () Bool)

(declare-fun e!189934 () Bool)

(assert (=> b!300879 (= e!189934 false)))

(declare-datatypes ((array!15219 0))(
  ( (array!15220 (arr!7202 (Array (_ BitVec 32) (_ BitVec 64))) (size!7555 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15219)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2341 0))(
  ( (MissingZero!2341 (index!11540 (_ BitVec 32))) (Found!2341 (index!11541 (_ BitVec 32))) (Intermediate!2341 (undefined!3153 Bool) (index!11542 (_ BitVec 32)) (x!29832 (_ BitVec 32))) (Undefined!2341) (MissingVacant!2341 (index!11543 (_ BitVec 32))) )
))
(declare-fun lt!149546 () SeekEntryResult!2341)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15219 (_ BitVec 32)) SeekEntryResult!2341)

(assert (=> b!300879 (= lt!149546 (seekEntryOrOpen!0 k!2441 a!3293 mask!3709))))

(declare-fun b!300877 () Bool)

(declare-fun res!158772 () Bool)

(assert (=> b!300877 (=> (not res!158772) (not e!189934))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300877 (= res!158772 (validKeyInArray!0 k!2441))))

(declare-fun b!300876 () Bool)

(declare-fun res!158774 () Bool)

(assert (=> b!300876 (=> (not res!158774) (not e!189934))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!300876 (= res!158774 (and (= (size!7555 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7555 a!3293))))))

(declare-fun b!300878 () Bool)

(declare-fun res!158773 () Bool)

(assert (=> b!300878 (=> (not res!158773) (not e!189934))))

(declare-fun arrayContainsKey!0 (array!15219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300878 (= res!158773 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!158775 () Bool)

(assert (=> start!29992 (=> (not res!158775) (not e!189934))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29992 (= res!158775 (validMask!0 mask!3709))))

(assert (=> start!29992 e!189934))

(assert (=> start!29992 true))

(declare-fun array_inv!5174 (array!15219) Bool)

(assert (=> start!29992 (array_inv!5174 a!3293)))

(assert (= (and start!29992 res!158775) b!300876))

(assert (= (and b!300876 res!158774) b!300877))

(assert (= (and b!300877 res!158772) b!300878))

(assert (= (and b!300878 res!158773) b!300879))

(declare-fun m!312279 () Bool)

(assert (=> b!300879 m!312279))

(declare-fun m!312281 () Bool)

(assert (=> b!300877 m!312281))

(declare-fun m!312283 () Bool)

(assert (=> b!300878 m!312283))

(declare-fun m!312285 () Bool)

(assert (=> start!29992 m!312285))

(declare-fun m!312287 () Bool)

(assert (=> start!29992 m!312287))

(push 1)

(assert (not b!300879))

(assert (not b!300878))

(assert (not start!29992))

(assert (not b!300877))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

