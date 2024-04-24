; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67246 () Bool)

(assert start!67246)

(declare-fun b!776067 () Bool)

(declare-fun res!524639 () Bool)

(declare-fun e!431989 () Bool)

(assert (=> b!776067 (=> res!524639 e!431989)))

(declare-fun e!431992 () Bool)

(assert (=> b!776067 (= res!524639 e!431992)))

(declare-fun c!86122 () Bool)

(declare-fun lt!345706 () Bool)

(assert (=> b!776067 (= c!86122 lt!345706)))

(declare-fun b!776068 () Bool)

(declare-fun res!524636 () Bool)

(declare-fun e!431982 () Bool)

(assert (=> b!776068 (=> (not res!524636) (not e!431982))))

(declare-datatypes ((array!42481 0))(
  ( (array!42482 (arr!20332 (Array (_ BitVec 32) (_ BitVec 64))) (size!20752 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42481)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!776068 (= res!524636 (and (= (size!20752 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20752 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20752 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776069 () Bool)

(declare-fun res!524635 () Bool)

(declare-fun e!431981 () Bool)

(assert (=> b!776069 (=> (not res!524635) (not e!431981))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!776069 (= res!524635 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20752 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20752 a!3186))))))

(declare-fun lt!345699 () (_ BitVec 32))

(declare-fun b!776070 () Bool)

(declare-datatypes ((SeekEntryResult!7888 0))(
  ( (MissingZero!7888 (index!33920 (_ BitVec 32))) (Found!7888 (index!33921 (_ BitVec 32))) (Intermediate!7888 (undefined!8700 Bool) (index!33922 (_ BitVec 32)) (x!65026 (_ BitVec 32))) (Undefined!7888) (MissingVacant!7888 (index!33923 (_ BitVec 32))) )
))
(declare-fun lt!345700 () SeekEntryResult!7888)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42481 (_ BitVec 32)) SeekEntryResult!7888)

(assert (=> b!776070 (= e!431992 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345699 resIntermediateIndex!5 (select (arr!20332 a!3186) j!159) a!3186 mask!3328) lt!345700)))))

(declare-fun b!776071 () Bool)

(declare-fun res!524633 () Bool)

(assert (=> b!776071 (=> (not res!524633) (not e!431982))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776071 (= res!524633 (validKeyInArray!0 k0!2102))))

(declare-fun b!776072 () Bool)

(declare-fun e!431985 () Bool)

(assert (=> b!776072 (= e!431985 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20332 a!3186) j!159) a!3186 mask!3328) (Found!7888 j!159)))))

(declare-fun b!776073 () Bool)

(declare-fun res!524643 () Bool)

(assert (=> b!776073 (=> res!524643 e!431989)))

(declare-fun lt!345708 () SeekEntryResult!7888)

(declare-fun lt!345702 () array!42481)

(declare-fun lt!345705 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42481 (_ BitVec 32)) SeekEntryResult!7888)

(assert (=> b!776073 (= res!524643 (not (= lt!345708 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345699 lt!345705 lt!345702 mask!3328))))))

(declare-fun b!776074 () Bool)

(assert (=> b!776074 (= e!431989 true)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42481 (_ BitVec 32)) SeekEntryResult!7888)

(assert (=> b!776074 (= (seekEntryOrOpen!0 lt!345705 lt!345702 mask!3328) lt!345700)))

(declare-datatypes ((Unit!26743 0))(
  ( (Unit!26744) )
))
(declare-fun lt!345697 () Unit!26743)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!42481 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26743)

(assert (=> b!776074 (= lt!345697 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k0!2102 j!159 lt!345699 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun b!776076 () Bool)

(declare-fun lt!345701 () SeekEntryResult!7888)

(assert (=> b!776076 (= e!431985 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20332 a!3186) j!159) a!3186 mask!3328) lt!345701))))

(declare-fun lt!345698 () SeekEntryResult!7888)

(declare-fun e!431983 () Bool)

(declare-fun b!776077 () Bool)

(assert (=> b!776077 (= e!431983 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20332 a!3186) j!159) a!3186 mask!3328) lt!345698))))

(declare-fun b!776078 () Bool)

(declare-fun e!431991 () Bool)

(declare-fun e!431986 () Bool)

(assert (=> b!776078 (= e!431991 (not e!431986))))

(declare-fun res!524647 () Bool)

(assert (=> b!776078 (=> res!524647 e!431986)))

(declare-fun lt!345704 () SeekEntryResult!7888)

(get-info :version)

(assert (=> b!776078 (= res!524647 (or (not ((_ is Intermediate!7888) lt!345704)) (bvsge x!1131 (x!65026 lt!345704))))))

(assert (=> b!776078 (= lt!345700 (Found!7888 j!159))))

(declare-fun e!431984 () Bool)

(assert (=> b!776078 e!431984))

(declare-fun res!524631 () Bool)

(assert (=> b!776078 (=> (not res!524631) (not e!431984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42481 (_ BitVec 32)) Bool)

(assert (=> b!776078 (= res!524631 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!345703 () Unit!26743)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42481 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26743)

(assert (=> b!776078 (= lt!345703 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776079 () Bool)

(assert (=> b!776079 (= e!431982 e!431981)))

(declare-fun res!524644 () Bool)

(assert (=> b!776079 (=> (not res!524644) (not e!431981))))

(declare-fun lt!345709 () SeekEntryResult!7888)

(assert (=> b!776079 (= res!524644 (or (= lt!345709 (MissingZero!7888 i!1173)) (= lt!345709 (MissingVacant!7888 i!1173))))))

(assert (=> b!776079 (= lt!345709 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!776080 () Bool)

(declare-fun e!431990 () Unit!26743)

(declare-fun Unit!26745 () Unit!26743)

(assert (=> b!776080 (= e!431990 Unit!26745)))

(assert (=> b!776080 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345699 (select (arr!20332 a!3186) j!159) a!3186 mask!3328) lt!345701)))

(declare-fun b!776081 () Bool)

(declare-fun res!524641 () Bool)

(declare-fun e!431987 () Bool)

(assert (=> b!776081 (=> (not res!524641) (not e!431987))))

(assert (=> b!776081 (= res!524641 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20332 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776082 () Bool)

(declare-fun res!524648 () Bool)

(assert (=> b!776082 (=> (not res!524648) (not e!431982))))

(declare-fun arrayContainsKey!0 (array!42481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776082 (= res!524648 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776083 () Bool)

(assert (=> b!776083 (= e!431986 e!431989)))

(declare-fun res!524638 () Bool)

(assert (=> b!776083 (=> res!524638 e!431989)))

(assert (=> b!776083 (= res!524638 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!345699 #b00000000000000000000000000000000) (bvsge lt!345699 (size!20752 a!3186))))))

(declare-fun lt!345696 () Unit!26743)

(assert (=> b!776083 (= lt!345696 e!431990)))

(declare-fun c!86121 () Bool)

(assert (=> b!776083 (= c!86121 lt!345706)))

(assert (=> b!776083 (= lt!345706 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776083 (= lt!345699 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!776084 () Bool)

(declare-fun res!524646 () Bool)

(assert (=> b!776084 (=> (not res!524646) (not e!431987))))

(assert (=> b!776084 (= res!524646 e!431985)))

(declare-fun c!86123 () Bool)

(assert (=> b!776084 (= c!86123 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776085 () Bool)

(declare-fun res!524642 () Bool)

(assert (=> b!776085 (=> (not res!524642) (not e!431981))))

(assert (=> b!776085 (= res!524642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!524640 () Bool)

(assert (=> start!67246 (=> (not res!524640) (not e!431982))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67246 (= res!524640 (validMask!0 mask!3328))))

(assert (=> start!67246 e!431982))

(assert (=> start!67246 true))

(declare-fun array_inv!16191 (array!42481) Bool)

(assert (=> start!67246 (array_inv!16191 a!3186)))

(declare-fun b!776075 () Bool)

(declare-fun res!524637 () Bool)

(assert (=> b!776075 (=> (not res!524637) (not e!431981))))

(declare-datatypes ((List!14241 0))(
  ( (Nil!14238) (Cons!14237 (h!15351 (_ BitVec 64)) (t!20548 List!14241)) )
))
(declare-fun arrayNoDuplicates!0 (array!42481 (_ BitVec 32) List!14241) Bool)

(assert (=> b!776075 (= res!524637 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14238))))

(declare-fun b!776086 () Bool)

(assert (=> b!776086 (= e!431992 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345699 (select (arr!20332 a!3186) j!159) a!3186 mask!3328) lt!345701)))))

(declare-fun b!776087 () Bool)

(assert (=> b!776087 (= e!431987 e!431991)))

(declare-fun res!524634 () Bool)

(assert (=> b!776087 (=> (not res!524634) (not e!431991))))

(assert (=> b!776087 (= res!524634 (= lt!345708 lt!345704))))

(assert (=> b!776087 (= lt!345704 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345705 lt!345702 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776087 (= lt!345708 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345705 mask!3328) lt!345705 lt!345702 mask!3328))))

(assert (=> b!776087 (= lt!345705 (select (store (arr!20332 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!776087 (= lt!345702 (array!42482 (store (arr!20332 a!3186) i!1173 k0!2102) (size!20752 a!3186)))))

(declare-fun b!776088 () Bool)

(assert (=> b!776088 (= e!431981 e!431987)))

(declare-fun res!524649 () Bool)

(assert (=> b!776088 (=> (not res!524649) (not e!431987))))

(assert (=> b!776088 (= res!524649 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20332 a!3186) j!159) mask!3328) (select (arr!20332 a!3186) j!159) a!3186 mask!3328) lt!345701))))

(assert (=> b!776088 (= lt!345701 (Intermediate!7888 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776089 () Bool)

(declare-fun Unit!26746 () Unit!26743)

(assert (=> b!776089 (= e!431990 Unit!26746)))

(declare-fun lt!345707 () SeekEntryResult!7888)

(assert (=> b!776089 (= lt!345707 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20332 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!776089 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!345699 resIntermediateIndex!5 (select (arr!20332 a!3186) j!159) a!3186 mask!3328) lt!345700)))

(declare-fun b!776090 () Bool)

(declare-fun res!524645 () Bool)

(assert (=> b!776090 (=> (not res!524645) (not e!431982))))

(assert (=> b!776090 (= res!524645 (validKeyInArray!0 (select (arr!20332 a!3186) j!159)))))

(declare-fun b!776091 () Bool)

(assert (=> b!776091 (= e!431984 e!431983)))

(declare-fun res!524632 () Bool)

(assert (=> b!776091 (=> (not res!524632) (not e!431983))))

(assert (=> b!776091 (= res!524632 (= (seekEntryOrOpen!0 (select (arr!20332 a!3186) j!159) a!3186 mask!3328) lt!345698))))

(assert (=> b!776091 (= lt!345698 (Found!7888 j!159))))

(assert (= (and start!67246 res!524640) b!776068))

(assert (= (and b!776068 res!524636) b!776090))

(assert (= (and b!776090 res!524645) b!776071))

(assert (= (and b!776071 res!524633) b!776082))

(assert (= (and b!776082 res!524648) b!776079))

(assert (= (and b!776079 res!524644) b!776085))

(assert (= (and b!776085 res!524642) b!776075))

(assert (= (and b!776075 res!524637) b!776069))

(assert (= (and b!776069 res!524635) b!776088))

(assert (= (and b!776088 res!524649) b!776081))

(assert (= (and b!776081 res!524641) b!776084))

(assert (= (and b!776084 c!86123) b!776076))

(assert (= (and b!776084 (not c!86123)) b!776072))

(assert (= (and b!776084 res!524646) b!776087))

(assert (= (and b!776087 res!524634) b!776078))

(assert (= (and b!776078 res!524631) b!776091))

(assert (= (and b!776091 res!524632) b!776077))

(assert (= (and b!776078 (not res!524647)) b!776083))

(assert (= (and b!776083 c!86121) b!776080))

(assert (= (and b!776083 (not c!86121)) b!776089))

(assert (= (and b!776083 (not res!524638)) b!776067))

(assert (= (and b!776067 c!86122) b!776086))

(assert (= (and b!776067 (not c!86122)) b!776070))

(assert (= (and b!776067 (not res!524639)) b!776073))

(assert (= (and b!776073 (not res!524643)) b!776074))

(declare-fun m!720713 () Bool)

(assert (=> b!776078 m!720713))

(declare-fun m!720715 () Bool)

(assert (=> b!776078 m!720715))

(declare-fun m!720717 () Bool)

(assert (=> b!776081 m!720717))

(declare-fun m!720719 () Bool)

(assert (=> b!776087 m!720719))

(declare-fun m!720721 () Bool)

(assert (=> b!776087 m!720721))

(declare-fun m!720723 () Bool)

(assert (=> b!776087 m!720723))

(declare-fun m!720725 () Bool)

(assert (=> b!776087 m!720725))

(assert (=> b!776087 m!720723))

(declare-fun m!720727 () Bool)

(assert (=> b!776087 m!720727))

(declare-fun m!720729 () Bool)

(assert (=> b!776070 m!720729))

(assert (=> b!776070 m!720729))

(declare-fun m!720731 () Bool)

(assert (=> b!776070 m!720731))

(declare-fun m!720733 () Bool)

(assert (=> b!776074 m!720733))

(declare-fun m!720735 () Bool)

(assert (=> b!776074 m!720735))

(assert (=> b!776091 m!720729))

(assert (=> b!776091 m!720729))

(declare-fun m!720737 () Bool)

(assert (=> b!776091 m!720737))

(assert (=> b!776090 m!720729))

(assert (=> b!776090 m!720729))

(declare-fun m!720739 () Bool)

(assert (=> b!776090 m!720739))

(declare-fun m!720741 () Bool)

(assert (=> b!776073 m!720741))

(assert (=> b!776076 m!720729))

(assert (=> b!776076 m!720729))

(declare-fun m!720743 () Bool)

(assert (=> b!776076 m!720743))

(assert (=> b!776089 m!720729))

(assert (=> b!776089 m!720729))

(declare-fun m!720745 () Bool)

(assert (=> b!776089 m!720745))

(assert (=> b!776089 m!720729))

(assert (=> b!776089 m!720731))

(assert (=> b!776086 m!720729))

(assert (=> b!776086 m!720729))

(declare-fun m!720747 () Bool)

(assert (=> b!776086 m!720747))

(assert (=> b!776088 m!720729))

(assert (=> b!776088 m!720729))

(declare-fun m!720749 () Bool)

(assert (=> b!776088 m!720749))

(assert (=> b!776088 m!720749))

(assert (=> b!776088 m!720729))

(declare-fun m!720751 () Bool)

(assert (=> b!776088 m!720751))

(declare-fun m!720753 () Bool)

(assert (=> b!776079 m!720753))

(assert (=> b!776080 m!720729))

(assert (=> b!776080 m!720729))

(assert (=> b!776080 m!720747))

(declare-fun m!720755 () Bool)

(assert (=> b!776083 m!720755))

(declare-fun m!720757 () Bool)

(assert (=> b!776085 m!720757))

(declare-fun m!720759 () Bool)

(assert (=> b!776071 m!720759))

(declare-fun m!720761 () Bool)

(assert (=> b!776075 m!720761))

(assert (=> b!776072 m!720729))

(assert (=> b!776072 m!720729))

(assert (=> b!776072 m!720745))

(declare-fun m!720763 () Bool)

(assert (=> b!776082 m!720763))

(assert (=> b!776077 m!720729))

(assert (=> b!776077 m!720729))

(declare-fun m!720765 () Bool)

(assert (=> b!776077 m!720765))

(declare-fun m!720767 () Bool)

(assert (=> start!67246 m!720767))

(declare-fun m!720769 () Bool)

(assert (=> start!67246 m!720769))

(check-sat (not b!776070) (not b!776074) (not b!776075) (not b!776078) (not b!776073) (not b!776085) (not b!776077) (not b!776089) (not b!776086) (not start!67246) (not b!776082) (not b!776072) (not b!776088) (not b!776071) (not b!776083) (not b!776087) (not b!776079) (not b!776090) (not b!776091) (not b!776080) (not b!776076))
(check-sat)
