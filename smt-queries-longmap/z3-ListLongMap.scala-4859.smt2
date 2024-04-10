; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66998 () Bool)

(assert start!66998)

(declare-fun b!772940 () Bool)

(declare-fun e!430295 () Bool)

(assert (=> b!772940 (= e!430295 true)))

(declare-datatypes ((Unit!26646 0))(
  ( (Unit!26647) )
))
(declare-fun lt!344141 () Unit!26646)

(declare-fun e!430299 () Unit!26646)

(assert (=> b!772940 (= lt!344141 e!430299)))

(declare-fun c!85528 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!772940 (= c!85528 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!344144 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772940 (= lt!344144 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!772941 () Bool)

(declare-fun res!522689 () Bool)

(declare-fun e!430301 () Bool)

(assert (=> b!772941 (=> (not res!522689) (not e!430301))))

(declare-datatypes ((array!42422 0))(
  ( (array!42423 (arr!20308 (Array (_ BitVec 32) (_ BitVec 64))) (size!20729 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42422)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42422 (_ BitVec 32)) Bool)

(assert (=> b!772941 (= res!522689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!772942 () Bool)

(declare-fun e!430300 () Bool)

(assert (=> b!772942 (= e!430300 (not e!430295))))

(declare-fun res!522693 () Bool)

(assert (=> b!772942 (=> res!522693 e!430295)))

(declare-datatypes ((SeekEntryResult!7908 0))(
  ( (MissingZero!7908 (index!34000 (_ BitVec 32))) (Found!7908 (index!34001 (_ BitVec 32))) (Intermediate!7908 (undefined!8720 Bool) (index!34002 (_ BitVec 32)) (x!64943 (_ BitVec 32))) (Undefined!7908) (MissingVacant!7908 (index!34003 (_ BitVec 32))) )
))
(declare-fun lt!344134 () SeekEntryResult!7908)

(get-info :version)

(assert (=> b!772942 (= res!522693 (or (not ((_ is Intermediate!7908) lt!344134)) (bvsge x!1131 (x!64943 lt!344134))))))

(declare-fun e!430297 () Bool)

(assert (=> b!772942 e!430297))

(declare-fun res!522692 () Bool)

(assert (=> b!772942 (=> (not res!522692) (not e!430297))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!772942 (= res!522692 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344135 () Unit!26646)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42422 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26646)

(assert (=> b!772942 (= lt!344135 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!772943 () Bool)

(declare-fun res!522690 () Bool)

(declare-fun e!430298 () Bool)

(assert (=> b!772943 (=> (not res!522690) (not e!430298))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!772943 (= res!522690 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20308 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772944 () Bool)

(declare-fun Unit!26648 () Unit!26646)

(assert (=> b!772944 (= e!430299 Unit!26648)))

(declare-fun lt!344136 () SeekEntryResult!7908)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42422 (_ BitVec 32)) SeekEntryResult!7908)

(assert (=> b!772944 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344144 (select (arr!20308 a!3186) j!159) a!3186 mask!3328) lt!344136)))

(declare-fun b!772945 () Bool)

(declare-fun res!522685 () Bool)

(declare-fun e!430292 () Bool)

(assert (=> b!772945 (=> (not res!522685) (not e!430292))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!772945 (= res!522685 (validKeyInArray!0 (select (arr!20308 a!3186) j!159)))))

(declare-fun b!772946 () Bool)

(declare-fun res!522683 () Bool)

(assert (=> b!772946 (=> (not res!522683) (not e!430292))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!772946 (= res!522683 (validKeyInArray!0 k0!2102))))

(declare-fun b!772947 () Bool)

(declare-fun e!430293 () Bool)

(assert (=> b!772947 (= e!430297 e!430293)))

(declare-fun res!522697 () Bool)

(assert (=> b!772947 (=> (not res!522697) (not e!430293))))

(declare-fun lt!344142 () SeekEntryResult!7908)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42422 (_ BitVec 32)) SeekEntryResult!7908)

(assert (=> b!772947 (= res!522697 (= (seekEntryOrOpen!0 (select (arr!20308 a!3186) j!159) a!3186 mask!3328) lt!344142))))

(assert (=> b!772947 (= lt!344142 (Found!7908 j!159))))

(declare-fun b!772948 () Bool)

(declare-fun res!522686 () Bool)

(assert (=> b!772948 (=> (not res!522686) (not e!430301))))

(declare-datatypes ((List!14310 0))(
  ( (Nil!14307) (Cons!14306 (h!15411 (_ BitVec 64)) (t!20625 List!14310)) )
))
(declare-fun arrayNoDuplicates!0 (array!42422 (_ BitVec 32) List!14310) Bool)

(assert (=> b!772948 (= res!522686 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14307))))

(declare-fun b!772949 () Bool)

(declare-fun res!522694 () Bool)

(assert (=> b!772949 (=> (not res!522694) (not e!430292))))

(declare-fun arrayContainsKey!0 (array!42422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!772949 (= res!522694 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!772950 () Bool)

(declare-fun e!430294 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42422 (_ BitVec 32)) SeekEntryResult!7908)

(assert (=> b!772950 (= e!430294 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20308 a!3186) j!159) a!3186 mask!3328) (Found!7908 j!159)))))

(declare-fun b!772951 () Bool)

(declare-fun res!522684 () Bool)

(assert (=> b!772951 (=> (not res!522684) (not e!430298))))

(assert (=> b!772951 (= res!522684 e!430294)))

(declare-fun c!85527 () Bool)

(assert (=> b!772951 (= c!85527 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!772952 () Bool)

(assert (=> b!772952 (= e!430294 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20308 a!3186) j!159) a!3186 mask!3328) lt!344136))))

(declare-fun res!522696 () Bool)

(assert (=> start!66998 (=> (not res!522696) (not e!430292))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66998 (= res!522696 (validMask!0 mask!3328))))

(assert (=> start!66998 e!430292))

(assert (=> start!66998 true))

(declare-fun array_inv!16104 (array!42422) Bool)

(assert (=> start!66998 (array_inv!16104 a!3186)))

(declare-fun b!772953 () Bool)

(declare-fun Unit!26649 () Unit!26646)

(assert (=> b!772953 (= e!430299 Unit!26649)))

(declare-fun lt!344139 () SeekEntryResult!7908)

(assert (=> b!772953 (= lt!344139 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20308 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!772953 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344144 resIntermediateIndex!5 (select (arr!20308 a!3186) j!159) a!3186 mask!3328) (Found!7908 j!159))))

(declare-fun b!772954 () Bool)

(declare-fun res!522695 () Bool)

(assert (=> b!772954 (=> (not res!522695) (not e!430292))))

(assert (=> b!772954 (= res!522695 (and (= (size!20729 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20729 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20729 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!772955 () Bool)

(declare-fun res!522691 () Bool)

(assert (=> b!772955 (=> (not res!522691) (not e!430301))))

(assert (=> b!772955 (= res!522691 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20729 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20729 a!3186))))))

(declare-fun b!772956 () Bool)

(assert (=> b!772956 (= e!430298 e!430300)))

(declare-fun res!522687 () Bool)

(assert (=> b!772956 (=> (not res!522687) (not e!430300))))

(declare-fun lt!344138 () SeekEntryResult!7908)

(assert (=> b!772956 (= res!522687 (= lt!344138 lt!344134))))

(declare-fun lt!344140 () array!42422)

(declare-fun lt!344143 () (_ BitVec 64))

(assert (=> b!772956 (= lt!344134 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344143 lt!344140 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772956 (= lt!344138 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344143 mask!3328) lt!344143 lt!344140 mask!3328))))

(assert (=> b!772956 (= lt!344143 (select (store (arr!20308 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!772956 (= lt!344140 (array!42423 (store (arr!20308 a!3186) i!1173 k0!2102) (size!20729 a!3186)))))

(declare-fun b!772957 () Bool)

(assert (=> b!772957 (= e!430292 e!430301)))

(declare-fun res!522698 () Bool)

(assert (=> b!772957 (=> (not res!522698) (not e!430301))))

(declare-fun lt!344137 () SeekEntryResult!7908)

(assert (=> b!772957 (= res!522698 (or (= lt!344137 (MissingZero!7908 i!1173)) (= lt!344137 (MissingVacant!7908 i!1173))))))

(assert (=> b!772957 (= lt!344137 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!772958 () Bool)

(assert (=> b!772958 (= e!430293 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20308 a!3186) j!159) a!3186 mask!3328) lt!344142))))

(declare-fun b!772959 () Bool)

(assert (=> b!772959 (= e!430301 e!430298)))

(declare-fun res!522688 () Bool)

(assert (=> b!772959 (=> (not res!522688) (not e!430298))))

(assert (=> b!772959 (= res!522688 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20308 a!3186) j!159) mask!3328) (select (arr!20308 a!3186) j!159) a!3186 mask!3328) lt!344136))))

(assert (=> b!772959 (= lt!344136 (Intermediate!7908 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!66998 res!522696) b!772954))

(assert (= (and b!772954 res!522695) b!772945))

(assert (= (and b!772945 res!522685) b!772946))

(assert (= (and b!772946 res!522683) b!772949))

(assert (= (and b!772949 res!522694) b!772957))

(assert (= (and b!772957 res!522698) b!772941))

(assert (= (and b!772941 res!522689) b!772948))

(assert (= (and b!772948 res!522686) b!772955))

(assert (= (and b!772955 res!522691) b!772959))

(assert (= (and b!772959 res!522688) b!772943))

(assert (= (and b!772943 res!522690) b!772951))

(assert (= (and b!772951 c!85527) b!772952))

(assert (= (and b!772951 (not c!85527)) b!772950))

(assert (= (and b!772951 res!522684) b!772956))

(assert (= (and b!772956 res!522687) b!772942))

(assert (= (and b!772942 res!522692) b!772947))

(assert (= (and b!772947 res!522697) b!772958))

(assert (= (and b!772942 (not res!522693)) b!772940))

(assert (= (and b!772940 c!85528) b!772944))

(assert (= (and b!772940 (not c!85528)) b!772953))

(declare-fun m!717735 () Bool)

(assert (=> b!772959 m!717735))

(assert (=> b!772959 m!717735))

(declare-fun m!717737 () Bool)

(assert (=> b!772959 m!717737))

(assert (=> b!772959 m!717737))

(assert (=> b!772959 m!717735))

(declare-fun m!717739 () Bool)

(assert (=> b!772959 m!717739))

(declare-fun m!717741 () Bool)

(assert (=> b!772957 m!717741))

(declare-fun m!717743 () Bool)

(assert (=> b!772942 m!717743))

(declare-fun m!717745 () Bool)

(assert (=> b!772942 m!717745))

(assert (=> b!772952 m!717735))

(assert (=> b!772952 m!717735))

(declare-fun m!717747 () Bool)

(assert (=> b!772952 m!717747))

(declare-fun m!717749 () Bool)

(assert (=> b!772946 m!717749))

(assert (=> b!772958 m!717735))

(assert (=> b!772958 m!717735))

(declare-fun m!717751 () Bool)

(assert (=> b!772958 m!717751))

(declare-fun m!717753 () Bool)

(assert (=> b!772943 m!717753))

(declare-fun m!717755 () Bool)

(assert (=> b!772956 m!717755))

(declare-fun m!717757 () Bool)

(assert (=> b!772956 m!717757))

(declare-fun m!717759 () Bool)

(assert (=> b!772956 m!717759))

(declare-fun m!717761 () Bool)

(assert (=> b!772956 m!717761))

(declare-fun m!717763 () Bool)

(assert (=> b!772956 m!717763))

(assert (=> b!772956 m!717757))

(assert (=> b!772944 m!717735))

(assert (=> b!772944 m!717735))

(declare-fun m!717765 () Bool)

(assert (=> b!772944 m!717765))

(declare-fun m!717767 () Bool)

(assert (=> b!772941 m!717767))

(assert (=> b!772950 m!717735))

(assert (=> b!772950 m!717735))

(declare-fun m!717769 () Bool)

(assert (=> b!772950 m!717769))

(declare-fun m!717771 () Bool)

(assert (=> b!772949 m!717771))

(declare-fun m!717773 () Bool)

(assert (=> b!772940 m!717773))

(assert (=> b!772947 m!717735))

(assert (=> b!772947 m!717735))

(declare-fun m!717775 () Bool)

(assert (=> b!772947 m!717775))

(assert (=> b!772953 m!717735))

(assert (=> b!772953 m!717735))

(assert (=> b!772953 m!717769))

(assert (=> b!772953 m!717735))

(declare-fun m!717777 () Bool)

(assert (=> b!772953 m!717777))

(declare-fun m!717779 () Bool)

(assert (=> start!66998 m!717779))

(declare-fun m!717781 () Bool)

(assert (=> start!66998 m!717781))

(declare-fun m!717783 () Bool)

(assert (=> b!772948 m!717783))

(assert (=> b!772945 m!717735))

(assert (=> b!772945 m!717735))

(declare-fun m!717785 () Bool)

(assert (=> b!772945 m!717785))

(check-sat (not b!772959) (not b!772947) (not b!772949) (not b!772957) (not b!772941) (not b!772946) (not start!66998) (not b!772944) (not b!772945) (not b!772942) (not b!772953) (not b!772956) (not b!772958) (not b!772950) (not b!772948) (not b!772952) (not b!772940))
(check-sat)
