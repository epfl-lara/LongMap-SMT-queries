; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66996 () Bool)

(assert start!66996)

(declare-fun b!772880 () Bool)

(declare-datatypes ((Unit!26642 0))(
  ( (Unit!26643) )
))
(declare-fun e!430263 () Unit!26642)

(declare-fun Unit!26644 () Unit!26642)

(assert (=> b!772880 (= e!430263 Unit!26644)))

(declare-datatypes ((array!42420 0))(
  ( (array!42421 (arr!20307 (Array (_ BitVec 32) (_ BitVec 64))) (size!20728 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42420)

(declare-datatypes ((SeekEntryResult!7907 0))(
  ( (MissingZero!7907 (index!33996 (_ BitVec 32))) (Found!7907 (index!33997 (_ BitVec 32))) (Intermediate!7907 (undefined!8719 Bool) (index!33998 (_ BitVec 32)) (x!64942 (_ BitVec 32))) (Undefined!7907) (MissingVacant!7907 (index!33999 (_ BitVec 32))) )
))
(declare-fun lt!344109 () SeekEntryResult!7907)

(declare-fun lt!344108 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42420 (_ BitVec 32)) SeekEntryResult!7907)

(assert (=> b!772880 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344108 (select (arr!20307 a!3186) j!159) a!3186 mask!3328) lt!344109)))

(declare-fun b!772881 () Bool)

(declare-fun Unit!26645 () Unit!26642)

(assert (=> b!772881 (= e!430263 Unit!26645)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!344107 () SeekEntryResult!7907)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42420 (_ BitVec 32)) SeekEntryResult!7907)

(assert (=> b!772881 (= lt!344107 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20307 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!772881 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344108 resIntermediateIndex!5 (select (arr!20307 a!3186) j!159) a!3186 mask!3328) (Found!7907 j!159))))

(declare-fun e!430269 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!772882 () Bool)

(declare-fun lt!344110 () SeekEntryResult!7907)

(assert (=> b!772882 (= e!430269 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20307 a!3186) j!159) a!3186 mask!3328) lt!344110))))

(declare-fun b!772883 () Bool)

(declare-fun e!430267 () Bool)

(declare-fun e!430264 () Bool)

(assert (=> b!772883 (= e!430267 e!430264)))

(declare-fun res!522641 () Bool)

(assert (=> b!772883 (=> (not res!522641) (not e!430264))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772883 (= res!522641 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20307 a!3186) j!159) mask!3328) (select (arr!20307 a!3186) j!159) a!3186 mask!3328) lt!344109))))

(assert (=> b!772883 (= lt!344109 (Intermediate!7907 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!522638 () Bool)

(declare-fun e!430265 () Bool)

(assert (=> start!66996 (=> (not res!522638) (not e!430265))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66996 (= res!522638 (validMask!0 mask!3328))))

(assert (=> start!66996 e!430265))

(assert (=> start!66996 true))

(declare-fun array_inv!16103 (array!42420) Bool)

(assert (=> start!66996 (array_inv!16103 a!3186)))

(declare-fun b!772884 () Bool)

(declare-fun e!430266 () Bool)

(assert (=> b!772884 (= e!430266 e!430269)))

(declare-fun res!522640 () Bool)

(assert (=> b!772884 (=> (not res!522640) (not e!430269))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42420 (_ BitVec 32)) SeekEntryResult!7907)

(assert (=> b!772884 (= res!522640 (= (seekEntryOrOpen!0 (select (arr!20307 a!3186) j!159) a!3186 mask!3328) lt!344110))))

(assert (=> b!772884 (= lt!344110 (Found!7907 j!159))))

(declare-fun b!772885 () Bool)

(declare-fun res!522645 () Bool)

(assert (=> b!772885 (=> (not res!522645) (not e!430265))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!772885 (= res!522645 (and (= (size!20728 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20728 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20728 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!772886 () Bool)

(declare-fun res!522642 () Bool)

(assert (=> b!772886 (=> (not res!522642) (not e!430267))))

(declare-datatypes ((List!14309 0))(
  ( (Nil!14306) (Cons!14305 (h!15410 (_ BitVec 64)) (t!20624 List!14309)) )
))
(declare-fun arrayNoDuplicates!0 (array!42420 (_ BitVec 32) List!14309) Bool)

(assert (=> b!772886 (= res!522642 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14306))))

(declare-fun b!772887 () Bool)

(declare-fun res!522639 () Bool)

(assert (=> b!772887 (=> (not res!522639) (not e!430267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42420 (_ BitVec 32)) Bool)

(assert (=> b!772887 (= res!522639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!772888 () Bool)

(assert (=> b!772888 (= e!430265 e!430267)))

(declare-fun res!522635 () Bool)

(assert (=> b!772888 (=> (not res!522635) (not e!430267))))

(declare-fun lt!344106 () SeekEntryResult!7907)

(assert (=> b!772888 (= res!522635 (or (= lt!344106 (MissingZero!7907 i!1173)) (= lt!344106 (MissingVacant!7907 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!772888 (= lt!344106 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!772889 () Bool)

(declare-fun res!522647 () Bool)

(assert (=> b!772889 (=> (not res!522647) (not e!430264))))

(declare-fun e!430268 () Bool)

(assert (=> b!772889 (= res!522647 e!430268)))

(declare-fun c!85521 () Bool)

(assert (=> b!772889 (= c!85521 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!772890 () Bool)

(assert (=> b!772890 (= e!430268 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20307 a!3186) j!159) a!3186 mask!3328) (Found!7907 j!159)))))

(declare-fun b!772891 () Bool)

(declare-fun res!522644 () Bool)

(assert (=> b!772891 (=> (not res!522644) (not e!430264))))

(assert (=> b!772891 (= res!522644 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20307 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772892 () Bool)

(declare-fun res!522649 () Bool)

(assert (=> b!772892 (=> (not res!522649) (not e!430267))))

(assert (=> b!772892 (= res!522649 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20728 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20728 a!3186))))))

(declare-fun b!772893 () Bool)

(declare-fun res!522650 () Bool)

(assert (=> b!772893 (=> (not res!522650) (not e!430265))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!772893 (= res!522650 (validKeyInArray!0 k!2102))))

(declare-fun b!772894 () Bool)

(assert (=> b!772894 (= e!430268 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20307 a!3186) j!159) a!3186 mask!3328) lt!344109))))

(declare-fun b!772895 () Bool)

(declare-fun res!522636 () Bool)

(assert (=> b!772895 (=> (not res!522636) (not e!430265))))

(declare-fun arrayContainsKey!0 (array!42420 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!772895 (= res!522636 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!772896 () Bool)

(declare-fun res!522643 () Bool)

(assert (=> b!772896 (=> (not res!522643) (not e!430265))))

(assert (=> b!772896 (= res!522643 (validKeyInArray!0 (select (arr!20307 a!3186) j!159)))))

(declare-fun b!772897 () Bool)

(declare-fun e!430271 () Bool)

(declare-fun e!430262 () Bool)

(assert (=> b!772897 (= e!430271 (not e!430262))))

(declare-fun res!522637 () Bool)

(assert (=> b!772897 (=> res!522637 e!430262)))

(declare-fun lt!344101 () SeekEntryResult!7907)

(assert (=> b!772897 (= res!522637 (or (not (is-Intermediate!7907 lt!344101)) (bvsge x!1131 (x!64942 lt!344101))))))

(assert (=> b!772897 e!430266))

(declare-fun res!522648 () Bool)

(assert (=> b!772897 (=> (not res!522648) (not e!430266))))

(assert (=> b!772897 (= res!522648 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344111 () Unit!26642)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42420 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26642)

(assert (=> b!772897 (= lt!344111 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!772898 () Bool)

(assert (=> b!772898 (= e!430264 e!430271)))

(declare-fun res!522646 () Bool)

(assert (=> b!772898 (=> (not res!522646) (not e!430271))))

(declare-fun lt!344105 () SeekEntryResult!7907)

(assert (=> b!772898 (= res!522646 (= lt!344105 lt!344101))))

(declare-fun lt!344103 () (_ BitVec 64))

(declare-fun lt!344104 () array!42420)

(assert (=> b!772898 (= lt!344101 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344103 lt!344104 mask!3328))))

(assert (=> b!772898 (= lt!344105 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344103 mask!3328) lt!344103 lt!344104 mask!3328))))

(assert (=> b!772898 (= lt!344103 (select (store (arr!20307 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!772898 (= lt!344104 (array!42421 (store (arr!20307 a!3186) i!1173 k!2102) (size!20728 a!3186)))))

(declare-fun b!772899 () Bool)

(assert (=> b!772899 (= e!430262 true)))

(declare-fun lt!344102 () Unit!26642)

(assert (=> b!772899 (= lt!344102 e!430263)))

(declare-fun c!85522 () Bool)

(assert (=> b!772899 (= c!85522 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772899 (= lt!344108 (nextIndex!0 index!1321 x!1131 mask!3328))))

(assert (= (and start!66996 res!522638) b!772885))

(assert (= (and b!772885 res!522645) b!772896))

(assert (= (and b!772896 res!522643) b!772893))

(assert (= (and b!772893 res!522650) b!772895))

(assert (= (and b!772895 res!522636) b!772888))

(assert (= (and b!772888 res!522635) b!772887))

(assert (= (and b!772887 res!522639) b!772886))

(assert (= (and b!772886 res!522642) b!772892))

(assert (= (and b!772892 res!522649) b!772883))

(assert (= (and b!772883 res!522641) b!772891))

(assert (= (and b!772891 res!522644) b!772889))

(assert (= (and b!772889 c!85521) b!772894))

(assert (= (and b!772889 (not c!85521)) b!772890))

(assert (= (and b!772889 res!522647) b!772898))

(assert (= (and b!772898 res!522646) b!772897))

(assert (= (and b!772897 res!522648) b!772884))

(assert (= (and b!772884 res!522640) b!772882))

(assert (= (and b!772897 (not res!522637)) b!772899))

(assert (= (and b!772899 c!85522) b!772880))

(assert (= (and b!772899 (not c!85522)) b!772881))

(declare-fun m!717683 () Bool)

(assert (=> b!772888 m!717683))

(declare-fun m!717685 () Bool)

(assert (=> b!772881 m!717685))

(assert (=> b!772881 m!717685))

(declare-fun m!717687 () Bool)

(assert (=> b!772881 m!717687))

(assert (=> b!772881 m!717685))

(declare-fun m!717689 () Bool)

(assert (=> b!772881 m!717689))

(assert (=> b!772883 m!717685))

(assert (=> b!772883 m!717685))

(declare-fun m!717691 () Bool)

(assert (=> b!772883 m!717691))

(assert (=> b!772883 m!717691))

(assert (=> b!772883 m!717685))

(declare-fun m!717693 () Bool)

(assert (=> b!772883 m!717693))

(assert (=> b!772882 m!717685))

(assert (=> b!772882 m!717685))

(declare-fun m!717695 () Bool)

(assert (=> b!772882 m!717695))

(declare-fun m!717697 () Bool)

(assert (=> b!772891 m!717697))

(assert (=> b!772880 m!717685))

(assert (=> b!772880 m!717685))

(declare-fun m!717699 () Bool)

(assert (=> b!772880 m!717699))

(declare-fun m!717701 () Bool)

(assert (=> b!772895 m!717701))

(declare-fun m!717703 () Bool)

(assert (=> start!66996 m!717703))

(declare-fun m!717705 () Bool)

(assert (=> start!66996 m!717705))

(declare-fun m!717707 () Bool)

(assert (=> b!772897 m!717707))

(declare-fun m!717709 () Bool)

(assert (=> b!772897 m!717709))

(assert (=> b!772894 m!717685))

(assert (=> b!772894 m!717685))

(declare-fun m!717711 () Bool)

(assert (=> b!772894 m!717711))

(declare-fun m!717713 () Bool)

(assert (=> b!772887 m!717713))

(declare-fun m!717715 () Bool)

(assert (=> b!772899 m!717715))

(assert (=> b!772890 m!717685))

(assert (=> b!772890 m!717685))

(assert (=> b!772890 m!717687))

(declare-fun m!717717 () Bool)

(assert (=> b!772886 m!717717))

(assert (=> b!772896 m!717685))

(assert (=> b!772896 m!717685))

(declare-fun m!717719 () Bool)

(assert (=> b!772896 m!717719))

(declare-fun m!717721 () Bool)

(assert (=> b!772893 m!717721))

(assert (=> b!772884 m!717685))

(assert (=> b!772884 m!717685))

(declare-fun m!717723 () Bool)

(assert (=> b!772884 m!717723))

(declare-fun m!717725 () Bool)

(assert (=> b!772898 m!717725))

(declare-fun m!717727 () Bool)

(assert (=> b!772898 m!717727))

(declare-fun m!717729 () Bool)

(assert (=> b!772898 m!717729))

(declare-fun m!717731 () Bool)

(assert (=> b!772898 m!717731))

(assert (=> b!772898 m!717725))

(declare-fun m!717733 () Bool)

(assert (=> b!772898 m!717733))

(push 1)

