; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65780 () Bool)

(assert start!65780)

(declare-fun b!756763 () Bool)

(declare-fun e!421951 () Bool)

(declare-datatypes ((SeekEntryResult!7696 0))(
  ( (MissingZero!7696 (index!33152 (_ BitVec 32))) (Found!7696 (index!33153 (_ BitVec 32))) (Intermediate!7696 (undefined!8508 Bool) (index!33154 (_ BitVec 32)) (x!64057 (_ BitVec 32))) (Undefined!7696) (MissingVacant!7696 (index!33155 (_ BitVec 32))) )
))
(declare-fun lt!336849 () SeekEntryResult!7696)

(declare-fun lt!336857 () SeekEntryResult!7696)

(assert (=> b!756763 (= e!421951 (= lt!336849 lt!336857))))

(declare-fun b!756764 () Bool)

(declare-fun res!511823 () Bool)

(declare-fun e!421940 () Bool)

(assert (=> b!756764 (=> (not res!511823) (not e!421940))))

(declare-datatypes ((array!41970 0))(
  ( (array!41971 (arr!20099 (Array (_ BitVec 32) (_ BitVec 64))) (size!20520 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41970)

(declare-datatypes ((List!14140 0))(
  ( (Nil!14137) (Cons!14136 (h!15208 (_ BitVec 64)) (t!20446 List!14140)) )
))
(declare-fun arrayNoDuplicates!0 (array!41970 (_ BitVec 32) List!14140) Bool)

(assert (=> b!756764 (= res!511823 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14137))))

(declare-fun b!756765 () Bool)

(declare-fun e!421941 () Bool)

(declare-fun e!421947 () Bool)

(assert (=> b!756765 (= e!421941 e!421947)))

(declare-fun res!511820 () Bool)

(assert (=> b!756765 (=> (not res!511820) (not e!421947))))

(declare-fun lt!336854 () SeekEntryResult!7696)

(declare-fun lt!336856 () SeekEntryResult!7696)

(assert (=> b!756765 (= res!511820 (= lt!336854 lt!336856))))

(declare-fun lt!336850 () array!41970)

(declare-fun lt!336848 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41970 (_ BitVec 32)) SeekEntryResult!7696)

(assert (=> b!756765 (= lt!336856 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336848 lt!336850 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756765 (= lt!336854 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336848 mask!3328) lt!336848 lt!336850 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!756765 (= lt!336848 (select (store (arr!20099 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!756765 (= lt!336850 (array!41971 (store (arr!20099 a!3186) i!1173 k0!2102) (size!20520 a!3186)))))

(declare-fun b!756766 () Bool)

(declare-fun e!421942 () Bool)

(assert (=> b!756766 (= e!421947 (not e!421942))))

(declare-fun res!511809 () Bool)

(assert (=> b!756766 (=> res!511809 e!421942)))

(get-info :version)

(assert (=> b!756766 (= res!511809 (or (not ((_ is Intermediate!7696) lt!336856)) (bvslt x!1131 (x!64057 lt!336856)) (not (= x!1131 (x!64057 lt!336856))) (not (= index!1321 (index!33154 lt!336856)))))))

(declare-fun e!421944 () Bool)

(assert (=> b!756766 e!421944))

(declare-fun res!511819 () Bool)

(assert (=> b!756766 (=> (not res!511819) (not e!421944))))

(declare-fun lt!336846 () SeekEntryResult!7696)

(assert (=> b!756766 (= res!511819 (= lt!336849 lt!336846))))

(assert (=> b!756766 (= lt!336846 (Found!7696 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41970 (_ BitVec 32)) SeekEntryResult!7696)

(assert (=> b!756766 (= lt!336849 (seekEntryOrOpen!0 (select (arr!20099 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41970 (_ BitVec 32)) Bool)

(assert (=> b!756766 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26144 0))(
  ( (Unit!26145) )
))
(declare-fun lt!336852 () Unit!26144)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41970 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26144)

(assert (=> b!756766 (= lt!336852 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!756767 () Bool)

(declare-fun e!421950 () Bool)

(assert (=> b!756767 (= e!421950 e!421940)))

(declare-fun res!511811 () Bool)

(assert (=> b!756767 (=> (not res!511811) (not e!421940))))

(declare-fun lt!336855 () SeekEntryResult!7696)

(assert (=> b!756767 (= res!511811 (or (= lt!336855 (MissingZero!7696 i!1173)) (= lt!336855 (MissingVacant!7696 i!1173))))))

(assert (=> b!756767 (= lt!336855 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!756768 () Bool)

(declare-fun e!421949 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41970 (_ BitVec 32)) SeekEntryResult!7696)

(assert (=> b!756768 (= e!421949 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20099 a!3186) j!159) a!3186 mask!3328) (Found!7696 j!159)))))

(declare-fun b!756769 () Bool)

(declare-fun e!421943 () Unit!26144)

(declare-fun Unit!26146 () Unit!26144)

(assert (=> b!756769 (= e!421943 Unit!26146)))

(assert (=> b!756769 false))

(declare-fun b!756770 () Bool)

(declare-fun e!421945 () Bool)

(assert (=> b!756770 (= e!421945 true)))

(assert (=> b!756770 e!421951))

(declare-fun res!511807 () Bool)

(assert (=> b!756770 (=> (not res!511807) (not e!421951))))

(declare-fun lt!336853 () (_ BitVec 64))

(assert (=> b!756770 (= res!511807 (= lt!336853 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336851 () Unit!26144)

(assert (=> b!756770 (= lt!336851 e!421943)))

(declare-fun c!82859 () Bool)

(assert (=> b!756770 (= c!82859 (= lt!336853 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756771 () Bool)

(declare-fun res!511821 () Bool)

(assert (=> b!756771 (=> (not res!511821) (not e!421941))))

(assert (=> b!756771 (= res!511821 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20099 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756773 () Bool)

(assert (=> b!756773 (= e!421940 e!421941)))

(declare-fun res!511810 () Bool)

(assert (=> b!756773 (=> (not res!511810) (not e!421941))))

(declare-fun lt!336847 () SeekEntryResult!7696)

(assert (=> b!756773 (= res!511810 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20099 a!3186) j!159) mask!3328) (select (arr!20099 a!3186) j!159) a!3186 mask!3328) lt!336847))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!756773 (= lt!336847 (Intermediate!7696 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756774 () Bool)

(declare-fun res!511816 () Bool)

(assert (=> b!756774 (=> (not res!511816) (not e!421950))))

(declare-fun arrayContainsKey!0 (array!41970 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756774 (= res!511816 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756775 () Bool)

(declare-fun Unit!26147 () Unit!26144)

(assert (=> b!756775 (= e!421943 Unit!26147)))

(declare-fun b!756776 () Bool)

(declare-fun res!511806 () Bool)

(assert (=> b!756776 (=> (not res!511806) (not e!421940))))

(assert (=> b!756776 (= res!511806 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20520 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20520 a!3186))))))

(declare-fun b!756777 () Bool)

(declare-fun res!511815 () Bool)

(assert (=> b!756777 (=> (not res!511815) (not e!421950))))

(assert (=> b!756777 (= res!511815 (and (= (size!20520 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20520 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20520 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756778 () Bool)

(declare-fun e!421946 () Bool)

(assert (=> b!756778 (= e!421946 e!421945)))

(declare-fun res!511808 () Bool)

(assert (=> b!756778 (=> res!511808 e!421945)))

(assert (=> b!756778 (= res!511808 (= lt!336853 lt!336848))))

(assert (=> b!756778 (= lt!336853 (select (store (arr!20099 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!756779 () Bool)

(assert (=> b!756779 (= e!421949 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20099 a!3186) j!159) a!3186 mask!3328) lt!336847))))

(declare-fun b!756780 () Bool)

(assert (=> b!756780 (= e!421944 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20099 a!3186) j!159) a!3186 mask!3328) lt!336846))))

(declare-fun b!756781 () Bool)

(declare-fun res!511814 () Bool)

(assert (=> b!756781 (=> (not res!511814) (not e!421951))))

(assert (=> b!756781 (= res!511814 (= (seekEntryOrOpen!0 lt!336848 lt!336850 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336848 lt!336850 mask!3328)))))

(declare-fun b!756782 () Bool)

(declare-fun res!511818 () Bool)

(assert (=> b!756782 (=> (not res!511818) (not e!421950))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756782 (= res!511818 (validKeyInArray!0 (select (arr!20099 a!3186) j!159)))))

(declare-fun b!756783 () Bool)

(declare-fun res!511822 () Bool)

(assert (=> b!756783 (=> (not res!511822) (not e!421941))))

(assert (=> b!756783 (= res!511822 e!421949)))

(declare-fun c!82860 () Bool)

(assert (=> b!756783 (= c!82860 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756772 () Bool)

(assert (=> b!756772 (= e!421942 e!421946)))

(declare-fun res!511812 () Bool)

(assert (=> b!756772 (=> res!511812 e!421946)))

(assert (=> b!756772 (= res!511812 (not (= lt!336857 lt!336846)))))

(assert (=> b!756772 (= lt!336857 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20099 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!511824 () Bool)

(assert (=> start!65780 (=> (not res!511824) (not e!421950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65780 (= res!511824 (validMask!0 mask!3328))))

(assert (=> start!65780 e!421950))

(assert (=> start!65780 true))

(declare-fun array_inv!15982 (array!41970) Bool)

(assert (=> start!65780 (array_inv!15982 a!3186)))

(declare-fun b!756784 () Bool)

(declare-fun res!511817 () Bool)

(assert (=> b!756784 (=> (not res!511817) (not e!421940))))

(assert (=> b!756784 (= res!511817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756785 () Bool)

(declare-fun res!511813 () Bool)

(assert (=> b!756785 (=> (not res!511813) (not e!421950))))

(assert (=> b!756785 (= res!511813 (validKeyInArray!0 k0!2102))))

(assert (= (and start!65780 res!511824) b!756777))

(assert (= (and b!756777 res!511815) b!756782))

(assert (= (and b!756782 res!511818) b!756785))

(assert (= (and b!756785 res!511813) b!756774))

(assert (= (and b!756774 res!511816) b!756767))

(assert (= (and b!756767 res!511811) b!756784))

(assert (= (and b!756784 res!511817) b!756764))

(assert (= (and b!756764 res!511823) b!756776))

(assert (= (and b!756776 res!511806) b!756773))

(assert (= (and b!756773 res!511810) b!756771))

(assert (= (and b!756771 res!511821) b!756783))

(assert (= (and b!756783 c!82860) b!756779))

(assert (= (and b!756783 (not c!82860)) b!756768))

(assert (= (and b!756783 res!511822) b!756765))

(assert (= (and b!756765 res!511820) b!756766))

(assert (= (and b!756766 res!511819) b!756780))

(assert (= (and b!756766 (not res!511809)) b!756772))

(assert (= (and b!756772 (not res!511812)) b!756778))

(assert (= (and b!756778 (not res!511808)) b!756770))

(assert (= (and b!756770 c!82859) b!756769))

(assert (= (and b!756770 (not c!82859)) b!756775))

(assert (= (and b!756770 res!511807) b!756781))

(assert (= (and b!756781 res!511814) b!756763))

(declare-fun m!704069 () Bool)

(assert (=> b!756764 m!704069))

(declare-fun m!704071 () Bool)

(assert (=> b!756771 m!704071))

(declare-fun m!704073 () Bool)

(assert (=> start!65780 m!704073))

(declare-fun m!704075 () Bool)

(assert (=> start!65780 m!704075))

(declare-fun m!704077 () Bool)

(assert (=> b!756767 m!704077))

(declare-fun m!704079 () Bool)

(assert (=> b!756774 m!704079))

(declare-fun m!704081 () Bool)

(assert (=> b!756772 m!704081))

(assert (=> b!756772 m!704081))

(declare-fun m!704083 () Bool)

(assert (=> b!756772 m!704083))

(declare-fun m!704085 () Bool)

(assert (=> b!756785 m!704085))

(assert (=> b!756768 m!704081))

(assert (=> b!756768 m!704081))

(assert (=> b!756768 m!704083))

(declare-fun m!704087 () Bool)

(assert (=> b!756784 m!704087))

(declare-fun m!704089 () Bool)

(assert (=> b!756781 m!704089))

(declare-fun m!704091 () Bool)

(assert (=> b!756781 m!704091))

(assert (=> b!756780 m!704081))

(assert (=> b!756780 m!704081))

(declare-fun m!704093 () Bool)

(assert (=> b!756780 m!704093))

(assert (=> b!756773 m!704081))

(assert (=> b!756773 m!704081))

(declare-fun m!704095 () Bool)

(assert (=> b!756773 m!704095))

(assert (=> b!756773 m!704095))

(assert (=> b!756773 m!704081))

(declare-fun m!704097 () Bool)

(assert (=> b!756773 m!704097))

(assert (=> b!756766 m!704081))

(assert (=> b!756766 m!704081))

(declare-fun m!704099 () Bool)

(assert (=> b!756766 m!704099))

(declare-fun m!704101 () Bool)

(assert (=> b!756766 m!704101))

(declare-fun m!704103 () Bool)

(assert (=> b!756766 m!704103))

(assert (=> b!756779 m!704081))

(assert (=> b!756779 m!704081))

(declare-fun m!704105 () Bool)

(assert (=> b!756779 m!704105))

(assert (=> b!756782 m!704081))

(assert (=> b!756782 m!704081))

(declare-fun m!704107 () Bool)

(assert (=> b!756782 m!704107))

(declare-fun m!704109 () Bool)

(assert (=> b!756778 m!704109))

(declare-fun m!704111 () Bool)

(assert (=> b!756778 m!704111))

(assert (=> b!756765 m!704109))

(declare-fun m!704113 () Bool)

(assert (=> b!756765 m!704113))

(declare-fun m!704115 () Bool)

(assert (=> b!756765 m!704115))

(declare-fun m!704117 () Bool)

(assert (=> b!756765 m!704117))

(assert (=> b!756765 m!704117))

(declare-fun m!704119 () Bool)

(assert (=> b!756765 m!704119))

(check-sat (not b!756768) (not b!756779) (not b!756785) (not b!756774) (not b!756772) (not b!756773) (not b!756765) (not b!756780) (not b!756766) (not start!65780) (not b!756764) (not b!756767) (not b!756781) (not b!756782) (not b!756784))
(check-sat)
