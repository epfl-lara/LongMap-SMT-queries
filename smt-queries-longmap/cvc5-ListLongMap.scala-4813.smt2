; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66218 () Bool)

(assert start!66218)

(declare-fun b!762542 () Bool)

(declare-fun e!425032 () Bool)

(assert (=> b!762542 (= e!425032 false)))

(declare-fun lt!339596 () Bool)

(declare-fun e!425033 () Bool)

(assert (=> b!762542 (= lt!339596 e!425033)))

(declare-fun c!83833 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762542 (= c!83833 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!762543 () Bool)

(declare-fun res!515657 () Bool)

(declare-fun e!425034 () Bool)

(assert (=> b!762543 (=> (not res!515657) (not e!425034))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762543 (= res!515657 (validKeyInArray!0 k!2102))))

(declare-datatypes ((array!42123 0))(
  ( (array!42124 (arr!20169 (Array (_ BitVec 32) (_ BitVec 64))) (size!20590 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42123)

(declare-datatypes ((SeekEntryResult!7769 0))(
  ( (MissingZero!7769 (index!33444 (_ BitVec 32))) (Found!7769 (index!33445 (_ BitVec 32))) (Intermediate!7769 (undefined!8581 Bool) (index!33446 (_ BitVec 32)) (x!64357 (_ BitVec 32))) (Undefined!7769) (MissingVacant!7769 (index!33447 (_ BitVec 32))) )
))
(declare-fun lt!339594 () SeekEntryResult!7769)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!762544 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42123 (_ BitVec 32)) SeekEntryResult!7769)

(assert (=> b!762544 (= e!425033 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20169 a!3186) j!159) a!3186 mask!3328) lt!339594)))))

(declare-fun b!762545 () Bool)

(declare-fun e!425031 () Bool)

(assert (=> b!762545 (= e!425031 e!425032)))

(declare-fun res!515649 () Bool)

(assert (=> b!762545 (=> (not res!515649) (not e!425032))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762545 (= res!515649 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20169 a!3186) j!159) mask!3328) (select (arr!20169 a!3186) j!159) a!3186 mask!3328) lt!339594))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!762545 (= lt!339594 (Intermediate!7769 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!762546 () Bool)

(declare-fun res!515652 () Bool)

(assert (=> b!762546 (=> (not res!515652) (not e!425032))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762546 (= res!515652 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20169 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!762547 () Bool)

(declare-fun res!515656 () Bool)

(assert (=> b!762547 (=> (not res!515656) (not e!425031))))

(declare-datatypes ((List!14171 0))(
  ( (Nil!14168) (Cons!14167 (h!15251 (_ BitVec 64)) (t!20486 List!14171)) )
))
(declare-fun arrayNoDuplicates!0 (array!42123 (_ BitVec 32) List!14171) Bool)

(assert (=> b!762547 (= res!515656 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14168))))

(declare-fun b!762548 () Bool)

(declare-fun res!515655 () Bool)

(assert (=> b!762548 (=> (not res!515655) (not e!425031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42123 (_ BitVec 32)) Bool)

(assert (=> b!762548 (= res!515655 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762550 () Bool)

(declare-fun res!515659 () Bool)

(assert (=> b!762550 (=> (not res!515659) (not e!425034))))

(assert (=> b!762550 (= res!515659 (and (= (size!20590 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20590 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20590 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762551 () Bool)

(declare-fun res!515650 () Bool)

(assert (=> b!762551 (=> (not res!515650) (not e!425034))))

(assert (=> b!762551 (= res!515650 (validKeyInArray!0 (select (arr!20169 a!3186) j!159)))))

(declare-fun b!762552 () Bool)

(assert (=> b!762552 (= e!425034 e!425031)))

(declare-fun res!515653 () Bool)

(assert (=> b!762552 (=> (not res!515653) (not e!425031))))

(declare-fun lt!339595 () SeekEntryResult!7769)

(assert (=> b!762552 (= res!515653 (or (= lt!339595 (MissingZero!7769 i!1173)) (= lt!339595 (MissingVacant!7769 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42123 (_ BitVec 32)) SeekEntryResult!7769)

(assert (=> b!762552 (= lt!339595 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!762549 () Bool)

(declare-fun res!515654 () Bool)

(assert (=> b!762549 (=> (not res!515654) (not e!425034))))

(declare-fun arrayContainsKey!0 (array!42123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762549 (= res!515654 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!515658 () Bool)

(assert (=> start!66218 (=> (not res!515658) (not e!425034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66218 (= res!515658 (validMask!0 mask!3328))))

(assert (=> start!66218 e!425034))

(assert (=> start!66218 true))

(declare-fun array_inv!15965 (array!42123) Bool)

(assert (=> start!66218 (array_inv!15965 a!3186)))

(declare-fun b!762553 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42123 (_ BitVec 32)) SeekEntryResult!7769)

(assert (=> b!762553 (= e!425033 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20169 a!3186) j!159) a!3186 mask!3328) (Found!7769 j!159))))))

(declare-fun b!762554 () Bool)

(declare-fun res!515651 () Bool)

(assert (=> b!762554 (=> (not res!515651) (not e!425031))))

(assert (=> b!762554 (= res!515651 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20590 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20590 a!3186))))))

(assert (= (and start!66218 res!515658) b!762550))

(assert (= (and b!762550 res!515659) b!762551))

(assert (= (and b!762551 res!515650) b!762543))

(assert (= (and b!762543 res!515657) b!762549))

(assert (= (and b!762549 res!515654) b!762552))

(assert (= (and b!762552 res!515653) b!762548))

(assert (= (and b!762548 res!515655) b!762547))

(assert (= (and b!762547 res!515656) b!762554))

(assert (= (and b!762554 res!515651) b!762545))

(assert (= (and b!762545 res!515649) b!762546))

(assert (= (and b!762546 res!515652) b!762542))

(assert (= (and b!762542 c!83833) b!762544))

(assert (= (and b!762542 (not c!83833)) b!762553))

(declare-fun m!709263 () Bool)

(assert (=> start!66218 m!709263))

(declare-fun m!709265 () Bool)

(assert (=> start!66218 m!709265))

(declare-fun m!709267 () Bool)

(assert (=> b!762547 m!709267))

(declare-fun m!709269 () Bool)

(assert (=> b!762544 m!709269))

(assert (=> b!762544 m!709269))

(declare-fun m!709271 () Bool)

(assert (=> b!762544 m!709271))

(declare-fun m!709273 () Bool)

(assert (=> b!762543 m!709273))

(assert (=> b!762553 m!709269))

(assert (=> b!762553 m!709269))

(declare-fun m!709275 () Bool)

(assert (=> b!762553 m!709275))

(declare-fun m!709277 () Bool)

(assert (=> b!762546 m!709277))

(assert (=> b!762551 m!709269))

(assert (=> b!762551 m!709269))

(declare-fun m!709279 () Bool)

(assert (=> b!762551 m!709279))

(declare-fun m!709281 () Bool)

(assert (=> b!762552 m!709281))

(declare-fun m!709283 () Bool)

(assert (=> b!762549 m!709283))

(assert (=> b!762545 m!709269))

(assert (=> b!762545 m!709269))

(declare-fun m!709285 () Bool)

(assert (=> b!762545 m!709285))

(assert (=> b!762545 m!709285))

(assert (=> b!762545 m!709269))

(declare-fun m!709287 () Bool)

(assert (=> b!762545 m!709287))

(declare-fun m!709289 () Bool)

(assert (=> b!762548 m!709289))

(push 1)

