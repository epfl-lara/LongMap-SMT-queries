; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65216 () Bool)

(assert start!65216)

(declare-fun b!738556 () Bool)

(declare-fun res!496526 () Bool)

(declare-fun e!413031 () Bool)

(assert (=> b!738556 (=> (not res!496526) (not e!413031))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41389 0))(
  ( (array!41390 (arr!19808 (Array (_ BitVec 32) (_ BitVec 64))) (size!20229 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41389)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!738556 (= res!496526 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19808 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!496523 () Bool)

(declare-fun e!413042 () Bool)

(assert (=> start!65216 (=> (not res!496523) (not e!413042))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65216 (= res!496523 (validMask!0 mask!3328))))

(assert (=> start!65216 e!413042))

(assert (=> start!65216 true))

(declare-fun array_inv!15604 (array!41389) Bool)

(assert (=> start!65216 (array_inv!15604 a!3186)))

(declare-fun e!413039 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7408 0))(
  ( (MissingZero!7408 (index!32000 (_ BitVec 32))) (Found!7408 (index!32001 (_ BitVec 32))) (Intermediate!7408 (undefined!8220 Bool) (index!32002 (_ BitVec 32)) (x!62990 (_ BitVec 32))) (Undefined!7408) (MissingVacant!7408 (index!32003 (_ BitVec 32))) )
))
(declare-fun lt!327838 () SeekEntryResult!7408)

(declare-fun b!738557 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41389 (_ BitVec 32)) SeekEntryResult!7408)

(assert (=> b!738557 (= e!413039 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19808 a!3186) j!159) a!3186 mask!3328) lt!327838))))

(declare-fun b!738558 () Bool)

(declare-fun res!496520 () Bool)

(assert (=> b!738558 (=> (not res!496520) (not e!413031))))

(assert (=> b!738558 (= res!496520 e!413039)))

(declare-fun c!81402 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!738558 (= c!81402 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!738559 () Bool)

(declare-fun res!496516 () Bool)

(assert (=> b!738559 (=> (not res!496516) (not e!413042))))

(assert (=> b!738559 (= res!496516 (and (= (size!20229 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20229 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20229 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738560 () Bool)

(declare-fun e!413034 () Bool)

(assert (=> b!738560 (= e!413034 true)))

(declare-fun lt!327833 () (_ BitVec 32))

(declare-fun lt!327836 () (_ BitVec 64))

(declare-fun lt!327845 () array!41389)

(declare-fun lt!327842 () SeekEntryResult!7408)

(assert (=> b!738560 (= lt!327842 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327833 lt!327836 lt!327845 mask!3328))))

(declare-fun b!738561 () Bool)

(declare-datatypes ((Unit!25228 0))(
  ( (Unit!25229) )
))
(declare-fun e!413040 () Unit!25228)

(declare-fun Unit!25230 () Unit!25228)

(assert (=> b!738561 (= e!413040 Unit!25230)))

(assert (=> b!738561 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327833 (select (arr!19808 a!3186) j!159) a!3186 mask!3328) lt!327838)))

(declare-fun b!738562 () Bool)

(declare-fun res!496524 () Bool)

(assert (=> b!738562 (=> res!496524 e!413034)))

(declare-fun e!413033 () Bool)

(assert (=> b!738562 (= res!496524 e!413033)))

(declare-fun c!81401 () Bool)

(declare-fun lt!327844 () Bool)

(assert (=> b!738562 (= c!81401 lt!327844)))

(declare-fun b!738563 () Bool)

(declare-fun res!496527 () Bool)

(assert (=> b!738563 (=> (not res!496527) (not e!413042))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738563 (= res!496527 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738564 () Bool)

(declare-fun e!413037 () Bool)

(declare-fun e!413036 () Bool)

(assert (=> b!738564 (= e!413037 e!413036)))

(declare-fun res!496519 () Bool)

(assert (=> b!738564 (=> (not res!496519) (not e!413036))))

(declare-fun lt!327843 () SeekEntryResult!7408)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41389 (_ BitVec 32)) SeekEntryResult!7408)

(assert (=> b!738564 (= res!496519 (= (seekEntryOrOpen!0 (select (arr!19808 a!3186) j!159) a!3186 mask!3328) lt!327843))))

(assert (=> b!738564 (= lt!327843 (Found!7408 j!159))))

(declare-fun b!738565 () Bool)

(declare-fun Unit!25231 () Unit!25228)

(assert (=> b!738565 (= e!413040 Unit!25231)))

(declare-fun lt!327835 () SeekEntryResult!7408)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41389 (_ BitVec 32)) SeekEntryResult!7408)

(assert (=> b!738565 (= lt!327835 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19808 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!327837 () SeekEntryResult!7408)

(assert (=> b!738565 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327833 resIntermediateIndex!5 (select (arr!19808 a!3186) j!159) a!3186 mask!3328) lt!327837)))

(declare-fun b!738566 () Bool)

(declare-fun e!413035 () Bool)

(declare-fun e!413041 () Bool)

(assert (=> b!738566 (= e!413035 (not e!413041))))

(declare-fun res!496530 () Bool)

(assert (=> b!738566 (=> res!496530 e!413041)))

(declare-fun lt!327839 () SeekEntryResult!7408)

(assert (=> b!738566 (= res!496530 (or (not (is-Intermediate!7408 lt!327839)) (bvsge x!1131 (x!62990 lt!327839))))))

(assert (=> b!738566 (= lt!327837 (Found!7408 j!159))))

(assert (=> b!738566 e!413037))

(declare-fun res!496525 () Bool)

(assert (=> b!738566 (=> (not res!496525) (not e!413037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41389 (_ BitVec 32)) Bool)

(assert (=> b!738566 (= res!496525 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!327834 () Unit!25228)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41389 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25228)

(assert (=> b!738566 (= lt!327834 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!738567 () Bool)

(assert (=> b!738567 (= e!413039 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19808 a!3186) j!159) a!3186 mask!3328) (Found!7408 j!159)))))

(declare-fun b!738568 () Bool)

(declare-fun res!496528 () Bool)

(declare-fun e!413038 () Bool)

(assert (=> b!738568 (=> (not res!496528) (not e!413038))))

(assert (=> b!738568 (= res!496528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738569 () Bool)

(declare-fun res!496522 () Bool)

(assert (=> b!738569 (=> (not res!496522) (not e!413042))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738569 (= res!496522 (validKeyInArray!0 k!2102))))

(declare-fun b!738570 () Bool)

(assert (=> b!738570 (= e!413042 e!413038)))

(declare-fun res!496531 () Bool)

(assert (=> b!738570 (=> (not res!496531) (not e!413038))))

(declare-fun lt!327841 () SeekEntryResult!7408)

(assert (=> b!738570 (= res!496531 (or (= lt!327841 (MissingZero!7408 i!1173)) (= lt!327841 (MissingVacant!7408 i!1173))))))

(assert (=> b!738570 (= lt!327841 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!738571 () Bool)

(declare-fun res!496529 () Bool)

(assert (=> b!738571 (=> (not res!496529) (not e!413038))))

(assert (=> b!738571 (= res!496529 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20229 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20229 a!3186))))))

(declare-fun b!738572 () Bool)

(declare-fun res!496515 () Bool)

(assert (=> b!738572 (=> (not res!496515) (not e!413042))))

(assert (=> b!738572 (= res!496515 (validKeyInArray!0 (select (arr!19808 a!3186) j!159)))))

(declare-fun b!738573 () Bool)

(assert (=> b!738573 (= e!413041 e!413034)))

(declare-fun res!496521 () Bool)

(assert (=> b!738573 (=> res!496521 e!413034)))

(assert (=> b!738573 (= res!496521 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!327833 #b00000000000000000000000000000000) (bvsge lt!327833 (size!20229 a!3186))))))

(declare-fun lt!327832 () Unit!25228)

(assert (=> b!738573 (= lt!327832 e!413040)))

(declare-fun c!81403 () Bool)

(assert (=> b!738573 (= c!81403 lt!327844)))

(assert (=> b!738573 (= lt!327844 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738573 (= lt!327833 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!738574 () Bool)

(assert (=> b!738574 (= e!413036 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19808 a!3186) j!159) a!3186 mask!3328) lt!327843))))

(declare-fun b!738575 () Bool)

(declare-fun res!496532 () Bool)

(assert (=> b!738575 (=> (not res!496532) (not e!413038))))

(declare-datatypes ((List!13810 0))(
  ( (Nil!13807) (Cons!13806 (h!14878 (_ BitVec 64)) (t!20125 List!13810)) )
))
(declare-fun arrayNoDuplicates!0 (array!41389 (_ BitVec 32) List!13810) Bool)

(assert (=> b!738575 (= res!496532 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13807))))

(declare-fun b!738576 () Bool)

(assert (=> b!738576 (= e!413033 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327833 (select (arr!19808 a!3186) j!159) a!3186 mask!3328) lt!327838)))))

(declare-fun b!738577 () Bool)

(assert (=> b!738577 (= e!413038 e!413031)))

(declare-fun res!496517 () Bool)

(assert (=> b!738577 (=> (not res!496517) (not e!413031))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738577 (= res!496517 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19808 a!3186) j!159) mask!3328) (select (arr!19808 a!3186) j!159) a!3186 mask!3328) lt!327838))))

(assert (=> b!738577 (= lt!327838 (Intermediate!7408 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738578 () Bool)

(assert (=> b!738578 (= e!413031 e!413035)))

(declare-fun res!496518 () Bool)

(assert (=> b!738578 (=> (not res!496518) (not e!413035))))

(declare-fun lt!327840 () SeekEntryResult!7408)

(assert (=> b!738578 (= res!496518 (= lt!327840 lt!327839))))

(assert (=> b!738578 (= lt!327839 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!327836 lt!327845 mask!3328))))

(assert (=> b!738578 (= lt!327840 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!327836 mask!3328) lt!327836 lt!327845 mask!3328))))

(assert (=> b!738578 (= lt!327836 (select (store (arr!19808 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!738578 (= lt!327845 (array!41390 (store (arr!19808 a!3186) i!1173 k!2102) (size!20229 a!3186)))))

(declare-fun b!738579 () Bool)

(assert (=> b!738579 (= e!413033 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!327833 resIntermediateIndex!5 (select (arr!19808 a!3186) j!159) a!3186 mask!3328) lt!327837)))))

(assert (= (and start!65216 res!496523) b!738559))

(assert (= (and b!738559 res!496516) b!738572))

(assert (= (and b!738572 res!496515) b!738569))

(assert (= (and b!738569 res!496522) b!738563))

(assert (= (and b!738563 res!496527) b!738570))

(assert (= (and b!738570 res!496531) b!738568))

(assert (= (and b!738568 res!496528) b!738575))

(assert (= (and b!738575 res!496532) b!738571))

(assert (= (and b!738571 res!496529) b!738577))

(assert (= (and b!738577 res!496517) b!738556))

(assert (= (and b!738556 res!496526) b!738558))

(assert (= (and b!738558 c!81402) b!738557))

(assert (= (and b!738558 (not c!81402)) b!738567))

(assert (= (and b!738558 res!496520) b!738578))

(assert (= (and b!738578 res!496518) b!738566))

(assert (= (and b!738566 res!496525) b!738564))

(assert (= (and b!738564 res!496519) b!738574))

(assert (= (and b!738566 (not res!496530)) b!738573))

(assert (= (and b!738573 c!81403) b!738561))

(assert (= (and b!738573 (not c!81403)) b!738565))

(assert (= (and b!738573 (not res!496521)) b!738562))

(assert (= (and b!738562 c!81401) b!738576))

(assert (= (and b!738562 (not c!81401)) b!738579))

(assert (= (and b!738562 (not res!496524)) b!738560))

(declare-fun m!690157 () Bool)

(assert (=> b!738573 m!690157))

(declare-fun m!690159 () Bool)

(assert (=> b!738568 m!690159))

(declare-fun m!690161 () Bool)

(assert (=> b!738569 m!690161))

(declare-fun m!690163 () Bool)

(assert (=> b!738576 m!690163))

(assert (=> b!738576 m!690163))

(declare-fun m!690165 () Bool)

(assert (=> b!738576 m!690165))

(declare-fun m!690167 () Bool)

(assert (=> b!738560 m!690167))

(assert (=> b!738567 m!690163))

(assert (=> b!738567 m!690163))

(declare-fun m!690169 () Bool)

(assert (=> b!738567 m!690169))

(assert (=> b!738565 m!690163))

(assert (=> b!738565 m!690163))

(assert (=> b!738565 m!690169))

(assert (=> b!738565 m!690163))

(declare-fun m!690171 () Bool)

(assert (=> b!738565 m!690171))

(assert (=> b!738564 m!690163))

(assert (=> b!738564 m!690163))

(declare-fun m!690173 () Bool)

(assert (=> b!738564 m!690173))

(declare-fun m!690175 () Bool)

(assert (=> b!738570 m!690175))

(assert (=> b!738574 m!690163))

(assert (=> b!738574 m!690163))

(declare-fun m!690177 () Bool)

(assert (=> b!738574 m!690177))

(declare-fun m!690179 () Bool)

(assert (=> start!65216 m!690179))

(declare-fun m!690181 () Bool)

(assert (=> start!65216 m!690181))

(declare-fun m!690183 () Bool)

(assert (=> b!738563 m!690183))

(declare-fun m!690185 () Bool)

(assert (=> b!738566 m!690185))

(declare-fun m!690187 () Bool)

(assert (=> b!738566 m!690187))

(assert (=> b!738572 m!690163))

(assert (=> b!738572 m!690163))

(declare-fun m!690189 () Bool)

(assert (=> b!738572 m!690189))

(declare-fun m!690191 () Bool)

(assert (=> b!738578 m!690191))

(declare-fun m!690193 () Bool)

(assert (=> b!738578 m!690193))

(assert (=> b!738578 m!690191))

(declare-fun m!690195 () Bool)

(assert (=> b!738578 m!690195))

(declare-fun m!690197 () Bool)

(assert (=> b!738578 m!690197))

(declare-fun m!690199 () Bool)

(assert (=> b!738578 m!690199))

(assert (=> b!738561 m!690163))

(assert (=> b!738561 m!690163))

(assert (=> b!738561 m!690165))

(assert (=> b!738557 m!690163))

(assert (=> b!738557 m!690163))

(declare-fun m!690201 () Bool)

(assert (=> b!738557 m!690201))

(assert (=> b!738577 m!690163))

(assert (=> b!738577 m!690163))

(declare-fun m!690203 () Bool)

(assert (=> b!738577 m!690203))

(assert (=> b!738577 m!690203))

(assert (=> b!738577 m!690163))

(declare-fun m!690205 () Bool)

(assert (=> b!738577 m!690205))

(declare-fun m!690207 () Bool)

(assert (=> b!738575 m!690207))

(assert (=> b!738579 m!690163))

(assert (=> b!738579 m!690163))

(assert (=> b!738579 m!690171))

(declare-fun m!690209 () Bool)

(assert (=> b!738556 m!690209))

(push 1)

