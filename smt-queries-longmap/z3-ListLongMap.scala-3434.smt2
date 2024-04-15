; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47712 () Bool)

(assert start!47712)

(declare-fun b!524733 () Bool)

(declare-fun e!305972 () Bool)

(assert (=> b!524733 (= e!305972 true)))

(declare-datatypes ((SeekEntryResult!4495 0))(
  ( (MissingZero!4495 (index!20192 (_ BitVec 32))) (Found!4495 (index!20193 (_ BitVec 32))) (Intermediate!4495 (undefined!5307 Bool) (index!20194 (_ BitVec 32)) (x!49183 (_ BitVec 32))) (Undefined!4495) (MissingVacant!4495 (index!20195 (_ BitVec 32))) )
))
(declare-fun lt!240853 () SeekEntryResult!4495)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524733 (= (index!20194 lt!240853) i!1204)))

(declare-fun lt!240858 () (_ BitVec 32))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((Unit!16426 0))(
  ( (Unit!16427) )
))
(declare-fun lt!240851 () Unit!16426)

(declare-datatypes ((array!33359 0))(
  ( (array!33360 (arr!16031 (Array (_ BitVec 32) (_ BitVec 64))) (size!16396 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33359)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33359 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16426)

(assert (=> b!524733 (= lt!240851 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!240858 #b00000000000000000000000000000000 (index!20194 lt!240853) (x!49183 lt!240853) mask!3524))))

(assert (=> b!524733 (and (or (= (select (arr!16031 a!3235) (index!20194 lt!240853)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16031 a!3235) (index!20194 lt!240853)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16031 a!3235) (index!20194 lt!240853)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16031 a!3235) (index!20194 lt!240853)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240852 () Unit!16426)

(declare-fun e!305973 () Unit!16426)

(assert (=> b!524733 (= lt!240852 e!305973)))

(declare-fun c!61821 () Bool)

(assert (=> b!524733 (= c!61821 (= (select (arr!16031 a!3235) (index!20194 lt!240853)) (select (arr!16031 a!3235) j!176)))))

(assert (=> b!524733 (and (bvslt (x!49183 lt!240853) #b01111111111111111111111111111110) (or (= (select (arr!16031 a!3235) (index!20194 lt!240853)) (select (arr!16031 a!3235) j!176)) (= (select (arr!16031 a!3235) (index!20194 lt!240853)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16031 a!3235) (index!20194 lt!240853)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!524734 () Bool)

(declare-fun res!321713 () Bool)

(declare-fun e!305968 () Bool)

(assert (=> b!524734 (=> (not res!321713) (not e!305968))))

(declare-datatypes ((List!10228 0))(
  ( (Nil!10225) (Cons!10224 (h!11155 (_ BitVec 64)) (t!16447 List!10228)) )
))
(declare-fun arrayNoDuplicates!0 (array!33359 (_ BitVec 32) List!10228) Bool)

(assert (=> b!524734 (= res!321713 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10225))))

(declare-fun b!524735 () Bool)

(declare-fun res!321712 () Bool)

(declare-fun e!305967 () Bool)

(assert (=> b!524735 (=> (not res!321712) (not e!305967))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524735 (= res!321712 (validKeyInArray!0 (select (arr!16031 a!3235) j!176)))))

(declare-fun b!524736 () Bool)

(declare-fun res!321711 () Bool)

(assert (=> b!524736 (=> res!321711 e!305972)))

(get-info :version)

(assert (=> b!524736 (= res!321711 (or (undefined!5307 lt!240853) (not ((_ is Intermediate!4495) lt!240853))))))

(declare-fun res!321710 () Bool)

(assert (=> start!47712 (=> (not res!321710) (not e!305967))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47712 (= res!321710 (validMask!0 mask!3524))))

(assert (=> start!47712 e!305967))

(assert (=> start!47712 true))

(declare-fun array_inv!11914 (array!33359) Bool)

(assert (=> start!47712 (array_inv!11914 a!3235)))

(declare-fun b!524737 () Bool)

(declare-fun e!305971 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33359 (_ BitVec 32)) SeekEntryResult!4495)

(assert (=> b!524737 (= e!305971 (= (seekEntryOrOpen!0 (select (arr!16031 a!3235) j!176) a!3235 mask!3524) (Found!4495 j!176)))))

(declare-fun b!524738 () Bool)

(declare-fun res!321703 () Bool)

(assert (=> b!524738 (=> (not res!321703) (not e!305967))))

(assert (=> b!524738 (= res!321703 (validKeyInArray!0 k0!2280))))

(declare-fun b!524739 () Bool)

(declare-fun res!321704 () Bool)

(assert (=> b!524739 (=> (not res!321704) (not e!305967))))

(assert (=> b!524739 (= res!321704 (and (= (size!16396 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16396 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16396 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524740 () Bool)

(assert (=> b!524740 (= e!305967 e!305968)))

(declare-fun res!321702 () Bool)

(assert (=> b!524740 (=> (not res!321702) (not e!305968))))

(declare-fun lt!240859 () SeekEntryResult!4495)

(assert (=> b!524740 (= res!321702 (or (= lt!240859 (MissingZero!4495 i!1204)) (= lt!240859 (MissingVacant!4495 i!1204))))))

(assert (=> b!524740 (= lt!240859 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!524741 () Bool)

(declare-fun res!321708 () Bool)

(assert (=> b!524741 (=> (not res!321708) (not e!305967))))

(declare-fun arrayContainsKey!0 (array!33359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524741 (= res!321708 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524742 () Bool)

(declare-fun res!321705 () Bool)

(assert (=> b!524742 (=> (not res!321705) (not e!305968))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33359 (_ BitVec 32)) Bool)

(assert (=> b!524742 (= res!321705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524743 () Bool)

(declare-fun Unit!16428 () Unit!16426)

(assert (=> b!524743 (= e!305973 Unit!16428)))

(declare-fun lt!240854 () Unit!16426)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33359 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16426)

(assert (=> b!524743 (= lt!240854 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240858 #b00000000000000000000000000000000 (index!20194 lt!240853) (x!49183 lt!240853) mask!3524))))

(declare-fun lt!240857 () (_ BitVec 64))

(declare-fun lt!240856 () array!33359)

(declare-fun res!321707 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33359 (_ BitVec 32)) SeekEntryResult!4495)

(assert (=> b!524743 (= res!321707 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240858 lt!240857 lt!240856 mask!3524) (Intermediate!4495 false (index!20194 lt!240853) (x!49183 lt!240853))))))

(declare-fun e!305970 () Bool)

(assert (=> b!524743 (=> (not res!321707) (not e!305970))))

(assert (=> b!524743 e!305970))

(declare-fun b!524744 () Bool)

(assert (=> b!524744 (= e!305968 (not e!305972))))

(declare-fun res!321709 () Bool)

(assert (=> b!524744 (=> res!321709 e!305972)))

(declare-fun lt!240850 () (_ BitVec 32))

(assert (=> b!524744 (= res!321709 (= lt!240853 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240850 lt!240857 lt!240856 mask!3524)))))

(assert (=> b!524744 (= lt!240853 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240858 (select (arr!16031 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524744 (= lt!240850 (toIndex!0 lt!240857 mask!3524))))

(assert (=> b!524744 (= lt!240857 (select (store (arr!16031 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!524744 (= lt!240858 (toIndex!0 (select (arr!16031 a!3235) j!176) mask!3524))))

(assert (=> b!524744 (= lt!240856 (array!33360 (store (arr!16031 a!3235) i!1204 k0!2280) (size!16396 a!3235)))))

(assert (=> b!524744 e!305971))

(declare-fun res!321706 () Bool)

(assert (=> b!524744 (=> (not res!321706) (not e!305971))))

(assert (=> b!524744 (= res!321706 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240855 () Unit!16426)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33359 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16426)

(assert (=> b!524744 (= lt!240855 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524745 () Bool)

(declare-fun Unit!16429 () Unit!16426)

(assert (=> b!524745 (= e!305973 Unit!16429)))

(declare-fun b!524746 () Bool)

(assert (=> b!524746 (= e!305970 false)))

(assert (= (and start!47712 res!321710) b!524739))

(assert (= (and b!524739 res!321704) b!524735))

(assert (= (and b!524735 res!321712) b!524738))

(assert (= (and b!524738 res!321703) b!524741))

(assert (= (and b!524741 res!321708) b!524740))

(assert (= (and b!524740 res!321702) b!524742))

(assert (= (and b!524742 res!321705) b!524734))

(assert (= (and b!524734 res!321713) b!524744))

(assert (= (and b!524744 res!321706) b!524737))

(assert (= (and b!524744 (not res!321709)) b!524736))

(assert (= (and b!524736 (not res!321711)) b!524733))

(assert (= (and b!524733 c!61821) b!524743))

(assert (= (and b!524733 (not c!61821)) b!524745))

(assert (= (and b!524743 res!321707) b!524746))

(declare-fun m!504889 () Bool)

(assert (=> b!524742 m!504889))

(declare-fun m!504891 () Bool)

(assert (=> b!524744 m!504891))

(declare-fun m!504893 () Bool)

(assert (=> b!524744 m!504893))

(declare-fun m!504895 () Bool)

(assert (=> b!524744 m!504895))

(declare-fun m!504897 () Bool)

(assert (=> b!524744 m!504897))

(declare-fun m!504899 () Bool)

(assert (=> b!524744 m!504899))

(declare-fun m!504901 () Bool)

(assert (=> b!524744 m!504901))

(assert (=> b!524744 m!504899))

(assert (=> b!524744 m!504899))

(declare-fun m!504903 () Bool)

(assert (=> b!524744 m!504903))

(declare-fun m!504905 () Bool)

(assert (=> b!524744 m!504905))

(declare-fun m!504907 () Bool)

(assert (=> b!524744 m!504907))

(declare-fun m!504909 () Bool)

(assert (=> b!524734 m!504909))

(assert (=> b!524737 m!504899))

(assert (=> b!524737 m!504899))

(declare-fun m!504911 () Bool)

(assert (=> b!524737 m!504911))

(declare-fun m!504913 () Bool)

(assert (=> b!524733 m!504913))

(declare-fun m!504915 () Bool)

(assert (=> b!524733 m!504915))

(assert (=> b!524733 m!504899))

(declare-fun m!504917 () Bool)

(assert (=> b!524741 m!504917))

(declare-fun m!504919 () Bool)

(assert (=> b!524740 m!504919))

(assert (=> b!524735 m!504899))

(assert (=> b!524735 m!504899))

(declare-fun m!504921 () Bool)

(assert (=> b!524735 m!504921))

(declare-fun m!504923 () Bool)

(assert (=> start!47712 m!504923))

(declare-fun m!504925 () Bool)

(assert (=> start!47712 m!504925))

(declare-fun m!504927 () Bool)

(assert (=> b!524738 m!504927))

(declare-fun m!504929 () Bool)

(assert (=> b!524743 m!504929))

(declare-fun m!504931 () Bool)

(assert (=> b!524743 m!504931))

(check-sat (not start!47712) (not b!524738) (not b!524741) (not b!524734) (not b!524737) (not b!524733) (not b!524744) (not b!524740) (not b!524742) (not b!524735) (not b!524743))
(check-sat)
