; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64536 () Bool)

(assert start!64536)

(declare-fun b!726757 () Bool)

(declare-fun res!487712 () Bool)

(declare-fun e!406882 () Bool)

(assert (=> b!726757 (=> (not res!487712) (not e!406882))))

(declare-datatypes ((array!41054 0))(
  ( (array!41055 (arr!19648 (Array (_ BitVec 32) (_ BitVec 64))) (size!20069 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41054)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41054 (_ BitVec 32)) Bool)

(assert (=> b!726757 (= res!487712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!726758 () Bool)

(declare-fun e!406879 () Bool)

(declare-fun e!406883 () Bool)

(assert (=> b!726758 (= e!406879 e!406883)))

(declare-fun res!487704 () Bool)

(assert (=> b!726758 (=> (not res!487704) (not e!406883))))

(declare-datatypes ((SeekEntryResult!7248 0))(
  ( (MissingZero!7248 (index!31360 (_ BitVec 32))) (Found!7248 (index!31361 (_ BitVec 32))) (Intermediate!7248 (undefined!8060 Bool) (index!31362 (_ BitVec 32)) (x!62346 (_ BitVec 32))) (Undefined!7248) (MissingVacant!7248 (index!31363 (_ BitVec 32))) )
))
(declare-fun lt!321859 () SeekEntryResult!7248)

(declare-fun lt!321855 () SeekEntryResult!7248)

(assert (=> b!726758 (= res!487704 (= lt!321859 lt!321855))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!321858 () array!41054)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!321860 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41054 (_ BitVec 32)) SeekEntryResult!7248)

(assert (=> b!726758 (= lt!321855 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321860 lt!321858 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726758 (= lt!321859 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321860 mask!3328) lt!321860 lt!321858 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!726758 (= lt!321860 (select (store (arr!19648 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!726758 (= lt!321858 (array!41055 (store (arr!19648 a!3186) i!1173 k0!2102) (size!20069 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!406881 () Bool)

(declare-fun b!726759 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41054 (_ BitVec 32)) SeekEntryResult!7248)

(assert (=> b!726759 (= e!406881 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19648 a!3186) j!159) a!3186 mask!3328) (Found!7248 j!159)))))

(declare-fun b!726760 () Bool)

(declare-fun res!487714 () Bool)

(declare-fun e!406886 () Bool)

(assert (=> b!726760 (=> (not res!487714) (not e!406886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!726760 (= res!487714 (validKeyInArray!0 (select (arr!19648 a!3186) j!159)))))

(declare-fun b!726761 () Bool)

(declare-fun e!406880 () Bool)

(assert (=> b!726761 (= e!406883 (not e!406880))))

(declare-fun res!487710 () Bool)

(assert (=> b!726761 (=> res!487710 e!406880)))

(get-info :version)

(assert (=> b!726761 (= res!487710 (or (not ((_ is Intermediate!7248) lt!321855)) (bvsge x!1131 (x!62346 lt!321855))))))

(declare-fun e!406878 () Bool)

(assert (=> b!726761 e!406878))

(declare-fun res!487718 () Bool)

(assert (=> b!726761 (=> (not res!487718) (not e!406878))))

(assert (=> b!726761 (= res!487718 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24814 0))(
  ( (Unit!24815) )
))
(declare-fun lt!321857 () Unit!24814)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41054 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24814)

(assert (=> b!726761 (= lt!321857 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!726762 () Bool)

(declare-fun res!487705 () Bool)

(assert (=> b!726762 (=> (not res!487705) (not e!406882))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!726762 (= res!487705 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20069 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20069 a!3186))))))

(declare-fun b!726763 () Bool)

(declare-fun lt!321861 () SeekEntryResult!7248)

(assert (=> b!726763 (= e!406881 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19648 a!3186) j!159) a!3186 mask!3328) lt!321861))))

(declare-fun b!726764 () Bool)

(declare-fun res!487711 () Bool)

(assert (=> b!726764 (=> (not res!487711) (not e!406886))))

(assert (=> b!726764 (= res!487711 (and (= (size!20069 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20069 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20069 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!726765 () Bool)

(assert (=> b!726765 (= e!406880 true)))

(declare-fun lt!321856 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!726765 (= lt!321856 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!726766 () Bool)

(declare-fun e!406885 () Bool)

(assert (=> b!726766 (= e!406878 e!406885)))

(declare-fun res!487715 () Bool)

(assert (=> b!726766 (=> (not res!487715) (not e!406885))))

(declare-fun lt!321862 () SeekEntryResult!7248)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41054 (_ BitVec 32)) SeekEntryResult!7248)

(assert (=> b!726766 (= res!487715 (= (seekEntryOrOpen!0 (select (arr!19648 a!3186) j!159) a!3186 mask!3328) lt!321862))))

(assert (=> b!726766 (= lt!321862 (Found!7248 j!159))))

(declare-fun b!726767 () Bool)

(declare-fun res!487709 () Bool)

(assert (=> b!726767 (=> (not res!487709) (not e!406882))))

(declare-datatypes ((List!13650 0))(
  ( (Nil!13647) (Cons!13646 (h!14703 (_ BitVec 64)) (t!19965 List!13650)) )
))
(declare-fun arrayNoDuplicates!0 (array!41054 (_ BitVec 32) List!13650) Bool)

(assert (=> b!726767 (= res!487709 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13647))))

(declare-fun b!726768 () Bool)

(assert (=> b!726768 (= e!406882 e!406879)))

(declare-fun res!487708 () Bool)

(assert (=> b!726768 (=> (not res!487708) (not e!406879))))

(assert (=> b!726768 (= res!487708 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19648 a!3186) j!159) mask!3328) (select (arr!19648 a!3186) j!159) a!3186 mask!3328) lt!321861))))

(assert (=> b!726768 (= lt!321861 (Intermediate!7248 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!726769 () Bool)

(assert (=> b!726769 (= e!406885 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19648 a!3186) j!159) a!3186 mask!3328) lt!321862))))

(declare-fun b!726770 () Bool)

(assert (=> b!726770 (= e!406886 e!406882)))

(declare-fun res!487717 () Bool)

(assert (=> b!726770 (=> (not res!487717) (not e!406882))))

(declare-fun lt!321863 () SeekEntryResult!7248)

(assert (=> b!726770 (= res!487717 (or (= lt!321863 (MissingZero!7248 i!1173)) (= lt!321863 (MissingVacant!7248 i!1173))))))

(assert (=> b!726770 (= lt!321863 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!487713 () Bool)

(assert (=> start!64536 (=> (not res!487713) (not e!406886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64536 (= res!487713 (validMask!0 mask!3328))))

(assert (=> start!64536 e!406886))

(assert (=> start!64536 true))

(declare-fun array_inv!15444 (array!41054) Bool)

(assert (=> start!64536 (array_inv!15444 a!3186)))

(declare-fun b!726771 () Bool)

(declare-fun res!487706 () Bool)

(assert (=> b!726771 (=> (not res!487706) (not e!406886))))

(declare-fun arrayContainsKey!0 (array!41054 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!726771 (= res!487706 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!726772 () Bool)

(declare-fun res!487716 () Bool)

(assert (=> b!726772 (=> (not res!487716) (not e!406886))))

(assert (=> b!726772 (= res!487716 (validKeyInArray!0 k0!2102))))

(declare-fun b!726773 () Bool)

(declare-fun res!487707 () Bool)

(assert (=> b!726773 (=> (not res!487707) (not e!406879))))

(assert (=> b!726773 (= res!487707 e!406881)))

(declare-fun c!79900 () Bool)

(assert (=> b!726773 (= c!79900 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!726774 () Bool)

(declare-fun res!487703 () Bool)

(assert (=> b!726774 (=> (not res!487703) (not e!406879))))

(assert (=> b!726774 (= res!487703 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19648 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!64536 res!487713) b!726764))

(assert (= (and b!726764 res!487711) b!726760))

(assert (= (and b!726760 res!487714) b!726772))

(assert (= (and b!726772 res!487716) b!726771))

(assert (= (and b!726771 res!487706) b!726770))

(assert (= (and b!726770 res!487717) b!726757))

(assert (= (and b!726757 res!487712) b!726767))

(assert (= (and b!726767 res!487709) b!726762))

(assert (= (and b!726762 res!487705) b!726768))

(assert (= (and b!726768 res!487708) b!726774))

(assert (= (and b!726774 res!487703) b!726773))

(assert (= (and b!726773 c!79900) b!726763))

(assert (= (and b!726773 (not c!79900)) b!726759))

(assert (= (and b!726773 res!487707) b!726758))

(assert (= (and b!726758 res!487704) b!726761))

(assert (= (and b!726761 res!487718) b!726766))

(assert (= (and b!726766 res!487715) b!726769))

(assert (= (and b!726761 (not res!487710)) b!726765))

(declare-fun m!680785 () Bool)

(assert (=> b!726763 m!680785))

(assert (=> b!726763 m!680785))

(declare-fun m!680787 () Bool)

(assert (=> b!726763 m!680787))

(declare-fun m!680789 () Bool)

(assert (=> b!726770 m!680789))

(declare-fun m!680791 () Bool)

(assert (=> b!726757 m!680791))

(declare-fun m!680793 () Bool)

(assert (=> b!726765 m!680793))

(declare-fun m!680795 () Bool)

(assert (=> b!726771 m!680795))

(declare-fun m!680797 () Bool)

(assert (=> b!726774 m!680797))

(declare-fun m!680799 () Bool)

(assert (=> b!726767 m!680799))

(declare-fun m!680801 () Bool)

(assert (=> b!726758 m!680801))

(declare-fun m!680803 () Bool)

(assert (=> b!726758 m!680803))

(declare-fun m!680805 () Bool)

(assert (=> b!726758 m!680805))

(declare-fun m!680807 () Bool)

(assert (=> b!726758 m!680807))

(assert (=> b!726758 m!680805))

(declare-fun m!680809 () Bool)

(assert (=> b!726758 m!680809))

(declare-fun m!680811 () Bool)

(assert (=> start!64536 m!680811))

(declare-fun m!680813 () Bool)

(assert (=> start!64536 m!680813))

(assert (=> b!726768 m!680785))

(assert (=> b!726768 m!680785))

(declare-fun m!680815 () Bool)

(assert (=> b!726768 m!680815))

(assert (=> b!726768 m!680815))

(assert (=> b!726768 m!680785))

(declare-fun m!680817 () Bool)

(assert (=> b!726768 m!680817))

(assert (=> b!726766 m!680785))

(assert (=> b!726766 m!680785))

(declare-fun m!680819 () Bool)

(assert (=> b!726766 m!680819))

(assert (=> b!726760 m!680785))

(assert (=> b!726760 m!680785))

(declare-fun m!680821 () Bool)

(assert (=> b!726760 m!680821))

(declare-fun m!680823 () Bool)

(assert (=> b!726761 m!680823))

(declare-fun m!680825 () Bool)

(assert (=> b!726761 m!680825))

(assert (=> b!726769 m!680785))

(assert (=> b!726769 m!680785))

(declare-fun m!680827 () Bool)

(assert (=> b!726769 m!680827))

(assert (=> b!726759 m!680785))

(assert (=> b!726759 m!680785))

(declare-fun m!680829 () Bool)

(assert (=> b!726759 m!680829))

(declare-fun m!680831 () Bool)

(assert (=> b!726772 m!680831))

(check-sat (not b!726768) (not b!726763) (not b!726766) (not b!726769) (not b!726771) (not b!726761) (not b!726765) (not b!726759) (not b!726767) (not b!726760) (not b!726758) (not b!726772) (not b!726757) (not start!64536) (not b!726770))
(check-sat)
