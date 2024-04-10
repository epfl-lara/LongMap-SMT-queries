; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29308 () Bool)

(assert start!29308)

(declare-fun b!296926 () Bool)

(declare-fun res!156457 () Bool)

(declare-fun e!187660 () Bool)

(assert (=> b!296926 (=> (not res!156457) (not e!187660))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!296926 (= res!156457 (validKeyInArray!0 k!2524))))

(declare-fun b!296927 () Bool)

(declare-fun e!187656 () Bool)

(declare-fun e!187658 () Bool)

(assert (=> b!296927 (= e!187656 e!187658)))

(declare-fun res!156455 () Bool)

(assert (=> b!296927 (=> (not res!156455) (not e!187658))))

(declare-fun lt!147452 () Bool)

(assert (=> b!296927 (= res!156455 lt!147452)))

(declare-datatypes ((SeekEntryResult!2267 0))(
  ( (MissingZero!2267 (index!11238 (_ BitVec 32))) (Found!2267 (index!11239 (_ BitVec 32))) (Intermediate!2267 (undefined!3079 Bool) (index!11240 (_ BitVec 32)) (x!29459 (_ BitVec 32))) (Undefined!2267) (MissingVacant!2267 (index!11241 (_ BitVec 32))) )
))
(declare-fun lt!147448 () SeekEntryResult!2267)

(declare-datatypes ((array!15021 0))(
  ( (array!15022 (arr!7118 (Array (_ BitVec 32) (_ BitVec 64))) (size!7470 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15021)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lt!147453 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15021 (_ BitVec 32)) SeekEntryResult!2267)

(assert (=> b!296927 (= lt!147448 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147453 k!2524 (array!15022 (store (arr!7118 a!3312) i!1256 k!2524) (size!7470 a!3312)) mask!3809))))

(declare-fun lt!147449 () SeekEntryResult!2267)

(assert (=> b!296927 (= lt!147449 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147453 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!296927 (= lt!147453 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!296928 () Bool)

(declare-fun e!187657 () Bool)

(assert (=> b!296928 (= e!187657 (not true))))

(assert (=> b!296928 (and (= (select (arr!7118 a!3312) (index!11240 lt!147449)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11240 lt!147449) i!1256))))

(declare-fun b!296929 () Bool)

(declare-fun res!156458 () Bool)

(assert (=> b!296929 (=> (not res!156458) (not e!187656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15021 (_ BitVec 32)) Bool)

(assert (=> b!296929 (= res!156458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!296930 () Bool)

(assert (=> b!296930 (= e!187660 e!187656)))

(declare-fun res!156456 () Bool)

(assert (=> b!296930 (=> (not res!156456) (not e!187656))))

(declare-fun lt!147451 () SeekEntryResult!2267)

(assert (=> b!296930 (= res!156456 (or lt!147452 (= lt!147451 (MissingVacant!2267 i!1256))))))

(assert (=> b!296930 (= lt!147452 (= lt!147451 (MissingZero!2267 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15021 (_ BitVec 32)) SeekEntryResult!2267)

(assert (=> b!296930 (= lt!147451 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!296931 () Bool)

(declare-fun res!156453 () Bool)

(assert (=> b!296931 (=> (not res!156453) (not e!187660))))

(declare-fun arrayContainsKey!0 (array!15021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!296931 (= res!156453 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!156454 () Bool)

(assert (=> start!29308 (=> (not res!156454) (not e!187660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29308 (= res!156454 (validMask!0 mask!3809))))

(assert (=> start!29308 e!187660))

(assert (=> start!29308 true))

(declare-fun array_inv!5081 (array!15021) Bool)

(assert (=> start!29308 (array_inv!5081 a!3312)))

(declare-fun b!296932 () Bool)

(declare-fun res!156452 () Bool)

(assert (=> b!296932 (=> (not res!156452) (not e!187660))))

(assert (=> b!296932 (= res!156452 (and (= (size!7470 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7470 a!3312))))))

(declare-fun b!296933 () Bool)

(assert (=> b!296933 (= e!187658 e!187657)))

(declare-fun res!156459 () Bool)

(assert (=> b!296933 (=> (not res!156459) (not e!187657))))

(declare-fun lt!147450 () Bool)

(assert (=> b!296933 (= res!156459 (and (or lt!147450 (not (undefined!3079 lt!147449))) (or lt!147450 (not (= (select (arr!7118 a!3312) (index!11240 lt!147449)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147450 (not (= (select (arr!7118 a!3312) (index!11240 lt!147449)) k!2524))) (not lt!147450)))))

(assert (=> b!296933 (= lt!147450 (not (is-Intermediate!2267 lt!147449)))))

(assert (= (and start!29308 res!156454) b!296932))

(assert (= (and b!296932 res!156452) b!296926))

(assert (= (and b!296926 res!156457) b!296931))

(assert (= (and b!296931 res!156453) b!296930))

(assert (= (and b!296930 res!156456) b!296929))

(assert (= (and b!296929 res!156458) b!296927))

(assert (= (and b!296927 res!156455) b!296933))

(assert (= (and b!296933 res!156459) b!296928))

(declare-fun m!309753 () Bool)

(assert (=> start!29308 m!309753))

(declare-fun m!309755 () Bool)

(assert (=> start!29308 m!309755))

(declare-fun m!309757 () Bool)

(assert (=> b!296926 m!309757))

(declare-fun m!309759 () Bool)

(assert (=> b!296929 m!309759))

(declare-fun m!309761 () Bool)

(assert (=> b!296928 m!309761))

(declare-fun m!309763 () Bool)

(assert (=> b!296930 m!309763))

(assert (=> b!296933 m!309761))

(declare-fun m!309765 () Bool)

(assert (=> b!296931 m!309765))

(declare-fun m!309767 () Bool)

(assert (=> b!296927 m!309767))

(declare-fun m!309769 () Bool)

(assert (=> b!296927 m!309769))

(declare-fun m!309771 () Bool)

(assert (=> b!296927 m!309771))

(declare-fun m!309773 () Bool)

(assert (=> b!296927 m!309773))

(push 1)

