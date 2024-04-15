; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81670 () Bool)

(assert start!81670)

(declare-fun b!953185 () Bool)

(declare-fun res!638483 () Bool)

(declare-fun e!536892 () Bool)

(assert (=> b!953185 (=> (not res!638483) (not e!536892))))

(declare-datatypes ((array!57693 0))(
  ( (array!57694 (arr!27733 (Array (_ BitVec 32) (_ BitVec 64))) (size!28214 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57693)

(declare-fun mask!4034 () (_ BitVec 32))

(assert (=> b!953185 (= res!638483 (= (size!28214 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953188 () Bool)

(assert (=> b!953188 (= e!536892 false)))

(declare-datatypes ((SeekEntryResult!9172 0))(
  ( (MissingZero!9172 (index!39059 (_ BitVec 32))) (Found!9172 (index!39060 (_ BitVec 32))) (Intermediate!9172 (undefined!9984 Bool) (index!39061 (_ BitVec 32)) (x!82055 (_ BitVec 32))) (Undefined!9172) (MissingVacant!9172 (index!39062 (_ BitVec 32))) )
))
(declare-fun lt!429476 () SeekEntryResult!9172)

(declare-fun k!2725 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57693 (_ BitVec 32)) SeekEntryResult!9172)

(assert (=> b!953188 (= lt!429476 (seekEntryOrOpen!0 k!2725 a!3460 mask!4034))))

(declare-fun b!953187 () Bool)

(declare-fun res!638481 () Bool)

(assert (=> b!953187 (=> (not res!638481) (not e!536892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953187 (= res!638481 (validKeyInArray!0 k!2725))))

(declare-fun res!638480 () Bool)

(assert (=> start!81670 (=> (not res!638480) (not e!536892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81670 (= res!638480 (validMask!0 mask!4034))))

(assert (=> start!81670 e!536892))

(assert (=> start!81670 true))

(declare-fun array_inv!21590 (array!57693) Bool)

(assert (=> start!81670 (array_inv!21590 a!3460)))

(declare-fun b!953186 () Bool)

(declare-fun res!638482 () Bool)

(assert (=> b!953186 (=> (not res!638482) (not e!536892))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57693 (_ BitVec 32)) Bool)

(assert (=> b!953186 (= res!638482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(assert (= (and start!81670 res!638480) b!953185))

(assert (= (and b!953185 res!638483) b!953186))

(assert (= (and b!953186 res!638482) b!953187))

(assert (= (and b!953187 res!638481) b!953188))

(declare-fun m!884725 () Bool)

(assert (=> b!953188 m!884725))

(declare-fun m!884727 () Bool)

(assert (=> b!953187 m!884727))

(declare-fun m!884729 () Bool)

(assert (=> start!81670 m!884729))

(declare-fun m!884731 () Bool)

(assert (=> start!81670 m!884731))

(declare-fun m!884733 () Bool)

(assert (=> b!953186 m!884733))

(push 1)

(assert (not b!953186))

(assert (not b!953188))

(assert (not b!953187))

(assert (not start!81670))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

