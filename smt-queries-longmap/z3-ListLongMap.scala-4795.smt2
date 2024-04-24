; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65958 () Bool)

(assert start!65958)

(declare-fun b!758793 () Bool)

(declare-fun res!513083 () Bool)

(declare-fun e!423119 () Bool)

(assert (=> b!758793 (=> (not res!513083) (not e!423119))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42001 0))(
  ( (array!42002 (arr!20110 (Array (_ BitVec 32) (_ BitVec 64))) (size!20530 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42001)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!758793 (= res!513083 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20530 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20530 a!3186))))))

(declare-fun b!758795 () Bool)

(declare-fun res!513091 () Bool)

(assert (=> b!758795 (=> (not res!513091) (not e!423119))))

(declare-datatypes ((List!14019 0))(
  ( (Nil!14016) (Cons!14015 (h!15093 (_ BitVec 64)) (t!20326 List!14019)) )
))
(declare-fun arrayNoDuplicates!0 (array!42001 (_ BitVec 32) List!14019) Bool)

(assert (=> b!758795 (= res!513091 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14016))))

(declare-fun b!758796 () Bool)

(declare-fun res!513082 () Bool)

(declare-fun e!423115 () Bool)

(assert (=> b!758796 (=> (not res!513082) (not e!423115))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!758796 (= res!513082 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20110 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758797 () Bool)

(declare-fun e!423123 () Bool)

(declare-fun e!423117 () Bool)

(assert (=> b!758797 (= e!423123 e!423117)))

(declare-fun res!513076 () Bool)

(assert (=> b!758797 (=> res!513076 e!423117)))

(declare-fun lt!337944 () (_ BitVec 64))

(declare-fun lt!337948 () (_ BitVec 64))

(assert (=> b!758797 (= res!513076 (= lt!337944 lt!337948))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!758797 (= lt!337944 (select (store (arr!20110 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!758798 () Bool)

(declare-fun e!423122 () Bool)

(declare-fun e!423121 () Bool)

(assert (=> b!758798 (= e!423122 (not e!423121))))

(declare-fun res!513084 () Bool)

(assert (=> b!758798 (=> res!513084 e!423121)))

(declare-datatypes ((SeekEntryResult!7666 0))(
  ( (MissingZero!7666 (index!33032 (_ BitVec 32))) (Found!7666 (index!33033 (_ BitVec 32))) (Intermediate!7666 (undefined!8478 Bool) (index!33034 (_ BitVec 32)) (x!64084 (_ BitVec 32))) (Undefined!7666) (MissingVacant!7666 (index!33035 (_ BitVec 32))) )
))
(declare-fun lt!337947 () SeekEntryResult!7666)

(get-info :version)

(assert (=> b!758798 (= res!513084 (or (not ((_ is Intermediate!7666) lt!337947)) (bvslt x!1131 (x!64084 lt!337947)) (not (= x!1131 (x!64084 lt!337947))) (not (= index!1321 (index!33034 lt!337947)))))))

(declare-fun e!423116 () Bool)

(assert (=> b!758798 e!423116))

(declare-fun res!513094 () Bool)

(assert (=> b!758798 (=> (not res!513094) (not e!423116))))

(declare-fun lt!337943 () SeekEntryResult!7666)

(declare-fun lt!337945 () SeekEntryResult!7666)

(assert (=> b!758798 (= res!513094 (= lt!337943 lt!337945))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!758798 (= lt!337945 (Found!7666 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42001 (_ BitVec 32)) SeekEntryResult!7666)

(assert (=> b!758798 (= lt!337943 (seekEntryOrOpen!0 (select (arr!20110 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42001 (_ BitVec 32)) Bool)

(assert (=> b!758798 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26221 0))(
  ( (Unit!26222) )
))
(declare-fun lt!337941 () Unit!26221)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42001 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26221)

(assert (=> b!758798 (= lt!337941 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!758799 () Bool)

(assert (=> b!758799 (= e!423119 e!423115)))

(declare-fun res!513092 () Bool)

(assert (=> b!758799 (=> (not res!513092) (not e!423115))))

(declare-fun lt!337946 () SeekEntryResult!7666)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42001 (_ BitVec 32)) SeekEntryResult!7666)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758799 (= res!513092 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20110 a!3186) j!159) mask!3328) (select (arr!20110 a!3186) j!159) a!3186 mask!3328) lt!337946))))

(assert (=> b!758799 (= lt!337946 (Intermediate!7666 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758800 () Bool)

(assert (=> b!758800 (= e!423115 e!423122)))

(declare-fun res!513080 () Bool)

(assert (=> b!758800 (=> (not res!513080) (not e!423122))))

(declare-fun lt!337949 () SeekEntryResult!7666)

(assert (=> b!758800 (= res!513080 (= lt!337949 lt!337947))))

(declare-fun lt!337950 () array!42001)

(assert (=> b!758800 (= lt!337947 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337948 lt!337950 mask!3328))))

(assert (=> b!758800 (= lt!337949 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337948 mask!3328) lt!337948 lt!337950 mask!3328))))

(assert (=> b!758800 (= lt!337948 (select (store (arr!20110 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!758800 (= lt!337950 (array!42002 (store (arr!20110 a!3186) i!1173 k0!2102) (size!20530 a!3186)))))

(declare-fun b!758801 () Bool)

(declare-fun e!423120 () Bool)

(declare-fun lt!337940 () SeekEntryResult!7666)

(assert (=> b!758801 (= e!423120 (= lt!337943 lt!337940))))

(declare-fun b!758802 () Bool)

(declare-fun res!513081 () Bool)

(declare-fun e!423114 () Bool)

(assert (=> b!758802 (=> (not res!513081) (not e!423114))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758802 (= res!513081 (validKeyInArray!0 k0!2102))))

(declare-fun b!758803 () Bool)

(declare-fun e!423118 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42001 (_ BitVec 32)) SeekEntryResult!7666)

(assert (=> b!758803 (= e!423118 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20110 a!3186) j!159) a!3186 mask!3328) (Found!7666 j!159)))))

(declare-fun b!758804 () Bool)

(declare-fun e!423113 () Unit!26221)

(declare-fun Unit!26223 () Unit!26221)

(assert (=> b!758804 (= e!423113 Unit!26223)))

(declare-fun b!758805 () Bool)

(declare-fun res!513093 () Bool)

(assert (=> b!758805 (=> (not res!513093) (not e!423120))))

(assert (=> b!758805 (= res!513093 (= (seekEntryOrOpen!0 lt!337948 lt!337950 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337948 lt!337950 mask!3328)))))

(declare-fun b!758806 () Bool)

(declare-fun res!513088 () Bool)

(assert (=> b!758806 (=> (not res!513088) (not e!423115))))

(assert (=> b!758806 (= res!513088 e!423118)))

(declare-fun c!83242 () Bool)

(assert (=> b!758806 (= c!83242 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758807 () Bool)

(declare-fun res!513090 () Bool)

(assert (=> b!758807 (=> (not res!513090) (not e!423114))))

(declare-fun arrayContainsKey!0 (array!42001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758807 (= res!513090 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758808 () Bool)

(assert (=> b!758808 (= e!423121 e!423123)))

(declare-fun res!513079 () Bool)

(assert (=> b!758808 (=> res!513079 e!423123)))

(assert (=> b!758808 (= res!513079 (not (= lt!337940 lt!337945)))))

(assert (=> b!758808 (= lt!337940 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20110 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!513087 () Bool)

(assert (=> start!65958 (=> (not res!513087) (not e!423114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65958 (= res!513087 (validMask!0 mask!3328))))

(assert (=> start!65958 e!423114))

(assert (=> start!65958 true))

(declare-fun array_inv!15969 (array!42001) Bool)

(assert (=> start!65958 (array_inv!15969 a!3186)))

(declare-fun b!758794 () Bool)

(assert (=> b!758794 (= e!423116 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20110 a!3186) j!159) a!3186 mask!3328) lt!337945))))

(declare-fun b!758809 () Bool)

(declare-fun res!513077 () Bool)

(assert (=> b!758809 (=> (not res!513077) (not e!423114))))

(assert (=> b!758809 (= res!513077 (validKeyInArray!0 (select (arr!20110 a!3186) j!159)))))

(declare-fun b!758810 () Bool)

(assert (=> b!758810 (= e!423117 true)))

(assert (=> b!758810 e!423120))

(declare-fun res!513086 () Bool)

(assert (=> b!758810 (=> (not res!513086) (not e!423120))))

(assert (=> b!758810 (= res!513086 (= lt!337944 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337942 () Unit!26221)

(assert (=> b!758810 (= lt!337942 e!423113)))

(declare-fun c!83243 () Bool)

(assert (=> b!758810 (= c!83243 (= lt!337944 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!758811 () Bool)

(declare-fun res!513089 () Bool)

(assert (=> b!758811 (=> (not res!513089) (not e!423114))))

(assert (=> b!758811 (= res!513089 (and (= (size!20530 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20530 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20530 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758812 () Bool)

(declare-fun res!513078 () Bool)

(assert (=> b!758812 (=> (not res!513078) (not e!423119))))

(assert (=> b!758812 (= res!513078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758813 () Bool)

(assert (=> b!758813 (= e!423114 e!423119)))

(declare-fun res!513085 () Bool)

(assert (=> b!758813 (=> (not res!513085) (not e!423119))))

(declare-fun lt!337939 () SeekEntryResult!7666)

(assert (=> b!758813 (= res!513085 (or (= lt!337939 (MissingZero!7666 i!1173)) (= lt!337939 (MissingVacant!7666 i!1173))))))

(assert (=> b!758813 (= lt!337939 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!758814 () Bool)

(assert (=> b!758814 (= e!423118 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20110 a!3186) j!159) a!3186 mask!3328) lt!337946))))

(declare-fun b!758815 () Bool)

(declare-fun Unit!26224 () Unit!26221)

(assert (=> b!758815 (= e!423113 Unit!26224)))

(assert (=> b!758815 false))

(assert (= (and start!65958 res!513087) b!758811))

(assert (= (and b!758811 res!513089) b!758809))

(assert (= (and b!758809 res!513077) b!758802))

(assert (= (and b!758802 res!513081) b!758807))

(assert (= (and b!758807 res!513090) b!758813))

(assert (= (and b!758813 res!513085) b!758812))

(assert (= (and b!758812 res!513078) b!758795))

(assert (= (and b!758795 res!513091) b!758793))

(assert (= (and b!758793 res!513083) b!758799))

(assert (= (and b!758799 res!513092) b!758796))

(assert (= (and b!758796 res!513082) b!758806))

(assert (= (and b!758806 c!83242) b!758814))

(assert (= (and b!758806 (not c!83242)) b!758803))

(assert (= (and b!758806 res!513088) b!758800))

(assert (= (and b!758800 res!513080) b!758798))

(assert (= (and b!758798 res!513094) b!758794))

(assert (= (and b!758798 (not res!513084)) b!758808))

(assert (= (and b!758808 (not res!513079)) b!758797))

(assert (= (and b!758797 (not res!513076)) b!758810))

(assert (= (and b!758810 c!83243) b!758815))

(assert (= (and b!758810 (not c!83243)) b!758804))

(assert (= (and b!758810 res!513086) b!758805))

(assert (= (and b!758805 res!513093) b!758801))

(declare-fun m!706767 () Bool)

(assert (=> b!758797 m!706767))

(declare-fun m!706769 () Bool)

(assert (=> b!758797 m!706769))

(declare-fun m!706771 () Bool)

(assert (=> b!758802 m!706771))

(declare-fun m!706773 () Bool)

(assert (=> b!758807 m!706773))

(declare-fun m!706775 () Bool)

(assert (=> b!758799 m!706775))

(assert (=> b!758799 m!706775))

(declare-fun m!706777 () Bool)

(assert (=> b!758799 m!706777))

(assert (=> b!758799 m!706777))

(assert (=> b!758799 m!706775))

(declare-fun m!706779 () Bool)

(assert (=> b!758799 m!706779))

(assert (=> b!758794 m!706775))

(assert (=> b!758794 m!706775))

(declare-fun m!706781 () Bool)

(assert (=> b!758794 m!706781))

(assert (=> b!758809 m!706775))

(assert (=> b!758809 m!706775))

(declare-fun m!706783 () Bool)

(assert (=> b!758809 m!706783))

(declare-fun m!706785 () Bool)

(assert (=> b!758796 m!706785))

(assert (=> b!758814 m!706775))

(assert (=> b!758814 m!706775))

(declare-fun m!706787 () Bool)

(assert (=> b!758814 m!706787))

(assert (=> b!758798 m!706775))

(assert (=> b!758798 m!706775))

(declare-fun m!706789 () Bool)

(assert (=> b!758798 m!706789))

(declare-fun m!706791 () Bool)

(assert (=> b!758798 m!706791))

(declare-fun m!706793 () Bool)

(assert (=> b!758798 m!706793))

(declare-fun m!706795 () Bool)

(assert (=> start!65958 m!706795))

(declare-fun m!706797 () Bool)

(assert (=> start!65958 m!706797))

(declare-fun m!706799 () Bool)

(assert (=> b!758795 m!706799))

(assert (=> b!758800 m!706767))

(declare-fun m!706801 () Bool)

(assert (=> b!758800 m!706801))

(declare-fun m!706803 () Bool)

(assert (=> b!758800 m!706803))

(declare-fun m!706805 () Bool)

(assert (=> b!758800 m!706805))

(assert (=> b!758800 m!706805))

(declare-fun m!706807 () Bool)

(assert (=> b!758800 m!706807))

(declare-fun m!706809 () Bool)

(assert (=> b!758812 m!706809))

(declare-fun m!706811 () Bool)

(assert (=> b!758805 m!706811))

(declare-fun m!706813 () Bool)

(assert (=> b!758805 m!706813))

(assert (=> b!758808 m!706775))

(assert (=> b!758808 m!706775))

(declare-fun m!706815 () Bool)

(assert (=> b!758808 m!706815))

(assert (=> b!758803 m!706775))

(assert (=> b!758803 m!706775))

(assert (=> b!758803 m!706815))

(declare-fun m!706817 () Bool)

(assert (=> b!758813 m!706817))

(check-sat (not b!758795) (not b!758803) (not b!758802) (not b!758805) (not b!758808) (not b!758807) (not b!758809) (not b!758814) (not b!758800) (not b!758813) (not b!758799) (not start!65958) (not b!758794) (not b!758798) (not b!758812))
(check-sat)
