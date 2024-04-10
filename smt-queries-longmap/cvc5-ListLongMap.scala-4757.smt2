; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65602 () Bool)

(assert start!65602)

(declare-fun res!506350 () Bool)

(declare-fun e!418591 () Bool)

(assert (=> start!65602 (=> (not res!506350) (not e!418591))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65602 (= res!506350 (validMask!0 mask!3328))))

(assert (=> start!65602 e!418591))

(assert (=> start!65602 true))

(declare-datatypes ((array!41775 0))(
  ( (array!41776 (arr!20001 (Array (_ BitVec 32) (_ BitVec 64))) (size!20422 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41775)

(declare-fun array_inv!15797 (array!41775) Bool)

(assert (=> start!65602 (array_inv!15797 a!3186)))

(declare-fun b!750243 () Bool)

(declare-fun res!506339 () Bool)

(assert (=> b!750243 (=> (not res!506339) (not e!418591))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750243 (= res!506339 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750244 () Bool)

(declare-fun res!506347 () Bool)

(declare-fun e!418597 () Bool)

(assert (=> b!750244 (=> (not res!506347) (not e!418597))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!750244 (= res!506347 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20001 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!750245 () Bool)

(declare-fun res!506351 () Bool)

(assert (=> b!750245 (=> (not res!506351) (not e!418591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750245 (= res!506351 (validKeyInArray!0 k!2102))))

(declare-fun b!750246 () Bool)

(declare-fun res!506341 () Bool)

(assert (=> b!750246 (=> (not res!506341) (not e!418591))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!750246 (= res!506341 (validKeyInArray!0 (select (arr!20001 a!3186) j!159)))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!333593 () (_ BitVec 64))

(declare-fun e!418598 () Bool)

(declare-fun lt!333588 () array!41775)

(declare-fun b!750247 () Bool)

(declare-datatypes ((SeekEntryResult!7601 0))(
  ( (MissingZero!7601 (index!32772 (_ BitVec 32))) (Found!7601 (index!32773 (_ BitVec 32))) (Intermediate!7601 (undefined!8413 Bool) (index!32774 (_ BitVec 32)) (x!63703 (_ BitVec 32))) (Undefined!7601) (MissingVacant!7601 (index!32775 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41775 (_ BitVec 32)) SeekEntryResult!7601)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41775 (_ BitVec 32)) SeekEntryResult!7601)

(assert (=> b!750247 (= e!418598 (= (seekEntryOrOpen!0 lt!333593 lt!333588 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333593 lt!333588 mask!3328)))))

(declare-fun b!750248 () Bool)

(declare-datatypes ((Unit!25784 0))(
  ( (Unit!25785) )
))
(declare-fun e!418596 () Unit!25784)

(declare-fun Unit!25786 () Unit!25784)

(assert (=> b!750248 (= e!418596 Unit!25786)))

(assert (=> b!750248 false))

(declare-fun b!750249 () Bool)

(declare-fun e!418600 () Bool)

(assert (=> b!750249 (= e!418597 e!418600)))

(declare-fun res!506345 () Bool)

(assert (=> b!750249 (=> (not res!506345) (not e!418600))))

(declare-fun lt!333587 () SeekEntryResult!7601)

(declare-fun lt!333591 () SeekEntryResult!7601)

(assert (=> b!750249 (= res!506345 (= lt!333587 lt!333591))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41775 (_ BitVec 32)) SeekEntryResult!7601)

(assert (=> b!750249 (= lt!333591 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333593 lt!333588 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!750249 (= lt!333587 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333593 mask!3328) lt!333593 lt!333588 mask!3328))))

(assert (=> b!750249 (= lt!333593 (select (store (arr!20001 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!750249 (= lt!333588 (array!41776 (store (arr!20001 a!3186) i!1173 k!2102) (size!20422 a!3186)))))

(declare-fun b!750250 () Bool)

(declare-fun e!418594 () Bool)

(declare-fun e!418599 () Bool)

(assert (=> b!750250 (= e!418594 e!418599)))

(declare-fun res!506348 () Bool)

(assert (=> b!750250 (=> res!506348 e!418599)))

(declare-fun lt!333590 () (_ BitVec 64))

(assert (=> b!750250 (= res!506348 (= lt!333590 lt!333593))))

(assert (=> b!750250 (= lt!333590 (select (store (arr!20001 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!750251 () Bool)

(assert (=> b!750251 (= e!418600 (not e!418594))))

(declare-fun res!506346 () Bool)

(assert (=> b!750251 (=> res!506346 e!418594)))

(assert (=> b!750251 (= res!506346 (or (not (is-Intermediate!7601 lt!333591)) (bvslt x!1131 (x!63703 lt!333591)) (not (= x!1131 (x!63703 lt!333591))) (not (= index!1321 (index!32774 lt!333591)))))))

(declare-fun e!418592 () Bool)

(assert (=> b!750251 e!418592))

(declare-fun res!506344 () Bool)

(assert (=> b!750251 (=> (not res!506344) (not e!418592))))

(declare-fun lt!333589 () SeekEntryResult!7601)

(declare-fun lt!333586 () SeekEntryResult!7601)

(assert (=> b!750251 (= res!506344 (= lt!333589 lt!333586))))

(assert (=> b!750251 (= lt!333586 (Found!7601 j!159))))

(assert (=> b!750251 (= lt!333589 (seekEntryOrOpen!0 (select (arr!20001 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41775 (_ BitVec 32)) Bool)

(assert (=> b!750251 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333584 () Unit!25784)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41775 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25784)

(assert (=> b!750251 (= lt!333584 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!750252 () Bool)

(declare-fun res!506334 () Bool)

(declare-fun e!418593 () Bool)

(assert (=> b!750252 (=> (not res!506334) (not e!418593))))

(assert (=> b!750252 (= res!506334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750253 () Bool)

(declare-fun res!506343 () Bool)

(assert (=> b!750253 (=> (not res!506343) (not e!418593))))

(declare-datatypes ((List!14003 0))(
  ( (Nil!14000) (Cons!13999 (h!15071 (_ BitVec 64)) (t!20318 List!14003)) )
))
(declare-fun arrayNoDuplicates!0 (array!41775 (_ BitVec 32) List!14003) Bool)

(assert (=> b!750253 (= res!506343 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14000))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!750254 () Bool)

(assert (=> b!750254 (= e!418592 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20001 a!3186) j!159) a!3186 mask!3328) lt!333586))))

(declare-fun b!750255 () Bool)

(declare-fun Unit!25787 () Unit!25784)

(assert (=> b!750255 (= e!418596 Unit!25787)))

(declare-fun b!750256 () Bool)

(declare-fun e!418595 () Bool)

(declare-fun lt!333585 () SeekEntryResult!7601)

(assert (=> b!750256 (= e!418595 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20001 a!3186) j!159) a!3186 mask!3328) lt!333585))))

(declare-fun b!750257 () Bool)

(assert (=> b!750257 (= e!418591 e!418593)))

(declare-fun res!506342 () Bool)

(assert (=> b!750257 (=> (not res!506342) (not e!418593))))

(declare-fun lt!333583 () SeekEntryResult!7601)

(assert (=> b!750257 (= res!506342 (or (= lt!333583 (MissingZero!7601 i!1173)) (= lt!333583 (MissingVacant!7601 i!1173))))))

(assert (=> b!750257 (= lt!333583 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!750258 () Bool)

(declare-fun res!506337 () Bool)

(assert (=> b!750258 (=> (not res!506337) (not e!418597))))

(assert (=> b!750258 (= res!506337 e!418595)))

(declare-fun c!82336 () Bool)

(assert (=> b!750258 (= c!82336 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!750259 () Bool)

(declare-fun res!506340 () Bool)

(assert (=> b!750259 (=> res!506340 e!418594)))

(assert (=> b!750259 (= res!506340 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20001 a!3186) j!159) a!3186 mask!3328) lt!333586)))))

(declare-fun b!750260 () Bool)

(assert (=> b!750260 (= e!418599 (bvsge mask!3328 #b00000000000000000000000000000000))))

(assert (=> b!750260 e!418598))

(declare-fun res!506338 () Bool)

(assert (=> b!750260 (=> (not res!506338) (not e!418598))))

(assert (=> b!750260 (= res!506338 (= lt!333590 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333592 () Unit!25784)

(assert (=> b!750260 (= lt!333592 e!418596)))

(declare-fun c!82335 () Bool)

(assert (=> b!750260 (= c!82335 (= lt!333590 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!750261 () Bool)

(assert (=> b!750261 (= e!418595 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20001 a!3186) j!159) a!3186 mask!3328) (Found!7601 j!159)))))

(declare-fun b!750262 () Bool)

(assert (=> b!750262 (= e!418593 e!418597)))

(declare-fun res!506336 () Bool)

(assert (=> b!750262 (=> (not res!506336) (not e!418597))))

(assert (=> b!750262 (= res!506336 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20001 a!3186) j!159) mask!3328) (select (arr!20001 a!3186) j!159) a!3186 mask!3328) lt!333585))))

(assert (=> b!750262 (= lt!333585 (Intermediate!7601 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!750263 () Bool)

(declare-fun res!506335 () Bool)

(assert (=> b!750263 (=> (not res!506335) (not e!418593))))

(assert (=> b!750263 (= res!506335 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20422 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20422 a!3186))))))

(declare-fun b!750264 () Bool)

(declare-fun res!506349 () Bool)

(assert (=> b!750264 (=> (not res!506349) (not e!418591))))

(assert (=> b!750264 (= res!506349 (and (= (size!20422 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20422 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20422 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!65602 res!506350) b!750264))

(assert (= (and b!750264 res!506349) b!750246))

(assert (= (and b!750246 res!506341) b!750245))

(assert (= (and b!750245 res!506351) b!750243))

(assert (= (and b!750243 res!506339) b!750257))

(assert (= (and b!750257 res!506342) b!750252))

(assert (= (and b!750252 res!506334) b!750253))

(assert (= (and b!750253 res!506343) b!750263))

(assert (= (and b!750263 res!506335) b!750262))

(assert (= (and b!750262 res!506336) b!750244))

(assert (= (and b!750244 res!506347) b!750258))

(assert (= (and b!750258 c!82336) b!750256))

(assert (= (and b!750258 (not c!82336)) b!750261))

(assert (= (and b!750258 res!506337) b!750249))

(assert (= (and b!750249 res!506345) b!750251))

(assert (= (and b!750251 res!506344) b!750254))

(assert (= (and b!750251 (not res!506346)) b!750259))

(assert (= (and b!750259 (not res!506340)) b!750250))

(assert (= (and b!750250 (not res!506348)) b!750260))

(assert (= (and b!750260 c!82335) b!750248))

(assert (= (and b!750260 (not c!82335)) b!750255))

(assert (= (and b!750260 res!506338) b!750247))

(declare-fun m!699679 () Bool)

(assert (=> b!750254 m!699679))

(assert (=> b!750254 m!699679))

(declare-fun m!699681 () Bool)

(assert (=> b!750254 m!699681))

(assert (=> b!750256 m!699679))

(assert (=> b!750256 m!699679))

(declare-fun m!699683 () Bool)

(assert (=> b!750256 m!699683))

(declare-fun m!699685 () Bool)

(assert (=> b!750249 m!699685))

(assert (=> b!750249 m!699685))

(declare-fun m!699687 () Bool)

(assert (=> b!750249 m!699687))

(declare-fun m!699689 () Bool)

(assert (=> b!750249 m!699689))

(declare-fun m!699691 () Bool)

(assert (=> b!750249 m!699691))

(declare-fun m!699693 () Bool)

(assert (=> b!750249 m!699693))

(assert (=> b!750259 m!699679))

(assert (=> b!750259 m!699679))

(declare-fun m!699695 () Bool)

(assert (=> b!750259 m!699695))

(assert (=> b!750262 m!699679))

(assert (=> b!750262 m!699679))

(declare-fun m!699697 () Bool)

(assert (=> b!750262 m!699697))

(assert (=> b!750262 m!699697))

(assert (=> b!750262 m!699679))

(declare-fun m!699699 () Bool)

(assert (=> b!750262 m!699699))

(assert (=> b!750261 m!699679))

(assert (=> b!750261 m!699679))

(assert (=> b!750261 m!699695))

(assert (=> b!750251 m!699679))

(assert (=> b!750251 m!699679))

(declare-fun m!699701 () Bool)

(assert (=> b!750251 m!699701))

(declare-fun m!699703 () Bool)

(assert (=> b!750251 m!699703))

(declare-fun m!699705 () Bool)

(assert (=> b!750251 m!699705))

(declare-fun m!699707 () Bool)

(assert (=> b!750252 m!699707))

(declare-fun m!699709 () Bool)

(assert (=> b!750253 m!699709))

(declare-fun m!699711 () Bool)

(assert (=> b!750257 m!699711))

(declare-fun m!699713 () Bool)

(assert (=> b!750245 m!699713))

(declare-fun m!699715 () Bool)

(assert (=> b!750247 m!699715))

(declare-fun m!699717 () Bool)

(assert (=> b!750247 m!699717))

(declare-fun m!699719 () Bool)

(assert (=> start!65602 m!699719))

(declare-fun m!699721 () Bool)

(assert (=> start!65602 m!699721))

(declare-fun m!699723 () Bool)

(assert (=> b!750243 m!699723))

(declare-fun m!699725 () Bool)

(assert (=> b!750244 m!699725))

(assert (=> b!750246 m!699679))

(assert (=> b!750246 m!699679))

(declare-fun m!699727 () Bool)

(assert (=> b!750246 m!699727))

(assert (=> b!750250 m!699689))

(declare-fun m!699729 () Bool)

(assert (=> b!750250 m!699729))

(push 1)

(assert (not b!750262))

(assert (not b!750254))

(assert (not start!65602))

(assert (not b!750261))

