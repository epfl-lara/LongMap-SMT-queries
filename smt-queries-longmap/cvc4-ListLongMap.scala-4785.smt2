; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65774 () Bool)

(assert start!65774)

(declare-fun b!756116 () Bool)

(declare-fun e!421637 () Bool)

(declare-fun e!421627 () Bool)

(assert (=> b!756116 (= e!421637 (not e!421627))))

(declare-fun res!511181 () Bool)

(assert (=> b!756116 (=> res!511181 e!421627)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7687 0))(
  ( (MissingZero!7687 (index!33116 (_ BitVec 32))) (Found!7687 (index!33117 (_ BitVec 32))) (Intermediate!7687 (undefined!8499 Bool) (index!33118 (_ BitVec 32)) (x!64013 (_ BitVec 32))) (Undefined!7687) (MissingVacant!7687 (index!33119 (_ BitVec 32))) )
))
(declare-fun lt!336620 () SeekEntryResult!7687)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!756116 (= res!511181 (or (not (is-Intermediate!7687 lt!336620)) (bvslt x!1131 (x!64013 lt!336620)) (not (= x!1131 (x!64013 lt!336620))) (not (= index!1321 (index!33118 lt!336620)))))))

(declare-fun e!421630 () Bool)

(assert (=> b!756116 e!421630))

(declare-fun res!511175 () Bool)

(assert (=> b!756116 (=> (not res!511175) (not e!421630))))

(declare-fun lt!336622 () SeekEntryResult!7687)

(declare-fun lt!336621 () SeekEntryResult!7687)

(assert (=> b!756116 (= res!511175 (= lt!336622 lt!336621))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!756116 (= lt!336621 (Found!7687 j!159))))

(declare-datatypes ((array!41947 0))(
  ( (array!41948 (arr!20087 (Array (_ BitVec 32) (_ BitVec 64))) (size!20508 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41947)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41947 (_ BitVec 32)) SeekEntryResult!7687)

(assert (=> b!756116 (= lt!336622 (seekEntryOrOpen!0 (select (arr!20087 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41947 (_ BitVec 32)) Bool)

(assert (=> b!756116 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26128 0))(
  ( (Unit!26129) )
))
(declare-fun lt!336625 () Unit!26128)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41947 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26128)

(assert (=> b!756116 (= lt!336625 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!511182 () Bool)

(declare-fun e!421631 () Bool)

(assert (=> start!65774 (=> (not res!511182) (not e!421631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65774 (= res!511182 (validMask!0 mask!3328))))

(assert (=> start!65774 e!421631))

(assert (=> start!65774 true))

(declare-fun array_inv!15883 (array!41947) Bool)

(assert (=> start!65774 (array_inv!15883 a!3186)))

(declare-fun b!756117 () Bool)

(declare-fun res!511193 () Bool)

(declare-fun e!421635 () Bool)

(assert (=> b!756117 (=> (not res!511193) (not e!421635))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!756117 (= res!511193 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20508 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20508 a!3186))))))

(declare-fun b!756118 () Bool)

(declare-fun res!511179 () Bool)

(declare-fun e!421626 () Bool)

(assert (=> b!756118 (=> (not res!511179) (not e!421626))))

(declare-fun e!421632 () Bool)

(assert (=> b!756118 (= res!511179 e!421632)))

(declare-fun c!82852 () Bool)

(assert (=> b!756118 (= c!82852 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756119 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41947 (_ BitVec 32)) SeekEntryResult!7687)

(assert (=> b!756119 (= e!421632 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20087 a!3186) j!159) a!3186 mask!3328) (Found!7687 j!159)))))

(declare-fun b!756120 () Bool)

(declare-fun res!511186 () Bool)

(assert (=> b!756120 (=> (not res!511186) (not e!421631))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756120 (= res!511186 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756121 () Bool)

(declare-fun e!421628 () Unit!26128)

(declare-fun Unit!26130 () Unit!26128)

(assert (=> b!756121 (= e!421628 Unit!26130)))

(assert (=> b!756121 false))

(declare-fun b!756122 () Bool)

(declare-fun res!511190 () Bool)

(assert (=> b!756122 (=> (not res!511190) (not e!421626))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!756122 (= res!511190 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20087 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!756123 () Bool)

(declare-fun res!511189 () Bool)

(declare-fun e!421629 () Bool)

(assert (=> b!756123 (=> (not res!511189) (not e!421629))))

(declare-fun lt!336619 () array!41947)

(declare-fun lt!336624 () (_ BitVec 64))

(assert (=> b!756123 (= res!511189 (= (seekEntryOrOpen!0 lt!336624 lt!336619 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336624 lt!336619 mask!3328)))))

(declare-fun b!756124 () Bool)

(declare-fun res!511185 () Bool)

(assert (=> b!756124 (=> (not res!511185) (not e!421631))))

(assert (=> b!756124 (= res!511185 (and (= (size!20508 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20508 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20508 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756125 () Bool)

(declare-fun e!421636 () Bool)

(assert (=> b!756125 (= e!421636 true)))

(assert (=> b!756125 e!421629))

(declare-fun res!511183 () Bool)

(assert (=> b!756125 (=> (not res!511183) (not e!421629))))

(declare-fun lt!336628 () (_ BitVec 64))

(assert (=> b!756125 (= res!511183 (= lt!336628 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336623 () Unit!26128)

(assert (=> b!756125 (= lt!336623 e!421628)))

(declare-fun c!82851 () Bool)

(assert (=> b!756125 (= c!82851 (= lt!336628 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756126 () Bool)

(assert (=> b!756126 (= e!421630 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20087 a!3186) j!159) a!3186 mask!3328) lt!336621))))

(declare-fun b!756127 () Bool)

(declare-fun Unit!26131 () Unit!26128)

(assert (=> b!756127 (= e!421628 Unit!26131)))

(declare-fun b!756128 () Bool)

(declare-fun res!511191 () Bool)

(assert (=> b!756128 (=> (not res!511191) (not e!421635))))

(declare-datatypes ((List!14089 0))(
  ( (Nil!14086) (Cons!14085 (h!15157 (_ BitVec 64)) (t!20404 List!14089)) )
))
(declare-fun arrayNoDuplicates!0 (array!41947 (_ BitVec 32) List!14089) Bool)

(assert (=> b!756128 (= res!511191 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14086))))

(declare-fun b!756129 () Bool)

(declare-fun e!421634 () Bool)

(assert (=> b!756129 (= e!421634 e!421636)))

(declare-fun res!511180 () Bool)

(assert (=> b!756129 (=> res!511180 e!421636)))

(assert (=> b!756129 (= res!511180 (= lt!336628 lt!336624))))

(assert (=> b!756129 (= lt!336628 (select (store (arr!20087 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!756130 () Bool)

(declare-fun res!511192 () Bool)

(assert (=> b!756130 (=> (not res!511192) (not e!421631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756130 (= res!511192 (validKeyInArray!0 k!2102))))

(declare-fun b!756131 () Bool)

(declare-fun res!511188 () Bool)

(assert (=> b!756131 (=> (not res!511188) (not e!421635))))

(assert (=> b!756131 (= res!511188 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756132 () Bool)

(declare-fun lt!336627 () SeekEntryResult!7687)

(assert (=> b!756132 (= e!421629 (= lt!336622 lt!336627))))

(declare-fun b!756133 () Bool)

(assert (=> b!756133 (= e!421626 e!421637)))

(declare-fun res!511177 () Bool)

(assert (=> b!756133 (=> (not res!511177) (not e!421637))))

(declare-fun lt!336618 () SeekEntryResult!7687)

(assert (=> b!756133 (= res!511177 (= lt!336618 lt!336620))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41947 (_ BitVec 32)) SeekEntryResult!7687)

(assert (=> b!756133 (= lt!336620 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336624 lt!336619 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756133 (= lt!336618 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336624 mask!3328) lt!336624 lt!336619 mask!3328))))

(assert (=> b!756133 (= lt!336624 (select (store (arr!20087 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!756133 (= lt!336619 (array!41948 (store (arr!20087 a!3186) i!1173 k!2102) (size!20508 a!3186)))))

(declare-fun b!756134 () Bool)

(declare-fun res!511176 () Bool)

(assert (=> b!756134 (=> (not res!511176) (not e!421631))))

(assert (=> b!756134 (= res!511176 (validKeyInArray!0 (select (arr!20087 a!3186) j!159)))))

(declare-fun b!756135 () Bool)

(assert (=> b!756135 (= e!421631 e!421635)))

(declare-fun res!511178 () Bool)

(assert (=> b!756135 (=> (not res!511178) (not e!421635))))

(declare-fun lt!336626 () SeekEntryResult!7687)

(assert (=> b!756135 (= res!511178 (or (= lt!336626 (MissingZero!7687 i!1173)) (= lt!336626 (MissingVacant!7687 i!1173))))))

(assert (=> b!756135 (= lt!336626 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!756136 () Bool)

(assert (=> b!756136 (= e!421627 e!421634)))

(declare-fun res!511187 () Bool)

(assert (=> b!756136 (=> res!511187 e!421634)))

(assert (=> b!756136 (= res!511187 (not (= lt!336627 lt!336621)))))

(assert (=> b!756136 (= lt!336627 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20087 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!756137 () Bool)

(assert (=> b!756137 (= e!421635 e!421626)))

(declare-fun res!511184 () Bool)

(assert (=> b!756137 (=> (not res!511184) (not e!421626))))

(declare-fun lt!336629 () SeekEntryResult!7687)

(assert (=> b!756137 (= res!511184 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20087 a!3186) j!159) mask!3328) (select (arr!20087 a!3186) j!159) a!3186 mask!3328) lt!336629))))

(assert (=> b!756137 (= lt!336629 (Intermediate!7687 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756138 () Bool)

(assert (=> b!756138 (= e!421632 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20087 a!3186) j!159) a!3186 mask!3328) lt!336629))))

(assert (= (and start!65774 res!511182) b!756124))

(assert (= (and b!756124 res!511185) b!756134))

(assert (= (and b!756134 res!511176) b!756130))

(assert (= (and b!756130 res!511192) b!756120))

(assert (= (and b!756120 res!511186) b!756135))

(assert (= (and b!756135 res!511178) b!756131))

(assert (= (and b!756131 res!511188) b!756128))

(assert (= (and b!756128 res!511191) b!756117))

(assert (= (and b!756117 res!511193) b!756137))

(assert (= (and b!756137 res!511184) b!756122))

(assert (= (and b!756122 res!511190) b!756118))

(assert (= (and b!756118 c!82852) b!756138))

(assert (= (and b!756118 (not c!82852)) b!756119))

(assert (= (and b!756118 res!511179) b!756133))

(assert (= (and b!756133 res!511177) b!756116))

(assert (= (and b!756116 res!511175) b!756126))

(assert (= (and b!756116 (not res!511181)) b!756136))

(assert (= (and b!756136 (not res!511187)) b!756129))

(assert (= (and b!756129 (not res!511180)) b!756125))

(assert (= (and b!756125 c!82851) b!756121))

(assert (= (and b!756125 (not c!82851)) b!756127))

(assert (= (and b!756125 res!511183) b!756123))

(assert (= (and b!756123 res!511189) b!756132))

(declare-fun m!704151 () Bool)

(assert (=> b!756136 m!704151))

(assert (=> b!756136 m!704151))

(declare-fun m!704153 () Bool)

(assert (=> b!756136 m!704153))

(assert (=> b!756137 m!704151))

(assert (=> b!756137 m!704151))

(declare-fun m!704155 () Bool)

(assert (=> b!756137 m!704155))

(assert (=> b!756137 m!704155))

(assert (=> b!756137 m!704151))

(declare-fun m!704157 () Bool)

(assert (=> b!756137 m!704157))

(declare-fun m!704159 () Bool)

(assert (=> b!756129 m!704159))

(declare-fun m!704161 () Bool)

(assert (=> b!756129 m!704161))

(assert (=> b!756116 m!704151))

(assert (=> b!756116 m!704151))

(declare-fun m!704163 () Bool)

(assert (=> b!756116 m!704163))

(declare-fun m!704165 () Bool)

(assert (=> b!756116 m!704165))

(declare-fun m!704167 () Bool)

(assert (=> b!756116 m!704167))

(assert (=> b!756119 m!704151))

(assert (=> b!756119 m!704151))

(assert (=> b!756119 m!704153))

(declare-fun m!704169 () Bool)

(assert (=> b!756128 m!704169))

(declare-fun m!704171 () Bool)

(assert (=> b!756133 m!704171))

(declare-fun m!704173 () Bool)

(assert (=> b!756133 m!704173))

(declare-fun m!704175 () Bool)

(assert (=> b!756133 m!704175))

(assert (=> b!756133 m!704159))

(assert (=> b!756133 m!704173))

(declare-fun m!704177 () Bool)

(assert (=> b!756133 m!704177))

(declare-fun m!704179 () Bool)

(assert (=> b!756120 m!704179))

(assert (=> b!756138 m!704151))

(assert (=> b!756138 m!704151))

(declare-fun m!704181 () Bool)

(assert (=> b!756138 m!704181))

(assert (=> b!756126 m!704151))

(assert (=> b!756126 m!704151))

(declare-fun m!704183 () Bool)

(assert (=> b!756126 m!704183))

(declare-fun m!704185 () Bool)

(assert (=> start!65774 m!704185))

(declare-fun m!704187 () Bool)

(assert (=> start!65774 m!704187))

(assert (=> b!756134 m!704151))

(assert (=> b!756134 m!704151))

(declare-fun m!704189 () Bool)

(assert (=> b!756134 m!704189))

(declare-fun m!704191 () Bool)

(assert (=> b!756131 m!704191))

(declare-fun m!704193 () Bool)

(assert (=> b!756122 m!704193))

(declare-fun m!704195 () Bool)

(assert (=> b!756123 m!704195))

(declare-fun m!704197 () Bool)

(assert (=> b!756123 m!704197))

(declare-fun m!704199 () Bool)

(assert (=> b!756135 m!704199))

(declare-fun m!704201 () Bool)

(assert (=> b!756130 m!704201))

(push 1)

