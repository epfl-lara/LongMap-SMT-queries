; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81652 () Bool)

(assert start!81652)

(declare-fun res!638393 () Bool)

(declare-fun e!536839 () Bool)

(assert (=> start!81652 (=> (not res!638393) (not e!536839))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81652 (= res!638393 (validMask!0 mask!4034))))

(assert (=> start!81652 e!536839))

(assert (=> start!81652 true))

(declare-datatypes ((array!57675 0))(
  ( (array!57676 (arr!27724 (Array (_ BitVec 32) (_ BitVec 64))) (size!28205 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57675)

(declare-fun array_inv!21581 (array!57675) Bool)

(assert (=> start!81652 (array_inv!21581 a!3460)))

(declare-fun b!953097 () Bool)

(declare-fun res!638392 () Bool)

(assert (=> b!953097 (=> (not res!638392) (not e!536839))))

(assert (=> b!953097 (= res!638392 (= (size!28205 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953098 () Bool)

(assert (=> b!953098 (= e!536839 false)))

(declare-fun lt!429449 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57675 (_ BitVec 32)) Bool)

(assert (=> b!953098 (= lt!429449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81652 res!638393) b!953097))

(assert (= (and b!953097 res!638392) b!953098))

(declare-fun m!884651 () Bool)

(assert (=> start!81652 m!884651))

(declare-fun m!884653 () Bool)

(assert (=> start!81652 m!884653))

(declare-fun m!884655 () Bool)

(assert (=> b!953098 m!884655))

(push 1)

(assert (not b!953098))

(assert (not start!81652))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

