; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64652 () Bool)

(assert start!64652)

(declare-fun b!728652 () Bool)

(declare-fun res!489259 () Bool)

(declare-fun e!407842 () Bool)

(assert (=> b!728652 (=> (not res!489259) (not e!407842))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41118 0))(
  ( (array!41119 (arr!19679 (Array (_ BitVec 32) (_ BitVec 64))) (size!20100 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41118)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!728652 (= res!489259 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20100 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20100 a!3186))))))

(declare-fun b!728653 () Bool)

(declare-fun e!407843 () Bool)

(assert (=> b!728653 (= e!407842 e!407843)))

(declare-fun res!489255 () Bool)

(assert (=> b!728653 (=> (not res!489255) (not e!407843))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7276 0))(
  ( (MissingZero!7276 (index!31472 (_ BitVec 32))) (Found!7276 (index!31473 (_ BitVec 32))) (Intermediate!7276 (undefined!8088 Bool) (index!31474 (_ BitVec 32)) (x!62469 (_ BitVec 32))) (Undefined!7276) (MissingVacant!7276 (index!31475 (_ BitVec 32))) )
))
(declare-fun lt!322655 () SeekEntryResult!7276)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41118 (_ BitVec 32)) SeekEntryResult!7276)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728653 (= res!489255 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19679 a!3186) j!159) mask!3328) (select (arr!19679 a!3186) j!159) a!3186 mask!3328) lt!322655))))

(assert (=> b!728653 (= lt!322655 (Intermediate!7276 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!728654 () Bool)

(declare-fun res!489267 () Bool)

(assert (=> b!728654 (=> (not res!489267) (not e!407843))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!728654 (= res!489267 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19679 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!407847 () Bool)

(declare-fun b!728655 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41118 (_ BitVec 32)) SeekEntryResult!7276)

(assert (=> b!728655 (= e!407847 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19679 a!3186) j!159) a!3186 mask!3328) (Found!7276 j!159)))))

(declare-fun b!728656 () Bool)

(declare-fun e!407840 () Bool)

(assert (=> b!728656 (= e!407840 true)))

(declare-fun lt!322660 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!728656 (= lt!322660 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!728657 () Bool)

(declare-fun res!489261 () Bool)

(declare-fun e!407848 () Bool)

(assert (=> b!728657 (=> (not res!489261) (not e!407848))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!728657 (= res!489261 (validKeyInArray!0 k0!2102))))

(declare-fun res!489264 () Bool)

(assert (=> start!64652 (=> (not res!489264) (not e!407848))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64652 (= res!489264 (validMask!0 mask!3328))))

(assert (=> start!64652 e!407848))

(assert (=> start!64652 true))

(declare-fun array_inv!15562 (array!41118) Bool)

(assert (=> start!64652 (array_inv!15562 a!3186)))

(declare-fun e!407845 () Bool)

(declare-fun lt!322657 () SeekEntryResult!7276)

(declare-fun b!728658 () Bool)

(assert (=> b!728658 (= e!407845 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19679 a!3186) j!159) a!3186 mask!3328) lt!322657))))

(declare-fun b!728659 () Bool)

(declare-fun res!489266 () Bool)

(assert (=> b!728659 (=> (not res!489266) (not e!407843))))

(assert (=> b!728659 (= res!489266 e!407847)))

(declare-fun c!80073 () Bool)

(assert (=> b!728659 (= c!80073 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!728660 () Bool)

(declare-fun res!489265 () Bool)

(assert (=> b!728660 (=> (not res!489265) (not e!407842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41118 (_ BitVec 32)) Bool)

(assert (=> b!728660 (= res!489265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!728661 () Bool)

(declare-fun e!407841 () Bool)

(assert (=> b!728661 (= e!407841 (not e!407840))))

(declare-fun res!489257 () Bool)

(assert (=> b!728661 (=> res!489257 e!407840)))

(declare-fun lt!322656 () SeekEntryResult!7276)

(get-info :version)

(assert (=> b!728661 (= res!489257 (or (not ((_ is Intermediate!7276) lt!322656)) (bvsge x!1131 (x!62469 lt!322656))))))

(declare-fun e!407844 () Bool)

(assert (=> b!728661 e!407844))

(declare-fun res!489258 () Bool)

(assert (=> b!728661 (=> (not res!489258) (not e!407844))))

(assert (=> b!728661 (= res!489258 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24842 0))(
  ( (Unit!24843) )
))
(declare-fun lt!322659 () Unit!24842)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41118 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24842)

(assert (=> b!728661 (= lt!322659 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!728662 () Bool)

(assert (=> b!728662 (= e!407844 e!407845)))

(declare-fun res!489262 () Bool)

(assert (=> b!728662 (=> (not res!489262) (not e!407845))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41118 (_ BitVec 32)) SeekEntryResult!7276)

(assert (=> b!728662 (= res!489262 (= (seekEntryOrOpen!0 (select (arr!19679 a!3186) j!159) a!3186 mask!3328) lt!322657))))

(assert (=> b!728662 (= lt!322657 (Found!7276 j!159))))

(declare-fun b!728663 () Bool)

(declare-fun res!489263 () Bool)

(assert (=> b!728663 (=> (not res!489263) (not e!407848))))

(declare-fun arrayContainsKey!0 (array!41118 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!728663 (= res!489263 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!728664 () Bool)

(assert (=> b!728664 (= e!407848 e!407842)))

(declare-fun res!489269 () Bool)

(assert (=> b!728664 (=> (not res!489269) (not e!407842))))

(declare-fun lt!322653 () SeekEntryResult!7276)

(assert (=> b!728664 (= res!489269 (or (= lt!322653 (MissingZero!7276 i!1173)) (= lt!322653 (MissingVacant!7276 i!1173))))))

(assert (=> b!728664 (= lt!322653 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!728665 () Bool)

(assert (=> b!728665 (= e!407847 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19679 a!3186) j!159) a!3186 mask!3328) lt!322655))))

(declare-fun b!728666 () Bool)

(declare-fun res!489256 () Bool)

(assert (=> b!728666 (=> (not res!489256) (not e!407848))))

(assert (=> b!728666 (= res!489256 (validKeyInArray!0 (select (arr!19679 a!3186) j!159)))))

(declare-fun b!728667 () Bool)

(assert (=> b!728667 (= e!407843 e!407841)))

(declare-fun res!489260 () Bool)

(assert (=> b!728667 (=> (not res!489260) (not e!407841))))

(declare-fun lt!322661 () SeekEntryResult!7276)

(assert (=> b!728667 (= res!489260 (= lt!322661 lt!322656))))

(declare-fun lt!322658 () array!41118)

(declare-fun lt!322654 () (_ BitVec 64))

(assert (=> b!728667 (= lt!322656 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322654 lt!322658 mask!3328))))

(assert (=> b!728667 (= lt!322661 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322654 mask!3328) lt!322654 lt!322658 mask!3328))))

(assert (=> b!728667 (= lt!322654 (select (store (arr!19679 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!728667 (= lt!322658 (array!41119 (store (arr!19679 a!3186) i!1173 k0!2102) (size!20100 a!3186)))))

(declare-fun b!728668 () Bool)

(declare-fun res!489268 () Bool)

(assert (=> b!728668 (=> (not res!489268) (not e!407842))))

(declare-datatypes ((List!13720 0))(
  ( (Nil!13717) (Cons!13716 (h!14776 (_ BitVec 64)) (t!20026 List!13720)) )
))
(declare-fun arrayNoDuplicates!0 (array!41118 (_ BitVec 32) List!13720) Bool)

(assert (=> b!728668 (= res!489268 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13717))))

(declare-fun b!728669 () Bool)

(declare-fun res!489270 () Bool)

(assert (=> b!728669 (=> (not res!489270) (not e!407848))))

(assert (=> b!728669 (= res!489270 (and (= (size!20100 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20100 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20100 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64652 res!489264) b!728669))

(assert (= (and b!728669 res!489270) b!728666))

(assert (= (and b!728666 res!489256) b!728657))

(assert (= (and b!728657 res!489261) b!728663))

(assert (= (and b!728663 res!489263) b!728664))

(assert (= (and b!728664 res!489269) b!728660))

(assert (= (and b!728660 res!489265) b!728668))

(assert (= (and b!728668 res!489268) b!728652))

(assert (= (and b!728652 res!489259) b!728653))

(assert (= (and b!728653 res!489255) b!728654))

(assert (= (and b!728654 res!489267) b!728659))

(assert (= (and b!728659 c!80073) b!728665))

(assert (= (and b!728659 (not c!80073)) b!728655))

(assert (= (and b!728659 res!489266) b!728667))

(assert (= (and b!728667 res!489260) b!728661))

(assert (= (and b!728661 res!489258) b!728662))

(assert (= (and b!728662 res!489262) b!728658))

(assert (= (and b!728661 (not res!489257)) b!728656))

(declare-fun m!681845 () Bool)

(assert (=> b!728661 m!681845))

(declare-fun m!681847 () Bool)

(assert (=> b!728661 m!681847))

(declare-fun m!681849 () Bool)

(assert (=> b!728668 m!681849))

(declare-fun m!681851 () Bool)

(assert (=> b!728667 m!681851))

(declare-fun m!681853 () Bool)

(assert (=> b!728667 m!681853))

(declare-fun m!681855 () Bool)

(assert (=> b!728667 m!681855))

(declare-fun m!681857 () Bool)

(assert (=> b!728667 m!681857))

(declare-fun m!681859 () Bool)

(assert (=> b!728667 m!681859))

(assert (=> b!728667 m!681857))

(declare-fun m!681861 () Bool)

(assert (=> b!728654 m!681861))

(declare-fun m!681863 () Bool)

(assert (=> b!728657 m!681863))

(declare-fun m!681865 () Bool)

(assert (=> b!728660 m!681865))

(declare-fun m!681867 () Bool)

(assert (=> b!728663 m!681867))

(declare-fun m!681869 () Bool)

(assert (=> start!64652 m!681869))

(declare-fun m!681871 () Bool)

(assert (=> start!64652 m!681871))

(declare-fun m!681873 () Bool)

(assert (=> b!728658 m!681873))

(assert (=> b!728658 m!681873))

(declare-fun m!681875 () Bool)

(assert (=> b!728658 m!681875))

(assert (=> b!728665 m!681873))

(assert (=> b!728665 m!681873))

(declare-fun m!681877 () Bool)

(assert (=> b!728665 m!681877))

(declare-fun m!681879 () Bool)

(assert (=> b!728656 m!681879))

(assert (=> b!728653 m!681873))

(assert (=> b!728653 m!681873))

(declare-fun m!681881 () Bool)

(assert (=> b!728653 m!681881))

(assert (=> b!728653 m!681881))

(assert (=> b!728653 m!681873))

(declare-fun m!681883 () Bool)

(assert (=> b!728653 m!681883))

(assert (=> b!728666 m!681873))

(assert (=> b!728666 m!681873))

(declare-fun m!681885 () Bool)

(assert (=> b!728666 m!681885))

(declare-fun m!681887 () Bool)

(assert (=> b!728664 m!681887))

(assert (=> b!728655 m!681873))

(assert (=> b!728655 m!681873))

(declare-fun m!681889 () Bool)

(assert (=> b!728655 m!681889))

(assert (=> b!728662 m!681873))

(assert (=> b!728662 m!681873))

(declare-fun m!681891 () Bool)

(assert (=> b!728662 m!681891))

(check-sat (not b!728658) (not start!64652) (not b!728661) (not b!728655) (not b!728660) (not b!728668) (not b!728656) (not b!728662) (not b!728666) (not b!728667) (not b!728663) (not b!728665) (not b!728657) (not b!728664) (not b!728653))
(check-sat)
