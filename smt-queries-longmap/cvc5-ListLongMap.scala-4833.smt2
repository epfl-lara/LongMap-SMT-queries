; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66470 () Bool)

(assert start!66470)

(declare-datatypes ((array!42249 0))(
  ( (array!42250 (arr!20229 (Array (_ BitVec 32) (_ BitVec 64))) (size!20650 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42249)

(declare-fun e!426560 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!765958 () Bool)

(declare-datatypes ((SeekEntryResult!7829 0))(
  ( (MissingZero!7829 (index!33684 (_ BitVec 32))) (Found!7829 (index!33685 (_ BitVec 32))) (Intermediate!7829 (undefined!8641 Bool) (index!33686 (_ BitVec 32)) (x!64595 (_ BitVec 32))) (Undefined!7829) (MissingVacant!7829 (index!33687 (_ BitVec 32))) )
))
(declare-fun lt!340719 () SeekEntryResult!7829)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42249 (_ BitVec 32)) SeekEntryResult!7829)

(assert (=> b!765958 (= e!426560 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20229 a!3186) j!159) a!3186 mask!3328) lt!340719))))

(declare-fun b!765959 () Bool)

(declare-fun res!518149 () Bool)

(declare-fun e!426561 () Bool)

(assert (=> b!765959 (=> (not res!518149) (not e!426561))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!765959 (= res!518149 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!765960 () Bool)

(declare-fun res!518146 () Bool)

(declare-fun e!426559 () Bool)

(assert (=> b!765960 (=> (not res!518146) (not e!426559))))

(declare-datatypes ((List!14231 0))(
  ( (Nil!14228) (Cons!14227 (h!15317 (_ BitVec 64)) (t!20546 List!14231)) )
))
(declare-fun arrayNoDuplicates!0 (array!42249 (_ BitVec 32) List!14231) Bool)

(assert (=> b!765960 (= res!518146 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14228))))

(declare-fun b!765961 () Bool)

(declare-fun res!518150 () Bool)

(declare-fun e!426563 () Bool)

(assert (=> b!765961 (=> (not res!518150) (not e!426563))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!765961 (= res!518150 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20229 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!765962 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42249 (_ BitVec 32)) SeekEntryResult!7829)

(assert (=> b!765962 (= e!426560 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20229 a!3186) j!159) a!3186 mask!3328) (Found!7829 j!159)))))

(declare-fun b!765963 () Bool)

(declare-fun res!518154 () Bool)

(assert (=> b!765963 (=> (not res!518154) (not e!426563))))

(assert (=> b!765963 (= res!518154 e!426560)))

(declare-fun c!84298 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!765963 (= c!84298 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!765964 () Bool)

(declare-fun e!426557 () Bool)

(assert (=> b!765964 (= e!426563 e!426557)))

(declare-fun res!518152 () Bool)

(assert (=> b!765964 (=> (not res!518152) (not e!426557))))

(declare-fun lt!340720 () (_ BitVec 64))

(declare-fun lt!340718 () array!42249)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!765964 (= res!518152 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340720 mask!3328) lt!340720 lt!340718 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340720 lt!340718 mask!3328)))))

(assert (=> b!765964 (= lt!340720 (select (store (arr!20229 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!765964 (= lt!340718 (array!42250 (store (arr!20229 a!3186) i!1173 k!2102) (size!20650 a!3186)))))

(declare-fun e!426558 () Bool)

(declare-fun b!765965 () Bool)

(declare-fun lt!340716 () SeekEntryResult!7829)

(assert (=> b!765965 (= e!426558 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20229 a!3186) j!159) a!3186 mask!3328) lt!340716))))

(declare-fun res!518142 () Bool)

(assert (=> start!66470 (=> (not res!518142) (not e!426561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66470 (= res!518142 (validMask!0 mask!3328))))

(assert (=> start!66470 e!426561))

(assert (=> start!66470 true))

(declare-fun array_inv!16025 (array!42249) Bool)

(assert (=> start!66470 (array_inv!16025 a!3186)))

(declare-fun b!765966 () Bool)

(assert (=> b!765966 (= e!426561 e!426559)))

(declare-fun res!518155 () Bool)

(assert (=> b!765966 (=> (not res!518155) (not e!426559))))

(declare-fun lt!340721 () SeekEntryResult!7829)

(assert (=> b!765966 (= res!518155 (or (= lt!340721 (MissingZero!7829 i!1173)) (= lt!340721 (MissingVacant!7829 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42249 (_ BitVec 32)) SeekEntryResult!7829)

(assert (=> b!765966 (= lt!340721 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!765967 () Bool)

(assert (=> b!765967 (= e!426559 e!426563)))

(declare-fun res!518153 () Bool)

(assert (=> b!765967 (=> (not res!518153) (not e!426563))))

(assert (=> b!765967 (= res!518153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20229 a!3186) j!159) mask!3328) (select (arr!20229 a!3186) j!159) a!3186 mask!3328) lt!340719))))

(assert (=> b!765967 (= lt!340719 (Intermediate!7829 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!765968 () Bool)

(declare-fun res!518148 () Bool)

(assert (=> b!765968 (=> (not res!518148) (not e!426561))))

(assert (=> b!765968 (= res!518148 (and (= (size!20650 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20650 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20650 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!765969 () Bool)

(declare-fun res!518141 () Bool)

(assert (=> b!765969 (=> (not res!518141) (not e!426559))))

(assert (=> b!765969 (= res!518141 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20650 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20650 a!3186))))))

(declare-fun b!765970 () Bool)

(declare-fun res!518147 () Bool)

(assert (=> b!765970 (=> (not res!518147) (not e!426561))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!765970 (= res!518147 (validKeyInArray!0 (select (arr!20229 a!3186) j!159)))))

(declare-fun b!765971 () Bool)

(assert (=> b!765971 (= e!426557 (not true))))

(declare-fun e!426562 () Bool)

(assert (=> b!765971 e!426562))

(declare-fun res!518144 () Bool)

(assert (=> b!765971 (=> (not res!518144) (not e!426562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42249 (_ BitVec 32)) Bool)

(assert (=> b!765971 (= res!518144 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26384 0))(
  ( (Unit!26385) )
))
(declare-fun lt!340717 () Unit!26384)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42249 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26384)

(assert (=> b!765971 (= lt!340717 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!765972 () Bool)

(declare-fun res!518143 () Bool)

(assert (=> b!765972 (=> (not res!518143) (not e!426559))))

(assert (=> b!765972 (= res!518143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!765973 () Bool)

(assert (=> b!765973 (= e!426562 e!426558)))

(declare-fun res!518151 () Bool)

(assert (=> b!765973 (=> (not res!518151) (not e!426558))))

(assert (=> b!765973 (= res!518151 (= (seekEntryOrOpen!0 (select (arr!20229 a!3186) j!159) a!3186 mask!3328) lt!340716))))

(assert (=> b!765973 (= lt!340716 (Found!7829 j!159))))

(declare-fun b!765974 () Bool)

(declare-fun res!518145 () Bool)

(assert (=> b!765974 (=> (not res!518145) (not e!426561))))

(assert (=> b!765974 (= res!518145 (validKeyInArray!0 k!2102))))

(assert (= (and start!66470 res!518142) b!765968))

(assert (= (and b!765968 res!518148) b!765970))

(assert (= (and b!765970 res!518147) b!765974))

(assert (= (and b!765974 res!518145) b!765959))

(assert (= (and b!765959 res!518149) b!765966))

(assert (= (and b!765966 res!518155) b!765972))

(assert (= (and b!765972 res!518143) b!765960))

(assert (= (and b!765960 res!518146) b!765969))

(assert (= (and b!765969 res!518141) b!765967))

(assert (= (and b!765967 res!518153) b!765961))

(assert (= (and b!765961 res!518150) b!765963))

(assert (= (and b!765963 c!84298) b!765958))

(assert (= (and b!765963 (not c!84298)) b!765962))

(assert (= (and b!765963 res!518154) b!765964))

(assert (= (and b!765964 res!518152) b!765971))

(assert (= (and b!765971 res!518144) b!765973))

(assert (= (and b!765973 res!518151) b!765965))

(declare-fun m!711999 () Bool)

(assert (=> b!765961 m!711999))

(declare-fun m!712001 () Bool)

(assert (=> b!765966 m!712001))

(declare-fun m!712003 () Bool)

(assert (=> b!765959 m!712003))

(declare-fun m!712005 () Bool)

(assert (=> b!765967 m!712005))

(assert (=> b!765967 m!712005))

(declare-fun m!712007 () Bool)

(assert (=> b!765967 m!712007))

(assert (=> b!765967 m!712007))

(assert (=> b!765967 m!712005))

(declare-fun m!712009 () Bool)

(assert (=> b!765967 m!712009))

(declare-fun m!712011 () Bool)

(assert (=> b!765972 m!712011))

(assert (=> b!765965 m!712005))

(assert (=> b!765965 m!712005))

(declare-fun m!712013 () Bool)

(assert (=> b!765965 m!712013))

(declare-fun m!712015 () Bool)

(assert (=> start!66470 m!712015))

(declare-fun m!712017 () Bool)

(assert (=> start!66470 m!712017))

(assert (=> b!765970 m!712005))

(assert (=> b!765970 m!712005))

(declare-fun m!712019 () Bool)

(assert (=> b!765970 m!712019))

(assert (=> b!765962 m!712005))

(assert (=> b!765962 m!712005))

(declare-fun m!712021 () Bool)

(assert (=> b!765962 m!712021))

(declare-fun m!712023 () Bool)

(assert (=> b!765974 m!712023))

(assert (=> b!765958 m!712005))

(assert (=> b!765958 m!712005))

(declare-fun m!712025 () Bool)

(assert (=> b!765958 m!712025))

(declare-fun m!712027 () Bool)

(assert (=> b!765960 m!712027))

(declare-fun m!712029 () Bool)

(assert (=> b!765964 m!712029))

(declare-fun m!712031 () Bool)

(assert (=> b!765964 m!712031))

(declare-fun m!712033 () Bool)

(assert (=> b!765964 m!712033))

(assert (=> b!765964 m!712033))

(declare-fun m!712035 () Bool)

(assert (=> b!765964 m!712035))

(declare-fun m!712037 () Bool)

(assert (=> b!765964 m!712037))

(declare-fun m!712039 () Bool)

(assert (=> b!765971 m!712039))

(declare-fun m!712041 () Bool)

(assert (=> b!765971 m!712041))

(assert (=> b!765973 m!712005))

(assert (=> b!765973 m!712005))

(declare-fun m!712043 () Bool)

(assert (=> b!765973 m!712043))

(push 1)

