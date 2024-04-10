; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65358 () Bool)

(assert start!65358)

(declare-fun b!743000 () Bool)

(declare-fun e!415188 () Bool)

(assert (=> b!743000 (= e!415188 true)))

(declare-datatypes ((array!41531 0))(
  ( (array!41532 (arr!19879 (Array (_ BitVec 32) (_ BitVec 64))) (size!20300 (_ BitVec 32))) )
))
(declare-fun lt!330073 () array!41531)

(declare-datatypes ((SeekEntryResult!7479 0))(
  ( (MissingZero!7479 (index!32284 (_ BitVec 32))) (Found!7479 (index!32285 (_ BitVec 32))) (Intermediate!7479 (undefined!8291 Bool) (index!32286 (_ BitVec 32)) (x!63253 (_ BitVec 32))) (Undefined!7479) (MissingVacant!7479 (index!32287 (_ BitVec 32))) )
))
(declare-fun lt!330076 () SeekEntryResult!7479)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!330070 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41531 (_ BitVec 32)) SeekEntryResult!7479)

(assert (=> b!743000 (= lt!330076 (seekEntryOrOpen!0 lt!330070 lt!330073 mask!3328))))

(declare-fun b!743001 () Bool)

(declare-fun res!500147 () Bool)

(declare-fun e!415186 () Bool)

(assert (=> b!743001 (=> (not res!500147) (not e!415186))))

(declare-fun e!415190 () Bool)

(assert (=> b!743001 (= res!500147 e!415190)))

(declare-fun c!81814 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!743001 (= c!81814 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743002 () Bool)

(declare-fun e!415192 () Bool)

(declare-fun e!415187 () Bool)

(assert (=> b!743002 (= e!415192 e!415187)))

(declare-fun res!500140 () Bool)

(assert (=> b!743002 (=> (not res!500140) (not e!415187))))

(declare-fun lt!330075 () SeekEntryResult!7479)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!743002 (= res!500140 (or (= lt!330075 (MissingZero!7479 i!1173)) (= lt!330075 (MissingVacant!7479 i!1173))))))

(declare-fun a!3186 () array!41531)

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!743002 (= lt!330075 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!743003 () Bool)

(declare-fun e!415189 () Bool)

(assert (=> b!743003 (= e!415186 e!415189)))

(declare-fun res!500138 () Bool)

(assert (=> b!743003 (=> (not res!500138) (not e!415189))))

(declare-fun lt!330074 () SeekEntryResult!7479)

(declare-fun lt!330077 () SeekEntryResult!7479)

(assert (=> b!743003 (= res!500138 (= lt!330074 lt!330077))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41531 (_ BitVec 32)) SeekEntryResult!7479)

(assert (=> b!743003 (= lt!330077 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330070 lt!330073 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743003 (= lt!330074 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330070 mask!3328) lt!330070 lt!330073 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!743003 (= lt!330070 (select (store (arr!19879 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!743003 (= lt!330073 (array!41532 (store (arr!19879 a!3186) i!1173 k0!2102) (size!20300 a!3186)))))

(declare-fun b!743004 () Bool)

(declare-fun e!415185 () Bool)

(declare-fun e!415191 () Bool)

(assert (=> b!743004 (= e!415185 e!415191)))

(declare-fun res!500149 () Bool)

(assert (=> b!743004 (=> (not res!500149) (not e!415191))))

(declare-fun lt!330072 () SeekEntryResult!7479)

(assert (=> b!743004 (= res!500149 (= (seekEntryOrOpen!0 (select (arr!19879 a!3186) j!159) a!3186 mask!3328) lt!330072))))

(assert (=> b!743004 (= lt!330072 (Found!7479 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!743005 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41531 (_ BitVec 32)) SeekEntryResult!7479)

(assert (=> b!743005 (= e!415191 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19879 a!3186) j!159) a!3186 mask!3328) lt!330072))))

(declare-fun b!743006 () Bool)

(declare-fun res!500136 () Bool)

(assert (=> b!743006 (=> (not res!500136) (not e!415187))))

(declare-datatypes ((List!13881 0))(
  ( (Nil!13878) (Cons!13877 (h!14949 (_ BitVec 64)) (t!20196 List!13881)) )
))
(declare-fun arrayNoDuplicates!0 (array!41531 (_ BitVec 32) List!13881) Bool)

(assert (=> b!743006 (= res!500136 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13878))))

(declare-fun b!743008 () Bool)

(declare-fun res!500137 () Bool)

(assert (=> b!743008 (=> (not res!500137) (not e!415186))))

(assert (=> b!743008 (= res!500137 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19879 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743009 () Bool)

(declare-fun res!500141 () Bool)

(assert (=> b!743009 (=> (not res!500141) (not e!415192))))

(assert (=> b!743009 (= res!500141 (and (= (size!20300 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20300 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20300 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743010 () Bool)

(declare-fun lt!330069 () SeekEntryResult!7479)

(assert (=> b!743010 (= e!415190 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19879 a!3186) j!159) a!3186 mask!3328) lt!330069))))

(declare-fun b!743011 () Bool)

(declare-fun res!500146 () Bool)

(assert (=> b!743011 (=> (not res!500146) (not e!415192))))

(declare-fun arrayContainsKey!0 (array!41531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743011 (= res!500146 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743012 () Bool)

(declare-fun res!500145 () Bool)

(assert (=> b!743012 (=> res!500145 e!415188)))

(assert (=> b!743012 (= res!500145 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19879 a!3186) j!159) a!3186 mask!3328) (Found!7479 j!159))))))

(declare-fun b!743013 () Bool)

(declare-fun res!500142 () Bool)

(assert (=> b!743013 (=> (not res!500142) (not e!415192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743013 (= res!500142 (validKeyInArray!0 (select (arr!19879 a!3186) j!159)))))

(declare-fun b!743014 () Bool)

(declare-fun res!500134 () Bool)

(assert (=> b!743014 (=> (not res!500134) (not e!415187))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41531 (_ BitVec 32)) Bool)

(assert (=> b!743014 (= res!500134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743015 () Bool)

(assert (=> b!743015 (= e!415187 e!415186)))

(declare-fun res!500148 () Bool)

(assert (=> b!743015 (=> (not res!500148) (not e!415186))))

(assert (=> b!743015 (= res!500148 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19879 a!3186) j!159) mask!3328) (select (arr!19879 a!3186) j!159) a!3186 mask!3328) lt!330069))))

(assert (=> b!743015 (= lt!330069 (Intermediate!7479 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743007 () Bool)

(assert (=> b!743007 (= e!415190 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19879 a!3186) j!159) a!3186 mask!3328) (Found!7479 j!159)))))

(declare-fun res!500135 () Bool)

(assert (=> start!65358 (=> (not res!500135) (not e!415192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65358 (= res!500135 (validMask!0 mask!3328))))

(assert (=> start!65358 e!415192))

(assert (=> start!65358 true))

(declare-fun array_inv!15675 (array!41531) Bool)

(assert (=> start!65358 (array_inv!15675 a!3186)))

(declare-fun b!743016 () Bool)

(declare-fun res!500133 () Bool)

(assert (=> b!743016 (=> res!500133 e!415188)))

(assert (=> b!743016 (= res!500133 (or (not (= (select (store (arr!19879 a!3186) i!1173 k0!2102) index!1321) lt!330070)) (undefined!8291 lt!330077)))))

(declare-fun b!743017 () Bool)

(declare-fun res!500144 () Bool)

(assert (=> b!743017 (=> (not res!500144) (not e!415192))))

(assert (=> b!743017 (= res!500144 (validKeyInArray!0 k0!2102))))

(declare-fun b!743018 () Bool)

(assert (=> b!743018 (= e!415189 (not e!415188))))

(declare-fun res!500150 () Bool)

(assert (=> b!743018 (=> res!500150 e!415188)))

(get-info :version)

(assert (=> b!743018 (= res!500150 (or (not ((_ is Intermediate!7479) lt!330077)) (bvslt x!1131 (x!63253 lt!330077)) (not (= x!1131 (x!63253 lt!330077))) (not (= index!1321 (index!32286 lt!330077)))))))

(assert (=> b!743018 e!415185))

(declare-fun res!500139 () Bool)

(assert (=> b!743018 (=> (not res!500139) (not e!415185))))

(assert (=> b!743018 (= res!500139 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25438 0))(
  ( (Unit!25439) )
))
(declare-fun lt!330071 () Unit!25438)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41531 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25438)

(assert (=> b!743018 (= lt!330071 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743019 () Bool)

(declare-fun res!500143 () Bool)

(assert (=> b!743019 (=> (not res!500143) (not e!415187))))

(assert (=> b!743019 (= res!500143 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20300 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20300 a!3186))))))

(assert (= (and start!65358 res!500135) b!743009))

(assert (= (and b!743009 res!500141) b!743013))

(assert (= (and b!743013 res!500142) b!743017))

(assert (= (and b!743017 res!500144) b!743011))

(assert (= (and b!743011 res!500146) b!743002))

(assert (= (and b!743002 res!500140) b!743014))

(assert (= (and b!743014 res!500134) b!743006))

(assert (= (and b!743006 res!500136) b!743019))

(assert (= (and b!743019 res!500143) b!743015))

(assert (= (and b!743015 res!500148) b!743008))

(assert (= (and b!743008 res!500137) b!743001))

(assert (= (and b!743001 c!81814) b!743010))

(assert (= (and b!743001 (not c!81814)) b!743007))

(assert (= (and b!743001 res!500147) b!743003))

(assert (= (and b!743003 res!500138) b!743018))

(assert (= (and b!743018 res!500139) b!743004))

(assert (= (and b!743004 res!500149) b!743005))

(assert (= (and b!743018 (not res!500150)) b!743012))

(assert (= (and b!743012 (not res!500145)) b!743016))

(assert (= (and b!743016 (not res!500133)) b!743000))

(declare-fun m!693771 () Bool)

(assert (=> b!743018 m!693771))

(declare-fun m!693773 () Bool)

(assert (=> b!743018 m!693773))

(declare-fun m!693775 () Bool)

(assert (=> b!743017 m!693775))

(declare-fun m!693777 () Bool)

(assert (=> b!743015 m!693777))

(assert (=> b!743015 m!693777))

(declare-fun m!693779 () Bool)

(assert (=> b!743015 m!693779))

(assert (=> b!743015 m!693779))

(assert (=> b!743015 m!693777))

(declare-fun m!693781 () Bool)

(assert (=> b!743015 m!693781))

(assert (=> b!743012 m!693777))

(assert (=> b!743012 m!693777))

(declare-fun m!693783 () Bool)

(assert (=> b!743012 m!693783))

(declare-fun m!693785 () Bool)

(assert (=> b!743002 m!693785))

(declare-fun m!693787 () Bool)

(assert (=> b!743008 m!693787))

(declare-fun m!693789 () Bool)

(assert (=> b!743016 m!693789))

(declare-fun m!693791 () Bool)

(assert (=> b!743016 m!693791))

(assert (=> b!743013 m!693777))

(assert (=> b!743013 m!693777))

(declare-fun m!693793 () Bool)

(assert (=> b!743013 m!693793))

(assert (=> b!743007 m!693777))

(assert (=> b!743007 m!693777))

(assert (=> b!743007 m!693783))

(declare-fun m!693795 () Bool)

(assert (=> b!743003 m!693795))

(declare-fun m!693797 () Bool)

(assert (=> b!743003 m!693797))

(declare-fun m!693799 () Bool)

(assert (=> b!743003 m!693799))

(assert (=> b!743003 m!693789))

(declare-fun m!693801 () Bool)

(assert (=> b!743003 m!693801))

(assert (=> b!743003 m!693795))

(declare-fun m!693803 () Bool)

(assert (=> b!743014 m!693803))

(declare-fun m!693805 () Bool)

(assert (=> start!65358 m!693805))

(declare-fun m!693807 () Bool)

(assert (=> start!65358 m!693807))

(declare-fun m!693809 () Bool)

(assert (=> b!743000 m!693809))

(assert (=> b!743004 m!693777))

(assert (=> b!743004 m!693777))

(declare-fun m!693811 () Bool)

(assert (=> b!743004 m!693811))

(declare-fun m!693813 () Bool)

(assert (=> b!743011 m!693813))

(declare-fun m!693815 () Bool)

(assert (=> b!743006 m!693815))

(assert (=> b!743010 m!693777))

(assert (=> b!743010 m!693777))

(declare-fun m!693817 () Bool)

(assert (=> b!743010 m!693817))

(assert (=> b!743005 m!693777))

(assert (=> b!743005 m!693777))

(declare-fun m!693819 () Bool)

(assert (=> b!743005 m!693819))

(check-sat (not b!743018) (not b!743007) (not b!743000) (not start!65358) (not b!743013) (not b!743005) (not b!743004) (not b!743014) (not b!743012) (not b!743002) (not b!743010) (not b!743015) (not b!743011) (not b!743017) (not b!743006) (not b!743003))
(check-sat)
