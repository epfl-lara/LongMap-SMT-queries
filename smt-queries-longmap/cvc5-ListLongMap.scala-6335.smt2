; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81666 () Bool)

(assert start!81666)

(declare-fun res!638490 () Bool)

(declare-fun e!536974 () Bool)

(assert (=> start!81666 (=> (not res!638490) (not e!536974))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81666 (= res!638490 (validMask!0 mask!4034))))

(assert (=> start!81666 e!536974))

(assert (=> start!81666 true))

(declare-datatypes ((array!57706 0))(
  ( (array!57707 (arr!27739 (Array (_ BitVec 32) (_ BitVec 64))) (size!28218 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57706)

(declare-fun array_inv!21529 (array!57706) Bool)

(assert (=> start!81666 (array_inv!21529 a!3460)))

(declare-fun b!953324 () Bool)

(declare-fun res!638491 () Bool)

(assert (=> b!953324 (=> (not res!638491) (not e!536974))))

(assert (=> b!953324 (= res!638491 (= (size!28218 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953325 () Bool)

(assert (=> b!953325 (= e!536974 false)))

(declare-fun lt!429679 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57706 (_ BitVec 32)) Bool)

(assert (=> b!953325 (= lt!429679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81666 res!638490) b!953324))

(assert (= (and b!953324 res!638491) b!953325))

(declare-fun m!885397 () Bool)

(assert (=> start!81666 m!885397))

(declare-fun m!885399 () Bool)

(assert (=> start!81666 m!885399))

(declare-fun m!885401 () Bool)

(assert (=> b!953325 m!885401))

(push 1)

(assert (not b!953325))

(assert (not start!81666))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

