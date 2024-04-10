; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81672 () Bool)

(assert start!81672)

(declare-fun res!638508 () Bool)

(declare-fun e!536993 () Bool)

(assert (=> start!81672 (=> (not res!638508) (not e!536993))))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81672 (= res!638508 (validMask!0 mask!4034))))

(assert (=> start!81672 e!536993))

(assert (=> start!81672 true))

(declare-datatypes ((array!57712 0))(
  ( (array!57713 (arr!27742 (Array (_ BitVec 32) (_ BitVec 64))) (size!28221 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57712)

(declare-fun array_inv!21532 (array!57712) Bool)

(assert (=> start!81672 (array_inv!21532 a!3460)))

(declare-fun b!953342 () Bool)

(declare-fun res!638509 () Bool)

(assert (=> b!953342 (=> (not res!638509) (not e!536993))))

(assert (=> b!953342 (= res!638509 (= (size!28221 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953343 () Bool)

(assert (=> b!953343 (= e!536993 false)))

(declare-fun lt!429688 () Bool)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57712 (_ BitVec 32)) Bool)

(assert (=> b!953343 (= lt!429688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81672 res!638508) b!953342))

(assert (= (and b!953342 res!638509) b!953343))

(declare-fun m!885415 () Bool)

(assert (=> start!81672 m!885415))

(declare-fun m!885417 () Bool)

(assert (=> start!81672 m!885417))

(declare-fun m!885419 () Bool)

(assert (=> b!953343 m!885419))

(push 1)

(assert (not start!81672))

(assert (not b!953343))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

