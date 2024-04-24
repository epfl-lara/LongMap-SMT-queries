; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66416 () Bool)

(assert start!66416)

(declare-fun b!764791 () Bool)

(declare-fun res!517291 () Bool)

(declare-fun e!426050 () Bool)

(assert (=> b!764791 (=> (not res!517291) (not e!426050))))

(declare-datatypes ((array!42199 0))(
  ( (array!42200 (arr!20203 (Array (_ BitVec 32) (_ BitVec 64))) (size!20623 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42199)

(declare-datatypes ((List!14112 0))(
  ( (Nil!14109) (Cons!14108 (h!15198 (_ BitVec 64)) (t!20419 List!14112)) )
))
(declare-fun arrayNoDuplicates!0 (array!42199 (_ BitVec 32) List!14112) Bool)

(assert (=> b!764791 (= res!517291 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14109))))

(declare-fun b!764792 () Bool)

(declare-fun res!517300 () Bool)

(declare-fun e!426049 () Bool)

(assert (=> b!764792 (=> (not res!517300) (not e!426049))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764792 (= res!517300 (validKeyInArray!0 k0!2102))))

(declare-fun b!764793 () Bool)

(declare-fun res!517298 () Bool)

(assert (=> b!764793 (=> (not res!517298) (not e!426049))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!764793 (= res!517298 (validKeyInArray!0 (select (arr!20203 a!3186) j!159)))))

(declare-fun b!764794 () Bool)

(declare-fun res!517301 () Bool)

(declare-fun e!426052 () Bool)

(assert (=> b!764794 (=> (not res!517301) (not e!426052))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!764794 (= res!517301 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20203 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!7759 0))(
  ( (MissingZero!7759 (index!33404 (_ BitVec 32))) (Found!7759 (index!33405 (_ BitVec 32))) (Intermediate!7759 (undefined!8571 Bool) (index!33406 (_ BitVec 32)) (x!64462 (_ BitVec 32))) (Undefined!7759) (MissingVacant!7759 (index!33407 (_ BitVec 32))) )
))
(declare-fun lt!340323 () SeekEntryResult!7759)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!426053 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!764795 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42199 (_ BitVec 32)) SeekEntryResult!7759)

(assert (=> b!764795 (= e!426053 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20203 a!3186) j!159) a!3186 mask!3328) lt!340323))))

(declare-fun b!764796 () Bool)

(declare-fun res!517293 () Bool)

(assert (=> b!764796 (=> (not res!517293) (not e!426050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42199 (_ BitVec 32)) Bool)

(assert (=> b!764796 (= res!517293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!764797 () Bool)

(assert (=> b!764797 (= e!426049 e!426050)))

(declare-fun res!517295 () Bool)

(assert (=> b!764797 (=> (not res!517295) (not e!426050))))

(declare-fun lt!340326 () SeekEntryResult!7759)

(assert (=> b!764797 (= res!517295 (or (= lt!340326 (MissingZero!7759 i!1173)) (= lt!340326 (MissingVacant!7759 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42199 (_ BitVec 32)) SeekEntryResult!7759)

(assert (=> b!764797 (= lt!340326 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!517294 () Bool)

(assert (=> start!66416 (=> (not res!517294) (not e!426049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66416 (= res!517294 (validMask!0 mask!3328))))

(assert (=> start!66416 e!426049))

(assert (=> start!66416 true))

(declare-fun array_inv!16062 (array!42199) Bool)

(assert (=> start!66416 (array_inv!16062 a!3186)))

(declare-fun b!764798 () Bool)

(declare-fun res!517299 () Bool)

(assert (=> b!764798 (=> (not res!517299) (not e!426052))))

(assert (=> b!764798 (= res!517299 e!426053)))

(declare-fun c!84140 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764798 (= c!84140 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!764799 () Bool)

(declare-fun res!517297 () Bool)

(assert (=> b!764799 (=> (not res!517297) (not e!426050))))

(assert (=> b!764799 (= res!517297 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20623 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20623 a!3186))))))

(declare-fun b!764800 () Bool)

(assert (=> b!764800 (= e!426052 false)))

(declare-fun lt!340321 () SeekEntryResult!7759)

(declare-fun lt!340325 () array!42199)

(declare-fun lt!340322 () (_ BitVec 64))

(assert (=> b!764800 (= lt!340321 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340322 lt!340325 mask!3328))))

(declare-fun lt!340324 () SeekEntryResult!7759)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764800 (= lt!340324 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340322 mask!3328) lt!340322 lt!340325 mask!3328))))

(assert (=> b!764800 (= lt!340322 (select (store (arr!20203 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!764800 (= lt!340325 (array!42200 (store (arr!20203 a!3186) i!1173 k0!2102) (size!20623 a!3186)))))

(declare-fun b!764801 () Bool)

(declare-fun res!517292 () Bool)

(assert (=> b!764801 (=> (not res!517292) (not e!426049))))

(declare-fun arrayContainsKey!0 (array!42199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764801 (= res!517292 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764802 () Bool)

(declare-fun res!517290 () Bool)

(assert (=> b!764802 (=> (not res!517290) (not e!426049))))

(assert (=> b!764802 (= res!517290 (and (= (size!20623 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20623 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20623 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764803 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42199 (_ BitVec 32)) SeekEntryResult!7759)

(assert (=> b!764803 (= e!426053 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20203 a!3186) j!159) a!3186 mask!3328) (Found!7759 j!159)))))

(declare-fun b!764804 () Bool)

(assert (=> b!764804 (= e!426050 e!426052)))

(declare-fun res!517296 () Bool)

(assert (=> b!764804 (=> (not res!517296) (not e!426052))))

(assert (=> b!764804 (= res!517296 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20203 a!3186) j!159) mask!3328) (select (arr!20203 a!3186) j!159) a!3186 mask!3328) lt!340323))))

(assert (=> b!764804 (= lt!340323 (Intermediate!7759 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!66416 res!517294) b!764802))

(assert (= (and b!764802 res!517290) b!764793))

(assert (= (and b!764793 res!517298) b!764792))

(assert (= (and b!764792 res!517300) b!764801))

(assert (= (and b!764801 res!517292) b!764797))

(assert (= (and b!764797 res!517295) b!764796))

(assert (= (and b!764796 res!517293) b!764791))

(assert (= (and b!764791 res!517291) b!764799))

(assert (= (and b!764799 res!517297) b!764804))

(assert (= (and b!764804 res!517296) b!764794))

(assert (= (and b!764794 res!517301) b!764798))

(assert (= (and b!764798 c!84140) b!764795))

(assert (= (and b!764798 (not c!84140)) b!764803))

(assert (= (and b!764798 res!517299) b!764800))

(declare-fun m!711565 () Bool)

(assert (=> b!764793 m!711565))

(assert (=> b!764793 m!711565))

(declare-fun m!711567 () Bool)

(assert (=> b!764793 m!711567))

(assert (=> b!764803 m!711565))

(assert (=> b!764803 m!711565))

(declare-fun m!711569 () Bool)

(assert (=> b!764803 m!711569))

(assert (=> b!764795 m!711565))

(assert (=> b!764795 m!711565))

(declare-fun m!711571 () Bool)

(assert (=> b!764795 m!711571))

(declare-fun m!711573 () Bool)

(assert (=> b!764794 m!711573))

(declare-fun m!711575 () Bool)

(assert (=> b!764796 m!711575))

(declare-fun m!711577 () Bool)

(assert (=> b!764797 m!711577))

(declare-fun m!711579 () Bool)

(assert (=> b!764792 m!711579))

(declare-fun m!711581 () Bool)

(assert (=> start!66416 m!711581))

(declare-fun m!711583 () Bool)

(assert (=> start!66416 m!711583))

(assert (=> b!764804 m!711565))

(assert (=> b!764804 m!711565))

(declare-fun m!711585 () Bool)

(assert (=> b!764804 m!711585))

(assert (=> b!764804 m!711585))

(assert (=> b!764804 m!711565))

(declare-fun m!711587 () Bool)

(assert (=> b!764804 m!711587))

(declare-fun m!711589 () Bool)

(assert (=> b!764801 m!711589))

(declare-fun m!711591 () Bool)

(assert (=> b!764800 m!711591))

(declare-fun m!711593 () Bool)

(assert (=> b!764800 m!711593))

(declare-fun m!711595 () Bool)

(assert (=> b!764800 m!711595))

(declare-fun m!711597 () Bool)

(assert (=> b!764800 m!711597))

(assert (=> b!764800 m!711591))

(declare-fun m!711599 () Bool)

(assert (=> b!764800 m!711599))

(declare-fun m!711601 () Bool)

(assert (=> b!764791 m!711601))

(check-sat (not b!764791) (not b!764804) (not start!66416) (not b!764800) (not b!764792) (not b!764801) (not b!764803) (not b!764796) (not b!764797) (not b!764795) (not b!764793))
(check-sat)
