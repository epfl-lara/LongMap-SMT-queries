; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25760 () Bool)

(assert start!25760)

(declare-fun b!267086 () Bool)

(declare-fun res!131358 () Bool)

(declare-fun e!172706 () Bool)

(assert (=> b!267086 (=> (not res!131358) (not e!172706))))

(declare-datatypes ((array!12934 0))(
  ( (array!12935 (arr!6121 (Array (_ BitVec 32) (_ BitVec 64))) (size!6473 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12934)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267086 (= res!131358 (and (= (size!6473 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6473 a!3436))))))

(declare-fun b!267087 () Bool)

(declare-fun res!131356 () Bool)

(assert (=> b!267087 (=> (not res!131356) (not e!172706))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12934 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267087 (= res!131356 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267088 () Bool)

(declare-fun res!131361 () Bool)

(assert (=> b!267088 (=> (not res!131361) (not e!172706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267088 (= res!131361 (validKeyInArray!0 k0!2698))))

(declare-fun b!267089 () Bool)

(declare-fun e!172705 () Bool)

(assert (=> b!267089 (= e!172706 e!172705)))

(declare-fun res!131357 () Bool)

(assert (=> b!267089 (=> (not res!131357) (not e!172705))))

(declare-datatypes ((SeekEntryResult!1277 0))(
  ( (MissingZero!1277 (index!7278 (_ BitVec 32))) (Found!1277 (index!7279 (_ BitVec 32))) (Intermediate!1277 (undefined!2089 Bool) (index!7280 (_ BitVec 32)) (x!25682 (_ BitVec 32))) (Undefined!1277) (MissingVacant!1277 (index!7281 (_ BitVec 32))) )
))
(declare-fun lt!134664 () SeekEntryResult!1277)

(assert (=> b!267089 (= res!131357 (or (= lt!134664 (MissingZero!1277 i!1355)) (= lt!134664 (MissingVacant!1277 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12934 (_ BitVec 32)) SeekEntryResult!1277)

(assert (=> b!267089 (= lt!134664 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun res!131360 () Bool)

(assert (=> start!25760 (=> (not res!131360) (not e!172706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25760 (= res!131360 (validMask!0 mask!4002))))

(assert (=> start!25760 e!172706))

(assert (=> start!25760 true))

(declare-fun array_inv!4071 (array!12934) Bool)

(assert (=> start!25760 (array_inv!4071 a!3436)))

(declare-fun b!267090 () Bool)

(declare-fun res!131359 () Bool)

(assert (=> b!267090 (=> (not res!131359) (not e!172705))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12934 (_ BitVec 32)) Bool)

(assert (=> b!267090 (= res!131359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!267091 () Bool)

(assert (=> b!267091 (= e!172705 false)))

(declare-fun lt!134663 () Bool)

(declare-datatypes ((List!3848 0))(
  ( (Nil!3845) (Cons!3844 (h!4511 (_ BitVec 64)) (t!8922 List!3848)) )
))
(declare-fun arrayNoDuplicates!0 (array!12934 (_ BitVec 32) List!3848) Bool)

(assert (=> b!267091 (= lt!134663 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3845))))

(assert (= (and start!25760 res!131360) b!267086))

(assert (= (and b!267086 res!131358) b!267088))

(assert (= (and b!267088 res!131361) b!267087))

(assert (= (and b!267087 res!131356) b!267089))

(assert (= (and b!267089 res!131357) b!267090))

(assert (= (and b!267090 res!131359) b!267091))

(declare-fun m!283703 () Bool)

(assert (=> start!25760 m!283703))

(declare-fun m!283705 () Bool)

(assert (=> start!25760 m!283705))

(declare-fun m!283707 () Bool)

(assert (=> b!267088 m!283707))

(declare-fun m!283709 () Bool)

(assert (=> b!267089 m!283709))

(declare-fun m!283711 () Bool)

(assert (=> b!267087 m!283711))

(declare-fun m!283713 () Bool)

(assert (=> b!267091 m!283713))

(declare-fun m!283715 () Bool)

(assert (=> b!267090 m!283715))

(check-sat (not b!267089) (not start!25760) (not b!267091) (not b!267090) (not b!267088) (not b!267087))
(check-sat)
