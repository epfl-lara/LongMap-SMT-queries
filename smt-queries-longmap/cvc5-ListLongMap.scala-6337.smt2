; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81678 () Bool)

(assert start!81678)

(declare-fun b!953367 () Bool)

(declare-fun e!537010 () Bool)

(assert (=> b!953367 (= e!537010 false)))

(declare-datatypes ((array!57718 0))(
  ( (array!57719 (arr!27745 (Array (_ BitVec 32) (_ BitVec 64))) (size!28224 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57718)

(declare-datatypes ((SeekEntryResult!9172 0))(
  ( (MissingZero!9172 (index!39059 (_ BitVec 32))) (Found!9172 (index!39060 (_ BitVec 32))) (Intermediate!9172 (undefined!9984 Bool) (index!39061 (_ BitVec 32)) (x!82052 (_ BitVec 32))) (Undefined!9172) (MissingVacant!9172 (index!39062 (_ BitVec 32))) )
))
(declare-fun lt!429697 () SeekEntryResult!9172)

(declare-fun k!2725 () (_ BitVec 64))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57718 (_ BitVec 32)) SeekEntryResult!9172)

(assert (=> b!953367 (= lt!429697 (seekEntryOrOpen!0 k!2725 a!3460 mask!4034))))

(declare-fun b!953365 () Bool)

(declare-fun res!638530 () Bool)

(assert (=> b!953365 (=> (not res!638530) (not e!537010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57718 (_ BitVec 32)) Bool)

(assert (=> b!953365 (= res!638530 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(declare-fun res!638532 () Bool)

(assert (=> start!81678 (=> (not res!638532) (not e!537010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81678 (= res!638532 (validMask!0 mask!4034))))

(assert (=> start!81678 e!537010))

(assert (=> start!81678 true))

(declare-fun array_inv!21535 (array!57718) Bool)

(assert (=> start!81678 (array_inv!21535 a!3460)))

(declare-fun b!953364 () Bool)

(declare-fun res!638531 () Bool)

(assert (=> b!953364 (=> (not res!638531) (not e!537010))))

(assert (=> b!953364 (= res!638531 (= (size!28224 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953366 () Bool)

(declare-fun res!638533 () Bool)

(assert (=> b!953366 (=> (not res!638533) (not e!537010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953366 (= res!638533 (validKeyInArray!0 k!2725))))

(assert (= (and start!81678 res!638532) b!953364))

(assert (= (and b!953364 res!638531) b!953365))

(assert (= (and b!953365 res!638530) b!953366))

(assert (= (and b!953366 res!638533) b!953367))

(declare-fun m!885433 () Bool)

(assert (=> b!953367 m!885433))

(declare-fun m!885435 () Bool)

(assert (=> b!953365 m!885435))

(declare-fun m!885437 () Bool)

(assert (=> start!81678 m!885437))

(declare-fun m!885439 () Bool)

(assert (=> start!81678 m!885439))

(declare-fun m!885441 () Bool)

(assert (=> b!953366 m!885441))

(push 1)

(assert (not b!953365))

(assert (not b!953366))

(assert (not start!81678))

(assert (not b!953367))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

