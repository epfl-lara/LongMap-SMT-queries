; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48032 () Bool)

(assert start!48032)

(declare-fun b!529175 () Bool)

(declare-fun res!325080 () Bool)

(declare-fun e!308358 () Bool)

(assert (=> b!529175 (=> (not res!325080) (not e!308358))))

(declare-datatypes ((array!33525 0))(
  ( (array!33526 (arr!16111 (Array (_ BitVec 32) (_ BitVec 64))) (size!16475 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33525)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!529175 (= res!325080 (validKeyInArray!0 (select (arr!16111 a!3235) j!176)))))

(declare-fun b!529176 () Bool)

(declare-datatypes ((Unit!16764 0))(
  ( (Unit!16765) )
))
(declare-fun e!308356 () Unit!16764)

(declare-fun Unit!16766 () Unit!16764)

(assert (=> b!529176 (= e!308356 Unit!16766)))

(declare-fun lt!243920 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!243923 () Unit!16764)

(declare-datatypes ((SeekEntryResult!4578 0))(
  ( (MissingZero!4578 (index!20536 (_ BitVec 32))) (Found!4578 (index!20537 (_ BitVec 32))) (Intermediate!4578 (undefined!5390 Bool) (index!20538 (_ BitVec 32)) (x!49506 (_ BitVec 32))) (Undefined!4578) (MissingVacant!4578 (index!20539 (_ BitVec 32))) )
))
(declare-fun lt!243929 () SeekEntryResult!4578)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33525 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16764)

(assert (=> b!529176 (= lt!243923 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243920 #b00000000000000000000000000000000 (index!20538 lt!243929) (x!49506 lt!243929) mask!3524))))

(declare-fun res!325075 () Bool)

(declare-fun lt!243928 () (_ BitVec 64))

(declare-fun lt!243925 () array!33525)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33525 (_ BitVec 32)) SeekEntryResult!4578)

(assert (=> b!529176 (= res!325075 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243920 lt!243928 lt!243925 mask!3524) (Intermediate!4578 false (index!20538 lt!243929) (x!49506 lt!243929))))))

(declare-fun e!308351 () Bool)

(assert (=> b!529176 (=> (not res!325075) (not e!308351))))

(assert (=> b!529176 e!308351))

(declare-fun b!529177 () Bool)

(declare-fun res!325076 () Bool)

(declare-fun e!308353 () Bool)

(assert (=> b!529177 (=> res!325076 e!308353)))

(declare-fun lt!243930 () SeekEntryResult!4578)

(assert (=> b!529177 (= res!325076 (not (= lt!243930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243920 lt!243928 lt!243925 mask!3524))))))

(declare-fun b!529178 () Bool)

(declare-fun res!325083 () Bool)

(declare-fun e!308354 () Bool)

(assert (=> b!529178 (=> (not res!325083) (not e!308354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33525 (_ BitVec 32)) Bool)

(assert (=> b!529178 (= res!325083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!529179 () Bool)

(declare-fun res!325073 () Bool)

(assert (=> b!529179 (=> (not res!325073) (not e!308358))))

(assert (=> b!529179 (= res!325073 (validKeyInArray!0 k0!2280))))

(declare-fun b!529180 () Bool)

(assert (=> b!529180 (= e!308351 false)))

(declare-fun b!529181 () Bool)

(declare-fun Unit!16767 () Unit!16764)

(assert (=> b!529181 (= e!308356 Unit!16767)))

(declare-fun res!325077 () Bool)

(assert (=> start!48032 (=> (not res!325077) (not e!308358))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48032 (= res!325077 (validMask!0 mask!3524))))

(assert (=> start!48032 e!308358))

(assert (=> start!48032 true))

(declare-fun array_inv!11907 (array!33525) Bool)

(assert (=> start!48032 (array_inv!11907 a!3235)))

(declare-fun lt!243932 () SeekEntryResult!4578)

(declare-fun e!308355 () Bool)

(declare-fun b!529182 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33525 (_ BitVec 32)) SeekEntryResult!4578)

(assert (=> b!529182 (= e!308355 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243920 (index!20538 lt!243929) (select (arr!16111 a!3235) j!176) a!3235 mask!3524) lt!243932)))))

(declare-fun b!529183 () Bool)

(declare-fun lt!243927 () SeekEntryResult!4578)

(declare-fun lt!243924 () SeekEntryResult!4578)

(assert (=> b!529183 (= e!308353 (= lt!243927 lt!243924))))

(assert (=> b!529183 (= lt!243924 lt!243932)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33525 (_ BitVec 32)) SeekEntryResult!4578)

(assert (=> b!529183 (= lt!243924 (seekEntryOrOpen!0 lt!243928 lt!243925 mask!3524))))

(declare-fun lt!243922 () Unit!16764)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33525 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16764)

(assert (=> b!529183 (= lt!243922 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!243920 #b00000000000000000000000000000000 (index!20538 lt!243929) (x!49506 lt!243929) mask!3524))))

(declare-fun b!529184 () Bool)

(declare-fun e!308357 () Bool)

(assert (=> b!529184 (= e!308357 e!308353)))

(declare-fun res!325078 () Bool)

(assert (=> b!529184 (=> res!325078 e!308353)))

(assert (=> b!529184 (= res!325078 (or (bvsgt (x!49506 lt!243929) #b01111111111111111111111111111110) (bvslt lt!243920 #b00000000000000000000000000000000) (bvsge lt!243920 (size!16475 a!3235)) (bvslt (index!20538 lt!243929) #b00000000000000000000000000000000) (bvsge (index!20538 lt!243929) (size!16475 a!3235)) (not (= lt!243929 (Intermediate!4578 false (index!20538 lt!243929) (x!49506 lt!243929))))))))

(assert (=> b!529184 (= (index!20538 lt!243929) i!1204)))

(declare-fun lt!243934 () Unit!16764)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33525 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16764)

(assert (=> b!529184 (= lt!243934 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243920 #b00000000000000000000000000000000 (index!20538 lt!243929) (x!49506 lt!243929) mask!3524))))

(assert (=> b!529184 (and (or (= (select (arr!16111 a!3235) (index!20538 lt!243929)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16111 a!3235) (index!20538 lt!243929)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16111 a!3235) (index!20538 lt!243929)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16111 a!3235) (index!20538 lt!243929)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243933 () Unit!16764)

(assert (=> b!529184 (= lt!243933 e!308356)))

(declare-fun c!62360 () Bool)

(assert (=> b!529184 (= c!62360 (= (select (arr!16111 a!3235) (index!20538 lt!243929)) (select (arr!16111 a!3235) j!176)))))

(assert (=> b!529184 (and (bvslt (x!49506 lt!243929) #b01111111111111111111111111111110) (or (= (select (arr!16111 a!3235) (index!20538 lt!243929)) (select (arr!16111 a!3235) j!176)) (= (select (arr!16111 a!3235) (index!20538 lt!243929)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16111 a!3235) (index!20538 lt!243929)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!529185 () Bool)

(assert (=> b!529185 (= e!308358 e!308354)))

(declare-fun res!325082 () Bool)

(assert (=> b!529185 (=> (not res!325082) (not e!308354))))

(declare-fun lt!243926 () SeekEntryResult!4578)

(assert (=> b!529185 (= res!325082 (or (= lt!243926 (MissingZero!4578 i!1204)) (= lt!243926 (MissingVacant!4578 i!1204))))))

(assert (=> b!529185 (= lt!243926 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!529186 () Bool)

(declare-fun res!325084 () Bool)

(assert (=> b!529186 (=> (not res!325084) (not e!308358))))

(assert (=> b!529186 (= res!325084 (and (= (size!16475 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16475 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16475 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!529187 () Bool)

(declare-fun res!325074 () Bool)

(assert (=> b!529187 (=> (not res!325074) (not e!308354))))

(declare-datatypes ((List!10269 0))(
  ( (Nil!10266) (Cons!10265 (h!11202 (_ BitVec 64)) (t!16497 List!10269)) )
))
(declare-fun arrayNoDuplicates!0 (array!33525 (_ BitVec 32) List!10269) Bool)

(assert (=> b!529187 (= res!325074 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10266))))

(declare-fun b!529188 () Bool)

(assert (=> b!529188 (= e!308354 (not e!308357))))

(declare-fun res!325079 () Bool)

(assert (=> b!529188 (=> res!325079 e!308357)))

(get-info :version)

(assert (=> b!529188 (= res!325079 (or (= lt!243929 lt!243930) (undefined!5390 lt!243929) (not ((_ is Intermediate!4578) lt!243929))))))

(declare-fun lt!243931 () (_ BitVec 32))

(assert (=> b!529188 (= lt!243930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243931 lt!243928 lt!243925 mask!3524))))

(assert (=> b!529188 (= lt!243929 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243920 (select (arr!16111 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!529188 (= lt!243931 (toIndex!0 lt!243928 mask!3524))))

(assert (=> b!529188 (= lt!243928 (select (store (arr!16111 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!529188 (= lt!243920 (toIndex!0 (select (arr!16111 a!3235) j!176) mask!3524))))

(assert (=> b!529188 (= lt!243925 (array!33526 (store (arr!16111 a!3235) i!1204 k0!2280) (size!16475 a!3235)))))

(assert (=> b!529188 (= lt!243927 lt!243932)))

(assert (=> b!529188 (= lt!243932 (Found!4578 j!176))))

(assert (=> b!529188 (= lt!243927 (seekEntryOrOpen!0 (select (arr!16111 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!529188 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!243921 () Unit!16764)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33525 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16764)

(assert (=> b!529188 (= lt!243921 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!529189 () Bool)

(declare-fun res!325081 () Bool)

(assert (=> b!529189 (=> (not res!325081) (not e!308358))))

(declare-fun arrayContainsKey!0 (array!33525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!529189 (= res!325081 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!529190 () Bool)

(declare-fun res!325085 () Bool)

(assert (=> b!529190 (=> res!325085 e!308353)))

(assert (=> b!529190 (= res!325085 e!308355)))

(declare-fun res!325072 () Bool)

(assert (=> b!529190 (=> (not res!325072) (not e!308355))))

(assert (=> b!529190 (= res!325072 (bvsgt #b00000000000000000000000000000000 (x!49506 lt!243929)))))

(assert (= (and start!48032 res!325077) b!529186))

(assert (= (and b!529186 res!325084) b!529175))

(assert (= (and b!529175 res!325080) b!529179))

(assert (= (and b!529179 res!325073) b!529189))

(assert (= (and b!529189 res!325081) b!529185))

(assert (= (and b!529185 res!325082) b!529178))

(assert (= (and b!529178 res!325083) b!529187))

(assert (= (and b!529187 res!325074) b!529188))

(assert (= (and b!529188 (not res!325079)) b!529184))

(assert (= (and b!529184 c!62360) b!529176))

(assert (= (and b!529184 (not c!62360)) b!529181))

(assert (= (and b!529176 res!325075) b!529180))

(assert (= (and b!529184 (not res!325078)) b!529190))

(assert (= (and b!529190 res!325072) b!529182))

(assert (= (and b!529190 (not res!325085)) b!529177))

(assert (= (and b!529177 (not res!325076)) b!529183))

(declare-fun m!509705 () Bool)

(assert (=> b!529182 m!509705))

(assert (=> b!529182 m!509705))

(declare-fun m!509707 () Bool)

(assert (=> b!529182 m!509707))

(assert (=> b!529175 m!509705))

(assert (=> b!529175 m!509705))

(declare-fun m!509709 () Bool)

(assert (=> b!529175 m!509709))

(declare-fun m!509711 () Bool)

(assert (=> b!529184 m!509711))

(declare-fun m!509713 () Bool)

(assert (=> b!529184 m!509713))

(assert (=> b!529184 m!509705))

(declare-fun m!509715 () Bool)

(assert (=> b!529176 m!509715))

(declare-fun m!509717 () Bool)

(assert (=> b!529176 m!509717))

(assert (=> b!529177 m!509717))

(declare-fun m!509719 () Bool)

(assert (=> start!48032 m!509719))

(declare-fun m!509721 () Bool)

(assert (=> start!48032 m!509721))

(declare-fun m!509723 () Bool)

(assert (=> b!529188 m!509723))

(declare-fun m!509725 () Bool)

(assert (=> b!529188 m!509725))

(declare-fun m!509727 () Bool)

(assert (=> b!529188 m!509727))

(assert (=> b!529188 m!509705))

(declare-fun m!509729 () Bool)

(assert (=> b!529188 m!509729))

(assert (=> b!529188 m!509705))

(declare-fun m!509731 () Bool)

(assert (=> b!529188 m!509731))

(declare-fun m!509733 () Bool)

(assert (=> b!529188 m!509733))

(declare-fun m!509735 () Bool)

(assert (=> b!529188 m!509735))

(assert (=> b!529188 m!509705))

(declare-fun m!509737 () Bool)

(assert (=> b!529188 m!509737))

(assert (=> b!529188 m!509705))

(declare-fun m!509739 () Bool)

(assert (=> b!529188 m!509739))

(declare-fun m!509741 () Bool)

(assert (=> b!529187 m!509741))

(declare-fun m!509743 () Bool)

(assert (=> b!529179 m!509743))

(declare-fun m!509745 () Bool)

(assert (=> b!529183 m!509745))

(declare-fun m!509747 () Bool)

(assert (=> b!529183 m!509747))

(declare-fun m!509749 () Bool)

(assert (=> b!529189 m!509749))

(declare-fun m!509751 () Bool)

(assert (=> b!529185 m!509751))

(declare-fun m!509753 () Bool)

(assert (=> b!529178 m!509753))

(check-sat (not b!529187) (not b!529189) (not b!529177) (not b!529175) (not b!529182) (not start!48032) (not b!529188) (not b!529179) (not b!529176) (not b!529183) (not b!529178) (not b!529184) (not b!529185))
(check-sat)
