; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52806 () Bool)

(assert start!52806)

(declare-datatypes ((SeekEntryResult!5635 0))(
  ( (MissingZero!5635 (index!24767 (_ BitVec 32))) (Found!5635 (index!24768 (_ BitVec 32))) (Intermediate!5635 (undefined!6447 Bool) (index!24769 (_ BitVec 32)) (x!53815 (_ BitVec 32))) (Undefined!5635) (MissingVacant!5635 (index!24770 (_ BitVec 32))) )
))
(declare-fun lt!262834 () SeekEntryResult!5635)

(declare-fun b!575357 () Bool)

(declare-fun lt!262828 () (_ BitVec 64))

(declare-datatypes ((array!35898 0))(
  ( (array!35899 (arr!17230 (Array (_ BitVec 32) (_ BitVec 64))) (size!17594 (_ BitVec 32))) )
))
(declare-fun lt!262827 () array!35898)

(declare-fun e!331066 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35898 (_ BitVec 32)) SeekEntryResult!5635)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35898 (_ BitVec 32)) SeekEntryResult!5635)

(assert (=> b!575357 (= e!331066 (= (seekEntryOrOpen!0 lt!262828 lt!262827 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!53815 lt!262834) (index!24769 lt!262834) (index!24769 lt!262834) lt!262828 lt!262827 mask!3119)))))

(declare-fun b!575358 () Bool)

(declare-fun e!331067 () Bool)

(declare-fun e!331064 () Bool)

(assert (=> b!575358 (= e!331067 e!331064)))

(declare-fun res!363671 () Bool)

(assert (=> b!575358 (=> res!363671 e!331064)))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!262837 () (_ BitVec 64))

(declare-fun a!3118 () array!35898)

(assert (=> b!575358 (= res!363671 (or (= lt!262837 (select (arr!17230 a!3118) j!142)) (= lt!262837 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!575358 (= lt!262837 (select (arr!17230 a!3118) (index!24769 lt!262834)))))

(declare-fun b!575359 () Bool)

(declare-fun res!363669 () Bool)

(declare-fun e!331062 () Bool)

(assert (=> b!575359 (=> (not res!363669) (not e!331062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35898 (_ BitVec 32)) Bool)

(assert (=> b!575359 (= res!363669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!575360 () Bool)

(declare-fun res!363679 () Bool)

(declare-fun e!331063 () Bool)

(assert (=> b!575360 (=> (not res!363679) (not e!331063))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!575360 (= res!363679 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!575361 () Bool)

(declare-fun res!363678 () Bool)

(assert (=> b!575361 (=> (not res!363678) (not e!331063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!575361 (= res!363678 (validKeyInArray!0 k0!1914))))

(declare-fun res!363672 () Bool)

(assert (=> start!52806 (=> (not res!363672) (not e!331063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52806 (= res!363672 (validMask!0 mask!3119))))

(assert (=> start!52806 e!331063))

(assert (=> start!52806 true))

(declare-fun array_inv!13089 (array!35898) Bool)

(assert (=> start!52806 (array_inv!13089 a!3118)))

(declare-fun b!575362 () Bool)

(declare-fun e!331068 () Bool)

(assert (=> b!575362 (= e!331062 e!331068)))

(declare-fun res!363668 () Bool)

(assert (=> b!575362 (=> (not res!363668) (not e!331068))))

(declare-fun lt!262833 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35898 (_ BitVec 32)) SeekEntryResult!5635)

(assert (=> b!575362 (= res!363668 (= lt!262834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262833 lt!262828 lt!262827 mask!3119)))))

(declare-fun lt!262832 () (_ BitVec 32))

(assert (=> b!575362 (= lt!262834 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!262832 (select (arr!17230 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!575362 (= lt!262833 (toIndex!0 lt!262828 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!575362 (= lt!262828 (select (store (arr!17230 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!575362 (= lt!262832 (toIndex!0 (select (arr!17230 a!3118) j!142) mask!3119))))

(assert (=> b!575362 (= lt!262827 (array!35899 (store (arr!17230 a!3118) i!1132 k0!1914) (size!17594 a!3118)))))

(declare-fun b!575363 () Bool)

(declare-fun res!363677 () Bool)

(assert (=> b!575363 (=> (not res!363677) (not e!331062))))

(declare-datatypes ((List!11217 0))(
  ( (Nil!11214) (Cons!11213 (h!12255 (_ BitVec 64)) (t!17437 List!11217)) )
))
(declare-fun arrayNoDuplicates!0 (array!35898 (_ BitVec 32) List!11217) Bool)

(assert (=> b!575363 (= res!363677 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11214))))

(declare-fun b!575364 () Bool)

(assert (=> b!575364 (= e!331063 e!331062)))

(declare-fun res!363675 () Bool)

(assert (=> b!575364 (=> (not res!363675) (not e!331062))))

(declare-fun lt!262829 () SeekEntryResult!5635)

(assert (=> b!575364 (= res!363675 (or (= lt!262829 (MissingZero!5635 i!1132)) (= lt!262829 (MissingVacant!5635 i!1132))))))

(assert (=> b!575364 (= lt!262829 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!575365 () Bool)

(declare-fun res!363673 () Bool)

(assert (=> b!575365 (=> (not res!363673) (not e!331063))))

(assert (=> b!575365 (= res!363673 (and (= (size!17594 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17594 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17594 a!3118)) (not (= i!1132 j!142))))))

(declare-fun lt!262835 () SeekEntryResult!5635)

(declare-fun lt!262836 () SeekEntryResult!5635)

(declare-fun b!575366 () Bool)

(assert (=> b!575366 (= e!331064 (or (bvslt (index!24769 lt!262834) #b00000000000000000000000000000000) (bvsge (index!24769 lt!262834) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsgt (x!53815 lt!262834) #b01111111111111111111111111111110) (bvslt (x!53815 lt!262834) #b00000000000000000000000000000000) (not (= lt!262837 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (store (arr!17230 a!3118) i!1132 k0!1914) (index!24769 lt!262834)) #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!262835 lt!262836)))))

(assert (=> b!575366 e!331066))

(declare-fun res!363676 () Bool)

(assert (=> b!575366 (=> (not res!363676) (not e!331066))))

(declare-fun lt!262831 () SeekEntryResult!5635)

(assert (=> b!575366 (= res!363676 (= lt!262831 lt!262835))))

(assert (=> b!575366 (= lt!262835 (seekKeyOrZeroReturnVacant!0 (x!53815 lt!262834) (index!24769 lt!262834) (index!24769 lt!262834) (select (arr!17230 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!575367 () Bool)

(declare-fun res!363674 () Bool)

(assert (=> b!575367 (=> (not res!363674) (not e!331063))))

(assert (=> b!575367 (= res!363674 (validKeyInArray!0 (select (arr!17230 a!3118) j!142)))))

(declare-fun b!575368 () Bool)

(assert (=> b!575368 (= e!331068 (not e!331067))))

(declare-fun res!363670 () Bool)

(assert (=> b!575368 (=> res!363670 e!331067)))

(get-info :version)

(assert (=> b!575368 (= res!363670 (or (undefined!6447 lt!262834) (not ((_ is Intermediate!5635) lt!262834))))))

(assert (=> b!575368 (= lt!262831 lt!262836)))

(assert (=> b!575368 (= lt!262836 (Found!5635 j!142))))

(assert (=> b!575368 (= lt!262831 (seekEntryOrOpen!0 (select (arr!17230 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!575368 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18043 0))(
  ( (Unit!18044) )
))
(declare-fun lt!262830 () Unit!18043)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35898 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18043)

(assert (=> b!575368 (= lt!262830 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52806 res!363672) b!575365))

(assert (= (and b!575365 res!363673) b!575367))

(assert (= (and b!575367 res!363674) b!575361))

(assert (= (and b!575361 res!363678) b!575360))

(assert (= (and b!575360 res!363679) b!575364))

(assert (= (and b!575364 res!363675) b!575359))

(assert (= (and b!575359 res!363669) b!575363))

(assert (= (and b!575363 res!363677) b!575362))

(assert (= (and b!575362 res!363668) b!575368))

(assert (= (and b!575368 (not res!363670)) b!575358))

(assert (= (and b!575358 (not res!363671)) b!575366))

(assert (= (and b!575366 res!363676) b!575357))

(declare-fun m!554261 () Bool)

(assert (=> b!575361 m!554261))

(declare-fun m!554263 () Bool)

(assert (=> b!575367 m!554263))

(assert (=> b!575367 m!554263))

(declare-fun m!554265 () Bool)

(assert (=> b!575367 m!554265))

(declare-fun m!554267 () Bool)

(assert (=> start!52806 m!554267))

(declare-fun m!554269 () Bool)

(assert (=> start!52806 m!554269))

(declare-fun m!554271 () Bool)

(assert (=> b!575364 m!554271))

(declare-fun m!554273 () Bool)

(assert (=> b!575357 m!554273))

(declare-fun m!554275 () Bool)

(assert (=> b!575357 m!554275))

(declare-fun m!554277 () Bool)

(assert (=> b!575366 m!554277))

(declare-fun m!554279 () Bool)

(assert (=> b!575366 m!554279))

(assert (=> b!575366 m!554263))

(assert (=> b!575366 m!554263))

(declare-fun m!554281 () Bool)

(assert (=> b!575366 m!554281))

(assert (=> b!575362 m!554263))

(declare-fun m!554283 () Bool)

(assert (=> b!575362 m!554283))

(assert (=> b!575362 m!554263))

(declare-fun m!554285 () Bool)

(assert (=> b!575362 m!554285))

(assert (=> b!575362 m!554263))

(declare-fun m!554287 () Bool)

(assert (=> b!575362 m!554287))

(declare-fun m!554289 () Bool)

(assert (=> b!575362 m!554289))

(assert (=> b!575362 m!554277))

(declare-fun m!554291 () Bool)

(assert (=> b!575362 m!554291))

(assert (=> b!575368 m!554263))

(assert (=> b!575368 m!554263))

(declare-fun m!554293 () Bool)

(assert (=> b!575368 m!554293))

(declare-fun m!554295 () Bool)

(assert (=> b!575368 m!554295))

(declare-fun m!554297 () Bool)

(assert (=> b!575368 m!554297))

(declare-fun m!554299 () Bool)

(assert (=> b!575359 m!554299))

(assert (=> b!575358 m!554263))

(declare-fun m!554301 () Bool)

(assert (=> b!575358 m!554301))

(declare-fun m!554303 () Bool)

(assert (=> b!575360 m!554303))

(declare-fun m!554305 () Bool)

(assert (=> b!575363 m!554305))

(check-sat (not start!52806) (not b!575367) (not b!575364) (not b!575363) (not b!575359) (not b!575366) (not b!575362) (not b!575368) (not b!575361) (not b!575360) (not b!575357))
(check-sat)
