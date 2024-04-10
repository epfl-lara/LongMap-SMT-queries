; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31084 () Bool)

(assert start!31084)

(declare-fun b!312797 () Bool)

(declare-fun e!194998 () Bool)

(declare-fun e!195001 () Bool)

(assert (=> b!312797 (= e!194998 e!195001)))

(declare-fun res!169256 () Bool)

(assert (=> b!312797 (=> (not res!169256) (not e!195001))))

(declare-datatypes ((array!15986 0))(
  ( (array!15987 (arr!7575 (Array (_ BitVec 32) (_ BitVec 64))) (size!7927 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15986)

(declare-datatypes ((SeekEntryResult!2715 0))(
  ( (MissingZero!2715 (index!13036 (_ BitVec 32))) (Found!2715 (index!13037 (_ BitVec 32))) (Intermediate!2715 (undefined!3527 Bool) (index!13038 (_ BitVec 32)) (x!31240 (_ BitVec 32))) (Undefined!2715) (MissingVacant!2715 (index!13039 (_ BitVec 32))) )
))
(declare-fun lt!153320 () SeekEntryResult!2715)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!153321 () SeekEntryResult!2715)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312797 (= res!169256 (and (= lt!153321 lt!153320) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7575 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15986 (_ BitVec 32)) SeekEntryResult!2715)

(assert (=> b!312797 (= lt!153321 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312798 () Bool)

(declare-fun res!169255 () Bool)

(declare-fun e!194999 () Bool)

(assert (=> b!312798 (=> (not res!169255) (not e!194999))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312798 (= res!169255 (validKeyInArray!0 k0!2441))))

(declare-fun b!312799 () Bool)

(declare-fun res!169251 () Bool)

(assert (=> b!312799 (=> (not res!169251) (not e!194998))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!312799 (= res!169251 (and (= (select (arr!7575 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7927 a!3293))))))

(declare-fun b!312800 () Bool)

(declare-fun res!169258 () Bool)

(assert (=> b!312800 (=> (not res!169258) (not e!194999))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15986 (_ BitVec 32)) Bool)

(assert (=> b!312800 (= res!169258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!169252 () Bool)

(assert (=> start!31084 (=> (not res!169252) (not e!194999))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31084 (= res!169252 (validMask!0 mask!3709))))

(assert (=> start!31084 e!194999))

(declare-fun array_inv!5538 (array!15986) Bool)

(assert (=> start!31084 (array_inv!5538 a!3293)))

(assert (=> start!31084 true))

(declare-fun b!312801 () Bool)

(declare-fun res!169259 () Bool)

(assert (=> b!312801 (=> (not res!169259) (not e!194999))))

(assert (=> b!312801 (= res!169259 (and (= (size!7927 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7927 a!3293))))))

(declare-fun b!312802 () Bool)

(declare-fun e!194997 () Bool)

(assert (=> b!312802 (= e!194997 true)))

(declare-fun lt!153317 () SeekEntryResult!2715)

(declare-fun lt!153318 () SeekEntryResult!2715)

(assert (=> b!312802 (= lt!153317 lt!153318)))

(declare-datatypes ((Unit!9661 0))(
  ( (Unit!9662) )
))
(declare-fun lt!153314 () Unit!9661)

(declare-fun lt!153316 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15986 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9661)

(assert (=> b!312802 (= lt!153314 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153316 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312803 () Bool)

(assert (=> b!312803 (= e!194999 e!194998)))

(declare-fun res!169253 () Bool)

(assert (=> b!312803 (=> (not res!169253) (not e!194998))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312803 (= res!169253 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153320))))

(assert (=> b!312803 (= lt!153320 (Intermediate!2715 false resIndex!52 resX!52))))

(declare-fun b!312804 () Bool)

(declare-fun res!169260 () Bool)

(assert (=> b!312804 (=> (not res!169260) (not e!194999))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15986 (_ BitVec 32)) SeekEntryResult!2715)

(assert (=> b!312804 (= res!169260 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2715 i!1240)))))

(declare-fun b!312805 () Bool)

(declare-fun res!169254 () Bool)

(assert (=> b!312805 (=> (not res!169254) (not e!194999))))

(declare-fun arrayContainsKey!0 (array!15986 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312805 (= res!169254 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312806 () Bool)

(assert (=> b!312806 (= e!195001 (not e!194997))))

(declare-fun res!169257 () Bool)

(assert (=> b!312806 (=> res!169257 e!194997)))

(assert (=> b!312806 (= res!169257 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153316 #b00000000000000000000000000000000) (bvsge lt!153316 (size!7927 a!3293)) (not (= lt!153318 lt!153320))))))

(declare-fun lt!153319 () SeekEntryResult!2715)

(assert (=> b!312806 (= lt!153319 lt!153317)))

(declare-fun lt!153315 () array!15986)

(assert (=> b!312806 (= lt!153317 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153316 k0!2441 lt!153315 mask!3709))))

(assert (=> b!312806 (= lt!153319 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!153315 mask!3709))))

(assert (=> b!312806 (= lt!153315 (array!15987 (store (arr!7575 a!3293) i!1240 k0!2441) (size!7927 a!3293)))))

(assert (=> b!312806 (= lt!153321 lt!153318)))

(assert (=> b!312806 (= lt!153318 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153316 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312806 (= lt!153316 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!31084 res!169252) b!312801))

(assert (= (and b!312801 res!169259) b!312798))

(assert (= (and b!312798 res!169255) b!312805))

(assert (= (and b!312805 res!169254) b!312804))

(assert (= (and b!312804 res!169260) b!312800))

(assert (= (and b!312800 res!169258) b!312803))

(assert (= (and b!312803 res!169253) b!312799))

(assert (= (and b!312799 res!169251) b!312797))

(assert (= (and b!312797 res!169256) b!312806))

(assert (= (and b!312806 (not res!169257)) b!312802))

(declare-fun m!322929 () Bool)

(assert (=> b!312798 m!322929))

(declare-fun m!322931 () Bool)

(assert (=> b!312799 m!322931))

(declare-fun m!322933 () Bool)

(assert (=> b!312805 m!322933))

(declare-fun m!322935 () Bool)

(assert (=> b!312806 m!322935))

(declare-fun m!322937 () Bool)

(assert (=> b!312806 m!322937))

(declare-fun m!322939 () Bool)

(assert (=> b!312806 m!322939))

(declare-fun m!322941 () Bool)

(assert (=> b!312806 m!322941))

(declare-fun m!322943 () Bool)

(assert (=> b!312806 m!322943))

(declare-fun m!322945 () Bool)

(assert (=> b!312804 m!322945))

(declare-fun m!322947 () Bool)

(assert (=> start!31084 m!322947))

(declare-fun m!322949 () Bool)

(assert (=> start!31084 m!322949))

(declare-fun m!322951 () Bool)

(assert (=> b!312797 m!322951))

(declare-fun m!322953 () Bool)

(assert (=> b!312797 m!322953))

(declare-fun m!322955 () Bool)

(assert (=> b!312802 m!322955))

(declare-fun m!322957 () Bool)

(assert (=> b!312800 m!322957))

(declare-fun m!322959 () Bool)

(assert (=> b!312803 m!322959))

(assert (=> b!312803 m!322959))

(declare-fun m!322961 () Bool)

(assert (=> b!312803 m!322961))

(check-sat (not start!31084) (not b!312805) (not b!312800) (not b!312803) (not b!312802) (not b!312797) (not b!312806) (not b!312804) (not b!312798))
(check-sat)
