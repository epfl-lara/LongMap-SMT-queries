; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27866 () Bool)

(assert start!27866)

(declare-fun b!286464 () Bool)

(declare-fun res!148599 () Bool)

(declare-fun e!181491 () Bool)

(assert (=> b!286464 (=> (not res!148599) (not e!181491))))

(declare-datatypes ((array!14347 0))(
  ( (array!14348 (arr!6807 (Array (_ BitVec 32) (_ BitVec 64))) (size!7160 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14347)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14347 (_ BitVec 32)) Bool)

(assert (=> b!286464 (= res!148599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!148597 () Bool)

(declare-fun e!181489 () Bool)

(assert (=> start!27866 (=> (not res!148597) (not e!181489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27866 (= res!148597 (validMask!0 mask!3809))))

(assert (=> start!27866 e!181489))

(assert (=> start!27866 true))

(declare-fun array_inv!4779 (array!14347) Bool)

(assert (=> start!27866 (array_inv!4779 a!3312)))

(declare-fun b!286465 () Bool)

(declare-fun res!148598 () Bool)

(assert (=> b!286465 (=> (not res!148598) (not e!181489))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286465 (= res!148598 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286466 () Bool)

(assert (=> b!286466 (= e!181491 false)))

(declare-fun lt!140981 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286466 (= lt!140981 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!286467 () Bool)

(assert (=> b!286467 (= e!181489 e!181491)))

(declare-fun res!148600 () Bool)

(assert (=> b!286467 (=> (not res!148600) (not e!181491))))

(declare-datatypes ((SeekEntryResult!1955 0))(
  ( (MissingZero!1955 (index!9990 (_ BitVec 32))) (Found!1955 (index!9991 (_ BitVec 32))) (Intermediate!1955 (undefined!2767 Bool) (index!9992 (_ BitVec 32)) (x!28226 (_ BitVec 32))) (Undefined!1955) (MissingVacant!1955 (index!9993 (_ BitVec 32))) )
))
(declare-fun lt!140982 () SeekEntryResult!1955)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286467 (= res!148600 (or (= lt!140982 (MissingZero!1955 i!1256)) (= lt!140982 (MissingVacant!1955 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14347 (_ BitVec 32)) SeekEntryResult!1955)

(assert (=> b!286467 (= lt!140982 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286468 () Bool)

(declare-fun res!148596 () Bool)

(assert (=> b!286468 (=> (not res!148596) (not e!181489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286468 (= res!148596 (validKeyInArray!0 k0!2524))))

(declare-fun b!286469 () Bool)

(declare-fun res!148595 () Bool)

(assert (=> b!286469 (=> (not res!148595) (not e!181489))))

(assert (=> b!286469 (= res!148595 (and (= (size!7160 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7160 a!3312))))))

(assert (= (and start!27866 res!148597) b!286469))

(assert (= (and b!286469 res!148595) b!286468))

(assert (= (and b!286468 res!148596) b!286465))

(assert (= (and b!286465 res!148598) b!286467))

(assert (= (and b!286467 res!148600) b!286464))

(assert (= (and b!286464 res!148599) b!286466))

(declare-fun m!300653 () Bool)

(assert (=> b!286468 m!300653))

(declare-fun m!300655 () Bool)

(assert (=> b!286466 m!300655))

(declare-fun m!300657 () Bool)

(assert (=> b!286465 m!300657))

(declare-fun m!300659 () Bool)

(assert (=> start!27866 m!300659))

(declare-fun m!300661 () Bool)

(assert (=> start!27866 m!300661))

(declare-fun m!300663 () Bool)

(assert (=> b!286464 m!300663))

(declare-fun m!300665 () Bool)

(assert (=> b!286467 m!300665))

(check-sat (not b!286467) (not b!286465) (not b!286464) (not b!286466) (not b!286468) (not start!27866))
(check-sat)
