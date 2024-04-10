; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31826 () Bool)

(assert start!31826)

(declare-fun b!318032 () Bool)

(declare-fun res!172619 () Bool)

(declare-fun e!197663 () Bool)

(assert (=> b!318032 (=> (not res!172619) (not e!197663))))

(declare-datatypes ((array!16197 0))(
  ( (array!16198 (arr!7664 (Array (_ BitVec 32) (_ BitVec 64))) (size!8016 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16197)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318032 (= res!172619 (and (= (size!8016 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8016 a!3293))))))

(declare-fun b!318033 () Bool)

(declare-fun res!172611 () Bool)

(assert (=> b!318033 (=> (not res!172611) (not e!197663))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2804 0))(
  ( (MissingZero!2804 (index!13392 (_ BitVec 32))) (Found!2804 (index!13393 (_ BitVec 32))) (Intermediate!2804 (undefined!3616 Bool) (index!13394 (_ BitVec 32)) (x!31653 (_ BitVec 32))) (Undefined!2804) (MissingVacant!2804 (index!13395 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16197 (_ BitVec 32)) SeekEntryResult!2804)

(assert (=> b!318033 (= res!172611 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2804 i!1240)))))

(declare-fun b!318034 () Bool)

(declare-fun res!172618 () Bool)

(assert (=> b!318034 (=> (not res!172618) (not e!197663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16197 (_ BitVec 32)) Bool)

(assert (=> b!318034 (= res!172618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318035 () Bool)

(declare-fun e!197664 () Bool)

(assert (=> b!318035 (= e!197664 (not true))))

(declare-fun e!197665 () Bool)

(assert (=> b!318035 e!197665))

(declare-fun res!172615 () Bool)

(assert (=> b!318035 (=> (not res!172615) (not e!197665))))

(declare-fun lt!155187 () (_ BitVec 32))

(declare-fun lt!155189 () SeekEntryResult!2804)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16197 (_ BitVec 32)) SeekEntryResult!2804)

(assert (=> b!318035 (= res!172615 (= lt!155189 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155187 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318035 (= lt!155187 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318036 () Bool)

(declare-fun res!172614 () Bool)

(assert (=> b!318036 (=> (not res!172614) (not e!197663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318036 (= res!172614 (validKeyInArray!0 k!2441))))

(declare-fun res!172612 () Bool)

(assert (=> start!31826 (=> (not res!172612) (not e!197663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31826 (= res!172612 (validMask!0 mask!3709))))

(assert (=> start!31826 e!197663))

(declare-fun array_inv!5627 (array!16197) Bool)

(assert (=> start!31826 (array_inv!5627 a!3293)))

(assert (=> start!31826 true))

(declare-fun b!318037 () Bool)

(declare-fun e!197661 () Bool)

(assert (=> b!318037 (= e!197663 e!197661)))

(declare-fun res!172613 () Bool)

(assert (=> b!318037 (=> (not res!172613) (not e!197661))))

(declare-fun lt!155190 () SeekEntryResult!2804)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318037 (= res!172613 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155190))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318037 (= lt!155190 (Intermediate!2804 false resIndex!52 resX!52))))

(declare-fun b!318038 () Bool)

(declare-fun res!172616 () Bool)

(assert (=> b!318038 (=> (not res!172616) (not e!197663))))

(declare-fun arrayContainsKey!0 (array!16197 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318038 (= res!172616 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318039 () Bool)

(assert (=> b!318039 (= e!197661 e!197664)))

(declare-fun res!172620 () Bool)

(assert (=> b!318039 (=> (not res!172620) (not e!197664))))

(assert (=> b!318039 (= res!172620 (and (= lt!155189 lt!155190) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7664 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318039 (= lt!155189 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun lt!155188 () array!16197)

(declare-fun b!318040 () Bool)

(assert (=> b!318040 (= e!197665 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155188 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155187 k!2441 lt!155188 mask!3709)))))

(assert (=> b!318040 (= lt!155188 (array!16198 (store (arr!7664 a!3293) i!1240 k!2441) (size!8016 a!3293)))))

(declare-fun b!318041 () Bool)

(declare-fun res!172617 () Bool)

(assert (=> b!318041 (=> (not res!172617) (not e!197661))))

(assert (=> b!318041 (= res!172617 (and (= (select (arr!7664 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8016 a!3293))))))

(assert (= (and start!31826 res!172612) b!318032))

(assert (= (and b!318032 res!172619) b!318036))

(assert (= (and b!318036 res!172614) b!318038))

(assert (= (and b!318038 res!172616) b!318033))

(assert (= (and b!318033 res!172611) b!318034))

(assert (= (and b!318034 res!172618) b!318037))

(assert (= (and b!318037 res!172613) b!318041))

(assert (= (and b!318041 res!172617) b!318039))

(assert (= (and b!318039 res!172620) b!318035))

(assert (= (and b!318035 res!172615) b!318040))

(declare-fun m!326705 () Bool)

(assert (=> b!318036 m!326705))

(declare-fun m!326707 () Bool)

(assert (=> b!318039 m!326707))

(declare-fun m!326709 () Bool)

(assert (=> b!318039 m!326709))

(declare-fun m!326711 () Bool)

(assert (=> b!318041 m!326711))

(declare-fun m!326713 () Bool)

(assert (=> b!318040 m!326713))

(declare-fun m!326715 () Bool)

(assert (=> b!318040 m!326715))

(declare-fun m!326717 () Bool)

(assert (=> b!318040 m!326717))

(declare-fun m!326719 () Bool)

(assert (=> b!318037 m!326719))

(assert (=> b!318037 m!326719))

(declare-fun m!326721 () Bool)

(assert (=> b!318037 m!326721))

(declare-fun m!326723 () Bool)

(assert (=> b!318034 m!326723))

(declare-fun m!326725 () Bool)

(assert (=> start!31826 m!326725))

(declare-fun m!326727 () Bool)

(assert (=> start!31826 m!326727))

(declare-fun m!326729 () Bool)

(assert (=> b!318033 m!326729))

(declare-fun m!326731 () Bool)

(assert (=> b!318038 m!326731))

(declare-fun m!326733 () Bool)

(assert (=> b!318035 m!326733))

(declare-fun m!326735 () Bool)

(assert (=> b!318035 m!326735))

(push 1)

