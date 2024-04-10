; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65166 () Bool)

(assert start!65166)

(declare-fun b!736756 () Bool)

(declare-fun res!495165 () Bool)

(declare-fun e!412134 () Bool)

(assert (=> b!736756 (=> (not res!495165) (not e!412134))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41339 0))(
  ( (array!41340 (arr!19783 (Array (_ BitVec 32) (_ BitVec 64))) (size!20204 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41339)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!736756 (= res!495165 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19783 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736757 () Bool)

(declare-fun e!412138 () Bool)

(declare-fun e!412140 () Bool)

(assert (=> b!736757 (= e!412138 e!412140)))

(declare-fun res!495181 () Bool)

(assert (=> b!736757 (=> (not res!495181) (not e!412140))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7383 0))(
  ( (MissingZero!7383 (index!31900 (_ BitVec 32))) (Found!7383 (index!31901 (_ BitVec 32))) (Intermediate!7383 (undefined!8195 Bool) (index!31902 (_ BitVec 32)) (x!62901 (_ BitVec 32))) (Undefined!7383) (MissingVacant!7383 (index!31903 (_ BitVec 32))) )
))
(declare-fun lt!326783 () SeekEntryResult!7383)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41339 (_ BitVec 32)) SeekEntryResult!7383)

(assert (=> b!736757 (= res!495181 (= (seekEntryOrOpen!0 (select (arr!19783 a!3186) j!159) a!3186 mask!3328) lt!326783))))

(assert (=> b!736757 (= lt!326783 (Found!7383 j!159))))

(declare-fun b!736758 () Bool)

(declare-fun res!495175 () Bool)

(declare-fun e!412135 () Bool)

(assert (=> b!736758 (=> res!495175 e!412135)))

(declare-fun e!412131 () Bool)

(assert (=> b!736758 (= res!495175 e!412131)))

(declare-fun c!81178 () Bool)

(declare-fun lt!326786 () Bool)

(assert (=> b!736758 (= c!81178 lt!326786)))

(declare-fun b!736759 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41339 (_ BitVec 32)) SeekEntryResult!7383)

(assert (=> b!736759 (= e!412140 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19783 a!3186) j!159) a!3186 mask!3328) lt!326783))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!736760 () Bool)

(declare-fun e!412137 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!736760 (= e!412137 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19783 a!3186) j!159) a!3186 mask!3328) (Found!7383 j!159)))))

(declare-fun b!736761 () Bool)

(declare-fun res!495174 () Bool)

(declare-fun e!412132 () Bool)

(assert (=> b!736761 (=> (not res!495174) (not e!412132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41339 (_ BitVec 32)) Bool)

(assert (=> b!736761 (= res!495174 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!736762 () Bool)

(declare-fun e!412133 () Bool)

(declare-fun e!412139 () Bool)

(assert (=> b!736762 (= e!412133 (not e!412139))))

(declare-fun res!495170 () Bool)

(assert (=> b!736762 (=> res!495170 e!412139)))

(declare-fun lt!326790 () SeekEntryResult!7383)

(get-info :version)

(assert (=> b!736762 (= res!495170 (or (not ((_ is Intermediate!7383) lt!326790)) (bvsge x!1131 (x!62901 lt!326790))))))

(declare-fun lt!326785 () SeekEntryResult!7383)

(assert (=> b!736762 (= lt!326785 (Found!7383 j!159))))

(assert (=> b!736762 e!412138))

(declare-fun res!495176 () Bool)

(assert (=> b!736762 (=> (not res!495176) (not e!412138))))

(assert (=> b!736762 (= res!495176 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25128 0))(
  ( (Unit!25129) )
))
(declare-fun lt!326794 () Unit!25128)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41339 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25128)

(assert (=> b!736762 (= lt!326794 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736763 () Bool)

(declare-fun res!495171 () Bool)

(declare-fun e!412142 () Bool)

(assert (=> b!736763 (=> (not res!495171) (not e!412142))))

(assert (=> b!736763 (= res!495171 (and (= (size!20204 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20204 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20204 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736764 () Bool)

(assert (=> b!736764 (= e!412132 e!412134)))

(declare-fun res!495179 () Bool)

(assert (=> b!736764 (=> (not res!495179) (not e!412134))))

(declare-fun lt!326789 () SeekEntryResult!7383)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41339 (_ BitVec 32)) SeekEntryResult!7383)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736764 (= res!495179 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19783 a!3186) j!159) mask!3328) (select (arr!19783 a!3186) j!159) a!3186 mask!3328) lt!326789))))

(assert (=> b!736764 (= lt!326789 (Intermediate!7383 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736765 () Bool)

(assert (=> b!736765 (= e!412135 true)))

(declare-fun lt!326791 () array!41339)

(declare-fun lt!326782 () (_ BitVec 32))

(declare-fun lt!326788 () SeekEntryResult!7383)

(declare-fun lt!326795 () (_ BitVec 64))

(assert (=> b!736765 (= lt!326788 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326782 lt!326795 lt!326791 mask!3328))))

(declare-fun b!736766 () Bool)

(assert (=> b!736766 (= e!412131 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326782 resIntermediateIndex!5 (select (arr!19783 a!3186) j!159) a!3186 mask!3328) lt!326785)))))

(declare-fun b!736767 () Bool)

(declare-fun res!495173 () Bool)

(assert (=> b!736767 (=> (not res!495173) (not e!412142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736767 (= res!495173 (validKeyInArray!0 (select (arr!19783 a!3186) j!159)))))

(declare-fun b!736768 () Bool)

(assert (=> b!736768 (= e!412142 e!412132)))

(declare-fun res!495168 () Bool)

(assert (=> b!736768 (=> (not res!495168) (not e!412132))))

(declare-fun lt!326784 () SeekEntryResult!7383)

(assert (=> b!736768 (= res!495168 (or (= lt!326784 (MissingZero!7383 i!1173)) (= lt!326784 (MissingVacant!7383 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!736768 (= lt!326784 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!736769 () Bool)

(declare-fun res!495172 () Bool)

(assert (=> b!736769 (=> (not res!495172) (not e!412132))))

(declare-datatypes ((List!13785 0))(
  ( (Nil!13782) (Cons!13781 (h!14853 (_ BitVec 64)) (t!20100 List!13785)) )
))
(declare-fun arrayNoDuplicates!0 (array!41339 (_ BitVec 32) List!13785) Bool)

(assert (=> b!736769 (= res!495172 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13782))))

(declare-fun b!736770 () Bool)

(declare-fun res!495169 () Bool)

(assert (=> b!736770 (=> (not res!495169) (not e!412132))))

(assert (=> b!736770 (= res!495169 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20204 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20204 a!3186))))))

(declare-fun b!736771 () Bool)

(assert (=> b!736771 (= e!412134 e!412133)))

(declare-fun res!495167 () Bool)

(assert (=> b!736771 (=> (not res!495167) (not e!412133))))

(declare-fun lt!326792 () SeekEntryResult!7383)

(assert (=> b!736771 (= res!495167 (= lt!326792 lt!326790))))

(assert (=> b!736771 (= lt!326790 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326795 lt!326791 mask!3328))))

(assert (=> b!736771 (= lt!326792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326795 mask!3328) lt!326795 lt!326791 mask!3328))))

(assert (=> b!736771 (= lt!326795 (select (store (arr!19783 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!736771 (= lt!326791 (array!41340 (store (arr!19783 a!3186) i!1173 k0!2102) (size!20204 a!3186)))))

(declare-fun b!736772 () Bool)

(declare-fun e!412141 () Unit!25128)

(declare-fun Unit!25130 () Unit!25128)

(assert (=> b!736772 (= e!412141 Unit!25130)))

(assert (=> b!736772 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326782 (select (arr!19783 a!3186) j!159) a!3186 mask!3328) lt!326789)))

(declare-fun b!736773 () Bool)

(assert (=> b!736773 (= e!412137 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19783 a!3186) j!159) a!3186 mask!3328) lt!326789))))

(declare-fun b!736774 () Bool)

(declare-fun res!495182 () Bool)

(assert (=> b!736774 (=> (not res!495182) (not e!412134))))

(assert (=> b!736774 (= res!495182 e!412137)))

(declare-fun c!81176 () Bool)

(assert (=> b!736774 (= c!81176 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!736775 () Bool)

(declare-fun res!495178 () Bool)

(assert (=> b!736775 (=> (not res!495178) (not e!412142))))

(assert (=> b!736775 (= res!495178 (validKeyInArray!0 k0!2102))))

(declare-fun b!736776 () Bool)

(declare-fun res!495166 () Bool)

(assert (=> b!736776 (=> (not res!495166) (not e!412142))))

(declare-fun arrayContainsKey!0 (array!41339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736776 (= res!495166 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!736777 () Bool)

(declare-fun Unit!25131 () Unit!25128)

(assert (=> b!736777 (= e!412141 Unit!25131)))

(declare-fun lt!326793 () SeekEntryResult!7383)

(assert (=> b!736777 (= lt!326793 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19783 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!736777 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326782 resIntermediateIndex!5 (select (arr!19783 a!3186) j!159) a!3186 mask!3328) lt!326785)))

(declare-fun b!736778 () Bool)

(assert (=> b!736778 (= e!412139 e!412135)))

(declare-fun res!495180 () Bool)

(assert (=> b!736778 (=> res!495180 e!412135)))

(assert (=> b!736778 (= res!495180 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326782 #b00000000000000000000000000000000) (bvsge lt!326782 (size!20204 a!3186))))))

(declare-fun lt!326787 () Unit!25128)

(assert (=> b!736778 (= lt!326787 e!412141)))

(declare-fun c!81177 () Bool)

(assert (=> b!736778 (= c!81177 lt!326786)))

(assert (=> b!736778 (= lt!326786 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736778 (= lt!326782 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun res!495177 () Bool)

(assert (=> start!65166 (=> (not res!495177) (not e!412142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65166 (= res!495177 (validMask!0 mask!3328))))

(assert (=> start!65166 e!412142))

(assert (=> start!65166 true))

(declare-fun array_inv!15579 (array!41339) Bool)

(assert (=> start!65166 (array_inv!15579 a!3186)))

(declare-fun b!736779 () Bool)

(assert (=> b!736779 (= e!412131 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326782 (select (arr!19783 a!3186) j!159) a!3186 mask!3328) lt!326789)))))

(assert (= (and start!65166 res!495177) b!736763))

(assert (= (and b!736763 res!495171) b!736767))

(assert (= (and b!736767 res!495173) b!736775))

(assert (= (and b!736775 res!495178) b!736776))

(assert (= (and b!736776 res!495166) b!736768))

(assert (= (and b!736768 res!495168) b!736761))

(assert (= (and b!736761 res!495174) b!736769))

(assert (= (and b!736769 res!495172) b!736770))

(assert (= (and b!736770 res!495169) b!736764))

(assert (= (and b!736764 res!495179) b!736756))

(assert (= (and b!736756 res!495165) b!736774))

(assert (= (and b!736774 c!81176) b!736773))

(assert (= (and b!736774 (not c!81176)) b!736760))

(assert (= (and b!736774 res!495182) b!736771))

(assert (= (and b!736771 res!495167) b!736762))

(assert (= (and b!736762 res!495176) b!736757))

(assert (= (and b!736757 res!495181) b!736759))

(assert (= (and b!736762 (not res!495170)) b!736778))

(assert (= (and b!736778 c!81177) b!736772))

(assert (= (and b!736778 (not c!81177)) b!736777))

(assert (= (and b!736778 (not res!495180)) b!736758))

(assert (= (and b!736758 c!81178) b!736779))

(assert (= (and b!736758 (not c!81178)) b!736766))

(assert (= (and b!736758 (not res!495175)) b!736765))

(declare-fun m!688807 () Bool)

(assert (=> b!736760 m!688807))

(assert (=> b!736760 m!688807))

(declare-fun m!688809 () Bool)

(assert (=> b!736760 m!688809))

(declare-fun m!688811 () Bool)

(assert (=> b!736762 m!688811))

(declare-fun m!688813 () Bool)

(assert (=> b!736762 m!688813))

(assert (=> b!736772 m!688807))

(assert (=> b!736772 m!688807))

(declare-fun m!688815 () Bool)

(assert (=> b!736772 m!688815))

(declare-fun m!688817 () Bool)

(assert (=> b!736769 m!688817))

(assert (=> b!736759 m!688807))

(assert (=> b!736759 m!688807))

(declare-fun m!688819 () Bool)

(assert (=> b!736759 m!688819))

(assert (=> b!736777 m!688807))

(assert (=> b!736777 m!688807))

(assert (=> b!736777 m!688809))

(assert (=> b!736777 m!688807))

(declare-fun m!688821 () Bool)

(assert (=> b!736777 m!688821))

(assert (=> b!736773 m!688807))

(assert (=> b!736773 m!688807))

(declare-fun m!688823 () Bool)

(assert (=> b!736773 m!688823))

(declare-fun m!688825 () Bool)

(assert (=> b!736765 m!688825))

(assert (=> b!736764 m!688807))

(assert (=> b!736764 m!688807))

(declare-fun m!688827 () Bool)

(assert (=> b!736764 m!688827))

(assert (=> b!736764 m!688827))

(assert (=> b!736764 m!688807))

(declare-fun m!688829 () Bool)

(assert (=> b!736764 m!688829))

(declare-fun m!688831 () Bool)

(assert (=> b!736761 m!688831))

(declare-fun m!688833 () Bool)

(assert (=> b!736775 m!688833))

(assert (=> b!736779 m!688807))

(assert (=> b!736779 m!688807))

(assert (=> b!736779 m!688815))

(declare-fun m!688835 () Bool)

(assert (=> b!736768 m!688835))

(declare-fun m!688837 () Bool)

(assert (=> b!736776 m!688837))

(declare-fun m!688839 () Bool)

(assert (=> start!65166 m!688839))

(declare-fun m!688841 () Bool)

(assert (=> start!65166 m!688841))

(assert (=> b!736766 m!688807))

(assert (=> b!736766 m!688807))

(assert (=> b!736766 m!688821))

(assert (=> b!736757 m!688807))

(assert (=> b!736757 m!688807))

(declare-fun m!688843 () Bool)

(assert (=> b!736757 m!688843))

(declare-fun m!688845 () Bool)

(assert (=> b!736771 m!688845))

(declare-fun m!688847 () Bool)

(assert (=> b!736771 m!688847))

(declare-fun m!688849 () Bool)

(assert (=> b!736771 m!688849))

(declare-fun m!688851 () Bool)

(assert (=> b!736771 m!688851))

(assert (=> b!736771 m!688849))

(declare-fun m!688853 () Bool)

(assert (=> b!736771 m!688853))

(declare-fun m!688855 () Bool)

(assert (=> b!736778 m!688855))

(declare-fun m!688857 () Bool)

(assert (=> b!736756 m!688857))

(assert (=> b!736767 m!688807))

(assert (=> b!736767 m!688807))

(declare-fun m!688859 () Bool)

(assert (=> b!736767 m!688859))

(check-sat (not b!736760) (not b!736766) (not start!65166) (not b!736776) (not b!736773) (not b!736761) (not b!736762) (not b!736779) (not b!736778) (not b!736777) (not b!736764) (not b!736768) (not b!736759) (not b!736765) (not b!736767) (not b!736757) (not b!736775) (not b!736769) (not b!736771) (not b!736772))
(check-sat)
