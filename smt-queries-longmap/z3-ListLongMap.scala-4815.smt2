; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66232 () Bool)

(assert start!66232)

(declare-fun b!762815 () Bool)

(declare-fun res!515883 () Bool)

(declare-fun e!425138 () Bool)

(assert (=> b!762815 (=> (not res!515883) (not e!425138))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42137 0))(
  ( (array!42138 (arr!20176 (Array (_ BitVec 32) (_ BitVec 64))) (size!20597 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42137)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762815 (= res!515883 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20176 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!762816 () Bool)

(declare-fun res!515888 () Bool)

(declare-fun e!425136 () Bool)

(assert (=> b!762816 (=> (not res!515888) (not e!425136))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762816 (= res!515888 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20597 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20597 a!3186))))))

(declare-fun b!762817 () Bool)

(assert (=> b!762817 (= e!425138 false)))

(declare-fun lt!339658 () Bool)

(declare-fun e!425135 () Bool)

(assert (=> b!762817 (= lt!339658 e!425135)))

(declare-fun c!83854 () Bool)

(assert (=> b!762817 (= c!83854 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!762818 () Bool)

(declare-fun res!515886 () Bool)

(declare-fun e!425139 () Bool)

(assert (=> b!762818 (=> (not res!515886) (not e!425139))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762818 (= res!515886 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762819 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7776 0))(
  ( (MissingZero!7776 (index!33472 (_ BitVec 32))) (Found!7776 (index!33473 (_ BitVec 32))) (Intermediate!7776 (undefined!8588 Bool) (index!33474 (_ BitVec 32)) (x!64380 (_ BitVec 32))) (Undefined!7776) (MissingVacant!7776 (index!33475 (_ BitVec 32))) )
))
(declare-fun lt!339659 () SeekEntryResult!7776)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42137 (_ BitVec 32)) SeekEntryResult!7776)

(assert (=> b!762819 (= e!425135 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20176 a!3186) j!159) a!3186 mask!3328) lt!339659)))))

(declare-fun b!762820 () Bool)

(declare-fun res!515881 () Bool)

(assert (=> b!762820 (=> (not res!515881) (not e!425136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42137 (_ BitVec 32)) Bool)

(assert (=> b!762820 (= res!515881 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762821 () Bool)

(declare-fun res!515885 () Bool)

(assert (=> b!762821 (=> (not res!515885) (not e!425136))))

(declare-datatypes ((List!14178 0))(
  ( (Nil!14175) (Cons!14174 (h!15258 (_ BitVec 64)) (t!20493 List!14178)) )
))
(declare-fun arrayNoDuplicates!0 (array!42137 (_ BitVec 32) List!14178) Bool)

(assert (=> b!762821 (= res!515885 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14175))))

(declare-fun b!762822 () Bool)

(declare-fun res!515889 () Bool)

(assert (=> b!762822 (=> (not res!515889) (not e!425139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762822 (= res!515889 (validKeyInArray!0 k0!2102))))

(declare-fun res!515882 () Bool)

(assert (=> start!66232 (=> (not res!515882) (not e!425139))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66232 (= res!515882 (validMask!0 mask!3328))))

(assert (=> start!66232 e!425139))

(assert (=> start!66232 true))

(declare-fun array_inv!15972 (array!42137) Bool)

(assert (=> start!66232 (array_inv!15972 a!3186)))

(declare-fun b!762823 () Bool)

(assert (=> b!762823 (= e!425139 e!425136)))

(declare-fun res!515890 () Bool)

(assert (=> b!762823 (=> (not res!515890) (not e!425136))))

(declare-fun lt!339657 () SeekEntryResult!7776)

(assert (=> b!762823 (= res!515890 (or (= lt!339657 (MissingZero!7776 i!1173)) (= lt!339657 (MissingVacant!7776 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42137 (_ BitVec 32)) SeekEntryResult!7776)

(assert (=> b!762823 (= lt!339657 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!762824 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42137 (_ BitVec 32)) SeekEntryResult!7776)

(assert (=> b!762824 (= e!425135 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20176 a!3186) j!159) a!3186 mask!3328) (Found!7776 j!159))))))

(declare-fun b!762825 () Bool)

(declare-fun res!515884 () Bool)

(assert (=> b!762825 (=> (not res!515884) (not e!425139))))

(assert (=> b!762825 (= res!515884 (and (= (size!20597 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20597 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20597 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762826 () Bool)

(assert (=> b!762826 (= e!425136 e!425138)))

(declare-fun res!515880 () Bool)

(assert (=> b!762826 (=> (not res!515880) (not e!425138))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762826 (= res!515880 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20176 a!3186) j!159) mask!3328) (select (arr!20176 a!3186) j!159) a!3186 mask!3328) lt!339659))))

(assert (=> b!762826 (= lt!339659 (Intermediate!7776 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!762827 () Bool)

(declare-fun res!515887 () Bool)

(assert (=> b!762827 (=> (not res!515887) (not e!425139))))

(assert (=> b!762827 (= res!515887 (validKeyInArray!0 (select (arr!20176 a!3186) j!159)))))

(assert (= (and start!66232 res!515882) b!762825))

(assert (= (and b!762825 res!515884) b!762827))

(assert (= (and b!762827 res!515887) b!762822))

(assert (= (and b!762822 res!515889) b!762818))

(assert (= (and b!762818 res!515886) b!762823))

(assert (= (and b!762823 res!515890) b!762820))

(assert (= (and b!762820 res!515881) b!762821))

(assert (= (and b!762821 res!515885) b!762816))

(assert (= (and b!762816 res!515888) b!762826))

(assert (= (and b!762826 res!515880) b!762815))

(assert (= (and b!762815 res!515883) b!762817))

(assert (= (and b!762817 c!83854) b!762819))

(assert (= (and b!762817 (not c!83854)) b!762824))

(declare-fun m!709459 () Bool)

(assert (=> b!762823 m!709459))

(declare-fun m!709461 () Bool)

(assert (=> b!762827 m!709461))

(assert (=> b!762827 m!709461))

(declare-fun m!709463 () Bool)

(assert (=> b!762827 m!709463))

(declare-fun m!709465 () Bool)

(assert (=> b!762821 m!709465))

(assert (=> b!762824 m!709461))

(assert (=> b!762824 m!709461))

(declare-fun m!709467 () Bool)

(assert (=> b!762824 m!709467))

(assert (=> b!762819 m!709461))

(assert (=> b!762819 m!709461))

(declare-fun m!709469 () Bool)

(assert (=> b!762819 m!709469))

(assert (=> b!762826 m!709461))

(assert (=> b!762826 m!709461))

(declare-fun m!709471 () Bool)

(assert (=> b!762826 m!709471))

(assert (=> b!762826 m!709471))

(assert (=> b!762826 m!709461))

(declare-fun m!709473 () Bool)

(assert (=> b!762826 m!709473))

(declare-fun m!709475 () Bool)

(assert (=> b!762822 m!709475))

(declare-fun m!709477 () Bool)

(assert (=> start!66232 m!709477))

(declare-fun m!709479 () Bool)

(assert (=> start!66232 m!709479))

(declare-fun m!709481 () Bool)

(assert (=> b!762815 m!709481))

(declare-fun m!709483 () Bool)

(assert (=> b!762818 m!709483))

(declare-fun m!709485 () Bool)

(assert (=> b!762820 m!709485))

(check-sat (not b!762822) (not b!762827) (not b!762818) (not b!762821) (not b!762826) (not b!762819) (not start!66232) (not b!762824) (not b!762820) (not b!762823))
(check-sat)
