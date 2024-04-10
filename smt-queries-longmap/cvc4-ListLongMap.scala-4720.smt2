; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65384 () Bool)

(assert start!65384)

(declare-fun b!743791 () Bool)

(declare-fun res!500856 () Bool)

(declare-fun e!415542 () Bool)

(assert (=> b!743791 (=> (not res!500856) (not e!415542))))

(declare-datatypes ((array!41557 0))(
  ( (array!41558 (arr!19892 (Array (_ BitVec 32) (_ BitVec 64))) (size!20313 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41557)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41557 (_ BitVec 32)) Bool)

(assert (=> b!743791 (= res!500856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743792 () Bool)

(declare-fun res!500861 () Bool)

(declare-fun e!415536 () Bool)

(assert (=> b!743792 (=> (not res!500861) (not e!415536))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!743792 (= res!500861 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19892 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743793 () Bool)

(declare-fun res!500849 () Bool)

(assert (=> b!743793 (=> (not res!500849) (not e!415542))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743793 (= res!500849 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20313 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20313 a!3186))))))

(declare-datatypes ((SeekEntryResult!7492 0))(
  ( (MissingZero!7492 (index!32336 (_ BitVec 32))) (Found!7492 (index!32337 (_ BitVec 32))) (Intermediate!7492 (undefined!8304 Bool) (index!32338 (_ BitVec 32)) (x!63298 (_ BitVec 32))) (Undefined!7492) (MissingVacant!7492 (index!32339 (_ BitVec 32))) )
))
(declare-fun lt!330403 () SeekEntryResult!7492)

(declare-fun b!743794 () Bool)

(declare-fun e!415540 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41557 (_ BitVec 32)) SeekEntryResult!7492)

(assert (=> b!743794 (= e!415540 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19892 a!3186) j!159) a!3186 mask!3328) lt!330403))))

(declare-fun e!415539 () Bool)

(declare-fun lt!330402 () SeekEntryResult!7492)

(declare-fun b!743795 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41557 (_ BitVec 32)) SeekEntryResult!7492)

(assert (=> b!743795 (= e!415539 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19892 a!3186) j!159) a!3186 mask!3328) lt!330402))))

(declare-fun b!743796 () Bool)

(declare-fun res!500860 () Bool)

(declare-fun e!415541 () Bool)

(assert (=> b!743796 (=> (not res!500860) (not e!415541))))

(assert (=> b!743796 (= res!500860 (and (= (size!20313 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20313 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20313 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743797 () Bool)

(declare-fun e!415537 () Bool)

(assert (=> b!743797 (= e!415537 e!415539)))

(declare-fun res!500857 () Bool)

(assert (=> b!743797 (=> (not res!500857) (not e!415539))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41557 (_ BitVec 32)) SeekEntryResult!7492)

(assert (=> b!743797 (= res!500857 (= (seekEntryOrOpen!0 (select (arr!19892 a!3186) j!159) a!3186 mask!3328) lt!330402))))

(assert (=> b!743797 (= lt!330402 (Found!7492 j!159))))

(declare-fun b!743798 () Bool)

(declare-fun res!500859 () Bool)

(assert (=> b!743798 (=> (not res!500859) (not e!415541))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743798 (= res!500859 (validKeyInArray!0 k!2102))))

(declare-fun b!743799 () Bool)

(assert (=> b!743799 (= e!415541 e!415542)))

(declare-fun res!500850 () Bool)

(assert (=> b!743799 (=> (not res!500850) (not e!415542))))

(declare-fun lt!330404 () SeekEntryResult!7492)

(assert (=> b!743799 (= res!500850 (or (= lt!330404 (MissingZero!7492 i!1173)) (= lt!330404 (MissingVacant!7492 i!1173))))))

(assert (=> b!743799 (= lt!330404 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!743800 () Bool)

(declare-fun res!500853 () Bool)

(assert (=> b!743800 (=> (not res!500853) (not e!415541))))

(declare-fun arrayContainsKey!0 (array!41557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743800 (= res!500853 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743801 () Bool)

(assert (=> b!743801 (= e!415542 e!415536)))

(declare-fun res!500858 () Bool)

(assert (=> b!743801 (=> (not res!500858) (not e!415536))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743801 (= res!500858 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19892 a!3186) j!159) mask!3328) (select (arr!19892 a!3186) j!159) a!3186 mask!3328) lt!330403))))

(assert (=> b!743801 (= lt!330403 (Intermediate!7492 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743802 () Bool)

(declare-fun e!415543 () Bool)

(declare-fun e!415538 () Bool)

(assert (=> b!743802 (= e!415543 (not e!415538))))

(declare-fun res!500847 () Bool)

(assert (=> b!743802 (=> res!500847 e!415538)))

(declare-fun lt!330409 () SeekEntryResult!7492)

(assert (=> b!743802 (= res!500847 (or (not (is-Intermediate!7492 lt!330409)) (bvslt x!1131 (x!63298 lt!330409)) (not (= x!1131 (x!63298 lt!330409))) (not (= index!1321 (index!32338 lt!330409)))))))

(assert (=> b!743802 e!415537))

(declare-fun res!500854 () Bool)

(assert (=> b!743802 (=> (not res!500854) (not e!415537))))

(assert (=> b!743802 (= res!500854 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25464 0))(
  ( (Unit!25465) )
))
(declare-fun lt!330407 () Unit!25464)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41557 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25464)

(assert (=> b!743802 (= lt!330407 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743803 () Bool)

(assert (=> b!743803 (= e!415538 true)))

(declare-fun lt!330406 () SeekEntryResult!7492)

(assert (=> b!743803 (= lt!330406 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19892 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!743804 () Bool)

(assert (=> b!743804 (= e!415536 e!415543)))

(declare-fun res!500852 () Bool)

(assert (=> b!743804 (=> (not res!500852) (not e!415543))))

(declare-fun lt!330410 () SeekEntryResult!7492)

(assert (=> b!743804 (= res!500852 (= lt!330410 lt!330409))))

(declare-fun lt!330408 () (_ BitVec 64))

(declare-fun lt!330405 () array!41557)

(assert (=> b!743804 (= lt!330409 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330408 lt!330405 mask!3328))))

(assert (=> b!743804 (= lt!330410 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330408 mask!3328) lt!330408 lt!330405 mask!3328))))

(assert (=> b!743804 (= lt!330408 (select (store (arr!19892 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!743804 (= lt!330405 (array!41558 (store (arr!19892 a!3186) i!1173 k!2102) (size!20313 a!3186)))))

(declare-fun b!743805 () Bool)

(declare-fun res!500851 () Bool)

(assert (=> b!743805 (=> (not res!500851) (not e!415536))))

(assert (=> b!743805 (= res!500851 e!415540)))

(declare-fun c!81853 () Bool)

(assert (=> b!743805 (= c!81853 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!500855 () Bool)

(assert (=> start!65384 (=> (not res!500855) (not e!415541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65384 (= res!500855 (validMask!0 mask!3328))))

(assert (=> start!65384 e!415541))

(assert (=> start!65384 true))

(declare-fun array_inv!15688 (array!41557) Bool)

(assert (=> start!65384 (array_inv!15688 a!3186)))

(declare-fun b!743806 () Bool)

(assert (=> b!743806 (= e!415540 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19892 a!3186) j!159) a!3186 mask!3328) (Found!7492 j!159)))))

(declare-fun b!743807 () Bool)

(declare-fun res!500846 () Bool)

(assert (=> b!743807 (=> (not res!500846) (not e!415542))))

(declare-datatypes ((List!13894 0))(
  ( (Nil!13891) (Cons!13890 (h!14962 (_ BitVec 64)) (t!20209 List!13894)) )
))
(declare-fun arrayNoDuplicates!0 (array!41557 (_ BitVec 32) List!13894) Bool)

(assert (=> b!743807 (= res!500846 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13891))))

(declare-fun b!743808 () Bool)

(declare-fun res!500848 () Bool)

(assert (=> b!743808 (=> (not res!500848) (not e!415541))))

(assert (=> b!743808 (= res!500848 (validKeyInArray!0 (select (arr!19892 a!3186) j!159)))))

(assert (= (and start!65384 res!500855) b!743796))

(assert (= (and b!743796 res!500860) b!743808))

(assert (= (and b!743808 res!500848) b!743798))

(assert (= (and b!743798 res!500859) b!743800))

(assert (= (and b!743800 res!500853) b!743799))

(assert (= (and b!743799 res!500850) b!743791))

(assert (= (and b!743791 res!500856) b!743807))

(assert (= (and b!743807 res!500846) b!743793))

(assert (= (and b!743793 res!500849) b!743801))

(assert (= (and b!743801 res!500858) b!743792))

(assert (= (and b!743792 res!500861) b!743805))

(assert (= (and b!743805 c!81853) b!743794))

(assert (= (and b!743805 (not c!81853)) b!743806))

(assert (= (and b!743805 res!500851) b!743804))

(assert (= (and b!743804 res!500852) b!743802))

(assert (= (and b!743802 res!500854) b!743797))

(assert (= (and b!743797 res!500857) b!743795))

(assert (= (and b!743802 (not res!500847)) b!743803))

(declare-fun m!694419 () Bool)

(assert (=> b!743798 m!694419))

(declare-fun m!694421 () Bool)

(assert (=> b!743808 m!694421))

(assert (=> b!743808 m!694421))

(declare-fun m!694423 () Bool)

(assert (=> b!743808 m!694423))

(declare-fun m!694425 () Bool)

(assert (=> start!65384 m!694425))

(declare-fun m!694427 () Bool)

(assert (=> start!65384 m!694427))

(assert (=> b!743797 m!694421))

(assert (=> b!743797 m!694421))

(declare-fun m!694429 () Bool)

(assert (=> b!743797 m!694429))

(declare-fun m!694431 () Bool)

(assert (=> b!743800 m!694431))

(declare-fun m!694433 () Bool)

(assert (=> b!743802 m!694433))

(declare-fun m!694435 () Bool)

(assert (=> b!743802 m!694435))

(assert (=> b!743806 m!694421))

(assert (=> b!743806 m!694421))

(declare-fun m!694437 () Bool)

(assert (=> b!743806 m!694437))

(assert (=> b!743803 m!694421))

(assert (=> b!743803 m!694421))

(assert (=> b!743803 m!694437))

(declare-fun m!694439 () Bool)

(assert (=> b!743799 m!694439))

(assert (=> b!743794 m!694421))

(assert (=> b!743794 m!694421))

(declare-fun m!694441 () Bool)

(assert (=> b!743794 m!694441))

(assert (=> b!743801 m!694421))

(assert (=> b!743801 m!694421))

(declare-fun m!694443 () Bool)

(assert (=> b!743801 m!694443))

(assert (=> b!743801 m!694443))

(assert (=> b!743801 m!694421))

(declare-fun m!694445 () Bool)

(assert (=> b!743801 m!694445))

(declare-fun m!694447 () Bool)

(assert (=> b!743792 m!694447))

(declare-fun m!694449 () Bool)

(assert (=> b!743804 m!694449))

(declare-fun m!694451 () Bool)

(assert (=> b!743804 m!694451))

(declare-fun m!694453 () Bool)

(assert (=> b!743804 m!694453))

(declare-fun m!694455 () Bool)

(assert (=> b!743804 m!694455))

(assert (=> b!743804 m!694451))

(declare-fun m!694457 () Bool)

(assert (=> b!743804 m!694457))

(declare-fun m!694459 () Bool)

(assert (=> b!743791 m!694459))

(declare-fun m!694461 () Bool)

(assert (=> b!743807 m!694461))

(assert (=> b!743795 m!694421))

(assert (=> b!743795 m!694421))

(declare-fun m!694463 () Bool)

(assert (=> b!743795 m!694463))

(push 1)

