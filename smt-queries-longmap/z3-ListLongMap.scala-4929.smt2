; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67862 () Bool)

(assert start!67862)

(declare-fun b!789136 () Bool)

(declare-fun e!438599 () Bool)

(declare-fun e!438596 () Bool)

(assert (=> b!789136 (= e!438599 e!438596)))

(declare-fun res!534582 () Bool)

(assert (=> b!789136 (=> res!534582 e!438596)))

(declare-datatypes ((SeekEntryResult!8113 0))(
  ( (MissingZero!8113 (index!34820 (_ BitVec 32))) (Found!8113 (index!34821 (_ BitVec 32))) (Intermediate!8113 (undefined!8925 Bool) (index!34822 (_ BitVec 32)) (x!65769 (_ BitVec 32))) (Undefined!8113) (MissingVacant!8113 (index!34823 (_ BitVec 32))) )
))
(declare-fun lt!351969 () SeekEntryResult!8113)

(declare-fun lt!351979 () SeekEntryResult!8113)

(assert (=> b!789136 (= res!534582 (not (= lt!351969 lt!351979)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42858 0))(
  ( (array!42859 (arr!20516 (Array (_ BitVec 32) (_ BitVec 64))) (size!20937 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42858)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42858 (_ BitVec 32)) SeekEntryResult!8113)

(assert (=> b!789136 (= lt!351969 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20516 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!789137 () Bool)

(declare-fun e!438593 () Bool)

(assert (=> b!789137 (= e!438593 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20516 a!3186) j!159) a!3186 mask!3328) (Found!8113 j!159)))))

(declare-fun b!789138 () Bool)

(declare-fun res!534572 () Bool)

(declare-fun e!438603 () Bool)

(assert (=> b!789138 (=> (not res!534572) (not e!438603))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42858 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!789138 (= res!534572 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!789139 () Bool)

(declare-datatypes ((Unit!27320 0))(
  ( (Unit!27321) )
))
(declare-fun e!438594 () Unit!27320)

(declare-fun Unit!27322 () Unit!27320)

(assert (=> b!789139 (= e!438594 Unit!27322)))

(assert (=> b!789139 false))

(declare-fun b!789140 () Bool)

(declare-fun res!534567 () Bool)

(declare-fun e!438604 () Bool)

(assert (=> b!789140 (=> (not res!534567) (not e!438604))))

(declare-datatypes ((List!14557 0))(
  ( (Nil!14554) (Cons!14553 (h!15679 (_ BitVec 64)) (t!20863 List!14557)) )
))
(declare-fun arrayNoDuplicates!0 (array!42858 (_ BitVec 32) List!14557) Bool)

(assert (=> b!789140 (= res!534567 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14554))))

(declare-fun res!534576 () Bool)

(assert (=> start!67862 (=> (not res!534576) (not e!438603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67862 (= res!534576 (validMask!0 mask!3328))))

(assert (=> start!67862 e!438603))

(assert (=> start!67862 true))

(declare-fun array_inv!16399 (array!42858) Bool)

(assert (=> start!67862 (array_inv!16399 a!3186)))

(declare-fun b!789141 () Bool)

(declare-fun res!534579 () Bool)

(assert (=> b!789141 (=> (not res!534579) (not e!438604))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42858 (_ BitVec 32)) Bool)

(assert (=> b!789141 (= res!534579 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!789142 () Bool)

(declare-fun e!438597 () Bool)

(assert (=> b!789142 (= e!438596 e!438597)))

(declare-fun res!534573 () Bool)

(assert (=> b!789142 (=> res!534573 e!438597)))

(declare-fun lt!351980 () (_ BitVec 64))

(declare-fun lt!351971 () (_ BitVec 64))

(assert (=> b!789142 (= res!534573 (= lt!351980 lt!351971))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!789142 (= lt!351980 (select (store (arr!20516 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun lt!351977 () SeekEntryResult!8113)

(declare-fun b!789143 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42858 (_ BitVec 32)) SeekEntryResult!8113)

(assert (=> b!789143 (= e!438593 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20516 a!3186) j!159) a!3186 mask!3328) lt!351977))))

(declare-fun b!789144 () Bool)

(declare-fun e!438602 () Bool)

(declare-fun e!438595 () Bool)

(assert (=> b!789144 (= e!438602 e!438595)))

(declare-fun res!534569 () Bool)

(assert (=> b!789144 (=> (not res!534569) (not e!438595))))

(declare-fun lt!351978 () SeekEntryResult!8113)

(declare-fun lt!351975 () SeekEntryResult!8113)

(assert (=> b!789144 (= res!534569 (= lt!351978 lt!351975))))

(declare-fun lt!351973 () array!42858)

(assert (=> b!789144 (= lt!351975 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351971 lt!351973 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!789144 (= lt!351978 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351971 mask!3328) lt!351971 lt!351973 mask!3328))))

(assert (=> b!789144 (= lt!351971 (select (store (arr!20516 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!789144 (= lt!351973 (array!42859 (store (arr!20516 a!3186) i!1173 k0!2102) (size!20937 a!3186)))))

(declare-fun b!789145 () Bool)

(declare-fun res!534566 () Bool)

(assert (=> b!789145 (=> (not res!534566) (not e!438603))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!789145 (= res!534566 (validKeyInArray!0 (select (arr!20516 a!3186) j!159)))))

(declare-fun b!789146 () Bool)

(assert (=> b!789146 (= e!438595 (not e!438599))))

(declare-fun res!534568 () Bool)

(assert (=> b!789146 (=> res!534568 e!438599)))

(get-info :version)

(assert (=> b!789146 (= res!534568 (or (not ((_ is Intermediate!8113) lt!351975)) (bvslt x!1131 (x!65769 lt!351975)) (not (= x!1131 (x!65769 lt!351975))) (not (= index!1321 (index!34822 lt!351975)))))))

(declare-fun e!438601 () Bool)

(assert (=> b!789146 e!438601))

(declare-fun res!534574 () Bool)

(assert (=> b!789146 (=> (not res!534574) (not e!438601))))

(declare-fun lt!351972 () SeekEntryResult!8113)

(assert (=> b!789146 (= res!534574 (= lt!351972 lt!351979))))

(assert (=> b!789146 (= lt!351979 (Found!8113 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42858 (_ BitVec 32)) SeekEntryResult!8113)

(assert (=> b!789146 (= lt!351972 (seekEntryOrOpen!0 (select (arr!20516 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!789146 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351974 () Unit!27320)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42858 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27320)

(assert (=> b!789146 (= lt!351974 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!789147 () Bool)

(declare-fun res!534571 () Bool)

(declare-fun e!438600 () Bool)

(assert (=> b!789147 (=> (not res!534571) (not e!438600))))

(assert (=> b!789147 (= res!534571 (= (seekEntryOrOpen!0 lt!351971 lt!351973 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351971 lt!351973 mask!3328)))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!789148 () Bool)

(assert (=> b!789148 (= e!438601 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20516 a!3186) j!159) a!3186 mask!3328) lt!351979))))

(declare-fun b!789149 () Bool)

(declare-fun res!534581 () Bool)

(assert (=> b!789149 (=> (not res!534581) (not e!438602))))

(assert (=> b!789149 (= res!534581 e!438593)))

(declare-fun c!87696 () Bool)

(assert (=> b!789149 (= c!87696 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!789150 () Bool)

(declare-fun res!534570 () Bool)

(assert (=> b!789150 (=> (not res!534570) (not e!438604))))

(assert (=> b!789150 (= res!534570 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20937 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20937 a!3186))))))

(declare-fun b!789151 () Bool)

(assert (=> b!789151 (= e!438603 e!438604)))

(declare-fun res!534580 () Bool)

(assert (=> b!789151 (=> (not res!534580) (not e!438604))))

(declare-fun lt!351970 () SeekEntryResult!8113)

(assert (=> b!789151 (= res!534580 (or (= lt!351970 (MissingZero!8113 i!1173)) (= lt!351970 (MissingVacant!8113 i!1173))))))

(assert (=> b!789151 (= lt!351970 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!789152 () Bool)

(declare-fun Unit!27323 () Unit!27320)

(assert (=> b!789152 (= e!438594 Unit!27323)))

(declare-fun b!789153 () Bool)

(assert (=> b!789153 (= e!438600 (= lt!351972 lt!351969))))

(declare-fun b!789154 () Bool)

(assert (=> b!789154 (= e!438604 e!438602)))

(declare-fun res!534578 () Bool)

(assert (=> b!789154 (=> (not res!534578) (not e!438602))))

(assert (=> b!789154 (= res!534578 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20516 a!3186) j!159) mask!3328) (select (arr!20516 a!3186) j!159) a!3186 mask!3328) lt!351977))))

(assert (=> b!789154 (= lt!351977 (Intermediate!8113 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!789155 () Bool)

(assert (=> b!789155 (= e!438597 true)))

(assert (=> b!789155 e!438600))

(declare-fun res!534577 () Bool)

(assert (=> b!789155 (=> (not res!534577) (not e!438600))))

(assert (=> b!789155 (= res!534577 (= lt!351980 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351976 () Unit!27320)

(assert (=> b!789155 (= lt!351976 e!438594)))

(declare-fun c!87695 () Bool)

(assert (=> b!789155 (= c!87695 (= lt!351980 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!789156 () Bool)

(declare-fun res!534565 () Bool)

(assert (=> b!789156 (=> (not res!534565) (not e!438603))))

(assert (=> b!789156 (= res!534565 (and (= (size!20937 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20937 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20937 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!789157 () Bool)

(declare-fun res!534564 () Bool)

(assert (=> b!789157 (=> (not res!534564) (not e!438602))))

(assert (=> b!789157 (= res!534564 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20516 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!789158 () Bool)

(declare-fun res!534575 () Bool)

(assert (=> b!789158 (=> (not res!534575) (not e!438603))))

(assert (=> b!789158 (= res!534575 (validKeyInArray!0 k0!2102))))

(assert (= (and start!67862 res!534576) b!789156))

(assert (= (and b!789156 res!534565) b!789145))

(assert (= (and b!789145 res!534566) b!789158))

(assert (= (and b!789158 res!534575) b!789138))

(assert (= (and b!789138 res!534572) b!789151))

(assert (= (and b!789151 res!534580) b!789141))

(assert (= (and b!789141 res!534579) b!789140))

(assert (= (and b!789140 res!534567) b!789150))

(assert (= (and b!789150 res!534570) b!789154))

(assert (= (and b!789154 res!534578) b!789157))

(assert (= (and b!789157 res!534564) b!789149))

(assert (= (and b!789149 c!87696) b!789143))

(assert (= (and b!789149 (not c!87696)) b!789137))

(assert (= (and b!789149 res!534581) b!789144))

(assert (= (and b!789144 res!534569) b!789146))

(assert (= (and b!789146 res!534574) b!789148))

(assert (= (and b!789146 (not res!534568)) b!789136))

(assert (= (and b!789136 (not res!534582)) b!789142))

(assert (= (and b!789142 (not res!534573)) b!789155))

(assert (= (and b!789155 c!87695) b!789139))

(assert (= (and b!789155 (not c!87695)) b!789152))

(assert (= (and b!789155 res!534577) b!789147))

(assert (= (and b!789147 res!534571) b!789153))

(declare-fun m!729723 () Bool)

(assert (=> b!789144 m!729723))

(declare-fun m!729725 () Bool)

(assert (=> b!789144 m!729725))

(assert (=> b!789144 m!729725))

(declare-fun m!729727 () Bool)

(assert (=> b!789144 m!729727))

(declare-fun m!729729 () Bool)

(assert (=> b!789144 m!729729))

(declare-fun m!729731 () Bool)

(assert (=> b!789144 m!729731))

(declare-fun m!729733 () Bool)

(assert (=> b!789138 m!729733))

(assert (=> b!789142 m!729729))

(declare-fun m!729735 () Bool)

(assert (=> b!789142 m!729735))

(declare-fun m!729737 () Bool)

(assert (=> b!789154 m!729737))

(assert (=> b!789154 m!729737))

(declare-fun m!729739 () Bool)

(assert (=> b!789154 m!729739))

(assert (=> b!789154 m!729739))

(assert (=> b!789154 m!729737))

(declare-fun m!729741 () Bool)

(assert (=> b!789154 m!729741))

(declare-fun m!729743 () Bool)

(assert (=> b!789141 m!729743))

(assert (=> b!789148 m!729737))

(assert (=> b!789148 m!729737))

(declare-fun m!729745 () Bool)

(assert (=> b!789148 m!729745))

(assert (=> b!789137 m!729737))

(assert (=> b!789137 m!729737))

(declare-fun m!729747 () Bool)

(assert (=> b!789137 m!729747))

(assert (=> b!789146 m!729737))

(assert (=> b!789146 m!729737))

(declare-fun m!729749 () Bool)

(assert (=> b!789146 m!729749))

(declare-fun m!729751 () Bool)

(assert (=> b!789146 m!729751))

(declare-fun m!729753 () Bool)

(assert (=> b!789146 m!729753))

(assert (=> b!789145 m!729737))

(assert (=> b!789145 m!729737))

(declare-fun m!729755 () Bool)

(assert (=> b!789145 m!729755))

(declare-fun m!729757 () Bool)

(assert (=> b!789151 m!729757))

(declare-fun m!729759 () Bool)

(assert (=> start!67862 m!729759))

(declare-fun m!729761 () Bool)

(assert (=> start!67862 m!729761))

(assert (=> b!789143 m!729737))

(assert (=> b!789143 m!729737))

(declare-fun m!729763 () Bool)

(assert (=> b!789143 m!729763))

(declare-fun m!729765 () Bool)

(assert (=> b!789147 m!729765))

(declare-fun m!729767 () Bool)

(assert (=> b!789147 m!729767))

(assert (=> b!789136 m!729737))

(assert (=> b!789136 m!729737))

(assert (=> b!789136 m!729747))

(declare-fun m!729769 () Bool)

(assert (=> b!789157 m!729769))

(declare-fun m!729771 () Bool)

(assert (=> b!789158 m!729771))

(declare-fun m!729773 () Bool)

(assert (=> b!789140 m!729773))

(check-sat (not b!789136) (not b!789145) (not b!789140) (not b!789143) (not b!789146) (not b!789158) (not b!789138) (not b!789154) (not b!789148) (not b!789141) (not b!789147) (not b!789144) (not b!789137) (not b!789151) (not start!67862))
(check-sat)
