; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30900 () Bool)

(assert start!30900)

(declare-fun b!310194 () Bool)

(declare-fun res!166704 () Bool)

(declare-fun e!193688 () Bool)

(assert (=> b!310194 (=> (not res!166704) (not e!193688))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310194 (= res!166704 (validKeyInArray!0 k0!2441))))

(declare-fun b!310195 () Bool)

(declare-fun res!166701 () Bool)

(assert (=> b!310195 (=> (not res!166701) (not e!193688))))

(declare-datatypes ((array!15815 0))(
  ( (array!15816 (arr!7489 (Array (_ BitVec 32) (_ BitVec 64))) (size!7841 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15815)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15815 (_ BitVec 32)) Bool)

(assert (=> b!310195 (= res!166701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310196 () Bool)

(declare-fun res!166702 () Bool)

(declare-fun e!193690 () Bool)

(assert (=> b!310196 (=> (not res!166702) (not e!193690))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!310196 (= res!166702 (and (= (select (arr!7489 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7841 a!3293))))))

(declare-fun b!310197 () Bool)

(declare-fun e!193689 () Bool)

(assert (=> b!310197 (= e!193689 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(declare-fun e!193692 () Bool)

(assert (=> b!310197 e!193692))

(declare-fun res!166705 () Bool)

(assert (=> b!310197 (=> (not res!166705) (not e!193692))))

(declare-fun lt!151898 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2594 0))(
  ( (MissingZero!2594 (index!12552 (_ BitVec 32))) (Found!2594 (index!12553 (_ BitVec 32))) (Intermediate!2594 (undefined!3406 Bool) (index!12554 (_ BitVec 32)) (x!30892 (_ BitVec 32))) (Undefined!2594) (MissingVacant!2594 (index!12555 (_ BitVec 32))) )
))
(declare-fun lt!151896 () SeekEntryResult!2594)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15815 (_ BitVec 32)) SeekEntryResult!2594)

(assert (=> b!310197 (= res!166705 (= lt!151896 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151898 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310197 (= lt!151898 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun lt!151899 () array!15815)

(declare-fun b!310198 () Bool)

(assert (=> b!310198 (= e!193692 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151899 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151898 k0!2441 lt!151899 mask!3709)))))

(assert (=> b!310198 (= lt!151899 (array!15816 (store (arr!7489 a!3293) i!1240 k0!2441) (size!7841 a!3293)))))

(declare-fun b!310199 () Bool)

(declare-fun res!166703 () Bool)

(assert (=> b!310199 (=> (not res!166703) (not e!193688))))

(declare-fun arrayContainsKey!0 (array!15815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310199 (= res!166703 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310200 () Bool)

(declare-fun res!166699 () Bool)

(assert (=> b!310200 (=> (not res!166699) (not e!193688))))

(assert (=> b!310200 (= res!166699 (and (= (size!7841 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7841 a!3293))))))

(declare-fun res!166698 () Bool)

(assert (=> start!30900 (=> (not res!166698) (not e!193688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30900 (= res!166698 (validMask!0 mask!3709))))

(assert (=> start!30900 e!193688))

(declare-fun array_inv!5439 (array!15815) Bool)

(assert (=> start!30900 (array_inv!5439 a!3293)))

(assert (=> start!30900 true))

(declare-fun b!310201 () Bool)

(assert (=> b!310201 (= e!193688 e!193690)))

(declare-fun res!166707 () Bool)

(assert (=> b!310201 (=> (not res!166707) (not e!193690))))

(declare-fun lt!151897 () SeekEntryResult!2594)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310201 (= res!166707 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151897))))

(assert (=> b!310201 (= lt!151897 (Intermediate!2594 false resIndex!52 resX!52))))

(declare-fun b!310202 () Bool)

(assert (=> b!310202 (= e!193690 e!193689)))

(declare-fun res!166700 () Bool)

(assert (=> b!310202 (=> (not res!166700) (not e!193689))))

(assert (=> b!310202 (= res!166700 (and (= lt!151896 lt!151897) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7489 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310202 (= lt!151896 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310203 () Bool)

(declare-fun res!166706 () Bool)

(assert (=> b!310203 (=> (not res!166706) (not e!193688))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15815 (_ BitVec 32)) SeekEntryResult!2594)

(assert (=> b!310203 (= res!166706 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2594 i!1240)))))

(assert (= (and start!30900 res!166698) b!310200))

(assert (= (and b!310200 res!166699) b!310194))

(assert (= (and b!310194 res!166704) b!310199))

(assert (= (and b!310199 res!166703) b!310203))

(assert (= (and b!310203 res!166706) b!310195))

(assert (= (and b!310195 res!166701) b!310201))

(assert (= (and b!310201 res!166707) b!310196))

(assert (= (and b!310196 res!166702) b!310202))

(assert (= (and b!310202 res!166700) b!310197))

(assert (= (and b!310197 res!166705) b!310198))

(declare-fun m!320275 () Bool)

(assert (=> b!310196 m!320275))

(declare-fun m!320277 () Bool)

(assert (=> b!310194 m!320277))

(declare-fun m!320279 () Bool)

(assert (=> b!310197 m!320279))

(declare-fun m!320281 () Bool)

(assert (=> b!310197 m!320281))

(declare-fun m!320283 () Bool)

(assert (=> b!310195 m!320283))

(declare-fun m!320285 () Bool)

(assert (=> b!310199 m!320285))

(declare-fun m!320287 () Bool)

(assert (=> start!30900 m!320287))

(declare-fun m!320289 () Bool)

(assert (=> start!30900 m!320289))

(declare-fun m!320291 () Bool)

(assert (=> b!310198 m!320291))

(declare-fun m!320293 () Bool)

(assert (=> b!310198 m!320293))

(declare-fun m!320295 () Bool)

(assert (=> b!310198 m!320295))

(declare-fun m!320297 () Bool)

(assert (=> b!310201 m!320297))

(assert (=> b!310201 m!320297))

(declare-fun m!320299 () Bool)

(assert (=> b!310201 m!320299))

(declare-fun m!320301 () Bool)

(assert (=> b!310202 m!320301))

(declare-fun m!320303 () Bool)

(assert (=> b!310202 m!320303))

(declare-fun m!320305 () Bool)

(assert (=> b!310203 m!320305))

(check-sat (not b!310194) (not b!310198) (not start!30900) (not b!310203) (not b!310199) (not b!310197) (not b!310201) (not b!310202) (not b!310195))
(check-sat)
