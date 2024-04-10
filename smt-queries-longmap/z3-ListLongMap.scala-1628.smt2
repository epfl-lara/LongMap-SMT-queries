; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30550 () Bool)

(assert start!30550)

(declare-fun b!305914 () Bool)

(declare-datatypes ((Unit!9451 0))(
  ( (Unit!9452) )
))
(declare-fun e!191993 () Unit!9451)

(declare-fun e!191995 () Unit!9451)

(assert (=> b!305914 (= e!191993 e!191995)))

(declare-fun c!49074 () Bool)

(declare-datatypes ((array!15554 0))(
  ( (array!15555 (arr!7362 (Array (_ BitVec 32) (_ BitVec 64))) (size!7714 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15554)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305914 (= c!49074 (or (= (select (arr!7362 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7362 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305915 () Bool)

(declare-fun res!162972 () Bool)

(declare-fun e!191991 () Bool)

(assert (=> b!305915 (=> (not res!162972) (not e!191991))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!305915 (= res!162972 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7362 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun res!162980 () Bool)

(declare-fun e!191994 () Bool)

(assert (=> start!30550 (=> (not res!162980) (not e!191994))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30550 (= res!162980 (validMask!0 mask!3709))))

(assert (=> start!30550 e!191994))

(declare-fun array_inv!5325 (array!15554) Bool)

(assert (=> start!30550 (array_inv!5325 a!3293)))

(assert (=> start!30550 true))

(declare-fun b!305916 () Bool)

(assert (=> b!305916 (= e!191991 (not (or (not (= (select (arr!7362 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!305916 (= index!1781 resIndex!52)))

(declare-fun lt!150850 () Unit!9451)

(assert (=> b!305916 (= lt!150850 e!191993)))

(declare-fun c!49073 () Bool)

(assert (=> b!305916 (= c!49073 (not (= resIndex!52 index!1781)))))

(declare-fun b!305917 () Bool)

(assert (=> b!305917 (= e!191994 e!191991)))

(declare-fun res!162978 () Bool)

(assert (=> b!305917 (=> (not res!162978) (not e!191991))))

(declare-datatypes ((SeekEntryResult!2502 0))(
  ( (MissingZero!2502 (index!12184 (_ BitVec 32))) (Found!2502 (index!12185 (_ BitVec 32))) (Intermediate!2502 (undefined!3314 Bool) (index!12186 (_ BitVec 32)) (x!30441 (_ BitVec 32))) (Undefined!2502) (MissingVacant!2502 (index!12187 (_ BitVec 32))) )
))
(declare-fun lt!150851 () SeekEntryResult!2502)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15554 (_ BitVec 32)) SeekEntryResult!2502)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305917 (= res!162978 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150851))))

(assert (=> b!305917 (= lt!150851 (Intermediate!2502 false resIndex!52 resX!52))))

(declare-fun b!305918 () Bool)

(assert (=> b!305918 false))

(declare-fun Unit!9453 () Unit!9451)

(assert (=> b!305918 (= e!191995 Unit!9453)))

(declare-fun b!305919 () Bool)

(declare-fun res!162976 () Bool)

(assert (=> b!305919 (=> (not res!162976) (not e!191994))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305919 (= res!162976 (validKeyInArray!0 k0!2441))))

(declare-fun b!305920 () Bool)

(declare-fun Unit!9454 () Unit!9451)

(assert (=> b!305920 (= e!191993 Unit!9454)))

(declare-fun b!305921 () Bool)

(declare-fun res!162981 () Bool)

(assert (=> b!305921 (=> (not res!162981) (not e!191994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15554 (_ BitVec 32)) Bool)

(assert (=> b!305921 (= res!162981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!305922 () Bool)

(declare-fun res!162977 () Bool)

(assert (=> b!305922 (=> (not res!162977) (not e!191994))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15554 (_ BitVec 32)) SeekEntryResult!2502)

(assert (=> b!305922 (= res!162977 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2502 i!1240)))))

(declare-fun b!305923 () Bool)

(declare-fun res!162979 () Bool)

(assert (=> b!305923 (=> (not res!162979) (not e!191994))))

(declare-fun arrayContainsKey!0 (array!15554 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305923 (= res!162979 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305924 () Bool)

(declare-fun res!162973 () Bool)

(assert (=> b!305924 (=> (not res!162973) (not e!191994))))

(assert (=> b!305924 (= res!162973 (and (= (size!7714 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7714 a!3293))))))

(declare-fun b!305925 () Bool)

(declare-fun res!162974 () Bool)

(assert (=> b!305925 (=> (not res!162974) (not e!191991))))

(assert (=> b!305925 (= res!162974 (and (= (select (arr!7362 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7714 a!3293))))))

(declare-fun b!305926 () Bool)

(declare-fun res!162975 () Bool)

(assert (=> b!305926 (=> (not res!162975) (not e!191991))))

(assert (=> b!305926 (= res!162975 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150851))))

(declare-fun b!305927 () Bool)

(assert (=> b!305927 false))

(declare-fun lt!150852 () SeekEntryResult!2502)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305927 (= lt!150852 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9455 () Unit!9451)

(assert (=> b!305927 (= e!191995 Unit!9455)))

(assert (= (and start!30550 res!162980) b!305924))

(assert (= (and b!305924 res!162973) b!305919))

(assert (= (and b!305919 res!162976) b!305923))

(assert (= (and b!305923 res!162979) b!305922))

(assert (= (and b!305922 res!162977) b!305921))

(assert (= (and b!305921 res!162981) b!305917))

(assert (= (and b!305917 res!162978) b!305925))

(assert (= (and b!305925 res!162974) b!305926))

(assert (= (and b!305926 res!162975) b!305915))

(assert (= (and b!305915 res!162972) b!305916))

(assert (= (and b!305916 c!49073) b!305914))

(assert (= (and b!305916 (not c!49073)) b!305920))

(assert (= (and b!305914 c!49074) b!305918))

(assert (= (and b!305914 (not c!49074)) b!305927))

(declare-fun m!316705 () Bool)

(assert (=> b!305922 m!316705))

(declare-fun m!316707 () Bool)

(assert (=> b!305914 m!316707))

(declare-fun m!316709 () Bool)

(assert (=> b!305925 m!316709))

(assert (=> b!305915 m!316707))

(declare-fun m!316711 () Bool)

(assert (=> b!305921 m!316711))

(declare-fun m!316713 () Bool)

(assert (=> b!305919 m!316713))

(declare-fun m!316715 () Bool)

(assert (=> start!30550 m!316715))

(declare-fun m!316717 () Bool)

(assert (=> start!30550 m!316717))

(declare-fun m!316719 () Bool)

(assert (=> b!305917 m!316719))

(assert (=> b!305917 m!316719))

(declare-fun m!316721 () Bool)

(assert (=> b!305917 m!316721))

(declare-fun m!316723 () Bool)

(assert (=> b!305927 m!316723))

(assert (=> b!305927 m!316723))

(declare-fun m!316725 () Bool)

(assert (=> b!305927 m!316725))

(declare-fun m!316727 () Bool)

(assert (=> b!305923 m!316727))

(declare-fun m!316729 () Bool)

(assert (=> b!305926 m!316729))

(assert (=> b!305916 m!316707))

(check-sat (not b!305922) (not b!305926) (not b!305927) (not start!30550) (not b!305921) (not b!305923) (not b!305919) (not b!305917))
(check-sat)
