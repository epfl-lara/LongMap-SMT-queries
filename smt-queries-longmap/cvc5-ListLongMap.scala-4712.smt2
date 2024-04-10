; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65332 () Bool)

(assert start!65332)

(declare-fun b!742261 () Bool)

(declare-fun res!499477 () Bool)

(declare-fun e!414837 () Bool)

(assert (=> b!742261 (=> (not res!499477) (not e!414837))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41505 0))(
  ( (array!41506 (arr!19866 (Array (_ BitVec 32) (_ BitVec 64))) (size!20287 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41505)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!742261 (= res!499477 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19866 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!414842 () Bool)

(declare-fun b!742262 () Bool)

(declare-datatypes ((SeekEntryResult!7466 0))(
  ( (MissingZero!7466 (index!32232 (_ BitVec 32))) (Found!7466 (index!32233 (_ BitVec 32))) (Intermediate!7466 (undefined!8278 Bool) (index!32234 (_ BitVec 32)) (x!63208 (_ BitVec 32))) (Undefined!7466) (MissingVacant!7466 (index!32235 (_ BitVec 32))) )
))
(declare-fun lt!329738 () SeekEntryResult!7466)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41505 (_ BitVec 32)) SeekEntryResult!7466)

(assert (=> b!742262 (= e!414842 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19866 a!3186) j!159) a!3186 mask!3328) lt!329738))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!414835 () Bool)

(declare-fun b!742263 () Bool)

(declare-fun lt!329736 () SeekEntryResult!7466)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41505 (_ BitVec 32)) SeekEntryResult!7466)

(assert (=> b!742263 (= e!414835 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19866 a!3186) j!159) a!3186 mask!3328) lt!329736))))

(declare-fun b!742264 () Bool)

(declare-fun e!414841 () Bool)

(assert (=> b!742264 (= e!414841 true)))

(declare-fun lt!329739 () SeekEntryResult!7466)

(assert (=> b!742264 (= lt!329739 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19866 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!742265 () Bool)

(declare-fun res!499473 () Bool)

(assert (=> b!742265 (=> (not res!499473) (not e!414837))))

(assert (=> b!742265 (= res!499473 e!414835)))

(declare-fun c!81775 () Bool)

(assert (=> b!742265 (= c!81775 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742266 () Bool)

(declare-fun e!414836 () Bool)

(assert (=> b!742266 (= e!414836 e!414837)))

(declare-fun res!499472 () Bool)

(assert (=> b!742266 (=> (not res!499472) (not e!414837))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742266 (= res!499472 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19866 a!3186) j!159) mask!3328) (select (arr!19866 a!3186) j!159) a!3186 mask!3328) lt!329736))))

(assert (=> b!742266 (= lt!329736 (Intermediate!7466 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742267 () Bool)

(declare-fun e!414834 () Bool)

(assert (=> b!742267 (= e!414834 e!414836)))

(declare-fun res!499484 () Bool)

(assert (=> b!742267 (=> (not res!499484) (not e!414836))))

(declare-fun lt!329742 () SeekEntryResult!7466)

(assert (=> b!742267 (= res!499484 (or (= lt!329742 (MissingZero!7466 i!1173)) (= lt!329742 (MissingVacant!7466 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41505 (_ BitVec 32)) SeekEntryResult!7466)

(assert (=> b!742267 (= lt!329742 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!499481 () Bool)

(assert (=> start!65332 (=> (not res!499481) (not e!414834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65332 (= res!499481 (validMask!0 mask!3328))))

(assert (=> start!65332 e!414834))

(assert (=> start!65332 true))

(declare-fun array_inv!15662 (array!41505) Bool)

(assert (=> start!65332 (array_inv!15662 a!3186)))

(declare-fun b!742268 () Bool)

(declare-fun res!499485 () Bool)

(assert (=> b!742268 (=> (not res!499485) (not e!414836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41505 (_ BitVec 32)) Bool)

(assert (=> b!742268 (= res!499485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742269 () Bool)

(declare-fun res!499474 () Bool)

(assert (=> b!742269 (=> (not res!499474) (not e!414834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742269 (= res!499474 (validKeyInArray!0 k!2102))))

(declare-fun b!742270 () Bool)

(declare-fun res!499475 () Bool)

(assert (=> b!742270 (=> (not res!499475) (not e!414834))))

(assert (=> b!742270 (= res!499475 (and (= (size!20287 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20287 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20287 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742271 () Bool)

(assert (=> b!742271 (= e!414835 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19866 a!3186) j!159) a!3186 mask!3328) (Found!7466 j!159)))))

(declare-fun b!742272 () Bool)

(declare-fun res!499483 () Bool)

(assert (=> b!742272 (=> (not res!499483) (not e!414836))))

(assert (=> b!742272 (= res!499483 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20287 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20287 a!3186))))))

(declare-fun b!742273 () Bool)

(declare-fun e!414839 () Bool)

(assert (=> b!742273 (= e!414837 e!414839)))

(declare-fun res!499487 () Bool)

(assert (=> b!742273 (=> (not res!499487) (not e!414839))))

(declare-fun lt!329741 () SeekEntryResult!7466)

(declare-fun lt!329740 () SeekEntryResult!7466)

(assert (=> b!742273 (= res!499487 (= lt!329741 lt!329740))))

(declare-fun lt!329743 () array!41505)

(declare-fun lt!329737 () (_ BitVec 64))

(assert (=> b!742273 (= lt!329740 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329737 lt!329743 mask!3328))))

(assert (=> b!742273 (= lt!329741 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329737 mask!3328) lt!329737 lt!329743 mask!3328))))

(assert (=> b!742273 (= lt!329737 (select (store (arr!19866 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!742273 (= lt!329743 (array!41506 (store (arr!19866 a!3186) i!1173 k!2102) (size!20287 a!3186)))))

(declare-fun b!742274 () Bool)

(declare-fun res!499476 () Bool)

(assert (=> b!742274 (=> (not res!499476) (not e!414836))))

(declare-datatypes ((List!13868 0))(
  ( (Nil!13865) (Cons!13864 (h!14936 (_ BitVec 64)) (t!20183 List!13868)) )
))
(declare-fun arrayNoDuplicates!0 (array!41505 (_ BitVec 32) List!13868) Bool)

(assert (=> b!742274 (= res!499476 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13865))))

(declare-fun b!742275 () Bool)

(declare-fun e!414840 () Bool)

(assert (=> b!742275 (= e!414840 e!414842)))

(declare-fun res!499479 () Bool)

(assert (=> b!742275 (=> (not res!499479) (not e!414842))))

(assert (=> b!742275 (= res!499479 (= (seekEntryOrOpen!0 (select (arr!19866 a!3186) j!159) a!3186 mask!3328) lt!329738))))

(assert (=> b!742275 (= lt!329738 (Found!7466 j!159))))

(declare-fun b!742276 () Bool)

(declare-fun res!499478 () Bool)

(assert (=> b!742276 (=> (not res!499478) (not e!414834))))

(assert (=> b!742276 (= res!499478 (validKeyInArray!0 (select (arr!19866 a!3186) j!159)))))

(declare-fun b!742277 () Bool)

(assert (=> b!742277 (= e!414839 (not e!414841))))

(declare-fun res!499480 () Bool)

(assert (=> b!742277 (=> res!499480 e!414841)))

(assert (=> b!742277 (= res!499480 (or (not (is-Intermediate!7466 lt!329740)) (bvslt x!1131 (x!63208 lt!329740)) (not (= x!1131 (x!63208 lt!329740))) (not (= index!1321 (index!32234 lt!329740)))))))

(assert (=> b!742277 e!414840))

(declare-fun res!499482 () Bool)

(assert (=> b!742277 (=> (not res!499482) (not e!414840))))

(assert (=> b!742277 (= res!499482 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25412 0))(
  ( (Unit!25413) )
))
(declare-fun lt!329744 () Unit!25412)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41505 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25412)

(assert (=> b!742277 (= lt!329744 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742278 () Bool)

(declare-fun res!499486 () Bool)

(assert (=> b!742278 (=> (not res!499486) (not e!414834))))

(declare-fun arrayContainsKey!0 (array!41505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742278 (= res!499486 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!65332 res!499481) b!742270))

(assert (= (and b!742270 res!499475) b!742276))

(assert (= (and b!742276 res!499478) b!742269))

(assert (= (and b!742269 res!499474) b!742278))

(assert (= (and b!742278 res!499486) b!742267))

(assert (= (and b!742267 res!499484) b!742268))

(assert (= (and b!742268 res!499485) b!742274))

(assert (= (and b!742274 res!499476) b!742272))

(assert (= (and b!742272 res!499483) b!742266))

(assert (= (and b!742266 res!499472) b!742261))

(assert (= (and b!742261 res!499477) b!742265))

(assert (= (and b!742265 c!81775) b!742263))

(assert (= (and b!742265 (not c!81775)) b!742271))

(assert (= (and b!742265 res!499473) b!742273))

(assert (= (and b!742273 res!499487) b!742277))

(assert (= (and b!742277 res!499482) b!742275))

(assert (= (and b!742275 res!499479) b!742262))

(assert (= (and b!742277 (not res!499480)) b!742264))

(declare-fun m!693151 () Bool)

(assert (=> b!742261 m!693151))

(declare-fun m!693153 () Bool)

(assert (=> b!742266 m!693153))

(assert (=> b!742266 m!693153))

(declare-fun m!693155 () Bool)

(assert (=> b!742266 m!693155))

(assert (=> b!742266 m!693155))

(assert (=> b!742266 m!693153))

(declare-fun m!693157 () Bool)

(assert (=> b!742266 m!693157))

(assert (=> b!742262 m!693153))

(assert (=> b!742262 m!693153))

(declare-fun m!693159 () Bool)

(assert (=> b!742262 m!693159))

(assert (=> b!742271 m!693153))

(assert (=> b!742271 m!693153))

(declare-fun m!693161 () Bool)

(assert (=> b!742271 m!693161))

(declare-fun m!693163 () Bool)

(assert (=> b!742268 m!693163))

(declare-fun m!693165 () Bool)

(assert (=> b!742273 m!693165))

(declare-fun m!693167 () Bool)

(assert (=> b!742273 m!693167))

(assert (=> b!742273 m!693165))

(declare-fun m!693169 () Bool)

(assert (=> b!742273 m!693169))

(declare-fun m!693171 () Bool)

(assert (=> b!742273 m!693171))

(declare-fun m!693173 () Bool)

(assert (=> b!742273 m!693173))

(declare-fun m!693175 () Bool)

(assert (=> b!742277 m!693175))

(declare-fun m!693177 () Bool)

(assert (=> b!742277 m!693177))

(declare-fun m!693179 () Bool)

(assert (=> b!742278 m!693179))

(assert (=> b!742276 m!693153))

(assert (=> b!742276 m!693153))

(declare-fun m!693181 () Bool)

(assert (=> b!742276 m!693181))

(assert (=> b!742275 m!693153))

(assert (=> b!742275 m!693153))

(declare-fun m!693183 () Bool)

(assert (=> b!742275 m!693183))

(declare-fun m!693185 () Bool)

(assert (=> start!65332 m!693185))

(declare-fun m!693187 () Bool)

(assert (=> start!65332 m!693187))

(assert (=> b!742263 m!693153))

(assert (=> b!742263 m!693153))

(declare-fun m!693189 () Bool)

(assert (=> b!742263 m!693189))

(declare-fun m!693191 () Bool)

(assert (=> b!742274 m!693191))

(declare-fun m!693193 () Bool)

(assert (=> b!742267 m!693193))

(assert (=> b!742264 m!693153))

(assert (=> b!742264 m!693153))

(assert (=> b!742264 m!693161))

(declare-fun m!693195 () Bool)

(assert (=> b!742269 m!693195))

(push 1)

