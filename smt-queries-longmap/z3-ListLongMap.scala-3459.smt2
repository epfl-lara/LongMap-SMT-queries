; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48014 () Bool)

(assert start!48014)

(declare-fun b!528915 () Bool)

(declare-fun e!308217 () Bool)

(assert (=> b!528915 (= e!308217 true)))

(declare-datatypes ((array!33508 0))(
  ( (array!33509 (arr!16102 (Array (_ BitVec 32) (_ BitVec 64))) (size!16466 (_ BitVec 32))) )
))
(declare-fun lt!243766 () array!33508)

(declare-fun lt!243774 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4525 0))(
  ( (MissingZero!4525 (index!20324 (_ BitVec 32))) (Found!4525 (index!20325 (_ BitVec 32))) (Intermediate!4525 (undefined!5337 Bool) (index!20326 (_ BitVec 32)) (x!49442 (_ BitVec 32))) (Undefined!4525) (MissingVacant!4525 (index!20327 (_ BitVec 32))) )
))
(declare-fun lt!243767 () SeekEntryResult!4525)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33508 (_ BitVec 32)) SeekEntryResult!4525)

(assert (=> b!528915 (= (seekEntryOrOpen!0 lt!243774 lt!243766 mask!3524) lt!243767)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!243778 () SeekEntryResult!4525)

(declare-datatypes ((Unit!16711 0))(
  ( (Unit!16712) )
))
(declare-fun lt!243770 () Unit!16711)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!243769 () (_ BitVec 32))

(declare-fun a!3235 () array!33508)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33508 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16711)

(assert (=> b!528915 (= lt!243770 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!243769 #b00000000000000000000000000000000 (index!20326 lt!243778) (x!49442 lt!243778) mask!3524))))

(declare-fun b!528916 () Bool)

(declare-fun e!308210 () Bool)

(assert (=> b!528916 (= e!308210 e!308217)))

(declare-fun res!324898 () Bool)

(assert (=> b!528916 (=> res!324898 e!308217)))

(assert (=> b!528916 (= res!324898 (or (bvsgt (x!49442 lt!243778) #b01111111111111111111111111111110) (bvslt lt!243769 #b00000000000000000000000000000000) (bvsge lt!243769 (size!16466 a!3235)) (bvslt (index!20326 lt!243778) #b00000000000000000000000000000000) (bvsge (index!20326 lt!243778) (size!16466 a!3235)) (not (= lt!243778 (Intermediate!4525 false (index!20326 lt!243778) (x!49442 lt!243778))))))))

(assert (=> b!528916 (= (index!20326 lt!243778) i!1204)))

(declare-fun lt!243773 () Unit!16711)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33508 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16711)

(assert (=> b!528916 (= lt!243773 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243769 #b00000000000000000000000000000000 (index!20326 lt!243778) (x!49442 lt!243778) mask!3524))))

(assert (=> b!528916 (and (or (= (select (arr!16102 a!3235) (index!20326 lt!243778)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16102 a!3235) (index!20326 lt!243778)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16102 a!3235) (index!20326 lt!243778)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16102 a!3235) (index!20326 lt!243778)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243777 () Unit!16711)

(declare-fun e!308211 () Unit!16711)

(assert (=> b!528916 (= lt!243777 e!308211)))

(declare-fun c!62321 () Bool)

(assert (=> b!528916 (= c!62321 (= (select (arr!16102 a!3235) (index!20326 lt!243778)) (select (arr!16102 a!3235) j!176)))))

(assert (=> b!528916 (and (bvslt (x!49442 lt!243778) #b01111111111111111111111111111110) (or (= (select (arr!16102 a!3235) (index!20326 lt!243778)) (select (arr!16102 a!3235) j!176)) (= (select (arr!16102 a!3235) (index!20326 lt!243778)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16102 a!3235) (index!20326 lt!243778)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528917 () Bool)

(declare-fun res!324901 () Bool)

(declare-fun e!308213 () Bool)

(assert (=> b!528917 (=> (not res!324901) (not e!308213))))

(declare-fun arrayContainsKey!0 (array!33508 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528917 (= res!324901 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528918 () Bool)

(declare-fun e!308212 () Bool)

(assert (=> b!528918 (= e!308213 e!308212)))

(declare-fun res!324903 () Bool)

(assert (=> b!528918 (=> (not res!324903) (not e!308212))))

(declare-fun lt!243776 () SeekEntryResult!4525)

(assert (=> b!528918 (= res!324903 (or (= lt!243776 (MissingZero!4525 i!1204)) (= lt!243776 (MissingVacant!4525 i!1204))))))

(assert (=> b!528918 (= lt!243776 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!324900 () Bool)

(assert (=> start!48014 (=> (not res!324900) (not e!308213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48014 (= res!324900 (validMask!0 mask!3524))))

(assert (=> start!48014 e!308213))

(assert (=> start!48014 true))

(declare-fun array_inv!11961 (array!33508) Bool)

(assert (=> start!48014 (array_inv!11961 a!3235)))

(declare-fun b!528919 () Bool)

(declare-fun Unit!16713 () Unit!16711)

(assert (=> b!528919 (= e!308211 Unit!16713)))

(declare-fun b!528920 () Bool)

(declare-fun res!324892 () Bool)

(assert (=> b!528920 (=> (not res!324892) (not e!308212))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33508 (_ BitVec 32)) Bool)

(assert (=> b!528920 (= res!324892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!528921 () Bool)

(declare-fun e!308215 () Bool)

(assert (=> b!528921 (= e!308215 false)))

(declare-fun b!528922 () Bool)

(declare-fun res!324902 () Bool)

(assert (=> b!528922 (=> (not res!324902) (not e!308213))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528922 (= res!324902 (validKeyInArray!0 (select (arr!16102 a!3235) j!176)))))

(declare-fun b!528923 () Bool)

(declare-fun res!324897 () Bool)

(assert (=> b!528923 (=> (not res!324897) (not e!308213))))

(assert (=> b!528923 (= res!324897 (validKeyInArray!0 k0!2280))))

(declare-fun e!308214 () Bool)

(declare-fun b!528924 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33508 (_ BitVec 32)) SeekEntryResult!4525)

(assert (=> b!528924 (= e!308214 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243769 (index!20326 lt!243778) (select (arr!16102 a!3235) j!176) a!3235 mask!3524) lt!243767)))))

(declare-fun b!528925 () Bool)

(declare-fun e!308209 () Bool)

(assert (=> b!528925 (= e!308209 (= (seekEntryOrOpen!0 (select (arr!16102 a!3235) j!176) a!3235 mask!3524) (Found!4525 j!176)))))

(declare-fun b!528926 () Bool)

(declare-fun Unit!16714 () Unit!16711)

(assert (=> b!528926 (= e!308211 Unit!16714)))

(declare-fun lt!243771 () Unit!16711)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33508 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16711)

(assert (=> b!528926 (= lt!243771 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243769 #b00000000000000000000000000000000 (index!20326 lt!243778) (x!49442 lt!243778) mask!3524))))

(declare-fun res!324896 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33508 (_ BitVec 32)) SeekEntryResult!4525)

(assert (=> b!528926 (= res!324896 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243769 lt!243774 lt!243766 mask!3524) (Intermediate!4525 false (index!20326 lt!243778) (x!49442 lt!243778))))))

(assert (=> b!528926 (=> (not res!324896) (not e!308215))))

(assert (=> b!528926 e!308215))

(declare-fun b!528927 () Bool)

(declare-fun res!324894 () Bool)

(assert (=> b!528927 (=> res!324894 e!308217)))

(declare-fun lt!243775 () SeekEntryResult!4525)

(assert (=> b!528927 (= res!324894 (not (= lt!243775 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243769 lt!243774 lt!243766 mask!3524))))))

(declare-fun b!528928 () Bool)

(declare-fun res!324904 () Bool)

(assert (=> b!528928 (=> (not res!324904) (not e!308213))))

(assert (=> b!528928 (= res!324904 (and (= (size!16466 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16466 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16466 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528929 () Bool)

(declare-fun res!324893 () Bool)

(assert (=> b!528929 (=> (not res!324893) (not e!308212))))

(declare-datatypes ((List!10167 0))(
  ( (Nil!10164) (Cons!10163 (h!11100 (_ BitVec 64)) (t!16387 List!10167)) )
))
(declare-fun arrayNoDuplicates!0 (array!33508 (_ BitVec 32) List!10167) Bool)

(assert (=> b!528929 (= res!324893 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10164))))

(declare-fun b!528930 () Bool)

(declare-fun res!324899 () Bool)

(assert (=> b!528930 (=> res!324899 e!308217)))

(assert (=> b!528930 (= res!324899 e!308214)))

(declare-fun res!324891 () Bool)

(assert (=> b!528930 (=> (not res!324891) (not e!308214))))

(assert (=> b!528930 (= res!324891 (bvsgt #b00000000000000000000000000000000 (x!49442 lt!243778)))))

(declare-fun b!528931 () Bool)

(assert (=> b!528931 (= e!308212 (not e!308210))))

(declare-fun res!324890 () Bool)

(assert (=> b!528931 (=> res!324890 e!308210)))

(get-info :version)

(assert (=> b!528931 (= res!324890 (or (= lt!243778 lt!243775) (undefined!5337 lt!243778) (not ((_ is Intermediate!4525) lt!243778))))))

(declare-fun lt!243768 () (_ BitVec 32))

(assert (=> b!528931 (= lt!243775 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243768 lt!243774 lt!243766 mask!3524))))

(assert (=> b!528931 (= lt!243778 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243769 (select (arr!16102 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528931 (= lt!243768 (toIndex!0 lt!243774 mask!3524))))

(assert (=> b!528931 (= lt!243774 (select (store (arr!16102 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!528931 (= lt!243769 (toIndex!0 (select (arr!16102 a!3235) j!176) mask!3524))))

(assert (=> b!528931 (= lt!243766 (array!33509 (store (arr!16102 a!3235) i!1204 k0!2280) (size!16466 a!3235)))))

(assert (=> b!528931 (= lt!243767 (Found!4525 j!176))))

(assert (=> b!528931 e!308209))

(declare-fun res!324895 () Bool)

(assert (=> b!528931 (=> (not res!324895) (not e!308209))))

(assert (=> b!528931 (= res!324895 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!243772 () Unit!16711)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33508 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16711)

(assert (=> b!528931 (= lt!243772 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!48014 res!324900) b!528928))

(assert (= (and b!528928 res!324904) b!528922))

(assert (= (and b!528922 res!324902) b!528923))

(assert (= (and b!528923 res!324897) b!528917))

(assert (= (and b!528917 res!324901) b!528918))

(assert (= (and b!528918 res!324903) b!528920))

(assert (= (and b!528920 res!324892) b!528929))

(assert (= (and b!528929 res!324893) b!528931))

(assert (= (and b!528931 res!324895) b!528925))

(assert (= (and b!528931 (not res!324890)) b!528916))

(assert (= (and b!528916 c!62321) b!528926))

(assert (= (and b!528916 (not c!62321)) b!528919))

(assert (= (and b!528926 res!324896) b!528921))

(assert (= (and b!528916 (not res!324898)) b!528930))

(assert (= (and b!528930 res!324891) b!528924))

(assert (= (and b!528930 (not res!324899)) b!528927))

(assert (= (and b!528927 (not res!324894)) b!528915))

(declare-fun m!509689 () Bool)

(assert (=> b!528917 m!509689))

(declare-fun m!509691 () Bool)

(assert (=> b!528922 m!509691))

(assert (=> b!528922 m!509691))

(declare-fun m!509693 () Bool)

(assert (=> b!528922 m!509693))

(declare-fun m!509695 () Bool)

(assert (=> b!528927 m!509695))

(declare-fun m!509697 () Bool)

(assert (=> b!528916 m!509697))

(declare-fun m!509699 () Bool)

(assert (=> b!528916 m!509699))

(assert (=> b!528916 m!509691))

(declare-fun m!509701 () Bool)

(assert (=> b!528915 m!509701))

(declare-fun m!509703 () Bool)

(assert (=> b!528915 m!509703))

(declare-fun m!509705 () Bool)

(assert (=> b!528918 m!509705))

(declare-fun m!509707 () Bool)

(assert (=> start!48014 m!509707))

(declare-fun m!509709 () Bool)

(assert (=> start!48014 m!509709))

(assert (=> b!528925 m!509691))

(assert (=> b!528925 m!509691))

(declare-fun m!509711 () Bool)

(assert (=> b!528925 m!509711))

(declare-fun m!509713 () Bool)

(assert (=> b!528923 m!509713))

(declare-fun m!509715 () Bool)

(assert (=> b!528920 m!509715))

(declare-fun m!509717 () Bool)

(assert (=> b!528926 m!509717))

(assert (=> b!528926 m!509695))

(assert (=> b!528924 m!509691))

(assert (=> b!528924 m!509691))

(declare-fun m!509719 () Bool)

(assert (=> b!528924 m!509719))

(declare-fun m!509721 () Bool)

(assert (=> b!528931 m!509721))

(declare-fun m!509723 () Bool)

(assert (=> b!528931 m!509723))

(declare-fun m!509725 () Bool)

(assert (=> b!528931 m!509725))

(declare-fun m!509727 () Bool)

(assert (=> b!528931 m!509727))

(assert (=> b!528931 m!509691))

(declare-fun m!509729 () Bool)

(assert (=> b!528931 m!509729))

(declare-fun m!509731 () Bool)

(assert (=> b!528931 m!509731))

(assert (=> b!528931 m!509691))

(declare-fun m!509733 () Bool)

(assert (=> b!528931 m!509733))

(assert (=> b!528931 m!509691))

(declare-fun m!509735 () Bool)

(assert (=> b!528931 m!509735))

(declare-fun m!509737 () Bool)

(assert (=> b!528929 m!509737))

(check-sat (not b!528915) (not b!528916) (not b!528922) (not b!528927) (not b!528925) (not b!528929) (not b!528931) (not b!528918) (not b!528917) (not b!528926) (not b!528923) (not b!528924) (not b!528920) (not start!48014))
(check-sat)
