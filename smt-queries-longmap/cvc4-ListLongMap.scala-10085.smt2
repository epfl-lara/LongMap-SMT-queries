; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118648 () Bool)

(assert start!118648)

(declare-fun b!1387191 () Bool)

(declare-datatypes ((Unit!46385 0))(
  ( (Unit!46386) )
))
(declare-fun e!785741 () Unit!46385)

(declare-fun Unit!46387 () Unit!46385)

(assert (=> b!1387191 (= e!785741 Unit!46387)))

(declare-fun b!1387192 () Bool)

(declare-fun e!785743 () Bool)

(declare-datatypes ((array!94924 0))(
  ( (array!94925 (arr!45838 (Array (_ BitVec 32) (_ BitVec 64))) (size!46388 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94924)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387192 (= e!785743 (validKeyInArray!0 (select (arr!45838 a!2938) startIndex!16)))))

(declare-fun b!1387193 () Bool)

(declare-fun res!928232 () Bool)

(declare-fun e!785740 () Bool)

(assert (=> b!1387193 (=> (not res!928232) (not e!785740))))

(declare-datatypes ((List!32366 0))(
  ( (Nil!32363) (Cons!32362 (h!33571 (_ BitVec 64)) (t!47060 List!32366)) )
))
(declare-fun arrayNoDuplicates!0 (array!94924 (_ BitVec 32) List!32366) Bool)

(assert (=> b!1387193 (= res!928232 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32363))))

(declare-fun res!928230 () Bool)

(assert (=> start!118648 (=> (not res!928230) (not e!785740))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118648 (= res!928230 (validMask!0 mask!2987))))

(assert (=> start!118648 e!785740))

(assert (=> start!118648 true))

(declare-fun array_inv!34866 (array!94924) Bool)

(assert (=> start!118648 (array_inv!34866 a!2938)))

(declare-fun b!1387194 () Bool)

(declare-fun e!785742 () Bool)

(assert (=> b!1387194 (= e!785740 e!785742)))

(declare-fun res!928228 () Bool)

(assert (=> b!1387194 (=> (not res!928228) (not e!785742))))

(assert (=> b!1387194 (= res!928228 (and (bvslt startIndex!16 (bvsub (size!46388 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))))

(declare-fun lt!609745 () Unit!46385)

(assert (=> b!1387194 (= lt!609745 e!785741)))

(declare-fun c!128922 () Bool)

(assert (=> b!1387194 (= c!128922 e!785743)))

(declare-fun res!928234 () Bool)

(assert (=> b!1387194 (=> (not res!928234) (not e!785743))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1387194 (= res!928234 (not (= startIndex!16 i!1065)))))

(declare-fun lt!609744 () array!94924)

(assert (=> b!1387194 (= lt!609744 (array!94925 (store (arr!45838 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46388 a!2938)))))

(declare-fun b!1387195 () Bool)

(declare-fun res!928229 () Bool)

(assert (=> b!1387195 (=> (not res!928229) (not e!785740))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94924 (_ BitVec 32)) Bool)

(assert (=> b!1387195 (= res!928229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387196 () Bool)

(assert (=> b!1387196 (= e!785742 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!609744 mask!2987)))))

(assert (=> b!1387196 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609744 mask!2987)))

(declare-fun lt!609746 () Unit!46385)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 (array!94924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46385)

(assert (=> b!1387196 (= lt!609746 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(declare-fun b!1387197 () Bool)

(declare-fun res!928231 () Bool)

(assert (=> b!1387197 (=> (not res!928231) (not e!785740))))

(assert (=> b!1387197 (= res!928231 (and (= (size!46388 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46388 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46388 a!2938))))))

(declare-fun b!1387198 () Bool)

(declare-fun res!928233 () Bool)

(assert (=> b!1387198 (=> (not res!928233) (not e!785740))))

(assert (=> b!1387198 (= res!928233 (and (not (= (select (arr!45838 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45838 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1387199 () Bool)

(declare-fun lt!609747 () Unit!46385)

(assert (=> b!1387199 (= e!785741 lt!609747)))

(declare-fun lt!609743 () Unit!46385)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46385)

(assert (=> b!1387199 (= lt!609743 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10181 0))(
  ( (MissingZero!10181 (index!43095 (_ BitVec 32))) (Found!10181 (index!43096 (_ BitVec 32))) (Intermediate!10181 (undefined!10993 Bool) (index!43097 (_ BitVec 32)) (x!124702 (_ BitVec 32))) (Undefined!10181) (MissingVacant!10181 (index!43098 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94924 (_ BitVec 32)) SeekEntryResult!10181)

(assert (=> b!1387199 (= (seekEntryOrOpen!0 (select (arr!45838 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45838 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609744 mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46385)

(assert (=> b!1387199 (= lt!609747 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1387199 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1387200 () Bool)

(declare-fun res!928227 () Bool)

(assert (=> b!1387200 (=> (not res!928227) (not e!785740))))

(assert (=> b!1387200 (= res!928227 (validKeyInArray!0 (select (arr!45838 a!2938) i!1065)))))

(assert (= (and start!118648 res!928230) b!1387197))

(assert (= (and b!1387197 res!928231) b!1387200))

(assert (= (and b!1387200 res!928227) b!1387193))

(assert (= (and b!1387193 res!928232) b!1387195))

(assert (= (and b!1387195 res!928229) b!1387198))

(assert (= (and b!1387198 res!928233) b!1387194))

(assert (= (and b!1387194 res!928234) b!1387192))

(assert (= (and b!1387194 c!128922) b!1387199))

(assert (= (and b!1387194 (not c!128922)) b!1387191))

(assert (= (and b!1387194 res!928228) b!1387196))

(declare-fun m!1272645 () Bool)

(assert (=> b!1387198 m!1272645))

(declare-fun m!1272647 () Bool)

(assert (=> b!1387199 m!1272647))

(declare-fun m!1272649 () Bool)

(assert (=> b!1387199 m!1272649))

(declare-fun m!1272651 () Bool)

(assert (=> b!1387199 m!1272651))

(assert (=> b!1387199 m!1272649))

(declare-fun m!1272653 () Bool)

(assert (=> b!1387199 m!1272653))

(declare-fun m!1272655 () Bool)

(assert (=> b!1387199 m!1272655))

(declare-fun m!1272657 () Bool)

(assert (=> b!1387199 m!1272657))

(declare-fun m!1272659 () Bool)

(assert (=> b!1387199 m!1272659))

(assert (=> b!1387199 m!1272657))

(declare-fun m!1272661 () Bool)

(assert (=> b!1387199 m!1272661))

(assert (=> b!1387200 m!1272645))

(assert (=> b!1387200 m!1272645))

(declare-fun m!1272663 () Bool)

(assert (=> b!1387200 m!1272663))

(assert (=> b!1387194 m!1272651))

(assert (=> b!1387192 m!1272657))

(assert (=> b!1387192 m!1272657))

(declare-fun m!1272665 () Bool)

(assert (=> b!1387192 m!1272665))

(declare-fun m!1272667 () Bool)

(assert (=> b!1387196 m!1272667))

(declare-fun m!1272669 () Bool)

(assert (=> b!1387196 m!1272669))

(declare-fun m!1272671 () Bool)

(assert (=> b!1387196 m!1272671))

(declare-fun m!1272673 () Bool)

(assert (=> b!1387195 m!1272673))

(declare-fun m!1272675 () Bool)

(assert (=> start!118648 m!1272675))

(declare-fun m!1272677 () Bool)

(assert (=> start!118648 m!1272677))

(declare-fun m!1272679 () Bool)

(assert (=> b!1387193 m!1272679))

(push 1)

(assert (not b!1387196))

(assert (not b!1387192))

(assert (not start!118648))

(assert (not b!1387195))

(assert (not b!1387200))

(assert (not b!1387199))

(assert (not b!1387193))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1387221 () Bool)

(declare-fun e!785761 () Bool)

(declare-fun call!66559 () Bool)

(assert (=> b!1387221 (= e!785761 call!66559)))

(declare-fun b!1387222 () Bool)

(declare-fun e!785762 () Bool)

(assert (=> b!1387222 (= e!785762 e!785761)))

(declare-fun lt!609766 () (_ BitVec 64))

(assert (=> b!1387222 (= lt!609766 (select (arr!45838 lt!609744) startIndex!16))))

(declare-fun lt!609768 () Unit!46385)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!94924 (_ BitVec 64) (_ BitVec 32)) Unit!46385)

(assert (=> b!1387222 (= lt!609768 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609744 lt!609766 startIndex!16))))

(declare-fun arrayContainsKey!0 (array!94924 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1387222 (arrayContainsKey!0 lt!609744 lt!609766 #b00000000000000000000000000000000)))

(declare-fun lt!609767 () Unit!46385)

(assert (=> b!1387222 (= lt!609767 lt!609768)))

(declare-fun res!928245 () Bool)

(assert (=> b!1387222 (= res!928245 (= (seekEntryOrOpen!0 (select (arr!45838 lt!609744) startIndex!16) lt!609744 mask!2987) (Found!10181 startIndex!16)))))

(assert (=> b!1387222 (=> (not res!928245) (not e!785761))))

(declare-fun bm!66556 () Bool)

(assert (=> bm!66556 (= call!66559 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) lt!609744 mask!2987))))

(declare-fun d!149463 () Bool)

(declare-fun res!928246 () Bool)

(declare-fun e!785760 () Bool)

(assert (=> d!149463 (=> res!928246 e!785760)))

(assert (=> d!149463 (= res!928246 (bvsge startIndex!16 (size!46388 lt!609744)))))

(assert (=> d!149463 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 lt!609744 mask!2987) e!785760)))

(declare-fun b!1387223 () Bool)

(assert (=> b!1387223 (= e!785762 call!66559)))

(declare-fun b!1387224 () Bool)

(assert (=> b!1387224 (= e!785760 e!785762)))

(declare-fun c!128928 () Bool)

(assert (=> b!1387224 (= c!128928 (validKeyInArray!0 (select (arr!45838 lt!609744) startIndex!16)))))

(assert (= (and d!149463 (not res!928246)) b!1387224))

(assert (= (and b!1387224 c!128928) b!1387222))

(assert (= (and b!1387224 (not c!128928)) b!1387223))

(assert (= (and b!1387222 res!928245) b!1387221))

(assert (= (or b!1387221 b!1387223) bm!66556))

(declare-fun m!1272689 () Bool)

(assert (=> b!1387222 m!1272689))

(declare-fun m!1272691 () Bool)

(assert (=> b!1387222 m!1272691))

(declare-fun m!1272693 () Bool)

(assert (=> b!1387222 m!1272693))

(assert (=> b!1387222 m!1272689))

(declare-fun m!1272695 () Bool)

(assert (=> b!1387222 m!1272695))

(declare-fun m!1272697 () Bool)

(assert (=> bm!66556 m!1272697))

(assert (=> b!1387224 m!1272689))

(assert (=> b!1387224 m!1272689))

(declare-fun m!1272699 () Bool)

(assert (=> b!1387224 m!1272699))

(assert (=> b!1387196 d!149463))

(declare-fun b!1387225 () Bool)

(declare-fun e!785764 () Bool)

(declare-fun call!66560 () Bool)

(assert (=> b!1387225 (= e!785764 call!66560)))

(declare-fun b!1387226 () Bool)

(declare-fun e!785765 () Bool)

(assert (=> b!1387226 (= e!785765 e!785764)))

(declare-fun lt!609769 () (_ BitVec 64))

(assert (=> b!1387226 (= lt!609769 (select (arr!45838 lt!609744) (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(declare-fun lt!609771 () Unit!46385)

(assert (=> b!1387226 (= lt!609771 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609744 lt!609769 (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(assert (=> b!1387226 (arrayContainsKey!0 lt!609744 lt!609769 #b00000000000000000000000000000000)))

(declare-fun lt!609770 () Unit!46385)

(assert (=> b!1387226 (= lt!609770 lt!609771)))

(declare-fun res!928247 () Bool)

(assert (=> b!1387226 (= res!928247 (= (seekEntryOrOpen!0 (select (arr!45838 lt!609744) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!609744 mask!2987) (Found!10181 (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(assert (=> b!1387226 (=> (not res!928247) (not e!785764))))

(declare-fun bm!66557 () Bool)

(assert (=> bm!66557 (= call!66560 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16 #b00000000000000000000000000000001) lt!609744 mask!2987))))

(declare-fun d!149471 () Bool)

(declare-fun res!928248 () Bool)

(declare-fun e!785763 () Bool)

(assert (=> d!149471 (=> res!928248 e!785763)))

(assert (=> d!149471 (= res!928248 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) (size!46388 lt!609744)))))

(assert (=> d!149471 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) lt!609744 mask!2987) e!785763)))

(declare-fun b!1387227 () Bool)

(assert (=> b!1387227 (= e!785765 call!66560)))

(declare-fun b!1387228 () Bool)

(assert (=> b!1387228 (= e!785763 e!785765)))

(declare-fun c!128929 () Bool)

(assert (=> b!1387228 (= c!128929 (validKeyInArray!0 (select (arr!45838 lt!609744) (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(assert (= (and d!149471 (not res!928248)) b!1387228))

(assert (= (and b!1387228 c!128929) b!1387226))

(assert (= (and b!1387228 (not c!128929)) b!1387227))

(assert (= (and b!1387226 res!928247) b!1387225))

(assert (= (or b!1387225 b!1387227) bm!66557))

(declare-fun m!1272701 () Bool)

(assert (=> b!1387226 m!1272701))

(declare-fun m!1272703 () Bool)

(assert (=> b!1387226 m!1272703))

(declare-fun m!1272705 () Bool)

(assert (=> b!1387226 m!1272705))

(assert (=> b!1387226 m!1272701))

(declare-fun m!1272707 () Bool)

(assert (=> b!1387226 m!1272707))

(declare-fun m!1272709 () Bool)

(assert (=> bm!66557 m!1272709))

(assert (=> b!1387228 m!1272701))

(assert (=> b!1387228 m!1272701))

(declare-fun m!1272711 () Bool)

(assert (=> b!1387228 m!1272711))

(assert (=> b!1387196 d!149471))

(declare-fun d!149477 () Bool)

(declare-fun e!785783 () Bool)

(assert (=> d!149477 e!785783))

(declare-fun res!928263 () Bool)

(assert (=> d!149477 (=> (not res!928263) (not e!785783))))

(assert (=> d!149477 (= res!928263 (and (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46388 a!2938))))))

(declare-fun lt!609777 () Unit!46385)

(declare-fun choose!23 (array!94924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46385)

(assert (=> d!149477 (= lt!609777 (choose!23 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987))))

(assert (=> d!149477 (validMask!0 mask!2987)))

(assert (=> d!149477 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenStartIndex!0 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987) lt!609777)))

(declare-fun b!1387249 () Bool)

(assert (=> b!1387249 (= e!785783 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) (array!94925 (store (arr!45838 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46388 a!2938)) mask!2987))))

(assert (= (and d!149477 res!928263) b!1387249))

(declare-fun m!1272723 () Bool)

(assert (=> d!149477 m!1272723))

(assert (=> d!149477 m!1272675))

(assert (=> b!1387249 m!1272651))

(declare-fun m!1272727 () Bool)

(assert (=> b!1387249 m!1272727))

(assert (=> b!1387196 d!149477))

(declare-fun b!1387250 () Bool)

(declare-fun e!785785 () Bool)

(declare-fun call!66564 () Bool)

(assert (=> b!1387250 (= e!785785 call!66564)))

(declare-fun b!1387251 () Bool)

(declare-fun e!785786 () Bool)

(assert (=> b!1387251 (= e!785786 e!785785)))

(declare-fun lt!609780 () (_ BitVec 64))

(assert (=> b!1387251 (= lt!609780 (select (arr!45838 a!2938) #b00000000000000000000000000000000))))

(declare-fun lt!609782 () Unit!46385)

(assert (=> b!1387251 (= lt!609782 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609780 #b00000000000000000000000000000000))))

(assert (=> b!1387251 (arrayContainsKey!0 a!2938 lt!609780 #b00000000000000000000000000000000)))

(declare-fun lt!609781 () Unit!46385)

(assert (=> b!1387251 (= lt!609781 lt!609782)))

(declare-fun res!928264 () Bool)

(assert (=> b!1387251 (= res!928264 (= (seekEntryOrOpen!0 (select (arr!45838 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) (Found!10181 #b00000000000000000000000000000000)))))

(assert (=> b!1387251 (=> (not res!928264) (not e!785785))))

(declare-fun bm!66561 () Bool)

(assert (=> bm!66561 (= call!66564 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun d!149481 () Bool)

(declare-fun res!928265 () Bool)

(declare-fun e!785784 () Bool)

(assert (=> d!149481 (=> res!928265 e!785784)))

(assert (=> d!149481 (= res!928265 (bvsge #b00000000000000000000000000000000 (size!46388 a!2938)))))

(assert (=> d!149481 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987) e!785784)))

(declare-fun b!1387252 () Bool)

(assert (=> b!1387252 (= e!785786 call!66564)))

(declare-fun b!1387253 () Bool)

(assert (=> b!1387253 (= e!785784 e!785786)))

(declare-fun c!128933 () Bool)

(assert (=> b!1387253 (= c!128933 (validKeyInArray!0 (select (arr!45838 a!2938) #b00000000000000000000000000000000)))))

(assert (= (and d!149481 (not res!928265)) b!1387253))

(assert (= (and b!1387253 c!128933) b!1387251))

(assert (= (and b!1387253 (not c!128933)) b!1387252))

(assert (= (and b!1387251 res!928264) b!1387250))

(assert (= (or b!1387250 b!1387252) bm!66561))

(declare-fun m!1272731 () Bool)

(assert (=> b!1387251 m!1272731))

(declare-fun m!1272733 () Bool)

(assert (=> b!1387251 m!1272733))

(declare-fun m!1272735 () Bool)

(assert (=> b!1387251 m!1272735))

(assert (=> b!1387251 m!1272731))

(declare-fun m!1272737 () Bool)

(assert (=> b!1387251 m!1272737))

(declare-fun m!1272739 () Bool)

(assert (=> bm!66561 m!1272739))

(assert (=> b!1387253 m!1272731))

(assert (=> b!1387253 m!1272731))

(declare-fun m!1272741 () Bool)

(assert (=> b!1387253 m!1272741))

(assert (=> b!1387195 d!149481))

(declare-fun d!149487 () Bool)

(assert (=> d!149487 (= (validKeyInArray!0 (select (arr!45838 a!2938) i!1065)) (and (not (= (select (arr!45838 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45838 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387200 d!149487))

(declare-fun b!1387299 () Bool)

(declare-fun c!128954 () Bool)

(declare-fun lt!609811 () (_ BitVec 64))

(assert (=> b!1387299 (= c!128954 (= lt!609811 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!785814 () SeekEntryResult!10181)

(declare-fun e!785816 () SeekEntryResult!10181)

(assert (=> b!1387299 (= e!785814 e!785816)))

(declare-fun lt!609813 () SeekEntryResult!10181)

(declare-fun d!149489 () Bool)

(assert (=> d!149489 (and (or (is-Undefined!10181 lt!609813) (not (is-Found!10181 lt!609813)) (and (bvsge (index!43096 lt!609813) #b00000000000000000000000000000000) (bvslt (index!43096 lt!609813) (size!46388 lt!609744)))) (or (is-Undefined!10181 lt!609813) (is-Found!10181 lt!609813) (not (is-MissingZero!10181 lt!609813)) (and (bvsge (index!43095 lt!609813) #b00000000000000000000000000000000) (bvslt (index!43095 lt!609813) (size!46388 lt!609744)))) (or (is-Undefined!10181 lt!609813) (is-Found!10181 lt!609813) (is-MissingZero!10181 lt!609813) (not (is-MissingVacant!10181 lt!609813)) (and (bvsge (index!43098 lt!609813) #b00000000000000000000000000000000) (bvslt (index!43098 lt!609813) (size!46388 lt!609744)))) (or (is-Undefined!10181 lt!609813) (ite (is-Found!10181 lt!609813) (= (select (arr!45838 lt!609744) (index!43096 lt!609813)) (select (store (arr!45838 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (ite (is-MissingZero!10181 lt!609813) (= (select (arr!45838 lt!609744) (index!43095 lt!609813)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10181 lt!609813) (= (select (arr!45838 lt!609744) (index!43098 lt!609813)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!785815 () SeekEntryResult!10181)

(assert (=> d!149489 (= lt!609813 e!785815)))

(declare-fun c!128952 () Bool)

(declare-fun lt!609812 () SeekEntryResult!10181)

(assert (=> d!149489 (= c!128952 (and (is-Intermediate!10181 lt!609812) (undefined!10993 lt!609812)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!94924 (_ BitVec 32)) SeekEntryResult!10181)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!149489 (= lt!609812 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45838 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) mask!2987) (select (store (arr!45838 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609744 mask!2987))))

(assert (=> d!149489 (validMask!0 mask!2987)))

(assert (=> d!149489 (= (seekEntryOrOpen!0 (select (store (arr!45838 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609744 mask!2987) lt!609813)))

(declare-fun b!1387300 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!94924 (_ BitVec 32)) SeekEntryResult!10181)

(assert (=> b!1387300 (= e!785816 (seekKeyOrZeroReturnVacant!0 (x!124702 lt!609812) (index!43097 lt!609812) (index!43097 lt!609812) (select (store (arr!45838 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609744 mask!2987))))

(declare-fun b!1387301 () Bool)

(assert (=> b!1387301 (= e!785815 e!785814)))

(assert (=> b!1387301 (= lt!609811 (select (arr!45838 lt!609744) (index!43097 lt!609812)))))

(declare-fun c!128953 () Bool)

(assert (=> b!1387301 (= c!128953 (= lt!609811 (select (store (arr!45838 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1387302 () Bool)

(assert (=> b!1387302 (= e!785814 (Found!10181 (index!43097 lt!609812)))))

(declare-fun b!1387303 () Bool)

(assert (=> b!1387303 (= e!785816 (MissingZero!10181 (index!43097 lt!609812)))))

(declare-fun b!1387304 () Bool)

(assert (=> b!1387304 (= e!785815 Undefined!10181)))

(assert (= (and d!149489 c!128952) b!1387304))

(assert (= (and d!149489 (not c!128952)) b!1387301))

(assert (= (and b!1387301 c!128953) b!1387302))

(assert (= (and b!1387301 (not c!128953)) b!1387299))

(assert (= (and b!1387299 c!128954) b!1387303))

(assert (= (and b!1387299 (not c!128954)) b!1387300))

(declare-fun m!1272768 () Bool)

(assert (=> d!149489 m!1272768))

(assert (=> d!149489 m!1272649))

(declare-fun m!1272771 () Bool)

(assert (=> d!149489 m!1272771))

(declare-fun m!1272775 () Bool)

(assert (=> d!149489 m!1272775))

(assert (=> d!149489 m!1272771))

(assert (=> d!149489 m!1272649))

(declare-fun m!1272781 () Bool)

(assert (=> d!149489 m!1272781))

(assert (=> d!149489 m!1272675))

(declare-fun m!1272785 () Bool)

(assert (=> d!149489 m!1272785))

(assert (=> b!1387300 m!1272649))

(declare-fun m!1272789 () Bool)

(assert (=> b!1387300 m!1272789))

(declare-fun m!1272792 () Bool)

(assert (=> b!1387301 m!1272792))

(assert (=> b!1387199 d!149489))

(declare-fun d!149498 () Bool)

(assert (=> d!149498 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun lt!609831 () Unit!46385)

(declare-fun choose!38 (array!94924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46385)

(assert (=> d!149498 (= lt!609831 (choose!38 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> d!149498 (validMask!0 mask!2987)))

(assert (=> d!149498 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16) lt!609831)))

(declare-fun bs!40312 () Bool)

(assert (= bs!40312 d!149498))

(assert (=> bs!40312 m!1272661))

(declare-fun m!1272819 () Bool)

(assert (=> bs!40312 m!1272819))

(assert (=> bs!40312 m!1272675))

(assert (=> b!1387199 d!149498))

(declare-fun b!1387331 () Bool)

(declare-fun e!785833 () Bool)

(declare-fun call!66570 () Bool)

(assert (=> b!1387331 (= e!785833 call!66570)))

(declare-fun b!1387332 () Bool)

(declare-fun e!785834 () Bool)

(assert (=> b!1387332 (= e!785834 e!785833)))

(declare-fun lt!609832 () (_ BitVec 64))

(assert (=> b!1387332 (= lt!609832 (select (arr!45838 a!2938) startIndex!16))))

(declare-fun lt!609834 () Unit!46385)

(assert (=> b!1387332 (= lt!609834 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609832 startIndex!16))))

(assert (=> b!1387332 (arrayContainsKey!0 a!2938 lt!609832 #b00000000000000000000000000000000)))

(declare-fun lt!609833 () Unit!46385)

(assert (=> b!1387332 (= lt!609833 lt!609834)))

(declare-fun res!928279 () Bool)

(assert (=> b!1387332 (= res!928279 (= (seekEntryOrOpen!0 (select (arr!45838 a!2938) startIndex!16) a!2938 mask!2987) (Found!10181 startIndex!16)))))

(assert (=> b!1387332 (=> (not res!928279) (not e!785833))))

(declare-fun bm!66567 () Bool)

(assert (=> bm!66567 (= call!66570 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun d!149505 () Bool)

(declare-fun res!928280 () Bool)

(declare-fun e!785832 () Bool)

(assert (=> d!149505 (=> res!928280 e!785832)))

(assert (=> d!149505 (= res!928280 (bvsge startIndex!16 (size!46388 a!2938)))))

(assert (=> d!149505 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987) e!785832)))

(declare-fun b!1387333 () Bool)

(assert (=> b!1387333 (= e!785834 call!66570)))

(declare-fun b!1387334 () Bool)

(assert (=> b!1387334 (= e!785832 e!785834)))

(declare-fun c!128966 () Bool)

(assert (=> b!1387334 (= c!128966 (validKeyInArray!0 (select (arr!45838 a!2938) startIndex!16)))))

(assert (= (and d!149505 (not res!928280)) b!1387334))

(assert (= (and b!1387334 c!128966) b!1387332))

(assert (= (and b!1387334 (not c!128966)) b!1387333))

(assert (= (and b!1387332 res!928279) b!1387331))

(assert (= (or b!1387331 b!1387333) bm!66567))

(assert (=> b!1387332 m!1272657))

(declare-fun m!1272821 () Bool)

(assert (=> b!1387332 m!1272821))

(declare-fun m!1272823 () Bool)

(assert (=> b!1387332 m!1272823))

(assert (=> b!1387332 m!1272657))

(assert (=> b!1387332 m!1272659))

(declare-fun m!1272825 () Bool)

(assert (=> bm!66567 m!1272825))

(assert (=> b!1387334 m!1272657))

(assert (=> b!1387334 m!1272657))

(assert (=> b!1387334 m!1272665))

(assert (=> b!1387199 d!149505))

(declare-fun d!149507 () Bool)

(declare-fun e!785873 () Bool)

(assert (=> d!149507 e!785873))

(declare-fun res!928306 () Bool)

(assert (=> d!149507 (=> (not res!928306) (not e!785873))))

(assert (=> d!149507 (= res!928306 (and (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46388 a!2938)) (and (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46388 a!2938)))) (or (bvslt i!1065 #b00000000000000000000000000000000) (bvsge i!1065 (size!46388 a!2938)) (and (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46388 a!2938)))) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46388 a!2938))))))

(declare-fun lt!609861 () Unit!46385)

(declare-fun choose!14 (array!94924 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46385)

(assert (=> d!149507 (= lt!609861 (choose!14 a!2938 i!1065 startIndex!16 mask!2987))))

(assert (=> d!149507 (validMask!0 mask!2987)))

(assert (=> d!149507 (= (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987) lt!609861)))

(declare-fun b!1387386 () Bool)

(assert (=> b!1387386 (= e!785873 (= (seekEntryOrOpen!0 (select (arr!45838 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45838 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94925 (store (arr!45838 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46388 a!2938)) mask!2987)))))

(assert (= (and d!149507 res!928306) b!1387386))

(declare-fun m!1272911 () Bool)

(assert (=> d!149507 m!1272911))

(assert (=> d!149507 m!1272675))

(assert (=> b!1387386 m!1272649))

(assert (=> b!1387386 m!1272651))

(assert (=> b!1387386 m!1272649))

(declare-fun m!1272913 () Bool)

(assert (=> b!1387386 m!1272913))

(assert (=> b!1387386 m!1272657))

(assert (=> b!1387386 m!1272657))

(assert (=> b!1387386 m!1272659))

(assert (=> b!1387199 d!149507))

(declare-fun b!1387387 () Bool)

(declare-fun c!128982 () Bool)

(declare-fun lt!609862 () (_ BitVec 64))

(assert (=> b!1387387 (= c!128982 (= lt!609862 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!785874 () SeekEntryResult!10181)

(declare-fun e!785876 () SeekEntryResult!10181)

(assert (=> b!1387387 (= e!785874 e!785876)))

(declare-fun d!149527 () Bool)

(declare-fun lt!609864 () SeekEntryResult!10181)

(assert (=> d!149527 (and (or (is-Undefined!10181 lt!609864) (not (is-Found!10181 lt!609864)) (and (bvsge (index!43096 lt!609864) #b00000000000000000000000000000000) (bvslt (index!43096 lt!609864) (size!46388 a!2938)))) (or (is-Undefined!10181 lt!609864) (is-Found!10181 lt!609864) (not (is-MissingZero!10181 lt!609864)) (and (bvsge (index!43095 lt!609864) #b00000000000000000000000000000000) (bvslt (index!43095 lt!609864) (size!46388 a!2938)))) (or (is-Undefined!10181 lt!609864) (is-Found!10181 lt!609864) (is-MissingZero!10181 lt!609864) (not (is-MissingVacant!10181 lt!609864)) (and (bvsge (index!43098 lt!609864) #b00000000000000000000000000000000) (bvslt (index!43098 lt!609864) (size!46388 a!2938)))) (or (is-Undefined!10181 lt!609864) (ite (is-Found!10181 lt!609864) (= (select (arr!45838 a!2938) (index!43096 lt!609864)) (select (arr!45838 a!2938) startIndex!16)) (ite (is-MissingZero!10181 lt!609864) (= (select (arr!45838 a!2938) (index!43095 lt!609864)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10181 lt!609864) (= (select (arr!45838 a!2938) (index!43098 lt!609864)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!785875 () SeekEntryResult!10181)

(assert (=> d!149527 (= lt!609864 e!785875)))

(declare-fun c!128980 () Bool)

(declare-fun lt!609863 () SeekEntryResult!10181)

(assert (=> d!149527 (= c!128980 (and (is-Intermediate!10181 lt!609863) (undefined!10993 lt!609863)))))

(assert (=> d!149527 (= lt!609863 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45838 a!2938) startIndex!16) mask!2987) (select (arr!45838 a!2938) startIndex!16) a!2938 mask!2987))))

(assert (=> d!149527 (validMask!0 mask!2987)))

(assert (=> d!149527 (= (seekEntryOrOpen!0 (select (arr!45838 a!2938) startIndex!16) a!2938 mask!2987) lt!609864)))

(declare-fun b!1387388 () Bool)

(assert (=> b!1387388 (= e!785876 (seekKeyOrZeroReturnVacant!0 (x!124702 lt!609863) (index!43097 lt!609863) (index!43097 lt!609863) (select (arr!45838 a!2938) startIndex!16) a!2938 mask!2987))))

(declare-fun b!1387389 () Bool)

(assert (=> b!1387389 (= e!785875 e!785874)))

(assert (=> b!1387389 (= lt!609862 (select (arr!45838 a!2938) (index!43097 lt!609863)))))

(declare-fun c!128981 () Bool)

(assert (=> b!1387389 (= c!128981 (= lt!609862 (select (arr!45838 a!2938) startIndex!16)))))

(declare-fun b!1387390 () Bool)

(assert (=> b!1387390 (= e!785874 (Found!10181 (index!43097 lt!609863)))))

(declare-fun b!1387391 () Bool)

(assert (=> b!1387391 (= e!785876 (MissingZero!10181 (index!43097 lt!609863)))))

(declare-fun b!1387392 () Bool)

(assert (=> b!1387392 (= e!785875 Undefined!10181)))

(assert (= (and d!149527 c!128980) b!1387392))

(assert (= (and d!149527 (not c!128980)) b!1387389))

(assert (= (and b!1387389 c!128981) b!1387390))

(assert (= (and b!1387389 (not c!128981)) b!1387387))

(assert (= (and b!1387387 c!128982) b!1387391))

(assert (= (and b!1387387 (not c!128982)) b!1387388))

(declare-fun m!1272915 () Bool)

(assert (=> d!149527 m!1272915))

(assert (=> d!149527 m!1272657))

(declare-fun m!1272917 () Bool)

(assert (=> d!149527 m!1272917))

(declare-fun m!1272919 () Bool)

(assert (=> d!149527 m!1272919))

(assert (=> d!149527 m!1272917))

(assert (=> d!149527 m!1272657))

(declare-fun m!1272921 () Bool)

(assert (=> d!149527 m!1272921))

(assert (=> d!149527 m!1272675))

(declare-fun m!1272923 () Bool)

(assert (=> d!149527 m!1272923))

(assert (=> b!1387388 m!1272657))

(declare-fun m!1272925 () Bool)

(assert (=> b!1387388 m!1272925))

(declare-fun m!1272927 () Bool)

(assert (=> b!1387389 m!1272927))

(assert (=> b!1387199 d!149527))

(declare-fun d!149529 () Bool)

(assert (=> d!149529 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118648 d!149529))

(declare-fun d!149531 () Bool)

(assert (=> d!149531 (= (array_inv!34866 a!2938) (bvsge (size!46388 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118648 d!149531))

(declare-fun b!1387403 () Bool)

(declare-fun e!785888 () Bool)

(declare-fun call!66580 () Bool)

(assert (=> b!1387403 (= e!785888 call!66580)))

(declare-fun bm!66577 () Bool)

(declare-fun c!128985 () Bool)

(assert (=> bm!66577 (= call!66580 (arrayNoDuplicates!0 a!2938 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!128985 (Cons!32362 (select (arr!45838 a!2938) #b00000000000000000000000000000000) Nil!32363) Nil!32363)))))

(declare-fun d!149533 () Bool)

(declare-fun res!928314 () Bool)

(declare-fun e!785886 () Bool)

(assert (=> d!149533 (=> res!928314 e!785886)))

(assert (=> d!149533 (= res!928314 (bvsge #b00000000000000000000000000000000 (size!46388 a!2938)))))

(assert (=> d!149533 (= (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32363) e!785886)))

(declare-fun b!1387404 () Bool)

(declare-fun e!785885 () Bool)

(declare-fun contains!9747 (List!32366 (_ BitVec 64)) Bool)

(assert (=> b!1387404 (= e!785885 (contains!9747 Nil!32363 (select (arr!45838 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1387405 () Bool)

(declare-fun e!785887 () Bool)

(assert (=> b!1387405 (= e!785887 e!785888)))

(assert (=> b!1387405 (= c!128985 (validKeyInArray!0 (select (arr!45838 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1387406 () Bool)

(assert (=> b!1387406 (= e!785886 e!785887)))

(declare-fun res!928313 () Bool)

(assert (=> b!1387406 (=> (not res!928313) (not e!785887))))

(assert (=> b!1387406 (= res!928313 (not e!785885))))

(declare-fun res!928315 () Bool)

(assert (=> b!1387406 (=> (not res!928315) (not e!785885))))

(assert (=> b!1387406 (= res!928315 (validKeyInArray!0 (select (arr!45838 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1387407 () Bool)

(assert (=> b!1387407 (= e!785888 call!66580)))

(assert (= (and d!149533 (not res!928314)) b!1387406))

(assert (= (and b!1387406 res!928315) b!1387404))

(assert (= (and b!1387406 res!928313) b!1387405))

(assert (= (and b!1387405 c!128985) b!1387403))

(assert (= (and b!1387405 (not c!128985)) b!1387407))

(assert (= (or b!1387403 b!1387407) bm!66577))

(assert (=> bm!66577 m!1272731))

(declare-fun m!1272929 () Bool)

(assert (=> bm!66577 m!1272929))

(assert (=> b!1387404 m!1272731))

(assert (=> b!1387404 m!1272731))

(declare-fun m!1272931 () Bool)

(assert (=> b!1387404 m!1272931))

(assert (=> b!1387405 m!1272731))

(assert (=> b!1387405 m!1272731))

(assert (=> b!1387405 m!1272741))

(assert (=> b!1387406 m!1272731))

(assert (=> b!1387406 m!1272731))

(assert (=> b!1387406 m!1272741))

(assert (=> b!1387193 d!149533))

(declare-fun d!149535 () Bool)

(assert (=> d!149535 (= (validKeyInArray!0 (select (arr!45838 a!2938) startIndex!16)) (and (not (= (select (arr!45838 a!2938) startIndex!16) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45838 a!2938) startIndex!16) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387192 d!149535))

(push 1)

(assert (not d!149498))

(assert (not b!1387332))

(assert (not b!1387226))

(assert (not b!1387388))

(assert (not b!1387386))

(assert (not b!1387222))

(assert (not d!149489))

(assert (not bm!66577))

(assert (not b!1387228))

(assert (not b!1387334))

(assert (not bm!66556))

(assert (not bm!66567))

(assert (not d!149477))

(assert (not b!1387405))

(assert (not d!149507))

(assert (not b!1387251))

(assert (not bm!66557))

(assert (not b!1387300))

(assert (not b!1387404))

(assert (not d!149527))

(assert (not b!1387406))

(assert (not b!1387253))

(assert (not bm!66561))

(assert (not b!1387224))

(assert (not b!1387249))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!149661 () Bool)

(assert (=> d!149661 (= (seekEntryOrOpen!0 (select (arr!45838 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45838 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94925 (store (arr!45838 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46388 a!2938)) mask!2987))))

(assert (=> d!149661 true))

(declare-fun _$42!22 () Unit!46385)

(assert (=> d!149661 (= (choose!14 a!2938 i!1065 startIndex!16 mask!2987) _$42!22)))

(declare-fun bs!40327 () Bool)

(assert (= bs!40327 d!149661))

(assert (=> bs!40327 m!1272649))

(assert (=> bs!40327 m!1272913))

(assert (=> bs!40327 m!1272657))

(assert (=> bs!40327 m!1272659))

(assert (=> bs!40327 m!1272657))

(assert (=> bs!40327 m!1272651))

(assert (=> bs!40327 m!1272649))

(assert (=> d!149507 d!149661))

(assert (=> d!149507 d!149529))

(declare-fun d!149663 () Bool)

(assert (=> d!149663 (= (validKeyInArray!0 (select (arr!45838 a!2938) #b00000000000000000000000000000000)) (and (not (= (select (arr!45838 a!2938) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45838 a!2938) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387253 d!149663))

(assert (=> b!1387334 d!149535))

(declare-fun d!149665 () Bool)

(assert (=> d!149665 (arrayContainsKey!0 a!2938 lt!609780 #b00000000000000000000000000000000)))

(declare-fun lt!609987 () Unit!46385)

(declare-fun choose!13 (array!94924 (_ BitVec 64) (_ BitVec 32)) Unit!46385)

(assert (=> d!149665 (= lt!609987 (choose!13 a!2938 lt!609780 #b00000000000000000000000000000000))))

(assert (=> d!149665 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!149665 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609780 #b00000000000000000000000000000000) lt!609987)))

(declare-fun bs!40328 () Bool)

(assert (= bs!40328 d!149665))

(assert (=> bs!40328 m!1272735))

(declare-fun m!1273281 () Bool)

(assert (=> bs!40328 m!1273281))

(assert (=> b!1387251 d!149665))

(declare-fun d!149667 () Bool)

(declare-fun res!928408 () Bool)

(declare-fun e!786055 () Bool)

(assert (=> d!149667 (=> res!928408 e!786055)))

(assert (=> d!149667 (= res!928408 (= (select (arr!45838 a!2938) #b00000000000000000000000000000000) lt!609780))))

(assert (=> d!149667 (= (arrayContainsKey!0 a!2938 lt!609780 #b00000000000000000000000000000000) e!786055)))

(declare-fun b!1387666 () Bool)

(declare-fun e!786056 () Bool)

(assert (=> b!1387666 (= e!786055 e!786056)))

(declare-fun res!928409 () Bool)

(assert (=> b!1387666 (=> (not res!928409) (not e!786056))))

(assert (=> b!1387666 (= res!928409 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46388 a!2938)))))

(declare-fun b!1387667 () Bool)

(assert (=> b!1387667 (= e!786056 (arrayContainsKey!0 a!2938 lt!609780 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149667 (not res!928408)) b!1387666))

(assert (= (and b!1387666 res!928409) b!1387667))

(assert (=> d!149667 m!1272731))

(declare-fun m!1273283 () Bool)

(assert (=> b!1387667 m!1273283))

(assert (=> b!1387251 d!149667))

(declare-fun b!1387668 () Bool)

(declare-fun c!129072 () Bool)

(declare-fun lt!609988 () (_ BitVec 64))

(assert (=> b!1387668 (= c!129072 (= lt!609988 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786057 () SeekEntryResult!10181)

(declare-fun e!786059 () SeekEntryResult!10181)

(assert (=> b!1387668 (= e!786057 e!786059)))

(declare-fun d!149669 () Bool)

(declare-fun lt!609990 () SeekEntryResult!10181)

(assert (=> d!149669 (and (or (is-Undefined!10181 lt!609990) (not (is-Found!10181 lt!609990)) (and (bvsge (index!43096 lt!609990) #b00000000000000000000000000000000) (bvslt (index!43096 lt!609990) (size!46388 a!2938)))) (or (is-Undefined!10181 lt!609990) (is-Found!10181 lt!609990) (not (is-MissingZero!10181 lt!609990)) (and (bvsge (index!43095 lt!609990) #b00000000000000000000000000000000) (bvslt (index!43095 lt!609990) (size!46388 a!2938)))) (or (is-Undefined!10181 lt!609990) (is-Found!10181 lt!609990) (is-MissingZero!10181 lt!609990) (not (is-MissingVacant!10181 lt!609990)) (and (bvsge (index!43098 lt!609990) #b00000000000000000000000000000000) (bvslt (index!43098 lt!609990) (size!46388 a!2938)))) (or (is-Undefined!10181 lt!609990) (ite (is-Found!10181 lt!609990) (= (select (arr!45838 a!2938) (index!43096 lt!609990)) (select (arr!45838 a!2938) #b00000000000000000000000000000000)) (ite (is-MissingZero!10181 lt!609990) (= (select (arr!45838 a!2938) (index!43095 lt!609990)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10181 lt!609990) (= (select (arr!45838 a!2938) (index!43098 lt!609990)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!786058 () SeekEntryResult!10181)

(assert (=> d!149669 (= lt!609990 e!786058)))

(declare-fun c!129070 () Bool)

(declare-fun lt!609989 () SeekEntryResult!10181)

(assert (=> d!149669 (= c!129070 (and (is-Intermediate!10181 lt!609989) (undefined!10993 lt!609989)))))

(assert (=> d!149669 (= lt!609989 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45838 a!2938) #b00000000000000000000000000000000) mask!2987) (select (arr!45838 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(assert (=> d!149669 (validMask!0 mask!2987)))

(assert (=> d!149669 (= (seekEntryOrOpen!0 (select (arr!45838 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987) lt!609990)))

(declare-fun b!1387669 () Bool)

(assert (=> b!1387669 (= e!786059 (seekKeyOrZeroReturnVacant!0 (x!124702 lt!609989) (index!43097 lt!609989) (index!43097 lt!609989) (select (arr!45838 a!2938) #b00000000000000000000000000000000) a!2938 mask!2987))))

(declare-fun b!1387670 () Bool)

(assert (=> b!1387670 (= e!786058 e!786057)))

(assert (=> b!1387670 (= lt!609988 (select (arr!45838 a!2938) (index!43097 lt!609989)))))

(declare-fun c!129071 () Bool)

(assert (=> b!1387670 (= c!129071 (= lt!609988 (select (arr!45838 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1387671 () Bool)

(assert (=> b!1387671 (= e!786057 (Found!10181 (index!43097 lt!609989)))))

(declare-fun b!1387672 () Bool)

(assert (=> b!1387672 (= e!786059 (MissingZero!10181 (index!43097 lt!609989)))))

(declare-fun b!1387673 () Bool)

(assert (=> b!1387673 (= e!786058 Undefined!10181)))

(assert (= (and d!149669 c!129070) b!1387673))

(assert (= (and d!149669 (not c!129070)) b!1387670))

(assert (= (and b!1387670 c!129071) b!1387671))

(assert (= (and b!1387670 (not c!129071)) b!1387668))

(assert (= (and b!1387668 c!129072) b!1387672))

(assert (= (and b!1387668 (not c!129072)) b!1387669))

(declare-fun m!1273285 () Bool)

(assert (=> d!149669 m!1273285))

(assert (=> d!149669 m!1272731))

(declare-fun m!1273287 () Bool)

(assert (=> d!149669 m!1273287))

(declare-fun m!1273289 () Bool)

(assert (=> d!149669 m!1273289))

(assert (=> d!149669 m!1273287))

(assert (=> d!149669 m!1272731))

(declare-fun m!1273291 () Bool)

(assert (=> d!149669 m!1273291))

(assert (=> d!149669 m!1272675))

(declare-fun m!1273293 () Bool)

(assert (=> d!149669 m!1273293))

(assert (=> b!1387669 m!1272731))

(declare-fun m!1273295 () Bool)

(assert (=> b!1387669 m!1273295))

(declare-fun m!1273297 () Bool)

(assert (=> b!1387670 m!1273297))

(assert (=> b!1387251 d!149669))

(assert (=> b!1387406 d!149663))

(declare-fun d!149671 () Bool)

(assert (=> d!149671 (= (validKeyInArray!0 (select (arr!45838 lt!609744) (bvadd #b00000000000000000000000000000001 startIndex!16))) (and (not (= (select (arr!45838 lt!609744) (bvadd #b00000000000000000000000000000001 startIndex!16)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45838 lt!609744) (bvadd #b00000000000000000000000000000001 startIndex!16)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1387228 d!149671))

(declare-fun d!149673 () Bool)

(assert (=> d!149673 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!16) (array!94925 (store (arr!45838 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46388 a!2938)) mask!2987)))

(assert (=> d!149673 true))

(declare-fun _$43!21 () Unit!46385)

(assert (=> d!149673 (= (choose!23 a!2938 i!1065 (bvadd #b00000000000000000000000000000001 startIndex!16) mask!2987) _$43!21)))

(declare-fun bs!40329 () Bool)

(assert (= bs!40329 d!149673))

(assert (=> bs!40329 m!1272651))

(assert (=> bs!40329 m!1272727))

(assert (=> d!149477 d!149673))

(assert (=> d!149477 d!149529))

(declare-fun b!1387674 () Bool)

(declare-fun e!786061 () Bool)

(declare-fun call!66593 () Bool)

(assert (=> b!1387674 (= e!786061 call!66593)))

(declare-fun b!1387675 () Bool)

(declare-fun e!786062 () Bool)

(assert (=> b!1387675 (= e!786062 e!786061)))

(declare-fun lt!609991 () (_ BitVec 64))

(assert (=> b!1387675 (= lt!609991 (select (arr!45838 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!609993 () Unit!46385)

(assert (=> b!1387675 (= lt!609993 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609991 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!1387675 (arrayContainsKey!0 a!2938 lt!609991 #b00000000000000000000000000000000)))

(declare-fun lt!609992 () Unit!46385)

(assert (=> b!1387675 (= lt!609992 lt!609993)))

(declare-fun res!928410 () Bool)

(assert (=> b!1387675 (= res!928410 (= (seekEntryOrOpen!0 (select (arr!45838 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) a!2938 mask!2987) (Found!10181 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!1387675 (=> (not res!928410) (not e!786061))))

(declare-fun bm!66590 () Bool)

(assert (=> bm!66590 (= call!66593 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun d!149675 () Bool)

(declare-fun res!928411 () Bool)

(declare-fun e!786060 () Bool)

(assert (=> d!149675 (=> res!928411 e!786060)))

(assert (=> d!149675 (= res!928411 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46388 a!2938)))))

(assert (=> d!149675 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2938 mask!2987) e!786060)))

(declare-fun b!1387676 () Bool)

(assert (=> b!1387676 (= e!786062 call!66593)))

(declare-fun b!1387677 () Bool)

(assert (=> b!1387677 (= e!786060 e!786062)))

(declare-fun c!129073 () Bool)

(assert (=> b!1387677 (= c!129073 (validKeyInArray!0 (select (arr!45838 a!2938) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!149675 (not res!928411)) b!1387677))

(assert (= (and b!1387677 c!129073) b!1387675))

(assert (= (and b!1387677 (not c!129073)) b!1387676))

(assert (= (and b!1387675 res!928410) b!1387674))

(assert (= (or b!1387674 b!1387676) bm!66590))

(declare-fun m!1273299 () Bool)

(assert (=> b!1387675 m!1273299))

(declare-fun m!1273301 () Bool)

(assert (=> b!1387675 m!1273301))

(declare-fun m!1273303 () Bool)

(assert (=> b!1387675 m!1273303))

(assert (=> b!1387675 m!1273299))

(declare-fun m!1273305 () Bool)

(assert (=> b!1387675 m!1273305))

(declare-fun m!1273307 () Bool)

(assert (=> bm!66590 m!1273307))

(assert (=> b!1387677 m!1273299))

(assert (=> b!1387677 m!1273299))

(declare-fun m!1273309 () Bool)

(assert (=> b!1387677 m!1273309))

(assert (=> bm!66561 d!149675))

(declare-fun d!149677 () Bool)

(assert (=> d!149677 (arrayContainsKey!0 a!2938 lt!609832 #b00000000000000000000000000000000)))

(declare-fun lt!609994 () Unit!46385)

(assert (=> d!149677 (= lt!609994 (choose!13 a!2938 lt!609832 startIndex!16))))

(assert (=> d!149677 (bvsge startIndex!16 #b00000000000000000000000000000000)))

(assert (=> d!149677 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!609832 startIndex!16) lt!609994)))

(declare-fun bs!40330 () Bool)

(assert (= bs!40330 d!149677))

(assert (=> bs!40330 m!1272823))

(declare-fun m!1273311 () Bool)

(assert (=> bs!40330 m!1273311))

(assert (=> b!1387332 d!149677))

(declare-fun d!149679 () Bool)

(declare-fun res!928412 () Bool)

(declare-fun e!786063 () Bool)

(assert (=> d!149679 (=> res!928412 e!786063)))

(assert (=> d!149679 (= res!928412 (= (select (arr!45838 a!2938) #b00000000000000000000000000000000) lt!609832))))

(assert (=> d!149679 (= (arrayContainsKey!0 a!2938 lt!609832 #b00000000000000000000000000000000) e!786063)))

(declare-fun b!1387678 () Bool)

(declare-fun e!786064 () Bool)

(assert (=> b!1387678 (= e!786063 e!786064)))

(declare-fun res!928413 () Bool)

(assert (=> b!1387678 (=> (not res!928413) (not e!786064))))

(assert (=> b!1387678 (= res!928413 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46388 a!2938)))))

(declare-fun b!1387679 () Bool)

(assert (=> b!1387679 (= e!786064 (arrayContainsKey!0 a!2938 lt!609832 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149679 (not res!928412)) b!1387678))

(assert (= (and b!1387678 res!928413) b!1387679))

(assert (=> d!149679 m!1272731))

(declare-fun m!1273313 () Bool)

(assert (=> b!1387679 m!1273313))

(assert (=> b!1387332 d!149679))

(assert (=> b!1387332 d!149527))

(declare-fun e!786073 () SeekEntryResult!10181)

(declare-fun b!1387692 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1387692 (= e!786073 (seekKeyOrZeroReturnVacant!0 (bvadd (x!124702 lt!609812) #b00000000000000000000000000000001) (nextIndex!0 (index!43097 lt!609812) (x!124702 lt!609812) mask!2987) (index!43097 lt!609812) (select (store (arr!45838 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609744 mask!2987))))

(declare-fun d!149681 () Bool)

(declare-fun lt!609999 () SeekEntryResult!10181)

(assert (=> d!149681 (and (or (is-Undefined!10181 lt!609999) (not (is-Found!10181 lt!609999)) (and (bvsge (index!43096 lt!609999) #b00000000000000000000000000000000) (bvslt (index!43096 lt!609999) (size!46388 lt!609744)))) (or (is-Undefined!10181 lt!609999) (is-Found!10181 lt!609999) (not (is-MissingVacant!10181 lt!609999)) (not (= (index!43098 lt!609999) (index!43097 lt!609812))) (and (bvsge (index!43098 lt!609999) #b00000000000000000000000000000000) (bvslt (index!43098 lt!609999) (size!46388 lt!609744)))) (or (is-Undefined!10181 lt!609999) (ite (is-Found!10181 lt!609999) (= (select (arr!45838 lt!609744) (index!43096 lt!609999)) (select (store (arr!45838 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)) (and (is-MissingVacant!10181 lt!609999) (= (index!43098 lt!609999) (index!43097 lt!609812)) (= (select (arr!45838 lt!609744) (index!43098 lt!609999)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!786072 () SeekEntryResult!10181)

(assert (=> d!149681 (= lt!609999 e!786072)))

(declare-fun c!129082 () Bool)

(assert (=> d!149681 (= c!129082 (bvsge (x!124702 lt!609812) #b01111111111111111111111111111110))))

(declare-fun lt!610000 () (_ BitVec 64))

(assert (=> d!149681 (= lt!610000 (select (arr!45838 lt!609744) (index!43097 lt!609812)))))

(assert (=> d!149681 (validMask!0 mask!2987)))

(assert (=> d!149681 (= (seekKeyOrZeroReturnVacant!0 (x!124702 lt!609812) (index!43097 lt!609812) (index!43097 lt!609812) (select (store (arr!45838 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) lt!609744 mask!2987) lt!609999)))

(declare-fun b!1387693 () Bool)

(declare-fun e!786071 () SeekEntryResult!10181)

(assert (=> b!1387693 (= e!786072 e!786071)))

(declare-fun c!129080 () Bool)

(assert (=> b!1387693 (= c!129080 (= lt!610000 (select (store (arr!45838 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16)))))

(declare-fun b!1387694 () Bool)

(assert (=> b!1387694 (= e!786071 (Found!10181 (index!43097 lt!609812)))))

(declare-fun b!1387695 () Bool)

(assert (=> b!1387695 (= e!786072 Undefined!10181)))

(declare-fun b!1387696 () Bool)

(assert (=> b!1387696 (= e!786073 (MissingVacant!10181 (index!43097 lt!609812)))))

(declare-fun b!1387697 () Bool)

(declare-fun c!129081 () Bool)

(assert (=> b!1387697 (= c!129081 (= lt!610000 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1387697 (= e!786071 e!786073)))

(assert (= (and d!149681 c!129082) b!1387695))

(assert (= (and d!149681 (not c!129082)) b!1387693))

(assert (= (and b!1387693 c!129080) b!1387694))

(assert (= (and b!1387693 (not c!129080)) b!1387697))

(assert (= (and b!1387697 c!129081) b!1387696))

(assert (= (and b!1387697 (not c!129081)) b!1387692))

(declare-fun m!1273315 () Bool)

(assert (=> b!1387692 m!1273315))

(assert (=> b!1387692 m!1273315))

(assert (=> b!1387692 m!1272649))

(declare-fun m!1273317 () Bool)

(assert (=> b!1387692 m!1273317))

(declare-fun m!1273319 () Bool)

(assert (=> d!149681 m!1273319))

(declare-fun m!1273321 () Bool)

(assert (=> d!149681 m!1273321))

(assert (=> d!149681 m!1272792))

(assert (=> d!149681 m!1272675))

(assert (=> b!1387300 d!149681))

(assert (=> b!1387405 d!149663))

(declare-fun b!1387698 () Bool)

(declare-fun e!786075 () Bool)

(declare-fun call!66594 () Bool)

(assert (=> b!1387698 (= e!786075 call!66594)))

(declare-fun b!1387699 () Bool)

(declare-fun e!786076 () Bool)

(assert (=> b!1387699 (= e!786076 e!786075)))

(declare-fun lt!610001 () (_ BitVec 64))

(assert (=> b!1387699 (= lt!610001 (select (arr!45838 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(declare-fun lt!610003 () Unit!46385)

(assert (=> b!1387699 (= lt!610003 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2938 lt!610001 (bvadd startIndex!16 #b00000000000000000000000000000001)))))

(assert (=> b!1387699 (arrayContainsKey!0 a!2938 lt!610001 #b00000000000000000000000000000000)))

(declare-fun lt!610002 () Unit!46385)

(assert (=> b!1387699 (= lt!610002 lt!610003)))

(declare-fun res!928414 () Bool)

(assert (=> b!1387699 (= res!928414 (= (seekEntryOrOpen!0 (select (arr!45838 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001)) a!2938 mask!2987) (Found!10181 (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (=> b!1387699 (=> (not res!928414) (not e!786075))))

(declare-fun bm!66591 () Bool)

(assert (=> bm!66591 (= call!66594 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001 #b00000000000000000000000000000001) a!2938 mask!2987))))

(declare-fun d!149683 () Bool)

(declare-fun res!928415 () Bool)

(declare-fun e!786074 () Bool)

(assert (=> d!149683 (=> res!928415 e!786074)))

(assert (=> d!149683 (= res!928415 (bvsge (bvadd startIndex!16 #b00000000000000000000000000000001) (size!46388 a!2938)))))

(assert (=> d!149683 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!16 #b00000000000000000000000000000001) a!2938 mask!2987) e!786074)))

(declare-fun b!1387700 () Bool)

(assert (=> b!1387700 (= e!786076 call!66594)))

(declare-fun b!1387701 () Bool)

(assert (=> b!1387701 (= e!786074 e!786076)))

(declare-fun c!129083 () Bool)

(assert (=> b!1387701 (= c!129083 (validKeyInArray!0 (select (arr!45838 a!2938) (bvadd startIndex!16 #b00000000000000000000000000000001))))))

(assert (= (and d!149683 (not res!928415)) b!1387701))

(assert (= (and b!1387701 c!129083) b!1387699))

(assert (= (and b!1387701 (not c!129083)) b!1387700))

(assert (= (and b!1387699 res!928414) b!1387698))

(assert (= (or b!1387698 b!1387700) bm!66591))

(declare-fun m!1273323 () Bool)

(assert (=> b!1387699 m!1273323))

(declare-fun m!1273325 () Bool)

(assert (=> b!1387699 m!1273325))

(declare-fun m!1273327 () Bool)

(assert (=> b!1387699 m!1273327))

(assert (=> b!1387699 m!1273323))

(declare-fun m!1273329 () Bool)

(assert (=> b!1387699 m!1273329))

(declare-fun m!1273331 () Bool)

(assert (=> bm!66591 m!1273331))

(assert (=> b!1387701 m!1273323))

(assert (=> b!1387701 m!1273323))

(declare-fun m!1273333 () Bool)

(assert (=> b!1387701 m!1273333))

(assert (=> bm!66567 d!149683))

(declare-fun d!149685 () Bool)

(declare-fun lt!610006 () Bool)

(declare-fun content!763 (List!32366) (Set (_ BitVec 64)))

(assert (=> d!149685 (= lt!610006 (member (select (arr!45838 a!2938) #b00000000000000000000000000000000) (content!763 Nil!32363)))))

(declare-fun e!786082 () Bool)

(assert (=> d!149685 (= lt!610006 e!786082)))

(declare-fun res!928421 () Bool)

(assert (=> d!149685 (=> (not res!928421) (not e!786082))))

(assert (=> d!149685 (= res!928421 (is-Cons!32362 Nil!32363))))

(assert (=> d!149685 (= (contains!9747 Nil!32363 (select (arr!45838 a!2938) #b00000000000000000000000000000000)) lt!610006)))

(declare-fun b!1387706 () Bool)

(declare-fun e!786081 () Bool)

(assert (=> b!1387706 (= e!786082 e!786081)))

(declare-fun res!928420 () Bool)

(assert (=> b!1387706 (=> res!928420 e!786081)))

(assert (=> b!1387706 (= res!928420 (= (h!33571 Nil!32363) (select (arr!45838 a!2938) #b00000000000000000000000000000000)))))

(declare-fun b!1387707 () Bool)

(assert (=> b!1387707 (= e!786081 (contains!9747 (t!47060 Nil!32363) (select (arr!45838 a!2938) #b00000000000000000000000000000000)))))

(assert (= (and d!149685 res!928421) b!1387706))

(assert (= (and b!1387706 (not res!928420)) b!1387707))

(declare-fun m!1273335 () Bool)

(assert (=> d!149685 m!1273335))

(assert (=> d!149685 m!1272731))

(declare-fun m!1273337 () Bool)

(assert (=> d!149685 m!1273337))

(assert (=> b!1387707 m!1272731))

(declare-fun m!1273339 () Bool)

(assert (=> b!1387707 m!1273339))

(assert (=> b!1387404 d!149685))

(declare-fun d!149687 () Bool)

(assert (=> d!149687 (arrayContainsKey!0 lt!609744 lt!609769 #b00000000000000000000000000000000)))

(declare-fun lt!610007 () Unit!46385)

(assert (=> d!149687 (= lt!610007 (choose!13 lt!609744 lt!609769 (bvadd #b00000000000000000000000000000001 startIndex!16)))))

(assert (=> d!149687 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000)))

(assert (=> d!149687 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!609744 lt!609769 (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!610007)))

(declare-fun bs!40331 () Bool)

(assert (= bs!40331 d!149687))

(assert (=> bs!40331 m!1272705))

(declare-fun m!1273341 () Bool)

(assert (=> bs!40331 m!1273341))

(assert (=> b!1387226 d!149687))

(declare-fun d!149689 () Bool)

(declare-fun res!928422 () Bool)

(declare-fun e!786083 () Bool)

(assert (=> d!149689 (=> res!928422 e!786083)))

(assert (=> d!149689 (= res!928422 (= (select (arr!45838 lt!609744) #b00000000000000000000000000000000) lt!609769))))

(assert (=> d!149689 (= (arrayContainsKey!0 lt!609744 lt!609769 #b00000000000000000000000000000000) e!786083)))

(declare-fun b!1387708 () Bool)

(declare-fun e!786084 () Bool)

(assert (=> b!1387708 (= e!786083 e!786084)))

(declare-fun res!928423 () Bool)

(assert (=> b!1387708 (=> (not res!928423) (not e!786084))))

(assert (=> b!1387708 (= res!928423 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!46388 lt!609744)))))

(declare-fun b!1387709 () Bool)

(assert (=> b!1387709 (= e!786084 (arrayContainsKey!0 lt!609744 lt!609769 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!149689 (not res!928422)) b!1387708))

(assert (= (and b!1387708 res!928423) b!1387709))

(declare-fun m!1273343 () Bool)

(assert (=> d!149689 m!1273343))

(declare-fun m!1273345 () Bool)

(assert (=> b!1387709 m!1273345))

(assert (=> b!1387226 d!149689))

(declare-fun b!1387710 () Bool)

(declare-fun c!129086 () Bool)

(declare-fun lt!610008 () (_ BitVec 64))

(assert (=> b!1387710 (= c!129086 (= lt!610008 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!786085 () SeekEntryResult!10181)

(declare-fun e!786087 () SeekEntryResult!10181)

(assert (=> b!1387710 (= e!786085 e!786087)))

(declare-fun d!149691 () Bool)

(declare-fun lt!610010 () SeekEntryResult!10181)

(assert (=> d!149691 (and (or (is-Undefined!10181 lt!610010) (not (is-Found!10181 lt!610010)) (and (bvsge (index!43096 lt!610010) #b00000000000000000000000000000000) (bvslt (index!43096 lt!610010) (size!46388 lt!609744)))) (or (is-Undefined!10181 lt!610010) (is-Found!10181 lt!610010) (not (is-MissingZero!10181 lt!610010)) (and (bvsge (index!43095 lt!610010) #b00000000000000000000000000000000) (bvslt (index!43095 lt!610010) (size!46388 lt!609744)))) (or (is-Undefined!10181 lt!610010) (is-Found!10181 lt!610010) (is-MissingZero!10181 lt!610010) (not (is-MissingVacant!10181 lt!610010)) (and (bvsge (index!43098 lt!610010) #b00000000000000000000000000000000) (bvslt (index!43098 lt!610010) (size!46388 lt!609744)))) (or (is-Undefined!10181 lt!610010) (ite (is-Found!10181 lt!610010) (= (select (arr!45838 lt!609744) (index!43096 lt!610010)) (select (arr!45838 lt!609744) (bvadd #b00000000000000000000000000000001 startIndex!16))) (ite (is-MissingZero!10181 lt!610010) (= (select (arr!45838 lt!609744) (index!43095 lt!610010)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!10181 lt!610010) (= (select (arr!45838 lt!609744) (index!43098 lt!610010)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!786086 () SeekEntryResult!10181)

(assert (=> d!149691 (= lt!610010 e!786086)))

(declare-fun c!129084 () Bool)

(declare-fun lt!610009 () SeekEntryResult!10181)

(assert (=> d!149691 (= c!129084 (and (is-Intermediate!10181 lt!610009) (undefined!10993 lt!610009)))))

(assert (=> d!149691 (= lt!610009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45838 lt!609744) (bvadd #b00000000000000000000000000000001 startIndex!16)) mask!2987) (select (arr!45838 lt!609744) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!609744 mask!2987))))

(assert (=> d!149691 (validMask!0 mask!2987)))

(assert (=> d!149691 (= (seekEntryOrOpen!0 (select (arr!45838 lt!609744) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!609744 mask!2987) lt!610010)))

(declare-fun b!1387711 () Bool)

(assert (=> b!1387711 (= e!786087 (seekKeyOrZeroReturnVacant!0 (x!124702 lt!610009) (index!43097 lt!610009) (index!43097 lt!610009) (select (arr!45838 lt!609744) (bvadd #b00000000000000000000000000000001 startIndex!16)) lt!609744 mask!2987))))

(declare-fun b!1387712 () Bool)

(assert (=> b!1387712 (= e!786086 e!786085)))

(assert (=> b!1387712 (= lt!610008 (select (arr!45838 lt!609744) (index!43097 lt!610009)))))

(declare-fun c!129085 () Bool)

(assert (=> b!1387712 (= c!129085 (= lt!610008 (select (arr!45838 lt!609744) (bvadd #b00000000000000000000000000000001 startIndex!16))))))

(declare-fun b!1387713 () Bool)

(assert (=> b!1387713 (= e!786085 (Found!10181 (index!43097 lt!610009)))))

(declare-fun b!1387714 () Bool)

(assert (=> b!1387714 (= e!786087 (MissingZero!10181 (index!43097 lt!610009)))))

(declare-fun b!1387715 () Bool)

(assert (=> b!1387715 (= e!786086 Undefined!10181)))

(assert (= (and d!149691 c!129084) b!1387715))

(assert (= (and d!149691 (not c!129084)) b!1387712))

(assert (= (and b!1387712 c!129085) b!1387713))

(assert (= (and b!1387712 (not c!129085)) b!1387710))

(assert (= (and b!1387710 c!129086) b!1387714))

(assert (= (and b!1387710 (not c!129086)) b!1387711))

(declare-fun m!1273347 () Bool)

(assert (=> d!149691 m!1273347))

(assert (=> d!149691 m!1272701))

(declare-fun m!1273349 () Bool)

(assert (=> d!149691 m!1273349))

(declare-fun m!1273351 () Bool)

(assert (=> d!149691 m!1273351))

(assert (=> d!149691 m!1273349))

(assert (=> d!149691 m!1272701))

(declare-fun m!1273353 () Bool)

(assert (=> d!149691 m!1273353))

(assert (=> d!149691 m!1272675))

(declare-fun m!1273355 () Bool)

(assert (=> d!149691 m!1273355))

(assert (=> b!1387711 m!1272701))

(declare-fun m!1273357 () Bool)

