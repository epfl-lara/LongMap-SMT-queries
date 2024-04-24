; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65736 () Bool)

(assert start!65736)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41779 0))(
  ( (array!41780 (arr!19999 (Array (_ BitVec 32) (_ BitVec 64))) (size!20419 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41779)

(declare-fun e!419174 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!751186 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7555 0))(
  ( (MissingZero!7555 (index!32588 (_ BitVec 32))) (Found!7555 (index!32589 (_ BitVec 32))) (Intermediate!7555 (undefined!8367 Bool) (index!32590 (_ BitVec 32)) (x!63677 (_ BitVec 32))) (Undefined!7555) (MissingVacant!7555 (index!32591 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41779 (_ BitVec 32)) SeekEntryResult!7555)

(assert (=> b!751186 (= e!419174 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19999 a!3186) j!159) a!3186 mask!3328) (Found!7555 j!159)))))

(declare-fun b!751187 () Bool)

(declare-fun e!419169 () Bool)

(declare-fun e!419175 () Bool)

(assert (=> b!751187 (= e!419169 e!419175)))

(declare-fun res!506803 () Bool)

(assert (=> b!751187 (=> (not res!506803) (not e!419175))))

(declare-fun lt!333997 () SeekEntryResult!7555)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41779 (_ BitVec 32)) SeekEntryResult!7555)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751187 (= res!506803 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19999 a!3186) j!159) mask!3328) (select (arr!19999 a!3186) j!159) a!3186 mask!3328) lt!333997))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!751187 (= lt!333997 (Intermediate!7555 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751188 () Bool)

(declare-fun res!506815 () Bool)

(declare-fun e!419177 () Bool)

(assert (=> b!751188 (=> (not res!506815) (not e!419177))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751188 (= res!506815 (validKeyInArray!0 k0!2102))))

(declare-fun b!751189 () Bool)

(declare-datatypes ((Unit!25777 0))(
  ( (Unit!25778) )
))
(declare-fun e!419176 () Unit!25777)

(declare-fun Unit!25779 () Unit!25777)

(assert (=> b!751189 (= e!419176 Unit!25779)))

(declare-fun b!751190 () Bool)

(assert (=> b!751190 (= e!419177 e!419169)))

(declare-fun res!506805 () Bool)

(assert (=> b!751190 (=> (not res!506805) (not e!419169))))

(declare-fun lt!334000 () SeekEntryResult!7555)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!751190 (= res!506805 (or (= lt!334000 (MissingZero!7555 i!1173)) (= lt!334000 (MissingVacant!7555 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41779 (_ BitVec 32)) SeekEntryResult!7555)

(assert (=> b!751190 (= lt!334000 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!751191 () Bool)

(declare-fun Unit!25780 () Unit!25777)

(assert (=> b!751191 (= e!419176 Unit!25780)))

(assert (=> b!751191 false))

(declare-fun b!751192 () Bool)

(declare-fun res!506804 () Bool)

(assert (=> b!751192 (=> (not res!506804) (not e!419175))))

(assert (=> b!751192 (= res!506804 e!419174)))

(declare-fun c!82576 () Bool)

(assert (=> b!751192 (= c!82576 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751193 () Bool)

(declare-fun res!506809 () Bool)

(assert (=> b!751193 (=> (not res!506809) (not e!419177))))

(assert (=> b!751193 (= res!506809 (validKeyInArray!0 (select (arr!19999 a!3186) j!159)))))

(declare-fun b!751194 () Bool)

(declare-fun e!419171 () Bool)

(assert (=> b!751194 (= e!419175 e!419171)))

(declare-fun res!506806 () Bool)

(assert (=> b!751194 (=> (not res!506806) (not e!419171))))

(declare-fun lt!334004 () SeekEntryResult!7555)

(declare-fun lt!333995 () SeekEntryResult!7555)

(assert (=> b!751194 (= res!506806 (= lt!334004 lt!333995))))

(declare-fun lt!334001 () array!41779)

(declare-fun lt!334003 () (_ BitVec 64))

(assert (=> b!751194 (= lt!333995 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334003 lt!334001 mask!3328))))

(assert (=> b!751194 (= lt!334004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334003 mask!3328) lt!334003 lt!334001 mask!3328))))

(assert (=> b!751194 (= lt!334003 (select (store (arr!19999 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!751194 (= lt!334001 (array!41780 (store (arr!19999 a!3186) i!1173 k0!2102) (size!20419 a!3186)))))

(declare-fun res!506814 () Bool)

(assert (=> start!65736 (=> (not res!506814) (not e!419177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65736 (= res!506814 (validMask!0 mask!3328))))

(assert (=> start!65736 e!419177))

(assert (=> start!65736 true))

(declare-fun array_inv!15858 (array!41779) Bool)

(assert (=> start!65736 (array_inv!15858 a!3186)))

(declare-fun b!751195 () Bool)

(declare-fun res!506801 () Bool)

(assert (=> b!751195 (=> (not res!506801) (not e!419169))))

(assert (=> b!751195 (= res!506801 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20419 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20419 a!3186))))))

(declare-fun b!751196 () Bool)

(declare-fun e!419172 () Bool)

(assert (=> b!751196 (= e!419172 true)))

(declare-fun e!419178 () Bool)

(assert (=> b!751196 e!419178))

(declare-fun res!506816 () Bool)

(assert (=> b!751196 (=> (not res!506816) (not e!419178))))

(declare-fun lt!333999 () (_ BitVec 64))

(assert (=> b!751196 (= res!506816 (= lt!333999 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333996 () Unit!25777)

(assert (=> b!751196 (= lt!333996 e!419176)))

(declare-fun c!82577 () Bool)

(assert (=> b!751196 (= c!82577 (= lt!333999 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751197 () Bool)

(declare-fun res!506818 () Bool)

(assert (=> b!751197 (=> (not res!506818) (not e!419177))))

(declare-fun arrayContainsKey!0 (array!41779 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751197 (= res!506818 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751198 () Bool)

(declare-fun e!419173 () Bool)

(assert (=> b!751198 (= e!419173 e!419172)))

(declare-fun res!506817 () Bool)

(assert (=> b!751198 (=> res!506817 e!419172)))

(assert (=> b!751198 (= res!506817 (= lt!333999 lt!334003))))

(assert (=> b!751198 (= lt!333999 (select (store (arr!19999 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!751199 () Bool)

(assert (=> b!751199 (= e!419174 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19999 a!3186) j!159) a!3186 mask!3328) lt!333997))))

(declare-fun b!751200 () Bool)

(declare-fun res!506812 () Bool)

(assert (=> b!751200 (=> (not res!506812) (not e!419177))))

(assert (=> b!751200 (= res!506812 (and (= (size!20419 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20419 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20419 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751201 () Bool)

(assert (=> b!751201 (= e!419171 (not e!419173))))

(declare-fun res!506813 () Bool)

(assert (=> b!751201 (=> res!506813 e!419173)))

(get-info :version)

(assert (=> b!751201 (= res!506813 (or (not ((_ is Intermediate!7555) lt!333995)) (bvslt x!1131 (x!63677 lt!333995)) (not (= x!1131 (x!63677 lt!333995))) (not (= index!1321 (index!32590 lt!333995)))))))

(declare-fun e!419168 () Bool)

(assert (=> b!751201 e!419168))

(declare-fun res!506811 () Bool)

(assert (=> b!751201 (=> (not res!506811) (not e!419168))))

(declare-fun lt!333998 () SeekEntryResult!7555)

(declare-fun lt!334005 () SeekEntryResult!7555)

(assert (=> b!751201 (= res!506811 (= lt!333998 lt!334005))))

(assert (=> b!751201 (= lt!334005 (Found!7555 j!159))))

(assert (=> b!751201 (= lt!333998 (seekEntryOrOpen!0 (select (arr!19999 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41779 (_ BitVec 32)) Bool)

(assert (=> b!751201 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334002 () Unit!25777)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41779 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25777)

(assert (=> b!751201 (= lt!334002 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751202 () Bool)

(declare-fun res!506808 () Bool)

(assert (=> b!751202 (=> (not res!506808) (not e!419175))))

(assert (=> b!751202 (= res!506808 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19999 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751203 () Bool)

(assert (=> b!751203 (= e!419168 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19999 a!3186) j!159) a!3186 mask!3328) lt!334005))))

(declare-fun b!751204 () Bool)

(declare-fun res!506802 () Bool)

(assert (=> b!751204 (=> (not res!506802) (not e!419169))))

(declare-datatypes ((List!13908 0))(
  ( (Nil!13905) (Cons!13904 (h!14982 (_ BitVec 64)) (t!20215 List!13908)) )
))
(declare-fun arrayNoDuplicates!0 (array!41779 (_ BitVec 32) List!13908) Bool)

(assert (=> b!751204 (= res!506802 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13905))))

(declare-fun b!751205 () Bool)

(declare-fun res!506807 () Bool)

(assert (=> b!751205 (=> res!506807 e!419173)))

(assert (=> b!751205 (= res!506807 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19999 a!3186) j!159) a!3186 mask!3328) lt!334005)))))

(declare-fun b!751206 () Bool)

(declare-fun res!506810 () Bool)

(assert (=> b!751206 (=> (not res!506810) (not e!419169))))

(assert (=> b!751206 (= res!506810 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751207 () Bool)

(assert (=> b!751207 (= e!419178 (= (seekEntryOrOpen!0 lt!334003 lt!334001 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334003 lt!334001 mask!3328)))))

(assert (= (and start!65736 res!506814) b!751200))

(assert (= (and b!751200 res!506812) b!751193))

(assert (= (and b!751193 res!506809) b!751188))

(assert (= (and b!751188 res!506815) b!751197))

(assert (= (and b!751197 res!506818) b!751190))

(assert (= (and b!751190 res!506805) b!751206))

(assert (= (and b!751206 res!506810) b!751204))

(assert (= (and b!751204 res!506802) b!751195))

(assert (= (and b!751195 res!506801) b!751187))

(assert (= (and b!751187 res!506803) b!751202))

(assert (= (and b!751202 res!506808) b!751192))

(assert (= (and b!751192 c!82576) b!751199))

(assert (= (and b!751192 (not c!82576)) b!751186))

(assert (= (and b!751192 res!506804) b!751194))

(assert (= (and b!751194 res!506806) b!751201))

(assert (= (and b!751201 res!506811) b!751203))

(assert (= (and b!751201 (not res!506813)) b!751205))

(assert (= (and b!751205 (not res!506807)) b!751198))

(assert (= (and b!751198 (not res!506817)) b!751196))

(assert (= (and b!751196 c!82577) b!751191))

(assert (= (and b!751196 (not c!82577)) b!751189))

(assert (= (and b!751196 res!506816) b!751207))

(declare-fun m!700995 () Bool)

(assert (=> b!751187 m!700995))

(assert (=> b!751187 m!700995))

(declare-fun m!700997 () Bool)

(assert (=> b!751187 m!700997))

(assert (=> b!751187 m!700997))

(assert (=> b!751187 m!700995))

(declare-fun m!700999 () Bool)

(assert (=> b!751187 m!700999))

(assert (=> b!751193 m!700995))

(assert (=> b!751193 m!700995))

(declare-fun m!701001 () Bool)

(assert (=> b!751193 m!701001))

(assert (=> b!751201 m!700995))

(assert (=> b!751201 m!700995))

(declare-fun m!701003 () Bool)

(assert (=> b!751201 m!701003))

(declare-fun m!701005 () Bool)

(assert (=> b!751201 m!701005))

(declare-fun m!701007 () Bool)

(assert (=> b!751201 m!701007))

(declare-fun m!701009 () Bool)

(assert (=> b!751197 m!701009))

(assert (=> b!751186 m!700995))

(assert (=> b!751186 m!700995))

(declare-fun m!701011 () Bool)

(assert (=> b!751186 m!701011))

(declare-fun m!701013 () Bool)

(assert (=> b!751188 m!701013))

(assert (=> b!751199 m!700995))

(assert (=> b!751199 m!700995))

(declare-fun m!701015 () Bool)

(assert (=> b!751199 m!701015))

(declare-fun m!701017 () Bool)

(assert (=> b!751207 m!701017))

(declare-fun m!701019 () Bool)

(assert (=> b!751207 m!701019))

(declare-fun m!701021 () Bool)

(assert (=> start!65736 m!701021))

(declare-fun m!701023 () Bool)

(assert (=> start!65736 m!701023))

(assert (=> b!751203 m!700995))

(assert (=> b!751203 m!700995))

(declare-fun m!701025 () Bool)

(assert (=> b!751203 m!701025))

(declare-fun m!701027 () Bool)

(assert (=> b!751202 m!701027))

(declare-fun m!701029 () Bool)

(assert (=> b!751206 m!701029))

(declare-fun m!701031 () Bool)

(assert (=> b!751190 m!701031))

(assert (=> b!751205 m!700995))

(assert (=> b!751205 m!700995))

(assert (=> b!751205 m!701011))

(declare-fun m!701033 () Bool)

(assert (=> b!751198 m!701033))

(declare-fun m!701035 () Bool)

(assert (=> b!751198 m!701035))

(declare-fun m!701037 () Bool)

(assert (=> b!751194 m!701037))

(declare-fun m!701039 () Bool)

(assert (=> b!751194 m!701039))

(declare-fun m!701041 () Bool)

(assert (=> b!751194 m!701041))

(assert (=> b!751194 m!701033))

(assert (=> b!751194 m!701037))

(declare-fun m!701043 () Bool)

(assert (=> b!751194 m!701043))

(declare-fun m!701045 () Bool)

(assert (=> b!751204 m!701045))

(check-sat (not b!751203) (not b!751194) (not b!751197) (not b!751205) (not b!751187) (not b!751186) (not start!65736) (not b!751207) (not b!751201) (not b!751190) (not b!751204) (not b!751193) (not b!751188) (not b!751206) (not b!751199))
(check-sat)
