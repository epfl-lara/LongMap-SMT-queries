; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31914 () Bool)

(assert start!31914)

(declare-fun b!318774 () Bool)

(declare-fun res!173312 () Bool)

(declare-fun e!198023 () Bool)

(assert (=> b!318774 (=> (not res!173312) (not e!198023))))

(declare-datatypes ((array!16238 0))(
  ( (array!16239 (arr!7683 (Array (_ BitVec 32) (_ BitVec 64))) (size!8036 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16238)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318774 (= res!173312 (and (= (size!8036 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8036 a!3293))))))

(declare-datatypes ((SeekEntryResult!2822 0))(
  ( (MissingZero!2822 (index!13464 (_ BitVec 32))) (Found!2822 (index!13465 (_ BitVec 32))) (Intermediate!2822 (undefined!3634 Bool) (index!13466 (_ BitVec 32)) (x!31739 (_ BitVec 32))) (Undefined!2822) (MissingVacant!2822 (index!13467 (_ BitVec 32))) )
))
(declare-fun lt!155378 () SeekEntryResult!2822)

(declare-fun b!318775 () Bool)

(declare-fun e!198022 () Bool)

(declare-fun lt!155377 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lt!155374 () SeekEntryResult!2822)

(assert (=> b!318775 (= e!198022 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155377 #b00000000000000000000000000000000) (bvsge lt!155377 (size!8036 a!3293)) (not (= lt!155374 lt!155378)) (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1427)) (bvsub #b01111111111111111111111111111110 x!1427)))))))

(declare-fun e!198024 () Bool)

(assert (=> b!318775 e!198024))

(declare-fun res!173310 () Bool)

(assert (=> b!318775 (=> (not res!173310) (not e!198024))))

(declare-fun lt!155376 () SeekEntryResult!2822)

(assert (=> b!318775 (= res!173310 (= lt!155376 lt!155374))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16238 (_ BitVec 32)) SeekEntryResult!2822)

(assert (=> b!318775 (= lt!155374 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155377 k0!2441 a!3293 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318775 (= lt!155377 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!318776 () Bool)

(declare-fun res!173308 () Bool)

(declare-fun e!198026 () Bool)

(assert (=> b!318776 (=> (not res!173308) (not e!198026))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!318776 (= res!173308 (and (= (select (arr!7683 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8036 a!3293))))))

(declare-fun b!318777 () Bool)

(declare-fun res!173309 () Bool)

(assert (=> b!318777 (=> (not res!173309) (not e!198023))))

(declare-fun arrayContainsKey!0 (array!16238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!318777 (= res!173309 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!318778 () Bool)

(assert (=> b!318778 (= e!198023 e!198026)))

(declare-fun res!173304 () Bool)

(assert (=> b!318778 (=> (not res!173304) (not e!198026))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318778 (= res!173304 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155378))))

(assert (=> b!318778 (= lt!155378 (Intermediate!2822 false resIndex!52 resX!52))))

(declare-fun b!318779 () Bool)

(declare-fun res!173307 () Bool)

(assert (=> b!318779 (=> (not res!173307) (not e!198023))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16238 (_ BitVec 32)) Bool)

(assert (=> b!318779 (= res!173307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun res!173305 () Bool)

(assert (=> start!31914 (=> (not res!173305) (not e!198023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31914 (= res!173305 (validMask!0 mask!3709))))

(assert (=> start!31914 e!198023))

(declare-fun array_inv!5655 (array!16238) Bool)

(assert (=> start!31914 (array_inv!5655 a!3293)))

(assert (=> start!31914 true))

(declare-fun b!318780 () Bool)

(declare-fun res!173311 () Bool)

(assert (=> b!318780 (=> (not res!173311) (not e!198023))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!318780 (= res!173311 (validKeyInArray!0 k0!2441))))

(declare-fun b!318781 () Bool)

(declare-fun lt!155375 () array!16238)

(assert (=> b!318781 (= e!198024 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155375 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155377 k0!2441 lt!155375 mask!3709)))))

(assert (=> b!318781 (= lt!155375 (array!16239 (store (arr!7683 a!3293) i!1240 k0!2441) (size!8036 a!3293)))))

(declare-fun b!318782 () Bool)

(assert (=> b!318782 (= e!198026 e!198022)))

(declare-fun res!173306 () Bool)

(assert (=> b!318782 (=> (not res!173306) (not e!198022))))

(assert (=> b!318782 (= res!173306 (and (= lt!155376 lt!155378) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7683 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318782 (= lt!155376 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!318783 () Bool)

(declare-fun res!173313 () Bool)

(assert (=> b!318783 (=> (not res!173313) (not e!198023))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16238 (_ BitVec 32)) SeekEntryResult!2822)

(assert (=> b!318783 (= res!173313 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2822 i!1240)))))

(assert (= (and start!31914 res!173305) b!318774))

(assert (= (and b!318774 res!173312) b!318780))

(assert (= (and b!318780 res!173311) b!318777))

(assert (= (and b!318777 res!173309) b!318783))

(assert (= (and b!318783 res!173313) b!318779))

(assert (= (and b!318779 res!173307) b!318778))

(assert (= (and b!318778 res!173304) b!318776))

(assert (= (and b!318776 res!173308) b!318782))

(assert (= (and b!318782 res!173306) b!318775))

(assert (= (and b!318775 res!173310) b!318781))

(declare-fun m!326917 () Bool)

(assert (=> b!318783 m!326917))

(declare-fun m!326919 () Bool)

(assert (=> b!318779 m!326919))

(declare-fun m!326921 () Bool)

(assert (=> b!318782 m!326921))

(declare-fun m!326923 () Bool)

(assert (=> b!318782 m!326923))

(declare-fun m!326925 () Bool)

(assert (=> b!318781 m!326925))

(declare-fun m!326927 () Bool)

(assert (=> b!318781 m!326927))

(declare-fun m!326929 () Bool)

(assert (=> b!318781 m!326929))

(declare-fun m!326931 () Bool)

(assert (=> b!318777 m!326931))

(declare-fun m!326933 () Bool)

(assert (=> b!318775 m!326933))

(declare-fun m!326935 () Bool)

(assert (=> b!318775 m!326935))

(declare-fun m!326937 () Bool)

(assert (=> b!318776 m!326937))

(declare-fun m!326939 () Bool)

(assert (=> b!318778 m!326939))

(assert (=> b!318778 m!326939))

(declare-fun m!326941 () Bool)

(assert (=> b!318778 m!326941))

(declare-fun m!326943 () Bool)

(assert (=> start!31914 m!326943))

(declare-fun m!326945 () Bool)

(assert (=> start!31914 m!326945))

(declare-fun m!326947 () Bool)

(assert (=> b!318780 m!326947))

(check-sat (not b!318779) (not b!318775) (not b!318781) (not b!318780) (not start!31914) (not b!318782) (not b!318778) (not b!318777) (not b!318783))
(check-sat)
