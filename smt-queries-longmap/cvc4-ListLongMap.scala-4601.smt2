; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64184 () Bool)

(assert start!64184)

(declare-fun b!720827 () Bool)

(declare-fun res!482947 () Bool)

(declare-fun e!404259 () Bool)

(assert (=> b!720827 (=> (not res!482947) (not e!404259))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40822 0))(
  ( (array!40823 (arr!19535 (Array (_ BitVec 32) (_ BitVec 64))) (size!19956 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40822)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720827 (= res!482947 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19535 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720828 () Bool)

(declare-fun e!404261 () Bool)

(assert (=> b!720828 (= e!404261 e!404259)))

(declare-fun res!482948 () Bool)

(assert (=> b!720828 (=> (not res!482948) (not e!404259))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7135 0))(
  ( (MissingZero!7135 (index!30908 (_ BitVec 32))) (Found!7135 (index!30909 (_ BitVec 32))) (Intermediate!7135 (undefined!7947 Bool) (index!30910 (_ BitVec 32)) (x!61911 (_ BitVec 32))) (Undefined!7135) (MissingVacant!7135 (index!30911 (_ BitVec 32))) )
))
(declare-fun lt!319901 () SeekEntryResult!7135)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40822 (_ BitVec 32)) SeekEntryResult!7135)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720828 (= res!482948 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19535 a!3186) j!159) mask!3328) (select (arr!19535 a!3186) j!159) a!3186 mask!3328) lt!319901))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720828 (= lt!319901 (Intermediate!7135 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!720829 () Bool)

(declare-fun e!404258 () Bool)

(assert (=> b!720829 (= e!404258 e!404261)))

(declare-fun res!482941 () Bool)

(assert (=> b!720829 (=> (not res!482941) (not e!404261))))

(declare-fun lt!319900 () SeekEntryResult!7135)

(assert (=> b!720829 (= res!482941 (or (= lt!319900 (MissingZero!7135 i!1173)) (= lt!319900 (MissingVacant!7135 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40822 (_ BitVec 32)) SeekEntryResult!7135)

(assert (=> b!720829 (= lt!319900 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!720830 () Bool)

(declare-fun res!482946 () Bool)

(assert (=> b!720830 (=> (not res!482946) (not e!404261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40822 (_ BitVec 32)) Bool)

(assert (=> b!720830 (= res!482946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720831 () Bool)

(declare-fun res!482945 () Bool)

(assert (=> b!720831 (=> (not res!482945) (not e!404258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720831 (= res!482945 (validKeyInArray!0 k!2102))))

(declare-fun b!720832 () Bool)

(assert (=> b!720832 (= e!404259 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun lt!319899 () (_ BitVec 32))

(assert (=> b!720832 (= lt!319899 (toIndex!0 (select (store (arr!19535 a!3186) i!1173 k!2102) j!159) mask!3328))))

(declare-fun b!720833 () Bool)

(declare-fun res!482942 () Bool)

(assert (=> b!720833 (=> (not res!482942) (not e!404258))))

(declare-fun arrayContainsKey!0 (array!40822 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720833 (= res!482942 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!404257 () Bool)

(declare-fun b!720834 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40822 (_ BitVec 32)) SeekEntryResult!7135)

(assert (=> b!720834 (= e!404257 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19535 a!3186) j!159) a!3186 mask!3328) (Found!7135 j!159)))))

(declare-fun res!482943 () Bool)

(assert (=> start!64184 (=> (not res!482943) (not e!404258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64184 (= res!482943 (validMask!0 mask!3328))))

(assert (=> start!64184 e!404258))

(assert (=> start!64184 true))

(declare-fun array_inv!15331 (array!40822) Bool)

(assert (=> start!64184 (array_inv!15331 a!3186)))

(declare-fun b!720835 () Bool)

(declare-fun res!482944 () Bool)

(assert (=> b!720835 (=> (not res!482944) (not e!404258))))

(assert (=> b!720835 (= res!482944 (and (= (size!19956 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19956 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19956 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720836 () Bool)

(declare-fun res!482939 () Bool)

(assert (=> b!720836 (=> (not res!482939) (not e!404258))))

(assert (=> b!720836 (= res!482939 (validKeyInArray!0 (select (arr!19535 a!3186) j!159)))))

(declare-fun b!720837 () Bool)

(declare-fun res!482937 () Bool)

(assert (=> b!720837 (=> (not res!482937) (not e!404261))))

(assert (=> b!720837 (= res!482937 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19956 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19956 a!3186))))))

(declare-fun b!720838 () Bool)

(assert (=> b!720838 (= e!404257 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19535 a!3186) j!159) a!3186 mask!3328) lt!319901))))

(declare-fun b!720839 () Bool)

(declare-fun res!482940 () Bool)

(assert (=> b!720839 (=> (not res!482940) (not e!404259))))

(assert (=> b!720839 (= res!482940 e!404257)))

(declare-fun c!79315 () Bool)

(assert (=> b!720839 (= c!79315 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!720840 () Bool)

(declare-fun res!482938 () Bool)

(assert (=> b!720840 (=> (not res!482938) (not e!404261))))

(declare-datatypes ((List!13537 0))(
  ( (Nil!13534) (Cons!13533 (h!14584 (_ BitVec 64)) (t!19852 List!13537)) )
))
(declare-fun arrayNoDuplicates!0 (array!40822 (_ BitVec 32) List!13537) Bool)

(assert (=> b!720840 (= res!482938 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13534))))

(assert (= (and start!64184 res!482943) b!720835))

(assert (= (and b!720835 res!482944) b!720836))

(assert (= (and b!720836 res!482939) b!720831))

(assert (= (and b!720831 res!482945) b!720833))

(assert (= (and b!720833 res!482942) b!720829))

(assert (= (and b!720829 res!482941) b!720830))

(assert (= (and b!720830 res!482946) b!720840))

(assert (= (and b!720840 res!482938) b!720837))

(assert (= (and b!720837 res!482937) b!720828))

(assert (= (and b!720828 res!482948) b!720827))

(assert (= (and b!720827 res!482947) b!720839))

(assert (= (and b!720839 c!79315) b!720838))

(assert (= (and b!720839 (not c!79315)) b!720834))

(assert (= (and b!720839 res!482940) b!720832))

(declare-fun m!675831 () Bool)

(assert (=> b!720828 m!675831))

(assert (=> b!720828 m!675831))

(declare-fun m!675833 () Bool)

(assert (=> b!720828 m!675833))

(assert (=> b!720828 m!675833))

(assert (=> b!720828 m!675831))

(declare-fun m!675835 () Bool)

(assert (=> b!720828 m!675835))

(assert (=> b!720836 m!675831))

(assert (=> b!720836 m!675831))

(declare-fun m!675837 () Bool)

(assert (=> b!720836 m!675837))

(declare-fun m!675839 () Bool)

(assert (=> b!720840 m!675839))

(declare-fun m!675841 () Bool)

(assert (=> b!720833 m!675841))

(declare-fun m!675843 () Bool)

(assert (=> b!720830 m!675843))

(assert (=> b!720834 m!675831))

(assert (=> b!720834 m!675831))

(declare-fun m!675845 () Bool)

(assert (=> b!720834 m!675845))

(declare-fun m!675847 () Bool)

(assert (=> b!720832 m!675847))

(declare-fun m!675849 () Bool)

(assert (=> b!720832 m!675849))

(assert (=> b!720832 m!675849))

(declare-fun m!675851 () Bool)

(assert (=> b!720832 m!675851))

(assert (=> b!720838 m!675831))

(assert (=> b!720838 m!675831))

(declare-fun m!675853 () Bool)

(assert (=> b!720838 m!675853))

(declare-fun m!675855 () Bool)

(assert (=> b!720831 m!675855))

(declare-fun m!675857 () Bool)

(assert (=> b!720829 m!675857))

(declare-fun m!675859 () Bool)

(assert (=> b!720827 m!675859))

(declare-fun m!675861 () Bool)

(assert (=> start!64184 m!675861))

(declare-fun m!675863 () Bool)

(assert (=> start!64184 m!675863))

(push 1)

(assert (not b!720836))

(assert (not b!720829))

(assert (not b!720833))

(assert (not b!720840))

(assert (not b!720832))

(assert (not b!720838))

(assert (not b!720831))

(assert (not b!720834))

