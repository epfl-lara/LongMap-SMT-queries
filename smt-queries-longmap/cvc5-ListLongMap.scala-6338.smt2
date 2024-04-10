; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81684 () Bool)

(assert start!81684)

(declare-fun b!953401 () Bool)

(declare-fun res!638568 () Bool)

(declare-fun e!537028 () Bool)

(assert (=> b!953401 (=> (not res!638568) (not e!537028))))

(declare-datatypes ((array!57724 0))(
  ( (array!57725 (arr!27748 (Array (_ BitVec 32) (_ BitVec 64))) (size!28227 (_ BitVec 32))) )
))
(declare-fun a!3460 () array!57724)

(declare-fun mask!4034 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57724 (_ BitVec 32)) Bool)

(assert (=> b!953401 (= res!638568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3460 mask!4034))))

(declare-fun res!638566 () Bool)

(assert (=> start!81684 (=> (not res!638566) (not e!537028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81684 (= res!638566 (validMask!0 mask!4034))))

(assert (=> start!81684 e!537028))

(assert (=> start!81684 true))

(declare-fun array_inv!21538 (array!57724) Bool)

(assert (=> start!81684 (array_inv!21538 a!3460)))

(declare-fun b!953402 () Bool)

(declare-fun res!638567 () Bool)

(assert (=> b!953402 (=> (not res!638567) (not e!537028))))

(declare-fun k!2725 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953402 (= res!638567 (validKeyInArray!0 k!2725))))

(declare-fun b!953400 () Bool)

(declare-fun res!638569 () Bool)

(assert (=> b!953400 (=> (not res!638569) (not e!537028))))

(assert (=> b!953400 (= res!638569 (= (size!28227 a!3460) (bvadd #b00000000000000000000000000000001 mask!4034)))))

(declare-fun b!953403 () Bool)

(assert (=> b!953403 (= e!537028 false)))

(declare-datatypes ((SeekEntryResult!9175 0))(
  ( (MissingZero!9175 (index!39071 (_ BitVec 32))) (Found!9175 (index!39072 (_ BitVec 32))) (Intermediate!9175 (undefined!9987 Bool) (index!39073 (_ BitVec 32)) (x!82063 (_ BitVec 32))) (Undefined!9175) (MissingVacant!9175 (index!39074 (_ BitVec 32))) )
))
(declare-fun lt!429706 () SeekEntryResult!9175)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57724 (_ BitVec 32)) SeekEntryResult!9175)

(assert (=> b!953403 (= lt!429706 (seekEntryOrOpen!0 k!2725 a!3460 mask!4034))))

(assert (= (and start!81684 res!638566) b!953400))

(assert (= (and b!953400 res!638569) b!953401))

(assert (= (and b!953401 res!638568) b!953402))

(assert (= (and b!953402 res!638567) b!953403))

(declare-fun m!885463 () Bool)

(assert (=> b!953401 m!885463))

(declare-fun m!885465 () Bool)

(assert (=> start!81684 m!885465))

(declare-fun m!885467 () Bool)

(assert (=> start!81684 m!885467))

(declare-fun m!885469 () Bool)

(assert (=> b!953402 m!885469))

(declare-fun m!885471 () Bool)

(assert (=> b!953403 m!885471))

(push 1)

(assert (not b!953402))

(assert (not start!81684))

(assert (not b!953403))

(assert (not b!953401))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

