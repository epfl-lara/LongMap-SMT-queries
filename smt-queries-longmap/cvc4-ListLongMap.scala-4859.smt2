; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67000 () Bool)

(assert start!67000)

(declare-fun b!773000 () Bool)

(declare-fun res!522733 () Bool)

(declare-fun e!430329 () Bool)

(assert (=> b!773000 (=> (not res!522733) (not e!430329))))

(declare-datatypes ((array!42424 0))(
  ( (array!42425 (arr!20309 (Array (_ BitVec 32) (_ BitVec 64))) (size!20730 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42424)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773000 (= res!522733 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!773001 () Bool)

(declare-fun e!430331 () Bool)

(assert (=> b!773001 (= e!430329 e!430331)))

(declare-fun res!522731 () Bool)

(assert (=> b!773001 (=> (not res!522731) (not e!430331))))

(declare-datatypes ((SeekEntryResult!7909 0))(
  ( (MissingZero!7909 (index!34004 (_ BitVec 32))) (Found!7909 (index!34005 (_ BitVec 32))) (Intermediate!7909 (undefined!8721 Bool) (index!34006 (_ BitVec 32)) (x!64944 (_ BitVec 32))) (Undefined!7909) (MissingVacant!7909 (index!34007 (_ BitVec 32))) )
))
(declare-fun lt!344173 () SeekEntryResult!7909)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!773001 (= res!522731 (or (= lt!344173 (MissingZero!7909 i!1173)) (= lt!344173 (MissingVacant!7909 i!1173))))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42424 (_ BitVec 32)) SeekEntryResult!7909)

(assert (=> b!773001 (= lt!344173 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!773002 () Bool)

(declare-datatypes ((Unit!26650 0))(
  ( (Unit!26651) )
))
(declare-fun e!430324 () Unit!26650)

(declare-fun Unit!26652 () Unit!26650)

(assert (=> b!773002 (= e!430324 Unit!26652)))

(declare-fun lt!344174 () (_ BitVec 32))

(declare-fun lt!344167 () SeekEntryResult!7909)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42424 (_ BitVec 32)) SeekEntryResult!7909)

(assert (=> b!773002 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344174 (select (arr!20309 a!3186) j!159) a!3186 mask!3328) lt!344167)))

(declare-fun b!773003 () Bool)

(declare-fun res!522744 () Bool)

(assert (=> b!773003 (=> (not res!522744) (not e!430331))))

(declare-datatypes ((List!14311 0))(
  ( (Nil!14308) (Cons!14307 (h!15412 (_ BitVec 64)) (t!20626 List!14311)) )
))
(declare-fun arrayNoDuplicates!0 (array!42424 (_ BitVec 32) List!14311) Bool)

(assert (=> b!773003 (= res!522744 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14308))))

(declare-fun b!773004 () Bool)

(declare-fun e!430327 () Bool)

(assert (=> b!773004 (= e!430331 e!430327)))

(declare-fun res!522738 () Bool)

(assert (=> b!773004 (=> (not res!522738) (not e!430327))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773004 (= res!522738 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20309 a!3186) j!159) mask!3328) (select (arr!20309 a!3186) j!159) a!3186 mask!3328) lt!344167))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!773004 (= lt!344167 (Intermediate!7909 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773005 () Bool)

(declare-fun res!522732 () Bool)

(assert (=> b!773005 (=> (not res!522732) (not e!430329))))

(assert (=> b!773005 (= res!522732 (and (= (size!20730 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20730 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20730 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773006 () Bool)

(declare-fun res!522741 () Bool)

(assert (=> b!773006 (=> (not res!522741) (not e!430327))))

(assert (=> b!773006 (= res!522741 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20309 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!522745 () Bool)

(assert (=> start!67000 (=> (not res!522745) (not e!430329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67000 (= res!522745 (validMask!0 mask!3328))))

(assert (=> start!67000 e!430329))

(assert (=> start!67000 true))

(declare-fun array_inv!16105 (array!42424) Bool)

(assert (=> start!67000 (array_inv!16105 a!3186)))

(declare-fun b!773007 () Bool)

(declare-fun e!430330 () Bool)

(assert (=> b!773007 (= e!430330 true)))

(declare-fun lt!344175 () Unit!26650)

(assert (=> b!773007 (= lt!344175 e!430324)))

(declare-fun c!85534 () Bool)

(assert (=> b!773007 (= c!85534 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773007 (= lt!344174 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!773008 () Bool)

(declare-fun res!522743 () Bool)

(assert (=> b!773008 (=> (not res!522743) (not e!430329))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773008 (= res!522743 (validKeyInArray!0 (select (arr!20309 a!3186) j!159)))))

(declare-fun b!773009 () Bool)

(declare-fun e!430325 () Bool)

(assert (=> b!773009 (= e!430327 e!430325)))

(declare-fun res!522739 () Bool)

(assert (=> b!773009 (=> (not res!522739) (not e!430325))))

(declare-fun lt!344169 () SeekEntryResult!7909)

(declare-fun lt!344176 () SeekEntryResult!7909)

(assert (=> b!773009 (= res!522739 (= lt!344169 lt!344176))))

(declare-fun lt!344168 () (_ BitVec 64))

(declare-fun lt!344171 () array!42424)

(assert (=> b!773009 (= lt!344176 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344168 lt!344171 mask!3328))))

(assert (=> b!773009 (= lt!344169 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344168 mask!3328) lt!344168 lt!344171 mask!3328))))

(assert (=> b!773009 (= lt!344168 (select (store (arr!20309 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!773009 (= lt!344171 (array!42425 (store (arr!20309 a!3186) i!1173 k!2102) (size!20730 a!3186)))))

(declare-fun e!430326 () Bool)

(declare-fun b!773010 () Bool)

(assert (=> b!773010 (= e!430326 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20309 a!3186) j!159) a!3186 mask!3328) lt!344167))))

(declare-fun b!773011 () Bool)

(declare-fun Unit!26653 () Unit!26650)

(assert (=> b!773011 (= e!430324 Unit!26653)))

(declare-fun lt!344170 () SeekEntryResult!7909)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42424 (_ BitVec 32)) SeekEntryResult!7909)

(assert (=> b!773011 (= lt!344170 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20309 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!773011 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344174 resIntermediateIndex!5 (select (arr!20309 a!3186) j!159) a!3186 mask!3328) (Found!7909 j!159))))

(declare-fun b!773012 () Bool)

(declare-fun e!430322 () Bool)

(declare-fun lt!344177 () SeekEntryResult!7909)

(assert (=> b!773012 (= e!430322 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20309 a!3186) j!159) a!3186 mask!3328) lt!344177))))

(declare-fun b!773013 () Bool)

(declare-fun res!522735 () Bool)

(assert (=> b!773013 (=> (not res!522735) (not e!430327))))

(assert (=> b!773013 (= res!522735 e!430326)))

(declare-fun c!85533 () Bool)

(assert (=> b!773013 (= c!85533 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!773014 () Bool)

(assert (=> b!773014 (= e!430326 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20309 a!3186) j!159) a!3186 mask!3328) (Found!7909 j!159)))))

(declare-fun b!773015 () Bool)

(declare-fun res!522746 () Bool)

(assert (=> b!773015 (=> (not res!522746) (not e!430329))))

(assert (=> b!773015 (= res!522746 (validKeyInArray!0 k!2102))))

(declare-fun b!773016 () Bool)

(declare-fun res!522737 () Bool)

(assert (=> b!773016 (=> (not res!522737) (not e!430331))))

(assert (=> b!773016 (= res!522737 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20730 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20730 a!3186))))))

(declare-fun b!773017 () Bool)

(declare-fun res!522734 () Bool)

(assert (=> b!773017 (=> (not res!522734) (not e!430331))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42424 (_ BitVec 32)) Bool)

(assert (=> b!773017 (= res!522734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!773018 () Bool)

(declare-fun e!430323 () Bool)

(assert (=> b!773018 (= e!430323 e!430322)))

(declare-fun res!522740 () Bool)

(assert (=> b!773018 (=> (not res!522740) (not e!430322))))

(assert (=> b!773018 (= res!522740 (= (seekEntryOrOpen!0 (select (arr!20309 a!3186) j!159) a!3186 mask!3328) lt!344177))))

(assert (=> b!773018 (= lt!344177 (Found!7909 j!159))))

(declare-fun b!773019 () Bool)

(assert (=> b!773019 (= e!430325 (not e!430330))))

(declare-fun res!522736 () Bool)

(assert (=> b!773019 (=> res!522736 e!430330)))

(assert (=> b!773019 (= res!522736 (or (not (is-Intermediate!7909 lt!344176)) (bvsge x!1131 (x!64944 lt!344176))))))

(assert (=> b!773019 e!430323))

(declare-fun res!522742 () Bool)

(assert (=> b!773019 (=> (not res!522742) (not e!430323))))

(assert (=> b!773019 (= res!522742 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344172 () Unit!26650)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42424 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26650)

(assert (=> b!773019 (= lt!344172 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!67000 res!522745) b!773005))

(assert (= (and b!773005 res!522732) b!773008))

(assert (= (and b!773008 res!522743) b!773015))

(assert (= (and b!773015 res!522746) b!773000))

(assert (= (and b!773000 res!522733) b!773001))

(assert (= (and b!773001 res!522731) b!773017))

(assert (= (and b!773017 res!522734) b!773003))

(assert (= (and b!773003 res!522744) b!773016))

(assert (= (and b!773016 res!522737) b!773004))

(assert (= (and b!773004 res!522738) b!773006))

(assert (= (and b!773006 res!522741) b!773013))

(assert (= (and b!773013 c!85533) b!773010))

(assert (= (and b!773013 (not c!85533)) b!773014))

(assert (= (and b!773013 res!522735) b!773009))

(assert (= (and b!773009 res!522739) b!773019))

(assert (= (and b!773019 res!522742) b!773018))

(assert (= (and b!773018 res!522740) b!773012))

(assert (= (and b!773019 (not res!522736)) b!773007))

(assert (= (and b!773007 c!85534) b!773002))

(assert (= (and b!773007 (not c!85534)) b!773011))

(declare-fun m!717787 () Bool)

(assert (=> b!773015 m!717787))

(declare-fun m!717789 () Bool)

(assert (=> b!773011 m!717789))

(assert (=> b!773011 m!717789))

(declare-fun m!717791 () Bool)

(assert (=> b!773011 m!717791))

(assert (=> b!773011 m!717789))

(declare-fun m!717793 () Bool)

(assert (=> b!773011 m!717793))

(declare-fun m!717795 () Bool)

(assert (=> b!773009 m!717795))

(declare-fun m!717797 () Bool)

(assert (=> b!773009 m!717797))

(declare-fun m!717799 () Bool)

(assert (=> b!773009 m!717799))

(declare-fun m!717801 () Bool)

(assert (=> b!773009 m!717801))

(assert (=> b!773009 m!717797))

(declare-fun m!717803 () Bool)

(assert (=> b!773009 m!717803))

(declare-fun m!717805 () Bool)

(assert (=> b!773006 m!717805))

(assert (=> b!773012 m!717789))

(assert (=> b!773012 m!717789))

(declare-fun m!717807 () Bool)

(assert (=> b!773012 m!717807))

(declare-fun m!717809 () Bool)

(assert (=> b!773017 m!717809))

(assert (=> b!773008 m!717789))

(assert (=> b!773008 m!717789))

(declare-fun m!717811 () Bool)

(assert (=> b!773008 m!717811))

(declare-fun m!717813 () Bool)

(assert (=> b!773001 m!717813))

(declare-fun m!717815 () Bool)

(assert (=> b!773007 m!717815))

(declare-fun m!717817 () Bool)

(assert (=> start!67000 m!717817))

(declare-fun m!717819 () Bool)

(assert (=> start!67000 m!717819))

(assert (=> b!773004 m!717789))

(assert (=> b!773004 m!717789))

(declare-fun m!717821 () Bool)

(assert (=> b!773004 m!717821))

(assert (=> b!773004 m!717821))

(assert (=> b!773004 m!717789))

(declare-fun m!717823 () Bool)

(assert (=> b!773004 m!717823))

(assert (=> b!773014 m!717789))

(assert (=> b!773014 m!717789))

(assert (=> b!773014 m!717791))

(declare-fun m!717825 () Bool)

(assert (=> b!773019 m!717825))

(declare-fun m!717827 () Bool)

(assert (=> b!773019 m!717827))

(assert (=> b!773018 m!717789))

(assert (=> b!773018 m!717789))

(declare-fun m!717829 () Bool)

(assert (=> b!773018 m!717829))

(assert (=> b!773002 m!717789))

(assert (=> b!773002 m!717789))

(declare-fun m!717831 () Bool)

(assert (=> b!773002 m!717831))

(declare-fun m!717833 () Bool)

(assert (=> b!773000 m!717833))

(assert (=> b!773010 m!717789))

(assert (=> b!773010 m!717789))

(declare-fun m!717835 () Bool)

(assert (=> b!773010 m!717835))

(declare-fun m!717837 () Bool)

(assert (=> b!773003 m!717837))

(push 1)

