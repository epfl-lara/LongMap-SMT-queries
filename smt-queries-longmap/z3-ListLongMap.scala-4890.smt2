; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67570 () Bool)

(assert start!67570)

(declare-fun b!780877 () Bool)

(declare-fun res!528135 () Bool)

(declare-fun e!434459 () Bool)

(assert (=> b!780877 (=> (not res!528135) (not e!434459))))

(declare-datatypes ((array!42616 0))(
  ( (array!42617 (arr!20395 (Array (_ BitVec 32) (_ BitVec 64))) (size!20815 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42616)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!780877 (= res!528135 (validKeyInArray!0 (select (arr!20395 a!3186) j!159)))))

(declare-fun b!780878 () Bool)

(declare-fun res!528126 () Bool)

(declare-fun e!434464 () Bool)

(assert (=> b!780878 (=> (not res!528126) (not e!434464))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!780878 (= res!528126 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20815 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20815 a!3186))))))

(declare-fun b!780879 () Bool)

(declare-fun e!434465 () Bool)

(declare-fun e!434467 () Bool)

(assert (=> b!780879 (= e!434465 e!434467)))

(declare-fun res!528128 () Bool)

(assert (=> b!780879 (=> (not res!528128) (not e!434467))))

(declare-datatypes ((SeekEntryResult!7951 0))(
  ( (MissingZero!7951 (index!34172 (_ BitVec 32))) (Found!7951 (index!34173 (_ BitVec 32))) (Intermediate!7951 (undefined!8763 Bool) (index!34174 (_ BitVec 32)) (x!65284 (_ BitVec 32))) (Undefined!7951) (MissingVacant!7951 (index!34175 (_ BitVec 32))) )
))
(declare-fun lt!347954 () SeekEntryResult!7951)

(declare-fun lt!347956 () SeekEntryResult!7951)

(assert (=> b!780879 (= res!528128 (= lt!347954 lt!347956))))

(declare-fun lt!347950 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!347947 () array!42616)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42616 (_ BitVec 32)) SeekEntryResult!7951)

(assert (=> b!780879 (= lt!347956 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347950 lt!347947 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!780879 (= lt!347954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347950 mask!3328) lt!347950 lt!347947 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!780879 (= lt!347950 (select (store (arr!20395 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!780879 (= lt!347947 (array!42617 (store (arr!20395 a!3186) i!1173 k0!2102) (size!20815 a!3186)))))

(declare-fun b!780880 () Bool)

(declare-fun e!434462 () Bool)

(assert (=> b!780880 (= e!434462 false)))

(declare-fun lt!347949 () SeekEntryResult!7951)

(declare-fun lt!347953 () SeekEntryResult!7951)

(assert (=> b!780880 (and (= lt!347949 lt!347953) (= lt!347953 (MissingVacant!7951 resIntermediateIndex!5)))))

(declare-fun b!780881 () Bool)

(declare-fun res!528139 () Bool)

(assert (=> b!780881 (=> (not res!528139) (not e!434464))))

(declare-datatypes ((List!14304 0))(
  ( (Nil!14301) (Cons!14300 (h!15423 (_ BitVec 64)) (t!20611 List!14304)) )
))
(declare-fun arrayNoDuplicates!0 (array!42616 (_ BitVec 32) List!14304) Bool)

(assert (=> b!780881 (= res!528139 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14301))))

(declare-fun b!780882 () Bool)

(declare-fun res!528141 () Bool)

(assert (=> b!780882 (=> (not res!528141) (not e!434459))))

(assert (=> b!780882 (= res!528141 (validKeyInArray!0 k0!2102))))

(declare-fun b!780883 () Bool)

(declare-fun e!434463 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42616 (_ BitVec 32)) SeekEntryResult!7951)

(assert (=> b!780883 (= e!434463 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20395 a!3186) j!159) a!3186 mask!3328) (Found!7951 j!159)))))

(declare-fun b!780885 () Bool)

(declare-fun e!434466 () Bool)

(assert (=> b!780885 (= e!434467 (not e!434466))))

(declare-fun res!528137 () Bool)

(assert (=> b!780885 (=> res!528137 e!434466)))

(get-info :version)

(assert (=> b!780885 (= res!528137 (or (not ((_ is Intermediate!7951) lt!347956)) (bvslt x!1131 (x!65284 lt!347956)) (not (= x!1131 (x!65284 lt!347956))) (not (= index!1321 (index!34174 lt!347956)))))))

(declare-fun e!434460 () Bool)

(assert (=> b!780885 e!434460))

(declare-fun res!528140 () Bool)

(assert (=> b!780885 (=> (not res!528140) (not e!434460))))

(declare-fun lt!347952 () SeekEntryResult!7951)

(assert (=> b!780885 (= res!528140 (= lt!347949 lt!347952))))

(assert (=> b!780885 (= lt!347952 (Found!7951 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42616 (_ BitVec 32)) SeekEntryResult!7951)

(assert (=> b!780885 (= lt!347949 (seekEntryOrOpen!0 (select (arr!20395 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42616 (_ BitVec 32)) Bool)

(assert (=> b!780885 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26875 0))(
  ( (Unit!26876) )
))
(declare-fun lt!347955 () Unit!26875)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26875)

(assert (=> b!780885 (= lt!347955 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!780886 () Bool)

(declare-fun res!528127 () Bool)

(assert (=> b!780886 (=> (not res!528127) (not e!434465))))

(assert (=> b!780886 (= res!528127 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20395 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!780887 () Bool)

(declare-fun res!528130 () Bool)

(assert (=> b!780887 (=> (not res!528130) (not e!434465))))

(assert (=> b!780887 (= res!528130 e!434463)))

(declare-fun c!86783 () Bool)

(assert (=> b!780887 (= c!86783 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!780888 () Bool)

(assert (=> b!780888 (= e!434466 e!434462)))

(declare-fun res!528138 () Bool)

(assert (=> b!780888 (=> res!528138 e!434462)))

(assert (=> b!780888 (= res!528138 (or (not (= lt!347953 lt!347952)) (= (select (store (arr!20395 a!3186) i!1173 k0!2102) index!1321) lt!347950) (not (= (select (store (arr!20395 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!780888 (= lt!347953 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20395 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!780889 () Bool)

(declare-fun res!528129 () Bool)

(assert (=> b!780889 (=> (not res!528129) (not e!434459))))

(declare-fun arrayContainsKey!0 (array!42616 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!780889 (= res!528129 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!780890 () Bool)

(assert (=> b!780890 (= e!434460 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20395 a!3186) j!159) a!3186 mask!3328) lt!347952))))

(declare-fun b!780891 () Bool)

(declare-fun lt!347948 () SeekEntryResult!7951)

(assert (=> b!780891 (= e!434463 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20395 a!3186) j!159) a!3186 mask!3328) lt!347948))))

(declare-fun b!780892 () Bool)

(declare-fun res!528136 () Bool)

(assert (=> b!780892 (=> (not res!528136) (not e!434459))))

(assert (=> b!780892 (= res!528136 (and (= (size!20815 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20815 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20815 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!780893 () Bool)

(assert (=> b!780893 (= e!434464 e!434465)))

(declare-fun res!528134 () Bool)

(assert (=> b!780893 (=> (not res!528134) (not e!434465))))

(assert (=> b!780893 (= res!528134 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20395 a!3186) j!159) mask!3328) (select (arr!20395 a!3186) j!159) a!3186 mask!3328) lt!347948))))

(assert (=> b!780893 (= lt!347948 (Intermediate!7951 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!780894 () Bool)

(declare-fun res!528131 () Bool)

(assert (=> b!780894 (=> (not res!528131) (not e!434464))))

(assert (=> b!780894 (= res!528131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!780884 () Bool)

(assert (=> b!780884 (= e!434459 e!434464)))

(declare-fun res!528133 () Bool)

(assert (=> b!780884 (=> (not res!528133) (not e!434464))))

(declare-fun lt!347951 () SeekEntryResult!7951)

(assert (=> b!780884 (= res!528133 (or (= lt!347951 (MissingZero!7951 i!1173)) (= lt!347951 (MissingVacant!7951 i!1173))))))

(assert (=> b!780884 (= lt!347951 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!528132 () Bool)

(assert (=> start!67570 (=> (not res!528132) (not e!434459))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67570 (= res!528132 (validMask!0 mask!3328))))

(assert (=> start!67570 e!434459))

(assert (=> start!67570 true))

(declare-fun array_inv!16254 (array!42616) Bool)

(assert (=> start!67570 (array_inv!16254 a!3186)))

(assert (= (and start!67570 res!528132) b!780892))

(assert (= (and b!780892 res!528136) b!780877))

(assert (= (and b!780877 res!528135) b!780882))

(assert (= (and b!780882 res!528141) b!780889))

(assert (= (and b!780889 res!528129) b!780884))

(assert (= (and b!780884 res!528133) b!780894))

(assert (= (and b!780894 res!528131) b!780881))

(assert (= (and b!780881 res!528139) b!780878))

(assert (= (and b!780878 res!528126) b!780893))

(assert (= (and b!780893 res!528134) b!780886))

(assert (= (and b!780886 res!528127) b!780887))

(assert (= (and b!780887 c!86783) b!780891))

(assert (= (and b!780887 (not c!86783)) b!780883))

(assert (= (and b!780887 res!528130) b!780879))

(assert (= (and b!780879 res!528128) b!780885))

(assert (= (and b!780885 res!528140) b!780890))

(assert (= (and b!780885 (not res!528137)) b!780888))

(assert (= (and b!780888 (not res!528138)) b!780880))

(declare-fun m!724631 () Bool)

(assert (=> b!780894 m!724631))

(declare-fun m!724633 () Bool)

(assert (=> b!780889 m!724633))

(declare-fun m!724635 () Bool)

(assert (=> start!67570 m!724635))

(declare-fun m!724637 () Bool)

(assert (=> start!67570 m!724637))

(declare-fun m!724639 () Bool)

(assert (=> b!780882 m!724639))

(declare-fun m!724641 () Bool)

(assert (=> b!780881 m!724641))

(declare-fun m!724643 () Bool)

(assert (=> b!780877 m!724643))

(assert (=> b!780877 m!724643))

(declare-fun m!724645 () Bool)

(assert (=> b!780877 m!724645))

(assert (=> b!780883 m!724643))

(assert (=> b!780883 m!724643))

(declare-fun m!724647 () Bool)

(assert (=> b!780883 m!724647))

(declare-fun m!724649 () Bool)

(assert (=> b!780888 m!724649))

(declare-fun m!724651 () Bool)

(assert (=> b!780888 m!724651))

(assert (=> b!780888 m!724643))

(assert (=> b!780888 m!724643))

(assert (=> b!780888 m!724647))

(assert (=> b!780890 m!724643))

(assert (=> b!780890 m!724643))

(declare-fun m!724653 () Bool)

(assert (=> b!780890 m!724653))

(assert (=> b!780891 m!724643))

(assert (=> b!780891 m!724643))

(declare-fun m!724655 () Bool)

(assert (=> b!780891 m!724655))

(declare-fun m!724657 () Bool)

(assert (=> b!780886 m!724657))

(declare-fun m!724659 () Bool)

(assert (=> b!780884 m!724659))

(declare-fun m!724661 () Bool)

(assert (=> b!780879 m!724661))

(assert (=> b!780879 m!724649))

(declare-fun m!724663 () Bool)

(assert (=> b!780879 m!724663))

(declare-fun m!724665 () Bool)

(assert (=> b!780879 m!724665))

(assert (=> b!780879 m!724661))

(declare-fun m!724667 () Bool)

(assert (=> b!780879 m!724667))

(assert (=> b!780885 m!724643))

(assert (=> b!780885 m!724643))

(declare-fun m!724669 () Bool)

(assert (=> b!780885 m!724669))

(declare-fun m!724671 () Bool)

(assert (=> b!780885 m!724671))

(declare-fun m!724673 () Bool)

(assert (=> b!780885 m!724673))

(assert (=> b!780893 m!724643))

(assert (=> b!780893 m!724643))

(declare-fun m!724675 () Bool)

(assert (=> b!780893 m!724675))

(assert (=> b!780893 m!724675))

(assert (=> b!780893 m!724643))

(declare-fun m!724677 () Bool)

(assert (=> b!780893 m!724677))

(check-sat (not b!780888) (not start!67570) (not b!780883) (not b!780890) (not b!780882) (not b!780893) (not b!780884) (not b!780885) (not b!780891) (not b!780889) (not b!780877) (not b!780881) (not b!780894) (not b!780879))
(check-sat)
