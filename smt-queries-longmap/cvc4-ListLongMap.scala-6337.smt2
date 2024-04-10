; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81682 () Bool)

(assert start!81682)

(declare-fun b!953390 () Bool)

(declare-fun res!638555 () Bool)

(declare-fun e!537023 () Bool)

(assert (=> b!953390 (=> (not res!638555) (not e!537023))))

(declare-fun k!2725 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953390 (= res!638555 (validKeyInArray!0 k!2725))))

(declare-fun b!953391 () Bool)

(assert (=> b!953391 (= e!537023 false)))

(declare-datatypes ((array!57722 0))(
  ( (array!57723 (arr!27747 (Array (_ BitVec 32) (_ BitVec 64))) (size!28226 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57722)

(declare-datatypes ((SeekEntryResult!9174 0))(
  ( (MissingZero!9174 (index!39067 (_ BitVec 32))) (Found!9174 (index!39068 (_ BitVec 32))) (Intermediate!9174 (undefined!9986 Bool) (index!39069 (_ BitVec 32)) (x!82054 (_ BitVec 32))) (Undefined!9174) (MissingVacant!9174 (index!39070 (_ BitVec 32))) )
))
(declare-fun lt!429703 () SeekEntryResult!9174)

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57722 (_ BitVec 32)) SeekEntryResult!9174)

(assert (=> b!953391 (= lt!429703 (seekEntryOrOpen!0 k!2725 a!3460 mask!4034))))

(declare-fun b!953389 () Bool)

(declare-fun res!638557 () Bool)

(assert (=> b!953389 (=> (not res!638557) (not e!537023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57722 (_ BitVec 32)) Bool)

(assert (=> b!953389 (= res!638557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(declare-fun res!638556 () Bool)

(assert (=> start!81682 (=> (not res!638556) (not e!537023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81682 (= res!638556 (validMask!0 mask!4034))))

(assert (=> start!81682 e!537023))

(assert (=> start!81682 true))

(declare-fun array_inv!21537 (array!57722) Bool)

(assert (=> start!81682 (array_inv!21537 a!3460)))

(declare-fun b!953388 () Bool)

(declare-fun res!638554 () Bool)

(assert (=> b!953388 (=> (not res!638554) (not e!537023))))

(assert (=> b!953388 (= res!638554 (= (size!28226 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(assert (= (and start!81682 res!638556) b!953388))

(assert (= (and b!953388 res!638554) b!953389))

(assert (= (and b!953389 res!638557) b!953390))

(assert (= (and b!953390 res!638555) b!953391))

(declare-fun m!885453 () Bool)

(assert (=> b!953390 m!885453))

(declare-fun m!885455 () Bool)

(assert (=> b!953391 m!885455))

(declare-fun m!885457 () Bool)

(assert (=> b!953389 m!885457))

(declare-fun m!885459 () Bool)

(assert (=> start!81682 m!885459))

(declare-fun m!885461 () Bool)

(assert (=> start!81682 m!885461))

(push 1)

(assert (not b!953389))

(assert (not b!953390))

(assert (not start!81682))

(assert (not b!953391))

(check-sat)

