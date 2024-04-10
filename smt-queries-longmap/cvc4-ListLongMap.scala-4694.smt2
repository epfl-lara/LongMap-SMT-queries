; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65228 () Bool)

(assert start!65228)

(declare-fun b!738988 () Bool)

(declare-fun e!413249 () Bool)

(declare-fun e!413257 () Bool)

(assert (=> b!738988 (= e!413249 e!413257)))

(declare-fun res!496853 () Bool)

(assert (=> b!738988 (=> res!496853 e!413257)))

(declare-datatypes ((array!41401 0))(
  ( (array!41402 (arr!19814 (Array (_ BitVec 32) (_ BitVec 64))) (size!20235 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41401)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!328092 () (_ BitVec 32))

(assert (=> b!738988 (= res!496853 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328092 #b00000000000000000000000000000000) (bvsge lt!328092 (size!20235 a!3186))))))

(declare-datatypes ((Unit!25252 0))(
  ( (Unit!25253) )
))
(declare-fun lt!328088 () Unit!25252)

(declare-fun e!413250 () Unit!25252)

(assert (=> b!738988 (= lt!328088 e!413250)))

(declare-fun c!81455 () Bool)

(declare-fun lt!328084 () Bool)

(assert (=> b!738988 (= c!81455 lt!328084)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!738988 (= lt!328084 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738988 (= lt!328092 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!738990 () Bool)

(declare-fun e!413254 () Bool)

(declare-fun e!413253 () Bool)

(assert (=> b!738990 (= e!413254 e!413253)))

(declare-fun res!496845 () Bool)

(assert (=> b!738990 (=> (not res!496845) (not e!413253))))

(declare-datatypes ((SeekEntryResult!7414 0))(
  ( (MissingZero!7414 (index!32024 (_ BitVec 32))) (Found!7414 (index!32025 (_ BitVec 32))) (Intermediate!7414 (undefined!8226 Bool) (index!32026 (_ BitVec 32)) (x!63012 (_ BitVec 32))) (Undefined!7414) (MissingVacant!7414 (index!32027 (_ BitVec 32))) )
))
(declare-fun lt!328090 () SeekEntryResult!7414)

(declare-fun lt!328094 () SeekEntryResult!7414)

(assert (=> b!738990 (= res!496845 (= lt!328090 lt!328094))))

(declare-fun lt!328093 () (_ BitVec 64))

(declare-fun lt!328087 () array!41401)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41401 (_ BitVec 32)) SeekEntryResult!7414)

(assert (=> b!738990 (= lt!328094 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328093 lt!328087 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738990 (= lt!328090 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328093 mask!3328) lt!328093 lt!328087 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!738990 (= lt!328093 (select (store (arr!19814 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!738990 (= lt!328087 (array!41402 (store (arr!19814 a!3186) i!1173 k!2102) (size!20235 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!413255 () Bool)

(declare-fun b!738991 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41401 (_ BitVec 32)) SeekEntryResult!7414)

(assert (=> b!738991 (= e!413255 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19814 a!3186) j!159) a!3186 mask!3328) (Found!7414 j!159)))))

(declare-fun b!738992 () Bool)

(declare-fun res!496846 () Bool)

(declare-fun e!413252 () Bool)

(assert (=> b!738992 (=> (not res!496846) (not e!413252))))

(declare-fun arrayContainsKey!0 (array!41401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738992 (= res!496846 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738993 () Bool)

(declare-fun Unit!25254 () Unit!25252)

(assert (=> b!738993 (= e!413250 Unit!25254)))

(declare-fun lt!328089 () SeekEntryResult!7414)

(assert (=> b!738993 (= lt!328089 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19814 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!328097 () SeekEntryResult!7414)

(assert (=> b!738993 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328092 resIntermediateIndex!5 (select (arr!19814 a!3186) j!159) a!3186 mask!3328) lt!328097)))

(declare-fun b!738994 () Bool)

(declare-fun res!496848 () Bool)

(assert (=> b!738994 (=> (not res!496848) (not e!413252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738994 (= res!496848 (validKeyInArray!0 (select (arr!19814 a!3186) j!159)))))

(declare-fun b!738995 () Bool)

(declare-fun res!496843 () Bool)

(declare-fun e!413247 () Bool)

(assert (=> b!738995 (=> (not res!496843) (not e!413247))))

(assert (=> b!738995 (= res!496843 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20235 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20235 a!3186))))))

(declare-fun b!738996 () Bool)

(declare-fun lt!328095 () SeekEntryResult!7414)

(assert (=> b!738996 (= e!413255 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19814 a!3186) j!159) a!3186 mask!3328) lt!328095))))

(declare-fun b!738997 () Bool)

(declare-fun e!413256 () Bool)

(declare-fun lt!328085 () SeekEntryResult!7414)

(assert (=> b!738997 (= e!413256 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19814 a!3186) j!159) a!3186 mask!3328) lt!328085))))

(declare-fun b!738998 () Bool)

(declare-fun res!496841 () Bool)

(assert (=> b!738998 (=> (not res!496841) (not e!413252))))

(assert (=> b!738998 (= res!496841 (and (= (size!20235 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20235 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20235 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738999 () Bool)

(declare-fun Unit!25255 () Unit!25252)

(assert (=> b!738999 (= e!413250 Unit!25255)))

(assert (=> b!738999 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328092 (select (arr!19814 a!3186) j!159) a!3186 mask!3328) lt!328095)))

(declare-fun b!738989 () Bool)

(declare-fun res!496840 () Bool)

(assert (=> b!738989 (=> (not res!496840) (not e!413247))))

(declare-datatypes ((List!13816 0))(
  ( (Nil!13813) (Cons!13812 (h!14884 (_ BitVec 64)) (t!20131 List!13816)) )
))
(declare-fun arrayNoDuplicates!0 (array!41401 (_ BitVec 32) List!13816) Bool)

(assert (=> b!738989 (= res!496840 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13813))))

(declare-fun res!496844 () Bool)

(assert (=> start!65228 (=> (not res!496844) (not e!413252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65228 (= res!496844 (validMask!0 mask!3328))))

(assert (=> start!65228 e!413252))

(assert (=> start!65228 true))

(declare-fun array_inv!15610 (array!41401) Bool)

(assert (=> start!65228 (array_inv!15610 a!3186)))

(declare-fun b!739000 () Bool)

(declare-fun res!496851 () Bool)

(assert (=> b!739000 (=> res!496851 e!413257)))

(declare-fun e!413248 () Bool)

(assert (=> b!739000 (= res!496851 e!413248)))

(declare-fun c!81456 () Bool)

(assert (=> b!739000 (= c!81456 lt!328084)))

(declare-fun b!739001 () Bool)

(assert (=> b!739001 (= e!413253 (not e!413249))))

(declare-fun res!496854 () Bool)

(assert (=> b!739001 (=> res!496854 e!413249)))

(assert (=> b!739001 (= res!496854 (or (not (is-Intermediate!7414 lt!328094)) (bvsge x!1131 (x!63012 lt!328094))))))

(assert (=> b!739001 (= lt!328097 (Found!7414 j!159))))

(declare-fun e!413258 () Bool)

(assert (=> b!739001 e!413258))

(declare-fun res!496850 () Bool)

(assert (=> b!739001 (=> (not res!496850) (not e!413258))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41401 (_ BitVec 32)) Bool)

(assert (=> b!739001 (= res!496850 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328086 () Unit!25252)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25252)

(assert (=> b!739001 (= lt!328086 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739002 () Bool)

(declare-fun res!496852 () Bool)

(assert (=> b!739002 (=> (not res!496852) (not e!413252))))

(assert (=> b!739002 (= res!496852 (validKeyInArray!0 k!2102))))

(declare-fun b!739003 () Bool)

(declare-fun res!496849 () Bool)

(assert (=> b!739003 (=> (not res!496849) (not e!413254))))

(assert (=> b!739003 (= res!496849 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19814 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!739004 () Bool)

(declare-fun res!496847 () Bool)

(assert (=> b!739004 (=> (not res!496847) (not e!413247))))

(assert (=> b!739004 (= res!496847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!739005 () Bool)

(assert (=> b!739005 (= e!413247 e!413254)))

(declare-fun res!496842 () Bool)

(assert (=> b!739005 (=> (not res!496842) (not e!413254))))

(assert (=> b!739005 (= res!496842 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19814 a!3186) j!159) mask!3328) (select (arr!19814 a!3186) j!159) a!3186 mask!3328) lt!328095))))

(assert (=> b!739005 (= lt!328095 (Intermediate!7414 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!739006 () Bool)

(assert (=> b!739006 (= e!413258 e!413256)))

(declare-fun res!496839 () Bool)

(assert (=> b!739006 (=> (not res!496839) (not e!413256))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41401 (_ BitVec 32)) SeekEntryResult!7414)

(assert (=> b!739006 (= res!496839 (= (seekEntryOrOpen!0 (select (arr!19814 a!3186) j!159) a!3186 mask!3328) lt!328085))))

(assert (=> b!739006 (= lt!328085 (Found!7414 j!159))))

(declare-fun b!739007 () Bool)

(assert (=> b!739007 (= e!413248 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328092 resIntermediateIndex!5 (select (arr!19814 a!3186) j!159) a!3186 mask!3328) lt!328097)))))

(declare-fun b!739008 () Bool)

(declare-fun res!496855 () Bool)

(assert (=> b!739008 (=> (not res!496855) (not e!413254))))

(assert (=> b!739008 (= res!496855 e!413255)))

(declare-fun c!81457 () Bool)

(assert (=> b!739008 (= c!81457 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739009 () Bool)

(assert (=> b!739009 (= e!413252 e!413247)))

(declare-fun res!496856 () Bool)

(assert (=> b!739009 (=> (not res!496856) (not e!413247))))

(declare-fun lt!328091 () SeekEntryResult!7414)

(assert (=> b!739009 (= res!496856 (or (= lt!328091 (MissingZero!7414 i!1173)) (= lt!328091 (MissingVacant!7414 i!1173))))))

(assert (=> b!739009 (= lt!328091 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!739010 () Bool)

(assert (=> b!739010 (= e!413257 true)))

(declare-fun lt!328096 () SeekEntryResult!7414)

(assert (=> b!739010 (= lt!328096 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328092 lt!328093 lt!328087 mask!3328))))

(declare-fun b!739011 () Bool)

(assert (=> b!739011 (= e!413248 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328092 (select (arr!19814 a!3186) j!159) a!3186 mask!3328) lt!328095)))))

(assert (= (and start!65228 res!496844) b!738998))

(assert (= (and b!738998 res!496841) b!738994))

(assert (= (and b!738994 res!496848) b!739002))

(assert (= (and b!739002 res!496852) b!738992))

(assert (= (and b!738992 res!496846) b!739009))

(assert (= (and b!739009 res!496856) b!739004))

(assert (= (and b!739004 res!496847) b!738989))

(assert (= (and b!738989 res!496840) b!738995))

(assert (= (and b!738995 res!496843) b!739005))

(assert (= (and b!739005 res!496842) b!739003))

(assert (= (and b!739003 res!496849) b!739008))

(assert (= (and b!739008 c!81457) b!738996))

(assert (= (and b!739008 (not c!81457)) b!738991))

(assert (= (and b!739008 res!496855) b!738990))

(assert (= (and b!738990 res!496845) b!739001))

(assert (= (and b!739001 res!496850) b!739006))

(assert (= (and b!739006 res!496839) b!738997))

(assert (= (and b!739001 (not res!496854)) b!738988))

(assert (= (and b!738988 c!81455) b!738999))

(assert (= (and b!738988 (not c!81455)) b!738993))

(assert (= (and b!738988 (not res!496853)) b!739000))

(assert (= (and b!739000 c!81456) b!739011))

(assert (= (and b!739000 (not c!81456)) b!739007))

(assert (= (and b!739000 (not res!496851)) b!739010))

(declare-fun m!690481 () Bool)

(assert (=> b!738991 m!690481))

(assert (=> b!738991 m!690481))

(declare-fun m!690483 () Bool)

(assert (=> b!738991 m!690483))

(declare-fun m!690485 () Bool)

(assert (=> b!738989 m!690485))

(declare-fun m!690487 () Bool)

(assert (=> b!739003 m!690487))

(declare-fun m!690489 () Bool)

(assert (=> b!739009 m!690489))

(declare-fun m!690491 () Bool)

(assert (=> b!738990 m!690491))

(declare-fun m!690493 () Bool)

(assert (=> b!738990 m!690493))

(declare-fun m!690495 () Bool)

(assert (=> b!738990 m!690495))

(assert (=> b!738990 m!690491))

(declare-fun m!690497 () Bool)

(assert (=> b!738990 m!690497))

(declare-fun m!690499 () Bool)

(assert (=> b!738990 m!690499))

(assert (=> b!739006 m!690481))

(assert (=> b!739006 m!690481))

(declare-fun m!690501 () Bool)

(assert (=> b!739006 m!690501))

(assert (=> b!738994 m!690481))

(assert (=> b!738994 m!690481))

(declare-fun m!690503 () Bool)

(assert (=> b!738994 m!690503))

(assert (=> b!738996 m!690481))

(assert (=> b!738996 m!690481))

(declare-fun m!690505 () Bool)

(assert (=> b!738996 m!690505))

(declare-fun m!690507 () Bool)

(assert (=> b!739004 m!690507))

(assert (=> b!739005 m!690481))

(assert (=> b!739005 m!690481))

(declare-fun m!690509 () Bool)

(assert (=> b!739005 m!690509))

(assert (=> b!739005 m!690509))

(assert (=> b!739005 m!690481))

(declare-fun m!690511 () Bool)

(assert (=> b!739005 m!690511))

(declare-fun m!690513 () Bool)

(assert (=> start!65228 m!690513))

(declare-fun m!690515 () Bool)

(assert (=> start!65228 m!690515))

(assert (=> b!738997 m!690481))

(assert (=> b!738997 m!690481))

(declare-fun m!690517 () Bool)

(assert (=> b!738997 m!690517))

(declare-fun m!690519 () Bool)

(assert (=> b!738992 m!690519))

(declare-fun m!690521 () Bool)

(assert (=> b!738988 m!690521))

(declare-fun m!690523 () Bool)

(assert (=> b!739001 m!690523))

(declare-fun m!690525 () Bool)

(assert (=> b!739001 m!690525))

(assert (=> b!739011 m!690481))

(assert (=> b!739011 m!690481))

(declare-fun m!690527 () Bool)

(assert (=> b!739011 m!690527))

(assert (=> b!738993 m!690481))

(assert (=> b!738993 m!690481))

(assert (=> b!738993 m!690483))

(assert (=> b!738993 m!690481))

(declare-fun m!690529 () Bool)

(assert (=> b!738993 m!690529))

(assert (=> b!738999 m!690481))

(assert (=> b!738999 m!690481))

(assert (=> b!738999 m!690527))

(declare-fun m!690531 () Bool)

(assert (=> b!739010 m!690531))

(declare-fun m!690533 () Bool)

(assert (=> b!739002 m!690533))

(assert (=> b!739007 m!690481))

(assert (=> b!739007 m!690481))

(assert (=> b!739007 m!690529))

(push 1)

