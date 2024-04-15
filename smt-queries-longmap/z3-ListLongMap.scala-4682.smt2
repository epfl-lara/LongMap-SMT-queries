; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65132 () Bool)

(assert start!65132)

(declare-fun b!736002 () Bool)

(declare-fun res!494681 () Bool)

(declare-fun e!411733 () Bool)

(assert (=> b!736002 (=> res!494681 e!411733)))

(declare-fun e!411727 () Bool)

(assert (=> b!736002 (= res!494681 e!411727)))

(declare-fun c!81045 () Bool)

(declare-fun lt!326259 () Bool)

(assert (=> b!736002 (= c!81045 lt!326259)))

(declare-datatypes ((array!41322 0))(
  ( (array!41323 (arr!19775 (Array (_ BitVec 32) (_ BitVec 64))) (size!20196 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41322)

(declare-fun b!736003 () Bool)

(declare-datatypes ((SeekEntryResult!7372 0))(
  ( (MissingZero!7372 (index!31856 (_ BitVec 32))) (Found!7372 (index!31857 (_ BitVec 32))) (Intermediate!7372 (undefined!8184 Bool) (index!31858 (_ BitVec 32)) (x!62869 (_ BitVec 32))) (Undefined!7372) (MissingVacant!7372 (index!31859 (_ BitVec 32))) )
))
(declare-fun lt!326258 () SeekEntryResult!7372)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!411726 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41322 (_ BitVec 32)) SeekEntryResult!7372)

(assert (=> b!736003 (= e!411726 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19775 a!3186) j!159) a!3186 mask!3328) lt!326258))))

(declare-fun lt!326248 () SeekEntryResult!7372)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!326256 () (_ BitVec 32))

(declare-fun b!736004 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41322 (_ BitVec 32)) SeekEntryResult!7372)

(assert (=> b!736004 (= e!411727 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326256 resIntermediateIndex!5 (select (arr!19775 a!3186) j!159) a!3186 mask!3328) lt!326248)))))

(declare-fun b!736005 () Bool)

(declare-fun res!494685 () Bool)

(declare-fun e!411728 () Bool)

(assert (=> b!736005 (=> (not res!494685) (not e!411728))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41322 (_ BitVec 32)) Bool)

(assert (=> b!736005 (= res!494685 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!736006 () Bool)

(declare-fun e!411736 () Bool)

(assert (=> b!736006 (= e!411728 e!411736)))

(declare-fun res!494690 () Bool)

(assert (=> b!736006 (=> (not res!494690) (not e!411736))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736006 (= res!494690 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19775 a!3186) j!159) mask!3328) (select (arr!19775 a!3186) j!159) a!3186 mask!3328) lt!326258))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!736006 (= lt!326258 (Intermediate!7372 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736007 () Bool)

(declare-fun res!494678 () Bool)

(assert (=> b!736007 (=> (not res!494678) (not e!411728))))

(declare-datatypes ((List!13816 0))(
  ( (Nil!13813) (Cons!13812 (h!14884 (_ BitVec 64)) (t!20122 List!13816)) )
))
(declare-fun arrayNoDuplicates!0 (array!41322 (_ BitVec 32) List!13816) Bool)

(assert (=> b!736007 (= res!494678 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13813))))

(declare-fun res!494689 () Bool)

(declare-fun e!411729 () Bool)

(assert (=> start!65132 (=> (not res!494689) (not e!411729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65132 (= res!494689 (validMask!0 mask!3328))))

(assert (=> start!65132 e!411729))

(assert (=> start!65132 true))

(declare-fun array_inv!15658 (array!41322) Bool)

(assert (=> start!65132 (array_inv!15658 a!3186)))

(declare-fun b!736008 () Bool)

(declare-fun e!411731 () Bool)

(assert (=> b!736008 (= e!411736 e!411731)))

(declare-fun res!494687 () Bool)

(assert (=> b!736008 (=> (not res!494687) (not e!411731))))

(declare-fun lt!326249 () SeekEntryResult!7372)

(declare-fun lt!326257 () SeekEntryResult!7372)

(assert (=> b!736008 (= res!494687 (= lt!326249 lt!326257))))

(declare-fun lt!326250 () (_ BitVec 64))

(declare-fun lt!326260 () array!41322)

(assert (=> b!736008 (= lt!326257 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326250 lt!326260 mask!3328))))

(assert (=> b!736008 (= lt!326249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326250 mask!3328) lt!326250 lt!326260 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!736008 (= lt!326250 (select (store (arr!19775 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!736008 (= lt!326260 (array!41323 (store (arr!19775 a!3186) i!1173 k0!2102) (size!20196 a!3186)))))

(declare-fun b!736009 () Bool)

(declare-fun res!494677 () Bool)

(assert (=> b!736009 (=> (not res!494677) (not e!411729))))

(declare-fun arrayContainsKey!0 (array!41322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736009 (= res!494677 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!736010 () Bool)

(declare-fun e!411725 () Bool)

(assert (=> b!736010 (= e!411731 (not e!411725))))

(declare-fun res!494686 () Bool)

(assert (=> b!736010 (=> res!494686 e!411725)))

(get-info :version)

(assert (=> b!736010 (= res!494686 (or (not ((_ is Intermediate!7372) lt!326257)) (bvsge x!1131 (x!62869 lt!326257))))))

(assert (=> b!736010 (= lt!326248 (Found!7372 j!159))))

(declare-fun e!411732 () Bool)

(assert (=> b!736010 e!411732))

(declare-fun res!494682 () Bool)

(assert (=> b!736010 (=> (not res!494682) (not e!411732))))

(assert (=> b!736010 (= res!494682 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25064 0))(
  ( (Unit!25065) )
))
(declare-fun lt!326252 () Unit!25064)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25064)

(assert (=> b!736010 (= lt!326252 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736011 () Bool)

(declare-fun e!411735 () Bool)

(declare-fun lt!326253 () SeekEntryResult!7372)

(assert (=> b!736011 (= e!411735 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19775 a!3186) j!159) a!3186 mask!3328) lt!326253))))

(declare-fun b!736012 () Bool)

(assert (=> b!736012 (= e!411726 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19775 a!3186) j!159) a!3186 mask!3328) (Found!7372 j!159)))))

(declare-fun b!736013 () Bool)

(assert (=> b!736013 (= e!411729 e!411728)))

(declare-fun res!494694 () Bool)

(assert (=> b!736013 (=> (not res!494694) (not e!411728))))

(declare-fun lt!326251 () SeekEntryResult!7372)

(assert (=> b!736013 (= res!494694 (or (= lt!326251 (MissingZero!7372 i!1173)) (= lt!326251 (MissingVacant!7372 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41322 (_ BitVec 32)) SeekEntryResult!7372)

(assert (=> b!736013 (= lt!326251 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!736014 () Bool)

(declare-fun res!494680 () Bool)

(assert (=> b!736014 (=> (not res!494680) (not e!411729))))

(assert (=> b!736014 (= res!494680 (and (= (size!20196 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20196 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20196 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736015 () Bool)

(assert (=> b!736015 (= e!411733 true)))

(declare-fun lt!326261 () SeekEntryResult!7372)

(assert (=> b!736015 (= lt!326261 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326256 lt!326250 lt!326260 mask!3328))))

(declare-fun b!736016 () Bool)

(declare-fun res!494683 () Bool)

(assert (=> b!736016 (=> (not res!494683) (not e!411736))))

(assert (=> b!736016 (= res!494683 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19775 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736017 () Bool)

(declare-fun res!494679 () Bool)

(assert (=> b!736017 (=> (not res!494679) (not e!411729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736017 (= res!494679 (validKeyInArray!0 (select (arr!19775 a!3186) j!159)))))

(declare-fun b!736018 () Bool)

(declare-fun e!411734 () Unit!25064)

(declare-fun Unit!25066 () Unit!25064)

(assert (=> b!736018 (= e!411734 Unit!25066)))

(declare-fun lt!326255 () SeekEntryResult!7372)

(assert (=> b!736018 (= lt!326255 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19775 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!736018 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326256 resIntermediateIndex!5 (select (arr!19775 a!3186) j!159) a!3186 mask!3328) lt!326248)))

(declare-fun b!736019 () Bool)

(assert (=> b!736019 (= e!411727 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326256 (select (arr!19775 a!3186) j!159) a!3186 mask!3328) lt!326258)))))

(declare-fun b!736020 () Bool)

(declare-fun res!494691 () Bool)

(assert (=> b!736020 (=> (not res!494691) (not e!411729))))

(assert (=> b!736020 (= res!494691 (validKeyInArray!0 k0!2102))))

(declare-fun b!736021 () Bool)

(assert (=> b!736021 (= e!411725 e!411733)))

(declare-fun res!494688 () Bool)

(assert (=> b!736021 (=> res!494688 e!411733)))

(assert (=> b!736021 (= res!494688 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326256 #b00000000000000000000000000000000) (bvsge lt!326256 (size!20196 a!3186))))))

(declare-fun lt!326254 () Unit!25064)

(assert (=> b!736021 (= lt!326254 e!411734)))

(declare-fun c!81043 () Bool)

(assert (=> b!736021 (= c!81043 lt!326259)))

(assert (=> b!736021 (= lt!326259 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736021 (= lt!326256 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!736022 () Bool)

(assert (=> b!736022 (= e!411732 e!411735)))

(declare-fun res!494693 () Bool)

(assert (=> b!736022 (=> (not res!494693) (not e!411735))))

(assert (=> b!736022 (= res!494693 (= (seekEntryOrOpen!0 (select (arr!19775 a!3186) j!159) a!3186 mask!3328) lt!326253))))

(assert (=> b!736022 (= lt!326253 (Found!7372 j!159))))

(declare-fun b!736023 () Bool)

(declare-fun res!494692 () Bool)

(assert (=> b!736023 (=> (not res!494692) (not e!411728))))

(assert (=> b!736023 (= res!494692 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20196 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20196 a!3186))))))

(declare-fun b!736024 () Bool)

(declare-fun Unit!25067 () Unit!25064)

(assert (=> b!736024 (= e!411734 Unit!25067)))

(assert (=> b!736024 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326256 (select (arr!19775 a!3186) j!159) a!3186 mask!3328) lt!326258)))

(declare-fun b!736025 () Bool)

(declare-fun res!494684 () Bool)

(assert (=> b!736025 (=> (not res!494684) (not e!411736))))

(assert (=> b!736025 (= res!494684 e!411726)))

(declare-fun c!81044 () Bool)

(assert (=> b!736025 (= c!81044 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65132 res!494689) b!736014))

(assert (= (and b!736014 res!494680) b!736017))

(assert (= (and b!736017 res!494679) b!736020))

(assert (= (and b!736020 res!494691) b!736009))

(assert (= (and b!736009 res!494677) b!736013))

(assert (= (and b!736013 res!494694) b!736005))

(assert (= (and b!736005 res!494685) b!736007))

(assert (= (and b!736007 res!494678) b!736023))

(assert (= (and b!736023 res!494692) b!736006))

(assert (= (and b!736006 res!494690) b!736016))

(assert (= (and b!736016 res!494683) b!736025))

(assert (= (and b!736025 c!81044) b!736003))

(assert (= (and b!736025 (not c!81044)) b!736012))

(assert (= (and b!736025 res!494684) b!736008))

(assert (= (and b!736008 res!494687) b!736010))

(assert (= (and b!736010 res!494682) b!736022))

(assert (= (and b!736022 res!494693) b!736011))

(assert (= (and b!736010 (not res!494686)) b!736021))

(assert (= (and b!736021 c!81043) b!736024))

(assert (= (and b!736021 (not c!81043)) b!736018))

(assert (= (and b!736021 (not res!494688)) b!736002))

(assert (= (and b!736002 c!81045) b!736019))

(assert (= (and b!736002 (not c!81045)) b!736004))

(assert (= (and b!736002 (not res!494681)) b!736015))

(declare-fun m!687671 () Bool)

(assert (=> b!736019 m!687671))

(assert (=> b!736019 m!687671))

(declare-fun m!687673 () Bool)

(assert (=> b!736019 m!687673))

(assert (=> b!736018 m!687671))

(assert (=> b!736018 m!687671))

(declare-fun m!687675 () Bool)

(assert (=> b!736018 m!687675))

(assert (=> b!736018 m!687671))

(declare-fun m!687677 () Bool)

(assert (=> b!736018 m!687677))

(assert (=> b!736022 m!687671))

(assert (=> b!736022 m!687671))

(declare-fun m!687679 () Bool)

(assert (=> b!736022 m!687679))

(assert (=> b!736012 m!687671))

(assert (=> b!736012 m!687671))

(assert (=> b!736012 m!687675))

(declare-fun m!687681 () Bool)

(assert (=> b!736007 m!687681))

(declare-fun m!687683 () Bool)

(assert (=> b!736010 m!687683))

(declare-fun m!687685 () Bool)

(assert (=> b!736010 m!687685))

(declare-fun m!687687 () Bool)

(assert (=> b!736005 m!687687))

(assert (=> b!736003 m!687671))

(assert (=> b!736003 m!687671))

(declare-fun m!687689 () Bool)

(assert (=> b!736003 m!687689))

(assert (=> b!736017 m!687671))

(assert (=> b!736017 m!687671))

(declare-fun m!687691 () Bool)

(assert (=> b!736017 m!687691))

(declare-fun m!687693 () Bool)

(assert (=> b!736016 m!687693))

(declare-fun m!687695 () Bool)

(assert (=> b!736008 m!687695))

(declare-fun m!687697 () Bool)

(assert (=> b!736008 m!687697))

(declare-fun m!687699 () Bool)

(assert (=> b!736008 m!687699))

(assert (=> b!736008 m!687695))

(declare-fun m!687701 () Bool)

(assert (=> b!736008 m!687701))

(declare-fun m!687703 () Bool)

(assert (=> b!736008 m!687703))

(assert (=> b!736011 m!687671))

(assert (=> b!736011 m!687671))

(declare-fun m!687705 () Bool)

(assert (=> b!736011 m!687705))

(declare-fun m!687707 () Bool)

(assert (=> b!736020 m!687707))

(declare-fun m!687709 () Bool)

(assert (=> b!736013 m!687709))

(declare-fun m!687711 () Bool)

(assert (=> b!736009 m!687711))

(assert (=> b!736006 m!687671))

(assert (=> b!736006 m!687671))

(declare-fun m!687713 () Bool)

(assert (=> b!736006 m!687713))

(assert (=> b!736006 m!687713))

(assert (=> b!736006 m!687671))

(declare-fun m!687715 () Bool)

(assert (=> b!736006 m!687715))

(assert (=> b!736004 m!687671))

(assert (=> b!736004 m!687671))

(assert (=> b!736004 m!687677))

(declare-fun m!687717 () Bool)

(assert (=> start!65132 m!687717))

(declare-fun m!687719 () Bool)

(assert (=> start!65132 m!687719))

(declare-fun m!687721 () Bool)

(assert (=> b!736015 m!687721))

(assert (=> b!736024 m!687671))

(assert (=> b!736024 m!687671))

(assert (=> b!736024 m!687673))

(declare-fun m!687723 () Bool)

(assert (=> b!736021 m!687723))

(check-sat (not b!736022) (not b!736009) (not b!736021) (not b!736008) (not b!736010) (not b!736019) (not b!736018) (not start!65132) (not b!736017) (not b!736015) (not b!736004) (not b!736007) (not b!736006) (not b!736011) (not b!736003) (not b!736013) (not b!736012) (not b!736020) (not b!736024) (not b!736005))
(check-sat)
