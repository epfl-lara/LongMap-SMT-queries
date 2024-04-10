; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28220 () Bool)

(assert start!28220)

(declare-fun b!288997 () Bool)

(declare-fun res!150626 () Bool)

(declare-fun e!182976 () Bool)

(assert (=> b!288997 (=> (not res!150626) (not e!182976))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288997 (= res!150626 (validKeyInArray!0 k0!2524))))

(declare-fun b!288998 () Bool)

(declare-fun e!182977 () Bool)

(declare-fun e!182975 () Bool)

(assert (=> b!288998 (= e!182977 e!182975)))

(declare-fun res!150624 () Bool)

(assert (=> b!288998 (=> (not res!150624) (not e!182975))))

(declare-fun lt!142499 () Bool)

(declare-datatypes ((array!14534 0))(
  ( (array!14535 (arr!6894 (Array (_ BitVec 32) (_ BitVec 64))) (size!7246 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14534)

(declare-datatypes ((SeekEntryResult!2043 0))(
  ( (MissingZero!2043 (index!10342 (_ BitVec 32))) (Found!2043 (index!10343 (_ BitVec 32))) (Intermediate!2043 (undefined!2855 Bool) (index!10344 (_ BitVec 32)) (x!28552 (_ BitVec 32))) (Undefined!2043) (MissingVacant!2043 (index!10345 (_ BitVec 32))) )
))
(declare-fun lt!142501 () SeekEntryResult!2043)

(assert (=> b!288998 (= res!150624 (and (or lt!142499 (not (undefined!2855 lt!142501))) (or lt!142499 (not (= (select (arr!6894 a!3312) (index!10344 lt!142501)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142499 (not (= (select (arr!6894 a!3312) (index!10344 lt!142501)) k0!2524))) (not lt!142499)))))

(get-info :version)

(assert (=> b!288998 (= lt!142499 (not ((_ is Intermediate!2043) lt!142501)))))

(declare-fun res!150625 () Bool)

(assert (=> start!28220 (=> (not res!150625) (not e!182976))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28220 (= res!150625 (validMask!0 mask!3809))))

(assert (=> start!28220 e!182976))

(assert (=> start!28220 true))

(declare-fun array_inv!4857 (array!14534) Bool)

(assert (=> start!28220 (array_inv!4857 a!3312)))

(declare-fun b!288999 () Bool)

(declare-fun res!150621 () Bool)

(assert (=> b!288999 (=> (not res!150621) (not e!182976))))

(declare-fun arrayContainsKey!0 (array!14534 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288999 (= res!150621 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289000 () Bool)

(assert (=> b!289000 (= e!182975 (not true))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289000 (and (= (select (arr!6894 a!3312) (index!10344 lt!142501)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10344 lt!142501) i!1256))))

(declare-fun b!289001 () Bool)

(declare-fun e!182978 () Bool)

(assert (=> b!289001 (= e!182976 e!182978)))

(declare-fun res!150623 () Bool)

(assert (=> b!289001 (=> (not res!150623) (not e!182978))))

(declare-fun lt!142500 () SeekEntryResult!2043)

(declare-fun lt!142502 () Bool)

(assert (=> b!289001 (= res!150623 (or lt!142502 (= lt!142500 (MissingVacant!2043 i!1256))))))

(assert (=> b!289001 (= lt!142502 (= lt!142500 (MissingZero!2043 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14534 (_ BitVec 32)) SeekEntryResult!2043)

(assert (=> b!289001 (= lt!142500 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289002 () Bool)

(declare-fun res!150627 () Bool)

(assert (=> b!289002 (=> (not res!150627) (not e!182978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14534 (_ BitVec 32)) Bool)

(assert (=> b!289002 (= res!150627 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289003 () Bool)

(assert (=> b!289003 (= e!182978 e!182977)))

(declare-fun res!150622 () Bool)

(assert (=> b!289003 (=> (not res!150622) (not e!182977))))

(assert (=> b!289003 (= res!150622 lt!142502)))

(declare-fun lt!142503 () SeekEntryResult!2043)

(declare-fun lt!142504 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14534 (_ BitVec 32)) SeekEntryResult!2043)

(assert (=> b!289003 (= lt!142503 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142504 k0!2524 (array!14535 (store (arr!6894 a!3312) i!1256 k0!2524) (size!7246 a!3312)) mask!3809))))

(assert (=> b!289003 (= lt!142501 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142504 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289003 (= lt!142504 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289004 () Bool)

(declare-fun res!150620 () Bool)

(assert (=> b!289004 (=> (not res!150620) (not e!182976))))

(assert (=> b!289004 (= res!150620 (and (= (size!7246 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7246 a!3312))))))

(assert (= (and start!28220 res!150625) b!289004))

(assert (= (and b!289004 res!150620) b!288997))

(assert (= (and b!288997 res!150626) b!288999))

(assert (= (and b!288999 res!150621) b!289001))

(assert (= (and b!289001 res!150623) b!289002))

(assert (= (and b!289002 res!150627) b!289003))

(assert (= (and b!289003 res!150622) b!288998))

(assert (= (and b!288998 res!150624) b!289000))

(declare-fun m!303181 () Bool)

(assert (=> b!289000 m!303181))

(declare-fun m!303183 () Bool)

(assert (=> start!28220 m!303183))

(declare-fun m!303185 () Bool)

(assert (=> start!28220 m!303185))

(declare-fun m!303187 () Bool)

(assert (=> b!289001 m!303187))

(declare-fun m!303189 () Bool)

(assert (=> b!288997 m!303189))

(declare-fun m!303191 () Bool)

(assert (=> b!288999 m!303191))

(assert (=> b!288998 m!303181))

(declare-fun m!303193 () Bool)

(assert (=> b!289003 m!303193))

(declare-fun m!303195 () Bool)

(assert (=> b!289003 m!303195))

(declare-fun m!303197 () Bool)

(assert (=> b!289003 m!303197))

(declare-fun m!303199 () Bool)

(assert (=> b!289003 m!303199))

(declare-fun m!303201 () Bool)

(assert (=> b!289002 m!303201))

(check-sat (not b!288999) (not b!289003) (not b!288997) (not b!289002) (not b!289001) (not start!28220))
(check-sat)
