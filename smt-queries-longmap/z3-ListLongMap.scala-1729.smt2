; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31812 () Bool)

(assert start!31812)

(declare-fun b!317979 () Bool)

(declare-fun e!197627 () Bool)

(declare-fun e!197631 () Bool)

(assert (=> b!317979 (= e!197627 e!197631)))

(declare-fun res!172609 () Bool)

(assert (=> b!317979 (=> (not res!172609) (not e!197631))))

(declare-datatypes ((array!16196 0))(
  ( (array!16197 (arr!7663 (Array (_ BitVec 32) (_ BitVec 64))) (size!8015 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16196)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2768 0))(
  ( (MissingZero!2768 (index!13248 (_ BitVec 32))) (Found!2768 (index!13249 (_ BitVec 32))) (Intermediate!2768 (undefined!3580 Bool) (index!13250 (_ BitVec 32)) (x!31614 (_ BitVec 32))) (Undefined!2768) (MissingVacant!2768 (index!13251 (_ BitVec 32))) )
))
(declare-fun lt!155207 () SeekEntryResult!2768)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16196 (_ BitVec 32)) SeekEntryResult!2768)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317979 (= res!172609 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155207))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!317979 (= lt!155207 (Intermediate!2768 false resIndex!52 resX!52))))

(declare-fun b!317981 () Bool)

(declare-fun res!172616 () Bool)

(assert (=> b!317981 (=> (not res!172616) (not e!197627))))

(declare-fun arrayContainsKey!0 (array!16196 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317981 (= res!172616 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun e!197628 () Bool)

(declare-fun b!317982 () Bool)

(declare-fun lt!155205 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!155206 () array!16196)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!317982 (= e!197628 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155206 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155205 k0!2441 lt!155206 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317982 (= lt!155206 (array!16197 (store (arr!7663 a!3293) i!1240 k0!2441) (size!8015 a!3293)))))

(declare-fun b!317983 () Bool)

(declare-fun res!172610 () Bool)

(assert (=> b!317983 (=> (not res!172610) (not e!197627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16196 (_ BitVec 32)) Bool)

(assert (=> b!317983 (= res!172610 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317984 () Bool)

(declare-fun res!172611 () Bool)

(assert (=> b!317984 (=> (not res!172611) (not e!197627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317984 (= res!172611 (validKeyInArray!0 k0!2441))))

(declare-fun b!317985 () Bool)

(declare-fun e!197630 () Bool)

(assert (=> b!317985 (= e!197630 (not true))))

(assert (=> b!317985 e!197628))

(declare-fun res!172615 () Bool)

(assert (=> b!317985 (=> (not res!172615) (not e!197628))))

(declare-fun lt!155208 () SeekEntryResult!2768)

(assert (=> b!317985 (= res!172615 (= lt!155208 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155205 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317985 (= lt!155205 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!317986 () Bool)

(assert (=> b!317986 (= e!197631 e!197630)))

(declare-fun res!172612 () Bool)

(assert (=> b!317986 (=> (not res!172612) (not e!197630))))

(assert (=> b!317986 (= res!172612 (and (= lt!155208 lt!155207) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7663 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317986 (= lt!155208 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun res!172614 () Bool)

(assert (=> start!31812 (=> (not res!172614) (not e!197627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31812 (= res!172614 (validMask!0 mask!3709))))

(assert (=> start!31812 e!197627))

(declare-fun array_inv!5613 (array!16196) Bool)

(assert (=> start!31812 (array_inv!5613 a!3293)))

(assert (=> start!31812 true))

(declare-fun b!317980 () Bool)

(declare-fun res!172608 () Bool)

(assert (=> b!317980 (=> (not res!172608) (not e!197627))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16196 (_ BitVec 32)) SeekEntryResult!2768)

(assert (=> b!317980 (= res!172608 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2768 i!1240)))))

(declare-fun b!317987 () Bool)

(declare-fun res!172617 () Bool)

(assert (=> b!317987 (=> (not res!172617) (not e!197631))))

(assert (=> b!317987 (= res!172617 (and (= (select (arr!7663 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8015 a!3293))))))

(declare-fun b!317988 () Bool)

(declare-fun res!172613 () Bool)

(assert (=> b!317988 (=> (not res!172613) (not e!197627))))

(assert (=> b!317988 (= res!172613 (and (= (size!8015 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8015 a!3293))))))

(assert (= (and start!31812 res!172614) b!317988))

(assert (= (and b!317988 res!172613) b!317984))

(assert (= (and b!317984 res!172611) b!317981))

(assert (= (and b!317981 res!172616) b!317980))

(assert (= (and b!317980 res!172608) b!317983))

(assert (= (and b!317983 res!172610) b!317979))

(assert (= (and b!317979 res!172609) b!317987))

(assert (= (and b!317987 res!172617) b!317986))

(assert (= (and b!317986 res!172612) b!317985))

(assert (= (and b!317985 res!172615) b!317982))

(declare-fun m!326875 () Bool)

(assert (=> b!317986 m!326875))

(declare-fun m!326877 () Bool)

(assert (=> b!317986 m!326877))

(declare-fun m!326879 () Bool)

(assert (=> b!317983 m!326879))

(declare-fun m!326881 () Bool)

(assert (=> start!31812 m!326881))

(declare-fun m!326883 () Bool)

(assert (=> start!31812 m!326883))

(declare-fun m!326885 () Bool)

(assert (=> b!317984 m!326885))

(declare-fun m!326887 () Bool)

(assert (=> b!317981 m!326887))

(declare-fun m!326889 () Bool)

(assert (=> b!317980 m!326889))

(declare-fun m!326891 () Bool)

(assert (=> b!317985 m!326891))

(declare-fun m!326893 () Bool)

(assert (=> b!317985 m!326893))

(declare-fun m!326895 () Bool)

(assert (=> b!317979 m!326895))

(assert (=> b!317979 m!326895))

(declare-fun m!326897 () Bool)

(assert (=> b!317979 m!326897))

(declare-fun m!326899 () Bool)

(assert (=> b!317987 m!326899))

(declare-fun m!326901 () Bool)

(assert (=> b!317982 m!326901))

(declare-fun m!326903 () Bool)

(assert (=> b!317982 m!326903))

(declare-fun m!326905 () Bool)

(assert (=> b!317982 m!326905))

(check-sat (not b!317982) (not b!317986) (not start!31812) (not b!317983) (not b!317979) (not b!317985) (not b!317980) (not b!317981) (not b!317984))
(check-sat)
