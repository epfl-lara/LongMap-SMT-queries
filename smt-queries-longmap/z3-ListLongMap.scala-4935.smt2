; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68104 () Bool)

(assert start!68104)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42898 0))(
  ( (array!42899 (arr!20530 (Array (_ BitVec 32) (_ BitVec 64))) (size!20950 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42898)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!440019 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!791588 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8086 0))(
  ( (MissingZero!8086 (index!34712 (_ BitVec 32))) (Found!8086 (index!34713 (_ BitVec 32))) (Intermediate!8086 (undefined!8898 Bool) (index!34714 (_ BitVec 32)) (x!65815 (_ BitVec 32))) (Undefined!8086) (MissingVacant!8086 (index!34715 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42898 (_ BitVec 32)) SeekEntryResult!8086)

(assert (=> b!791588 (= e!440019 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20530 a!3186) j!159) a!3186 mask!3328) (Found!8086 j!159)))))

(declare-fun b!791589 () Bool)

(declare-fun e!440023 () Bool)

(declare-fun e!440020 () Bool)

(assert (=> b!791589 (= e!440023 e!440020)))

(declare-fun res!536024 () Bool)

(assert (=> b!791589 (=> (not res!536024) (not e!440020))))

(declare-fun lt!353356 () SeekEntryResult!8086)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!791589 (= res!536024 (or (= lt!353356 (MissingZero!8086 i!1173)) (= lt!353356 (MissingVacant!8086 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42898 (_ BitVec 32)) SeekEntryResult!8086)

(assert (=> b!791589 (= lt!353356 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!791590 () Bool)

(declare-fun res!536020 () Bool)

(assert (=> b!791590 (=> (not res!536020) (not e!440023))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791590 (= res!536020 (validKeyInArray!0 k0!2102))))

(declare-fun b!791591 () Bool)

(declare-fun e!440024 () Bool)

(declare-fun e!440025 () Bool)

(assert (=> b!791591 (= e!440024 e!440025)))

(declare-fun res!536025 () Bool)

(assert (=> b!791591 (=> (not res!536025) (not e!440025))))

(declare-fun lt!353357 () (_ BitVec 64))

(declare-fun lt!353358 () array!42898)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42898 (_ BitVec 32)) SeekEntryResult!8086)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!791591 (= res!536025 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353357 mask!3328) lt!353357 lt!353358 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353357 lt!353358 mask!3328)))))

(assert (=> b!791591 (= lt!353357 (select (store (arr!20530 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!791591 (= lt!353358 (array!42899 (store (arr!20530 a!3186) i!1173 k0!2102) (size!20950 a!3186)))))

(declare-fun b!791592 () Bool)

(declare-fun res!536026 () Bool)

(assert (=> b!791592 (=> (not res!536026) (not e!440023))))

(assert (=> b!791592 (= res!536026 (and (= (size!20950 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20950 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20950 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!791593 () Bool)

(declare-fun res!536027 () Bool)

(assert (=> b!791593 (=> (not res!536027) (not e!440024))))

(assert (=> b!791593 (= res!536027 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20530 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!791594 () Bool)

(declare-fun res!536022 () Bool)

(assert (=> b!791594 (=> (not res!536022) (not e!440023))))

(assert (=> b!791594 (= res!536022 (validKeyInArray!0 (select (arr!20530 a!3186) j!159)))))

(declare-fun b!791595 () Bool)

(declare-fun res!536017 () Bool)

(assert (=> b!791595 (=> (not res!536017) (not e!440024))))

(assert (=> b!791595 (= res!536017 e!440019)))

(declare-fun c!88199 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!791595 (= c!88199 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!791596 () Bool)

(declare-fun res!536018 () Bool)

(assert (=> b!791596 (=> (not res!536018) (not e!440020))))

(declare-datatypes ((List!14439 0))(
  ( (Nil!14436) (Cons!14435 (h!15570 (_ BitVec 64)) (t!20746 List!14439)) )
))
(declare-fun arrayNoDuplicates!0 (array!42898 (_ BitVec 32) List!14439) Bool)

(assert (=> b!791596 (= res!536018 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14436))))

(declare-fun b!791597 () Bool)

(declare-fun lt!353354 () SeekEntryResult!8086)

(assert (=> b!791597 (= e!440019 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20530 a!3186) j!159) a!3186 mask!3328) lt!353354))))

(declare-fun b!791598 () Bool)

(declare-fun res!536023 () Bool)

(assert (=> b!791598 (=> (not res!536023) (not e!440020))))

(assert (=> b!791598 (= res!536023 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20950 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20950 a!3186))))))

(declare-fun res!536031 () Bool)

(assert (=> start!68104 (=> (not res!536031) (not e!440023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68104 (= res!536031 (validMask!0 mask!3328))))

(assert (=> start!68104 e!440023))

(assert (=> start!68104 true))

(declare-fun array_inv!16389 (array!42898) Bool)

(assert (=> start!68104 (array_inv!16389 a!3186)))

(declare-fun b!791599 () Bool)

(assert (=> b!791599 (= e!440025 (not true))))

(declare-fun e!440021 () Bool)

(assert (=> b!791599 e!440021))

(declare-fun res!536028 () Bool)

(assert (=> b!791599 (=> (not res!536028) (not e!440021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42898 (_ BitVec 32)) Bool)

(assert (=> b!791599 (= res!536028 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27403 0))(
  ( (Unit!27404) )
))
(declare-fun lt!353359 () Unit!27403)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42898 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27403)

(assert (=> b!791599 (= lt!353359 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!791600 () Bool)

(declare-fun e!440022 () Bool)

(assert (=> b!791600 (= e!440021 e!440022)))

(declare-fun res!536030 () Bool)

(assert (=> b!791600 (=> (not res!536030) (not e!440022))))

(declare-fun lt!353355 () SeekEntryResult!8086)

(assert (=> b!791600 (= res!536030 (= (seekEntryOrOpen!0 (select (arr!20530 a!3186) j!159) a!3186 mask!3328) lt!353355))))

(assert (=> b!791600 (= lt!353355 (Found!8086 j!159))))

(declare-fun b!791601 () Bool)

(assert (=> b!791601 (= e!440020 e!440024)))

(declare-fun res!536029 () Bool)

(assert (=> b!791601 (=> (not res!536029) (not e!440024))))

(assert (=> b!791601 (= res!536029 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20530 a!3186) j!159) mask!3328) (select (arr!20530 a!3186) j!159) a!3186 mask!3328) lt!353354))))

(assert (=> b!791601 (= lt!353354 (Intermediate!8086 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!791602 () Bool)

(declare-fun res!536019 () Bool)

(assert (=> b!791602 (=> (not res!536019) (not e!440023))))

(declare-fun arrayContainsKey!0 (array!42898 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791602 (= res!536019 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!791603 () Bool)

(declare-fun res!536021 () Bool)

(assert (=> b!791603 (=> (not res!536021) (not e!440020))))

(assert (=> b!791603 (= res!536021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!791604 () Bool)

(assert (=> b!791604 (= e!440022 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20530 a!3186) j!159) a!3186 mask!3328) lt!353355))))

(assert (= (and start!68104 res!536031) b!791592))

(assert (= (and b!791592 res!536026) b!791594))

(assert (= (and b!791594 res!536022) b!791590))

(assert (= (and b!791590 res!536020) b!791602))

(assert (= (and b!791602 res!536019) b!791589))

(assert (= (and b!791589 res!536024) b!791603))

(assert (= (and b!791603 res!536021) b!791596))

(assert (= (and b!791596 res!536018) b!791598))

(assert (= (and b!791598 res!536023) b!791601))

(assert (= (and b!791601 res!536029) b!791593))

(assert (= (and b!791593 res!536027) b!791595))

(assert (= (and b!791595 c!88199) b!791597))

(assert (= (and b!791595 (not c!88199)) b!791588))

(assert (= (and b!791595 res!536017) b!791591))

(assert (= (and b!791591 res!536025) b!791599))

(assert (= (and b!791599 res!536028) b!791600))

(assert (= (and b!791600 res!536030) b!791604))

(declare-fun m!732791 () Bool)

(assert (=> b!791589 m!732791))

(declare-fun m!732793 () Bool)

(assert (=> b!791599 m!732793))

(declare-fun m!732795 () Bool)

(assert (=> b!791599 m!732795))

(declare-fun m!732797 () Bool)

(assert (=> b!791602 m!732797))

(declare-fun m!732799 () Bool)

(assert (=> b!791596 m!732799))

(declare-fun m!732801 () Bool)

(assert (=> b!791591 m!732801))

(declare-fun m!732803 () Bool)

(assert (=> b!791591 m!732803))

(declare-fun m!732805 () Bool)

(assert (=> b!791591 m!732805))

(declare-fun m!732807 () Bool)

(assert (=> b!791591 m!732807))

(declare-fun m!732809 () Bool)

(assert (=> b!791591 m!732809))

(assert (=> b!791591 m!732803))

(declare-fun m!732811 () Bool)

(assert (=> b!791603 m!732811))

(declare-fun m!732813 () Bool)

(assert (=> b!791600 m!732813))

(assert (=> b!791600 m!732813))

(declare-fun m!732815 () Bool)

(assert (=> b!791600 m!732815))

(declare-fun m!732817 () Bool)

(assert (=> b!791590 m!732817))

(declare-fun m!732819 () Bool)

(assert (=> start!68104 m!732819))

(declare-fun m!732821 () Bool)

(assert (=> start!68104 m!732821))

(assert (=> b!791597 m!732813))

(assert (=> b!791597 m!732813))

(declare-fun m!732823 () Bool)

(assert (=> b!791597 m!732823))

(assert (=> b!791588 m!732813))

(assert (=> b!791588 m!732813))

(declare-fun m!732825 () Bool)

(assert (=> b!791588 m!732825))

(declare-fun m!732827 () Bool)

(assert (=> b!791593 m!732827))

(assert (=> b!791601 m!732813))

(assert (=> b!791601 m!732813))

(declare-fun m!732829 () Bool)

(assert (=> b!791601 m!732829))

(assert (=> b!791601 m!732829))

(assert (=> b!791601 m!732813))

(declare-fun m!732831 () Bool)

(assert (=> b!791601 m!732831))

(assert (=> b!791604 m!732813))

(assert (=> b!791604 m!732813))

(declare-fun m!732833 () Bool)

(assert (=> b!791604 m!732833))

(assert (=> b!791594 m!732813))

(assert (=> b!791594 m!732813))

(declare-fun m!732835 () Bool)

(assert (=> b!791594 m!732835))

(check-sat (not b!791591) (not b!791590) (not b!791596) (not b!791602) (not b!791597) (not b!791599) (not b!791600) (not b!791604) (not b!791601) (not b!791603) (not b!791594) (not start!68104) (not b!791589) (not b!791588))
(check-sat)
