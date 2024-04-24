; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47216 () Bool)

(assert start!47216)

(declare-fun b!519772 () Bool)

(declare-fun res!318165 () Bool)

(declare-fun e!303282 () Bool)

(assert (=> b!519772 (=> (not res!318165) (not e!303282))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33169 0))(
  ( (array!33170 (arr!15943 (Array (_ BitVec 32) (_ BitVec 64))) (size!16307 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33169)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!519772 (= res!318165 (and (= (size!16307 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16307 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16307 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!519773 () Bool)

(declare-fun res!318161 () Bool)

(declare-fun e!303280 () Bool)

(assert (=> b!519773 (=> res!318161 e!303280)))

(declare-datatypes ((SeekEntryResult!4366 0))(
  ( (MissingZero!4366 (index!19661 (_ BitVec 32))) (Found!4366 (index!19662 (_ BitVec 32))) (Intermediate!4366 (undefined!5178 Bool) (index!19663 (_ BitVec 32)) (x!48787 (_ BitVec 32))) (Undefined!4366) (MissingVacant!4366 (index!19664 (_ BitVec 32))) )
))
(declare-fun lt!238074 () SeekEntryResult!4366)

(get-info :version)

(assert (=> b!519773 (= res!318161 (or (undefined!5178 lt!238074) (not ((_ is Intermediate!4366) lt!238074))))))

(declare-fun b!519774 () Bool)

(declare-datatypes ((Unit!16075 0))(
  ( (Unit!16076) )
))
(declare-fun e!303285 () Unit!16075)

(declare-fun Unit!16077 () Unit!16075)

(assert (=> b!519774 (= e!303285 Unit!16077)))

(declare-fun lt!238073 () Unit!16075)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun lt!238075 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33169 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16075)

(assert (=> b!519774 (= lt!238073 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238075 #b00000000000000000000000000000000 (index!19663 lt!238074) (x!48787 lt!238074) mask!3524))))

(declare-fun res!318168 () Bool)

(declare-fun lt!238078 () array!33169)

(declare-fun lt!238076 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33169 (_ BitVec 32)) SeekEntryResult!4366)

(assert (=> b!519774 (= res!318168 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238075 lt!238076 lt!238078 mask!3524) (Intermediate!4366 false (index!19663 lt!238074) (x!48787 lt!238074))))))

(declare-fun e!303283 () Bool)

(assert (=> b!519774 (=> (not res!318168) (not e!303283))))

(assert (=> b!519774 e!303283))

(declare-fun b!519775 () Bool)

(declare-fun res!318172 () Bool)

(assert (=> b!519775 (=> (not res!318172) (not e!303282))))

(declare-fun arrayContainsKey!0 (array!33169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!519775 (= res!318172 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!519776 () Bool)

(assert (=> b!519776 (= e!303283 false)))

(declare-fun b!519777 () Bool)

(declare-fun res!318164 () Bool)

(declare-fun e!303279 () Bool)

(assert (=> b!519777 (=> (not res!318164) (not e!303279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33169 (_ BitVec 32)) Bool)

(assert (=> b!519777 (= res!318164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!519778 () Bool)

(declare-fun Unit!16078 () Unit!16075)

(assert (=> b!519778 (= e!303285 Unit!16078)))

(declare-fun res!318170 () Bool)

(assert (=> start!47216 (=> (not res!318170) (not e!303282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47216 (= res!318170 (validMask!0 mask!3524))))

(assert (=> start!47216 e!303282))

(assert (=> start!47216 true))

(declare-fun array_inv!11802 (array!33169) Bool)

(assert (=> start!47216 (array_inv!11802 a!3235)))

(declare-fun b!519771 () Bool)

(declare-fun e!303284 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33169 (_ BitVec 32)) SeekEntryResult!4366)

(assert (=> b!519771 (= e!303284 (= (seekEntryOrOpen!0 (select (arr!15943 a!3235) j!176) a!3235 mask!3524) (Found!4366 j!176)))))

(declare-fun b!519779 () Bool)

(assert (=> b!519779 (= e!303282 e!303279)))

(declare-fun res!318163 () Bool)

(assert (=> b!519779 (=> (not res!318163) (not e!303279))))

(declare-fun lt!238077 () SeekEntryResult!4366)

(assert (=> b!519779 (= res!318163 (or (= lt!238077 (MissingZero!4366 i!1204)) (= lt!238077 (MissingVacant!4366 i!1204))))))

(assert (=> b!519779 (= lt!238077 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!519780 () Bool)

(declare-fun res!318167 () Bool)

(assert (=> b!519780 (=> (not res!318167) (not e!303279))))

(declare-datatypes ((List!10008 0))(
  ( (Nil!10005) (Cons!10004 (h!10920 (_ BitVec 64)) (t!16228 List!10008)) )
))
(declare-fun arrayNoDuplicates!0 (array!33169 (_ BitVec 32) List!10008) Bool)

(assert (=> b!519780 (= res!318167 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10005))))

(declare-fun b!519781 () Bool)

(declare-fun res!318169 () Bool)

(assert (=> b!519781 (=> (not res!318169) (not e!303282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!519781 (= res!318169 (validKeyInArray!0 (select (arr!15943 a!3235) j!176)))))

(declare-fun b!519782 () Bool)

(assert (=> b!519782 (= e!303279 (not e!303280))))

(declare-fun res!318171 () Bool)

(assert (=> b!519782 (=> res!318171 e!303280)))

(declare-fun lt!238070 () (_ BitVec 32))

(assert (=> b!519782 (= res!318171 (= lt!238074 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238070 lt!238076 lt!238078 mask!3524)))))

(assert (=> b!519782 (= lt!238074 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238075 (select (arr!15943 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519782 (= lt!238070 (toIndex!0 lt!238076 mask!3524))))

(assert (=> b!519782 (= lt!238076 (select (store (arr!15943 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!519782 (= lt!238075 (toIndex!0 (select (arr!15943 a!3235) j!176) mask!3524))))

(assert (=> b!519782 (= lt!238078 (array!33170 (store (arr!15943 a!3235) i!1204 k0!2280) (size!16307 a!3235)))))

(assert (=> b!519782 e!303284))

(declare-fun res!318162 () Bool)

(assert (=> b!519782 (=> (not res!318162) (not e!303284))))

(assert (=> b!519782 (= res!318162 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238071 () Unit!16075)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16075)

(assert (=> b!519782 (= lt!238071 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!519783 () Bool)

(assert (=> b!519783 (= e!303280 (not (= (select (arr!15943 a!3235) (index!19663 lt!238074)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!519783 (or (= (select (arr!15943 a!3235) (index!19663 lt!238074)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15943 a!3235) (index!19663 lt!238074)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238072 () Unit!16075)

(assert (=> b!519783 (= lt!238072 e!303285)))

(declare-fun c!61103 () Bool)

(assert (=> b!519783 (= c!61103 (= (select (arr!15943 a!3235) (index!19663 lt!238074)) (select (arr!15943 a!3235) j!176)))))

(assert (=> b!519783 (and (bvslt (x!48787 lt!238074) #b01111111111111111111111111111110) (or (= (select (arr!15943 a!3235) (index!19663 lt!238074)) (select (arr!15943 a!3235) j!176)) (= (select (arr!15943 a!3235) (index!19663 lt!238074)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15943 a!3235) (index!19663 lt!238074)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519784 () Bool)

(declare-fun res!318166 () Bool)

(assert (=> b!519784 (=> (not res!318166) (not e!303282))))

(assert (=> b!519784 (= res!318166 (validKeyInArray!0 k0!2280))))

(assert (= (and start!47216 res!318170) b!519772))

(assert (= (and b!519772 res!318165) b!519781))

(assert (= (and b!519781 res!318169) b!519784))

(assert (= (and b!519784 res!318166) b!519775))

(assert (= (and b!519775 res!318172) b!519779))

(assert (= (and b!519779 res!318163) b!519777))

(assert (= (and b!519777 res!318164) b!519780))

(assert (= (and b!519780 res!318167) b!519782))

(assert (= (and b!519782 res!318162) b!519771))

(assert (= (and b!519782 (not res!318171)) b!519773))

(assert (= (and b!519773 (not res!318161)) b!519783))

(assert (= (and b!519783 c!61103) b!519774))

(assert (= (and b!519783 (not c!61103)) b!519778))

(assert (= (and b!519774 res!318168) b!519776))

(declare-fun m!501115 () Bool)

(assert (=> b!519774 m!501115))

(declare-fun m!501117 () Bool)

(assert (=> b!519774 m!501117))

(declare-fun m!501119 () Bool)

(assert (=> b!519775 m!501119))

(declare-fun m!501121 () Bool)

(assert (=> b!519771 m!501121))

(assert (=> b!519771 m!501121))

(declare-fun m!501123 () Bool)

(assert (=> b!519771 m!501123))

(declare-fun m!501125 () Bool)

(assert (=> b!519779 m!501125))

(declare-fun m!501127 () Bool)

(assert (=> start!47216 m!501127))

(declare-fun m!501129 () Bool)

(assert (=> start!47216 m!501129))

(declare-fun m!501131 () Bool)

(assert (=> b!519783 m!501131))

(assert (=> b!519783 m!501121))

(assert (=> b!519782 m!501121))

(declare-fun m!501133 () Bool)

(assert (=> b!519782 m!501133))

(declare-fun m!501135 () Bool)

(assert (=> b!519782 m!501135))

(declare-fun m!501137 () Bool)

(assert (=> b!519782 m!501137))

(declare-fun m!501139 () Bool)

(assert (=> b!519782 m!501139))

(assert (=> b!519782 m!501121))

(declare-fun m!501141 () Bool)

(assert (=> b!519782 m!501141))

(assert (=> b!519782 m!501121))

(declare-fun m!501143 () Bool)

(assert (=> b!519782 m!501143))

(declare-fun m!501145 () Bool)

(assert (=> b!519782 m!501145))

(declare-fun m!501147 () Bool)

(assert (=> b!519782 m!501147))

(declare-fun m!501149 () Bool)

(assert (=> b!519784 m!501149))

(declare-fun m!501151 () Bool)

(assert (=> b!519777 m!501151))

(declare-fun m!501153 () Bool)

(assert (=> b!519780 m!501153))

(assert (=> b!519781 m!501121))

(assert (=> b!519781 m!501121))

(declare-fun m!501155 () Bool)

(assert (=> b!519781 m!501155))

(check-sat (not b!519777) (not b!519780) (not b!519779) (not b!519782) (not b!519781) (not b!519771) (not start!47216) (not b!519784) (not b!519775) (not b!519774))
(check-sat)
(get-model)

(declare-fun b!519881 () Bool)

(declare-fun c!61117 () Bool)

(declare-fun lt!238141 () (_ BitVec 64))

(assert (=> b!519881 (= c!61117 (= lt!238141 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303336 () SeekEntryResult!4366)

(declare-fun e!303334 () SeekEntryResult!4366)

(assert (=> b!519881 (= e!303336 e!303334)))

(declare-fun b!519882 () Bool)

(declare-fun lt!238140 () SeekEntryResult!4366)

(assert (=> b!519882 (= e!303334 (MissingZero!4366 (index!19663 lt!238140)))))

(declare-fun b!519883 () Bool)

(declare-fun e!303335 () SeekEntryResult!4366)

(assert (=> b!519883 (= e!303335 Undefined!4366)))

(declare-fun d!80209 () Bool)

(declare-fun lt!238139 () SeekEntryResult!4366)

(assert (=> d!80209 (and (or ((_ is Undefined!4366) lt!238139) (not ((_ is Found!4366) lt!238139)) (and (bvsge (index!19662 lt!238139) #b00000000000000000000000000000000) (bvslt (index!19662 lt!238139) (size!16307 a!3235)))) (or ((_ is Undefined!4366) lt!238139) ((_ is Found!4366) lt!238139) (not ((_ is MissingZero!4366) lt!238139)) (and (bvsge (index!19661 lt!238139) #b00000000000000000000000000000000) (bvslt (index!19661 lt!238139) (size!16307 a!3235)))) (or ((_ is Undefined!4366) lt!238139) ((_ is Found!4366) lt!238139) ((_ is MissingZero!4366) lt!238139) (not ((_ is MissingVacant!4366) lt!238139)) (and (bvsge (index!19664 lt!238139) #b00000000000000000000000000000000) (bvslt (index!19664 lt!238139) (size!16307 a!3235)))) (or ((_ is Undefined!4366) lt!238139) (ite ((_ is Found!4366) lt!238139) (= (select (arr!15943 a!3235) (index!19662 lt!238139)) (select (arr!15943 a!3235) j!176)) (ite ((_ is MissingZero!4366) lt!238139) (= (select (arr!15943 a!3235) (index!19661 lt!238139)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4366) lt!238139) (= (select (arr!15943 a!3235) (index!19664 lt!238139)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80209 (= lt!238139 e!303335)))

(declare-fun c!61118 () Bool)

(assert (=> d!80209 (= c!61118 (and ((_ is Intermediate!4366) lt!238140) (undefined!5178 lt!238140)))))

(assert (=> d!80209 (= lt!238140 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15943 a!3235) j!176) mask!3524) (select (arr!15943 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80209 (validMask!0 mask!3524)))

(assert (=> d!80209 (= (seekEntryOrOpen!0 (select (arr!15943 a!3235) j!176) a!3235 mask!3524) lt!238139)))

(declare-fun b!519884 () Bool)

(assert (=> b!519884 (= e!303335 e!303336)))

(assert (=> b!519884 (= lt!238141 (select (arr!15943 a!3235) (index!19663 lt!238140)))))

(declare-fun c!61116 () Bool)

(assert (=> b!519884 (= c!61116 (= lt!238141 (select (arr!15943 a!3235) j!176)))))

(declare-fun b!519885 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33169 (_ BitVec 32)) SeekEntryResult!4366)

(assert (=> b!519885 (= e!303334 (seekKeyOrZeroReturnVacant!0 (x!48787 lt!238140) (index!19663 lt!238140) (index!19663 lt!238140) (select (arr!15943 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!519886 () Bool)

(assert (=> b!519886 (= e!303336 (Found!4366 (index!19663 lt!238140)))))

(assert (= (and d!80209 c!61118) b!519883))

(assert (= (and d!80209 (not c!61118)) b!519884))

(assert (= (and b!519884 c!61116) b!519886))

(assert (= (and b!519884 (not c!61116)) b!519881))

(assert (= (and b!519881 c!61117) b!519882))

(assert (= (and b!519881 (not c!61117)) b!519885))

(declare-fun m!501241 () Bool)

(assert (=> d!80209 m!501241))

(declare-fun m!501243 () Bool)

(assert (=> d!80209 m!501243))

(assert (=> d!80209 m!501141))

(assert (=> d!80209 m!501121))

(declare-fun m!501245 () Bool)

(assert (=> d!80209 m!501245))

(assert (=> d!80209 m!501121))

(assert (=> d!80209 m!501141))

(assert (=> d!80209 m!501127))

(declare-fun m!501247 () Bool)

(assert (=> d!80209 m!501247))

(declare-fun m!501249 () Bool)

(assert (=> b!519884 m!501249))

(assert (=> b!519885 m!501121))

(declare-fun m!501251 () Bool)

(assert (=> b!519885 m!501251))

(assert (=> b!519771 d!80209))

(declare-fun b!519913 () Bool)

(declare-fun lt!238153 () SeekEntryResult!4366)

(assert (=> b!519913 (and (bvsge (index!19663 lt!238153) #b00000000000000000000000000000000) (bvslt (index!19663 lt!238153) (size!16307 lt!238078)))))

(declare-fun res!318257 () Bool)

(assert (=> b!519913 (= res!318257 (= (select (arr!15943 lt!238078) (index!19663 lt!238153)) lt!238076))))

(declare-fun e!303357 () Bool)

(assert (=> b!519913 (=> res!318257 e!303357)))

(declare-fun e!303355 () Bool)

(assert (=> b!519913 (= e!303355 e!303357)))

(declare-fun b!519914 () Bool)

(declare-fun e!303356 () SeekEntryResult!4366)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!519914 (= e!303356 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!238076 lt!238078 mask!3524))))

(declare-fun b!519915 () Bool)

(declare-fun e!303354 () Bool)

(assert (=> b!519915 (= e!303354 e!303355)))

(declare-fun res!318255 () Bool)

(assert (=> b!519915 (= res!318255 (and ((_ is Intermediate!4366) lt!238153) (not (undefined!5178 lt!238153)) (bvslt (x!48787 lt!238153) #b01111111111111111111111111111110) (bvsge (x!48787 lt!238153) #b00000000000000000000000000000000) (bvsge (x!48787 lt!238153) #b00000000000000000000000000000000)))))

(assert (=> b!519915 (=> (not res!318255) (not e!303355))))

(declare-fun b!519916 () Bool)

(assert (=> b!519916 (= e!303356 (Intermediate!4366 false lt!238070 #b00000000000000000000000000000000))))

(declare-fun b!519918 () Bool)

(declare-fun e!303353 () SeekEntryResult!4366)

(assert (=> b!519918 (= e!303353 (Intermediate!4366 true lt!238070 #b00000000000000000000000000000000))))

(declare-fun b!519919 () Bool)

(assert (=> b!519919 (= e!303353 e!303356)))

(declare-fun c!61129 () Bool)

(declare-fun lt!238152 () (_ BitVec 64))

(assert (=> b!519919 (= c!61129 (or (= lt!238152 lt!238076) (= (bvadd lt!238152 lt!238152) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519920 () Bool)

(assert (=> b!519920 (and (bvsge (index!19663 lt!238153) #b00000000000000000000000000000000) (bvslt (index!19663 lt!238153) (size!16307 lt!238078)))))

(assert (=> b!519920 (= e!303357 (= (select (arr!15943 lt!238078) (index!19663 lt!238153)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519921 () Bool)

(assert (=> b!519921 (= e!303354 (bvsge (x!48787 lt!238153) #b01111111111111111111111111111110))))

(declare-fun b!519917 () Bool)

(assert (=> b!519917 (and (bvsge (index!19663 lt!238153) #b00000000000000000000000000000000) (bvslt (index!19663 lt!238153) (size!16307 lt!238078)))))

(declare-fun res!318256 () Bool)

(assert (=> b!519917 (= res!318256 (= (select (arr!15943 lt!238078) (index!19663 lt!238153)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519917 (=> res!318256 e!303357)))

(declare-fun d!80211 () Bool)

(assert (=> d!80211 e!303354))

(declare-fun c!61127 () Bool)

(assert (=> d!80211 (= c!61127 (and ((_ is Intermediate!4366) lt!238153) (undefined!5178 lt!238153)))))

(assert (=> d!80211 (= lt!238153 e!303353)))

(declare-fun c!61128 () Bool)

(assert (=> d!80211 (= c!61128 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80211 (= lt!238152 (select (arr!15943 lt!238078) lt!238070))))

(assert (=> d!80211 (validMask!0 mask!3524)))

(assert (=> d!80211 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238070 lt!238076 lt!238078 mask!3524) lt!238153)))

(assert (= (and d!80211 c!61128) b!519918))

(assert (= (and d!80211 (not c!61128)) b!519919))

(assert (= (and b!519919 c!61129) b!519916))

(assert (= (and b!519919 (not c!61129)) b!519914))

(assert (= (and d!80211 c!61127) b!519921))

(assert (= (and d!80211 (not c!61127)) b!519915))

(assert (= (and b!519915 res!318255) b!519913))

(assert (= (and b!519913 (not res!318257)) b!519917))

(assert (= (and b!519917 (not res!318256)) b!519920))

(declare-fun m!501253 () Bool)

(assert (=> b!519917 m!501253))

(assert (=> b!519920 m!501253))

(declare-fun m!501255 () Bool)

(assert (=> d!80211 m!501255))

(assert (=> d!80211 m!501127))

(assert (=> b!519913 m!501253))

(declare-fun m!501257 () Bool)

(assert (=> b!519914 m!501257))

(assert (=> b!519914 m!501257))

(declare-fun m!501259 () Bool)

(assert (=> b!519914 m!501259))

(assert (=> b!519782 d!80211))

(declare-fun d!80217 () Bool)

(assert (=> d!80217 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!238159 () Unit!16075)

(declare-fun choose!38 (array!33169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16075)

(assert (=> d!80217 (= lt!238159 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80217 (validMask!0 mask!3524)))

(assert (=> d!80217 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!238159)))

(declare-fun bs!16397 () Bool)

(assert (= bs!16397 d!80217))

(assert (=> bs!16397 m!501147))

(declare-fun m!501273 () Bool)

(assert (=> bs!16397 m!501273))

(assert (=> bs!16397 m!501127))

(assert (=> b!519782 d!80217))

(declare-fun d!80223 () Bool)

(declare-fun lt!238168 () (_ BitVec 32))

(declare-fun lt!238167 () (_ BitVec 32))

(assert (=> d!80223 (= lt!238168 (bvmul (bvxor lt!238167 (bvlshr lt!238167 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80223 (= lt!238167 ((_ extract 31 0) (bvand (bvxor (select (arr!15943 a!3235) j!176) (bvlshr (select (arr!15943 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80223 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318262 (let ((h!10923 ((_ extract 31 0) (bvand (bvxor (select (arr!15943 a!3235) j!176) (bvlshr (select (arr!15943 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48792 (bvmul (bvxor h!10923 (bvlshr h!10923 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48792 (bvlshr x!48792 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318262 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318262 #b00000000000000000000000000000000))))))

(assert (=> d!80223 (= (toIndex!0 (select (arr!15943 a!3235) j!176) mask!3524) (bvand (bvxor lt!238168 (bvlshr lt!238168 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!519782 d!80223))

(declare-fun b!519929 () Bool)

(declare-fun lt!238170 () SeekEntryResult!4366)

(assert (=> b!519929 (and (bvsge (index!19663 lt!238170) #b00000000000000000000000000000000) (bvslt (index!19663 lt!238170) (size!16307 a!3235)))))

(declare-fun res!318266 () Bool)

(assert (=> b!519929 (= res!318266 (= (select (arr!15943 a!3235) (index!19663 lt!238170)) (select (arr!15943 a!3235) j!176)))))

(declare-fun e!303368 () Bool)

(assert (=> b!519929 (=> res!318266 e!303368)))

(declare-fun e!303366 () Bool)

(assert (=> b!519929 (= e!303366 e!303368)))

(declare-fun e!303367 () SeekEntryResult!4366)

(declare-fun b!519930 () Bool)

(assert (=> b!519930 (= e!303367 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238075 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!15943 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!519931 () Bool)

(declare-fun e!303365 () Bool)

(assert (=> b!519931 (= e!303365 e!303366)))

(declare-fun res!318264 () Bool)

(assert (=> b!519931 (= res!318264 (and ((_ is Intermediate!4366) lt!238170) (not (undefined!5178 lt!238170)) (bvslt (x!48787 lt!238170) #b01111111111111111111111111111110) (bvsge (x!48787 lt!238170) #b00000000000000000000000000000000) (bvsge (x!48787 lt!238170) #b00000000000000000000000000000000)))))

(assert (=> b!519931 (=> (not res!318264) (not e!303366))))

(declare-fun b!519932 () Bool)

(assert (=> b!519932 (= e!303367 (Intermediate!4366 false lt!238075 #b00000000000000000000000000000000))))

(declare-fun b!519934 () Bool)

(declare-fun e!303364 () SeekEntryResult!4366)

(assert (=> b!519934 (= e!303364 (Intermediate!4366 true lt!238075 #b00000000000000000000000000000000))))

(declare-fun b!519935 () Bool)

(assert (=> b!519935 (= e!303364 e!303367)))

(declare-fun lt!238169 () (_ BitVec 64))

(declare-fun c!61133 () Bool)

(assert (=> b!519935 (= c!61133 (or (= lt!238169 (select (arr!15943 a!3235) j!176)) (= (bvadd lt!238169 lt!238169) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!519936 () Bool)

(assert (=> b!519936 (and (bvsge (index!19663 lt!238170) #b00000000000000000000000000000000) (bvslt (index!19663 lt!238170) (size!16307 a!3235)))))

(assert (=> b!519936 (= e!303368 (= (select (arr!15943 a!3235) (index!19663 lt!238170)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!519937 () Bool)

(assert (=> b!519937 (= e!303365 (bvsge (x!48787 lt!238170) #b01111111111111111111111111111110))))

(declare-fun b!519933 () Bool)

(assert (=> b!519933 (and (bvsge (index!19663 lt!238170) #b00000000000000000000000000000000) (bvslt (index!19663 lt!238170) (size!16307 a!3235)))))

(declare-fun res!318265 () Bool)

(assert (=> b!519933 (= res!318265 (= (select (arr!15943 a!3235) (index!19663 lt!238170)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!519933 (=> res!318265 e!303368)))

(declare-fun d!80227 () Bool)

(assert (=> d!80227 e!303365))

(declare-fun c!61131 () Bool)

(assert (=> d!80227 (= c!61131 (and ((_ is Intermediate!4366) lt!238170) (undefined!5178 lt!238170)))))

(assert (=> d!80227 (= lt!238170 e!303364)))

(declare-fun c!61132 () Bool)

(assert (=> d!80227 (= c!61132 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80227 (= lt!238169 (select (arr!15943 a!3235) lt!238075))))

(assert (=> d!80227 (validMask!0 mask!3524)))

(assert (=> d!80227 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238075 (select (arr!15943 a!3235) j!176) a!3235 mask!3524) lt!238170)))

(assert (= (and d!80227 c!61132) b!519934))

(assert (= (and d!80227 (not c!61132)) b!519935))

(assert (= (and b!519935 c!61133) b!519932))

(assert (= (and b!519935 (not c!61133)) b!519930))

(assert (= (and d!80227 c!61131) b!519937))

(assert (= (and d!80227 (not c!61131)) b!519931))

(assert (= (and b!519931 res!318264) b!519929))

(assert (= (and b!519929 (not res!318266)) b!519933))

(assert (= (and b!519933 (not res!318265)) b!519936))

(declare-fun m!501279 () Bool)

(assert (=> b!519933 m!501279))

(assert (=> b!519936 m!501279))

(declare-fun m!501281 () Bool)

(assert (=> d!80227 m!501281))

(assert (=> d!80227 m!501127))

(assert (=> b!519929 m!501279))

(declare-fun m!501283 () Bool)

(assert (=> b!519930 m!501283))

(assert (=> b!519930 m!501283))

(assert (=> b!519930 m!501121))

(declare-fun m!501285 () Bool)

(assert (=> b!519930 m!501285))

(assert (=> b!519782 d!80227))

(declare-fun b!519946 () Bool)

(declare-fun e!303375 () Bool)

(declare-fun call!31758 () Bool)

(assert (=> b!519946 (= e!303375 call!31758)))

(declare-fun d!80229 () Bool)

(declare-fun res!318271 () Bool)

(declare-fun e!303376 () Bool)

(assert (=> d!80229 (=> res!318271 e!303376)))

(assert (=> d!80229 (= res!318271 (bvsge j!176 (size!16307 a!3235)))))

(assert (=> d!80229 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!303376)))

(declare-fun bm!31755 () Bool)

(assert (=> bm!31755 (= call!31758 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!519947 () Bool)

(declare-fun e!303377 () Bool)

(assert (=> b!519947 (= e!303376 e!303377)))

(declare-fun c!61136 () Bool)

(assert (=> b!519947 (= c!61136 (validKeyInArray!0 (select (arr!15943 a!3235) j!176)))))

(declare-fun b!519948 () Bool)

(assert (=> b!519948 (= e!303377 e!303375)))

(declare-fun lt!238178 () (_ BitVec 64))

(assert (=> b!519948 (= lt!238178 (select (arr!15943 a!3235) j!176))))

(declare-fun lt!238177 () Unit!16075)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33169 (_ BitVec 64) (_ BitVec 32)) Unit!16075)

(assert (=> b!519948 (= lt!238177 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238178 j!176))))

(assert (=> b!519948 (arrayContainsKey!0 a!3235 lt!238178 #b00000000000000000000000000000000)))

(declare-fun lt!238179 () Unit!16075)

(assert (=> b!519948 (= lt!238179 lt!238177)))

(declare-fun res!318272 () Bool)

(assert (=> b!519948 (= res!318272 (= (seekEntryOrOpen!0 (select (arr!15943 a!3235) j!176) a!3235 mask!3524) (Found!4366 j!176)))))

(assert (=> b!519948 (=> (not res!318272) (not e!303375))))

(declare-fun b!519949 () Bool)

(assert (=> b!519949 (= e!303377 call!31758)))

(assert (= (and d!80229 (not res!318271)) b!519947))

(assert (= (and b!519947 c!61136) b!519948))

(assert (= (and b!519947 (not c!61136)) b!519949))

(assert (= (and b!519948 res!318272) b!519946))

(assert (= (or b!519946 b!519949) bm!31755))

(declare-fun m!501287 () Bool)

(assert (=> bm!31755 m!501287))

(assert (=> b!519947 m!501121))

(assert (=> b!519947 m!501121))

(assert (=> b!519947 m!501155))

(assert (=> b!519948 m!501121))

(declare-fun m!501289 () Bool)

(assert (=> b!519948 m!501289))

(declare-fun m!501291 () Bool)

(assert (=> b!519948 m!501291))

(assert (=> b!519948 m!501121))

(assert (=> b!519948 m!501123))

(assert (=> b!519782 d!80229))

(declare-fun d!80235 () Bool)

(declare-fun lt!238181 () (_ BitVec 32))

(declare-fun lt!238180 () (_ BitVec 32))

(assert (=> d!80235 (= lt!238181 (bvmul (bvxor lt!238180 (bvlshr lt!238180 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80235 (= lt!238180 ((_ extract 31 0) (bvand (bvxor lt!238076 (bvlshr lt!238076 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80235 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!318262 (let ((h!10923 ((_ extract 31 0) (bvand (bvxor lt!238076 (bvlshr lt!238076 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48792 (bvmul (bvxor h!10923 (bvlshr h!10923 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48792 (bvlshr x!48792 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!318262 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!318262 #b00000000000000000000000000000000))))))

(assert (=> d!80235 (= (toIndex!0 lt!238076 mask!3524) (bvand (bvxor lt!238181 (bvlshr lt!238181 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!519782 d!80235))

(declare-fun d!80237 () Bool)

(assert (=> d!80237 (= (validKeyInArray!0 (select (arr!15943 a!3235) j!176)) (and (not (= (select (arr!15943 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15943 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!519781 d!80237))

(declare-fun d!80239 () Bool)

(declare-fun res!318283 () Bool)

(declare-fun e!303392 () Bool)

(assert (=> d!80239 (=> res!318283 e!303392)))

(assert (=> d!80239 (= res!318283 (= (select (arr!15943 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80239 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!303392)))

(declare-fun b!519972 () Bool)

(declare-fun e!303393 () Bool)

(assert (=> b!519972 (= e!303392 e!303393)))

(declare-fun res!318284 () Bool)

(assert (=> b!519972 (=> (not res!318284) (not e!303393))))

(assert (=> b!519972 (= res!318284 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16307 a!3235)))))

(declare-fun b!519973 () Bool)

(assert (=> b!519973 (= e!303393 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80239 (not res!318283)) b!519972))

(assert (= (and b!519972 res!318284) b!519973))

(declare-fun m!501293 () Bool)

(assert (=> d!80239 m!501293))

(declare-fun m!501295 () Bool)

(assert (=> b!519973 m!501295))

(assert (=> b!519775 d!80239))

(declare-fun b!520011 () Bool)

(declare-fun e!303420 () Bool)

(declare-fun call!31761 () Bool)

(assert (=> b!520011 (= e!303420 call!31761)))

(declare-fun b!520012 () Bool)

(assert (=> b!520012 (= e!303420 call!31761)))

(declare-fun bm!31758 () Bool)

(declare-fun c!61154 () Bool)

(assert (=> bm!31758 (= call!31761 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61154 (Cons!10004 (select (arr!15943 a!3235) #b00000000000000000000000000000000) Nil!10005) Nil!10005)))))

(declare-fun b!520013 () Bool)

(declare-fun e!303417 () Bool)

(assert (=> b!520013 (= e!303417 e!303420)))

(assert (=> b!520013 (= c!61154 (validKeyInArray!0 (select (arr!15943 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!520014 () Bool)

(declare-fun e!303419 () Bool)

(declare-fun contains!2736 (List!10008 (_ BitVec 64)) Bool)

(assert (=> b!520014 (= e!303419 (contains!2736 Nil!10005 (select (arr!15943 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!80241 () Bool)

(declare-fun res!318300 () Bool)

(declare-fun e!303418 () Bool)

(assert (=> d!80241 (=> res!318300 e!303418)))

(assert (=> d!80241 (= res!318300 (bvsge #b00000000000000000000000000000000 (size!16307 a!3235)))))

(assert (=> d!80241 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10005) e!303418)))

(declare-fun b!520015 () Bool)

(assert (=> b!520015 (= e!303418 e!303417)))

(declare-fun res!318301 () Bool)

(assert (=> b!520015 (=> (not res!318301) (not e!303417))))

(assert (=> b!520015 (= res!318301 (not e!303419))))

(declare-fun res!318302 () Bool)

(assert (=> b!520015 (=> (not res!318302) (not e!303419))))

(assert (=> b!520015 (= res!318302 (validKeyInArray!0 (select (arr!15943 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!80241 (not res!318300)) b!520015))

(assert (= (and b!520015 res!318302) b!520014))

(assert (= (and b!520015 res!318301) b!520013))

(assert (= (and b!520013 c!61154) b!520011))

(assert (= (and b!520013 (not c!61154)) b!520012))

(assert (= (or b!520011 b!520012) bm!31758))

(assert (=> bm!31758 m!501293))

(declare-fun m!501305 () Bool)

(assert (=> bm!31758 m!501305))

(assert (=> b!520013 m!501293))

(assert (=> b!520013 m!501293))

(declare-fun m!501307 () Bool)

(assert (=> b!520013 m!501307))

(assert (=> b!520014 m!501293))

(assert (=> b!520014 m!501293))

(declare-fun m!501309 () Bool)

(assert (=> b!520014 m!501309))

(assert (=> b!520015 m!501293))

(assert (=> b!520015 m!501293))

(assert (=> b!520015 m!501307))

(assert (=> b!519780 d!80241))

(declare-fun b!520016 () Bool)

(declare-fun c!61156 () Bool)

(declare-fun lt!238194 () (_ BitVec 64))

(assert (=> b!520016 (= c!61156 (= lt!238194 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!303423 () SeekEntryResult!4366)

(declare-fun e!303421 () SeekEntryResult!4366)

(assert (=> b!520016 (= e!303423 e!303421)))

(declare-fun b!520017 () Bool)

(declare-fun lt!238193 () SeekEntryResult!4366)

(assert (=> b!520017 (= e!303421 (MissingZero!4366 (index!19663 lt!238193)))))

(declare-fun b!520018 () Bool)

(declare-fun e!303422 () SeekEntryResult!4366)

(assert (=> b!520018 (= e!303422 Undefined!4366)))

(declare-fun d!80247 () Bool)

(declare-fun lt!238192 () SeekEntryResult!4366)

(assert (=> d!80247 (and (or ((_ is Undefined!4366) lt!238192) (not ((_ is Found!4366) lt!238192)) (and (bvsge (index!19662 lt!238192) #b00000000000000000000000000000000) (bvslt (index!19662 lt!238192) (size!16307 a!3235)))) (or ((_ is Undefined!4366) lt!238192) ((_ is Found!4366) lt!238192) (not ((_ is MissingZero!4366) lt!238192)) (and (bvsge (index!19661 lt!238192) #b00000000000000000000000000000000) (bvslt (index!19661 lt!238192) (size!16307 a!3235)))) (or ((_ is Undefined!4366) lt!238192) ((_ is Found!4366) lt!238192) ((_ is MissingZero!4366) lt!238192) (not ((_ is MissingVacant!4366) lt!238192)) (and (bvsge (index!19664 lt!238192) #b00000000000000000000000000000000) (bvslt (index!19664 lt!238192) (size!16307 a!3235)))) (or ((_ is Undefined!4366) lt!238192) (ite ((_ is Found!4366) lt!238192) (= (select (arr!15943 a!3235) (index!19662 lt!238192)) k0!2280) (ite ((_ is MissingZero!4366) lt!238192) (= (select (arr!15943 a!3235) (index!19661 lt!238192)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4366) lt!238192) (= (select (arr!15943 a!3235) (index!19664 lt!238192)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80247 (= lt!238192 e!303422)))

(declare-fun c!61157 () Bool)

(assert (=> d!80247 (= c!61157 (and ((_ is Intermediate!4366) lt!238193) (undefined!5178 lt!238193)))))

(assert (=> d!80247 (= lt!238193 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80247 (validMask!0 mask!3524)))

(assert (=> d!80247 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!238192)))

(declare-fun b!520019 () Bool)

(assert (=> b!520019 (= e!303422 e!303423)))

(assert (=> b!520019 (= lt!238194 (select (arr!15943 a!3235) (index!19663 lt!238193)))))

(declare-fun c!61155 () Bool)

(assert (=> b!520019 (= c!61155 (= lt!238194 k0!2280))))

(declare-fun b!520020 () Bool)

(assert (=> b!520020 (= e!303421 (seekKeyOrZeroReturnVacant!0 (x!48787 lt!238193) (index!19663 lt!238193) (index!19663 lt!238193) k0!2280 a!3235 mask!3524))))

(declare-fun b!520021 () Bool)

(assert (=> b!520021 (= e!303423 (Found!4366 (index!19663 lt!238193)))))

(assert (= (and d!80247 c!61157) b!520018))

(assert (= (and d!80247 (not c!61157)) b!520019))

(assert (= (and b!520019 c!61155) b!520021))

(assert (= (and b!520019 (not c!61155)) b!520016))

(assert (= (and b!520016 c!61156) b!520017))

(assert (= (and b!520016 (not c!61156)) b!520020))

(declare-fun m!501311 () Bool)

(assert (=> d!80247 m!501311))

(declare-fun m!501313 () Bool)

(assert (=> d!80247 m!501313))

(declare-fun m!501315 () Bool)

(assert (=> d!80247 m!501315))

(declare-fun m!501317 () Bool)

(assert (=> d!80247 m!501317))

(assert (=> d!80247 m!501315))

(assert (=> d!80247 m!501127))

(declare-fun m!501319 () Bool)

(assert (=> d!80247 m!501319))

(declare-fun m!501321 () Bool)

(assert (=> b!520019 m!501321))

(declare-fun m!501323 () Bool)

(assert (=> b!520020 m!501323))

(assert (=> b!519779 d!80247))

(declare-fun d!80249 () Bool)

(declare-fun e!303439 () Bool)

(assert (=> d!80249 e!303439))

(declare-fun res!318314 () Bool)

(assert (=> d!80249 (=> (not res!318314) (not e!303439))))

(assert (=> d!80249 (= res!318314 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16307 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16307 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16307 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16307 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16307 a!3235))))))

(declare-fun lt!238212 () Unit!16075)

(declare-fun choose!47 (array!33169 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16075)

(assert (=> d!80249 (= lt!238212 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!238075 #b00000000000000000000000000000000 (index!19663 lt!238074) (x!48787 lt!238074) mask!3524))))

(assert (=> d!80249 (validMask!0 mask!3524)))

(assert (=> d!80249 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238075 #b00000000000000000000000000000000 (index!19663 lt!238074) (x!48787 lt!238074) mask!3524) lt!238212)))

(declare-fun b!520046 () Bool)

(assert (=> b!520046 (= e!303439 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238075 (select (store (arr!15943 a!3235) i!1204 k0!2280) j!176) (array!33170 (store (arr!15943 a!3235) i!1204 k0!2280) (size!16307 a!3235)) mask!3524) (Intermediate!4366 false (index!19663 lt!238074) (x!48787 lt!238074))))))

(assert (= (and d!80249 res!318314) b!520046))

(declare-fun m!501347 () Bool)

(assert (=> d!80249 m!501347))

(assert (=> d!80249 m!501127))

(assert (=> b!520046 m!501135))

(assert (=> b!520046 m!501139))

(assert (=> b!520046 m!501139))

(declare-fun m!501351 () Bool)

(assert (=> b!520046 m!501351))

(assert (=> b!519774 d!80249))

(declare-fun b!520055 () Bool)

(declare-fun lt!238223 () SeekEntryResult!4366)

(assert (=> b!520055 (and (bvsge (index!19663 lt!238223) #b00000000000000000000000000000000) (bvslt (index!19663 lt!238223) (size!16307 lt!238078)))))

(declare-fun res!318317 () Bool)

(assert (=> b!520055 (= res!318317 (= (select (arr!15943 lt!238078) (index!19663 lt!238223)) lt!238076))))

(declare-fun e!303447 () Bool)

(assert (=> b!520055 (=> res!318317 e!303447)))

(declare-fun e!303444 () Bool)

(assert (=> b!520055 (= e!303444 e!303447)))

(declare-fun b!520056 () Bool)

(declare-fun e!303445 () SeekEntryResult!4366)

(assert (=> b!520056 (= e!303445 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!238075 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!238076 lt!238078 mask!3524))))

(declare-fun b!520057 () Bool)

(declare-fun e!303443 () Bool)

(assert (=> b!520057 (= e!303443 e!303444)))

(declare-fun res!318315 () Bool)

(assert (=> b!520057 (= res!318315 (and ((_ is Intermediate!4366) lt!238223) (not (undefined!5178 lt!238223)) (bvslt (x!48787 lt!238223) #b01111111111111111111111111111110) (bvsge (x!48787 lt!238223) #b00000000000000000000000000000000) (bvsge (x!48787 lt!238223) #b00000000000000000000000000000000)))))

(assert (=> b!520057 (=> (not res!318315) (not e!303444))))

(declare-fun b!520058 () Bool)

(assert (=> b!520058 (= e!303445 (Intermediate!4366 false lt!238075 #b00000000000000000000000000000000))))

(declare-fun b!520060 () Bool)

(declare-fun e!303442 () SeekEntryResult!4366)

(assert (=> b!520060 (= e!303442 (Intermediate!4366 true lt!238075 #b00000000000000000000000000000000))))

(declare-fun b!520061 () Bool)

(assert (=> b!520061 (= e!303442 e!303445)))

(declare-fun c!61170 () Bool)

(declare-fun lt!238222 () (_ BitVec 64))

(assert (=> b!520061 (= c!61170 (or (= lt!238222 lt!238076) (= (bvadd lt!238222 lt!238222) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520062 () Bool)

(assert (=> b!520062 (and (bvsge (index!19663 lt!238223) #b00000000000000000000000000000000) (bvslt (index!19663 lt!238223) (size!16307 lt!238078)))))

(assert (=> b!520062 (= e!303447 (= (select (arr!15943 lt!238078) (index!19663 lt!238223)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!520063 () Bool)

(assert (=> b!520063 (= e!303443 (bvsge (x!48787 lt!238223) #b01111111111111111111111111111110))))

(declare-fun b!520059 () Bool)

(assert (=> b!520059 (and (bvsge (index!19663 lt!238223) #b00000000000000000000000000000000) (bvslt (index!19663 lt!238223) (size!16307 lt!238078)))))

(declare-fun res!318316 () Bool)

(assert (=> b!520059 (= res!318316 (= (select (arr!15943 lt!238078) (index!19663 lt!238223)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!520059 (=> res!318316 e!303447)))

(declare-fun d!80261 () Bool)

(assert (=> d!80261 e!303443))

(declare-fun c!61167 () Bool)

(assert (=> d!80261 (= c!61167 (and ((_ is Intermediate!4366) lt!238223) (undefined!5178 lt!238223)))))

(assert (=> d!80261 (= lt!238223 e!303442)))

(declare-fun c!61168 () Bool)

(assert (=> d!80261 (= c!61168 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!80261 (= lt!238222 (select (arr!15943 lt!238078) lt!238075))))

(assert (=> d!80261 (validMask!0 mask!3524)))

(assert (=> d!80261 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238075 lt!238076 lt!238078 mask!3524) lt!238223)))

(assert (= (and d!80261 c!61168) b!520060))

(assert (= (and d!80261 (not c!61168)) b!520061))

(assert (= (and b!520061 c!61170) b!520058))

(assert (= (and b!520061 (not c!61170)) b!520056))

(assert (= (and d!80261 c!61167) b!520063))

(assert (= (and d!80261 (not c!61167)) b!520057))

(assert (= (and b!520057 res!318315) b!520055))

(assert (= (and b!520055 (not res!318317)) b!520059))

(assert (= (and b!520059 (not res!318316)) b!520062))

(declare-fun m!501353 () Bool)

(assert (=> b!520059 m!501353))

(assert (=> b!520062 m!501353))

(declare-fun m!501355 () Bool)

(assert (=> d!80261 m!501355))

(assert (=> d!80261 m!501127))

(assert (=> b!520055 m!501353))

(assert (=> b!520056 m!501283))

(assert (=> b!520056 m!501283))

(declare-fun m!501357 () Bool)

(assert (=> b!520056 m!501357))

(assert (=> b!519774 d!80261))

(declare-fun d!80265 () Bool)

(assert (=> d!80265 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!519784 d!80265))

(declare-fun d!80267 () Bool)

(assert (=> d!80267 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47216 d!80267))

(declare-fun d!80275 () Bool)

(assert (=> d!80275 (= (array_inv!11802 a!3235) (bvsge (size!16307 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47216 d!80275))

(declare-fun b!520105 () Bool)

(declare-fun e!303477 () Bool)

(declare-fun call!31768 () Bool)

(assert (=> b!520105 (= e!303477 call!31768)))

(declare-fun d!80277 () Bool)

(declare-fun res!318333 () Bool)

(declare-fun e!303478 () Bool)

(assert (=> d!80277 (=> res!318333 e!303478)))

(assert (=> d!80277 (= res!318333 (bvsge #b00000000000000000000000000000000 (size!16307 a!3235)))))

(assert (=> d!80277 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!303478)))

(declare-fun bm!31765 () Bool)

(assert (=> bm!31765 (= call!31768 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!520106 () Bool)

(declare-fun e!303479 () Bool)

(assert (=> b!520106 (= e!303478 e!303479)))

(declare-fun c!61185 () Bool)

(assert (=> b!520106 (= c!61185 (validKeyInArray!0 (select (arr!15943 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!520107 () Bool)

(assert (=> b!520107 (= e!303479 e!303477)))

(declare-fun lt!238231 () (_ BitVec 64))

(assert (=> b!520107 (= lt!238231 (select (arr!15943 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!238230 () Unit!16075)

(assert (=> b!520107 (= lt!238230 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!238231 #b00000000000000000000000000000000))))

(assert (=> b!520107 (arrayContainsKey!0 a!3235 lt!238231 #b00000000000000000000000000000000)))

(declare-fun lt!238232 () Unit!16075)

(assert (=> b!520107 (= lt!238232 lt!238230)))

(declare-fun res!318334 () Bool)

(assert (=> b!520107 (= res!318334 (= (seekEntryOrOpen!0 (select (arr!15943 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4366 #b00000000000000000000000000000000)))))

(assert (=> b!520107 (=> (not res!318334) (not e!303477))))

(declare-fun b!520108 () Bool)

(assert (=> b!520108 (= e!303479 call!31768)))

(assert (= (and d!80277 (not res!318333)) b!520106))

(assert (= (and b!520106 c!61185) b!520107))

(assert (= (and b!520106 (not c!61185)) b!520108))

(assert (= (and b!520107 res!318334) b!520105))

(assert (= (or b!520105 b!520108) bm!31765))

(declare-fun m!501389 () Bool)

(assert (=> bm!31765 m!501389))

(assert (=> b!520106 m!501293))

(assert (=> b!520106 m!501293))

(assert (=> b!520106 m!501307))

(assert (=> b!520107 m!501293))

(declare-fun m!501391 () Bool)

(assert (=> b!520107 m!501391))

(declare-fun m!501393 () Bool)

(assert (=> b!520107 m!501393))

(assert (=> b!520107 m!501293))

(declare-fun m!501395 () Bool)

(assert (=> b!520107 m!501395))

(assert (=> b!519777 d!80277))

(check-sat (not b!519973) (not b!520015) (not b!520107) (not b!519947) (not bm!31765) (not d!80261) (not b!519948) (not d!80211) (not b!520013) (not bm!31755) (not b!520046) (not b!520014) (not d!80209) (not d!80247) (not d!80227) (not b!519930) (not d!80217) (not b!520056) (not bm!31758) (not b!519914) (not b!520106) (not b!520020) (not b!519885) (not d!80249))
(check-sat)
