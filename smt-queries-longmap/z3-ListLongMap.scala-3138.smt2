; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44204 () Bool)

(assert start!44204)

(declare-fun b!486480 () Bool)

(declare-fun res!289945 () Bool)

(declare-fun e!286341 () Bool)

(assert (=> b!486480 (=> (not res!289945) (not e!286341))))

(declare-datatypes ((array!31500 0))(
  ( (array!31501 (arr!15145 (Array (_ BitVec 32) (_ BitVec 64))) (size!15509 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31500)

(assert (=> b!486480 (= res!289945 (and (bvsle #b00000000000000000000000000000000 (size!15509 a!3235)) (bvslt (size!15509 a!3235) #b01111111111111111111111111111111)))))

(declare-fun b!486481 () Bool)

(declare-fun res!289941 () Bool)

(declare-fun e!286342 () Bool)

(assert (=> b!486481 (=> (not res!289941) (not e!286342))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!486481 (= res!289941 (validKeyInArray!0 k0!2280))))

(declare-fun b!486482 () Bool)

(declare-fun res!289942 () Bool)

(assert (=> b!486482 (=> (not res!289942) (not e!286342))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!486482 (= res!289942 (validKeyInArray!0 (select (arr!15145 a!3235) j!176)))))

(declare-fun b!486483 () Bool)

(declare-fun res!289940 () Bool)

(assert (=> b!486483 (=> (not res!289940) (not e!286342))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!486483 (= res!289940 (and (= (size!15509 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15509 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15509 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!486484 () Bool)

(declare-fun res!289946 () Bool)

(assert (=> b!486484 (=> (not res!289946) (not e!286341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31500 (_ BitVec 32)) Bool)

(assert (=> b!486484 (= res!289946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!289944 () Bool)

(assert (=> start!44204 (=> (not res!289944) (not e!286342))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44204 (= res!289944 (validMask!0 mask!3524))))

(assert (=> start!44204 e!286342))

(assert (=> start!44204 true))

(declare-fun array_inv!10941 (array!31500) Bool)

(assert (=> start!44204 (array_inv!10941 a!3235)))

(declare-fun b!486479 () Bool)

(declare-fun e!286343 () Bool)

(declare-datatypes ((List!9303 0))(
  ( (Nil!9300) (Cons!9299 (h!10155 (_ BitVec 64)) (t!15531 List!9303)) )
))
(declare-fun contains!2697 (List!9303 (_ BitVec 64)) Bool)

(assert (=> b!486479 (= e!286343 (contains!2697 Nil!9300 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!486485 () Bool)

(assert (=> b!486485 (= e!286342 e!286341)))

(declare-fun res!289938 () Bool)

(assert (=> b!486485 (=> (not res!289938) (not e!286341))))

(declare-datatypes ((SeekEntryResult!3612 0))(
  ( (MissingZero!3612 (index!16627 (_ BitVec 32))) (Found!3612 (index!16628 (_ BitVec 32))) (Intermediate!3612 (undefined!4424 Bool) (index!16629 (_ BitVec 32)) (x!45760 (_ BitVec 32))) (Undefined!3612) (MissingVacant!3612 (index!16630 (_ BitVec 32))) )
))
(declare-fun lt!219751 () SeekEntryResult!3612)

(assert (=> b!486485 (= res!289938 (or (= lt!219751 (MissingZero!3612 i!1204)) (= lt!219751 (MissingVacant!3612 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31500 (_ BitVec 32)) SeekEntryResult!3612)

(assert (=> b!486485 (= lt!219751 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!486486 () Bool)

(declare-fun res!289939 () Bool)

(assert (=> b!486486 (=> (not res!289939) (not e!286341))))

(declare-fun noDuplicate!211 (List!9303) Bool)

(assert (=> b!486486 (= res!289939 (noDuplicate!211 Nil!9300))))

(declare-fun b!486487 () Bool)

(declare-fun res!289937 () Bool)

(assert (=> b!486487 (=> (not res!289937) (not e!286342))))

(declare-fun arrayContainsKey!0 (array!31500 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!486487 (= res!289937 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!486488 () Bool)

(assert (=> b!486488 (= e!286341 e!286343)))

(declare-fun res!289943 () Bool)

(assert (=> b!486488 (=> res!289943 e!286343)))

(assert (=> b!486488 (= res!289943 (contains!2697 Nil!9300 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!44204 res!289944) b!486483))

(assert (= (and b!486483 res!289940) b!486482))

(assert (= (and b!486482 res!289942) b!486481))

(assert (= (and b!486481 res!289941) b!486487))

(assert (= (and b!486487 res!289937) b!486485))

(assert (= (and b!486485 res!289938) b!486484))

(assert (= (and b!486484 res!289946) b!486480))

(assert (= (and b!486480 res!289945) b!486486))

(assert (= (and b!486486 res!289939) b!486488))

(assert (= (and b!486488 (not res!289943)) b!486479))

(declare-fun m!466417 () Bool)

(assert (=> b!486488 m!466417))

(declare-fun m!466419 () Bool)

(assert (=> b!486482 m!466419))

(assert (=> b!486482 m!466419))

(declare-fun m!466421 () Bool)

(assert (=> b!486482 m!466421))

(declare-fun m!466423 () Bool)

(assert (=> b!486487 m!466423))

(declare-fun m!466425 () Bool)

(assert (=> b!486486 m!466425))

(declare-fun m!466427 () Bool)

(assert (=> start!44204 m!466427))

(declare-fun m!466429 () Bool)

(assert (=> start!44204 m!466429))

(declare-fun m!466431 () Bool)

(assert (=> b!486484 m!466431))

(declare-fun m!466433 () Bool)

(assert (=> b!486481 m!466433))

(declare-fun m!466435 () Bool)

(assert (=> b!486485 m!466435))

(declare-fun m!466437 () Bool)

(assert (=> b!486479 m!466437))

(check-sat (not b!486486) (not b!486481) (not b!486484) (not b!486482) (not b!486487) (not b!486488) (not b!486479) (not b!486485) (not start!44204))
(check-sat)
(get-model)

(declare-fun b!486591 () Bool)

(declare-fun e!286422 () Bool)

(declare-fun e!286423 () Bool)

(assert (=> b!486591 (= e!286422 e!286423)))

(declare-fun c!58547 () Bool)

(assert (=> b!486591 (= c!58547 (validKeyInArray!0 (select (arr!15145 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!486592 () Bool)

(declare-fun e!286421 () Bool)

(assert (=> b!486592 (= e!286423 e!286421)))

(declare-fun lt!219787 () (_ BitVec 64))

(assert (=> b!486592 (= lt!219787 (select (arr!15145 a!3235) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14202 0))(
  ( (Unit!14203) )
))
(declare-fun lt!219788 () Unit!14202)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31500 (_ BitVec 64) (_ BitVec 32)) Unit!14202)

(assert (=> b!486592 (= lt!219788 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!219787 #b00000000000000000000000000000000))))

(assert (=> b!486592 (arrayContainsKey!0 a!3235 lt!219787 #b00000000000000000000000000000000)))

(declare-fun lt!219789 () Unit!14202)

(assert (=> b!486592 (= lt!219789 lt!219788)))

(declare-fun res!290033 () Bool)

(assert (=> b!486592 (= res!290033 (= (seekEntryOrOpen!0 (select (arr!15145 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3612 #b00000000000000000000000000000000)))))

(assert (=> b!486592 (=> (not res!290033) (not e!286421))))

(declare-fun b!486593 () Bool)

(declare-fun call!31283 () Bool)

(assert (=> b!486593 (= e!286423 call!31283)))

(declare-fun bm!31280 () Bool)

(assert (=> bm!31280 (= call!31283 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!486594 () Bool)

(assert (=> b!486594 (= e!286421 call!31283)))

(declare-fun d!77559 () Bool)

(declare-fun res!290034 () Bool)

(assert (=> d!77559 (=> res!290034 e!286422)))

(assert (=> d!77559 (= res!290034 (bvsge #b00000000000000000000000000000000 (size!15509 a!3235)))))

(assert (=> d!77559 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!286422)))

(assert (= (and d!77559 (not res!290034)) b!486591))

(assert (= (and b!486591 c!58547) b!486592))

(assert (= (and b!486591 (not c!58547)) b!486593))

(assert (= (and b!486592 res!290033) b!486594))

(assert (= (or b!486594 b!486593) bm!31280))

(declare-fun m!466517 () Bool)

(assert (=> b!486591 m!466517))

(assert (=> b!486591 m!466517))

(declare-fun m!466519 () Bool)

(assert (=> b!486591 m!466519))

(assert (=> b!486592 m!466517))

(declare-fun m!466521 () Bool)

(assert (=> b!486592 m!466521))

(declare-fun m!466523 () Bool)

(assert (=> b!486592 m!466523))

(assert (=> b!486592 m!466517))

(declare-fun m!466525 () Bool)

(assert (=> b!486592 m!466525))

(declare-fun m!466527 () Bool)

(assert (=> bm!31280 m!466527))

(assert (=> b!486484 d!77559))

(declare-fun d!77581 () Bool)

(declare-fun lt!219792 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!221 (List!9303) (InoxSet (_ BitVec 64)))

(assert (=> d!77581 (= lt!219792 (select (content!221 Nil!9300) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!286429 () Bool)

(assert (=> d!77581 (= lt!219792 e!286429)))

(declare-fun res!290039 () Bool)

(assert (=> d!77581 (=> (not res!290039) (not e!286429))))

(get-info :version)

(assert (=> d!77581 (= res!290039 ((_ is Cons!9299) Nil!9300))))

(assert (=> d!77581 (= (contains!2697 Nil!9300 #b1000000000000000000000000000000000000000000000000000000000000000) lt!219792)))

(declare-fun b!486599 () Bool)

(declare-fun e!286428 () Bool)

(assert (=> b!486599 (= e!286429 e!286428)))

(declare-fun res!290040 () Bool)

(assert (=> b!486599 (=> res!290040 e!286428)))

(assert (=> b!486599 (= res!290040 (= (h!10155 Nil!9300) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!486600 () Bool)

(assert (=> b!486600 (= e!286428 (contains!2697 (t!15531 Nil!9300) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!77581 res!290039) b!486599))

(assert (= (and b!486599 (not res!290040)) b!486600))

(declare-fun m!466529 () Bool)

(assert (=> d!77581 m!466529))

(declare-fun m!466531 () Bool)

(assert (=> d!77581 m!466531))

(declare-fun m!466533 () Bool)

(assert (=> b!486600 m!466533))

(assert (=> b!486479 d!77581))

(declare-fun b!486643 () Bool)

(declare-fun e!286452 () SeekEntryResult!3612)

(assert (=> b!486643 (= e!286452 Undefined!3612)))

(declare-fun b!486644 () Bool)

(declare-fun e!286453 () SeekEntryResult!3612)

(declare-fun lt!219816 () SeekEntryResult!3612)

(assert (=> b!486644 (= e!286453 (MissingZero!3612 (index!16629 lt!219816)))))

(declare-fun b!486646 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31500 (_ BitVec 32)) SeekEntryResult!3612)

(assert (=> b!486646 (= e!286453 (seekKeyOrZeroReturnVacant!0 (x!45760 lt!219816) (index!16629 lt!219816) (index!16629 lt!219816) k0!2280 a!3235 mask!3524))))

(declare-fun b!486645 () Bool)

(declare-fun e!286451 () SeekEntryResult!3612)

(assert (=> b!486645 (= e!286451 (Found!3612 (index!16629 lt!219816)))))

(declare-fun d!77583 () Bool)

(declare-fun lt!219814 () SeekEntryResult!3612)

(assert (=> d!77583 (and (or ((_ is Undefined!3612) lt!219814) (not ((_ is Found!3612) lt!219814)) (and (bvsge (index!16628 lt!219814) #b00000000000000000000000000000000) (bvslt (index!16628 lt!219814) (size!15509 a!3235)))) (or ((_ is Undefined!3612) lt!219814) ((_ is Found!3612) lt!219814) (not ((_ is MissingZero!3612) lt!219814)) (and (bvsge (index!16627 lt!219814) #b00000000000000000000000000000000) (bvslt (index!16627 lt!219814) (size!15509 a!3235)))) (or ((_ is Undefined!3612) lt!219814) ((_ is Found!3612) lt!219814) ((_ is MissingZero!3612) lt!219814) (not ((_ is MissingVacant!3612) lt!219814)) (and (bvsge (index!16630 lt!219814) #b00000000000000000000000000000000) (bvslt (index!16630 lt!219814) (size!15509 a!3235)))) (or ((_ is Undefined!3612) lt!219814) (ite ((_ is Found!3612) lt!219814) (= (select (arr!15145 a!3235) (index!16628 lt!219814)) k0!2280) (ite ((_ is MissingZero!3612) lt!219814) (= (select (arr!15145 a!3235) (index!16627 lt!219814)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3612) lt!219814) (= (select (arr!15145 a!3235) (index!16630 lt!219814)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!77583 (= lt!219814 e!286452)))

(declare-fun c!58570 () Bool)

(assert (=> d!77583 (= c!58570 (and ((_ is Intermediate!3612) lt!219816) (undefined!4424 lt!219816)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31500 (_ BitVec 32)) SeekEntryResult!3612)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77583 (= lt!219816 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77583 (validMask!0 mask!3524)))

(assert (=> d!77583 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!219814)))

(declare-fun b!486647 () Bool)

(declare-fun c!58571 () Bool)

(declare-fun lt!219815 () (_ BitVec 64))

(assert (=> b!486647 (= c!58571 (= lt!219815 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!486647 (= e!286451 e!286453)))

(declare-fun b!486648 () Bool)

(assert (=> b!486648 (= e!286452 e!286451)))

(assert (=> b!486648 (= lt!219815 (select (arr!15145 a!3235) (index!16629 lt!219816)))))

(declare-fun c!58569 () Bool)

(assert (=> b!486648 (= c!58569 (= lt!219815 k0!2280))))

(assert (= (and d!77583 c!58570) b!486643))

(assert (= (and d!77583 (not c!58570)) b!486648))

(assert (= (and b!486648 c!58569) b!486645))

(assert (= (and b!486648 (not c!58569)) b!486647))

(assert (= (and b!486647 c!58571) b!486644))

(assert (= (and b!486647 (not c!58571)) b!486646))

(declare-fun m!466549 () Bool)

(assert (=> b!486646 m!466549))

(declare-fun m!466551 () Bool)

(assert (=> d!77583 m!466551))

(declare-fun m!466553 () Bool)

(assert (=> d!77583 m!466553))

(declare-fun m!466555 () Bool)

(assert (=> d!77583 m!466555))

(assert (=> d!77583 m!466555))

(declare-fun m!466557 () Bool)

(assert (=> d!77583 m!466557))

(declare-fun m!466559 () Bool)

(assert (=> d!77583 m!466559))

(assert (=> d!77583 m!466427))

(declare-fun m!466561 () Bool)

(assert (=> b!486648 m!466561))

(assert (=> b!486485 d!77583))

(declare-fun d!77593 () Bool)

(declare-fun res!290045 () Bool)

(declare-fun e!286461 () Bool)

(assert (=> d!77593 (=> res!290045 e!286461)))

(assert (=> d!77593 (= res!290045 ((_ is Nil!9300) Nil!9300))))

(assert (=> d!77593 (= (noDuplicate!211 Nil!9300) e!286461)))

(declare-fun b!486659 () Bool)

(declare-fun e!286462 () Bool)

(assert (=> b!486659 (= e!286461 e!286462)))

(declare-fun res!290046 () Bool)

(assert (=> b!486659 (=> (not res!290046) (not e!286462))))

(assert (=> b!486659 (= res!290046 (not (contains!2697 (t!15531 Nil!9300) (h!10155 Nil!9300))))))

(declare-fun b!486660 () Bool)

(assert (=> b!486660 (= e!286462 (noDuplicate!211 (t!15531 Nil!9300)))))

(assert (= (and d!77593 (not res!290045)) b!486659))

(assert (= (and b!486659 res!290046) b!486660))

(declare-fun m!466577 () Bool)

(assert (=> b!486659 m!466577))

(declare-fun m!466579 () Bool)

(assert (=> b!486660 m!466579))

(assert (=> b!486486 d!77593))

(declare-fun d!77599 () Bool)

(assert (=> d!77599 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!486481 d!77599))

(declare-fun d!77601 () Bool)

(declare-fun res!290051 () Bool)

(declare-fun e!286467 () Bool)

(assert (=> d!77601 (=> res!290051 e!286467)))

(assert (=> d!77601 (= res!290051 (= (select (arr!15145 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77601 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!286467)))

(declare-fun b!486665 () Bool)

(declare-fun e!286468 () Bool)

(assert (=> b!486665 (= e!286467 e!286468)))

(declare-fun res!290052 () Bool)

(assert (=> b!486665 (=> (not res!290052) (not e!286468))))

(assert (=> b!486665 (= res!290052 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15509 a!3235)))))

(declare-fun b!486666 () Bool)

(assert (=> b!486666 (= e!286468 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77601 (not res!290051)) b!486665))

(assert (= (and b!486665 res!290052) b!486666))

(assert (=> d!77601 m!466517))

(declare-fun m!466581 () Bool)

(assert (=> b!486666 m!466581))

(assert (=> b!486487 d!77601))

(declare-fun d!77603 () Bool)

(assert (=> d!77603 (= (validKeyInArray!0 (select (arr!15145 a!3235) j!176)) (and (not (= (select (arr!15145 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15145 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!486482 d!77603))

(declare-fun d!77605 () Bool)

(assert (=> d!77605 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44204 d!77605))

(declare-fun d!77607 () Bool)

(assert (=> d!77607 (= (array_inv!10941 a!3235) (bvsge (size!15509 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44204 d!77607))

(declare-fun d!77609 () Bool)

(declare-fun lt!219820 () Bool)

(assert (=> d!77609 (= lt!219820 (select (content!221 Nil!9300) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!286470 () Bool)

(assert (=> d!77609 (= lt!219820 e!286470)))

(declare-fun res!290053 () Bool)

(assert (=> d!77609 (=> (not res!290053) (not e!286470))))

(assert (=> d!77609 (= res!290053 ((_ is Cons!9299) Nil!9300))))

(assert (=> d!77609 (= (contains!2697 Nil!9300 #b0000000000000000000000000000000000000000000000000000000000000000) lt!219820)))

(declare-fun b!486667 () Bool)

(declare-fun e!286469 () Bool)

(assert (=> b!486667 (= e!286470 e!286469)))

(declare-fun res!290054 () Bool)

(assert (=> b!486667 (=> res!290054 e!286469)))

(assert (=> b!486667 (= res!290054 (= (h!10155 Nil!9300) #b0000000000000000000000000000000000000000000000000000000000000000))))

