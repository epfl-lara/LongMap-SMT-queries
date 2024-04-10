; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!30620 () Bool)

(assert start!30620)

(declare-fun b!307221 () Bool)

(declare-fun res!163982 () Bool)

(declare-fun e!192441 () Bool)

(assert (=> b!307221 (=> (not res!163982) (not e!192441))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((array!15624 0))(
  ( (array!15625 (arr!7397 (Array (_ BitVec 32) (_ BitVec 64))) (size!7749 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15624)

(declare-datatypes ((SeekEntryResult!2537 0))(
  ( (MissingZero!2537 (index!12324 (_ BitVec 32))) (Found!2537 (index!12325 (_ BitVec 32))) (Intermediate!2537 (undefined!3349 Bool) (index!12326 (_ BitVec 32)) (x!30572 (_ BitVec 32))) (Undefined!2537) (MissingVacant!2537 (index!12327 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15624 (_ BitVec 32)) SeekEntryResult!2537)

(assert (=> b!307221 (= res!163982 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2537 i!1240)))))

(declare-fun b!307222 () Bool)

(declare-fun res!163976 () Bool)

(assert (=> b!307222 (=> (not res!163976) (not e!192441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15624 (_ BitVec 32)) Bool)

(assert (=> b!307222 (= res!163976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307223 () Bool)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun e!192440 () Bool)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!307223 (= e!192440 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7397 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52)) (bvsge mask!3709 #b00000000000000000000000000000000) (bvsge index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(declare-fun b!307224 () Bool)

(declare-fun res!163977 () Bool)

(assert (=> b!307224 (=> (not res!163977) (not e!192440))))

(declare-fun lt!151107 () SeekEntryResult!2537)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15624 (_ BitVec 32)) SeekEntryResult!2537)

(assert (=> b!307224 (= res!163977 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!151107))))

(declare-fun b!307225 () Bool)

(assert (=> b!307225 (= e!192441 e!192440)))

(declare-fun res!163981 () Bool)

(assert (=> b!307225 (=> (not res!163981) (not e!192440))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307225 (= res!163981 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!151107))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!307225 (= lt!151107 (Intermediate!2537 false resIndex!52 resX!52))))

(declare-fun res!163980 () Bool)

(assert (=> start!30620 (=> (not res!163980) (not e!192441))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30620 (= res!163980 (validMask!0 mask!3709))))

(assert (=> start!30620 e!192441))

(declare-fun array_inv!5360 (array!15624) Bool)

(assert (=> start!30620 (array_inv!5360 a!3293)))

(assert (=> start!30620 true))

(declare-fun b!307226 () Bool)

(declare-fun res!163983 () Bool)

(assert (=> b!307226 (=> (not res!163983) (not e!192440))))

(assert (=> b!307226 (= res!163983 (and (= (select (arr!7397 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7749 a!3293))))))

(declare-fun b!307227 () Bool)

(declare-fun res!163979 () Bool)

(assert (=> b!307227 (=> (not res!163979) (not e!192441))))

(declare-fun arrayContainsKey!0 (array!15624 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307227 (= res!163979 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!307228 () Bool)

(declare-fun res!163978 () Bool)

(assert (=> b!307228 (=> (not res!163978) (not e!192441))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307228 (= res!163978 (validKeyInArray!0 k!2441))))

(declare-fun b!307229 () Bool)

(declare-fun res!163975 () Bool)

(assert (=> b!307229 (=> (not res!163975) (not e!192441))))

(assert (=> b!307229 (= res!163975 (and (= (size!7749 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7749 a!3293))))))

(assert (= (and start!30620 res!163980) b!307229))

(assert (= (and b!307229 res!163975) b!307228))

(assert (= (and b!307228 res!163978) b!307227))

(assert (= (and b!307227 res!163979) b!307221))

(assert (= (and b!307221 res!163982) b!307222))

(assert (= (and b!307222 res!163976) b!307225))

(assert (= (and b!307225 res!163981) b!307226))

(assert (= (and b!307226 res!163983) b!307224))

(assert (= (and b!307224 res!163977) b!307223))

(declare-fun m!317567 () Bool)

(assert (=> b!307225 m!317567))

(assert (=> b!307225 m!317567))

(declare-fun m!317569 () Bool)

(assert (=> b!307225 m!317569))

(declare-fun m!317571 () Bool)

(assert (=> b!307227 m!317571))

(declare-fun m!317573 () Bool)

(assert (=> b!307228 m!317573))

(declare-fun m!317575 () Bool)

(assert (=> start!30620 m!317575))

(declare-fun m!317577 () Bool)

(assert (=> start!30620 m!317577))

(declare-fun m!317579 () Bool)

(assert (=> b!307223 m!317579))

(declare-fun m!317581 () Bool)

(assert (=> b!307226 m!317581))

(declare-fun m!317583 () Bool)

(assert (=> b!307221 m!317583))

(declare-fun m!317585 () Bool)

(assert (=> b!307222 m!317585))

(declare-fun m!317587 () Bool)

(assert (=> b!307224 m!317587))

(push 1)

(assert (not b!307222))

(assert (not b!307221))

(assert (not start!30620))

(assert (not b!307225))

(assert (not b!307224))

(assert (not b!307227))

(assert (not b!307228))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

