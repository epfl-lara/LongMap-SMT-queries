; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25676 () Bool)

(assert start!25676)

(declare-fun b!266249 () Bool)

(declare-fun e!172326 () Bool)

(assert (=> b!266249 (= e!172326 false)))

(declare-fun lt!134420 () Bool)

(declare-datatypes ((array!12850 0))(
  ( (array!12851 (arr!6079 (Array (_ BitVec 32) (_ BitVec 64))) (size!6431 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12850)

(declare-datatypes ((List!3806 0))(
  ( (Nil!3803) (Cons!3802 (h!4469 (_ BitVec 64)) (t!8880 List!3806)) )
))
(declare-fun arrayNoDuplicates!0 (array!12850 (_ BitVec 32) List!3806) Bool)

(assert (=> b!266249 (= lt!134420 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3803))))

(declare-fun b!266250 () Bool)

(declare-fun res!130519 () Bool)

(declare-fun e!172327 () Bool)

(assert (=> b!266250 (=> (not res!130519) (not e!172327))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12850 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!266250 (= res!130519 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun res!130524 () Bool)

(assert (=> start!25676 (=> (not res!130524) (not e!172327))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25676 (= res!130524 (validMask!0 mask!4002))))

(assert (=> start!25676 e!172327))

(assert (=> start!25676 true))

(declare-fun array_inv!4029 (array!12850) Bool)

(assert (=> start!25676 (array_inv!4029 a!3436)))

(declare-fun b!266251 () Bool)

(declare-fun res!130520 () Bool)

(assert (=> b!266251 (=> (not res!130520) (not e!172327))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!266251 (= res!130520 (and (= (size!6431 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6431 a!3436))))))

(declare-fun b!266252 () Bool)

(assert (=> b!266252 (= e!172327 e!172326)))

(declare-fun res!130522 () Bool)

(assert (=> b!266252 (=> (not res!130522) (not e!172326))))

(declare-datatypes ((SeekEntryResult!1235 0))(
  ( (MissingZero!1235 (index!7110 (_ BitVec 32))) (Found!1235 (index!7111 (_ BitVec 32))) (Intermediate!1235 (undefined!2047 Bool) (index!7112 (_ BitVec 32)) (x!25528 (_ BitVec 32))) (Undefined!1235) (MissingVacant!1235 (index!7113 (_ BitVec 32))) )
))
(declare-fun lt!134421 () SeekEntryResult!1235)

(assert (=> b!266252 (= res!130522 (or (= lt!134421 (MissingZero!1235 i!1355)) (= lt!134421 (MissingVacant!1235 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12850 (_ BitVec 32)) SeekEntryResult!1235)

(assert (=> b!266252 (= lt!134421 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!266253 () Bool)

(declare-fun res!130521 () Bool)

(assert (=> b!266253 (=> (not res!130521) (not e!172327))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!266253 (= res!130521 (validKeyInArray!0 k0!2698))))

(declare-fun b!266254 () Bool)

(declare-fun res!130523 () Bool)

(assert (=> b!266254 (=> (not res!130523) (not e!172326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12850 (_ BitVec 32)) Bool)

(assert (=> b!266254 (= res!130523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(assert (= (and start!25676 res!130524) b!266251))

(assert (= (and b!266251 res!130520) b!266253))

(assert (= (and b!266253 res!130521) b!266250))

(assert (= (and b!266250 res!130519) b!266252))

(assert (= (and b!266252 res!130522) b!266254))

(assert (= (and b!266254 res!130523) b!266249))

(declare-fun m!283043 () Bool)

(assert (=> b!266252 m!283043))

(declare-fun m!283045 () Bool)

(assert (=> b!266253 m!283045))

(declare-fun m!283047 () Bool)

(assert (=> b!266250 m!283047))

(declare-fun m!283049 () Bool)

(assert (=> b!266254 m!283049))

(declare-fun m!283051 () Bool)

(assert (=> b!266249 m!283051))

(declare-fun m!283053 () Bool)

(assert (=> start!25676 m!283053))

(declare-fun m!283055 () Bool)

(assert (=> start!25676 m!283055))

(check-sat (not b!266253) (not start!25676) (not b!266250) (not b!266249) (not b!266254) (not b!266252))
(check-sat)
