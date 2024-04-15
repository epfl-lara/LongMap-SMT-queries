; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64460 () Bool)

(assert start!64460)

(declare-fun b!725065 () Bool)

(declare-fun res!486324 () Bool)

(declare-fun e!406041 () Bool)

(assert (=> b!725065 (=> (not res!486324) (not e!406041))))

(declare-datatypes ((array!40995 0))(
  ( (array!40996 (arr!19619 (Array (_ BitVec 32) (_ BitVec 64))) (size!20040 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40995)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!725065 (= res!486324 (and (= (size!20040 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20040 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20040 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725066 () Bool)

(declare-fun res!486323 () Bool)

(declare-fun e!406043 () Bool)

(assert (=> b!725066 (=> (not res!486323) (not e!406043))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!725066 (= res!486323 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20040 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20040 a!3186))))))

(declare-fun b!725067 () Bool)

(declare-fun e!406039 () Bool)

(declare-fun e!406045 () Bool)

(assert (=> b!725067 (= e!406039 e!406045)))

(declare-fun res!486321 () Bool)

(assert (=> b!725067 (=> (not res!486321) (not e!406045))))

(declare-datatypes ((SeekEntryResult!7216 0))(
  ( (MissingZero!7216 (index!31232 (_ BitVec 32))) (Found!7216 (index!31233 (_ BitVec 32))) (Intermediate!7216 (undefined!8028 Bool) (index!31234 (_ BitVec 32)) (x!62237 (_ BitVec 32))) (Undefined!7216) (MissingVacant!7216 (index!31235 (_ BitVec 32))) )
))
(declare-fun lt!321061 () SeekEntryResult!7216)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40995 (_ BitVec 32)) SeekEntryResult!7216)

(assert (=> b!725067 (= res!486321 (= (seekEntryOrOpen!0 (select (arr!19619 a!3186) j!159) a!3186 mask!3328) lt!321061))))

(assert (=> b!725067 (= lt!321061 (Found!7216 j!159))))

(declare-fun e!406042 () Bool)

(declare-fun b!725068 () Bool)

(declare-fun lt!321062 () SeekEntryResult!7216)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40995 (_ BitVec 32)) SeekEntryResult!7216)

(assert (=> b!725068 (= e!406042 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19619 a!3186) j!159) a!3186 mask!3328) lt!321062))))

(declare-fun b!725069 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40995 (_ BitVec 32)) SeekEntryResult!7216)

(assert (=> b!725069 (= e!406042 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19619 a!3186) j!159) a!3186 mask!3328) (Found!7216 j!159)))))

(declare-fun b!725070 () Bool)

(declare-fun e!406040 () Bool)

(assert (=> b!725070 (= e!406040 (not (bvsge mask!3328 #b00000000000000000000000000000000)))))

(assert (=> b!725070 e!406039))

(declare-fun res!486322 () Bool)

(assert (=> b!725070 (=> (not res!486322) (not e!406039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40995 (_ BitVec 32)) Bool)

(assert (=> b!725070 (= res!486322 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24722 0))(
  ( (Unit!24723) )
))
(declare-fun lt!321060 () Unit!24722)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40995 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24722)

(assert (=> b!725070 (= lt!321060 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725071 () Bool)

(declare-fun res!486328 () Bool)

(assert (=> b!725071 (=> (not res!486328) (not e!406043))))

(assert (=> b!725071 (= res!486328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725073 () Bool)

(declare-fun e!406044 () Bool)

(assert (=> b!725073 (= e!406044 e!406040)))

(declare-fun res!486325 () Bool)

(assert (=> b!725073 (=> (not res!486325) (not e!406040))))

(declare-fun lt!321065 () array!40995)

(declare-fun lt!321063 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725073 (= res!486325 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321063 mask!3328) lt!321063 lt!321065 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321063 lt!321065 mask!3328)))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!725073 (= lt!321063 (select (store (arr!19619 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!725073 (= lt!321065 (array!40996 (store (arr!19619 a!3186) i!1173 k0!2102) (size!20040 a!3186)))))

(declare-fun b!725074 () Bool)

(declare-fun res!486319 () Bool)

(assert (=> b!725074 (=> (not res!486319) (not e!406041))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725074 (= res!486319 (validKeyInArray!0 (select (arr!19619 a!3186) j!159)))))

(declare-fun b!725075 () Bool)

(assert (=> b!725075 (= e!406041 e!406043)))

(declare-fun res!486330 () Bool)

(assert (=> b!725075 (=> (not res!486330) (not e!406043))))

(declare-fun lt!321064 () SeekEntryResult!7216)

(assert (=> b!725075 (= res!486330 (or (= lt!321064 (MissingZero!7216 i!1173)) (= lt!321064 (MissingVacant!7216 i!1173))))))

(assert (=> b!725075 (= lt!321064 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!725076 () Bool)

(declare-fun res!486332 () Bool)

(assert (=> b!725076 (=> (not res!486332) (not e!406043))))

(declare-datatypes ((List!13660 0))(
  ( (Nil!13657) (Cons!13656 (h!14713 (_ BitVec 64)) (t!19966 List!13660)) )
))
(declare-fun arrayNoDuplicates!0 (array!40995 (_ BitVec 32) List!13660) Bool)

(assert (=> b!725076 (= res!486332 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13657))))

(declare-fun b!725077 () Bool)

(declare-fun res!486320 () Bool)

(assert (=> b!725077 (=> (not res!486320) (not e!406041))))

(assert (=> b!725077 (= res!486320 (validKeyInArray!0 k0!2102))))

(declare-fun b!725078 () Bool)

(assert (=> b!725078 (= e!406043 e!406044)))

(declare-fun res!486327 () Bool)

(assert (=> b!725078 (=> (not res!486327) (not e!406044))))

(assert (=> b!725078 (= res!486327 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19619 a!3186) j!159) mask!3328) (select (arr!19619 a!3186) j!159) a!3186 mask!3328) lt!321062))))

(assert (=> b!725078 (= lt!321062 (Intermediate!7216 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725079 () Bool)

(declare-fun res!486326 () Bool)

(assert (=> b!725079 (=> (not res!486326) (not e!406041))))

(declare-fun arrayContainsKey!0 (array!40995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725079 (= res!486326 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725080 () Bool)

(assert (=> b!725080 (= e!406045 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19619 a!3186) j!159) a!3186 mask!3328) lt!321061))))

(declare-fun b!725081 () Bool)

(declare-fun res!486333 () Bool)

(assert (=> b!725081 (=> (not res!486333) (not e!406044))))

(assert (=> b!725081 (= res!486333 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19619 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!486329 () Bool)

(assert (=> start!64460 (=> (not res!486329) (not e!406041))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64460 (= res!486329 (validMask!0 mask!3328))))

(assert (=> start!64460 e!406041))

(assert (=> start!64460 true))

(declare-fun array_inv!15502 (array!40995) Bool)

(assert (=> start!64460 (array_inv!15502 a!3186)))

(declare-fun b!725072 () Bool)

(declare-fun res!486331 () Bool)

(assert (=> b!725072 (=> (not res!486331) (not e!406044))))

(assert (=> b!725072 (= res!486331 e!406042)))

(declare-fun c!79746 () Bool)

(assert (=> b!725072 (= c!79746 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64460 res!486329) b!725065))

(assert (= (and b!725065 res!486324) b!725074))

(assert (= (and b!725074 res!486319) b!725077))

(assert (= (and b!725077 res!486320) b!725079))

(assert (= (and b!725079 res!486326) b!725075))

(assert (= (and b!725075 res!486330) b!725071))

(assert (= (and b!725071 res!486328) b!725076))

(assert (= (and b!725076 res!486332) b!725066))

(assert (= (and b!725066 res!486323) b!725078))

(assert (= (and b!725078 res!486327) b!725081))

(assert (= (and b!725081 res!486333) b!725072))

(assert (= (and b!725072 c!79746) b!725068))

(assert (= (and b!725072 (not c!79746)) b!725069))

(assert (= (and b!725072 res!486331) b!725073))

(assert (= (and b!725073 res!486325) b!725070))

(assert (= (and b!725070 res!486322) b!725067))

(assert (= (and b!725067 res!486321) b!725080))

(declare-fun m!678731 () Bool)

(assert (=> b!725077 m!678731))

(declare-fun m!678733 () Bool)

(assert (=> b!725080 m!678733))

(assert (=> b!725080 m!678733))

(declare-fun m!678735 () Bool)

(assert (=> b!725080 m!678735))

(declare-fun m!678737 () Bool)

(assert (=> b!725079 m!678737))

(declare-fun m!678739 () Bool)

(assert (=> b!725073 m!678739))

(declare-fun m!678741 () Bool)

(assert (=> b!725073 m!678741))

(declare-fun m!678743 () Bool)

(assert (=> b!725073 m!678743))

(declare-fun m!678745 () Bool)

(assert (=> b!725073 m!678745))

(declare-fun m!678747 () Bool)

(assert (=> b!725073 m!678747))

(assert (=> b!725073 m!678739))

(assert (=> b!725069 m!678733))

(assert (=> b!725069 m!678733))

(declare-fun m!678749 () Bool)

(assert (=> b!725069 m!678749))

(assert (=> b!725078 m!678733))

(assert (=> b!725078 m!678733))

(declare-fun m!678751 () Bool)

(assert (=> b!725078 m!678751))

(assert (=> b!725078 m!678751))

(assert (=> b!725078 m!678733))

(declare-fun m!678753 () Bool)

(assert (=> b!725078 m!678753))

(assert (=> b!725067 m!678733))

(assert (=> b!725067 m!678733))

(declare-fun m!678755 () Bool)

(assert (=> b!725067 m!678755))

(assert (=> b!725068 m!678733))

(assert (=> b!725068 m!678733))

(declare-fun m!678757 () Bool)

(assert (=> b!725068 m!678757))

(declare-fun m!678759 () Bool)

(assert (=> b!725075 m!678759))

(declare-fun m!678761 () Bool)

(assert (=> b!725076 m!678761))

(declare-fun m!678763 () Bool)

(assert (=> b!725071 m!678763))

(declare-fun m!678765 () Bool)

(assert (=> b!725070 m!678765))

(declare-fun m!678767 () Bool)

(assert (=> b!725070 m!678767))

(declare-fun m!678769 () Bool)

(assert (=> start!64460 m!678769))

(declare-fun m!678771 () Bool)

(assert (=> start!64460 m!678771))

(declare-fun m!678773 () Bool)

(assert (=> b!725081 m!678773))

(assert (=> b!725074 m!678733))

(assert (=> b!725074 m!678733))

(declare-fun m!678775 () Bool)

(assert (=> b!725074 m!678775))

(check-sat (not b!725079) (not b!725080) (not b!725070) (not b!725074) (not b!725071) (not b!725073) (not b!725078) (not b!725075) (not b!725076) (not b!725069) (not b!725067) (not b!725077) (not b!725068) (not start!64460))
(check-sat)
