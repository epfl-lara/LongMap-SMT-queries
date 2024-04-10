; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67572 () Bool)

(assert start!67572)

(declare-fun b!782329 () Bool)

(declare-datatypes ((Unit!26996 0))(
  ( (Unit!26997) )
))
(declare-fun e!435024 () Unit!26996)

(declare-fun Unit!26998 () Unit!26996)

(assert (=> b!782329 (= e!435024 Unit!26998)))

(declare-fun b!782330 () Bool)

(declare-fun res!529361 () Bool)

(declare-fun e!435028 () Bool)

(assert (=> b!782330 (=> res!529361 e!435028)))

(declare-datatypes ((array!42675 0))(
  ( (array!42676 (arr!20427 (Array (_ BitVec 32) (_ BitVec 64))) (size!20848 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42675)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun lt!348651 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!782330 (= res!529361 (= (select (store (arr!20427 a!3186) i!1173 k!2102) index!1321) lt!348651))))

(declare-fun e!435030 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!782331 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8027 0))(
  ( (MissingZero!8027 (index!34476 (_ BitVec 32))) (Found!8027 (index!34477 (_ BitVec 32))) (Intermediate!8027 (undefined!8839 Bool) (index!34478 (_ BitVec 32)) (x!65430 (_ BitVec 32))) (Undefined!8027) (MissingVacant!8027 (index!34479 (_ BitVec 32))) )
))
(declare-fun lt!348650 () SeekEntryResult!8027)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42675 (_ BitVec 32)) SeekEntryResult!8027)

(assert (=> b!782331 (= e!435030 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20427 a!3186) j!159) a!3186 mask!3328) lt!348650))))

(declare-fun b!782332 () Bool)

(declare-fun e!435029 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!782332 (= e!435029 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20427 a!3186) j!159) a!3186 mask!3328) (Found!8027 j!159)))))

(declare-fun b!782333 () Bool)

(declare-fun res!529364 () Bool)

(declare-fun e!435032 () Bool)

(assert (=> b!782333 (=> (not res!529364) (not e!435032))))

(assert (=> b!782333 (= res!529364 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20427 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!782334 () Bool)

(assert (=> b!782334 (= e!435028 true)))

(assert (=> b!782334 (= (select (store (arr!20427 a!3186) i!1173 k!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!348655 () Unit!26996)

(assert (=> b!782334 (= lt!348655 e!435024)))

(declare-fun c!86896 () Bool)

(assert (=> b!782334 (= c!86896 (= (select (store (arr!20427 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!782335 () Bool)

(declare-fun lt!348656 () SeekEntryResult!8027)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42675 (_ BitVec 32)) SeekEntryResult!8027)

(assert (=> b!782335 (= e!435029 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20427 a!3186) j!159) a!3186 mask!3328) lt!348656))))

(declare-fun b!782336 () Bool)

(declare-fun res!529353 () Bool)

(declare-fun e!435031 () Bool)

(assert (=> b!782336 (=> (not res!529353) (not e!435031))))

(assert (=> b!782336 (= res!529353 (and (= (size!20848 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20848 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20848 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!782337 () Bool)

(declare-fun res!529359 () Bool)

(assert (=> b!782337 (=> (not res!529359) (not e!435032))))

(assert (=> b!782337 (= res!529359 e!435029)))

(declare-fun c!86895 () Bool)

(assert (=> b!782337 (= c!86895 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!782338 () Bool)

(declare-fun res!529355 () Bool)

(assert (=> b!782338 (=> res!529355 e!435028)))

(assert (=> b!782338 (= res!529355 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20427 a!3186) j!159) a!3186 mask!3328) lt!348650)))))

(declare-fun b!782339 () Bool)

(declare-fun res!529363 () Bool)

(declare-fun e!435026 () Bool)

(assert (=> b!782339 (=> (not res!529363) (not e!435026))))

(assert (=> b!782339 (= res!529363 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20848 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20848 a!3186))))))

(declare-fun b!782340 () Bool)

(declare-fun res!529352 () Bool)

(assert (=> b!782340 (=> (not res!529352) (not e!435031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!782340 (= res!529352 (validKeyInArray!0 k!2102))))

(declare-fun b!782341 () Bool)

(declare-fun res!529358 () Bool)

(assert (=> b!782341 (=> (not res!529358) (not e!435031))))

(assert (=> b!782341 (= res!529358 (validKeyInArray!0 (select (arr!20427 a!3186) j!159)))))

(declare-fun b!782342 () Bool)

(declare-fun e!435027 () Bool)

(assert (=> b!782342 (= e!435032 e!435027)))

(declare-fun res!529362 () Bool)

(assert (=> b!782342 (=> (not res!529362) (not e!435027))))

(declare-fun lt!348659 () SeekEntryResult!8027)

(declare-fun lt!348654 () SeekEntryResult!8027)

(assert (=> b!782342 (= res!529362 (= lt!348659 lt!348654))))

(declare-fun lt!348653 () array!42675)

(assert (=> b!782342 (= lt!348654 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!348651 lt!348653 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!782342 (= lt!348659 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!348651 mask!3328) lt!348651 lt!348653 mask!3328))))

(assert (=> b!782342 (= lt!348651 (select (store (arr!20427 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!782342 (= lt!348653 (array!42676 (store (arr!20427 a!3186) i!1173 k!2102) (size!20848 a!3186)))))

(declare-fun b!782343 () Bool)

(assert (=> b!782343 (= e!435027 (not e!435028))))

(declare-fun res!529360 () Bool)

(assert (=> b!782343 (=> res!529360 e!435028)))

(assert (=> b!782343 (= res!529360 (or (not (is-Intermediate!8027 lt!348654)) (bvslt x!1131 (x!65430 lt!348654)) (not (= x!1131 (x!65430 lt!348654))) (not (= index!1321 (index!34478 lt!348654)))))))

(assert (=> b!782343 e!435030))

(declare-fun res!529366 () Bool)

(assert (=> b!782343 (=> (not res!529366) (not e!435030))))

(declare-fun lt!348652 () SeekEntryResult!8027)

(assert (=> b!782343 (= res!529366 (= lt!348652 lt!348650))))

(assert (=> b!782343 (= lt!348650 (Found!8027 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42675 (_ BitVec 32)) SeekEntryResult!8027)

(assert (=> b!782343 (= lt!348652 (seekEntryOrOpen!0 (select (arr!20427 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42675 (_ BitVec 32)) Bool)

(assert (=> b!782343 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!348658 () Unit!26996)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42675 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26996)

(assert (=> b!782343 (= lt!348658 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!782344 () Bool)

(declare-fun res!529354 () Bool)

(assert (=> b!782344 (=> (not res!529354) (not e!435026))))

(declare-datatypes ((List!14429 0))(
  ( (Nil!14426) (Cons!14425 (h!15545 (_ BitVec 64)) (t!20744 List!14429)) )
))
(declare-fun arrayNoDuplicates!0 (array!42675 (_ BitVec 32) List!14429) Bool)

(assert (=> b!782344 (= res!529354 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14426))))

(declare-fun b!782345 () Bool)

(declare-fun Unit!26999 () Unit!26996)

(assert (=> b!782345 (= e!435024 Unit!26999)))

(assert (=> b!782345 false))

(declare-fun b!782346 () Bool)

(declare-fun res!529365 () Bool)

(assert (=> b!782346 (=> (not res!529365) (not e!435031))))

(declare-fun arrayContainsKey!0 (array!42675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!782346 (= res!529365 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!782347 () Bool)

(assert (=> b!782347 (= e!435026 e!435032)))

(declare-fun res!529367 () Bool)

(assert (=> b!782347 (=> (not res!529367) (not e!435032))))

(assert (=> b!782347 (= res!529367 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20427 a!3186) j!159) mask!3328) (select (arr!20427 a!3186) j!159) a!3186 mask!3328) lt!348656))))

(assert (=> b!782347 (= lt!348656 (Intermediate!8027 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!782348 () Bool)

(assert (=> b!782348 (= e!435031 e!435026)))

(declare-fun res!529351 () Bool)

(assert (=> b!782348 (=> (not res!529351) (not e!435026))))

(declare-fun lt!348657 () SeekEntryResult!8027)

(assert (=> b!782348 (= res!529351 (or (= lt!348657 (MissingZero!8027 i!1173)) (= lt!348657 (MissingVacant!8027 i!1173))))))

(assert (=> b!782348 (= lt!348657 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!529357 () Bool)

(assert (=> start!67572 (=> (not res!529357) (not e!435031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67572 (= res!529357 (validMask!0 mask!3328))))

(assert (=> start!67572 e!435031))

(assert (=> start!67572 true))

(declare-fun array_inv!16223 (array!42675) Bool)

(assert (=> start!67572 (array_inv!16223 a!3186)))

(declare-fun b!782349 () Bool)

(declare-fun res!529356 () Bool)

(assert (=> b!782349 (=> (not res!529356) (not e!435026))))

(assert (=> b!782349 (= res!529356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!67572 res!529357) b!782336))

(assert (= (and b!782336 res!529353) b!782341))

(assert (= (and b!782341 res!529358) b!782340))

(assert (= (and b!782340 res!529352) b!782346))

(assert (= (and b!782346 res!529365) b!782348))

(assert (= (and b!782348 res!529351) b!782349))

(assert (= (and b!782349 res!529356) b!782344))

(assert (= (and b!782344 res!529354) b!782339))

(assert (= (and b!782339 res!529363) b!782347))

(assert (= (and b!782347 res!529367) b!782333))

(assert (= (and b!782333 res!529364) b!782337))

(assert (= (and b!782337 c!86895) b!782335))

(assert (= (and b!782337 (not c!86895)) b!782332))

(assert (= (and b!782337 res!529359) b!782342))

(assert (= (and b!782342 res!529362) b!782343))

(assert (= (and b!782343 res!529366) b!782331))

(assert (= (and b!782343 (not res!529360)) b!782338))

(assert (= (and b!782338 (not res!529355)) b!782330))

(assert (= (and b!782330 (not res!529361)) b!782334))

(assert (= (and b!782334 c!86896) b!782345))

(assert (= (and b!782334 (not c!86896)) b!782329))

(declare-fun m!725147 () Bool)

(assert (=> b!782334 m!725147))

(declare-fun m!725149 () Bool)

(assert (=> b!782334 m!725149))

(declare-fun m!725151 () Bool)

(assert (=> b!782332 m!725151))

(assert (=> b!782332 m!725151))

(declare-fun m!725153 () Bool)

(assert (=> b!782332 m!725153))

(declare-fun m!725155 () Bool)

(assert (=> b!782346 m!725155))

(declare-fun m!725157 () Bool)

(assert (=> b!782333 m!725157))

(assert (=> b!782338 m!725151))

(assert (=> b!782338 m!725151))

(assert (=> b!782338 m!725153))

(assert (=> b!782343 m!725151))

(assert (=> b!782343 m!725151))

(declare-fun m!725159 () Bool)

(assert (=> b!782343 m!725159))

(declare-fun m!725161 () Bool)

(assert (=> b!782343 m!725161))

(declare-fun m!725163 () Bool)

(assert (=> b!782343 m!725163))

(assert (=> b!782342 m!725147))

(declare-fun m!725165 () Bool)

(assert (=> b!782342 m!725165))

(assert (=> b!782342 m!725165))

(declare-fun m!725167 () Bool)

(assert (=> b!782342 m!725167))

(declare-fun m!725169 () Bool)

(assert (=> b!782342 m!725169))

(declare-fun m!725171 () Bool)

(assert (=> b!782342 m!725171))

(declare-fun m!725173 () Bool)

(assert (=> b!782344 m!725173))

(declare-fun m!725175 () Bool)

(assert (=> start!67572 m!725175))

(declare-fun m!725177 () Bool)

(assert (=> start!67572 m!725177))

(assert (=> b!782341 m!725151))

(assert (=> b!782341 m!725151))

(declare-fun m!725179 () Bool)

(assert (=> b!782341 m!725179))

(assert (=> b!782331 m!725151))

(assert (=> b!782331 m!725151))

(declare-fun m!725181 () Bool)

(assert (=> b!782331 m!725181))

(assert (=> b!782330 m!725147))

(assert (=> b!782330 m!725149))

(declare-fun m!725183 () Bool)

(assert (=> b!782340 m!725183))

(assert (=> b!782335 m!725151))

(assert (=> b!782335 m!725151))

(declare-fun m!725185 () Bool)

(assert (=> b!782335 m!725185))

(declare-fun m!725187 () Bool)

(assert (=> b!782348 m!725187))

(assert (=> b!782347 m!725151))

(assert (=> b!782347 m!725151))

(declare-fun m!725189 () Bool)

(assert (=> b!782347 m!725189))

(assert (=> b!782347 m!725189))

(assert (=> b!782347 m!725151))

(declare-fun m!725191 () Bool)

(assert (=> b!782347 m!725191))

(declare-fun m!725193 () Bool)

(assert (=> b!782349 m!725193))

(push 1)

