; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65762 () Bool)

(assert start!65762)

(declare-fun b!756142 () Bool)

(declare-fun res!511303 () Bool)

(declare-fun e!421616 () Bool)

(assert (=> b!756142 (=> (not res!511303) (not e!421616))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41952 0))(
  ( (array!41953 (arr!20090 (Array (_ BitVec 32) (_ BitVec 64))) (size!20511 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41952)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!756142 (= res!511303 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20090 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!421619 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!756143 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7687 0))(
  ( (MissingZero!7687 (index!33116 (_ BitVec 32))) (Found!7687 (index!33117 (_ BitVec 32))) (Intermediate!7687 (undefined!8499 Bool) (index!33118 (_ BitVec 32)) (x!64024 (_ BitVec 32))) (Undefined!7687) (MissingVacant!7687 (index!33119 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41952 (_ BitVec 32)) SeekEntryResult!7687)

(assert (=> b!756143 (= e!421619 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20090 a!3186) j!159) a!3186 mask!3328) (Found!7687 j!159)))))

(declare-fun b!756144 () Bool)

(declare-fun e!421624 () Bool)

(assert (=> b!756144 (= e!421624 e!421616)))

(declare-fun res!511308 () Bool)

(assert (=> b!756144 (=> (not res!511308) (not e!421616))))

(declare-fun lt!336527 () SeekEntryResult!7687)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41952 (_ BitVec 32)) SeekEntryResult!7687)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!756144 (= res!511308 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20090 a!3186) j!159) mask!3328) (select (arr!20090 a!3186) j!159) a!3186 mask!3328) lt!336527))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!756144 (= lt!336527 (Intermediate!7687 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!756145 () Bool)

(declare-fun res!511293 () Bool)

(assert (=> b!756145 (=> (not res!511293) (not e!421624))))

(assert (=> b!756145 (= res!511293 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20511 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20511 a!3186))))))

(declare-fun b!756146 () Bool)

(declare-fun res!511296 () Bool)

(declare-fun e!421621 () Bool)

(assert (=> b!756146 (=> (not res!511296) (not e!421621))))

(declare-fun lt!336529 () (_ BitVec 64))

(declare-fun lt!336531 () array!41952)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41952 (_ BitVec 32)) SeekEntryResult!7687)

(assert (=> b!756146 (= res!511296 (= (seekEntryOrOpen!0 lt!336529 lt!336531 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!336529 lt!336531 mask!3328)))))

(declare-fun b!756147 () Bool)

(declare-fun e!421623 () Bool)

(declare-fun e!421627 () Bool)

(assert (=> b!756147 (= e!421623 (not e!421627))))

(declare-fun res!511306 () Bool)

(assert (=> b!756147 (=> res!511306 e!421627)))

(declare-fun lt!336533 () SeekEntryResult!7687)

(get-info :version)

(assert (=> b!756147 (= res!511306 (or (not ((_ is Intermediate!7687) lt!336533)) (bvslt x!1131 (x!64024 lt!336533)) (not (= x!1131 (x!64024 lt!336533))) (not (= index!1321 (index!33118 lt!336533)))))))

(declare-fun e!421626 () Bool)

(assert (=> b!756147 e!421626))

(declare-fun res!511310 () Bool)

(assert (=> b!756147 (=> (not res!511310) (not e!421626))))

(declare-fun lt!336524 () SeekEntryResult!7687)

(declare-fun lt!336528 () SeekEntryResult!7687)

(assert (=> b!756147 (= res!511310 (= lt!336524 lt!336528))))

(assert (=> b!756147 (= lt!336528 (Found!7687 j!159))))

(assert (=> b!756147 (= lt!336524 (seekEntryOrOpen!0 (select (arr!20090 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41952 (_ BitVec 32)) Bool)

(assert (=> b!756147 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26108 0))(
  ( (Unit!26109) )
))
(declare-fun lt!336530 () Unit!26108)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41952 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26108)

(assert (=> b!756147 (= lt!336530 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!756148 () Bool)

(declare-fun e!421618 () Bool)

(declare-fun e!421617 () Bool)

(assert (=> b!756148 (= e!421618 e!421617)))

(declare-fun res!511295 () Bool)

(assert (=> b!756148 (=> res!511295 e!421617)))

(declare-fun lt!336525 () (_ BitVec 64))

(assert (=> b!756148 (= res!511295 (= lt!336525 lt!336529))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!756148 (= lt!336525 (select (store (arr!20090 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!756149 () Bool)

(declare-fun res!511294 () Bool)

(declare-fun e!421620 () Bool)

(assert (=> b!756149 (=> (not res!511294) (not e!421620))))

(assert (=> b!756149 (= res!511294 (and (= (size!20511 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20511 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20511 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!756150 () Bool)

(declare-fun res!511311 () Bool)

(assert (=> b!756150 (=> (not res!511311) (not e!421624))))

(declare-datatypes ((List!14131 0))(
  ( (Nil!14128) (Cons!14127 (h!15199 (_ BitVec 64)) (t!20437 List!14131)) )
))
(declare-fun arrayNoDuplicates!0 (array!41952 (_ BitVec 32) List!14131) Bool)

(assert (=> b!756150 (= res!511311 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14128))))

(declare-fun b!756151 () Bool)

(declare-fun res!511304 () Bool)

(assert (=> b!756151 (=> (not res!511304) (not e!421620))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!756151 (= res!511304 (validKeyInArray!0 k0!2102))))

(declare-fun b!756152 () Bool)

(assert (=> b!756152 (= e!421627 e!421618)))

(declare-fun res!511299 () Bool)

(assert (=> b!756152 (=> res!511299 e!421618)))

(declare-fun lt!336523 () SeekEntryResult!7687)

(assert (=> b!756152 (= res!511299 (not (= lt!336523 lt!336528)))))

(assert (=> b!756152 (= lt!336523 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20090 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!756153 () Bool)

(assert (=> b!756153 (= e!421617 true)))

(assert (=> b!756153 e!421621))

(declare-fun res!511301 () Bool)

(assert (=> b!756153 (=> (not res!511301) (not e!421621))))

(assert (=> b!756153 (= res!511301 (= lt!336525 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!336522 () Unit!26108)

(declare-fun e!421622 () Unit!26108)

(assert (=> b!756153 (= lt!336522 e!421622)))

(declare-fun c!82806 () Bool)

(assert (=> b!756153 (= c!82806 (= lt!336525 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!756154 () Bool)

(assert (=> b!756154 (= e!421620 e!421624)))

(declare-fun res!511302 () Bool)

(assert (=> b!756154 (=> (not res!511302) (not e!421624))))

(declare-fun lt!336532 () SeekEntryResult!7687)

(assert (=> b!756154 (= res!511302 (or (= lt!336532 (MissingZero!7687 i!1173)) (= lt!336532 (MissingVacant!7687 i!1173))))))

(assert (=> b!756154 (= lt!336532 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!756155 () Bool)

(declare-fun Unit!26110 () Unit!26108)

(assert (=> b!756155 (= e!421622 Unit!26110)))

(declare-fun b!756156 () Bool)

(assert (=> b!756156 (= e!421616 e!421623)))

(declare-fun res!511305 () Bool)

(assert (=> b!756156 (=> (not res!511305) (not e!421623))))

(declare-fun lt!336526 () SeekEntryResult!7687)

(assert (=> b!756156 (= res!511305 (= lt!336526 lt!336533))))

(assert (=> b!756156 (= lt!336533 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!336529 lt!336531 mask!3328))))

(assert (=> b!756156 (= lt!336526 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!336529 mask!3328) lt!336529 lt!336531 mask!3328))))

(assert (=> b!756156 (= lt!336529 (select (store (arr!20090 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!756156 (= lt!336531 (array!41953 (store (arr!20090 a!3186) i!1173 k0!2102) (size!20511 a!3186)))))

(declare-fun b!756157 () Bool)

(assert (=> b!756157 (= e!421626 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20090 a!3186) j!159) a!3186 mask!3328) lt!336528))))

(declare-fun b!756158 () Bool)

(declare-fun res!511297 () Bool)

(assert (=> b!756158 (=> (not res!511297) (not e!421616))))

(assert (=> b!756158 (= res!511297 e!421619)))

(declare-fun c!82805 () Bool)

(assert (=> b!756158 (= c!82805 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!756159 () Bool)

(declare-fun res!511300 () Bool)

(assert (=> b!756159 (=> (not res!511300) (not e!421620))))

(assert (=> b!756159 (= res!511300 (validKeyInArray!0 (select (arr!20090 a!3186) j!159)))))

(declare-fun b!756160 () Bool)

(declare-fun Unit!26111 () Unit!26108)

(assert (=> b!756160 (= e!421622 Unit!26111)))

(assert (=> b!756160 false))

(declare-fun b!756161 () Bool)

(assert (=> b!756161 (= e!421619 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20090 a!3186) j!159) a!3186 mask!3328) lt!336527))))

(declare-fun res!511309 () Bool)

(assert (=> start!65762 (=> (not res!511309) (not e!421620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65762 (= res!511309 (validMask!0 mask!3328))))

(assert (=> start!65762 e!421620))

(assert (=> start!65762 true))

(declare-fun array_inv!15973 (array!41952) Bool)

(assert (=> start!65762 (array_inv!15973 a!3186)))

(declare-fun b!756162 () Bool)

(declare-fun res!511307 () Bool)

(assert (=> b!756162 (=> (not res!511307) (not e!421624))))

(assert (=> b!756162 (= res!511307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!756163 () Bool)

(declare-fun res!511298 () Bool)

(assert (=> b!756163 (=> (not res!511298) (not e!421620))))

(declare-fun arrayContainsKey!0 (array!41952 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!756163 (= res!511298 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!756164 () Bool)

(assert (=> b!756164 (= e!421621 (= lt!336524 lt!336523))))

(assert (= (and start!65762 res!511309) b!756149))

(assert (= (and b!756149 res!511294) b!756159))

(assert (= (and b!756159 res!511300) b!756151))

(assert (= (and b!756151 res!511304) b!756163))

(assert (= (and b!756163 res!511298) b!756154))

(assert (= (and b!756154 res!511302) b!756162))

(assert (= (and b!756162 res!511307) b!756150))

(assert (= (and b!756150 res!511311) b!756145))

(assert (= (and b!756145 res!511293) b!756144))

(assert (= (and b!756144 res!511308) b!756142))

(assert (= (and b!756142 res!511303) b!756158))

(assert (= (and b!756158 c!82805) b!756161))

(assert (= (and b!756158 (not c!82805)) b!756143))

(assert (= (and b!756158 res!511297) b!756156))

(assert (= (and b!756156 res!511305) b!756147))

(assert (= (and b!756147 res!511310) b!756157))

(assert (= (and b!756147 (not res!511306)) b!756152))

(assert (= (and b!756152 (not res!511299)) b!756148))

(assert (= (and b!756148 (not res!511295)) b!756153))

(assert (= (and b!756153 c!82806) b!756160))

(assert (= (and b!756153 (not c!82806)) b!756155))

(assert (= (and b!756153 res!511301) b!756146))

(assert (= (and b!756146 res!511296) b!756164))

(declare-fun m!703601 () Bool)

(assert (=> b!756152 m!703601))

(assert (=> b!756152 m!703601))

(declare-fun m!703603 () Bool)

(assert (=> b!756152 m!703603))

(assert (=> b!756159 m!703601))

(assert (=> b!756159 m!703601))

(declare-fun m!703605 () Bool)

(assert (=> b!756159 m!703605))

(declare-fun m!703607 () Bool)

(assert (=> b!756154 m!703607))

(declare-fun m!703609 () Bool)

(assert (=> b!756151 m!703609))

(declare-fun m!703611 () Bool)

(assert (=> b!756146 m!703611))

(declare-fun m!703613 () Bool)

(assert (=> b!756146 m!703613))

(assert (=> b!756147 m!703601))

(assert (=> b!756147 m!703601))

(declare-fun m!703615 () Bool)

(assert (=> b!756147 m!703615))

(declare-fun m!703617 () Bool)

(assert (=> b!756147 m!703617))

(declare-fun m!703619 () Bool)

(assert (=> b!756147 m!703619))

(declare-fun m!703621 () Bool)

(assert (=> b!756148 m!703621))

(declare-fun m!703623 () Bool)

(assert (=> b!756148 m!703623))

(assert (=> b!756143 m!703601))

(assert (=> b!756143 m!703601))

(assert (=> b!756143 m!703603))

(declare-fun m!703625 () Bool)

(assert (=> start!65762 m!703625))

(declare-fun m!703627 () Bool)

(assert (=> start!65762 m!703627))

(declare-fun m!703629 () Bool)

(assert (=> b!756156 m!703629))

(declare-fun m!703631 () Bool)

(assert (=> b!756156 m!703631))

(assert (=> b!756156 m!703621))

(declare-fun m!703633 () Bool)

(assert (=> b!756156 m!703633))

(assert (=> b!756156 m!703629))

(declare-fun m!703635 () Bool)

(assert (=> b!756156 m!703635))

(declare-fun m!703637 () Bool)

(assert (=> b!756150 m!703637))

(assert (=> b!756144 m!703601))

(assert (=> b!756144 m!703601))

(declare-fun m!703639 () Bool)

(assert (=> b!756144 m!703639))

(assert (=> b!756144 m!703639))

(assert (=> b!756144 m!703601))

(declare-fun m!703641 () Bool)

(assert (=> b!756144 m!703641))

(declare-fun m!703643 () Bool)

(assert (=> b!756142 m!703643))

(assert (=> b!756157 m!703601))

(assert (=> b!756157 m!703601))

(declare-fun m!703645 () Bool)

(assert (=> b!756157 m!703645))

(declare-fun m!703647 () Bool)

(assert (=> b!756162 m!703647))

(declare-fun m!703649 () Bool)

(assert (=> b!756163 m!703649))

(assert (=> b!756161 m!703601))

(assert (=> b!756161 m!703601))

(declare-fun m!703651 () Bool)

(assert (=> b!756161 m!703651))

(check-sat (not b!756152) (not b!756144) (not b!756151) (not b!756143) (not b!756161) (not b!756146) (not b!756159) (not b!756147) (not b!756154) (not b!756157) (not b!756162) (not b!756156) (not start!65762) (not b!756163) (not b!756150))
(check-sat)
