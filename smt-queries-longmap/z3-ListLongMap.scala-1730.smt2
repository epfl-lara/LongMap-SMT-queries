; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31818 () Bool)

(assert start!31818)

(declare-fun res!172579 () Bool)

(declare-fun e!197533 () Bool)

(assert (=> start!31818 (=> (not res!172579) (not e!197533))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31818 (= res!172579 (validMask!0 mask!3709))))

(assert (=> start!31818 e!197533))

(declare-datatypes ((array!16193 0))(
  ( (array!16194 (arr!7662 (Array (_ BitVec 32) (_ BitVec 64))) (size!8015 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16193)

(declare-fun array_inv!5634 (array!16193) Bool)

(assert (=> start!31818 (array_inv!5634 a!3293)))

(assert (=> start!31818 true))

(declare-fun b!317847 () Bool)

(declare-fun res!172578 () Bool)

(assert (=> b!317847 (=> (not res!172578) (not e!197533))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317847 (= res!172578 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317848 () Bool)

(declare-fun e!197534 () Bool)

(assert (=> b!317848 (= e!197533 e!197534)))

(declare-fun res!172575 () Bool)

(assert (=> b!317848 (=> (not res!172575) (not e!197534))))

(declare-datatypes ((SeekEntryResult!2801 0))(
  ( (MissingZero!2801 (index!13380 (_ BitVec 32))) (Found!2801 (index!13381 (_ BitVec 32))) (Intermediate!2801 (undefined!3613 Bool) (index!13382 (_ BitVec 32)) (x!31653 (_ BitVec 32))) (Undefined!2801) (MissingVacant!2801 (index!13383 (_ BitVec 32))) )
))
(declare-fun lt!154988 () SeekEntryResult!2801)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16193 (_ BitVec 32)) SeekEntryResult!2801)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317848 (= res!172575 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154988))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!317848 (= lt!154988 (Intermediate!2801 false resIndex!52 resX!52))))

(declare-fun b!317849 () Bool)

(declare-fun e!197530 () Bool)

(assert (=> b!317849 (= e!197530 (not true))))

(declare-fun e!197531 () Bool)

(assert (=> b!317849 e!197531))

(declare-fun res!172580 () Bool)

(assert (=> b!317849 (=> (not res!172580) (not e!197531))))

(declare-fun lt!154989 () SeekEntryResult!2801)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!154991 () (_ BitVec 32))

(assert (=> b!317849 (= res!172580 (= lt!154989 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154991 k0!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317849 (= lt!154991 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317850 () Bool)

(assert (=> b!317850 (= e!197534 e!197530)))

(declare-fun res!172577 () Bool)

(assert (=> b!317850 (=> (not res!172577) (not e!197530))))

(assert (=> b!317850 (= res!172577 (and (= lt!154989 lt!154988) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7662 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317850 (= lt!154989 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317851 () Bool)

(declare-fun res!172573 () Bool)

(assert (=> b!317851 (=> (not res!172573) (not e!197533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16193 (_ BitVec 32)) Bool)

(assert (=> b!317851 (= res!172573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317852 () Bool)

(declare-fun res!172572 () Bool)

(assert (=> b!317852 (=> (not res!172572) (not e!197533))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317852 (= res!172572 (and (= (size!8015 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8015 a!3293))))))

(declare-fun b!317853 () Bool)

(declare-fun res!172581 () Bool)

(assert (=> b!317853 (=> (not res!172581) (not e!197533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317853 (= res!172581 (validKeyInArray!0 k0!2441))))

(declare-fun b!317854 () Bool)

(declare-fun res!172574 () Bool)

(assert (=> b!317854 (=> (not res!172574) (not e!197534))))

(assert (=> b!317854 (= res!172574 (and (= (select (arr!7662 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8015 a!3293))))))

(declare-fun lt!154990 () array!16193)

(declare-fun b!317855 () Bool)

(assert (=> b!317855 (= e!197531 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!154990 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154991 k0!2441 lt!154990 mask!3709)))))

(assert (=> b!317855 (= lt!154990 (array!16194 (store (arr!7662 a!3293) i!1240 k0!2441) (size!8015 a!3293)))))

(declare-fun b!317856 () Bool)

(declare-fun res!172576 () Bool)

(assert (=> b!317856 (=> (not res!172576) (not e!197533))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16193 (_ BitVec 32)) SeekEntryResult!2801)

(assert (=> b!317856 (= res!172576 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2801 i!1240)))))

(assert (= (and start!31818 res!172579) b!317852))

(assert (= (and b!317852 res!172572) b!317853))

(assert (= (and b!317853 res!172581) b!317847))

(assert (= (and b!317847 res!172578) b!317856))

(assert (= (and b!317856 res!172576) b!317851))

(assert (= (and b!317851 res!172573) b!317848))

(assert (= (and b!317848 res!172575) b!317854))

(assert (= (and b!317854 res!172574) b!317850))

(assert (= (and b!317850 res!172577) b!317849))

(assert (= (and b!317849 res!172580) b!317855))

(declare-fun m!326071 () Bool)

(assert (=> b!317851 m!326071))

(declare-fun m!326073 () Bool)

(assert (=> b!317854 m!326073))

(declare-fun m!326075 () Bool)

(assert (=> b!317850 m!326075))

(declare-fun m!326077 () Bool)

(assert (=> b!317850 m!326077))

(declare-fun m!326079 () Bool)

(assert (=> b!317853 m!326079))

(declare-fun m!326081 () Bool)

(assert (=> b!317848 m!326081))

(assert (=> b!317848 m!326081))

(declare-fun m!326083 () Bool)

(assert (=> b!317848 m!326083))

(declare-fun m!326085 () Bool)

(assert (=> b!317849 m!326085))

(declare-fun m!326087 () Bool)

(assert (=> b!317849 m!326087))

(declare-fun m!326089 () Bool)

(assert (=> b!317847 m!326089))

(declare-fun m!326091 () Bool)

(assert (=> b!317855 m!326091))

(declare-fun m!326093 () Bool)

(assert (=> b!317855 m!326093))

(declare-fun m!326095 () Bool)

(assert (=> b!317855 m!326095))

(declare-fun m!326097 () Bool)

(assert (=> start!31818 m!326097))

(declare-fun m!326099 () Bool)

(assert (=> start!31818 m!326099))

(declare-fun m!326101 () Bool)

(assert (=> b!317856 m!326101))

(check-sat (not b!317851) (not b!317856) (not b!317847) (not b!317855) (not b!317853) (not start!31818) (not b!317849) (not b!317850) (not b!317848))
(check-sat)
