; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65372 () Bool)

(assert start!65372)

(declare-fun b!743766 () Bool)

(declare-fun e!415490 () Bool)

(declare-fun e!415497 () Bool)

(assert (=> b!743766 (= e!415490 e!415497)))

(declare-fun res!500937 () Bool)

(assert (=> b!743766 (=> (not res!500937) (not e!415497))))

(declare-datatypes ((SeekEntryResult!7492 0))(
  ( (MissingZero!7492 (index!32336 (_ BitVec 32))) (Found!7492 (index!32337 (_ BitVec 32))) (Intermediate!7492 (undefined!8304 Bool) (index!32338 (_ BitVec 32)) (x!63309 (_ BitVec 32))) (Undefined!7492) (MissingVacant!7492 (index!32339 (_ BitVec 32))) )
))
(declare-fun lt!330264 () SeekEntryResult!7492)

(declare-fun lt!330261 () SeekEntryResult!7492)

(assert (=> b!743766 (= res!500937 (= lt!330264 lt!330261))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!330265 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!41562 0))(
  ( (array!41563 (arr!19895 (Array (_ BitVec 32) (_ BitVec 64))) (size!20316 (_ BitVec 32))) )
))
(declare-fun lt!330263 () array!41562)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41562 (_ BitVec 32)) SeekEntryResult!7492)

(assert (=> b!743766 (= lt!330261 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330265 lt!330263 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743766 (= lt!330264 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330265 mask!3328) lt!330265 lt!330263 mask!3328))))

(declare-fun a!3186 () array!41562)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!743766 (= lt!330265 (select (store (arr!19895 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!743766 (= lt!330263 (array!41563 (store (arr!19895 a!3186) i!1173 k0!2102) (size!20316 a!3186)))))

(declare-fun b!743767 () Bool)

(declare-fun res!500950 () Bool)

(declare-fun e!415491 () Bool)

(assert (=> b!743767 (=> (not res!500950) (not e!415491))))

(assert (=> b!743767 (= res!500950 (and (= (size!20316 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20316 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20316 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743769 () Bool)

(declare-fun res!500938 () Bool)

(declare-fun e!415498 () Bool)

(assert (=> b!743769 (=> (not res!500938) (not e!415498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41562 (_ BitVec 32)) Bool)

(assert (=> b!743769 (= res!500938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743770 () Bool)

(declare-fun e!415496 () Bool)

(assert (=> b!743770 (= e!415496 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!330267 () SeekEntryResult!7492)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41562 (_ BitVec 32)) SeekEntryResult!7492)

(assert (=> b!743770 (= lt!330267 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19895 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!743771 () Bool)

(assert (=> b!743771 (= e!415497 (not e!415496))))

(declare-fun res!500949 () Bool)

(assert (=> b!743771 (=> res!500949 e!415496)))

(get-info :version)

(assert (=> b!743771 (= res!500949 (or (not ((_ is Intermediate!7492) lt!330261)) (bvslt x!1131 (x!63309 lt!330261)) (not (= x!1131 (x!63309 lt!330261))) (not (= index!1321 (index!32338 lt!330261)))))))

(declare-fun e!415492 () Bool)

(assert (=> b!743771 e!415492))

(declare-fun res!500951 () Bool)

(assert (=> b!743771 (=> (not res!500951) (not e!415492))))

(assert (=> b!743771 (= res!500951 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25436 0))(
  ( (Unit!25437) )
))
(declare-fun lt!330266 () Unit!25436)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25436)

(assert (=> b!743771 (= lt!330266 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743772 () Bool)

(declare-fun lt!330262 () SeekEntryResult!7492)

(declare-fun e!415493 () Bool)

(assert (=> b!743772 (= e!415493 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19895 a!3186) j!159) a!3186 mask!3328) lt!330262))))

(declare-fun b!743773 () Bool)

(assert (=> b!743773 (= e!415493 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19895 a!3186) j!159) a!3186 mask!3328) (Found!7492 j!159)))))

(declare-fun b!743774 () Bool)

(declare-fun res!500943 () Bool)

(assert (=> b!743774 (=> (not res!500943) (not e!415491))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743774 (= res!500943 (validKeyInArray!0 k0!2102))))

(declare-fun b!743775 () Bool)

(declare-fun res!500944 () Bool)

(assert (=> b!743775 (=> (not res!500944) (not e!415491))))

(declare-fun arrayContainsKey!0 (array!41562 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743775 (= res!500944 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743776 () Bool)

(declare-fun res!500939 () Bool)

(assert (=> b!743776 (=> (not res!500939) (not e!415491))))

(assert (=> b!743776 (= res!500939 (validKeyInArray!0 (select (arr!19895 a!3186) j!159)))))

(declare-fun b!743777 () Bool)

(assert (=> b!743777 (= e!415491 e!415498)))

(declare-fun res!500952 () Bool)

(assert (=> b!743777 (=> (not res!500952) (not e!415498))))

(declare-fun lt!330268 () SeekEntryResult!7492)

(assert (=> b!743777 (= res!500952 (or (= lt!330268 (MissingZero!7492 i!1173)) (= lt!330268 (MissingVacant!7492 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41562 (_ BitVec 32)) SeekEntryResult!7492)

(assert (=> b!743777 (= lt!330268 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!743778 () Bool)

(declare-fun res!500941 () Bool)

(assert (=> b!743778 (=> (not res!500941) (not e!415498))))

(declare-datatypes ((List!13936 0))(
  ( (Nil!13933) (Cons!13932 (h!15004 (_ BitVec 64)) (t!20242 List!13936)) )
))
(declare-fun arrayNoDuplicates!0 (array!41562 (_ BitVec 32) List!13936) Bool)

(assert (=> b!743778 (= res!500941 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13933))))

(declare-fun b!743779 () Bool)

(assert (=> b!743779 (= e!415498 e!415490)))

(declare-fun res!500940 () Bool)

(assert (=> b!743779 (=> (not res!500940) (not e!415490))))

(assert (=> b!743779 (= res!500940 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19895 a!3186) j!159) mask!3328) (select (arr!19895 a!3186) j!159) a!3186 mask!3328) lt!330262))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743779 (= lt!330262 (Intermediate!7492 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!500942 () Bool)

(assert (=> start!65372 (=> (not res!500942) (not e!415491))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65372 (= res!500942 (validMask!0 mask!3328))))

(assert (=> start!65372 e!415491))

(assert (=> start!65372 true))

(declare-fun array_inv!15778 (array!41562) Bool)

(assert (=> start!65372 (array_inv!15778 a!3186)))

(declare-fun b!743768 () Bool)

(declare-fun e!415495 () Bool)

(declare-fun lt!330269 () SeekEntryResult!7492)

(assert (=> b!743768 (= e!415495 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19895 a!3186) j!159) a!3186 mask!3328) lt!330269))))

(declare-fun b!743780 () Bool)

(assert (=> b!743780 (= e!415492 e!415495)))

(declare-fun res!500948 () Bool)

(assert (=> b!743780 (=> (not res!500948) (not e!415495))))

(assert (=> b!743780 (= res!500948 (= (seekEntryOrOpen!0 (select (arr!19895 a!3186) j!159) a!3186 mask!3328) lt!330269))))

(assert (=> b!743780 (= lt!330269 (Found!7492 j!159))))

(declare-fun b!743781 () Bool)

(declare-fun res!500945 () Bool)

(assert (=> b!743781 (=> (not res!500945) (not e!415490))))

(assert (=> b!743781 (= res!500945 e!415493)))

(declare-fun c!81795 () Bool)

(assert (=> b!743781 (= c!81795 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743782 () Bool)

(declare-fun res!500946 () Bool)

(assert (=> b!743782 (=> (not res!500946) (not e!415490))))

(assert (=> b!743782 (= res!500946 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19895 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743783 () Bool)

(declare-fun res!500947 () Bool)

(assert (=> b!743783 (=> (not res!500947) (not e!415498))))

(assert (=> b!743783 (= res!500947 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20316 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20316 a!3186))))))

(assert (= (and start!65372 res!500942) b!743767))

(assert (= (and b!743767 res!500950) b!743776))

(assert (= (and b!743776 res!500939) b!743774))

(assert (= (and b!743774 res!500943) b!743775))

(assert (= (and b!743775 res!500944) b!743777))

(assert (= (and b!743777 res!500952) b!743769))

(assert (= (and b!743769 res!500938) b!743778))

(assert (= (and b!743778 res!500941) b!743783))

(assert (= (and b!743783 res!500947) b!743779))

(assert (= (and b!743779 res!500940) b!743782))

(assert (= (and b!743782 res!500946) b!743781))

(assert (= (and b!743781 c!81795) b!743772))

(assert (= (and b!743781 (not c!81795)) b!743773))

(assert (= (and b!743781 res!500945) b!743766))

(assert (= (and b!743766 res!500937) b!743771))

(assert (= (and b!743771 res!500951) b!743780))

(assert (= (and b!743780 res!500948) b!743768))

(assert (= (and b!743771 (not res!500949)) b!743770))

(declare-fun m!693851 () Bool)

(assert (=> b!743782 m!693851))

(declare-fun m!693853 () Bool)

(assert (=> start!65372 m!693853))

(declare-fun m!693855 () Bool)

(assert (=> start!65372 m!693855))

(declare-fun m!693857 () Bool)

(assert (=> b!743770 m!693857))

(assert (=> b!743770 m!693857))

(declare-fun m!693859 () Bool)

(assert (=> b!743770 m!693859))

(declare-fun m!693861 () Bool)

(assert (=> b!743769 m!693861))

(declare-fun m!693863 () Bool)

(assert (=> b!743766 m!693863))

(declare-fun m!693865 () Bool)

(assert (=> b!743766 m!693865))

(declare-fun m!693867 () Bool)

(assert (=> b!743766 m!693867))

(declare-fun m!693869 () Bool)

(assert (=> b!743766 m!693869))

(assert (=> b!743766 m!693869))

(declare-fun m!693871 () Bool)

(assert (=> b!743766 m!693871))

(declare-fun m!693873 () Bool)

(assert (=> b!743774 m!693873))

(assert (=> b!743772 m!693857))

(assert (=> b!743772 m!693857))

(declare-fun m!693875 () Bool)

(assert (=> b!743772 m!693875))

(assert (=> b!743773 m!693857))

(assert (=> b!743773 m!693857))

(assert (=> b!743773 m!693859))

(assert (=> b!743780 m!693857))

(assert (=> b!743780 m!693857))

(declare-fun m!693877 () Bool)

(assert (=> b!743780 m!693877))

(declare-fun m!693879 () Bool)

(assert (=> b!743775 m!693879))

(assert (=> b!743768 m!693857))

(assert (=> b!743768 m!693857))

(declare-fun m!693881 () Bool)

(assert (=> b!743768 m!693881))

(declare-fun m!693883 () Bool)

(assert (=> b!743777 m!693883))

(assert (=> b!743776 m!693857))

(assert (=> b!743776 m!693857))

(declare-fun m!693885 () Bool)

(assert (=> b!743776 m!693885))

(assert (=> b!743779 m!693857))

(assert (=> b!743779 m!693857))

(declare-fun m!693887 () Bool)

(assert (=> b!743779 m!693887))

(assert (=> b!743779 m!693887))

(assert (=> b!743779 m!693857))

(declare-fun m!693889 () Bool)

(assert (=> b!743779 m!693889))

(declare-fun m!693891 () Bool)

(assert (=> b!743778 m!693891))

(declare-fun m!693893 () Bool)

(assert (=> b!743771 m!693893))

(declare-fun m!693895 () Bool)

(assert (=> b!743771 m!693895))

(check-sat (not b!743773) (not b!743766) (not b!743769) (not b!743780) (not b!743778) (not b!743774) (not b!743777) (not b!743775) (not b!743768) (not b!743776) (not b!743771) (not start!65372) (not b!743772) (not b!743779) (not b!743770))
(check-sat)
