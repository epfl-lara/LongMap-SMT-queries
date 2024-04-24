; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81802 () Bool)

(assert start!81802)

(declare-fun res!638775 () Bool)

(declare-fun e!537506 () Bool)

(assert (=> start!81802 (=> (not res!638775) (not e!537506))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81802 (= res!638775 (validMask!0 mask!4034))))

(assert (=> start!81802 e!537506))

(assert (=> start!81802 true))

(declare-datatypes ((array!57746 0))(
  ( (array!57747 (arr!27756 (Array (_ BitVec 32) (_ BitVec 64))) (size!28236 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57746)

(declare-fun array_inv!21615 (array!57746) Bool)

(assert (=> start!81802 (array_inv!21615 a!3460)))

(declare-fun b!954149 () Bool)

(declare-fun res!638774 () Bool)

(assert (=> b!954149 (=> (not res!638774) (not e!537506))))

(assert (=> b!954149 (= res!638774 (= (size!28236 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!954150 () Bool)

(assert (=> b!954150 (= e!537506 false)))

(declare-fun lt!430010 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57746 (_ BitVec 32)) Bool)

(assert (=> b!954150 (= lt!430010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81802 res!638775) b!954149))

(assert (= (and b!954149 res!638774) b!954150))

(declare-fun m!886625 () Bool)

(assert (=> start!81802 m!886625))

(declare-fun m!886627 () Bool)

(assert (=> start!81802 m!886627))

(declare-fun m!886629 () Bool)

(assert (=> b!954150 m!886629))

(push 1)

(assert (not start!81802))

(assert (not b!954150))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

