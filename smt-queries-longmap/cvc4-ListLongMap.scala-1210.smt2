; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25730 () Bool)

(assert start!25730)

(declare-fun b!266796 () Bool)

(declare-fun res!131093 () Bool)

(declare-fun e!172565 () Bool)

(assert (=> b!266796 (=> (not res!131093) (not e!172565))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266796 (= res!131093 (validKeyInArray!0 k!2698))))

(declare-fun b!266797 () Bool)

(declare-fun res!131096 () Bool)

(assert (=> b!266797 (=> (not res!131096) (not e!172565))))

(declare-datatypes ((array!12909 0))(
  ( (array!12910 (arr!6109 (Array (_ BitVec 32) (_ BitVec 64))) (size!6461 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12909)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266797 (= res!131096 (and (= (size!6461 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6461 a!3436))))))

(declare-fun b!266798 () Bool)

(declare-fun res!131095 () Bool)

(declare-fun e!172564 () Bool)

(assert (=> b!266798 (=> (not res!131095) (not e!172564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12909 (_ BitVec 32)) Bool)

(assert (=> b!266798 (= res!131095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266799 () Bool)

(assert (=> b!266799 (= e!172564 false)))

(declare-fun lt!134536 () Bool)

(declare-datatypes ((List!3923 0))(
  ( (Nil!3920) (Cons!3919 (h!4586 (_ BitVec 64)) (t!9005 List!3923)) )
))
(declare-fun arrayNoDuplicates!0 (array!12909 (_ BitVec 32) List!3923) Bool)

(assert (=> b!266799 (= lt!134536 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3920))))

(declare-fun res!131097 () Bool)

(assert (=> start!25730 (=> (not res!131097) (not e!172565))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25730 (= res!131097 (validMask!0 mask!4002))))

(assert (=> start!25730 e!172565))

(assert (=> start!25730 true))

(declare-fun array_inv!4072 (array!12909) Bool)

(assert (=> start!25730 (array_inv!4072 a!3436)))

(declare-fun b!266800 () Bool)

(assert (=> b!266800 (= e!172565 e!172564)))

(declare-fun res!131094 () Bool)

(assert (=> b!266800 (=> (not res!131094) (not e!172564))))

(declare-datatypes ((SeekEntryResult!1300 0))(
  ( (MissingZero!1300 (index!7370 (_ BitVec 32))) (Found!1300 (index!7371 (_ BitVec 32))) (Intermediate!1300 (undefined!2112 Bool) (index!7372 (_ BitVec 32)) (x!25665 (_ BitVec 32))) (Undefined!1300) (MissingVacant!1300 (index!7373 (_ BitVec 32))) )
))
(declare-fun lt!134535 () SeekEntryResult!1300)

(assert (=> b!266800 (= res!131094 (or (= lt!134535 (MissingZero!1300 i!1355)) (= lt!134535 (MissingVacant!1300 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12909 (_ BitVec 32)) SeekEntryResult!1300)

(assert (=> b!266800 (= lt!134535 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266801 () Bool)

(declare-fun res!131092 () Bool)

(assert (=> b!266801 (=> (not res!131092) (not e!172565))))

(declare-fun arrayContainsKey!0 (array!12909 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266801 (= res!131092 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(assert (= (and start!25730 res!131097) b!266797))

(assert (= (and b!266797 res!131096) b!266796))

(assert (= (and b!266796 res!131093) b!266801))

(assert (= (and b!266801 res!131092) b!266800))

(assert (= (and b!266800 res!131094) b!266798))

(assert (= (and b!266798 res!131095) b!266799))

(declare-fun m!283315 () Bool)

(assert (=> b!266798 m!283315))

(declare-fun m!283317 () Bool)

(assert (=> b!266799 m!283317))

(declare-fun m!283319 () Bool)

(assert (=> start!25730 m!283319))

(declare-fun m!283321 () Bool)

(assert (=> start!25730 m!283321))

(declare-fun m!283323 () Bool)

(assert (=> b!266796 m!283323))

(declare-fun m!283325 () Bool)

(assert (=> b!266801 m!283325))

(declare-fun m!283327 () Bool)

(assert (=> b!266800 m!283327))

(push 1)

(assert (not b!266798))

(assert (not b!266800))

(assert (not start!25730))

(assert (not b!266801))

