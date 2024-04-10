; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67994 () Bool)

(assert start!67994)

(declare-fun b!791147 () Bool)

(declare-fun e!439699 () Bool)

(declare-fun e!439703 () Bool)

(assert (=> b!791147 (= e!439699 e!439703)))

(declare-fun res!535935 () Bool)

(assert (=> b!791147 (=> (not res!535935) (not e!439703))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8139 0))(
  ( (MissingZero!8139 (index!34924 (_ BitVec 32))) (Found!8139 (index!34925 (_ BitVec 32))) (Intermediate!8139 (undefined!8951 Bool) (index!34926 (_ BitVec 32)) (x!65865 (_ BitVec 32))) (Undefined!8139) (MissingVacant!8139 (index!34927 (_ BitVec 32))) )
))
(declare-fun lt!353154 () SeekEntryResult!8139)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42908 0))(
  ( (array!42909 (arr!20539 (Array (_ BitVec 32) (_ BitVec 64))) (size!20960 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42908)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42908 (_ BitVec 32)) SeekEntryResult!8139)

(assert (=> b!791147 (= res!535935 (= (seekEntryOrOpen!0 (select (arr!20539 a!3186) j!159) a!3186 mask!3328) lt!353154))))

(assert (=> b!791147 (= lt!353154 (Found!8139 j!159))))

(declare-fun res!535931 () Bool)

(declare-fun e!439705 () Bool)

(assert (=> start!67994 (=> (not res!535931) (not e!439705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67994 (= res!535931 (validMask!0 mask!3328))))

(assert (=> start!67994 e!439705))

(assert (=> start!67994 true))

(declare-fun array_inv!16335 (array!42908) Bool)

(assert (=> start!67994 (array_inv!16335 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!791148 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42908 (_ BitVec 32)) SeekEntryResult!8139)

(assert (=> b!791148 (= e!439703 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20539 a!3186) j!159) a!3186 mask!3328) lt!353154))))

(declare-fun b!791149 () Bool)

(declare-fun e!439702 () Bool)

(declare-fun e!439704 () Bool)

(assert (=> b!791149 (= e!439702 e!439704)))

(declare-fun res!535939 () Bool)

(assert (=> b!791149 (=> (not res!535939) (not e!439704))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!353158 () array!42908)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!353156 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42908 (_ BitVec 32)) SeekEntryResult!8139)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!791149 (= res!535939 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!353156 mask!3328) lt!353156 lt!353158 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!353156 lt!353158 mask!3328)))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!791149 (= lt!353156 (select (store (arr!20539 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!791149 (= lt!353158 (array!42909 (store (arr!20539 a!3186) i!1173 k0!2102) (size!20960 a!3186)))))

(declare-fun b!791150 () Bool)

(declare-fun res!535930 () Bool)

(assert (=> b!791150 (=> (not res!535930) (not e!439702))))

(assert (=> b!791150 (= res!535930 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20539 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!791151 () Bool)

(declare-fun res!535929 () Bool)

(assert (=> b!791151 (=> (not res!535929) (not e!439705))))

(declare-fun arrayContainsKey!0 (array!42908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!791151 (= res!535929 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!791152 () Bool)

(declare-fun lt!353157 () SeekEntryResult!8139)

(declare-fun e!439706 () Bool)

(assert (=> b!791152 (= e!439706 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20539 a!3186) j!159) a!3186 mask!3328) lt!353157))))

(declare-fun b!791153 () Bool)

(declare-fun e!439700 () Bool)

(assert (=> b!791153 (= e!439705 e!439700)))

(declare-fun res!535926 () Bool)

(assert (=> b!791153 (=> (not res!535926) (not e!439700))))

(declare-fun lt!353155 () SeekEntryResult!8139)

(assert (=> b!791153 (= res!535926 (or (= lt!353155 (MissingZero!8139 i!1173)) (= lt!353155 (MissingVacant!8139 i!1173))))))

(assert (=> b!791153 (= lt!353155 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!791154 () Bool)

(declare-fun res!535936 () Bool)

(assert (=> b!791154 (=> (not res!535936) (not e!439702))))

(assert (=> b!791154 (= res!535936 e!439706)))

(declare-fun c!88021 () Bool)

(assert (=> b!791154 (= c!88021 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!791155 () Bool)

(assert (=> b!791155 (= e!439700 e!439702)))

(declare-fun res!535928 () Bool)

(assert (=> b!791155 (=> (not res!535928) (not e!439702))))

(assert (=> b!791155 (= res!535928 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20539 a!3186) j!159) mask!3328) (select (arr!20539 a!3186) j!159) a!3186 mask!3328) lt!353157))))

(assert (=> b!791155 (= lt!353157 (Intermediate!8139 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!791156 () Bool)

(assert (=> b!791156 (= e!439706 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20539 a!3186) j!159) a!3186 mask!3328) (Found!8139 j!159)))))

(declare-fun b!791157 () Bool)

(assert (=> b!791157 (= e!439704 (not true))))

(assert (=> b!791157 e!439699))

(declare-fun res!535927 () Bool)

(assert (=> b!791157 (=> (not res!535927) (not e!439699))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42908 (_ BitVec 32)) Bool)

(assert (=> b!791157 (= res!535927 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!27430 0))(
  ( (Unit!27431) )
))
(declare-fun lt!353159 () Unit!27430)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42908 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27430)

(assert (=> b!791157 (= lt!353159 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!791158 () Bool)

(declare-fun res!535932 () Bool)

(assert (=> b!791158 (=> (not res!535932) (not e!439700))))

(assert (=> b!791158 (= res!535932 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20960 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20960 a!3186))))))

(declare-fun b!791159 () Bool)

(declare-fun res!535938 () Bool)

(assert (=> b!791159 (=> (not res!535938) (not e!439705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!791159 (= res!535938 (validKeyInArray!0 k0!2102))))

(declare-fun b!791160 () Bool)

(declare-fun res!535940 () Bool)

(assert (=> b!791160 (=> (not res!535940) (not e!439705))))

(assert (=> b!791160 (= res!535940 (and (= (size!20960 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20960 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20960 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!791161 () Bool)

(declare-fun res!535933 () Bool)

(assert (=> b!791161 (=> (not res!535933) (not e!439700))))

(assert (=> b!791161 (= res!535933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!791162 () Bool)

(declare-fun res!535937 () Bool)

(assert (=> b!791162 (=> (not res!535937) (not e!439700))))

(declare-datatypes ((List!14541 0))(
  ( (Nil!14538) (Cons!14537 (h!15666 (_ BitVec 64)) (t!20856 List!14541)) )
))
(declare-fun arrayNoDuplicates!0 (array!42908 (_ BitVec 32) List!14541) Bool)

(assert (=> b!791162 (= res!535937 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14538))))

(declare-fun b!791163 () Bool)

(declare-fun res!535934 () Bool)

(assert (=> b!791163 (=> (not res!535934) (not e!439705))))

(assert (=> b!791163 (= res!535934 (validKeyInArray!0 (select (arr!20539 a!3186) j!159)))))

(assert (= (and start!67994 res!535931) b!791160))

(assert (= (and b!791160 res!535940) b!791163))

(assert (= (and b!791163 res!535934) b!791159))

(assert (= (and b!791159 res!535938) b!791151))

(assert (= (and b!791151 res!535929) b!791153))

(assert (= (and b!791153 res!535926) b!791161))

(assert (= (and b!791161 res!535933) b!791162))

(assert (= (and b!791162 res!535937) b!791158))

(assert (= (and b!791158 res!535932) b!791155))

(assert (= (and b!791155 res!535928) b!791150))

(assert (= (and b!791150 res!535930) b!791154))

(assert (= (and b!791154 c!88021) b!791152))

(assert (= (and b!791154 (not c!88021)) b!791156))

(assert (= (and b!791154 res!535936) b!791149))

(assert (= (and b!791149 res!535939) b!791157))

(assert (= (and b!791157 res!535927) b!791147))

(assert (= (and b!791147 res!535935) b!791148))

(declare-fun m!731913 () Bool)

(assert (=> b!791151 m!731913))

(declare-fun m!731915 () Bool)

(assert (=> b!791159 m!731915))

(declare-fun m!731917 () Bool)

(assert (=> b!791149 m!731917))

(declare-fun m!731919 () Bool)

(assert (=> b!791149 m!731919))

(declare-fun m!731921 () Bool)

(assert (=> b!791149 m!731921))

(assert (=> b!791149 m!731921))

(declare-fun m!731923 () Bool)

(assert (=> b!791149 m!731923))

(declare-fun m!731925 () Bool)

(assert (=> b!791149 m!731925))

(declare-fun m!731927 () Bool)

(assert (=> b!791156 m!731927))

(assert (=> b!791156 m!731927))

(declare-fun m!731929 () Bool)

(assert (=> b!791156 m!731929))

(declare-fun m!731931 () Bool)

(assert (=> b!791162 m!731931))

(declare-fun m!731933 () Bool)

(assert (=> b!791150 m!731933))

(assert (=> b!791147 m!731927))

(assert (=> b!791147 m!731927))

(declare-fun m!731935 () Bool)

(assert (=> b!791147 m!731935))

(assert (=> b!791148 m!731927))

(assert (=> b!791148 m!731927))

(declare-fun m!731937 () Bool)

(assert (=> b!791148 m!731937))

(assert (=> b!791155 m!731927))

(assert (=> b!791155 m!731927))

(declare-fun m!731939 () Bool)

(assert (=> b!791155 m!731939))

(assert (=> b!791155 m!731939))

(assert (=> b!791155 m!731927))

(declare-fun m!731941 () Bool)

(assert (=> b!791155 m!731941))

(assert (=> b!791152 m!731927))

(assert (=> b!791152 m!731927))

(declare-fun m!731943 () Bool)

(assert (=> b!791152 m!731943))

(declare-fun m!731945 () Bool)

(assert (=> b!791157 m!731945))

(declare-fun m!731947 () Bool)

(assert (=> b!791157 m!731947))

(declare-fun m!731949 () Bool)

(assert (=> start!67994 m!731949))

(declare-fun m!731951 () Bool)

(assert (=> start!67994 m!731951))

(declare-fun m!731953 () Bool)

(assert (=> b!791161 m!731953))

(assert (=> b!791163 m!731927))

(assert (=> b!791163 m!731927))

(declare-fun m!731955 () Bool)

(assert (=> b!791163 m!731955))

(declare-fun m!731957 () Bool)

(assert (=> b!791153 m!731957))

(check-sat (not b!791162) (not b!791152) (not b!791153) (not start!67994) (not b!791159) (not b!791161) (not b!791155) (not b!791157) (not b!791147) (not b!791151) (not b!791163) (not b!791156) (not b!791148) (not b!791149))
(check-sat)
