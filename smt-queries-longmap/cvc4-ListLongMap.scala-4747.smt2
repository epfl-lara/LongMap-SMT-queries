; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65546 () Bool)

(assert start!65546)

(declare-fun b!748423 () Bool)

(declare-fun res!504862 () Bool)

(declare-fun e!417739 () Bool)

(assert (=> b!748423 (=> (not res!504862) (not e!417739))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41719 0))(
  ( (array!41720 (arr!19973 (Array (_ BitVec 32) (_ BitVec 64))) (size!20394 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41719)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!748423 (= res!504862 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19973 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748424 () Bool)

(declare-fun res!504865 () Bool)

(declare-fun e!417735 () Bool)

(assert (=> b!748424 (=> (not res!504865) (not e!417735))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748424 (= res!504865 (validKeyInArray!0 k!2102))))

(declare-fun b!748425 () Bool)

(declare-fun res!504858 () Bool)

(assert (=> b!748425 (=> (not res!504858) (not e!417739))))

(declare-fun e!417736 () Bool)

(assert (=> b!748425 (= res!504858 e!417736)))

(declare-fun c!82168 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!748425 (= c!82168 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748426 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7573 0))(
  ( (MissingZero!7573 (index!32660 (_ BitVec 32))) (Found!7573 (index!32661 (_ BitVec 32))) (Intermediate!7573 (undefined!8385 Bool) (index!32662 (_ BitVec 32)) (x!63595 (_ BitVec 32))) (Undefined!7573) (MissingVacant!7573 (index!32663 (_ BitVec 32))) )
))
(declare-fun lt!332701 () SeekEntryResult!7573)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41719 (_ BitVec 32)) SeekEntryResult!7573)

(assert (=> b!748426 (= e!417736 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19973 a!3186) j!159) a!3186 mask!3328) lt!332701))))

(declare-fun b!748427 () Bool)

(declare-fun res!504860 () Bool)

(declare-fun e!417732 () Bool)

(assert (=> b!748427 (=> (not res!504860) (not e!417732))))

(assert (=> b!748427 (= res!504860 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20394 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20394 a!3186))))))

(declare-fun b!748428 () Bool)

(declare-fun res!504856 () Bool)

(assert (=> b!748428 (=> (not res!504856) (not e!417732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41719 (_ BitVec 32)) Bool)

(assert (=> b!748428 (= res!504856 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748429 () Bool)

(declare-datatypes ((Unit!25672 0))(
  ( (Unit!25673) )
))
(declare-fun e!417737 () Unit!25672)

(declare-fun Unit!25674 () Unit!25672)

(assert (=> b!748429 (= e!417737 Unit!25674)))

(declare-fun res!504859 () Bool)

(assert (=> start!65546 (=> (not res!504859) (not e!417735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65546 (= res!504859 (validMask!0 mask!3328))))

(assert (=> start!65546 e!417735))

(assert (=> start!65546 true))

(declare-fun array_inv!15769 (array!41719) Bool)

(assert (=> start!65546 (array_inv!15769 a!3186)))

(declare-fun b!748430 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41719 (_ BitVec 32)) SeekEntryResult!7573)

(assert (=> b!748430 (= e!417736 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19973 a!3186) j!159) a!3186 mask!3328) (Found!7573 j!159)))))

(declare-fun b!748431 () Bool)

(assert (=> b!748431 (= e!417732 e!417739)))

(declare-fun res!504864 () Bool)

(assert (=> b!748431 (=> (not res!504864) (not e!417739))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748431 (= res!504864 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19973 a!3186) j!159) mask!3328) (select (arr!19973 a!3186) j!159) a!3186 mask!3328) lt!332701))))

(assert (=> b!748431 (= lt!332701 (Intermediate!7573 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748432 () Bool)

(declare-fun Unit!25675 () Unit!25672)

(assert (=> b!748432 (= e!417737 Unit!25675)))

(assert (=> b!748432 false))

(declare-fun b!748433 () Bool)

(declare-fun res!504852 () Bool)

(declare-fun e!417734 () Bool)

(assert (=> b!748433 (=> res!504852 e!417734)))

(declare-fun lt!332702 () SeekEntryResult!7573)

(assert (=> b!748433 (= res!504852 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19973 a!3186) j!159) a!3186 mask!3328) lt!332702)))))

(declare-fun b!748434 () Bool)

(declare-fun res!504853 () Bool)

(assert (=> b!748434 (=> (not res!504853) (not e!417732))))

(declare-datatypes ((List!13975 0))(
  ( (Nil!13972) (Cons!13971 (h!15043 (_ BitVec 64)) (t!20290 List!13975)) )
))
(declare-fun arrayNoDuplicates!0 (array!41719 (_ BitVec 32) List!13975) Bool)

(assert (=> b!748434 (= res!504853 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13972))))

(declare-fun b!748435 () Bool)

(assert (=> b!748435 (= e!417734 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!748435 (= (select (store (arr!19973 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332697 () Unit!25672)

(assert (=> b!748435 (= lt!332697 e!417737)))

(declare-fun c!82167 () Bool)

(assert (=> b!748435 (= c!82167 (= (select (store (arr!19973 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!748436 () Bool)

(declare-fun e!417733 () Bool)

(assert (=> b!748436 (= e!417733 (not e!417734))))

(declare-fun res!504861 () Bool)

(assert (=> b!748436 (=> res!504861 e!417734)))

(declare-fun lt!332700 () SeekEntryResult!7573)

(assert (=> b!748436 (= res!504861 (or (not (is-Intermediate!7573 lt!332700)) (bvslt x!1131 (x!63595 lt!332700)) (not (= x!1131 (x!63595 lt!332700))) (not (= index!1321 (index!32662 lt!332700)))))))

(declare-fun e!417740 () Bool)

(assert (=> b!748436 e!417740))

(declare-fun res!504855 () Bool)

(assert (=> b!748436 (=> (not res!504855) (not e!417740))))

(declare-fun lt!332704 () SeekEntryResult!7573)

(assert (=> b!748436 (= res!504855 (= lt!332704 lt!332702))))

(assert (=> b!748436 (= lt!332702 (Found!7573 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41719 (_ BitVec 32)) SeekEntryResult!7573)

(assert (=> b!748436 (= lt!332704 (seekEntryOrOpen!0 (select (arr!19973 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!748436 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332696 () Unit!25672)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41719 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25672)

(assert (=> b!748436 (= lt!332696 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748437 () Bool)

(declare-fun res!504851 () Bool)

(assert (=> b!748437 (=> (not res!504851) (not e!417735))))

(assert (=> b!748437 (= res!504851 (and (= (size!20394 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20394 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20394 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!748438 () Bool)

(assert (=> b!748438 (= e!417739 e!417733)))

(declare-fun res!504854 () Bool)

(assert (=> b!748438 (=> (not res!504854) (not e!417733))))

(declare-fun lt!332705 () SeekEntryResult!7573)

(assert (=> b!748438 (= res!504854 (= lt!332705 lt!332700))))

(declare-fun lt!332698 () (_ BitVec 64))

(declare-fun lt!332703 () array!41719)

(assert (=> b!748438 (= lt!332700 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332698 lt!332703 mask!3328))))

(assert (=> b!748438 (= lt!332705 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332698 mask!3328) lt!332698 lt!332703 mask!3328))))

(assert (=> b!748438 (= lt!332698 (select (store (arr!19973 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!748438 (= lt!332703 (array!41720 (store (arr!19973 a!3186) i!1173 k!2102) (size!20394 a!3186)))))

(declare-fun b!748439 () Bool)

(assert (=> b!748439 (= e!417740 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19973 a!3186) j!159) a!3186 mask!3328) lt!332702))))

(declare-fun b!748440 () Bool)

(assert (=> b!748440 (= e!417735 e!417732)))

(declare-fun res!504866 () Bool)

(assert (=> b!748440 (=> (not res!504866) (not e!417732))))

(declare-fun lt!332699 () SeekEntryResult!7573)

(assert (=> b!748440 (= res!504866 (or (= lt!332699 (MissingZero!7573 i!1173)) (= lt!332699 (MissingVacant!7573 i!1173))))))

(assert (=> b!748440 (= lt!332699 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!748441 () Bool)

(declare-fun res!504857 () Bool)

(assert (=> b!748441 (=> (not res!504857) (not e!417735))))

(declare-fun arrayContainsKey!0 (array!41719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748441 (= res!504857 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748442 () Bool)

(declare-fun res!504863 () Bool)

(assert (=> b!748442 (=> (not res!504863) (not e!417735))))

(assert (=> b!748442 (= res!504863 (validKeyInArray!0 (select (arr!19973 a!3186) j!159)))))

(declare-fun b!748443 () Bool)

(declare-fun res!504850 () Bool)

(assert (=> b!748443 (=> res!504850 e!417734)))

(assert (=> b!748443 (= res!504850 (= (select (store (arr!19973 a!3186) i!1173 k!2102) index!1321) lt!332698))))

(assert (= (and start!65546 res!504859) b!748437))

(assert (= (and b!748437 res!504851) b!748442))

(assert (= (and b!748442 res!504863) b!748424))

(assert (= (and b!748424 res!504865) b!748441))

(assert (= (and b!748441 res!504857) b!748440))

(assert (= (and b!748440 res!504866) b!748428))

(assert (= (and b!748428 res!504856) b!748434))

(assert (= (and b!748434 res!504853) b!748427))

(assert (= (and b!748427 res!504860) b!748431))

(assert (= (and b!748431 res!504864) b!748423))

(assert (= (and b!748423 res!504862) b!748425))

(assert (= (and b!748425 c!82168) b!748426))

(assert (= (and b!748425 (not c!82168)) b!748430))

(assert (= (and b!748425 res!504858) b!748438))

(assert (= (and b!748438 res!504854) b!748436))

(assert (= (and b!748436 res!504855) b!748439))

(assert (= (and b!748436 (not res!504861)) b!748433))

(assert (= (and b!748433 (not res!504852)) b!748443))

(assert (= (and b!748443 (not res!504850)) b!748435))

(assert (= (and b!748435 c!82167) b!748432))

(assert (= (and b!748435 (not c!82167)) b!748429))

(declare-fun m!698269 () Bool)

(assert (=> b!748435 m!698269))

(declare-fun m!698271 () Bool)

(assert (=> b!748435 m!698271))

(declare-fun m!698273 () Bool)

(assert (=> b!748436 m!698273))

(assert (=> b!748436 m!698273))

(declare-fun m!698275 () Bool)

(assert (=> b!748436 m!698275))

(declare-fun m!698277 () Bool)

(assert (=> b!748436 m!698277))

(declare-fun m!698279 () Bool)

(assert (=> b!748436 m!698279))

(assert (=> b!748439 m!698273))

(assert (=> b!748439 m!698273))

(declare-fun m!698281 () Bool)

(assert (=> b!748439 m!698281))

(declare-fun m!698283 () Bool)

(assert (=> b!748428 m!698283))

(assert (=> b!748433 m!698273))

(assert (=> b!748433 m!698273))

(declare-fun m!698285 () Bool)

(assert (=> b!748433 m!698285))

(declare-fun m!698287 () Bool)

(assert (=> b!748434 m!698287))

(assert (=> b!748442 m!698273))

(assert (=> b!748442 m!698273))

(declare-fun m!698289 () Bool)

(assert (=> b!748442 m!698289))

(declare-fun m!698291 () Bool)

(assert (=> b!748424 m!698291))

(assert (=> b!748431 m!698273))

(assert (=> b!748431 m!698273))

(declare-fun m!698293 () Bool)

(assert (=> b!748431 m!698293))

(assert (=> b!748431 m!698293))

(assert (=> b!748431 m!698273))

(declare-fun m!698295 () Bool)

(assert (=> b!748431 m!698295))

(assert (=> b!748430 m!698273))

(assert (=> b!748430 m!698273))

(assert (=> b!748430 m!698285))

(assert (=> b!748426 m!698273))

(assert (=> b!748426 m!698273))

(declare-fun m!698297 () Bool)

(assert (=> b!748426 m!698297))

(assert (=> b!748438 m!698269))

(declare-fun m!698299 () Bool)

(assert (=> b!748438 m!698299))

(declare-fun m!698301 () Bool)

(assert (=> b!748438 m!698301))

(declare-fun m!698303 () Bool)

(assert (=> b!748438 m!698303))

(assert (=> b!748438 m!698301))

(declare-fun m!698305 () Bool)

(assert (=> b!748438 m!698305))

(declare-fun m!698307 () Bool)

(assert (=> b!748441 m!698307))

(declare-fun m!698309 () Bool)

(assert (=> b!748440 m!698309))

(assert (=> b!748443 m!698269))

(assert (=> b!748443 m!698271))

(declare-fun m!698311 () Bool)

(assert (=> b!748423 m!698311))

(declare-fun m!698313 () Bool)

(assert (=> start!65546 m!698313))

(declare-fun m!698315 () Bool)

(assert (=> start!65546 m!698315))

(push 1)

(assert (not b!748441))

(assert (not b!748438))

(assert (not b!748433))

(assert (not start!65546))

(assert (not b!748430))

(assert (not b!748442))

(assert (not b!748426))

(assert (not b!748434))

(assert (not b!748424))

(assert (not b!748431))

(assert (not b!748436))

(assert (not b!748439))

(assert (not b!748428))

(assert (not b!748440))

(check-sat)

(pop 1)

(push 1)

(check-sat)

