; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48018 () Bool)

(assert start!48018)

(declare-fun b!528856 () Bool)

(declare-fun res!324904 () Bool)

(declare-fun e!308154 () Bool)

(assert (=> b!528856 (=> (not res!324904) (not e!308154))))

(declare-datatypes ((array!33521 0))(
  ( (array!33522 (arr!16109 (Array (_ BitVec 32) (_ BitVec 64))) (size!16474 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33521)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33521 (_ BitVec 32)) Bool)

(assert (=> b!528856 (= res!324904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!528857 () Bool)

(declare-fun e!308159 () Bool)

(assert (=> b!528857 (= e!308154 (not e!308159))))

(declare-fun res!324914 () Bool)

(assert (=> b!528857 (=> res!324914 e!308159)))

(declare-datatypes ((SeekEntryResult!4573 0))(
  ( (MissingZero!4573 (index!20516 (_ BitVec 32))) (Found!4573 (index!20517 (_ BitVec 32))) (Intermediate!4573 (undefined!5385 Bool) (index!20518 (_ BitVec 32)) (x!49496 (_ BitVec 32))) (Undefined!4573) (MissingVacant!4573 (index!20519 (_ BitVec 32))) )
))
(declare-fun lt!243645 () SeekEntryResult!4573)

(declare-fun lt!243651 () SeekEntryResult!4573)

(get-info :version)

(assert (=> b!528857 (= res!324914 (or (= lt!243645 lt!243651) (undefined!5385 lt!243645) (not ((_ is Intermediate!4573) lt!243645))))))

(declare-fun lt!243646 () (_ BitVec 32))

(declare-fun lt!243653 () (_ BitVec 64))

(declare-fun lt!243649 () array!33521)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33521 (_ BitVec 32)) SeekEntryResult!4573)

(assert (=> b!528857 (= lt!243651 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243646 lt!243653 lt!243649 mask!3524))))

(declare-fun lt!243641 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!528857 (= lt!243645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243641 (select (arr!16109 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!528857 (= lt!243646 (toIndex!0 lt!243653 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!528857 (= lt!243653 (select (store (arr!16109 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!528857 (= lt!243641 (toIndex!0 (select (arr!16109 a!3235) j!176) mask!3524))))

(assert (=> b!528857 (= lt!243649 (array!33522 (store (arr!16109 a!3235) i!1204 k0!2280) (size!16474 a!3235)))))

(declare-fun lt!243647 () SeekEntryResult!4573)

(declare-fun lt!243644 () SeekEntryResult!4573)

(assert (=> b!528857 (= lt!243647 lt!243644)))

(assert (=> b!528857 (= lt!243644 (Found!4573 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33521 (_ BitVec 32)) SeekEntryResult!4573)

(assert (=> b!528857 (= lt!243647 (seekEntryOrOpen!0 (select (arr!16109 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!528857 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!16738 0))(
  ( (Unit!16739) )
))
(declare-fun lt!243643 () Unit!16738)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33521 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16738)

(assert (=> b!528857 (= lt!243643 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!528858 () Bool)

(declare-fun res!324907 () Bool)

(declare-fun e!308156 () Bool)

(assert (=> b!528858 (=> (not res!324907) (not e!308156))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!528858 (= res!324907 (validKeyInArray!0 (select (arr!16109 a!3235) j!176)))))

(declare-fun b!528859 () Bool)

(declare-fun res!324906 () Bool)

(declare-fun e!308153 () Bool)

(assert (=> b!528859 (=> res!324906 e!308153)))

(assert (=> b!528859 (= res!324906 (not (= lt!243651 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243641 lt!243653 lt!243649 mask!3524))))))

(declare-fun b!528860 () Bool)

(declare-fun res!324909 () Bool)

(assert (=> b!528860 (=> (not res!324909) (not e!308156))))

(declare-fun arrayContainsKey!0 (array!33521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!528860 (= res!324909 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!528861 () Bool)

(declare-fun res!324911 () Bool)

(assert (=> b!528861 (=> (not res!324911) (not e!308156))))

(assert (=> b!528861 (= res!324911 (validKeyInArray!0 k0!2280))))

(declare-fun b!528862 () Bool)

(declare-fun res!324905 () Bool)

(assert (=> b!528862 (=> (not res!324905) (not e!308156))))

(assert (=> b!528862 (= res!324905 (and (= (size!16474 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16474 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16474 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!528863 () Bool)

(declare-fun lt!243654 () SeekEntryResult!4573)

(assert (=> b!528863 (= e!308153 (= lt!243647 lt!243654))))

(assert (=> b!528863 (= lt!243654 lt!243644)))

(assert (=> b!528863 (= lt!243654 (seekEntryOrOpen!0 lt!243653 lt!243649 mask!3524))))

(declare-fun lt!243655 () Unit!16738)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!33521 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16738)

(assert (=> b!528863 (= lt!243655 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k0!2280 j!176 lt!243641 #b00000000000000000000000000000000 (index!20518 lt!243645) (x!49496 lt!243645) mask!3524))))

(declare-fun b!528864 () Bool)

(declare-fun e!308155 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33521 (_ BitVec 32)) SeekEntryResult!4573)

(assert (=> b!528864 (= e!308155 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!243641 (index!20518 lt!243645) (select (arr!16109 a!3235) j!176) a!3235 mask!3524) lt!243644)))))

(declare-fun res!324912 () Bool)

(assert (=> start!48018 (=> (not res!324912) (not e!308156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48018 (= res!324912 (validMask!0 mask!3524))))

(assert (=> start!48018 e!308156))

(assert (=> start!48018 true))

(declare-fun array_inv!11992 (array!33521) Bool)

(assert (=> start!48018 (array_inv!11992 a!3235)))

(declare-fun b!528865 () Bool)

(declare-fun res!324913 () Bool)

(assert (=> b!528865 (=> res!324913 e!308153)))

(assert (=> b!528865 (= res!324913 e!308155)))

(declare-fun res!324901 () Bool)

(assert (=> b!528865 (=> (not res!324901) (not e!308155))))

(assert (=> b!528865 (= res!324901 (bvsgt #b00000000000000000000000000000000 (x!49496 lt!243645)))))

(declare-fun b!528866 () Bool)

(declare-fun e!308157 () Unit!16738)

(declare-fun Unit!16740 () Unit!16738)

(assert (=> b!528866 (= e!308157 Unit!16740)))

(declare-fun b!528867 () Bool)

(declare-fun e!308158 () Bool)

(assert (=> b!528867 (= e!308158 false)))

(declare-fun b!528868 () Bool)

(assert (=> b!528868 (= e!308159 e!308153)))

(declare-fun res!324903 () Bool)

(assert (=> b!528868 (=> res!324903 e!308153)))

(assert (=> b!528868 (= res!324903 (or (bvsgt (x!49496 lt!243645) #b01111111111111111111111111111110) (bvslt lt!243641 #b00000000000000000000000000000000) (bvsge lt!243641 (size!16474 a!3235)) (bvslt (index!20518 lt!243645) #b00000000000000000000000000000000) (bvsge (index!20518 lt!243645) (size!16474 a!3235)) (not (= lt!243645 (Intermediate!4573 false (index!20518 lt!243645) (x!49496 lt!243645))))))))

(assert (=> b!528868 (= (index!20518 lt!243645) i!1204)))

(declare-fun lt!243650 () Unit!16738)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33521 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16738)

(assert (=> b!528868 (= lt!243650 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!243641 #b00000000000000000000000000000000 (index!20518 lt!243645) (x!49496 lt!243645) mask!3524))))

(assert (=> b!528868 (and (or (= (select (arr!16109 a!3235) (index!20518 lt!243645)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16109 a!3235) (index!20518 lt!243645)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16109 a!3235) (index!20518 lt!243645)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16109 a!3235) (index!20518 lt!243645)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!243642 () Unit!16738)

(assert (=> b!528868 (= lt!243642 e!308157)))

(declare-fun c!62286 () Bool)

(assert (=> b!528868 (= c!62286 (= (select (arr!16109 a!3235) (index!20518 lt!243645)) (select (arr!16109 a!3235) j!176)))))

(assert (=> b!528868 (and (bvslt (x!49496 lt!243645) #b01111111111111111111111111111110) (or (= (select (arr!16109 a!3235) (index!20518 lt!243645)) (select (arr!16109 a!3235) j!176)) (= (select (arr!16109 a!3235) (index!20518 lt!243645)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16109 a!3235) (index!20518 lt!243645)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!528869 () Bool)

(declare-fun Unit!16741 () Unit!16738)

(assert (=> b!528869 (= e!308157 Unit!16741)))

(declare-fun lt!243648 () Unit!16738)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33521 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16738)

(assert (=> b!528869 (= lt!243648 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!243641 #b00000000000000000000000000000000 (index!20518 lt!243645) (x!49496 lt!243645) mask!3524))))

(declare-fun res!324908 () Bool)

(assert (=> b!528869 (= res!324908 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!243641 lt!243653 lt!243649 mask!3524) (Intermediate!4573 false (index!20518 lt!243645) (x!49496 lt!243645))))))

(assert (=> b!528869 (=> (not res!324908) (not e!308158))))

(assert (=> b!528869 e!308158))

(declare-fun b!528870 () Bool)

(assert (=> b!528870 (= e!308156 e!308154)))

(declare-fun res!324902 () Bool)

(assert (=> b!528870 (=> (not res!324902) (not e!308154))))

(declare-fun lt!243652 () SeekEntryResult!4573)

(assert (=> b!528870 (= res!324902 (or (= lt!243652 (MissingZero!4573 i!1204)) (= lt!243652 (MissingVacant!4573 i!1204))))))

(assert (=> b!528870 (= lt!243652 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!528871 () Bool)

(declare-fun res!324910 () Bool)

(assert (=> b!528871 (=> (not res!324910) (not e!308154))))

(declare-datatypes ((List!10306 0))(
  ( (Nil!10303) (Cons!10302 (h!11239 (_ BitVec 64)) (t!16525 List!10306)) )
))
(declare-fun arrayNoDuplicates!0 (array!33521 (_ BitVec 32) List!10306) Bool)

(assert (=> b!528871 (= res!324910 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10303))))

(assert (= (and start!48018 res!324912) b!528862))

(assert (= (and b!528862 res!324905) b!528858))

(assert (= (and b!528858 res!324907) b!528861))

(assert (= (and b!528861 res!324911) b!528860))

(assert (= (and b!528860 res!324909) b!528870))

(assert (= (and b!528870 res!324902) b!528856))

(assert (= (and b!528856 res!324904) b!528871))

(assert (= (and b!528871 res!324910) b!528857))

(assert (= (and b!528857 (not res!324914)) b!528868))

(assert (= (and b!528868 c!62286) b!528869))

(assert (= (and b!528868 (not c!62286)) b!528866))

(assert (= (and b!528869 res!324908) b!528867))

(assert (= (and b!528868 (not res!324903)) b!528865))

(assert (= (and b!528865 res!324901) b!528864))

(assert (= (and b!528865 (not res!324913)) b!528859))

(assert (= (and b!528859 (not res!324906)) b!528863))

(declare-fun m!508903 () Bool)

(assert (=> b!528857 m!508903))

(declare-fun m!508905 () Bool)

(assert (=> b!528857 m!508905))

(declare-fun m!508907 () Bool)

(assert (=> b!528857 m!508907))

(declare-fun m!508909 () Bool)

(assert (=> b!528857 m!508909))

(assert (=> b!528857 m!508907))

(assert (=> b!528857 m!508907))

(declare-fun m!508911 () Bool)

(assert (=> b!528857 m!508911))

(declare-fun m!508913 () Bool)

(assert (=> b!528857 m!508913))

(assert (=> b!528857 m!508907))

(declare-fun m!508915 () Bool)

(assert (=> b!528857 m!508915))

(declare-fun m!508917 () Bool)

(assert (=> b!528857 m!508917))

(declare-fun m!508919 () Bool)

(assert (=> b!528857 m!508919))

(declare-fun m!508921 () Bool)

(assert (=> b!528857 m!508921))

(declare-fun m!508923 () Bool)

(assert (=> b!528860 m!508923))

(assert (=> b!528864 m!508907))

(assert (=> b!528864 m!508907))

(declare-fun m!508925 () Bool)

(assert (=> b!528864 m!508925))

(declare-fun m!508927 () Bool)

(assert (=> b!528870 m!508927))

(assert (=> b!528858 m!508907))

(assert (=> b!528858 m!508907))

(declare-fun m!508929 () Bool)

(assert (=> b!528858 m!508929))

(declare-fun m!508931 () Bool)

(assert (=> b!528871 m!508931))

(declare-fun m!508933 () Bool)

(assert (=> b!528863 m!508933))

(declare-fun m!508935 () Bool)

(assert (=> b!528863 m!508935))

(declare-fun m!508937 () Bool)

(assert (=> b!528868 m!508937))

(declare-fun m!508939 () Bool)

(assert (=> b!528868 m!508939))

(assert (=> b!528868 m!508907))

(declare-fun m!508941 () Bool)

(assert (=> start!48018 m!508941))

(declare-fun m!508943 () Bool)

(assert (=> start!48018 m!508943))

(declare-fun m!508945 () Bool)

(assert (=> b!528869 m!508945))

(declare-fun m!508947 () Bool)

(assert (=> b!528869 m!508947))

(declare-fun m!508949 () Bool)

(assert (=> b!528856 m!508949))

(declare-fun m!508951 () Bool)

(assert (=> b!528861 m!508951))

(assert (=> b!528859 m!508947))

(check-sat (not start!48018) (not b!528869) (not b!528871) (not b!528857) (not b!528863) (not b!528856) (not b!528868) (not b!528864) (not b!528858) (not b!528860) (not b!528861) (not b!528859) (not b!528870))
(check-sat)
