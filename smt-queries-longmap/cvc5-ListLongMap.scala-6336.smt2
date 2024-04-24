; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81844 () Bool)

(assert start!81844)

(declare-fun res!638865 () Bool)

(declare-fun e!537587 () Bool)

(assert (=> start!81844 (=> (not res!638865) (not e!537587))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81844 (= res!638865 (validMask!0 mask!4034))))

(assert (=> start!81844 e!537587))

(assert (=> start!81844 true))

(declare-datatypes ((array!57767 0))(
  ( (array!57768 (arr!27765 (Array (_ BitVec 32) (_ BitVec 64))) (size!28245 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57767)

(declare-fun array_inv!21624 (array!57767) Bool)

(assert (=> start!81844 (array_inv!21624 a!3460)))

(declare-fun b!954257 () Bool)

(declare-fun res!638864 () Bool)

(assert (=> b!954257 (=> (not res!638864) (not e!537587))))

(assert (=> b!954257 (= res!638864 (= (size!28245 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!954258 () Bool)

(assert (=> b!954258 (= e!537587 false)))

(declare-fun lt!430055 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57767 (_ BitVec 32)) Bool)

(assert (=> b!954258 (= lt!430055 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81844 res!638865) b!954257))

(assert (= (and b!954257 res!638864) b!954258))

(declare-fun m!886721 () Bool)

(assert (=> start!81844 m!886721))

(declare-fun m!886723 () Bool)

(assert (=> start!81844 m!886723))

(declare-fun m!886725 () Bool)

(assert (=> b!954258 m!886725))

(push 1)

(assert (not b!954258))

(assert (not start!81844))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

