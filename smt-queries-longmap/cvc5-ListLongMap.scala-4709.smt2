; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65314 () Bool)

(assert start!65314)

(declare-fun b!741800 () Bool)

(declare-fun e!414622 () Bool)

(declare-fun e!414621 () Bool)

(assert (=> b!741800 (= e!414622 e!414621)))

(declare-fun res!499070 () Bool)

(assert (=> b!741800 (=> (not res!499070) (not e!414621))))

(declare-datatypes ((SeekEntryResult!7457 0))(
  ( (MissingZero!7457 (index!32196 (_ BitVec 32))) (Found!7457 (index!32197 (_ BitVec 32))) (Intermediate!7457 (undefined!8269 Bool) (index!32198 (_ BitVec 32)) (x!63175 (_ BitVec 32))) (Undefined!7457) (MissingVacant!7457 (index!32199 (_ BitVec 32))) )
))
(declare-fun lt!329555 () SeekEntryResult!7457)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741800 (= res!499070 (or (= lt!329555 (MissingZero!7457 i!1173)) (= lt!329555 (MissingVacant!7457 i!1173))))))

(declare-datatypes ((array!41487 0))(
  ( (array!41488 (arr!19857 (Array (_ BitVec 32) (_ BitVec 64))) (size!20278 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41487)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41487 (_ BitVec 32)) SeekEntryResult!7457)

(assert (=> b!741800 (= lt!329555 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!741801 () Bool)

(declare-fun res!499073 () Bool)

(assert (=> b!741801 (=> (not res!499073) (not e!414621))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741801 (= res!499073 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20278 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20278 a!3186))))))

(declare-fun e!414617 () Bool)

(declare-fun lt!329559 () SeekEntryResult!7457)

(declare-fun b!741802 () Bool)

(assert (=> b!741802 (= e!414617 (not (or (not (is-Intermediate!7457 lt!329559)) (not (= x!1131 (x!63175 lt!329559))) (not (= index!1321 (index!32198 lt!329559))) (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(declare-fun e!414618 () Bool)

(assert (=> b!741802 e!414618))

(declare-fun res!499075 () Bool)

(assert (=> b!741802 (=> (not res!499075) (not e!414618))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41487 (_ BitVec 32)) Bool)

(assert (=> b!741802 (= res!499075 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25394 0))(
  ( (Unit!25395) )
))
(declare-fun lt!329556 () Unit!25394)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41487 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25394)

(assert (=> b!741802 (= lt!329556 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!499065 () Bool)

(assert (=> start!65314 (=> (not res!499065) (not e!414622))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65314 (= res!499065 (validMask!0 mask!3328))))

(assert (=> start!65314 e!414622))

(assert (=> start!65314 true))

(declare-fun array_inv!15653 (array!41487) Bool)

(assert (=> start!65314 (array_inv!15653 a!3186)))

(declare-fun b!741803 () Bool)

(declare-fun res!499071 () Bool)

(declare-fun e!414619 () Bool)

(assert (=> b!741803 (=> (not res!499071) (not e!414619))))

(assert (=> b!741803 (= res!499071 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19857 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741804 () Bool)

(declare-fun res!499079 () Bool)

(assert (=> b!741804 (=> (not res!499079) (not e!414622))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741804 (= res!499079 (validKeyInArray!0 k!2102))))

(declare-fun b!741805 () Bool)

(declare-fun res!499078 () Bool)

(assert (=> b!741805 (=> (not res!499078) (not e!414622))))

(declare-fun arrayContainsKey!0 (array!41487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741805 (= res!499078 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun lt!329561 () SeekEntryResult!7457)

(declare-fun e!414616 () Bool)

(declare-fun b!741806 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41487 (_ BitVec 32)) SeekEntryResult!7457)

(assert (=> b!741806 (= e!414616 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19857 a!3186) j!159) a!3186 mask!3328) lt!329561))))

(declare-fun b!741807 () Bool)

(assert (=> b!741807 (= e!414619 e!414617)))

(declare-fun res!499077 () Bool)

(assert (=> b!741807 (=> (not res!499077) (not e!414617))))

(declare-fun lt!329560 () SeekEntryResult!7457)

(assert (=> b!741807 (= res!499077 (= lt!329560 lt!329559))))

(declare-fun lt!329558 () (_ BitVec 64))

(declare-fun lt!329554 () array!41487)

(assert (=> b!741807 (= lt!329559 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329558 lt!329554 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741807 (= lt!329560 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329558 mask!3328) lt!329558 lt!329554 mask!3328))))

(assert (=> b!741807 (= lt!329558 (select (store (arr!19857 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!741807 (= lt!329554 (array!41488 (store (arr!19857 a!3186) i!1173 k!2102) (size!20278 a!3186)))))

(declare-fun b!741808 () Bool)

(declare-fun res!499069 () Bool)

(assert (=> b!741808 (=> (not res!499069) (not e!414621))))

(assert (=> b!741808 (= res!499069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741809 () Bool)

(declare-fun res!499068 () Bool)

(assert (=> b!741809 (=> (not res!499068) (not e!414622))))

(assert (=> b!741809 (= res!499068 (and (= (size!20278 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20278 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20278 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741810 () Bool)

(declare-fun res!499067 () Bool)

(assert (=> b!741810 (=> (not res!499067) (not e!414621))))

(declare-datatypes ((List!13859 0))(
  ( (Nil!13856) (Cons!13855 (h!14927 (_ BitVec 64)) (t!20174 List!13859)) )
))
(declare-fun arrayNoDuplicates!0 (array!41487 (_ BitVec 32) List!13859) Bool)

(assert (=> b!741810 (= res!499067 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13856))))

(declare-fun b!741811 () Bool)

(declare-fun e!414623 () Bool)

(assert (=> b!741811 (= e!414618 e!414623)))

(declare-fun res!499076 () Bool)

(assert (=> b!741811 (=> (not res!499076) (not e!414623))))

(declare-fun lt!329557 () SeekEntryResult!7457)

(assert (=> b!741811 (= res!499076 (= (seekEntryOrOpen!0 (select (arr!19857 a!3186) j!159) a!3186 mask!3328) lt!329557))))

(assert (=> b!741811 (= lt!329557 (Found!7457 j!159))))

(declare-fun b!741812 () Bool)

(declare-fun res!499066 () Bool)

(assert (=> b!741812 (=> (not res!499066) (not e!414619))))

(assert (=> b!741812 (= res!499066 e!414616)))

(declare-fun c!81748 () Bool)

(assert (=> b!741812 (= c!81748 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741813 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41487 (_ BitVec 32)) SeekEntryResult!7457)

(assert (=> b!741813 (= e!414623 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19857 a!3186) j!159) a!3186 mask!3328) lt!329557))))

(declare-fun b!741814 () Bool)

(assert (=> b!741814 (= e!414621 e!414619)))

(declare-fun res!499074 () Bool)

(assert (=> b!741814 (=> (not res!499074) (not e!414619))))

(assert (=> b!741814 (= res!499074 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19857 a!3186) j!159) mask!3328) (select (arr!19857 a!3186) j!159) a!3186 mask!3328) lt!329561))))

(assert (=> b!741814 (= lt!329561 (Intermediate!7457 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741815 () Bool)

(assert (=> b!741815 (= e!414616 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19857 a!3186) j!159) a!3186 mask!3328) (Found!7457 j!159)))))

(declare-fun b!741816 () Bool)

(declare-fun res!499072 () Bool)

(assert (=> b!741816 (=> (not res!499072) (not e!414622))))

(assert (=> b!741816 (= res!499072 (validKeyInArray!0 (select (arr!19857 a!3186) j!159)))))

(assert (= (and start!65314 res!499065) b!741809))

(assert (= (and b!741809 res!499068) b!741816))

(assert (= (and b!741816 res!499072) b!741804))

(assert (= (and b!741804 res!499079) b!741805))

(assert (= (and b!741805 res!499078) b!741800))

(assert (= (and b!741800 res!499070) b!741808))

(assert (= (and b!741808 res!499069) b!741810))

(assert (= (and b!741810 res!499067) b!741801))

(assert (= (and b!741801 res!499073) b!741814))

(assert (= (and b!741814 res!499074) b!741803))

(assert (= (and b!741803 res!499071) b!741812))

(assert (= (and b!741812 c!81748) b!741806))

(assert (= (and b!741812 (not c!81748)) b!741815))

(assert (= (and b!741812 res!499066) b!741807))

(assert (= (and b!741807 res!499077) b!741802))

(assert (= (and b!741802 res!499075) b!741811))

(assert (= (and b!741811 res!499076) b!741813))

(declare-fun m!692737 () Bool)

(assert (=> b!741811 m!692737))

(assert (=> b!741811 m!692737))

(declare-fun m!692739 () Bool)

(assert (=> b!741811 m!692739))

(declare-fun m!692741 () Bool)

(assert (=> start!65314 m!692741))

(declare-fun m!692743 () Bool)

(assert (=> start!65314 m!692743))

(declare-fun m!692745 () Bool)

(assert (=> b!741805 m!692745))

(declare-fun m!692747 () Bool)

(assert (=> b!741800 m!692747))

(declare-fun m!692749 () Bool)

(assert (=> b!741803 m!692749))

(assert (=> b!741806 m!692737))

(assert (=> b!741806 m!692737))

(declare-fun m!692751 () Bool)

(assert (=> b!741806 m!692751))

(assert (=> b!741814 m!692737))

(assert (=> b!741814 m!692737))

(declare-fun m!692753 () Bool)

(assert (=> b!741814 m!692753))

(assert (=> b!741814 m!692753))

(assert (=> b!741814 m!692737))

(declare-fun m!692755 () Bool)

(assert (=> b!741814 m!692755))

(assert (=> b!741815 m!692737))

(assert (=> b!741815 m!692737))

(declare-fun m!692757 () Bool)

(assert (=> b!741815 m!692757))

(declare-fun m!692759 () Bool)

(assert (=> b!741802 m!692759))

(declare-fun m!692761 () Bool)

(assert (=> b!741802 m!692761))

(declare-fun m!692763 () Bool)

(assert (=> b!741808 m!692763))

(declare-fun m!692765 () Bool)

(assert (=> b!741807 m!692765))

(declare-fun m!692767 () Bool)

(assert (=> b!741807 m!692767))

(declare-fun m!692769 () Bool)

(assert (=> b!741807 m!692769))

(assert (=> b!741807 m!692767))

(declare-fun m!692771 () Bool)

(assert (=> b!741807 m!692771))

(declare-fun m!692773 () Bool)

(assert (=> b!741807 m!692773))

(assert (=> b!741816 m!692737))

(assert (=> b!741816 m!692737))

(declare-fun m!692775 () Bool)

(assert (=> b!741816 m!692775))

(declare-fun m!692777 () Bool)

(assert (=> b!741804 m!692777))

(assert (=> b!741813 m!692737))

(assert (=> b!741813 m!692737))

(declare-fun m!692779 () Bool)

(assert (=> b!741813 m!692779))

(declare-fun m!692781 () Bool)

(assert (=> b!741810 m!692781))

(push 1)

(assert (not b!741802))

(assert (not b!741811))

(assert (not b!741810))

(assert (not b!741816))

(assert (not b!741805))

(assert (not b!741815))

(assert (not start!65314))

(assert (not b!741800))

(assert (not b!741807))

(assert (not b!741804))

(assert (not b!741808))

(assert (not b!741813))

(assert (not b!741814))

(assert (not b!741806))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

