; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81676 () Bool)

(assert start!81676)

(declare-fun res!638520 () Bool)

(declare-fun e!537005 () Bool)

(assert (=> start!81676 (=> (not res!638520) (not e!537005))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81676 (= res!638520 (validMask!0 mask!4034))))

(assert (=> start!81676 e!537005))

(assert (=> start!81676 true))

(declare-datatypes ((array!57716 0))(
  ( (array!57717 (arr!27744 (Array (_ BitVec 32) (_ BitVec 64))) (size!28223 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57716)

(declare-fun array_inv!21534 (array!57716) Bool)

(assert (=> start!81676 (array_inv!21534 a!3460)))

(declare-fun b!953354 () Bool)

(declare-fun res!638521 () Bool)

(assert (=> b!953354 (=> (not res!638521) (not e!537005))))

(assert (=> b!953354 (= res!638521 (= (size!28223 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953355 () Bool)

(assert (=> b!953355 (= e!537005 false)))

(declare-fun lt!429694 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57716 (_ BitVec 32)) Bool)

(assert (=> b!953355 (= lt!429694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81676 res!638520) b!953354))

(assert (= (and b!953354 res!638521) b!953355))

(declare-fun m!885427 () Bool)

(assert (=> start!81676 m!885427))

(declare-fun m!885429 () Bool)

(assert (=> start!81676 m!885429))

(declare-fun m!885431 () Bool)

(assert (=> b!953355 m!885431))

(push 1)

(assert (not b!953355))

(assert (not start!81676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

