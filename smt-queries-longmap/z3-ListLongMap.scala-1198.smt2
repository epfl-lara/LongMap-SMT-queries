; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25656 () Bool)

(assert start!25656)

(declare-fun b!266058 () Bool)

(declare-fun res!130355 () Bool)

(declare-fun e!172230 () Bool)

(assert (=> b!266058 (=> (not res!130355) (not e!172230))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266058 (= res!130355 (validKeyInArray!0 k0!2698))))

(declare-fun b!266059 () Bool)

(declare-fun res!130357 () Bool)

(assert (=> b!266059 (=> (not res!130357) (not e!172230))))

(declare-datatypes ((array!12835 0))(
  ( (array!12836 (arr!6072 (Array (_ BitVec 32) (_ BitVec 64))) (size!6424 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12835)

(declare-fun arrayContainsKey!0 (array!12835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266059 (= res!130357 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266060 () Bool)

(declare-fun e!172231 () Bool)

(assert (=> b!266060 (= e!172230 e!172231)))

(declare-fun res!130354 () Bool)

(assert (=> b!266060 (=> (not res!130354) (not e!172231))))

(declare-datatypes ((SeekEntryResult!1263 0))(
  ( (MissingZero!1263 (index!7222 (_ BitVec 32))) (Found!1263 (index!7223 (_ BitVec 32))) (Intermediate!1263 (undefined!2075 Bool) (index!7224 (_ BitVec 32)) (x!25532 (_ BitVec 32))) (Undefined!1263) (MissingVacant!1263 (index!7225 (_ BitVec 32))) )
))
(declare-fun lt!134314 () SeekEntryResult!1263)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266060 (= res!130354 (or (= lt!134314 (MissingZero!1263 i!1355)) (= lt!134314 (MissingVacant!1263 i!1355))))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12835 (_ BitVec 32)) SeekEntryResult!1263)

(assert (=> b!266060 (= lt!134314 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266061 () Bool)

(declare-fun res!130359 () Bool)

(assert (=> b!266061 (=> (not res!130359) (not e!172231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12835 (_ BitVec 32)) Bool)

(assert (=> b!266061 (= res!130359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!266062 () Bool)

(declare-fun res!130356 () Bool)

(assert (=> b!266062 (=> (not res!130356) (not e!172230))))

(assert (=> b!266062 (= res!130356 (and (= (size!6424 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6424 a!3436))))))

(declare-fun b!266063 () Bool)

(assert (=> b!266063 (= e!172231 false)))

(declare-fun lt!134313 () Bool)

(declare-datatypes ((List!3886 0))(
  ( (Nil!3883) (Cons!3882 (h!4549 (_ BitVec 64)) (t!8968 List!3886)) )
))
(declare-fun arrayNoDuplicates!0 (array!12835 (_ BitVec 32) List!3886) Bool)

(assert (=> b!266063 (= lt!134313 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3883))))

(declare-fun res!130358 () Bool)

(assert (=> start!25656 (=> (not res!130358) (not e!172230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25656 (= res!130358 (validMask!0 mask!4002))))

(assert (=> start!25656 e!172230))

(assert (=> start!25656 true))

(declare-fun array_inv!4035 (array!12835) Bool)

(assert (=> start!25656 (array_inv!4035 a!3436)))

(assert (= (and start!25656 res!130358) b!266062))

(assert (= (and b!266062 res!130356) b!266058))

(assert (= (and b!266058 res!130355) b!266059))

(assert (= (and b!266059 res!130357) b!266060))

(assert (= (and b!266060 res!130354) b!266061))

(assert (= (and b!266061 res!130359) b!266063))

(declare-fun m!282725 () Bool)

(assert (=> b!266058 m!282725))

(declare-fun m!282727 () Bool)

(assert (=> b!266063 m!282727))

(declare-fun m!282729 () Bool)

(assert (=> b!266059 m!282729))

(declare-fun m!282731 () Bool)

(assert (=> b!266061 m!282731))

(declare-fun m!282733 () Bool)

(assert (=> start!25656 m!282733))

(declare-fun m!282735 () Bool)

(assert (=> start!25656 m!282735))

(declare-fun m!282737 () Bool)

(assert (=> b!266060 m!282737))

(check-sat (not start!25656) (not b!266058) (not b!266059) (not b!266060) (not b!266061) (not b!266063))
