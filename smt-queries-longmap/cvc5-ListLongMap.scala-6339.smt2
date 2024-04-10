; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81690 () Bool)

(assert start!81690)

(declare-fun b!953439 () Bool)

(declare-fun e!537046 () Bool)

(assert (=> b!953439 (= e!537046 false)))

(declare-datatypes ((array!57730 0))(
  ( (array!57731 (arr!27751 (Array (_ BitVec 32) (_ BitVec 64))) (size!28230 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57730)

(declare-datatypes ((SeekEntryResult!9178 0))(
  ( (MissingZero!9178 (index!39083 (_ BitVec 32))) (Found!9178 (index!39084 (_ BitVec 32))) (Intermediate!9178 (undefined!9990 Bool) (index!39085 (_ BitVec 32)) (x!82074 (_ BitVec 32))) (Undefined!9178) (MissingVacant!9178 (index!39086 (_ BitVec 32))) )
))
(declare-fun lt!429715 () SeekEntryResult!9178)

(declare-fun k!2725 () (_ BitVec 64))

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57730 (_ BitVec 32)) SeekEntryResult!9178)

(assert (=> b!953439 (= lt!429715 (seekEntryOrOpen!0 k!2725 a!3460 mask!4034))))

(declare-fun b!953437 () Bool)

(declare-fun res!638604 () Bool)

(assert (=> b!953437 (=> (not res!638604) (not e!537046))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57730 (_ BitVec 32)) Bool)

(assert (=> b!953437 (= res!638604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(declare-fun b!953438 () Bool)

(declare-fun res!638602 () Bool)

(assert (=> b!953438 (=> (not res!638602) (not e!537046))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953438 (= res!638602 (validKeyInArray!0 k!2725))))

(declare-fun b!953436 () Bool)

(declare-fun res!638603 () Bool)

(assert (=> b!953436 (=> (not res!638603) (not e!537046))))

(assert (=> b!953436 (= res!638603 (= (size!28230 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun res!638605 () Bool)

(assert (=> start!81690 (=> (not res!638605) (not e!537046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81690 (= res!638605 (validMask!0 mask!4034))))

(assert (=> start!81690 e!537046))

(assert (=> start!81690 true))

(declare-fun array_inv!21541 (array!57730) Bool)

(assert (=> start!81690 (array_inv!21541 a!3460)))

(assert (= (and start!81690 res!638605) b!953436))

(assert (= (and b!953436 res!638603) b!953437))

(assert (= (and b!953437 res!638604) b!953438))

(assert (= (and b!953438 res!638602) b!953439))

(declare-fun m!885493 () Bool)

(assert (=> b!953439 m!885493))

(declare-fun m!885495 () Bool)

(assert (=> b!953437 m!885495))

(declare-fun m!885497 () Bool)

(assert (=> b!953438 m!885497))

(declare-fun m!885499 () Bool)

(assert (=> start!81690 m!885499))

(declare-fun m!885501 () Bool)

(assert (=> start!81690 m!885501))

(push 1)

(assert (not b!953437))

(assert (not b!953439))

(assert (not b!953438))

(assert (not start!81690))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

