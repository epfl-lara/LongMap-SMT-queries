; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64662 () Bool)

(assert start!64662)

(declare-fun b!728632 () Bool)

(declare-fun e!407866 () Bool)

(declare-fun e!407865 () Bool)

(assert (=> b!728632 (= e!407866 e!407865)))

(declare-fun res!489129 () Bool)

(assert (=> b!728632 (=> (not res!489129) (not e!407865))))

(declare-datatypes ((SeekEntryResult!7275 0))(
  ( (MissingZero!7275 (index!31468 (_ BitVec 32))) (Found!7275 (index!31469 (_ BitVec 32))) (Intermediate!7275 (undefined!8087 Bool) (index!31470 (_ BitVec 32)) (x!62457 (_ BitVec 32))) (Undefined!7275) (MissingVacant!7275 (index!31471 (_ BitVec 32))) )
))
(declare-fun lt!322759 () SeekEntryResult!7275)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728632 (= res!489129 (or (= lt!322759 (MissingZero!7275 i!1173)) (= lt!322759 (MissingVacant!7275 i!1173))))))

(declare-datatypes ((array!41111 0))(
  ( (array!41112 (arr!19675 (Array (_ BitVec 32) (_ BitVec 64))) (size!20096 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41111)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41111 (_ BitVec 32)) SeekEntryResult!7275)

(assert (=> b!728632 (= lt!322759 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!407862 () Bool)

(declare-fun lt!322766 () SeekEntryResult!7275)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!728633 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41111 (_ BitVec 32)) SeekEntryResult!7275)

(assert (=> b!728633 (= e!407862 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19675 a!3186) j!159) a!3186 mask!3328) lt!322766))))

(declare-fun b!728634 () Bool)

(declare-fun e!407863 () Bool)

(assert (=> b!728634 (= e!407863 true)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!322763 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728634 (= lt!322763 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728635 () Bool)

(declare-fun res!489131 () Bool)

(assert (=> b!728635 (=> (not res!489131) (not e!407866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728635 (= res!489131 (validKeyInArray!0 (select (arr!19675 a!3186) j!159)))))

(declare-fun b!728636 () Bool)

(declare-fun res!489126 () Bool)

(declare-fun e!407861 () Bool)

(assert (=> b!728636 (=> (not res!489126) (not e!407861))))

(declare-fun e!407859 () Bool)

(assert (=> b!728636 (= res!489126 e!407859)))

(declare-fun c!80128 () Bool)

(assert (=> b!728636 (= c!80128 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!489133 () Bool)

(assert (=> start!64662 (=> (not res!489133) (not e!407866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64662 (= res!489133 (validMask!0 mask!3328))))

(assert (=> start!64662 e!407866))

(assert (=> start!64662 true))

(declare-fun array_inv!15471 (array!41111) Bool)

(assert (=> start!64662 (array_inv!15471 a!3186)))

(declare-fun b!728637 () Bool)

(declare-fun res!489134 () Bool)

(assert (=> b!728637 (=> (not res!489134) (not e!407866))))

(assert (=> b!728637 (= res!489134 (validKeyInArray!0 k0!2102))))

(declare-fun b!728638 () Bool)

(declare-fun lt!322764 () SeekEntryResult!7275)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41111 (_ BitVec 32)) SeekEntryResult!7275)

(assert (=> b!728638 (= e!407859 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19675 a!3186) j!159) a!3186 mask!3328) lt!322764))))

(declare-fun b!728639 () Bool)

(declare-fun res!489137 () Bool)

(assert (=> b!728639 (=> (not res!489137) (not e!407866))))

(assert (=> b!728639 (= res!489137 (and (= (size!20096 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20096 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20096 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!728640 () Bool)

(declare-fun e!407860 () Bool)

(assert (=> b!728640 (= e!407860 (not e!407863))))

(declare-fun res!489136 () Bool)

(assert (=> b!728640 (=> res!489136 e!407863)))

(declare-fun lt!322758 () SeekEntryResult!7275)

(get-info :version)

(assert (=> b!728640 (= res!489136 (or (not ((_ is Intermediate!7275) lt!322758)) (bvsge x!1131 (x!62457 lt!322758))))))

(declare-fun e!407864 () Bool)

(assert (=> b!728640 e!407864))

(declare-fun res!489138 () Bool)

(assert (=> b!728640 (=> (not res!489138) (not e!407864))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41111 (_ BitVec 32)) Bool)

(assert (=> b!728640 (= res!489138 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24868 0))(
  ( (Unit!24869) )
))
(declare-fun lt!322762 () Unit!24868)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41111 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24868)

(assert (=> b!728640 (= lt!322762 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728641 () Bool)

(assert (=> b!728641 (= e!407859 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19675 a!3186) j!159) a!3186 mask!3328) (Found!7275 j!159)))))

(declare-fun b!728642 () Bool)

(assert (=> b!728642 (= e!407864 e!407862)))

(declare-fun res!489125 () Bool)

(assert (=> b!728642 (=> (not res!489125) (not e!407862))))

(assert (=> b!728642 (= res!489125 (= (seekEntryOrOpen!0 (select (arr!19675 a!3186) j!159) a!3186 mask!3328) lt!322766))))

(assert (=> b!728642 (= lt!322766 (Found!7275 j!159))))

(declare-fun b!728643 () Bool)

(declare-fun res!489127 () Bool)

(assert (=> b!728643 (=> (not res!489127) (not e!407866))))

(declare-fun arrayContainsKey!0 (array!41111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728643 (= res!489127 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728644 () Bool)

(assert (=> b!728644 (= e!407865 e!407861)))

(declare-fun res!489130 () Bool)

(assert (=> b!728644 (=> (not res!489130) (not e!407861))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728644 (= res!489130 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19675 a!3186) j!159) mask!3328) (select (arr!19675 a!3186) j!159) a!3186 mask!3328) lt!322764))))

(assert (=> b!728644 (= lt!322764 (Intermediate!7275 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728645 () Bool)

(assert (=> b!728645 (= e!407861 e!407860)))

(declare-fun res!489139 () Bool)

(assert (=> b!728645 (=> (not res!489139) (not e!407860))))

(declare-fun lt!322760 () SeekEntryResult!7275)

(assert (=> b!728645 (= res!489139 (= lt!322760 lt!322758))))

(declare-fun lt!322765 () array!41111)

(declare-fun lt!322761 () (_ BitVec 64))

(assert (=> b!728645 (= lt!322758 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322761 lt!322765 mask!3328))))

(assert (=> b!728645 (= lt!322760 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322761 mask!3328) lt!322761 lt!322765 mask!3328))))

(assert (=> b!728645 (= lt!322761 (select (store (arr!19675 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!728645 (= lt!322765 (array!41112 (store (arr!19675 a!3186) i!1173 k0!2102) (size!20096 a!3186)))))

(declare-fun b!728646 () Bool)

(declare-fun res!489132 () Bool)

(assert (=> b!728646 (=> (not res!489132) (not e!407865))))

(assert (=> b!728646 (= res!489132 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20096 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20096 a!3186))))))

(declare-fun b!728647 () Bool)

(declare-fun res!489128 () Bool)

(assert (=> b!728647 (=> (not res!489128) (not e!407861))))

(assert (=> b!728647 (= res!489128 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19675 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!728648 () Bool)

(declare-fun res!489140 () Bool)

(assert (=> b!728648 (=> (not res!489140) (not e!407865))))

(assert (=> b!728648 (= res!489140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728649 () Bool)

(declare-fun res!489135 () Bool)

(assert (=> b!728649 (=> (not res!489135) (not e!407865))))

(declare-datatypes ((List!13677 0))(
  ( (Nil!13674) (Cons!13673 (h!14733 (_ BitVec 64)) (t!19992 List!13677)) )
))
(declare-fun arrayNoDuplicates!0 (array!41111 (_ BitVec 32) List!13677) Bool)

(assert (=> b!728649 (= res!489135 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13674))))

(assert (= (and start!64662 res!489133) b!728639))

(assert (= (and b!728639 res!489137) b!728635))

(assert (= (and b!728635 res!489131) b!728637))

(assert (= (and b!728637 res!489134) b!728643))

(assert (= (and b!728643 res!489127) b!728632))

(assert (= (and b!728632 res!489129) b!728648))

(assert (= (and b!728648 res!489140) b!728649))

(assert (= (and b!728649 res!489135) b!728646))

(assert (= (and b!728646 res!489132) b!728644))

(assert (= (and b!728644 res!489130) b!728647))

(assert (= (and b!728647 res!489128) b!728636))

(assert (= (and b!728636 c!80128) b!728638))

(assert (= (and b!728636 (not c!80128)) b!728641))

(assert (= (and b!728636 res!489126) b!728645))

(assert (= (and b!728645 res!489139) b!728640))

(assert (= (and b!728640 res!489138) b!728642))

(assert (= (and b!728642 res!489125) b!728633))

(assert (= (and b!728640 (not res!489136)) b!728634))

(declare-fun m!682363 () Bool)

(assert (=> b!728648 m!682363))

(declare-fun m!682365 () Bool)

(assert (=> b!728634 m!682365))

(declare-fun m!682367 () Bool)

(assert (=> b!728638 m!682367))

(assert (=> b!728638 m!682367))

(declare-fun m!682369 () Bool)

(assert (=> b!728638 m!682369))

(declare-fun m!682371 () Bool)

(assert (=> b!728640 m!682371))

(declare-fun m!682373 () Bool)

(assert (=> b!728640 m!682373))

(declare-fun m!682375 () Bool)

(assert (=> b!728647 m!682375))

(declare-fun m!682377 () Bool)

(assert (=> b!728643 m!682377))

(declare-fun m!682379 () Bool)

(assert (=> b!728637 m!682379))

(assert (=> b!728644 m!682367))

(assert (=> b!728644 m!682367))

(declare-fun m!682381 () Bool)

(assert (=> b!728644 m!682381))

(assert (=> b!728644 m!682381))

(assert (=> b!728644 m!682367))

(declare-fun m!682383 () Bool)

(assert (=> b!728644 m!682383))

(assert (=> b!728635 m!682367))

(assert (=> b!728635 m!682367))

(declare-fun m!682385 () Bool)

(assert (=> b!728635 m!682385))

(declare-fun m!682387 () Bool)

(assert (=> b!728645 m!682387))

(declare-fun m!682389 () Bool)

(assert (=> b!728645 m!682389))

(declare-fun m!682391 () Bool)

(assert (=> b!728645 m!682391))

(declare-fun m!682393 () Bool)

(assert (=> b!728645 m!682393))

(declare-fun m!682395 () Bool)

(assert (=> b!728645 m!682395))

(assert (=> b!728645 m!682389))

(assert (=> b!728633 m!682367))

(assert (=> b!728633 m!682367))

(declare-fun m!682397 () Bool)

(assert (=> b!728633 m!682397))

(declare-fun m!682399 () Bool)

(assert (=> b!728649 m!682399))

(assert (=> b!728642 m!682367))

(assert (=> b!728642 m!682367))

(declare-fun m!682401 () Bool)

(assert (=> b!728642 m!682401))

(declare-fun m!682403 () Bool)

(assert (=> start!64662 m!682403))

(declare-fun m!682405 () Bool)

(assert (=> start!64662 m!682405))

(declare-fun m!682407 () Bool)

(assert (=> b!728632 m!682407))

(assert (=> b!728641 m!682367))

(assert (=> b!728641 m!682367))

(declare-fun m!682409 () Bool)

(assert (=> b!728641 m!682409))

(check-sat (not b!728645) (not b!728635) (not b!728634) (not start!64662) (not b!728638) (not b!728637) (not b!728648) (not b!728643) (not b!728641) (not b!728633) (not b!728649) (not b!728642) (not b!728632) (not b!728644) (not b!728640))
(check-sat)
