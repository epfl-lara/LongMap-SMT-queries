; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66216 () Bool)

(assert start!66216)

(declare-fun b!762643 () Bool)

(declare-fun e!425015 () Bool)

(declare-fun e!425012 () Bool)

(assert (=> b!762643 (= e!425015 e!425012)))

(declare-fun res!515844 () Bool)

(assert (=> b!762643 (=> (not res!515844) (not e!425012))))

(declare-datatypes ((array!42138 0))(
  ( (array!42139 (arr!20177 (Array (_ BitVec 32) (_ BitVec 64))) (size!20598 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42138)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7774 0))(
  ( (MissingZero!7774 (index!33464 (_ BitVec 32))) (Found!7774 (index!33465 (_ BitVec 32))) (Intermediate!7774 (undefined!8586 Bool) (index!33466 (_ BitVec 32)) (x!64381 (_ BitVec 32))) (Undefined!7774) (MissingVacant!7774 (index!33467 (_ BitVec 32))) )
))
(declare-fun lt!339437 () SeekEntryResult!7774)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42138 (_ BitVec 32)) SeekEntryResult!7774)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762643 (= res!515844 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20177 a!3186) j!159) mask!3328) (select (arr!20177 a!3186) j!159) a!3186 mask!3328) lt!339437))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762643 (= lt!339437 (Intermediate!7774 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!762644 () Bool)

(declare-fun res!515845 () Bool)

(assert (=> b!762644 (=> (not res!515845) (not e!425012))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762644 (= res!515845 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20177 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!762645 () Bool)

(declare-fun res!515840 () Bool)

(declare-fun e!425014 () Bool)

(assert (=> b!762645 (=> (not res!515840) (not e!425014))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762645 (= res!515840 (validKeyInArray!0 k0!2102))))

(declare-fun res!515839 () Bool)

(assert (=> start!66216 (=> (not res!515839) (not e!425014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66216 (= res!515839 (validMask!0 mask!3328))))

(assert (=> start!66216 e!425014))

(assert (=> start!66216 true))

(declare-fun array_inv!16060 (array!42138) Bool)

(assert (=> start!66216 (array_inv!16060 a!3186)))

(declare-fun b!762646 () Bool)

(declare-fun res!515837 () Bool)

(assert (=> b!762646 (=> (not res!515837) (not e!425015))))

(declare-datatypes ((List!14218 0))(
  ( (Nil!14215) (Cons!14214 (h!15298 (_ BitVec 64)) (t!20524 List!14218)) )
))
(declare-fun arrayNoDuplicates!0 (array!42138 (_ BitVec 32) List!14218) Bool)

(assert (=> b!762646 (= res!515837 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14215))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!762647 () Bool)

(declare-fun e!425013 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42138 (_ BitVec 32)) SeekEntryResult!7774)

(assert (=> b!762647 (= e!425013 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20177 a!3186) j!159) a!3186 mask!3328) (Found!7774 j!159))))))

(declare-fun b!762648 () Bool)

(assert (=> b!762648 (= e!425012 false)))

(declare-fun lt!339435 () Bool)

(assert (=> b!762648 (= lt!339435 e!425013)))

(declare-fun c!83790 () Bool)

(assert (=> b!762648 (= c!83790 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!762649 () Bool)

(assert (=> b!762649 (= e!425014 e!425015)))

(declare-fun res!515846 () Bool)

(assert (=> b!762649 (=> (not res!515846) (not e!425015))))

(declare-fun lt!339436 () SeekEntryResult!7774)

(assert (=> b!762649 (= res!515846 (or (= lt!339436 (MissingZero!7774 i!1173)) (= lt!339436 (MissingVacant!7774 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42138 (_ BitVec 32)) SeekEntryResult!7774)

(assert (=> b!762649 (= lt!339436 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!762650 () Bool)

(declare-fun res!515841 () Bool)

(assert (=> b!762650 (=> (not res!515841) (not e!425014))))

(assert (=> b!762650 (= res!515841 (validKeyInArray!0 (select (arr!20177 a!3186) j!159)))))

(declare-fun b!762651 () Bool)

(assert (=> b!762651 (= e!425013 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20177 a!3186) j!159) a!3186 mask!3328) lt!339437)))))

(declare-fun b!762652 () Bool)

(declare-fun res!515836 () Bool)

(assert (=> b!762652 (=> (not res!515836) (not e!425015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42138 (_ BitVec 32)) Bool)

(assert (=> b!762652 (= res!515836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762653 () Bool)

(declare-fun res!515843 () Bool)

(assert (=> b!762653 (=> (not res!515843) (not e!425014))))

(assert (=> b!762653 (= res!515843 (and (= (size!20598 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20598 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20598 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762654 () Bool)

(declare-fun res!515838 () Bool)

(assert (=> b!762654 (=> (not res!515838) (not e!425014))))

(declare-fun arrayContainsKey!0 (array!42138 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762654 (= res!515838 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762655 () Bool)

(declare-fun res!515842 () Bool)

(assert (=> b!762655 (=> (not res!515842) (not e!425015))))

(assert (=> b!762655 (= res!515842 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20598 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20598 a!3186))))))

(assert (= (and start!66216 res!515839) b!762653))

(assert (= (and b!762653 res!515843) b!762650))

(assert (= (and b!762650 res!515841) b!762645))

(assert (= (and b!762645 res!515840) b!762654))

(assert (= (and b!762654 res!515838) b!762649))

(assert (= (and b!762649 res!515846) b!762652))

(assert (= (and b!762652 res!515836) b!762646))

(assert (= (and b!762646 res!515837) b!762655))

(assert (= (and b!762655 res!515842) b!762643))

(assert (= (and b!762643 res!515844) b!762644))

(assert (= (and b!762644 res!515845) b!762648))

(assert (= (and b!762648 c!83790) b!762651))

(assert (= (and b!762648 (not c!83790)) b!762647))

(declare-fun m!708757 () Bool)

(assert (=> b!762651 m!708757))

(assert (=> b!762651 m!708757))

(declare-fun m!708759 () Bool)

(assert (=> b!762651 m!708759))

(declare-fun m!708761 () Bool)

(assert (=> b!762654 m!708761))

(assert (=> b!762650 m!708757))

(assert (=> b!762650 m!708757))

(declare-fun m!708763 () Bool)

(assert (=> b!762650 m!708763))

(assert (=> b!762647 m!708757))

(assert (=> b!762647 m!708757))

(declare-fun m!708765 () Bool)

(assert (=> b!762647 m!708765))

(assert (=> b!762643 m!708757))

(assert (=> b!762643 m!708757))

(declare-fun m!708767 () Bool)

(assert (=> b!762643 m!708767))

(assert (=> b!762643 m!708767))

(assert (=> b!762643 m!708757))

(declare-fun m!708769 () Bool)

(assert (=> b!762643 m!708769))

(declare-fun m!708771 () Bool)

(assert (=> b!762646 m!708771))

(declare-fun m!708773 () Bool)

(assert (=> b!762644 m!708773))

(declare-fun m!708775 () Bool)

(assert (=> b!762652 m!708775))

(declare-fun m!708777 () Bool)

(assert (=> b!762645 m!708777))

(declare-fun m!708779 () Bool)

(assert (=> start!66216 m!708779))

(declare-fun m!708781 () Bool)

(assert (=> start!66216 m!708781))

(declare-fun m!708783 () Bool)

(assert (=> b!762649 m!708783))

(check-sat (not b!762649) (not b!762643) (not b!762646) (not b!762652) (not b!762647) (not b!762645) (not b!762651) (not b!762654) (not b!762650) (not start!66216))
(check-sat)
