; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30612 () Bool)

(assert start!30612)

(declare-fun b!307027 () Bool)

(declare-fun res!163930 () Bool)

(declare-fun e!192292 () Bool)

(assert (=> b!307027 (=> (not res!163930) (not e!192292))))

(declare-datatypes ((array!15620 0))(
  ( (array!15621 (arr!7395 (Array (_ BitVec 32) (_ BitVec 64))) (size!7748 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15620)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2534 0))(
  ( (MissingZero!2534 (index!12312 (_ BitVec 32))) (Found!2534 (index!12313 (_ BitVec 32))) (Intermediate!2534 (undefined!3346 Bool) (index!12314 (_ BitVec 32)) (x!30572 (_ BitVec 32))) (Undefined!2534) (MissingVacant!2534 (index!12315 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15620 (_ BitVec 32)) SeekEntryResult!2534)

(assert (=> b!307027 (= res!163930 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2534 i!1240)))))

(declare-fun b!307028 () Bool)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun e!192291 () Bool)

(assert (=> b!307028 (= e!192291 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7395 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsgt x!1427 #b01111111111111111111111111111110)))))

(declare-fun b!307029 () Bool)

(assert (=> b!307029 (= e!192292 e!192291)))

(declare-fun res!163927 () Bool)

(assert (=> b!307029 (=> (not res!163927) (not e!192291))))

(declare-fun lt!150881 () SeekEntryResult!2534)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15620 (_ BitVec 32)) SeekEntryResult!2534)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307029 (= res!163927 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150881))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!307029 (= lt!150881 (Intermediate!2534 false resIndex!52 resX!52))))

(declare-fun b!307030 () Bool)

(declare-fun res!163929 () Bool)

(assert (=> b!307030 (=> (not res!163929) (not e!192292))))

(declare-fun arrayContainsKey!0 (array!15620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307030 (= res!163929 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307031 () Bool)

(declare-fun res!163933 () Bool)

(assert (=> b!307031 (=> (not res!163933) (not e!192291))))

(assert (=> b!307031 (= res!163933 (and (= (select (arr!7395 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7748 a!3293))))))

(declare-fun b!307032 () Bool)

(declare-fun res!163932 () Bool)

(assert (=> b!307032 (=> (not res!163932) (not e!192292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15620 (_ BitVec 32)) Bool)

(assert (=> b!307032 (= res!163932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!163935 () Bool)

(assert (=> start!30612 (=> (not res!163935) (not e!192292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30612 (= res!163935 (validMask!0 mask!3709))))

(assert (=> start!30612 e!192292))

(declare-fun array_inv!5367 (array!15620) Bool)

(assert (=> start!30612 (array_inv!5367 a!3293)))

(assert (=> start!30612 true))

(declare-fun b!307033 () Bool)

(declare-fun res!163928 () Bool)

(assert (=> b!307033 (=> (not res!163928) (not e!192291))))

(assert (=> b!307033 (= res!163928 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150881))))

(declare-fun b!307034 () Bool)

(declare-fun res!163931 () Bool)

(assert (=> b!307034 (=> (not res!163931) (not e!192292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307034 (= res!163931 (validKeyInArray!0 k0!2441))))

(declare-fun b!307035 () Bool)

(declare-fun res!163934 () Bool)

(assert (=> b!307035 (=> (not res!163934) (not e!192292))))

(assert (=> b!307035 (= res!163934 (and (= (size!7748 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7748 a!3293))))))

(assert (= (and start!30612 res!163935) b!307035))

(assert (= (and b!307035 res!163934) b!307034))

(assert (= (and b!307034 res!163931) b!307030))

(assert (= (and b!307030 res!163929) b!307027))

(assert (= (and b!307027 res!163930) b!307032))

(assert (= (and b!307032 res!163932) b!307029))

(assert (= (and b!307029 res!163927) b!307031))

(assert (= (and b!307031 res!163933) b!307033))

(assert (= (and b!307033 res!163928) b!307028))

(declare-fun m!316903 () Bool)

(assert (=> start!30612 m!316903))

(declare-fun m!316905 () Bool)

(assert (=> start!30612 m!316905))

(declare-fun m!316907 () Bool)

(assert (=> b!307032 m!316907))

(declare-fun m!316909 () Bool)

(assert (=> b!307029 m!316909))

(assert (=> b!307029 m!316909))

(declare-fun m!316911 () Bool)

(assert (=> b!307029 m!316911))

(declare-fun m!316913 () Bool)

(assert (=> b!307034 m!316913))

(declare-fun m!316915 () Bool)

(assert (=> b!307033 m!316915))

(declare-fun m!316917 () Bool)

(assert (=> b!307027 m!316917))

(declare-fun m!316919 () Bool)

(assert (=> b!307030 m!316919))

(declare-fun m!316921 () Bool)

(assert (=> b!307031 m!316921))

(declare-fun m!316923 () Bool)

(assert (=> b!307028 m!316923))

(check-sat (not b!307030) (not b!307027) (not start!30612) (not b!307033) (not b!307034) (not b!307029) (not b!307032))
(check-sat)
