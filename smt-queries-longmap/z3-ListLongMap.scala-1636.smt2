; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30598 () Bool)

(assert start!30598)

(declare-fun b!306923 () Bool)

(declare-fun res!163697 () Bool)

(declare-fun e!192353 () Bool)

(assert (=> b!306923 (=> (not res!163697) (not e!192353))))

(declare-datatypes ((array!15602 0))(
  ( (array!15603 (arr!7386 (Array (_ BitVec 32) (_ BitVec 64))) (size!7738 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15602)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2526 0))(
  ( (MissingZero!2526 (index!12280 (_ BitVec 32))) (Found!2526 (index!12281 (_ BitVec 32))) (Intermediate!2526 (undefined!3338 Bool) (index!12282 (_ BitVec 32)) (x!30529 (_ BitVec 32))) (Undefined!2526) (MissingVacant!2526 (index!12283 (_ BitVec 32))) )
))
(declare-fun lt!151068 () SeekEntryResult!2526)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15602 (_ BitVec 32)) SeekEntryResult!2526)

(assert (=> b!306923 (= res!163697 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!151068))))

(declare-fun b!306924 () Bool)

(declare-fun res!163692 () Bool)

(declare-fun e!192354 () Bool)

(assert (=> b!306924 (=> (not res!163692) (not e!192354))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15602 (_ BitVec 32)) SeekEntryResult!2526)

(assert (=> b!306924 (= res!163692 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2526 i!1240)))))

(declare-fun b!306925 () Bool)

(declare-datatypes ((Unit!9571 0))(
  ( (Unit!9572) )
))
(declare-fun e!192352 () Unit!9571)

(declare-fun e!192355 () Unit!9571)

(assert (=> b!306925 (= e!192352 e!192355)))

(declare-fun c!49218 () Bool)

(assert (=> b!306925 (= c!49218 (or (= (select (arr!7386 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7386 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!306926 () Bool)

(declare-fun res!163696 () Bool)

(assert (=> b!306926 (=> (not res!163696) (not e!192354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15602 (_ BitVec 32)) Bool)

(assert (=> b!306926 (= res!163696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!306927 () Bool)

(assert (=> b!306927 false))

(declare-fun Unit!9573 () Unit!9571)

(assert (=> b!306927 (= e!192355 Unit!9573)))

(declare-fun b!306928 () Bool)

(assert (=> b!306928 (= e!192354 e!192353)))

(declare-fun res!163698 () Bool)

(assert (=> b!306928 (=> (not res!163698) (not e!192353))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306928 (= res!163698 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151068))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!306928 (= lt!151068 (Intermediate!2526 false resIndex!52 resX!52))))

(declare-fun b!306929 () Bool)

(declare-fun res!163701 () Bool)

(assert (=> b!306929 (=> (not res!163701) (not e!192354))))

(assert (=> b!306929 (= res!163701 (and (= (size!7738 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7738 a!3293))))))

(declare-fun res!163700 () Bool)

(assert (=> start!30598 (=> (not res!163700) (not e!192354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30598 (= res!163700 (validMask!0 mask!3709))))

(assert (=> start!30598 e!192354))

(declare-fun array_inv!5349 (array!15602) Bool)

(assert (=> start!30598 (array_inv!5349 a!3293)))

(assert (=> start!30598 true))

(declare-fun b!306922 () Bool)

(declare-fun res!163693 () Bool)

(assert (=> b!306922 (=> (not res!163693) (not e!192354))))

(declare-fun arrayContainsKey!0 (array!15602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!306922 (= res!163693 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!306930 () Bool)

(declare-fun Unit!9574 () Unit!9571)

(assert (=> b!306930 (= e!192352 Unit!9574)))

(declare-fun b!306931 () Bool)

(declare-fun res!163694 () Bool)

(assert (=> b!306931 (=> (not res!163694) (not e!192354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!306931 (= res!163694 (validKeyInArray!0 k0!2441))))

(declare-fun b!306932 () Bool)

(declare-fun res!163695 () Bool)

(assert (=> b!306932 (=> (not res!163695) (not e!192353))))

(assert (=> b!306932 (= res!163695 (and (= (select (arr!7386 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7738 a!3293))))))

(declare-fun b!306933 () Bool)

(assert (=> b!306933 (= e!192353 (not true))))

(assert (=> b!306933 (= index!1781 resIndex!52)))

(declare-fun lt!151066 () Unit!9571)

(assert (=> b!306933 (= lt!151066 e!192352)))

(declare-fun c!49217 () Bool)

(assert (=> b!306933 (= c!49217 (not (= resIndex!52 index!1781)))))

(declare-fun b!306934 () Bool)

(assert (=> b!306934 false))

(declare-fun lt!151067 () SeekEntryResult!2526)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!306934 (= lt!151067 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9575 () Unit!9571)

(assert (=> b!306934 (= e!192355 Unit!9575)))

(declare-fun b!306935 () Bool)

(declare-fun res!163699 () Bool)

(assert (=> b!306935 (=> (not res!163699) (not e!192353))))

(assert (=> b!306935 (= res!163699 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7386 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(assert (= (and start!30598 res!163700) b!306929))

(assert (= (and b!306929 res!163701) b!306931))

(assert (= (and b!306931 res!163694) b!306922))

(assert (= (and b!306922 res!163693) b!306924))

(assert (= (and b!306924 res!163692) b!306926))

(assert (= (and b!306926 res!163696) b!306928))

(assert (= (and b!306928 res!163698) b!306932))

(assert (= (and b!306932 res!163695) b!306923))

(assert (= (and b!306923 res!163697) b!306935))

(assert (= (and b!306935 res!163699) b!306933))

(assert (= (and b!306933 c!49217) b!306925))

(assert (= (and b!306933 (not c!49217)) b!306930))

(assert (= (and b!306925 c!49218) b!306927))

(assert (= (and b!306925 (not c!49218)) b!306934))

(declare-fun m!317329 () Bool)

(assert (=> b!306934 m!317329))

(assert (=> b!306934 m!317329))

(declare-fun m!317331 () Bool)

(assert (=> b!306934 m!317331))

(declare-fun m!317333 () Bool)

(assert (=> b!306922 m!317333))

(declare-fun m!317335 () Bool)

(assert (=> b!306925 m!317335))

(declare-fun m!317337 () Bool)

(assert (=> b!306923 m!317337))

(declare-fun m!317339 () Bool)

(assert (=> b!306926 m!317339))

(declare-fun m!317341 () Bool)

(assert (=> b!306932 m!317341))

(assert (=> b!306935 m!317335))

(declare-fun m!317343 () Bool)

(assert (=> b!306931 m!317343))

(declare-fun m!317345 () Bool)

(assert (=> start!30598 m!317345))

(declare-fun m!317347 () Bool)

(assert (=> start!30598 m!317347))

(declare-fun m!317349 () Bool)

(assert (=> b!306924 m!317349))

(declare-fun m!317351 () Bool)

(assert (=> b!306928 m!317351))

(assert (=> b!306928 m!317351))

(declare-fun m!317353 () Bool)

(assert (=> b!306928 m!317353))

(check-sat (not b!306924) (not b!306923) (not b!306926) (not b!306934) (not b!306931) (not b!306928) (not b!306922) (not start!30598))
(check-sat)
