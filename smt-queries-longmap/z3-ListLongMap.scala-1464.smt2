; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28172 () Bool)

(assert start!28172)

(declare-fun b!288421 () Bool)

(declare-fun res!150048 () Bool)

(declare-fun e!182617 () Bool)

(assert (=> b!288421 (=> (not res!150048) (not e!182617))))

(declare-datatypes ((array!14486 0))(
  ( (array!14487 (arr!6870 (Array (_ BitVec 32) (_ BitVec 64))) (size!7222 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14486)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14486 (_ BitVec 32)) Bool)

(assert (=> b!288421 (= res!150048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!150044 () Bool)

(declare-fun e!182614 () Bool)

(assert (=> start!28172 (=> (not res!150044) (not e!182614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28172 (= res!150044 (validMask!0 mask!3809))))

(assert (=> start!28172 e!182614))

(assert (=> start!28172 true))

(declare-fun array_inv!4833 (array!14486) Bool)

(assert (=> start!28172 (array_inv!4833 a!3312)))

(declare-fun b!288422 () Bool)

(declare-fun e!182615 () Bool)

(assert (=> b!288422 (= e!182615 (not true))))

(declare-datatypes ((SeekEntryResult!2019 0))(
  ( (MissingZero!2019 (index!10246 (_ BitVec 32))) (Found!2019 (index!10247 (_ BitVec 32))) (Intermediate!2019 (undefined!2831 Bool) (index!10248 (_ BitVec 32)) (x!28464 (_ BitVec 32))) (Undefined!2019) (MissingVacant!2019 (index!10249 (_ BitVec 32))) )
))
(declare-fun lt!142069 () SeekEntryResult!2019)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!288422 (and (= (select (arr!6870 a!3312) (index!10248 lt!142069)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10248 lt!142069) i!1256))))

(declare-fun b!288423 () Bool)

(declare-fun res!150049 () Bool)

(assert (=> b!288423 (=> (not res!150049) (not e!182614))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14486 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288423 (= res!150049 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288424 () Bool)

(declare-fun res!150047 () Bool)

(assert (=> b!288424 (=> (not res!150047) (not e!182614))))

(assert (=> b!288424 (= res!150047 (and (= (size!7222 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7222 a!3312))))))

(declare-fun b!288425 () Bool)

(declare-fun res!150050 () Bool)

(assert (=> b!288425 (=> (not res!150050) (not e!182614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288425 (= res!150050 (validKeyInArray!0 k0!2524))))

(declare-fun b!288426 () Bool)

(declare-fun e!182616 () Bool)

(assert (=> b!288426 (= e!182617 e!182616)))

(declare-fun res!150045 () Bool)

(assert (=> b!288426 (=> (not res!150045) (not e!182616))))

(declare-fun lt!142072 () Bool)

(assert (=> b!288426 (= res!150045 lt!142072)))

(declare-fun lt!142068 () SeekEntryResult!2019)

(declare-fun lt!142070 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14486 (_ BitVec 32)) SeekEntryResult!2019)

(assert (=> b!288426 (= lt!142068 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142070 k0!2524 (array!14487 (store (arr!6870 a!3312) i!1256 k0!2524) (size!7222 a!3312)) mask!3809))))

(assert (=> b!288426 (= lt!142069 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142070 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288426 (= lt!142070 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!288427 () Bool)

(assert (=> b!288427 (= e!182614 e!182617)))

(declare-fun res!150046 () Bool)

(assert (=> b!288427 (=> (not res!150046) (not e!182617))))

(declare-fun lt!142071 () SeekEntryResult!2019)

(assert (=> b!288427 (= res!150046 (or lt!142072 (= lt!142071 (MissingVacant!2019 i!1256))))))

(assert (=> b!288427 (= lt!142072 (= lt!142071 (MissingZero!2019 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14486 (_ BitVec 32)) SeekEntryResult!2019)

(assert (=> b!288427 (= lt!142071 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!288428 () Bool)

(assert (=> b!288428 (= e!182616 e!182615)))

(declare-fun res!150051 () Bool)

(assert (=> b!288428 (=> (not res!150051) (not e!182615))))

(declare-fun lt!142067 () Bool)

(assert (=> b!288428 (= res!150051 (and (or lt!142067 (not (undefined!2831 lt!142069))) (or lt!142067 (not (= (select (arr!6870 a!3312) (index!10248 lt!142069)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142067 (not (= (select (arr!6870 a!3312) (index!10248 lt!142069)) k0!2524))) (not lt!142067)))))

(get-info :version)

(assert (=> b!288428 (= lt!142067 (not ((_ is Intermediate!2019) lt!142069)))))

(assert (= (and start!28172 res!150044) b!288424))

(assert (= (and b!288424 res!150047) b!288425))

(assert (= (and b!288425 res!150050) b!288423))

(assert (= (and b!288423 res!150049) b!288427))

(assert (= (and b!288427 res!150046) b!288421))

(assert (= (and b!288421 res!150048) b!288426))

(assert (= (and b!288426 res!150045) b!288428))

(assert (= (and b!288428 res!150051) b!288422))

(declare-fun m!302653 () Bool)

(assert (=> b!288426 m!302653))

(declare-fun m!302655 () Bool)

(assert (=> b!288426 m!302655))

(declare-fun m!302657 () Bool)

(assert (=> b!288426 m!302657))

(declare-fun m!302659 () Bool)

(assert (=> b!288426 m!302659))

(declare-fun m!302661 () Bool)

(assert (=> b!288428 m!302661))

(declare-fun m!302663 () Bool)

(assert (=> b!288427 m!302663))

(declare-fun m!302665 () Bool)

(assert (=> start!28172 m!302665))

(declare-fun m!302667 () Bool)

(assert (=> start!28172 m!302667))

(declare-fun m!302669 () Bool)

(assert (=> b!288423 m!302669))

(declare-fun m!302671 () Bool)

(assert (=> b!288425 m!302671))

(assert (=> b!288422 m!302661))

(declare-fun m!302673 () Bool)

(assert (=> b!288421 m!302673))

(check-sat (not b!288425) (not b!288421) (not start!28172) (not b!288427) (not b!288423) (not b!288426))
(check-sat)
