; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66804 () Bool)

(assert start!66804)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42366 0))(
  ( (array!42367 (arr!20283 (Array (_ BitVec 32) (_ BitVec 64))) (size!20704 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42366)

(declare-fun b!770516 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!428990 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7883 0))(
  ( (MissingZero!7883 (index!33900 (_ BitVec 32))) (Found!7883 (index!33901 (_ BitVec 32))) (Intermediate!7883 (undefined!8695 Bool) (index!33902 (_ BitVec 32)) (x!64830 (_ BitVec 32))) (Undefined!7883) (MissingVacant!7883 (index!33903 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42366 (_ BitVec 32)) SeekEntryResult!7883)

(assert (=> b!770516 (= e!428990 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20283 a!3186) j!159) a!3186 mask!3328) (Found!7883 j!159)))))

(declare-fun b!770517 () Bool)

(declare-fun res!521219 () Bool)

(declare-fun e!428991 () Bool)

(assert (=> b!770517 (=> (not res!521219) (not e!428991))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42366 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!770517 (= res!521219 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!770518 () Bool)

(declare-fun res!521221 () Bool)

(declare-fun e!428998 () Bool)

(assert (=> b!770518 (=> (not res!521221) (not e!428998))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42366 (_ BitVec 32)) Bool)

(assert (=> b!770518 (= res!521221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!770519 () Bool)

(declare-fun e!428994 () Bool)

(declare-fun e!428993 () Bool)

(assert (=> b!770519 (= e!428994 e!428993)))

(declare-fun res!521215 () Bool)

(assert (=> b!770519 (=> (not res!521215) (not e!428993))))

(declare-fun lt!342944 () SeekEntryResult!7883)

(declare-fun lt!342946 () SeekEntryResult!7883)

(assert (=> b!770519 (= res!521215 (= lt!342944 lt!342946))))

(declare-fun lt!342938 () array!42366)

(declare-fun lt!342942 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42366 (_ BitVec 32)) SeekEntryResult!7883)

(assert (=> b!770519 (= lt!342946 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342942 lt!342938 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770519 (= lt!342944 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342942 mask!3328) lt!342942 lt!342938 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!770519 (= lt!342942 (select (store (arr!20283 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!770519 (= lt!342938 (array!42367 (store (arr!20283 a!3186) i!1173 k!2102) (size!20704 a!3186)))))

(declare-fun b!770520 () Bool)

(declare-datatypes ((Unit!26546 0))(
  ( (Unit!26547) )
))
(declare-fun e!428996 () Unit!26546)

(declare-fun Unit!26548 () Unit!26546)

(assert (=> b!770520 (= e!428996 Unit!26548)))

(declare-fun lt!342943 () (_ BitVec 32))

(declare-fun lt!342947 () SeekEntryResult!7883)

(assert (=> b!770520 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342943 (select (arr!20283 a!3186) j!159) a!3186 mask!3328) lt!342947)))

(declare-fun b!770521 () Bool)

(declare-fun e!428997 () Bool)

(declare-fun e!428995 () Bool)

(assert (=> b!770521 (= e!428997 e!428995)))

(declare-fun res!521227 () Bool)

(assert (=> b!770521 (=> (not res!521227) (not e!428995))))

(declare-fun lt!342937 () SeekEntryResult!7883)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42366 (_ BitVec 32)) SeekEntryResult!7883)

(assert (=> b!770521 (= res!521227 (= (seekEntryOrOpen!0 (select (arr!20283 a!3186) j!159) a!3186 mask!3328) lt!342937))))

(assert (=> b!770521 (= lt!342937 (Found!7883 j!159))))

(declare-fun b!770522 () Bool)

(declare-fun res!521225 () Bool)

(assert (=> b!770522 (=> (not res!521225) (not e!428998))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!770522 (= res!521225 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20704 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20704 a!3186))))))

(declare-fun b!770523 () Bool)

(declare-fun res!521216 () Bool)

(assert (=> b!770523 (=> (not res!521216) (not e!428991))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!770523 (= res!521216 (validKeyInArray!0 (select (arr!20283 a!3186) j!159)))))

(declare-fun b!770524 () Bool)

(declare-fun res!521228 () Bool)

(assert (=> b!770524 (=> (not res!521228) (not e!428991))))

(assert (=> b!770524 (= res!521228 (and (= (size!20704 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20704 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20704 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!770525 () Bool)

(assert (=> b!770525 (= e!428995 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20283 a!3186) j!159) a!3186 mask!3328) lt!342937))))

(declare-fun b!770526 () Bool)

(assert (=> b!770526 (= e!428990 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20283 a!3186) j!159) a!3186 mask!3328) lt!342947))))

(declare-fun b!770527 () Bool)

(declare-fun res!521217 () Bool)

(assert (=> b!770527 (=> (not res!521217) (not e!428994))))

(assert (=> b!770527 (= res!521217 e!428990)))

(declare-fun c!85048 () Bool)

(assert (=> b!770527 (= c!85048 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!770528 () Bool)

(declare-fun res!521218 () Bool)

(assert (=> b!770528 (=> (not res!521218) (not e!428991))))

(assert (=> b!770528 (= res!521218 (validKeyInArray!0 k!2102))))

(declare-fun b!770529 () Bool)

(declare-fun res!521220 () Bool)

(assert (=> b!770529 (=> (not res!521220) (not e!428994))))

(assert (=> b!770529 (= res!521220 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20283 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!770531 () Bool)

(assert (=> b!770531 (= e!428991 e!428998)))

(declare-fun res!521224 () Bool)

(assert (=> b!770531 (=> (not res!521224) (not e!428998))))

(declare-fun lt!342939 () SeekEntryResult!7883)

(assert (=> b!770531 (= res!521224 (or (= lt!342939 (MissingZero!7883 i!1173)) (= lt!342939 (MissingVacant!7883 i!1173))))))

(assert (=> b!770531 (= lt!342939 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!770532 () Bool)

(declare-fun e!428999 () Bool)

(assert (=> b!770532 (= e!428993 (not e!428999))))

(declare-fun res!521213 () Bool)

(assert (=> b!770532 (=> res!521213 e!428999)))

(assert (=> b!770532 (= res!521213 (or (not (is-Intermediate!7883 lt!342946)) (bvsge x!1131 (x!64830 lt!342946))))))

(assert (=> b!770532 e!428997))

(declare-fun res!521214 () Bool)

(assert (=> b!770532 (=> (not res!521214) (not e!428997))))

(assert (=> b!770532 (= res!521214 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342940 () Unit!26546)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42366 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26546)

(assert (=> b!770532 (= lt!342940 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!770533 () Bool)

(declare-fun res!521226 () Bool)

(assert (=> b!770533 (=> (not res!521226) (not e!428998))))

(declare-datatypes ((List!14285 0))(
  ( (Nil!14282) (Cons!14281 (h!15380 (_ BitVec 64)) (t!20600 List!14285)) )
))
(declare-fun arrayNoDuplicates!0 (array!42366 (_ BitVec 32) List!14285) Bool)

(assert (=> b!770533 (= res!521226 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14282))))

(declare-fun b!770534 () Bool)

(assert (=> b!770534 (= e!428998 e!428994)))

(declare-fun res!521223 () Bool)

(assert (=> b!770534 (=> (not res!521223) (not e!428994))))

(assert (=> b!770534 (= res!521223 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20283 a!3186) j!159) mask!3328) (select (arr!20283 a!3186) j!159) a!3186 mask!3328) lt!342947))))

(assert (=> b!770534 (= lt!342947 (Intermediate!7883 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!770535 () Bool)

(declare-fun Unit!26549 () Unit!26546)

(assert (=> b!770535 (= e!428996 Unit!26549)))

(declare-fun lt!342941 () SeekEntryResult!7883)

(assert (=> b!770535 (= lt!342941 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20283 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!770535 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342943 resIntermediateIndex!5 (select (arr!20283 a!3186) j!159) a!3186 mask!3328) (Found!7883 j!159))))

(declare-fun res!521222 () Bool)

(assert (=> start!66804 (=> (not res!521222) (not e!428991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66804 (= res!521222 (validMask!0 mask!3328))))

(assert (=> start!66804 e!428991))

(assert (=> start!66804 true))

(declare-fun array_inv!16079 (array!42366) Bool)

(assert (=> start!66804 (array_inv!16079 a!3186)))

(declare-fun b!770530 () Bool)

(assert (=> b!770530 (= e!428999 true)))

(declare-fun lt!342945 () Unit!26546)

(assert (=> b!770530 (= lt!342945 e!428996)))

(declare-fun c!85047 () Bool)

(assert (=> b!770530 (= c!85047 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!770530 (= lt!342943 (nextIndex!0 index!1321 x!1131 mask!3328))))

(assert (= (and start!66804 res!521222) b!770524))

(assert (= (and b!770524 res!521228) b!770523))

(assert (= (and b!770523 res!521216) b!770528))

(assert (= (and b!770528 res!521218) b!770517))

(assert (= (and b!770517 res!521219) b!770531))

(assert (= (and b!770531 res!521224) b!770518))

(assert (= (and b!770518 res!521221) b!770533))

(assert (= (and b!770533 res!521226) b!770522))

(assert (= (and b!770522 res!521225) b!770534))

(assert (= (and b!770534 res!521223) b!770529))

(assert (= (and b!770529 res!521220) b!770527))

(assert (= (and b!770527 c!85048) b!770526))

(assert (= (and b!770527 (not c!85048)) b!770516))

(assert (= (and b!770527 res!521217) b!770519))

(assert (= (and b!770519 res!521215) b!770532))

(assert (= (and b!770532 res!521214) b!770521))

(assert (= (and b!770521 res!521227) b!770525))

(assert (= (and b!770532 (not res!521213)) b!770530))

(assert (= (and b!770530 c!85047) b!770520))

(assert (= (and b!770530 (not c!85047)) b!770535))

(declare-fun m!715787 () Bool)

(assert (=> b!770531 m!715787))

(declare-fun m!715789 () Bool)

(assert (=> b!770532 m!715789))

(declare-fun m!715791 () Bool)

(assert (=> b!770532 m!715791))

(declare-fun m!715793 () Bool)

(assert (=> b!770516 m!715793))

(assert (=> b!770516 m!715793))

(declare-fun m!715795 () Bool)

(assert (=> b!770516 m!715795))

(assert (=> b!770523 m!715793))

(assert (=> b!770523 m!715793))

(declare-fun m!715797 () Bool)

(assert (=> b!770523 m!715797))

(declare-fun m!715799 () Bool)

(assert (=> b!770529 m!715799))

(declare-fun m!715801 () Bool)

(assert (=> b!770518 m!715801))

(assert (=> b!770534 m!715793))

(assert (=> b!770534 m!715793))

(declare-fun m!715803 () Bool)

(assert (=> b!770534 m!715803))

(assert (=> b!770534 m!715803))

(assert (=> b!770534 m!715793))

(declare-fun m!715805 () Bool)

(assert (=> b!770534 m!715805))

(assert (=> b!770521 m!715793))

(assert (=> b!770521 m!715793))

(declare-fun m!715807 () Bool)

(assert (=> b!770521 m!715807))

(declare-fun m!715809 () Bool)

(assert (=> start!66804 m!715809))

(declare-fun m!715811 () Bool)

(assert (=> start!66804 m!715811))

(declare-fun m!715813 () Bool)

(assert (=> b!770533 m!715813))

(assert (=> b!770535 m!715793))

(assert (=> b!770535 m!715793))

(assert (=> b!770535 m!715795))

(assert (=> b!770535 m!715793))

(declare-fun m!715815 () Bool)

(assert (=> b!770535 m!715815))

(declare-fun m!715817 () Bool)

(assert (=> b!770530 m!715817))

(assert (=> b!770526 m!715793))

(assert (=> b!770526 m!715793))

(declare-fun m!715819 () Bool)

(assert (=> b!770526 m!715819))

(declare-fun m!715821 () Bool)

(assert (=> b!770517 m!715821))

(declare-fun m!715823 () Bool)

(assert (=> b!770519 m!715823))

(declare-fun m!715825 () Bool)

(assert (=> b!770519 m!715825))

(declare-fun m!715827 () Bool)

(assert (=> b!770519 m!715827))

(declare-fun m!715829 () Bool)

(assert (=> b!770519 m!715829))

(assert (=> b!770519 m!715823))

(declare-fun m!715831 () Bool)

(assert (=> b!770519 m!715831))

(assert (=> b!770520 m!715793))

(assert (=> b!770520 m!715793))

(declare-fun m!715833 () Bool)

(assert (=> b!770520 m!715833))

(declare-fun m!715835 () Bool)

(assert (=> b!770528 m!715835))

(assert (=> b!770525 m!715793))

(assert (=> b!770525 m!715793))

(declare-fun m!715837 () Bool)

(assert (=> b!770525 m!715837))

(push 1)

