; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!30916 () Bool)

(assert start!30916)

(declare-fun b!310277 () Bool)

(declare-fun res!166736 () Bool)

(declare-fun e!193741 () Bool)

(assert (=> b!310277 (=> (not res!166736) (not e!193741))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!310277 (= res!166736 (validKeyInArray!0 k0!2441))))

(declare-fun b!310278 () Bool)

(declare-fun res!166740 () Bool)

(assert (=> b!310278 (=> (not res!166740) (not e!193741))))

(declare-datatypes ((array!15818 0))(
  ( (array!15819 (arr!7491 (Array (_ BitVec 32) (_ BitVec 64))) (size!7843 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15818)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15818 (_ BitVec 32)) Bool)

(assert (=> b!310278 (= res!166740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!310279 () Bool)

(declare-fun res!166732 () Bool)

(declare-fun e!193739 () Bool)

(assert (=> b!310279 (=> (not res!166732) (not e!193739))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!310279 (= res!166732 (and (= (select (arr!7491 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7843 a!3293))))))

(declare-fun res!166737 () Bool)

(assert (=> start!30916 (=> (not res!166737) (not e!193741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!30916 (= res!166737 (validMask!0 mask!3709))))

(assert (=> start!30916 e!193741))

(declare-fun array_inv!5454 (array!15818) Bool)

(assert (=> start!30916 (array_inv!5454 a!3293)))

(assert (=> start!30916 true))

(declare-fun lt!151890 () (_ BitVec 32))

(declare-fun b!310280 () Bool)

(declare-fun lt!151892 () array!15818)

(declare-fun e!193740 () Bool)

(declare-datatypes ((SeekEntryResult!2631 0))(
  ( (MissingZero!2631 (index!12700 (_ BitVec 32))) (Found!2631 (index!12701 (_ BitVec 32))) (Intermediate!2631 (undefined!3443 Bool) (index!12702 (_ BitVec 32)) (x!30932 (_ BitVec 32))) (Undefined!2631) (MissingVacant!2631 (index!12703 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15818 (_ BitVec 32)) SeekEntryResult!2631)

(assert (=> b!310280 (= e!193740 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!151892 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151890 k0!2441 lt!151892 mask!3709)))))

(assert (=> b!310280 (= lt!151892 (array!15819 (store (arr!7491 a!3293) i!1240 k0!2441) (size!7843 a!3293)))))

(declare-fun b!310281 () Bool)

(assert (=> b!310281 (= e!193741 e!193739)))

(declare-fun res!166733 () Bool)

(assert (=> b!310281 (=> (not res!166733) (not e!193739))))

(declare-fun lt!151891 () SeekEntryResult!2631)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310281 (= res!166733 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!151891))))

(assert (=> b!310281 (= lt!151891 (Intermediate!2631 false resIndex!52 resX!52))))

(declare-fun b!310282 () Bool)

(declare-fun e!193738 () Bool)

(assert (=> b!310282 (= e!193739 e!193738)))

(declare-fun res!166739 () Bool)

(assert (=> b!310282 (=> (not res!166739) (not e!193738))))

(declare-fun lt!151893 () SeekEntryResult!2631)

(assert (=> b!310282 (= res!166739 (and (= lt!151893 lt!151891) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7491 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!310282 (= lt!151893 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!310283 () Bool)

(declare-fun res!166734 () Bool)

(assert (=> b!310283 (=> (not res!166734) (not e!193741))))

(declare-fun arrayContainsKey!0 (array!15818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!310283 (= res!166734 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!310284 () Bool)

(declare-fun res!166738 () Bool)

(assert (=> b!310284 (=> (not res!166738) (not e!193741))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15818 (_ BitVec 32)) SeekEntryResult!2631)

(assert (=> b!310284 (= res!166738 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2631 i!1240)))))

(declare-fun b!310285 () Bool)

(declare-fun res!166735 () Bool)

(assert (=> b!310285 (=> (not res!166735) (not e!193741))))

(assert (=> b!310285 (= res!166735 (and (= (size!7843 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7843 a!3293))))))

(declare-fun b!310286 () Bool)

(assert (=> b!310286 (= e!193738 (not (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709)))))))

(assert (=> b!310286 e!193740))

(declare-fun res!166731 () Bool)

(assert (=> b!310286 (=> (not res!166731) (not e!193740))))

(assert (=> b!310286 (= res!166731 (= lt!151893 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!151890 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!310286 (= lt!151890 (nextIndex!0 index!1781 x!1427 mask!3709))))

(assert (= (and start!30916 res!166737) b!310285))

(assert (= (and b!310285 res!166735) b!310277))

(assert (= (and b!310277 res!166736) b!310283))

(assert (= (and b!310283 res!166734) b!310284))

(assert (= (and b!310284 res!166738) b!310278))

(assert (= (and b!310278 res!166740) b!310281))

(assert (= (and b!310281 res!166733) b!310279))

(assert (= (and b!310279 res!166732) b!310282))

(assert (= (and b!310282 res!166739) b!310286))

(assert (= (and b!310286 res!166731) b!310280))

(declare-fun m!320173 () Bool)

(assert (=> b!310278 m!320173))

(declare-fun m!320175 () Bool)

(assert (=> b!310284 m!320175))

(declare-fun m!320177 () Bool)

(assert (=> b!310286 m!320177))

(declare-fun m!320179 () Bool)

(assert (=> b!310286 m!320179))

(declare-fun m!320181 () Bool)

(assert (=> b!310282 m!320181))

(declare-fun m!320183 () Bool)

(assert (=> b!310282 m!320183))

(declare-fun m!320185 () Bool)

(assert (=> b!310283 m!320185))

(declare-fun m!320187 () Bool)

(assert (=> b!310280 m!320187))

(declare-fun m!320189 () Bool)

(assert (=> b!310280 m!320189))

(declare-fun m!320191 () Bool)

(assert (=> b!310280 m!320191))

(declare-fun m!320193 () Bool)

(assert (=> b!310281 m!320193))

(assert (=> b!310281 m!320193))

(declare-fun m!320195 () Bool)

(assert (=> b!310281 m!320195))

(declare-fun m!320197 () Bool)

(assert (=> start!30916 m!320197))

(declare-fun m!320199 () Bool)

(assert (=> start!30916 m!320199))

(declare-fun m!320201 () Bool)

(assert (=> b!310279 m!320201))

(declare-fun m!320203 () Bool)

(assert (=> b!310277 m!320203))

(check-sat (not b!310280) (not b!310284) (not start!30916) (not b!310286) (not b!310283) (not b!310277) (not b!310282) (not b!310281) (not b!310278))
(check-sat)
