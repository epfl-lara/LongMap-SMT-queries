; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28262 () Bool)

(assert start!28262)

(declare-fun res!151115 () Bool)

(declare-fun e!183306 () Bool)

(assert (=> start!28262 (=> (not res!151115) (not e!183306))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28262 (= res!151115 (validMask!0 mask!3809))))

(assert (=> start!28262 e!183306))

(assert (=> start!28262 true))

(declare-datatypes ((array!14576 0))(
  ( (array!14577 (arr!6915 (Array (_ BitVec 32) (_ BitVec 64))) (size!7267 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14576)

(declare-fun array_inv!4878 (array!14576) Bool)

(assert (=> start!28262 (array_inv!4878 a!3312)))

(declare-fun b!289543 () Bool)

(declare-datatypes ((Unit!9100 0))(
  ( (Unit!9101) )
))
(declare-fun e!183304 () Unit!9100)

(declare-fun Unit!9102 () Unit!9100)

(assert (=> b!289543 (= e!183304 Unit!9102)))

(assert (=> b!289543 false))

(declare-fun b!289544 () Bool)

(assert (=> b!289544 false))

(declare-fun e!183303 () Unit!9100)

(declare-fun Unit!9103 () Unit!9100)

(assert (=> b!289544 (= e!183303 Unit!9103)))

(declare-fun b!289545 () Bool)

(declare-fun res!151113 () Bool)

(assert (=> b!289545 (=> (not res!151113) (not e!183306))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289545 (= res!151113 (and (= (size!7267 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7267 a!3312))))))

(declare-datatypes ((SeekEntryResult!2064 0))(
  ( (MissingZero!2064 (index!10426 (_ BitVec 32))) (Found!2064 (index!10427 (_ BitVec 32))) (Intermediate!2064 (undefined!2876 Bool) (index!10428 (_ BitVec 32)) (x!28629 (_ BitVec 32))) (Undefined!2064) (MissingVacant!2064 (index!10429 (_ BitVec 32))) )
))
(declare-fun lt!142893 () SeekEntryResult!2064)

(declare-fun e!183307 () Bool)

(declare-fun lt!142897 () SeekEntryResult!2064)

(declare-fun b!289546 () Bool)

(assert (=> b!289546 (= e!183307 (and (= lt!142893 lt!142897) (bvslt mask!3809 #b00000000000000000000000000000000)))))

(declare-fun lt!142895 () Unit!9100)

(assert (=> b!289546 (= lt!142895 e!183304)))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun c!46778 () Bool)

(get-info :version)

(assert (=> b!289546 (= c!46778 (or (and ((_ is Intermediate!2064) lt!142897) (undefined!2876 lt!142897)) (and ((_ is Intermediate!2064) lt!142897) (= (select (arr!6915 a!3312) (index!10428 lt!142897)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2064) lt!142897) (= (select (arr!6915 a!3312) (index!10428 lt!142897)) k0!2524))))))

(declare-fun b!289547 () Bool)

(assert (=> b!289547 (= e!183304 e!183303)))

(declare-fun c!46779 () Bool)

(assert (=> b!289547 (= c!46779 ((_ is Intermediate!2064) lt!142897))))

(declare-fun b!289548 () Bool)

(declare-fun e!183305 () Bool)

(assert (=> b!289548 (= e!183306 e!183305)))

(declare-fun res!151116 () Bool)

(assert (=> b!289548 (=> (not res!151116) (not e!183305))))

(declare-fun lt!142896 () Bool)

(declare-fun lt!142894 () SeekEntryResult!2064)

(assert (=> b!289548 (= res!151116 (or lt!142896 (= lt!142894 (MissingVacant!2064 i!1256))))))

(assert (=> b!289548 (= lt!142896 (= lt!142894 (MissingZero!2064 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14576 (_ BitVec 32)) SeekEntryResult!2064)

(assert (=> b!289548 (= lt!142894 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289549 () Bool)

(declare-fun res!151111 () Bool)

(assert (=> b!289549 (=> (not res!151111) (not e!183306))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289549 (= res!151111 (validKeyInArray!0 k0!2524))))

(declare-fun b!289550 () Bool)

(assert (=> b!289550 (= e!183305 e!183307)))

(declare-fun res!151114 () Bool)

(assert (=> b!289550 (=> (not res!151114) (not e!183307))))

(assert (=> b!289550 (= res!151114 lt!142896)))

(declare-fun lt!142891 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14576 (_ BitVec 32)) SeekEntryResult!2064)

(assert (=> b!289550 (= lt!142893 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142891 k0!2524 (array!14577 (store (arr!6915 a!3312) i!1256 k0!2524) (size!7267 a!3312)) mask!3809))))

(assert (=> b!289550 (= lt!142897 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142891 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289550 (= lt!142891 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289551 () Bool)

(declare-fun res!151112 () Bool)

(assert (=> b!289551 (=> (not res!151112) (not e!183306))))

(declare-fun arrayContainsKey!0 (array!14576 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289551 (= res!151112 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289552 () Bool)

(assert (=> b!289552 (and (= lt!142893 lt!142897) (= (select (store (arr!6915 a!3312) i!1256 k0!2524) (index!10428 lt!142897)) k0!2524))))

(declare-fun lt!142892 () Unit!9100)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14576 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9100)

(assert (=> b!289552 (= lt!142892 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!142891 (index!10428 lt!142897) (x!28629 lt!142897) mask!3809))))

(assert (=> b!289552 (and (= (select (arr!6915 a!3312) (index!10428 lt!142897)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10428 lt!142897) i!1256))))

(declare-fun Unit!9104 () Unit!9100)

(assert (=> b!289552 (= e!183303 Unit!9104)))

(declare-fun b!289553 () Bool)

(declare-fun res!151110 () Bool)

(assert (=> b!289553 (=> (not res!151110) (not e!183305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14576 (_ BitVec 32)) Bool)

(assert (=> b!289553 (= res!151110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28262 res!151115) b!289545))

(assert (= (and b!289545 res!151113) b!289549))

(assert (= (and b!289549 res!151111) b!289551))

(assert (= (and b!289551 res!151112) b!289548))

(assert (= (and b!289548 res!151116) b!289553))

(assert (= (and b!289553 res!151110) b!289550))

(assert (= (and b!289550 res!151114) b!289546))

(assert (= (and b!289546 c!46778) b!289543))

(assert (= (and b!289546 (not c!46778)) b!289547))

(assert (= (and b!289547 c!46779) b!289552))

(assert (= (and b!289547 (not c!46779)) b!289544))

(declare-fun m!303659 () Bool)

(assert (=> b!289546 m!303659))

(declare-fun m!303661 () Bool)

(assert (=> b!289549 m!303661))

(declare-fun m!303663 () Bool)

(assert (=> start!28262 m!303663))

(declare-fun m!303665 () Bool)

(assert (=> start!28262 m!303665))

(declare-fun m!303667 () Bool)

(assert (=> b!289551 m!303667))

(declare-fun m!303669 () Bool)

(assert (=> b!289553 m!303669))

(declare-fun m!303671 () Bool)

(assert (=> b!289548 m!303671))

(declare-fun m!303673 () Bool)

(assert (=> b!289550 m!303673))

(declare-fun m!303675 () Bool)

(assert (=> b!289550 m!303675))

(declare-fun m!303677 () Bool)

(assert (=> b!289550 m!303677))

(declare-fun m!303679 () Bool)

(assert (=> b!289550 m!303679))

(assert (=> b!289552 m!303673))

(declare-fun m!303681 () Bool)

(assert (=> b!289552 m!303681))

(declare-fun m!303683 () Bool)

(assert (=> b!289552 m!303683))

(assert (=> b!289552 m!303659))

(check-sat (not b!289552) (not b!289549) (not b!289553) (not b!289550) (not start!28262) (not b!289548) (not b!289551))
(check-sat)
