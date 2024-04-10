; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66230 () Bool)

(assert start!66230)

(declare-fun b!762776 () Bool)

(declare-fun e!425123 () Bool)

(declare-fun e!425121 () Bool)

(assert (=> b!762776 (= e!425123 e!425121)))

(declare-fun res!515850 () Bool)

(assert (=> b!762776 (=> (not res!515850) (not e!425121))))

(declare-datatypes ((array!42135 0))(
  ( (array!42136 (arr!20175 (Array (_ BitVec 32) (_ BitVec 64))) (size!20596 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42135)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7775 0))(
  ( (MissingZero!7775 (index!33468 (_ BitVec 32))) (Found!7775 (index!33469 (_ BitVec 32))) (Intermediate!7775 (undefined!8587 Bool) (index!33470 (_ BitVec 32)) (x!64379 (_ BitVec 32))) (Undefined!7775) (MissingVacant!7775 (index!33471 (_ BitVec 32))) )
))
(declare-fun lt!339650 () SeekEntryResult!7775)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42135 (_ BitVec 32)) SeekEntryResult!7775)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762776 (= res!515850 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20175 a!3186) j!159) mask!3328) (select (arr!20175 a!3186) j!159) a!3186 mask!3328) lt!339650))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762776 (= lt!339650 (Intermediate!7775 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!762777 () Bool)

(assert (=> b!762777 (= e!425121 false)))

(declare-fun lt!339649 () Bool)

(declare-fun e!425124 () Bool)

(assert (=> b!762777 (= lt!339649 e!425124)))

(declare-fun c!83851 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!762777 (= c!83851 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!762778 () Bool)

(declare-fun res!515855 () Bool)

(assert (=> b!762778 (=> (not res!515855) (not e!425121))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762778 (= res!515855 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20175 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!762779 () Bool)

(declare-fun res!515856 () Bool)

(declare-fun e!425120 () Bool)

(assert (=> b!762779 (=> (not res!515856) (not e!425120))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762779 (= res!515856 (validKeyInArray!0 k!2102))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!762780 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42135 (_ BitVec 32)) SeekEntryResult!7775)

(assert (=> b!762780 (= e!425124 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20175 a!3186) j!159) a!3186 mask!3328) (Found!7775 j!159))))))

(declare-fun b!762781 () Bool)

(declare-fun res!515851 () Bool)

(assert (=> b!762781 (=> (not res!515851) (not e!425120))))

(declare-fun arrayContainsKey!0 (array!42135 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762781 (= res!515851 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762783 () Bool)

(assert (=> b!762783 (= e!425124 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20175 a!3186) j!159) a!3186 mask!3328) lt!339650)))))

(declare-fun b!762784 () Bool)

(declare-fun res!515848 () Bool)

(assert (=> b!762784 (=> (not res!515848) (not e!425123))))

(declare-datatypes ((List!14177 0))(
  ( (Nil!14174) (Cons!14173 (h!15257 (_ BitVec 64)) (t!20492 List!14177)) )
))
(declare-fun arrayNoDuplicates!0 (array!42135 (_ BitVec 32) List!14177) Bool)

(assert (=> b!762784 (= res!515848 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14174))))

(declare-fun b!762785 () Bool)

(declare-fun res!515847 () Bool)

(assert (=> b!762785 (=> (not res!515847) (not e!425123))))

(assert (=> b!762785 (= res!515847 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20596 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20596 a!3186))))))

(declare-fun b!762786 () Bool)

(declare-fun res!515852 () Bool)

(assert (=> b!762786 (=> (not res!515852) (not e!425120))))

(assert (=> b!762786 (= res!515852 (validKeyInArray!0 (select (arr!20175 a!3186) j!159)))))

(declare-fun b!762787 () Bool)

(assert (=> b!762787 (= e!425120 e!425123)))

(declare-fun res!515853 () Bool)

(assert (=> b!762787 (=> (not res!515853) (not e!425123))))

(declare-fun lt!339648 () SeekEntryResult!7775)

(assert (=> b!762787 (= res!515853 (or (= lt!339648 (MissingZero!7775 i!1173)) (= lt!339648 (MissingVacant!7775 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42135 (_ BitVec 32)) SeekEntryResult!7775)

(assert (=> b!762787 (= lt!339648 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!762788 () Bool)

(declare-fun res!515854 () Bool)

(assert (=> b!762788 (=> (not res!515854) (not e!425123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42135 (_ BitVec 32)) Bool)

(assert (=> b!762788 (= res!515854 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762782 () Bool)

(declare-fun res!515849 () Bool)

(assert (=> b!762782 (=> (not res!515849) (not e!425120))))

(assert (=> b!762782 (= res!515849 (and (= (size!20596 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20596 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20596 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!515857 () Bool)

(assert (=> start!66230 (=> (not res!515857) (not e!425120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66230 (= res!515857 (validMask!0 mask!3328))))

(assert (=> start!66230 e!425120))

(assert (=> start!66230 true))

(declare-fun array_inv!15971 (array!42135) Bool)

(assert (=> start!66230 (array_inv!15971 a!3186)))

(assert (= (and start!66230 res!515857) b!762782))

(assert (= (and b!762782 res!515849) b!762786))

(assert (= (and b!762786 res!515852) b!762779))

(assert (= (and b!762779 res!515856) b!762781))

(assert (= (and b!762781 res!515851) b!762787))

(assert (= (and b!762787 res!515853) b!762788))

(assert (= (and b!762788 res!515854) b!762784))

(assert (= (and b!762784 res!515848) b!762785))

(assert (= (and b!762785 res!515847) b!762776))

(assert (= (and b!762776 res!515850) b!762778))

(assert (= (and b!762778 res!515855) b!762777))

(assert (= (and b!762777 c!83851) b!762783))

(assert (= (and b!762777 (not c!83851)) b!762780))

(declare-fun m!709431 () Bool)

(assert (=> b!762781 m!709431))

(declare-fun m!709433 () Bool)

(assert (=> b!762778 m!709433))

(declare-fun m!709435 () Bool)

(assert (=> b!762787 m!709435))

(declare-fun m!709437 () Bool)

(assert (=> b!762788 m!709437))

(declare-fun m!709439 () Bool)

(assert (=> b!762776 m!709439))

(assert (=> b!762776 m!709439))

(declare-fun m!709441 () Bool)

(assert (=> b!762776 m!709441))

(assert (=> b!762776 m!709441))

(assert (=> b!762776 m!709439))

(declare-fun m!709443 () Bool)

(assert (=> b!762776 m!709443))

(declare-fun m!709445 () Bool)

(assert (=> b!762784 m!709445))

(declare-fun m!709447 () Bool)

(assert (=> b!762779 m!709447))

(assert (=> b!762783 m!709439))

(assert (=> b!762783 m!709439))

(declare-fun m!709449 () Bool)

(assert (=> b!762783 m!709449))

(assert (=> b!762786 m!709439))

(assert (=> b!762786 m!709439))

(declare-fun m!709451 () Bool)

(assert (=> b!762786 m!709451))

(assert (=> b!762780 m!709439))

(assert (=> b!762780 m!709439))

(declare-fun m!709453 () Bool)

(assert (=> b!762780 m!709453))

(declare-fun m!709455 () Bool)

(assert (=> start!66230 m!709455))

(declare-fun m!709457 () Bool)

(assert (=> start!66230 m!709457))

(push 1)

