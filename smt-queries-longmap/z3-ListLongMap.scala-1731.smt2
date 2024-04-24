; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31824 () Bool)

(assert start!31824)

(declare-fun res!172788 () Bool)

(declare-fun e!197720 () Bool)

(assert (=> start!31824 (=> (not res!172788) (not e!197720))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31824 (= res!172788 (validMask!0 mask!3709))))

(assert (=> start!31824 e!197720))

(declare-datatypes ((array!16208 0))(
  ( (array!16209 (arr!7669 (Array (_ BitVec 32) (_ BitVec 64))) (size!8021 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16208)

(declare-fun array_inv!5619 (array!16208) Bool)

(assert (=> start!31824 (array_inv!5619 a!3293)))

(assert (=> start!31824 true))

(declare-fun b!318159 () Bool)

(declare-fun e!197719 () Bool)

(declare-fun e!197721 () Bool)

(assert (=> b!318159 (= e!197719 e!197721)))

(declare-fun res!172792 () Bool)

(assert (=> b!318159 (=> (not res!172792) (not e!197721))))

(declare-datatypes ((SeekEntryResult!2774 0))(
  ( (MissingZero!2774 (index!13272 (_ BitVec 32))) (Found!2774 (index!13273 (_ BitVec 32))) (Intermediate!2774 (undefined!3586 Bool) (index!13274 (_ BitVec 32)) (x!31636 (_ BitVec 32))) (Undefined!2774) (MissingVacant!2774 (index!13275 (_ BitVec 32))) )
))
(declare-fun lt!155277 () SeekEntryResult!2774)

(declare-fun lt!155280 () SeekEntryResult!2774)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!318159 (= res!172792 (and (= lt!155280 lt!155277) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7669 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16208 (_ BitVec 32)) SeekEntryResult!2774)

(assert (=> b!318159 (= lt!155280 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun lt!155278 () (_ BitVec 32))

(declare-fun e!197717 () Bool)

(declare-fun b!318160 () Bool)

(declare-fun lt!155279 () array!16208)

(assert (=> b!318160 (= e!197717 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155279 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155278 k0!2441 lt!155279 mask!3709)))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318160 (= lt!155279 (array!16209 (store (arr!7669 a!3293) i!1240 k0!2441) (size!8021 a!3293)))))

(declare-fun b!318161 () Bool)

(declare-fun res!172791 () Bool)

(assert (=> b!318161 (=> (not res!172791) (not e!197720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16208 (_ BitVec 32)) Bool)

(assert (=> b!318161 (= res!172791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318162 () Bool)

(declare-fun res!172790 () Bool)

(assert (=> b!318162 (=> (not res!172790) (not e!197719))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!318162 (= res!172790 (and (= (select (arr!7669 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8021 a!3293))))))

(declare-fun b!318163 () Bool)

(declare-fun res!172794 () Bool)

(assert (=> b!318163 (=> (not res!172794) (not e!197720))))

(assert (=> b!318163 (= res!172794 (and (= (size!8021 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8021 a!3293))))))

(declare-fun b!318164 () Bool)

(declare-fun res!172797 () Bool)

(assert (=> b!318164 (=> (not res!172797) (not e!197720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318164 (= res!172797 (validKeyInArray!0 k0!2441))))

(declare-fun b!318165 () Bool)

(assert (=> b!318165 (= e!197720 e!197719)))

(declare-fun res!172796 () Bool)

(assert (=> b!318165 (=> (not res!172796) (not e!197719))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318165 (= res!172796 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155277))))

(assert (=> b!318165 (= lt!155277 (Intermediate!2774 false resIndex!52 resX!52))))

(declare-fun b!318166 () Bool)

(declare-fun res!172789 () Bool)

(assert (=> b!318166 (=> (not res!172789) (not e!197720))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16208 (_ BitVec 32)) SeekEntryResult!2774)

(assert (=> b!318166 (= res!172789 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2774 i!1240)))))

(declare-fun b!318167 () Bool)

(declare-fun res!172795 () Bool)

(assert (=> b!318167 (=> (not res!172795) (not e!197720))))

(declare-fun arrayContainsKey!0 (array!16208 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318167 (= res!172795 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318168 () Bool)

(assert (=> b!318168 (= e!197721 (not true))))

(assert (=> b!318168 e!197717))

(declare-fun res!172793 () Bool)

(assert (=> b!318168 (=> (not res!172793) (not e!197717))))

(assert (=> b!318168 (= res!172793 (= lt!155280 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155278 k0!2441 a!3293 mask!3709)))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318168 (= lt!155278 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(assert (= (and start!31824 res!172788) b!318163))

(assert (= (and b!318163 res!172794) b!318164))

(assert (= (and b!318164 res!172797) b!318167))

(assert (= (and b!318167 res!172795) b!318166))

(assert (= (and b!318166 res!172789) b!318161))

(assert (= (and b!318161 res!172791) b!318165))

(assert (= (and b!318165 res!172796) b!318162))

(assert (= (and b!318162 res!172790) b!318159))

(assert (= (and b!318159 res!172792) b!318168))

(assert (= (and b!318168 res!172793) b!318160))

(declare-fun m!327067 () Bool)

(assert (=> b!318161 m!327067))

(declare-fun m!327069 () Bool)

(assert (=> b!318165 m!327069))

(assert (=> b!318165 m!327069))

(declare-fun m!327071 () Bool)

(assert (=> b!318165 m!327071))

(declare-fun m!327073 () Bool)

(assert (=> b!318167 m!327073))

(declare-fun m!327075 () Bool)

(assert (=> b!318164 m!327075))

(declare-fun m!327077 () Bool)

(assert (=> start!31824 m!327077))

(declare-fun m!327079 () Bool)

(assert (=> start!31824 m!327079))

(declare-fun m!327081 () Bool)

(assert (=> b!318159 m!327081))

(declare-fun m!327083 () Bool)

(assert (=> b!318159 m!327083))

(declare-fun m!327085 () Bool)

(assert (=> b!318160 m!327085))

(declare-fun m!327087 () Bool)

(assert (=> b!318160 m!327087))

(declare-fun m!327089 () Bool)

(assert (=> b!318160 m!327089))

(declare-fun m!327091 () Bool)

(assert (=> b!318168 m!327091))

(declare-fun m!327093 () Bool)

(assert (=> b!318168 m!327093))

(declare-fun m!327095 () Bool)

(assert (=> b!318166 m!327095))

(declare-fun m!327097 () Bool)

(assert (=> b!318162 m!327097))

(check-sat (not b!318164) (not b!318161) (not b!318168) (not start!31824) (not b!318165) (not b!318160) (not b!318166) (not b!318167) (not b!318159))
(check-sat)
