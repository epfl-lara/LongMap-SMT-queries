; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31834 () Bool)

(assert start!31834)

(declare-fun b!318152 () Bool)

(declare-fun res!172736 () Bool)

(declare-fun e!197721 () Bool)

(assert (=> b!318152 (=> (not res!172736) (not e!197721))))

(declare-datatypes ((array!16205 0))(
  ( (array!16206 (arr!7668 (Array (_ BitVec 32) (_ BitVec 64))) (size!8020 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16205)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16205 (_ BitVec 32)) Bool)

(assert (=> b!318152 (= res!172736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!318153 () Bool)

(declare-fun e!197724 () Bool)

(assert (=> b!318153 (= e!197724 (not true))))

(declare-fun e!197723 () Bool)

(assert (=> b!318153 e!197723))

(declare-fun res!172734 () Bool)

(assert (=> b!318153 (=> (not res!172734) (not e!197723))))

(declare-datatypes ((SeekEntryResult!2808 0))(
  ( (MissingZero!2808 (index!13408 (_ BitVec 32))) (Found!2808 (index!13409 (_ BitVec 32))) (Intermediate!2808 (undefined!3620 Bool) (index!13410 (_ BitVec 32)) (x!31665 (_ BitVec 32))) (Undefined!2808) (MissingVacant!2808 (index!13411 (_ BitVec 32))) )
))
(declare-fun lt!155237 () SeekEntryResult!2808)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!155235 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16205 (_ BitVec 32)) SeekEntryResult!2808)

(assert (=> b!318153 (= res!172734 (= lt!155237 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155235 k0!2441 a!3293 mask!3709)))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318153 (= lt!155235 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun res!172735 () Bool)

(assert (=> start!31834 (=> (not res!172735) (not e!197721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31834 (= res!172735 (validMask!0 mask!3709))))

(assert (=> start!31834 e!197721))

(declare-fun array_inv!5631 (array!16205) Bool)

(assert (=> start!31834 (array_inv!5631 a!3293)))

(assert (=> start!31834 true))

(declare-fun b!318154 () Bool)

(declare-fun res!172732 () Bool)

(assert (=> b!318154 (=> (not res!172732) (not e!197721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318154 (= res!172732 (validKeyInArray!0 k0!2441))))

(declare-fun b!318155 () Bool)

(declare-fun res!172740 () Bool)

(declare-fun e!197725 () Bool)

(assert (=> b!318155 (=> (not res!172740) (not e!197725))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318155 (= res!172740 (and (= (select (arr!7668 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8020 a!3293))))))

(declare-fun lt!155236 () array!16205)

(declare-fun b!318156 () Bool)

(assert (=> b!318156 (= e!197723 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155236 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155235 k0!2441 lt!155236 mask!3709)))))

(assert (=> b!318156 (= lt!155236 (array!16206 (store (arr!7668 a!3293) i!1240 k0!2441) (size!8020 a!3293)))))

(declare-fun b!318157 () Bool)

(declare-fun res!172731 () Bool)

(assert (=> b!318157 (=> (not res!172731) (not e!197721))))

(assert (=> b!318157 (= res!172731 (and (= (size!8020 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8020 a!3293))))))

(declare-fun b!318158 () Bool)

(declare-fun res!172739 () Bool)

(assert (=> b!318158 (=> (not res!172739) (not e!197721))))

(declare-fun arrayContainsKey!0 (array!16205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318158 (= res!172739 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318159 () Bool)

(declare-fun res!172733 () Bool)

(assert (=> b!318159 (=> (not res!172733) (not e!197721))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16205 (_ BitVec 32)) SeekEntryResult!2808)

(assert (=> b!318159 (= res!172733 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2808 i!1240)))))

(declare-fun b!318160 () Bool)

(assert (=> b!318160 (= e!197721 e!197725)))

(declare-fun res!172738 () Bool)

(assert (=> b!318160 (=> (not res!172738) (not e!197725))))

(declare-fun lt!155238 () SeekEntryResult!2808)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318160 (= res!172738 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155238))))

(assert (=> b!318160 (= lt!155238 (Intermediate!2808 false resIndex!52 resX!52))))

(declare-fun b!318161 () Bool)

(assert (=> b!318161 (= e!197725 e!197724)))

(declare-fun res!172737 () Bool)

(assert (=> b!318161 (=> (not res!172737) (not e!197724))))

(assert (=> b!318161 (= res!172737 (and (= lt!155237 lt!155238) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7668 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318161 (= lt!155237 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(assert (= (and start!31834 res!172735) b!318157))

(assert (= (and b!318157 res!172731) b!318154))

(assert (= (and b!318154 res!172732) b!318158))

(assert (= (and b!318158 res!172739) b!318159))

(assert (= (and b!318159 res!172733) b!318152))

(assert (= (and b!318152 res!172736) b!318160))

(assert (= (and b!318160 res!172738) b!318155))

(assert (= (and b!318155 res!172740) b!318161))

(assert (= (and b!318161 res!172737) b!318153))

(assert (= (and b!318153 res!172734) b!318156))

(declare-fun m!326833 () Bool)

(assert (=> b!318153 m!326833))

(declare-fun m!326835 () Bool)

(assert (=> b!318153 m!326835))

(declare-fun m!326837 () Bool)

(assert (=> b!318154 m!326837))

(declare-fun m!326839 () Bool)

(assert (=> start!31834 m!326839))

(declare-fun m!326841 () Bool)

(assert (=> start!31834 m!326841))

(declare-fun m!326843 () Bool)

(assert (=> b!318155 m!326843))

(declare-fun m!326845 () Bool)

(assert (=> b!318158 m!326845))

(declare-fun m!326847 () Bool)

(assert (=> b!318161 m!326847))

(declare-fun m!326849 () Bool)

(assert (=> b!318161 m!326849))

(declare-fun m!326851 () Bool)

(assert (=> b!318156 m!326851))

(declare-fun m!326853 () Bool)

(assert (=> b!318156 m!326853))

(declare-fun m!326855 () Bool)

(assert (=> b!318156 m!326855))

(declare-fun m!326857 () Bool)

(assert (=> b!318152 m!326857))

(declare-fun m!326859 () Bool)

(assert (=> b!318159 m!326859))

(declare-fun m!326861 () Bool)

(assert (=> b!318160 m!326861))

(assert (=> b!318160 m!326861))

(declare-fun m!326863 () Bool)

(assert (=> b!318160 m!326863))

(check-sat (not b!318153) (not b!318160) (not b!318152) (not start!31834) (not b!318158) (not b!318156) (not b!318159) (not b!318161) (not b!318154))
(check-sat)
