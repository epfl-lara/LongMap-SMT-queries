; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30540 () Bool)

(assert start!30540)

(declare-fun b!305945 () Bool)

(declare-fun res!163037 () Bool)

(declare-fun e!191991 () Bool)

(assert (=> b!305945 (=> (not res!163037) (not e!191991))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!305945 (= res!163037 (validKeyInArray!0 k0!2441))))

(declare-fun b!305946 () Bool)

(declare-datatypes ((Unit!9423 0))(
  ( (Unit!9424) )
))
(declare-fun e!191988 () Unit!9423)

(declare-fun e!191990 () Unit!9423)

(assert (=> b!305946 (= e!191988 e!191990)))

(declare-fun c!49061 () Bool)

(declare-datatypes ((array!15557 0))(
  ( (array!15558 (arr!7363 (Array (_ BitVec 32) (_ BitVec 64))) (size!7715 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15557)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!305946 (= c!49061 (or (= (select (arr!7363 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7363 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!305947 () Bool)

(declare-fun res!163030 () Bool)

(assert (=> b!305947 (=> (not res!163030) (not e!191991))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2468 0))(
  ( (MissingZero!2468 (index!12048 (_ BitVec 32))) (Found!2468 (index!12049 (_ BitVec 32))) (Intermediate!2468 (undefined!3280 Bool) (index!12050 (_ BitVec 32)) (x!30412 (_ BitVec 32))) (Undefined!2468) (MissingVacant!2468 (index!12051 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15557 (_ BitVec 32)) SeekEntryResult!2468)

(assert (=> b!305947 (= res!163030 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2468 i!1240)))))

(declare-fun b!305948 () Bool)

(declare-fun res!163031 () Bool)

(declare-fun e!191989 () Bool)

(assert (=> b!305948 (=> (not res!163031) (not e!191989))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!305948 (= res!163031 (and (= (select (arr!7363 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7715 a!3293))))))

(declare-fun b!305949 () Bool)

(assert (=> b!305949 (= e!191989 (not (or (not (= (select (arr!7363 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsle x!1427 #b01111111111111111111111111111110))))))

(assert (=> b!305949 (= index!1781 resIndex!52)))

(declare-fun lt!150888 () Unit!9423)

(assert (=> b!305949 (= lt!150888 e!191988)))

(declare-fun c!49060 () Bool)

(assert (=> b!305949 (= c!49060 (not (= resIndex!52 index!1781)))))

(declare-fun b!305950 () Bool)

(assert (=> b!305950 false))

(declare-fun Unit!9425 () Unit!9423)

(assert (=> b!305950 (= e!191990 Unit!9425)))

(declare-fun b!305951 () Bool)

(assert (=> b!305951 false))

(declare-fun lt!150886 () SeekEntryResult!2468)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15557 (_ BitVec 32)) SeekEntryResult!2468)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305951 (= lt!150886 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9426 () Unit!9423)

(assert (=> b!305951 (= e!191990 Unit!9426)))

(declare-fun b!305952 () Bool)

(declare-fun res!163032 () Bool)

(assert (=> b!305952 (=> (not res!163032) (not e!191991))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15557 (_ BitVec 32)) Bool)

(assert (=> b!305952 (= res!163032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!163029 () Bool)

(assert (=> start!30540 (=> (not res!163029) (not e!191991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30540 (= res!163029 (validMask!0 mask!3709))))

(assert (=> start!30540 e!191991))

(declare-fun array_inv!5313 (array!15557) Bool)

(assert (=> start!30540 (array_inv!5313 a!3293)))

(assert (=> start!30540 true))

(declare-fun b!305953 () Bool)

(declare-fun res!163033 () Bool)

(assert (=> b!305953 (=> (not res!163033) (not e!191989))))

(assert (=> b!305953 (= res!163033 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7363 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!305954 () Bool)

(declare-fun res!163038 () Bool)

(assert (=> b!305954 (=> (not res!163038) (not e!191991))))

(assert (=> b!305954 (= res!163038 (and (= (size!7715 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7715 a!3293))))))

(declare-fun b!305955 () Bool)

(declare-fun res!163034 () Bool)

(assert (=> b!305955 (=> (not res!163034) (not e!191989))))

(declare-fun lt!150887 () SeekEntryResult!2468)

(assert (=> b!305955 (= res!163034 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150887))))

(declare-fun b!305956 () Bool)

(declare-fun res!163035 () Bool)

(assert (=> b!305956 (=> (not res!163035) (not e!191991))))

(declare-fun arrayContainsKey!0 (array!15557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!305956 (= res!163035 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!305957 () Bool)

(declare-fun Unit!9427 () Unit!9423)

(assert (=> b!305957 (= e!191988 Unit!9427)))

(declare-fun b!305958 () Bool)

(assert (=> b!305958 (= e!191991 e!191989)))

(declare-fun res!163036 () Bool)

(assert (=> b!305958 (=> (not res!163036) (not e!191989))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!305958 (= res!163036 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150887))))

(assert (=> b!305958 (= lt!150887 (Intermediate!2468 false resIndex!52 resX!52))))

(assert (= (and start!30540 res!163029) b!305954))

(assert (= (and b!305954 res!163038) b!305945))

(assert (= (and b!305945 res!163037) b!305956))

(assert (= (and b!305956 res!163035) b!305947))

(assert (= (and b!305947 res!163030) b!305952))

(assert (= (and b!305952 res!163032) b!305958))

(assert (= (and b!305958 res!163036) b!305948))

(assert (= (and b!305948 res!163031) b!305955))

(assert (= (and b!305955 res!163034) b!305953))

(assert (= (and b!305953 res!163033) b!305949))

(assert (= (and b!305949 c!49060) b!305946))

(assert (= (and b!305949 (not c!49060)) b!305957))

(assert (= (and b!305946 c!49061) b!305950))

(assert (= (and b!305946 (not c!49061)) b!305951))

(declare-fun m!316879 () Bool)

(assert (=> b!305958 m!316879))

(assert (=> b!305958 m!316879))

(declare-fun m!316881 () Bool)

(assert (=> b!305958 m!316881))

(declare-fun m!316883 () Bool)

(assert (=> b!305953 m!316883))

(declare-fun m!316885 () Bool)

(assert (=> start!30540 m!316885))

(declare-fun m!316887 () Bool)

(assert (=> start!30540 m!316887))

(declare-fun m!316889 () Bool)

(assert (=> b!305945 m!316889))

(assert (=> b!305946 m!316883))

(assert (=> b!305949 m!316883))

(declare-fun m!316891 () Bool)

(assert (=> b!305947 m!316891))

(declare-fun m!316893 () Bool)

(assert (=> b!305948 m!316893))

(declare-fun m!316895 () Bool)

(assert (=> b!305956 m!316895))

(declare-fun m!316897 () Bool)

(assert (=> b!305955 m!316897))

(declare-fun m!316899 () Bool)

(assert (=> b!305952 m!316899))

(declare-fun m!316901 () Bool)

(assert (=> b!305951 m!316901))

(assert (=> b!305951 m!316901))

(declare-fun m!316903 () Bool)

(assert (=> b!305951 m!316903))

(check-sat (not b!305945) (not start!30540) (not b!305955) (not b!305956) (not b!305958) (not b!305951) (not b!305952) (not b!305947))
(check-sat)
