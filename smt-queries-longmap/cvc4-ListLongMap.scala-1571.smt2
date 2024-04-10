; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29966 () Bool)

(assert start!29966)

(declare-fun b!300988 () Bool)

(declare-fun e!190020 () Bool)

(assert (=> b!300988 (= e!190020 false)))

(declare-datatypes ((SeekEntryResult!2341 0))(
  ( (MissingZero!2341 (index!11540 (_ BitVec 32))) (Found!2341 (index!11541 (_ BitVec 32))) (Intermediate!2341 (undefined!3153 Bool) (index!11542 (_ BitVec 32)) (x!29797 (_ BitVec 32))) (Undefined!2341) (MissingVacant!2341 (index!11543 (_ BitVec 32))) )
))
(declare-fun lt!149761 () SeekEntryResult!2341)

(declare-fun lt!149760 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!15199 0))(
  ( (array!15200 (arr!7192 (Array (_ BitVec 32) (_ BitVec 64))) (size!7544 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15199)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15199 (_ BitVec 32)) SeekEntryResult!2341)

(assert (=> b!300988 (= lt!149761 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149760 k!2524 (array!15200 (store (arr!7192 a!3312) i!1256 k!2524) (size!7544 a!3312)) mask!3809))))

(declare-fun lt!149762 () SeekEntryResult!2341)

(assert (=> b!300988 (= lt!149762 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!149760 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!300988 (= lt!149760 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!300989 () Bool)

(declare-fun e!190021 () Bool)

(assert (=> b!300989 (= e!190021 e!190020)))

(declare-fun res!158739 () Bool)

(assert (=> b!300989 (=> (not res!158739) (not e!190020))))

(declare-fun lt!149763 () SeekEntryResult!2341)

(assert (=> b!300989 (= res!158739 (or (= lt!149763 (MissingZero!2341 i!1256)) (= lt!149763 (MissingVacant!2341 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15199 (_ BitVec 32)) SeekEntryResult!2341)

(assert (=> b!300989 (= lt!149763 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!300990 () Bool)

(declare-fun res!158742 () Bool)

(assert (=> b!300990 (=> (not res!158742) (not e!190020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15199 (_ BitVec 32)) Bool)

(assert (=> b!300990 (= res!158742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!300991 () Bool)

(declare-fun res!158737 () Bool)

(assert (=> b!300991 (=> (not res!158737) (not e!190021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300991 (= res!158737 (validKeyInArray!0 k!2524))))

(declare-fun b!300992 () Bool)

(declare-fun res!158741 () Bool)

(assert (=> b!300992 (=> (not res!158741) (not e!190021))))

(assert (=> b!300992 (= res!158741 (and (= (size!7544 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7544 a!3312))))))

(declare-fun res!158738 () Bool)

(assert (=> start!29966 (=> (not res!158738) (not e!190021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29966 (= res!158738 (validMask!0 mask!3809))))

(assert (=> start!29966 e!190021))

(assert (=> start!29966 true))

(declare-fun array_inv!5155 (array!15199) Bool)

(assert (=> start!29966 (array_inv!5155 a!3312)))

(declare-fun b!300987 () Bool)

(declare-fun res!158740 () Bool)

(assert (=> b!300987 (=> (not res!158740) (not e!190021))))

(declare-fun arrayContainsKey!0 (array!15199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!300987 (= res!158740 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!29966 res!158738) b!300992))

(assert (= (and b!300992 res!158741) b!300991))

(assert (= (and b!300991 res!158737) b!300987))

(assert (= (and b!300987 res!158740) b!300989))

(assert (= (and b!300989 res!158739) b!300990))

(assert (= (and b!300990 res!158742) b!300988))

(declare-fun m!312889 () Bool)

(assert (=> b!300987 m!312889))

(declare-fun m!312891 () Bool)

(assert (=> start!29966 m!312891))

(declare-fun m!312893 () Bool)

(assert (=> start!29966 m!312893))

(declare-fun m!312895 () Bool)

(assert (=> b!300989 m!312895))

(declare-fun m!312897 () Bool)

(assert (=> b!300991 m!312897))

(declare-fun m!312899 () Bool)

(assert (=> b!300990 m!312899))

(declare-fun m!312901 () Bool)

(assert (=> b!300988 m!312901))

(declare-fun m!312903 () Bool)

(assert (=> b!300988 m!312903))

(declare-fun m!312905 () Bool)

(assert (=> b!300988 m!312905))

(declare-fun m!312907 () Bool)

(assert (=> b!300988 m!312907))

(push 1)

(assert (not b!300991))

(assert (not b!300988))

