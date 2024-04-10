; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66224 () Bool)

(assert start!66224)

(declare-fun b!762660 () Bool)

(declare-fun res!515751 () Bool)

(declare-fun e!425077 () Bool)

(assert (=> b!762660 (=> (not res!515751) (not e!425077))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42129 0))(
  ( (array!42130 (arr!20172 (Array (_ BitVec 32) (_ BitVec 64))) (size!20593 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42129)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762660 (= res!515751 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20593 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20593 a!3186))))))

(declare-fun e!425076 () Bool)

(declare-fun b!762661 () Bool)

(declare-datatypes ((SeekEntryResult!7772 0))(
  ( (MissingZero!7772 (index!33456 (_ BitVec 32))) (Found!7772 (index!33457 (_ BitVec 32))) (Intermediate!7772 (undefined!8584 Bool) (index!33458 (_ BitVec 32)) (x!64368 (_ BitVec 32))) (Undefined!7772) (MissingVacant!7772 (index!33459 (_ BitVec 32))) )
))
(declare-fun lt!339622 () SeekEntryResult!7772)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42129 (_ BitVec 32)) SeekEntryResult!7772)

(assert (=> b!762661 (= e!425076 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20172 a!3186) j!159) a!3186 mask!3328) lt!339622)))))

(declare-fun b!762662 () Bool)

(declare-fun res!515754 () Bool)

(declare-fun e!425079 () Bool)

(assert (=> b!762662 (=> (not res!515754) (not e!425079))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762662 (= res!515754 (validKeyInArray!0 (select (arr!20172 a!3186) j!159)))))

(declare-fun b!762663 () Bool)

(declare-fun e!425075 () Bool)

(assert (=> b!762663 (= e!425077 e!425075)))

(declare-fun res!515749 () Bool)

(assert (=> b!762663 (=> (not res!515749) (not e!425075))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762663 (= res!515749 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20172 a!3186) j!159) mask!3328) (select (arr!20172 a!3186) j!159) a!3186 mask!3328) lt!339622))))

(assert (=> b!762663 (= lt!339622 (Intermediate!7772 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!762664 () Bool)

(declare-fun res!515756 () Bool)

(assert (=> b!762664 (=> (not res!515756) (not e!425077))))

(declare-datatypes ((List!14174 0))(
  ( (Nil!14171) (Cons!14170 (h!15254 (_ BitVec 64)) (t!20489 List!14174)) )
))
(declare-fun arrayNoDuplicates!0 (array!42129 (_ BitVec 32) List!14174) Bool)

(assert (=> b!762664 (= res!515756 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14171))))

(declare-fun b!762665 () Bool)

(assert (=> b!762665 (= e!425079 e!425077)))

(declare-fun res!515750 () Bool)

(assert (=> b!762665 (=> (not res!515750) (not e!425077))))

(declare-fun lt!339621 () SeekEntryResult!7772)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762665 (= res!515750 (or (= lt!339621 (MissingZero!7772 i!1173)) (= lt!339621 (MissingVacant!7772 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42129 (_ BitVec 32)) SeekEntryResult!7772)

(assert (=> b!762665 (= lt!339621 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!762666 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42129 (_ BitVec 32)) SeekEntryResult!7772)

(assert (=> b!762666 (= e!425076 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20172 a!3186) j!159) a!3186 mask!3328) (Found!7772 j!159))))))

(declare-fun b!762667 () Bool)

(declare-fun res!515748 () Bool)

(assert (=> b!762667 (=> (not res!515748) (not e!425075))))

(assert (=> b!762667 (= res!515748 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20172 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!762668 () Bool)

(declare-fun res!515752 () Bool)

(assert (=> b!762668 (=> (not res!515752) (not e!425079))))

(assert (=> b!762668 (= res!515752 (and (= (size!20593 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20593 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20593 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762669 () Bool)

(declare-fun res!515757 () Bool)

(assert (=> b!762669 (=> (not res!515757) (not e!425077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42129 (_ BitVec 32)) Bool)

(assert (=> b!762669 (= res!515757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!515758 () Bool)

(assert (=> start!66224 (=> (not res!515758) (not e!425079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66224 (= res!515758 (validMask!0 mask!3328))))

(assert (=> start!66224 e!425079))

(assert (=> start!66224 true))

(declare-fun array_inv!15968 (array!42129) Bool)

(assert (=> start!66224 (array_inv!15968 a!3186)))

(declare-fun b!762659 () Bool)

(declare-fun res!515755 () Bool)

(assert (=> b!762659 (=> (not res!515755) (not e!425079))))

(declare-fun arrayContainsKey!0 (array!42129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762659 (= res!515755 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762670 () Bool)

(assert (=> b!762670 (= e!425075 false)))

(declare-fun lt!339623 () Bool)

(assert (=> b!762670 (= lt!339623 e!425076)))

(declare-fun c!83842 () Bool)

(assert (=> b!762670 (= c!83842 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!762671 () Bool)

(declare-fun res!515753 () Bool)

(assert (=> b!762671 (=> (not res!515753) (not e!425079))))

(assert (=> b!762671 (= res!515753 (validKeyInArray!0 k!2102))))

(assert (= (and start!66224 res!515758) b!762668))

(assert (= (and b!762668 res!515752) b!762662))

(assert (= (and b!762662 res!515754) b!762671))

(assert (= (and b!762671 res!515753) b!762659))

(assert (= (and b!762659 res!515755) b!762665))

(assert (= (and b!762665 res!515750) b!762669))

(assert (= (and b!762669 res!515757) b!762664))

(assert (= (and b!762664 res!515756) b!762660))

(assert (= (and b!762660 res!515751) b!762663))

(assert (= (and b!762663 res!515749) b!762667))

(assert (= (and b!762667 res!515748) b!762670))

(assert (= (and b!762670 c!83842) b!762661))

(assert (= (and b!762670 (not c!83842)) b!762666))

(declare-fun m!709347 () Bool)

(assert (=> b!762666 m!709347))

(assert (=> b!762666 m!709347))

(declare-fun m!709349 () Bool)

(assert (=> b!762666 m!709349))

(declare-fun m!709351 () Bool)

(assert (=> start!66224 m!709351))

(declare-fun m!709353 () Bool)

(assert (=> start!66224 m!709353))

(declare-fun m!709355 () Bool)

(assert (=> b!762665 m!709355))

(declare-fun m!709357 () Bool)

(assert (=> b!762667 m!709357))

(assert (=> b!762662 m!709347))

(assert (=> b!762662 m!709347))

(declare-fun m!709359 () Bool)

(assert (=> b!762662 m!709359))

(assert (=> b!762663 m!709347))

(assert (=> b!762663 m!709347))

(declare-fun m!709361 () Bool)

(assert (=> b!762663 m!709361))

(assert (=> b!762663 m!709361))

(assert (=> b!762663 m!709347))

(declare-fun m!709363 () Bool)

(assert (=> b!762663 m!709363))

(assert (=> b!762661 m!709347))

(assert (=> b!762661 m!709347))

(declare-fun m!709365 () Bool)

(assert (=> b!762661 m!709365))

(declare-fun m!709367 () Bool)

(assert (=> b!762659 m!709367))

(declare-fun m!709369 () Bool)

(assert (=> b!762664 m!709369))

(declare-fun m!709371 () Bool)

(assert (=> b!762671 m!709371))

(declare-fun m!709373 () Bool)

(assert (=> b!762669 m!709373))

(push 1)

