; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28184 () Bool)

(assert start!28184)

(declare-fun b!288565 () Bool)

(declare-fun res!150193 () Bool)

(declare-fun e!182707 () Bool)

(assert (=> b!288565 (=> (not res!150193) (not e!182707))))

(declare-datatypes ((array!14498 0))(
  ( (array!14499 (arr!6876 (Array (_ BitVec 32) (_ BitVec 64))) (size!7228 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14498)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14498 (_ BitVec 32)) Bool)

(assert (=> b!288565 (= res!150193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288566 () Bool)

(declare-fun e!182708 () Bool)

(assert (=> b!288566 (= e!182708 (not true))))

(declare-datatypes ((SeekEntryResult!2025 0))(
  ( (MissingZero!2025 (index!10270 (_ BitVec 32))) (Found!2025 (index!10271 (_ BitVec 32))) (Intermediate!2025 (undefined!2837 Bool) (index!10272 (_ BitVec 32)) (x!28486 (_ BitVec 32))) (Undefined!2025) (MissingVacant!2025 (index!10273 (_ BitVec 32))) )
))
(declare-fun lt!142178 () SeekEntryResult!2025)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288566 (and (= (select (arr!6876 a!3312) (index!10272 lt!142178)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10272 lt!142178) i!1256))))

(declare-fun b!288567 () Bool)

(declare-fun res!150190 () Bool)

(declare-fun e!182706 () Bool)

(assert (=> b!288567 (=> (not res!150190) (not e!182706))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288567 (= res!150190 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288568 () Bool)

(declare-fun e!182705 () Bool)

(assert (=> b!288568 (= e!182707 e!182705)))

(declare-fun res!150189 () Bool)

(assert (=> b!288568 (=> (not res!150189) (not e!182705))))

(declare-fun lt!142175 () Bool)

(assert (=> b!288568 (= res!150189 lt!142175)))

(declare-fun lt!142179 () SeekEntryResult!2025)

(declare-fun lt!142176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14498 (_ BitVec 32)) SeekEntryResult!2025)

(assert (=> b!288568 (= lt!142179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142176 k0!2524 (array!14499 (store (arr!6876 a!3312) i!1256 k0!2524) (size!7228 a!3312)) mask!3809))))

(assert (=> b!288568 (= lt!142178 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142176 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288568 (= lt!142176 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288569 () Bool)

(declare-fun res!150195 () Bool)

(assert (=> b!288569 (=> (not res!150195) (not e!182706))))

(assert (=> b!288569 (= res!150195 (and (= (size!7228 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7228 a!3312))))))

(declare-fun b!288570 () Bool)

(declare-fun res!150188 () Bool)

(assert (=> b!288570 (=> (not res!150188) (not e!182706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288570 (= res!150188 (validKeyInArray!0 k0!2524))))

(declare-fun b!288571 () Bool)

(assert (=> b!288571 (= e!182705 e!182708)))

(declare-fun res!150194 () Bool)

(assert (=> b!288571 (=> (not res!150194) (not e!182708))))

(declare-fun lt!142177 () Bool)

(assert (=> b!288571 (= res!150194 (and (or lt!142177 (not (undefined!2837 lt!142178))) (or lt!142177 (not (= (select (arr!6876 a!3312) (index!10272 lt!142178)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142177 (not (= (select (arr!6876 a!3312) (index!10272 lt!142178)) k0!2524))) (not lt!142177)))))

(get-info :version)

(assert (=> b!288571 (= lt!142177 (not ((_ is Intermediate!2025) lt!142178)))))

(declare-fun b!288572 () Bool)

(assert (=> b!288572 (= e!182706 e!182707)))

(declare-fun res!150191 () Bool)

(assert (=> b!288572 (=> (not res!150191) (not e!182707))))

(declare-fun lt!142180 () SeekEntryResult!2025)

(assert (=> b!288572 (= res!150191 (or lt!142175 (= lt!142180 (MissingVacant!2025 i!1256))))))

(assert (=> b!288572 (= lt!142175 (= lt!142180 (MissingZero!2025 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14498 (_ BitVec 32)) SeekEntryResult!2025)

(assert (=> b!288572 (= lt!142180 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun res!150192 () Bool)

(assert (=> start!28184 (=> (not res!150192) (not e!182706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28184 (= res!150192 (validMask!0 mask!3809))))

(assert (=> start!28184 e!182706))

(assert (=> start!28184 true))

(declare-fun array_inv!4839 (array!14498) Bool)

(assert (=> start!28184 (array_inv!4839 a!3312)))

(assert (= (and start!28184 res!150192) b!288569))

(assert (= (and b!288569 res!150195) b!288570))

(assert (= (and b!288570 res!150188) b!288567))

(assert (= (and b!288567 res!150190) b!288572))

(assert (= (and b!288572 res!150191) b!288565))

(assert (= (and b!288565 res!150193) b!288568))

(assert (= (and b!288568 res!150189) b!288571))

(assert (= (and b!288571 res!150194) b!288566))

(declare-fun m!302785 () Bool)

(assert (=> b!288566 m!302785))

(declare-fun m!302787 () Bool)

(assert (=> b!288565 m!302787))

(declare-fun m!302789 () Bool)

(assert (=> b!288572 m!302789))

(declare-fun m!302791 () Bool)

(assert (=> b!288570 m!302791))

(declare-fun m!302793 () Bool)

(assert (=> b!288567 m!302793))

(declare-fun m!302795 () Bool)

(assert (=> b!288568 m!302795))

(declare-fun m!302797 () Bool)

(assert (=> b!288568 m!302797))

(declare-fun m!302799 () Bool)

(assert (=> b!288568 m!302799))

(declare-fun m!302801 () Bool)

(assert (=> b!288568 m!302801))

(assert (=> b!288571 m!302785))

(declare-fun m!302803 () Bool)

(assert (=> start!28184 m!302803))

(declare-fun m!302805 () Bool)

(assert (=> start!28184 m!302805))

(check-sat (not b!288570) (not b!288572) (not b!288565) (not b!288568) (not start!28184) (not b!288567))
(check-sat)
