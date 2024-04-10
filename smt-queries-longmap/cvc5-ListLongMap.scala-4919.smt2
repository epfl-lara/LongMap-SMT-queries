; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67758 () Bool)

(assert start!67758)

(declare-fun b!786863 () Bool)

(declare-datatypes ((Unit!27236 0))(
  ( (Unit!27237) )
))
(declare-fun e!437402 () Unit!27236)

(declare-fun Unit!27238 () Unit!27236)

(assert (=> b!786863 (= e!437402 Unit!27238)))

(declare-fun b!786865 () Bool)

(declare-fun res!532843 () Bool)

(declare-fun e!437397 () Bool)

(assert (=> b!786865 (=> (not res!532843) (not e!437397))))

(declare-datatypes ((array!42798 0))(
  ( (array!42799 (arr!20487 (Array (_ BitVec 32) (_ BitVec 64))) (size!20908 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42798)

(declare-datatypes ((List!14489 0))(
  ( (Nil!14486) (Cons!14485 (h!15608 (_ BitVec 64)) (t!20804 List!14489)) )
))
(declare-fun arrayNoDuplicates!0 (array!42798 (_ BitVec 32) List!14489) Bool)

(assert (=> b!786865 (= res!532843 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14486))))

(declare-fun b!786866 () Bool)

(declare-fun res!532851 () Bool)

(declare-fun e!437400 () Bool)

(assert (=> b!786866 (=> (not res!532851) (not e!437400))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786866 (= res!532851 (validKeyInArray!0 k!2102))))

(declare-fun b!786867 () Bool)

(declare-fun e!437403 () Bool)

(declare-fun e!437407 () Bool)

(assert (=> b!786867 (= e!437403 e!437407)))

(declare-fun res!532856 () Bool)

(assert (=> b!786867 (=> (not res!532856) (not e!437407))))

(declare-datatypes ((SeekEntryResult!8087 0))(
  ( (MissingZero!8087 (index!34716 (_ BitVec 32))) (Found!8087 (index!34717 (_ BitVec 32))) (Intermediate!8087 (undefined!8899 Bool) (index!34718 (_ BitVec 32)) (x!65659 (_ BitVec 32))) (Undefined!8087) (MissingVacant!8087 (index!34719 (_ BitVec 32))) )
))
(declare-fun lt!350956 () SeekEntryResult!8087)

(declare-fun lt!350952 () SeekEntryResult!8087)

(assert (=> b!786867 (= res!532856 (= lt!350956 lt!350952))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!350949 () array!42798)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!350959 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42798 (_ BitVec 32)) SeekEntryResult!8087)

(assert (=> b!786867 (= lt!350952 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350959 lt!350949 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786867 (= lt!350956 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350959 mask!3328) lt!350959 lt!350949 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!786867 (= lt!350959 (select (store (arr!20487 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!786867 (= lt!350949 (array!42799 (store (arr!20487 a!3186) i!1173 k!2102) (size!20908 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!786868 () Bool)

(declare-fun e!437398 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42798 (_ BitVec 32)) SeekEntryResult!8087)

(assert (=> b!786868 (= e!437398 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20487 a!3186) j!159) a!3186 mask!3328) (Found!8087 j!159)))))

(declare-fun b!786869 () Bool)

(declare-fun e!437399 () Bool)

(declare-fun e!437405 () Bool)

(assert (=> b!786869 (= e!437399 e!437405)))

(declare-fun res!532854 () Bool)

(assert (=> b!786869 (=> res!532854 e!437405)))

(declare-fun lt!350950 () (_ BitVec 64))

(assert (=> b!786869 (= res!532854 (= lt!350950 lt!350959))))

(assert (=> b!786869 (= lt!350950 (select (store (arr!20487 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!786870 () Bool)

(declare-fun res!532845 () Bool)

(assert (=> b!786870 (=> (not res!532845) (not e!437397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42798 (_ BitVec 32)) Bool)

(assert (=> b!786870 (= res!532845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!786864 () Bool)

(declare-fun e!437401 () Bool)

(assert (=> b!786864 (= e!437401 e!437399)))

(declare-fun res!532846 () Bool)

(assert (=> b!786864 (=> res!532846 e!437399)))

(declare-fun lt!350953 () SeekEntryResult!8087)

(declare-fun lt!350951 () SeekEntryResult!8087)

(assert (=> b!786864 (= res!532846 (not (= lt!350953 lt!350951)))))

(assert (=> b!786864 (= lt!350953 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20487 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!532842 () Bool)

(assert (=> start!67758 (=> (not res!532842) (not e!437400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67758 (= res!532842 (validMask!0 mask!3328))))

(assert (=> start!67758 e!437400))

(assert (=> start!67758 true))

(declare-fun array_inv!16283 (array!42798) Bool)

(assert (=> start!67758 (array_inv!16283 a!3186)))

(declare-fun b!786871 () Bool)

(declare-fun e!437408 () Bool)

(declare-fun lt!350954 () SeekEntryResult!8087)

(assert (=> b!786871 (= e!437408 (= lt!350954 lt!350953))))

(declare-fun b!786872 () Bool)

(assert (=> b!786872 (= e!437405 true)))

(assert (=> b!786872 e!437408))

(declare-fun res!532847 () Bool)

(assert (=> b!786872 (=> (not res!532847) (not e!437408))))

(assert (=> b!786872 (= res!532847 (= lt!350950 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350955 () Unit!27236)

(assert (=> b!786872 (= lt!350955 e!437402)))

(declare-fun c!87421 () Bool)

(assert (=> b!786872 (= c!87421 (= lt!350950 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!437406 () Bool)

(declare-fun b!786873 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!786873 (= e!437406 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20487 a!3186) j!159) a!3186 mask!3328) lt!350951))))

(declare-fun b!786874 () Bool)

(declare-fun res!532852 () Bool)

(assert (=> b!786874 (=> (not res!532852) (not e!437403))))

(assert (=> b!786874 (= res!532852 e!437398)))

(declare-fun c!87420 () Bool)

(assert (=> b!786874 (= c!87420 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!350957 () SeekEntryResult!8087)

(declare-fun b!786875 () Bool)

(assert (=> b!786875 (= e!437398 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20487 a!3186) j!159) a!3186 mask!3328) lt!350957))))

(declare-fun b!786876 () Bool)

(assert (=> b!786876 (= e!437407 (not e!437401))))

(declare-fun res!532838 () Bool)

(assert (=> b!786876 (=> res!532838 e!437401)))

(assert (=> b!786876 (= res!532838 (or (not (is-Intermediate!8087 lt!350952)) (bvslt x!1131 (x!65659 lt!350952)) (not (= x!1131 (x!65659 lt!350952))) (not (= index!1321 (index!34718 lt!350952)))))))

(assert (=> b!786876 e!437406))

(declare-fun res!532855 () Bool)

(assert (=> b!786876 (=> (not res!532855) (not e!437406))))

(assert (=> b!786876 (= res!532855 (= lt!350954 lt!350951))))

(assert (=> b!786876 (= lt!350951 (Found!8087 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42798 (_ BitVec 32)) SeekEntryResult!8087)

(assert (=> b!786876 (= lt!350954 (seekEntryOrOpen!0 (select (arr!20487 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!786876 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350960 () Unit!27236)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42798 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27236)

(assert (=> b!786876 (= lt!350960 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786877 () Bool)

(assert (=> b!786877 (= e!437397 e!437403)))

(declare-fun res!532841 () Bool)

(assert (=> b!786877 (=> (not res!532841) (not e!437403))))

(assert (=> b!786877 (= res!532841 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20487 a!3186) j!159) mask!3328) (select (arr!20487 a!3186) j!159) a!3186 mask!3328) lt!350957))))

(assert (=> b!786877 (= lt!350957 (Intermediate!8087 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786878 () Bool)

(declare-fun res!532844 () Bool)

(assert (=> b!786878 (=> (not res!532844) (not e!437408))))

(assert (=> b!786878 (= res!532844 (= (seekEntryOrOpen!0 lt!350959 lt!350949 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350959 lt!350949 mask!3328)))))

(declare-fun b!786879 () Bool)

(declare-fun res!532853 () Bool)

(assert (=> b!786879 (=> (not res!532853) (not e!437397))))

(assert (=> b!786879 (= res!532853 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20908 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20908 a!3186))))))

(declare-fun b!786880 () Bool)

(declare-fun res!532848 () Bool)

(assert (=> b!786880 (=> (not res!532848) (not e!437400))))

(assert (=> b!786880 (= res!532848 (and (= (size!20908 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20908 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20908 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786881 () Bool)

(assert (=> b!786881 (= e!437400 e!437397)))

(declare-fun res!532840 () Bool)

(assert (=> b!786881 (=> (not res!532840) (not e!437397))))

(declare-fun lt!350958 () SeekEntryResult!8087)

(assert (=> b!786881 (= res!532840 (or (= lt!350958 (MissingZero!8087 i!1173)) (= lt!350958 (MissingVacant!8087 i!1173))))))

(assert (=> b!786881 (= lt!350958 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!786882 () Bool)

(declare-fun res!532850 () Bool)

(assert (=> b!786882 (=> (not res!532850) (not e!437400))))

(assert (=> b!786882 (= res!532850 (validKeyInArray!0 (select (arr!20487 a!3186) j!159)))))

(declare-fun b!786883 () Bool)

(declare-fun res!532849 () Bool)

(assert (=> b!786883 (=> (not res!532849) (not e!437403))))

(assert (=> b!786883 (= res!532849 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20487 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786884 () Bool)

(declare-fun Unit!27239 () Unit!27236)

(assert (=> b!786884 (= e!437402 Unit!27239)))

(assert (=> b!786884 false))

(declare-fun b!786885 () Bool)

(declare-fun res!532839 () Bool)

(assert (=> b!786885 (=> (not res!532839) (not e!437400))))

(declare-fun arrayContainsKey!0 (array!42798 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786885 (= res!532839 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!67758 res!532842) b!786880))

(assert (= (and b!786880 res!532848) b!786882))

(assert (= (and b!786882 res!532850) b!786866))

(assert (= (and b!786866 res!532851) b!786885))

(assert (= (and b!786885 res!532839) b!786881))

(assert (= (and b!786881 res!532840) b!786870))

(assert (= (and b!786870 res!532845) b!786865))

(assert (= (and b!786865 res!532843) b!786879))

(assert (= (and b!786879 res!532853) b!786877))

(assert (= (and b!786877 res!532841) b!786883))

(assert (= (and b!786883 res!532849) b!786874))

(assert (= (and b!786874 c!87420) b!786875))

(assert (= (and b!786874 (not c!87420)) b!786868))

(assert (= (and b!786874 res!532852) b!786867))

(assert (= (and b!786867 res!532856) b!786876))

(assert (= (and b!786876 res!532855) b!786873))

(assert (= (and b!786876 (not res!532838)) b!786864))

(assert (= (and b!786864 (not res!532846)) b!786869))

(assert (= (and b!786869 (not res!532854)) b!786872))

(assert (= (and b!786872 c!87421) b!786884))

(assert (= (and b!786872 (not c!87421)) b!786863))

(assert (= (and b!786872 res!532847) b!786878))

(assert (= (and b!786878 res!532844) b!786871))

(declare-fun m!728585 () Bool)

(assert (=> b!786867 m!728585))

(assert (=> b!786867 m!728585))

(declare-fun m!728587 () Bool)

(assert (=> b!786867 m!728587))

(declare-fun m!728589 () Bool)

(assert (=> b!786867 m!728589))

(declare-fun m!728591 () Bool)

(assert (=> b!786867 m!728591))

(declare-fun m!728593 () Bool)

(assert (=> b!786867 m!728593))

(declare-fun m!728595 () Bool)

(assert (=> b!786873 m!728595))

(assert (=> b!786873 m!728595))

(declare-fun m!728597 () Bool)

(assert (=> b!786873 m!728597))

(declare-fun m!728599 () Bool)

(assert (=> b!786878 m!728599))

(declare-fun m!728601 () Bool)

(assert (=> b!786878 m!728601))

(assert (=> b!786869 m!728589))

(declare-fun m!728603 () Bool)

(assert (=> b!786869 m!728603))

(declare-fun m!728605 () Bool)

(assert (=> b!786883 m!728605))

(declare-fun m!728607 () Bool)

(assert (=> b!786865 m!728607))

(assert (=> b!786882 m!728595))

(assert (=> b!786882 m!728595))

(declare-fun m!728609 () Bool)

(assert (=> b!786882 m!728609))

(assert (=> b!786875 m!728595))

(assert (=> b!786875 m!728595))

(declare-fun m!728611 () Bool)

(assert (=> b!786875 m!728611))

(assert (=> b!786864 m!728595))

(assert (=> b!786864 m!728595))

(declare-fun m!728613 () Bool)

(assert (=> b!786864 m!728613))

(assert (=> b!786877 m!728595))

(assert (=> b!786877 m!728595))

(declare-fun m!728615 () Bool)

(assert (=> b!786877 m!728615))

(assert (=> b!786877 m!728615))

(assert (=> b!786877 m!728595))

(declare-fun m!728617 () Bool)

(assert (=> b!786877 m!728617))

(assert (=> b!786876 m!728595))

(assert (=> b!786876 m!728595))

(declare-fun m!728619 () Bool)

(assert (=> b!786876 m!728619))

(declare-fun m!728621 () Bool)

(assert (=> b!786876 m!728621))

(declare-fun m!728623 () Bool)

(assert (=> b!786876 m!728623))

(declare-fun m!728625 () Bool)

(assert (=> b!786881 m!728625))

(declare-fun m!728627 () Bool)

(assert (=> b!786885 m!728627))

(declare-fun m!728629 () Bool)

(assert (=> start!67758 m!728629))

(declare-fun m!728631 () Bool)

(assert (=> start!67758 m!728631))

(declare-fun m!728633 () Bool)

(assert (=> b!786870 m!728633))

(assert (=> b!786868 m!728595))

(assert (=> b!786868 m!728595))

(assert (=> b!786868 m!728613))

(declare-fun m!728635 () Bool)

(assert (=> b!786866 m!728635))

(push 1)

