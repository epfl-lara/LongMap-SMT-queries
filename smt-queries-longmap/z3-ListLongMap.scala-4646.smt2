; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64776 () Bool)

(assert start!64776)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41095 0))(
  ( (array!41096 (arr!19663 (Array (_ BitVec 32) (_ BitVec 64))) (size!20083 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41095)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!728999 () Bool)

(declare-fun e!408155 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7219 0))(
  ( (MissingZero!7219 (index!31244 (_ BitVec 32))) (Found!7219 (index!31245 (_ BitVec 32))) (Intermediate!7219 (undefined!8031 Bool) (index!31246 (_ BitVec 32)) (x!62397 (_ BitVec 32))) (Undefined!7219) (MissingVacant!7219 (index!31247 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41095 (_ BitVec 32)) SeekEntryResult!7219)

(assert (=> b!728999 (= e!408155 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19663 a!3186) j!159) a!3186 mask!3328) (Found!7219 j!159)))))

(declare-fun b!729001 () Bool)

(declare-fun e!408152 () Bool)

(declare-fun e!408150 () Bool)

(assert (=> b!729001 (= e!408152 e!408150)))

(declare-fun res!489104 () Bool)

(assert (=> b!729001 (=> (not res!489104) (not e!408150))))

(declare-fun lt!322882 () SeekEntryResult!7219)

(declare-fun lt!322885 () SeekEntryResult!7219)

(assert (=> b!729001 (= res!489104 (= lt!322882 lt!322885))))

(declare-fun lt!322889 () (_ BitVec 64))

(declare-fun lt!322887 () array!41095)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41095 (_ BitVec 32)) SeekEntryResult!7219)

(assert (=> b!729001 (= lt!322885 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322889 lt!322887 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729001 (= lt!322882 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322889 mask!3328) lt!322889 lt!322887 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!729001 (= lt!322889 (select (store (arr!19663 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!729001 (= lt!322887 (array!41096 (store (arr!19663 a!3186) i!1173 k0!2102) (size!20083 a!3186)))))

(declare-fun b!729002 () Bool)

(declare-fun res!489108 () Bool)

(declare-fun e!408153 () Bool)

(assert (=> b!729002 (=> (not res!489108) (not e!408153))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729002 (= res!489108 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20083 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20083 a!3186))))))

(declare-fun b!729003 () Bool)

(declare-fun res!489094 () Bool)

(assert (=> b!729003 (=> (not res!489094) (not e!408152))))

(assert (=> b!729003 (= res!489094 e!408155)))

(declare-fun c!80330 () Bool)

(assert (=> b!729003 (= c!80330 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729004 () Bool)

(declare-fun res!489102 () Bool)

(declare-fun e!408151 () Bool)

(assert (=> b!729004 (=> (not res!489102) (not e!408151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729004 (= res!489102 (validKeyInArray!0 k0!2102))))

(declare-fun b!729005 () Bool)

(assert (=> b!729005 (= e!408151 e!408153)))

(declare-fun res!489109 () Bool)

(assert (=> b!729005 (=> (not res!489109) (not e!408153))))

(declare-fun lt!322884 () SeekEntryResult!7219)

(assert (=> b!729005 (= res!489109 (or (= lt!322884 (MissingZero!7219 i!1173)) (= lt!322884 (MissingVacant!7219 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41095 (_ BitVec 32)) SeekEntryResult!7219)

(assert (=> b!729005 (= lt!322884 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!729006 () Bool)

(assert (=> b!729006 (= e!408153 e!408152)))

(declare-fun res!489095 () Bool)

(assert (=> b!729006 (=> (not res!489095) (not e!408152))))

(declare-fun lt!322888 () SeekEntryResult!7219)

(assert (=> b!729006 (= res!489095 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19663 a!3186) j!159) mask!3328) (select (arr!19663 a!3186) j!159) a!3186 mask!3328) lt!322888))))

(assert (=> b!729006 (= lt!322888 (Intermediate!7219 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729007 () Bool)

(assert (=> b!729007 (= e!408155 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19663 a!3186) j!159) a!3186 mask!3328) lt!322888))))

(declare-fun b!729008 () Bool)

(declare-fun res!489106 () Bool)

(assert (=> b!729008 (=> (not res!489106) (not e!408152))))

(assert (=> b!729008 (= res!489106 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19663 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729009 () Bool)

(declare-fun res!489100 () Bool)

(assert (=> b!729009 (=> (not res!489100) (not e!408153))))

(declare-datatypes ((List!13572 0))(
  ( (Nil!13569) (Cons!13568 (h!14634 (_ BitVec 64)) (t!19879 List!13572)) )
))
(declare-fun arrayNoDuplicates!0 (array!41095 (_ BitVec 32) List!13572) Bool)

(assert (=> b!729009 (= res!489100 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13569))))

(declare-fun res!489107 () Bool)

(assert (=> start!64776 (=> (not res!489107) (not e!408151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64776 (= res!489107 (validMask!0 mask!3328))))

(assert (=> start!64776 e!408151))

(assert (=> start!64776 true))

(declare-fun array_inv!15522 (array!41095) Bool)

(assert (=> start!64776 (array_inv!15522 a!3186)))

(declare-fun b!729000 () Bool)

(declare-fun e!408148 () Bool)

(assert (=> b!729000 (= e!408148 true)))

(declare-fun lt!322890 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729000 (= lt!322890 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!729010 () Bool)

(declare-fun res!489103 () Bool)

(assert (=> b!729010 (=> (not res!489103) (not e!408151))))

(declare-fun arrayContainsKey!0 (array!41095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729010 (= res!489103 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729011 () Bool)

(declare-fun res!489096 () Bool)

(assert (=> b!729011 (=> (not res!489096) (not e!408153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41095 (_ BitVec 32)) Bool)

(assert (=> b!729011 (= res!489096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729012 () Bool)

(declare-fun e!408156 () Bool)

(declare-fun e!408149 () Bool)

(assert (=> b!729012 (= e!408156 e!408149)))

(declare-fun res!489099 () Bool)

(assert (=> b!729012 (=> (not res!489099) (not e!408149))))

(declare-fun lt!322886 () SeekEntryResult!7219)

(assert (=> b!729012 (= res!489099 (= (seekEntryOrOpen!0 (select (arr!19663 a!3186) j!159) a!3186 mask!3328) lt!322886))))

(assert (=> b!729012 (= lt!322886 (Found!7219 j!159))))

(declare-fun b!729013 () Bool)

(declare-fun res!489105 () Bool)

(assert (=> b!729013 (=> (not res!489105) (not e!408151))))

(assert (=> b!729013 (= res!489105 (and (= (size!20083 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20083 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20083 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729014 () Bool)

(assert (=> b!729014 (= e!408150 (not e!408148))))

(declare-fun res!489101 () Bool)

(assert (=> b!729014 (=> res!489101 e!408148)))

(get-info :version)

(assert (=> b!729014 (= res!489101 (or (not ((_ is Intermediate!7219) lt!322885)) (bvsge x!1131 (x!62397 lt!322885))))))

(assert (=> b!729014 e!408156))

(declare-fun res!489098 () Bool)

(assert (=> b!729014 (=> (not res!489098) (not e!408156))))

(assert (=> b!729014 (= res!489098 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24835 0))(
  ( (Unit!24836) )
))
(declare-fun lt!322883 () Unit!24835)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41095 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24835)

(assert (=> b!729014 (= lt!322883 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729015 () Bool)

(assert (=> b!729015 (= e!408149 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19663 a!3186) j!159) a!3186 mask!3328) lt!322886))))

(declare-fun b!729016 () Bool)

(declare-fun res!489097 () Bool)

(assert (=> b!729016 (=> (not res!489097) (not e!408151))))

(assert (=> b!729016 (= res!489097 (validKeyInArray!0 (select (arr!19663 a!3186) j!159)))))

(assert (= (and start!64776 res!489107) b!729013))

(assert (= (and b!729013 res!489105) b!729016))

(assert (= (and b!729016 res!489097) b!729004))

(assert (= (and b!729004 res!489102) b!729010))

(assert (= (and b!729010 res!489103) b!729005))

(assert (= (and b!729005 res!489109) b!729011))

(assert (= (and b!729011 res!489096) b!729009))

(assert (= (and b!729009 res!489100) b!729002))

(assert (= (and b!729002 res!489108) b!729006))

(assert (= (and b!729006 res!489095) b!729008))

(assert (= (and b!729008 res!489106) b!729003))

(assert (= (and b!729003 c!80330) b!729007))

(assert (= (and b!729003 (not c!80330)) b!728999))

(assert (= (and b!729003 res!489094) b!729001))

(assert (= (and b!729001 res!489104) b!729014))

(assert (= (and b!729014 res!489098) b!729012))

(assert (= (and b!729012 res!489099) b!729015))

(assert (= (and b!729014 (not res!489101)) b!729000))

(declare-fun m!683163 () Bool)

(assert (=> b!729006 m!683163))

(assert (=> b!729006 m!683163))

(declare-fun m!683165 () Bool)

(assert (=> b!729006 m!683165))

(assert (=> b!729006 m!683165))

(assert (=> b!729006 m!683163))

(declare-fun m!683167 () Bool)

(assert (=> b!729006 m!683167))

(assert (=> b!729012 m!683163))

(assert (=> b!729012 m!683163))

(declare-fun m!683169 () Bool)

(assert (=> b!729012 m!683169))

(declare-fun m!683171 () Bool)

(assert (=> b!729008 m!683171))

(assert (=> b!729016 m!683163))

(assert (=> b!729016 m!683163))

(declare-fun m!683173 () Bool)

(assert (=> b!729016 m!683173))

(declare-fun m!683175 () Bool)

(assert (=> b!729005 m!683175))

(assert (=> b!729007 m!683163))

(assert (=> b!729007 m!683163))

(declare-fun m!683177 () Bool)

(assert (=> b!729007 m!683177))

(declare-fun m!683179 () Bool)

(assert (=> b!729001 m!683179))

(declare-fun m!683181 () Bool)

(assert (=> b!729001 m!683181))

(declare-fun m!683183 () Bool)

(assert (=> b!729001 m!683183))

(declare-fun m!683185 () Bool)

(assert (=> b!729001 m!683185))

(assert (=> b!729001 m!683179))

(declare-fun m!683187 () Bool)

(assert (=> b!729001 m!683187))

(declare-fun m!683189 () Bool)

(assert (=> start!64776 m!683189))

(declare-fun m!683191 () Bool)

(assert (=> start!64776 m!683191))

(declare-fun m!683193 () Bool)

(assert (=> b!729009 m!683193))

(declare-fun m!683195 () Bool)

(assert (=> b!729000 m!683195))

(assert (=> b!729015 m!683163))

(assert (=> b!729015 m!683163))

(declare-fun m!683197 () Bool)

(assert (=> b!729015 m!683197))

(declare-fun m!683199 () Bool)

(assert (=> b!729011 m!683199))

(assert (=> b!728999 m!683163))

(assert (=> b!728999 m!683163))

(declare-fun m!683201 () Bool)

(assert (=> b!728999 m!683201))

(declare-fun m!683203 () Bool)

(assert (=> b!729004 m!683203))

(declare-fun m!683205 () Bool)

(assert (=> b!729014 m!683205))

(declare-fun m!683207 () Bool)

(assert (=> b!729014 m!683207))

(declare-fun m!683209 () Bool)

(assert (=> b!729010 m!683209))

(check-sat (not b!729000) (not start!64776) (not b!729010) (not b!729005) (not b!729014) (not b!729001) (not b!729016) (not b!729015) (not b!729011) (not b!728999) (not b!729007) (not b!729004) (not b!729012) (not b!729009) (not b!729006))
(check-sat)
