; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66814 () Bool)

(assert start!66814)

(declare-fun b!770816 () Bool)

(declare-fun res!521460 () Bool)

(declare-fun e!429143 () Bool)

(assert (=> b!770816 (=> (not res!521460) (not e!429143))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42376 0))(
  ( (array!42377 (arr!20288 (Array (_ BitVec 32) (_ BitVec 64))) (size!20709 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42376)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!770816 (= res!521460 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20709 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20709 a!3186))))))

(declare-fun b!770817 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!429142 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7888 0))(
  ( (MissingZero!7888 (index!33920 (_ BitVec 32))) (Found!7888 (index!33921 (_ BitVec 32))) (Intermediate!7888 (undefined!8700 Bool) (index!33922 (_ BitVec 32)) (x!64843 (_ BitVec 32))) (Undefined!7888) (MissingVacant!7888 (index!33923 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42376 (_ BitVec 32)) SeekEntryResult!7888)

(assert (=> b!770817 (= e!429142 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20288 a!3186) j!159) a!3186 mask!3328) (Found!7888 j!159)))))

(declare-fun b!770818 () Bool)

(declare-fun e!429147 () Bool)

(assert (=> b!770818 (= e!429147 true)))

(declare-datatypes ((Unit!26566 0))(
  ( (Unit!26567) )
))
(declare-fun lt!343108 () Unit!26566)

(declare-fun e!429140 () Unit!26566)

(assert (=> b!770818 (= lt!343108 e!429140)))

(declare-fun c!85077 () Bool)

(assert (=> b!770818 (= c!85077 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!343103 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770818 (= lt!343103 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!770819 () Bool)

(declare-fun res!521467 () Bool)

(assert (=> b!770819 (=> (not res!521467) (not e!429143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42376 (_ BitVec 32)) Bool)

(assert (=> b!770819 (= res!521467 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770820 () Bool)

(declare-fun e!429141 () Bool)

(declare-fun e!429148 () Bool)

(assert (=> b!770820 (= e!429141 e!429148)))

(declare-fun res!521468 () Bool)

(assert (=> b!770820 (=> (not res!521468) (not e!429148))))

(declare-fun lt!343111 () SeekEntryResult!7888)

(declare-fun lt!343104 () SeekEntryResult!7888)

(assert (=> b!770820 (= res!521468 (= lt!343111 lt!343104))))

(declare-fun lt!343110 () (_ BitVec 64))

(declare-fun lt!343105 () array!42376)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42376 (_ BitVec 32)) SeekEntryResult!7888)

(assert (=> b!770820 (= lt!343104 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343110 lt!343105 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770820 (= lt!343111 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343110 mask!3328) lt!343110 lt!343105 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!770820 (= lt!343110 (select (store (arr!20288 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!770820 (= lt!343105 (array!42377 (store (arr!20288 a!3186) i!1173 k!2102) (size!20709 a!3186)))))

(declare-fun b!770821 () Bool)

(declare-fun e!429149 () Bool)

(declare-fun e!429144 () Bool)

(assert (=> b!770821 (= e!429149 e!429144)))

(declare-fun res!521465 () Bool)

(assert (=> b!770821 (=> (not res!521465) (not e!429144))))

(declare-fun lt!343106 () SeekEntryResult!7888)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42376 (_ BitVec 32)) SeekEntryResult!7888)

(assert (=> b!770821 (= res!521465 (= (seekEntryOrOpen!0 (select (arr!20288 a!3186) j!159) a!3186 mask!3328) lt!343106))))

(assert (=> b!770821 (= lt!343106 (Found!7888 j!159))))

(declare-fun b!770822 () Bool)

(declare-fun res!521463 () Bool)

(declare-fun e!429146 () Bool)

(assert (=> b!770822 (=> (not res!521463) (not e!429146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770822 (= res!521463 (validKeyInArray!0 k!2102))))

(declare-fun b!770824 () Bool)

(assert (=> b!770824 (= e!429148 (not e!429147))))

(declare-fun res!521459 () Bool)

(assert (=> b!770824 (=> res!521459 e!429147)))

(assert (=> b!770824 (= res!521459 (or (not (is-Intermediate!7888 lt!343104)) (bvsge x!1131 (x!64843 lt!343104))))))

(assert (=> b!770824 e!429149))

(declare-fun res!521453 () Bool)

(assert (=> b!770824 (=> (not res!521453) (not e!429149))))

(assert (=> b!770824 (= res!521453 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343109 () Unit!26566)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42376 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26566)

(assert (=> b!770824 (= lt!343109 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770825 () Bool)

(declare-fun res!521455 () Bool)

(assert (=> b!770825 (=> (not res!521455) (not e!429141))))

(assert (=> b!770825 (= res!521455 e!429142)))

(declare-fun c!85078 () Bool)

(assert (=> b!770825 (= c!85078 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770826 () Bool)

(assert (=> b!770826 (= e!429144 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20288 a!3186) j!159) a!3186 mask!3328) lt!343106))))

(declare-fun b!770827 () Bool)

(assert (=> b!770827 (= e!429143 e!429141)))

(declare-fun res!521464 () Bool)

(assert (=> b!770827 (=> (not res!521464) (not e!429141))))

(declare-fun lt!343107 () SeekEntryResult!7888)

(assert (=> b!770827 (= res!521464 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20288 a!3186) j!159) mask!3328) (select (arr!20288 a!3186) j!159) a!3186 mask!3328) lt!343107))))

(assert (=> b!770827 (= lt!343107 (Intermediate!7888 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770828 () Bool)

(declare-fun Unit!26568 () Unit!26566)

(assert (=> b!770828 (= e!429140 Unit!26568)))

(assert (=> b!770828 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343103 (select (arr!20288 a!3186) j!159) a!3186 mask!3328) lt!343107)))

(declare-fun b!770829 () Bool)

(declare-fun res!521462 () Bool)

(assert (=> b!770829 (=> (not res!521462) (not e!429143))))

(declare-datatypes ((List!14290 0))(
  ( (Nil!14287) (Cons!14286 (h!15385 (_ BitVec 64)) (t!20605 List!14290)) )
))
(declare-fun arrayNoDuplicates!0 (array!42376 (_ BitVec 32) List!14290) Bool)

(assert (=> b!770829 (= res!521462 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14287))))

(declare-fun b!770830 () Bool)

(declare-fun res!521456 () Bool)

(assert (=> b!770830 (=> (not res!521456) (not e!429146))))

(assert (=> b!770830 (= res!521456 (and (= (size!20709 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20709 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20709 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770831 () Bool)

(declare-fun Unit!26569 () Unit!26566)

(assert (=> b!770831 (= e!429140 Unit!26569)))

(declare-fun lt!343112 () SeekEntryResult!7888)

(assert (=> b!770831 (= lt!343112 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20288 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!770831 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343103 resIntermediateIndex!5 (select (arr!20288 a!3186) j!159) a!3186 mask!3328) (Found!7888 j!159))))

(declare-fun b!770832 () Bool)

(declare-fun res!521461 () Bool)

(assert (=> b!770832 (=> (not res!521461) (not e!429146))))

(assert (=> b!770832 (= res!521461 (validKeyInArray!0 (select (arr!20288 a!3186) j!159)))))

(declare-fun b!770833 () Bool)

(declare-fun res!521466 () Bool)

(assert (=> b!770833 (=> (not res!521466) (not e!429146))))

(declare-fun arrayContainsKey!0 (array!42376 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770833 (= res!521466 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770823 () Bool)

(assert (=> b!770823 (= e!429146 e!429143)))

(declare-fun res!521457 () Bool)

(assert (=> b!770823 (=> (not res!521457) (not e!429143))))

(declare-fun lt!343102 () SeekEntryResult!7888)

(assert (=> b!770823 (= res!521457 (or (= lt!343102 (MissingZero!7888 i!1173)) (= lt!343102 (MissingVacant!7888 i!1173))))))

(assert (=> b!770823 (= lt!343102 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!521454 () Bool)

(assert (=> start!66814 (=> (not res!521454) (not e!429146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66814 (= res!521454 (validMask!0 mask!3328))))

(assert (=> start!66814 e!429146))

(assert (=> start!66814 true))

(declare-fun array_inv!16084 (array!42376) Bool)

(assert (=> start!66814 (array_inv!16084 a!3186)))

(declare-fun b!770834 () Bool)

(assert (=> b!770834 (= e!429142 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20288 a!3186) j!159) a!3186 mask!3328) lt!343107))))

(declare-fun b!770835 () Bool)

(declare-fun res!521458 () Bool)

(assert (=> b!770835 (=> (not res!521458) (not e!429141))))

(assert (=> b!770835 (= res!521458 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20288 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!66814 res!521454) b!770830))

(assert (= (and b!770830 res!521456) b!770832))

(assert (= (and b!770832 res!521461) b!770822))

(assert (= (and b!770822 res!521463) b!770833))

(assert (= (and b!770833 res!521466) b!770823))

(assert (= (and b!770823 res!521457) b!770819))

(assert (= (and b!770819 res!521467) b!770829))

(assert (= (and b!770829 res!521462) b!770816))

(assert (= (and b!770816 res!521460) b!770827))

(assert (= (and b!770827 res!521464) b!770835))

(assert (= (and b!770835 res!521458) b!770825))

(assert (= (and b!770825 c!85078) b!770834))

(assert (= (and b!770825 (not c!85078)) b!770817))

(assert (= (and b!770825 res!521455) b!770820))

(assert (= (and b!770820 res!521468) b!770824))

(assert (= (and b!770824 res!521453) b!770821))

(assert (= (and b!770821 res!521465) b!770826))

(assert (= (and b!770824 (not res!521459)) b!770818))

(assert (= (and b!770818 c!85077) b!770828))

(assert (= (and b!770818 (not c!85077)) b!770831))

(declare-fun m!716047 () Bool)

(assert (=> b!770824 m!716047))

(declare-fun m!716049 () Bool)

(assert (=> b!770824 m!716049))

(declare-fun m!716051 () Bool)

(assert (=> start!66814 m!716051))

(declare-fun m!716053 () Bool)

(assert (=> start!66814 m!716053))

(declare-fun m!716055 () Bool)

(assert (=> b!770835 m!716055))

(declare-fun m!716057 () Bool)

(assert (=> b!770834 m!716057))

(assert (=> b!770834 m!716057))

(declare-fun m!716059 () Bool)

(assert (=> b!770834 m!716059))

(assert (=> b!770821 m!716057))

(assert (=> b!770821 m!716057))

(declare-fun m!716061 () Bool)

(assert (=> b!770821 m!716061))

(declare-fun m!716063 () Bool)

(assert (=> b!770819 m!716063))

(assert (=> b!770826 m!716057))

(assert (=> b!770826 m!716057))

(declare-fun m!716065 () Bool)

(assert (=> b!770826 m!716065))

(assert (=> b!770828 m!716057))

(assert (=> b!770828 m!716057))

(declare-fun m!716067 () Bool)

(assert (=> b!770828 m!716067))

(assert (=> b!770832 m!716057))

(assert (=> b!770832 m!716057))

(declare-fun m!716069 () Bool)

(assert (=> b!770832 m!716069))

(declare-fun m!716071 () Bool)

(assert (=> b!770823 m!716071))

(declare-fun m!716073 () Bool)

(assert (=> b!770829 m!716073))

(assert (=> b!770817 m!716057))

(assert (=> b!770817 m!716057))

(declare-fun m!716075 () Bool)

(assert (=> b!770817 m!716075))

(declare-fun m!716077 () Bool)

(assert (=> b!770818 m!716077))

(assert (=> b!770827 m!716057))

(assert (=> b!770827 m!716057))

(declare-fun m!716079 () Bool)

(assert (=> b!770827 m!716079))

(assert (=> b!770827 m!716079))

(assert (=> b!770827 m!716057))

(declare-fun m!716081 () Bool)

(assert (=> b!770827 m!716081))

(declare-fun m!716083 () Bool)

(assert (=> b!770822 m!716083))

(declare-fun m!716085 () Bool)

(assert (=> b!770833 m!716085))

(declare-fun m!716087 () Bool)

(assert (=> b!770820 m!716087))

(declare-fun m!716089 () Bool)

(assert (=> b!770820 m!716089))

(declare-fun m!716091 () Bool)

(assert (=> b!770820 m!716091))

(declare-fun m!716093 () Bool)

(assert (=> b!770820 m!716093))

(assert (=> b!770820 m!716087))

(declare-fun m!716095 () Bool)

(assert (=> b!770820 m!716095))

(assert (=> b!770831 m!716057))

(assert (=> b!770831 m!716057))

(assert (=> b!770831 m!716075))

(assert (=> b!770831 m!716057))

(declare-fun m!716097 () Bool)

(assert (=> b!770831 m!716097))

(push 1)

