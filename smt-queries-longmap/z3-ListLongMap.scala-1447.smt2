; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27916 () Bool)

(assert start!27916)

(declare-fun b!286874 () Bool)

(declare-fun e!181742 () Bool)

(declare-fun e!181741 () Bool)

(assert (=> b!286874 (= e!181742 e!181741)))

(declare-fun res!148862 () Bool)

(assert (=> b!286874 (=> (not res!148862) (not e!181741))))

(declare-datatypes ((SeekEntryResult!1931 0))(
  ( (MissingZero!1931 (index!9894 (_ BitVec 32))) (Found!1931 (index!9895 (_ BitVec 32))) (Intermediate!1931 (undefined!2743 Bool) (index!9896 (_ BitVec 32)) (x!28222 (_ BitVec 32))) (Undefined!1931) (MissingVacant!1931 (index!9897 (_ BitVec 32))) )
))
(declare-fun lt!141330 () SeekEntryResult!1931)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286874 (= res!148862 (or (= lt!141330 (MissingZero!1931 i!1256)) (= lt!141330 (MissingVacant!1931 i!1256))))))

(declare-datatypes ((array!14370 0))(
  ( (array!14371 (arr!6817 (Array (_ BitVec 32) (_ BitVec 64))) (size!7169 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14370)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14370 (_ BitVec 32)) SeekEntryResult!1931)

(assert (=> b!286874 (= lt!141330 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286875 () Bool)

(declare-fun res!148863 () Bool)

(assert (=> b!286875 (=> (not res!148863) (not e!181742))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286875 (= res!148863 (validKeyInArray!0 k0!2524))))

(declare-fun b!286876 () Bool)

(declare-fun res!148860 () Bool)

(assert (=> b!286876 (=> (not res!148860) (not e!181741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14370 (_ BitVec 32)) Bool)

(assert (=> b!286876 (= res!148860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286877 () Bool)

(declare-fun res!148861 () Bool)

(assert (=> b!286877 (=> (not res!148861) (not e!181742))))

(assert (=> b!286877 (= res!148861 (and (= (size!7169 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7169 a!3312))))))

(declare-fun b!286878 () Bool)

(assert (=> b!286878 (= e!181741 false)))

(declare-fun lt!141329 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286878 (= lt!141329 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!286879 () Bool)

(declare-fun res!148858 () Bool)

(assert (=> b!286879 (=> (not res!148858) (not e!181742))))

(declare-fun arrayContainsKey!0 (array!14370 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286879 (= res!148858 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!148859 () Bool)

(assert (=> start!27916 (=> (not res!148859) (not e!181742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27916 (= res!148859 (validMask!0 mask!3809))))

(assert (=> start!27916 e!181742))

(assert (=> start!27916 true))

(declare-fun array_inv!4767 (array!14370) Bool)

(assert (=> start!27916 (array_inv!4767 a!3312)))

(assert (= (and start!27916 res!148859) b!286877))

(assert (= (and b!286877 res!148861) b!286875))

(assert (= (and b!286875 res!148863) b!286879))

(assert (= (and b!286879 res!148858) b!286874))

(assert (= (and b!286874 res!148862) b!286876))

(assert (= (and b!286876 res!148860) b!286878))

(declare-fun m!301613 () Bool)

(assert (=> b!286874 m!301613))

(declare-fun m!301615 () Bool)

(assert (=> b!286875 m!301615))

(declare-fun m!301617 () Bool)

(assert (=> b!286876 m!301617))

(declare-fun m!301619 () Bool)

(assert (=> start!27916 m!301619))

(declare-fun m!301621 () Bool)

(assert (=> start!27916 m!301621))

(declare-fun m!301623 () Bool)

(assert (=> b!286878 m!301623))

(declare-fun m!301625 () Bool)

(assert (=> b!286879 m!301625))

(check-sat (not b!286876) (not b!286874) (not start!27916) (not b!286878) (not b!286875) (not b!286879))
(check-sat)
