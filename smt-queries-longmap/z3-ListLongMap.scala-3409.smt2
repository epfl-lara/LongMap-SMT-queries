; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47378 () Bool)

(assert start!47378)

(declare-fun b!520906 () Bool)

(declare-fun res!318784 () Bool)

(declare-fun e!303951 () Bool)

(assert (=> b!520906 (=> (not res!318784) (not e!303951))))

(declare-datatypes ((array!33204 0))(
  ( (array!33205 (arr!15958 (Array (_ BitVec 32) (_ BitVec 64))) (size!16322 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33204)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!520906 (= res!318784 (validKeyInArray!0 (select (arr!15958 a!3235) j!176)))))

(declare-fun b!520907 () Bool)

(declare-fun res!318790 () Bool)

(assert (=> b!520907 (=> (not res!318790) (not e!303951))))

(declare-fun k0!2280 () (_ BitVec 64))

(assert (=> b!520907 (= res!318790 (validKeyInArray!0 k0!2280))))

(declare-fun b!520908 () Bool)

(declare-fun e!303948 () Bool)

(assert (=> b!520908 (= e!303948 true)))

(declare-datatypes ((SeekEntryResult!4425 0))(
  ( (MissingZero!4425 (index!19903 (_ BitVec 32))) (Found!4425 (index!19904 (_ BitVec 32))) (Intermediate!4425 (undefined!5237 Bool) (index!19905 (_ BitVec 32)) (x!48891 (_ BitVec 32))) (Undefined!4425) (MissingVacant!4425 (index!19906 (_ BitVec 32))) )
))
(declare-fun lt!238616 () SeekEntryResult!4425)

(assert (=> b!520908 (and (or (= (select (arr!15958 a!3235) (index!19905 lt!238616)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15958 a!3235) (index!19905 lt!238616)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15958 a!3235) (index!19905 lt!238616)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15958 a!3235) (index!19905 lt!238616)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16152 0))(
  ( (Unit!16153) )
))
(declare-fun lt!238619 () Unit!16152)

(declare-fun e!303953 () Unit!16152)

(assert (=> b!520908 (= lt!238619 e!303953)))

(declare-fun c!61364 () Bool)

(assert (=> b!520908 (= c!61364 (= (select (arr!15958 a!3235) (index!19905 lt!238616)) (select (arr!15958 a!3235) j!176)))))

(assert (=> b!520908 (and (bvslt (x!48891 lt!238616) #b01111111111111111111111111111110) (or (= (select (arr!15958 a!3235) (index!19905 lt!238616)) (select (arr!15958 a!3235) j!176)) (= (select (arr!15958 a!3235) (index!19905 lt!238616)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15958 a!3235) (index!19905 lt!238616)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!520909 () Bool)

(declare-fun res!318783 () Bool)

(declare-fun e!303949 () Bool)

(assert (=> b!520909 (=> (not res!318783) (not e!303949))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33204 (_ BitVec 32)) Bool)

(assert (=> b!520909 (= res!318783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!303952 () Bool)

(declare-fun b!520911 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33204 (_ BitVec 32)) SeekEntryResult!4425)

(assert (=> b!520911 (= e!303952 (= (seekEntryOrOpen!0 (select (arr!15958 a!3235) j!176) a!3235 mask!3524) (Found!4425 j!176)))))

(declare-fun b!520912 () Bool)

(declare-fun Unit!16154 () Unit!16152)

(assert (=> b!520912 (= e!303953 Unit!16154)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!238622 () Unit!16152)

(declare-fun lt!238623 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33204 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16152)

(assert (=> b!520912 (= lt!238622 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238623 #b00000000000000000000000000000000 (index!19905 lt!238616) (x!48891 lt!238616) mask!3524))))

(declare-fun res!318791 () Bool)

(declare-fun lt!238617 () array!33204)

(declare-fun lt!238624 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33204 (_ BitVec 32)) SeekEntryResult!4425)

(assert (=> b!520912 (= res!318791 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238623 lt!238624 lt!238617 mask!3524) (Intermediate!4425 false (index!19905 lt!238616) (x!48891 lt!238616))))))

(declare-fun e!303954 () Bool)

(assert (=> b!520912 (=> (not res!318791) (not e!303954))))

(assert (=> b!520912 e!303954))

(declare-fun b!520913 () Bool)

(assert (=> b!520913 (= e!303954 false)))

(declare-fun b!520914 () Bool)

(assert (=> b!520914 (= e!303951 e!303949)))

(declare-fun res!318781 () Bool)

(assert (=> b!520914 (=> (not res!318781) (not e!303949))))

(declare-fun lt!238618 () SeekEntryResult!4425)

(assert (=> b!520914 (= res!318781 (or (= lt!238618 (MissingZero!4425 i!1204)) (= lt!238618 (MissingVacant!4425 i!1204))))))

(assert (=> b!520914 (= lt!238618 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!520915 () Bool)

(declare-fun res!318787 () Bool)

(assert (=> b!520915 (=> (not res!318787) (not e!303951))))

(assert (=> b!520915 (= res!318787 (and (= (size!16322 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16322 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16322 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!520916 () Bool)

(declare-fun res!318788 () Bool)

(assert (=> b!520916 (=> (not res!318788) (not e!303949))))

(declare-datatypes ((List!10116 0))(
  ( (Nil!10113) (Cons!10112 (h!11034 (_ BitVec 64)) (t!16344 List!10116)) )
))
(declare-fun arrayNoDuplicates!0 (array!33204 (_ BitVec 32) List!10116) Bool)

(assert (=> b!520916 (= res!318788 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10113))))

(declare-fun b!520917 () Bool)

(declare-fun res!318780 () Bool)

(assert (=> b!520917 (=> (not res!318780) (not e!303951))))

(declare-fun arrayContainsKey!0 (array!33204 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!520917 (= res!318780 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!318786 () Bool)

(assert (=> start!47378 (=> (not res!318786) (not e!303951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47378 (= res!318786 (validMask!0 mask!3524))))

(assert (=> start!47378 e!303951))

(assert (=> start!47378 true))

(declare-fun array_inv!11754 (array!33204) Bool)

(assert (=> start!47378 (array_inv!11754 a!3235)))

(declare-fun b!520910 () Bool)

(declare-fun res!318789 () Bool)

(assert (=> b!520910 (=> res!318789 e!303948)))

(get-info :version)

(assert (=> b!520910 (= res!318789 (or (undefined!5237 lt!238616) (not ((_ is Intermediate!4425) lt!238616))))))

(declare-fun b!520918 () Bool)

(assert (=> b!520918 (= e!303949 (not e!303948))))

(declare-fun res!318785 () Bool)

(assert (=> b!520918 (=> res!318785 e!303948)))

(declare-fun lt!238621 () (_ BitVec 32))

(assert (=> b!520918 (= res!318785 (= lt!238616 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238621 lt!238624 lt!238617 mask!3524)))))

(assert (=> b!520918 (= lt!238616 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238623 (select (arr!15958 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!520918 (= lt!238621 (toIndex!0 lt!238624 mask!3524))))

(assert (=> b!520918 (= lt!238624 (select (store (arr!15958 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!520918 (= lt!238623 (toIndex!0 (select (arr!15958 a!3235) j!176) mask!3524))))

(assert (=> b!520918 (= lt!238617 (array!33205 (store (arr!15958 a!3235) i!1204 k0!2280) (size!16322 a!3235)))))

(assert (=> b!520918 e!303952))

(declare-fun res!318782 () Bool)

(assert (=> b!520918 (=> (not res!318782) (not e!303952))))

(assert (=> b!520918 (= res!318782 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238620 () Unit!16152)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33204 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16152)

(assert (=> b!520918 (= lt!238620 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!520919 () Bool)

(declare-fun Unit!16155 () Unit!16152)

(assert (=> b!520919 (= e!303953 Unit!16155)))

(assert (= (and start!47378 res!318786) b!520915))

(assert (= (and b!520915 res!318787) b!520906))

(assert (= (and b!520906 res!318784) b!520907))

(assert (= (and b!520907 res!318790) b!520917))

(assert (= (and b!520917 res!318780) b!520914))

(assert (= (and b!520914 res!318781) b!520909))

(assert (= (and b!520909 res!318783) b!520916))

(assert (= (and b!520916 res!318788) b!520918))

(assert (= (and b!520918 res!318782) b!520911))

(assert (= (and b!520918 (not res!318785)) b!520910))

(assert (= (and b!520910 (not res!318789)) b!520908))

(assert (= (and b!520908 c!61364) b!520912))

(assert (= (and b!520908 (not c!61364)) b!520919))

(assert (= (and b!520912 res!318791) b!520913))

(declare-fun m!501819 () Bool)

(assert (=> b!520909 m!501819))

(declare-fun m!501821 () Bool)

(assert (=> b!520914 m!501821))

(declare-fun m!501823 () Bool)

(assert (=> b!520908 m!501823))

(declare-fun m!501825 () Bool)

(assert (=> b!520908 m!501825))

(declare-fun m!501827 () Bool)

(assert (=> b!520918 m!501827))

(declare-fun m!501829 () Bool)

(assert (=> b!520918 m!501829))

(declare-fun m!501831 () Bool)

(assert (=> b!520918 m!501831))

(assert (=> b!520918 m!501825))

(declare-fun m!501833 () Bool)

(assert (=> b!520918 m!501833))

(declare-fun m!501835 () Bool)

(assert (=> b!520918 m!501835))

(declare-fun m!501837 () Bool)

(assert (=> b!520918 m!501837))

(assert (=> b!520918 m!501825))

(declare-fun m!501839 () Bool)

(assert (=> b!520918 m!501839))

(assert (=> b!520918 m!501825))

(declare-fun m!501841 () Bool)

(assert (=> b!520918 m!501841))

(declare-fun m!501843 () Bool)

(assert (=> b!520916 m!501843))

(declare-fun m!501845 () Bool)

(assert (=> start!47378 m!501845))

(declare-fun m!501847 () Bool)

(assert (=> start!47378 m!501847))

(declare-fun m!501849 () Bool)

(assert (=> b!520912 m!501849))

(declare-fun m!501851 () Bool)

(assert (=> b!520912 m!501851))

(assert (=> b!520911 m!501825))

(assert (=> b!520911 m!501825))

(declare-fun m!501853 () Bool)

(assert (=> b!520911 m!501853))

(assert (=> b!520906 m!501825))

(assert (=> b!520906 m!501825))

(declare-fun m!501855 () Bool)

(assert (=> b!520906 m!501855))

(declare-fun m!501857 () Bool)

(assert (=> b!520907 m!501857))

(declare-fun m!501859 () Bool)

(assert (=> b!520917 m!501859))

(check-sat (not b!520918) (not b!520914) (not b!520907) (not b!520912) (not b!520909) (not b!520916) (not start!47378) (not b!520917) (not b!520906) (not b!520911))
(check-sat)
