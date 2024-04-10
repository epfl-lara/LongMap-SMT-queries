; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65566 () Bool)

(assert start!65566)

(declare-fun b!749055 () Bool)

(declare-fun res!505370 () Bool)

(declare-fun e!418007 () Bool)

(assert (=> b!749055 (=> (not res!505370) (not e!418007))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41739 0))(
  ( (array!41740 (arr!19983 (Array (_ BitVec 32) (_ BitVec 64))) (size!20404 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41739)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749055 (= res!505370 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20404 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20404 a!3186))))))

(declare-fun b!749056 () Bool)

(declare-fun res!505364 () Bool)

(declare-fun e!418011 () Bool)

(assert (=> b!749056 (=> (not res!505364) (not e!418011))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41739 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749056 (= res!505364 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!749057 () Bool)

(declare-fun e!418009 () Bool)

(declare-fun e!418008 () Bool)

(assert (=> b!749057 (= e!418009 (not e!418008))))

(declare-fun res!505362 () Bool)

(assert (=> b!749057 (=> res!505362 e!418008)))

(declare-datatypes ((SeekEntryResult!7583 0))(
  ( (MissingZero!7583 (index!32700 (_ BitVec 32))) (Found!7583 (index!32701 (_ BitVec 32))) (Intermediate!7583 (undefined!8395 Bool) (index!32702 (_ BitVec 32)) (x!63637 (_ BitVec 32))) (Undefined!7583) (MissingVacant!7583 (index!32703 (_ BitVec 32))) )
))
(declare-fun lt!333001 () SeekEntryResult!7583)

(assert (=> b!749057 (= res!505362 (or (not (is-Intermediate!7583 lt!333001)) (bvslt x!1131 (x!63637 lt!333001)) (not (= x!1131 (x!63637 lt!333001))) (not (= index!1321 (index!32702 lt!333001)))))))

(declare-fun e!418004 () Bool)

(assert (=> b!749057 e!418004))

(declare-fun res!505376 () Bool)

(assert (=> b!749057 (=> (not res!505376) (not e!418004))))

(declare-fun lt!333003 () SeekEntryResult!7583)

(declare-fun lt!332996 () SeekEntryResult!7583)

(assert (=> b!749057 (= res!505376 (= lt!333003 lt!332996))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!749057 (= lt!332996 (Found!7583 j!159))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41739 (_ BitVec 32)) SeekEntryResult!7583)

(assert (=> b!749057 (= lt!333003 (seekEntryOrOpen!0 (select (arr!19983 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41739 (_ BitVec 32)) Bool)

(assert (=> b!749057 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25712 0))(
  ( (Unit!25713) )
))
(declare-fun lt!333002 () Unit!25712)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41739 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25712)

(assert (=> b!749057 (= lt!333002 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!749058 () Bool)

(assert (=> b!749058 (= e!418011 e!418007)))

(declare-fun res!505374 () Bool)

(assert (=> b!749058 (=> (not res!505374) (not e!418007))))

(declare-fun lt!332999 () SeekEntryResult!7583)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!749058 (= res!505374 (or (= lt!332999 (MissingZero!7583 i!1173)) (= lt!332999 (MissingVacant!7583 i!1173))))))

(assert (=> b!749058 (= lt!332999 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!749059 () Bool)

(declare-fun res!505377 () Bool)

(assert (=> b!749059 (=> (not res!505377) (not e!418011))))

(assert (=> b!749059 (= res!505377 (and (= (size!20404 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20404 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20404 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!749060 () Bool)

(declare-fun e!418010 () Unit!25712)

(declare-fun Unit!25714 () Unit!25712)

(assert (=> b!749060 (= e!418010 Unit!25714)))

(declare-fun b!749061 () Bool)

(declare-fun e!418005 () Bool)

(assert (=> b!749061 (= e!418007 e!418005)))

(declare-fun res!505368 () Bool)

(assert (=> b!749061 (=> (not res!505368) (not e!418005))))

(declare-fun lt!332998 () SeekEntryResult!7583)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41739 (_ BitVec 32)) SeekEntryResult!7583)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749061 (= res!505368 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19983 a!3186) j!159) mask!3328) (select (arr!19983 a!3186) j!159) a!3186 mask!3328) lt!332998))))

(assert (=> b!749061 (= lt!332998 (Intermediate!7583 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749062 () Bool)

(declare-fun res!505378 () Bool)

(assert (=> b!749062 (=> (not res!505378) (not e!418011))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749062 (= res!505378 (validKeyInArray!0 (select (arr!19983 a!3186) j!159)))))

(declare-fun b!749063 () Bool)

(declare-fun res!505371 () Bool)

(assert (=> b!749063 (=> (not res!505371) (not e!418005))))

(assert (=> b!749063 (= res!505371 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19983 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749064 () Bool)

(declare-fun res!505367 () Bool)

(assert (=> b!749064 (=> res!505367 e!418008)))

(declare-fun lt!332997 () (_ BitVec 64))

(assert (=> b!749064 (= res!505367 (= (select (store (arr!19983 a!3186) i!1173 k!2102) index!1321) lt!332997))))

(declare-fun b!749065 () Bool)

(declare-fun Unit!25715 () Unit!25712)

(assert (=> b!749065 (= e!418010 Unit!25715)))

(assert (=> b!749065 false))

(declare-fun b!749067 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41739 (_ BitVec 32)) SeekEntryResult!7583)

(assert (=> b!749067 (= e!418004 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19983 a!3186) j!159) a!3186 mask!3328) lt!332996))))

(declare-fun b!749068 () Bool)

(assert (=> b!749068 (= e!418005 e!418009)))

(declare-fun res!505379 () Bool)

(assert (=> b!749068 (=> (not res!505379) (not e!418009))))

(declare-fun lt!333005 () SeekEntryResult!7583)

(assert (=> b!749068 (= res!505379 (= lt!333005 lt!333001))))

(declare-fun lt!333004 () array!41739)

(assert (=> b!749068 (= lt!333001 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332997 lt!333004 mask!3328))))

(assert (=> b!749068 (= lt!333005 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332997 mask!3328) lt!332997 lt!333004 mask!3328))))

(assert (=> b!749068 (= lt!332997 (select (store (arr!19983 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!749068 (= lt!333004 (array!41740 (store (arr!19983 a!3186) i!1173 k!2102) (size!20404 a!3186)))))

(declare-fun b!749069 () Bool)

(declare-fun res!505372 () Bool)

(assert (=> b!749069 (=> (not res!505372) (not e!418011))))

(assert (=> b!749069 (= res!505372 (validKeyInArray!0 k!2102))))

(declare-fun b!749070 () Bool)

(declare-fun e!418012 () Bool)

(assert (=> b!749070 (= e!418008 e!418012)))

(declare-fun res!505373 () Bool)

(assert (=> b!749070 (=> res!505373 e!418012)))

(assert (=> b!749070 (= res!505373 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!749070 (= (select (store (arr!19983 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!333000 () Unit!25712)

(assert (=> b!749070 (= lt!333000 e!418010)))

(declare-fun c!82228 () Bool)

(assert (=> b!749070 (= c!82228 (= (select (store (arr!19983 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749071 () Bool)

(declare-fun res!505365 () Bool)

(assert (=> b!749071 (=> (not res!505365) (not e!418005))))

(declare-fun e!418013 () Bool)

(assert (=> b!749071 (= res!505365 e!418013)))

(declare-fun c!82227 () Bool)

(assert (=> b!749071 (= c!82227 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749072 () Bool)

(assert (=> b!749072 (= e!418012 (validKeyInArray!0 lt!332997))))

(declare-fun b!749073 () Bool)

(assert (=> b!749073 (= e!418013 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19983 a!3186) j!159) a!3186 mask!3328) (Found!7583 j!159)))))

(declare-fun b!749074 () Bool)

(declare-fun res!505363 () Bool)

(assert (=> b!749074 (=> res!505363 e!418008)))

(assert (=> b!749074 (= res!505363 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19983 a!3186) j!159) a!3186 mask!3328) lt!332996)))))

(declare-fun b!749075 () Bool)

(declare-fun res!505369 () Bool)

(assert (=> b!749075 (=> (not res!505369) (not e!418007))))

(assert (=> b!749075 (= res!505369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749076 () Bool)

(assert (=> b!749076 (= e!418013 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19983 a!3186) j!159) a!3186 mask!3328) lt!332998))))

(declare-fun res!505375 () Bool)

(assert (=> start!65566 (=> (not res!505375) (not e!418011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65566 (= res!505375 (validMask!0 mask!3328))))

(assert (=> start!65566 e!418011))

(assert (=> start!65566 true))

(declare-fun array_inv!15779 (array!41739) Bool)

(assert (=> start!65566 (array_inv!15779 a!3186)))

(declare-fun b!749066 () Bool)

(declare-fun res!505366 () Bool)

(assert (=> b!749066 (=> (not res!505366) (not e!418007))))

(declare-datatypes ((List!13985 0))(
  ( (Nil!13982) (Cons!13981 (h!15053 (_ BitVec 64)) (t!20300 List!13985)) )
))
(declare-fun arrayNoDuplicates!0 (array!41739 (_ BitVec 32) List!13985) Bool)

(assert (=> b!749066 (= res!505366 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13982))))

(assert (= (and start!65566 res!505375) b!749059))

(assert (= (and b!749059 res!505377) b!749062))

(assert (= (and b!749062 res!505378) b!749069))

(assert (= (and b!749069 res!505372) b!749056))

(assert (= (and b!749056 res!505364) b!749058))

(assert (= (and b!749058 res!505374) b!749075))

(assert (= (and b!749075 res!505369) b!749066))

(assert (= (and b!749066 res!505366) b!749055))

(assert (= (and b!749055 res!505370) b!749061))

(assert (= (and b!749061 res!505368) b!749063))

(assert (= (and b!749063 res!505371) b!749071))

(assert (= (and b!749071 c!82227) b!749076))

(assert (= (and b!749071 (not c!82227)) b!749073))

(assert (= (and b!749071 res!505365) b!749068))

(assert (= (and b!749068 res!505379) b!749057))

(assert (= (and b!749057 res!505376) b!749067))

(assert (= (and b!749057 (not res!505362)) b!749074))

(assert (= (and b!749074 (not res!505363)) b!749064))

(assert (= (and b!749064 (not res!505367)) b!749070))

(assert (= (and b!749070 c!82228) b!749065))

(assert (= (and b!749070 (not c!82228)) b!749060))

(assert (= (and b!749070 (not res!505373)) b!749072))

(declare-fun m!698749 () Bool)

(assert (=> b!749063 m!698749))

(declare-fun m!698751 () Bool)

(assert (=> b!749069 m!698751))

(declare-fun m!698753 () Bool)

(assert (=> b!749057 m!698753))

(assert (=> b!749057 m!698753))

(declare-fun m!698755 () Bool)

(assert (=> b!749057 m!698755))

(declare-fun m!698757 () Bool)

(assert (=> b!749057 m!698757))

(declare-fun m!698759 () Bool)

(assert (=> b!749057 m!698759))

(assert (=> b!749076 m!698753))

(assert (=> b!749076 m!698753))

(declare-fun m!698761 () Bool)

(assert (=> b!749076 m!698761))

(declare-fun m!698763 () Bool)

(assert (=> b!749066 m!698763))

(declare-fun m!698765 () Bool)

(assert (=> start!65566 m!698765))

(declare-fun m!698767 () Bool)

(assert (=> start!65566 m!698767))

(declare-fun m!698769 () Bool)

(assert (=> b!749068 m!698769))

(declare-fun m!698771 () Bool)

(assert (=> b!749068 m!698771))

(declare-fun m!698773 () Bool)

(assert (=> b!749068 m!698773))

(declare-fun m!698775 () Bool)

(assert (=> b!749068 m!698775))

(declare-fun m!698777 () Bool)

(assert (=> b!749068 m!698777))

(assert (=> b!749068 m!698769))

(assert (=> b!749067 m!698753))

(assert (=> b!749067 m!698753))

(declare-fun m!698779 () Bool)

(assert (=> b!749067 m!698779))

(assert (=> b!749070 m!698773))

(declare-fun m!698781 () Bool)

(assert (=> b!749070 m!698781))

(declare-fun m!698783 () Bool)

(assert (=> b!749075 m!698783))

(assert (=> b!749074 m!698753))

(assert (=> b!749074 m!698753))

(declare-fun m!698785 () Bool)

(assert (=> b!749074 m!698785))

(assert (=> b!749064 m!698773))

(assert (=> b!749064 m!698781))

(assert (=> b!749061 m!698753))

(assert (=> b!749061 m!698753))

(declare-fun m!698787 () Bool)

(assert (=> b!749061 m!698787))

(assert (=> b!749061 m!698787))

(assert (=> b!749061 m!698753))

(declare-fun m!698789 () Bool)

(assert (=> b!749061 m!698789))

(assert (=> b!749062 m!698753))

(assert (=> b!749062 m!698753))

(declare-fun m!698791 () Bool)

(assert (=> b!749062 m!698791))

(assert (=> b!749073 m!698753))

(assert (=> b!749073 m!698753))

(assert (=> b!749073 m!698785))

(declare-fun m!698793 () Bool)

(assert (=> b!749072 m!698793))

(declare-fun m!698795 () Bool)

(assert (=> b!749058 m!698795))

(declare-fun m!698797 () Bool)

(assert (=> b!749056 m!698797))

(push 1)

