; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65570 () Bool)

(assert start!65570)

(declare-fun b!749187 () Bool)

(declare-fun e!418071 () Bool)

(declare-fun e!418072 () Bool)

(assert (=> b!749187 (= e!418071 e!418072)))

(declare-fun res!505481 () Bool)

(assert (=> b!749187 (=> (not res!505481) (not e!418072))))

(declare-datatypes ((array!41743 0))(
  ( (array!41744 (arr!19985 (Array (_ BitVec 32) (_ BitVec 64))) (size!20406 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41743)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7585 0))(
  ( (MissingZero!7585 (index!32708 (_ BitVec 32))) (Found!7585 (index!32709 (_ BitVec 32))) (Intermediate!7585 (undefined!8397 Bool) (index!32710 (_ BitVec 32)) (x!63639 (_ BitVec 32))) (Undefined!7585) (MissingVacant!7585 (index!32711 (_ BitVec 32))) )
))
(declare-fun lt!333060 () SeekEntryResult!7585)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41743 (_ BitVec 32)) SeekEntryResult!7585)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749187 (= res!505481 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19985 a!3186) j!159) mask!3328) (select (arr!19985 a!3186) j!159) a!3186 mask!3328) lt!333060))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749187 (= lt!333060 (Intermediate!7585 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun lt!333061 () SeekEntryResult!7585)

(declare-fun e!418066 () Bool)

(declare-fun b!749188 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41743 (_ BitVec 32)) SeekEntryResult!7585)

(assert (=> b!749188 (= e!418066 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19985 a!3186) j!159) a!3186 mask!3328) lt!333061))))

(declare-fun b!749190 () Bool)

(declare-fun res!505480 () Bool)

(assert (=> b!749190 (=> (not res!505480) (not e!418071))))

(declare-datatypes ((List!13987 0))(
  ( (Nil!13984) (Cons!13983 (h!15055 (_ BitVec 64)) (t!20302 List!13987)) )
))
(declare-fun arrayNoDuplicates!0 (array!41743 (_ BitVec 32) List!13987) Bool)

(assert (=> b!749190 (= res!505480 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13984))))

(declare-fun b!749191 () Bool)

(declare-fun res!505486 () Bool)

(assert (=> b!749191 (=> (not res!505486) (not e!418072))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!749191 (= res!505486 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19985 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!749192 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!418065 () Bool)

(assert (=> b!749192 (= e!418065 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19985 a!3186) j!159) a!3186 mask!3328) lt!333060))))

(declare-fun b!749193 () Bool)

(declare-fun e!418067 () Bool)

(declare-fun e!418064 () Bool)

(assert (=> b!749193 (= e!418067 e!418064)))

(declare-fun res!505476 () Bool)

(assert (=> b!749193 (=> res!505476 e!418064)))

(assert (=> b!749193 (= res!505476 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!749193 (= (select (store (arr!19985 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!25720 0))(
  ( (Unit!25721) )
))
(declare-fun lt!333056 () Unit!25720)

(declare-fun e!418073 () Unit!25720)

(assert (=> b!749193 (= lt!333056 e!418073)))

(declare-fun c!82239 () Bool)

(assert (=> b!749193 (= c!82239 (= (select (store (arr!19985 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749194 () Bool)

(declare-fun Unit!25722 () Unit!25720)

(assert (=> b!749194 (= e!418073 Unit!25722)))

(assert (=> b!749194 false))

(declare-fun b!749195 () Bool)

(declare-fun res!505487 () Bool)

(declare-fun e!418070 () Bool)

(assert (=> b!749195 (=> (not res!505487) (not e!418070))))

(declare-fun arrayContainsKey!0 (array!41743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749195 (= res!505487 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!749196 () Bool)

(declare-fun res!505477 () Bool)

(assert (=> b!749196 (=> (not res!505477) (not e!418071))))

(assert (=> b!749196 (= res!505477 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20406 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20406 a!3186))))))

(declare-fun b!749197 () Bool)

(declare-fun e!418068 () Bool)

(assert (=> b!749197 (= e!418068 (not e!418067))))

(declare-fun res!505475 () Bool)

(assert (=> b!749197 (=> res!505475 e!418067)))

(declare-fun lt!333057 () SeekEntryResult!7585)

(assert (=> b!749197 (= res!505475 (or (not (is-Intermediate!7585 lt!333057)) (bvslt x!1131 (x!63639 lt!333057)) (not (= x!1131 (x!63639 lt!333057))) (not (= index!1321 (index!32710 lt!333057)))))))

(assert (=> b!749197 e!418066))

(declare-fun res!505473 () Bool)

(assert (=> b!749197 (=> (not res!505473) (not e!418066))))

(declare-fun lt!333063 () SeekEntryResult!7585)

(assert (=> b!749197 (= res!505473 (= lt!333063 lt!333061))))

(assert (=> b!749197 (= lt!333061 (Found!7585 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41743 (_ BitVec 32)) SeekEntryResult!7585)

(assert (=> b!749197 (= lt!333063 (seekEntryOrOpen!0 (select (arr!19985 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41743 (_ BitVec 32)) Bool)

(assert (=> b!749197 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333058 () Unit!25720)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41743 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25720)

(assert (=> b!749197 (= lt!333058 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!749198 () Bool)

(declare-fun Unit!25723 () Unit!25720)

(assert (=> b!749198 (= e!418073 Unit!25723)))

(declare-fun b!749199 () Bool)

(declare-fun res!505479 () Bool)

(assert (=> b!749199 (=> res!505479 e!418067)))

(assert (=> b!749199 (= res!505479 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19985 a!3186) j!159) a!3186 mask!3328) lt!333061)))))

(declare-fun b!749200 () Bool)

(declare-fun res!505470 () Bool)

(assert (=> b!749200 (=> (not res!505470) (not e!418070))))

(assert (=> b!749200 (= res!505470 (and (= (size!20406 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20406 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20406 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749201 () Bool)

(assert (=> b!749201 (= e!418070 e!418071)))

(declare-fun res!505472 () Bool)

(assert (=> b!749201 (=> (not res!505472) (not e!418071))))

(declare-fun lt!333062 () SeekEntryResult!7585)

(assert (=> b!749201 (= res!505472 (or (= lt!333062 (MissingZero!7585 i!1173)) (= lt!333062 (MissingVacant!7585 i!1173))))))

(assert (=> b!749201 (= lt!333062 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!749202 () Bool)

(declare-fun res!505483 () Bool)

(assert (=> b!749202 (=> (not res!505483) (not e!418071))))

(assert (=> b!749202 (= res!505483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749203 () Bool)

(assert (=> b!749203 (= e!418065 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19985 a!3186) j!159) a!3186 mask!3328) (Found!7585 j!159)))))

(declare-fun b!749204 () Bool)

(declare-fun res!505478 () Bool)

(assert (=> b!749204 (=> (not res!505478) (not e!418072))))

(assert (=> b!749204 (= res!505478 e!418065)))

(declare-fun c!82240 () Bool)

(assert (=> b!749204 (= c!82240 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749205 () Bool)

(declare-fun res!505474 () Bool)

(assert (=> b!749205 (=> (not res!505474) (not e!418070))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749205 (= res!505474 (validKeyInArray!0 (select (arr!19985 a!3186) j!159)))))

(declare-fun res!505482 () Bool)

(assert (=> start!65570 (=> (not res!505482) (not e!418070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65570 (= res!505482 (validMask!0 mask!3328))))

(assert (=> start!65570 e!418070))

(assert (=> start!65570 true))

(declare-fun array_inv!15781 (array!41743) Bool)

(assert (=> start!65570 (array_inv!15781 a!3186)))

(declare-fun b!749189 () Bool)

(declare-fun res!505484 () Bool)

(assert (=> b!749189 (=> (not res!505484) (not e!418070))))

(assert (=> b!749189 (= res!505484 (validKeyInArray!0 k!2102))))

(declare-fun b!749206 () Bool)

(declare-fun res!505471 () Bool)

(assert (=> b!749206 (=> res!505471 e!418067)))

(declare-fun lt!333059 () (_ BitVec 64))

(assert (=> b!749206 (= res!505471 (= (select (store (arr!19985 a!3186) i!1173 k!2102) index!1321) lt!333059))))

(declare-fun b!749207 () Bool)

(assert (=> b!749207 (= e!418064 (validKeyInArray!0 lt!333059))))

(declare-fun b!749208 () Bool)

(assert (=> b!749208 (= e!418072 e!418068)))

(declare-fun res!505485 () Bool)

(assert (=> b!749208 (=> (not res!505485) (not e!418068))))

(declare-fun lt!333064 () SeekEntryResult!7585)

(assert (=> b!749208 (= res!505485 (= lt!333064 lt!333057))))

(declare-fun lt!333065 () array!41743)

(assert (=> b!749208 (= lt!333057 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333059 lt!333065 mask!3328))))

(assert (=> b!749208 (= lt!333064 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333059 mask!3328) lt!333059 lt!333065 mask!3328))))

(assert (=> b!749208 (= lt!333059 (select (store (arr!19985 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!749208 (= lt!333065 (array!41744 (store (arr!19985 a!3186) i!1173 k!2102) (size!20406 a!3186)))))

(assert (= (and start!65570 res!505482) b!749200))

(assert (= (and b!749200 res!505470) b!749205))

(assert (= (and b!749205 res!505474) b!749189))

(assert (= (and b!749189 res!505484) b!749195))

(assert (= (and b!749195 res!505487) b!749201))

(assert (= (and b!749201 res!505472) b!749202))

(assert (= (and b!749202 res!505483) b!749190))

(assert (= (and b!749190 res!505480) b!749196))

(assert (= (and b!749196 res!505477) b!749187))

(assert (= (and b!749187 res!505481) b!749191))

(assert (= (and b!749191 res!505486) b!749204))

(assert (= (and b!749204 c!82240) b!749192))

(assert (= (and b!749204 (not c!82240)) b!749203))

(assert (= (and b!749204 res!505478) b!749208))

(assert (= (and b!749208 res!505485) b!749197))

(assert (= (and b!749197 res!505473) b!749188))

(assert (= (and b!749197 (not res!505475)) b!749199))

(assert (= (and b!749199 (not res!505479)) b!749206))

(assert (= (and b!749206 (not res!505471)) b!749193))

(assert (= (and b!749193 c!82239) b!749194))

(assert (= (and b!749193 (not c!82239)) b!749198))

(assert (= (and b!749193 (not res!505476)) b!749207))

(declare-fun m!698849 () Bool)

(assert (=> b!749199 m!698849))

(assert (=> b!749199 m!698849))

(declare-fun m!698851 () Bool)

(assert (=> b!749199 m!698851))

(assert (=> b!749188 m!698849))

(assert (=> b!749188 m!698849))

(declare-fun m!698853 () Bool)

(assert (=> b!749188 m!698853))

(declare-fun m!698855 () Bool)

(assert (=> b!749189 m!698855))

(declare-fun m!698857 () Bool)

(assert (=> b!749206 m!698857))

(declare-fun m!698859 () Bool)

(assert (=> b!749206 m!698859))

(assert (=> b!749193 m!698857))

(assert (=> b!749193 m!698859))

(declare-fun m!698861 () Bool)

(assert (=> b!749201 m!698861))

(declare-fun m!698863 () Bool)

(assert (=> b!749207 m!698863))

(assert (=> b!749192 m!698849))

(assert (=> b!749192 m!698849))

(declare-fun m!698865 () Bool)

(assert (=> b!749192 m!698865))

(declare-fun m!698867 () Bool)

(assert (=> b!749208 m!698867))

(declare-fun m!698869 () Bool)

(assert (=> b!749208 m!698869))

(assert (=> b!749208 m!698857))

(declare-fun m!698871 () Bool)

(assert (=> b!749208 m!698871))

(assert (=> b!749208 m!698867))

(declare-fun m!698873 () Bool)

(assert (=> b!749208 m!698873))

(assert (=> b!749197 m!698849))

(assert (=> b!749197 m!698849))

(declare-fun m!698875 () Bool)

(assert (=> b!749197 m!698875))

(declare-fun m!698877 () Bool)

(assert (=> b!749197 m!698877))

(declare-fun m!698879 () Bool)

(assert (=> b!749197 m!698879))

(assert (=> b!749205 m!698849))

(assert (=> b!749205 m!698849))

(declare-fun m!698881 () Bool)

(assert (=> b!749205 m!698881))

(declare-fun m!698883 () Bool)

(assert (=> b!749202 m!698883))

(declare-fun m!698885 () Bool)

(assert (=> b!749190 m!698885))

(assert (=> b!749187 m!698849))

(assert (=> b!749187 m!698849))

(declare-fun m!698887 () Bool)

(assert (=> b!749187 m!698887))

(assert (=> b!749187 m!698887))

(assert (=> b!749187 m!698849))

(declare-fun m!698889 () Bool)

(assert (=> b!749187 m!698889))

(assert (=> b!749203 m!698849))

(assert (=> b!749203 m!698849))

(assert (=> b!749203 m!698851))

(declare-fun m!698891 () Bool)

(assert (=> b!749191 m!698891))

(declare-fun m!698893 () Bool)

(assert (=> b!749195 m!698893))

(declare-fun m!698895 () Bool)

(assert (=> start!65570 m!698895))

(declare-fun m!698897 () Bool)

(assert (=> start!65570 m!698897))

(push 1)

