; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30630 () Bool)

(assert start!30630)

(declare-fun b!307253 () Bool)

(declare-fun res!164156 () Bool)

(declare-fun e!192354 () Bool)

(assert (=> b!307253 (=> (not res!164156) (not e!192354))))

(declare-datatypes ((array!15638 0))(
  ( (array!15639 (arr!7404 (Array (_ BitVec 32) (_ BitVec 64))) (size!7757 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15638)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2543 0))(
  ( (MissingZero!2543 (index!12348 (_ BitVec 32))) (Found!2543 (index!12349 (_ BitVec 32))) (Intermediate!2543 (undefined!3355 Bool) (index!12350 (_ BitVec 32)) (x!30605 (_ BitVec 32))) (Undefined!2543) (MissingVacant!2543 (index!12351 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15638 (_ BitVec 32)) SeekEntryResult!2543)

(assert (=> b!307253 (= res!164156 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2543 i!1240)))))

(declare-fun b!307254 () Bool)

(declare-fun e!192355 () Bool)

(assert (=> b!307254 (= e!192354 e!192355)))

(declare-fun res!164153 () Bool)

(assert (=> b!307254 (=> (not res!164153) (not e!192355))))

(declare-fun lt!150908 () SeekEntryResult!2543)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15638 (_ BitVec 32)) SeekEntryResult!2543)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!307254 (= res!164153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!150908))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!307254 (= lt!150908 (Intermediate!2543 false resIndex!52 resX!52))))

(declare-fun b!307255 () Bool)

(declare-fun res!164157 () Bool)

(assert (=> b!307255 (=> (not res!164157) (not e!192354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15638 (_ BitVec 32)) Bool)

(assert (=> b!307255 (= res!164157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!307256 () Bool)

(declare-fun res!164155 () Bool)

(assert (=> b!307256 (=> (not res!164155) (not e!192354))))

(assert (=> b!307256 (= res!164155 (and (= (size!7757 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7757 a!3293))))))

(declare-fun b!307257 () Bool)

(declare-fun res!164152 () Bool)

(assert (=> b!307257 (=> (not res!164152) (not e!192355))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!307257 (= res!164152 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!150908))))

(declare-fun b!307258 () Bool)

(assert (=> b!307258 (= e!192355 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7404 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52)) (bvslt mask!3709 #b00000000000000000000000000000000)))))

(declare-fun res!164160 () Bool)

(assert (=> start!30630 (=> (not res!164160) (not e!192354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30630 (= res!164160 (validMask!0 mask!3709))))

(assert (=> start!30630 e!192354))

(declare-fun array_inv!5376 (array!15638) Bool)

(assert (=> start!30630 (array_inv!5376 a!3293)))

(assert (=> start!30630 true))

(declare-fun b!307252 () Bool)

(declare-fun res!164159 () Bool)

(assert (=> b!307252 (=> (not res!164159) (not e!192355))))

(assert (=> b!307252 (= res!164159 (and (= (select (arr!7404 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7757 a!3293))))))

(declare-fun b!307259 () Bool)

(declare-fun res!164154 () Bool)

(assert (=> b!307259 (=> (not res!164154) (not e!192354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!307259 (= res!164154 (validKeyInArray!0 k0!2441))))

(declare-fun b!307260 () Bool)

(declare-fun res!164158 () Bool)

(assert (=> b!307260 (=> (not res!164158) (not e!192354))))

(declare-fun arrayContainsKey!0 (array!15638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!307260 (= res!164158 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!30630 res!164160) b!307256))

(assert (= (and b!307256 res!164155) b!307259))

(assert (= (and b!307259 res!164154) b!307260))

(assert (= (and b!307260 res!164158) b!307253))

(assert (= (and b!307253 res!164156) b!307255))

(assert (= (and b!307255 res!164157) b!307254))

(assert (= (and b!307254 res!164153) b!307252))

(assert (= (and b!307252 res!164159) b!307257))

(assert (= (and b!307257 res!164152) b!307258))

(declare-fun m!317089 () Bool)

(assert (=> b!307255 m!317089))

(declare-fun m!317091 () Bool)

(assert (=> b!307260 m!317091))

(declare-fun m!317093 () Bool)

(assert (=> b!307253 m!317093))

(declare-fun m!317095 () Bool)

(assert (=> start!30630 m!317095))

(declare-fun m!317097 () Bool)

(assert (=> start!30630 m!317097))

(declare-fun m!317099 () Bool)

(assert (=> b!307258 m!317099))

(declare-fun m!317101 () Bool)

(assert (=> b!307254 m!317101))

(assert (=> b!307254 m!317101))

(declare-fun m!317103 () Bool)

(assert (=> b!307254 m!317103))

(declare-fun m!317105 () Bool)

(assert (=> b!307252 m!317105))

(declare-fun m!317107 () Bool)

(assert (=> b!307257 m!317107))

(declare-fun m!317109 () Bool)

(assert (=> b!307259 m!317109))

(check-sat (not start!30630) (not b!307255) (not b!307259) (not b!307253) (not b!307257) (not b!307254) (not b!307260))
(check-sat)
