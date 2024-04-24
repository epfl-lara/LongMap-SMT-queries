; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65946 () Bool)

(assert start!65946)

(declare-fun b!758379 () Bool)

(declare-datatypes ((Unit!26197 0))(
  ( (Unit!26198) )
))
(declare-fun e!422902 () Unit!26197)

(declare-fun Unit!26199 () Unit!26197)

(assert (=> b!758379 (= e!422902 Unit!26199)))

(assert (=> b!758379 false))

(declare-fun b!758380 () Bool)

(declare-fun res!512740 () Bool)

(declare-fun e!422900 () Bool)

(assert (=> b!758380 (=> (not res!512740) (not e!422900))))

(declare-datatypes ((array!41989 0))(
  ( (array!41990 (arr!20104 (Array (_ BitVec 32) (_ BitVec 64))) (size!20524 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41989)

(declare-datatypes ((List!14013 0))(
  ( (Nil!14010) (Cons!14009 (h!15087 (_ BitVec 64)) (t!20320 List!14013)) )
))
(declare-fun arrayNoDuplicates!0 (array!41989 (_ BitVec 32) List!14013) Bool)

(assert (=> b!758380 (= res!512740 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14010))))

(declare-fun b!758381 () Bool)

(declare-fun res!512745 () Bool)

(declare-fun e!422897 () Bool)

(assert (=> b!758381 (=> (not res!512745) (not e!422897))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758381 (= res!512745 (validKeyInArray!0 (select (arr!20104 a!3186) j!159)))))

(declare-fun b!758382 () Bool)

(declare-fun e!422904 () Bool)

(assert (=> b!758382 (= e!422900 e!422904)))

(declare-fun res!512734 () Bool)

(assert (=> b!758382 (=> (not res!512734) (not e!422904))))

(declare-datatypes ((SeekEntryResult!7660 0))(
  ( (MissingZero!7660 (index!33008 (_ BitVec 32))) (Found!7660 (index!33009 (_ BitVec 32))) (Intermediate!7660 (undefined!8472 Bool) (index!33010 (_ BitVec 32)) (x!64062 (_ BitVec 32))) (Undefined!7660) (MissingVacant!7660 (index!33011 (_ BitVec 32))) )
))
(declare-fun lt!337734 () SeekEntryResult!7660)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41989 (_ BitVec 32)) SeekEntryResult!7660)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758382 (= res!512734 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20104 a!3186) j!159) mask!3328) (select (arr!20104 a!3186) j!159) a!3186 mask!3328) lt!337734))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!758382 (= lt!337734 (Intermediate!7660 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758383 () Bool)

(declare-fun res!512738 () Bool)

(assert (=> b!758383 (=> (not res!512738) (not e!422897))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758383 (= res!512738 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758384 () Bool)

(declare-fun e!422906 () Bool)

(declare-fun e!422907 () Bool)

(assert (=> b!758384 (= e!422906 (not e!422907))))

(declare-fun res!512750 () Bool)

(assert (=> b!758384 (=> res!512750 e!422907)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!337731 () SeekEntryResult!7660)

(get-info :version)

(assert (=> b!758384 (= res!512750 (or (not ((_ is Intermediate!7660) lt!337731)) (bvslt x!1131 (x!64062 lt!337731)) (not (= x!1131 (x!64062 lt!337731))) (not (= index!1321 (index!33010 lt!337731)))))))

(declare-fun e!422901 () Bool)

(assert (=> b!758384 e!422901))

(declare-fun res!512748 () Bool)

(assert (=> b!758384 (=> (not res!512748) (not e!422901))))

(declare-fun lt!337730 () SeekEntryResult!7660)

(declare-fun lt!337724 () SeekEntryResult!7660)

(assert (=> b!758384 (= res!512748 (= lt!337730 lt!337724))))

(assert (=> b!758384 (= lt!337724 (Found!7660 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41989 (_ BitVec 32)) SeekEntryResult!7660)

(assert (=> b!758384 (= lt!337730 (seekEntryOrOpen!0 (select (arr!20104 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41989 (_ BitVec 32)) Bool)

(assert (=> b!758384 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337733 () Unit!26197)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41989 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26197)

(assert (=> b!758384 (= lt!337733 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!758385 () Bool)

(declare-fun e!422896 () Bool)

(assert (=> b!758385 (= e!422896 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20104 a!3186) j!159) a!3186 mask!3328) lt!337734))))

(declare-fun b!758386 () Bool)

(declare-fun res!512739 () Bool)

(assert (=> b!758386 (=> (not res!512739) (not e!422897))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!758386 (= res!512739 (and (= (size!20524 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20524 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20524 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758388 () Bool)

(declare-fun res!512735 () Bool)

(assert (=> b!758388 (=> (not res!512735) (not e!422900))))

(assert (=> b!758388 (= res!512735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758389 () Bool)

(declare-fun Unit!26200 () Unit!26197)

(assert (=> b!758389 (= e!422902 Unit!26200)))

(declare-fun b!758390 () Bool)

(declare-fun res!512747 () Bool)

(assert (=> b!758390 (=> (not res!512747) (not e!422897))))

(assert (=> b!758390 (= res!512747 (validKeyInArray!0 k0!2102))))

(declare-fun b!758391 () Bool)

(declare-fun e!422905 () Bool)

(assert (=> b!758391 (= e!422907 e!422905)))

(declare-fun res!512736 () Bool)

(assert (=> b!758391 (=> res!512736 e!422905)))

(declare-fun lt!337725 () SeekEntryResult!7660)

(assert (=> b!758391 (= res!512736 (not (= lt!337725 lt!337724)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41989 (_ BitVec 32)) SeekEntryResult!7660)

(assert (=> b!758391 (= lt!337725 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20104 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758392 () Bool)

(assert (=> b!758392 (= e!422901 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20104 a!3186) j!159) a!3186 mask!3328) lt!337724))))

(declare-fun b!758393 () Bool)

(assert (=> b!758393 (= e!422904 e!422906)))

(declare-fun res!512742 () Bool)

(assert (=> b!758393 (=> (not res!512742) (not e!422906))))

(declare-fun lt!337727 () SeekEntryResult!7660)

(assert (=> b!758393 (= res!512742 (= lt!337727 lt!337731))))

(declare-fun lt!337728 () array!41989)

(declare-fun lt!337723 () (_ BitVec 64))

(assert (=> b!758393 (= lt!337731 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337723 lt!337728 mask!3328))))

(assert (=> b!758393 (= lt!337727 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337723 mask!3328) lt!337723 lt!337728 mask!3328))))

(assert (=> b!758393 (= lt!337723 (select (store (arr!20104 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!758393 (= lt!337728 (array!41990 (store (arr!20104 a!3186) i!1173 k0!2102) (size!20524 a!3186)))))

(declare-fun b!758394 () Bool)

(assert (=> b!758394 (= e!422897 e!422900)))

(declare-fun res!512746 () Bool)

(assert (=> b!758394 (=> (not res!512746) (not e!422900))))

(declare-fun lt!337729 () SeekEntryResult!7660)

(assert (=> b!758394 (= res!512746 (or (= lt!337729 (MissingZero!7660 i!1173)) (= lt!337729 (MissingVacant!7660 i!1173))))))

(assert (=> b!758394 (= lt!337729 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!758395 () Bool)

(assert (=> b!758395 (= e!422896 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20104 a!3186) j!159) a!3186 mask!3328) (Found!7660 j!159)))))

(declare-fun res!512749 () Bool)

(assert (=> start!65946 (=> (not res!512749) (not e!422897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65946 (= res!512749 (validMask!0 mask!3328))))

(assert (=> start!65946 e!422897))

(assert (=> start!65946 true))

(declare-fun array_inv!15963 (array!41989) Bool)

(assert (=> start!65946 (array_inv!15963 a!3186)))

(declare-fun b!758387 () Bool)

(declare-fun res!512752 () Bool)

(declare-fun e!422899 () Bool)

(assert (=> b!758387 (=> (not res!512752) (not e!422899))))

(assert (=> b!758387 (= res!512752 (= (seekEntryOrOpen!0 lt!337723 lt!337728 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337723 lt!337728 mask!3328)))))

(declare-fun b!758396 () Bool)

(assert (=> b!758396 (= e!422899 (= lt!337730 lt!337725))))

(declare-fun b!758397 () Bool)

(declare-fun res!512743 () Bool)

(assert (=> b!758397 (=> (not res!512743) (not e!422904))))

(assert (=> b!758397 (= res!512743 e!422896)))

(declare-fun c!83207 () Bool)

(assert (=> b!758397 (= c!83207 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758398 () Bool)

(declare-fun res!512751 () Bool)

(assert (=> b!758398 (=> (not res!512751) (not e!422900))))

(assert (=> b!758398 (= res!512751 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20524 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20524 a!3186))))))

(declare-fun b!758399 () Bool)

(declare-fun e!422898 () Bool)

(assert (=> b!758399 (= e!422905 e!422898)))

(declare-fun res!512737 () Bool)

(assert (=> b!758399 (=> res!512737 e!422898)))

(declare-fun lt!337726 () (_ BitVec 64))

(assert (=> b!758399 (= res!512737 (= lt!337726 lt!337723))))

(assert (=> b!758399 (= lt!337726 (select (store (arr!20104 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!758400 () Bool)

(declare-fun res!512744 () Bool)

(assert (=> b!758400 (=> (not res!512744) (not e!422904))))

(assert (=> b!758400 (= res!512744 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20104 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758401 () Bool)

(assert (=> b!758401 (= e!422898 true)))

(assert (=> b!758401 e!422899))

(declare-fun res!512741 () Bool)

(assert (=> b!758401 (=> (not res!512741) (not e!422899))))

(assert (=> b!758401 (= res!512741 (= lt!337726 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337732 () Unit!26197)

(assert (=> b!758401 (= lt!337732 e!422902)))

(declare-fun c!83206 () Bool)

(assert (=> b!758401 (= c!83206 (= lt!337726 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!65946 res!512749) b!758386))

(assert (= (and b!758386 res!512739) b!758381))

(assert (= (and b!758381 res!512745) b!758390))

(assert (= (and b!758390 res!512747) b!758383))

(assert (= (and b!758383 res!512738) b!758394))

(assert (= (and b!758394 res!512746) b!758388))

(assert (= (and b!758388 res!512735) b!758380))

(assert (= (and b!758380 res!512740) b!758398))

(assert (= (and b!758398 res!512751) b!758382))

(assert (= (and b!758382 res!512734) b!758400))

(assert (= (and b!758400 res!512744) b!758397))

(assert (= (and b!758397 c!83207) b!758385))

(assert (= (and b!758397 (not c!83207)) b!758395))

(assert (= (and b!758397 res!512743) b!758393))

(assert (= (and b!758393 res!512742) b!758384))

(assert (= (and b!758384 res!512748) b!758392))

(assert (= (and b!758384 (not res!512750)) b!758391))

(assert (= (and b!758391 (not res!512736)) b!758399))

(assert (= (and b!758399 (not res!512737)) b!758401))

(assert (= (and b!758401 c!83206) b!758379))

(assert (= (and b!758401 (not c!83206)) b!758389))

(assert (= (and b!758401 res!512741) b!758387))

(assert (= (and b!758387 res!512752) b!758396))

(declare-fun m!706455 () Bool)

(assert (=> b!758392 m!706455))

(assert (=> b!758392 m!706455))

(declare-fun m!706457 () Bool)

(assert (=> b!758392 m!706457))

(assert (=> b!758382 m!706455))

(assert (=> b!758382 m!706455))

(declare-fun m!706459 () Bool)

(assert (=> b!758382 m!706459))

(assert (=> b!758382 m!706459))

(assert (=> b!758382 m!706455))

(declare-fun m!706461 () Bool)

(assert (=> b!758382 m!706461))

(assert (=> b!758395 m!706455))

(assert (=> b!758395 m!706455))

(declare-fun m!706463 () Bool)

(assert (=> b!758395 m!706463))

(declare-fun m!706465 () Bool)

(assert (=> start!65946 m!706465))

(declare-fun m!706467 () Bool)

(assert (=> start!65946 m!706467))

(declare-fun m!706469 () Bool)

(assert (=> b!758387 m!706469))

(declare-fun m!706471 () Bool)

(assert (=> b!758387 m!706471))

(assert (=> b!758385 m!706455))

(assert (=> b!758385 m!706455))

(declare-fun m!706473 () Bool)

(assert (=> b!758385 m!706473))

(assert (=> b!758384 m!706455))

(assert (=> b!758384 m!706455))

(declare-fun m!706475 () Bool)

(assert (=> b!758384 m!706475))

(declare-fun m!706477 () Bool)

(assert (=> b!758384 m!706477))

(declare-fun m!706479 () Bool)

(assert (=> b!758384 m!706479))

(declare-fun m!706481 () Bool)

(assert (=> b!758390 m!706481))

(declare-fun m!706483 () Bool)

(assert (=> b!758399 m!706483))

(declare-fun m!706485 () Bool)

(assert (=> b!758399 m!706485))

(declare-fun m!706487 () Bool)

(assert (=> b!758388 m!706487))

(declare-fun m!706489 () Bool)

(assert (=> b!758394 m!706489))

(declare-fun m!706491 () Bool)

(assert (=> b!758393 m!706491))

(declare-fun m!706493 () Bool)

(assert (=> b!758393 m!706493))

(assert (=> b!758393 m!706483))

(declare-fun m!706495 () Bool)

(assert (=> b!758393 m!706495))

(assert (=> b!758393 m!706491))

(declare-fun m!706497 () Bool)

(assert (=> b!758393 m!706497))

(declare-fun m!706499 () Bool)

(assert (=> b!758383 m!706499))

(declare-fun m!706501 () Bool)

(assert (=> b!758400 m!706501))

(assert (=> b!758391 m!706455))

(assert (=> b!758391 m!706455))

(assert (=> b!758391 m!706463))

(assert (=> b!758381 m!706455))

(assert (=> b!758381 m!706455))

(declare-fun m!706503 () Bool)

(assert (=> b!758381 m!706503))

(declare-fun m!706505 () Bool)

(assert (=> b!758380 m!706505))

(check-sat (not b!758393) (not b!758381) (not b!758390) (not b!758380) (not b!758382) (not b!758395) (not b!758392) (not start!65946) (not b!758394) (not b!758385) (not b!758387) (not b!758388) (not b!758384) (not b!758383) (not b!758391))
(check-sat)
