; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67766 () Bool)

(assert start!67766)

(declare-fun b!787139 () Bool)

(declare-fun e!437548 () Bool)

(declare-fun e!437550 () Bool)

(assert (=> b!787139 (= e!437548 (not e!437550))))

(declare-fun res!533070 () Bool)

(assert (=> b!787139 (=> res!533070 e!437550)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8091 0))(
  ( (MissingZero!8091 (index!34732 (_ BitVec 32))) (Found!8091 (index!34733 (_ BitVec 32))) (Intermediate!8091 (undefined!8903 Bool) (index!34734 (_ BitVec 32)) (x!65671 (_ BitVec 32))) (Undefined!8091) (MissingVacant!8091 (index!34735 (_ BitVec 32))) )
))
(declare-fun lt!351095 () SeekEntryResult!8091)

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!787139 (= res!533070 (or (not ((_ is Intermediate!8091) lt!351095)) (bvslt x!1131 (x!65671 lt!351095)) (not (= x!1131 (x!65671 lt!351095))) (not (= index!1321 (index!34734 lt!351095)))))))

(declare-fun e!437547 () Bool)

(assert (=> b!787139 e!437547))

(declare-fun res!533071 () Bool)

(assert (=> b!787139 (=> (not res!533071) (not e!437547))))

(declare-fun lt!351093 () SeekEntryResult!8091)

(declare-fun lt!351097 () SeekEntryResult!8091)

(assert (=> b!787139 (= res!533071 (= lt!351093 lt!351097))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!787139 (= lt!351097 (Found!8091 j!159))))

(declare-datatypes ((array!42806 0))(
  ( (array!42807 (arr!20491 (Array (_ BitVec 32) (_ BitVec 64))) (size!20912 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42806)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42806 (_ BitVec 32)) SeekEntryResult!8091)

(assert (=> b!787139 (= lt!351093 (seekEntryOrOpen!0 (select (arr!20491 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42806 (_ BitVec 32)) Bool)

(assert (=> b!787139 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27252 0))(
  ( (Unit!27253) )
))
(declare-fun lt!351100 () Unit!27252)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42806 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27252)

(assert (=> b!787139 (= lt!351100 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787140 () Bool)

(declare-fun res!533080 () Bool)

(declare-fun e!437541 () Bool)

(assert (=> b!787140 (=> (not res!533080) (not e!437541))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787140 (= res!533080 (validKeyInArray!0 k0!2102))))

(declare-fun res!533078 () Bool)

(assert (=> start!67766 (=> (not res!533078) (not e!437541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67766 (= res!533078 (validMask!0 mask!3328))))

(assert (=> start!67766 e!437541))

(assert (=> start!67766 true))

(declare-fun array_inv!16287 (array!42806) Bool)

(assert (=> start!67766 (array_inv!16287 a!3186)))

(declare-fun b!787141 () Bool)

(declare-fun res!533074 () Bool)

(assert (=> b!787141 (=> (not res!533074) (not e!437541))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!787141 (= res!533074 (and (= (size!20912 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20912 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20912 a!3186)) (not (= i!1173 j!159))))))

(declare-fun lt!351103 () SeekEntryResult!8091)

(declare-fun e!437546 () Bool)

(declare-fun b!787142 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42806 (_ BitVec 32)) SeekEntryResult!8091)

(assert (=> b!787142 (= e!437546 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20491 a!3186) j!159) a!3186 mask!3328) lt!351103))))

(declare-fun b!787143 () Bool)

(declare-fun res!533076 () Bool)

(declare-fun e!437549 () Bool)

(assert (=> b!787143 (=> (not res!533076) (not e!437549))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787143 (= res!533076 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20912 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20912 a!3186))))))

(declare-fun b!787144 () Bool)

(declare-fun res!533075 () Bool)

(assert (=> b!787144 (=> (not res!533075) (not e!437549))))

(declare-datatypes ((List!14493 0))(
  ( (Nil!14490) (Cons!14489 (h!15612 (_ BitVec 64)) (t!20808 List!14493)) )
))
(declare-fun arrayNoDuplicates!0 (array!42806 (_ BitVec 32) List!14493) Bool)

(assert (=> b!787144 (= res!533075 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14490))))

(declare-fun b!787145 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42806 (_ BitVec 32)) SeekEntryResult!8091)

(assert (=> b!787145 (= e!437547 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20491 a!3186) j!159) a!3186 mask!3328) lt!351097))))

(declare-fun b!787146 () Bool)

(declare-fun e!437542 () Bool)

(declare-fun lt!351094 () SeekEntryResult!8091)

(assert (=> b!787146 (= e!437542 (= lt!351093 lt!351094))))

(declare-fun b!787147 () Bool)

(declare-fun e!437552 () Bool)

(assert (=> b!787147 (= e!437552 e!437548)))

(declare-fun res!533084 () Bool)

(assert (=> b!787147 (=> (not res!533084) (not e!437548))))

(declare-fun lt!351104 () SeekEntryResult!8091)

(assert (=> b!787147 (= res!533084 (= lt!351104 lt!351095))))

(declare-fun lt!351102 () (_ BitVec 64))

(declare-fun lt!351098 () array!42806)

(assert (=> b!787147 (= lt!351095 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351102 lt!351098 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787147 (= lt!351104 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351102 mask!3328) lt!351102 lt!351098 mask!3328))))

(assert (=> b!787147 (= lt!351102 (select (store (arr!20491 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!787147 (= lt!351098 (array!42807 (store (arr!20491 a!3186) i!1173 k0!2102) (size!20912 a!3186)))))

(declare-fun b!787148 () Bool)

(declare-fun e!437544 () Bool)

(declare-fun e!437551 () Bool)

(assert (=> b!787148 (= e!437544 e!437551)))

(declare-fun res!533069 () Bool)

(assert (=> b!787148 (=> res!533069 e!437551)))

(declare-fun lt!351099 () (_ BitVec 64))

(assert (=> b!787148 (= res!533069 (= lt!351099 lt!351102))))

(assert (=> b!787148 (= lt!351099 (select (store (arr!20491 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!787149 () Bool)

(declare-fun e!437543 () Unit!27252)

(declare-fun Unit!27254 () Unit!27252)

(assert (=> b!787149 (= e!437543 Unit!27254)))

(declare-fun b!787150 () Bool)

(declare-fun res!533077 () Bool)

(assert (=> b!787150 (=> (not res!533077) (not e!437541))))

(declare-fun arrayContainsKey!0 (array!42806 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787150 (= res!533077 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787151 () Bool)

(assert (=> b!787151 (= e!437546 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20491 a!3186) j!159) a!3186 mask!3328) (Found!8091 j!159)))))

(declare-fun b!787152 () Bool)

(assert (=> b!787152 (= e!437550 e!437544)))

(declare-fun res!533081 () Bool)

(assert (=> b!787152 (=> res!533081 e!437544)))

(assert (=> b!787152 (= res!533081 (not (= lt!351094 lt!351097)))))

(assert (=> b!787152 (= lt!351094 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20491 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!787153 () Bool)

(declare-fun Unit!27255 () Unit!27252)

(assert (=> b!787153 (= e!437543 Unit!27255)))

(assert (=> b!787153 false))

(declare-fun b!787154 () Bool)

(declare-fun res!533072 () Bool)

(assert (=> b!787154 (=> (not res!533072) (not e!437549))))

(assert (=> b!787154 (= res!533072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787155 () Bool)

(declare-fun res!533066 () Bool)

(assert (=> b!787155 (=> (not res!533066) (not e!437552))))

(assert (=> b!787155 (= res!533066 e!437546)))

(declare-fun c!87445 () Bool)

(assert (=> b!787155 (= c!87445 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787156 () Bool)

(declare-fun res!533068 () Bool)

(assert (=> b!787156 (=> (not res!533068) (not e!437541))))

(assert (=> b!787156 (= res!533068 (validKeyInArray!0 (select (arr!20491 a!3186) j!159)))))

(declare-fun b!787157 () Bool)

(assert (=> b!787157 (= e!437551 true)))

(assert (=> b!787157 e!437542))

(declare-fun res!533073 () Bool)

(assert (=> b!787157 (=> (not res!533073) (not e!437542))))

(assert (=> b!787157 (= res!533073 (= lt!351099 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351101 () Unit!27252)

(assert (=> b!787157 (= lt!351101 e!437543)))

(declare-fun c!87444 () Bool)

(assert (=> b!787157 (= c!87444 (= lt!351099 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787158 () Bool)

(assert (=> b!787158 (= e!437549 e!437552)))

(declare-fun res!533079 () Bool)

(assert (=> b!787158 (=> (not res!533079) (not e!437552))))

(assert (=> b!787158 (= res!533079 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20491 a!3186) j!159) mask!3328) (select (arr!20491 a!3186) j!159) a!3186 mask!3328) lt!351103))))

(assert (=> b!787158 (= lt!351103 (Intermediate!8091 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787159 () Bool)

(assert (=> b!787159 (= e!437541 e!437549)))

(declare-fun res!533083 () Bool)

(assert (=> b!787159 (=> (not res!533083) (not e!437549))))

(declare-fun lt!351096 () SeekEntryResult!8091)

(assert (=> b!787159 (= res!533083 (or (= lt!351096 (MissingZero!8091 i!1173)) (= lt!351096 (MissingVacant!8091 i!1173))))))

(assert (=> b!787159 (= lt!351096 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!787160 () Bool)

(declare-fun res!533082 () Bool)

(assert (=> b!787160 (=> (not res!533082) (not e!437542))))

(assert (=> b!787160 (= res!533082 (= (seekEntryOrOpen!0 lt!351102 lt!351098 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351102 lt!351098 mask!3328)))))

(declare-fun b!787161 () Bool)

(declare-fun res!533067 () Bool)

(assert (=> b!787161 (=> (not res!533067) (not e!437552))))

(assert (=> b!787161 (= res!533067 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20491 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!67766 res!533078) b!787141))

(assert (= (and b!787141 res!533074) b!787156))

(assert (= (and b!787156 res!533068) b!787140))

(assert (= (and b!787140 res!533080) b!787150))

(assert (= (and b!787150 res!533077) b!787159))

(assert (= (and b!787159 res!533083) b!787154))

(assert (= (and b!787154 res!533072) b!787144))

(assert (= (and b!787144 res!533075) b!787143))

(assert (= (and b!787143 res!533076) b!787158))

(assert (= (and b!787158 res!533079) b!787161))

(assert (= (and b!787161 res!533067) b!787155))

(assert (= (and b!787155 c!87445) b!787142))

(assert (= (and b!787155 (not c!87445)) b!787151))

(assert (= (and b!787155 res!533066) b!787147))

(assert (= (and b!787147 res!533084) b!787139))

(assert (= (and b!787139 res!533071) b!787145))

(assert (= (and b!787139 (not res!533070)) b!787152))

(assert (= (and b!787152 (not res!533081)) b!787148))

(assert (= (and b!787148 (not res!533069)) b!787157))

(assert (= (and b!787157 c!87444) b!787153))

(assert (= (and b!787157 (not c!87444)) b!787149))

(assert (= (and b!787157 res!533073) b!787160))

(assert (= (and b!787160 res!533082) b!787146))

(declare-fun m!728793 () Bool)

(assert (=> b!787139 m!728793))

(assert (=> b!787139 m!728793))

(declare-fun m!728795 () Bool)

(assert (=> b!787139 m!728795))

(declare-fun m!728797 () Bool)

(assert (=> b!787139 m!728797))

(declare-fun m!728799 () Bool)

(assert (=> b!787139 m!728799))

(declare-fun m!728801 () Bool)

(assert (=> start!67766 m!728801))

(declare-fun m!728803 () Bool)

(assert (=> start!67766 m!728803))

(assert (=> b!787158 m!728793))

(assert (=> b!787158 m!728793))

(declare-fun m!728805 () Bool)

(assert (=> b!787158 m!728805))

(assert (=> b!787158 m!728805))

(assert (=> b!787158 m!728793))

(declare-fun m!728807 () Bool)

(assert (=> b!787158 m!728807))

(declare-fun m!728809 () Bool)

(assert (=> b!787147 m!728809))

(declare-fun m!728811 () Bool)

(assert (=> b!787147 m!728811))

(declare-fun m!728813 () Bool)

(assert (=> b!787147 m!728813))

(assert (=> b!787147 m!728809))

(declare-fun m!728815 () Bool)

(assert (=> b!787147 m!728815))

(declare-fun m!728817 () Bool)

(assert (=> b!787147 m!728817))

(declare-fun m!728819 () Bool)

(assert (=> b!787150 m!728819))

(assert (=> b!787148 m!728815))

(declare-fun m!728821 () Bool)

(assert (=> b!787148 m!728821))

(declare-fun m!728823 () Bool)

(assert (=> b!787140 m!728823))

(declare-fun m!728825 () Bool)

(assert (=> b!787160 m!728825))

(declare-fun m!728827 () Bool)

(assert (=> b!787160 m!728827))

(declare-fun m!728829 () Bool)

(assert (=> b!787161 m!728829))

(assert (=> b!787151 m!728793))

(assert (=> b!787151 m!728793))

(declare-fun m!728831 () Bool)

(assert (=> b!787151 m!728831))

(declare-fun m!728833 () Bool)

(assert (=> b!787144 m!728833))

(assert (=> b!787145 m!728793))

(assert (=> b!787145 m!728793))

(declare-fun m!728835 () Bool)

(assert (=> b!787145 m!728835))

(assert (=> b!787142 m!728793))

(assert (=> b!787142 m!728793))

(declare-fun m!728837 () Bool)

(assert (=> b!787142 m!728837))

(declare-fun m!728839 () Bool)

(assert (=> b!787154 m!728839))

(assert (=> b!787152 m!728793))

(assert (=> b!787152 m!728793))

(assert (=> b!787152 m!728831))

(assert (=> b!787156 m!728793))

(assert (=> b!787156 m!728793))

(declare-fun m!728841 () Bool)

(assert (=> b!787156 m!728841))

(declare-fun m!728843 () Bool)

(assert (=> b!787159 m!728843))

(check-sat (not b!787154) (not b!787145) (not b!787156) (not b!787139) (not b!787140) (not b!787160) (not b!787150) (not b!787147) (not b!787159) (not b!787144) (not start!67766) (not b!787152) (not b!787151) (not b!787142) (not b!787158))
(check-sat)
