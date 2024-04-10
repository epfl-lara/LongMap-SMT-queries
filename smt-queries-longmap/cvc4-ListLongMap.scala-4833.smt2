; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66474 () Bool)

(assert start!66474)

(declare-fun b!766060 () Bool)

(declare-fun res!518241 () Bool)

(declare-fun e!426606 () Bool)

(assert (=> b!766060 (=> (not res!518241) (not e!426606))))

(declare-datatypes ((array!42253 0))(
  ( (array!42254 (arr!20231 (Array (_ BitVec 32) (_ BitVec 64))) (size!20652 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42253)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766060 (= res!518241 (validKeyInArray!0 (select (arr!20231 a!3186) j!159)))))

(declare-fun b!766061 () Bool)

(declare-fun res!518237 () Bool)

(declare-fun e!426609 () Bool)

(assert (=> b!766061 (=> (not res!518237) (not e!426609))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!766061 (= res!518237 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20231 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766062 () Bool)

(declare-fun e!426611 () Bool)

(assert (=> b!766062 (= e!426609 e!426611)))

(declare-fun res!518245 () Bool)

(assert (=> b!766062 (=> (not res!518245) (not e!426611))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!340752 () array!42253)

(declare-fun lt!340753 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7831 0))(
  ( (MissingZero!7831 (index!33692 (_ BitVec 32))) (Found!7831 (index!33693 (_ BitVec 32))) (Intermediate!7831 (undefined!8643 Bool) (index!33694 (_ BitVec 32)) (x!64597 (_ BitVec 32))) (Undefined!7831) (MissingVacant!7831 (index!33695 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42253 (_ BitVec 32)) SeekEntryResult!7831)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766062 (= res!518245 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340753 mask!3328) lt!340753 lt!340752 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340753 lt!340752 mask!3328)))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!766062 (= lt!340753 (select (store (arr!20231 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!766062 (= lt!340752 (array!42254 (store (arr!20231 a!3186) i!1173 k!2102) (size!20652 a!3186)))))

(declare-fun b!766063 () Bool)

(declare-fun res!518235 () Bool)

(declare-fun e!426605 () Bool)

(assert (=> b!766063 (=> (not res!518235) (not e!426605))))

(declare-datatypes ((List!14233 0))(
  ( (Nil!14230) (Cons!14229 (h!15319 (_ BitVec 64)) (t!20548 List!14233)) )
))
(declare-fun arrayNoDuplicates!0 (array!42253 (_ BitVec 32) List!14233) Bool)

(assert (=> b!766063 (= res!518235 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14230))))

(declare-fun b!766064 () Bool)

(assert (=> b!766064 (= e!426611 (not true))))

(declare-fun e!426607 () Bool)

(assert (=> b!766064 e!426607))

(declare-fun res!518243 () Bool)

(assert (=> b!766064 (=> (not res!518243) (not e!426607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42253 (_ BitVec 32)) Bool)

(assert (=> b!766064 (= res!518243 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26388 0))(
  ( (Unit!26389) )
))
(declare-fun lt!340757 () Unit!26388)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26388)

(assert (=> b!766064 (= lt!340757 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!518236 () Bool)

(assert (=> start!66474 (=> (not res!518236) (not e!426606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66474 (= res!518236 (validMask!0 mask!3328))))

(assert (=> start!66474 e!426606))

(assert (=> start!66474 true))

(declare-fun array_inv!16027 (array!42253) Bool)

(assert (=> start!66474 (array_inv!16027 a!3186)))

(declare-fun b!766065 () Bool)

(declare-fun res!518239 () Bool)

(assert (=> b!766065 (=> (not res!518239) (not e!426605))))

(assert (=> b!766065 (= res!518239 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766066 () Bool)

(declare-fun res!518232 () Bool)

(assert (=> b!766066 (=> (not res!518232) (not e!426606))))

(assert (=> b!766066 (= res!518232 (and (= (size!20652 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20652 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20652 a!3186)) (not (= i!1173 j!159))))))

(declare-fun lt!340754 () SeekEntryResult!7831)

(declare-fun e!426612 () Bool)

(declare-fun b!766067 () Bool)

(assert (=> b!766067 (= e!426612 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20231 a!3186) j!159) a!3186 mask!3328) lt!340754))))

(declare-fun b!766068 () Bool)

(assert (=> b!766068 (= e!426606 e!426605)))

(declare-fun res!518238 () Bool)

(assert (=> b!766068 (=> (not res!518238) (not e!426605))))

(declare-fun lt!340756 () SeekEntryResult!7831)

(assert (=> b!766068 (= res!518238 (or (= lt!340756 (MissingZero!7831 i!1173)) (= lt!340756 (MissingVacant!7831 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42253 (_ BitVec 32)) SeekEntryResult!7831)

(assert (=> b!766068 (= lt!340756 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!766069 () Bool)

(declare-fun res!518244 () Bool)

(assert (=> b!766069 (=> (not res!518244) (not e!426605))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!766069 (= res!518244 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20652 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20652 a!3186))))))

(declare-fun b!766070 () Bool)

(declare-fun res!518231 () Bool)

(assert (=> b!766070 (=> (not res!518231) (not e!426609))))

(assert (=> b!766070 (= res!518231 e!426612)))

(declare-fun c!84304 () Bool)

(assert (=> b!766070 (= c!84304 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!766071 () Bool)

(declare-fun e!426610 () Bool)

(assert (=> b!766071 (= e!426607 e!426610)))

(declare-fun res!518242 () Bool)

(assert (=> b!766071 (=> (not res!518242) (not e!426610))))

(declare-fun lt!340755 () SeekEntryResult!7831)

(assert (=> b!766071 (= res!518242 (= (seekEntryOrOpen!0 (select (arr!20231 a!3186) j!159) a!3186 mask!3328) lt!340755))))

(assert (=> b!766071 (= lt!340755 (Found!7831 j!159))))

(declare-fun b!766072 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42253 (_ BitVec 32)) SeekEntryResult!7831)

(assert (=> b!766072 (= e!426610 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20231 a!3186) j!159) a!3186 mask!3328) lt!340755))))

(declare-fun b!766073 () Bool)

(assert (=> b!766073 (= e!426612 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20231 a!3186) j!159) a!3186 mask!3328) (Found!7831 j!159)))))

(declare-fun b!766074 () Bool)

(declare-fun res!518240 () Bool)

(assert (=> b!766074 (=> (not res!518240) (not e!426606))))

(declare-fun arrayContainsKey!0 (array!42253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766074 (= res!518240 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!766075 () Bool)

(assert (=> b!766075 (= e!426605 e!426609)))

(declare-fun res!518233 () Bool)

(assert (=> b!766075 (=> (not res!518233) (not e!426609))))

(assert (=> b!766075 (= res!518233 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20231 a!3186) j!159) mask!3328) (select (arr!20231 a!3186) j!159) a!3186 mask!3328) lt!340754))))

(assert (=> b!766075 (= lt!340754 (Intermediate!7831 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!766076 () Bool)

(declare-fun res!518234 () Bool)

(assert (=> b!766076 (=> (not res!518234) (not e!426606))))

(assert (=> b!766076 (= res!518234 (validKeyInArray!0 k!2102))))

(assert (= (and start!66474 res!518236) b!766066))

(assert (= (and b!766066 res!518232) b!766060))

(assert (= (and b!766060 res!518241) b!766076))

(assert (= (and b!766076 res!518234) b!766074))

(assert (= (and b!766074 res!518240) b!766068))

(assert (= (and b!766068 res!518238) b!766065))

(assert (= (and b!766065 res!518239) b!766063))

(assert (= (and b!766063 res!518235) b!766069))

(assert (= (and b!766069 res!518244) b!766075))

(assert (= (and b!766075 res!518233) b!766061))

(assert (= (and b!766061 res!518237) b!766070))

(assert (= (and b!766070 c!84304) b!766067))

(assert (= (and b!766070 (not c!84304)) b!766073))

(assert (= (and b!766070 res!518231) b!766062))

(assert (= (and b!766062 res!518245) b!766064))

(assert (= (and b!766064 res!518243) b!766071))

(assert (= (and b!766071 res!518242) b!766072))

(declare-fun m!712091 () Bool)

(assert (=> b!766067 m!712091))

(assert (=> b!766067 m!712091))

(declare-fun m!712093 () Bool)

(assert (=> b!766067 m!712093))

(declare-fun m!712095 () Bool)

(assert (=> b!766076 m!712095))

(declare-fun m!712097 () Bool)

(assert (=> b!766065 m!712097))

(assert (=> b!766060 m!712091))

(assert (=> b!766060 m!712091))

(declare-fun m!712099 () Bool)

(assert (=> b!766060 m!712099))

(declare-fun m!712101 () Bool)

(assert (=> start!66474 m!712101))

(declare-fun m!712103 () Bool)

(assert (=> start!66474 m!712103))

(declare-fun m!712105 () Bool)

(assert (=> b!766061 m!712105))

(declare-fun m!712107 () Bool)

(assert (=> b!766068 m!712107))

(declare-fun m!712109 () Bool)

(assert (=> b!766062 m!712109))

(declare-fun m!712111 () Bool)

(assert (=> b!766062 m!712111))

(assert (=> b!766062 m!712109))

(declare-fun m!712113 () Bool)

(assert (=> b!766062 m!712113))

(declare-fun m!712115 () Bool)

(assert (=> b!766062 m!712115))

(declare-fun m!712117 () Bool)

(assert (=> b!766062 m!712117))

(declare-fun m!712119 () Bool)

(assert (=> b!766063 m!712119))

(assert (=> b!766075 m!712091))

(assert (=> b!766075 m!712091))

(declare-fun m!712121 () Bool)

(assert (=> b!766075 m!712121))

(assert (=> b!766075 m!712121))

(assert (=> b!766075 m!712091))

(declare-fun m!712123 () Bool)

(assert (=> b!766075 m!712123))

(assert (=> b!766072 m!712091))

(assert (=> b!766072 m!712091))

(declare-fun m!712125 () Bool)

(assert (=> b!766072 m!712125))

(assert (=> b!766073 m!712091))

(assert (=> b!766073 m!712091))

(declare-fun m!712127 () Bool)

(assert (=> b!766073 m!712127))

(declare-fun m!712129 () Bool)

(assert (=> b!766074 m!712129))

(declare-fun m!712131 () Bool)

(assert (=> b!766064 m!712131))

(declare-fun m!712133 () Bool)

(assert (=> b!766064 m!712133))

(assert (=> b!766071 m!712091))

(assert (=> b!766071 m!712091))

(declare-fun m!712135 () Bool)

(assert (=> b!766071 m!712135))

(push 1)

