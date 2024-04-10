; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66280 () Bool)

(assert start!66280)

(declare-fun b!763792 () Bool)

(declare-fun res!516719 () Bool)

(declare-fun e!425498 () Bool)

(assert (=> b!763792 (=> (not res!516719) (not e!425498))))

(declare-datatypes ((array!42185 0))(
  ( (array!42186 (arr!20200 (Array (_ BitVec 32) (_ BitVec 64))) (size!20621 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42185)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42185 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763792 (= res!516719 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763793 () Bool)

(declare-fun res!516714 () Bool)

(assert (=> b!763793 (=> (not res!516714) (not e!425498))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!763793 (= res!516714 (and (= (size!20621 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20621 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20621 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763794 () Bool)

(declare-fun res!516724 () Bool)

(assert (=> b!763794 (=> (not res!516724) (not e!425498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763794 (= res!516724 (validKeyInArray!0 k0!2102))))

(declare-fun b!763795 () Bool)

(declare-fun res!516717 () Bool)

(declare-fun e!425497 () Bool)

(assert (=> b!763795 (=> (not res!516717) (not e!425497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42185 (_ BitVec 32)) Bool)

(assert (=> b!763795 (= res!516717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763796 () Bool)

(declare-fun res!516720 () Bool)

(assert (=> b!763796 (=> (not res!516720) (not e!425497))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763796 (= res!516720 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20621 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20621 a!3186))))))

(declare-fun res!516722 () Bool)

(assert (=> start!66280 (=> (not res!516722) (not e!425498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66280 (= res!516722 (validMask!0 mask!3328))))

(assert (=> start!66280 e!425498))

(assert (=> start!66280 true))

(declare-fun array_inv!15996 (array!42185) Bool)

(assert (=> start!66280 (array_inv!15996 a!3186)))

(declare-fun b!763797 () Bool)

(declare-fun res!516718 () Bool)

(assert (=> b!763797 (=> (not res!516718) (not e!425498))))

(assert (=> b!763797 (= res!516718 (validKeyInArray!0 (select (arr!20200 a!3186) j!159)))))

(declare-fun b!763798 () Bool)

(assert (=> b!763798 (= e!425498 e!425497)))

(declare-fun res!516716 () Bool)

(assert (=> b!763798 (=> (not res!516716) (not e!425497))))

(declare-datatypes ((SeekEntryResult!7800 0))(
  ( (MissingZero!7800 (index!33568 (_ BitVec 32))) (Found!7800 (index!33569 (_ BitVec 32))) (Intermediate!7800 (undefined!8612 Bool) (index!33570 (_ BitVec 32)) (x!64468 (_ BitVec 32))) (Undefined!7800) (MissingVacant!7800 (index!33571 (_ BitVec 32))) )
))
(declare-fun lt!339942 () SeekEntryResult!7800)

(assert (=> b!763798 (= res!516716 (or (= lt!339942 (MissingZero!7800 i!1173)) (= lt!339942 (MissingVacant!7800 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42185 (_ BitVec 32)) SeekEntryResult!7800)

(assert (=> b!763798 (= lt!339942 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!763799 () Bool)

(declare-fun e!425496 () Bool)

(assert (=> b!763799 (= e!425496 false)))

(declare-fun lt!339947 () (_ BitVec 64))

(declare-fun lt!339946 () array!42185)

(declare-fun lt!339945 () SeekEntryResult!7800)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42185 (_ BitVec 32)) SeekEntryResult!7800)

(assert (=> b!763799 (= lt!339945 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339947 lt!339946 mask!3328))))

(declare-fun lt!339944 () SeekEntryResult!7800)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763799 (= lt!339944 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339947 mask!3328) lt!339947 lt!339946 mask!3328))))

(assert (=> b!763799 (= lt!339947 (select (store (arr!20200 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!763799 (= lt!339946 (array!42186 (store (arr!20200 a!3186) i!1173 k0!2102) (size!20621 a!3186)))))

(declare-fun b!763800 () Bool)

(assert (=> b!763800 (= e!425497 e!425496)))

(declare-fun res!516715 () Bool)

(assert (=> b!763800 (=> (not res!516715) (not e!425496))))

(declare-fun lt!339943 () SeekEntryResult!7800)

(assert (=> b!763800 (= res!516715 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20200 a!3186) j!159) mask!3328) (select (arr!20200 a!3186) j!159) a!3186 mask!3328) lt!339943))))

(assert (=> b!763800 (= lt!339943 (Intermediate!7800 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!425495 () Bool)

(declare-fun b!763801 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42185 (_ BitVec 32)) SeekEntryResult!7800)

(assert (=> b!763801 (= e!425495 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20200 a!3186) j!159) a!3186 mask!3328) (Found!7800 j!159)))))

(declare-fun b!763802 () Bool)

(declare-fun res!516723 () Bool)

(assert (=> b!763802 (=> (not res!516723) (not e!425497))))

(declare-datatypes ((List!14202 0))(
  ( (Nil!14199) (Cons!14198 (h!15282 (_ BitVec 64)) (t!20517 List!14202)) )
))
(declare-fun arrayNoDuplicates!0 (array!42185 (_ BitVec 32) List!14202) Bool)

(assert (=> b!763802 (= res!516723 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14199))))

(declare-fun b!763803 () Bool)

(declare-fun res!516721 () Bool)

(assert (=> b!763803 (=> (not res!516721) (not e!425496))))

(assert (=> b!763803 (= res!516721 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20200 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763804 () Bool)

(assert (=> b!763804 (= e!425495 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20200 a!3186) j!159) a!3186 mask!3328) lt!339943))))

(declare-fun b!763805 () Bool)

(declare-fun res!516713 () Bool)

(assert (=> b!763805 (=> (not res!516713) (not e!425496))))

(assert (=> b!763805 (= res!516713 e!425495)))

(declare-fun c!83926 () Bool)

(assert (=> b!763805 (= c!83926 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!66280 res!516722) b!763793))

(assert (= (and b!763793 res!516714) b!763797))

(assert (= (and b!763797 res!516718) b!763794))

(assert (= (and b!763794 res!516724) b!763792))

(assert (= (and b!763792 res!516719) b!763798))

(assert (= (and b!763798 res!516716) b!763795))

(assert (= (and b!763795 res!516717) b!763802))

(assert (= (and b!763802 res!516723) b!763796))

(assert (= (and b!763796 res!516720) b!763800))

(assert (= (and b!763800 res!516715) b!763803))

(assert (= (and b!763803 res!516721) b!763805))

(assert (= (and b!763805 c!83926) b!763804))

(assert (= (and b!763805 (not c!83926)) b!763801))

(assert (= (and b!763805 res!516713) b!763799))

(declare-fun m!710237 () Bool)

(assert (=> b!763798 m!710237))

(declare-fun m!710239 () Bool)

(assert (=> b!763795 m!710239))

(declare-fun m!710241 () Bool)

(assert (=> b!763804 m!710241))

(assert (=> b!763804 m!710241))

(declare-fun m!710243 () Bool)

(assert (=> b!763804 m!710243))

(declare-fun m!710245 () Bool)

(assert (=> b!763802 m!710245))

(declare-fun m!710247 () Bool)

(assert (=> b!763792 m!710247))

(assert (=> b!763800 m!710241))

(assert (=> b!763800 m!710241))

(declare-fun m!710249 () Bool)

(assert (=> b!763800 m!710249))

(assert (=> b!763800 m!710249))

(assert (=> b!763800 m!710241))

(declare-fun m!710251 () Bool)

(assert (=> b!763800 m!710251))

(declare-fun m!710253 () Bool)

(assert (=> b!763803 m!710253))

(assert (=> b!763797 m!710241))

(assert (=> b!763797 m!710241))

(declare-fun m!710255 () Bool)

(assert (=> b!763797 m!710255))

(declare-fun m!710257 () Bool)

(assert (=> b!763799 m!710257))

(declare-fun m!710259 () Bool)

(assert (=> b!763799 m!710259))

(declare-fun m!710261 () Bool)

(assert (=> b!763799 m!710261))

(declare-fun m!710263 () Bool)

(assert (=> b!763799 m!710263))

(assert (=> b!763799 m!710261))

(declare-fun m!710265 () Bool)

(assert (=> b!763799 m!710265))

(declare-fun m!710267 () Bool)

(assert (=> start!66280 m!710267))

(declare-fun m!710269 () Bool)

(assert (=> start!66280 m!710269))

(assert (=> b!763801 m!710241))

(assert (=> b!763801 m!710241))

(declare-fun m!710271 () Bool)

(assert (=> b!763801 m!710271))

(declare-fun m!710273 () Bool)

(assert (=> b!763794 m!710273))

(check-sat (not b!763798) (not start!66280) (not b!763795) (not b!763794) (not b!763799) (not b!763802) (not b!763801) (not b!763792) (not b!763800) (not b!763797) (not b!763804))
(check-sat)
