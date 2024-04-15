; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65642 () Bool)

(assert start!65642)

(declare-datatypes ((array!41832 0))(
  ( (array!41833 (arr!20030 (Array (_ BitVec 32) (_ BitVec 64))) (size!20451 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41832)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!419465 () Bool)

(declare-fun b!752002 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7627 0))(
  ( (MissingZero!7627 (index!32876 (_ BitVec 32))) (Found!7627 (index!32877 (_ BitVec 32))) (Intermediate!7627 (undefined!8439 Bool) (index!32878 (_ BitVec 32)) (x!63804 (_ BitVec 32))) (Undefined!7627) (MissingVacant!7627 (index!32879 (_ BitVec 32))) )
))
(declare-fun lt!334373 () SeekEntryResult!7627)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41832 (_ BitVec 32)) SeekEntryResult!7627)

(assert (=> b!752002 (= e!419465 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20030 a!3186) j!159) a!3186 mask!3328) lt!334373))))

(declare-fun b!752003 () Bool)

(declare-fun e!419463 () Bool)

(declare-fun e!419456 () Bool)

(assert (=> b!752003 (= e!419463 e!419456)))

(declare-fun res!507890 () Bool)

(assert (=> b!752003 (=> (not res!507890) (not e!419456))))

(declare-fun lt!334370 () SeekEntryResult!7627)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!752003 (= res!507890 (or (= lt!334370 (MissingZero!7627 i!1173)) (= lt!334370 (MissingVacant!7627 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41832 (_ BitVec 32)) SeekEntryResult!7627)

(assert (=> b!752003 (= lt!334370 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!752004 () Bool)

(declare-fun res!507882 () Bool)

(declare-fun e!419458 () Bool)

(assert (=> b!752004 (=> (not res!507882) (not e!419458))))

(assert (=> b!752004 (= res!507882 e!419465)))

(declare-fun c!82446 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!752004 (= c!82446 (bvsle x!1131 resIntermediateX!5))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!419466 () Bool)

(declare-fun lt!334365 () SeekEntryResult!7627)

(declare-fun b!752005 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41832 (_ BitVec 32)) SeekEntryResult!7627)

(assert (=> b!752005 (= e!419466 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20030 a!3186) j!159) a!3186 mask!3328) lt!334365))))

(declare-fun b!752006 () Bool)

(declare-fun e!419464 () Bool)

(assert (=> b!752006 (= e!419458 e!419464)))

(declare-fun res!507886 () Bool)

(assert (=> b!752006 (=> (not res!507886) (not e!419464))))

(declare-fun lt!334371 () SeekEntryResult!7627)

(declare-fun lt!334366 () SeekEntryResult!7627)

(assert (=> b!752006 (= res!507886 (= lt!334371 lt!334366))))

(declare-fun lt!334362 () array!41832)

(declare-fun lt!334372 () (_ BitVec 64))

(assert (=> b!752006 (= lt!334366 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334372 lt!334362 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752006 (= lt!334371 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334372 mask!3328) lt!334372 lt!334362 mask!3328))))

(assert (=> b!752006 (= lt!334372 (select (store (arr!20030 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!752006 (= lt!334362 (array!41833 (store (arr!20030 a!3186) i!1173 k0!2102) (size!20451 a!3186)))))

(declare-fun b!752007 () Bool)

(declare-fun res!507881 () Bool)

(assert (=> b!752007 (=> (not res!507881) (not e!419463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752007 (= res!507881 (validKeyInArray!0 (select (arr!20030 a!3186) j!159)))))

(declare-fun b!752008 () Bool)

(declare-fun e!419467 () Bool)

(assert (=> b!752008 (= e!419464 (not e!419467))))

(declare-fun res!507878 () Bool)

(assert (=> b!752008 (=> res!507878 e!419467)))

(get-info :version)

(assert (=> b!752008 (= res!507878 (or (not ((_ is Intermediate!7627) lt!334366)) (bvslt x!1131 (x!63804 lt!334366)) (not (= x!1131 (x!63804 lt!334366))) (not (= index!1321 (index!32878 lt!334366)))))))

(assert (=> b!752008 e!419466))

(declare-fun res!507875 () Bool)

(assert (=> b!752008 (=> (not res!507875) (not e!419466))))

(declare-fun lt!334369 () SeekEntryResult!7627)

(assert (=> b!752008 (= res!507875 (= lt!334369 lt!334365))))

(assert (=> b!752008 (= lt!334365 (Found!7627 j!159))))

(assert (=> b!752008 (= lt!334369 (seekEntryOrOpen!0 (select (arr!20030 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41832 (_ BitVec 32)) Bool)

(assert (=> b!752008 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25868 0))(
  ( (Unit!25869) )
))
(declare-fun lt!334364 () Unit!25868)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41832 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25868)

(assert (=> b!752008 (= lt!334364 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!752009 () Bool)

(declare-fun e!419460 () Unit!25868)

(declare-fun Unit!25870 () Unit!25868)

(assert (=> b!752009 (= e!419460 Unit!25870)))

(declare-fun b!752010 () Bool)

(assert (=> b!752010 (= e!419465 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20030 a!3186) j!159) a!3186 mask!3328) (Found!7627 j!159)))))

(declare-fun b!752011 () Bool)

(declare-fun e!419461 () Bool)

(assert (=> b!752011 (= e!419467 e!419461)))

(declare-fun res!507873 () Bool)

(assert (=> b!752011 (=> res!507873 e!419461)))

(declare-fun lt!334367 () SeekEntryResult!7627)

(assert (=> b!752011 (= res!507873 (not (= lt!334367 lt!334365)))))

(assert (=> b!752011 (= lt!334367 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20030 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!752012 () Bool)

(declare-fun e!419462 () Bool)

(assert (=> b!752012 (= e!419461 e!419462)))

(declare-fun res!507880 () Bool)

(assert (=> b!752012 (=> res!507880 e!419462)))

(declare-fun lt!334368 () (_ BitVec 64))

(assert (=> b!752012 (= res!507880 (= lt!334368 lt!334372))))

(assert (=> b!752012 (= lt!334368 (select (store (arr!20030 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!752013 () Bool)

(declare-fun res!507876 () Bool)

(assert (=> b!752013 (=> (not res!507876) (not e!419463))))

(assert (=> b!752013 (= res!507876 (validKeyInArray!0 k0!2102))))

(declare-fun b!752014 () Bool)

(declare-fun res!507884 () Bool)

(assert (=> b!752014 (=> (not res!507884) (not e!419458))))

(assert (=> b!752014 (= res!507884 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20030 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752015 () Bool)

(declare-fun res!507885 () Bool)

(assert (=> b!752015 (=> (not res!507885) (not e!419463))))

(assert (=> b!752015 (= res!507885 (and (= (size!20451 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20451 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20451 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752016 () Bool)

(assert (=> b!752016 (= e!419456 e!419458)))

(declare-fun res!507877 () Bool)

(assert (=> b!752016 (=> (not res!507877) (not e!419458))))

(assert (=> b!752016 (= res!507877 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20030 a!3186) j!159) mask!3328) (select (arr!20030 a!3186) j!159) a!3186 mask!3328) lt!334373))))

(assert (=> b!752016 (= lt!334373 (Intermediate!7627 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752018 () Bool)

(declare-fun Unit!25871 () Unit!25868)

(assert (=> b!752018 (= e!419460 Unit!25871)))

(assert (=> b!752018 false))

(declare-fun res!507891 () Bool)

(assert (=> start!65642 (=> (not res!507891) (not e!419463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65642 (= res!507891 (validMask!0 mask!3328))))

(assert (=> start!65642 e!419463))

(assert (=> start!65642 true))

(declare-fun array_inv!15913 (array!41832) Bool)

(assert (=> start!65642 (array_inv!15913 a!3186)))

(declare-fun b!752017 () Bool)

(declare-fun res!507887 () Bool)

(assert (=> b!752017 (=> (not res!507887) (not e!419456))))

(assert (=> b!752017 (= res!507887 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20451 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20451 a!3186))))))

(declare-fun b!752019 () Bool)

(declare-fun res!507883 () Bool)

(assert (=> b!752019 (=> (not res!507883) (not e!419456))))

(assert (=> b!752019 (= res!507883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752020 () Bool)

(declare-fun e!419459 () Bool)

(assert (=> b!752020 (= e!419459 (= lt!334369 lt!334367))))

(declare-fun b!752021 () Bool)

(declare-fun res!507888 () Bool)

(assert (=> b!752021 (=> (not res!507888) (not e!419463))))

(declare-fun arrayContainsKey!0 (array!41832 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752021 (= res!507888 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!752022 () Bool)

(assert (=> b!752022 (= e!419462 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!752022 e!419459))

(declare-fun res!507879 () Bool)

(assert (=> b!752022 (=> (not res!507879) (not e!419459))))

(assert (=> b!752022 (= res!507879 (= lt!334368 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334363 () Unit!25868)

(assert (=> b!752022 (= lt!334363 e!419460)))

(declare-fun c!82445 () Bool)

(assert (=> b!752022 (= c!82445 (= lt!334368 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752023 () Bool)

(declare-fun res!507874 () Bool)

(assert (=> b!752023 (=> (not res!507874) (not e!419456))))

(declare-datatypes ((List!14071 0))(
  ( (Nil!14068) (Cons!14067 (h!15139 (_ BitVec 64)) (t!20377 List!14071)) )
))
(declare-fun arrayNoDuplicates!0 (array!41832 (_ BitVec 32) List!14071) Bool)

(assert (=> b!752023 (= res!507874 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14068))))

(declare-fun b!752024 () Bool)

(declare-fun res!507889 () Bool)

(assert (=> b!752024 (=> (not res!507889) (not e!419459))))

(assert (=> b!752024 (= res!507889 (= (seekEntryOrOpen!0 lt!334372 lt!334362 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334372 lt!334362 mask!3328)))))

(assert (= (and start!65642 res!507891) b!752015))

(assert (= (and b!752015 res!507885) b!752007))

(assert (= (and b!752007 res!507881) b!752013))

(assert (= (and b!752013 res!507876) b!752021))

(assert (= (and b!752021 res!507888) b!752003))

(assert (= (and b!752003 res!507890) b!752019))

(assert (= (and b!752019 res!507883) b!752023))

(assert (= (and b!752023 res!507874) b!752017))

(assert (= (and b!752017 res!507887) b!752016))

(assert (= (and b!752016 res!507877) b!752014))

(assert (= (and b!752014 res!507884) b!752004))

(assert (= (and b!752004 c!82446) b!752002))

(assert (= (and b!752004 (not c!82446)) b!752010))

(assert (= (and b!752004 res!507882) b!752006))

(assert (= (and b!752006 res!507886) b!752008))

(assert (= (and b!752008 res!507875) b!752005))

(assert (= (and b!752008 (not res!507878)) b!752011))

(assert (= (and b!752011 (not res!507873)) b!752012))

(assert (= (and b!752012 (not res!507880)) b!752022))

(assert (= (and b!752022 c!82445) b!752018))

(assert (= (and b!752022 (not c!82445)) b!752009))

(assert (= (and b!752022 res!507879) b!752024))

(assert (= (and b!752024 res!507889) b!752020))

(declare-fun m!700481 () Bool)

(assert (=> start!65642 m!700481))

(declare-fun m!700483 () Bool)

(assert (=> start!65642 m!700483))

(declare-fun m!700485 () Bool)

(assert (=> b!752011 m!700485))

(assert (=> b!752011 m!700485))

(declare-fun m!700487 () Bool)

(assert (=> b!752011 m!700487))

(declare-fun m!700489 () Bool)

(assert (=> b!752006 m!700489))

(declare-fun m!700491 () Bool)

(assert (=> b!752006 m!700491))

(declare-fun m!700493 () Bool)

(assert (=> b!752006 m!700493))

(assert (=> b!752006 m!700489))

(declare-fun m!700495 () Bool)

(assert (=> b!752006 m!700495))

(declare-fun m!700497 () Bool)

(assert (=> b!752006 m!700497))

(declare-fun m!700499 () Bool)

(assert (=> b!752013 m!700499))

(declare-fun m!700501 () Bool)

(assert (=> b!752014 m!700501))

(assert (=> b!752010 m!700485))

(assert (=> b!752010 m!700485))

(assert (=> b!752010 m!700487))

(assert (=> b!752002 m!700485))

(assert (=> b!752002 m!700485))

(declare-fun m!700503 () Bool)

(assert (=> b!752002 m!700503))

(assert (=> b!752007 m!700485))

(assert (=> b!752007 m!700485))

(declare-fun m!700505 () Bool)

(assert (=> b!752007 m!700505))

(declare-fun m!700507 () Bool)

(assert (=> b!752023 m!700507))

(assert (=> b!752016 m!700485))

(assert (=> b!752016 m!700485))

(declare-fun m!700509 () Bool)

(assert (=> b!752016 m!700509))

(assert (=> b!752016 m!700509))

(assert (=> b!752016 m!700485))

(declare-fun m!700511 () Bool)

(assert (=> b!752016 m!700511))

(declare-fun m!700513 () Bool)

(assert (=> b!752021 m!700513))

(assert (=> b!752008 m!700485))

(assert (=> b!752008 m!700485))

(declare-fun m!700515 () Bool)

(assert (=> b!752008 m!700515))

(declare-fun m!700517 () Bool)

(assert (=> b!752008 m!700517))

(declare-fun m!700519 () Bool)

(assert (=> b!752008 m!700519))

(assert (=> b!752005 m!700485))

(assert (=> b!752005 m!700485))

(declare-fun m!700521 () Bool)

(assert (=> b!752005 m!700521))

(declare-fun m!700523 () Bool)

(assert (=> b!752024 m!700523))

(declare-fun m!700525 () Bool)

(assert (=> b!752024 m!700525))

(declare-fun m!700527 () Bool)

(assert (=> b!752019 m!700527))

(assert (=> b!752012 m!700493))

(declare-fun m!700529 () Bool)

(assert (=> b!752012 m!700529))

(declare-fun m!700531 () Bool)

(assert (=> b!752003 m!700531))

(check-sat (not b!752011) (not b!752021) (not b!752005) (not b!752019) (not b!752024) (not b!752002) (not b!752006) (not b!752003) (not b!752016) (not b!752010) (not start!65642) (not b!752023) (not b!752013) (not b!752007) (not b!752008))
(check-sat)
