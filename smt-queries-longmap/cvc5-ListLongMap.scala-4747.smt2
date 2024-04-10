; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65542 () Bool)

(assert start!65542)

(declare-fun b!748297 () Bool)

(declare-fun res!504756 () Bool)

(declare-fun e!417681 () Bool)

(assert (=> b!748297 (=> res!504756 e!417681)))

(declare-datatypes ((array!41715 0))(
  ( (array!41716 (arr!19971 (Array (_ BitVec 32) (_ BitVec 64))) (size!20392 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41715)

(declare-fun lt!332642 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!748297 (= res!504756 (= (select (store (arr!19971 a!3186) i!1173 k!2102) index!1321) lt!332642))))

(declare-fun b!748298 () Bool)

(declare-fun res!504759 () Bool)

(declare-fun e!417685 () Bool)

(assert (=> b!748298 (=> (not res!504759) (not e!417685))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!748298 (= res!504759 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20392 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20392 a!3186))))))

(declare-fun b!748299 () Bool)

(declare-fun e!417682 () Bool)

(assert (=> b!748299 (= e!417685 e!417682)))

(declare-fun res!504753 () Bool)

(assert (=> b!748299 (=> (not res!504753) (not e!417682))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7571 0))(
  ( (MissingZero!7571 (index!32652 (_ BitVec 32))) (Found!7571 (index!32653 (_ BitVec 32))) (Intermediate!7571 (undefined!8383 Bool) (index!32654 (_ BitVec 32)) (x!63593 (_ BitVec 32))) (Undefined!7571) (MissingVacant!7571 (index!32655 (_ BitVec 32))) )
))
(declare-fun lt!332639 () SeekEntryResult!7571)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41715 (_ BitVec 32)) SeekEntryResult!7571)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748299 (= res!504753 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19971 a!3186) j!159) mask!3328) (select (arr!19971 a!3186) j!159) a!3186 mask!3328) lt!332639))))

(assert (=> b!748299 (= lt!332639 (Intermediate!7571 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748300 () Bool)

(declare-fun res!504751 () Bool)

(assert (=> b!748300 (=> (not res!504751) (not e!417682))))

(declare-fun e!417678 () Bool)

(assert (=> b!748300 (= res!504751 e!417678)))

(declare-fun c!82155 () Bool)

(assert (=> b!748300 (= c!82155 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748301 () Bool)

(declare-fun res!504760 () Bool)

(declare-fun e!417683 () Bool)

(assert (=> b!748301 (=> (not res!504760) (not e!417683))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748301 (= res!504760 (validKeyInArray!0 (select (arr!19971 a!3186) j!159)))))

(declare-fun b!748302 () Bool)

(declare-fun res!504758 () Bool)

(assert (=> b!748302 (=> (not res!504758) (not e!417683))))

(assert (=> b!748302 (= res!504758 (validKeyInArray!0 k!2102))))

(declare-fun b!748303 () Bool)

(assert (=> b!748303 (= e!417681 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!748303 (= (select (store (arr!19971 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!25664 0))(
  ( (Unit!25665) )
))
(declare-fun lt!332640 () Unit!25664)

(declare-fun e!417684 () Unit!25664)

(assert (=> b!748303 (= lt!332640 e!417684)))

(declare-fun c!82156 () Bool)

(assert (=> b!748303 (= c!82156 (= (select (store (arr!19971 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748304 () Bool)

(assert (=> b!748304 (= e!417678 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19971 a!3186) j!159) a!3186 mask!3328) lt!332639))))

(declare-fun b!748305 () Bool)

(declare-fun e!417679 () Bool)

(assert (=> b!748305 (= e!417679 (not e!417681))))

(declare-fun res!504763 () Bool)

(assert (=> b!748305 (=> res!504763 e!417681)))

(declare-fun lt!332643 () SeekEntryResult!7571)

(assert (=> b!748305 (= res!504763 (or (not (is-Intermediate!7571 lt!332643)) (bvslt x!1131 (x!63593 lt!332643)) (not (= x!1131 (x!63593 lt!332643))) (not (= index!1321 (index!32654 lt!332643)))))))

(declare-fun e!417686 () Bool)

(assert (=> b!748305 e!417686))

(declare-fun res!504752 () Bool)

(assert (=> b!748305 (=> (not res!504752) (not e!417686))))

(declare-fun lt!332636 () SeekEntryResult!7571)

(declare-fun lt!332641 () SeekEntryResult!7571)

(assert (=> b!748305 (= res!504752 (= lt!332636 lt!332641))))

(assert (=> b!748305 (= lt!332641 (Found!7571 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41715 (_ BitVec 32)) SeekEntryResult!7571)

(assert (=> b!748305 (= lt!332636 (seekEntryOrOpen!0 (select (arr!19971 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41715 (_ BitVec 32)) Bool)

(assert (=> b!748305 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332638 () Unit!25664)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41715 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25664)

(assert (=> b!748305 (= lt!332638 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748306 () Bool)

(declare-fun res!504764 () Bool)

(assert (=> b!748306 (=> res!504764 e!417681)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41715 (_ BitVec 32)) SeekEntryResult!7571)

(assert (=> b!748306 (= res!504764 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19971 a!3186) j!159) a!3186 mask!3328) lt!332641)))))

(declare-fun b!748307 () Bool)

(declare-fun Unit!25666 () Unit!25664)

(assert (=> b!748307 (= e!417684 Unit!25666)))

(declare-fun b!748308 () Bool)

(assert (=> b!748308 (= e!417682 e!417679)))

(declare-fun res!504757 () Bool)

(assert (=> b!748308 (=> (not res!504757) (not e!417679))))

(declare-fun lt!332645 () SeekEntryResult!7571)

(assert (=> b!748308 (= res!504757 (= lt!332645 lt!332643))))

(declare-fun lt!332637 () array!41715)

(assert (=> b!748308 (= lt!332643 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332642 lt!332637 mask!3328))))

(assert (=> b!748308 (= lt!332645 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332642 mask!3328) lt!332642 lt!332637 mask!3328))))

(assert (=> b!748308 (= lt!332642 (select (store (arr!19971 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!748308 (= lt!332637 (array!41716 (store (arr!19971 a!3186) i!1173 k!2102) (size!20392 a!3186)))))

(declare-fun b!748309 () Bool)

(declare-fun res!504755 () Bool)

(assert (=> b!748309 (=> (not res!504755) (not e!417685))))

(assert (=> b!748309 (= res!504755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748310 () Bool)

(declare-fun res!504761 () Bool)

(assert (=> b!748310 (=> (not res!504761) (not e!417683))))

(declare-fun arrayContainsKey!0 (array!41715 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748310 (= res!504761 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!504754 () Bool)

(assert (=> start!65542 (=> (not res!504754) (not e!417683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65542 (= res!504754 (validMask!0 mask!3328))))

(assert (=> start!65542 e!417683))

(assert (=> start!65542 true))

(declare-fun array_inv!15767 (array!41715) Bool)

(assert (=> start!65542 (array_inv!15767 a!3186)))

(declare-fun b!748311 () Bool)

(declare-fun res!504749 () Bool)

(assert (=> b!748311 (=> (not res!504749) (not e!417685))))

(declare-datatypes ((List!13973 0))(
  ( (Nil!13970) (Cons!13969 (h!15041 (_ BitVec 64)) (t!20288 List!13973)) )
))
(declare-fun arrayNoDuplicates!0 (array!41715 (_ BitVec 32) List!13973) Bool)

(assert (=> b!748311 (= res!504749 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13970))))

(declare-fun b!748312 () Bool)

(assert (=> b!748312 (= e!417686 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19971 a!3186) j!159) a!3186 mask!3328) lt!332641))))

(declare-fun b!748313 () Bool)

(declare-fun Unit!25667 () Unit!25664)

(assert (=> b!748313 (= e!417684 Unit!25667)))

(assert (=> b!748313 false))

(declare-fun b!748314 () Bool)

(declare-fun res!504762 () Bool)

(assert (=> b!748314 (=> (not res!504762) (not e!417682))))

(assert (=> b!748314 (= res!504762 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19971 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748315 () Bool)

(assert (=> b!748315 (= e!417683 e!417685)))

(declare-fun res!504748 () Bool)

(assert (=> b!748315 (=> (not res!504748) (not e!417685))))

(declare-fun lt!332644 () SeekEntryResult!7571)

(assert (=> b!748315 (= res!504748 (or (= lt!332644 (MissingZero!7571 i!1173)) (= lt!332644 (MissingVacant!7571 i!1173))))))

(assert (=> b!748315 (= lt!332644 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!748316 () Bool)

(declare-fun res!504750 () Bool)

(assert (=> b!748316 (=> (not res!504750) (not e!417683))))

(assert (=> b!748316 (= res!504750 (and (= (size!20392 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20392 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20392 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748317 () Bool)

(assert (=> b!748317 (= e!417678 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19971 a!3186) j!159) a!3186 mask!3328) (Found!7571 j!159)))))

(assert (= (and start!65542 res!504754) b!748316))

(assert (= (and b!748316 res!504750) b!748301))

(assert (= (and b!748301 res!504760) b!748302))

(assert (= (and b!748302 res!504758) b!748310))

(assert (= (and b!748310 res!504761) b!748315))

(assert (= (and b!748315 res!504748) b!748309))

(assert (= (and b!748309 res!504755) b!748311))

(assert (= (and b!748311 res!504749) b!748298))

(assert (= (and b!748298 res!504759) b!748299))

(assert (= (and b!748299 res!504753) b!748314))

(assert (= (and b!748314 res!504762) b!748300))

(assert (= (and b!748300 c!82155) b!748304))

(assert (= (and b!748300 (not c!82155)) b!748317))

(assert (= (and b!748300 res!504751) b!748308))

(assert (= (and b!748308 res!504757) b!748305))

(assert (= (and b!748305 res!504752) b!748312))

(assert (= (and b!748305 (not res!504763)) b!748306))

(assert (= (and b!748306 (not res!504764)) b!748297))

(assert (= (and b!748297 (not res!504756)) b!748303))

(assert (= (and b!748303 c!82156) b!748313))

(assert (= (and b!748303 (not c!82156)) b!748307))

(declare-fun m!698173 () Bool)

(assert (=> b!748304 m!698173))

(assert (=> b!748304 m!698173))

(declare-fun m!698175 () Bool)

(assert (=> b!748304 m!698175))

(declare-fun m!698177 () Bool)

(assert (=> b!748302 m!698177))

(declare-fun m!698179 () Bool)

(assert (=> b!748315 m!698179))

(declare-fun m!698181 () Bool)

(assert (=> b!748303 m!698181))

(declare-fun m!698183 () Bool)

(assert (=> b!748303 m!698183))

(declare-fun m!698185 () Bool)

(assert (=> b!748311 m!698185))

(declare-fun m!698187 () Bool)

(assert (=> start!65542 m!698187))

(declare-fun m!698189 () Bool)

(assert (=> start!65542 m!698189))

(assert (=> b!748312 m!698173))

(assert (=> b!748312 m!698173))

(declare-fun m!698191 () Bool)

(assert (=> b!748312 m!698191))

(assert (=> b!748317 m!698173))

(assert (=> b!748317 m!698173))

(declare-fun m!698193 () Bool)

(assert (=> b!748317 m!698193))

(assert (=> b!748301 m!698173))

(assert (=> b!748301 m!698173))

(declare-fun m!698195 () Bool)

(assert (=> b!748301 m!698195))

(assert (=> b!748297 m!698181))

(assert (=> b!748297 m!698183))

(assert (=> b!748305 m!698173))

(assert (=> b!748305 m!698173))

(declare-fun m!698197 () Bool)

(assert (=> b!748305 m!698197))

(declare-fun m!698199 () Bool)

(assert (=> b!748305 m!698199))

(declare-fun m!698201 () Bool)

(assert (=> b!748305 m!698201))

(declare-fun m!698203 () Bool)

(assert (=> b!748308 m!698203))

(assert (=> b!748308 m!698181))

(declare-fun m!698205 () Bool)

(assert (=> b!748308 m!698205))

(assert (=> b!748308 m!698203))

(declare-fun m!698207 () Bool)

(assert (=> b!748308 m!698207))

(declare-fun m!698209 () Bool)

(assert (=> b!748308 m!698209))

(declare-fun m!698211 () Bool)

(assert (=> b!748314 m!698211))

(assert (=> b!748306 m!698173))

(assert (=> b!748306 m!698173))

(assert (=> b!748306 m!698193))

(assert (=> b!748299 m!698173))

(assert (=> b!748299 m!698173))

(declare-fun m!698213 () Bool)

(assert (=> b!748299 m!698213))

(assert (=> b!748299 m!698213))

(assert (=> b!748299 m!698173))

(declare-fun m!698215 () Bool)

(assert (=> b!748299 m!698215))

(declare-fun m!698217 () Bool)

(assert (=> b!748309 m!698217))

(declare-fun m!698219 () Bool)

(assert (=> b!748310 m!698219))

(push 1)

(assert (not b!748317))

(assert (not b!748308))

(assert (not b!748315))

(assert (not b!748306))

(assert (not b!748299))

(assert (not b!748304))

(assert (not start!65542))

(assert (not b!748310))

(assert (not b!748311))

(assert (not b!748309))

(assert (not b!748312))

(assert (not b!748301))

(assert (not b!748302))

(assert (not b!748305))

(check-sat)

(pop 1)

(push 1)

(check-sat)

