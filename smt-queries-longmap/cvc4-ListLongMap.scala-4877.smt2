; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67180 () Bool)

(assert start!67180)

(declare-fun b!776866 () Bool)

(declare-fun e!432279 () Bool)

(declare-fun e!432280 () Bool)

(assert (=> b!776866 (= e!432279 e!432280)))

(declare-fun res!525622 () Bool)

(assert (=> b!776866 (=> (not res!525622) (not e!432280))))

(declare-datatypes ((array!42535 0))(
  ( (array!42536 (arr!20363 (Array (_ BitVec 32) (_ BitVec 64))) (size!20784 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42535)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7963 0))(
  ( (MissingZero!7963 (index!34220 (_ BitVec 32))) (Found!7963 (index!34221 (_ BitVec 32))) (Intermediate!7963 (undefined!8775 Bool) (index!34222 (_ BitVec 32)) (x!65154 (_ BitVec 32))) (Undefined!7963) (MissingVacant!7963 (index!34223 (_ BitVec 32))) )
))
(declare-fun lt!346137 () SeekEntryResult!7963)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42535 (_ BitVec 32)) SeekEntryResult!7963)

(assert (=> b!776866 (= res!525622 (= (seekEntryOrOpen!0 (select (arr!20363 a!3186) j!159) a!3186 mask!3328) lt!346137))))

(assert (=> b!776866 (= lt!346137 (Found!7963 j!159))))

(declare-fun b!776867 () Bool)

(declare-fun res!525631 () Bool)

(declare-fun e!432283 () Bool)

(assert (=> b!776867 (=> (not res!525631) (not e!432283))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776867 (= res!525631 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776868 () Bool)

(declare-fun e!432287 () Bool)

(declare-fun e!432286 () Bool)

(assert (=> b!776868 (= e!432287 (not e!432286))))

(declare-fun res!525624 () Bool)

(assert (=> b!776868 (=> res!525624 e!432286)))

(declare-fun lt!346141 () SeekEntryResult!7963)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!776868 (= res!525624 (or (not (is-Intermediate!7963 lt!346141)) (bvslt x!1131 (x!65154 lt!346141)) (not (= x!1131 (x!65154 lt!346141))) (not (= index!1321 (index!34222 lt!346141)))))))

(assert (=> b!776868 e!432279))

(declare-fun res!525630 () Bool)

(assert (=> b!776868 (=> (not res!525630) (not e!432279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42535 (_ BitVec 32)) Bool)

(assert (=> b!776868 (= res!525630 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26820 0))(
  ( (Unit!26821) )
))
(declare-fun lt!346142 () Unit!26820)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42535 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26820)

(assert (=> b!776868 (= lt!346142 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!525627 () Bool)

(assert (=> start!67180 (=> (not res!525627) (not e!432283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67180 (= res!525627 (validMask!0 mask!3328))))

(assert (=> start!67180 e!432283))

(assert (=> start!67180 true))

(declare-fun array_inv!16159 (array!42535) Bool)

(assert (=> start!67180 (array_inv!16159 a!3186)))

(declare-fun b!776869 () Bool)

(assert (=> b!776869 (= e!432286 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!346139 () SeekEntryResult!7963)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42535 (_ BitVec 32)) SeekEntryResult!7963)

(assert (=> b!776869 (= lt!346139 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20363 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776870 () Bool)

(declare-fun e!432285 () Bool)

(assert (=> b!776870 (= e!432285 e!432287)))

(declare-fun res!525628 () Bool)

(assert (=> b!776870 (=> (not res!525628) (not e!432287))))

(declare-fun lt!346134 () SeekEntryResult!7963)

(assert (=> b!776870 (= res!525628 (= lt!346134 lt!346141))))

(declare-fun lt!346135 () (_ BitVec 64))

(declare-fun lt!346136 () array!42535)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42535 (_ BitVec 32)) SeekEntryResult!7963)

(assert (=> b!776870 (= lt!346141 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346135 lt!346136 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776870 (= lt!346134 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346135 mask!3328) lt!346135 lt!346136 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!776870 (= lt!346135 (select (store (arr!20363 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!776870 (= lt!346136 (array!42536 (store (arr!20363 a!3186) i!1173 k!2102) (size!20784 a!3186)))))

(declare-fun b!776871 () Bool)

(declare-fun res!525620 () Bool)

(declare-fun e!432281 () Bool)

(assert (=> b!776871 (=> (not res!525620) (not e!432281))))

(assert (=> b!776871 (= res!525620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!776872 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!776872 (= e!432280 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20363 a!3186) j!159) a!3186 mask!3328) lt!346137))))

(declare-fun e!432282 () Bool)

(declare-fun b!776873 () Bool)

(declare-fun lt!346140 () SeekEntryResult!7963)

(assert (=> b!776873 (= e!432282 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20363 a!3186) j!159) a!3186 mask!3328) lt!346140))))

(declare-fun b!776874 () Bool)

(declare-fun res!525626 () Bool)

(assert (=> b!776874 (=> (not res!525626) (not e!432283))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776874 (= res!525626 (validKeyInArray!0 k!2102))))

(declare-fun b!776875 () Bool)

(declare-fun res!525633 () Bool)

(assert (=> b!776875 (=> (not res!525633) (not e!432281))))

(assert (=> b!776875 (= res!525633 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20784 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20784 a!3186))))))

(declare-fun b!776876 () Bool)

(declare-fun res!525635 () Bool)

(assert (=> b!776876 (=> (not res!525635) (not e!432283))))

(assert (=> b!776876 (= res!525635 (validKeyInArray!0 (select (arr!20363 a!3186) j!159)))))

(declare-fun b!776877 () Bool)

(assert (=> b!776877 (= e!432282 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20363 a!3186) j!159) a!3186 mask!3328) (Found!7963 j!159)))))

(declare-fun b!776878 () Bool)

(declare-fun res!525621 () Bool)

(assert (=> b!776878 (=> (not res!525621) (not e!432281))))

(declare-datatypes ((List!14365 0))(
  ( (Nil!14362) (Cons!14361 (h!15469 (_ BitVec 64)) (t!20680 List!14365)) )
))
(declare-fun arrayNoDuplicates!0 (array!42535 (_ BitVec 32) List!14365) Bool)

(assert (=> b!776878 (= res!525621 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14362))))

(declare-fun b!776879 () Bool)

(declare-fun res!525623 () Bool)

(assert (=> b!776879 (=> (not res!525623) (not e!432283))))

(assert (=> b!776879 (= res!525623 (and (= (size!20784 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20784 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20784 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776880 () Bool)

(declare-fun res!525632 () Bool)

(assert (=> b!776880 (=> (not res!525632) (not e!432285))))

(assert (=> b!776880 (= res!525632 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20363 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776881 () Bool)

(assert (=> b!776881 (= e!432281 e!432285)))

(declare-fun res!525625 () Bool)

(assert (=> b!776881 (=> (not res!525625) (not e!432285))))

(assert (=> b!776881 (= res!525625 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20363 a!3186) j!159) mask!3328) (select (arr!20363 a!3186) j!159) a!3186 mask!3328) lt!346140))))

(assert (=> b!776881 (= lt!346140 (Intermediate!7963 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776882 () Bool)

(declare-fun res!525629 () Bool)

(assert (=> b!776882 (=> (not res!525629) (not e!432285))))

(assert (=> b!776882 (= res!525629 e!432282)))

(declare-fun c!86023 () Bool)

(assert (=> b!776882 (= c!86023 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776883 () Bool)

(assert (=> b!776883 (= e!432283 e!432281)))

(declare-fun res!525634 () Bool)

(assert (=> b!776883 (=> (not res!525634) (not e!432281))))

(declare-fun lt!346138 () SeekEntryResult!7963)

(assert (=> b!776883 (= res!525634 (or (= lt!346138 (MissingZero!7963 i!1173)) (= lt!346138 (MissingVacant!7963 i!1173))))))

(assert (=> b!776883 (= lt!346138 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!67180 res!525627) b!776879))

(assert (= (and b!776879 res!525623) b!776876))

(assert (= (and b!776876 res!525635) b!776874))

(assert (= (and b!776874 res!525626) b!776867))

(assert (= (and b!776867 res!525631) b!776883))

(assert (= (and b!776883 res!525634) b!776871))

(assert (= (and b!776871 res!525620) b!776878))

(assert (= (and b!776878 res!525621) b!776875))

(assert (= (and b!776875 res!525633) b!776881))

(assert (= (and b!776881 res!525625) b!776880))

(assert (= (and b!776880 res!525632) b!776882))

(assert (= (and b!776882 c!86023) b!776873))

(assert (= (and b!776882 (not c!86023)) b!776877))

(assert (= (and b!776882 res!525629) b!776870))

(assert (= (and b!776870 res!525628) b!776868))

(assert (= (and b!776868 res!525630) b!776866))

(assert (= (and b!776866 res!525622) b!776872))

(assert (= (and b!776868 (not res!525624)) b!776869))

(declare-fun m!720883 () Bool)

(assert (=> b!776874 m!720883))

(declare-fun m!720885 () Bool)

(assert (=> b!776867 m!720885))

(declare-fun m!720887 () Bool)

(assert (=> b!776873 m!720887))

(assert (=> b!776873 m!720887))

(declare-fun m!720889 () Bool)

(assert (=> b!776873 m!720889))

(assert (=> b!776866 m!720887))

(assert (=> b!776866 m!720887))

(declare-fun m!720891 () Bool)

(assert (=> b!776866 m!720891))

(assert (=> b!776877 m!720887))

(assert (=> b!776877 m!720887))

(declare-fun m!720893 () Bool)

(assert (=> b!776877 m!720893))

(assert (=> b!776869 m!720887))

(assert (=> b!776869 m!720887))

(assert (=> b!776869 m!720893))

(assert (=> b!776872 m!720887))

(assert (=> b!776872 m!720887))

(declare-fun m!720895 () Bool)

(assert (=> b!776872 m!720895))

(declare-fun m!720897 () Bool)

(assert (=> b!776871 m!720897))

(assert (=> b!776876 m!720887))

(assert (=> b!776876 m!720887))

(declare-fun m!720899 () Bool)

(assert (=> b!776876 m!720899))

(declare-fun m!720901 () Bool)

(assert (=> b!776880 m!720901))

(declare-fun m!720903 () Bool)

(assert (=> start!67180 m!720903))

(declare-fun m!720905 () Bool)

(assert (=> start!67180 m!720905))

(assert (=> b!776881 m!720887))

(assert (=> b!776881 m!720887))

(declare-fun m!720907 () Bool)

(assert (=> b!776881 m!720907))

(assert (=> b!776881 m!720907))

(assert (=> b!776881 m!720887))

(declare-fun m!720909 () Bool)

(assert (=> b!776881 m!720909))

(declare-fun m!720911 () Bool)

(assert (=> b!776868 m!720911))

(declare-fun m!720913 () Bool)

(assert (=> b!776868 m!720913))

(declare-fun m!720915 () Bool)

(assert (=> b!776878 m!720915))

(declare-fun m!720917 () Bool)

(assert (=> b!776870 m!720917))

(declare-fun m!720919 () Bool)

(assert (=> b!776870 m!720919))

(declare-fun m!720921 () Bool)

(assert (=> b!776870 m!720921))

(declare-fun m!720923 () Bool)

(assert (=> b!776870 m!720923))

(assert (=> b!776870 m!720919))

(declare-fun m!720925 () Bool)

(assert (=> b!776870 m!720925))

(declare-fun m!720927 () Bool)

(assert (=> b!776883 m!720927))

(push 1)

