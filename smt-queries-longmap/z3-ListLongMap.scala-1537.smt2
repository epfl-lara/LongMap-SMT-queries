; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29154 () Bool)

(assert start!29154)

(declare-fun b!295798 () Bool)

(declare-fun res!155607 () Bool)

(declare-fun e!186959 () Bool)

(assert (=> b!295798 (=> (not res!155607) (not e!186959))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14957 0))(
  ( (array!14958 (arr!7089 (Array (_ BitVec 32) (_ BitVec 64))) (size!7441 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14957)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!295798 (= res!155607 (and (= (size!7441 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7441 a!3312))))))

(declare-fun b!295799 () Bool)

(declare-fun e!186961 () Bool)

(assert (=> b!295799 (= e!186961 (not true))))

(declare-datatypes ((SeekEntryResult!2238 0))(
  ( (MissingZero!2238 (index!11122 (_ BitVec 32))) (Found!2238 (index!11123 (_ BitVec 32))) (Intermediate!2238 (undefined!3050 Bool) (index!11124 (_ BitVec 32)) (x!29338 (_ BitVec 32))) (Undefined!2238) (MissingVacant!2238 (index!11125 (_ BitVec 32))) )
))
(declare-fun lt!146736 () SeekEntryResult!2238)

(assert (=> b!295799 (and (= (select (arr!7089 a!3312) (index!11124 lt!146736)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11124 lt!146736) i!1256))))

(declare-fun b!295800 () Bool)

(declare-fun res!155610 () Bool)

(assert (=> b!295800 (=> (not res!155610) (not e!186959))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14957 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295800 (= res!155610 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295801 () Bool)

(declare-fun e!186957 () Bool)

(assert (=> b!295801 (= e!186957 e!186961)))

(declare-fun res!155612 () Bool)

(assert (=> b!295801 (=> (not res!155612) (not e!186961))))

(declare-fun lt!146734 () Bool)

(assert (=> b!295801 (= res!155612 (and (or lt!146734 (not (undefined!3050 lt!146736))) (or lt!146734 (not (= (select (arr!7089 a!3312) (index!11124 lt!146736)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146734 (not (= (select (arr!7089 a!3312) (index!11124 lt!146736)) k0!2524))) (not lt!146734)))))

(get-info :version)

(assert (=> b!295801 (= lt!146734 (not ((_ is Intermediate!2238) lt!146736)))))

(declare-fun b!295802 () Bool)

(declare-fun e!186960 () Bool)

(assert (=> b!295802 (= e!186960 e!186957)))

(declare-fun res!155609 () Bool)

(assert (=> b!295802 (=> (not res!155609) (not e!186957))))

(declare-fun lt!146737 () Bool)

(assert (=> b!295802 (= res!155609 lt!146737)))

(declare-fun lt!146739 () (_ BitVec 32))

(declare-fun lt!146735 () SeekEntryResult!2238)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14957 (_ BitVec 32)) SeekEntryResult!2238)

(assert (=> b!295802 (= lt!146735 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146739 k0!2524 (array!14958 (store (arr!7089 a!3312) i!1256 k0!2524) (size!7441 a!3312)) mask!3809))))

(assert (=> b!295802 (= lt!146736 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146739 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295802 (= lt!146739 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!295804 () Bool)

(declare-fun res!155606 () Bool)

(assert (=> b!295804 (=> (not res!155606) (not e!186960))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14957 (_ BitVec 32)) Bool)

(assert (=> b!295804 (= res!155606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295805 () Bool)

(assert (=> b!295805 (= e!186959 e!186960)))

(declare-fun res!155613 () Bool)

(assert (=> b!295805 (=> (not res!155613) (not e!186960))))

(declare-fun lt!146738 () SeekEntryResult!2238)

(assert (=> b!295805 (= res!155613 (or lt!146737 (= lt!146738 (MissingVacant!2238 i!1256))))))

(assert (=> b!295805 (= lt!146737 (= lt!146738 (MissingZero!2238 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14957 (_ BitVec 32)) SeekEntryResult!2238)

(assert (=> b!295805 (= lt!146738 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!155608 () Bool)

(assert (=> start!29154 (=> (not res!155608) (not e!186959))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29154 (= res!155608 (validMask!0 mask!3809))))

(assert (=> start!29154 e!186959))

(assert (=> start!29154 true))

(declare-fun array_inv!5052 (array!14957) Bool)

(assert (=> start!29154 (array_inv!5052 a!3312)))

(declare-fun b!295803 () Bool)

(declare-fun res!155611 () Bool)

(assert (=> b!295803 (=> (not res!155611) (not e!186959))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295803 (= res!155611 (validKeyInArray!0 k0!2524))))

(assert (= (and start!29154 res!155608) b!295798))

(assert (= (and b!295798 res!155607) b!295803))

(assert (= (and b!295803 res!155611) b!295800))

(assert (= (and b!295800 res!155610) b!295805))

(assert (= (and b!295805 res!155613) b!295804))

(assert (= (and b!295804 res!155606) b!295802))

(assert (= (and b!295802 res!155609) b!295801))

(assert (= (and b!295801 res!155612) b!295799))

(declare-fun m!308875 () Bool)

(assert (=> b!295803 m!308875))

(declare-fun m!308877 () Bool)

(assert (=> b!295799 m!308877))

(declare-fun m!308879 () Bool)

(assert (=> b!295802 m!308879))

(declare-fun m!308881 () Bool)

(assert (=> b!295802 m!308881))

(declare-fun m!308883 () Bool)

(assert (=> b!295802 m!308883))

(declare-fun m!308885 () Bool)

(assert (=> b!295802 m!308885))

(assert (=> b!295801 m!308877))

(declare-fun m!308887 () Bool)

(assert (=> start!29154 m!308887))

(declare-fun m!308889 () Bool)

(assert (=> start!29154 m!308889))

(declare-fun m!308891 () Bool)

(assert (=> b!295805 m!308891))

(declare-fun m!308893 () Bool)

(assert (=> b!295804 m!308893))

(declare-fun m!308895 () Bool)

(assert (=> b!295800 m!308895))

(check-sat (not b!295805) (not start!29154) (not b!295800) (not b!295802) (not b!295804) (not b!295803))
(check-sat)
