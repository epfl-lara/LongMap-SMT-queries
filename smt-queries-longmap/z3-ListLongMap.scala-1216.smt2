; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25766 () Bool)

(assert start!25766)

(declare-fun res!131412 () Bool)

(declare-fun e!172732 () Bool)

(assert (=> start!25766 (=> (not res!131412) (not e!172732))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25766 (= res!131412 (validMask!0 mask!4002))))

(assert (=> start!25766 e!172732))

(assert (=> start!25766 true))

(declare-datatypes ((array!12940 0))(
  ( (array!12941 (arr!6124 (Array (_ BitVec 32) (_ BitVec 64))) (size!6476 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12940)

(declare-fun array_inv!4074 (array!12940) Bool)

(assert (=> start!25766 (array_inv!4074 a!3436)))

(declare-fun b!267140 () Bool)

(declare-fun res!131411 () Bool)

(declare-fun e!172731 () Bool)

(assert (=> b!267140 (=> (not res!131411) (not e!172731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12940 (_ BitVec 32)) Bool)

(assert (=> b!267140 (= res!131411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!267141 () Bool)

(declare-fun res!131414 () Bool)

(assert (=> b!267141 (=> (not res!131414) (not e!172732))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!267141 (= res!131414 (validKeyInArray!0 k0!2698))))

(declare-fun b!267142 () Bool)

(assert (=> b!267142 (= e!172731 false)))

(declare-fun lt!134682 () Bool)

(declare-datatypes ((List!3851 0))(
  ( (Nil!3848) (Cons!3847 (h!4514 (_ BitVec 64)) (t!8925 List!3851)) )
))
(declare-fun arrayNoDuplicates!0 (array!12940 (_ BitVec 32) List!3851) Bool)

(assert (=> b!267142 (= lt!134682 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3848))))

(declare-fun b!267143 () Bool)

(assert (=> b!267143 (= e!172732 e!172731)))

(declare-fun res!131410 () Bool)

(assert (=> b!267143 (=> (not res!131410) (not e!172731))))

(declare-datatypes ((SeekEntryResult!1280 0))(
  ( (MissingZero!1280 (index!7290 (_ BitVec 32))) (Found!1280 (index!7291 (_ BitVec 32))) (Intermediate!1280 (undefined!2092 Bool) (index!7292 (_ BitVec 32)) (x!25693 (_ BitVec 32))) (Undefined!1280) (MissingVacant!1280 (index!7293 (_ BitVec 32))) )
))
(declare-fun lt!134681 () SeekEntryResult!1280)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!267143 (= res!131410 (or (= lt!134681 (MissingZero!1280 i!1355)) (= lt!134681 (MissingVacant!1280 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12940 (_ BitVec 32)) SeekEntryResult!1280)

(assert (=> b!267143 (= lt!134681 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!267144 () Bool)

(declare-fun res!131415 () Bool)

(assert (=> b!267144 (=> (not res!131415) (not e!172732))))

(declare-fun arrayContainsKey!0 (array!12940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!267144 (= res!131415 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!267145 () Bool)

(declare-fun res!131413 () Bool)

(assert (=> b!267145 (=> (not res!131413) (not e!172732))))

(assert (=> b!267145 (= res!131413 (and (= (size!6476 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6476 a!3436))))))

(assert (= (and start!25766 res!131412) b!267145))

(assert (= (and b!267145 res!131413) b!267141))

(assert (= (and b!267141 res!131414) b!267144))

(assert (= (and b!267144 res!131415) b!267143))

(assert (= (and b!267143 res!131410) b!267140))

(assert (= (and b!267140 res!131411) b!267142))

(declare-fun m!283745 () Bool)

(assert (=> b!267143 m!283745))

(declare-fun m!283747 () Bool)

(assert (=> start!25766 m!283747))

(declare-fun m!283749 () Bool)

(assert (=> start!25766 m!283749))

(declare-fun m!283751 () Bool)

(assert (=> b!267141 m!283751))

(declare-fun m!283753 () Bool)

(assert (=> b!267140 m!283753))

(declare-fun m!283755 () Bool)

(assert (=> b!267144 m!283755))

(declare-fun m!283757 () Bool)

(assert (=> b!267142 m!283757))

(check-sat (not b!267142) (not b!267143) (not b!267140) (not b!267141) (not b!267144) (not start!25766))
(check-sat)
