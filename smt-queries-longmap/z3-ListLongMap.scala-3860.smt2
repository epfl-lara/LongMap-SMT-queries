; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53082 () Bool)

(assert start!53082)

(declare-fun b!577681 () Bool)

(declare-fun e!332251 () Bool)

(declare-datatypes ((List!11352 0))(
  ( (Nil!11349) (Cons!11348 (h!12393 (_ BitVec 64)) (t!17580 List!11352)) )
))
(declare-fun noDuplicate!226 (List!11352) Bool)

(assert (=> b!577681 (= e!332251 (not (noDuplicate!226 Nil!11349)))))

(declare-fun b!577682 () Bool)

(declare-fun res!365641 () Bool)

(assert (=> b!577682 (=> (not res!365641) (not e!332251))))

(declare-datatypes ((array!36067 0))(
  ( (array!36068 (arr!17311 (Array (_ BitVec 32) (_ BitVec 64))) (size!17675 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36067)

(assert (=> b!577682 (= res!365641 (and (bvsle #b00000000000000000000000000000000 (size!17675 a!2986)) (bvslt (size!17675 a!2986) #b01111111111111111111111111111111)))))

(declare-fun res!365646 () Bool)

(declare-fun e!332253 () Bool)

(assert (=> start!53082 (=> (not res!365646) (not e!332253))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53082 (= res!365646 (validMask!0 mask!3053))))

(assert (=> start!53082 e!332253))

(assert (=> start!53082 true))

(declare-fun array_inv!13107 (array!36067) Bool)

(assert (=> start!53082 (array_inv!13107 a!2986)))

(declare-fun b!577683 () Bool)

(assert (=> b!577683 (= e!332253 e!332251)))

(declare-fun res!365648 () Bool)

(assert (=> b!577683 (=> (not res!365648) (not e!332251))))

(declare-datatypes ((SeekEntryResult!5751 0))(
  ( (MissingZero!5751 (index!25231 (_ BitVec 32))) (Found!5751 (index!25232 (_ BitVec 32))) (Intermediate!5751 (undefined!6563 Bool) (index!25233 (_ BitVec 32)) (x!54140 (_ BitVec 32))) (Undefined!5751) (MissingVacant!5751 (index!25234 (_ BitVec 32))) )
))
(declare-fun lt!264037 () SeekEntryResult!5751)

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577683 (= res!365648 (or (= lt!264037 (MissingZero!5751 i!1108)) (= lt!264037 (MissingVacant!5751 i!1108))))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36067 (_ BitVec 32)) SeekEntryResult!5751)

(assert (=> b!577683 (= lt!264037 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!577684 () Bool)

(declare-fun res!365643 () Bool)

(assert (=> b!577684 (=> (not res!365643) (not e!332253))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577684 (= res!365643 (validKeyInArray!0 k0!1786))))

(declare-fun b!577685 () Bool)

(declare-fun res!365645 () Bool)

(assert (=> b!577685 (=> (not res!365645) (not e!332253))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!577685 (= res!365645 (and (= (size!17675 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17675 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17675 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577686 () Bool)

(declare-fun res!365644 () Bool)

(assert (=> b!577686 (=> (not res!365644) (not e!332253))))

(assert (=> b!577686 (= res!365644 (validKeyInArray!0 (select (arr!17311 a!2986) j!136)))))

(declare-fun b!577687 () Bool)

(declare-fun res!365647 () Bool)

(assert (=> b!577687 (=> (not res!365647) (not e!332253))))

(declare-fun arrayContainsKey!0 (array!36067 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577687 (= res!365647 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!577688 () Bool)

(declare-fun res!365642 () Bool)

(assert (=> b!577688 (=> (not res!365642) (not e!332251))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36067 (_ BitVec 32)) Bool)

(assert (=> b!577688 (= res!365642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53082 res!365646) b!577685))

(assert (= (and b!577685 res!365645) b!577686))

(assert (= (and b!577686 res!365644) b!577684))

(assert (= (and b!577684 res!365643) b!577687))

(assert (= (and b!577687 res!365647) b!577683))

(assert (= (and b!577683 res!365648) b!577688))

(assert (= (and b!577688 res!365642) b!577682))

(assert (= (and b!577682 res!365641) b!577681))

(declare-fun m!556495 () Bool)

(assert (=> b!577681 m!556495))

(declare-fun m!556497 () Bool)

(assert (=> b!577687 m!556497))

(declare-fun m!556499 () Bool)

(assert (=> b!577684 m!556499))

(declare-fun m!556501 () Bool)

(assert (=> b!577686 m!556501))

(assert (=> b!577686 m!556501))

(declare-fun m!556503 () Bool)

(assert (=> b!577686 m!556503))

(declare-fun m!556505 () Bool)

(assert (=> b!577688 m!556505))

(declare-fun m!556507 () Bool)

(assert (=> b!577683 m!556507))

(declare-fun m!556509 () Bool)

(assert (=> start!53082 m!556509))

(declare-fun m!556511 () Bool)

(assert (=> start!53082 m!556511))

(check-sat (not start!53082) (not b!577687) (not b!577681) (not b!577683) (not b!577686) (not b!577688) (not b!577684))
(check-sat)
(get-model)

(declare-fun d!85587 () Bool)

(assert (=> d!85587 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!53082 d!85587))

(declare-fun d!85595 () Bool)

(assert (=> d!85595 (= (array_inv!13107 a!2986) (bvsge (size!17675 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!53082 d!85595))

(declare-fun d!85597 () Bool)

(declare-fun res!365683 () Bool)

(declare-fun e!332273 () Bool)

(assert (=> d!85597 (=> res!365683 e!332273)))

(get-info :version)

(assert (=> d!85597 (= res!365683 ((_ is Nil!11349) Nil!11349))))

(assert (=> d!85597 (= (noDuplicate!226 Nil!11349) e!332273)))

(declare-fun b!577723 () Bool)

(declare-fun e!332274 () Bool)

(assert (=> b!577723 (= e!332273 e!332274)))

(declare-fun res!365684 () Bool)

(assert (=> b!577723 (=> (not res!365684) (not e!332274))))

(declare-fun contains!2899 (List!11352 (_ BitVec 64)) Bool)

(assert (=> b!577723 (= res!365684 (not (contains!2899 (t!17580 Nil!11349) (h!12393 Nil!11349))))))

(declare-fun b!577724 () Bool)

(assert (=> b!577724 (= e!332274 (noDuplicate!226 (t!17580 Nil!11349)))))

(assert (= (and d!85597 (not res!365683)) b!577723))

(assert (= (and b!577723 res!365684) b!577724))

(declare-fun m!556535 () Bool)

(assert (=> b!577723 m!556535))

(declare-fun m!556537 () Bool)

(assert (=> b!577724 m!556537))

(assert (=> b!577681 d!85597))

(declare-fun d!85599 () Bool)

(declare-fun res!365693 () Bool)

(declare-fun e!332285 () Bool)

(assert (=> d!85599 (=> res!365693 e!332285)))

(assert (=> d!85599 (= res!365693 (= (select (arr!17311 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!85599 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!332285)))

(declare-fun b!577737 () Bool)

(declare-fun e!332286 () Bool)

(assert (=> b!577737 (= e!332285 e!332286)))

(declare-fun res!365694 () Bool)

(assert (=> b!577737 (=> (not res!365694) (not e!332286))))

(assert (=> b!577737 (= res!365694 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17675 a!2986)))))

(declare-fun b!577738 () Bool)

(assert (=> b!577738 (= e!332286 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85599 (not res!365693)) b!577737))

(assert (= (and b!577737 res!365694) b!577738))

(declare-fun m!556539 () Bool)

(assert (=> d!85599 m!556539))

(declare-fun m!556541 () Bool)

(assert (=> b!577738 m!556541))

(assert (=> b!577687 d!85599))

(declare-fun d!85601 () Bool)

(assert (=> d!85601 (= (validKeyInArray!0 (select (arr!17311 a!2986) j!136)) (and (not (= (select (arr!17311 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17311 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577686 d!85601))

(declare-fun d!85603 () Bool)

(assert (=> d!85603 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577684 d!85603))

(declare-fun b!577763 () Bool)

(declare-fun e!332304 () Bool)

(declare-fun call!32765 () Bool)

(assert (=> b!577763 (= e!332304 call!32765)))

(declare-fun d!85605 () Bool)

(declare-fun res!365701 () Bool)

(declare-fun e!332302 () Bool)

(assert (=> d!85605 (=> res!365701 e!332302)))

(assert (=> d!85605 (= res!365701 (bvsge #b00000000000000000000000000000000 (size!17675 a!2986)))))

(assert (=> d!85605 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!332302)))

(declare-fun b!577764 () Bool)

(assert (=> b!577764 (= e!332302 e!332304)))

(declare-fun c!66398 () Bool)

(assert (=> b!577764 (= c!66398 (validKeyInArray!0 (select (arr!17311 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!577765 () Bool)

(declare-fun e!332303 () Bool)

(assert (=> b!577765 (= e!332303 call!32765)))

(declare-fun bm!32762 () Bool)

(assert (=> bm!32762 (= call!32765 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!577766 () Bool)

(assert (=> b!577766 (= e!332304 e!332303)))

(declare-fun lt!264064 () (_ BitVec 64))

(assert (=> b!577766 (= lt!264064 (select (arr!17311 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!18146 0))(
  ( (Unit!18147) )
))
(declare-fun lt!264063 () Unit!18146)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36067 (_ BitVec 64) (_ BitVec 32)) Unit!18146)

(assert (=> b!577766 (= lt!264063 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!264064 #b00000000000000000000000000000000))))

(assert (=> b!577766 (arrayContainsKey!0 a!2986 lt!264064 #b00000000000000000000000000000000)))

(declare-fun lt!264062 () Unit!18146)

(assert (=> b!577766 (= lt!264062 lt!264063)))

(declare-fun res!365702 () Bool)

(assert (=> b!577766 (= res!365702 (= (seekEntryOrOpen!0 (select (arr!17311 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!5751 #b00000000000000000000000000000000)))))

(assert (=> b!577766 (=> (not res!365702) (not e!332303))))

(assert (= (and d!85605 (not res!365701)) b!577764))

(assert (= (and b!577764 c!66398) b!577766))

(assert (= (and b!577764 (not c!66398)) b!577763))

(assert (= (and b!577766 res!365702) b!577765))

(assert (= (or b!577765 b!577763) bm!32762))

(assert (=> b!577764 m!556539))

(assert (=> b!577764 m!556539))

(declare-fun m!556555 () Bool)

(assert (=> b!577764 m!556555))

(declare-fun m!556557 () Bool)

(assert (=> bm!32762 m!556557))

(assert (=> b!577766 m!556539))

(declare-fun m!556559 () Bool)

(assert (=> b!577766 m!556559))

(declare-fun m!556561 () Bool)

(assert (=> b!577766 m!556561))

(assert (=> b!577766 m!556539))

(declare-fun m!556563 () Bool)

(assert (=> b!577766 m!556563))

(assert (=> b!577688 d!85605))

(declare-fun b!577827 () Bool)

(declare-fun e!332346 () SeekEntryResult!5751)

(declare-fun lt!264094 () SeekEntryResult!5751)

(assert (=> b!577827 (= e!332346 (MissingZero!5751 (index!25233 lt!264094)))))

(declare-fun b!577828 () Bool)

(declare-fun c!66422 () Bool)

(declare-fun lt!264093 () (_ BitVec 64))

(assert (=> b!577828 (= c!66422 (= lt!264093 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!332344 () SeekEntryResult!5751)

(assert (=> b!577828 (= e!332344 e!332346)))

(declare-fun b!577829 () Bool)

(declare-fun e!332345 () SeekEntryResult!5751)

(assert (=> b!577829 (= e!332345 Undefined!5751)))

(declare-fun b!577830 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36067 (_ BitVec 32)) SeekEntryResult!5751)

(assert (=> b!577830 (= e!332346 (seekKeyOrZeroReturnVacant!0 (x!54140 lt!264094) (index!25233 lt!264094) (index!25233 lt!264094) k0!1786 a!2986 mask!3053))))

(declare-fun b!577831 () Bool)

(assert (=> b!577831 (= e!332344 (Found!5751 (index!25233 lt!264094)))))

(declare-fun d!85609 () Bool)

(declare-fun lt!264092 () SeekEntryResult!5751)

(assert (=> d!85609 (and (or ((_ is Undefined!5751) lt!264092) (not ((_ is Found!5751) lt!264092)) (and (bvsge (index!25232 lt!264092) #b00000000000000000000000000000000) (bvslt (index!25232 lt!264092) (size!17675 a!2986)))) (or ((_ is Undefined!5751) lt!264092) ((_ is Found!5751) lt!264092) (not ((_ is MissingZero!5751) lt!264092)) (and (bvsge (index!25231 lt!264092) #b00000000000000000000000000000000) (bvslt (index!25231 lt!264092) (size!17675 a!2986)))) (or ((_ is Undefined!5751) lt!264092) ((_ is Found!5751) lt!264092) ((_ is MissingZero!5751) lt!264092) (not ((_ is MissingVacant!5751) lt!264092)) (and (bvsge (index!25234 lt!264092) #b00000000000000000000000000000000) (bvslt (index!25234 lt!264092) (size!17675 a!2986)))) (or ((_ is Undefined!5751) lt!264092) (ite ((_ is Found!5751) lt!264092) (= (select (arr!17311 a!2986) (index!25232 lt!264092)) k0!1786) (ite ((_ is MissingZero!5751) lt!264092) (= (select (arr!17311 a!2986) (index!25231 lt!264092)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!5751) lt!264092) (= (select (arr!17311 a!2986) (index!25234 lt!264092)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85609 (= lt!264092 e!332345)))

(declare-fun c!66420 () Bool)

(assert (=> d!85609 (= c!66420 (and ((_ is Intermediate!5751) lt!264094) (undefined!6563 lt!264094)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36067 (_ BitVec 32)) SeekEntryResult!5751)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85609 (= lt!264094 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!85609 (validMask!0 mask!3053)))

(assert (=> d!85609 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!264092)))

(declare-fun b!577832 () Bool)

(assert (=> b!577832 (= e!332345 e!332344)))

(assert (=> b!577832 (= lt!264093 (select (arr!17311 a!2986) (index!25233 lt!264094)))))

(declare-fun c!66421 () Bool)

(assert (=> b!577832 (= c!66421 (= lt!264093 k0!1786))))

(assert (= (and d!85609 c!66420) b!577829))

(assert (= (and d!85609 (not c!66420)) b!577832))

(assert (= (and b!577832 c!66421) b!577831))

(assert (= (and b!577832 (not c!66421)) b!577828))

(assert (= (and b!577828 c!66422) b!577827))

(assert (= (and b!577828 (not c!66422)) b!577830))

(declare-fun m!556611 () Bool)

(assert (=> b!577830 m!556611))

(declare-fun m!556613 () Bool)

(assert (=> d!85609 m!556613))

(declare-fun m!556615 () Bool)

(assert (=> d!85609 m!556615))

(declare-fun m!556617 () Bool)

(assert (=> d!85609 m!556617))

(assert (=> d!85609 m!556613))

(declare-fun m!556619 () Bool)

(assert (=> d!85609 m!556619))

(assert (=> d!85609 m!556509))

(declare-fun m!556621 () Bool)

(assert (=> d!85609 m!556621))

(declare-fun m!556623 () Bool)

(assert (=> b!577832 m!556623))

(assert (=> b!577683 d!85609))

(check-sat (not b!577830) (not b!577766) (not b!577764) (not bm!32762) (not b!577724) (not d!85609) (not b!577738) (not b!577723))
(check-sat)
