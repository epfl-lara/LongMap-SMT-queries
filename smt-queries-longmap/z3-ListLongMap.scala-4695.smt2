; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65358 () Bool)

(assert start!65358)

(declare-fun b!739805 () Bool)

(declare-fun res!497215 () Bool)

(declare-fun e!413763 () Bool)

(assert (=> b!739805 (=> (not res!497215) (not e!413763))))

(declare-datatypes ((array!41401 0))(
  ( (array!41402 (arr!19810 (Array (_ BitVec 32) (_ BitVec 64))) (size!20230 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41401)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!739805 (= res!497215 (and (= (size!20230 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20230 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20230 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!739806 () Bool)

(declare-fun res!497213 () Bool)

(assert (=> b!739806 (=> (not res!497213) (not e!413763))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!739806 (= res!497213 (validKeyInArray!0 k0!2102))))

(declare-fun b!739807 () Bool)

(declare-fun e!413766 () Bool)

(assert (=> b!739807 (= e!413763 e!413766)))

(declare-fun res!497198 () Bool)

(assert (=> b!739807 (=> (not res!497198) (not e!413766))))

(declare-datatypes ((SeekEntryResult!7366 0))(
  ( (MissingZero!7366 (index!31832 (_ BitVec 32))) (Found!7366 (index!31833 (_ BitVec 32))) (Intermediate!7366 (undefined!8178 Bool) (index!31834 (_ BitVec 32)) (x!62984 (_ BitVec 32))) (Undefined!7366) (MissingVacant!7366 (index!31835 (_ BitVec 32))) )
))
(declare-fun lt!328442 () SeekEntryResult!7366)

(assert (=> b!739807 (= res!497198 (or (= lt!328442 (MissingZero!7366 i!1173)) (= lt!328442 (MissingVacant!7366 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41401 (_ BitVec 32)) SeekEntryResult!7366)

(assert (=> b!739807 (= lt!328442 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!739808 () Bool)

(declare-fun res!497205 () Bool)

(declare-fun e!413768 () Bool)

(assert (=> b!739808 (=> (not res!497205) (not e!413768))))

(declare-fun e!413761 () Bool)

(assert (=> b!739808 (= res!497205 e!413761)))

(declare-fun c!81688 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!739808 (= c!81688 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!739809 () Bool)

(assert (=> b!739809 (= e!413766 e!413768)))

(declare-fun res!497207 () Bool)

(assert (=> b!739809 (=> (not res!497207) (not e!413768))))

(declare-fun lt!328441 () SeekEntryResult!7366)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41401 (_ BitVec 32)) SeekEntryResult!7366)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739809 (= res!497207 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19810 a!3186) j!159) mask!3328) (select (arr!19810 a!3186) j!159) a!3186 mask!3328) lt!328441))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!739809 (= lt!328441 (Intermediate!7366 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!497209 () Bool)

(assert (=> start!65358 (=> (not res!497209) (not e!413763))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65358 (= res!497209 (validMask!0 mask!3328))))

(assert (=> start!65358 e!413763))

(assert (=> start!65358 true))

(declare-fun array_inv!15669 (array!41401) Bool)

(assert (=> start!65358 (array_inv!15669 a!3186)))

(declare-fun b!739810 () Bool)

(declare-fun res!497210 () Bool)

(assert (=> b!739810 (=> (not res!497210) (not e!413763))))

(declare-fun arrayContainsKey!0 (array!41401 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!739810 (= res!497210 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!739811 () Bool)

(declare-fun lt!328443 () SeekEntryResult!7366)

(declare-fun e!413762 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41401 (_ BitVec 32)) SeekEntryResult!7366)

(assert (=> b!739811 (= e!413762 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19810 a!3186) j!159) a!3186 mask!3328) lt!328443))))

(declare-fun b!739812 () Bool)

(declare-fun lt!328439 () (_ BitVec 32))

(declare-fun e!413765 () Bool)

(declare-fun lt!328445 () SeekEntryResult!7366)

(assert (=> b!739812 (= e!413765 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328439 resIntermediateIndex!5 (select (arr!19810 a!3186) j!159) a!3186 mask!3328) lt!328445)))))

(declare-fun b!739813 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!739813 (= e!413761 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19810 a!3186) j!159) a!3186 mask!3328) (Found!7366 j!159)))))

(declare-fun b!739814 () Bool)

(declare-fun e!413771 () Bool)

(assert (=> b!739814 (= e!413771 true)))

(declare-fun lt!328444 () array!41401)

(declare-fun lt!328450 () (_ BitVec 64))

(declare-fun lt!328451 () SeekEntryResult!7366)

(assert (=> b!739814 (= lt!328451 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328439 lt!328450 lt!328444 mask!3328))))

(declare-fun b!739815 () Bool)

(declare-datatypes ((Unit!25237 0))(
  ( (Unit!25238) )
))
(declare-fun e!413772 () Unit!25237)

(declare-fun Unit!25239 () Unit!25237)

(assert (=> b!739815 (= e!413772 Unit!25239)))

(declare-fun lt!328440 () SeekEntryResult!7366)

(assert (=> b!739815 (= lt!328440 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19810 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!739815 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328439 resIntermediateIndex!5 (select (arr!19810 a!3186) j!159) a!3186 mask!3328) lt!328445)))

(declare-fun b!739816 () Bool)

(declare-fun res!497206 () Bool)

(assert (=> b!739816 (=> res!497206 e!413771)))

(assert (=> b!739816 (= res!497206 e!413765)))

(declare-fun c!81687 () Bool)

(declare-fun lt!328448 () Bool)

(assert (=> b!739816 (= c!81687 lt!328448)))

(declare-fun b!739817 () Bool)

(declare-fun e!413767 () Bool)

(assert (=> b!739817 (= e!413767 e!413771)))

(declare-fun res!497211 () Bool)

(assert (=> b!739817 (=> res!497211 e!413771)))

(assert (=> b!739817 (= res!497211 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328439 #b00000000000000000000000000000000) (bvsge lt!328439 (size!20230 a!3186))))))

(declare-fun lt!328449 () Unit!25237)

(assert (=> b!739817 (= lt!328449 e!413772)))

(declare-fun c!81689 () Bool)

(assert (=> b!739817 (= c!81689 lt!328448)))

(assert (=> b!739817 (= lt!328448 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!739817 (= lt!328439 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!739818 () Bool)

(assert (=> b!739818 (= e!413761 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19810 a!3186) j!159) a!3186 mask!3328) lt!328441))))

(declare-fun b!739819 () Bool)

(declare-fun e!413769 () Bool)

(assert (=> b!739819 (= e!413769 e!413762)))

(declare-fun res!497199 () Bool)

(assert (=> b!739819 (=> (not res!497199) (not e!413762))))

(assert (=> b!739819 (= res!497199 (= (seekEntryOrOpen!0 (select (arr!19810 a!3186) j!159) a!3186 mask!3328) lt!328443))))

(assert (=> b!739819 (= lt!328443 (Found!7366 j!159))))

(declare-fun b!739820 () Bool)

(declare-fun res!497201 () Bool)

(assert (=> b!739820 (=> (not res!497201) (not e!413766))))

(assert (=> b!739820 (= res!497201 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20230 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20230 a!3186))))))

(declare-fun b!739821 () Bool)

(declare-fun e!413764 () Bool)

(assert (=> b!739821 (= e!413764 (not e!413767))))

(declare-fun res!497204 () Bool)

(assert (=> b!739821 (=> res!497204 e!413767)))

(declare-fun lt!328447 () SeekEntryResult!7366)

(get-info :version)

(assert (=> b!739821 (= res!497204 (or (not ((_ is Intermediate!7366) lt!328447)) (bvsge x!1131 (x!62984 lt!328447))))))

(assert (=> b!739821 (= lt!328445 (Found!7366 j!159))))

(assert (=> b!739821 e!413769))

(declare-fun res!497212 () Bool)

(assert (=> b!739821 (=> (not res!497212) (not e!413769))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41401 (_ BitVec 32)) Bool)

(assert (=> b!739821 (= res!497212 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328446 () Unit!25237)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41401 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25237)

(assert (=> b!739821 (= lt!328446 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!739822 () Bool)

(declare-fun res!497208 () Bool)

(assert (=> b!739822 (=> (not res!497208) (not e!413766))))

(assert (=> b!739822 (= res!497208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!739823 () Bool)

(declare-fun res!497200 () Bool)

(assert (=> b!739823 (=> (not res!497200) (not e!413766))))

(declare-datatypes ((List!13719 0))(
  ( (Nil!13716) (Cons!13715 (h!14793 (_ BitVec 64)) (t!20026 List!13719)) )
))
(declare-fun arrayNoDuplicates!0 (array!41401 (_ BitVec 32) List!13719) Bool)

(assert (=> b!739823 (= res!497200 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13716))))

(declare-fun b!739824 () Bool)

(declare-fun Unit!25240 () Unit!25237)

(assert (=> b!739824 (= e!413772 Unit!25240)))

(assert (=> b!739824 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328439 (select (arr!19810 a!3186) j!159) a!3186 mask!3328) lt!328441)))

(declare-fun b!739825 () Bool)

(declare-fun res!497203 () Bool)

(assert (=> b!739825 (=> (not res!497203) (not e!413763))))

(assert (=> b!739825 (= res!497203 (validKeyInArray!0 (select (arr!19810 a!3186) j!159)))))

(declare-fun b!739826 () Bool)

(assert (=> b!739826 (= e!413768 e!413764)))

(declare-fun res!497214 () Bool)

(assert (=> b!739826 (=> (not res!497214) (not e!413764))))

(declare-fun lt!328452 () SeekEntryResult!7366)

(assert (=> b!739826 (= res!497214 (= lt!328452 lt!328447))))

(assert (=> b!739826 (= lt!328447 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328450 lt!328444 mask!3328))))

(assert (=> b!739826 (= lt!328452 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328450 mask!3328) lt!328450 lt!328444 mask!3328))))

(assert (=> b!739826 (= lt!328450 (select (store (arr!19810 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!739826 (= lt!328444 (array!41402 (store (arr!19810 a!3186) i!1173 k0!2102) (size!20230 a!3186)))))

(declare-fun b!739827 () Bool)

(declare-fun res!497202 () Bool)

(assert (=> b!739827 (=> (not res!497202) (not e!413768))))

(assert (=> b!739827 (= res!497202 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19810 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!739828 () Bool)

(assert (=> b!739828 (= e!413765 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328439 (select (arr!19810 a!3186) j!159) a!3186 mask!3328) lt!328441)))))

(assert (= (and start!65358 res!497209) b!739805))

(assert (= (and b!739805 res!497215) b!739825))

(assert (= (and b!739825 res!497203) b!739806))

(assert (= (and b!739806 res!497213) b!739810))

(assert (= (and b!739810 res!497210) b!739807))

(assert (= (and b!739807 res!497198) b!739822))

(assert (= (and b!739822 res!497208) b!739823))

(assert (= (and b!739823 res!497200) b!739820))

(assert (= (and b!739820 res!497201) b!739809))

(assert (= (and b!739809 res!497207) b!739827))

(assert (= (and b!739827 res!497202) b!739808))

(assert (= (and b!739808 c!81688) b!739818))

(assert (= (and b!739808 (not c!81688)) b!739813))

(assert (= (and b!739808 res!497205) b!739826))

(assert (= (and b!739826 res!497214) b!739821))

(assert (= (and b!739821 res!497212) b!739819))

(assert (= (and b!739819 res!497199) b!739811))

(assert (= (and b!739821 (not res!497204)) b!739817))

(assert (= (and b!739817 c!81689) b!739824))

(assert (= (and b!739817 (not c!81689)) b!739815))

(assert (= (and b!739817 (not res!497211)) b!739816))

(assert (= (and b!739816 c!81687) b!739828))

(assert (= (and b!739816 (not c!81687)) b!739812))

(assert (= (and b!739816 (not res!497206)) b!739814))

(declare-fun m!691695 () Bool)

(assert (=> b!739823 m!691695))

(declare-fun m!691697 () Bool)

(assert (=> b!739815 m!691697))

(assert (=> b!739815 m!691697))

(declare-fun m!691699 () Bool)

(assert (=> b!739815 m!691699))

(assert (=> b!739815 m!691697))

(declare-fun m!691701 () Bool)

(assert (=> b!739815 m!691701))

(declare-fun m!691703 () Bool)

(assert (=> b!739814 m!691703))

(assert (=> b!739825 m!691697))

(assert (=> b!739825 m!691697))

(declare-fun m!691705 () Bool)

(assert (=> b!739825 m!691705))

(declare-fun m!691707 () Bool)

(assert (=> b!739810 m!691707))

(assert (=> b!739813 m!691697))

(assert (=> b!739813 m!691697))

(assert (=> b!739813 m!691699))

(assert (=> b!739819 m!691697))

(assert (=> b!739819 m!691697))

(declare-fun m!691709 () Bool)

(assert (=> b!739819 m!691709))

(declare-fun m!691711 () Bool)

(assert (=> b!739822 m!691711))

(assert (=> b!739824 m!691697))

(assert (=> b!739824 m!691697))

(declare-fun m!691713 () Bool)

(assert (=> b!739824 m!691713))

(declare-fun m!691715 () Bool)

(assert (=> b!739806 m!691715))

(assert (=> b!739811 m!691697))

(assert (=> b!739811 m!691697))

(declare-fun m!691717 () Bool)

(assert (=> b!739811 m!691717))

(declare-fun m!691719 () Bool)

(assert (=> b!739827 m!691719))

(assert (=> b!739818 m!691697))

(assert (=> b!739818 m!691697))

(declare-fun m!691721 () Bool)

(assert (=> b!739818 m!691721))

(assert (=> b!739828 m!691697))

(assert (=> b!739828 m!691697))

(assert (=> b!739828 m!691713))

(declare-fun m!691723 () Bool)

(assert (=> b!739807 m!691723))

(declare-fun m!691725 () Bool)

(assert (=> start!65358 m!691725))

(declare-fun m!691727 () Bool)

(assert (=> start!65358 m!691727))

(assert (=> b!739809 m!691697))

(assert (=> b!739809 m!691697))

(declare-fun m!691729 () Bool)

(assert (=> b!739809 m!691729))

(assert (=> b!739809 m!691729))

(assert (=> b!739809 m!691697))

(declare-fun m!691731 () Bool)

(assert (=> b!739809 m!691731))

(declare-fun m!691733 () Bool)

(assert (=> b!739821 m!691733))

(declare-fun m!691735 () Bool)

(assert (=> b!739821 m!691735))

(declare-fun m!691737 () Bool)

(assert (=> b!739817 m!691737))

(assert (=> b!739812 m!691697))

(assert (=> b!739812 m!691697))

(assert (=> b!739812 m!691701))

(declare-fun m!691739 () Bool)

(assert (=> b!739826 m!691739))

(declare-fun m!691741 () Bool)

(assert (=> b!739826 m!691741))

(declare-fun m!691743 () Bool)

(assert (=> b!739826 m!691743))

(declare-fun m!691745 () Bool)

(assert (=> b!739826 m!691745))

(assert (=> b!739826 m!691741))

(declare-fun m!691747 () Bool)

(assert (=> b!739826 m!691747))

(check-sat (not b!739817) (not b!739811) (not b!739810) (not b!739807) (not b!739823) (not b!739814) (not b!739809) (not b!739826) (not b!739822) (not b!739821) (not b!739818) (not start!65358) (not b!739825) (not b!739813) (not b!739812) (not b!739819) (not b!739824) (not b!739806) (not b!739828) (not b!739815))
(check-sat)
