; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69650 () Bool)

(assert start!69650)

(declare-fun b!810822 () Bool)

(declare-fun e!448896 () Bool)

(declare-fun e!448895 () Bool)

(assert (=> b!810822 (= e!448896 e!448895)))

(declare-fun res!553795 () Bool)

(assert (=> b!810822 (=> (not res!553795) (not e!448895))))

(declare-datatypes ((SeekEntryResult!8629 0))(
  ( (MissingZero!8629 (index!36884 (_ BitVec 32))) (Found!8629 (index!36885 (_ BitVec 32))) (Intermediate!8629 (undefined!9441 Bool) (index!36886 (_ BitVec 32)) (x!67857 (_ BitVec 32))) (Undefined!8629) (MissingVacant!8629 (index!36887 (_ BitVec 32))) )
))
(declare-fun lt!363337 () SeekEntryResult!8629)

(declare-datatypes ((array!44029 0))(
  ( (array!44030 (arr!21082 (Array (_ BitVec 32) (_ BitVec 64))) (size!21502 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44029)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!363335 () SeekEntryResult!8629)

(assert (=> b!810822 (= res!553795 (and (= lt!363337 lt!363335) (= lt!363335 (Found!8629 j!153)) (not (= (select (arr!21082 a!3170) index!1236) (select (arr!21082 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44029 (_ BitVec 32)) SeekEntryResult!8629)

(assert (=> b!810822 (= lt!363335 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21082 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44029 (_ BitVec 32)) SeekEntryResult!8629)

(assert (=> b!810822 (= lt!363337 (seekEntryOrOpen!0 (select (arr!21082 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810823 () Bool)

(declare-fun res!553788 () Bool)

(declare-fun e!448894 () Bool)

(assert (=> b!810823 (=> (not res!553788) (not e!448894))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!810823 (= res!553788 (and (= (size!21502 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21502 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21502 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810824 () Bool)

(declare-fun e!448892 () Bool)

(assert (=> b!810824 (= e!448895 e!448892)))

(declare-fun res!553790 () Bool)

(assert (=> b!810824 (=> (not res!553790) (not e!448892))))

(declare-fun lt!363341 () (_ BitVec 32))

(assert (=> b!810824 (= res!553790 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!363341 #b00000000000000000000000000000000) (bvslt lt!363341 (size!21502 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810824 (= lt!363341 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!810825 () Bool)

(declare-fun res!553793 () Bool)

(declare-fun e!448893 () Bool)

(assert (=> b!810825 (=> (not res!553793) (not e!448893))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!810825 (= res!553793 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21502 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21082 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21502 a!3170)) (= (select (arr!21082 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!553785 () Bool)

(assert (=> start!69650 (=> (not res!553785) (not e!448894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69650 (= res!553785 (validMask!0 mask!3266))))

(assert (=> start!69650 e!448894))

(assert (=> start!69650 true))

(declare-fun array_inv!16941 (array!44029) Bool)

(assert (=> start!69650 (array_inv!16941 a!3170)))

(declare-fun b!810826 () Bool)

(assert (=> b!810826 (= e!448893 e!448896)))

(declare-fun res!553791 () Bool)

(assert (=> b!810826 (=> (not res!553791) (not e!448896))))

(declare-fun lt!363339 () (_ BitVec 64))

(declare-fun lt!363340 () array!44029)

(declare-fun lt!363336 () SeekEntryResult!8629)

(assert (=> b!810826 (= res!553791 (= lt!363336 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363339 lt!363340 mask!3266)))))

(assert (=> b!810826 (= lt!363336 (seekEntryOrOpen!0 lt!363339 lt!363340 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!810826 (= lt!363339 (select (store (arr!21082 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!810826 (= lt!363340 (array!44030 (store (arr!21082 a!3170) i!1163 k0!2044) (size!21502 a!3170)))))

(declare-fun b!810827 () Bool)

(assert (=> b!810827 (= e!448892 (not (= lt!363337 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363341 vacantBefore!23 (select (arr!21082 a!3170) j!153) a!3170 mask!3266))))))

(declare-fun b!810828 () Bool)

(declare-fun res!553794 () Bool)

(assert (=> b!810828 (=> (not res!553794) (not e!448894))))

(declare-fun arrayContainsKey!0 (array!44029 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810828 (= res!553794 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810829 () Bool)

(declare-fun res!553789 () Bool)

(assert (=> b!810829 (=> (not res!553789) (not e!448892))))

(assert (=> b!810829 (= res!553789 (= lt!363336 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363341 vacantAfter!23 lt!363339 lt!363340 mask!3266)))))

(declare-fun b!810830 () Bool)

(declare-fun res!553787 () Bool)

(assert (=> b!810830 (=> (not res!553787) (not e!448893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44029 (_ BitVec 32)) Bool)

(assert (=> b!810830 (= res!553787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810831 () Bool)

(declare-fun res!553792 () Bool)

(assert (=> b!810831 (=> (not res!553792) (not e!448894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810831 (= res!553792 (validKeyInArray!0 k0!2044))))

(declare-fun b!810832 () Bool)

(declare-fun res!553786 () Bool)

(assert (=> b!810832 (=> (not res!553786) (not e!448893))))

(declare-datatypes ((List!14952 0))(
  ( (Nil!14949) (Cons!14948 (h!16083 (_ BitVec 64)) (t!21259 List!14952)) )
))
(declare-fun arrayNoDuplicates!0 (array!44029 (_ BitVec 32) List!14952) Bool)

(assert (=> b!810832 (= res!553786 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14949))))

(declare-fun b!810833 () Bool)

(declare-fun res!553797 () Bool)

(assert (=> b!810833 (=> (not res!553797) (not e!448894))))

(assert (=> b!810833 (= res!553797 (validKeyInArray!0 (select (arr!21082 a!3170) j!153)))))

(declare-fun b!810834 () Bool)

(assert (=> b!810834 (= e!448894 e!448893)))

(declare-fun res!553796 () Bool)

(assert (=> b!810834 (=> (not res!553796) (not e!448893))))

(declare-fun lt!363338 () SeekEntryResult!8629)

(assert (=> b!810834 (= res!553796 (or (= lt!363338 (MissingZero!8629 i!1163)) (= lt!363338 (MissingVacant!8629 i!1163))))))

(assert (=> b!810834 (= lt!363338 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!69650 res!553785) b!810823))

(assert (= (and b!810823 res!553788) b!810833))

(assert (= (and b!810833 res!553797) b!810831))

(assert (= (and b!810831 res!553792) b!810828))

(assert (= (and b!810828 res!553794) b!810834))

(assert (= (and b!810834 res!553796) b!810830))

(assert (= (and b!810830 res!553787) b!810832))

(assert (= (and b!810832 res!553786) b!810825))

(assert (= (and b!810825 res!553793) b!810826))

(assert (= (and b!810826 res!553791) b!810822))

(assert (= (and b!810822 res!553795) b!810824))

(assert (= (and b!810824 res!553790) b!810829))

(assert (= (and b!810829 res!553789) b!810827))

(declare-fun m!753403 () Bool)

(assert (=> b!810822 m!753403))

(declare-fun m!753405 () Bool)

(assert (=> b!810822 m!753405))

(assert (=> b!810822 m!753405))

(declare-fun m!753407 () Bool)

(assert (=> b!810822 m!753407))

(assert (=> b!810822 m!753405))

(declare-fun m!753409 () Bool)

(assert (=> b!810822 m!753409))

(declare-fun m!753411 () Bool)

(assert (=> b!810830 m!753411))

(declare-fun m!753413 () Bool)

(assert (=> b!810828 m!753413))

(declare-fun m!753415 () Bool)

(assert (=> b!810831 m!753415))

(assert (=> b!810833 m!753405))

(assert (=> b!810833 m!753405))

(declare-fun m!753417 () Bool)

(assert (=> b!810833 m!753417))

(declare-fun m!753419 () Bool)

(assert (=> b!810826 m!753419))

(declare-fun m!753421 () Bool)

(assert (=> b!810826 m!753421))

(declare-fun m!753423 () Bool)

(assert (=> b!810826 m!753423))

(declare-fun m!753425 () Bool)

(assert (=> b!810826 m!753425))

(declare-fun m!753427 () Bool)

(assert (=> b!810834 m!753427))

(declare-fun m!753429 () Bool)

(assert (=> b!810829 m!753429))

(declare-fun m!753431 () Bool)

(assert (=> start!69650 m!753431))

(declare-fun m!753433 () Bool)

(assert (=> start!69650 m!753433))

(declare-fun m!753435 () Bool)

(assert (=> b!810825 m!753435))

(declare-fun m!753437 () Bool)

(assert (=> b!810825 m!753437))

(assert (=> b!810827 m!753405))

(assert (=> b!810827 m!753405))

(declare-fun m!753439 () Bool)

(assert (=> b!810827 m!753439))

(declare-fun m!753441 () Bool)

(assert (=> b!810832 m!753441))

(declare-fun m!753443 () Bool)

(assert (=> b!810824 m!753443))

(check-sat (not b!810834) (not b!810828) (not b!810832) (not b!810827) (not b!810824) (not b!810833) (not b!810829) (not b!810822) (not start!69650) (not b!810830) (not b!810826) (not b!810831))
(check-sat)
(get-model)

(declare-fun b!810921 () Bool)

(declare-fun e!448941 () Bool)

(declare-fun e!448942 () Bool)

(assert (=> b!810921 (= e!448941 e!448942)))

(declare-fun lt!363391 () (_ BitVec 64))

(assert (=> b!810921 (= lt!363391 (select (arr!21082 a!3170) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27615 0))(
  ( (Unit!27616) )
))
(declare-fun lt!363392 () Unit!27615)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44029 (_ BitVec 64) (_ BitVec 32)) Unit!27615)

(assert (=> b!810921 (= lt!363392 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3170 lt!363391 #b00000000000000000000000000000000))))

(assert (=> b!810921 (arrayContainsKey!0 a!3170 lt!363391 #b00000000000000000000000000000000)))

(declare-fun lt!363390 () Unit!27615)

(assert (=> b!810921 (= lt!363390 lt!363392)))

(declare-fun res!553880 () Bool)

(assert (=> b!810921 (= res!553880 (= (seekEntryOrOpen!0 (select (arr!21082 a!3170) #b00000000000000000000000000000000) a!3170 mask!3266) (Found!8629 #b00000000000000000000000000000000)))))

(assert (=> b!810921 (=> (not res!553880) (not e!448942))))

(declare-fun b!810922 () Bool)

(declare-fun call!35484 () Bool)

(assert (=> b!810922 (= e!448941 call!35484)))

(declare-fun b!810923 () Bool)

(declare-fun e!448940 () Bool)

(assert (=> b!810923 (= e!448940 e!448941)))

(declare-fun c!88934 () Bool)

(assert (=> b!810923 (= c!88934 (validKeyInArray!0 (select (arr!21082 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!810924 () Bool)

(assert (=> b!810924 (= e!448942 call!35484)))

(declare-fun d!104321 () Bool)

(declare-fun res!553881 () Bool)

(assert (=> d!104321 (=> res!553881 e!448940)))

(assert (=> d!104321 (= res!553881 (bvsge #b00000000000000000000000000000000 (size!21502 a!3170)))))

(assert (=> d!104321 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266) e!448940)))

(declare-fun bm!35481 () Bool)

(assert (=> bm!35481 (= call!35484 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

(assert (= (and d!104321 (not res!553881)) b!810923))

(assert (= (and b!810923 c!88934) b!810921))

(assert (= (and b!810923 (not c!88934)) b!810922))

(assert (= (and b!810921 res!553880) b!810924))

(assert (= (or b!810924 b!810922) bm!35481))

(declare-fun m!753529 () Bool)

(assert (=> b!810921 m!753529))

(declare-fun m!753531 () Bool)

(assert (=> b!810921 m!753531))

(declare-fun m!753533 () Bool)

(assert (=> b!810921 m!753533))

(assert (=> b!810921 m!753529))

(declare-fun m!753535 () Bool)

(assert (=> b!810921 m!753535))

(assert (=> b!810923 m!753529))

(assert (=> b!810923 m!753529))

(declare-fun m!753537 () Bool)

(assert (=> b!810923 m!753537))

(declare-fun m!753539 () Bool)

(assert (=> bm!35481 m!753539))

(assert (=> b!810830 d!104321))

(declare-fun d!104323 () Bool)

(assert (=> d!104323 (= (validKeyInArray!0 k0!2044) (and (not (= k0!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!810831 d!104323))

(declare-fun b!810937 () Bool)

(declare-fun e!448949 () SeekEntryResult!8629)

(declare-fun e!448951 () SeekEntryResult!8629)

(assert (=> b!810937 (= e!448949 e!448951)))

(declare-fun c!88943 () Bool)

(declare-fun lt!363398 () (_ BitVec 64))

(assert (=> b!810937 (= c!88943 (= lt!363398 lt!363339))))

(declare-fun b!810938 () Bool)

(assert (=> b!810938 (= e!448951 (Found!8629 lt!363341))))

(declare-fun b!810939 () Bool)

(declare-fun c!88941 () Bool)

(assert (=> b!810939 (= c!88941 (= lt!363398 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448950 () SeekEntryResult!8629)

(assert (=> b!810939 (= e!448951 e!448950)))

(declare-fun lt!363397 () SeekEntryResult!8629)

(declare-fun d!104325 () Bool)

(get-info :version)

(assert (=> d!104325 (and (or ((_ is Undefined!8629) lt!363397) (not ((_ is Found!8629) lt!363397)) (and (bvsge (index!36885 lt!363397) #b00000000000000000000000000000000) (bvslt (index!36885 lt!363397) (size!21502 lt!363340)))) (or ((_ is Undefined!8629) lt!363397) ((_ is Found!8629) lt!363397) (not ((_ is MissingVacant!8629) lt!363397)) (not (= (index!36887 lt!363397) vacantAfter!23)) (and (bvsge (index!36887 lt!363397) #b00000000000000000000000000000000) (bvslt (index!36887 lt!363397) (size!21502 lt!363340)))) (or ((_ is Undefined!8629) lt!363397) (ite ((_ is Found!8629) lt!363397) (= (select (arr!21082 lt!363340) (index!36885 lt!363397)) lt!363339) (and ((_ is MissingVacant!8629) lt!363397) (= (index!36887 lt!363397) vacantAfter!23) (= (select (arr!21082 lt!363340) (index!36887 lt!363397)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104325 (= lt!363397 e!448949)))

(declare-fun c!88942 () Bool)

(assert (=> d!104325 (= c!88942 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(assert (=> d!104325 (= lt!363398 (select (arr!21082 lt!363340) lt!363341))))

(assert (=> d!104325 (validMask!0 mask!3266)))

(assert (=> d!104325 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363341 vacantAfter!23 lt!363339 lt!363340 mask!3266) lt!363397)))

(declare-fun b!810940 () Bool)

(assert (=> b!810940 (= e!448949 Undefined!8629)))

(declare-fun b!810941 () Bool)

(assert (=> b!810941 (= e!448950 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!363341 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) mask!3266) vacantAfter!23 lt!363339 lt!363340 mask!3266))))

(declare-fun b!810942 () Bool)

(assert (=> b!810942 (= e!448950 (MissingVacant!8629 vacantAfter!23))))

(assert (= (and d!104325 c!88942) b!810940))

(assert (= (and d!104325 (not c!88942)) b!810937))

(assert (= (and b!810937 c!88943) b!810938))

(assert (= (and b!810937 (not c!88943)) b!810939))

(assert (= (and b!810939 c!88941) b!810942))

(assert (= (and b!810939 (not c!88941)) b!810941))

(declare-fun m!753541 () Bool)

(assert (=> d!104325 m!753541))

(declare-fun m!753543 () Bool)

(assert (=> d!104325 m!753543))

(declare-fun m!753545 () Bool)

(assert (=> d!104325 m!753545))

(assert (=> d!104325 m!753431))

(declare-fun m!753547 () Bool)

(assert (=> b!810941 m!753547))

(assert (=> b!810941 m!753547))

(declare-fun m!753549 () Bool)

(assert (=> b!810941 m!753549))

(assert (=> b!810829 d!104325))

(declare-fun d!104327 () Bool)

(declare-fun res!553886 () Bool)

(declare-fun e!448956 () Bool)

(assert (=> d!104327 (=> res!553886 e!448956)))

(assert (=> d!104327 (= res!553886 (= (select (arr!21082 a!3170) #b00000000000000000000000000000000) k0!2044))))

(assert (=> d!104327 (= (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000) e!448956)))

(declare-fun b!810947 () Bool)

(declare-fun e!448957 () Bool)

(assert (=> b!810947 (= e!448956 e!448957)))

(declare-fun res!553887 () Bool)

(assert (=> b!810947 (=> (not res!553887) (not e!448957))))

(assert (=> b!810947 (= res!553887 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21502 a!3170)))))

(declare-fun b!810948 () Bool)

(assert (=> b!810948 (= e!448957 (arrayContainsKey!0 a!3170 k0!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!104327 (not res!553886)) b!810947))

(assert (= (and b!810947 res!553887) b!810948))

(assert (=> d!104327 m!753529))

(declare-fun m!753551 () Bool)

(assert (=> b!810948 m!753551))

(assert (=> b!810828 d!104327))

(declare-fun b!810949 () Bool)

(declare-fun e!448958 () SeekEntryResult!8629)

(declare-fun e!448960 () SeekEntryResult!8629)

(assert (=> b!810949 (= e!448958 e!448960)))

(declare-fun c!88946 () Bool)

(declare-fun lt!363400 () (_ BitVec 64))

(assert (=> b!810949 (= c!88946 (= lt!363400 lt!363339))))

(declare-fun b!810950 () Bool)

(assert (=> b!810950 (= e!448960 (Found!8629 index!1236))))

(declare-fun b!810951 () Bool)

(declare-fun c!88944 () Bool)

(assert (=> b!810951 (= c!88944 (= lt!363400 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448959 () SeekEntryResult!8629)

(assert (=> b!810951 (= e!448960 e!448959)))

(declare-fun lt!363399 () SeekEntryResult!8629)

(declare-fun d!104329 () Bool)

(assert (=> d!104329 (and (or ((_ is Undefined!8629) lt!363399) (not ((_ is Found!8629) lt!363399)) (and (bvsge (index!36885 lt!363399) #b00000000000000000000000000000000) (bvslt (index!36885 lt!363399) (size!21502 lt!363340)))) (or ((_ is Undefined!8629) lt!363399) ((_ is Found!8629) lt!363399) (not ((_ is MissingVacant!8629) lt!363399)) (not (= (index!36887 lt!363399) vacantAfter!23)) (and (bvsge (index!36887 lt!363399) #b00000000000000000000000000000000) (bvslt (index!36887 lt!363399) (size!21502 lt!363340)))) (or ((_ is Undefined!8629) lt!363399) (ite ((_ is Found!8629) lt!363399) (= (select (arr!21082 lt!363340) (index!36885 lt!363399)) lt!363339) (and ((_ is MissingVacant!8629) lt!363399) (= (index!36887 lt!363399) vacantAfter!23) (= (select (arr!21082 lt!363340) (index!36887 lt!363399)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104329 (= lt!363399 e!448958)))

(declare-fun c!88945 () Bool)

(assert (=> d!104329 (= c!88945 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!104329 (= lt!363400 (select (arr!21082 lt!363340) index!1236))))

(assert (=> d!104329 (validMask!0 mask!3266)))

(assert (=> d!104329 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!363339 lt!363340 mask!3266) lt!363399)))

(declare-fun b!810952 () Bool)

(assert (=> b!810952 (= e!448958 Undefined!8629)))

(declare-fun b!810953 () Bool)

(assert (=> b!810953 (= e!448959 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 (bvadd x!1077 #b00000000000000000000000000000001) mask!3266) vacantAfter!23 lt!363339 lt!363340 mask!3266))))

(declare-fun b!810954 () Bool)

(assert (=> b!810954 (= e!448959 (MissingVacant!8629 vacantAfter!23))))

(assert (= (and d!104329 c!88945) b!810952))

(assert (= (and d!104329 (not c!88945)) b!810949))

(assert (= (and b!810949 c!88946) b!810950))

(assert (= (and b!810949 (not c!88946)) b!810951))

(assert (= (and b!810951 c!88944) b!810954))

(assert (= (and b!810951 (not c!88944)) b!810953))

(declare-fun m!753553 () Bool)

(assert (=> d!104329 m!753553))

(declare-fun m!753555 () Bool)

(assert (=> d!104329 m!753555))

(declare-fun m!753557 () Bool)

(assert (=> d!104329 m!753557))

(assert (=> d!104329 m!753431))

(declare-fun m!753559 () Bool)

(assert (=> b!810953 m!753559))

(assert (=> b!810953 m!753559))

(declare-fun m!753561 () Bool)

(assert (=> b!810953 m!753561))

(assert (=> b!810826 d!104329))

(declare-fun b!810973 () Bool)

(declare-fun e!448974 () SeekEntryResult!8629)

(declare-fun lt!363411 () SeekEntryResult!8629)

(assert (=> b!810973 (= e!448974 (Found!8629 (index!36886 lt!363411)))))

(declare-fun e!448975 () SeekEntryResult!8629)

(declare-fun b!810974 () Bool)

(assert (=> b!810974 (= e!448975 (seekKeyOrZeroReturnVacant!0 (x!67857 lt!363411) (index!36886 lt!363411) (index!36886 lt!363411) lt!363339 lt!363340 mask!3266))))

(declare-fun b!810975 () Bool)

(declare-fun e!448973 () SeekEntryResult!8629)

(assert (=> b!810975 (= e!448973 e!448974)))

(declare-fun lt!363410 () (_ BitVec 64))

(assert (=> b!810975 (= lt!363410 (select (arr!21082 lt!363340) (index!36886 lt!363411)))))

(declare-fun c!88955 () Bool)

(assert (=> b!810975 (= c!88955 (= lt!363410 lt!363339))))

(declare-fun b!810976 () Bool)

(declare-fun c!88953 () Bool)

(assert (=> b!810976 (= c!88953 (= lt!363410 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!810976 (= e!448974 e!448975)))

(declare-fun d!104331 () Bool)

(declare-fun lt!363412 () SeekEntryResult!8629)

(assert (=> d!104331 (and (or ((_ is Undefined!8629) lt!363412) (not ((_ is Found!8629) lt!363412)) (and (bvsge (index!36885 lt!363412) #b00000000000000000000000000000000) (bvslt (index!36885 lt!363412) (size!21502 lt!363340)))) (or ((_ is Undefined!8629) lt!363412) ((_ is Found!8629) lt!363412) (not ((_ is MissingZero!8629) lt!363412)) (and (bvsge (index!36884 lt!363412) #b00000000000000000000000000000000) (bvslt (index!36884 lt!363412) (size!21502 lt!363340)))) (or ((_ is Undefined!8629) lt!363412) ((_ is Found!8629) lt!363412) ((_ is MissingZero!8629) lt!363412) (not ((_ is MissingVacant!8629) lt!363412)) (and (bvsge (index!36887 lt!363412) #b00000000000000000000000000000000) (bvslt (index!36887 lt!363412) (size!21502 lt!363340)))) (or ((_ is Undefined!8629) lt!363412) (ite ((_ is Found!8629) lt!363412) (= (select (arr!21082 lt!363340) (index!36885 lt!363412)) lt!363339) (ite ((_ is MissingZero!8629) lt!363412) (= (select (arr!21082 lt!363340) (index!36884 lt!363412)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8629) lt!363412) (= (select (arr!21082 lt!363340) (index!36887 lt!363412)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!104331 (= lt!363412 e!448973)))

(declare-fun c!88954 () Bool)

(assert (=> d!104331 (= c!88954 (and ((_ is Intermediate!8629) lt!363411) (undefined!9441 lt!363411)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44029 (_ BitVec 32)) SeekEntryResult!8629)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104331 (= lt!363411 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!363339 mask!3266) lt!363339 lt!363340 mask!3266))))

(assert (=> d!104331 (validMask!0 mask!3266)))

(assert (=> d!104331 (= (seekEntryOrOpen!0 lt!363339 lt!363340 mask!3266) lt!363412)))

(declare-fun b!810977 () Bool)

(assert (=> b!810977 (= e!448975 (MissingZero!8629 (index!36886 lt!363411)))))

(declare-fun b!810978 () Bool)

(assert (=> b!810978 (= e!448973 Undefined!8629)))

(assert (= (and d!104331 c!88954) b!810978))

(assert (= (and d!104331 (not c!88954)) b!810975))

(assert (= (and b!810975 c!88955) b!810973))

(assert (= (and b!810975 (not c!88955)) b!810976))

(assert (= (and b!810976 c!88953) b!810977))

(assert (= (and b!810976 (not c!88953)) b!810974))

(declare-fun m!753569 () Bool)

(assert (=> b!810974 m!753569))

(declare-fun m!753571 () Bool)

(assert (=> b!810975 m!753571))

(assert (=> d!104331 m!753431))

(declare-fun m!753573 () Bool)

(assert (=> d!104331 m!753573))

(declare-fun m!753575 () Bool)

(assert (=> d!104331 m!753575))

(declare-fun m!753577 () Bool)

(assert (=> d!104331 m!753577))

(declare-fun m!753579 () Bool)

(assert (=> d!104331 m!753579))

(assert (=> d!104331 m!753577))

(declare-fun m!753581 () Bool)

(assert (=> d!104331 m!753581))

(assert (=> b!810826 d!104331))

(declare-fun b!810979 () Bool)

(declare-fun e!448976 () SeekEntryResult!8629)

(declare-fun e!448978 () SeekEntryResult!8629)

(assert (=> b!810979 (= e!448976 e!448978)))

(declare-fun lt!363414 () (_ BitVec 64))

(declare-fun c!88958 () Bool)

(assert (=> b!810979 (= c!88958 (= lt!363414 (select (arr!21082 a!3170) j!153)))))

(declare-fun b!810980 () Bool)

(assert (=> b!810980 (= e!448978 (Found!8629 lt!363341))))

(declare-fun b!810981 () Bool)

(declare-fun c!88956 () Bool)

(assert (=> b!810981 (= c!88956 (= lt!363414 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448977 () SeekEntryResult!8629)

(assert (=> b!810981 (= e!448978 e!448977)))

(declare-fun d!104343 () Bool)

(declare-fun lt!363413 () SeekEntryResult!8629)

(assert (=> d!104343 (and (or ((_ is Undefined!8629) lt!363413) (not ((_ is Found!8629) lt!363413)) (and (bvsge (index!36885 lt!363413) #b00000000000000000000000000000000) (bvslt (index!36885 lt!363413) (size!21502 a!3170)))) (or ((_ is Undefined!8629) lt!363413) ((_ is Found!8629) lt!363413) (not ((_ is MissingVacant!8629) lt!363413)) (not (= (index!36887 lt!363413) vacantBefore!23)) (and (bvsge (index!36887 lt!363413) #b00000000000000000000000000000000) (bvslt (index!36887 lt!363413) (size!21502 a!3170)))) (or ((_ is Undefined!8629) lt!363413) (ite ((_ is Found!8629) lt!363413) (= (select (arr!21082 a!3170) (index!36885 lt!363413)) (select (arr!21082 a!3170) j!153)) (and ((_ is MissingVacant!8629) lt!363413) (= (index!36887 lt!363413) vacantBefore!23) (= (select (arr!21082 a!3170) (index!36887 lt!363413)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104343 (= lt!363413 e!448976)))

(declare-fun c!88957 () Bool)

(assert (=> d!104343 (= c!88957 (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110))))

(assert (=> d!104343 (= lt!363414 (select (arr!21082 a!3170) lt!363341))))

(assert (=> d!104343 (validMask!0 mask!3266)))

(assert (=> d!104343 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!363341 vacantBefore!23 (select (arr!21082 a!3170) j!153) a!3170 mask!3266) lt!363413)))

(declare-fun b!810982 () Bool)

(assert (=> b!810982 (= e!448976 Undefined!8629)))

(declare-fun b!810983 () Bool)

(assert (=> b!810983 (= e!448977 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) (nextIndex!0 lt!363341 (bvadd #b00000000000000000000000000000001 x!1077 #b00000000000000000000000000000001) mask!3266) vacantBefore!23 (select (arr!21082 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810984 () Bool)

(assert (=> b!810984 (= e!448977 (MissingVacant!8629 vacantBefore!23))))

(assert (= (and d!104343 c!88957) b!810982))

(assert (= (and d!104343 (not c!88957)) b!810979))

(assert (= (and b!810979 c!88958) b!810980))

(assert (= (and b!810979 (not c!88958)) b!810981))

(assert (= (and b!810981 c!88956) b!810984))

(assert (= (and b!810981 (not c!88956)) b!810983))

(declare-fun m!753583 () Bool)

(assert (=> d!104343 m!753583))

(declare-fun m!753585 () Bool)

(assert (=> d!104343 m!753585))

(declare-fun m!753587 () Bool)

(assert (=> d!104343 m!753587))

(assert (=> d!104343 m!753431))

(assert (=> b!810983 m!753547))

(assert (=> b!810983 m!753547))

(assert (=> b!810983 m!753405))

(declare-fun m!753589 () Bool)

(assert (=> b!810983 m!753589))

(assert (=> b!810827 d!104343))

(declare-fun b!810985 () Bool)

(declare-fun e!448980 () SeekEntryResult!8629)

(declare-fun lt!363416 () SeekEntryResult!8629)

(assert (=> b!810985 (= e!448980 (Found!8629 (index!36886 lt!363416)))))

(declare-fun e!448981 () SeekEntryResult!8629)

(declare-fun b!810986 () Bool)

(assert (=> b!810986 (= e!448981 (seekKeyOrZeroReturnVacant!0 (x!67857 lt!363416) (index!36886 lt!363416) (index!36886 lt!363416) k0!2044 a!3170 mask!3266))))

(declare-fun b!810987 () Bool)

(declare-fun e!448979 () SeekEntryResult!8629)

(assert (=> b!810987 (= e!448979 e!448980)))

(declare-fun lt!363415 () (_ BitVec 64))

(assert (=> b!810987 (= lt!363415 (select (arr!21082 a!3170) (index!36886 lt!363416)))))

(declare-fun c!88961 () Bool)

(assert (=> b!810987 (= c!88961 (= lt!363415 k0!2044))))

(declare-fun b!810988 () Bool)

(declare-fun c!88959 () Bool)

(assert (=> b!810988 (= c!88959 (= lt!363415 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!810988 (= e!448980 e!448981)))

(declare-fun d!104345 () Bool)

(declare-fun lt!363417 () SeekEntryResult!8629)

(assert (=> d!104345 (and (or ((_ is Undefined!8629) lt!363417) (not ((_ is Found!8629) lt!363417)) (and (bvsge (index!36885 lt!363417) #b00000000000000000000000000000000) (bvslt (index!36885 lt!363417) (size!21502 a!3170)))) (or ((_ is Undefined!8629) lt!363417) ((_ is Found!8629) lt!363417) (not ((_ is MissingZero!8629) lt!363417)) (and (bvsge (index!36884 lt!363417) #b00000000000000000000000000000000) (bvslt (index!36884 lt!363417) (size!21502 a!3170)))) (or ((_ is Undefined!8629) lt!363417) ((_ is Found!8629) lt!363417) ((_ is MissingZero!8629) lt!363417) (not ((_ is MissingVacant!8629) lt!363417)) (and (bvsge (index!36887 lt!363417) #b00000000000000000000000000000000) (bvslt (index!36887 lt!363417) (size!21502 a!3170)))) (or ((_ is Undefined!8629) lt!363417) (ite ((_ is Found!8629) lt!363417) (= (select (arr!21082 a!3170) (index!36885 lt!363417)) k0!2044) (ite ((_ is MissingZero!8629) lt!363417) (= (select (arr!21082 a!3170) (index!36884 lt!363417)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8629) lt!363417) (= (select (arr!21082 a!3170) (index!36887 lt!363417)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!104345 (= lt!363417 e!448979)))

(declare-fun c!88960 () Bool)

(assert (=> d!104345 (= c!88960 (and ((_ is Intermediate!8629) lt!363416) (undefined!9441 lt!363416)))))

(assert (=> d!104345 (= lt!363416 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2044 mask!3266) k0!2044 a!3170 mask!3266))))

(assert (=> d!104345 (validMask!0 mask!3266)))

(assert (=> d!104345 (= (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266) lt!363417)))

(declare-fun b!810989 () Bool)

(assert (=> b!810989 (= e!448981 (MissingZero!8629 (index!36886 lt!363416)))))

(declare-fun b!810990 () Bool)

(assert (=> b!810990 (= e!448979 Undefined!8629)))

(assert (= (and d!104345 c!88960) b!810990))

(assert (= (and d!104345 (not c!88960)) b!810987))

(assert (= (and b!810987 c!88961) b!810985))

(assert (= (and b!810987 (not c!88961)) b!810988))

(assert (= (and b!810988 c!88959) b!810989))

(assert (= (and b!810988 (not c!88959)) b!810986))

(declare-fun m!753591 () Bool)

(assert (=> b!810986 m!753591))

(declare-fun m!753593 () Bool)

(assert (=> b!810987 m!753593))

(assert (=> d!104345 m!753431))

(declare-fun m!753595 () Bool)

(assert (=> d!104345 m!753595))

(declare-fun m!753597 () Bool)

(assert (=> d!104345 m!753597))

(declare-fun m!753599 () Bool)

(assert (=> d!104345 m!753599))

(declare-fun m!753601 () Bool)

(assert (=> d!104345 m!753601))

(assert (=> d!104345 m!753599))

(declare-fun m!753603 () Bool)

(assert (=> d!104345 m!753603))

(assert (=> b!810834 d!104345))

(declare-fun d!104347 () Bool)

(assert (=> d!104347 (= (validMask!0 mask!3266) (and (or (= mask!3266 #b00000000000000000000000000000111) (= mask!3266 #b00000000000000000000000000001111) (= mask!3266 #b00000000000000000000000000011111) (= mask!3266 #b00000000000000000000000000111111) (= mask!3266 #b00000000000000000000000001111111) (= mask!3266 #b00000000000000000000000011111111) (= mask!3266 #b00000000000000000000000111111111) (= mask!3266 #b00000000000000000000001111111111) (= mask!3266 #b00000000000000000000011111111111) (= mask!3266 #b00000000000000000000111111111111) (= mask!3266 #b00000000000000000001111111111111) (= mask!3266 #b00000000000000000011111111111111) (= mask!3266 #b00000000000000000111111111111111) (= mask!3266 #b00000000000000001111111111111111) (= mask!3266 #b00000000000000011111111111111111) (= mask!3266 #b00000000000000111111111111111111) (= mask!3266 #b00000000000001111111111111111111) (= mask!3266 #b00000000000011111111111111111111) (= mask!3266 #b00000000000111111111111111111111) (= mask!3266 #b00000000001111111111111111111111) (= mask!3266 #b00000000011111111111111111111111) (= mask!3266 #b00000000111111111111111111111111) (= mask!3266 #b00000001111111111111111111111111) (= mask!3266 #b00000011111111111111111111111111) (= mask!3266 #b00000111111111111111111111111111) (= mask!3266 #b00001111111111111111111111111111) (= mask!3266 #b00011111111111111111111111111111) (= mask!3266 #b00111111111111111111111111111111)) (bvsle mask!3266 #b00111111111111111111111111111111)))))

(assert (=> start!69650 d!104347))

(declare-fun d!104349 () Bool)

(assert (=> d!104349 (= (array_inv!16941 a!3170) (bvsge (size!21502 a!3170) #b00000000000000000000000000000000))))

(assert (=> start!69650 d!104349))

(declare-fun d!104351 () Bool)

(declare-fun lt!363432 () (_ BitVec 32))

(assert (=> d!104351 (and (bvsge lt!363432 #b00000000000000000000000000000000) (bvslt lt!363432 (bvadd mask!3266 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!104351 (= lt!363432 (choose!52 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(assert (=> d!104351 (validMask!0 mask!3266)))

(assert (=> d!104351 (= (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266) lt!363432)))

(declare-fun bs!22446 () Bool)

(assert (= bs!22446 d!104351))

(declare-fun m!753615 () Bool)

(assert (=> bs!22446 m!753615))

(assert (=> bs!22446 m!753431))

(assert (=> b!810824 d!104351))

(declare-fun b!811021 () Bool)

(declare-fun e!448997 () SeekEntryResult!8629)

(declare-fun e!448999 () SeekEntryResult!8629)

(assert (=> b!811021 (= e!448997 e!448999)))

(declare-fun c!88979 () Bool)

(declare-fun lt!363434 () (_ BitVec 64))

(assert (=> b!811021 (= c!88979 (= lt!363434 (select (arr!21082 a!3170) j!153)))))

(declare-fun b!811022 () Bool)

(assert (=> b!811022 (= e!448999 (Found!8629 index!1236))))

(declare-fun b!811023 () Bool)

(declare-fun c!88977 () Bool)

(assert (=> b!811023 (= c!88977 (= lt!363434 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!448998 () SeekEntryResult!8629)

(assert (=> b!811023 (= e!448999 e!448998)))

(declare-fun lt!363433 () SeekEntryResult!8629)

(declare-fun d!104355 () Bool)

(assert (=> d!104355 (and (or ((_ is Undefined!8629) lt!363433) (not ((_ is Found!8629) lt!363433)) (and (bvsge (index!36885 lt!363433) #b00000000000000000000000000000000) (bvslt (index!36885 lt!363433) (size!21502 a!3170)))) (or ((_ is Undefined!8629) lt!363433) ((_ is Found!8629) lt!363433) (not ((_ is MissingVacant!8629) lt!363433)) (not (= (index!36887 lt!363433) vacantBefore!23)) (and (bvsge (index!36887 lt!363433) #b00000000000000000000000000000000) (bvslt (index!36887 lt!363433) (size!21502 a!3170)))) (or ((_ is Undefined!8629) lt!363433) (ite ((_ is Found!8629) lt!363433) (= (select (arr!21082 a!3170) (index!36885 lt!363433)) (select (arr!21082 a!3170) j!153)) (and ((_ is MissingVacant!8629) lt!363433) (= (index!36887 lt!363433) vacantBefore!23) (= (select (arr!21082 a!3170) (index!36887 lt!363433)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!104355 (= lt!363433 e!448997)))

(declare-fun c!88978 () Bool)

(assert (=> d!104355 (= c!88978 (bvsge x!1077 #b01111111111111111111111111111110))))

(assert (=> d!104355 (= lt!363434 (select (arr!21082 a!3170) index!1236))))

(assert (=> d!104355 (validMask!0 mask!3266)))

(assert (=> d!104355 (= (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21082 a!3170) j!153) a!3170 mask!3266) lt!363433)))

(declare-fun b!811024 () Bool)

(assert (=> b!811024 (= e!448997 Undefined!8629)))

(declare-fun b!811025 () Bool)

(assert (=> b!811025 (= e!448998 (seekKeyOrZeroReturnVacant!0 (bvadd x!1077 #b00000000000000000000000000000001) (nextIndex!0 index!1236 (bvadd x!1077 #b00000000000000000000000000000001) mask!3266) vacantBefore!23 (select (arr!21082 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811026 () Bool)

(assert (=> b!811026 (= e!448998 (MissingVacant!8629 vacantBefore!23))))

(assert (= (and d!104355 c!88978) b!811024))

(assert (= (and d!104355 (not c!88978)) b!811021))

(assert (= (and b!811021 c!88979) b!811022))

(assert (= (and b!811021 (not c!88979)) b!811023))

(assert (= (and b!811023 c!88977) b!811026))

(assert (= (and b!811023 (not c!88977)) b!811025))

(declare-fun m!753617 () Bool)

(assert (=> d!104355 m!753617))

(declare-fun m!753619 () Bool)

(assert (=> d!104355 m!753619))

(assert (=> d!104355 m!753403))

(assert (=> d!104355 m!753431))

(assert (=> b!811025 m!753559))

(assert (=> b!811025 m!753559))

(assert (=> b!811025 m!753405))

(declare-fun m!753621 () Bool)

(assert (=> b!811025 m!753621))

(assert (=> b!810822 d!104355))

(declare-fun b!811027 () Bool)

(declare-fun e!449001 () SeekEntryResult!8629)

(declare-fun lt!363436 () SeekEntryResult!8629)

(assert (=> b!811027 (= e!449001 (Found!8629 (index!36886 lt!363436)))))

(declare-fun b!811028 () Bool)

(declare-fun e!449002 () SeekEntryResult!8629)

(assert (=> b!811028 (= e!449002 (seekKeyOrZeroReturnVacant!0 (x!67857 lt!363436) (index!36886 lt!363436) (index!36886 lt!363436) (select (arr!21082 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!811029 () Bool)

(declare-fun e!449000 () SeekEntryResult!8629)

(assert (=> b!811029 (= e!449000 e!449001)))

(declare-fun lt!363435 () (_ BitVec 64))

(assert (=> b!811029 (= lt!363435 (select (arr!21082 a!3170) (index!36886 lt!363436)))))

(declare-fun c!88982 () Bool)

(assert (=> b!811029 (= c!88982 (= lt!363435 (select (arr!21082 a!3170) j!153)))))

(declare-fun b!811030 () Bool)

(declare-fun c!88980 () Bool)

(assert (=> b!811030 (= c!88980 (= lt!363435 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!811030 (= e!449001 e!449002)))

(declare-fun d!104357 () Bool)

(declare-fun lt!363437 () SeekEntryResult!8629)

(assert (=> d!104357 (and (or ((_ is Undefined!8629) lt!363437) (not ((_ is Found!8629) lt!363437)) (and (bvsge (index!36885 lt!363437) #b00000000000000000000000000000000) (bvslt (index!36885 lt!363437) (size!21502 a!3170)))) (or ((_ is Undefined!8629) lt!363437) ((_ is Found!8629) lt!363437) (not ((_ is MissingZero!8629) lt!363437)) (and (bvsge (index!36884 lt!363437) #b00000000000000000000000000000000) (bvslt (index!36884 lt!363437) (size!21502 a!3170)))) (or ((_ is Undefined!8629) lt!363437) ((_ is Found!8629) lt!363437) ((_ is MissingZero!8629) lt!363437) (not ((_ is MissingVacant!8629) lt!363437)) (and (bvsge (index!36887 lt!363437) #b00000000000000000000000000000000) (bvslt (index!36887 lt!363437) (size!21502 a!3170)))) (or ((_ is Undefined!8629) lt!363437) (ite ((_ is Found!8629) lt!363437) (= (select (arr!21082 a!3170) (index!36885 lt!363437)) (select (arr!21082 a!3170) j!153)) (ite ((_ is MissingZero!8629) lt!363437) (= (select (arr!21082 a!3170) (index!36884 lt!363437)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!8629) lt!363437) (= (select (arr!21082 a!3170) (index!36887 lt!363437)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!104357 (= lt!363437 e!449000)))

(declare-fun c!88981 () Bool)

(assert (=> d!104357 (= c!88981 (and ((_ is Intermediate!8629) lt!363436) (undefined!9441 lt!363436)))))

(assert (=> d!104357 (= lt!363436 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!21082 a!3170) j!153) mask!3266) (select (arr!21082 a!3170) j!153) a!3170 mask!3266))))

(assert (=> d!104357 (validMask!0 mask!3266)))

(assert (=> d!104357 (= (seekEntryOrOpen!0 (select (arr!21082 a!3170) j!153) a!3170 mask!3266) lt!363437)))

(declare-fun b!811031 () Bool)

(assert (=> b!811031 (= e!449002 (MissingZero!8629 (index!36886 lt!363436)))))

(declare-fun b!811032 () Bool)

(assert (=> b!811032 (= e!449000 Undefined!8629)))

(assert (= (and d!104357 c!88981) b!811032))

(assert (= (and d!104357 (not c!88981)) b!811029))

(assert (= (and b!811029 c!88982) b!811027))

(assert (= (and b!811029 (not c!88982)) b!811030))

(assert (= (and b!811030 c!88980) b!811031))

(assert (= (and b!811030 (not c!88980)) b!811028))

(assert (=> b!811028 m!753405))

(declare-fun m!753623 () Bool)

(assert (=> b!811028 m!753623))

(declare-fun m!753625 () Bool)

(assert (=> b!811029 m!753625))

(assert (=> d!104357 m!753431))

(declare-fun m!753627 () Bool)

(assert (=> d!104357 m!753627))

(declare-fun m!753629 () Bool)

(assert (=> d!104357 m!753629))

(assert (=> d!104357 m!753405))

(declare-fun m!753631 () Bool)

(assert (=> d!104357 m!753631))

(declare-fun m!753633 () Bool)

(assert (=> d!104357 m!753633))

(assert (=> d!104357 m!753631))

(assert (=> d!104357 m!753405))

(declare-fun m!753635 () Bool)

(assert (=> d!104357 m!753635))

(assert (=> b!810822 d!104357))

(declare-fun d!104359 () Bool)

(assert (=> d!104359 (= (validKeyInArray!0 (select (arr!21082 a!3170) j!153)) (and (not (= (select (arr!21082 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!21082 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!810833 d!104359))

(declare-fun bm!35484 () Bool)

(declare-fun call!35487 () Bool)

(declare-fun c!88988 () Bool)

(assert (=> bm!35484 (= call!35487 (arrayNoDuplicates!0 a!3170 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!88988 (Cons!14948 (select (arr!21082 a!3170) #b00000000000000000000000000000000) Nil!14949) Nil!14949)))))

(declare-fun b!811055 () Bool)

(declare-fun e!449020 () Bool)

(declare-fun contains!4113 (List!14952 (_ BitVec 64)) Bool)

(assert (=> b!811055 (= e!449020 (contains!4113 Nil!14949 (select (arr!21082 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!811056 () Bool)

(declare-fun e!449022 () Bool)

(assert (=> b!811056 (= e!449022 call!35487)))

(declare-fun d!104361 () Bool)

(declare-fun res!553908 () Bool)

(declare-fun e!449021 () Bool)

(assert (=> d!104361 (=> res!553908 e!449021)))

(assert (=> d!104361 (= res!553908 (bvsge #b00000000000000000000000000000000 (size!21502 a!3170)))))

(assert (=> d!104361 (= (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14949) e!449021)))

(declare-fun b!811057 () Bool)

(declare-fun e!449023 () Bool)

(assert (=> b!811057 (= e!449021 e!449023)))

(declare-fun res!553906 () Bool)

(assert (=> b!811057 (=> (not res!553906) (not e!449023))))

(assert (=> b!811057 (= res!553906 (not e!449020))))

(declare-fun res!553907 () Bool)

(assert (=> b!811057 (=> (not res!553907) (not e!449020))))

(assert (=> b!811057 (= res!553907 (validKeyInArray!0 (select (arr!21082 a!3170) #b00000000000000000000000000000000)))))

(declare-fun b!811058 () Bool)

(assert (=> b!811058 (= e!449022 call!35487)))

(declare-fun b!811059 () Bool)

(assert (=> b!811059 (= e!449023 e!449022)))

(assert (=> b!811059 (= c!88988 (validKeyInArray!0 (select (arr!21082 a!3170) #b00000000000000000000000000000000)))))

(assert (= (and d!104361 (not res!553908)) b!811057))

(assert (= (and b!811057 res!553907) b!811055))

(assert (= (and b!811057 res!553906) b!811059))

(assert (= (and b!811059 c!88988) b!811058))

(assert (= (and b!811059 (not c!88988)) b!811056))

(assert (= (or b!811058 b!811056) bm!35484))

(assert (=> bm!35484 m!753529))

(declare-fun m!753655 () Bool)

(assert (=> bm!35484 m!753655))

(assert (=> b!811055 m!753529))

(assert (=> b!811055 m!753529))

(declare-fun m!753657 () Bool)

(assert (=> b!811055 m!753657))

(assert (=> b!811057 m!753529))

(assert (=> b!811057 m!753529))

(assert (=> b!811057 m!753537))

(assert (=> b!811059 m!753529))

(assert (=> b!811059 m!753529))

(assert (=> b!811059 m!753537))

(assert (=> b!810832 d!104361))

(check-sat (not b!810986) (not b!810948) (not b!810921) (not b!810941) (not b!811025) (not d!104343) (not b!810953) (not bm!35484) (not b!811055) (not b!811057) (not d!104355) (not b!810974) (not d!104351) (not bm!35481) (not d!104331) (not d!104357) (not b!810983) (not d!104345) (not d!104325) (not b!811028) (not b!810923) (not b!811059) (not d!104329))
(check-sat)
