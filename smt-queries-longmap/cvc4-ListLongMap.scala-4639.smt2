; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64538 () Bool)

(assert start!64538)

(declare-fun b!726811 () Bool)

(declare-fun res!487758 () Bool)

(declare-fun e!406906 () Bool)

(assert (=> b!726811 (=> (not res!487758) (not e!406906))))

(declare-datatypes ((array!41056 0))(
  ( (array!41057 (arr!19649 (Array (_ BitVec 32) (_ BitVec 64))) (size!20070 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41056)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41056 (_ BitVec 32)) Bool)

(assert (=> b!726811 (= res!487758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726812 () Bool)

(declare-fun res!487753 () Bool)

(assert (=> b!726812 (=> (not res!487753) (not e!406906))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!726812 (= res!487753 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20070 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20070 a!3186))))))

(declare-fun res!487751 () Bool)

(declare-fun e!406907 () Bool)

(assert (=> start!64538 (=> (not res!487751) (not e!406907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64538 (= res!487751 (validMask!0 mask!3328))))

(assert (=> start!64538 e!406907))

(assert (=> start!64538 true))

(declare-fun array_inv!15445 (array!41056) Bool)

(assert (=> start!64538 (array_inv!15445 a!3186)))

(declare-fun b!726813 () Bool)

(declare-fun e!406905 () Bool)

(declare-fun e!406913 () Bool)

(assert (=> b!726813 (= e!406905 (not e!406913))))

(declare-fun res!487762 () Bool)

(assert (=> b!726813 (=> res!487762 e!406913)))

(declare-datatypes ((SeekEntryResult!7249 0))(
  ( (MissingZero!7249 (index!31364 (_ BitVec 32))) (Found!7249 (index!31365 (_ BitVec 32))) (Intermediate!7249 (undefined!8061 Bool) (index!31366 (_ BitVec 32)) (x!62347 (_ BitVec 32))) (Undefined!7249) (MissingVacant!7249 (index!31367 (_ BitVec 32))) )
))
(declare-fun lt!321886 () SeekEntryResult!7249)

(assert (=> b!726813 (= res!487762 (or (not (is-Intermediate!7249 lt!321886)) (bvsge x!1131 (x!62347 lt!321886))))))

(declare-fun e!406908 () Bool)

(assert (=> b!726813 e!406908))

(declare-fun res!487756 () Bool)

(assert (=> b!726813 (=> (not res!487756) (not e!406908))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!726813 (= res!487756 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24816 0))(
  ( (Unit!24817) )
))
(declare-fun lt!321885 () Unit!24816)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41056 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24816)

(assert (=> b!726813 (= lt!321885 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726814 () Bool)

(declare-fun res!487765 () Bool)

(assert (=> b!726814 (=> (not res!487765) (not e!406907))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726814 (= res!487765 (validKeyInArray!0 k!2102))))

(declare-fun b!726815 () Bool)

(assert (=> b!726815 (= e!406907 e!406906)))

(declare-fun res!487763 () Bool)

(assert (=> b!726815 (=> (not res!487763) (not e!406906))))

(declare-fun lt!321883 () SeekEntryResult!7249)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!726815 (= res!487763 (or (= lt!321883 (MissingZero!7249 i!1173)) (= lt!321883 (MissingVacant!7249 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41056 (_ BitVec 32)) SeekEntryResult!7249)

(assert (=> b!726815 (= lt!321883 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun e!406910 () Bool)

(declare-fun b!726816 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41056 (_ BitVec 32)) SeekEntryResult!7249)

(assert (=> b!726816 (= e!406910 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19649 a!3186) j!159) a!3186 mask!3328) (Found!7249 j!159)))))

(declare-fun b!726817 () Bool)

(declare-fun e!406909 () Bool)

(assert (=> b!726817 (= e!406908 e!406909)))

(declare-fun res!487761 () Bool)

(assert (=> b!726817 (=> (not res!487761) (not e!406909))))

(declare-fun lt!321884 () SeekEntryResult!7249)

(assert (=> b!726817 (= res!487761 (= (seekEntryOrOpen!0 (select (arr!19649 a!3186) j!159) a!3186 mask!3328) lt!321884))))

(assert (=> b!726817 (= lt!321884 (Found!7249 j!159))))

(declare-fun lt!321882 () SeekEntryResult!7249)

(declare-fun b!726818 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41056 (_ BitVec 32)) SeekEntryResult!7249)

(assert (=> b!726818 (= e!406910 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19649 a!3186) j!159) a!3186 mask!3328) lt!321882))))

(declare-fun b!726819 () Bool)

(declare-fun res!487757 () Bool)

(declare-fun e!406911 () Bool)

(assert (=> b!726819 (=> (not res!487757) (not e!406911))))

(assert (=> b!726819 (= res!487757 e!406910)))

(declare-fun c!79903 () Bool)

(assert (=> b!726819 (= c!79903 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726820 () Bool)

(declare-fun res!487754 () Bool)

(assert (=> b!726820 (=> (not res!487754) (not e!406906))))

(declare-datatypes ((List!13651 0))(
  ( (Nil!13648) (Cons!13647 (h!14704 (_ BitVec 64)) (t!19966 List!13651)) )
))
(declare-fun arrayNoDuplicates!0 (array!41056 (_ BitVec 32) List!13651) Bool)

(assert (=> b!726820 (= res!487754 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13648))))

(declare-fun b!726821 () Bool)

(assert (=> b!726821 (= e!406913 true)))

(declare-fun lt!321888 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726821 (= lt!321888 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!726822 () Bool)

(assert (=> b!726822 (= e!406909 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19649 a!3186) j!159) a!3186 mask!3328) lt!321884))))

(declare-fun b!726823 () Bool)

(assert (=> b!726823 (= e!406911 e!406905)))

(declare-fun res!487759 () Bool)

(assert (=> b!726823 (=> (not res!487759) (not e!406905))))

(declare-fun lt!321889 () SeekEntryResult!7249)

(assert (=> b!726823 (= res!487759 (= lt!321889 lt!321886))))

(declare-fun lt!321890 () (_ BitVec 64))

(declare-fun lt!321887 () array!41056)

(assert (=> b!726823 (= lt!321886 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321890 lt!321887 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726823 (= lt!321889 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321890 mask!3328) lt!321890 lt!321887 mask!3328))))

(assert (=> b!726823 (= lt!321890 (select (store (arr!19649 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!726823 (= lt!321887 (array!41057 (store (arr!19649 a!3186) i!1173 k!2102) (size!20070 a!3186)))))

(declare-fun b!726824 () Bool)

(declare-fun res!487766 () Bool)

(assert (=> b!726824 (=> (not res!487766) (not e!406907))))

(assert (=> b!726824 (= res!487766 (validKeyInArray!0 (select (arr!19649 a!3186) j!159)))))

(declare-fun b!726825 () Bool)

(assert (=> b!726825 (= e!406906 e!406911)))

(declare-fun res!487764 () Bool)

(assert (=> b!726825 (=> (not res!487764) (not e!406911))))

(assert (=> b!726825 (= res!487764 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19649 a!3186) j!159) mask!3328) (select (arr!19649 a!3186) j!159) a!3186 mask!3328) lt!321882))))

(assert (=> b!726825 (= lt!321882 (Intermediate!7249 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726826 () Bool)

(declare-fun res!487755 () Bool)

(assert (=> b!726826 (=> (not res!487755) (not e!406907))))

(assert (=> b!726826 (= res!487755 (and (= (size!20070 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20070 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20070 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726827 () Bool)

(declare-fun res!487752 () Bool)

(assert (=> b!726827 (=> (not res!487752) (not e!406907))))

(declare-fun arrayContainsKey!0 (array!41056 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726827 (= res!487752 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726828 () Bool)

(declare-fun res!487760 () Bool)

(assert (=> b!726828 (=> (not res!487760) (not e!406911))))

(assert (=> b!726828 (= res!487760 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19649 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64538 res!487751) b!726826))

(assert (= (and b!726826 res!487755) b!726824))

(assert (= (and b!726824 res!487766) b!726814))

(assert (= (and b!726814 res!487765) b!726827))

(assert (= (and b!726827 res!487752) b!726815))

(assert (= (and b!726815 res!487763) b!726811))

(assert (= (and b!726811 res!487758) b!726820))

(assert (= (and b!726820 res!487754) b!726812))

(assert (= (and b!726812 res!487753) b!726825))

(assert (= (and b!726825 res!487764) b!726828))

(assert (= (and b!726828 res!487760) b!726819))

(assert (= (and b!726819 c!79903) b!726818))

(assert (= (and b!726819 (not c!79903)) b!726816))

(assert (= (and b!726819 res!487757) b!726823))

(assert (= (and b!726823 res!487759) b!726813))

(assert (= (and b!726813 res!487756) b!726817))

(assert (= (and b!726817 res!487761) b!726822))

(assert (= (and b!726813 (not res!487762)) b!726821))

(declare-fun m!680833 () Bool)

(assert (=> b!726811 m!680833))

(declare-fun m!680835 () Bool)

(assert (=> b!726817 m!680835))

(assert (=> b!726817 m!680835))

(declare-fun m!680837 () Bool)

(assert (=> b!726817 m!680837))

(declare-fun m!680839 () Bool)

(assert (=> b!726821 m!680839))

(assert (=> b!726825 m!680835))

(assert (=> b!726825 m!680835))

(declare-fun m!680841 () Bool)

(assert (=> b!726825 m!680841))

(assert (=> b!726825 m!680841))

(assert (=> b!726825 m!680835))

(declare-fun m!680843 () Bool)

(assert (=> b!726825 m!680843))

(declare-fun m!680845 () Bool)

(assert (=> b!726813 m!680845))

(declare-fun m!680847 () Bool)

(assert (=> b!726813 m!680847))

(declare-fun m!680849 () Bool)

(assert (=> b!726828 m!680849))

(assert (=> b!726816 m!680835))

(assert (=> b!726816 m!680835))

(declare-fun m!680851 () Bool)

(assert (=> b!726816 m!680851))

(declare-fun m!680853 () Bool)

(assert (=> b!726814 m!680853))

(assert (=> b!726818 m!680835))

(assert (=> b!726818 m!680835))

(declare-fun m!680855 () Bool)

(assert (=> b!726818 m!680855))

(declare-fun m!680857 () Bool)

(assert (=> b!726820 m!680857))

(declare-fun m!680859 () Bool)

(assert (=> b!726827 m!680859))

(assert (=> b!726822 m!680835))

(assert (=> b!726822 m!680835))

(declare-fun m!680861 () Bool)

(assert (=> b!726822 m!680861))

(declare-fun m!680863 () Bool)

(assert (=> b!726815 m!680863))

(assert (=> b!726824 m!680835))

(assert (=> b!726824 m!680835))

(declare-fun m!680865 () Bool)

(assert (=> b!726824 m!680865))

(declare-fun m!680867 () Bool)

(assert (=> b!726823 m!680867))

(declare-fun m!680869 () Bool)

(assert (=> b!726823 m!680869))

(declare-fun m!680871 () Bool)

(assert (=> b!726823 m!680871))

(declare-fun m!680873 () Bool)

(assert (=> b!726823 m!680873))

(assert (=> b!726823 m!680871))

(declare-fun m!680875 () Bool)

(assert (=> b!726823 m!680875))

(declare-fun m!680877 () Bool)

(assert (=> start!64538 m!680877))

(declare-fun m!680879 () Bool)

(assert (=> start!64538 m!680879))

(push 1)

