; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27588 () Bool)

(assert start!27588)

(declare-fun b!285124 () Bool)

(declare-fun e!180743 () Bool)

(declare-fun e!180742 () Bool)

(assert (=> b!285124 (= e!180743 e!180742)))

(declare-fun res!147608 () Bool)

(assert (=> b!285124 (=> (not res!147608) (not e!180742))))

(declare-datatypes ((SeekEntryResult!1880 0))(
  ( (MissingZero!1880 (index!9690 (_ BitVec 32))) (Found!1880 (index!9691 (_ BitVec 32))) (Intermediate!1880 (undefined!2692 Bool) (index!9692 (_ BitVec 32)) (x!27999 (_ BitVec 32))) (Undefined!1880) (MissingVacant!1880 (index!9693 (_ BitVec 32))) )
))
(declare-fun lt!140743 () SeekEntryResult!1880)

(declare-fun i!1267 () (_ BitVec 32))

(assert (=> b!285124 (= res!147608 (or (= lt!140743 (MissingZero!1880 i!1267)) (= lt!140743 (MissingVacant!1880 i!1267))))))

(declare-datatypes ((array!14237 0))(
  ( (array!14238 (arr!6757 (Array (_ BitVec 32) (_ BitVec 64))) (size!7109 (_ BitVec 32))) )
))
(declare-fun a!3325 () array!14237)

(declare-fun k0!2581 () (_ BitVec 64))

(declare-fun mask!3868 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14237 (_ BitVec 32)) SeekEntryResult!1880)

(assert (=> b!285124 (= lt!140743 (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868))))

(declare-fun b!285125 () Bool)

(declare-fun res!147613 () Bool)

(assert (=> b!285125 (=> (not res!147613) (not e!180743))))

(declare-fun arrayContainsKey!0 (array!14237 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!285125 (= res!147613 (not (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000)))))

(declare-fun b!285126 () Bool)

(declare-fun e!180740 () Bool)

(assert (=> b!285126 (= e!180742 e!180740)))

(declare-fun res!147610 () Bool)

(assert (=> b!285126 (=> (not res!147610) (not e!180740))))

(declare-fun startIndex!26 () (_ BitVec 32))

(assert (=> b!285126 (= res!147610 (not (= startIndex!26 i!1267)))))

(declare-fun lt!140745 () array!14237)

(assert (=> b!285126 (= lt!140745 (array!14238 (store (arr!6757 a!3325) i!1267 k0!2581) (size!7109 a!3325)))))

(declare-fun b!285127 () Bool)

(declare-fun res!147606 () Bool)

(assert (=> b!285127 (=> (not res!147606) (not e!180743))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!285127 (= res!147606 (validKeyInArray!0 k0!2581))))

(declare-fun b!285128 () Bool)

(declare-fun res!147609 () Bool)

(assert (=> b!285128 (=> (not res!147609) (not e!180743))))

(declare-datatypes ((List!4478 0))(
  ( (Nil!4475) (Cons!4474 (h!5147 (_ BitVec 64)) (t!9552 List!4478)) )
))
(declare-fun arrayNoDuplicates!0 (array!14237 (_ BitVec 32) List!4478) Bool)

(assert (=> b!285128 (= res!147609 (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4475))))

(declare-fun res!147615 () Bool)

(assert (=> start!27588 (=> (not res!147615) (not e!180743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27588 (= res!147615 (validMask!0 mask!3868))))

(assert (=> start!27588 e!180743))

(declare-fun array_inv!4707 (array!14237) Bool)

(assert (=> start!27588 (array_inv!4707 a!3325)))

(assert (=> start!27588 true))

(declare-fun b!285129 () Bool)

(declare-fun res!147607 () Bool)

(assert (=> b!285129 (=> (not res!147607) (not e!180742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14237 (_ BitVec 32)) Bool)

(assert (=> b!285129 (= res!147607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868))))

(declare-fun b!285130 () Bool)

(declare-fun res!147612 () Bool)

(assert (=> b!285130 (=> (not res!147612) (not e!180740))))

(assert (=> b!285130 (= res!147612 (and (bvslt startIndex!26 (bvsub (size!7109 a!3325) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) #b00000000000000000000000000000000)))))

(declare-fun b!285131 () Bool)

(declare-fun res!147614 () Bool)

(assert (=> b!285131 (=> (not res!147614) (not e!180740))))

(assert (=> b!285131 (= res!147614 (not (validKeyInArray!0 (select (arr!6757 a!3325) startIndex!26))))))

(declare-fun b!285132 () Bool)

(assert (=> b!285132 (= e!180740 (not (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!140745 mask!3868)))))

(assert (=> b!285132 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!140745 mask!3868)))

(declare-datatypes ((Unit!9012 0))(
  ( (Unit!9013) )
))
(declare-fun lt!140744 () Unit!9012)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 (array!14237 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9012)

(assert (=> b!285132 (= lt!140744 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(declare-fun b!285133 () Bool)

(declare-fun res!147611 () Bool)

(assert (=> b!285133 (=> (not res!147611) (not e!180743))))

(assert (=> b!285133 (= res!147611 (and (= (size!7109 a!3325) (bvadd #b00000000000000000000000000000001 mask!3868)) (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7109 a!3325)) (bvsge startIndex!26 #b00000000000000000000000000000000) (bvslt startIndex!26 (size!7109 a!3325))))))

(assert (= (and start!27588 res!147615) b!285133))

(assert (= (and b!285133 res!147611) b!285127))

(assert (= (and b!285127 res!147606) b!285128))

(assert (= (and b!285128 res!147609) b!285125))

(assert (= (and b!285125 res!147613) b!285124))

(assert (= (and b!285124 res!147608) b!285129))

(assert (= (and b!285129 res!147607) b!285126))

(assert (= (and b!285126 res!147610) b!285131))

(assert (= (and b!285131 res!147614) b!285130))

(assert (= (and b!285130 res!147612) b!285132))

(declare-fun m!300143 () Bool)

(assert (=> b!285129 m!300143))

(declare-fun m!300145 () Bool)

(assert (=> start!27588 m!300145))

(declare-fun m!300147 () Bool)

(assert (=> start!27588 m!300147))

(declare-fun m!300149 () Bool)

(assert (=> b!285127 m!300149))

(declare-fun m!300151 () Bool)

(assert (=> b!285131 m!300151))

(assert (=> b!285131 m!300151))

(declare-fun m!300153 () Bool)

(assert (=> b!285131 m!300153))

(declare-fun m!300155 () Bool)

(assert (=> b!285132 m!300155))

(declare-fun m!300157 () Bool)

(assert (=> b!285132 m!300157))

(declare-fun m!300159 () Bool)

(assert (=> b!285132 m!300159))

(declare-fun m!300161 () Bool)

(assert (=> b!285126 m!300161))

(declare-fun m!300163 () Bool)

(assert (=> b!285128 m!300163))

(declare-fun m!300165 () Bool)

(assert (=> b!285124 m!300165))

(declare-fun m!300167 () Bool)

(assert (=> b!285125 m!300167))

(check-sat (not b!285124) (not b!285127) (not b!285132) (not start!27588) (not b!285131) (not b!285129) (not b!285128) (not b!285125))
(check-sat)
(get-model)

(declare-fun b!285202 () Bool)

(declare-fun e!180776 () Bool)

(declare-fun e!180775 () Bool)

(assert (=> b!285202 (= e!180776 e!180775)))

(declare-fun lt!140772 () (_ BitVec 64))

(assert (=> b!285202 (= lt!140772 (select (arr!6757 lt!140745) startIndex!26))))

(declare-fun lt!140771 () Unit!9012)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14237 (_ BitVec 64) (_ BitVec 32)) Unit!9012)

(assert (=> b!285202 (= lt!140771 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140745 lt!140772 startIndex!26))))

(assert (=> b!285202 (arrayContainsKey!0 lt!140745 lt!140772 #b00000000000000000000000000000000)))

(declare-fun lt!140770 () Unit!9012)

(assert (=> b!285202 (= lt!140770 lt!140771)))

(declare-fun res!147681 () Bool)

(assert (=> b!285202 (= res!147681 (= (seekEntryOrOpen!0 (select (arr!6757 lt!140745) startIndex!26) lt!140745 mask!3868) (Found!1880 startIndex!26)))))

(assert (=> b!285202 (=> (not res!147681) (not e!180775))))

(declare-fun call!25525 () Bool)

(declare-fun bm!25522 () Bool)

(assert (=> bm!25522 (= call!25525 (arrayForallSeekEntryOrOpenFound!0 (bvadd startIndex!26 #b00000000000000000000000000000001) lt!140745 mask!3868))))

(declare-fun d!65761 () Bool)

(declare-fun res!147680 () Bool)

(declare-fun e!180774 () Bool)

(assert (=> d!65761 (=> res!147680 e!180774)))

(assert (=> d!65761 (= res!147680 (bvsge startIndex!26 (size!7109 lt!140745)))))

(assert (=> d!65761 (= (arrayForallSeekEntryOrOpenFound!0 startIndex!26 lt!140745 mask!3868) e!180774)))

(declare-fun b!285203 () Bool)

(assert (=> b!285203 (= e!180776 call!25525)))

(declare-fun b!285204 () Bool)

(assert (=> b!285204 (= e!180774 e!180776)))

(declare-fun c!46315 () Bool)

(assert (=> b!285204 (= c!46315 (validKeyInArray!0 (select (arr!6757 lt!140745) startIndex!26)))))

(declare-fun b!285205 () Bool)

(assert (=> b!285205 (= e!180775 call!25525)))

(assert (= (and d!65761 (not res!147680)) b!285204))

(assert (= (and b!285204 c!46315) b!285202))

(assert (= (and b!285204 (not c!46315)) b!285203))

(assert (= (and b!285202 res!147681) b!285205))

(assert (= (or b!285205 b!285203) bm!25522))

(declare-fun m!300221 () Bool)

(assert (=> b!285202 m!300221))

(declare-fun m!300223 () Bool)

(assert (=> b!285202 m!300223))

(declare-fun m!300225 () Bool)

(assert (=> b!285202 m!300225))

(assert (=> b!285202 m!300221))

(declare-fun m!300227 () Bool)

(assert (=> b!285202 m!300227))

(declare-fun m!300229 () Bool)

(assert (=> bm!25522 m!300229))

(assert (=> b!285204 m!300221))

(assert (=> b!285204 m!300221))

(declare-fun m!300231 () Bool)

(assert (=> b!285204 m!300231))

(assert (=> b!285132 d!65761))

(declare-fun b!285206 () Bool)

(declare-fun e!180779 () Bool)

(declare-fun e!180778 () Bool)

(assert (=> b!285206 (= e!180779 e!180778)))

(declare-fun lt!140775 () (_ BitVec 64))

(assert (=> b!285206 (= lt!140775 (select (arr!6757 lt!140745) (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(declare-fun lt!140774 () Unit!9012)

(assert (=> b!285206 (= lt!140774 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!140745 lt!140775 (bvadd #b00000000000000000000000000000001 startIndex!26)))))

(assert (=> b!285206 (arrayContainsKey!0 lt!140745 lt!140775 #b00000000000000000000000000000000)))

(declare-fun lt!140773 () Unit!9012)

(assert (=> b!285206 (= lt!140773 lt!140774)))

(declare-fun res!147683 () Bool)

(assert (=> b!285206 (= res!147683 (= (seekEntryOrOpen!0 (select (arr!6757 lt!140745) (bvadd #b00000000000000000000000000000001 startIndex!26)) lt!140745 mask!3868) (Found!1880 (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(assert (=> b!285206 (=> (not res!147683) (not e!180778))))

(declare-fun call!25526 () Bool)

(declare-fun bm!25523 () Bool)

(assert (=> bm!25523 (= call!25526 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26 #b00000000000000000000000000000001) lt!140745 mask!3868))))

(declare-fun d!65763 () Bool)

(declare-fun res!147682 () Bool)

(declare-fun e!180777 () Bool)

(assert (=> d!65763 (=> res!147682 e!180777)))

(assert (=> d!65763 (= res!147682 (bvsge (bvadd #b00000000000000000000000000000001 startIndex!26) (size!7109 lt!140745)))))

(assert (=> d!65763 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) lt!140745 mask!3868) e!180777)))

(declare-fun b!285207 () Bool)

(assert (=> b!285207 (= e!180779 call!25526)))

(declare-fun b!285208 () Bool)

(assert (=> b!285208 (= e!180777 e!180779)))

(declare-fun c!46316 () Bool)

(assert (=> b!285208 (= c!46316 (validKeyInArray!0 (select (arr!6757 lt!140745) (bvadd #b00000000000000000000000000000001 startIndex!26))))))

(declare-fun b!285209 () Bool)

(assert (=> b!285209 (= e!180778 call!25526)))

(assert (= (and d!65763 (not res!147682)) b!285208))

(assert (= (and b!285208 c!46316) b!285206))

(assert (= (and b!285208 (not c!46316)) b!285207))

(assert (= (and b!285206 res!147683) b!285209))

(assert (= (or b!285209 b!285207) bm!25523))

(declare-fun m!300233 () Bool)

(assert (=> b!285206 m!300233))

(declare-fun m!300235 () Bool)

(assert (=> b!285206 m!300235))

(declare-fun m!300237 () Bool)

(assert (=> b!285206 m!300237))

(assert (=> b!285206 m!300233))

(declare-fun m!300239 () Bool)

(assert (=> b!285206 m!300239))

(declare-fun m!300241 () Bool)

(assert (=> bm!25523 m!300241))

(assert (=> b!285208 m!300233))

(assert (=> b!285208 m!300233))

(declare-fun m!300243 () Bool)

(assert (=> b!285208 m!300243))

(assert (=> b!285132 d!65763))

(declare-fun d!65765 () Bool)

(declare-fun e!180782 () Bool)

(assert (=> d!65765 e!180782))

(declare-fun res!147686 () Bool)

(assert (=> d!65765 (=> (not res!147686) (not e!180782))))

(assert (=> d!65765 (= res!147686 (and (bvsge i!1267 #b00000000000000000000000000000000) (bvslt i!1267 (size!7109 a!3325))))))

(declare-fun lt!140778 () Unit!9012)

(declare-fun choose!98 (array!14237 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!9012)

(assert (=> d!65765 (= lt!140778 (choose!98 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868))))

(assert (=> d!65765 (validMask!0 mask!3868)))

(assert (=> d!65765 (= (lemmaPutValidKeyPreservesForallSeekEntryOrOpenStartIndex!0 a!3325 i!1267 k0!2581 (bvadd #b00000000000000000000000000000001 startIndex!26) mask!3868) lt!140778)))

(declare-fun b!285212 () Bool)

(assert (=> b!285212 (= e!180782 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 startIndex!26) (array!14238 (store (arr!6757 a!3325) i!1267 k0!2581) (size!7109 a!3325)) mask!3868))))

(assert (= (and d!65765 res!147686) b!285212))

(declare-fun m!300245 () Bool)

(assert (=> d!65765 m!300245))

(assert (=> d!65765 m!300145))

(assert (=> b!285212 m!300161))

(declare-fun m!300247 () Bool)

(assert (=> b!285212 m!300247))

(assert (=> b!285132 d!65765))

(declare-fun d!65769 () Bool)

(assert (=> d!65769 (= (validMask!0 mask!3868) (and (or (= mask!3868 #b00000000000000000000000000000111) (= mask!3868 #b00000000000000000000000000001111) (= mask!3868 #b00000000000000000000000000011111) (= mask!3868 #b00000000000000000000000000111111) (= mask!3868 #b00000000000000000000000001111111) (= mask!3868 #b00000000000000000000000011111111) (= mask!3868 #b00000000000000000000000111111111) (= mask!3868 #b00000000000000000000001111111111) (= mask!3868 #b00000000000000000000011111111111) (= mask!3868 #b00000000000000000000111111111111) (= mask!3868 #b00000000000000000001111111111111) (= mask!3868 #b00000000000000000011111111111111) (= mask!3868 #b00000000000000000111111111111111) (= mask!3868 #b00000000000000001111111111111111) (= mask!3868 #b00000000000000011111111111111111) (= mask!3868 #b00000000000000111111111111111111) (= mask!3868 #b00000000000001111111111111111111) (= mask!3868 #b00000000000011111111111111111111) (= mask!3868 #b00000000000111111111111111111111) (= mask!3868 #b00000000001111111111111111111111) (= mask!3868 #b00000000011111111111111111111111) (= mask!3868 #b00000000111111111111111111111111) (= mask!3868 #b00000001111111111111111111111111) (= mask!3868 #b00000011111111111111111111111111) (= mask!3868 #b00000111111111111111111111111111) (= mask!3868 #b00001111111111111111111111111111) (= mask!3868 #b00011111111111111111111111111111) (= mask!3868 #b00111111111111111111111111111111)) (bvsle mask!3868 #b00111111111111111111111111111111)))))

(assert (=> start!27588 d!65769))

(declare-fun d!65781 () Bool)

(assert (=> d!65781 (= (array_inv!4707 a!3325) (bvsge (size!7109 a!3325) #b00000000000000000000000000000000))))

(assert (=> start!27588 d!65781))

(declare-fun d!65783 () Bool)

(assert (=> d!65783 (= (validKeyInArray!0 (select (arr!6757 a!3325) startIndex!26)) (and (not (= (select (arr!6757 a!3325) startIndex!26) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!6757 a!3325) startIndex!26) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!285131 d!65783))

(declare-fun d!65787 () Bool)

(declare-fun res!147697 () Bool)

(declare-fun e!180793 () Bool)

(assert (=> d!65787 (=> res!147697 e!180793)))

(assert (=> d!65787 (= res!147697 (= (select (arr!6757 a!3325) #b00000000000000000000000000000000) k0!2581))))

(assert (=> d!65787 (= (arrayContainsKey!0 a!3325 k0!2581 #b00000000000000000000000000000000) e!180793)))

(declare-fun b!285223 () Bool)

(declare-fun e!180794 () Bool)

(assert (=> b!285223 (= e!180793 e!180794)))

(declare-fun res!147698 () Bool)

(assert (=> b!285223 (=> (not res!147698) (not e!180794))))

(assert (=> b!285223 (= res!147698 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7109 a!3325)))))

(declare-fun b!285224 () Bool)

(assert (=> b!285224 (= e!180794 (arrayContainsKey!0 a!3325 k0!2581 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65787 (not res!147697)) b!285223))

(assert (= (and b!285223 res!147698) b!285224))

(declare-fun m!300253 () Bool)

(assert (=> d!65787 m!300253))

(declare-fun m!300255 () Bool)

(assert (=> b!285224 m!300255))

(assert (=> b!285125 d!65787))

(declare-fun lt!140822 () SeekEntryResult!1880)

(declare-fun b!285298 () Bool)

(declare-fun e!180851 () SeekEntryResult!1880)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14237 (_ BitVec 32)) SeekEntryResult!1880)

(assert (=> b!285298 (= e!180851 (seekKeyOrZeroReturnVacant!0 (x!27999 lt!140822) (index!9692 lt!140822) (index!9692 lt!140822) k0!2581 a!3325 mask!3868))))

(declare-fun d!65789 () Bool)

(declare-fun lt!140821 () SeekEntryResult!1880)

(get-info :version)

(assert (=> d!65789 (and (or ((_ is Undefined!1880) lt!140821) (not ((_ is Found!1880) lt!140821)) (and (bvsge (index!9691 lt!140821) #b00000000000000000000000000000000) (bvslt (index!9691 lt!140821) (size!7109 a!3325)))) (or ((_ is Undefined!1880) lt!140821) ((_ is Found!1880) lt!140821) (not ((_ is MissingZero!1880) lt!140821)) (and (bvsge (index!9690 lt!140821) #b00000000000000000000000000000000) (bvslt (index!9690 lt!140821) (size!7109 a!3325)))) (or ((_ is Undefined!1880) lt!140821) ((_ is Found!1880) lt!140821) ((_ is MissingZero!1880) lt!140821) (not ((_ is MissingVacant!1880) lt!140821)) (and (bvsge (index!9693 lt!140821) #b00000000000000000000000000000000) (bvslt (index!9693 lt!140821) (size!7109 a!3325)))) (or ((_ is Undefined!1880) lt!140821) (ite ((_ is Found!1880) lt!140821) (= (select (arr!6757 a!3325) (index!9691 lt!140821)) k0!2581) (ite ((_ is MissingZero!1880) lt!140821) (= (select (arr!6757 a!3325) (index!9690 lt!140821)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1880) lt!140821) (= (select (arr!6757 a!3325) (index!9693 lt!140821)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!180850 () SeekEntryResult!1880)

(assert (=> d!65789 (= lt!140821 e!180850)))

(declare-fun c!46337 () Bool)

(assert (=> d!65789 (= c!46337 (and ((_ is Intermediate!1880) lt!140822) (undefined!2692 lt!140822)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14237 (_ BitVec 32)) SeekEntryResult!1880)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65789 (= lt!140822 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2581 mask!3868) k0!2581 a!3325 mask!3868))))

(assert (=> d!65789 (validMask!0 mask!3868)))

(assert (=> d!65789 (= (seekEntryOrOpen!0 k0!2581 a!3325 mask!3868) lt!140821)))

(declare-fun b!285299 () Bool)

(declare-fun e!180849 () SeekEntryResult!1880)

(assert (=> b!285299 (= e!180849 (Found!1880 (index!9692 lt!140822)))))

(declare-fun b!285300 () Bool)

(assert (=> b!285300 (= e!180850 Undefined!1880)))

(declare-fun b!285301 () Bool)

(declare-fun c!46336 () Bool)

(declare-fun lt!140823 () (_ BitVec 64))

(assert (=> b!285301 (= c!46336 (= lt!140823 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!285301 (= e!180849 e!180851)))

(declare-fun b!285302 () Bool)

(assert (=> b!285302 (= e!180850 e!180849)))

(assert (=> b!285302 (= lt!140823 (select (arr!6757 a!3325) (index!9692 lt!140822)))))

(declare-fun c!46338 () Bool)

(assert (=> b!285302 (= c!46338 (= lt!140823 k0!2581))))

(declare-fun b!285303 () Bool)

(assert (=> b!285303 (= e!180851 (MissingZero!1880 (index!9692 lt!140822)))))

(assert (= (and d!65789 c!46337) b!285300))

(assert (= (and d!65789 (not c!46337)) b!285302))

(assert (= (and b!285302 c!46338) b!285299))

(assert (= (and b!285302 (not c!46338)) b!285301))

(assert (= (and b!285301 c!46336) b!285303))

(assert (= (and b!285301 (not c!46336)) b!285298))

(declare-fun m!300339 () Bool)

(assert (=> b!285298 m!300339))

(declare-fun m!300341 () Bool)

(assert (=> d!65789 m!300341))

(declare-fun m!300343 () Bool)

(assert (=> d!65789 m!300343))

(assert (=> d!65789 m!300145))

(declare-fun m!300345 () Bool)

(assert (=> d!65789 m!300345))

(declare-fun m!300347 () Bool)

(assert (=> d!65789 m!300347))

(declare-fun m!300349 () Bool)

(assert (=> d!65789 m!300349))

(assert (=> d!65789 m!300347))

(declare-fun m!300351 () Bool)

(assert (=> b!285302 m!300351))

(assert (=> b!285124 d!65789))

(declare-fun b!285304 () Bool)

(declare-fun e!180854 () Bool)

(declare-fun e!180853 () Bool)

(assert (=> b!285304 (= e!180854 e!180853)))

(declare-fun lt!140826 () (_ BitVec 64))

(assert (=> b!285304 (= lt!140826 (select (arr!6757 a!3325) #b00000000000000000000000000000000))))

(declare-fun lt!140825 () Unit!9012)

(assert (=> b!285304 (= lt!140825 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3325 lt!140826 #b00000000000000000000000000000000))))

(assert (=> b!285304 (arrayContainsKey!0 a!3325 lt!140826 #b00000000000000000000000000000000)))

(declare-fun lt!140824 () Unit!9012)

(assert (=> b!285304 (= lt!140824 lt!140825)))

(declare-fun res!147735 () Bool)

(assert (=> b!285304 (= res!147735 (= (seekEntryOrOpen!0 (select (arr!6757 a!3325) #b00000000000000000000000000000000) a!3325 mask!3868) (Found!1880 #b00000000000000000000000000000000)))))

(assert (=> b!285304 (=> (not res!147735) (not e!180853))))

(declare-fun bm!25537 () Bool)

(declare-fun call!25540 () Bool)

(assert (=> bm!25537 (= call!25540 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3325 mask!3868))))

(declare-fun d!65815 () Bool)

(declare-fun res!147734 () Bool)

(declare-fun e!180852 () Bool)

(assert (=> d!65815 (=> res!147734 e!180852)))

(assert (=> d!65815 (= res!147734 (bvsge #b00000000000000000000000000000000 (size!7109 a!3325)))))

(assert (=> d!65815 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3325 mask!3868) e!180852)))

(declare-fun b!285305 () Bool)

(assert (=> b!285305 (= e!180854 call!25540)))

(declare-fun b!285306 () Bool)

(assert (=> b!285306 (= e!180852 e!180854)))

(declare-fun c!46339 () Bool)

(assert (=> b!285306 (= c!46339 (validKeyInArray!0 (select (arr!6757 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!285307 () Bool)

(assert (=> b!285307 (= e!180853 call!25540)))

(assert (= (and d!65815 (not res!147734)) b!285306))

(assert (= (and b!285306 c!46339) b!285304))

(assert (= (and b!285306 (not c!46339)) b!285305))

(assert (= (and b!285304 res!147735) b!285307))

(assert (= (or b!285307 b!285305) bm!25537))

(assert (=> b!285304 m!300253))

(declare-fun m!300353 () Bool)

(assert (=> b!285304 m!300353))

(declare-fun m!300355 () Bool)

(assert (=> b!285304 m!300355))

(assert (=> b!285304 m!300253))

(declare-fun m!300357 () Bool)

(assert (=> b!285304 m!300357))

(declare-fun m!300359 () Bool)

(assert (=> bm!25537 m!300359))

(assert (=> b!285306 m!300253))

(assert (=> b!285306 m!300253))

(declare-fun m!300361 () Bool)

(assert (=> b!285306 m!300361))

(assert (=> b!285129 d!65815))

(declare-fun b!285333 () Bool)

(declare-fun e!180877 () Bool)

(declare-fun e!180876 () Bool)

(assert (=> b!285333 (= e!180877 e!180876)))

(declare-fun c!46345 () Bool)

(assert (=> b!285333 (= c!46345 (validKeyInArray!0 (select (arr!6757 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!285334 () Bool)

(declare-fun call!25546 () Bool)

(assert (=> b!285334 (= e!180876 call!25546)))

(declare-fun b!285335 () Bool)

(assert (=> b!285335 (= e!180876 call!25546)))

(declare-fun bm!25543 () Bool)

(assert (=> bm!25543 (= call!25546 (arrayNoDuplicates!0 a!3325 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!46345 (Cons!4474 (select (arr!6757 a!3325) #b00000000000000000000000000000000) Nil!4475) Nil!4475)))))

(declare-fun d!65817 () Bool)

(declare-fun res!147751 () Bool)

(declare-fun e!180878 () Bool)

(assert (=> d!65817 (=> res!147751 e!180878)))

(assert (=> d!65817 (= res!147751 (bvsge #b00000000000000000000000000000000 (size!7109 a!3325)))))

(assert (=> d!65817 (= (arrayNoDuplicates!0 a!3325 #b00000000000000000000000000000000 Nil!4475) e!180878)))

(declare-fun b!285336 () Bool)

(assert (=> b!285336 (= e!180878 e!180877)))

(declare-fun res!147753 () Bool)

(assert (=> b!285336 (=> (not res!147753) (not e!180877))))

(declare-fun e!180875 () Bool)

(assert (=> b!285336 (= res!147753 (not e!180875))))

(declare-fun res!147752 () Bool)

(assert (=> b!285336 (=> (not res!147752) (not e!180875))))

(assert (=> b!285336 (= res!147752 (validKeyInArray!0 (select (arr!6757 a!3325) #b00000000000000000000000000000000)))))

(declare-fun b!285337 () Bool)

(declare-fun contains!1971 (List!4478 (_ BitVec 64)) Bool)

(assert (=> b!285337 (= e!180875 (contains!1971 Nil!4475 (select (arr!6757 a!3325) #b00000000000000000000000000000000)))))

(assert (= (and d!65817 (not res!147751)) b!285336))

(assert (= (and b!285336 res!147752) b!285337))

(assert (= (and b!285336 res!147753) b!285333))

(assert (= (and b!285333 c!46345) b!285335))

(assert (= (and b!285333 (not c!46345)) b!285334))

(assert (= (or b!285335 b!285334) bm!25543))

(assert (=> b!285333 m!300253))

(assert (=> b!285333 m!300253))

(assert (=> b!285333 m!300361))

(assert (=> bm!25543 m!300253))

(declare-fun m!300367 () Bool)

(assert (=> bm!25543 m!300367))

(assert (=> b!285336 m!300253))

(assert (=> b!285336 m!300253))

(assert (=> b!285336 m!300361))

(assert (=> b!285337 m!300253))

(assert (=> b!285337 m!300253))

(declare-fun m!300369 () Bool)

(assert (=> b!285337 m!300369))

(assert (=> b!285128 d!65817))

(declare-fun d!65821 () Bool)

(assert (=> d!65821 (= (validKeyInArray!0 k0!2581) (and (not (= k0!2581 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2581 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!285127 d!65821))

(check-sat (not b!285206) (not b!285333) (not b!285298) (not bm!25523) (not b!285224) (not bm!25543) (not b!285212) (not b!285204) (not b!285336) (not bm!25522) (not d!65765) (not d!65789) (not b!285337) (not bm!25537) (not b!285208) (not b!285304) (not b!285306) (not b!285202))
(check-sat)
