; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65254 () Bool)

(assert start!65254)

(declare-fun b!739924 () Bool)

(declare-fun e!413715 () Bool)

(declare-fun e!413722 () Bool)

(assert (=> b!739924 (= e!413715 e!413722)))

(declare-fun res!497551 () Bool)

(assert (=> b!739924 (=> res!497551 e!413722)))

(declare-datatypes ((array!41427 0))(
  ( (array!41428 (arr!19827 (Array (_ BitVec 32) (_ BitVec 64))) (size!20248 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41427)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!328634 () (_ BitVec 32))

(assert (=> b!739924 (= res!497551 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328634 #b00000000000000000000000000000000) (bvsge lt!328634 (size!20248 a!3186))))))

(declare-datatypes ((Unit!25304 0))(
  ( (Unit!25305) )
))
(declare-fun lt!328635 () Unit!25304)

(declare-fun e!413716 () Unit!25304)

(assert (=> b!739924 (= lt!328635 e!413716)))

(declare-fun c!81573 () Bool)

(declare-fun lt!328642 () Bool)

(assert (=> b!739924 (= c!81573 lt!328642)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!739924 (= lt!328642 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739924 (= lt!328634 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!739925 () Bool)

(declare-fun e!413721 () Bool)

(assert (=> b!739925 (= e!413721 (not e!413715))))

(declare-fun res!497558 () Bool)

(assert (=> b!739925 (=> res!497558 e!413715)))

(declare-datatypes ((SeekEntryResult!7427 0))(
  ( (MissingZero!7427 (index!32076 (_ BitVec 32))) (Found!7427 (index!32077 (_ BitVec 32))) (Intermediate!7427 (undefined!8239 Bool) (index!32078 (_ BitVec 32)) (x!63065 (_ BitVec 32))) (Undefined!7427) (MissingVacant!7427 (index!32079 (_ BitVec 32))) )
))
(declare-fun lt!328637 () SeekEntryResult!7427)

(assert (=> b!739925 (= res!497558 (or (not (is-Intermediate!7427 lt!328637)) (bvsge x!1131 (x!63065 lt!328637))))))

(declare-fun lt!328639 () SeekEntryResult!7427)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!739925 (= lt!328639 (Found!7427 j!159))))

(declare-fun e!413720 () Bool)

(assert (=> b!739925 e!413720))

(declare-fun res!497557 () Bool)

(assert (=> b!739925 (=> (not res!497557) (not e!413720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41427 (_ BitVec 32)) Bool)

(assert (=> b!739925 (= res!497557 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328643 () Unit!25304)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41427 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25304)

(assert (=> b!739925 (= lt!328643 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739926 () Bool)

(declare-fun res!497543 () Bool)

(declare-fun e!413718 () Bool)

(assert (=> b!739926 (=> (not res!497543) (not e!413718))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739926 (= res!497543 (validKeyInArray!0 (select (arr!19827 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!413726 () Bool)

(declare-fun b!739927 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41427 (_ BitVec 32)) SeekEntryResult!7427)

(assert (=> b!739927 (= e!413726 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328634 resIntermediateIndex!5 (select (arr!19827 a!3186) j!159) a!3186 mask!3328) lt!328639)))))

(declare-fun b!739928 () Bool)

(declare-fun Unit!25306 () Unit!25304)

(assert (=> b!739928 (= e!413716 Unit!25306)))

(declare-fun lt!328632 () SeekEntryResult!7427)

(assert (=> b!739928 (= lt!328632 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19827 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!739928 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328634 resIntermediateIndex!5 (select (arr!19827 a!3186) j!159) a!3186 mask!3328) lt!328639)))

(declare-fun b!739929 () Bool)

(declare-fun res!497546 () Bool)

(declare-fun e!413717 () Bool)

(assert (=> b!739929 (=> (not res!497546) (not e!413717))))

(assert (=> b!739929 (= res!497546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!739930 () Bool)

(assert (=> b!739930 (= e!413718 e!413717)))

(declare-fun res!497549 () Bool)

(assert (=> b!739930 (=> (not res!497549) (not e!413717))))

(declare-fun lt!328631 () SeekEntryResult!7427)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!739930 (= res!497549 (or (= lt!328631 (MissingZero!7427 i!1173)) (= lt!328631 (MissingVacant!7427 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41427 (_ BitVec 32)) SeekEntryResult!7427)

(assert (=> b!739930 (= lt!328631 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!739932 () Bool)

(declare-fun res!497554 () Bool)

(declare-fun e!413723 () Bool)

(assert (=> b!739932 (=> (not res!497554) (not e!413723))))

(assert (=> b!739932 (= res!497554 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19827 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!739933 () Bool)

(declare-fun res!497553 () Bool)

(assert (=> b!739933 (=> (not res!497553) (not e!413718))))

(assert (=> b!739933 (= res!497553 (and (= (size!20248 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20248 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20248 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739934 () Bool)

(assert (=> b!739934 (= e!413722 true)))

(declare-fun lt!328638 () (_ BitVec 64))

(declare-fun lt!328630 () array!41427)

(declare-fun lt!328641 () SeekEntryResult!7427)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41427 (_ BitVec 32)) SeekEntryResult!7427)

(assert (=> b!739934 (= lt!328641 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328634 lt!328638 lt!328630 mask!3328))))

(declare-fun b!739935 () Bool)

(assert (=> b!739935 (= e!413723 e!413721)))

(declare-fun res!497556 () Bool)

(assert (=> b!739935 (=> (not res!497556) (not e!413721))))

(declare-fun lt!328640 () SeekEntryResult!7427)

(assert (=> b!739935 (= res!497556 (= lt!328640 lt!328637))))

(assert (=> b!739935 (= lt!328637 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328638 lt!328630 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739935 (= lt!328640 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328638 mask!3328) lt!328638 lt!328630 mask!3328))))

(assert (=> b!739935 (= lt!328638 (select (store (arr!19827 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!739935 (= lt!328630 (array!41428 (store (arr!19827 a!3186) i!1173 k!2102) (size!20248 a!3186)))))

(declare-fun b!739936 () Bool)

(declare-fun res!497547 () Bool)

(assert (=> b!739936 (=> (not res!497547) (not e!413723))))

(declare-fun e!413719 () Bool)

(assert (=> b!739936 (= res!497547 e!413719)))

(declare-fun c!81574 () Bool)

(assert (=> b!739936 (= c!81574 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739937 () Bool)

(assert (=> b!739937 (= e!413717 e!413723)))

(declare-fun res!497550 () Bool)

(assert (=> b!739937 (=> (not res!497550) (not e!413723))))

(declare-fun lt!328636 () SeekEntryResult!7427)

(assert (=> b!739937 (= res!497550 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19827 a!3186) j!159) mask!3328) (select (arr!19827 a!3186) j!159) a!3186 mask!3328) lt!328636))))

(assert (=> b!739937 (= lt!328636 (Intermediate!7427 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!739938 () Bool)

(assert (=> b!739938 (= e!413719 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19827 a!3186) j!159) a!3186 mask!3328) (Found!7427 j!159)))))

(declare-fun b!739939 () Bool)

(declare-fun Unit!25307 () Unit!25304)

(assert (=> b!739939 (= e!413716 Unit!25307)))

(assert (=> b!739939 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328634 (select (arr!19827 a!3186) j!159) a!3186 mask!3328) lt!328636)))

(declare-fun b!739940 () Bool)

(declare-fun res!497555 () Bool)

(assert (=> b!739940 (=> (not res!497555) (not e!413718))))

(declare-fun arrayContainsKey!0 (array!41427 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739940 (= res!497555 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!739941 () Bool)

(declare-fun e!413725 () Bool)

(assert (=> b!739941 (= e!413720 e!413725)))

(declare-fun res!497548 () Bool)

(assert (=> b!739941 (=> (not res!497548) (not e!413725))))

(declare-fun lt!328633 () SeekEntryResult!7427)

(assert (=> b!739941 (= res!497548 (= (seekEntryOrOpen!0 (select (arr!19827 a!3186) j!159) a!3186 mask!3328) lt!328633))))

(assert (=> b!739941 (= lt!328633 (Found!7427 j!159))))

(declare-fun b!739942 () Bool)

(assert (=> b!739942 (= e!413719 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19827 a!3186) j!159) a!3186 mask!3328) lt!328636))))

(declare-fun b!739943 () Bool)

(declare-fun res!497542 () Bool)

(assert (=> b!739943 (=> (not res!497542) (not e!413718))))

(assert (=> b!739943 (= res!497542 (validKeyInArray!0 k!2102))))

(declare-fun res!497544 () Bool)

(assert (=> start!65254 (=> (not res!497544) (not e!413718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65254 (= res!497544 (validMask!0 mask!3328))))

(assert (=> start!65254 e!413718))

(assert (=> start!65254 true))

(declare-fun array_inv!15623 (array!41427) Bool)

(assert (=> start!65254 (array_inv!15623 a!3186)))

(declare-fun b!739931 () Bool)

(assert (=> b!739931 (= e!413725 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19827 a!3186) j!159) a!3186 mask!3328) lt!328633))))

(declare-fun b!739944 () Bool)

(declare-fun res!497541 () Bool)

(assert (=> b!739944 (=> res!497541 e!413722)))

(assert (=> b!739944 (= res!497541 e!413726)))

(declare-fun c!81572 () Bool)

(assert (=> b!739944 (= c!81572 lt!328642)))

(declare-fun b!739945 () Bool)

(declare-fun res!497552 () Bool)

(assert (=> b!739945 (=> (not res!497552) (not e!413717))))

(assert (=> b!739945 (= res!497552 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20248 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20248 a!3186))))))

(declare-fun b!739946 () Bool)

(declare-fun res!497545 () Bool)

(assert (=> b!739946 (=> (not res!497545) (not e!413717))))

(declare-datatypes ((List!13829 0))(
  ( (Nil!13826) (Cons!13825 (h!14897 (_ BitVec 64)) (t!20144 List!13829)) )
))
(declare-fun arrayNoDuplicates!0 (array!41427 (_ BitVec 32) List!13829) Bool)

(assert (=> b!739946 (= res!497545 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13826))))

(declare-fun b!739947 () Bool)

(assert (=> b!739947 (= e!413726 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328634 (select (arr!19827 a!3186) j!159) a!3186 mask!3328) lt!328636)))))

(assert (= (and start!65254 res!497544) b!739933))

(assert (= (and b!739933 res!497553) b!739926))

(assert (= (and b!739926 res!497543) b!739943))

(assert (= (and b!739943 res!497542) b!739940))

(assert (= (and b!739940 res!497555) b!739930))

(assert (= (and b!739930 res!497549) b!739929))

(assert (= (and b!739929 res!497546) b!739946))

(assert (= (and b!739946 res!497545) b!739945))

(assert (= (and b!739945 res!497552) b!739937))

(assert (= (and b!739937 res!497550) b!739932))

(assert (= (and b!739932 res!497554) b!739936))

(assert (= (and b!739936 c!81574) b!739942))

(assert (= (and b!739936 (not c!81574)) b!739938))

(assert (= (and b!739936 res!497547) b!739935))

(assert (= (and b!739935 res!497556) b!739925))

(assert (= (and b!739925 res!497557) b!739941))

(assert (= (and b!739941 res!497548) b!739931))

(assert (= (and b!739925 (not res!497558)) b!739924))

(assert (= (and b!739924 c!81573) b!739939))

(assert (= (and b!739924 (not c!81573)) b!739928))

(assert (= (and b!739924 (not res!497551)) b!739944))

(assert (= (and b!739944 c!81572) b!739947))

(assert (= (and b!739944 (not c!81572)) b!739927))

(assert (= (and b!739944 (not res!497541)) b!739934))

(declare-fun m!691183 () Bool)

(assert (=> b!739934 m!691183))

(declare-fun m!691185 () Bool)

(assert (=> b!739926 m!691185))

(assert (=> b!739926 m!691185))

(declare-fun m!691187 () Bool)

(assert (=> b!739926 m!691187))

(assert (=> b!739938 m!691185))

(assert (=> b!739938 m!691185))

(declare-fun m!691189 () Bool)

(assert (=> b!739938 m!691189))

(assert (=> b!739931 m!691185))

(assert (=> b!739931 m!691185))

(declare-fun m!691191 () Bool)

(assert (=> b!739931 m!691191))

(declare-fun m!691193 () Bool)

(assert (=> b!739935 m!691193))

(declare-fun m!691195 () Bool)

(assert (=> b!739935 m!691195))

(declare-fun m!691197 () Bool)

(assert (=> b!739935 m!691197))

(declare-fun m!691199 () Bool)

(assert (=> b!739935 m!691199))

(assert (=> b!739935 m!691193))

(declare-fun m!691201 () Bool)

(assert (=> b!739935 m!691201))

(declare-fun m!691203 () Bool)

(assert (=> b!739929 m!691203))

(declare-fun m!691205 () Bool)

(assert (=> b!739932 m!691205))

(assert (=> b!739941 m!691185))

(assert (=> b!739941 m!691185))

(declare-fun m!691207 () Bool)

(assert (=> b!739941 m!691207))

(declare-fun m!691209 () Bool)

(assert (=> b!739943 m!691209))

(assert (=> b!739939 m!691185))

(assert (=> b!739939 m!691185))

(declare-fun m!691211 () Bool)

(assert (=> b!739939 m!691211))

(declare-fun m!691213 () Bool)

(assert (=> b!739925 m!691213))

(declare-fun m!691215 () Bool)

(assert (=> b!739925 m!691215))

(assert (=> b!739927 m!691185))

(assert (=> b!739927 m!691185))

(declare-fun m!691217 () Bool)

(assert (=> b!739927 m!691217))

(declare-fun m!691219 () Bool)

(assert (=> start!65254 m!691219))

(declare-fun m!691221 () Bool)

(assert (=> start!65254 m!691221))

(assert (=> b!739928 m!691185))

(assert (=> b!739928 m!691185))

(assert (=> b!739928 m!691189))

(assert (=> b!739928 m!691185))

(assert (=> b!739928 m!691217))

(declare-fun m!691223 () Bool)

(assert (=> b!739946 m!691223))

(declare-fun m!691225 () Bool)

(assert (=> b!739940 m!691225))

(declare-fun m!691227 () Bool)

(assert (=> b!739924 m!691227))

(assert (=> b!739942 m!691185))

(assert (=> b!739942 m!691185))

(declare-fun m!691229 () Bool)

(assert (=> b!739942 m!691229))

(assert (=> b!739937 m!691185))

(assert (=> b!739937 m!691185))

(declare-fun m!691231 () Bool)

(assert (=> b!739937 m!691231))

(assert (=> b!739937 m!691231))

(assert (=> b!739937 m!691185))

(declare-fun m!691233 () Bool)

(assert (=> b!739937 m!691233))

(declare-fun m!691235 () Bool)

(assert (=> b!739930 m!691235))

(assert (=> b!739947 m!691185))

(assert (=> b!739947 m!691185))

(assert (=> b!739947 m!691211))

(push 1)

