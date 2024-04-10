; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65490 () Bool)

(assert start!65490)

(declare-fun b!746689 () Bool)

(declare-fun res!503427 () Bool)

(declare-fun e!416974 () Bool)

(assert (=> b!746689 (=> (not res!503427) (not e!416974))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41663 0))(
  ( (array!41664 (arr!19945 (Array (_ BitVec 32) (_ BitVec 64))) (size!20366 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41663)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!746689 (= res!503427 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19945 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746690 () Bool)

(declare-fun e!416967 () Bool)

(assert (=> b!746690 (= e!416967 true)))

(declare-datatypes ((SeekEntryResult!7545 0))(
  ( (MissingZero!7545 (index!32548 (_ BitVec 32))) (Found!7545 (index!32549 (_ BitVec 32))) (Intermediate!7545 (undefined!8357 Bool) (index!32550 (_ BitVec 32)) (x!63495 (_ BitVec 32))) (Undefined!7545) (MissingVacant!7545 (index!32551 (_ BitVec 32))) )
))
(declare-fun lt!331864 () SeekEntryResult!7545)

(declare-fun lt!331859 () SeekEntryResult!7545)

(assert (=> b!746690 (= lt!331864 lt!331859)))

(declare-fun b!746691 () Bool)

(declare-fun res!503426 () Bool)

(declare-fun e!416968 () Bool)

(assert (=> b!746691 (=> (not res!503426) (not e!416968))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746691 (= res!503426 (validKeyInArray!0 k0!2102))))

(declare-fun b!746692 () Bool)

(declare-fun e!416973 () Bool)

(assert (=> b!746692 (= e!416973 e!416974)))

(declare-fun res!503433 () Bool)

(assert (=> b!746692 (=> (not res!503433) (not e!416974))))

(declare-fun lt!331857 () SeekEntryResult!7545)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41663 (_ BitVec 32)) SeekEntryResult!7545)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746692 (= res!503433 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19945 a!3186) j!159) mask!3328) (select (arr!19945 a!3186) j!159) a!3186 mask!3328) lt!331857))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746692 (= lt!331857 (Intermediate!7545 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746693 () Bool)

(declare-fun res!503431 () Bool)

(assert (=> b!746693 (=> (not res!503431) (not e!416973))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!746693 (= res!503431 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20366 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20366 a!3186))))))

(declare-fun b!746694 () Bool)

(declare-fun e!416969 () Bool)

(assert (=> b!746694 (= e!416969 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19945 a!3186) j!159) a!3186 mask!3328) lt!331857))))

(declare-fun b!746695 () Bool)

(declare-fun res!503441 () Bool)

(assert (=> b!746695 (=> (not res!503441) (not e!416968))))

(declare-fun arrayContainsKey!0 (array!41663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746695 (= res!503441 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!331862 () SeekEntryResult!7545)

(declare-fun e!416972 () Bool)

(declare-fun b!746696 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41663 (_ BitVec 32)) SeekEntryResult!7545)

(assert (=> b!746696 (= e!416972 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19945 a!3186) j!159) a!3186 mask!3328) lt!331862))))

(declare-fun b!746697 () Bool)

(declare-fun res!503432 () Bool)

(assert (=> b!746697 (=> (not res!503432) (not e!416968))))

(assert (=> b!746697 (= res!503432 (and (= (size!20366 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20366 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20366 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!503436 () Bool)

(assert (=> start!65490 (=> (not res!503436) (not e!416968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65490 (= res!503436 (validMask!0 mask!3328))))

(assert (=> start!65490 e!416968))

(assert (=> start!65490 true))

(declare-fun array_inv!15741 (array!41663) Bool)

(assert (=> start!65490 (array_inv!15741 a!3186)))

(declare-fun b!746698 () Bool)

(declare-fun e!416970 () Bool)

(assert (=> b!746698 (= e!416974 e!416970)))

(declare-fun res!503429 () Bool)

(assert (=> b!746698 (=> (not res!503429) (not e!416970))))

(declare-fun lt!331856 () SeekEntryResult!7545)

(declare-fun lt!331860 () SeekEntryResult!7545)

(assert (=> b!746698 (= res!503429 (= lt!331856 lt!331860))))

(declare-fun lt!331861 () array!41663)

(declare-fun lt!331865 () (_ BitVec 64))

(assert (=> b!746698 (= lt!331860 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331865 lt!331861 mask!3328))))

(assert (=> b!746698 (= lt!331856 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331865 mask!3328) lt!331865 lt!331861 mask!3328))))

(assert (=> b!746698 (= lt!331865 (select (store (arr!19945 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!746698 (= lt!331861 (array!41664 (store (arr!19945 a!3186) i!1173 k0!2102) (size!20366 a!3186)))))

(declare-fun b!746699 () Bool)

(declare-fun e!416975 () Bool)

(assert (=> b!746699 (= e!416975 e!416967)))

(declare-fun res!503430 () Bool)

(assert (=> b!746699 (=> res!503430 e!416967)))

(assert (=> b!746699 (= res!503430 (or (not (= lt!331859 lt!331862)) (= (select (store (arr!19945 a!3186) i!1173 k0!2102) index!1321) lt!331865) (not (= (select (store (arr!19945 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746699 (= lt!331859 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19945 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746700 () Bool)

(declare-fun res!503434 () Bool)

(assert (=> b!746700 (=> (not res!503434) (not e!416973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41663 (_ BitVec 32)) Bool)

(assert (=> b!746700 (= res!503434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746701 () Bool)

(declare-fun res!503437 () Bool)

(assert (=> b!746701 (=> (not res!503437) (not e!416974))))

(assert (=> b!746701 (= res!503437 e!416969)))

(declare-fun c!82012 () Bool)

(assert (=> b!746701 (= c!82012 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746702 () Bool)

(assert (=> b!746702 (= e!416970 (not e!416975))))

(declare-fun res!503428 () Bool)

(assert (=> b!746702 (=> res!503428 e!416975)))

(get-info :version)

(assert (=> b!746702 (= res!503428 (or (not ((_ is Intermediate!7545) lt!331860)) (bvslt x!1131 (x!63495 lt!331860)) (not (= x!1131 (x!63495 lt!331860))) (not (= index!1321 (index!32550 lt!331860)))))))

(assert (=> b!746702 e!416972))

(declare-fun res!503438 () Bool)

(assert (=> b!746702 (=> (not res!503438) (not e!416972))))

(assert (=> b!746702 (= res!503438 (= lt!331864 lt!331862))))

(assert (=> b!746702 (= lt!331862 (Found!7545 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41663 (_ BitVec 32)) SeekEntryResult!7545)

(assert (=> b!746702 (= lt!331864 (seekEntryOrOpen!0 (select (arr!19945 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!746702 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25570 0))(
  ( (Unit!25571) )
))
(declare-fun lt!331863 () Unit!25570)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41663 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25570)

(assert (=> b!746702 (= lt!331863 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746703 () Bool)

(declare-fun res!503440 () Bool)

(assert (=> b!746703 (=> (not res!503440) (not e!416973))))

(declare-datatypes ((List!13947 0))(
  ( (Nil!13944) (Cons!13943 (h!15015 (_ BitVec 64)) (t!20262 List!13947)) )
))
(declare-fun arrayNoDuplicates!0 (array!41663 (_ BitVec 32) List!13947) Bool)

(assert (=> b!746703 (= res!503440 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13944))))

(declare-fun b!746704 () Bool)

(assert (=> b!746704 (= e!416969 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19945 a!3186) j!159) a!3186 mask!3328) (Found!7545 j!159)))))

(declare-fun b!746705 () Bool)

(declare-fun res!503435 () Bool)

(assert (=> b!746705 (=> (not res!503435) (not e!416968))))

(assert (=> b!746705 (= res!503435 (validKeyInArray!0 (select (arr!19945 a!3186) j!159)))))

(declare-fun b!746706 () Bool)

(assert (=> b!746706 (= e!416968 e!416973)))

(declare-fun res!503439 () Bool)

(assert (=> b!746706 (=> (not res!503439) (not e!416973))))

(declare-fun lt!331858 () SeekEntryResult!7545)

(assert (=> b!746706 (= res!503439 (or (= lt!331858 (MissingZero!7545 i!1173)) (= lt!331858 (MissingVacant!7545 i!1173))))))

(assert (=> b!746706 (= lt!331858 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(assert (= (and start!65490 res!503436) b!746697))

(assert (= (and b!746697 res!503432) b!746705))

(assert (= (and b!746705 res!503435) b!746691))

(assert (= (and b!746691 res!503426) b!746695))

(assert (= (and b!746695 res!503441) b!746706))

(assert (= (and b!746706 res!503439) b!746700))

(assert (= (and b!746700 res!503434) b!746703))

(assert (= (and b!746703 res!503440) b!746693))

(assert (= (and b!746693 res!503431) b!746692))

(assert (= (and b!746692 res!503433) b!746689))

(assert (= (and b!746689 res!503427) b!746701))

(assert (= (and b!746701 c!82012) b!746694))

(assert (= (and b!746701 (not c!82012)) b!746704))

(assert (= (and b!746701 res!503437) b!746698))

(assert (= (and b!746698 res!503429) b!746702))

(assert (= (and b!746702 res!503438) b!746696))

(assert (= (and b!746702 (not res!503428)) b!746699))

(assert (= (and b!746699 (not res!503430)) b!746690))

(declare-fun m!696919 () Bool)

(assert (=> b!746689 m!696919))

(declare-fun m!696921 () Bool)

(assert (=> b!746702 m!696921))

(assert (=> b!746702 m!696921))

(declare-fun m!696923 () Bool)

(assert (=> b!746702 m!696923))

(declare-fun m!696925 () Bool)

(assert (=> b!746702 m!696925))

(declare-fun m!696927 () Bool)

(assert (=> b!746702 m!696927))

(declare-fun m!696929 () Bool)

(assert (=> b!746691 m!696929))

(assert (=> b!746694 m!696921))

(assert (=> b!746694 m!696921))

(declare-fun m!696931 () Bool)

(assert (=> b!746694 m!696931))

(declare-fun m!696933 () Bool)

(assert (=> b!746700 m!696933))

(declare-fun m!696935 () Bool)

(assert (=> b!746703 m!696935))

(assert (=> b!746696 m!696921))

(assert (=> b!746696 m!696921))

(declare-fun m!696937 () Bool)

(assert (=> b!746696 m!696937))

(assert (=> b!746705 m!696921))

(assert (=> b!746705 m!696921))

(declare-fun m!696939 () Bool)

(assert (=> b!746705 m!696939))

(assert (=> b!746692 m!696921))

(assert (=> b!746692 m!696921))

(declare-fun m!696941 () Bool)

(assert (=> b!746692 m!696941))

(assert (=> b!746692 m!696941))

(assert (=> b!746692 m!696921))

(declare-fun m!696943 () Bool)

(assert (=> b!746692 m!696943))

(declare-fun m!696945 () Bool)

(assert (=> b!746706 m!696945))

(declare-fun m!696947 () Bool)

(assert (=> start!65490 m!696947))

(declare-fun m!696949 () Bool)

(assert (=> start!65490 m!696949))

(declare-fun m!696951 () Bool)

(assert (=> b!746695 m!696951))

(declare-fun m!696953 () Bool)

(assert (=> b!746698 m!696953))

(declare-fun m!696955 () Bool)

(assert (=> b!746698 m!696955))

(declare-fun m!696957 () Bool)

(assert (=> b!746698 m!696957))

(assert (=> b!746698 m!696955))

(declare-fun m!696959 () Bool)

(assert (=> b!746698 m!696959))

(declare-fun m!696961 () Bool)

(assert (=> b!746698 m!696961))

(assert (=> b!746704 m!696921))

(assert (=> b!746704 m!696921))

(declare-fun m!696963 () Bool)

(assert (=> b!746704 m!696963))

(assert (=> b!746699 m!696953))

(declare-fun m!696965 () Bool)

(assert (=> b!746699 m!696965))

(assert (=> b!746699 m!696921))

(assert (=> b!746699 m!696921))

(assert (=> b!746699 m!696963))

(check-sat (not b!746691) (not b!746692) (not b!746706) (not b!746696) (not b!746703) (not b!746700) (not b!746694) (not b!746702) (not b!746695) (not b!746705) (not b!746698) (not b!746704) (not b!746699) (not start!65490))
(check-sat)
