; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65306 () Bool)

(assert start!65306)

(declare-fun b!741596 () Bool)

(declare-fun res!498897 () Bool)

(declare-fun e!414521 () Bool)

(assert (=> b!741596 (=> (not res!498897) (not e!414521))))

(declare-datatypes ((array!41479 0))(
  ( (array!41480 (arr!19853 (Array (_ BitVec 32) (_ BitVec 64))) (size!20274 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41479)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741596 (= res!498897 (validKeyInArray!0 (select (arr!19853 a!3186) j!159)))))

(declare-fun b!741597 () Bool)

(declare-fun res!498889 () Bool)

(declare-fun e!414522 () Bool)

(assert (=> b!741597 (=> (not res!498889) (not e!414522))))

(declare-datatypes ((List!13855 0))(
  ( (Nil!13852) (Cons!13851 (h!14923 (_ BitVec 64)) (t!20170 List!13855)) )
))
(declare-fun arrayNoDuplicates!0 (array!41479 (_ BitVec 32) List!13855) Bool)

(assert (=> b!741597 (= res!498889 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13852))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!414523 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!741598 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7453 0))(
  ( (MissingZero!7453 (index!32180 (_ BitVec 32))) (Found!7453 (index!32181 (_ BitVec 32))) (Intermediate!7453 (undefined!8265 Bool) (index!32182 (_ BitVec 32)) (x!63155 (_ BitVec 32))) (Undefined!7453) (MissingVacant!7453 (index!32183 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41479 (_ BitVec 32)) SeekEntryResult!7453)

(assert (=> b!741598 (= e!414523 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19853 a!3186) j!159) a!3186 mask!3328) (Found!7453 j!159)))))

(declare-fun b!741599 () Bool)

(declare-fun res!498892 () Bool)

(assert (=> b!741599 (=> (not res!498892) (not e!414522))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741599 (= res!498892 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20274 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20274 a!3186))))))

(declare-fun b!741600 () Bool)

(declare-fun e!414520 () Bool)

(assert (=> b!741600 (= e!414522 e!414520)))

(declare-fun res!498898 () Bool)

(assert (=> b!741600 (=> (not res!498898) (not e!414520))))

(declare-fun lt!329477 () SeekEntryResult!7453)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41479 (_ BitVec 32)) SeekEntryResult!7453)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741600 (= res!498898 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19853 a!3186) j!159) mask!3328) (select (arr!19853 a!3186) j!159) a!3186 mask!3328) lt!329477))))

(assert (=> b!741600 (= lt!329477 (Intermediate!7453 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741601 () Bool)

(assert (=> b!741601 (= e!414523 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19853 a!3186) j!159) a!3186 mask!3328) lt!329477))))

(declare-fun lt!329479 () SeekEntryResult!7453)

(declare-fun e!414526 () Bool)

(declare-fun b!741602 () Bool)

(assert (=> b!741602 (= e!414526 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19853 a!3186) j!159) a!3186 mask!3328) lt!329479))))

(declare-fun b!741603 () Bool)

(declare-fun res!498899 () Bool)

(assert (=> b!741603 (=> (not res!498899) (not e!414522))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41479 (_ BitVec 32)) Bool)

(assert (=> b!741603 (= res!498899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741604 () Bool)

(declare-fun res!498887 () Bool)

(assert (=> b!741604 (=> (not res!498887) (not e!414521))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41479 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741604 (= res!498887 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741605 () Bool)

(declare-fun e!414525 () Bool)

(assert (=> b!741605 (= e!414520 e!414525)))

(declare-fun res!498891 () Bool)

(assert (=> b!741605 (=> (not res!498891) (not e!414525))))

(declare-fun lt!329482 () SeekEntryResult!7453)

(declare-fun lt!329478 () SeekEntryResult!7453)

(assert (=> b!741605 (= res!498891 (= lt!329482 lt!329478))))

(declare-fun lt!329481 () array!41479)

(declare-fun lt!329483 () (_ BitVec 64))

(assert (=> b!741605 (= lt!329478 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329483 lt!329481 mask!3328))))

(assert (=> b!741605 (= lt!329482 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329483 mask!3328) lt!329483 lt!329481 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741605 (= lt!329483 (select (store (arr!19853 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!741605 (= lt!329481 (array!41480 (store (arr!19853 a!3186) i!1173 k!2102) (size!20274 a!3186)))))

(declare-fun b!741606 () Bool)

(declare-fun e!414527 () Bool)

(assert (=> b!741606 (= e!414527 e!414526)))

(declare-fun res!498885 () Bool)

(assert (=> b!741606 (=> (not res!498885) (not e!414526))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41479 (_ BitVec 32)) SeekEntryResult!7453)

(assert (=> b!741606 (= res!498885 (= (seekEntryOrOpen!0 (select (arr!19853 a!3186) j!159) a!3186 mask!3328) lt!329479))))

(assert (=> b!741606 (= lt!329479 (Found!7453 j!159))))

(declare-fun res!498888 () Bool)

(assert (=> start!65306 (=> (not res!498888) (not e!414521))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65306 (= res!498888 (validMask!0 mask!3328))))

(assert (=> start!65306 e!414521))

(assert (=> start!65306 true))

(declare-fun array_inv!15649 (array!41479) Bool)

(assert (=> start!65306 (array_inv!15649 a!3186)))

(declare-fun b!741607 () Bool)

(declare-fun res!498895 () Bool)

(assert (=> b!741607 (=> (not res!498895) (not e!414521))))

(assert (=> b!741607 (= res!498895 (and (= (size!20274 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20274 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20274 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741608 () Bool)

(assert (=> b!741608 (= e!414521 e!414522)))

(declare-fun res!498890 () Bool)

(assert (=> b!741608 (=> (not res!498890) (not e!414522))))

(declare-fun lt!329480 () SeekEntryResult!7453)

(assert (=> b!741608 (= res!498890 (or (= lt!329480 (MissingZero!7453 i!1173)) (= lt!329480 (MissingVacant!7453 i!1173))))))

(assert (=> b!741608 (= lt!329480 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!741609 () Bool)

(declare-fun res!498886 () Bool)

(assert (=> b!741609 (=> (not res!498886) (not e!414520))))

(assert (=> b!741609 (= res!498886 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19853 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741610 () Bool)

(declare-fun res!498896 () Bool)

(assert (=> b!741610 (=> (not res!498896) (not e!414520))))

(assert (=> b!741610 (= res!498896 e!414523)))

(declare-fun c!81736 () Bool)

(assert (=> b!741610 (= c!81736 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741611 () Bool)

(assert (=> b!741611 (= e!414525 (not (or (not (is-Intermediate!7453 lt!329478)) (not (= x!1131 (x!63155 lt!329478))) (not (= index!1321 (index!32182 lt!329478))) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(assert (=> b!741611 e!414527))

(declare-fun res!498894 () Bool)

(assert (=> b!741611 (=> (not res!498894) (not e!414527))))

(assert (=> b!741611 (= res!498894 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25386 0))(
  ( (Unit!25387) )
))
(declare-fun lt!329476 () Unit!25386)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41479 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25386)

(assert (=> b!741611 (= lt!329476 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741612 () Bool)

(declare-fun res!498893 () Bool)

(assert (=> b!741612 (=> (not res!498893) (not e!414521))))

(assert (=> b!741612 (= res!498893 (validKeyInArray!0 k!2102))))

(assert (= (and start!65306 res!498888) b!741607))

(assert (= (and b!741607 res!498895) b!741596))

(assert (= (and b!741596 res!498897) b!741612))

(assert (= (and b!741612 res!498893) b!741604))

(assert (= (and b!741604 res!498887) b!741608))

(assert (= (and b!741608 res!498890) b!741603))

(assert (= (and b!741603 res!498899) b!741597))

(assert (= (and b!741597 res!498889) b!741599))

(assert (= (and b!741599 res!498892) b!741600))

(assert (= (and b!741600 res!498898) b!741609))

(assert (= (and b!741609 res!498886) b!741610))

(assert (= (and b!741610 c!81736) b!741601))

(assert (= (and b!741610 (not c!81736)) b!741598))

(assert (= (and b!741610 res!498896) b!741605))

(assert (= (and b!741605 res!498891) b!741611))

(assert (= (and b!741611 res!498894) b!741606))

(assert (= (and b!741606 res!498885) b!741602))

(declare-fun m!692553 () Bool)

(assert (=> b!741609 m!692553))

(declare-fun m!692555 () Bool)

(assert (=> b!741608 m!692555))

(declare-fun m!692557 () Bool)

(assert (=> b!741597 m!692557))

(declare-fun m!692559 () Bool)

(assert (=> b!741606 m!692559))

(assert (=> b!741606 m!692559))

(declare-fun m!692561 () Bool)

(assert (=> b!741606 m!692561))

(assert (=> b!741598 m!692559))

(assert (=> b!741598 m!692559))

(declare-fun m!692563 () Bool)

(assert (=> b!741598 m!692563))

(declare-fun m!692565 () Bool)

(assert (=> start!65306 m!692565))

(declare-fun m!692567 () Bool)

(assert (=> start!65306 m!692567))

(assert (=> b!741600 m!692559))

(assert (=> b!741600 m!692559))

(declare-fun m!692569 () Bool)

(assert (=> b!741600 m!692569))

(assert (=> b!741600 m!692569))

(assert (=> b!741600 m!692559))

(declare-fun m!692571 () Bool)

(assert (=> b!741600 m!692571))

(declare-fun m!692573 () Bool)

(assert (=> b!741604 m!692573))

(declare-fun m!692575 () Bool)

(assert (=> b!741605 m!692575))

(declare-fun m!692577 () Bool)

(assert (=> b!741605 m!692577))

(assert (=> b!741605 m!692577))

(declare-fun m!692579 () Bool)

(assert (=> b!741605 m!692579))

(declare-fun m!692581 () Bool)

(assert (=> b!741605 m!692581))

(declare-fun m!692583 () Bool)

(assert (=> b!741605 m!692583))

(assert (=> b!741596 m!692559))

(assert (=> b!741596 m!692559))

(declare-fun m!692585 () Bool)

(assert (=> b!741596 m!692585))

(assert (=> b!741601 m!692559))

(assert (=> b!741601 m!692559))

(declare-fun m!692587 () Bool)

(assert (=> b!741601 m!692587))

(declare-fun m!692589 () Bool)

(assert (=> b!741612 m!692589))

(declare-fun m!692591 () Bool)

(assert (=> b!741611 m!692591))

(declare-fun m!692593 () Bool)

(assert (=> b!741611 m!692593))

(declare-fun m!692595 () Bool)

(assert (=> b!741603 m!692595))

(assert (=> b!741602 m!692559))

(assert (=> b!741602 m!692559))

(declare-fun m!692597 () Bool)

(assert (=> b!741602 m!692597))

(push 1)

(assert (not b!741596))

(assert (not start!65306))

(assert (not b!741603))

(assert (not b!741608))

(assert (not b!741611))

(assert (not b!741600))

(assert (not b!741597))

(assert (not b!741612))

(assert (not b!741601))

(assert (not b!741606))

(assert (not b!741605))

(assert (not b!741598))

(assert (not b!741602))

(assert (not b!741604))

(check-sat)

(pop 1)

(push 1)

(check-sat)

