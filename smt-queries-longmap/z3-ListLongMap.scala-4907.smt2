; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67664 () Bool)

(assert start!67664)

(declare-fun b!784129 () Bool)

(declare-fun res!530694 () Bool)

(declare-fun e!435956 () Bool)

(assert (=> b!784129 (=> (not res!530694) (not e!435956))))

(declare-datatypes ((array!42723 0))(
  ( (array!42724 (arr!20450 (Array (_ BitVec 32) (_ BitVec 64))) (size!20871 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42723)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784129 (= res!530694 (validKeyInArray!0 (select (arr!20450 a!3186) j!159)))))

(declare-fun b!784130 () Bool)

(declare-fun e!435951 () Bool)

(declare-fun e!435957 () Bool)

(assert (=> b!784130 (= e!435951 e!435957)))

(declare-fun res!530690 () Bool)

(assert (=> b!784130 (=> (not res!530690) (not e!435957))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8047 0))(
  ( (MissingZero!8047 (index!34556 (_ BitVec 32))) (Found!8047 (index!34557 (_ BitVec 32))) (Intermediate!8047 (undefined!8859 Bool) (index!34558 (_ BitVec 32)) (x!65518 (_ BitVec 32))) (Undefined!8047) (MissingVacant!8047 (index!34559 (_ BitVec 32))) )
))
(declare-fun lt!349420 () SeekEntryResult!8047)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42723 (_ BitVec 32)) SeekEntryResult!8047)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784130 (= res!530690 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20450 a!3186) j!159) mask!3328) (select (arr!20450 a!3186) j!159) a!3186 mask!3328) lt!349420))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784130 (= lt!349420 (Intermediate!8047 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!530676 () Bool)

(assert (=> start!67664 (=> (not res!530676) (not e!435956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67664 (= res!530676 (validMask!0 mask!3328))))

(assert (=> start!67664 e!435956))

(assert (=> start!67664 true))

(declare-fun array_inv!16333 (array!42723) Bool)

(assert (=> start!67664 (array_inv!16333 a!3186)))

(declare-fun b!784131 () Bool)

(declare-fun res!530684 () Bool)

(assert (=> b!784131 (=> (not res!530684) (not e!435951))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42723 (_ BitVec 32)) Bool)

(assert (=> b!784131 (= res!530684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784132 () Bool)

(declare-fun e!435948 () Bool)

(declare-fun e!435953 () Bool)

(assert (=> b!784132 (= e!435948 e!435953)))

(declare-fun res!530678 () Bool)

(assert (=> b!784132 (=> res!530678 e!435953)))

(declare-fun lt!349415 () SeekEntryResult!8047)

(declare-fun lt!349416 () SeekEntryResult!8047)

(assert (=> b!784132 (= res!530678 (not (= lt!349415 lt!349416)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42723 (_ BitVec 32)) SeekEntryResult!8047)

(assert (=> b!784132 (= lt!349415 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20450 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!784133 () Bool)

(declare-fun e!435947 () Bool)

(assert (=> b!784133 (= e!435947 true)))

(declare-fun e!435958 () Bool)

(assert (=> b!784133 e!435958))

(declare-fun res!530681 () Bool)

(assert (=> b!784133 (=> (not res!530681) (not e!435958))))

(declare-fun lt!349419 () (_ BitVec 64))

(assert (=> b!784133 (= res!530681 (= lt!349419 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27056 0))(
  ( (Unit!27057) )
))
(declare-fun lt!349424 () Unit!27056)

(declare-fun e!435949 () Unit!27056)

(assert (=> b!784133 (= lt!349424 e!435949)))

(declare-fun c!87134 () Bool)

(assert (=> b!784133 (= c!87134 (= lt!349419 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784134 () Bool)

(declare-fun res!530677 () Bool)

(assert (=> b!784134 (=> (not res!530677) (not e!435956))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784134 (= res!530677 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784135 () Bool)

(declare-fun res!530680 () Bool)

(assert (=> b!784135 (=> (not res!530680) (not e!435957))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!784135 (= res!530680 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20450 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784136 () Bool)

(declare-fun res!530683 () Bool)

(assert (=> b!784136 (=> (not res!530683) (not e!435957))))

(declare-fun e!435952 () Bool)

(assert (=> b!784136 (= res!530683 e!435952)))

(declare-fun c!87135 () Bool)

(assert (=> b!784136 (= c!87135 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!784137 () Bool)

(declare-fun e!435950 () Bool)

(assert (=> b!784137 (= e!435950 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20450 a!3186) j!159) a!3186 mask!3328) lt!349416))))

(declare-fun b!784138 () Bool)

(declare-fun res!530686 () Bool)

(assert (=> b!784138 (=> (not res!530686) (not e!435956))))

(assert (=> b!784138 (= res!530686 (and (= (size!20871 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20871 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20871 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784139 () Bool)

(declare-fun e!435954 () Bool)

(assert (=> b!784139 (= e!435957 e!435954)))

(declare-fun res!530688 () Bool)

(assert (=> b!784139 (=> (not res!530688) (not e!435954))))

(declare-fun lt!349414 () SeekEntryResult!8047)

(declare-fun lt!349418 () SeekEntryResult!8047)

(assert (=> b!784139 (= res!530688 (= lt!349414 lt!349418))))

(declare-fun lt!349417 () (_ BitVec 64))

(declare-fun lt!349413 () array!42723)

(assert (=> b!784139 (= lt!349418 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349417 lt!349413 mask!3328))))

(assert (=> b!784139 (= lt!349414 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349417 mask!3328) lt!349417 lt!349413 mask!3328))))

(assert (=> b!784139 (= lt!349417 (select (store (arr!20450 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!784139 (= lt!349413 (array!42724 (store (arr!20450 a!3186) i!1173 k0!2102) (size!20871 a!3186)))))

(declare-fun b!784140 () Bool)

(assert (=> b!784140 (= e!435952 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20450 a!3186) j!159) a!3186 mask!3328) lt!349420))))

(declare-fun b!784141 () Bool)

(declare-fun lt!349423 () SeekEntryResult!8047)

(assert (=> b!784141 (= e!435958 (= lt!349423 lt!349415))))

(declare-fun b!784142 () Bool)

(assert (=> b!784142 (= e!435953 e!435947)))

(declare-fun res!530691 () Bool)

(assert (=> b!784142 (=> res!530691 e!435947)))

(assert (=> b!784142 (= res!530691 (= lt!349419 lt!349417))))

(assert (=> b!784142 (= lt!349419 (select (store (arr!20450 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!784143 () Bool)

(declare-fun res!530685 () Bool)

(assert (=> b!784143 (=> (not res!530685) (not e!435956))))

(assert (=> b!784143 (= res!530685 (validKeyInArray!0 k0!2102))))

(declare-fun b!784144 () Bool)

(declare-fun Unit!27058 () Unit!27056)

(assert (=> b!784144 (= e!435949 Unit!27058)))

(assert (=> b!784144 false))

(declare-fun b!784145 () Bool)

(declare-fun res!530689 () Bool)

(assert (=> b!784145 (=> (not res!530689) (not e!435951))))

(declare-datatypes ((List!14491 0))(
  ( (Nil!14488) (Cons!14487 (h!15610 (_ BitVec 64)) (t!20797 List!14491)) )
))
(declare-fun arrayNoDuplicates!0 (array!42723 (_ BitVec 32) List!14491) Bool)

(assert (=> b!784145 (= res!530689 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14488))))

(declare-fun b!784146 () Bool)

(assert (=> b!784146 (= e!435952 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20450 a!3186) j!159) a!3186 mask!3328) (Found!8047 j!159)))))

(declare-fun b!784147 () Bool)

(declare-fun res!530679 () Bool)

(assert (=> b!784147 (=> (not res!530679) (not e!435958))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42723 (_ BitVec 32)) SeekEntryResult!8047)

(assert (=> b!784147 (= res!530679 (= (seekEntryOrOpen!0 lt!349417 lt!349413 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349417 lt!349413 mask!3328)))))

(declare-fun b!784148 () Bool)

(assert (=> b!784148 (= e!435956 e!435951)))

(declare-fun res!530693 () Bool)

(assert (=> b!784148 (=> (not res!530693) (not e!435951))))

(declare-fun lt!349421 () SeekEntryResult!8047)

(assert (=> b!784148 (= res!530693 (or (= lt!349421 (MissingZero!8047 i!1173)) (= lt!349421 (MissingVacant!8047 i!1173))))))

(assert (=> b!784148 (= lt!349421 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!784149 () Bool)

(assert (=> b!784149 (= e!435954 (not e!435948))))

(declare-fun res!530692 () Bool)

(assert (=> b!784149 (=> res!530692 e!435948)))

(get-info :version)

(assert (=> b!784149 (= res!530692 (or (not ((_ is Intermediate!8047) lt!349418)) (bvslt x!1131 (x!65518 lt!349418)) (not (= x!1131 (x!65518 lt!349418))) (not (= index!1321 (index!34558 lt!349418)))))))

(assert (=> b!784149 e!435950))

(declare-fun res!530682 () Bool)

(assert (=> b!784149 (=> (not res!530682) (not e!435950))))

(assert (=> b!784149 (= res!530682 (= lt!349423 lt!349416))))

(assert (=> b!784149 (= lt!349416 (Found!8047 j!159))))

(assert (=> b!784149 (= lt!349423 (seekEntryOrOpen!0 (select (arr!20450 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!784149 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349422 () Unit!27056)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42723 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27056)

(assert (=> b!784149 (= lt!349422 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784150 () Bool)

(declare-fun res!530687 () Bool)

(assert (=> b!784150 (=> (not res!530687) (not e!435951))))

(assert (=> b!784150 (= res!530687 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20871 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20871 a!3186))))))

(declare-fun b!784151 () Bool)

(declare-fun Unit!27059 () Unit!27056)

(assert (=> b!784151 (= e!435949 Unit!27059)))

(assert (= (and start!67664 res!530676) b!784138))

(assert (= (and b!784138 res!530686) b!784129))

(assert (= (and b!784129 res!530694) b!784143))

(assert (= (and b!784143 res!530685) b!784134))

(assert (= (and b!784134 res!530677) b!784148))

(assert (= (and b!784148 res!530693) b!784131))

(assert (= (and b!784131 res!530684) b!784145))

(assert (= (and b!784145 res!530689) b!784150))

(assert (= (and b!784150 res!530687) b!784130))

(assert (= (and b!784130 res!530690) b!784135))

(assert (= (and b!784135 res!530680) b!784136))

(assert (= (and b!784136 c!87135) b!784140))

(assert (= (and b!784136 (not c!87135)) b!784146))

(assert (= (and b!784136 res!530683) b!784139))

(assert (= (and b!784139 res!530688) b!784149))

(assert (= (and b!784149 res!530682) b!784137))

(assert (= (and b!784149 (not res!530692)) b!784132))

(assert (= (and b!784132 (not res!530678)) b!784142))

(assert (= (and b!784142 (not res!530691)) b!784133))

(assert (= (and b!784133 c!87134) b!784144))

(assert (= (and b!784133 (not c!87134)) b!784151))

(assert (= (and b!784133 res!530681) b!784147))

(assert (= (and b!784147 res!530679) b!784141))

(declare-fun m!725955 () Bool)

(assert (=> b!784137 m!725955))

(assert (=> b!784137 m!725955))

(declare-fun m!725957 () Bool)

(assert (=> b!784137 m!725957))

(assert (=> b!784132 m!725955))

(assert (=> b!784132 m!725955))

(declare-fun m!725959 () Bool)

(assert (=> b!784132 m!725959))

(declare-fun m!725961 () Bool)

(assert (=> b!784142 m!725961))

(declare-fun m!725963 () Bool)

(assert (=> b!784142 m!725963))

(assert (=> b!784149 m!725955))

(assert (=> b!784149 m!725955))

(declare-fun m!725965 () Bool)

(assert (=> b!784149 m!725965))

(declare-fun m!725967 () Bool)

(assert (=> b!784149 m!725967))

(declare-fun m!725969 () Bool)

(assert (=> b!784149 m!725969))

(declare-fun m!725971 () Bool)

(assert (=> b!784143 m!725971))

(assert (=> b!784146 m!725955))

(assert (=> b!784146 m!725955))

(assert (=> b!784146 m!725959))

(declare-fun m!725973 () Bool)

(assert (=> b!784145 m!725973))

(declare-fun m!725975 () Bool)

(assert (=> b!784131 m!725975))

(declare-fun m!725977 () Bool)

(assert (=> b!784147 m!725977))

(declare-fun m!725979 () Bool)

(assert (=> b!784147 m!725979))

(declare-fun m!725981 () Bool)

(assert (=> b!784135 m!725981))

(declare-fun m!725983 () Bool)

(assert (=> start!67664 m!725983))

(declare-fun m!725985 () Bool)

(assert (=> start!67664 m!725985))

(assert (=> b!784130 m!725955))

(assert (=> b!784130 m!725955))

(declare-fun m!725987 () Bool)

(assert (=> b!784130 m!725987))

(assert (=> b!784130 m!725987))

(assert (=> b!784130 m!725955))

(declare-fun m!725989 () Bool)

(assert (=> b!784130 m!725989))

(assert (=> b!784129 m!725955))

(assert (=> b!784129 m!725955))

(declare-fun m!725991 () Bool)

(assert (=> b!784129 m!725991))

(declare-fun m!725993 () Bool)

(assert (=> b!784148 m!725993))

(declare-fun m!725995 () Bool)

(assert (=> b!784139 m!725995))

(declare-fun m!725997 () Bool)

(assert (=> b!784139 m!725997))

(declare-fun m!725999 () Bool)

(assert (=> b!784139 m!725999))

(assert (=> b!784139 m!725961))

(assert (=> b!784139 m!725997))

(declare-fun m!726001 () Bool)

(assert (=> b!784139 m!726001))

(assert (=> b!784140 m!725955))

(assert (=> b!784140 m!725955))

(declare-fun m!726003 () Bool)

(assert (=> b!784140 m!726003))

(declare-fun m!726005 () Bool)

(assert (=> b!784134 m!726005))

(check-sat (not b!784143) (not b!784146) (not b!784132) (not b!784145) (not b!784140) (not b!784139) (not b!784137) (not b!784149) (not b!784131) (not b!784148) (not b!784134) (not b!784129) (not start!67664) (not b!784147) (not b!784130))
(check-sat)
