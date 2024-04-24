; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31800 () Bool)

(assert start!31800)

(declare-fun b!317799 () Bool)

(declare-fun res!172434 () Bool)

(declare-fun e!197540 () Bool)

(assert (=> b!317799 (=> (not res!172434) (not e!197540))))

(declare-datatypes ((array!16184 0))(
  ( (array!16185 (arr!7657 (Array (_ BitVec 32) (_ BitVec 64))) (size!8009 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16184)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16184 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317799 (= res!172434 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317800 () Bool)

(declare-fun e!197539 () Bool)

(declare-fun e!197537 () Bool)

(assert (=> b!317800 (= e!197539 e!197537)))

(declare-fun res!172430 () Bool)

(assert (=> b!317800 (=> (not res!172430) (not e!197537))))

(declare-datatypes ((SeekEntryResult!2762 0))(
  ( (MissingZero!2762 (index!13224 (_ BitVec 32))) (Found!2762 (index!13225 (_ BitVec 32))) (Intermediate!2762 (undefined!3574 Bool) (index!13226 (_ BitVec 32)) (x!31592 (_ BitVec 32))) (Undefined!2762) (MissingVacant!2762 (index!13227 (_ BitVec 32))) )
))
(declare-fun lt!155133 () SeekEntryResult!2762)

(declare-fun lt!155136 () SeekEntryResult!2762)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317800 (= res!172430 (and (= lt!155136 lt!155133) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7657 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16184 (_ BitVec 32)) SeekEntryResult!2762)

(assert (=> b!317800 (= lt!155136 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317801 () Bool)

(declare-fun res!172429 () Bool)

(assert (=> b!317801 (=> (not res!172429) (not e!197539))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317801 (= res!172429 (and (= (select (arr!7657 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8009 a!3293))))))

(declare-fun res!172431 () Bool)

(assert (=> start!31800 (=> (not res!172431) (not e!197540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31800 (= res!172431 (validMask!0 mask!3709))))

(assert (=> start!31800 e!197540))

(declare-fun array_inv!5607 (array!16184) Bool)

(assert (=> start!31800 (array_inv!5607 a!3293)))

(assert (=> start!31800 true))

(declare-fun b!317802 () Bool)

(declare-fun res!172435 () Bool)

(assert (=> b!317802 (=> (not res!172435) (not e!197540))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16184 (_ BitVec 32)) Bool)

(assert (=> b!317802 (= res!172435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317803 () Bool)

(assert (=> b!317803 (= e!197540 e!197539)))

(declare-fun res!172436 () Bool)

(assert (=> b!317803 (=> (not res!172436) (not e!197539))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317803 (= res!172436 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155133))))

(assert (=> b!317803 (= lt!155133 (Intermediate!2762 false resIndex!52 resX!52))))

(declare-fun b!317804 () Bool)

(assert (=> b!317804 (= e!197537 (not true))))

(declare-fun e!197541 () Bool)

(assert (=> b!317804 e!197541))

(declare-fun res!172437 () Bool)

(assert (=> b!317804 (=> (not res!172437) (not e!197541))))

(declare-fun lt!155134 () (_ BitVec 32))

(assert (=> b!317804 (= res!172437 (= lt!155136 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155134 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317804 (= lt!155134 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun lt!155135 () array!16184)

(declare-fun b!317805 () Bool)

(assert (=> b!317805 (= e!197541 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155135 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155134 k0!2441 lt!155135 mask!3709)))))

(assert (=> b!317805 (= lt!155135 (array!16185 (store (arr!7657 a!3293) i!1240 k0!2441) (size!8009 a!3293)))))

(declare-fun b!317806 () Bool)

(declare-fun res!172432 () Bool)

(assert (=> b!317806 (=> (not res!172432) (not e!197540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317806 (= res!172432 (validKeyInArray!0 k0!2441))))

(declare-fun b!317807 () Bool)

(declare-fun res!172433 () Bool)

(assert (=> b!317807 (=> (not res!172433) (not e!197540))))

(assert (=> b!317807 (= res!172433 (and (= (size!8009 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8009 a!3293))))))

(declare-fun b!317808 () Bool)

(declare-fun res!172428 () Bool)

(assert (=> b!317808 (=> (not res!172428) (not e!197540))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16184 (_ BitVec 32)) SeekEntryResult!2762)

(assert (=> b!317808 (= res!172428 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2762 i!1240)))))

(assert (= (and start!31800 res!172431) b!317807))

(assert (= (and b!317807 res!172433) b!317806))

(assert (= (and b!317806 res!172432) b!317799))

(assert (= (and b!317799 res!172434) b!317808))

(assert (= (and b!317808 res!172428) b!317802))

(assert (= (and b!317802 res!172435) b!317803))

(assert (= (and b!317803 res!172436) b!317801))

(assert (= (and b!317801 res!172429) b!317800))

(assert (= (and b!317800 res!172430) b!317804))

(assert (= (and b!317804 res!172437) b!317805))

(declare-fun m!326683 () Bool)

(assert (=> b!317806 m!326683))

(declare-fun m!326685 () Bool)

(assert (=> b!317808 m!326685))

(declare-fun m!326687 () Bool)

(assert (=> b!317801 m!326687))

(declare-fun m!326689 () Bool)

(assert (=> b!317803 m!326689))

(assert (=> b!317803 m!326689))

(declare-fun m!326691 () Bool)

(assert (=> b!317803 m!326691))

(declare-fun m!326693 () Bool)

(assert (=> b!317805 m!326693))

(declare-fun m!326695 () Bool)

(assert (=> b!317805 m!326695))

(declare-fun m!326697 () Bool)

(assert (=> b!317805 m!326697))

(declare-fun m!326699 () Bool)

(assert (=> start!31800 m!326699))

(declare-fun m!326701 () Bool)

(assert (=> start!31800 m!326701))

(declare-fun m!326703 () Bool)

(assert (=> b!317799 m!326703))

(declare-fun m!326705 () Bool)

(assert (=> b!317800 m!326705))

(declare-fun m!326707 () Bool)

(assert (=> b!317800 m!326707))

(declare-fun m!326709 () Bool)

(assert (=> b!317802 m!326709))

(declare-fun m!326711 () Bool)

(assert (=> b!317804 m!326711))

(declare-fun m!326713 () Bool)

(assert (=> b!317804 m!326713))

(check-sat (not start!31800) (not b!317800) (not b!317802) (not b!317808) (not b!317806) (not b!317804) (not b!317803) (not b!317799) (not b!317805))
(check-sat)
