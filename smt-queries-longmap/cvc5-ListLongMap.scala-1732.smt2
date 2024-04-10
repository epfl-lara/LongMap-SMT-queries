; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31844 () Bool)

(assert start!31844)

(declare-fun res!172885 () Bool)

(declare-fun e!197799 () Bool)

(assert (=> start!31844 (=> (not res!172885) (not e!197799))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31844 (= res!172885 (validMask!0 mask!3709))))

(assert (=> start!31844 e!197799))

(declare-datatypes ((array!16215 0))(
  ( (array!16216 (arr!7673 (Array (_ BitVec 32) (_ BitVec 64))) (size!8025 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16215)

(declare-fun array_inv!5636 (array!16215) Bool)

(assert (=> start!31844 (array_inv!5636 a!3293)))

(assert (=> start!31844 true))

(declare-fun b!318302 () Bool)

(declare-fun e!197798 () Bool)

(assert (=> b!318302 (= e!197798 (not true))))

(declare-fun e!197800 () Bool)

(assert (=> b!318302 e!197800))

(declare-fun res!172889 () Bool)

(assert (=> b!318302 (=> (not res!172889) (not e!197800))))

(declare-fun lt!155298 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2813 0))(
  ( (MissingZero!2813 (index!13428 (_ BitVec 32))) (Found!2813 (index!13429 (_ BitVec 32))) (Intermediate!2813 (undefined!3625 Bool) (index!13430 (_ BitVec 32)) (x!31686 (_ BitVec 32))) (Undefined!2813) (MissingVacant!2813 (index!13431 (_ BitVec 32))) )
))
(declare-fun lt!155296 () SeekEntryResult!2813)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16215 (_ BitVec 32)) SeekEntryResult!2813)

(assert (=> b!318302 (= res!172889 (= lt!155296 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155298 k!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318302 (= lt!155298 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318303 () Bool)

(declare-fun e!197797 () Bool)

(assert (=> b!318303 (= e!197799 e!197797)))

(declare-fun res!172883 () Bool)

(assert (=> b!318303 (=> (not res!172883) (not e!197797))))

(declare-fun lt!155295 () SeekEntryResult!2813)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318303 (= res!172883 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!155295))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318303 (= lt!155295 (Intermediate!2813 false resIndex!52 resX!52))))

(declare-fun b!318304 () Bool)

(declare-fun res!172888 () Bool)

(assert (=> b!318304 (=> (not res!172888) (not e!197799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16215 (_ BitVec 32)) Bool)

(assert (=> b!318304 (= res!172888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318305 () Bool)

(declare-fun res!172890 () Bool)

(assert (=> b!318305 (=> (not res!172890) (not e!197799))))

(declare-fun arrayContainsKey!0 (array!16215 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318305 (= res!172890 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318306 () Bool)

(declare-fun res!172887 () Bool)

(assert (=> b!318306 (=> (not res!172887) (not e!197799))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318306 (= res!172887 (validKeyInArray!0 k!2441))))

(declare-fun b!318307 () Bool)

(assert (=> b!318307 (= e!197797 e!197798)))

(declare-fun res!172886 () Bool)

(assert (=> b!318307 (=> (not res!172886) (not e!197798))))

(assert (=> b!318307 (= res!172886 (and (= lt!155296 lt!155295) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7673 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318307 (= lt!155296 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!318308 () Bool)

(declare-fun res!172882 () Bool)

(assert (=> b!318308 (=> (not res!172882) (not e!197799))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318308 (= res!172882 (and (= (size!8025 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8025 a!3293))))))

(declare-fun lt!155297 () array!16215)

(declare-fun b!318309 () Bool)

(assert (=> b!318309 (= e!197800 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!155297 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155298 k!2441 lt!155297 mask!3709)))))

(assert (=> b!318309 (= lt!155297 (array!16216 (store (arr!7673 a!3293) i!1240 k!2441) (size!8025 a!3293)))))

(declare-fun b!318310 () Bool)

(declare-fun res!172884 () Bool)

(assert (=> b!318310 (=> (not res!172884) (not e!197797))))

(assert (=> b!318310 (= res!172884 (and (= (select (arr!7673 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8025 a!3293))))))

(declare-fun b!318311 () Bool)

(declare-fun res!172881 () Bool)

(assert (=> b!318311 (=> (not res!172881) (not e!197799))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16215 (_ BitVec 32)) SeekEntryResult!2813)

(assert (=> b!318311 (= res!172881 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2813 i!1240)))))

(assert (= (and start!31844 res!172885) b!318308))

(assert (= (and b!318308 res!172882) b!318306))

(assert (= (and b!318306 res!172887) b!318305))

(assert (= (and b!318305 res!172890) b!318311))

(assert (= (and b!318311 res!172881) b!318304))

(assert (= (and b!318304 res!172888) b!318303))

(assert (= (and b!318303 res!172883) b!318310))

(assert (= (and b!318310 res!172884) b!318307))

(assert (= (and b!318307 res!172886) b!318302))

(assert (= (and b!318302 res!172889) b!318309))

(declare-fun m!326993 () Bool)

(assert (=> b!318309 m!326993))

(declare-fun m!326995 () Bool)

(assert (=> b!318309 m!326995))

(declare-fun m!326997 () Bool)

(assert (=> b!318309 m!326997))

(declare-fun m!326999 () Bool)

(assert (=> b!318307 m!326999))

(declare-fun m!327001 () Bool)

(assert (=> b!318307 m!327001))

(declare-fun m!327003 () Bool)

(assert (=> b!318305 m!327003))

(declare-fun m!327005 () Bool)

(assert (=> start!31844 m!327005))

(declare-fun m!327007 () Bool)

(assert (=> start!31844 m!327007))

(declare-fun m!327009 () Bool)

(assert (=> b!318302 m!327009))

(declare-fun m!327011 () Bool)

(assert (=> b!318302 m!327011))

(declare-fun m!327013 () Bool)

(assert (=> b!318303 m!327013))

(assert (=> b!318303 m!327013))

(declare-fun m!327015 () Bool)

(assert (=> b!318303 m!327015))

(declare-fun m!327017 () Bool)

(assert (=> b!318304 m!327017))

(declare-fun m!327019 () Bool)

(assert (=> b!318306 m!327019))

(declare-fun m!327021 () Bool)

(assert (=> b!318310 m!327021))

(declare-fun m!327023 () Bool)

(assert (=> b!318311 m!327023))

(push 1)

