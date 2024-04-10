; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29162 () Bool)

(assert start!29162)

(declare-fun b!295894 () Bool)

(declare-fun res!155702 () Bool)

(declare-fun e!187020 () Bool)

(assert (=> b!295894 (=> (not res!155702) (not e!187020))))

(declare-datatypes ((array!14965 0))(
  ( (array!14966 (arr!7093 (Array (_ BitVec 32) (_ BitVec 64))) (size!7445 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14965)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14965 (_ BitVec 32)) Bool)

(assert (=> b!295894 (= res!155702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295895 () Bool)

(declare-fun res!155708 () Bool)

(declare-fun e!187019 () Bool)

(assert (=> b!295895 (=> (not res!155708) (not e!187019))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295895 (= res!155708 (validKeyInArray!0 k!2524))))

(declare-fun b!295896 () Bool)

(declare-fun e!187017 () Bool)

(assert (=> b!295896 (= e!187020 e!187017)))

(declare-fun res!155707 () Bool)

(assert (=> b!295896 (=> (not res!155707) (not e!187017))))

(declare-fun lt!146811 () Bool)

(assert (=> b!295896 (= res!155707 lt!146811)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!146808 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2242 0))(
  ( (MissingZero!2242 (index!11138 (_ BitVec 32))) (Found!2242 (index!11139 (_ BitVec 32))) (Intermediate!2242 (undefined!3054 Bool) (index!11140 (_ BitVec 32)) (x!29350 (_ BitVec 32))) (Undefined!2242) (MissingVacant!2242 (index!11141 (_ BitVec 32))) )
))
(declare-fun lt!146807 () SeekEntryResult!2242)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14965 (_ BitVec 32)) SeekEntryResult!2242)

(assert (=> b!295896 (= lt!146807 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146808 k!2524 (array!14966 (store (arr!7093 a!3312) i!1256 k!2524) (size!7445 a!3312)) mask!3809))))

(declare-fun lt!146806 () SeekEntryResult!2242)

(assert (=> b!295896 (= lt!146806 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146808 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295896 (= lt!146808 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!295897 () Bool)

(declare-fun res!155704 () Bool)

(assert (=> b!295897 (=> (not res!155704) (not e!187019))))

(declare-fun arrayContainsKey!0 (array!14965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295897 (= res!155704 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295898 () Bool)

(declare-fun res!155703 () Bool)

(assert (=> b!295898 (=> (not res!155703) (not e!187019))))

(assert (=> b!295898 (= res!155703 (and (= (size!7445 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7445 a!3312))))))

(declare-fun b!295899 () Bool)

(declare-fun e!187018 () Bool)

(assert (=> b!295899 (= e!187018 (not true))))

(assert (=> b!295899 (and (= (select (arr!7093 a!3312) (index!11140 lt!146806)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11140 lt!146806) i!1256))))

(declare-fun res!155709 () Bool)

(assert (=> start!29162 (=> (not res!155709) (not e!187019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29162 (= res!155709 (validMask!0 mask!3809))))

(assert (=> start!29162 e!187019))

(assert (=> start!29162 true))

(declare-fun array_inv!5056 (array!14965) Bool)

(assert (=> start!29162 (array_inv!5056 a!3312)))

(declare-fun b!295900 () Bool)

(assert (=> b!295900 (= e!187017 e!187018)))

(declare-fun res!155706 () Bool)

(assert (=> b!295900 (=> (not res!155706) (not e!187018))))

(declare-fun lt!146810 () Bool)

(assert (=> b!295900 (= res!155706 (and (or lt!146810 (not (undefined!3054 lt!146806))) (or lt!146810 (not (= (select (arr!7093 a!3312) (index!11140 lt!146806)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146810 (not (= (select (arr!7093 a!3312) (index!11140 lt!146806)) k!2524))) (not lt!146810)))))

(assert (=> b!295900 (= lt!146810 (not (is-Intermediate!2242 lt!146806)))))

(declare-fun b!295901 () Bool)

(assert (=> b!295901 (= e!187019 e!187020)))

(declare-fun res!155705 () Bool)

(assert (=> b!295901 (=> (not res!155705) (not e!187020))))

(declare-fun lt!146809 () SeekEntryResult!2242)

(assert (=> b!295901 (= res!155705 (or lt!146811 (= lt!146809 (MissingVacant!2242 i!1256))))))

(assert (=> b!295901 (= lt!146811 (= lt!146809 (MissingZero!2242 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14965 (_ BitVec 32)) SeekEntryResult!2242)

(assert (=> b!295901 (= lt!146809 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!29162 res!155709) b!295898))

(assert (= (and b!295898 res!155703) b!295895))

(assert (= (and b!295895 res!155708) b!295897))

(assert (= (and b!295897 res!155704) b!295901))

(assert (= (and b!295901 res!155705) b!295894))

(assert (= (and b!295894 res!155702) b!295896))

(assert (= (and b!295896 res!155707) b!295900))

(assert (= (and b!295900 res!155706) b!295899))

(declare-fun m!308963 () Bool)

(assert (=> b!295895 m!308963))

(declare-fun m!308965 () Bool)

(assert (=> start!29162 m!308965))

(declare-fun m!308967 () Bool)

(assert (=> start!29162 m!308967))

(declare-fun m!308969 () Bool)

(assert (=> b!295901 m!308969))

(declare-fun m!308971 () Bool)

(assert (=> b!295899 m!308971))

(assert (=> b!295900 m!308971))

(declare-fun m!308973 () Bool)

(assert (=> b!295896 m!308973))

(declare-fun m!308975 () Bool)

(assert (=> b!295896 m!308975))

(declare-fun m!308977 () Bool)

(assert (=> b!295896 m!308977))

(declare-fun m!308979 () Bool)

(assert (=> b!295896 m!308979))

(declare-fun m!308981 () Bool)

(assert (=> b!295897 m!308981))

(declare-fun m!308983 () Bool)

(assert (=> b!295894 m!308983))

(push 1)

