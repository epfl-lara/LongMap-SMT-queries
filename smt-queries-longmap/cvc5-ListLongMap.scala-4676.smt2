; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65116 () Bool)

(assert start!65116)

(declare-fun b!734991 () Bool)

(declare-fun e!411249 () Bool)

(declare-fun e!411248 () Bool)

(assert (=> b!734991 (= e!411249 e!411248)))

(declare-fun res!493832 () Bool)

(assert (=> b!734991 (=> (not res!493832) (not e!411248))))

(declare-datatypes ((array!41289 0))(
  ( (array!41290 (arr!19758 (Array (_ BitVec 32) (_ BitVec 64))) (size!20179 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41289)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7358 0))(
  ( (MissingZero!7358 (index!31800 (_ BitVec 32))) (Found!7358 (index!31801 (_ BitVec 32))) (Intermediate!7358 (undefined!8170 Bool) (index!31802 (_ BitVec 32)) (x!62812 (_ BitVec 32))) (Undefined!7358) (MissingVacant!7358 (index!31803 (_ BitVec 32))) )
))
(declare-fun lt!325763 () SeekEntryResult!7358)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41289 (_ BitVec 32)) SeekEntryResult!7358)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!734991 (= res!493832 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19758 a!3186) j!159) mask!3328) (select (arr!19758 a!3186) j!159) a!3186 mask!3328) lt!325763))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!734991 (= lt!325763 (Intermediate!7358 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!734992 () Bool)

(declare-fun res!493828 () Bool)

(declare-fun e!411247 () Bool)

(assert (=> b!734992 (=> (not res!493828) (not e!411247))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!734992 (= res!493828 (validKeyInArray!0 k!2102))))

(declare-fun b!734993 () Bool)

(declare-fun res!493830 () Bool)

(assert (=> b!734993 (=> (not res!493830) (not e!411247))))

(assert (=> b!734993 (= res!493830 (validKeyInArray!0 (select (arr!19758 a!3186) j!159)))))

(declare-fun b!734994 () Bool)

(declare-fun e!411254 () Bool)

(declare-fun e!411253 () Bool)

(assert (=> b!734994 (= e!411254 e!411253)))

(declare-fun res!493822 () Bool)

(assert (=> b!734994 (=> (not res!493822) (not e!411253))))

(declare-fun lt!325761 () SeekEntryResult!7358)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41289 (_ BitVec 32)) SeekEntryResult!7358)

(assert (=> b!734994 (= res!493822 (= (seekEntryOrOpen!0 (select (arr!19758 a!3186) j!159) a!3186 mask!3328) lt!325761))))

(assert (=> b!734994 (= lt!325761 (Found!7358 j!159))))

(declare-fun b!734995 () Bool)

(declare-fun res!493824 () Bool)

(assert (=> b!734995 (=> (not res!493824) (not e!411249))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!734995 (= res!493824 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20179 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20179 a!3186))))))

(declare-fun b!734996 () Bool)

(declare-fun e!411252 () Bool)

(assert (=> b!734996 (= e!411252 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19758 a!3186) j!159) a!3186 mask!3328) lt!325763))))

(declare-fun b!734997 () Bool)

(declare-fun res!493834 () Bool)

(assert (=> b!734997 (=> (not res!493834) (not e!411249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41289 (_ BitVec 32)) Bool)

(assert (=> b!734997 (= res!493834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!734998 () Bool)

(declare-fun res!493838 () Bool)

(assert (=> b!734998 (=> (not res!493838) (not e!411248))))

(assert (=> b!734998 (= res!493838 e!411252)))

(declare-fun c!80965 () Bool)

(assert (=> b!734998 (= c!80965 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!734999 () Bool)

(declare-fun res!493835 () Bool)

(assert (=> b!734999 (=> (not res!493835) (not e!411249))))

(declare-datatypes ((List!13760 0))(
  ( (Nil!13757) (Cons!13756 (h!14828 (_ BitVec 64)) (t!20075 List!13760)) )
))
(declare-fun arrayNoDuplicates!0 (array!41289 (_ BitVec 32) List!13760) Bool)

(assert (=> b!734999 (= res!493835 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13757))))

(declare-fun res!493831 () Bool)

(assert (=> start!65116 (=> (not res!493831) (not e!411247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65116 (= res!493831 (validMask!0 mask!3328))))

(assert (=> start!65116 e!411247))

(assert (=> start!65116 true))

(declare-fun array_inv!15554 (array!41289) Bool)

(assert (=> start!65116 (array_inv!15554 a!3186)))

(declare-fun b!735000 () Bool)

(declare-fun res!493825 () Bool)

(assert (=> b!735000 (=> (not res!493825) (not e!411248))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!735000 (= res!493825 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19758 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735001 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41289 (_ BitVec 32)) SeekEntryResult!7358)

(assert (=> b!735001 (= e!411252 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19758 a!3186) j!159) a!3186 mask!3328) (Found!7358 j!159)))))

(declare-fun b!735002 () Bool)

(declare-fun e!411251 () Bool)

(assert (=> b!735002 (= e!411251 true)))

(declare-fun lt!325767 () SeekEntryResult!7358)

(assert (=> b!735002 (= lt!325767 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19758 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!735003 () Bool)

(assert (=> b!735003 (= e!411247 e!411249)))

(declare-fun res!493823 () Bool)

(assert (=> b!735003 (=> (not res!493823) (not e!411249))))

(declare-fun lt!325765 () SeekEntryResult!7358)

(assert (=> b!735003 (= res!493823 (or (= lt!325765 (MissingZero!7358 i!1173)) (= lt!325765 (MissingVacant!7358 i!1173))))))

(assert (=> b!735003 (= lt!325765 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!735004 () Bool)

(declare-fun e!411245 () Bool)

(assert (=> b!735004 (= e!411245 e!411251)))

(declare-fun res!493829 () Bool)

(assert (=> b!735004 (=> res!493829 e!411251)))

(assert (=> b!735004 (= res!493829 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!325766 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735004 (= lt!325766 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!735005 () Bool)

(declare-fun e!411250 () Bool)

(assert (=> b!735005 (= e!411250 (not e!411245))))

(declare-fun res!493826 () Bool)

(assert (=> b!735005 (=> res!493826 e!411245)))

(declare-fun lt!325762 () SeekEntryResult!7358)

(assert (=> b!735005 (= res!493826 (or (not (is-Intermediate!7358 lt!325762)) (bvsge x!1131 (x!62812 lt!325762))))))

(assert (=> b!735005 e!411254))

(declare-fun res!493827 () Bool)

(assert (=> b!735005 (=> (not res!493827) (not e!411254))))

(assert (=> b!735005 (= res!493827 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25034 0))(
  ( (Unit!25035) )
))
(declare-fun lt!325769 () Unit!25034)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41289 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25034)

(assert (=> b!735005 (= lt!325769 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!735006 () Bool)

(assert (=> b!735006 (= e!411248 e!411250)))

(declare-fun res!493837 () Bool)

(assert (=> b!735006 (=> (not res!493837) (not e!411250))))

(declare-fun lt!325764 () SeekEntryResult!7358)

(assert (=> b!735006 (= res!493837 (= lt!325764 lt!325762))))

(declare-fun lt!325768 () array!41289)

(declare-fun lt!325760 () (_ BitVec 64))

(assert (=> b!735006 (= lt!325762 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325760 lt!325768 mask!3328))))

(assert (=> b!735006 (= lt!325764 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325760 mask!3328) lt!325760 lt!325768 mask!3328))))

(assert (=> b!735006 (= lt!325760 (select (store (arr!19758 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!735006 (= lt!325768 (array!41290 (store (arr!19758 a!3186) i!1173 k!2102) (size!20179 a!3186)))))

(declare-fun b!735007 () Bool)

(declare-fun res!493833 () Bool)

(assert (=> b!735007 (=> (not res!493833) (not e!411247))))

(assert (=> b!735007 (= res!493833 (and (= (size!20179 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20179 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20179 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!735008 () Bool)

(assert (=> b!735008 (= e!411253 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19758 a!3186) j!159) a!3186 mask!3328) lt!325761))))

(declare-fun b!735009 () Bool)

(declare-fun res!493836 () Bool)

(assert (=> b!735009 (=> (not res!493836) (not e!411247))))

(declare-fun arrayContainsKey!0 (array!41289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735009 (= res!493836 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65116 res!493831) b!735007))

(assert (= (and b!735007 res!493833) b!734993))

(assert (= (and b!734993 res!493830) b!734992))

(assert (= (and b!734992 res!493828) b!735009))

(assert (= (and b!735009 res!493836) b!735003))

(assert (= (and b!735003 res!493823) b!734997))

(assert (= (and b!734997 res!493834) b!734999))

(assert (= (and b!734999 res!493835) b!734995))

(assert (= (and b!734995 res!493824) b!734991))

(assert (= (and b!734991 res!493832) b!735000))

(assert (= (and b!735000 res!493825) b!734998))

(assert (= (and b!734998 c!80965) b!734996))

(assert (= (and b!734998 (not c!80965)) b!735001))

(assert (= (and b!734998 res!493838) b!735006))

(assert (= (and b!735006 res!493837) b!735005))

(assert (= (and b!735005 res!493827) b!734994))

(assert (= (and b!734994 res!493822) b!735008))

(assert (= (and b!735005 (not res!493826)) b!735004))

(assert (= (and b!735004 (not res!493829)) b!735002))

(declare-fun m!687475 () Bool)

(assert (=> b!734997 m!687475))

(declare-fun m!687477 () Bool)

(assert (=> b!735000 m!687477))

(declare-fun m!687479 () Bool)

(assert (=> b!734991 m!687479))

(assert (=> b!734991 m!687479))

(declare-fun m!687481 () Bool)

(assert (=> b!734991 m!687481))

(assert (=> b!734991 m!687481))

(assert (=> b!734991 m!687479))

(declare-fun m!687483 () Bool)

(assert (=> b!734991 m!687483))

(declare-fun m!687485 () Bool)

(assert (=> b!735003 m!687485))

(declare-fun m!687487 () Bool)

(assert (=> b!734992 m!687487))

(declare-fun m!687489 () Bool)

(assert (=> b!735006 m!687489))

(declare-fun m!687491 () Bool)

(assert (=> b!735006 m!687491))

(declare-fun m!687493 () Bool)

(assert (=> b!735006 m!687493))

(assert (=> b!735006 m!687493))

(declare-fun m!687495 () Bool)

(assert (=> b!735006 m!687495))

(declare-fun m!687497 () Bool)

(assert (=> b!735006 m!687497))

(declare-fun m!687499 () Bool)

(assert (=> b!735004 m!687499))

(assert (=> b!734996 m!687479))

(assert (=> b!734996 m!687479))

(declare-fun m!687501 () Bool)

(assert (=> b!734996 m!687501))

(assert (=> b!734993 m!687479))

(assert (=> b!734993 m!687479))

(declare-fun m!687503 () Bool)

(assert (=> b!734993 m!687503))

(declare-fun m!687505 () Bool)

(assert (=> b!734999 m!687505))

(declare-fun m!687507 () Bool)

(assert (=> b!735005 m!687507))

(declare-fun m!687509 () Bool)

(assert (=> b!735005 m!687509))

(assert (=> b!735001 m!687479))

(assert (=> b!735001 m!687479))

(declare-fun m!687511 () Bool)

(assert (=> b!735001 m!687511))

(assert (=> b!734994 m!687479))

(assert (=> b!734994 m!687479))

(declare-fun m!687513 () Bool)

(assert (=> b!734994 m!687513))

(assert (=> b!735008 m!687479))

(assert (=> b!735008 m!687479))

(declare-fun m!687515 () Bool)

(assert (=> b!735008 m!687515))

(declare-fun m!687517 () Bool)

(assert (=> start!65116 m!687517))

(declare-fun m!687519 () Bool)

(assert (=> start!65116 m!687519))

(assert (=> b!735002 m!687479))

(assert (=> b!735002 m!687479))

(assert (=> b!735002 m!687511))

(declare-fun m!687521 () Bool)

(assert (=> b!735009 m!687521))

(push 1)

