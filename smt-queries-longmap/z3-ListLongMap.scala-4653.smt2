; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64670 () Bool)

(assert start!64670)

(declare-fun b!729138 () Bool)

(declare-fun res!489691 () Bool)

(declare-fun e!408086 () Bool)

(assert (=> b!729138 (=> (not res!489691) (not e!408086))))

(declare-datatypes ((array!41136 0))(
  ( (array!41137 (arr!19688 (Array (_ BitVec 32) (_ BitVec 64))) (size!20109 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41136)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729138 (= res!489691 (validKeyInArray!0 (select (arr!19688 a!3186) j!159)))))

(declare-fun b!729139 () Bool)

(declare-fun e!408091 () Bool)

(declare-fun e!408088 () Bool)

(assert (=> b!729139 (= e!408091 e!408088)))

(declare-fun res!489687 () Bool)

(assert (=> b!729139 (=> (not res!489687) (not e!408088))))

(declare-datatypes ((SeekEntryResult!7285 0))(
  ( (MissingZero!7285 (index!31508 (_ BitVec 32))) (Found!7285 (index!31509 (_ BitVec 32))) (Intermediate!7285 (undefined!8097 Bool) (index!31510 (_ BitVec 32)) (x!62502 (_ BitVec 32))) (Undefined!7285) (MissingVacant!7285 (index!31511 (_ BitVec 32))) )
))
(declare-fun lt!322901 () SeekEntryResult!7285)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41136 (_ BitVec 32)) SeekEntryResult!7285)

(assert (=> b!729139 (= res!489687 (= (seekEntryOrOpen!0 (select (arr!19688 a!3186) j!159) a!3186 mask!3328) lt!322901))))

(assert (=> b!729139 (= lt!322901 (Found!7285 j!159))))

(declare-fun b!729140 () Bool)

(declare-fun res!489701 () Bool)

(declare-fun e!408085 () Bool)

(assert (=> b!729140 (=> (not res!489701) (not e!408085))))

(declare-datatypes ((List!13729 0))(
  ( (Nil!13726) (Cons!13725 (h!14785 (_ BitVec 64)) (t!20035 List!13729)) )
))
(declare-fun arrayNoDuplicates!0 (array!41136 (_ BitVec 32) List!13729) Bool)

(assert (=> b!729140 (= res!489701 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13726))))

(declare-fun b!729141 () Bool)

(declare-fun res!489700 () Bool)

(declare-fun e!408087 () Bool)

(assert (=> b!729141 (=> (not res!489700) (not e!408087))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!729141 (= res!489700 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19688 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729142 () Bool)

(declare-fun res!489702 () Bool)

(assert (=> b!729142 (=> (not res!489702) (not e!408086))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!729142 (= res!489702 (validKeyInArray!0 k0!2102))))

(declare-fun b!729143 () Bool)

(assert (=> b!729143 (= e!408085 e!408087)))

(declare-fun res!489693 () Bool)

(assert (=> b!729143 (=> (not res!489693) (not e!408087))))

(declare-fun lt!322899 () SeekEntryResult!7285)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41136 (_ BitVec 32)) SeekEntryResult!7285)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729143 (= res!489693 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19688 a!3186) j!159) mask!3328) (select (arr!19688 a!3186) j!159) a!3186 mask!3328) lt!322899))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729143 (= lt!322899 (Intermediate!7285 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729144 () Bool)

(declare-fun res!489696 () Bool)

(assert (=> b!729144 (=> (not res!489696) (not e!408085))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!729144 (= res!489696 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20109 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20109 a!3186))))))

(declare-fun b!729145 () Bool)

(declare-fun e!408090 () Bool)

(assert (=> b!729145 (= e!408090 true)))

(declare-fun lt!322903 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729145 (= lt!322903 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!729146 () Bool)

(declare-fun e!408089 () Bool)

(assert (=> b!729146 (= e!408089 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19688 a!3186) j!159) a!3186 mask!3328) lt!322899))))

(declare-fun b!729147 () Bool)

(declare-fun res!489695 () Bool)

(assert (=> b!729147 (=> (not res!489695) (not e!408087))))

(assert (=> b!729147 (= res!489695 e!408089)))

(declare-fun c!80100 () Bool)

(assert (=> b!729147 (= c!80100 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729148 () Bool)

(declare-fun res!489694 () Bool)

(assert (=> b!729148 (=> (not res!489694) (not e!408086))))

(assert (=> b!729148 (= res!489694 (and (= (size!20109 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20109 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20109 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!489690 () Bool)

(assert (=> start!64670 (=> (not res!489690) (not e!408086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64670 (= res!489690 (validMask!0 mask!3328))))

(assert (=> start!64670 e!408086))

(assert (=> start!64670 true))

(declare-fun array_inv!15571 (array!41136) Bool)

(assert (=> start!64670 (array_inv!15571 a!3186)))

(declare-fun b!729149 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41136 (_ BitVec 32)) SeekEntryResult!7285)

(assert (=> b!729149 (= e!408088 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19688 a!3186) j!159) a!3186 mask!3328) lt!322901))))

(declare-fun b!729150 () Bool)

(declare-fun res!489698 () Bool)

(assert (=> b!729150 (=> (not res!489698) (not e!408085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41136 (_ BitVec 32)) Bool)

(assert (=> b!729150 (= res!489698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729151 () Bool)

(declare-fun e!408083 () Bool)

(assert (=> b!729151 (= e!408087 e!408083)))

(declare-fun res!489689 () Bool)

(assert (=> b!729151 (=> (not res!489689) (not e!408083))))

(declare-fun lt!322896 () SeekEntryResult!7285)

(declare-fun lt!322897 () SeekEntryResult!7285)

(assert (=> b!729151 (= res!489689 (= lt!322896 lt!322897))))

(declare-fun lt!322904 () array!41136)

(declare-fun lt!322900 () (_ BitVec 64))

(assert (=> b!729151 (= lt!322897 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322900 lt!322904 mask!3328))))

(assert (=> b!729151 (= lt!322896 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322900 mask!3328) lt!322900 lt!322904 mask!3328))))

(assert (=> b!729151 (= lt!322900 (select (store (arr!19688 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!729151 (= lt!322904 (array!41137 (store (arr!19688 a!3186) i!1173 k0!2102) (size!20109 a!3186)))))

(declare-fun b!729152 () Bool)

(assert (=> b!729152 (= e!408083 (not e!408090))))

(declare-fun res!489692 () Bool)

(assert (=> b!729152 (=> res!489692 e!408090)))

(get-info :version)

(assert (=> b!729152 (= res!489692 (or (not ((_ is Intermediate!7285) lt!322897)) (bvsge x!1131 (x!62502 lt!322897))))))

(assert (=> b!729152 e!408091))

(declare-fun res!489699 () Bool)

(assert (=> b!729152 (=> (not res!489699) (not e!408091))))

(assert (=> b!729152 (= res!489699 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24860 0))(
  ( (Unit!24861) )
))
(declare-fun lt!322902 () Unit!24860)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41136 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24860)

(assert (=> b!729152 (= lt!322902 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729153 () Bool)

(declare-fun res!489697 () Bool)

(assert (=> b!729153 (=> (not res!489697) (not e!408086))))

(declare-fun arrayContainsKey!0 (array!41136 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729153 (= res!489697 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729154 () Bool)

(assert (=> b!729154 (= e!408086 e!408085)))

(declare-fun res!489688 () Bool)

(assert (=> b!729154 (=> (not res!489688) (not e!408085))))

(declare-fun lt!322898 () SeekEntryResult!7285)

(assert (=> b!729154 (= res!489688 (or (= lt!322898 (MissingZero!7285 i!1173)) (= lt!322898 (MissingVacant!7285 i!1173))))))

(assert (=> b!729154 (= lt!322898 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!729155 () Bool)

(assert (=> b!729155 (= e!408089 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19688 a!3186) j!159) a!3186 mask!3328) (Found!7285 j!159)))))

(assert (= (and start!64670 res!489690) b!729148))

(assert (= (and b!729148 res!489694) b!729138))

(assert (= (and b!729138 res!489691) b!729142))

(assert (= (and b!729142 res!489702) b!729153))

(assert (= (and b!729153 res!489697) b!729154))

(assert (= (and b!729154 res!489688) b!729150))

(assert (= (and b!729150 res!489698) b!729140))

(assert (= (and b!729140 res!489701) b!729144))

(assert (= (and b!729144 res!489696) b!729143))

(assert (= (and b!729143 res!489693) b!729141))

(assert (= (and b!729141 res!489700) b!729147))

(assert (= (and b!729147 c!80100) b!729146))

(assert (= (and b!729147 (not c!80100)) b!729155))

(assert (= (and b!729147 res!489695) b!729151))

(assert (= (and b!729151 res!489689) b!729152))

(assert (= (and b!729152 res!489699) b!729139))

(assert (= (and b!729139 res!489687) b!729149))

(assert (= (and b!729152 (not res!489692)) b!729145))

(declare-fun m!682277 () Bool)

(assert (=> b!729149 m!682277))

(assert (=> b!729149 m!682277))

(declare-fun m!682279 () Bool)

(assert (=> b!729149 m!682279))

(declare-fun m!682281 () Bool)

(assert (=> start!64670 m!682281))

(declare-fun m!682283 () Bool)

(assert (=> start!64670 m!682283))

(declare-fun m!682285 () Bool)

(assert (=> b!729140 m!682285))

(declare-fun m!682287 () Bool)

(assert (=> b!729154 m!682287))

(assert (=> b!729143 m!682277))

(assert (=> b!729143 m!682277))

(declare-fun m!682289 () Bool)

(assert (=> b!729143 m!682289))

(assert (=> b!729143 m!682289))

(assert (=> b!729143 m!682277))

(declare-fun m!682291 () Bool)

(assert (=> b!729143 m!682291))

(declare-fun m!682293 () Bool)

(assert (=> b!729145 m!682293))

(declare-fun m!682295 () Bool)

(assert (=> b!729150 m!682295))

(assert (=> b!729146 m!682277))

(assert (=> b!729146 m!682277))

(declare-fun m!682297 () Bool)

(assert (=> b!729146 m!682297))

(declare-fun m!682299 () Bool)

(assert (=> b!729153 m!682299))

(declare-fun m!682301 () Bool)

(assert (=> b!729152 m!682301))

(declare-fun m!682303 () Bool)

(assert (=> b!729152 m!682303))

(declare-fun m!682305 () Bool)

(assert (=> b!729151 m!682305))

(declare-fun m!682307 () Bool)

(assert (=> b!729151 m!682307))

(assert (=> b!729151 m!682305))

(declare-fun m!682309 () Bool)

(assert (=> b!729151 m!682309))

(declare-fun m!682311 () Bool)

(assert (=> b!729151 m!682311))

(declare-fun m!682313 () Bool)

(assert (=> b!729151 m!682313))

(assert (=> b!729139 m!682277))

(assert (=> b!729139 m!682277))

(declare-fun m!682315 () Bool)

(assert (=> b!729139 m!682315))

(assert (=> b!729138 m!682277))

(assert (=> b!729138 m!682277))

(declare-fun m!682317 () Bool)

(assert (=> b!729138 m!682317))

(declare-fun m!682319 () Bool)

(assert (=> b!729141 m!682319))

(declare-fun m!682321 () Bool)

(assert (=> b!729142 m!682321))

(assert (=> b!729155 m!682277))

(assert (=> b!729155 m!682277))

(declare-fun m!682323 () Bool)

(assert (=> b!729155 m!682323))

(check-sat (not b!729152) (not b!729153) (not start!64670) (not b!729143) (not b!729145) (not b!729142) (not b!729154) (not b!729151) (not b!729155) (not b!729139) (not b!729149) (not b!729138) (not b!729140) (not b!729146) (not b!729150))
(check-sat)
