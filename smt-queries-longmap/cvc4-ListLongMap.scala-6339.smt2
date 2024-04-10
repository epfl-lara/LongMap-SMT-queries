; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81694 () Bool)

(assert start!81694)

(declare-fun b!953460 () Bool)

(declare-fun res!638627 () Bool)

(declare-fun e!537058 () Bool)

(assert (=> b!953460 (=> (not res!638627) (not e!537058))))

(declare-datatypes ((array!57734 0))(
  ( (array!57735 (arr!27753 (Array (_ BitVec 32) (_ BitVec 64))) (size!28232 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57734)

(declare-fun mask!4034 () (_ BitVec 32))

(assert (=> b!953460 (= res!638627 (= (size!28232 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953463 () Bool)

(assert (=> b!953463 (= e!537058 false)))

(declare-datatypes ((SeekEntryResult!9180 0))(
  ( (MissingZero!9180 (index!39091 (_ BitVec 32))) (Found!9180 (index!39092 (_ BitVec 32))) (Intermediate!9180 (undefined!9992 Bool) (index!39093 (_ BitVec 32)) (x!82076 (_ BitVec 32))) (Undefined!9180) (MissingVacant!9180 (index!39094 (_ BitVec 32))) )
))
(declare-fun lt!429721 () SeekEntryResult!9180)

(declare-fun k!2725 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57734 (_ BitVec 32)) SeekEntryResult!9180)

(assert (=> b!953463 (= lt!429721 (seekEntryOrOpen!0 k!2725 a!3460 mask!4034))))

(declare-fun res!638629 () Bool)

(assert (=> start!81694 (=> (not res!638629) (not e!537058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81694 (= res!638629 (validMask!0 mask!4034))))

(assert (=> start!81694 e!537058))

(assert (=> start!81694 true))

(declare-fun array_inv!21543 (array!57734) Bool)

(assert (=> start!81694 (array_inv!21543 a!3460)))

(declare-fun b!953461 () Bool)

(declare-fun res!638626 () Bool)

(assert (=> b!953461 (=> (not res!638626) (not e!537058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57734 (_ BitVec 32)) Bool)

(assert (=> b!953461 (= res!638626 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(declare-fun b!953462 () Bool)

(declare-fun res!638628 () Bool)

(assert (=> b!953462 (=> (not res!638628) (not e!537058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953462 (= res!638628 (validKeyInArray!0 k!2725))))

(assert (= (and start!81694 res!638629) b!953460))

(assert (= (and b!953460 res!638627) b!953461))

(assert (= (and b!953461 res!638626) b!953462))

(assert (= (and b!953462 res!638628) b!953463))

(declare-fun m!885513 () Bool)

(assert (=> b!953463 m!885513))

(declare-fun m!885515 () Bool)

(assert (=> start!81694 m!885515))

(declare-fun m!885517 () Bool)

(assert (=> start!81694 m!885517))

(declare-fun m!885519 () Bool)

(assert (=> b!953461 m!885519))

(declare-fun m!885521 () Bool)

(assert (=> b!953462 m!885521))

(push 1)

(assert (not b!953463))

