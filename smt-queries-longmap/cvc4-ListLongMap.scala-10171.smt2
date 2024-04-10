; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119902 () Bool)

(assert start!119902)

(declare-fun res!935193 () Bool)

(declare-fun e!790378 () Bool)

(assert (=> start!119902 (=> (not res!935193) (not e!790378))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119902 (= res!935193 (validMask!0 mask!2840))))

(assert (=> start!119902 e!790378))

(assert (=> start!119902 true))

(declare-datatypes ((array!95482 0))(
  ( (array!95483 (arr!46096 (Array (_ BitVec 32) (_ BitVec 64))) (size!46646 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95482)

(declare-fun array_inv!35124 (array!95482) Bool)

(assert (=> start!119902 (array_inv!35124 a!2901)))

(declare-fun b!1396112 () Bool)

(declare-fun res!935195 () Bool)

(assert (=> b!1396112 (=> (not res!935195) (not e!790378))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1396112 (= res!935195 (validKeyInArray!0 (select (arr!46096 a!2901) j!112)))))

(declare-fun b!1396113 () Bool)

(declare-fun res!935192 () Bool)

(assert (=> b!1396113 (=> (not res!935192) (not e!790378))))

(declare-datatypes ((List!32615 0))(
  ( (Nil!32612) (Cons!32611 (h!33850 (_ BitVec 64)) (t!47309 List!32615)) )
))
(declare-fun arrayNoDuplicates!0 (array!95482 (_ BitVec 32) List!32615) Bool)

(assert (=> b!1396113 (= res!935192 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32612))))

(declare-fun b!1396114 () Bool)

(declare-fun e!790379 () Bool)

(assert (=> b!1396114 (= e!790378 (not e!790379))))

(declare-fun res!935190 () Bool)

(assert (=> b!1396114 (=> res!935190 e!790379)))

(declare-datatypes ((SeekEntryResult!10413 0))(
  ( (MissingZero!10413 (index!44023 (_ BitVec 32))) (Found!10413 (index!44024 (_ BitVec 32))) (Intermediate!10413 (undefined!11225 Bool) (index!44025 (_ BitVec 32)) (x!125685 (_ BitVec 32))) (Undefined!10413) (MissingVacant!10413 (index!44026 (_ BitVec 32))) )
))
(declare-fun lt!613253 () SeekEntryResult!10413)

(assert (=> b!1396114 (= res!935190 (or (not (is-Intermediate!10413 lt!613253)) (undefined!11225 lt!613253)))))

(declare-fun e!790377 () Bool)

(assert (=> b!1396114 e!790377))

(declare-fun res!935196 () Bool)

(assert (=> b!1396114 (=> (not res!935196) (not e!790377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95482 (_ BitVec 32)) Bool)

(assert (=> b!1396114 (= res!935196 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46830 0))(
  ( (Unit!46831) )
))
(declare-fun lt!613254 () Unit!46830)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95482 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46830)

(assert (=> b!1396114 (= lt!613254 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95482 (_ BitVec 32)) SeekEntryResult!10413)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396114 (= lt!613253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46096 a!2901) j!112) mask!2840) (select (arr!46096 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396115 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95482 (_ BitVec 32)) SeekEntryResult!10413)

(assert (=> b!1396115 (= e!790377 (= (seekEntryOrOpen!0 (select (arr!46096 a!2901) j!112) a!2901 mask!2840) (Found!10413 j!112)))))

(declare-fun b!1396116 () Bool)

(declare-fun res!935197 () Bool)

(assert (=> b!1396116 (=> (not res!935197) (not e!790378))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1396116 (= res!935197 (validKeyInArray!0 (select (arr!46096 a!2901) i!1037)))))

(declare-fun b!1396117 () Bool)

(declare-fun lt!613252 () SeekEntryResult!10413)

(assert (=> b!1396117 (= e!790379 (or (= lt!613253 lt!613252) (not (is-Intermediate!10413 lt!613252)) (bvslt mask!2840 #b00000000000000000000000000000000) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> b!1396117 (= lt!613252 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95483 (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46646 a!2901)) mask!2840))))

(declare-fun b!1396118 () Bool)

(declare-fun res!935194 () Bool)

(assert (=> b!1396118 (=> (not res!935194) (not e!790378))))

(assert (=> b!1396118 (= res!935194 (and (= (size!46646 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46646 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46646 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1396119 () Bool)

(declare-fun res!935191 () Bool)

(assert (=> b!1396119 (=> (not res!935191) (not e!790378))))

(assert (=> b!1396119 (= res!935191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!119902 res!935193) b!1396118))

(assert (= (and b!1396118 res!935194) b!1396116))

(assert (= (and b!1396116 res!935197) b!1396112))

(assert (= (and b!1396112 res!935195) b!1396119))

(assert (= (and b!1396119 res!935191) b!1396113))

(assert (= (and b!1396113 res!935192) b!1396114))

(assert (= (and b!1396114 res!935196) b!1396115))

(assert (= (and b!1396114 (not res!935190)) b!1396117))

(declare-fun m!1282631 () Bool)

(assert (=> b!1396115 m!1282631))

(assert (=> b!1396115 m!1282631))

(declare-fun m!1282633 () Bool)

(assert (=> b!1396115 m!1282633))

(declare-fun m!1282635 () Bool)

(assert (=> start!119902 m!1282635))

(declare-fun m!1282637 () Bool)

(assert (=> start!119902 m!1282637))

(declare-fun m!1282639 () Bool)

(assert (=> b!1396119 m!1282639))

(assert (=> b!1396112 m!1282631))

(assert (=> b!1396112 m!1282631))

(declare-fun m!1282641 () Bool)

(assert (=> b!1396112 m!1282641))

(assert (=> b!1396114 m!1282631))

(declare-fun m!1282643 () Bool)

(assert (=> b!1396114 m!1282643))

(assert (=> b!1396114 m!1282631))

(declare-fun m!1282645 () Bool)

(assert (=> b!1396114 m!1282645))

(assert (=> b!1396114 m!1282643))

(assert (=> b!1396114 m!1282631))

(declare-fun m!1282647 () Bool)

(assert (=> b!1396114 m!1282647))

(declare-fun m!1282649 () Bool)

(assert (=> b!1396114 m!1282649))

(declare-fun m!1282651 () Bool)

(assert (=> b!1396117 m!1282651))

(declare-fun m!1282653 () Bool)

(assert (=> b!1396117 m!1282653))

(assert (=> b!1396117 m!1282653))

(declare-fun m!1282655 () Bool)

(assert (=> b!1396117 m!1282655))

(assert (=> b!1396117 m!1282655))

(assert (=> b!1396117 m!1282653))

(declare-fun m!1282657 () Bool)

(assert (=> b!1396117 m!1282657))

(declare-fun m!1282659 () Bool)

(assert (=> b!1396116 m!1282659))

(assert (=> b!1396116 m!1282659))

(declare-fun m!1282661 () Bool)

(assert (=> b!1396116 m!1282661))

(declare-fun m!1282663 () Bool)

(assert (=> b!1396113 m!1282663))

(push 1)

(assert (not start!119902))

(assert (not b!1396117))

(assert (not b!1396119))

(assert (not b!1396112))

(assert (not b!1396113))

(assert (not b!1396116))

(assert (not b!1396114))

(assert (not b!1396115))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1396183 () Bool)

(declare-fun e!790423 () SeekEntryResult!10413)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1396183 (= e!790423 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95483 (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46646 a!2901)) mask!2840))))

(declare-fun b!1396184 () Bool)

(declare-fun lt!613277 () SeekEntryResult!10413)

(assert (=> b!1396184 (and (bvsge (index!44025 lt!613277) #b00000000000000000000000000000000) (bvslt (index!44025 lt!613277) (size!46646 (array!95483 (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46646 a!2901)))))))

(declare-fun res!935221 () Bool)

(assert (=> b!1396184 (= res!935221 (= (select (arr!46096 (array!95483 (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46646 a!2901))) (index!44025 lt!613277)) (select (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)))))

(declare-fun e!790424 () Bool)

(assert (=> b!1396184 (=> res!935221 e!790424)))

(declare-fun e!790421 () Bool)

(assert (=> b!1396184 (= e!790421 e!790424)))

(declare-fun b!1396185 () Bool)

(assert (=> b!1396185 (and (bvsge (index!44025 lt!613277) #b00000000000000000000000000000000) (bvslt (index!44025 lt!613277) (size!46646 (array!95483 (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46646 a!2901)))))))

(assert (=> b!1396185 (= e!790424 (= (select (arr!46096 (array!95483 (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46646 a!2901))) (index!44025 lt!613277)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1396186 () Bool)

(declare-fun e!790420 () SeekEntryResult!10413)

(assert (=> b!1396186 (= e!790420 (Intermediate!10413 true (toIndex!0 (select (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!150815 () Bool)

(declare-fun e!790422 () Bool)

(assert (=> d!150815 e!790422))

(declare-fun c!129937 () Bool)

(assert (=> d!150815 (= c!129937 (and (is-Intermediate!10413 lt!613277) (undefined!11225 lt!613277)))))

(assert (=> d!150815 (= lt!613277 e!790420)))

(declare-fun c!129939 () Bool)

(assert (=> d!150815 (= c!129939 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!613278 () (_ BitVec 64))

(assert (=> d!150815 (= lt!613278 (select (arr!46096 (array!95483 (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46646 a!2901))) (toIndex!0 (select (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840)))))

(assert (=> d!150815 (validMask!0 mask!2840)))

(assert (=> d!150815 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95483 (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46646 a!2901)) mask!2840) lt!613277)))

(declare-fun b!1396187 () Bool)

(assert (=> b!1396187 (and (bvsge (index!44025 lt!613277) #b00000000000000000000000000000000) (bvslt (index!44025 lt!613277) (size!46646 (array!95483 (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46646 a!2901)))))))

(declare-fun res!935219 () Bool)

(assert (=> b!1396187 (= res!935219 (= (select (arr!46096 (array!95483 (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46646 a!2901))) (index!44025 lt!613277)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1396187 (=> res!935219 e!790424)))

(declare-fun b!1396188 () Bool)

(assert (=> b!1396188 (= e!790420 e!790423)))

(declare-fun c!129938 () Bool)

(assert (=> b!1396188 (= c!129938 (or (= lt!613278 (select (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112)) (= (bvadd lt!613278 lt!613278) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1396189 () Bool)

(assert (=> b!1396189 (= e!790422 e!790421)))

(declare-fun res!935220 () Bool)

(assert (=> b!1396189 (= res!935220 (and (is-Intermediate!10413 lt!613277) (not (undefined!11225 lt!613277)) (bvslt (x!125685 lt!613277) #b01111111111111111111111111111110) (bvsge (x!125685 lt!613277) #b00000000000000000000000000000000) (bvsge (x!125685 lt!613277) #b00000000000000000000000000000000)))))

(assert (=> b!1396189 (=> (not res!935220) (not e!790421))))

(declare-fun b!1396190 () Bool)

(assert (=> b!1396190 (= e!790423 (Intermediate!10413 false (toIndex!0 (select (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun b!1396191 () Bool)

(assert (=> b!1396191 (= e!790422 (bvsge (x!125685 lt!613277) #b01111111111111111111111111111110))))

(assert (= (and d!150815 c!129939) b!1396186))

(assert (= (and d!150815 (not c!129939)) b!1396188))

(assert (= (and b!1396188 c!129938) b!1396190))

(assert (= (and b!1396188 (not c!129938)) b!1396183))

(assert (= (and d!150815 c!129937) b!1396191))

(assert (= (and d!150815 (not c!129937)) b!1396189))

(assert (= (and b!1396189 res!935220) b!1396184))

(assert (= (and b!1396184 (not res!935221)) b!1396187))

(assert (= (and b!1396187 (not res!935219)) b!1396185))

(declare-fun m!1282695 () Bool)

(assert (=> b!1396185 m!1282695))

(assert (=> b!1396183 m!1282655))

(declare-fun m!1282697 () Bool)

(assert (=> b!1396183 m!1282697))

(assert (=> b!1396183 m!1282697))

(assert (=> b!1396183 m!1282653))

(declare-fun m!1282699 () Bool)

(assert (=> b!1396183 m!1282699))

(assert (=> d!150815 m!1282655))

(declare-fun m!1282701 () Bool)

(assert (=> d!150815 m!1282701))

(assert (=> d!150815 m!1282635))

(assert (=> b!1396187 m!1282695))

(assert (=> b!1396184 m!1282695))

(assert (=> b!1396117 d!150815))

(declare-fun d!150829 () Bool)

(declare-fun lt!613294 () (_ BitVec 32))

(declare-fun lt!613293 () (_ BitVec 32))

(assert (=> d!150829 (= lt!613294 (bvmul (bvxor lt!613293 (bvlshr lt!613293 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!150829 (= lt!613293 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!150829 (and (bvsge mask!2840 #b00000000000000000000000000000000) (let ((res!935222 (let ((h!33851 ((_ extract 31 0) (bvand (bvxor (select (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (bvlshr (select (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!125687 (bvmul (bvxor h!33851 (bvlshr h!33851 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!125687 (bvlshr x!125687 #b00000000000000000000000000001101)) mask!2840))))) (and (bvslt res!935222 (bvadd mask!2840 #b00000000000000000000000000000001)) (bvsge res!935222 #b00000000000000000000000000000000))))))

(assert (=> d!150829 (= (toIndex!0 (select (store (arr!46096 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (bvand (bvxor lt!613294 (bvlshr lt!613294 #b00000000000000000000000000001101)) mask!2840))))

(assert (=> b!1396117 d!150829))

(declare-fun d!150831 () Bool)

(assert (=> d!150831 (= (validKeyInArray!0 (select (arr!46096 a!2901) j!112)) (and (not (= (select (arr!46096 a!2901) j!112) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!46096 a!2901) j!112) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1396112 d!150831))

(declare-fun b!1396241 () Bool)

(declare-fun e!790458 () Bool)

(declare-fun call!66856 () Bool)

(assert (=> b!1396241 (= e!790458 call!66856)))

(declare-fun b!1396242 () Bool)

(assert (=> b!1396242 (= e!790458 call!66856)))

(declare-fun b!1396243 () Bool)

(declare-fun e!790459 () Bool)

(assert (=> b!1396243 (= e!790459 e!790458)))

(declare-fun c!129954 () Bool)

(assert (=> b!1396243 (= c!129954 (validKeyInArray!0 (select (arr!46096 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1396244 () Bool)

(declare-fun e!790460 () Bool)

(assert (=> b!1396244 (= e!790460 e!790459)))

(declare-fun res!935245 () Bool)

(assert (=> b!1396244 (=> (not res!935245) (not e!790459))))

(declare-fun e!790457 () Bool)

(assert (=> b!1396244 (= res!935245 (not e!790457))))

(declare-fun res!935247 () Bool)

(assert (=> b!1396244 (=> (not res!935247) (not e!790457))))

(assert (=> b!1396244 (= res!935247 (validKeyInArray!0 (select (arr!46096 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1396245 () Bool)

(declare-fun contains!9782 (List!32615 (_ BitVec 64)) Bool)

(assert (=> b!1396245 (= e!790457 (contains!9782 Nil!32612 (select (arr!46096 a!2901) #b00000000000000000000000000000000)))))

(declare-fun bm!66853 () Bool)

(assert (=> bm!66853 (= call!66856 (arrayNoDuplicates!0 a!2901 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!129954 (Cons!32611 (select (arr!46096 a!2901) #b00000000000000000000000000000000) Nil!32612) Nil!32612)))))

(declare-fun d!150833 () Bool)

(declare-fun res!935246 () Bool)

(assert (=> d!150833 (=> res!935246 e!790460)))

(assert (=> d!150833 (= res!935246 (bvsge #b00000000000000000000000000000000 (size!46646 a!2901)))))

(assert (=> d!150833 (= (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32612) e!790460)))

(assert (= (and d!150833 (not res!935246)) b!1396244))

(assert (= (and b!1396244 res!935247) b!1396245))

(assert (= (and b!1396244 res!935245) b!1396243))

(assert (= (and b!1396243 c!129954) b!1396242))

(assert (= (and b!1396243 (not c!129954)) b!1396241))

(assert (= (or b!1396242 b!1396241) bm!66853))

(declare-fun m!1282719 () Bool)

(assert (=> b!1396243 m!1282719))

(assert (=> b!1396243 m!1282719))

(declare-fun m!1282721 () Bool)

(assert (=> b!1396243 m!1282721))

(assert (=> b!1396244 m!1282719))

(assert (=> b!1396244 m!1282719))

(assert (=> b!1396244 m!1282721))

(assert (=> b!1396245 m!1282719))

(assert (=> b!1396245 m!1282719))

(declare-fun m!1282723 () Bool)

(assert (=> b!1396245 m!1282723))

(assert (=> bm!66853 m!1282719))

(declare-fun m!1282725 () Bool)

(assert (=> bm!66853 m!1282725))

(assert (=> b!1396113 d!150833))

(declare-fun b!1396269 () Bool)

(declare-fun e!790479 () Bool)

(declare-fun e!790480 () Bool)

(assert (=> b!1396269 (= e!790479 e!790480)))

(declare-fun c!129960 () Bool)

(assert (=> b!1396269 (= c!129960 (validKeyInArray!0 (select (arr!46096 a!2901) #b00000000000000000000000000000000)))))

(declare-fun b!1396270 () Bool)

(declare-fun call!66862 () Bool)

(assert (=> b!1396270 (= e!790480 call!66862)))

(declare-fun bm!66859 () Bool)

(assert (=> bm!66859 (= call!66862 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1396271 () Bool)

(declare-fun e!790481 () Bool)

(assert (=> b!1396271 (= e!790480 e!790481)))

(declare-fun lt!613316 () (_ BitVec 64))

(assert (=> b!1396271 (= lt!613316 (select (arr!46096 a!2901) #b00000000000000000000000000000000))))

(declare-fun lt!613315 () Unit!46830)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!95482 (_ BitVec 64) (_ BitVec 32)) Unit!46830)

(assert (=> b!1396271 (= lt!613315 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613316 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!95482 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1396271 (arrayContainsKey!0 a!2901 lt!613316 #b00000000000000000000000000000000)))

(declare-fun lt!613317 () Unit!46830)

(assert (=> b!1396271 (= lt!613317 lt!613315)))

(declare-fun res!935262 () Bool)

(assert (=> b!1396271 (= res!935262 (= (seekEntryOrOpen!0 (select (arr!46096 a!2901) #b00000000000000000000000000000000) a!2901 mask!2840) (Found!10413 #b00000000000000000000000000000000)))))

(assert (=> b!1396271 (=> (not res!935262) (not e!790481))))

(declare-fun b!1396272 () Bool)

(assert (=> b!1396272 (= e!790481 call!66862)))

(declare-fun d!150841 () Bool)

(declare-fun res!935261 () Bool)

(assert (=> d!150841 (=> res!935261 e!790479)))

(assert (=> d!150841 (= res!935261 (bvsge #b00000000000000000000000000000000 (size!46646 a!2901)))))

(assert (=> d!150841 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840) e!790479)))

(assert (= (and d!150841 (not res!935261)) b!1396269))

(assert (= (and b!1396269 c!129960) b!1396271))

(assert (= (and b!1396269 (not c!129960)) b!1396270))

(assert (= (and b!1396271 res!935262) b!1396272))

(assert (= (or b!1396272 b!1396270) bm!66859))

(assert (=> b!1396269 m!1282719))

(assert (=> b!1396269 m!1282719))

(assert (=> b!1396269 m!1282721))

(declare-fun m!1282731 () Bool)

(assert (=> bm!66859 m!1282731))

(assert (=> b!1396271 m!1282719))

(declare-fun m!1282733 () Bool)

(assert (=> b!1396271 m!1282733))

(declare-fun m!1282735 () Bool)

(assert (=> b!1396271 m!1282735))

(assert (=> b!1396271 m!1282719))

(declare-fun m!1282737 () Bool)

(assert (=> b!1396271 m!1282737))

(assert (=> b!1396119 d!150841))

(declare-fun d!150847 () Bool)

(assert (=> d!150847 (= (validMask!0 mask!2840) (and (or (= mask!2840 #b00000000000000000000000000000111) (= mask!2840 #b00000000000000000000000000001111) (= mask!2840 #b00000000000000000000000000011111) (= mask!2840 #b00000000000000000000000000111111) (= mask!2840 #b00000000000000000000000001111111) (= mask!2840 #b00000000000000000000000011111111) (= mask!2840 #b00000000000000000000000111111111) (= mask!2840 #b00000000000000000000001111111111) (= mask!2840 #b00000000000000000000011111111111) (= mask!2840 #b00000000000000000000111111111111) (= mask!2840 #b00000000000000000001111111111111) (= mask!2840 #b00000000000000000011111111111111) (= mask!2840 #b00000000000000000111111111111111) (= mask!2840 #b00000000000000001111111111111111) (= mask!2840 #b00000000000000011111111111111111) (= mask!2840 #b00000000000000111111111111111111) (= mask!2840 #b00000000000001111111111111111111) (= mask!2840 #b00000000000011111111111111111111) (= mask!2840 #b00000000000111111111111111111111) (= mask!2840 #b00000000001111111111111111111111) (= mask!2840 #b00000000011111111111111111111111) (= mask!2840 #b00000000111111111111111111111111) (= mask!2840 #b00000001111111111111111111111111) (= mask!2840 #b00000011111111111111111111111111) (= mask!2840 #b00000111111111111111111111111111) (= mask!2840 #b00001111111111111111111111111111) (= mask!2840 #b00011111111111111111111111111111) (= mask!2840 #b00111111111111111111111111111111)) (bvsle mask!2840 #b00111111111111111111111111111111)))))

(assert (=> start!119902 d!150847))

(declare-fun d!150849 () Bool)

(assert (=> d!150849 (= (array_inv!35124 a!2901) (bvsge (size!46646 a!2901) #b00000000000000000000000000000000))))

(assert (=> start!119902 d!150849))

(declare-fun b!1396300 () Bool)

(declare-fun e!790497 () Bool)

(declare-fun e!790498 () Bool)

(assert (=> b!1396300 (= e!790497 e!790498)))

(declare-fun c!129970 () Bool)

(assert (=> b!1396300 (= c!129970 (validKeyInArray!0 (select (arr!46096 a!2901) j!112)))))

(declare-fun b!1396301 () Bool)

(declare-fun call!66863 () Bool)

(assert (=> b!1396301 (= e!790498 call!66863)))

(declare-fun bm!66860 () Bool)

(assert (=> bm!66860 (= call!66863 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!112 #b00000000000000000000000000000001) a!2901 mask!2840))))

(declare-fun b!1396302 () Bool)

(declare-fun e!790499 () Bool)

(assert (=> b!1396302 (= e!790498 e!790499)))

(declare-fun lt!613325 () (_ BitVec 64))

(assert (=> b!1396302 (= lt!613325 (select (arr!46096 a!2901) j!112))))

(declare-fun lt!613324 () Unit!46830)

(assert (=> b!1396302 (= lt!613324 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2901 lt!613325 j!112))))

(assert (=> b!1396302 (arrayContainsKey!0 a!2901 lt!613325 #b00000000000000000000000000000000)))

(declare-fun lt!613326 () Unit!46830)

(assert (=> b!1396302 (= lt!613326 lt!613324)))

(declare-fun res!935273 () Bool)

(assert (=> b!1396302 (= res!935273 (= (seekEntryOrOpen!0 (select (arr!46096 a!2901) j!112) a!2901 mask!2840) (Found!10413 j!112)))))

(assert (=> b!1396302 (=> (not res!935273) (not e!790499))))

(declare-fun b!1396303 () Bool)

(assert (=> b!1396303 (= e!790499 call!66863)))

(declare-fun d!150851 () Bool)

(declare-fun res!935272 () Bool)

(assert (=> d!150851 (=> res!935272 e!790497)))

(assert (=> d!150851 (= res!935272 (bvsge j!112 (size!46646 a!2901)))))

(assert (=> d!150851 (= (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840) e!790497)))

(assert (= (and d!150851 (not res!935272)) b!1396300))

(assert (= (and b!1396300 c!129970) b!1396302))

(assert (= (and b!1396300 (not c!129970)) b!1396301))

(assert (= (and b!1396302 res!935273) b!1396303))

(assert (= (or b!1396303 b!1396301) bm!66860))

(assert (=> b!1396300 m!1282631))

(assert (=> b!1396300 m!1282631))

(assert (=> b!1396300 m!1282641))

(declare-fun m!1282747 () Bool)

(assert (=> bm!66860 m!1282747))

(assert (=> b!1396302 m!1282631))

(declare-fun m!1282749 () Bool)

(assert (=> b!1396302 m!1282749))

(declare-fun m!1282751 () Bool)

(assert (=> b!1396302 m!1282751))

(assert (=> b!1396302 m!1282631))

(assert (=> b!1396302 m!1282633))

(assert (=> b!1396114 d!150851))

(declare-fun d!150855 () Bool)

(assert (=> d!150855 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-fun lt!613339 () Unit!46830)

(declare-fun choose!38 (array!95482 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46830)

(assert (=> d!150855 (= lt!613339 (choose!38 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> d!150855 (validMask!0 mask!2840)))

(assert (=> d!150855 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112) lt!613339)))

(declare-fun bs!40632 () Bool)

(assert (= bs!40632 d!150855))

(assert (=> bs!40632 m!1282649))

(declare-fun m!1282753 () Bool)

(assert (=> bs!40632 m!1282753))

(assert (=> bs!40632 m!1282635))

(assert (=> b!1396114 d!150855))

(declare-fun b!1396316 () Bool)

(declare-fun e!790509 () SeekEntryResult!10413)

(assert (=> b!1396316 (= e!790509 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!46096 a!2901) j!112) mask!2840) #b00000000000000000000000000000000 mask!2840) (select (arr!46096 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1396317 () Bool)

(declare-fun lt!613342 () SeekEntryResult!10413)

(assert (=> b!1396317 (and (bvsge (index!44025 lt!613342) #b00000000000000000000000000000000) (bvslt (index!44025 lt!613342) (size!46646 a!2901)))))

(declare-fun res!935277 () Bool)

(assert (=> b!1396317 (= res!935277 (= (select (arr!46096 a!2901) (index!44025 lt!613342)) (select (arr!46096 a!2901) j!112)))))

(declare-fun e!790510 () Bool)

(assert (=> b!1396317 (=> res!935277 e!790510)))

(declare-fun e!790507 () Bool)

(assert (=> b!1396317 (= e!790507 e!790510)))

(declare-fun b!1396318 () Bool)

(assert (=> b!1396318 (and (bvsge (index!44025 lt!613342) #b00000000000000000000000000000000) (bvslt (index!44025 lt!613342) (size!46646 a!2901)))))

(assert (=> b!1396318 (= e!790510 (= (select (arr!46096 a!2901) (index!44025 lt!613342)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!790506 () SeekEntryResult!10413)

(declare-fun b!1396319 () Bool)

(assert (=> b!1396319 (= e!790506 (Intermediate!10413 true (toIndex!0 (select (arr!46096 a!2901) j!112) mask!2840) #b00000000000000000000000000000000))))

(declare-fun d!150857 () Bool)

(declare-fun e!790508 () Bool)

(assert (=> d!150857 e!790508))

(declare-fun c!129977 () Bool)

