; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29168 () Bool)

(assert start!29168)

(declare-fun res!155826 () Bool)

(declare-fun e!187009 () Bool)

(assert (=> start!29168 (=> (not res!155826) (not e!187009))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29168 (= res!155826 (validMask!0 mask!3809))))

(assert (=> start!29168 e!187009))

(assert (=> start!29168 true))

(declare-datatypes ((array!14974 0))(
  ( (array!14975 (arr!7098 (Array (_ BitVec 32) (_ BitVec 64))) (size!7451 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14974)

(declare-fun array_inv!5070 (array!14974) Bool)

(assert (=> start!29168 (array_inv!5070 a!3312)))

(declare-fun b!295887 () Bool)

(declare-fun e!187010 () Bool)

(assert (=> b!295887 (= e!187009 e!187010)))

(declare-fun res!155823 () Bool)

(assert (=> b!295887 (=> (not res!155823) (not e!187010))))

(declare-fun lt!146766 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2246 0))(
  ( (MissingZero!2246 (index!11154 (_ BitVec 32))) (Found!2246 (index!11155 (_ BitVec 32))) (Intermediate!2246 (undefined!3058 Bool) (index!11156 (_ BitVec 32)) (x!29382 (_ BitVec 32))) (Undefined!2246) (MissingVacant!2246 (index!11157 (_ BitVec 32))) )
))
(declare-fun lt!146767 () SeekEntryResult!2246)

(assert (=> b!295887 (= res!155823 (or lt!146766 (= lt!146767 (MissingVacant!2246 i!1256))))))

(assert (=> b!295887 (= lt!146766 (= lt!146767 (MissingZero!2246 i!1256)))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14974 (_ BitVec 32)) SeekEntryResult!2246)

(assert (=> b!295887 (= lt!146767 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295888 () Bool)

(declare-fun e!187008 () Bool)

(declare-fun e!187012 () Bool)

(assert (=> b!295888 (= e!187008 e!187012)))

(declare-fun res!155824 () Bool)

(assert (=> b!295888 (=> (not res!155824) (not e!187012))))

(declare-fun lt!146764 () Bool)

(declare-fun lt!146769 () SeekEntryResult!2246)

(assert (=> b!295888 (= res!155824 (and (or lt!146764 (not (undefined!3058 lt!146769))) (or lt!146764 (not (= (select (arr!7098 a!3312) (index!11156 lt!146769)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146764 (not (= (select (arr!7098 a!3312) (index!11156 lt!146769)) k0!2524))) (not lt!146764)))))

(get-info :version)

(assert (=> b!295888 (= lt!146764 (not ((_ is Intermediate!2246) lt!146769)))))

(declare-fun b!295889 () Bool)

(assert (=> b!295889 (= e!187010 e!187008)))

(declare-fun res!155825 () Bool)

(assert (=> b!295889 (=> (not res!155825) (not e!187008))))

(assert (=> b!295889 (= res!155825 lt!146766)))

(declare-fun lt!146765 () (_ BitVec 32))

(declare-fun lt!146768 () SeekEntryResult!2246)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14974 (_ BitVec 32)) SeekEntryResult!2246)

(assert (=> b!295889 (= lt!146768 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146765 k0!2524 (array!14975 (store (arr!7098 a!3312) i!1256 k0!2524) (size!7451 a!3312)) mask!3809))))

(assert (=> b!295889 (= lt!146769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146765 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295889 (= lt!146765 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295890 () Bool)

(declare-fun res!155830 () Bool)

(assert (=> b!295890 (=> (not res!155830) (not e!187009))))

(assert (=> b!295890 (= res!155830 (and (= (size!7451 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7451 a!3312))))))

(declare-fun b!295891 () Bool)

(declare-fun res!155827 () Bool)

(assert (=> b!295891 (=> (not res!155827) (not e!187009))))

(declare-fun arrayContainsKey!0 (array!14974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295891 (= res!155827 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295892 () Bool)

(assert (=> b!295892 (= e!187012 (not true))))

(assert (=> b!295892 (and (= (select (arr!7098 a!3312) (index!11156 lt!146769)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11156 lt!146769) i!1256))))

(declare-fun b!295893 () Bool)

(declare-fun res!155828 () Bool)

(assert (=> b!295893 (=> (not res!155828) (not e!187009))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295893 (= res!155828 (validKeyInArray!0 k0!2524))))

(declare-fun b!295894 () Bool)

(declare-fun res!155829 () Bool)

(assert (=> b!295894 (=> (not res!155829) (not e!187010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14974 (_ BitVec 32)) Bool)

(assert (=> b!295894 (= res!155829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!29168 res!155826) b!295890))

(assert (= (and b!295890 res!155830) b!295893))

(assert (= (and b!295893 res!155828) b!295891))

(assert (= (and b!295891 res!155827) b!295887))

(assert (= (and b!295887 res!155823) b!295894))

(assert (= (and b!295894 res!155829) b!295889))

(assert (= (and b!295889 res!155825) b!295888))

(assert (= (and b!295888 res!155824) b!295892))

(declare-fun m!308487 () Bool)

(assert (=> b!295893 m!308487))

(declare-fun m!308489 () Bool)

(assert (=> b!295887 m!308489))

(declare-fun m!308491 () Bool)

(assert (=> b!295894 m!308491))

(declare-fun m!308493 () Bool)

(assert (=> start!29168 m!308493))

(declare-fun m!308495 () Bool)

(assert (=> start!29168 m!308495))

(declare-fun m!308497 () Bool)

(assert (=> b!295889 m!308497))

(declare-fun m!308499 () Bool)

(assert (=> b!295889 m!308499))

(declare-fun m!308501 () Bool)

(assert (=> b!295889 m!308501))

(declare-fun m!308503 () Bool)

(assert (=> b!295889 m!308503))

(declare-fun m!308505 () Bool)

(assert (=> b!295892 m!308505))

(assert (=> b!295888 m!308505))

(declare-fun m!308507 () Bool)

(assert (=> b!295891 m!308507))

(check-sat (not b!295889) (not b!295891) (not b!295894) (not start!29168) (not b!295887) (not b!295893))
(check-sat)
