; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25704 () Bool)

(assert start!25704)

(declare-fun b!266562 () Bool)

(declare-fun res!130862 () Bool)

(declare-fun e!172448 () Bool)

(assert (=> b!266562 (=> (not res!130862) (not e!172448))))

(declare-datatypes ((array!12883 0))(
  ( (array!12884 (arr!6096 (Array (_ BitVec 32) (_ BitVec 64))) (size!6448 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12883)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266562 (= res!130862 (and (= (size!6448 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6448 a!3436))))))

(declare-fun res!130863 () Bool)

(assert (=> start!25704 (=> (not res!130863) (not e!172448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25704 (= res!130863 (validMask!0 mask!4002))))

(assert (=> start!25704 e!172448))

(assert (=> start!25704 true))

(declare-fun array_inv!4059 (array!12883) Bool)

(assert (=> start!25704 (array_inv!4059 a!3436)))

(declare-fun b!266563 () Bool)

(declare-fun e!172447 () Bool)

(assert (=> b!266563 (= e!172448 e!172447)))

(declare-fun res!130861 () Bool)

(assert (=> b!266563 (=> (not res!130861) (not e!172447))))

(declare-datatypes ((SeekEntryResult!1287 0))(
  ( (MissingZero!1287 (index!7318 (_ BitVec 32))) (Found!1287 (index!7319 (_ BitVec 32))) (Intermediate!1287 (undefined!2099 Bool) (index!7320 (_ BitVec 32)) (x!25620 (_ BitVec 32))) (Undefined!1287) (MissingVacant!1287 (index!7321 (_ BitVec 32))) )
))
(declare-fun lt!134458 () SeekEntryResult!1287)

(assert (=> b!266563 (= res!130861 (or (= lt!134458 (MissingZero!1287 i!1355)) (= lt!134458 (MissingVacant!1287 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12883 (_ BitVec 32)) SeekEntryResult!1287)

(assert (=> b!266563 (= lt!134458 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266564 () Bool)

(declare-fun res!130859 () Bool)

(assert (=> b!266564 (=> (not res!130859) (not e!172448))))

(declare-fun arrayContainsKey!0 (array!12883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266564 (= res!130859 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!266565 () Bool)

(assert (=> b!266565 (= e!172447 false)))

(declare-fun lt!134457 () Bool)

(declare-datatypes ((List!3910 0))(
  ( (Nil!3907) (Cons!3906 (h!4573 (_ BitVec 64)) (t!8992 List!3910)) )
))
(declare-fun arrayNoDuplicates!0 (array!12883 (_ BitVec 32) List!3910) Bool)

(assert (=> b!266565 (= lt!134457 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3907))))

(declare-fun b!266566 () Bool)

(declare-fun res!130858 () Bool)

(assert (=> b!266566 (=> (not res!130858) (not e!172448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266566 (= res!130858 (validKeyInArray!0 k0!2698))))

(declare-fun b!266567 () Bool)

(declare-fun res!130860 () Bool)

(assert (=> b!266567 (=> (not res!130860) (not e!172447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12883 (_ BitVec 32)) Bool)

(assert (=> b!266567 (= res!130860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25704 res!130863) b!266562))

(assert (= (and b!266562 res!130862) b!266566))

(assert (= (and b!266566 res!130858) b!266564))

(assert (= (and b!266564 res!130859) b!266563))

(assert (= (and b!266563 res!130861) b!266567))

(assert (= (and b!266567 res!130860) b!266565))

(declare-fun m!283133 () Bool)

(assert (=> b!266566 m!283133))

(declare-fun m!283135 () Bool)

(assert (=> b!266564 m!283135))

(declare-fun m!283137 () Bool)

(assert (=> b!266563 m!283137))

(declare-fun m!283139 () Bool)

(assert (=> b!266567 m!283139))

(declare-fun m!283141 () Bool)

(assert (=> b!266565 m!283141))

(declare-fun m!283143 () Bool)

(assert (=> start!25704 m!283143))

(declare-fun m!283145 () Bool)

(assert (=> start!25704 m!283145))

(check-sat (not b!266566) (not b!266567) (not b!266564) (not b!266565) (not start!25704) (not b!266563))
(check-sat)
