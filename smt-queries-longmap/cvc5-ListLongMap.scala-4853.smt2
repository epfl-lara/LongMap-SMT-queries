; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66816 () Bool)

(assert start!66816)

(declare-fun b!770876 () Bool)

(declare-datatypes ((Unit!26570 0))(
  ( (Unit!26571) )
))
(declare-fun e!429177 () Unit!26570)

(declare-fun Unit!26572 () Unit!26570)

(assert (=> b!770876 (= e!429177 Unit!26572)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42378 0))(
  ( (array!42379 (arr!20289 (Array (_ BitVec 32) (_ BitVec 64))) (size!20710 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42378)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7889 0))(
  ( (MissingZero!7889 (index!33924 (_ BitVec 32))) (Found!7889 (index!33925 (_ BitVec 32))) (Intermediate!7889 (undefined!8701 Bool) (index!33926 (_ BitVec 32)) (x!64852 (_ BitVec 32))) (Undefined!7889) (MissingVacant!7889 (index!33927 (_ BitVec 32))) )
))
(declare-fun lt!343139 () SeekEntryResult!7889)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42378 (_ BitVec 32)) SeekEntryResult!7889)

(assert (=> b!770876 (= lt!343139 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20289 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!343143 () (_ BitVec 32))

(assert (=> b!770876 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343143 resIntermediateIndex!5 (select (arr!20289 a!3186) j!159) a!3186 mask!3328) (Found!7889 j!159))))

(declare-fun b!770877 () Bool)

(declare-fun res!521516 () Bool)

(declare-fun e!429172 () Bool)

(assert (=> b!770877 (=> (not res!521516) (not e!429172))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770877 (= res!521516 (and (= (size!20710 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20710 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20710 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770878 () Bool)

(declare-fun res!521513 () Bool)

(declare-fun e!429176 () Bool)

(assert (=> b!770878 (=> (not res!521513) (not e!429176))))

(declare-datatypes ((List!14291 0))(
  ( (Nil!14288) (Cons!14287 (h!15386 (_ BitVec 64)) (t!20606 List!14291)) )
))
(declare-fun arrayNoDuplicates!0 (array!42378 (_ BitVec 32) List!14291) Bool)

(assert (=> b!770878 (= res!521513 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14288))))

(declare-fun b!770879 () Bool)

(declare-fun e!429175 () Bool)

(assert (=> b!770879 (= e!429175 true)))

(declare-fun lt!343144 () Unit!26570)

(assert (=> b!770879 (= lt!343144 e!429177)))

(declare-fun c!85084 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770879 (= c!85084 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770879 (= lt!343143 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!770880 () Bool)

(declare-fun res!521504 () Bool)

(assert (=> b!770880 (=> (not res!521504) (not e!429176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42378 (_ BitVec 32)) Bool)

(assert (=> b!770880 (= res!521504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770881 () Bool)

(declare-fun res!521510 () Bool)

(assert (=> b!770881 (=> (not res!521510) (not e!429172))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770881 (= res!521510 (validKeyInArray!0 k!2102))))

(declare-fun b!770882 () Bool)

(declare-fun e!429179 () Bool)

(assert (=> b!770882 (= e!429176 e!429179)))

(declare-fun res!521512 () Bool)

(assert (=> b!770882 (=> (not res!521512) (not e!429179))))

(declare-fun lt!343140 () SeekEntryResult!7889)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42378 (_ BitVec 32)) SeekEntryResult!7889)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770882 (= res!521512 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20289 a!3186) j!159) mask!3328) (select (arr!20289 a!3186) j!159) a!3186 mask!3328) lt!343140))))

(assert (=> b!770882 (= lt!343140 (Intermediate!7889 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!521503 () Bool)

(assert (=> start!66816 (=> (not res!521503) (not e!429172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66816 (= res!521503 (validMask!0 mask!3328))))

(assert (=> start!66816 e!429172))

(assert (=> start!66816 true))

(declare-fun array_inv!16085 (array!42378) Bool)

(assert (=> start!66816 (array_inv!16085 a!3186)))

(declare-fun b!770883 () Bool)

(declare-fun e!429173 () Bool)

(assert (=> b!770883 (= e!429173 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20289 a!3186) j!159) a!3186 mask!3328) lt!343140))))

(declare-fun b!770884 () Bool)

(declare-fun e!429171 () Bool)

(assert (=> b!770884 (= e!429171 (not e!429175))))

(declare-fun res!521507 () Bool)

(assert (=> b!770884 (=> res!521507 e!429175)))

(declare-fun lt!343137 () SeekEntryResult!7889)

(assert (=> b!770884 (= res!521507 (or (not (is-Intermediate!7889 lt!343137)) (bvsge x!1131 (x!64852 lt!343137))))))

(declare-fun e!429174 () Bool)

(assert (=> b!770884 e!429174))

(declare-fun res!521515 () Bool)

(assert (=> b!770884 (=> (not res!521515) (not e!429174))))

(assert (=> b!770884 (= res!521515 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343135 () Unit!26570)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42378 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26570)

(assert (=> b!770884 (= lt!343135 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770885 () Bool)

(declare-fun Unit!26573 () Unit!26570)

(assert (=> b!770885 (= e!429177 Unit!26573)))

(assert (=> b!770885 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343143 (select (arr!20289 a!3186) j!159) a!3186 mask!3328) lt!343140)))

(declare-fun b!770886 () Bool)

(assert (=> b!770886 (= e!429172 e!429176)))

(declare-fun res!521505 () Bool)

(assert (=> b!770886 (=> (not res!521505) (not e!429176))))

(declare-fun lt!343138 () SeekEntryResult!7889)

(assert (=> b!770886 (= res!521505 (or (= lt!343138 (MissingZero!7889 i!1173)) (= lt!343138 (MissingVacant!7889 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42378 (_ BitVec 32)) SeekEntryResult!7889)

(assert (=> b!770886 (= lt!343138 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!770887 () Bool)

(declare-fun e!429170 () Bool)

(assert (=> b!770887 (= e!429174 e!429170)))

(declare-fun res!521514 () Bool)

(assert (=> b!770887 (=> (not res!521514) (not e!429170))))

(declare-fun lt!343141 () SeekEntryResult!7889)

(assert (=> b!770887 (= res!521514 (= (seekEntryOrOpen!0 (select (arr!20289 a!3186) j!159) a!3186 mask!3328) lt!343141))))

(assert (=> b!770887 (= lt!343141 (Found!7889 j!159))))

(declare-fun b!770888 () Bool)

(declare-fun res!521511 () Bool)

(assert (=> b!770888 (=> (not res!521511) (not e!429172))))

(declare-fun arrayContainsKey!0 (array!42378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770888 (= res!521511 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770889 () Bool)

(assert (=> b!770889 (= e!429173 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20289 a!3186) j!159) a!3186 mask!3328) (Found!7889 j!159)))))

(declare-fun b!770890 () Bool)

(assert (=> b!770890 (= e!429179 e!429171)))

(declare-fun res!521501 () Bool)

(assert (=> b!770890 (=> (not res!521501) (not e!429171))))

(declare-fun lt!343136 () SeekEntryResult!7889)

(assert (=> b!770890 (= res!521501 (= lt!343136 lt!343137))))

(declare-fun lt!343142 () (_ BitVec 64))

(declare-fun lt!343145 () array!42378)

(assert (=> b!770890 (= lt!343137 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343142 lt!343145 mask!3328))))

(assert (=> b!770890 (= lt!343136 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343142 mask!3328) lt!343142 lt!343145 mask!3328))))

(assert (=> b!770890 (= lt!343142 (select (store (arr!20289 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!770890 (= lt!343145 (array!42379 (store (arr!20289 a!3186) i!1173 k!2102) (size!20710 a!3186)))))

(declare-fun b!770891 () Bool)

(assert (=> b!770891 (= e!429170 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20289 a!3186) j!159) a!3186 mask!3328) lt!343141))))

(declare-fun b!770892 () Bool)

(declare-fun res!521509 () Bool)

(assert (=> b!770892 (=> (not res!521509) (not e!429179))))

(assert (=> b!770892 (= res!521509 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20289 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770893 () Bool)

(declare-fun res!521502 () Bool)

(assert (=> b!770893 (=> (not res!521502) (not e!429176))))

(assert (=> b!770893 (= res!521502 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20710 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20710 a!3186))))))

(declare-fun b!770894 () Bool)

(declare-fun res!521508 () Bool)

(assert (=> b!770894 (=> (not res!521508) (not e!429172))))

(assert (=> b!770894 (= res!521508 (validKeyInArray!0 (select (arr!20289 a!3186) j!159)))))

(declare-fun b!770895 () Bool)

(declare-fun res!521506 () Bool)

(assert (=> b!770895 (=> (not res!521506) (not e!429179))))

(assert (=> b!770895 (= res!521506 e!429173)))

(declare-fun c!85083 () Bool)

(assert (=> b!770895 (= c!85083 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!66816 res!521503) b!770877))

(assert (= (and b!770877 res!521516) b!770894))

(assert (= (and b!770894 res!521508) b!770881))

(assert (= (and b!770881 res!521510) b!770888))

(assert (= (and b!770888 res!521511) b!770886))

(assert (= (and b!770886 res!521505) b!770880))

(assert (= (and b!770880 res!521504) b!770878))

(assert (= (and b!770878 res!521513) b!770893))

(assert (= (and b!770893 res!521502) b!770882))

(assert (= (and b!770882 res!521512) b!770892))

(assert (= (and b!770892 res!521509) b!770895))

(assert (= (and b!770895 c!85083) b!770883))

(assert (= (and b!770895 (not c!85083)) b!770889))

(assert (= (and b!770895 res!521506) b!770890))

(assert (= (and b!770890 res!521501) b!770884))

(assert (= (and b!770884 res!521515) b!770887))

(assert (= (and b!770887 res!521514) b!770891))

(assert (= (and b!770884 (not res!521507)) b!770879))

(assert (= (and b!770879 c!85084) b!770885))

(assert (= (and b!770879 (not c!85084)) b!770876))

(declare-fun m!716099 () Bool)

(assert (=> b!770880 m!716099))

(declare-fun m!716101 () Bool)

(assert (=> b!770891 m!716101))

(assert (=> b!770891 m!716101))

(declare-fun m!716103 () Bool)

(assert (=> b!770891 m!716103))

(assert (=> b!770889 m!716101))

(assert (=> b!770889 m!716101))

(declare-fun m!716105 () Bool)

(assert (=> b!770889 m!716105))

(assert (=> b!770882 m!716101))

(assert (=> b!770882 m!716101))

(declare-fun m!716107 () Bool)

(assert (=> b!770882 m!716107))

(assert (=> b!770882 m!716107))

(assert (=> b!770882 m!716101))

(declare-fun m!716109 () Bool)

(assert (=> b!770882 m!716109))

(declare-fun m!716111 () Bool)

(assert (=> b!770890 m!716111))

(declare-fun m!716113 () Bool)

(assert (=> b!770890 m!716113))

(declare-fun m!716115 () Bool)

(assert (=> b!770890 m!716115))

(declare-fun m!716117 () Bool)

(assert (=> b!770890 m!716117))

(assert (=> b!770890 m!716115))

(declare-fun m!716119 () Bool)

(assert (=> b!770890 m!716119))

(declare-fun m!716121 () Bool)

(assert (=> b!770884 m!716121))

(declare-fun m!716123 () Bool)

(assert (=> b!770884 m!716123))

(declare-fun m!716125 () Bool)

(assert (=> b!770888 m!716125))

(declare-fun m!716127 () Bool)

(assert (=> b!770892 m!716127))

(declare-fun m!716129 () Bool)

(assert (=> b!770879 m!716129))

(declare-fun m!716131 () Bool)

(assert (=> start!66816 m!716131))

(declare-fun m!716133 () Bool)

(assert (=> start!66816 m!716133))

(assert (=> b!770887 m!716101))

(assert (=> b!770887 m!716101))

(declare-fun m!716135 () Bool)

(assert (=> b!770887 m!716135))

(assert (=> b!770883 m!716101))

(assert (=> b!770883 m!716101))

(declare-fun m!716137 () Bool)

(assert (=> b!770883 m!716137))

(declare-fun m!716139 () Bool)

(assert (=> b!770881 m!716139))

(assert (=> b!770885 m!716101))

(assert (=> b!770885 m!716101))

(declare-fun m!716141 () Bool)

(assert (=> b!770885 m!716141))

(assert (=> b!770894 m!716101))

(assert (=> b!770894 m!716101))

(declare-fun m!716143 () Bool)

(assert (=> b!770894 m!716143))

(declare-fun m!716145 () Bool)

(assert (=> b!770878 m!716145))

(declare-fun m!716147 () Bool)

(assert (=> b!770886 m!716147))

(assert (=> b!770876 m!716101))

(assert (=> b!770876 m!716101))

(assert (=> b!770876 m!716105))

(assert (=> b!770876 m!716101))

(declare-fun m!716149 () Bool)

(assert (=> b!770876 m!716149))

(push 1)

