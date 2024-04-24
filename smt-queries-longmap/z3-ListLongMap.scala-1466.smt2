; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28174 () Bool)

(assert start!28174)

(declare-fun b!288588 () Bool)

(declare-fun e!182717 () Bool)

(declare-fun e!182716 () Bool)

(assert (=> b!288588 (= e!182717 e!182716)))

(declare-fun res!150191 () Bool)

(assert (=> b!288588 (=> (not res!150191) (not e!182716))))

(declare-fun lt!142217 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!1988 0))(
  ( (MissingZero!1988 (index!10122 (_ BitVec 32))) (Found!1988 (index!10123 (_ BitVec 32))) (Intermediate!1988 (undefined!2800 Bool) (index!10124 (_ BitVec 32)) (x!28449 (_ BitVec 32))) (Undefined!1988) (MissingVacant!1988 (index!10125 (_ BitVec 32))) )
))
(declare-fun lt!142218 () SeekEntryResult!1988)

(assert (=> b!288588 (= res!150191 (or lt!142217 (= lt!142218 (MissingVacant!1988 i!1256))))))

(assert (=> b!288588 (= lt!142217 (= lt!142218 (MissingZero!1988 i!1256)))))

(declare-datatypes ((array!14493 0))(
  ( (array!14494 (arr!6874 (Array (_ BitVec 32) (_ BitVec 64))) (size!7226 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14493)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14493 (_ BitVec 32)) SeekEntryResult!1988)

(assert (=> b!288588 (= lt!142218 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288589 () Bool)

(declare-fun e!182714 () Bool)

(assert (=> b!288589 (= e!182716 e!182714)))

(declare-fun res!150186 () Bool)

(assert (=> b!288589 (=> (not res!150186) (not e!182714))))

(assert (=> b!288589 (= res!150186 lt!142217)))

(declare-fun lt!142216 () SeekEntryResult!1988)

(declare-fun lt!142220 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14493 (_ BitVec 32)) SeekEntryResult!1988)

(assert (=> b!288589 (= lt!142216 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142220 k0!2524 (array!14494 (store (arr!6874 a!3312) i!1256 k0!2524) (size!7226 a!3312)) mask!3809))))

(declare-fun lt!142219 () SeekEntryResult!1988)

(assert (=> b!288589 (= lt!142219 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142220 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288589 (= lt!142220 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288590 () Bool)

(declare-fun res!150190 () Bool)

(assert (=> b!288590 (=> (not res!150190) (not e!182717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288590 (= res!150190 (validKeyInArray!0 k0!2524))))

(declare-fun b!288591 () Bool)

(declare-fun e!182715 () Bool)

(assert (=> b!288591 (= e!182715 (not true))))

(assert (=> b!288591 (and (= (select (arr!6874 a!3312) (index!10124 lt!142219)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10124 lt!142219) i!1256))))

(declare-fun b!288592 () Bool)

(declare-fun res!150192 () Bool)

(assert (=> b!288592 (=> (not res!150192) (not e!182717))))

(assert (=> b!288592 (= res!150192 (and (= (size!7226 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7226 a!3312))))))

(declare-fun b!288593 () Bool)

(declare-fun res!150188 () Bool)

(assert (=> b!288593 (=> (not res!150188) (not e!182717))))

(declare-fun arrayContainsKey!0 (array!14493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288593 (= res!150188 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288594 () Bool)

(assert (=> b!288594 (= e!182714 e!182715)))

(declare-fun res!150185 () Bool)

(assert (=> b!288594 (=> (not res!150185) (not e!182715))))

(declare-fun lt!142221 () Bool)

(assert (=> b!288594 (= res!150185 (and (or lt!142221 (not (undefined!2800 lt!142219))) (or lt!142221 (not (= (select (arr!6874 a!3312) (index!10124 lt!142219)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142221 (not (= (select (arr!6874 a!3312) (index!10124 lt!142219)) k0!2524))) (not lt!142221)))))

(get-info :version)

(assert (=> b!288594 (= lt!142221 (not ((_ is Intermediate!1988) lt!142219)))))

(declare-fun res!150187 () Bool)

(assert (=> start!28174 (=> (not res!150187) (not e!182717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28174 (= res!150187 (validMask!0 mask!3809))))

(assert (=> start!28174 e!182717))

(assert (=> start!28174 true))

(declare-fun array_inv!4824 (array!14493) Bool)

(assert (=> start!28174 (array_inv!4824 a!3312)))

(declare-fun b!288595 () Bool)

(declare-fun res!150189 () Bool)

(assert (=> b!288595 (=> (not res!150189) (not e!182716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14493 (_ BitVec 32)) Bool)

(assert (=> b!288595 (= res!150189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28174 res!150187) b!288592))

(assert (= (and b!288592 res!150192) b!288590))

(assert (= (and b!288590 res!150190) b!288593))

(assert (= (and b!288593 res!150188) b!288588))

(assert (= (and b!288588 res!150191) b!288595))

(assert (= (and b!288595 res!150189) b!288589))

(assert (= (and b!288589 res!150186) b!288594))

(assert (= (and b!288594 res!150185) b!288591))

(declare-fun m!302969 () Bool)

(assert (=> b!288589 m!302969))

(declare-fun m!302971 () Bool)

(assert (=> b!288589 m!302971))

(declare-fun m!302973 () Bool)

(assert (=> b!288589 m!302973))

(declare-fun m!302975 () Bool)

(assert (=> b!288589 m!302975))

(declare-fun m!302977 () Bool)

(assert (=> b!288594 m!302977))

(assert (=> b!288591 m!302977))

(declare-fun m!302979 () Bool)

(assert (=> b!288590 m!302979))

(declare-fun m!302981 () Bool)

(assert (=> start!28174 m!302981))

(declare-fun m!302983 () Bool)

(assert (=> start!28174 m!302983))

(declare-fun m!302985 () Bool)

(assert (=> b!288588 m!302985))

(declare-fun m!302987 () Bool)

(assert (=> b!288595 m!302987))

(declare-fun m!302989 () Bool)

(assert (=> b!288593 m!302989))

(check-sat (not b!288589) (not start!28174) (not b!288588) (not b!288595) (not b!288593) (not b!288590))
(check-sat)
