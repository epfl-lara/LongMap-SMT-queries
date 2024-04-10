; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25696 () Bool)

(assert start!25696)

(declare-fun b!266476 () Bool)

(declare-fun res!130779 () Bool)

(declare-fun e!172410 () Bool)

(assert (=> b!266476 (=> (not res!130779) (not e!172410))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266476 (= res!130779 (validKeyInArray!0 k!2698))))

(declare-fun b!266477 () Bool)

(declare-fun e!172412 () Bool)

(assert (=> b!266477 (= e!172410 e!172412)))

(declare-fun res!130773 () Bool)

(assert (=> b!266477 (=> (not res!130773) (not e!172412))))

(declare-datatypes ((SeekEntryResult!1283 0))(
  ( (MissingZero!1283 (index!7302 (_ BitVec 32))) (Found!1283 (index!7303 (_ BitVec 32))) (Intermediate!1283 (undefined!2095 Bool) (index!7304 (_ BitVec 32)) (x!25608 (_ BitVec 32))) (Undefined!1283) (MissingVacant!1283 (index!7305 (_ BitVec 32))) )
))
(declare-fun lt!134433 () SeekEntryResult!1283)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266477 (= res!130773 (or (= lt!134433 (MissingZero!1283 i!1355)) (= lt!134433 (MissingVacant!1283 i!1355))))))

(declare-datatypes ((array!12875 0))(
  ( (array!12876 (arr!6092 (Array (_ BitVec 32) (_ BitVec 64))) (size!6444 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12875)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12875 (_ BitVec 32)) SeekEntryResult!1283)

(assert (=> b!266477 (= lt!134433 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun res!130775 () Bool)

(assert (=> start!25696 (=> (not res!130775) (not e!172410))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25696 (= res!130775 (validMask!0 mask!4002))))

(assert (=> start!25696 e!172410))

(assert (=> start!25696 true))

(declare-fun array_inv!4055 (array!12875) Bool)

(assert (=> start!25696 (array_inv!4055 a!3436)))

(declare-fun b!266478 () Bool)

(declare-fun res!130777 () Bool)

(assert (=> b!266478 (=> (not res!130777) (not e!172410))))

(declare-fun arrayContainsKey!0 (array!12875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266478 (= res!130777 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266479 () Bool)

(assert (=> b!266479 (= e!172412 (not (bvsle #b00000000000000000000000000000000 (size!6444 a!3436))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12875 (_ BitVec 32)) Bool)

(assert (=> b!266479 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!12876 (store (arr!6092 a!3436) i!1355 k!2698) (size!6444 a!3436)) mask!4002)))

(declare-datatypes ((Unit!8287 0))(
  ( (Unit!8288) )
))
(declare-fun lt!134434 () Unit!8287)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!12875 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!8287)

(assert (=> b!266479 (= lt!134434 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3436 i!1355 k!2698 #b00000000000000000000000000000000 mask!4002))))

(declare-fun b!266480 () Bool)

(declare-fun res!130774 () Bool)

(assert (=> b!266480 (=> (not res!130774) (not e!172412))))

(assert (=> b!266480 (= res!130774 (bvslt #b00000000000000000000000000000000 (size!6444 a!3436)))))

(declare-fun b!266481 () Bool)

(declare-fun res!130776 () Bool)

(assert (=> b!266481 (=> (not res!130776) (not e!172410))))

(assert (=> b!266481 (= res!130776 (and (= (size!6444 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6444 a!3436))))))

(declare-fun b!266482 () Bool)

(declare-fun res!130778 () Bool)

(assert (=> b!266482 (=> (not res!130778) (not e!172412))))

(declare-datatypes ((List!3906 0))(
  ( (Nil!3903) (Cons!3902 (h!4569 (_ BitVec 64)) (t!8988 List!3906)) )
))
(declare-fun arrayNoDuplicates!0 (array!12875 (_ BitVec 32) List!3906) Bool)

(assert (=> b!266482 (= res!130778 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3903))))

(declare-fun b!266483 () Bool)

(declare-fun res!130772 () Bool)

(assert (=> b!266483 (=> (not res!130772) (not e!172412))))

(assert (=> b!266483 (= res!130772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25696 res!130775) b!266481))

(assert (= (and b!266481 res!130776) b!266476))

(assert (= (and b!266476 res!130779) b!266478))

(assert (= (and b!266478 res!130777) b!266477))

(assert (= (and b!266477 res!130773) b!266483))

(assert (= (and b!266483 res!130772) b!266482))

(assert (= (and b!266482 res!130778) b!266480))

(assert (= (and b!266480 res!130774) b!266479))

(declare-fun m!283059 () Bool)

(assert (=> b!266479 m!283059))

(declare-fun m!283061 () Bool)

(assert (=> b!266479 m!283061))

(declare-fun m!283063 () Bool)

(assert (=> b!266479 m!283063))

(declare-fun m!283065 () Bool)

(assert (=> start!25696 m!283065))

(declare-fun m!283067 () Bool)

(assert (=> start!25696 m!283067))

(declare-fun m!283069 () Bool)

(assert (=> b!266483 m!283069))

(declare-fun m!283071 () Bool)

(assert (=> b!266478 m!283071))

(declare-fun m!283073 () Bool)

(assert (=> b!266482 m!283073))

(declare-fun m!283075 () Bool)

(assert (=> b!266476 m!283075))

(declare-fun m!283077 () Bool)

(assert (=> b!266477 m!283077))

(push 1)

(assert (not b!266476))

(assert (not b!266483))

(assert (not b!266477))

(assert (not b!266479))

(assert (not b!266482))

(assert (not b!266478))

(assert (not start!25696))

(check-sat)

(pop 1)

(push 1)

(check-sat)

