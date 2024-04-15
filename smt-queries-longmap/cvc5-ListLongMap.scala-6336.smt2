; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81658 () Bool)

(assert start!81658)

(declare-fun res!638411 () Bool)

(declare-fun e!536856 () Bool)

(assert (=> start!81658 (=> (not res!638411) (not e!536856))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81658 (= res!638411 (validMask!0 mask!4034))))

(assert (=> start!81658 e!536856))

(assert (=> start!81658 true))

(declare-datatypes ((array!57681 0))(
  ( (array!57682 (arr!27727 (Array (_ BitVec 32) (_ BitVec 64))) (size!28208 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57681)

(declare-fun array_inv!21584 (array!57681) Bool)

(assert (=> start!81658 (array_inv!21584 a!3460)))

(declare-fun b!953115 () Bool)

(declare-fun res!638410 () Bool)

(assert (=> b!953115 (=> (not res!638410) (not e!536856))))

(assert (=> b!953115 (= res!638410 (= (size!28208 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953116 () Bool)

(assert (=> b!953116 (= e!536856 false)))

(declare-fun lt!429458 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57681 (_ BitVec 32)) Bool)

(assert (=> b!953116 (= lt!429458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81658 res!638411) b!953115))

(assert (= (and b!953115 res!638410) b!953116))

(declare-fun m!884669 () Bool)

(assert (=> start!81658 m!884669))

(declare-fun m!884671 () Bool)

(assert (=> start!81658 m!884671))

(declare-fun m!884673 () Bool)

(assert (=> b!953116 m!884673))

(push 1)

(assert (not start!81658))

(assert (not b!953116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

