; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65150 () Bool)

(assert start!65150)

(declare-fun b!736650 () Bool)

(declare-fun e!412059 () Bool)

(declare-fun e!412053 () Bool)

(assert (=> b!736650 (= e!412059 e!412053)))

(declare-fun res!495171 () Bool)

(assert (=> b!736650 (=> (not res!495171) (not e!412053))))

(declare-datatypes ((array!41340 0))(
  ( (array!41341 (arr!19784 (Array (_ BitVec 32) (_ BitVec 64))) (size!20205 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41340)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7381 0))(
  ( (MissingZero!7381 (index!31892 (_ BitVec 32))) (Found!7381 (index!31893 (_ BitVec 32))) (Intermediate!7381 (undefined!8193 Bool) (index!31894 (_ BitVec 32)) (x!62902 (_ BitVec 32))) (Undefined!7381) (MissingVacant!7381 (index!31895 (_ BitVec 32))) )
))
(declare-fun lt!326630 () SeekEntryResult!7381)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41340 (_ BitVec 32)) SeekEntryResult!7381)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736650 (= res!495171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19784 a!3186) j!159) mask!3328) (select (arr!19784 a!3186) j!159) a!3186 mask!3328) lt!326630))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!736650 (= lt!326630 (Intermediate!7381 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736651 () Bool)

(declare-fun res!495172 () Bool)

(declare-fun e!412058 () Bool)

(assert (=> b!736651 (=> (not res!495172) (not e!412058))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736651 (= res!495172 (validKeyInArray!0 k0!2102))))

(declare-fun b!736652 () Bool)

(declare-fun res!495168 () Bool)

(assert (=> b!736652 (=> (not res!495168) (not e!412053))))

(declare-fun e!412049 () Bool)

(assert (=> b!736652 (= res!495168 e!412049)))

(declare-fun c!81126 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!736652 (= c!81126 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!736653 () Bool)

(declare-fun res!495176 () Bool)

(declare-fun e!412056 () Bool)

(assert (=> b!736653 (=> res!495176 e!412056)))

(declare-fun e!412050 () Bool)

(assert (=> b!736653 (= res!495176 e!412050)))

(declare-fun c!81125 () Bool)

(declare-fun lt!326634 () Bool)

(assert (=> b!736653 (= c!81125 lt!326634)))

(declare-fun lt!326635 () SeekEntryResult!7381)

(declare-fun b!736654 () Bool)

(declare-fun lt!326628 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41340 (_ BitVec 32)) SeekEntryResult!7381)

(assert (=> b!736654 (= e!412050 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326628 resIntermediateIndex!5 (select (arr!19784 a!3186) j!159) a!3186 mask!3328) lt!326635)))))

(declare-fun b!736655 () Bool)

(declare-fun e!412057 () Bool)

(declare-fun e!412060 () Bool)

(assert (=> b!736655 (= e!412057 (not e!412060))))

(declare-fun res!495165 () Bool)

(assert (=> b!736655 (=> res!495165 e!412060)))

(declare-fun lt!326629 () SeekEntryResult!7381)

(get-info :version)

(assert (=> b!736655 (= res!495165 (or (not ((_ is Intermediate!7381) lt!326629)) (bvsge x!1131 (x!62902 lt!326629))))))

(assert (=> b!736655 (= lt!326635 (Found!7381 j!159))))

(declare-fun e!412051 () Bool)

(assert (=> b!736655 e!412051))

(declare-fun res!495178 () Bool)

(assert (=> b!736655 (=> (not res!495178) (not e!412051))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41340 (_ BitVec 32)) Bool)

(assert (=> b!736655 (= res!495178 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25100 0))(
  ( (Unit!25101) )
))
(declare-fun lt!326639 () Unit!25100)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41340 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25100)

(assert (=> b!736655 (= lt!326639 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!495169 () Bool)

(assert (=> start!65150 (=> (not res!495169) (not e!412058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65150 (= res!495169 (validMask!0 mask!3328))))

(assert (=> start!65150 e!412058))

(assert (=> start!65150 true))

(declare-fun array_inv!15667 (array!41340) Bool)

(assert (=> start!65150 (array_inv!15667 a!3186)))

(declare-fun b!736656 () Bool)

(assert (=> b!736656 (= e!412050 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326628 (select (arr!19784 a!3186) j!159) a!3186 mask!3328) lt!326630)))))

(declare-fun b!736657 () Bool)

(assert (=> b!736657 (= e!412056 true)))

(declare-fun lt!326637 () (_ BitVec 64))

(declare-fun lt!326626 () array!41340)

(declare-fun lt!326633 () SeekEntryResult!7381)

(assert (=> b!736657 (= lt!326633 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326628 lt!326637 lt!326626 mask!3328))))

(declare-fun b!736658 () Bool)

(declare-fun e!412054 () Bool)

(declare-fun lt!326638 () SeekEntryResult!7381)

(assert (=> b!736658 (= e!412054 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19784 a!3186) j!159) a!3186 mask!3328) lt!326638))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!736659 () Bool)

(assert (=> b!736659 (= e!412049 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19784 a!3186) j!159) a!3186 mask!3328) lt!326630))))

(declare-fun b!736660 () Bool)

(declare-fun res!495164 () Bool)

(assert (=> b!736660 (=> (not res!495164) (not e!412058))))

(declare-fun arrayContainsKey!0 (array!41340 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736660 (= res!495164 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!736661 () Bool)

(assert (=> b!736661 (= e!412049 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19784 a!3186) j!159) a!3186 mask!3328) (Found!7381 j!159)))))

(declare-fun b!736662 () Bool)

(assert (=> b!736662 (= e!412053 e!412057)))

(declare-fun res!495166 () Bool)

(assert (=> b!736662 (=> (not res!495166) (not e!412057))))

(declare-fun lt!326627 () SeekEntryResult!7381)

(assert (=> b!736662 (= res!495166 (= lt!326627 lt!326629))))

(assert (=> b!736662 (= lt!326629 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326637 lt!326626 mask!3328))))

(assert (=> b!736662 (= lt!326627 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326637 mask!3328) lt!326637 lt!326626 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!736662 (= lt!326637 (select (store (arr!19784 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!736662 (= lt!326626 (array!41341 (store (arr!19784 a!3186) i!1173 k0!2102) (size!20205 a!3186)))))

(declare-fun b!736663 () Bool)

(declare-fun res!495167 () Bool)

(assert (=> b!736663 (=> (not res!495167) (not e!412058))))

(assert (=> b!736663 (= res!495167 (validKeyInArray!0 (select (arr!19784 a!3186) j!159)))))

(declare-fun b!736664 () Bool)

(assert (=> b!736664 (= e!412051 e!412054)))

(declare-fun res!495179 () Bool)

(assert (=> b!736664 (=> (not res!495179) (not e!412054))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41340 (_ BitVec 32)) SeekEntryResult!7381)

(assert (=> b!736664 (= res!495179 (= (seekEntryOrOpen!0 (select (arr!19784 a!3186) j!159) a!3186 mask!3328) lt!326638))))

(assert (=> b!736664 (= lt!326638 (Found!7381 j!159))))

(declare-fun b!736665 () Bool)

(declare-fun res!495174 () Bool)

(assert (=> b!736665 (=> (not res!495174) (not e!412053))))

(assert (=> b!736665 (= res!495174 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19784 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736666 () Bool)

(declare-fun e!412052 () Unit!25100)

(declare-fun Unit!25102 () Unit!25100)

(assert (=> b!736666 (= e!412052 Unit!25102)))

(declare-fun lt!326631 () SeekEntryResult!7381)

(assert (=> b!736666 (= lt!326631 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19784 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!736666 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326628 resIntermediateIndex!5 (select (arr!19784 a!3186) j!159) a!3186 mask!3328) lt!326635)))

(declare-fun b!736667 () Bool)

(declare-fun res!495180 () Bool)

(assert (=> b!736667 (=> (not res!495180) (not e!412059))))

(declare-datatypes ((List!13825 0))(
  ( (Nil!13822) (Cons!13821 (h!14893 (_ BitVec 64)) (t!20131 List!13825)) )
))
(declare-fun arrayNoDuplicates!0 (array!41340 (_ BitVec 32) List!13825) Bool)

(assert (=> b!736667 (= res!495180 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13822))))

(declare-fun b!736668 () Bool)

(declare-fun Unit!25103 () Unit!25100)

(assert (=> b!736668 (= e!412052 Unit!25103)))

(assert (=> b!736668 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326628 (select (arr!19784 a!3186) j!159) a!3186 mask!3328) lt!326630)))

(declare-fun b!736669 () Bool)

(assert (=> b!736669 (= e!412060 e!412056)))

(declare-fun res!495170 () Bool)

(assert (=> b!736669 (=> res!495170 e!412056)))

(assert (=> b!736669 (= res!495170 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326628 #b00000000000000000000000000000000) (bvsge lt!326628 (size!20205 a!3186))))))

(declare-fun lt!326632 () Unit!25100)

(assert (=> b!736669 (= lt!326632 e!412052)))

(declare-fun c!81124 () Bool)

(assert (=> b!736669 (= c!81124 lt!326634)))

(assert (=> b!736669 (= lt!326634 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736669 (= lt!326628 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!736670 () Bool)

(declare-fun res!495177 () Bool)

(assert (=> b!736670 (=> (not res!495177) (not e!412058))))

(assert (=> b!736670 (= res!495177 (and (= (size!20205 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20205 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20205 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736671 () Bool)

(declare-fun res!495175 () Bool)

(assert (=> b!736671 (=> (not res!495175) (not e!412059))))

(assert (=> b!736671 (= res!495175 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20205 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20205 a!3186))))))

(declare-fun b!736672 () Bool)

(assert (=> b!736672 (= e!412058 e!412059)))

(declare-fun res!495163 () Bool)

(assert (=> b!736672 (=> (not res!495163) (not e!412059))))

(declare-fun lt!326636 () SeekEntryResult!7381)

(assert (=> b!736672 (= res!495163 (or (= lt!326636 (MissingZero!7381 i!1173)) (= lt!326636 (MissingVacant!7381 i!1173))))))

(assert (=> b!736672 (= lt!326636 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!736673 () Bool)

(declare-fun res!495173 () Bool)

(assert (=> b!736673 (=> (not res!495173) (not e!412059))))

(assert (=> b!736673 (= res!495173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!65150 res!495169) b!736670))

(assert (= (and b!736670 res!495177) b!736663))

(assert (= (and b!736663 res!495167) b!736651))

(assert (= (and b!736651 res!495172) b!736660))

(assert (= (and b!736660 res!495164) b!736672))

(assert (= (and b!736672 res!495163) b!736673))

(assert (= (and b!736673 res!495173) b!736667))

(assert (= (and b!736667 res!495180) b!736671))

(assert (= (and b!736671 res!495175) b!736650))

(assert (= (and b!736650 res!495171) b!736665))

(assert (= (and b!736665 res!495174) b!736652))

(assert (= (and b!736652 c!81126) b!736659))

(assert (= (and b!736652 (not c!81126)) b!736661))

(assert (= (and b!736652 res!495168) b!736662))

(assert (= (and b!736662 res!495166) b!736655))

(assert (= (and b!736655 res!495178) b!736664))

(assert (= (and b!736664 res!495179) b!736658))

(assert (= (and b!736655 (not res!495165)) b!736669))

(assert (= (and b!736669 c!81124) b!736668))

(assert (= (and b!736669 (not c!81124)) b!736666))

(assert (= (and b!736669 (not res!495170)) b!736653))

(assert (= (and b!736653 c!81125) b!736656))

(assert (= (and b!736653 (not c!81125)) b!736654))

(assert (= (and b!736653 (not res!495176)) b!736657))

(declare-fun m!688157 () Bool)

(assert (=> b!736656 m!688157))

(assert (=> b!736656 m!688157))

(declare-fun m!688159 () Bool)

(assert (=> b!736656 m!688159))

(assert (=> b!736663 m!688157))

(assert (=> b!736663 m!688157))

(declare-fun m!688161 () Bool)

(assert (=> b!736663 m!688161))

(declare-fun m!688163 () Bool)

(assert (=> b!736651 m!688163))

(declare-fun m!688165 () Bool)

(assert (=> b!736655 m!688165))

(declare-fun m!688167 () Bool)

(assert (=> b!736655 m!688167))

(declare-fun m!688169 () Bool)

(assert (=> start!65150 m!688169))

(declare-fun m!688171 () Bool)

(assert (=> start!65150 m!688171))

(assert (=> b!736664 m!688157))

(assert (=> b!736664 m!688157))

(declare-fun m!688173 () Bool)

(assert (=> b!736664 m!688173))

(declare-fun m!688175 () Bool)

(assert (=> b!736672 m!688175))

(assert (=> b!736658 m!688157))

(assert (=> b!736658 m!688157))

(declare-fun m!688177 () Bool)

(assert (=> b!736658 m!688177))

(assert (=> b!736659 m!688157))

(assert (=> b!736659 m!688157))

(declare-fun m!688179 () Bool)

(assert (=> b!736659 m!688179))

(declare-fun m!688181 () Bool)

(assert (=> b!736673 m!688181))

(declare-fun m!688183 () Bool)

(assert (=> b!736665 m!688183))

(assert (=> b!736661 m!688157))

(assert (=> b!736661 m!688157))

(declare-fun m!688185 () Bool)

(assert (=> b!736661 m!688185))

(assert (=> b!736668 m!688157))

(assert (=> b!736668 m!688157))

(assert (=> b!736668 m!688159))

(declare-fun m!688187 () Bool)

(assert (=> b!736657 m!688187))

(declare-fun m!688189 () Bool)

(assert (=> b!736660 m!688189))

(declare-fun m!688191 () Bool)

(assert (=> b!736669 m!688191))

(assert (=> b!736650 m!688157))

(assert (=> b!736650 m!688157))

(declare-fun m!688193 () Bool)

(assert (=> b!736650 m!688193))

(assert (=> b!736650 m!688193))

(assert (=> b!736650 m!688157))

(declare-fun m!688195 () Bool)

(assert (=> b!736650 m!688195))

(assert (=> b!736666 m!688157))

(assert (=> b!736666 m!688157))

(assert (=> b!736666 m!688185))

(assert (=> b!736666 m!688157))

(declare-fun m!688197 () Bool)

(assert (=> b!736666 m!688197))

(declare-fun m!688199 () Bool)

(assert (=> b!736667 m!688199))

(declare-fun m!688201 () Bool)

(assert (=> b!736662 m!688201))

(declare-fun m!688203 () Bool)

(assert (=> b!736662 m!688203))

(declare-fun m!688205 () Bool)

(assert (=> b!736662 m!688205))

(declare-fun m!688207 () Bool)

(assert (=> b!736662 m!688207))

(declare-fun m!688209 () Bool)

(assert (=> b!736662 m!688209))

(assert (=> b!736662 m!688201))

(assert (=> b!736654 m!688157))

(assert (=> b!736654 m!688157))

(assert (=> b!736654 m!688197))

(check-sat (not b!736663) (not b!736667) (not b!736659) (not b!736669) (not b!736654) (not b!736655) (not b!736660) (not start!65150) (not b!736672) (not b!736666) (not b!736661) (not b!736651) (not b!736664) (not b!736657) (not b!736673) (not b!736662) (not b!736650) (not b!736658) (not b!736656) (not b!736668))
(check-sat)
