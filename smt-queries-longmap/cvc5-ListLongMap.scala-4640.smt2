; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64540 () Bool)

(assert start!64540)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41058 0))(
  ( (array!41059 (arr!19650 (Array (_ BitVec 32) (_ BitVec 64))) (size!20071 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41058)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!726865 () Bool)

(declare-datatypes ((SeekEntryResult!7250 0))(
  ( (MissingZero!7250 (index!31368 (_ BitVec 32))) (Found!7250 (index!31369 (_ BitVec 32))) (Intermediate!7250 (undefined!8062 Bool) (index!31370 (_ BitVec 32)) (x!62356 (_ BitVec 32))) (Undefined!7250) (MissingVacant!7250 (index!31371 (_ BitVec 32))) )
))
(declare-fun lt!321912 () SeekEntryResult!7250)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!406938 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41058 (_ BitVec 32)) SeekEntryResult!7250)

(assert (=> b!726865 (= e!406938 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19650 a!3186) j!159) a!3186 mask!3328) lt!321912))))

(declare-fun b!726866 () Bool)

(declare-fun e!406935 () Bool)

(declare-fun e!406932 () Bool)

(assert (=> b!726866 (= e!406935 e!406932)))

(declare-fun res!487801 () Bool)

(assert (=> b!726866 (=> (not res!487801) (not e!406932))))

(declare-fun lt!321910 () SeekEntryResult!7250)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!726866 (= res!487801 (or (= lt!321910 (MissingZero!7250 i!1173)) (= lt!321910 (MissingVacant!7250 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41058 (_ BitVec 32)) SeekEntryResult!7250)

(assert (=> b!726866 (= lt!321910 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun e!406939 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!726867 () Bool)

(assert (=> b!726867 (= e!406939 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321916 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726867 (= lt!321916 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!726868 () Bool)

(declare-fun e!406940 () Bool)

(assert (=> b!726868 (= e!406940 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19650 a!3186) j!159) a!3186 mask!3328) (Found!7250 j!159)))))

(declare-fun b!726869 () Bool)

(declare-fun res!487808 () Bool)

(assert (=> b!726869 (=> (not res!487808) (not e!406935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726869 (= res!487808 (validKeyInArray!0 (select (arr!19650 a!3186) j!159)))))

(declare-fun b!726870 () Bool)

(declare-fun res!487804 () Bool)

(assert (=> b!726870 (=> (not res!487804) (not e!406935))))

(assert (=> b!726870 (= res!487804 (and (= (size!20071 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20071 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20071 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!487800 () Bool)

(assert (=> start!64540 (=> (not res!487800) (not e!406935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64540 (= res!487800 (validMask!0 mask!3328))))

(assert (=> start!64540 e!406935))

(assert (=> start!64540 true))

(declare-fun array_inv!15446 (array!41058) Bool)

(assert (=> start!64540 (array_inv!15446 a!3186)))

(declare-fun b!726871 () Bool)

(declare-fun res!487811 () Bool)

(declare-fun e!406934 () Bool)

(assert (=> b!726871 (=> (not res!487811) (not e!406934))))

(assert (=> b!726871 (= res!487811 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19650 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!726872 () Bool)

(declare-fun res!487799 () Bool)

(assert (=> b!726872 (=> (not res!487799) (not e!406935))))

(assert (=> b!726872 (= res!487799 (validKeyInArray!0 k!2102))))

(declare-fun b!726873 () Bool)

(declare-fun lt!321909 () SeekEntryResult!7250)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41058 (_ BitVec 32)) SeekEntryResult!7250)

(assert (=> b!726873 (= e!406940 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19650 a!3186) j!159) a!3186 mask!3328) lt!321909))))

(declare-fun b!726874 () Bool)

(declare-fun res!487802 () Bool)

(assert (=> b!726874 (=> (not res!487802) (not e!406932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41058 (_ BitVec 32)) Bool)

(assert (=> b!726874 (= res!487802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726875 () Bool)

(declare-fun e!406933 () Bool)

(assert (=> b!726875 (= e!406934 e!406933)))

(declare-fun res!487805 () Bool)

(assert (=> b!726875 (=> (not res!487805) (not e!406933))))

(declare-fun lt!321917 () SeekEntryResult!7250)

(declare-fun lt!321911 () SeekEntryResult!7250)

(assert (=> b!726875 (= res!487805 (= lt!321917 lt!321911))))

(declare-fun lt!321914 () (_ BitVec 64))

(declare-fun lt!321913 () array!41058)

(assert (=> b!726875 (= lt!321911 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321914 lt!321913 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726875 (= lt!321917 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321914 mask!3328) lt!321914 lt!321913 mask!3328))))

(assert (=> b!726875 (= lt!321914 (select (store (arr!19650 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!726875 (= lt!321913 (array!41059 (store (arr!19650 a!3186) i!1173 k!2102) (size!20071 a!3186)))))

(declare-fun b!726876 () Bool)

(assert (=> b!726876 (= e!406933 (not e!406939))))

(declare-fun res!487813 () Bool)

(assert (=> b!726876 (=> res!487813 e!406939)))

(assert (=> b!726876 (= res!487813 (or (not (is-Intermediate!7250 lt!321911)) (bvsge x!1131 (x!62356 lt!321911))))))

(declare-fun e!406936 () Bool)

(assert (=> b!726876 e!406936))

(declare-fun res!487803 () Bool)

(assert (=> b!726876 (=> (not res!487803) (not e!406936))))

(assert (=> b!726876 (= res!487803 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24818 0))(
  ( (Unit!24819) )
))
(declare-fun lt!321915 () Unit!24818)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41058 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24818)

(assert (=> b!726876 (= lt!321915 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726877 () Bool)

(assert (=> b!726877 (= e!406936 e!406938)))

(declare-fun res!487810 () Bool)

(assert (=> b!726877 (=> (not res!487810) (not e!406938))))

(assert (=> b!726877 (= res!487810 (= (seekEntryOrOpen!0 (select (arr!19650 a!3186) j!159) a!3186 mask!3328) lt!321912))))

(assert (=> b!726877 (= lt!321912 (Found!7250 j!159))))

(declare-fun b!726878 () Bool)

(declare-fun res!487814 () Bool)

(assert (=> b!726878 (=> (not res!487814) (not e!406932))))

(assert (=> b!726878 (= res!487814 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20071 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20071 a!3186))))))

(declare-fun b!726879 () Bool)

(declare-fun res!487812 () Bool)

(assert (=> b!726879 (=> (not res!487812) (not e!406935))))

(declare-fun arrayContainsKey!0 (array!41058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726879 (= res!487812 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726880 () Bool)

(declare-fun res!487809 () Bool)

(assert (=> b!726880 (=> (not res!487809) (not e!406932))))

(declare-datatypes ((List!13652 0))(
  ( (Nil!13649) (Cons!13648 (h!14705 (_ BitVec 64)) (t!19967 List!13652)) )
))
(declare-fun arrayNoDuplicates!0 (array!41058 (_ BitVec 32) List!13652) Bool)

(assert (=> b!726880 (= res!487809 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13649))))

(declare-fun b!726881 () Bool)

(declare-fun res!487806 () Bool)

(assert (=> b!726881 (=> (not res!487806) (not e!406934))))

(assert (=> b!726881 (= res!487806 e!406940)))

(declare-fun c!79906 () Bool)

(assert (=> b!726881 (= c!79906 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726882 () Bool)

(assert (=> b!726882 (= e!406932 e!406934)))

(declare-fun res!487807 () Bool)

(assert (=> b!726882 (=> (not res!487807) (not e!406934))))

(assert (=> b!726882 (= res!487807 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19650 a!3186) j!159) mask!3328) (select (arr!19650 a!3186) j!159) a!3186 mask!3328) lt!321909))))

(assert (=> b!726882 (= lt!321909 (Intermediate!7250 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64540 res!487800) b!726870))

(assert (= (and b!726870 res!487804) b!726869))

(assert (= (and b!726869 res!487808) b!726872))

(assert (= (and b!726872 res!487799) b!726879))

(assert (= (and b!726879 res!487812) b!726866))

(assert (= (and b!726866 res!487801) b!726874))

(assert (= (and b!726874 res!487802) b!726880))

(assert (= (and b!726880 res!487809) b!726878))

(assert (= (and b!726878 res!487814) b!726882))

(assert (= (and b!726882 res!487807) b!726871))

(assert (= (and b!726871 res!487811) b!726881))

(assert (= (and b!726881 c!79906) b!726873))

(assert (= (and b!726881 (not c!79906)) b!726868))

(assert (= (and b!726881 res!487806) b!726875))

(assert (= (and b!726875 res!487805) b!726876))

(assert (= (and b!726876 res!487803) b!726877))

(assert (= (and b!726877 res!487810) b!726865))

(assert (= (and b!726876 (not res!487813)) b!726867))

(declare-fun m!680881 () Bool)

(assert (=> b!726873 m!680881))

(assert (=> b!726873 m!680881))

(declare-fun m!680883 () Bool)

(assert (=> b!726873 m!680883))

(declare-fun m!680885 () Bool)

(assert (=> b!726867 m!680885))

(declare-fun m!680887 () Bool)

(assert (=> b!726876 m!680887))

(declare-fun m!680889 () Bool)

(assert (=> b!726876 m!680889))

(declare-fun m!680891 () Bool)

(assert (=> b!726880 m!680891))

(assert (=> b!726865 m!680881))

(assert (=> b!726865 m!680881))

(declare-fun m!680893 () Bool)

(assert (=> b!726865 m!680893))

(assert (=> b!726869 m!680881))

(assert (=> b!726869 m!680881))

(declare-fun m!680895 () Bool)

(assert (=> b!726869 m!680895))

(declare-fun m!680897 () Bool)

(assert (=> b!726874 m!680897))

(assert (=> b!726868 m!680881))

(assert (=> b!726868 m!680881))

(declare-fun m!680899 () Bool)

(assert (=> b!726868 m!680899))

(declare-fun m!680901 () Bool)

(assert (=> b!726879 m!680901))

(declare-fun m!680903 () Bool)

(assert (=> b!726872 m!680903))

(assert (=> b!726877 m!680881))

(assert (=> b!726877 m!680881))

(declare-fun m!680905 () Bool)

(assert (=> b!726877 m!680905))

(declare-fun m!680907 () Bool)

(assert (=> b!726875 m!680907))

(declare-fun m!680909 () Bool)

(assert (=> b!726875 m!680909))

(declare-fun m!680911 () Bool)

(assert (=> b!726875 m!680911))

(assert (=> b!726875 m!680909))

(declare-fun m!680913 () Bool)

(assert (=> b!726875 m!680913))

(declare-fun m!680915 () Bool)

(assert (=> b!726875 m!680915))

(assert (=> b!726882 m!680881))

(assert (=> b!726882 m!680881))

(declare-fun m!680917 () Bool)

(assert (=> b!726882 m!680917))

(assert (=> b!726882 m!680917))

(assert (=> b!726882 m!680881))

(declare-fun m!680919 () Bool)

(assert (=> b!726882 m!680919))

(declare-fun m!680921 () Bool)

(assert (=> b!726871 m!680921))

(declare-fun m!680923 () Bool)

(assert (=> b!726866 m!680923))

(declare-fun m!680925 () Bool)

(assert (=> start!64540 m!680925))

(declare-fun m!680927 () Bool)

(assert (=> start!64540 m!680927))

(push 1)

