; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65864 () Bool)

(assert start!65864)

(declare-fun b!759146 () Bool)

(declare-fun e!423229 () Bool)

(declare-fun e!423223 () Bool)

(assert (=> b!759146 (= e!423229 e!423223)))

(declare-fun res!513681 () Bool)

(assert (=> b!759146 (=> (not res!513681) (not e!423223))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!42037 0))(
  ( (array!42038 (arr!20132 (Array (_ BitVec 32) (_ BitVec 64))) (size!20553 (_ BitVec 32))) )
))
(declare-fun lt!338299 () array!42037)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!338298 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7732 0))(
  ( (MissingZero!7732 (index!33296 (_ BitVec 32))) (Found!7732 (index!33297 (_ BitVec 32))) (Intermediate!7732 (undefined!8544 Bool) (index!33298 (_ BitVec 32)) (x!64178 (_ BitVec 32))) (Undefined!7732) (MissingVacant!7732 (index!33299 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42037 (_ BitVec 32)) SeekEntryResult!7732)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759146 (= res!513681 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338298 mask!3328) lt!338298 lt!338299 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338298 lt!338299 mask!3328)))))

(declare-fun a!3186 () array!42037)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!759146 (= lt!338298 (select (store (arr!20132 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!759146 (= lt!338299 (array!42038 (store (arr!20132 a!3186) i!1173 k!2102) (size!20553 a!3186)))))

(declare-fun b!759147 () Bool)

(declare-fun res!513695 () Bool)

(assert (=> b!759147 (=> (not res!513695) (not e!423229))))

(declare-fun e!423227 () Bool)

(assert (=> b!759147 (= res!513695 e!423227)))

(declare-fun c!83113 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!759147 (= c!83113 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759148 () Bool)

(declare-fun lt!338303 () SeekEntryResult!7732)

(assert (=> b!759148 (= e!423227 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20132 a!3186) j!159) a!3186 mask!3328) lt!338303))))

(declare-fun b!759149 () Bool)

(declare-fun res!513690 () Bool)

(declare-fun e!423224 () Bool)

(assert (=> b!759149 (=> (not res!513690) (not e!423224))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!759149 (= res!513690 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20553 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20553 a!3186))))))

(declare-fun b!759150 () Bool)

(declare-fun res!513686 () Bool)

(assert (=> b!759150 (=> (not res!513686) (not e!423229))))

(assert (=> b!759150 (= res!513686 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20132 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!513684 () Bool)

(declare-fun e!423228 () Bool)

(assert (=> start!65864 (=> (not res!513684) (not e!423228))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65864 (= res!513684 (validMask!0 mask!3328))))

(assert (=> start!65864 e!423228))

(assert (=> start!65864 true))

(declare-fun array_inv!15928 (array!42037) Bool)

(assert (=> start!65864 (array_inv!15928 a!3186)))

(declare-fun b!759151 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42037 (_ BitVec 32)) SeekEntryResult!7732)

(assert (=> b!759151 (= e!423227 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20132 a!3186) j!159) a!3186 mask!3328) (Found!7732 j!159)))))

(declare-fun b!759152 () Bool)

(declare-fun res!513689 () Bool)

(assert (=> b!759152 (=> (not res!513689) (not e!423224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42037 (_ BitVec 32)) Bool)

(assert (=> b!759152 (= res!513689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759153 () Bool)

(declare-fun res!513691 () Bool)

(assert (=> b!759153 (=> (not res!513691) (not e!423228))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759153 (= res!513691 (validKeyInArray!0 k!2102))))

(declare-fun b!759154 () Bool)

(declare-fun res!513685 () Bool)

(assert (=> b!759154 (=> (not res!513685) (not e!423224))))

(declare-datatypes ((List!14134 0))(
  ( (Nil!14131) (Cons!14130 (h!15202 (_ BitVec 64)) (t!20449 List!14134)) )
))
(declare-fun arrayNoDuplicates!0 (array!42037 (_ BitVec 32) List!14134) Bool)

(assert (=> b!759154 (= res!513685 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14131))))

(declare-fun b!759155 () Bool)

(assert (=> b!759155 (= e!423223 (not true))))

(declare-fun e!423226 () Bool)

(assert (=> b!759155 e!423226))

(declare-fun res!513694 () Bool)

(assert (=> b!759155 (=> (not res!513694) (not e!423226))))

(assert (=> b!759155 (= res!513694 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26304 0))(
  ( (Unit!26305) )
))
(declare-fun lt!338302 () Unit!26304)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42037 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26304)

(assert (=> b!759155 (= lt!338302 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759156 () Bool)

(declare-fun res!513688 () Bool)

(assert (=> b!759156 (=> (not res!513688) (not e!423228))))

(assert (=> b!759156 (= res!513688 (and (= (size!20553 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20553 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20553 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759157 () Bool)

(assert (=> b!759157 (= e!423224 e!423229)))

(declare-fun res!513682 () Bool)

(assert (=> b!759157 (=> (not res!513682) (not e!423229))))

(assert (=> b!759157 (= res!513682 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20132 a!3186) j!159) mask!3328) (select (arr!20132 a!3186) j!159) a!3186 mask!3328) lt!338303))))

(assert (=> b!759157 (= lt!338303 (Intermediate!7732 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!759158 () Bool)

(declare-fun res!513683 () Bool)

(assert (=> b!759158 (=> (not res!513683) (not e!423228))))

(assert (=> b!759158 (= res!513683 (validKeyInArray!0 (select (arr!20132 a!3186) j!159)))))

(declare-fun b!759159 () Bool)

(assert (=> b!759159 (= e!423228 e!423224)))

(declare-fun res!513692 () Bool)

(assert (=> b!759159 (=> (not res!513692) (not e!423224))))

(declare-fun lt!338300 () SeekEntryResult!7732)

(assert (=> b!759159 (= res!513692 (or (= lt!338300 (MissingZero!7732 i!1173)) (= lt!338300 (MissingVacant!7732 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42037 (_ BitVec 32)) SeekEntryResult!7732)

(assert (=> b!759159 (= lt!338300 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun e!423230 () Bool)

(declare-fun lt!338301 () SeekEntryResult!7732)

(declare-fun b!759160 () Bool)

(assert (=> b!759160 (= e!423230 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20132 a!3186) j!159) a!3186 mask!3328) lt!338301))))

(declare-fun b!759161 () Bool)

(declare-fun res!513687 () Bool)

(assert (=> b!759161 (=> (not res!513687) (not e!423228))))

(declare-fun arrayContainsKey!0 (array!42037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759161 (= res!513687 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!759162 () Bool)

(assert (=> b!759162 (= e!423226 e!423230)))

(declare-fun res!513693 () Bool)

(assert (=> b!759162 (=> (not res!513693) (not e!423230))))

(assert (=> b!759162 (= res!513693 (= (seekEntryOrOpen!0 (select (arr!20132 a!3186) j!159) a!3186 mask!3328) lt!338301))))

(assert (=> b!759162 (= lt!338301 (Found!7732 j!159))))

(assert (= (and start!65864 res!513684) b!759156))

(assert (= (and b!759156 res!513688) b!759158))

(assert (= (and b!759158 res!513683) b!759153))

(assert (= (and b!759153 res!513691) b!759161))

(assert (= (and b!759161 res!513687) b!759159))

(assert (= (and b!759159 res!513692) b!759152))

(assert (= (and b!759152 res!513689) b!759154))

(assert (= (and b!759154 res!513685) b!759149))

(assert (= (and b!759149 res!513690) b!759157))

(assert (= (and b!759157 res!513682) b!759150))

(assert (= (and b!759150 res!513686) b!759147))

(assert (= (and b!759147 c!83113) b!759148))

(assert (= (and b!759147 (not c!83113)) b!759151))

(assert (= (and b!759147 res!513695) b!759146))

(assert (= (and b!759146 res!513681) b!759155))

(assert (= (and b!759155 res!513694) b!759162))

(assert (= (and b!759162 res!513693) b!759160))

(declare-fun m!706533 () Bool)

(assert (=> b!759155 m!706533))

(declare-fun m!706535 () Bool)

(assert (=> b!759155 m!706535))

(declare-fun m!706537 () Bool)

(assert (=> b!759153 m!706537))

(declare-fun m!706539 () Bool)

(assert (=> b!759150 m!706539))

(declare-fun m!706541 () Bool)

(assert (=> b!759160 m!706541))

(assert (=> b!759160 m!706541))

(declare-fun m!706543 () Bool)

(assert (=> b!759160 m!706543))

(assert (=> b!759157 m!706541))

(assert (=> b!759157 m!706541))

(declare-fun m!706545 () Bool)

(assert (=> b!759157 m!706545))

(assert (=> b!759157 m!706545))

(assert (=> b!759157 m!706541))

(declare-fun m!706547 () Bool)

(assert (=> b!759157 m!706547))

(declare-fun m!706549 () Bool)

(assert (=> b!759146 m!706549))

(declare-fun m!706551 () Bool)

(assert (=> b!759146 m!706551))

(declare-fun m!706553 () Bool)

(assert (=> b!759146 m!706553))

(declare-fun m!706555 () Bool)

(assert (=> b!759146 m!706555))

(assert (=> b!759146 m!706553))

(declare-fun m!706557 () Bool)

(assert (=> b!759146 m!706557))

(declare-fun m!706559 () Bool)

(assert (=> b!759161 m!706559))

(assert (=> b!759158 m!706541))

(assert (=> b!759158 m!706541))

(declare-fun m!706561 () Bool)

(assert (=> b!759158 m!706561))

(declare-fun m!706563 () Bool)

(assert (=> b!759152 m!706563))

(assert (=> b!759148 m!706541))

(assert (=> b!759148 m!706541))

(declare-fun m!706565 () Bool)

(assert (=> b!759148 m!706565))

(declare-fun m!706567 () Bool)

(assert (=> b!759154 m!706567))

(declare-fun m!706569 () Bool)

(assert (=> start!65864 m!706569))

(declare-fun m!706571 () Bool)

(assert (=> start!65864 m!706571))

(assert (=> b!759151 m!706541))

(assert (=> b!759151 m!706541))

(declare-fun m!706573 () Bool)

(assert (=> b!759151 m!706573))

(declare-fun m!706575 () Bool)

(assert (=> b!759159 m!706575))

(assert (=> b!759162 m!706541))

(assert (=> b!759162 m!706541))

(declare-fun m!706577 () Bool)

(assert (=> b!759162 m!706577))

(push 1)

