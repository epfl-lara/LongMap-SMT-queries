; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31488 () Bool)

(assert start!31488)

(declare-fun b!314956 () Bool)

(declare-fun res!170555 () Bool)

(declare-fun e!196076 () Bool)

(assert (=> b!314956 (=> (not res!170555) (not e!196076))))

(declare-datatypes ((array!16067 0))(
  ( (array!16068 (arr!7605 (Array (_ BitVec 32) (_ BitVec 64))) (size!7958 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16067)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!314956 (= res!170555 (and (= (size!7958 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7958 a!3293))))))

(declare-fun b!314957 () Bool)

(declare-fun res!170557 () Bool)

(assert (=> b!314957 (=> (not res!170557) (not e!196076))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16067 (_ BitVec 32)) Bool)

(assert (=> b!314957 (= res!170557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!314958 () Bool)

(declare-fun res!170556 () Bool)

(declare-fun e!196079 () Bool)

(assert (=> b!314958 (=> (not res!170556) (not e!196079))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!314958 (= res!170556 (and (= (select (arr!7605 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7958 a!3293))))))

(declare-fun b!314959 () Bool)

(declare-fun e!196077 () Bool)

(assert (=> b!314959 (= e!196079 e!196077)))

(declare-fun res!170552 () Bool)

(assert (=> b!314959 (=> (not res!170552) (not e!196077))))

(declare-datatypes ((SeekEntryResult!2744 0))(
  ( (MissingZero!2744 (index!13152 (_ BitVec 32))) (Found!2744 (index!13153 (_ BitVec 32))) (Intermediate!2744 (undefined!3556 Bool) (index!13154 (_ BitVec 32)) (x!31408 (_ BitVec 32))) (Undefined!2744) (MissingVacant!2744 (index!13155 (_ BitVec 32))) )
))
(declare-fun lt!153948 () SeekEntryResult!2744)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun lt!153950 () SeekEntryResult!2744)

(assert (=> b!314959 (= res!170552 (and (= lt!153948 lt!153950) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7605 a!3293) index!1781) k0!2441)) (= x!1427 resX!52) (not (= resIndex!52 index!1781)) (not (= (select (arr!7605 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7605 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16067 (_ BitVec 32)) SeekEntryResult!2744)

(assert (=> b!314959 (= lt!153948 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!314960 () Bool)

(assert (=> b!314960 (= e!196076 e!196079)))

(declare-fun res!170551 () Bool)

(assert (=> b!314960 (=> (not res!170551) (not e!196079))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314960 (= res!170551 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153950))))

(assert (=> b!314960 (= lt!153950 (Intermediate!2744 false resIndex!52 resX!52))))

(declare-fun res!170559 () Bool)

(assert (=> start!31488 (=> (not res!170559) (not e!196076))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31488 (= res!170559 (validMask!0 mask!3709))))

(assert (=> start!31488 e!196076))

(declare-fun array_inv!5577 (array!16067) Bool)

(assert (=> start!31488 (array_inv!5577 a!3293)))

(assert (=> start!31488 true))

(declare-fun b!314961 () Bool)

(declare-fun lt!153949 () SeekEntryResult!2744)

(get-info :version)

(assert (=> b!314961 (= e!196077 (not ((_ is Intermediate!2744) lt!153949)))))

(assert (=> b!314961 (= lt!153948 lt!153949)))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!314961 (= lt!153949 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!314962 () Bool)

(declare-fun res!170553 () Bool)

(assert (=> b!314962 (=> (not res!170553) (not e!196076))))

(declare-fun arrayContainsKey!0 (array!16067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!314962 (= res!170553 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!314963 () Bool)

(declare-fun res!170558 () Bool)

(assert (=> b!314963 (=> (not res!170558) (not e!196076))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16067 (_ BitVec 32)) SeekEntryResult!2744)

(assert (=> b!314963 (= res!170558 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2744 i!1240)))))

(declare-fun b!314964 () Bool)

(declare-fun res!170554 () Bool)

(assert (=> b!314964 (=> (not res!170554) (not e!196076))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!314964 (= res!170554 (validKeyInArray!0 k0!2441))))

(assert (= (and start!31488 res!170559) b!314956))

(assert (= (and b!314956 res!170555) b!314964))

(assert (= (and b!314964 res!170554) b!314962))

(assert (= (and b!314962 res!170553) b!314963))

(assert (= (and b!314963 res!170558) b!314957))

(assert (= (and b!314957 res!170557) b!314960))

(assert (= (and b!314960 res!170551) b!314958))

(assert (= (and b!314958 res!170556) b!314959))

(assert (= (and b!314959 res!170552) b!314961))

(declare-fun m!323809 () Bool)

(assert (=> b!314960 m!323809))

(assert (=> b!314960 m!323809))

(declare-fun m!323811 () Bool)

(assert (=> b!314960 m!323811))

(declare-fun m!323813 () Bool)

(assert (=> b!314962 m!323813))

(declare-fun m!323815 () Bool)

(assert (=> b!314964 m!323815))

(declare-fun m!323817 () Bool)

(assert (=> b!314959 m!323817))

(declare-fun m!323819 () Bool)

(assert (=> b!314959 m!323819))

(declare-fun m!323821 () Bool)

(assert (=> b!314957 m!323821))

(declare-fun m!323823 () Bool)

(assert (=> b!314958 m!323823))

(declare-fun m!323825 () Bool)

(assert (=> b!314961 m!323825))

(assert (=> b!314961 m!323825))

(declare-fun m!323827 () Bool)

(assert (=> b!314961 m!323827))

(declare-fun m!323829 () Bool)

(assert (=> start!31488 m!323829))

(declare-fun m!323831 () Bool)

(assert (=> start!31488 m!323831))

(declare-fun m!323833 () Bool)

(assert (=> b!314963 m!323833))

(check-sat (not b!314957) (not b!314961) (not start!31488) (not b!314960) (not b!314963) (not b!314964) (not b!314959) (not b!314962))
(check-sat)
