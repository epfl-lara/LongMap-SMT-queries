; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65702 () Bool)

(assert start!65702)

(declare-fun b!753632 () Bool)

(declare-fun e!420331 () Bool)

(declare-fun e!420332 () Bool)

(assert (=> b!753632 (= e!420331 e!420332)))

(declare-fun res!509127 () Bool)

(assert (=> b!753632 (=> res!509127 e!420332)))

(declare-datatypes ((SeekEntryResult!7651 0))(
  ( (MissingZero!7651 (index!32972 (_ BitVec 32))) (Found!7651 (index!32973 (_ BitVec 32))) (Intermediate!7651 (undefined!8463 Bool) (index!32974 (_ BitVec 32)) (x!63881 (_ BitVec 32))) (Undefined!7651) (MissingVacant!7651 (index!32975 (_ BitVec 32))) )
))
(declare-fun lt!335329 () SeekEntryResult!7651)

(declare-fun lt!335330 () SeekEntryResult!7651)

(assert (=> b!753632 (= res!509127 (not (= lt!335329 lt!335330)))))

(declare-datatypes ((array!41875 0))(
  ( (array!41876 (arr!20051 (Array (_ BitVec 32) (_ BitVec 64))) (size!20472 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41875)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41875 (_ BitVec 32)) SeekEntryResult!7651)

(assert (=> b!753632 (= lt!335329 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20051 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753633 () Bool)

(declare-datatypes ((Unit!25984 0))(
  ( (Unit!25985) )
))
(declare-fun e!420335 () Unit!25984)

(declare-fun Unit!25986 () Unit!25984)

(assert (=> b!753633 (= e!420335 Unit!25986)))

(assert (=> b!753633 false))

(declare-fun b!753634 () Bool)

(declare-fun res!509138 () Bool)

(declare-fun e!420337 () Bool)

(assert (=> b!753634 (=> (not res!509138) (not e!420337))))

(declare-fun e!420334 () Bool)

(assert (=> b!753634 (= res!509138 e!420334)))

(declare-fun c!82636 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!753634 (= c!82636 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!509130 () Bool)

(declare-fun e!420336 () Bool)

(assert (=> start!65702 (=> (not res!509130) (not e!420336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65702 (= res!509130 (validMask!0 mask!3328))))

(assert (=> start!65702 e!420336))

(assert (=> start!65702 true))

(declare-fun array_inv!15847 (array!41875) Bool)

(assert (=> start!65702 (array_inv!15847 a!3186)))

(declare-fun b!753635 () Bool)

(declare-fun e!420341 () Bool)

(declare-fun lt!335328 () SeekEntryResult!7651)

(assert (=> b!753635 (= e!420341 (= lt!335328 lt!335329))))

(declare-fun b!753636 () Bool)

(declare-fun e!420338 () Bool)

(assert (=> b!753636 (= e!420338 e!420337)))

(declare-fun res!509129 () Bool)

(assert (=> b!753636 (=> (not res!509129) (not e!420337))))

(declare-fun lt!335333 () SeekEntryResult!7651)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41875 (_ BitVec 32)) SeekEntryResult!7651)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753636 (= res!509129 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20051 a!3186) j!159) mask!3328) (select (arr!20051 a!3186) j!159) a!3186 mask!3328) lt!335333))))

(assert (=> b!753636 (= lt!335333 (Intermediate!7651 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753637 () Bool)

(declare-fun res!509124 () Bool)

(assert (=> b!753637 (=> (not res!509124) (not e!420336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753637 (= res!509124 (validKeyInArray!0 (select (arr!20051 a!3186) j!159)))))

(declare-fun b!753638 () Bool)

(declare-fun res!509128 () Bool)

(assert (=> b!753638 (=> (not res!509128) (not e!420336))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!753638 (= res!509128 (validKeyInArray!0 k!2102))))

(declare-fun b!753639 () Bool)

(declare-fun res!509139 () Bool)

(assert (=> b!753639 (=> (not res!509139) (not e!420336))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!753639 (= res!509139 (and (= (size!20472 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20472 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20472 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753640 () Bool)

(declare-fun res!509140 () Bool)

(assert (=> b!753640 (=> (not res!509140) (not e!420338))))

(assert (=> b!753640 (= res!509140 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20472 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20472 a!3186))))))

(declare-fun b!753641 () Bool)

(declare-fun Unit!25987 () Unit!25984)

(assert (=> b!753641 (= e!420335 Unit!25987)))

(declare-fun b!753642 () Bool)

(declare-fun res!509133 () Bool)

(assert (=> b!753642 (=> (not res!509133) (not e!420338))))

(declare-datatypes ((List!14053 0))(
  ( (Nil!14050) (Cons!14049 (h!15121 (_ BitVec 64)) (t!20368 List!14053)) )
))
(declare-fun arrayNoDuplicates!0 (array!41875 (_ BitVec 32) List!14053) Bool)

(assert (=> b!753642 (= res!509133 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14050))))

(declare-fun b!753643 () Bool)

(assert (=> b!753643 (= e!420334 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20051 a!3186) j!159) a!3186 mask!3328) lt!335333))))

(declare-fun b!753644 () Bool)

(declare-fun res!509125 () Bool)

(assert (=> b!753644 (=> (not res!509125) (not e!420341))))

(declare-fun lt!335332 () (_ BitVec 64))

(declare-fun lt!335327 () array!41875)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41875 (_ BitVec 32)) SeekEntryResult!7651)

(assert (=> b!753644 (= res!509125 (= (seekEntryOrOpen!0 lt!335332 lt!335327 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335332 lt!335327 mask!3328)))))

(declare-fun b!753645 () Bool)

(declare-fun e!420339 () Bool)

(assert (=> b!753645 (= e!420332 e!420339)))

(declare-fun res!509136 () Bool)

(assert (=> b!753645 (=> res!509136 e!420339)))

(declare-fun lt!335324 () (_ BitVec 64))

(assert (=> b!753645 (= res!509136 (= lt!335324 lt!335332))))

(assert (=> b!753645 (= lt!335324 (select (store (arr!20051 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!753646 () Bool)

(declare-fun res!509135 () Bool)

(assert (=> b!753646 (=> (not res!509135) (not e!420336))))

(declare-fun arrayContainsKey!0 (array!41875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753646 (= res!509135 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun e!420340 () Bool)

(declare-fun b!753647 () Bool)

(assert (=> b!753647 (= e!420340 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20051 a!3186) j!159) a!3186 mask!3328) lt!335330))))

(declare-fun b!753648 () Bool)

(assert (=> b!753648 (= e!420334 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20051 a!3186) j!159) a!3186 mask!3328) (Found!7651 j!159)))))

(declare-fun b!753649 () Bool)

(assert (=> b!753649 (= e!420339 true)))

(assert (=> b!753649 e!420341))

(declare-fun res!509134 () Bool)

(assert (=> b!753649 (=> (not res!509134) (not e!420341))))

(assert (=> b!753649 (= res!509134 (= lt!335324 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335331 () Unit!25984)

(assert (=> b!753649 (= lt!335331 e!420335)))

(declare-fun c!82635 () Bool)

(assert (=> b!753649 (= c!82635 (= lt!335324 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753650 () Bool)

(declare-fun res!509126 () Bool)

(assert (=> b!753650 (=> (not res!509126) (not e!420338))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41875 (_ BitVec 32)) Bool)

(assert (=> b!753650 (= res!509126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753651 () Bool)

(declare-fun res!509131 () Bool)

(assert (=> b!753651 (=> (not res!509131) (not e!420337))))

(assert (=> b!753651 (= res!509131 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20051 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753652 () Bool)

(declare-fun e!420333 () Bool)

(assert (=> b!753652 (= e!420333 (not e!420331))))

(declare-fun res!509141 () Bool)

(assert (=> b!753652 (=> res!509141 e!420331)))

(declare-fun lt!335325 () SeekEntryResult!7651)

(assert (=> b!753652 (= res!509141 (or (not (is-Intermediate!7651 lt!335325)) (bvslt x!1131 (x!63881 lt!335325)) (not (= x!1131 (x!63881 lt!335325))) (not (= index!1321 (index!32974 lt!335325)))))))

(assert (=> b!753652 e!420340))

(declare-fun res!509123 () Bool)

(assert (=> b!753652 (=> (not res!509123) (not e!420340))))

(assert (=> b!753652 (= res!509123 (= lt!335328 lt!335330))))

(assert (=> b!753652 (= lt!335330 (Found!7651 j!159))))

(assert (=> b!753652 (= lt!335328 (seekEntryOrOpen!0 (select (arr!20051 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!753652 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335323 () Unit!25984)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41875 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25984)

(assert (=> b!753652 (= lt!335323 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753653 () Bool)

(assert (=> b!753653 (= e!420337 e!420333)))

(declare-fun res!509137 () Bool)

(assert (=> b!753653 (=> (not res!509137) (not e!420333))))

(declare-fun lt!335322 () SeekEntryResult!7651)

(assert (=> b!753653 (= res!509137 (= lt!335322 lt!335325))))

(assert (=> b!753653 (= lt!335325 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335332 lt!335327 mask!3328))))

(assert (=> b!753653 (= lt!335322 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335332 mask!3328) lt!335332 lt!335327 mask!3328))))

(assert (=> b!753653 (= lt!335332 (select (store (arr!20051 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!753653 (= lt!335327 (array!41876 (store (arr!20051 a!3186) i!1173 k!2102) (size!20472 a!3186)))))

(declare-fun b!753654 () Bool)

(assert (=> b!753654 (= e!420336 e!420338)))

(declare-fun res!509132 () Bool)

(assert (=> b!753654 (=> (not res!509132) (not e!420338))))

(declare-fun lt!335326 () SeekEntryResult!7651)

(assert (=> b!753654 (= res!509132 (or (= lt!335326 (MissingZero!7651 i!1173)) (= lt!335326 (MissingVacant!7651 i!1173))))))

(assert (=> b!753654 (= lt!335326 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(assert (= (and start!65702 res!509130) b!753639))

(assert (= (and b!753639 res!509139) b!753637))

(assert (= (and b!753637 res!509124) b!753638))

(assert (= (and b!753638 res!509128) b!753646))

(assert (= (and b!753646 res!509135) b!753654))

(assert (= (and b!753654 res!509132) b!753650))

(assert (= (and b!753650 res!509126) b!753642))

(assert (= (and b!753642 res!509133) b!753640))

(assert (= (and b!753640 res!509140) b!753636))

(assert (= (and b!753636 res!509129) b!753651))

(assert (= (and b!753651 res!509131) b!753634))

(assert (= (and b!753634 c!82636) b!753643))

(assert (= (and b!753634 (not c!82636)) b!753648))

(assert (= (and b!753634 res!509138) b!753653))

(assert (= (and b!753653 res!509137) b!753652))

(assert (= (and b!753652 res!509123) b!753647))

(assert (= (and b!753652 (not res!509141)) b!753632))

(assert (= (and b!753632 (not res!509127)) b!753645))

(assert (= (and b!753645 (not res!509136)) b!753649))

(assert (= (and b!753649 c!82635) b!753633))

(assert (= (and b!753649 (not c!82635)) b!753641))

(assert (= (and b!753649 res!509134) b!753644))

(assert (= (and b!753644 res!509125) b!753635))

(declare-fun m!702279 () Bool)

(assert (=> b!753638 m!702279))

(declare-fun m!702281 () Bool)

(assert (=> b!753647 m!702281))

(assert (=> b!753647 m!702281))

(declare-fun m!702283 () Bool)

(assert (=> b!753647 m!702283))

(assert (=> b!753637 m!702281))

(assert (=> b!753637 m!702281))

(declare-fun m!702285 () Bool)

(assert (=> b!753637 m!702285))

(assert (=> b!753636 m!702281))

(assert (=> b!753636 m!702281))

(declare-fun m!702287 () Bool)

(assert (=> b!753636 m!702287))

(assert (=> b!753636 m!702287))

(assert (=> b!753636 m!702281))

(declare-fun m!702289 () Bool)

(assert (=> b!753636 m!702289))

(declare-fun m!702291 () Bool)

(assert (=> b!753645 m!702291))

(declare-fun m!702293 () Bool)

(assert (=> b!753645 m!702293))

(declare-fun m!702295 () Bool)

(assert (=> start!65702 m!702295))

(declare-fun m!702297 () Bool)

(assert (=> start!65702 m!702297))

(declare-fun m!702299 () Bool)

(assert (=> b!753646 m!702299))

(assert (=> b!753648 m!702281))

(assert (=> b!753648 m!702281))

(declare-fun m!702301 () Bool)

(assert (=> b!753648 m!702301))

(declare-fun m!702303 () Bool)

(assert (=> b!753654 m!702303))

(declare-fun m!702305 () Bool)

(assert (=> b!753651 m!702305))

(declare-fun m!702307 () Bool)

(assert (=> b!753650 m!702307))

(declare-fun m!702309 () Bool)

(assert (=> b!753642 m!702309))

(assert (=> b!753643 m!702281))

(assert (=> b!753643 m!702281))

(declare-fun m!702311 () Bool)

(assert (=> b!753643 m!702311))

(assert (=> b!753653 m!702291))

(declare-fun m!702313 () Bool)

(assert (=> b!753653 m!702313))

(declare-fun m!702315 () Bool)

(assert (=> b!753653 m!702315))

(declare-fun m!702317 () Bool)

(assert (=> b!753653 m!702317))

(assert (=> b!753653 m!702315))

(declare-fun m!702319 () Bool)

(assert (=> b!753653 m!702319))

(assert (=> b!753652 m!702281))

(assert (=> b!753652 m!702281))

(declare-fun m!702321 () Bool)

(assert (=> b!753652 m!702321))

(declare-fun m!702323 () Bool)

(assert (=> b!753652 m!702323))

(declare-fun m!702325 () Bool)

(assert (=> b!753652 m!702325))

(declare-fun m!702327 () Bool)

(assert (=> b!753644 m!702327))

(declare-fun m!702329 () Bool)

(assert (=> b!753644 m!702329))

(assert (=> b!753632 m!702281))

(assert (=> b!753632 m!702281))

(assert (=> b!753632 m!702301))

(push 1)

