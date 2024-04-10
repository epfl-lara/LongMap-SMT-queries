; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65316 () Bool)

(assert start!65316)

(declare-fun e!414642 () Bool)

(declare-datatypes ((array!41489 0))(
  ( (array!41490 (arr!19858 (Array (_ BitVec 32) (_ BitVec 64))) (size!20279 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41489)

(declare-datatypes ((SeekEntryResult!7458 0))(
  ( (MissingZero!7458 (index!32200 (_ BitVec 32))) (Found!7458 (index!32201 (_ BitVec 32))) (Intermediate!7458 (undefined!8270 Bool) (index!32202 (_ BitVec 32)) (x!63176 (_ BitVec 32))) (Undefined!7458) (MissingVacant!7458 (index!32203 (_ BitVec 32))) )
))
(declare-fun lt!329578 () SeekEntryResult!7458)

(declare-fun b!741851 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41489 (_ BitVec 32)) SeekEntryResult!7458)

(assert (=> b!741851 (= e!414642 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19858 a!3186) j!159) a!3186 mask!3328) lt!329578))))

(declare-fun b!741852 () Bool)

(declare-fun res!499120 () Bool)

(declare-fun e!414645 () Bool)

(assert (=> b!741852 (=> (not res!499120) (not e!414645))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41489 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741852 (= res!499120 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741853 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41489 (_ BitVec 32)) SeekEntryResult!7458)

(assert (=> b!741853 (= e!414642 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19858 a!3186) j!159) a!3186 mask!3328) (Found!7458 j!159)))))

(declare-fun b!741854 () Bool)

(declare-fun res!499117 () Bool)

(declare-fun e!414644 () Bool)

(assert (=> b!741854 (=> (not res!499117) (not e!414644))))

(assert (=> b!741854 (= res!499117 e!414642)))

(declare-fun c!81751 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741854 (= c!81751 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!499111 () Bool)

(assert (=> start!65316 (=> (not res!499111) (not e!414645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65316 (= res!499111 (validMask!0 mask!3328))))

(assert (=> start!65316 e!414645))

(assert (=> start!65316 true))

(declare-fun array_inv!15654 (array!41489) Bool)

(assert (=> start!65316 (array_inv!15654 a!3186)))

(declare-fun b!741855 () Bool)

(declare-fun res!499115 () Bool)

(declare-fun e!414643 () Bool)

(assert (=> b!741855 (=> (not res!499115) (not e!414643))))

(assert (=> b!741855 (= res!499115 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20279 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20279 a!3186))))))

(declare-fun b!741856 () Bool)

(declare-fun res!499112 () Bool)

(assert (=> b!741856 (=> (not res!499112) (not e!414644))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741856 (= res!499112 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19858 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741857 () Bool)

(declare-fun res!499116 () Bool)

(assert (=> b!741857 (=> (not res!499116) (not e!414645))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741857 (= res!499116 (validKeyInArray!0 (select (arr!19858 a!3186) j!159)))))

(declare-fun b!741858 () Bool)

(declare-fun res!499114 () Bool)

(assert (=> b!741858 (=> (not res!499114) (not e!414645))))

(assert (=> b!741858 (= res!499114 (validKeyInArray!0 k0!2102))))

(declare-fun e!414640 () Bool)

(declare-fun lt!329583 () SeekEntryResult!7458)

(declare-fun b!741859 () Bool)

(assert (=> b!741859 (= e!414640 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19858 a!3186) j!159) a!3186 mask!3328) lt!329583))))

(declare-fun b!741860 () Bool)

(declare-fun res!499110 () Bool)

(assert (=> b!741860 (=> (not res!499110) (not e!414643))))

(declare-datatypes ((List!13860 0))(
  ( (Nil!13857) (Cons!13856 (h!14928 (_ BitVec 64)) (t!20175 List!13860)) )
))
(declare-fun arrayNoDuplicates!0 (array!41489 (_ BitVec 32) List!13860) Bool)

(assert (=> b!741860 (= res!499110 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13857))))

(declare-fun b!741861 () Bool)

(declare-fun e!414646 () Bool)

(assert (=> b!741861 (= e!414644 e!414646)))

(declare-fun res!499121 () Bool)

(assert (=> b!741861 (=> (not res!499121) (not e!414646))))

(declare-fun lt!329585 () SeekEntryResult!7458)

(declare-fun lt!329581 () SeekEntryResult!7458)

(assert (=> b!741861 (= res!499121 (= lt!329585 lt!329581))))

(declare-fun lt!329584 () (_ BitVec 64))

(declare-fun lt!329582 () array!41489)

(assert (=> b!741861 (= lt!329581 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329584 lt!329582 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741861 (= lt!329585 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329584 mask!3328) lt!329584 lt!329582 mask!3328))))

(assert (=> b!741861 (= lt!329584 (select (store (arr!19858 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!741861 (= lt!329582 (array!41490 (store (arr!19858 a!3186) i!1173 k0!2102) (size!20279 a!3186)))))

(declare-fun b!741862 () Bool)

(assert (=> b!741862 (= e!414643 e!414644)))

(declare-fun res!499119 () Bool)

(assert (=> b!741862 (=> (not res!499119) (not e!414644))))

(assert (=> b!741862 (= res!499119 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19858 a!3186) j!159) mask!3328) (select (arr!19858 a!3186) j!159) a!3186 mask!3328) lt!329578))))

(assert (=> b!741862 (= lt!329578 (Intermediate!7458 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741863 () Bool)

(declare-fun res!499113 () Bool)

(assert (=> b!741863 (=> (not res!499113) (not e!414645))))

(assert (=> b!741863 (= res!499113 (and (= (size!20279 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20279 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20279 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741864 () Bool)

(declare-fun e!414641 () Bool)

(assert (=> b!741864 (= e!414641 e!414640)))

(declare-fun res!499118 () Bool)

(assert (=> b!741864 (=> (not res!499118) (not e!414640))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41489 (_ BitVec 32)) SeekEntryResult!7458)

(assert (=> b!741864 (= res!499118 (= (seekEntryOrOpen!0 (select (arr!19858 a!3186) j!159) a!3186 mask!3328) lt!329583))))

(assert (=> b!741864 (= lt!329583 (Found!7458 j!159))))

(declare-fun b!741865 () Bool)

(assert (=> b!741865 (= e!414645 e!414643)))

(declare-fun res!499123 () Bool)

(assert (=> b!741865 (=> (not res!499123) (not e!414643))))

(declare-fun lt!329579 () SeekEntryResult!7458)

(assert (=> b!741865 (= res!499123 (or (= lt!329579 (MissingZero!7458 i!1173)) (= lt!329579 (MissingVacant!7458 i!1173))))))

(assert (=> b!741865 (= lt!329579 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!741866 () Bool)

(declare-fun res!499122 () Bool)

(assert (=> b!741866 (=> (not res!499122) (not e!414643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41489 (_ BitVec 32)) Bool)

(assert (=> b!741866 (= res!499122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741867 () Bool)

(get-info :version)

(assert (=> b!741867 (= e!414646 (not (or (not ((_ is Intermediate!7458) lt!329581)) (not (= x!1131 (x!63176 lt!329581))) (not (= index!1321 (index!32202 lt!329581))) (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328)))))))

(assert (=> b!741867 e!414641))

(declare-fun res!499124 () Bool)

(assert (=> b!741867 (=> (not res!499124) (not e!414641))))

(assert (=> b!741867 (= res!499124 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25396 0))(
  ( (Unit!25397) )
))
(declare-fun lt!329580 () Unit!25396)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41489 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25396)

(assert (=> b!741867 (= lt!329580 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65316 res!499111) b!741863))

(assert (= (and b!741863 res!499113) b!741857))

(assert (= (and b!741857 res!499116) b!741858))

(assert (= (and b!741858 res!499114) b!741852))

(assert (= (and b!741852 res!499120) b!741865))

(assert (= (and b!741865 res!499123) b!741866))

(assert (= (and b!741866 res!499122) b!741860))

(assert (= (and b!741860 res!499110) b!741855))

(assert (= (and b!741855 res!499115) b!741862))

(assert (= (and b!741862 res!499119) b!741856))

(assert (= (and b!741856 res!499112) b!741854))

(assert (= (and b!741854 c!81751) b!741851))

(assert (= (and b!741854 (not c!81751)) b!741853))

(assert (= (and b!741854 res!499117) b!741861))

(assert (= (and b!741861 res!499121) b!741867))

(assert (= (and b!741867 res!499124) b!741864))

(assert (= (and b!741864 res!499118) b!741859))

(declare-fun m!692783 () Bool)

(assert (=> b!741861 m!692783))

(declare-fun m!692785 () Bool)

(assert (=> b!741861 m!692785))

(declare-fun m!692787 () Bool)

(assert (=> b!741861 m!692787))

(declare-fun m!692789 () Bool)

(assert (=> b!741861 m!692789))

(assert (=> b!741861 m!692783))

(declare-fun m!692791 () Bool)

(assert (=> b!741861 m!692791))

(declare-fun m!692793 () Bool)

(assert (=> b!741859 m!692793))

(assert (=> b!741859 m!692793))

(declare-fun m!692795 () Bool)

(assert (=> b!741859 m!692795))

(assert (=> b!741851 m!692793))

(assert (=> b!741851 m!692793))

(declare-fun m!692797 () Bool)

(assert (=> b!741851 m!692797))

(declare-fun m!692799 () Bool)

(assert (=> b!741852 m!692799))

(declare-fun m!692801 () Bool)

(assert (=> b!741867 m!692801))

(declare-fun m!692803 () Bool)

(assert (=> b!741867 m!692803))

(declare-fun m!692805 () Bool)

(assert (=> b!741865 m!692805))

(assert (=> b!741857 m!692793))

(assert (=> b!741857 m!692793))

(declare-fun m!692807 () Bool)

(assert (=> b!741857 m!692807))

(declare-fun m!692809 () Bool)

(assert (=> b!741856 m!692809))

(declare-fun m!692811 () Bool)

(assert (=> b!741860 m!692811))

(assert (=> b!741864 m!692793))

(assert (=> b!741864 m!692793))

(declare-fun m!692813 () Bool)

(assert (=> b!741864 m!692813))

(declare-fun m!692815 () Bool)

(assert (=> start!65316 m!692815))

(declare-fun m!692817 () Bool)

(assert (=> start!65316 m!692817))

(declare-fun m!692819 () Bool)

(assert (=> b!741866 m!692819))

(assert (=> b!741862 m!692793))

(assert (=> b!741862 m!692793))

(declare-fun m!692821 () Bool)

(assert (=> b!741862 m!692821))

(assert (=> b!741862 m!692821))

(assert (=> b!741862 m!692793))

(declare-fun m!692823 () Bool)

(assert (=> b!741862 m!692823))

(assert (=> b!741853 m!692793))

(assert (=> b!741853 m!692793))

(declare-fun m!692825 () Bool)

(assert (=> b!741853 m!692825))

(declare-fun m!692827 () Bool)

(assert (=> b!741858 m!692827))

(check-sat (not b!741859) (not b!741852) (not b!741851) (not b!741867) (not b!741858) (not b!741865) (not b!741857) (not b!741862) (not start!65316) (not b!741853) (not b!741866) (not b!741860) (not b!741864) (not b!741861))
(check-sat)
