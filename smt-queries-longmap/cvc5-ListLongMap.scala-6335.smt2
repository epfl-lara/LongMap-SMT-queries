; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81838 () Bool)

(assert start!81838)

(declare-fun res!638847 () Bool)

(declare-fun e!537568 () Bool)

(assert (=> start!81838 (=> (not res!638847) (not e!537568))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81838 (= res!638847 (validMask!0 mask!4034))))

(assert (=> start!81838 e!537568))

(assert (=> start!81838 true))

(declare-datatypes ((array!57761 0))(
  ( (array!57762 (arr!27762 (Array (_ BitVec 32) (_ BitVec 64))) (size!28242 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57761)

(declare-fun array_inv!21621 (array!57761) Bool)

(assert (=> start!81838 (array_inv!21621 a!3460)))

(declare-fun b!954239 () Bool)

(declare-fun res!638846 () Bool)

(assert (=> b!954239 (=> (not res!638846) (not e!537568))))

(assert (=> b!954239 (= res!638846 (= (size!28242 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!954240 () Bool)

(assert (=> b!954240 (= e!537568 false)))

(declare-fun lt!430046 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57761 (_ BitVec 32)) Bool)

(assert (=> b!954240 (= lt!430046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81838 res!638847) b!954239))

(assert (= (and b!954239 res!638846) b!954240))

(declare-fun m!886703 () Bool)

(assert (=> start!81838 m!886703))

(declare-fun m!886705 () Bool)

(assert (=> start!81838 m!886705))

(declare-fun m!886707 () Bool)

(assert (=> b!954240 m!886707))

(push 1)

(assert (not b!954240))

(assert (not start!81838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

