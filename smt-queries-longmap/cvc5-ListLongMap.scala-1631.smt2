; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30566 () Bool)

(assert start!30566)

(declare-fun b!306250 () Bool)

(declare-fun res!163214 () Bool)

(declare-fun e!192114 () Bool)

(assert (=> b!306250 (=> (not res!163214) (not e!192114))))

(declare-datatypes ((array!15570 0))(
  ( (array!15571 (arr!7370 (Array (_ BitVec 32) (_ BitVec 64))) (size!7722 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15570)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2510 0))(
  ( (MissingZero!2510 (index!12216 (_ BitVec 32))) (Found!2510 (index!12217 (_ BitVec 32))) (Intermediate!2510 (undefined!3322 Bool) (index!12218 (_ BitVec 32)) (x!30473 (_ BitVec 32))) (Undefined!2510) (MissingVacant!2510 (index!12219 (_ BitVec 32))) )
))
(declare-fun lt!150922 () SeekEntryResult!2510)

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15570 (_ BitVec 32)) SeekEntryResult!2510)

(assert (=> b!306250 (= res!163214 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!150922))))

(declare-fun b!306251 () Bool)

(assert (=> b!306251 false))

(declare-fun lt!150923 () SeekEntryResult!2510)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306251 (= lt!150923 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9491 0))(
  ( (Unit!9492) )
))
(declare-fun e!192112 () Unit!9491)

(declare-fun Unit!9493 () Unit!9491)

(assert (=> b!306251 (= e!192112 Unit!9493)))

(declare-fun b!306252 () Bool)

(declare-fun res!163220 () Bool)

(assert (=> b!306252 (=> (not res!163220) (not e!192114))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!306252 (= res!163220 (and (= (select (arr!7370 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7722 a!3293))))))

(declare-fun b!306253 () Bool)

(declare-fun res!163221 () Bool)

(declare-fun e!192113 () Bool)

(assert (=> b!306253 (=> (not res!163221) (not e!192113))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15570 (_ BitVec 32)) Bool)

(assert (=> b!306253 (= res!163221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306254 () Bool)

(declare-fun res!163216 () Bool)

(assert (=> b!306254 (=> (not res!163216) (not e!192113))))

(assert (=> b!306254 (= res!163216 (and (= (size!7722 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7722 a!3293))))))

(declare-fun b!306255 () Bool)

(declare-fun res!163218 () Bool)

(assert (=> b!306255 (=> (not res!163218) (not e!192113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306255 (= res!163218 (validKeyInArray!0 k!2441))))

(declare-fun res!163219 () Bool)

(assert (=> start!30566 (=> (not res!163219) (not e!192113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30566 (= res!163219 (validMask!0 mask!3709))))

(assert (=> start!30566 e!192113))

(declare-fun array_inv!5333 (array!15570) Bool)

(assert (=> start!30566 (array_inv!5333 a!3293)))

(assert (=> start!30566 true))

(declare-fun b!306256 () Bool)

(declare-fun res!163215 () Bool)

(assert (=> b!306256 (=> (not res!163215) (not e!192113))))

(declare-fun arrayContainsKey!0 (array!15570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306256 (= res!163215 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306257 () Bool)

(declare-fun res!163212 () Bool)

(assert (=> b!306257 (=> (not res!163212) (not e!192114))))

(assert (=> b!306257 (= res!163212 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7370 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!306258 () Bool)

(assert (=> b!306258 (= e!192113 e!192114)))

(declare-fun res!163217 () Bool)

(assert (=> b!306258 (=> (not res!163217) (not e!192114))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306258 (= res!163217 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!150922))))

(assert (=> b!306258 (= lt!150922 (Intermediate!2510 false resIndex!52 resX!52))))

(declare-fun b!306259 () Bool)

(declare-fun e!192111 () Unit!9491)

(declare-fun Unit!9494 () Unit!9491)

(assert (=> b!306259 (= e!192111 Unit!9494)))

(declare-fun b!306260 () Bool)

(assert (=> b!306260 (= e!192114 (not true))))

(assert (=> b!306260 (= index!1781 resIndex!52)))

(declare-fun lt!150924 () Unit!9491)

(assert (=> b!306260 (= lt!150924 e!192111)))

(declare-fun c!49122 () Bool)

(assert (=> b!306260 (= c!49122 (not (= resIndex!52 index!1781)))))

(declare-fun b!306261 () Bool)

(assert (=> b!306261 (= e!192111 e!192112)))

(declare-fun c!49121 () Bool)

(assert (=> b!306261 (= c!49121 (or (= (select (arr!7370 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7370 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306262 () Bool)

(declare-fun res!163213 () Bool)

(assert (=> b!306262 (=> (not res!163213) (not e!192113))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15570 (_ BitVec 32)) SeekEntryResult!2510)

(assert (=> b!306262 (= res!163213 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2510 i!1240)))))

(declare-fun b!306263 () Bool)

(assert (=> b!306263 false))

(declare-fun Unit!9495 () Unit!9491)

(assert (=> b!306263 (= e!192112 Unit!9495)))

(assert (= (and start!30566 res!163219) b!306254))

(assert (= (and b!306254 res!163216) b!306255))

(assert (= (and b!306255 res!163218) b!306256))

(assert (= (and b!306256 res!163215) b!306262))

(assert (= (and b!306262 res!163213) b!306253))

(assert (= (and b!306253 res!163221) b!306258))

(assert (= (and b!306258 res!163217) b!306252))

(assert (= (and b!306252 res!163220) b!306250))

(assert (= (and b!306250 res!163214) b!306257))

(assert (= (and b!306257 res!163212) b!306260))

(assert (= (and b!306260 c!49122) b!306261))

(assert (= (and b!306260 (not c!49122)) b!306259))

(assert (= (and b!306261 c!49121) b!306263))

(assert (= (and b!306261 (not c!49121)) b!306251))

(declare-fun m!316913 () Bool)

(assert (=> b!306251 m!316913))

(assert (=> b!306251 m!316913))

(declare-fun m!316915 () Bool)

(assert (=> b!306251 m!316915))

(declare-fun m!316917 () Bool)

(assert (=> b!306252 m!316917))

(declare-fun m!316919 () Bool)

(assert (=> b!306257 m!316919))

(declare-fun m!316921 () Bool)

(assert (=> b!306256 m!316921))

(declare-fun m!316923 () Bool)

(assert (=> b!306258 m!316923))

(assert (=> b!306258 m!316923))

(declare-fun m!316925 () Bool)

(assert (=> b!306258 m!316925))

(assert (=> b!306261 m!316919))

(declare-fun m!316927 () Bool)

(assert (=> b!306253 m!316927))

(declare-fun m!316929 () Bool)

(assert (=> b!306262 m!316929))

(declare-fun m!316931 () Bool)

(assert (=> b!306250 m!316931))

(declare-fun m!316933 () Bool)

(assert (=> b!306255 m!316933))

(declare-fun m!316935 () Bool)

(assert (=> start!30566 m!316935))

(declare-fun m!316937 () Bool)

(assert (=> start!30566 m!316937))

(push 1)

