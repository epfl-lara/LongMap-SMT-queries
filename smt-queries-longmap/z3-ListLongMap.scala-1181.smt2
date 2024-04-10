; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25428 () Bool)

(assert start!25428)

(declare-fun b!264800 () Bool)

(declare-fun res!129312 () Bool)

(declare-fun e!171527 () Bool)

(assert (=> b!264800 (=> (not res!129312) (not e!171527))))

(declare-datatypes ((array!12724 0))(
  ( (array!12725 (arr!6021 (Array (_ BitVec 32) (_ BitVec 64))) (size!6373 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12724)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!264800 (= res!129312 (and (= (size!6373 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6373 a!3436))))))

(declare-fun res!129313 () Bool)

(assert (=> start!25428 (=> (not res!129313) (not e!171527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25428 (= res!129313 (validMask!0 mask!4002))))

(assert (=> start!25428 e!171527))

(assert (=> start!25428 true))

(declare-fun array_inv!3984 (array!12724) Bool)

(assert (=> start!25428 (array_inv!3984 a!3436)))

(declare-fun b!264803 () Bool)

(assert (=> b!264803 (= e!171527 false)))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!1212 0))(
  ( (MissingZero!1212 (index!7018 (_ BitVec 32))) (Found!1212 (index!7019 (_ BitVec 32))) (Intermediate!1212 (undefined!2024 Bool) (index!7020 (_ BitVec 32)) (x!25345 (_ BitVec 32))) (Undefined!1212) (MissingVacant!1212 (index!7021 (_ BitVec 32))) )
))
(declare-fun lt!133909 () SeekEntryResult!1212)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12724 (_ BitVec 32)) SeekEntryResult!1212)

(assert (=> b!264803 (= lt!133909 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!264802 () Bool)

(declare-fun res!129315 () Bool)

(assert (=> b!264802 (=> (not res!129315) (not e!171527))))

(declare-fun arrayContainsKey!0 (array!12724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!264802 (= res!129315 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!264801 () Bool)

(declare-fun res!129314 () Bool)

(assert (=> b!264801 (=> (not res!129314) (not e!171527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!264801 (= res!129314 (validKeyInArray!0 k0!2698))))

(assert (= (and start!25428 res!129313) b!264800))

(assert (= (and b!264800 res!129312) b!264801))

(assert (= (and b!264801 res!129314) b!264802))

(assert (= (and b!264802 res!129315) b!264803))

(declare-fun m!281785 () Bool)

(assert (=> start!25428 m!281785))

(declare-fun m!281787 () Bool)

(assert (=> start!25428 m!281787))

(declare-fun m!281789 () Bool)

(assert (=> b!264803 m!281789))

(declare-fun m!281791 () Bool)

(assert (=> b!264802 m!281791))

(declare-fun m!281793 () Bool)

(assert (=> b!264801 m!281793))

(check-sat (not b!264803) (not b!264802) (not start!25428) (not b!264801))
