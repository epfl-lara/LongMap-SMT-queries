; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25666 () Bool)

(assert start!25666)

(declare-fun b!266148 () Bool)

(declare-fun res!130446 () Bool)

(declare-fun e!172276 () Bool)

(assert (=> b!266148 (=> (not res!130446) (not e!172276))))

(declare-datatypes ((array!12845 0))(
  ( (array!12846 (arr!6077 (Array (_ BitVec 32) (_ BitVec 64))) (size!6429 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12845)

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266148 (= res!130446 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266149 () Bool)

(declare-fun res!130449 () Bool)

(assert (=> b!266149 (=> (not res!130449) (not e!172276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266149 (= res!130449 (validKeyInArray!0 k!2698))))

(declare-fun res!130445 () Bool)

(assert (=> start!25666 (=> (not res!130445) (not e!172276))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25666 (= res!130445 (validMask!0 mask!4002))))

(assert (=> start!25666 e!172276))

(assert (=> start!25666 true))

(declare-fun array_inv!4040 (array!12845) Bool)

(assert (=> start!25666 (array_inv!4040 a!3436)))

(declare-fun b!266150 () Bool)

(declare-fun res!130444 () Bool)

(declare-fun e!172277 () Bool)

(assert (=> b!266150 (=> (not res!130444) (not e!172277))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12845 (_ BitVec 32)) Bool)

(assert (=> b!266150 (= res!130444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266151 () Bool)

(assert (=> b!266151 (= e!172277 false)))

(declare-fun lt!134344 () Bool)

(declare-datatypes ((List!3891 0))(
  ( (Nil!3888) (Cons!3887 (h!4554 (_ BitVec 64)) (t!8973 List!3891)) )
))
(declare-fun arrayNoDuplicates!0 (array!12845 (_ BitVec 32) List!3891) Bool)

(assert (=> b!266151 (= lt!134344 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3888))))

(declare-fun b!266152 () Bool)

(assert (=> b!266152 (= e!172276 e!172277)))

(declare-fun res!130448 () Bool)

(assert (=> b!266152 (=> (not res!130448) (not e!172277))))

(declare-datatypes ((SeekEntryResult!1268 0))(
  ( (MissingZero!1268 (index!7242 (_ BitVec 32))) (Found!1268 (index!7243 (_ BitVec 32))) (Intermediate!1268 (undefined!2080 Bool) (index!7244 (_ BitVec 32)) (x!25553 (_ BitVec 32))) (Undefined!1268) (MissingVacant!1268 (index!7245 (_ BitVec 32))) )
))
(declare-fun lt!134343 () SeekEntryResult!1268)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266152 (= res!130448 (or (= lt!134343 (MissingZero!1268 i!1355)) (= lt!134343 (MissingVacant!1268 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12845 (_ BitVec 32)) SeekEntryResult!1268)

(assert (=> b!266152 (= lt!134343 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!266153 () Bool)

(declare-fun res!130447 () Bool)

(assert (=> b!266153 (=> (not res!130447) (not e!172276))))

(assert (=> b!266153 (= res!130447 (and (= (size!6429 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6429 a!3436))))))

(assert (= (and start!25666 res!130445) b!266153))

(assert (= (and b!266153 res!130447) b!266149))

(assert (= (and b!266149 res!130449) b!266148))

(assert (= (and b!266148 res!130446) b!266152))

(assert (= (and b!266152 res!130448) b!266150))

(assert (= (and b!266150 res!130444) b!266151))

(declare-fun m!282795 () Bool)

(assert (=> start!25666 m!282795))

(declare-fun m!282797 () Bool)

(assert (=> start!25666 m!282797))

(declare-fun m!282799 () Bool)

(assert (=> b!266149 m!282799))

(declare-fun m!282801 () Bool)

(assert (=> b!266152 m!282801))

(declare-fun m!282803 () Bool)

(assert (=> b!266150 m!282803))

(declare-fun m!282805 () Bool)

(assert (=> b!266151 m!282805))

(declare-fun m!282807 () Bool)

(assert (=> b!266148 m!282807))

(push 1)

(assert (not b!266149))

(assert (not b!266150))

(assert (not b!266148))

(assert (not b!266151))

(assert (not start!25666))

(assert (not b!266152))

(check-sat)

(pop 1)

