; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30546 () Bool)

(assert start!30546)

(declare-fun b!306071 () Bool)

(assert (=> b!306071 false))

(declare-datatypes ((array!15563 0))(
  ( (array!15564 (arr!7366 (Array (_ BitVec 32) (_ BitVec 64))) (size!7718 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15563)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2471 0))(
  ( (MissingZero!2471 (index!12060 (_ BitVec 32))) (Found!2471 (index!12061 (_ BitVec 32))) (Intermediate!2471 (undefined!3283 Bool) (index!12062 (_ BitVec 32)) (x!30423 (_ BitVec 32))) (Undefined!2471) (MissingVacant!2471 (index!12063 (_ BitVec 32))) )
))
(declare-fun lt!150915 () SeekEntryResult!2471)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15563 (_ BitVec 32)) SeekEntryResult!2471)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306071 (= lt!150915 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9438 0))(
  ( (Unit!9439) )
))
(declare-fun e!192036 () Unit!9438)

(declare-fun Unit!9440 () Unit!9438)

(assert (=> b!306071 (= e!192036 Unit!9440)))

(declare-fun b!306072 () Bool)

(declare-fun e!192035 () Bool)

(declare-fun e!192034 () Bool)

(assert (=> b!306072 (= e!192035 e!192034)))

(declare-fun res!163126 () Bool)

(assert (=> b!306072 (=> (not res!163126) (not e!192034))))

(declare-fun lt!150913 () SeekEntryResult!2471)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306072 (= res!163126 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150913))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306072 (= lt!150913 (Intermediate!2471 false resIndex!52 resX!52))))

(declare-fun b!306073 () Bool)

(declare-fun res!163119 () Bool)

(assert (=> b!306073 (=> (not res!163119) (not e!192035))))

(declare-fun arrayContainsKey!0 (array!15563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306073 (= res!163119 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306074 () Bool)

(declare-fun res!163121 () Bool)

(assert (=> b!306074 (=> (not res!163121) (not e!192035))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306074 (= res!163121 (validKeyInArray!0 k0!2441))))

(declare-fun b!306076 () Bool)

(declare-fun res!163123 () Bool)

(assert (=> b!306076 (=> (not res!163123) (not e!192035))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15563 (_ BitVec 32)) SeekEntryResult!2471)

(assert (=> b!306076 (= res!163123 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2471 i!1240)))))

(declare-fun b!306077 () Bool)

(declare-fun e!192033 () Unit!9438)

(declare-fun Unit!9441 () Unit!9438)

(assert (=> b!306077 (= e!192033 Unit!9441)))

(declare-fun b!306078 () Bool)

(assert (=> b!306078 false))

(declare-fun Unit!9442 () Unit!9438)

(assert (=> b!306078 (= e!192036 Unit!9442)))

(declare-fun b!306079 () Bool)

(assert (=> b!306079 (= e!192033 e!192036)))

(declare-fun c!49078 () Bool)

(assert (=> b!306079 (= c!49078 (or (= (select (arr!7366 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7366 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306080 () Bool)

(assert (=> b!306080 (= e!192034 (not true))))

(assert (=> b!306080 (= index!1781 resIndex!52)))

(declare-fun lt!150914 () Unit!9438)

(assert (=> b!306080 (= lt!150914 e!192033)))

(declare-fun c!49079 () Bool)

(assert (=> b!306080 (= c!49079 (not (= resIndex!52 index!1781)))))

(declare-fun b!306081 () Bool)

(declare-fun res!163127 () Bool)

(assert (=> b!306081 (=> (not res!163127) (not e!192035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15563 (_ BitVec 32)) Bool)

(assert (=> b!306081 (= res!163127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306082 () Bool)

(declare-fun res!163128 () Bool)

(assert (=> b!306082 (=> (not res!163128) (not e!192035))))

(assert (=> b!306082 (= res!163128 (and (= (size!7718 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7718 a!3293))))))

(declare-fun b!306083 () Bool)

(declare-fun res!163122 () Bool)

(assert (=> b!306083 (=> (not res!163122) (not e!192034))))

(assert (=> b!306083 (= res!163122 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150913))))

(declare-fun b!306084 () Bool)

(declare-fun res!163124 () Bool)

(assert (=> b!306084 (=> (not res!163124) (not e!192034))))

(assert (=> b!306084 (= res!163124 (and (= (select (arr!7366 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7718 a!3293))))))

(declare-fun b!306075 () Bool)

(declare-fun res!163125 () Bool)

(assert (=> b!306075 (=> (not res!163125) (not e!192034))))

(assert (=> b!306075 (= res!163125 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7366 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun res!163120 () Bool)

(assert (=> start!30546 (=> (not res!163120) (not e!192035))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30546 (= res!163120 (validMask!0 mask!3709))))

(assert (=> start!30546 e!192035))

(declare-fun array_inv!5316 (array!15563) Bool)

(assert (=> start!30546 (array_inv!5316 a!3293)))

(assert (=> start!30546 true))

(assert (= (and start!30546 res!163120) b!306082))

(assert (= (and b!306082 res!163128) b!306074))

(assert (= (and b!306074 res!163121) b!306073))

(assert (= (and b!306073 res!163119) b!306076))

(assert (= (and b!306076 res!163123) b!306081))

(assert (= (and b!306081 res!163127) b!306072))

(assert (= (and b!306072 res!163126) b!306084))

(assert (= (and b!306084 res!163124) b!306083))

(assert (= (and b!306083 res!163122) b!306075))

(assert (= (and b!306075 res!163125) b!306080))

(assert (= (and b!306080 c!49079) b!306079))

(assert (= (and b!306080 (not c!49079)) b!306077))

(assert (= (and b!306079 c!49078) b!306078))

(assert (= (and b!306079 (not c!49078)) b!306071))

(declare-fun m!316957 () Bool)

(assert (=> b!306084 m!316957))

(declare-fun m!316959 () Bool)

(assert (=> b!306083 m!316959))

(declare-fun m!316961 () Bool)

(assert (=> b!306079 m!316961))

(declare-fun m!316963 () Bool)

(assert (=> b!306074 m!316963))

(declare-fun m!316965 () Bool)

(assert (=> b!306076 m!316965))

(declare-fun m!316967 () Bool)

(assert (=> b!306081 m!316967))

(declare-fun m!316969 () Bool)

(assert (=> b!306072 m!316969))

(assert (=> b!306072 m!316969))

(declare-fun m!316971 () Bool)

(assert (=> b!306072 m!316971))

(assert (=> b!306075 m!316961))

(declare-fun m!316973 () Bool)

(assert (=> start!30546 m!316973))

(declare-fun m!316975 () Bool)

(assert (=> start!30546 m!316975))

(declare-fun m!316977 () Bool)

(assert (=> b!306071 m!316977))

(assert (=> b!306071 m!316977))

(declare-fun m!316979 () Bool)

(assert (=> b!306071 m!316979))

(declare-fun m!316981 () Bool)

(assert (=> b!306073 m!316981))

(check-sat (not b!306081) (not b!306076) (not b!306074) (not b!306083) (not b!306072) (not b!306071) (not b!306073) (not start!30546))
(check-sat)
