; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67762 () Bool)

(assert start!67762)

(declare-fun b!787001 () Bool)

(declare-fun res!532953 () Bool)

(declare-fun e!437469 () Bool)

(assert (=> b!787001 (=> (not res!532953) (not e!437469))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42802 0))(
  ( (array!42803 (arr!20489 (Array (_ BitVec 32) (_ BitVec 64))) (size!20910 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42802)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!787001 (= res!532953 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20489 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787002 () Bool)

(declare-fun res!532958 () Bool)

(declare-fun e!437472 () Bool)

(assert (=> b!787002 (=> (not res!532958) (not e!437472))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!351028 () array!42802)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!351024 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8089 0))(
  ( (MissingZero!8089 (index!34724 (_ BitVec 32))) (Found!8089 (index!34725 (_ BitVec 32))) (Intermediate!8089 (undefined!8901 Bool) (index!34726 (_ BitVec 32)) (x!65661 (_ BitVec 32))) (Undefined!8089) (MissingVacant!8089 (index!34727 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42802 (_ BitVec 32)) SeekEntryResult!8089)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42802 (_ BitVec 32)) SeekEntryResult!8089)

(assert (=> b!787002 (= res!532958 (= (seekEntryOrOpen!0 lt!351024 lt!351028 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351024 lt!351028 mask!3328)))))

(declare-fun res!532967 () Bool)

(declare-fun e!437480 () Bool)

(assert (=> start!67762 (=> (not res!532967) (not e!437480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67762 (= res!532967 (validMask!0 mask!3328))))

(assert (=> start!67762 e!437480))

(assert (=> start!67762 true))

(declare-fun array_inv!16285 (array!42802) Bool)

(assert (=> start!67762 (array_inv!16285 a!3186)))

(declare-fun lt!351027 () SeekEntryResult!8089)

(declare-fun e!437478 () Bool)

(declare-fun b!787003 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42802 (_ BitVec 32)) SeekEntryResult!8089)

(assert (=> b!787003 (= e!437478 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20489 a!3186) j!159) a!3186 mask!3328) lt!351027))))

(declare-fun b!787004 () Bool)

(declare-fun e!437476 () Bool)

(declare-fun e!437479 () Bool)

(assert (=> b!787004 (= e!437476 (not e!437479))))

(declare-fun res!532955 () Bool)

(assert (=> b!787004 (=> res!532955 e!437479)))

(declare-fun lt!351029 () SeekEntryResult!8089)

(assert (=> b!787004 (= res!532955 (or (not (is-Intermediate!8089 lt!351029)) (bvslt x!1131 (x!65661 lt!351029)) (not (= x!1131 (x!65661 lt!351029))) (not (= index!1321 (index!34726 lt!351029)))))))

(declare-fun e!437473 () Bool)

(assert (=> b!787004 e!437473))

(declare-fun res!532968 () Bool)

(assert (=> b!787004 (=> (not res!532968) (not e!437473))))

(declare-fun lt!351030 () SeekEntryResult!8089)

(declare-fun lt!351025 () SeekEntryResult!8089)

(assert (=> b!787004 (= res!532968 (= lt!351030 lt!351025))))

(assert (=> b!787004 (= lt!351025 (Found!8089 j!159))))

(assert (=> b!787004 (= lt!351030 (seekEntryOrOpen!0 (select (arr!20489 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42802 (_ BitVec 32)) Bool)

(assert (=> b!787004 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27244 0))(
  ( (Unit!27245) )
))
(declare-fun lt!351021 () Unit!27244)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42802 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27244)

(assert (=> b!787004 (= lt!351021 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787005 () Bool)

(assert (=> b!787005 (= e!437469 e!437476)))

(declare-fun res!532961 () Bool)

(assert (=> b!787005 (=> (not res!532961) (not e!437476))))

(declare-fun lt!351026 () SeekEntryResult!8089)

(assert (=> b!787005 (= res!532961 (= lt!351026 lt!351029))))

(assert (=> b!787005 (= lt!351029 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351024 lt!351028 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787005 (= lt!351026 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351024 mask!3328) lt!351024 lt!351028 mask!3328))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!787005 (= lt!351024 (select (store (arr!20489 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!787005 (= lt!351028 (array!42803 (store (arr!20489 a!3186) i!1173 k!2102) (size!20910 a!3186)))))

(declare-fun b!787006 () Bool)

(declare-fun e!437471 () Bool)

(assert (=> b!787006 (= e!437480 e!437471)))

(declare-fun res!532970 () Bool)

(assert (=> b!787006 (=> (not res!532970) (not e!437471))))

(declare-fun lt!351031 () SeekEntryResult!8089)

(assert (=> b!787006 (= res!532970 (or (= lt!351031 (MissingZero!8089 i!1173)) (= lt!351031 (MissingVacant!8089 i!1173))))))

(assert (=> b!787006 (= lt!351031 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!787007 () Bool)

(declare-fun res!532969 () Bool)

(assert (=> b!787007 (=> (not res!532969) (not e!437471))))

(declare-datatypes ((List!14491 0))(
  ( (Nil!14488) (Cons!14487 (h!15610 (_ BitVec 64)) (t!20806 List!14491)) )
))
(declare-fun arrayNoDuplicates!0 (array!42802 (_ BitVec 32) List!14491) Bool)

(assert (=> b!787007 (= res!532969 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14488))))

(declare-fun b!787008 () Bool)

(declare-fun res!532963 () Bool)

(assert (=> b!787008 (=> (not res!532963) (not e!437480))))

(declare-fun arrayContainsKey!0 (array!42802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787008 (= res!532963 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787009 () Bool)

(declare-fun res!532952 () Bool)

(assert (=> b!787009 (=> (not res!532952) (not e!437480))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787009 (= res!532952 (validKeyInArray!0 (select (arr!20489 a!3186) j!159)))))

(declare-fun b!787010 () Bool)

(declare-fun res!532962 () Bool)

(assert (=> b!787010 (=> (not res!532962) (not e!437471))))

(assert (=> b!787010 (= res!532962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!787011 () Bool)

(assert (=> b!787011 (= e!437473 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20489 a!3186) j!159) a!3186 mask!3328) lt!351025))))

(declare-fun b!787012 () Bool)

(declare-fun res!532964 () Bool)

(assert (=> b!787012 (=> (not res!532964) (not e!437471))))

(assert (=> b!787012 (= res!532964 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20910 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20910 a!3186))))))

(declare-fun b!787013 () Bool)

(assert (=> b!787013 (= e!437471 e!437469)))

(declare-fun res!532957 () Bool)

(assert (=> b!787013 (=> (not res!532957) (not e!437469))))

(assert (=> b!787013 (= res!532957 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20489 a!3186) j!159) mask!3328) (select (arr!20489 a!3186) j!159) a!3186 mask!3328) lt!351027))))

(assert (=> b!787013 (= lt!351027 (Intermediate!8089 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787014 () Bool)

(declare-fun lt!351022 () SeekEntryResult!8089)

(assert (=> b!787014 (= e!437472 (= lt!351030 lt!351022))))

(declare-fun b!787015 () Bool)

(declare-fun res!532959 () Bool)

(assert (=> b!787015 (=> (not res!532959) (not e!437480))))

(assert (=> b!787015 (= res!532959 (and (= (size!20910 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20910 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20910 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787016 () Bool)

(declare-fun e!437470 () Unit!27244)

(declare-fun Unit!27246 () Unit!27244)

(assert (=> b!787016 (= e!437470 Unit!27246)))

(declare-fun b!787017 () Bool)

(declare-fun e!437474 () Bool)

(assert (=> b!787017 (= e!437479 e!437474)))

(declare-fun res!532956 () Bool)

(assert (=> b!787017 (=> res!532956 e!437474)))

(assert (=> b!787017 (= res!532956 (not (= lt!351022 lt!351025)))))

(assert (=> b!787017 (= lt!351022 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20489 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!787018 () Bool)

(declare-fun res!532965 () Bool)

(assert (=> b!787018 (=> (not res!532965) (not e!437469))))

(assert (=> b!787018 (= res!532965 e!437478)))

(declare-fun c!87432 () Bool)

(assert (=> b!787018 (= c!87432 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787019 () Bool)

(assert (=> b!787019 (= e!437478 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20489 a!3186) j!159) a!3186 mask!3328) (Found!8089 j!159)))))

(declare-fun b!787020 () Bool)

(declare-fun Unit!27247 () Unit!27244)

(assert (=> b!787020 (= e!437470 Unit!27247)))

(assert (=> b!787020 false))

(declare-fun b!787021 () Bool)

(declare-fun res!532960 () Bool)

(assert (=> b!787021 (=> (not res!532960) (not e!437480))))

(assert (=> b!787021 (= res!532960 (validKeyInArray!0 k!2102))))

(declare-fun b!787022 () Bool)

(declare-fun e!437477 () Bool)

(assert (=> b!787022 (= e!437474 e!437477)))

(declare-fun res!532954 () Bool)

(assert (=> b!787022 (=> res!532954 e!437477)))

(declare-fun lt!351023 () (_ BitVec 64))

(assert (=> b!787022 (= res!532954 (= lt!351023 lt!351024))))

(assert (=> b!787022 (= lt!351023 (select (store (arr!20489 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!787023 () Bool)

(assert (=> b!787023 (= e!437477 true)))

(assert (=> b!787023 e!437472))

(declare-fun res!532966 () Bool)

(assert (=> b!787023 (=> (not res!532966) (not e!437472))))

(assert (=> b!787023 (= res!532966 (= lt!351023 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351032 () Unit!27244)

(assert (=> b!787023 (= lt!351032 e!437470)))

(declare-fun c!87433 () Bool)

(assert (=> b!787023 (= c!87433 (= lt!351023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!67762 res!532967) b!787015))

(assert (= (and b!787015 res!532959) b!787009))

(assert (= (and b!787009 res!532952) b!787021))

(assert (= (and b!787021 res!532960) b!787008))

(assert (= (and b!787008 res!532963) b!787006))

(assert (= (and b!787006 res!532970) b!787010))

(assert (= (and b!787010 res!532962) b!787007))

(assert (= (and b!787007 res!532969) b!787012))

(assert (= (and b!787012 res!532964) b!787013))

(assert (= (and b!787013 res!532957) b!787001))

(assert (= (and b!787001 res!532953) b!787018))

(assert (= (and b!787018 c!87432) b!787003))

(assert (= (and b!787018 (not c!87432)) b!787019))

(assert (= (and b!787018 res!532965) b!787005))

(assert (= (and b!787005 res!532961) b!787004))

(assert (= (and b!787004 res!532968) b!787011))

(assert (= (and b!787004 (not res!532955)) b!787017))

(assert (= (and b!787017 (not res!532956)) b!787022))

(assert (= (and b!787022 (not res!532954)) b!787023))

(assert (= (and b!787023 c!87433) b!787020))

(assert (= (and b!787023 (not c!87433)) b!787016))

(assert (= (and b!787023 res!532966) b!787002))

(assert (= (and b!787002 res!532958) b!787014))

(declare-fun m!728689 () Bool)

(assert (=> b!787002 m!728689))

(declare-fun m!728691 () Bool)

(assert (=> b!787002 m!728691))

(declare-fun m!728693 () Bool)

(assert (=> b!787003 m!728693))

(assert (=> b!787003 m!728693))

(declare-fun m!728695 () Bool)

(assert (=> b!787003 m!728695))

(assert (=> b!787011 m!728693))

(assert (=> b!787011 m!728693))

(declare-fun m!728697 () Bool)

(assert (=> b!787011 m!728697))

(assert (=> b!787009 m!728693))

(assert (=> b!787009 m!728693))

(declare-fun m!728699 () Bool)

(assert (=> b!787009 m!728699))

(assert (=> b!787004 m!728693))

(assert (=> b!787004 m!728693))

(declare-fun m!728701 () Bool)

(assert (=> b!787004 m!728701))

(declare-fun m!728703 () Bool)

(assert (=> b!787004 m!728703))

(declare-fun m!728705 () Bool)

(assert (=> b!787004 m!728705))

(assert (=> b!787017 m!728693))

(assert (=> b!787017 m!728693))

(declare-fun m!728707 () Bool)

(assert (=> b!787017 m!728707))

(declare-fun m!728709 () Bool)

(assert (=> b!787022 m!728709))

(declare-fun m!728711 () Bool)

(assert (=> b!787022 m!728711))

(declare-fun m!728713 () Bool)

(assert (=> start!67762 m!728713))

(declare-fun m!728715 () Bool)

(assert (=> start!67762 m!728715))

(declare-fun m!728717 () Bool)

(assert (=> b!787005 m!728717))

(declare-fun m!728719 () Bool)

(assert (=> b!787005 m!728719))

(declare-fun m!728721 () Bool)

(assert (=> b!787005 m!728721))

(assert (=> b!787005 m!728719))

(assert (=> b!787005 m!728709))

(declare-fun m!728723 () Bool)

(assert (=> b!787005 m!728723))

(assert (=> b!787013 m!728693))

(assert (=> b!787013 m!728693))

(declare-fun m!728725 () Bool)

(assert (=> b!787013 m!728725))

(assert (=> b!787013 m!728725))

(assert (=> b!787013 m!728693))

(declare-fun m!728727 () Bool)

(assert (=> b!787013 m!728727))

(declare-fun m!728729 () Bool)

(assert (=> b!787008 m!728729))

(declare-fun m!728731 () Bool)

(assert (=> b!787007 m!728731))

(declare-fun m!728733 () Bool)

(assert (=> b!787010 m!728733))

(declare-fun m!728735 () Bool)

(assert (=> b!787001 m!728735))

(assert (=> b!787019 m!728693))

(assert (=> b!787019 m!728693))

(assert (=> b!787019 m!728707))

(declare-fun m!728737 () Bool)

(assert (=> b!787021 m!728737))

(declare-fun m!728739 () Bool)

(assert (=> b!787006 m!728739))

(push 1)

