; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66776 () Bool)

(assert start!66776)

(declare-fun b!770087 () Bool)

(declare-fun res!520969 () Bool)

(declare-fun e!428751 () Bool)

(assert (=> b!770087 (=> (not res!520969) (not e!428751))))

(declare-datatypes ((array!42357 0))(
  ( (array!42358 (arr!20279 (Array (_ BitVec 32) (_ BitVec 64))) (size!20700 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42357)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42357 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770087 (= res!520969 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!428754 () Bool)

(declare-fun b!770088 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7876 0))(
  ( (MissingZero!7876 (index!33872 (_ BitVec 32))) (Found!7876 (index!33873 (_ BitVec 32))) (Intermediate!7876 (undefined!8688 Bool) (index!33874 (_ BitVec 32)) (x!64810 (_ BitVec 32))) (Undefined!7876) (MissingVacant!7876 (index!33875 (_ BitVec 32))) )
))
(declare-fun lt!342603 () SeekEntryResult!7876)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42357 (_ BitVec 32)) SeekEntryResult!7876)

(assert (=> b!770088 (= e!428754 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20279 a!3186) j!159) a!3186 mask!3328) lt!342603))))

(declare-fun b!770089 () Bool)

(declare-fun res!520966 () Bool)

(assert (=> b!770089 (=> (not res!520966) (not e!428751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770089 (= res!520966 (validKeyInArray!0 k0!2102))))

(declare-fun b!770090 () Bool)

(declare-fun res!520968 () Bool)

(declare-fun e!428748 () Bool)

(assert (=> b!770090 (=> (not res!520968) (not e!428748))))

(assert (=> b!770090 (= res!520968 e!428754)))

(declare-fun c!84960 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770090 (= c!84960 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770091 () Bool)

(declare-fun e!428749 () Bool)

(declare-fun e!428752 () Bool)

(assert (=> b!770091 (= e!428749 (not e!428752))))

(declare-fun res!520964 () Bool)

(assert (=> b!770091 (=> res!520964 e!428752)))

(declare-fun lt!342608 () SeekEntryResult!7876)

(get-info :version)

(assert (=> b!770091 (= res!520964 (or (not ((_ is Intermediate!7876) lt!342608)) (bvsge x!1131 (x!64810 lt!342608))))))

(declare-fun e!428747 () Bool)

(assert (=> b!770091 e!428747))

(declare-fun res!520971 () Bool)

(assert (=> b!770091 (=> (not res!520971) (not e!428747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42357 (_ BitVec 32)) Bool)

(assert (=> b!770091 (= res!520971 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26498 0))(
  ( (Unit!26499) )
))
(declare-fun lt!342607 () Unit!26498)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42357 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26498)

(assert (=> b!770091 (= lt!342607 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770092 () Bool)

(declare-fun e!428750 () Bool)

(assert (=> b!770092 (= e!428750 e!428748)))

(declare-fun res!520972 () Bool)

(assert (=> b!770092 (=> (not res!520972) (not e!428748))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770092 (= res!520972 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20279 a!3186) j!159) mask!3328) (select (arr!20279 a!3186) j!159) a!3186 mask!3328) lt!342603))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!770092 (= lt!342603 (Intermediate!7876 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770093 () Bool)

(assert (=> b!770093 (= e!428751 e!428750)))

(declare-fun res!520963 () Bool)

(assert (=> b!770093 (=> (not res!520963) (not e!428750))))

(declare-fun lt!342599 () SeekEntryResult!7876)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770093 (= res!520963 (or (= lt!342599 (MissingZero!7876 i!1173)) (= lt!342599 (MissingVacant!7876 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42357 (_ BitVec 32)) SeekEntryResult!7876)

(assert (=> b!770093 (= lt!342599 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!770094 () Bool)

(declare-fun e!428755 () Unit!26498)

(declare-fun Unit!26500 () Unit!26498)

(assert (=> b!770094 (= e!428755 Unit!26500)))

(declare-fun lt!342604 () SeekEntryResult!7876)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42357 (_ BitVec 32)) SeekEntryResult!7876)

(assert (=> b!770094 (= lt!342604 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20279 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!342605 () (_ BitVec 32))

(assert (=> b!770094 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342605 resIntermediateIndex!5 (select (arr!20279 a!3186) j!159) a!3186 mask!3328) (Found!7876 j!159))))

(declare-fun b!770095 () Bool)

(declare-fun res!520965 () Bool)

(assert (=> b!770095 (=> (not res!520965) (not e!428750))))

(assert (=> b!770095 (= res!520965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770096 () Bool)

(declare-fun res!520960 () Bool)

(assert (=> b!770096 (=> (not res!520960) (not e!428751))))

(assert (=> b!770096 (= res!520960 (and (= (size!20700 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20700 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20700 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770097 () Bool)

(declare-fun res!520962 () Bool)

(assert (=> b!770097 (=> (not res!520962) (not e!428750))))

(assert (=> b!770097 (= res!520962 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20700 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20700 a!3186))))))

(declare-fun b!770098 () Bool)

(declare-fun Unit!26501 () Unit!26498)

(assert (=> b!770098 (= e!428755 Unit!26501)))

(assert (=> b!770098 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342605 (select (arr!20279 a!3186) j!159) a!3186 mask!3328) lt!342603)))

(declare-fun res!520961 () Bool)

(assert (=> start!66776 (=> (not res!520961) (not e!428751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66776 (= res!520961 (validMask!0 mask!3328))))

(assert (=> start!66776 e!428751))

(assert (=> start!66776 true))

(declare-fun array_inv!16162 (array!42357) Bool)

(assert (=> start!66776 (array_inv!16162 a!3186)))

(declare-fun b!770086 () Bool)

(declare-fun res!520974 () Bool)

(assert (=> b!770086 (=> (not res!520974) (not e!428748))))

(assert (=> b!770086 (= res!520974 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20279 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770099 () Bool)

(assert (=> b!770099 (= e!428752 true)))

(declare-fun lt!342598 () Unit!26498)

(assert (=> b!770099 (= lt!342598 e!428755)))

(declare-fun c!84959 () Bool)

(assert (=> b!770099 (= c!84959 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770099 (= lt!342605 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!770100 () Bool)

(declare-fun e!428753 () Bool)

(assert (=> b!770100 (= e!428747 e!428753)))

(declare-fun res!520967 () Bool)

(assert (=> b!770100 (=> (not res!520967) (not e!428753))))

(declare-fun lt!342606 () SeekEntryResult!7876)

(assert (=> b!770100 (= res!520967 (= (seekEntryOrOpen!0 (select (arr!20279 a!3186) j!159) a!3186 mask!3328) lt!342606))))

(assert (=> b!770100 (= lt!342606 (Found!7876 j!159))))

(declare-fun b!770101 () Bool)

(assert (=> b!770101 (= e!428753 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20279 a!3186) j!159) a!3186 mask!3328) lt!342606))))

(declare-fun b!770102 () Bool)

(declare-fun res!520973 () Bool)

(assert (=> b!770102 (=> (not res!520973) (not e!428751))))

(assert (=> b!770102 (= res!520973 (validKeyInArray!0 (select (arr!20279 a!3186) j!159)))))

(declare-fun b!770103 () Bool)

(assert (=> b!770103 (= e!428754 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20279 a!3186) j!159) a!3186 mask!3328) (Found!7876 j!159)))))

(declare-fun b!770104 () Bool)

(declare-fun res!520970 () Bool)

(assert (=> b!770104 (=> (not res!520970) (not e!428750))))

(declare-datatypes ((List!14320 0))(
  ( (Nil!14317) (Cons!14316 (h!15415 (_ BitVec 64)) (t!20626 List!14320)) )
))
(declare-fun arrayNoDuplicates!0 (array!42357 (_ BitVec 32) List!14320) Bool)

(assert (=> b!770104 (= res!520970 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14317))))

(declare-fun b!770105 () Bool)

(assert (=> b!770105 (= e!428748 e!428749)))

(declare-fun res!520959 () Bool)

(assert (=> b!770105 (=> (not res!520959) (not e!428749))))

(declare-fun lt!342602 () SeekEntryResult!7876)

(assert (=> b!770105 (= res!520959 (= lt!342602 lt!342608))))

(declare-fun lt!342600 () array!42357)

(declare-fun lt!342601 () (_ BitVec 64))

(assert (=> b!770105 (= lt!342608 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342601 lt!342600 mask!3328))))

(assert (=> b!770105 (= lt!342602 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342601 mask!3328) lt!342601 lt!342600 mask!3328))))

(assert (=> b!770105 (= lt!342601 (select (store (arr!20279 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!770105 (= lt!342600 (array!42358 (store (arr!20279 a!3186) i!1173 k0!2102) (size!20700 a!3186)))))

(assert (= (and start!66776 res!520961) b!770096))

(assert (= (and b!770096 res!520960) b!770102))

(assert (= (and b!770102 res!520973) b!770089))

(assert (= (and b!770089 res!520966) b!770087))

(assert (= (and b!770087 res!520969) b!770093))

(assert (= (and b!770093 res!520963) b!770095))

(assert (= (and b!770095 res!520965) b!770104))

(assert (= (and b!770104 res!520970) b!770097))

(assert (= (and b!770097 res!520962) b!770092))

(assert (= (and b!770092 res!520972) b!770086))

(assert (= (and b!770086 res!520974) b!770090))

(assert (= (and b!770090 c!84960) b!770088))

(assert (= (and b!770090 (not c!84960)) b!770103))

(assert (= (and b!770090 res!520968) b!770105))

(assert (= (and b!770105 res!520959) b!770091))

(assert (= (and b!770091 res!520971) b!770100))

(assert (= (and b!770100 res!520967) b!770101))

(assert (= (and b!770091 (not res!520964)) b!770099))

(assert (= (and b!770099 c!84959) b!770098))

(assert (= (and b!770099 (not c!84959)) b!770094))

(declare-fun m!714873 () Bool)

(assert (=> b!770095 m!714873))

(declare-fun m!714875 () Bool)

(assert (=> b!770105 m!714875))

(declare-fun m!714877 () Bool)

(assert (=> b!770105 m!714877))

(declare-fun m!714879 () Bool)

(assert (=> b!770105 m!714879))

(assert (=> b!770105 m!714875))

(declare-fun m!714881 () Bool)

(assert (=> b!770105 m!714881))

(declare-fun m!714883 () Bool)

(assert (=> b!770105 m!714883))

(declare-fun m!714885 () Bool)

(assert (=> b!770092 m!714885))

(assert (=> b!770092 m!714885))

(declare-fun m!714887 () Bool)

(assert (=> b!770092 m!714887))

(assert (=> b!770092 m!714887))

(assert (=> b!770092 m!714885))

(declare-fun m!714889 () Bool)

(assert (=> b!770092 m!714889))

(declare-fun m!714891 () Bool)

(assert (=> b!770087 m!714891))

(assert (=> b!770088 m!714885))

(assert (=> b!770088 m!714885))

(declare-fun m!714893 () Bool)

(assert (=> b!770088 m!714893))

(assert (=> b!770098 m!714885))

(assert (=> b!770098 m!714885))

(declare-fun m!714895 () Bool)

(assert (=> b!770098 m!714895))

(declare-fun m!714897 () Bool)

(assert (=> b!770093 m!714897))

(declare-fun m!714899 () Bool)

(assert (=> start!66776 m!714899))

(declare-fun m!714901 () Bool)

(assert (=> start!66776 m!714901))

(assert (=> b!770103 m!714885))

(assert (=> b!770103 m!714885))

(declare-fun m!714903 () Bool)

(assert (=> b!770103 m!714903))

(declare-fun m!714905 () Bool)

(assert (=> b!770099 m!714905))

(assert (=> b!770094 m!714885))

(assert (=> b!770094 m!714885))

(assert (=> b!770094 m!714903))

(assert (=> b!770094 m!714885))

(declare-fun m!714907 () Bool)

(assert (=> b!770094 m!714907))

(declare-fun m!714909 () Bool)

(assert (=> b!770104 m!714909))

(assert (=> b!770101 m!714885))

(assert (=> b!770101 m!714885))

(declare-fun m!714911 () Bool)

(assert (=> b!770101 m!714911))

(assert (=> b!770102 m!714885))

(assert (=> b!770102 m!714885))

(declare-fun m!714913 () Bool)

(assert (=> b!770102 m!714913))

(declare-fun m!714915 () Bool)

(assert (=> b!770086 m!714915))

(declare-fun m!714917 () Bool)

(assert (=> b!770089 m!714917))

(assert (=> b!770100 m!714885))

(assert (=> b!770100 m!714885))

(declare-fun m!714919 () Bool)

(assert (=> b!770100 m!714919))

(declare-fun m!714921 () Bool)

(assert (=> b!770091 m!714921))

(declare-fun m!714923 () Bool)

(assert (=> b!770091 m!714923))

(check-sat (not b!770098) (not b!770100) (not b!770095) (not b!770089) (not b!770091) (not b!770101) (not b!770088) (not start!66776) (not b!770099) (not b!770102) (not b!770094) (not b!770105) (not b!770104) (not b!770093) (not b!770103) (not b!770087) (not b!770092))
(check-sat)
