; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64782 () Bool)

(assert start!64782)

(declare-fun res!489253 () Bool)

(declare-fun e!408236 () Bool)

(assert (=> start!64782 (=> (not res!489253) (not e!408236))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64782 (= res!489253 (validMask!0 mask!3328))))

(assert (=> start!64782 e!408236))

(assert (=> start!64782 true))

(declare-datatypes ((array!41101 0))(
  ( (array!41102 (arr!19666 (Array (_ BitVec 32) (_ BitVec 64))) (size!20086 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41101)

(declare-fun array_inv!15525 (array!41101) Bool)

(assert (=> start!64782 (array_inv!15525 a!3186)))

(declare-fun b!729161 () Bool)

(declare-fun e!408229 () Bool)

(declare-fun e!408235 () Bool)

(assert (=> b!729161 (= e!408229 e!408235)))

(declare-fun res!489241 () Bool)

(assert (=> b!729161 (=> (not res!489241) (not e!408235))))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7222 0))(
  ( (MissingZero!7222 (index!31256 (_ BitVec 32))) (Found!7222 (index!31257 (_ BitVec 32))) (Intermediate!7222 (undefined!8034 Bool) (index!31258 (_ BitVec 32)) (x!62408 (_ BitVec 32))) (Undefined!7222) (MissingVacant!7222 (index!31259 (_ BitVec 32))) )
))
(declare-fun lt!322966 () SeekEntryResult!7222)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41101 (_ BitVec 32)) SeekEntryResult!7222)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729161 (= res!489241 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19666 a!3186) j!159) mask!3328) (select (arr!19666 a!3186) j!159) a!3186 mask!3328) lt!322966))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729161 (= lt!322966 (Intermediate!7222 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!729162 () Bool)

(declare-fun e!408232 () Bool)

(assert (=> b!729162 (= e!408235 e!408232)))

(declare-fun res!489251 () Bool)

(assert (=> b!729162 (=> (not res!489251) (not e!408232))))

(declare-fun lt!322970 () SeekEntryResult!7222)

(declare-fun lt!322969 () SeekEntryResult!7222)

(assert (=> b!729162 (= res!489251 (= lt!322970 lt!322969))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!322967 () array!41101)

(declare-fun lt!322963 () (_ BitVec 64))

(assert (=> b!729162 (= lt!322969 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322963 lt!322967 mask!3328))))

(assert (=> b!729162 (= lt!322970 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322963 mask!3328) lt!322963 lt!322967 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!729162 (= lt!322963 (select (store (arr!19666 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!729162 (= lt!322967 (array!41102 (store (arr!19666 a!3186) i!1173 k0!2102) (size!20086 a!3186)))))

(declare-fun b!729163 () Bool)

(declare-fun e!408237 () Bool)

(assert (=> b!729163 (= e!408232 (not e!408237))))

(declare-fun res!489245 () Bool)

(assert (=> b!729163 (=> res!489245 e!408237)))

(get-info :version)

(assert (=> b!729163 (= res!489245 (or (not ((_ is Intermediate!7222) lt!322969)) (bvsge x!1131 (x!62408 lt!322969))))))

(declare-fun e!408231 () Bool)

(assert (=> b!729163 e!408231))

(declare-fun res!489239 () Bool)

(assert (=> b!729163 (=> (not res!489239) (not e!408231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41101 (_ BitVec 32)) Bool)

(assert (=> b!729163 (= res!489239 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24841 0))(
  ( (Unit!24842) )
))
(declare-fun lt!322964 () Unit!24841)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41101 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24841)

(assert (=> b!729163 (= lt!322964 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun e!408234 () Bool)

(declare-fun b!729164 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41101 (_ BitVec 32)) SeekEntryResult!7222)

(assert (=> b!729164 (= e!408234 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19666 a!3186) j!159) a!3186 mask!3328) (Found!7222 j!159)))))

(declare-fun b!729165 () Bool)

(assert (=> b!729165 (= e!408234 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19666 a!3186) j!159) a!3186 mask!3328) lt!322966))))

(declare-fun b!729166 () Bool)

(declare-fun res!489247 () Bool)

(assert (=> b!729166 (=> (not res!489247) (not e!408229))))

(assert (=> b!729166 (= res!489247 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20086 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20086 a!3186))))))

(declare-fun lt!322968 () SeekEntryResult!7222)

(declare-fun b!729167 () Bool)

(declare-fun e!408230 () Bool)

(assert (=> b!729167 (= e!408230 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19666 a!3186) j!159) a!3186 mask!3328) lt!322968))))

(declare-fun b!729168 () Bool)

(assert (=> b!729168 (= e!408237 true)))

(declare-fun lt!322965 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729168 (= lt!322965 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!729169 () Bool)

(declare-fun res!489244 () Bool)

(assert (=> b!729169 (=> (not res!489244) (not e!408235))))

(assert (=> b!729169 (= res!489244 e!408234)))

(declare-fun c!80339 () Bool)

(assert (=> b!729169 (= c!80339 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729170 () Bool)

(declare-fun res!489252 () Bool)

(assert (=> b!729170 (=> (not res!489252) (not e!408236))))

(declare-fun arrayContainsKey!0 (array!41101 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729170 (= res!489252 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729171 () Bool)

(declare-fun res!489238 () Bool)

(assert (=> b!729171 (=> (not res!489238) (not e!408236))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729171 (= res!489238 (validKeyInArray!0 k0!2102))))

(declare-fun b!729172 () Bool)

(declare-fun res!489242 () Bool)

(assert (=> b!729172 (=> (not res!489242) (not e!408229))))

(assert (=> b!729172 (= res!489242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729173 () Bool)

(declare-fun res!489243 () Bool)

(assert (=> b!729173 (=> (not res!489243) (not e!408235))))

(assert (=> b!729173 (= res!489243 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19666 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729174 () Bool)

(assert (=> b!729174 (= e!408231 e!408230)))

(declare-fun res!489250 () Bool)

(assert (=> b!729174 (=> (not res!489250) (not e!408230))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41101 (_ BitVec 32)) SeekEntryResult!7222)

(assert (=> b!729174 (= res!489250 (= (seekEntryOrOpen!0 (select (arr!19666 a!3186) j!159) a!3186 mask!3328) lt!322968))))

(assert (=> b!729174 (= lt!322968 (Found!7222 j!159))))

(declare-fun b!729175 () Bool)

(declare-fun res!489248 () Bool)

(assert (=> b!729175 (=> (not res!489248) (not e!408236))))

(assert (=> b!729175 (= res!489248 (and (= (size!20086 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20086 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20086 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!729176 () Bool)

(assert (=> b!729176 (= e!408236 e!408229)))

(declare-fun res!489249 () Bool)

(assert (=> b!729176 (=> (not res!489249) (not e!408229))))

(declare-fun lt!322971 () SeekEntryResult!7222)

(assert (=> b!729176 (= res!489249 (or (= lt!322971 (MissingZero!7222 i!1173)) (= lt!322971 (MissingVacant!7222 i!1173))))))

(assert (=> b!729176 (= lt!322971 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!729177 () Bool)

(declare-fun res!489246 () Bool)

(assert (=> b!729177 (=> (not res!489246) (not e!408236))))

(assert (=> b!729177 (= res!489246 (validKeyInArray!0 (select (arr!19666 a!3186) j!159)))))

(declare-fun b!729178 () Bool)

(declare-fun res!489240 () Bool)

(assert (=> b!729178 (=> (not res!489240) (not e!408229))))

(declare-datatypes ((List!13575 0))(
  ( (Nil!13572) (Cons!13571 (h!14637 (_ BitVec 64)) (t!19882 List!13575)) )
))
(declare-fun arrayNoDuplicates!0 (array!41101 (_ BitVec 32) List!13575) Bool)

(assert (=> b!729178 (= res!489240 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13572))))

(assert (= (and start!64782 res!489253) b!729175))

(assert (= (and b!729175 res!489248) b!729177))

(assert (= (and b!729177 res!489246) b!729171))

(assert (= (and b!729171 res!489238) b!729170))

(assert (= (and b!729170 res!489252) b!729176))

(assert (= (and b!729176 res!489249) b!729172))

(assert (= (and b!729172 res!489242) b!729178))

(assert (= (and b!729178 res!489240) b!729166))

(assert (= (and b!729166 res!489247) b!729161))

(assert (= (and b!729161 res!489241) b!729173))

(assert (= (and b!729173 res!489243) b!729169))

(assert (= (and b!729169 c!80339) b!729165))

(assert (= (and b!729169 (not c!80339)) b!729164))

(assert (= (and b!729169 res!489244) b!729162))

(assert (= (and b!729162 res!489251) b!729163))

(assert (= (and b!729163 res!489239) b!729174))

(assert (= (and b!729174 res!489250) b!729167))

(assert (= (and b!729163 (not res!489245)) b!729168))

(declare-fun m!683307 () Bool)

(assert (=> b!729177 m!683307))

(assert (=> b!729177 m!683307))

(declare-fun m!683309 () Bool)

(assert (=> b!729177 m!683309))

(assert (=> b!729174 m!683307))

(assert (=> b!729174 m!683307))

(declare-fun m!683311 () Bool)

(assert (=> b!729174 m!683311))

(declare-fun m!683313 () Bool)

(assert (=> b!729163 m!683313))

(declare-fun m!683315 () Bool)

(assert (=> b!729163 m!683315))

(declare-fun m!683317 () Bool)

(assert (=> b!729171 m!683317))

(declare-fun m!683319 () Bool)

(assert (=> b!729162 m!683319))

(declare-fun m!683321 () Bool)

(assert (=> b!729162 m!683321))

(declare-fun m!683323 () Bool)

(assert (=> b!729162 m!683323))

(declare-fun m!683325 () Bool)

(assert (=> b!729162 m!683325))

(declare-fun m!683327 () Bool)

(assert (=> b!729162 m!683327))

(assert (=> b!729162 m!683323))

(declare-fun m!683329 () Bool)

(assert (=> b!729176 m!683329))

(declare-fun m!683331 () Bool)

(assert (=> b!729173 m!683331))

(declare-fun m!683333 () Bool)

(assert (=> b!729168 m!683333))

(declare-fun m!683335 () Bool)

(assert (=> b!729172 m!683335))

(declare-fun m!683337 () Bool)

(assert (=> b!729170 m!683337))

(declare-fun m!683339 () Bool)

(assert (=> start!64782 m!683339))

(declare-fun m!683341 () Bool)

(assert (=> start!64782 m!683341))

(assert (=> b!729161 m!683307))

(assert (=> b!729161 m!683307))

(declare-fun m!683343 () Bool)

(assert (=> b!729161 m!683343))

(assert (=> b!729161 m!683343))

(assert (=> b!729161 m!683307))

(declare-fun m!683345 () Bool)

(assert (=> b!729161 m!683345))

(declare-fun m!683347 () Bool)

(assert (=> b!729178 m!683347))

(assert (=> b!729167 m!683307))

(assert (=> b!729167 m!683307))

(declare-fun m!683349 () Bool)

(assert (=> b!729167 m!683349))

(assert (=> b!729164 m!683307))

(assert (=> b!729164 m!683307))

(declare-fun m!683351 () Bool)

(assert (=> b!729164 m!683351))

(assert (=> b!729165 m!683307))

(assert (=> b!729165 m!683307))

(declare-fun m!683353 () Bool)

(assert (=> b!729165 m!683353))

(check-sat (not b!729165) (not start!64782) (not b!729167) (not b!729164) (not b!729161) (not b!729177) (not b!729162) (not b!729168) (not b!729170) (not b!729176) (not b!729178) (not b!729163) (not b!729171) (not b!729172) (not b!729174))
(check-sat)
