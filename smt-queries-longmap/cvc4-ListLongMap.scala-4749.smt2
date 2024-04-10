; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65558 () Bool)

(assert start!65558)

(declare-fun res!505170 () Bool)

(declare-fun e!417897 () Bool)

(assert (=> start!65558 (=> (not res!505170) (not e!417897))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65558 (= res!505170 (validMask!0 mask!3328))))

(assert (=> start!65558 e!417897))

(assert (=> start!65558 true))

(declare-datatypes ((array!41731 0))(
  ( (array!41732 (arr!19979 (Array (_ BitVec 32) (_ BitVec 64))) (size!20400 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41731)

(declare-fun array_inv!15775 (array!41731) Bool)

(assert (=> start!65558 (array_inv!15775 a!3186)))

(declare-fun b!748801 () Bool)

(declare-fun res!505164 () Bool)

(declare-fun e!417899 () Bool)

(assert (=> b!748801 (=> (not res!505164) (not e!417899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41731 (_ BitVec 32)) Bool)

(assert (=> b!748801 (= res!505164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7579 0))(
  ( (MissingZero!7579 (index!32684 (_ BitVec 32))) (Found!7579 (index!32685 (_ BitVec 32))) (Intermediate!7579 (undefined!8391 Bool) (index!32686 (_ BitVec 32)) (x!63617 (_ BitVec 32))) (Undefined!7579) (MissingVacant!7579 (index!32687 (_ BitVec 32))) )
))
(declare-fun lt!332879 () SeekEntryResult!7579)

(declare-fun b!748802 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!417898 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41731 (_ BitVec 32)) SeekEntryResult!7579)

(assert (=> b!748802 (= e!417898 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19979 a!3186) j!159) a!3186 mask!3328) lt!332879))))

(declare-fun b!748803 () Bool)

(declare-fun res!505166 () Bool)

(assert (=> b!748803 (=> (not res!505166) (not e!417897))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41731 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748803 (= res!505166 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748804 () Bool)

(declare-fun res!505171 () Bool)

(assert (=> b!748804 (=> (not res!505171) (not e!417899))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!748804 (= res!505171 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20400 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20400 a!3186))))))

(declare-fun b!748805 () Bool)

(declare-fun e!417894 () Bool)

(assert (=> b!748805 (= e!417899 e!417894)))

(declare-fun res!505161 () Bool)

(assert (=> b!748805 (=> (not res!505161) (not e!417894))))

(declare-fun lt!332884 () SeekEntryResult!7579)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41731 (_ BitVec 32)) SeekEntryResult!7579)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748805 (= res!505161 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19979 a!3186) j!159) mask!3328) (select (arr!19979 a!3186) j!159) a!3186 mask!3328) lt!332884))))

(assert (=> b!748805 (= lt!332884 (Intermediate!7579 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748806 () Bool)

(declare-datatypes ((Unit!25696 0))(
  ( (Unit!25697) )
))
(declare-fun e!417896 () Unit!25696)

(declare-fun Unit!25698 () Unit!25696)

(assert (=> b!748806 (= e!417896 Unit!25698)))

(declare-fun b!748807 () Bool)

(declare-fun res!505168 () Bool)

(assert (=> b!748807 (=> (not res!505168) (not e!417897))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!748807 (= res!505168 (and (= (size!20400 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20400 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20400 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!417900 () Bool)

(declare-fun b!748808 () Bool)

(assert (=> b!748808 (= e!417900 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19979 a!3186) j!159) a!3186 mask!3328) lt!332884))))

(declare-fun b!748809 () Bool)

(declare-fun e!417895 () Bool)

(assert (=> b!748809 (= e!417895 true)))

(assert (=> b!748809 (= (select (store (arr!19979 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332883 () Unit!25696)

(assert (=> b!748809 (= lt!332883 e!417896)))

(declare-fun c!82204 () Bool)

(assert (=> b!748809 (= c!82204 (= (select (store (arr!19979 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748810 () Bool)

(declare-fun e!417901 () Bool)

(assert (=> b!748810 (= e!417901 (not e!417895))))

(declare-fun res!505158 () Bool)

(assert (=> b!748810 (=> res!505158 e!417895)))

(declare-fun lt!332882 () SeekEntryResult!7579)

(assert (=> b!748810 (= res!505158 (or (not (is-Intermediate!7579 lt!332882)) (bvslt x!1131 (x!63617 lt!332882)) (not (= x!1131 (x!63617 lt!332882))) (not (= index!1321 (index!32686 lt!332882)))))))

(assert (=> b!748810 e!417898))

(declare-fun res!505163 () Bool)

(assert (=> b!748810 (=> (not res!505163) (not e!417898))))

(declare-fun lt!332881 () SeekEntryResult!7579)

(assert (=> b!748810 (= res!505163 (= lt!332881 lt!332879))))

(assert (=> b!748810 (= lt!332879 (Found!7579 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41731 (_ BitVec 32)) SeekEntryResult!7579)

(assert (=> b!748810 (= lt!332881 (seekEntryOrOpen!0 (select (arr!19979 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!748810 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332877 () Unit!25696)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25696)

(assert (=> b!748810 (= lt!332877 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748811 () Bool)

(assert (=> b!748811 (= e!417900 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19979 a!3186) j!159) a!3186 mask!3328) (Found!7579 j!159)))))

(declare-fun b!748812 () Bool)

(declare-fun res!505157 () Bool)

(assert (=> b!748812 (=> (not res!505157) (not e!417897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748812 (= res!505157 (validKeyInArray!0 (select (arr!19979 a!3186) j!159)))))

(declare-fun b!748813 () Bool)

(assert (=> b!748813 (= e!417897 e!417899)))

(declare-fun res!505167 () Bool)

(assert (=> b!748813 (=> (not res!505167) (not e!417899))))

(declare-fun lt!332878 () SeekEntryResult!7579)

(assert (=> b!748813 (= res!505167 (or (= lt!332878 (MissingZero!7579 i!1173)) (= lt!332878 (MissingVacant!7579 i!1173))))))

(assert (=> b!748813 (= lt!332878 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!748814 () Bool)

(declare-fun res!505169 () Bool)

(assert (=> b!748814 (=> res!505169 e!417895)))

(assert (=> b!748814 (= res!505169 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19979 a!3186) j!159) a!3186 mask!3328) lt!332879)))))

(declare-fun b!748815 () Bool)

(declare-fun res!505165 () Bool)

(assert (=> b!748815 (=> (not res!505165) (not e!417894))))

(assert (=> b!748815 (= res!505165 e!417900)))

(declare-fun c!82203 () Bool)

(assert (=> b!748815 (= c!82203 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748816 () Bool)

(assert (=> b!748816 (= e!417894 e!417901)))

(declare-fun res!505172 () Bool)

(assert (=> b!748816 (=> (not res!505172) (not e!417901))))

(declare-fun lt!332876 () SeekEntryResult!7579)

(assert (=> b!748816 (= res!505172 (= lt!332876 lt!332882))))

(declare-fun lt!332880 () (_ BitVec 64))

(declare-fun lt!332885 () array!41731)

(assert (=> b!748816 (= lt!332882 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332880 lt!332885 mask!3328))))

(assert (=> b!748816 (= lt!332876 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332880 mask!3328) lt!332880 lt!332885 mask!3328))))

(assert (=> b!748816 (= lt!332880 (select (store (arr!19979 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!748816 (= lt!332885 (array!41732 (store (arr!19979 a!3186) i!1173 k!2102) (size!20400 a!3186)))))

(declare-fun b!748817 () Bool)

(declare-fun res!505162 () Bool)

(assert (=> b!748817 (=> (not res!505162) (not e!417897))))

(assert (=> b!748817 (= res!505162 (validKeyInArray!0 k!2102))))

(declare-fun b!748818 () Bool)

(declare-fun Unit!25699 () Unit!25696)

(assert (=> b!748818 (= e!417896 Unit!25699)))

(assert (=> b!748818 false))

(declare-fun b!748819 () Bool)

(declare-fun res!505156 () Bool)

(assert (=> b!748819 (=> (not res!505156) (not e!417894))))

(assert (=> b!748819 (= res!505156 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19979 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748820 () Bool)

(declare-fun res!505159 () Bool)

(assert (=> b!748820 (=> res!505159 e!417895)))

(assert (=> b!748820 (= res!505159 (= (select (store (arr!19979 a!3186) i!1173 k!2102) index!1321) lt!332880))))

(declare-fun b!748821 () Bool)

(declare-fun res!505160 () Bool)

(assert (=> b!748821 (=> (not res!505160) (not e!417899))))

(declare-datatypes ((List!13981 0))(
  ( (Nil!13978) (Cons!13977 (h!15049 (_ BitVec 64)) (t!20296 List!13981)) )
))
(declare-fun arrayNoDuplicates!0 (array!41731 (_ BitVec 32) List!13981) Bool)

(assert (=> b!748821 (= res!505160 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13978))))

(assert (= (and start!65558 res!505170) b!748807))

(assert (= (and b!748807 res!505168) b!748812))

(assert (= (and b!748812 res!505157) b!748817))

(assert (= (and b!748817 res!505162) b!748803))

(assert (= (and b!748803 res!505166) b!748813))

(assert (= (and b!748813 res!505167) b!748801))

(assert (= (and b!748801 res!505164) b!748821))

(assert (= (and b!748821 res!505160) b!748804))

(assert (= (and b!748804 res!505171) b!748805))

(assert (= (and b!748805 res!505161) b!748819))

(assert (= (and b!748819 res!505156) b!748815))

(assert (= (and b!748815 c!82203) b!748808))

(assert (= (and b!748815 (not c!82203)) b!748811))

(assert (= (and b!748815 res!505165) b!748816))

(assert (= (and b!748816 res!505172) b!748810))

(assert (= (and b!748810 res!505163) b!748802))

(assert (= (and b!748810 (not res!505158)) b!748814))

(assert (= (and b!748814 (not res!505169)) b!748820))

(assert (= (and b!748820 (not res!505159)) b!748809))

(assert (= (and b!748809 c!82204) b!748818))

(assert (= (and b!748809 (not c!82204)) b!748806))

(declare-fun m!698557 () Bool)

(assert (=> start!65558 m!698557))

(declare-fun m!698559 () Bool)

(assert (=> start!65558 m!698559))

(declare-fun m!698561 () Bool)

(assert (=> b!748814 m!698561))

(assert (=> b!748814 m!698561))

(declare-fun m!698563 () Bool)

(assert (=> b!748814 m!698563))

(declare-fun m!698565 () Bool)

(assert (=> b!748803 m!698565))

(declare-fun m!698567 () Bool)

(assert (=> b!748816 m!698567))

(declare-fun m!698569 () Bool)

(assert (=> b!748816 m!698569))

(assert (=> b!748816 m!698567))

(declare-fun m!698571 () Bool)

(assert (=> b!748816 m!698571))

(declare-fun m!698573 () Bool)

(assert (=> b!748816 m!698573))

(declare-fun m!698575 () Bool)

(assert (=> b!748816 m!698575))

(assert (=> b!748820 m!698571))

(declare-fun m!698577 () Bool)

(assert (=> b!748820 m!698577))

(assert (=> b!748811 m!698561))

(assert (=> b!748811 m!698561))

(assert (=> b!748811 m!698563))

(declare-fun m!698579 () Bool)

(assert (=> b!748817 m!698579))

(assert (=> b!748808 m!698561))

(assert (=> b!748808 m!698561))

(declare-fun m!698581 () Bool)

(assert (=> b!748808 m!698581))

(declare-fun m!698583 () Bool)

(assert (=> b!748819 m!698583))

(assert (=> b!748812 m!698561))

(assert (=> b!748812 m!698561))

(declare-fun m!698585 () Bool)

(assert (=> b!748812 m!698585))

(assert (=> b!748810 m!698561))

(assert (=> b!748810 m!698561))

(declare-fun m!698587 () Bool)

(assert (=> b!748810 m!698587))

(declare-fun m!698589 () Bool)

(assert (=> b!748810 m!698589))

(declare-fun m!698591 () Bool)

(assert (=> b!748810 m!698591))

(assert (=> b!748805 m!698561))

(assert (=> b!748805 m!698561))

(declare-fun m!698593 () Bool)

(assert (=> b!748805 m!698593))

(assert (=> b!748805 m!698593))

(assert (=> b!748805 m!698561))

(declare-fun m!698595 () Bool)

(assert (=> b!748805 m!698595))

(declare-fun m!698597 () Bool)

(assert (=> b!748813 m!698597))

(declare-fun m!698599 () Bool)

(assert (=> b!748801 m!698599))

(assert (=> b!748809 m!698571))

(assert (=> b!748809 m!698577))

(declare-fun m!698601 () Bool)

(assert (=> b!748821 m!698601))

(assert (=> b!748802 m!698561))

(assert (=> b!748802 m!698561))

(declare-fun m!698603 () Bool)

(assert (=> b!748802 m!698603))

(push 1)

