; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65840 () Bool)

(assert start!65840)

(declare-fun b!758385 () Bool)

(declare-datatypes ((Unit!26260 0))(
  ( (Unit!26261) )
))
(declare-fun e!422825 () Unit!26260)

(declare-fun Unit!26262 () Unit!26260)

(assert (=> b!758385 (= e!422825 Unit!26262)))

(declare-fun b!758386 () Bool)

(declare-fun res!513048 () Bool)

(declare-fun e!422824 () Bool)

(assert (=> b!758386 (=> (not res!513048) (not e!422824))))

(declare-datatypes ((array!42013 0))(
  ( (array!42014 (arr!20120 (Array (_ BitVec 32) (_ BitVec 64))) (size!20541 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42013)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758386 (= res!513048 (validKeyInArray!0 (select (arr!20120 a!3186) j!159)))))

(declare-fun b!758387 () Bool)

(declare-fun res!513050 () Bool)

(declare-fun e!422819 () Bool)

(assert (=> b!758387 (=> (not res!513050) (not e!422819))))

(declare-fun e!422817 () Bool)

(assert (=> b!758387 (= res!513050 e!422817)))

(declare-fun c!83049 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!758387 (= c!83049 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758388 () Bool)

(declare-fun res!513054 () Bool)

(assert (=> b!758388 (=> (not res!513054) (not e!422824))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!758388 (= res!513054 (validKeyInArray!0 k!2102))))

(declare-fun b!758389 () Bool)

(declare-fun e!422816 () Bool)

(assert (=> b!758389 (= e!422816 e!422819)))

(declare-fun res!513057 () Bool)

(assert (=> b!758389 (=> (not res!513057) (not e!422819))))

(declare-datatypes ((SeekEntryResult!7720 0))(
  ( (MissingZero!7720 (index!33248 (_ BitVec 32))) (Found!7720 (index!33249 (_ BitVec 32))) (Intermediate!7720 (undefined!8532 Bool) (index!33250 (_ BitVec 32)) (x!64134 (_ BitVec 32))) (Undefined!7720) (MissingVacant!7720 (index!33251 (_ BitVec 32))) )
))
(declare-fun lt!337834 () SeekEntryResult!7720)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42013 (_ BitVec 32)) SeekEntryResult!7720)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758389 (= res!513057 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20120 a!3186) j!159) mask!3328) (select (arr!20120 a!3186) j!159) a!3186 mask!3328) lt!337834))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!758389 (= lt!337834 (Intermediate!7720 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758390 () Bool)

(declare-fun res!513056 () Bool)

(assert (=> b!758390 (=> (not res!513056) (not e!422816))))

(declare-datatypes ((List!14122 0))(
  ( (Nil!14119) (Cons!14118 (h!15190 (_ BitVec 64)) (t!20437 List!14122)) )
))
(declare-fun arrayNoDuplicates!0 (array!42013 (_ BitVec 32) List!14122) Bool)

(assert (=> b!758390 (= res!513056 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14119))))

(declare-fun res!513063 () Bool)

(assert (=> start!65840 (=> (not res!513063) (not e!422824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65840 (= res!513063 (validMask!0 mask!3328))))

(assert (=> start!65840 e!422824))

(assert (=> start!65840 true))

(declare-fun array_inv!15916 (array!42013) Bool)

(assert (=> start!65840 (array_inv!15916 a!3186)))

(declare-fun b!758391 () Bool)

(declare-fun res!513058 () Bool)

(assert (=> b!758391 (=> (not res!513058) (not e!422816))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!758391 (= res!513058 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20541 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20541 a!3186))))))

(declare-fun b!758392 () Bool)

(assert (=> b!758392 (= e!422824 e!422816)))

(declare-fun res!513055 () Bool)

(assert (=> b!758392 (=> (not res!513055) (not e!422816))))

(declare-fun lt!337836 () SeekEntryResult!7720)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!758392 (= res!513055 (or (= lt!337836 (MissingZero!7720 i!1173)) (= lt!337836 (MissingVacant!7720 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42013 (_ BitVec 32)) SeekEntryResult!7720)

(assert (=> b!758392 (= lt!337836 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!758393 () Bool)

(declare-fun res!513064 () Bool)

(assert (=> b!758393 (=> (not res!513064) (not e!422819))))

(assert (=> b!758393 (= res!513064 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20120 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758394 () Bool)

(declare-fun res!513051 () Bool)

(assert (=> b!758394 (=> (not res!513051) (not e!422824))))

(assert (=> b!758394 (= res!513051 (and (= (size!20541 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20541 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20541 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758395 () Bool)

(declare-fun e!422815 () Bool)

(assert (=> b!758395 (= e!422819 e!422815)))

(declare-fun res!513065 () Bool)

(assert (=> b!758395 (=> (not res!513065) (not e!422815))))

(declare-fun lt!337832 () SeekEntryResult!7720)

(declare-fun lt!337841 () SeekEntryResult!7720)

(assert (=> b!758395 (= res!513065 (= lt!337832 lt!337841))))

(declare-fun lt!337833 () (_ BitVec 64))

(declare-fun lt!337844 () array!42013)

(assert (=> b!758395 (= lt!337841 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337833 lt!337844 mask!3328))))

(assert (=> b!758395 (= lt!337832 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337833 mask!3328) lt!337833 lt!337844 mask!3328))))

(assert (=> b!758395 (= lt!337833 (select (store (arr!20120 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!758395 (= lt!337844 (array!42014 (store (arr!20120 a!3186) i!1173 k!2102) (size!20541 a!3186)))))

(declare-fun b!758396 () Bool)

(declare-fun e!422822 () Bool)

(declare-fun e!422818 () Bool)

(assert (=> b!758396 (= e!422822 e!422818)))

(declare-fun res!513053 () Bool)

(assert (=> b!758396 (=> res!513053 e!422818)))

(assert (=> b!758396 (= res!513053 (or (not (= (select (arr!20120 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!337840 () SeekEntryResult!7720)

(declare-fun lt!337838 () SeekEntryResult!7720)

(declare-fun lt!337839 () SeekEntryResult!7720)

(declare-fun lt!337843 () SeekEntryResult!7720)

(assert (=> b!758396 (and (= lt!337843 lt!337840) (= lt!337838 lt!337839))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42013 (_ BitVec 32)) SeekEntryResult!7720)

(assert (=> b!758396 (= lt!337840 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337833 lt!337844 mask!3328))))

(assert (=> b!758396 (= lt!337843 (seekEntryOrOpen!0 lt!337833 lt!337844 mask!3328))))

(declare-fun lt!337830 () (_ BitVec 64))

(assert (=> b!758396 (= lt!337830 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!337837 () Unit!26260)

(assert (=> b!758396 (= lt!337837 e!422825)))

(declare-fun c!83050 () Bool)

(assert (=> b!758396 (= c!83050 (= lt!337830 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!758397 () Bool)

(declare-fun e!422814 () Bool)

(assert (=> b!758397 (= e!422814 e!422822)))

(declare-fun res!513062 () Bool)

(assert (=> b!758397 (=> res!513062 e!422822)))

(assert (=> b!758397 (= res!513062 (= lt!337830 lt!337833))))

(assert (=> b!758397 (= lt!337830 (select (store (arr!20120 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!758398 () Bool)

(assert (=> b!758398 (= e!422818 true)))

(assert (=> b!758398 (= lt!337840 lt!337839)))

(declare-fun lt!337835 () Unit!26260)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42013 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26260)

(assert (=> b!758398 (= lt!337835 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!758399 () Bool)

(declare-fun res!513060 () Bool)

(assert (=> b!758399 (=> (not res!513060) (not e!422816))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42013 (_ BitVec 32)) Bool)

(assert (=> b!758399 (= res!513060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758400 () Bool)

(declare-fun e!422823 () Bool)

(assert (=> b!758400 (= e!422823 e!422814)))

(declare-fun res!513059 () Bool)

(assert (=> b!758400 (=> res!513059 e!422814)))

(declare-fun lt!337842 () SeekEntryResult!7720)

(assert (=> b!758400 (= res!513059 (not (= lt!337839 lt!337842)))))

(assert (=> b!758400 (= lt!337839 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20120 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758401 () Bool)

(assert (=> b!758401 (= e!422817 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20120 a!3186) j!159) a!3186 mask!3328) (Found!7720 j!159)))))

(declare-fun b!758402 () Bool)

(assert (=> b!758402 (= e!422817 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20120 a!3186) j!159) a!3186 mask!3328) lt!337834))))

(declare-fun e!422821 () Bool)

(declare-fun b!758403 () Bool)

(assert (=> b!758403 (= e!422821 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20120 a!3186) j!159) a!3186 mask!3328) lt!337842))))

(declare-fun b!758404 () Bool)

(declare-fun res!513049 () Bool)

(assert (=> b!758404 (=> (not res!513049) (not e!422824))))

(declare-fun arrayContainsKey!0 (array!42013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758404 (= res!513049 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758405 () Bool)

(declare-fun Unit!26263 () Unit!26260)

(assert (=> b!758405 (= e!422825 Unit!26263)))

(assert (=> b!758405 false))

(declare-fun b!758406 () Bool)

(assert (=> b!758406 (= e!422815 (not e!422823))))

(declare-fun res!513061 () Bool)

(assert (=> b!758406 (=> res!513061 e!422823)))

(assert (=> b!758406 (= res!513061 (or (not (is-Intermediate!7720 lt!337841)) (bvslt x!1131 (x!64134 lt!337841)) (not (= x!1131 (x!64134 lt!337841))) (not (= index!1321 (index!33250 lt!337841)))))))

(assert (=> b!758406 e!422821))

(declare-fun res!513052 () Bool)

(assert (=> b!758406 (=> (not res!513052) (not e!422821))))

(assert (=> b!758406 (= res!513052 (= lt!337838 lt!337842))))

(assert (=> b!758406 (= lt!337842 (Found!7720 j!159))))

(assert (=> b!758406 (= lt!337838 (seekEntryOrOpen!0 (select (arr!20120 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!758406 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337831 () Unit!26260)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42013 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26260)

(assert (=> b!758406 (= lt!337831 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65840 res!513063) b!758394))

(assert (= (and b!758394 res!513051) b!758386))

(assert (= (and b!758386 res!513048) b!758388))

(assert (= (and b!758388 res!513054) b!758404))

(assert (= (and b!758404 res!513049) b!758392))

(assert (= (and b!758392 res!513055) b!758399))

(assert (= (and b!758399 res!513060) b!758390))

(assert (= (and b!758390 res!513056) b!758391))

(assert (= (and b!758391 res!513058) b!758389))

(assert (= (and b!758389 res!513057) b!758393))

(assert (= (and b!758393 res!513064) b!758387))

(assert (= (and b!758387 c!83049) b!758402))

(assert (= (and b!758387 (not c!83049)) b!758401))

(assert (= (and b!758387 res!513050) b!758395))

(assert (= (and b!758395 res!513065) b!758406))

(assert (= (and b!758406 res!513052) b!758403))

(assert (= (and b!758406 (not res!513061)) b!758400))

(assert (= (and b!758400 (not res!513059)) b!758397))

(assert (= (and b!758397 (not res!513062)) b!758396))

(assert (= (and b!758396 c!83050) b!758405))

(assert (= (and b!758396 (not c!83050)) b!758385))

(assert (= (and b!758396 (not res!513053)) b!758398))

(declare-fun m!705875 () Bool)

(assert (=> b!758401 m!705875))

(assert (=> b!758401 m!705875))

(declare-fun m!705877 () Bool)

(assert (=> b!758401 m!705877))

(declare-fun m!705879 () Bool)

(assert (=> b!758395 m!705879))

(declare-fun m!705881 () Bool)

(assert (=> b!758395 m!705881))

(declare-fun m!705883 () Bool)

(assert (=> b!758395 m!705883))

(assert (=> b!758395 m!705879))

(declare-fun m!705885 () Bool)

(assert (=> b!758395 m!705885))

(declare-fun m!705887 () Bool)

(assert (=> b!758395 m!705887))

(assert (=> b!758406 m!705875))

(assert (=> b!758406 m!705875))

(declare-fun m!705889 () Bool)

(assert (=> b!758406 m!705889))

(declare-fun m!705891 () Bool)

(assert (=> b!758406 m!705891))

(declare-fun m!705893 () Bool)

(assert (=> b!758406 m!705893))

(assert (=> b!758389 m!705875))

(assert (=> b!758389 m!705875))

(declare-fun m!705895 () Bool)

(assert (=> b!758389 m!705895))

(assert (=> b!758389 m!705895))

(assert (=> b!758389 m!705875))

(declare-fun m!705897 () Bool)

(assert (=> b!758389 m!705897))

(assert (=> b!758386 m!705875))

(assert (=> b!758386 m!705875))

(declare-fun m!705899 () Bool)

(assert (=> b!758386 m!705899))

(assert (=> b!758403 m!705875))

(assert (=> b!758403 m!705875))

(declare-fun m!705901 () Bool)

(assert (=> b!758403 m!705901))

(declare-fun m!705903 () Bool)

(assert (=> b!758388 m!705903))

(declare-fun m!705905 () Bool)

(assert (=> b!758392 m!705905))

(declare-fun m!705907 () Bool)

(assert (=> b!758398 m!705907))

(assert (=> b!758397 m!705883))

(declare-fun m!705909 () Bool)

(assert (=> b!758397 m!705909))

(declare-fun m!705911 () Bool)

(assert (=> b!758399 m!705911))

(declare-fun m!705913 () Bool)

(assert (=> start!65840 m!705913))

(declare-fun m!705915 () Bool)

(assert (=> start!65840 m!705915))

(declare-fun m!705917 () Bool)

(assert (=> b!758396 m!705917))

(declare-fun m!705919 () Bool)

(assert (=> b!758396 m!705919))

(declare-fun m!705921 () Bool)

(assert (=> b!758396 m!705921))

(declare-fun m!705923 () Bool)

(assert (=> b!758404 m!705923))

(declare-fun m!705925 () Bool)

(assert (=> b!758390 m!705925))

(declare-fun m!705927 () Bool)

(assert (=> b!758393 m!705927))

(assert (=> b!758400 m!705875))

(assert (=> b!758400 m!705875))

(assert (=> b!758400 m!705877))

(assert (=> b!758402 m!705875))

(assert (=> b!758402 m!705875))

(declare-fun m!705929 () Bool)

(assert (=> b!758402 m!705929))

(push 1)

