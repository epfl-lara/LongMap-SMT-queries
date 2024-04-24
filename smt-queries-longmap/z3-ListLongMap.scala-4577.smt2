; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63948 () Bool)

(assert start!63948)

(declare-fun b!718323 () Bool)

(declare-fun res!480750 () Bool)

(declare-fun e!403338 () Bool)

(assert (=> b!718323 (=> (not res!480750) (not e!403338))))

(declare-datatypes ((array!40660 0))(
  ( (array!40661 (arr!19456 (Array (_ BitVec 32) (_ BitVec 64))) (size!19876 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40660)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40660 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718323 (= res!480750 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!480744 () Bool)

(assert (=> start!63948 (=> (not res!480744) (not e!403338))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63948 (= res!480744 (validMask!0 mask!3328))))

(assert (=> start!63948 e!403338))

(assert (=> start!63948 true))

(declare-fun array_inv!15315 (array!40660) Bool)

(assert (=> start!63948 (array_inv!15315 a!3186)))

(declare-fun b!718324 () Bool)

(declare-fun res!480747 () Bool)

(declare-fun e!403336 () Bool)

(assert (=> b!718324 (=> (not res!480747) (not e!403336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40660 (_ BitVec 32)) Bool)

(assert (=> b!718324 (= res!480747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!718325 () Bool)

(declare-fun res!480748 () Bool)

(assert (=> b!718325 (=> (not res!480748) (not e!403338))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718325 (= res!480748 (validKeyInArray!0 (select (arr!19456 a!3186) j!159)))))

(declare-fun b!718326 () Bool)

(declare-fun res!480749 () Bool)

(assert (=> b!718326 (=> (not res!480749) (not e!403338))))

(assert (=> b!718326 (= res!480749 (validKeyInArray!0 k0!2102))))

(declare-fun b!718327 () Bool)

(declare-fun res!480745 () Bool)

(assert (=> b!718327 (=> (not res!480745) (not e!403338))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!718327 (= res!480745 (and (= (size!19876 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19876 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19876 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718328 () Bool)

(assert (=> b!718328 (= e!403338 e!403336)))

(declare-fun res!480746 () Bool)

(assert (=> b!718328 (=> (not res!480746) (not e!403336))))

(declare-datatypes ((SeekEntryResult!7012 0))(
  ( (MissingZero!7012 (index!30416 (_ BitVec 32))) (Found!7012 (index!30417 (_ BitVec 32))) (Intermediate!7012 (undefined!7824 Bool) (index!30418 (_ BitVec 32)) (x!61587 (_ BitVec 32))) (Undefined!7012) (MissingVacant!7012 (index!30419 (_ BitVec 32))) )
))
(declare-fun lt!319380 () SeekEntryResult!7012)

(assert (=> b!718328 (= res!480746 (or (= lt!319380 (MissingZero!7012 i!1173)) (= lt!319380 (MissingVacant!7012 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40660 (_ BitVec 32)) SeekEntryResult!7012)

(assert (=> b!718328 (= lt!319380 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!718329 () Bool)

(declare-fun res!480751 () Bool)

(assert (=> b!718329 (=> (not res!480751) (not e!403336))))

(declare-datatypes ((List!13365 0))(
  ( (Nil!13362) (Cons!13361 (h!14409 (_ BitVec 64)) (t!19672 List!13365)) )
))
(declare-fun arrayNoDuplicates!0 (array!40660 (_ BitVec 32) List!13365) Bool)

(assert (=> b!718329 (= res!480751 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13362))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!718330 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718330 (= e!403336 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19876 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19876 a!3186)) (bvsge mask!3328 #b00000000000000000000000000000000) (bvsgt mask!3328 #b00111111111111111111111111111111)))))

(assert (= (and start!63948 res!480744) b!718327))

(assert (= (and b!718327 res!480745) b!718325))

(assert (= (and b!718325 res!480748) b!718326))

(assert (= (and b!718326 res!480749) b!718323))

(assert (= (and b!718323 res!480750) b!718328))

(assert (= (and b!718328 res!480746) b!718324))

(assert (= (and b!718324 res!480747) b!718329))

(assert (= (and b!718329 res!480751) b!718330))

(declare-fun m!674619 () Bool)

(assert (=> b!718328 m!674619))

(declare-fun m!674621 () Bool)

(assert (=> b!718324 m!674621))

(declare-fun m!674623 () Bool)

(assert (=> start!63948 m!674623))

(declare-fun m!674625 () Bool)

(assert (=> start!63948 m!674625))

(declare-fun m!674627 () Bool)

(assert (=> b!718326 m!674627))

(declare-fun m!674629 () Bool)

(assert (=> b!718323 m!674629))

(declare-fun m!674631 () Bool)

(assert (=> b!718325 m!674631))

(assert (=> b!718325 m!674631))

(declare-fun m!674633 () Bool)

(assert (=> b!718325 m!674633))

(declare-fun m!674635 () Bool)

(assert (=> b!718329 m!674635))

(check-sat (not b!718329) (not b!718323) (not b!718324) (not b!718328) (not start!63948) (not b!718326) (not b!718325))
(check-sat)
(get-model)

(declare-fun d!99149 () Bool)

(assert (=> d!99149 (= (validKeyInArray!0 (select (arr!19456 a!3186) j!159)) (and (not (= (select (arr!19456 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!19456 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!718325 d!99149))

(declare-fun d!99151 () Bool)

(assert (=> d!99151 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!718326 d!99151))

(declare-fun b!718397 () Bool)

(declare-fun e!403371 () SeekEntryResult!7012)

(assert (=> b!718397 (= e!403371 Undefined!7012)))

(declare-fun b!718398 () Bool)

(declare-fun e!403370 () SeekEntryResult!7012)

(declare-fun lt!319395 () SeekEntryResult!7012)

(assert (=> b!718398 (= e!403370 (Found!7012 (index!30418 lt!319395)))))

(declare-fun b!718399 () Bool)

(assert (=> b!718399 (= e!403371 e!403370)))

(declare-fun lt!319393 () (_ BitVec 64))

(assert (=> b!718399 (= lt!319393 (select (arr!19456 a!3186) (index!30418 lt!319395)))))

(declare-fun c!79165 () Bool)

(assert (=> b!718399 (= c!79165 (= lt!319393 k0!2102))))

(declare-fun b!718400 () Bool)

(declare-fun c!79166 () Bool)

(assert (=> b!718400 (= c!79166 (= lt!319393 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!403369 () SeekEntryResult!7012)

(assert (=> b!718400 (= e!403370 e!403369)))

(declare-fun b!718401 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40660 (_ BitVec 32)) SeekEntryResult!7012)

(assert (=> b!718401 (= e!403369 (seekKeyOrZeroReturnVacant!0 (x!61587 lt!319395) (index!30418 lt!319395) (index!30418 lt!319395) k0!2102 a!3186 mask!3328))))

(declare-fun d!99153 () Bool)

(declare-fun lt!319394 () SeekEntryResult!7012)

(get-info :version)

(assert (=> d!99153 (and (or ((_ is Undefined!7012) lt!319394) (not ((_ is Found!7012) lt!319394)) (and (bvsge (index!30417 lt!319394) #b00000000000000000000000000000000) (bvslt (index!30417 lt!319394) (size!19876 a!3186)))) (or ((_ is Undefined!7012) lt!319394) ((_ is Found!7012) lt!319394) (not ((_ is MissingZero!7012) lt!319394)) (and (bvsge (index!30416 lt!319394) #b00000000000000000000000000000000) (bvslt (index!30416 lt!319394) (size!19876 a!3186)))) (or ((_ is Undefined!7012) lt!319394) ((_ is Found!7012) lt!319394) ((_ is MissingZero!7012) lt!319394) (not ((_ is MissingVacant!7012) lt!319394)) (and (bvsge (index!30419 lt!319394) #b00000000000000000000000000000000) (bvslt (index!30419 lt!319394) (size!19876 a!3186)))) (or ((_ is Undefined!7012) lt!319394) (ite ((_ is Found!7012) lt!319394) (= (select (arr!19456 a!3186) (index!30417 lt!319394)) k0!2102) (ite ((_ is MissingZero!7012) lt!319394) (= (select (arr!19456 a!3186) (index!30416 lt!319394)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7012) lt!319394) (= (select (arr!19456 a!3186) (index!30419 lt!319394)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!99153 (= lt!319394 e!403371)))

(declare-fun c!79164 () Bool)

(assert (=> d!99153 (= c!79164 (and ((_ is Intermediate!7012) lt!319395) (undefined!7824 lt!319395)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40660 (_ BitVec 32)) SeekEntryResult!7012)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!99153 (= lt!319395 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!99153 (validMask!0 mask!3328)))

(assert (=> d!99153 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!319394)))

(declare-fun b!718402 () Bool)

(assert (=> b!718402 (= e!403369 (MissingZero!7012 (index!30418 lt!319395)))))

(assert (= (and d!99153 c!79164) b!718397))

(assert (= (and d!99153 (not c!79164)) b!718399))

(assert (= (and b!718399 c!79165) b!718398))

(assert (= (and b!718399 (not c!79165)) b!718400))

(assert (= (and b!718400 c!79166) b!718402))

(assert (= (and b!718400 (not c!79166)) b!718401))

(declare-fun m!674677 () Bool)

(assert (=> b!718399 m!674677))

(declare-fun m!674679 () Bool)

(assert (=> b!718401 m!674679))

(declare-fun m!674681 () Bool)

(assert (=> d!99153 m!674681))

(declare-fun m!674683 () Bool)

(assert (=> d!99153 m!674683))

(declare-fun m!674685 () Bool)

(assert (=> d!99153 m!674685))

(declare-fun m!674687 () Bool)

(assert (=> d!99153 m!674687))

(assert (=> d!99153 m!674685))

(declare-fun m!674689 () Bool)

(assert (=> d!99153 m!674689))

(assert (=> d!99153 m!674623))

(assert (=> b!718328 d!99153))

(declare-fun d!99167 () Bool)

(declare-fun res!480816 () Bool)

(declare-fun e!403384 () Bool)

(assert (=> d!99167 (=> res!480816 e!403384)))

(assert (=> d!99167 (= res!480816 (= (select (arr!19456 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!99167 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!403384)))

(declare-fun b!718417 () Bool)

(declare-fun e!403385 () Bool)

(assert (=> b!718417 (= e!403384 e!403385)))

(declare-fun res!480817 () Bool)

(assert (=> b!718417 (=> (not res!480817) (not e!403385))))

(assert (=> b!718417 (= res!480817 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!19876 a!3186)))))

(declare-fun b!718418 () Bool)

(assert (=> b!718418 (= e!403385 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!99167 (not res!480816)) b!718417))

(assert (= (and b!718417 res!480817) b!718418))

(declare-fun m!674691 () Bool)

(assert (=> d!99167 m!674691))

(declare-fun m!674693 () Bool)

(assert (=> b!718418 m!674693))

(assert (=> b!718323 d!99167))

(declare-fun d!99171 () Bool)

(assert (=> d!99171 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!63948 d!99171))

(declare-fun d!99179 () Bool)

(assert (=> d!99179 (= (array_inv!15315 a!3186) (bvsge (size!19876 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!63948 d!99179))

(declare-fun b!718479 () Bool)

(declare-fun e!403437 () Bool)

(declare-fun e!403435 () Bool)

(assert (=> b!718479 (= e!403437 e!403435)))

(declare-fun res!480854 () Bool)

(assert (=> b!718479 (=> (not res!480854) (not e!403435))))

(declare-fun e!403434 () Bool)

(assert (=> b!718479 (= res!480854 (not e!403434))))

(declare-fun res!480855 () Bool)

(assert (=> b!718479 (=> (not res!480855) (not e!403434))))

(assert (=> b!718479 (= res!480855 (validKeyInArray!0 (select (arr!19456 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!718480 () Bool)

(declare-fun e!403436 () Bool)

(declare-fun call!34737 () Bool)

(assert (=> b!718480 (= e!403436 call!34737)))

(declare-fun bm!34734 () Bool)

(declare-fun c!79181 () Bool)

(assert (=> bm!34734 (= call!34737 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!79181 (Cons!13361 (select (arr!19456 a!3186) #b00000000000000000000000000000000) Nil!13362) Nil!13362)))))

(declare-fun b!718481 () Bool)

(assert (=> b!718481 (= e!403436 call!34737)))

(declare-fun d!99181 () Bool)

(declare-fun res!480856 () Bool)

(assert (=> d!99181 (=> res!480856 e!403437)))

(assert (=> d!99181 (= res!480856 (bvsge #b00000000000000000000000000000000 (size!19876 a!3186)))))

(assert (=> d!99181 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13362) e!403437)))

(declare-fun b!718482 () Bool)

(declare-fun contains!4013 (List!13365 (_ BitVec 64)) Bool)

(assert (=> b!718482 (= e!403434 (contains!4013 Nil!13362 (select (arr!19456 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!718483 () Bool)

(assert (=> b!718483 (= e!403435 e!403436)))

(assert (=> b!718483 (= c!79181 (validKeyInArray!0 (select (arr!19456 a!3186) #b00000000000000000000000000000000)))))

(assert (= (and d!99181 (not res!480856)) b!718479))

(assert (= (and b!718479 res!480855) b!718482))

(assert (= (and b!718479 res!480854) b!718483))

(assert (= (and b!718483 c!79181) b!718481))

(assert (= (and b!718483 (not c!79181)) b!718480))

(assert (= (or b!718481 b!718480) bm!34734))

(assert (=> b!718479 m!674691))

(assert (=> b!718479 m!674691))

(declare-fun m!674727 () Bool)

(assert (=> b!718479 m!674727))

(assert (=> bm!34734 m!674691))

(declare-fun m!674729 () Bool)

(assert (=> bm!34734 m!674729))

(assert (=> b!718482 m!674691))

(assert (=> b!718482 m!674691))

(declare-fun m!674731 () Bool)

(assert (=> b!718482 m!674731))

(assert (=> b!718483 m!674691))

(assert (=> b!718483 m!674691))

(assert (=> b!718483 m!674727))

(assert (=> b!718329 d!99181))

(declare-fun bm!34737 () Bool)

(declare-fun call!34740 () Bool)

(assert (=> bm!34737 (= call!34740 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!718492 () Bool)

(declare-fun e!403446 () Bool)

(assert (=> b!718492 (= e!403446 call!34740)))

(declare-fun d!99191 () Bool)

(declare-fun res!480862 () Bool)

(declare-fun e!403445 () Bool)

(assert (=> d!99191 (=> res!480862 e!403445)))

(assert (=> d!99191 (= res!480862 (bvsge #b00000000000000000000000000000000 (size!19876 a!3186)))))

(assert (=> d!99191 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!403445)))

(declare-fun b!718493 () Bool)

(assert (=> b!718493 (= e!403445 e!403446)))

(declare-fun c!79184 () Bool)

(assert (=> b!718493 (= c!79184 (validKeyInArray!0 (select (arr!19456 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!718494 () Bool)

(declare-fun e!403444 () Bool)

(assert (=> b!718494 (= e!403444 call!34740)))

(declare-fun b!718495 () Bool)

(assert (=> b!718495 (= e!403446 e!403444)))

(declare-fun lt!319422 () (_ BitVec 64))

(assert (=> b!718495 (= lt!319422 (select (arr!19456 a!3186) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!24639 0))(
  ( (Unit!24640) )
))
(declare-fun lt!319420 () Unit!24639)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!40660 (_ BitVec 64) (_ BitVec 32)) Unit!24639)

(assert (=> b!718495 (= lt!319420 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!319422 #b00000000000000000000000000000000))))

(assert (=> b!718495 (arrayContainsKey!0 a!3186 lt!319422 #b00000000000000000000000000000000)))

(declare-fun lt!319421 () Unit!24639)

(assert (=> b!718495 (= lt!319421 lt!319420)))

(declare-fun res!480861 () Bool)

(assert (=> b!718495 (= res!480861 (= (seekEntryOrOpen!0 (select (arr!19456 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7012 #b00000000000000000000000000000000)))))

(assert (=> b!718495 (=> (not res!480861) (not e!403444))))

(assert (= (and d!99191 (not res!480862)) b!718493))

(assert (= (and b!718493 c!79184) b!718495))

(assert (= (and b!718493 (not c!79184)) b!718492))

(assert (= (and b!718495 res!480861) b!718494))

(assert (= (or b!718494 b!718492) bm!34737))

(declare-fun m!674733 () Bool)

(assert (=> bm!34737 m!674733))

(assert (=> b!718493 m!674691))

(assert (=> b!718493 m!674691))

(assert (=> b!718493 m!674727))

(assert (=> b!718495 m!674691))

(declare-fun m!674735 () Bool)

(assert (=> b!718495 m!674735))

(declare-fun m!674737 () Bool)

(assert (=> b!718495 m!674737))

(assert (=> b!718495 m!674691))

(declare-fun m!674739 () Bool)

(assert (=> b!718495 m!674739))

(assert (=> b!718324 d!99191))

(check-sat (not bm!34734) (not b!718483) (not b!718482) (not b!718418) (not d!99153) (not b!718401) (not b!718479) (not b!718493) (not bm!34737) (not b!718495))
(check-sat)
