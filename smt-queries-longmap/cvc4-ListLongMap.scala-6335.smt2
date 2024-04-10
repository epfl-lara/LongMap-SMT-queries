; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81670 () Bool)

(assert start!81670)

(declare-fun res!638503 () Bool)

(declare-fun e!536987 () Bool)

(assert (=> start!81670 (=> (not res!638503) (not e!536987))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81670 (= res!638503 (validMask!0 mask!4034))))

(assert (=> start!81670 e!536987))

(assert (=> start!81670 true))

(declare-datatypes ((array!57710 0))(
  ( (array!57711 (arr!27741 (Array (_ BitVec 32) (_ BitVec 64))) (size!28220 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57710)

(declare-fun array_inv!21531 (array!57710) Bool)

(assert (=> start!81670 (array_inv!21531 a!3460)))

(declare-fun b!953336 () Bool)

(declare-fun res!638502 () Bool)

(assert (=> b!953336 (=> (not res!638502) (not e!536987))))

(assert (=> b!953336 (= res!638502 (= (size!28220 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953337 () Bool)

(assert (=> b!953337 (= e!536987 false)))

(declare-fun lt!429685 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57710 (_ BitVec 32)) Bool)

(assert (=> b!953337 (= lt!429685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81670 res!638503) b!953336))

(assert (= (and b!953336 res!638502) b!953337))

(declare-fun m!885409 () Bool)

(assert (=> start!81670 m!885409))

(declare-fun m!885411 () Bool)

(assert (=> start!81670 m!885411))

(declare-fun m!885413 () Bool)

(assert (=> b!953337 m!885413))

(push 1)

(assert (not b!953337))

(assert (not start!81670))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

