; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65224 () Bool)

(assert start!65224)

(declare-datatypes ((array!41397 0))(
  ( (array!41398 (arr!19812 (Array (_ BitVec 32) (_ BitVec 64))) (size!20233 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41397)

(declare-fun b!738844 () Bool)

(declare-fun e!413184 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7412 0))(
  ( (MissingZero!7412 (index!32016 (_ BitVec 32))) (Found!7412 (index!32017 (_ BitVec 32))) (Intermediate!7412 (undefined!8224 Bool) (index!32018 (_ BitVec 32)) (x!63010 (_ BitVec 32))) (Undefined!7412) (MissingVacant!7412 (index!32019 (_ BitVec 32))) )
))
(declare-fun lt!328000 () SeekEntryResult!7412)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41397 (_ BitVec 32)) SeekEntryResult!7412)

(assert (=> b!738844 (= e!413184 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19812 a!3186) j!159) a!3186 mask!3328) lt!328000))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!738845 () Bool)

(declare-fun lt!328004 () (_ BitVec 32))

(declare-fun lt!328003 () SeekEntryResult!7412)

(declare-fun e!413175 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41397 (_ BitVec 32)) SeekEntryResult!7412)

(assert (=> b!738845 (= e!413175 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328004 resIntermediateIndex!5 (select (arr!19812 a!3186) j!159) a!3186 mask!3328) lt!328003)))))

(declare-fun b!738846 () Bool)

(declare-fun res!496732 () Bool)

(declare-fun e!413185 () Bool)

(assert (=> b!738846 (=> (not res!496732) (not e!413185))))

(assert (=> b!738846 (= res!496732 e!413184)))

(declare-fun c!81437 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!738846 (= c!81437 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!738847 () Bool)

(declare-fun res!496748 () Bool)

(declare-fun e!413186 () Bool)

(assert (=> b!738847 (=> (not res!496748) (not e!413186))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!738847 (= res!496748 (validKeyInArray!0 (select (arr!19812 a!3186) j!159)))))

(declare-fun b!738848 () Bool)

(declare-fun res!496741 () Bool)

(declare-fun e!413179 () Bool)

(assert (=> b!738848 (=> (not res!496741) (not e!413179))))

(declare-datatypes ((List!13814 0))(
  ( (Nil!13811) (Cons!13810 (h!14882 (_ BitVec 64)) (t!20129 List!13814)) )
))
(declare-fun arrayNoDuplicates!0 (array!41397 (_ BitVec 32) List!13814) Bool)

(assert (=> b!738848 (= res!496741 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13811))))

(declare-fun b!738849 () Bool)

(declare-fun res!496733 () Bool)

(assert (=> b!738849 (=> (not res!496733) (not e!413186))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!738849 (= res!496733 (and (= (size!20233 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20233 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20233 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!738850 () Bool)

(declare-fun e!413181 () Bool)

(declare-fun e!413177 () Bool)

(assert (=> b!738850 (= e!413181 e!413177)))

(declare-fun res!496743 () Bool)

(assert (=> b!738850 (=> (not res!496743) (not e!413177))))

(declare-fun lt!328012 () SeekEntryResult!7412)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41397 (_ BitVec 32)) SeekEntryResult!7412)

(assert (=> b!738850 (= res!496743 (= (seekEntryOrOpen!0 (select (arr!19812 a!3186) j!159) a!3186 mask!3328) lt!328012))))

(assert (=> b!738850 (= lt!328012 (Found!7412 j!159))))

(declare-fun res!496736 () Bool)

(assert (=> start!65224 (=> (not res!496736) (not e!413186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65224 (= res!496736 (validMask!0 mask!3328))))

(assert (=> start!65224 e!413186))

(assert (=> start!65224 true))

(declare-fun array_inv!15608 (array!41397) Bool)

(assert (=> start!65224 (array_inv!15608 a!3186)))

(declare-fun b!738851 () Bool)

(declare-fun res!496742 () Bool)

(assert (=> b!738851 (=> (not res!496742) (not e!413186))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!738851 (= res!496742 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!738852 () Bool)

(assert (=> b!738852 (= e!413184 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19812 a!3186) j!159) a!3186 mask!3328) (Found!7412 j!159)))))

(declare-fun b!738853 () Bool)

(declare-fun e!413183 () Bool)

(declare-fun e!413178 () Bool)

(assert (=> b!738853 (= e!413183 e!413178)))

(declare-fun res!496731 () Bool)

(assert (=> b!738853 (=> res!496731 e!413178)))

(assert (=> b!738853 (= res!496731 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328004 #b00000000000000000000000000000000) (bvsge lt!328004 (size!20233 a!3186))))))

(declare-datatypes ((Unit!25244 0))(
  ( (Unit!25245) )
))
(declare-fun lt!328009 () Unit!25244)

(declare-fun e!413176 () Unit!25244)

(assert (=> b!738853 (= lt!328009 e!413176)))

(declare-fun c!81439 () Bool)

(declare-fun lt!328006 () Bool)

(assert (=> b!738853 (= c!81439 lt!328006)))

(assert (=> b!738853 (= lt!328006 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738853 (= lt!328004 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!738854 () Bool)

(declare-fun res!496740 () Bool)

(assert (=> b!738854 (=> (not res!496740) (not e!413186))))

(assert (=> b!738854 (= res!496740 (validKeyInArray!0 k!2102))))

(declare-fun b!738855 () Bool)

(declare-fun res!496738 () Bool)

(assert (=> b!738855 (=> (not res!496738) (not e!413185))))

(assert (=> b!738855 (= res!496738 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19812 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!738856 () Bool)

(assert (=> b!738856 (= e!413178 true)))

(declare-fun lt!328007 () array!41397)

(declare-fun lt!328013 () (_ BitVec 64))

(declare-fun lt!328008 () SeekEntryResult!7412)

(assert (=> b!738856 (= lt!328008 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328004 lt!328013 lt!328007 mask!3328))))

(declare-fun b!738857 () Bool)

(declare-fun Unit!25246 () Unit!25244)

(assert (=> b!738857 (= e!413176 Unit!25246)))

(assert (=> b!738857 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328004 (select (arr!19812 a!3186) j!159) a!3186 mask!3328) lt!328000)))

(declare-fun b!738858 () Bool)

(assert (=> b!738858 (= e!413179 e!413185)))

(declare-fun res!496746 () Bool)

(assert (=> b!738858 (=> (not res!496746) (not e!413185))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!738858 (= res!496746 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19812 a!3186) j!159) mask!3328) (select (arr!19812 a!3186) j!159) a!3186 mask!3328) lt!328000))))

(assert (=> b!738858 (= lt!328000 (Intermediate!7412 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!738859 () Bool)

(assert (=> b!738859 (= e!413175 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328004 (select (arr!19812 a!3186) j!159) a!3186 mask!3328) lt!328000)))))

(declare-fun b!738860 () Bool)

(declare-fun res!496735 () Bool)

(assert (=> b!738860 (=> (not res!496735) (not e!413179))))

(assert (=> b!738860 (= res!496735 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20233 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20233 a!3186))))))

(declare-fun b!738861 () Bool)

(declare-fun res!496744 () Bool)

(assert (=> b!738861 (=> res!496744 e!413178)))

(assert (=> b!738861 (= res!496744 e!413175)))

(declare-fun c!81438 () Bool)

(assert (=> b!738861 (= c!81438 lt!328006)))

(declare-fun b!738862 () Bool)

(assert (=> b!738862 (= e!413186 e!413179)))

(declare-fun res!496737 () Bool)

(assert (=> b!738862 (=> (not res!496737) (not e!413179))))

(declare-fun lt!328001 () SeekEntryResult!7412)

(assert (=> b!738862 (= res!496737 (or (= lt!328001 (MissingZero!7412 i!1173)) (= lt!328001 (MissingVacant!7412 i!1173))))))

(assert (=> b!738862 (= lt!328001 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!738863 () Bool)

(declare-fun e!413182 () Bool)

(assert (=> b!738863 (= e!413182 (not e!413183))))

(declare-fun res!496739 () Bool)

(assert (=> b!738863 (=> res!496739 e!413183)))

(declare-fun lt!328011 () SeekEntryResult!7412)

(assert (=> b!738863 (= res!496739 (or (not (is-Intermediate!7412 lt!328011)) (bvsge x!1131 (x!63010 lt!328011))))))

(assert (=> b!738863 (= lt!328003 (Found!7412 j!159))))

(assert (=> b!738863 e!413181))

(declare-fun res!496747 () Bool)

(assert (=> b!738863 (=> (not res!496747) (not e!413181))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41397 (_ BitVec 32)) Bool)

(assert (=> b!738863 (= res!496747 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328010 () Unit!25244)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41397 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25244)

(assert (=> b!738863 (= lt!328010 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!738864 () Bool)

(assert (=> b!738864 (= e!413185 e!413182)))

(declare-fun res!496745 () Bool)

(assert (=> b!738864 (=> (not res!496745) (not e!413182))))

(declare-fun lt!328002 () SeekEntryResult!7412)

(assert (=> b!738864 (= res!496745 (= lt!328002 lt!328011))))

(assert (=> b!738864 (= lt!328011 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328013 lt!328007 mask!3328))))

(assert (=> b!738864 (= lt!328002 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328013 mask!3328) lt!328013 lt!328007 mask!3328))))

(assert (=> b!738864 (= lt!328013 (select (store (arr!19812 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!738864 (= lt!328007 (array!41398 (store (arr!19812 a!3186) i!1173 k!2102) (size!20233 a!3186)))))

(declare-fun b!738865 () Bool)

(declare-fun Unit!25247 () Unit!25244)

(assert (=> b!738865 (= e!413176 Unit!25247)))

(declare-fun lt!328005 () SeekEntryResult!7412)

(assert (=> b!738865 (= lt!328005 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19812 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!738865 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328004 resIntermediateIndex!5 (select (arr!19812 a!3186) j!159) a!3186 mask!3328) lt!328003)))

(declare-fun b!738866 () Bool)

(declare-fun res!496734 () Bool)

(assert (=> b!738866 (=> (not res!496734) (not e!413179))))

(assert (=> b!738866 (= res!496734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!738867 () Bool)

(assert (=> b!738867 (= e!413177 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19812 a!3186) j!159) a!3186 mask!3328) lt!328012))))

(assert (= (and start!65224 res!496736) b!738849))

(assert (= (and b!738849 res!496733) b!738847))

(assert (= (and b!738847 res!496748) b!738854))

(assert (= (and b!738854 res!496740) b!738851))

(assert (= (and b!738851 res!496742) b!738862))

(assert (= (and b!738862 res!496737) b!738866))

(assert (= (and b!738866 res!496734) b!738848))

(assert (= (and b!738848 res!496741) b!738860))

(assert (= (and b!738860 res!496735) b!738858))

(assert (= (and b!738858 res!496746) b!738855))

(assert (= (and b!738855 res!496738) b!738846))

(assert (= (and b!738846 c!81437) b!738844))

(assert (= (and b!738846 (not c!81437)) b!738852))

(assert (= (and b!738846 res!496732) b!738864))

(assert (= (and b!738864 res!496745) b!738863))

(assert (= (and b!738863 res!496747) b!738850))

(assert (= (and b!738850 res!496743) b!738867))

(assert (= (and b!738863 (not res!496739)) b!738853))

(assert (= (and b!738853 c!81439) b!738857))

(assert (= (and b!738853 (not c!81439)) b!738865))

(assert (= (and b!738853 (not res!496731)) b!738861))

(assert (= (and b!738861 c!81438) b!738859))

(assert (= (and b!738861 (not c!81438)) b!738845))

(assert (= (and b!738861 (not res!496744)) b!738856))

(declare-fun m!690373 () Bool)

(assert (=> b!738844 m!690373))

(assert (=> b!738844 m!690373))

(declare-fun m!690375 () Bool)

(assert (=> b!738844 m!690375))

(assert (=> b!738858 m!690373))

(assert (=> b!738858 m!690373))

(declare-fun m!690377 () Bool)

(assert (=> b!738858 m!690377))

(assert (=> b!738858 m!690377))

(assert (=> b!738858 m!690373))

(declare-fun m!690379 () Bool)

(assert (=> b!738858 m!690379))

(declare-fun m!690381 () Bool)

(assert (=> b!738866 m!690381))

(assert (=> b!738852 m!690373))

(assert (=> b!738852 m!690373))

(declare-fun m!690383 () Bool)

(assert (=> b!738852 m!690383))

(assert (=> b!738845 m!690373))

(assert (=> b!738845 m!690373))

(declare-fun m!690385 () Bool)

(assert (=> b!738845 m!690385))

(declare-fun m!690387 () Bool)

(assert (=> b!738864 m!690387))

(declare-fun m!690389 () Bool)

(assert (=> b!738864 m!690389))

(declare-fun m!690391 () Bool)

(assert (=> b!738864 m!690391))

(declare-fun m!690393 () Bool)

(assert (=> b!738864 m!690393))

(assert (=> b!738864 m!690391))

(declare-fun m!690395 () Bool)

(assert (=> b!738864 m!690395))

(declare-fun m!690397 () Bool)

(assert (=> b!738862 m!690397))

(declare-fun m!690399 () Bool)

(assert (=> b!738853 m!690399))

(assert (=> b!738859 m!690373))

(assert (=> b!738859 m!690373))

(declare-fun m!690401 () Bool)

(assert (=> b!738859 m!690401))

(assert (=> b!738867 m!690373))

(assert (=> b!738867 m!690373))

(declare-fun m!690403 () Bool)

(assert (=> b!738867 m!690403))

(declare-fun m!690405 () Bool)

(assert (=> b!738855 m!690405))

(declare-fun m!690407 () Bool)

(assert (=> b!738863 m!690407))

(declare-fun m!690409 () Bool)

(assert (=> b!738863 m!690409))

(assert (=> b!738865 m!690373))

(assert (=> b!738865 m!690373))

(assert (=> b!738865 m!690383))

(assert (=> b!738865 m!690373))

(assert (=> b!738865 m!690385))

(declare-fun m!690411 () Bool)

(assert (=> start!65224 m!690411))

(declare-fun m!690413 () Bool)

(assert (=> start!65224 m!690413))

(declare-fun m!690415 () Bool)

(assert (=> b!738851 m!690415))

(assert (=> b!738850 m!690373))

(assert (=> b!738850 m!690373))

(declare-fun m!690417 () Bool)

(assert (=> b!738850 m!690417))

(declare-fun m!690419 () Bool)

(assert (=> b!738856 m!690419))

(declare-fun m!690421 () Bool)

(assert (=> b!738848 m!690421))

(assert (=> b!738847 m!690373))

(assert (=> b!738847 m!690373))

(declare-fun m!690423 () Bool)

(assert (=> b!738847 m!690423))

(declare-fun m!690425 () Bool)

(assert (=> b!738854 m!690425))

(assert (=> b!738857 m!690373))

(assert (=> b!738857 m!690373))

(assert (=> b!738857 m!690401))

(push 1)

