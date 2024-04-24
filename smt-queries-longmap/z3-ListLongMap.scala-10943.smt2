; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128294 () Bool)

(assert start!128294)

(declare-fun b!1505492 () Bool)

(declare-fun res!1025193 () Bool)

(declare-fun e!841797 () Bool)

(assert (=> b!1505492 (=> (not res!1025193) (not e!841797))))

(declare-datatypes ((array!100423 0))(
  ( (array!100424 (arr!48463 (Array (_ BitVec 32) (_ BitVec 64))) (size!49014 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100423)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100423 (_ BitVec 32)) Bool)

(assert (=> b!1505492 (= res!1025193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1505493 () Bool)

(declare-fun res!1025197 () Bool)

(assert (=> b!1505493 (=> (not res!1025197) (not e!841797))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505493 (= res!1025197 (validKeyInArray!0 (select (arr!48463 a!2850) i!996)))))

(declare-fun b!1505494 () Bool)

(declare-fun res!1025199 () Bool)

(assert (=> b!1505494 (=> (not res!1025199) (not e!841797))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1505494 (= res!1025199 (not (= (select (arr!48463 a!2850) index!625) (select (arr!48463 a!2850) j!87))))))

(declare-fun b!1505495 () Bool)

(declare-fun res!1025198 () Bool)

(assert (=> b!1505495 (=> (not res!1025198) (not e!841797))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1505495 (= res!1025198 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!49014 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!49014 a!2850)) (= (select (arr!48463 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48463 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!49014 a!2850))))))

(declare-fun res!1025201 () Bool)

(assert (=> start!128294 (=> (not res!1025201) (not e!841797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128294 (= res!1025201 (validMask!0 mask!2661))))

(assert (=> start!128294 e!841797))

(assert (=> start!128294 true))

(declare-fun array_inv!37744 (array!100423) Bool)

(assert (=> start!128294 (array_inv!37744 a!2850)))

(declare-fun b!1505496 () Bool)

(assert (=> b!1505496 (= e!841797 (or (bvslt (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110)))))

(declare-fun lt!654214 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505496 (= lt!654214 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1505497 () Bool)

(declare-fun res!1025194 () Bool)

(assert (=> b!1505497 (=> (not res!1025194) (not e!841797))))

(assert (=> b!1505497 (= res!1025194 (validKeyInArray!0 (select (arr!48463 a!2850) j!87)))))

(declare-fun b!1505498 () Bool)

(declare-fun res!1025200 () Bool)

(assert (=> b!1505498 (=> (not res!1025200) (not e!841797))))

(declare-datatypes ((SeekEntryResult!12554 0))(
  ( (MissingZero!12554 (index!52608 (_ BitVec 32))) (Found!12554 (index!52609 (_ BitVec 32))) (Intermediate!12554 (undefined!13366 Bool) (index!52610 (_ BitVec 32)) (x!134487 (_ BitVec 32))) (Undefined!12554) (MissingVacant!12554 (index!52611 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100423 (_ BitVec 32)) SeekEntryResult!12554)

(assert (=> b!1505498 (= res!1025200 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48463 a!2850) j!87) a!2850 mask!2661) (Found!12554 j!87)))))

(declare-fun b!1505499 () Bool)

(declare-fun res!1025196 () Bool)

(assert (=> b!1505499 (=> (not res!1025196) (not e!841797))))

(assert (=> b!1505499 (= res!1025196 (and (= (size!49014 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49014 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!49014 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1505500 () Bool)

(declare-fun res!1025195 () Bool)

(assert (=> b!1505500 (=> (not res!1025195) (not e!841797))))

(declare-datatypes ((List!34942 0))(
  ( (Nil!34939) (Cons!34938 (h!36350 (_ BitVec 64)) (t!49628 List!34942)) )
))
(declare-fun arrayNoDuplicates!0 (array!100423 (_ BitVec 32) List!34942) Bool)

(assert (=> b!1505500 (= res!1025195 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34939))))

(assert (= (and start!128294 res!1025201) b!1505499))

(assert (= (and b!1505499 res!1025196) b!1505493))

(assert (= (and b!1505493 res!1025197) b!1505497))

(assert (= (and b!1505497 res!1025194) b!1505492))

(assert (= (and b!1505492 res!1025193) b!1505500))

(assert (= (and b!1505500 res!1025195) b!1505495))

(assert (= (and b!1505495 res!1025198) b!1505498))

(assert (= (and b!1505498 res!1025200) b!1505494))

(assert (= (and b!1505494 res!1025199) b!1505496))

(declare-fun m!1388691 () Bool)

(assert (=> b!1505500 m!1388691))

(declare-fun m!1388693 () Bool)

(assert (=> b!1505497 m!1388693))

(assert (=> b!1505497 m!1388693))

(declare-fun m!1388695 () Bool)

(assert (=> b!1505497 m!1388695))

(declare-fun m!1388697 () Bool)

(assert (=> b!1505492 m!1388697))

(declare-fun m!1388699 () Bool)

(assert (=> b!1505494 m!1388699))

(assert (=> b!1505494 m!1388693))

(declare-fun m!1388701 () Bool)

(assert (=> b!1505495 m!1388701))

(declare-fun m!1388703 () Bool)

(assert (=> b!1505495 m!1388703))

(declare-fun m!1388705 () Bool)

(assert (=> b!1505495 m!1388705))

(declare-fun m!1388707 () Bool)

(assert (=> b!1505493 m!1388707))

(assert (=> b!1505493 m!1388707))

(declare-fun m!1388709 () Bool)

(assert (=> b!1505493 m!1388709))

(declare-fun m!1388711 () Bool)

(assert (=> b!1505496 m!1388711))

(declare-fun m!1388713 () Bool)

(assert (=> start!128294 m!1388713))

(declare-fun m!1388715 () Bool)

(assert (=> start!128294 m!1388715))

(assert (=> b!1505498 m!1388693))

(assert (=> b!1505498 m!1388693))

(declare-fun m!1388717 () Bool)

(assert (=> b!1505498 m!1388717))

(check-sat (not b!1505496) (not b!1505493) (not b!1505500) (not start!128294) (not b!1505497) (not b!1505498) (not b!1505492))
(check-sat)
(get-model)

(declare-fun b!1505563 () Bool)

(declare-fun e!841816 () Bool)

(declare-fun e!841818 () Bool)

(assert (=> b!1505563 (= e!841816 e!841818)))

(declare-fun lt!654229 () (_ BitVec 64))

(assert (=> b!1505563 (= lt!654229 (select (arr!48463 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50191 0))(
  ( (Unit!50192) )
))
(declare-fun lt!654227 () Unit!50191)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100423 (_ BitVec 64) (_ BitVec 32)) Unit!50191)

(assert (=> b!1505563 (= lt!654227 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!654229 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1505563 (arrayContainsKey!0 a!2850 lt!654229 #b00000000000000000000000000000000)))

(declare-fun lt!654228 () Unit!50191)

(assert (=> b!1505563 (= lt!654228 lt!654227)))

(declare-fun res!1025260 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100423 (_ BitVec 32)) SeekEntryResult!12554)

(assert (=> b!1505563 (= res!1025260 (= (seekEntryOrOpen!0 (select (arr!48463 a!2850) #b00000000000000000000000000000000) a!2850 mask!2661) (Found!12554 #b00000000000000000000000000000000)))))

(assert (=> b!1505563 (=> (not res!1025260) (not e!841818))))

(declare-fun d!158293 () Bool)

(declare-fun res!1025261 () Bool)

(declare-fun e!841817 () Bool)

(assert (=> d!158293 (=> res!1025261 e!841817)))

(assert (=> d!158293 (= res!1025261 (bvsge #b00000000000000000000000000000000 (size!49014 a!2850)))))

(assert (=> d!158293 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661) e!841817)))

(declare-fun bm!68208 () Bool)

(declare-fun call!68211 () Bool)

(assert (=> bm!68208 (= call!68211 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1505564 () Bool)

(assert (=> b!1505564 (= e!841818 call!68211)))

(declare-fun b!1505565 () Bool)

(assert (=> b!1505565 (= e!841816 call!68211)))

(declare-fun b!1505566 () Bool)

(assert (=> b!1505566 (= e!841817 e!841816)))

(declare-fun c!139696 () Bool)

(assert (=> b!1505566 (= c!139696 (validKeyInArray!0 (select (arr!48463 a!2850) #b00000000000000000000000000000000)))))

(assert (= (and d!158293 (not res!1025261)) b!1505566))

(assert (= (and b!1505566 c!139696) b!1505563))

(assert (= (and b!1505566 (not c!139696)) b!1505565))

(assert (= (and b!1505563 res!1025260) b!1505564))

(assert (= (or b!1505564 b!1505565) bm!68208))

(declare-fun m!1388775 () Bool)

(assert (=> b!1505563 m!1388775))

(declare-fun m!1388777 () Bool)

(assert (=> b!1505563 m!1388777))

(declare-fun m!1388779 () Bool)

(assert (=> b!1505563 m!1388779))

(assert (=> b!1505563 m!1388775))

(declare-fun m!1388781 () Bool)

(assert (=> b!1505563 m!1388781))

(declare-fun m!1388783 () Bool)

(assert (=> bm!68208 m!1388783))

(assert (=> b!1505566 m!1388775))

(assert (=> b!1505566 m!1388775))

(declare-fun m!1388785 () Bool)

(assert (=> b!1505566 m!1388785))

(assert (=> b!1505492 d!158293))

(declare-fun b!1505587 () Bool)

(declare-fun e!841832 () SeekEntryResult!12554)

(assert (=> b!1505587 (= e!841832 Undefined!12554)))

(declare-fun lt!654240 () SeekEntryResult!12554)

(declare-fun d!158295 () Bool)

(get-info :version)

(assert (=> d!158295 (and (or ((_ is Undefined!12554) lt!654240) (not ((_ is Found!12554) lt!654240)) (and (bvsge (index!52609 lt!654240) #b00000000000000000000000000000000) (bvslt (index!52609 lt!654240) (size!49014 a!2850)))) (or ((_ is Undefined!12554) lt!654240) ((_ is Found!12554) lt!654240) (not ((_ is MissingVacant!12554) lt!654240)) (not (= (index!52611 lt!654240) vacantBefore!10)) (and (bvsge (index!52611 lt!654240) #b00000000000000000000000000000000) (bvslt (index!52611 lt!654240) (size!49014 a!2850)))) (or ((_ is Undefined!12554) lt!654240) (ite ((_ is Found!12554) lt!654240) (= (select (arr!48463 a!2850) (index!52609 lt!654240)) (select (arr!48463 a!2850) j!87)) (and ((_ is MissingVacant!12554) lt!654240) (= (index!52611 lt!654240) vacantBefore!10) (= (select (arr!48463 a!2850) (index!52611 lt!654240)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!158295 (= lt!654240 e!841832)))

(declare-fun c!139705 () Bool)

(assert (=> d!158295 (= c!139705 (bvsge x!647 #b01111111111111111111111111111110))))

(declare-fun lt!654241 () (_ BitVec 64))

(assert (=> d!158295 (= lt!654241 (select (arr!48463 a!2850) index!625))))

(assert (=> d!158295 (validMask!0 mask!2661)))

(assert (=> d!158295 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48463 a!2850) j!87) a!2850 mask!2661) lt!654240)))

(declare-fun e!841833 () SeekEntryResult!12554)

(declare-fun b!1505588 () Bool)

(assert (=> b!1505588 (= e!841833 (seekKeyOrZeroReturnVacant!0 (bvadd x!647 #b00000000000000000000000000000001) (nextIndex!0 index!625 (bvadd x!647 #b00000000000000000000000000000001) mask!2661) vacantBefore!10 (select (arr!48463 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1505589 () Bool)

(declare-fun e!841831 () SeekEntryResult!12554)

(assert (=> b!1505589 (= e!841832 e!841831)))

(declare-fun c!139706 () Bool)

(assert (=> b!1505589 (= c!139706 (= lt!654241 (select (arr!48463 a!2850) j!87)))))

(declare-fun b!1505590 () Bool)

(assert (=> b!1505590 (= e!841831 (Found!12554 index!625))))

(declare-fun b!1505591 () Bool)

(declare-fun c!139707 () Bool)

(assert (=> b!1505591 (= c!139707 (= lt!654241 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1505591 (= e!841831 e!841833)))

(declare-fun b!1505592 () Bool)

(assert (=> b!1505592 (= e!841833 (MissingVacant!12554 vacantBefore!10))))

(assert (= (and d!158295 c!139705) b!1505587))

(assert (= (and d!158295 (not c!139705)) b!1505589))

(assert (= (and b!1505589 c!139706) b!1505590))

(assert (= (and b!1505589 (not c!139706)) b!1505591))

(assert (= (and b!1505591 c!139707) b!1505592))

(assert (= (and b!1505591 (not c!139707)) b!1505588))

(declare-fun m!1388787 () Bool)

(assert (=> d!158295 m!1388787))

(declare-fun m!1388789 () Bool)

(assert (=> d!158295 m!1388789))

(assert (=> d!158295 m!1388699))

(assert (=> d!158295 m!1388713))

(declare-fun m!1388791 () Bool)

(assert (=> b!1505588 m!1388791))

(assert (=> b!1505588 m!1388791))

(assert (=> b!1505588 m!1388693))

(declare-fun m!1388793 () Bool)

(assert (=> b!1505588 m!1388793))

(assert (=> b!1505498 d!158295))

(declare-fun d!158301 () Bool)

(assert (=> d!158301 (= (validKeyInArray!0 (select (arr!48463 a!2850) i!996)) (and (not (= (select (arr!48463 a!2850) i!996) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48463 a!2850) i!996) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505493 d!158301))

(declare-fun b!1505607 () Bool)

(declare-fun e!841848 () Bool)

(declare-fun call!68217 () Bool)

(assert (=> b!1505607 (= e!841848 call!68217)))

(declare-fun b!1505608 () Bool)

(declare-fun e!841847 () Bool)

(declare-fun contains!9991 (List!34942 (_ BitVec 64)) Bool)

(assert (=> b!1505608 (= e!841847 (contains!9991 Nil!34939 (select (arr!48463 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1505609 () Bool)

(declare-fun e!841845 () Bool)

(declare-fun e!841846 () Bool)

(assert (=> b!1505609 (= e!841845 e!841846)))

(declare-fun res!1025275 () Bool)

(assert (=> b!1505609 (=> (not res!1025275) (not e!841846))))

(assert (=> b!1505609 (= res!1025275 (not e!841847))))

(declare-fun res!1025274 () Bool)

(assert (=> b!1505609 (=> (not res!1025274) (not e!841847))))

(assert (=> b!1505609 (= res!1025274 (validKeyInArray!0 (select (arr!48463 a!2850) #b00000000000000000000000000000000)))))

(declare-fun d!158303 () Bool)

(declare-fun res!1025276 () Bool)

(assert (=> d!158303 (=> res!1025276 e!841845)))

(assert (=> d!158303 (= res!1025276 (bvsge #b00000000000000000000000000000000 (size!49014 a!2850)))))

(assert (=> d!158303 (= (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34939) e!841845)))

(declare-fun bm!68214 () Bool)

(declare-fun c!139711 () Bool)

(assert (=> bm!68214 (= call!68217 (arrayNoDuplicates!0 a!2850 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!139711 (Cons!34938 (select (arr!48463 a!2850) #b00000000000000000000000000000000) Nil!34939) Nil!34939)))))

(declare-fun b!1505610 () Bool)

(assert (=> b!1505610 (= e!841846 e!841848)))

(assert (=> b!1505610 (= c!139711 (validKeyInArray!0 (select (arr!48463 a!2850) #b00000000000000000000000000000000)))))

(declare-fun b!1505611 () Bool)

(assert (=> b!1505611 (= e!841848 call!68217)))

(assert (= (and d!158303 (not res!1025276)) b!1505609))

(assert (= (and b!1505609 res!1025274) b!1505608))

(assert (= (and b!1505609 res!1025275) b!1505610))

(assert (= (and b!1505610 c!139711) b!1505607))

(assert (= (and b!1505610 (not c!139711)) b!1505611))

(assert (= (or b!1505607 b!1505611) bm!68214))

(assert (=> b!1505608 m!1388775))

(assert (=> b!1505608 m!1388775))

(declare-fun m!1388807 () Bool)

(assert (=> b!1505608 m!1388807))

(assert (=> b!1505609 m!1388775))

(assert (=> b!1505609 m!1388775))

(assert (=> b!1505609 m!1388785))

(assert (=> bm!68214 m!1388775))

(declare-fun m!1388809 () Bool)

(assert (=> bm!68214 m!1388809))

(assert (=> b!1505610 m!1388775))

(assert (=> b!1505610 m!1388775))

(assert (=> b!1505610 m!1388785))

(assert (=> b!1505500 d!158303))

(declare-fun d!158311 () Bool)

(assert (=> d!158311 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!128294 d!158311))

(declare-fun d!158317 () Bool)

(assert (=> d!158317 (= (array_inv!37744 a!2850) (bvsge (size!49014 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!128294 d!158317))

(declare-fun d!158319 () Bool)

(declare-fun lt!654247 () (_ BitVec 32))

(assert (=> d!158319 (and (bvsge lt!654247 #b00000000000000000000000000000000) (bvslt lt!654247 (bvadd mask!2661 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!158319 (= lt!654247 (choose!52 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(assert (=> d!158319 (validMask!0 mask!2661)))

(assert (=> d!158319 (= (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661) lt!654247)))

(declare-fun bs!43179 () Bool)

(assert (= bs!43179 d!158319))

(declare-fun m!1388811 () Bool)

(assert (=> bs!43179 m!1388811))

(assert (=> bs!43179 m!1388713))

(assert (=> b!1505496 d!158319))

(declare-fun d!158321 () Bool)

(assert (=> d!158321 (= (validKeyInArray!0 (select (arr!48463 a!2850) j!87)) (and (not (= (select (arr!48463 a!2850) j!87) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48463 a!2850) j!87) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505497 d!158321))

(check-sat (not bm!68214) (not d!158295) (not bm!68208) (not b!1505609) (not d!158319) (not b!1505608) (not b!1505566) (not b!1505588) (not b!1505610) (not b!1505563))
(check-sat)
