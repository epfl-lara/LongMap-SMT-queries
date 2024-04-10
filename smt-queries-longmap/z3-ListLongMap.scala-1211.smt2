; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25734 () Bool)

(assert start!25734)

(declare-fun b!266837 () Bool)

(declare-fun e!172581 () Bool)

(declare-datatypes ((array!12913 0))(
  ( (array!12914 (arr!6111 (Array (_ BitVec 32) (_ BitVec 64))) (size!6463 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12913)

(assert (=> b!266837 (= e!172581 (bvsge #b00000000000000000000000000000000 (size!6463 a!3436)))))

(declare-fun b!266838 () Bool)

(declare-fun res!131137 () Bool)

(declare-fun e!172582 () Bool)

(assert (=> b!266838 (=> (not res!131137) (not e!172582))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266838 (= res!131137 (and (= (size!6463 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6463 a!3436))))))

(declare-fun b!266839 () Bool)

(declare-fun res!131133 () Bool)

(assert (=> b!266839 (=> (not res!131133) (not e!172581))))

(declare-datatypes ((List!3925 0))(
  ( (Nil!3922) (Cons!3921 (h!4588 (_ BitVec 64)) (t!9007 List!3925)) )
))
(declare-fun arrayNoDuplicates!0 (array!12913 (_ BitVec 32) List!3925) Bool)

(assert (=> b!266839 (= res!131133 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3922))))

(declare-fun res!131138 () Bool)

(assert (=> start!25734 (=> (not res!131138) (not e!172582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25734 (= res!131138 (validMask!0 mask!4002))))

(assert (=> start!25734 e!172582))

(assert (=> start!25734 true))

(declare-fun array_inv!4074 (array!12913) Bool)

(assert (=> start!25734 (array_inv!4074 a!3436)))

(declare-fun b!266840 () Bool)

(assert (=> b!266840 (= e!172582 e!172581)))

(declare-fun res!131139 () Bool)

(assert (=> b!266840 (=> (not res!131139) (not e!172581))))

(declare-datatypes ((SeekEntryResult!1302 0))(
  ( (MissingZero!1302 (index!7378 (_ BitVec 32))) (Found!1302 (index!7379 (_ BitVec 32))) (Intermediate!1302 (undefined!2114 Bool) (index!7380 (_ BitVec 32)) (x!25675 (_ BitVec 32))) (Undefined!1302) (MissingVacant!1302 (index!7381 (_ BitVec 32))) )
))
(declare-fun lt!134542 () SeekEntryResult!1302)

(assert (=> b!266840 (= res!131139 (or (= lt!134542 (MissingZero!1302 i!1355)) (= lt!134542 (MissingVacant!1302 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12913 (_ BitVec 32)) SeekEntryResult!1302)

(assert (=> b!266840 (= lt!134542 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266841 () Bool)

(declare-fun res!131134 () Bool)

(assert (=> b!266841 (=> (not res!131134) (not e!172581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12913 (_ BitVec 32)) Bool)

(assert (=> b!266841 (= res!131134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266842 () Bool)

(declare-fun res!131136 () Bool)

(assert (=> b!266842 (=> (not res!131136) (not e!172582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266842 (= res!131136 (validKeyInArray!0 k0!2698))))

(declare-fun b!266843 () Bool)

(declare-fun res!131135 () Bool)

(assert (=> b!266843 (=> (not res!131135) (not e!172582))))

(declare-fun arrayContainsKey!0 (array!12913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266843 (= res!131135 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25734 res!131138) b!266838))

(assert (= (and b!266838 res!131137) b!266842))

(assert (= (and b!266842 res!131136) b!266843))

(assert (= (and b!266843 res!131135) b!266840))

(assert (= (and b!266840 res!131139) b!266841))

(assert (= (and b!266841 res!131134) b!266839))

(assert (= (and b!266839 res!131133) b!266837))

(declare-fun m!283343 () Bool)

(assert (=> b!266839 m!283343))

(declare-fun m!283345 () Bool)

(assert (=> start!25734 m!283345))

(declare-fun m!283347 () Bool)

(assert (=> start!25734 m!283347))

(declare-fun m!283349 () Bool)

(assert (=> b!266840 m!283349))

(declare-fun m!283351 () Bool)

(assert (=> b!266842 m!283351))

(declare-fun m!283353 () Bool)

(assert (=> b!266843 m!283353))

(declare-fun m!283355 () Bool)

(assert (=> b!266841 m!283355))

(check-sat (not b!266839) (not start!25734) (not b!266842) (not b!266840) (not b!266843) (not b!266841))
(check-sat)
