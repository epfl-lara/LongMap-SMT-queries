; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29162 () Bool)

(assert start!29162)

(declare-fun b!295815 () Bool)

(declare-fun res!155752 () Bool)

(declare-fun e!186967 () Bool)

(assert (=> b!295815 (=> (not res!155752) (not e!186967))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295815 (= res!155752 (validKeyInArray!0 k0!2524))))

(declare-fun b!295816 () Bool)

(declare-fun e!186965 () Bool)

(declare-fun e!186963 () Bool)

(assert (=> b!295816 (= e!186965 e!186963)))

(declare-fun res!155753 () Bool)

(assert (=> b!295816 (=> (not res!155753) (not e!186963))))

(declare-fun lt!146711 () Bool)

(assert (=> b!295816 (= res!155753 lt!146711)))

(declare-datatypes ((SeekEntryResult!2243 0))(
  ( (MissingZero!2243 (index!11142 (_ BitVec 32))) (Found!2243 (index!11143 (_ BitVec 32))) (Intermediate!2243 (undefined!3055 Bool) (index!11144 (_ BitVec 32)) (x!29371 (_ BitVec 32))) (Undefined!2243) (MissingVacant!2243 (index!11145 (_ BitVec 32))) )
))
(declare-fun lt!146713 () SeekEntryResult!2243)

(declare-fun lt!146714 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14968 0))(
  ( (array!14969 (arr!7095 (Array (_ BitVec 32) (_ BitVec 64))) (size!7448 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14968)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14968 (_ BitVec 32)) SeekEntryResult!2243)

(assert (=> b!295816 (= lt!146713 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146714 k0!2524 (array!14969 (store (arr!7095 a!3312) i!1256 k0!2524) (size!7448 a!3312)) mask!3809))))

(declare-fun lt!146710 () SeekEntryResult!2243)

(assert (=> b!295816 (= lt!146710 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146714 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295816 (= lt!146714 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!155755 () Bool)

(assert (=> start!29162 (=> (not res!155755) (not e!186967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29162 (= res!155755 (validMask!0 mask!3809))))

(assert (=> start!29162 e!186967))

(assert (=> start!29162 true))

(declare-fun array_inv!5067 (array!14968) Bool)

(assert (=> start!29162 (array_inv!5067 a!3312)))

(declare-fun b!295817 () Bool)

(assert (=> b!295817 (= e!186967 e!186965)))

(declare-fun res!155757 () Bool)

(assert (=> b!295817 (=> (not res!155757) (not e!186965))))

(declare-fun lt!146715 () SeekEntryResult!2243)

(assert (=> b!295817 (= res!155757 (or lt!146711 (= lt!146715 (MissingVacant!2243 i!1256))))))

(assert (=> b!295817 (= lt!146711 (= lt!146715 (MissingZero!2243 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14968 (_ BitVec 32)) SeekEntryResult!2243)

(assert (=> b!295817 (= lt!146715 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!295818 () Bool)

(declare-fun res!155754 () Bool)

(assert (=> b!295818 (=> (not res!155754) (not e!186967))))

(declare-fun arrayContainsKey!0 (array!14968 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295818 (= res!155754 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295819 () Bool)

(declare-fun res!155758 () Bool)

(assert (=> b!295819 (=> (not res!155758) (not e!186965))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14968 (_ BitVec 32)) Bool)

(assert (=> b!295819 (= res!155758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295820 () Bool)

(declare-fun res!155751 () Bool)

(assert (=> b!295820 (=> (not res!155751) (not e!186967))))

(assert (=> b!295820 (= res!155751 (and (= (size!7448 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7448 a!3312))))))

(declare-fun b!295821 () Bool)

(declare-fun e!186966 () Bool)

(assert (=> b!295821 (= e!186966 (not (= lt!146710 (Intermediate!2243 false (index!11144 lt!146710) (x!29371 lt!146710)))))))

(assert (=> b!295821 (and (= (select (arr!7095 a!3312) (index!11144 lt!146710)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11144 lt!146710) i!1256))))

(declare-fun b!295822 () Bool)

(assert (=> b!295822 (= e!186963 e!186966)))

(declare-fun res!155756 () Bool)

(assert (=> b!295822 (=> (not res!155756) (not e!186966))))

(declare-fun lt!146712 () Bool)

(assert (=> b!295822 (= res!155756 (and (or lt!146712 (not (undefined!3055 lt!146710))) (or lt!146712 (not (= (select (arr!7095 a!3312) (index!11144 lt!146710)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146712 (not (= (select (arr!7095 a!3312) (index!11144 lt!146710)) k0!2524))) (not lt!146712)))))

(get-info :version)

(assert (=> b!295822 (= lt!146712 (not ((_ is Intermediate!2243) lt!146710)))))

(assert (= (and start!29162 res!155755) b!295820))

(assert (= (and b!295820 res!155751) b!295815))

(assert (= (and b!295815 res!155752) b!295818))

(assert (= (and b!295818 res!155754) b!295817))

(assert (= (and b!295817 res!155757) b!295819))

(assert (= (and b!295819 res!155758) b!295816))

(assert (= (and b!295816 res!155753) b!295822))

(assert (= (and b!295822 res!155756) b!295821))

(declare-fun m!308421 () Bool)

(assert (=> b!295822 m!308421))

(declare-fun m!308423 () Bool)

(assert (=> b!295817 m!308423))

(declare-fun m!308425 () Bool)

(assert (=> b!295815 m!308425))

(declare-fun m!308427 () Bool)

(assert (=> start!29162 m!308427))

(declare-fun m!308429 () Bool)

(assert (=> start!29162 m!308429))

(declare-fun m!308431 () Bool)

(assert (=> b!295816 m!308431))

(declare-fun m!308433 () Bool)

(assert (=> b!295816 m!308433))

(declare-fun m!308435 () Bool)

(assert (=> b!295816 m!308435))

(declare-fun m!308437 () Bool)

(assert (=> b!295816 m!308437))

(assert (=> b!295821 m!308421))

(declare-fun m!308439 () Bool)

(assert (=> b!295819 m!308439))

(declare-fun m!308441 () Bool)

(assert (=> b!295818 m!308441))

(check-sat (not b!295815) (not b!295818) (not start!29162) (not b!295819) (not b!295817) (not b!295816))
(check-sat)
