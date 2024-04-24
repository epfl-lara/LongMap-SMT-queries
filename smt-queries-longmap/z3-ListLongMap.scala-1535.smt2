; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29134 () Bool)

(assert start!29134)

(declare-fun b!295695 () Bool)

(declare-fun res!155465 () Bool)

(declare-fun e!186888 () Bool)

(assert (=> b!295695 (=> (not res!155465) (not e!186888))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-datatypes ((array!14940 0))(
  ( (array!14941 (arr!7081 (Array (_ BitVec 32) (_ BitVec 64))) (size!7433 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14940)

(assert (=> b!295695 (= res!155465 (and (= (size!7433 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7433 a!3312))))))

(declare-fun b!295696 () Bool)

(declare-fun res!155468 () Bool)

(declare-fun e!186889 () Bool)

(assert (=> b!295696 (=> (not res!155468) (not e!186889))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14940 (_ BitVec 32)) Bool)

(assert (=> b!295696 (= res!155468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!155472 () Bool)

(assert (=> start!29134 (=> (not res!155472) (not e!186888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29134 (= res!155472 (validMask!0 mask!3809))))

(assert (=> start!29134 e!186888))

(assert (=> start!29134 true))

(declare-fun array_inv!5031 (array!14940) Bool)

(assert (=> start!29134 (array_inv!5031 a!3312)))

(declare-fun b!295697 () Bool)

(declare-fun e!186887 () Bool)

(declare-fun e!186886 () Bool)

(assert (=> b!295697 (= e!186887 e!186886)))

(declare-fun res!155466 () Bool)

(assert (=> b!295697 (=> (not res!155466) (not e!186886))))

(declare-datatypes ((SeekEntryResult!2195 0))(
  ( (MissingZero!2195 (index!10950 (_ BitVec 32))) (Found!2195 (index!10951 (_ BitVec 32))) (Intermediate!2195 (undefined!3007 Bool) (index!10952 (_ BitVec 32)) (x!29280 (_ BitVec 32))) (Undefined!2195) (MissingVacant!2195 (index!10953 (_ BitVec 32))) )
))
(declare-fun lt!146677 () SeekEntryResult!2195)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun lt!146679 () Bool)

(assert (=> b!295697 (= res!155466 (and (or lt!146679 (not (undefined!3007 lt!146677))) (or lt!146679 (not (= (select (arr!7081 a!3312) (index!10952 lt!146677)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146679 (not (= (select (arr!7081 a!3312) (index!10952 lt!146677)) k0!2524))) (not lt!146679)))))

(get-info :version)

(assert (=> b!295697 (= lt!146679 (not ((_ is Intermediate!2195) lt!146677)))))

(declare-fun b!295698 () Bool)

(declare-fun res!155471 () Bool)

(assert (=> b!295698 (=> (not res!155471) (not e!186888))))

(declare-fun arrayContainsKey!0 (array!14940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295698 (= res!155471 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295699 () Bool)

(assert (=> b!295699 (= e!186889 e!186887)))

(declare-fun res!155470 () Bool)

(assert (=> b!295699 (=> (not res!155470) (not e!186887))))

(declare-fun lt!146678 () Bool)

(assert (=> b!295699 (= res!155470 lt!146678)))

(declare-fun lt!146674 () SeekEntryResult!2195)

(declare-fun lt!146676 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14940 (_ BitVec 32)) SeekEntryResult!2195)

(assert (=> b!295699 (= lt!146674 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146676 k0!2524 (array!14941 (store (arr!7081 a!3312) i!1256 k0!2524) (size!7433 a!3312)) mask!3809))))

(assert (=> b!295699 (= lt!146677 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146676 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295699 (= lt!146676 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295700 () Bool)

(declare-fun res!155469 () Bool)

(assert (=> b!295700 (=> (not res!155469) (not e!186888))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295700 (= res!155469 (validKeyInArray!0 k0!2524))))

(declare-fun b!295701 () Bool)

(assert (=> b!295701 (= e!186886 (not true))))

(assert (=> b!295701 (and (= (select (arr!7081 a!3312) (index!10952 lt!146677)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10952 lt!146677) i!1256))))

(declare-fun b!295702 () Bool)

(assert (=> b!295702 (= e!186888 e!186889)))

(declare-fun res!155467 () Bool)

(assert (=> b!295702 (=> (not res!155467) (not e!186889))))

(declare-fun lt!146675 () SeekEntryResult!2195)

(assert (=> b!295702 (= res!155467 (or lt!146678 (= lt!146675 (MissingVacant!2195 i!1256))))))

(assert (=> b!295702 (= lt!146678 (= lt!146675 (MissingZero!2195 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14940 (_ BitVec 32)) SeekEntryResult!2195)

(assert (=> b!295702 (= lt!146675 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!29134 res!155472) b!295695))

(assert (= (and b!295695 res!155465) b!295700))

(assert (= (and b!295700 res!155469) b!295698))

(assert (= (and b!295698 res!155471) b!295702))

(assert (= (and b!295702 res!155467) b!295696))

(assert (= (and b!295696 res!155468) b!295699))

(assert (= (and b!295699 res!155470) b!295697))

(assert (= (and b!295697 res!155466) b!295701))

(declare-fun m!308951 () Bool)

(assert (=> b!295696 m!308951))

(declare-fun m!308953 () Bool)

(assert (=> b!295699 m!308953))

(declare-fun m!308955 () Bool)

(assert (=> b!295699 m!308955))

(declare-fun m!308957 () Bool)

(assert (=> b!295699 m!308957))

(declare-fun m!308959 () Bool)

(assert (=> b!295699 m!308959))

(declare-fun m!308961 () Bool)

(assert (=> b!295697 m!308961))

(declare-fun m!308963 () Bool)

(assert (=> b!295700 m!308963))

(declare-fun m!308965 () Bool)

(assert (=> start!29134 m!308965))

(declare-fun m!308967 () Bool)

(assert (=> start!29134 m!308967))

(declare-fun m!308969 () Bool)

(assert (=> b!295698 m!308969))

(assert (=> b!295701 m!308961))

(declare-fun m!308971 () Bool)

(assert (=> b!295702 m!308971))

(check-sat (not b!295702) (not start!29134) (not b!295700) (not b!295699) (not b!295696) (not b!295698))
(check-sat)
