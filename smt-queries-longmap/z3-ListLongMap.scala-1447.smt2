; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27926 () Bool)

(assert start!27926)

(declare-fun b!286845 () Bool)

(declare-fun e!181727 () Bool)

(assert (=> b!286845 (= e!181727 false)))

(declare-fun lt!141276 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286845 (= lt!141276 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!286846 () Bool)

(declare-fun res!148855 () Bool)

(declare-fun e!181725 () Bool)

(assert (=> b!286846 (=> (not res!148855) (not e!181725))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14375 0))(
  ( (array!14376 (arr!6819 (Array (_ BitVec 32) (_ BitVec 64))) (size!7171 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14375)

(assert (=> b!286846 (= res!148855 (and (= (size!7171 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7171 a!3312))))))

(declare-fun b!286847 () Bool)

(declare-fun res!148856 () Bool)

(assert (=> b!286847 (=> (not res!148856) (not e!181725))))

(declare-fun arrayContainsKey!0 (array!14375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286847 (= res!148856 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!286848 () Bool)

(assert (=> b!286848 (= e!181725 e!181727)))

(declare-fun res!148858 () Bool)

(assert (=> b!286848 (=> (not res!148858) (not e!181727))))

(declare-datatypes ((SeekEntryResult!1968 0))(
  ( (MissingZero!1968 (index!10042 (_ BitVec 32))) (Found!1968 (index!10043 (_ BitVec 32))) (Intermediate!1968 (undefined!2780 Bool) (index!10044 (_ BitVec 32)) (x!28259 (_ BitVec 32))) (Undefined!1968) (MissingVacant!1968 (index!10045 (_ BitVec 32))) )
))
(declare-fun lt!141277 () SeekEntryResult!1968)

(assert (=> b!286848 (= res!148858 (or (= lt!141277 (MissingZero!1968 i!1256)) (= lt!141277 (MissingVacant!1968 i!1256))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14375 (_ BitVec 32)) SeekEntryResult!1968)

(assert (=> b!286848 (= lt!141277 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286849 () Bool)

(declare-fun res!148859 () Bool)

(assert (=> b!286849 (=> (not res!148859) (not e!181727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14375 (_ BitVec 32)) Bool)

(assert (=> b!286849 (= res!148859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!148860 () Bool)

(assert (=> start!27926 (=> (not res!148860) (not e!181725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27926 (= res!148860 (validMask!0 mask!3809))))

(assert (=> start!27926 e!181725))

(assert (=> start!27926 true))

(declare-fun array_inv!4782 (array!14375) Bool)

(assert (=> start!27926 (array_inv!4782 a!3312)))

(declare-fun b!286850 () Bool)

(declare-fun res!148857 () Bool)

(assert (=> b!286850 (=> (not res!148857) (not e!181725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286850 (= res!148857 (validKeyInArray!0 k0!2524))))

(assert (= (and start!27926 res!148860) b!286846))

(assert (= (and b!286846 res!148855) b!286850))

(assert (= (and b!286850 res!148857) b!286847))

(assert (= (and b!286847 res!148856) b!286848))

(assert (= (and b!286848 res!148858) b!286849))

(assert (= (and b!286849 res!148859) b!286845))

(declare-fun m!301421 () Bool)

(assert (=> b!286849 m!301421))

(declare-fun m!301423 () Bool)

(assert (=> b!286847 m!301423))

(declare-fun m!301425 () Bool)

(assert (=> start!27926 m!301425))

(declare-fun m!301427 () Bool)

(assert (=> start!27926 m!301427))

(declare-fun m!301429 () Bool)

(assert (=> b!286850 m!301429))

(declare-fun m!301431 () Bool)

(assert (=> b!286845 m!301431))

(declare-fun m!301433 () Bool)

(assert (=> b!286848 m!301433))

(check-sat (not b!286850) (not b!286845) (not start!27926) (not b!286848) (not b!286849) (not b!286847))
(check-sat)
