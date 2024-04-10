; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32058 () Bool)

(assert start!32058)

(declare-fun b!319842 () Bool)

(declare-fun res!174154 () Bool)

(declare-fun e!198585 () Bool)

(assert (=> b!319842 (=> (not res!174154) (not e!198585))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319842 (= res!174154 (validKeyInArray!0 k0!2497))))

(declare-fun res!174156 () Bool)

(assert (=> start!32058 (=> (not res!174156) (not e!198585))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32058 (= res!174156 (validMask!0 mask!3777))))

(assert (=> start!32058 e!198585))

(assert (=> start!32058 true))

(declare-datatypes ((array!16332 0))(
  ( (array!16333 (arr!7728 (Array (_ BitVec 32) (_ BitVec 64))) (size!8080 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16332)

(declare-fun array_inv!5691 (array!16332) Bool)

(assert (=> start!32058 (array_inv!5691 a!3305)))

(declare-fun b!319843 () Bool)

(assert (=> b!319843 (= e!198585 (bvslt mask!3777 #b00000000000000000000000000000000))))

(declare-fun lt!155883 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!319843 (= lt!155883 (toIndex!0 k0!2497 mask!3777))))

(declare-fun b!319844 () Bool)

(declare-fun res!174158 () Bool)

(assert (=> b!319844 (=> (not res!174158) (not e!198585))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2859 0))(
  ( (MissingZero!2859 (index!13612 (_ BitVec 32))) (Found!2859 (index!13613 (_ BitVec 32))) (Intermediate!2859 (undefined!3671 Bool) (index!13614 (_ BitVec 32)) (x!31885 (_ BitVec 32))) (Undefined!2859) (MissingVacant!2859 (index!13615 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16332 (_ BitVec 32)) SeekEntryResult!2859)

(assert (=> b!319844 (= res!174158 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2859 i!1250)))))

(declare-fun b!319845 () Bool)

(declare-fun res!174157 () Bool)

(assert (=> b!319845 (=> (not res!174157) (not e!198585))))

(declare-fun arrayContainsKey!0 (array!16332 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319845 (= res!174157 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!319846 () Bool)

(declare-fun res!174159 () Bool)

(assert (=> b!319846 (=> (not res!174159) (not e!198585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16332 (_ BitVec 32)) Bool)

(assert (=> b!319846 (= res!174159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!319847 () Bool)

(declare-fun res!174155 () Bool)

(assert (=> b!319847 (=> (not res!174155) (not e!198585))))

(assert (=> b!319847 (= res!174155 (and (= (size!8080 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8080 a!3305))))))

(assert (= (and start!32058 res!174156) b!319847))

(assert (= (and b!319847 res!174155) b!319842))

(assert (= (and b!319842 res!174154) b!319845))

(assert (= (and b!319845 res!174157) b!319844))

(assert (= (and b!319844 res!174158) b!319846))

(assert (= (and b!319846 res!174159) b!319843))

(declare-fun m!328339 () Bool)

(assert (=> b!319846 m!328339))

(declare-fun m!328341 () Bool)

(assert (=> b!319843 m!328341))

(declare-fun m!328343 () Bool)

(assert (=> start!32058 m!328343))

(declare-fun m!328345 () Bool)

(assert (=> start!32058 m!328345))

(declare-fun m!328347 () Bool)

(assert (=> b!319845 m!328347))

(declare-fun m!328349 () Bool)

(assert (=> b!319844 m!328349))

(declare-fun m!328351 () Bool)

(assert (=> b!319842 m!328351))

(check-sat (not b!319843) (not b!319845) (not b!319846) (not start!32058) (not b!319842) (not b!319844))
(check-sat)
