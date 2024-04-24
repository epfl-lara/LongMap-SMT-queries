; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25778 () Bool)

(assert start!25778)

(declare-fun b!267252 () Bool)

(declare-fun res!131527 () Bool)

(declare-fun e!172785 () Bool)

(assert (=> b!267252 (=> (not res!131527) (not e!172785))))

(declare-datatypes ((array!12952 0))(
  ( (array!12953 (arr!6130 (Array (_ BitVec 32) (_ BitVec 64))) (size!6482 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12952)

(declare-datatypes ((List!3857 0))(
  ( (Nil!3854) (Cons!3853 (h!4520 (_ BitVec 64)) (t!8931 List!3857)) )
))
(declare-fun arrayNoDuplicates!0 (array!12952 (_ BitVec 32) List!3857) Bool)

(assert (=> b!267252 (= res!131527 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3854))))

(declare-fun b!267253 () Bool)

(declare-fun res!131529 () Bool)

(declare-fun e!172787 () Bool)

(assert (=> b!267253 (=> (not res!131529) (not e!172787))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12952 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267253 (= res!131529 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267254 () Bool)

(declare-fun res!131525 () Bool)

(assert (=> b!267254 (=> (not res!131525) (not e!172785))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12952 (_ BitVec 32)) Bool)

(assert (=> b!267254 (= res!131525 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!131522 () Bool)

(assert (=> start!25778 (=> (not res!131522) (not e!172787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25778 (= res!131522 (validMask!0 mask!4002))))

(assert (=> start!25778 e!172787))

(assert (=> start!25778 true))

(declare-fun array_inv!4080 (array!12952) Bool)

(assert (=> start!25778 (array_inv!4080 a!3436)))

(declare-fun b!267255 () Bool)

(assert (=> b!267255 (= e!172787 e!172785)))

(declare-fun res!131526 () Bool)

(assert (=> b!267255 (=> (not res!131526) (not e!172785))))

(declare-datatypes ((SeekEntryResult!1286 0))(
  ( (MissingZero!1286 (index!7314 (_ BitVec 32))) (Found!1286 (index!7315 (_ BitVec 32))) (Intermediate!1286 (undefined!2098 Bool) (index!7316 (_ BitVec 32)) (x!25715 (_ BitVec 32))) (Undefined!1286) (MissingVacant!1286 (index!7317 (_ BitVec 32))) )
))
(declare-fun lt!134718 () SeekEntryResult!1286)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267255 (= res!131526 (or (= lt!134718 (MissingZero!1286 i!1355)) (= lt!134718 (MissingVacant!1286 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12952 (_ BitVec 32)) SeekEntryResult!1286)

(assert (=> b!267255 (= lt!134718 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!267256 () Bool)

(declare-fun res!131523 () Bool)

(assert (=> b!267256 (=> (not res!131523) (not e!172787))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267256 (= res!131523 (validKeyInArray!0 k0!2698))))

(declare-fun b!267257 () Bool)

(declare-fun res!131524 () Bool)

(assert (=> b!267257 (=> (not res!131524) (not e!172787))))

(assert (=> b!267257 (= res!131524 (and (= (size!6482 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6482 a!3436))))))

(declare-fun b!267258 () Bool)

(assert (=> b!267258 (= e!172785 (not true))))

(assert (=> b!267258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12953 (store (arr!6130 a!3436) i!1355 k0!2698) (size!6482 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8273 0))(
  ( (Unit!8274) )
))
(declare-fun lt!134717 () Unit!8273)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12952 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8273)

(assert (=> b!267258 (= lt!134717 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k0!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!267259 () Bool)

(declare-fun res!131528 () Bool)

(assert (=> b!267259 (=> (not res!131528) (not e!172785))))

(assert (=> b!267259 (= res!131528 (bvslt #b00000000000000000000000000000000 (size!6482 a!3436)))))

(assert (= (and start!25778 res!131522) b!267257))

(assert (= (and b!267257 res!131524) b!267256))

(assert (= (and b!267256 res!131523) b!267253))

(assert (= (and b!267253 res!131529) b!267255))

(assert (= (and b!267255 res!131526) b!267254))

(assert (= (and b!267254 res!131525) b!267252))

(assert (= (and b!267252 res!131527) b!267259))

(assert (= (and b!267259 res!131528) b!267258))

(declare-fun m!283829 () Bool)

(assert (=> start!25778 m!283829))

(declare-fun m!283831 () Bool)

(assert (=> start!25778 m!283831))

(declare-fun m!283833 () Bool)

(assert (=> b!267253 m!283833))

(declare-fun m!283835 () Bool)

(assert (=> b!267255 m!283835))

(declare-fun m!283837 () Bool)

(assert (=> b!267252 m!283837))

(declare-fun m!283839 () Bool)

(assert (=> b!267258 m!283839))

(declare-fun m!283841 () Bool)

(assert (=> b!267258 m!283841))

(declare-fun m!283843 () Bool)

(assert (=> b!267258 m!283843))

(declare-fun m!283845 () Bool)

(assert (=> b!267254 m!283845))

(declare-fun m!283847 () Bool)

(assert (=> b!267256 m!283847))

(check-sat (not b!267253) (not b!267256) (not b!267255) (not b!267258) (not b!267254) (not start!25778) (not b!267252))
(check-sat)
