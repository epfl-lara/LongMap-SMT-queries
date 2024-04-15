; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67670 () Bool)

(assert start!67670)

(declare-fun b!784336 () Bool)

(declare-fun res!530852 () Bool)

(declare-fun e!436063 () Bool)

(assert (=> b!784336 (=> (not res!530852) (not e!436063))))

(declare-datatypes ((array!42729 0))(
  ( (array!42730 (arr!20453 (Array (_ BitVec 32) (_ BitVec 64))) (size!20874 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42729)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!784336 (= res!530852 (and (= (size!20874 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20874 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20874 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784337 () Bool)

(declare-fun e!436055 () Bool)

(declare-fun e!436058 () Bool)

(assert (=> b!784337 (= e!436055 (not e!436058))))

(declare-fun res!530859 () Bool)

(assert (=> b!784337 (=> res!530859 e!436058)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8050 0))(
  ( (MissingZero!8050 (index!34568 (_ BitVec 32))) (Found!8050 (index!34569 (_ BitVec 32))) (Intermediate!8050 (undefined!8862 Bool) (index!34570 (_ BitVec 32)) (x!65529 (_ BitVec 32))) (Undefined!8050) (MissingVacant!8050 (index!34571 (_ BitVec 32))) )
))
(declare-fun lt!349524 () SeekEntryResult!8050)

(get-info :version)

(assert (=> b!784337 (= res!530859 (or (not ((_ is Intermediate!8050) lt!349524)) (bvslt x!1131 (x!65529 lt!349524)) (not (= x!1131 (x!65529 lt!349524))) (not (= index!1321 (index!34570 lt!349524)))))))

(declare-fun e!436066 () Bool)

(assert (=> b!784337 e!436066))

(declare-fun res!530847 () Bool)

(assert (=> b!784337 (=> (not res!530847) (not e!436066))))

(declare-fun lt!349527 () SeekEntryResult!8050)

(declare-fun lt!349528 () SeekEntryResult!8050)

(assert (=> b!784337 (= res!530847 (= lt!349527 lt!349528))))

(assert (=> b!784337 (= lt!349528 (Found!8050 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42729 (_ BitVec 32)) SeekEntryResult!8050)

(assert (=> b!784337 (= lt!349527 (seekEntryOrOpen!0 (select (arr!20453 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42729 (_ BitVec 32)) Bool)

(assert (=> b!784337 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27068 0))(
  ( (Unit!27069) )
))
(declare-fun lt!349521 () Unit!27068)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42729 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27068)

(assert (=> b!784337 (= lt!349521 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784338 () Bool)

(declare-fun res!530858 () Bool)

(declare-fun e!436056 () Bool)

(assert (=> b!784338 (=> (not res!530858) (not e!436056))))

(declare-datatypes ((List!14494 0))(
  ( (Nil!14491) (Cons!14490 (h!15613 (_ BitVec 64)) (t!20800 List!14494)) )
))
(declare-fun arrayNoDuplicates!0 (array!42729 (_ BitVec 32) List!14494) Bool)

(assert (=> b!784338 (= res!530858 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14491))))

(declare-fun b!784339 () Bool)

(declare-fun e!436062 () Bool)

(assert (=> b!784339 (= e!436062 true)))

(declare-fun e!436061 () Bool)

(assert (=> b!784339 e!436061))

(declare-fun res!530851 () Bool)

(assert (=> b!784339 (=> (not res!530851) (not e!436061))))

(declare-fun lt!349529 () (_ BitVec 64))

(assert (=> b!784339 (= res!530851 (= lt!349529 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349531 () Unit!27068)

(declare-fun e!436064 () Unit!27068)

(assert (=> b!784339 (= lt!349531 e!436064)))

(declare-fun c!87152 () Bool)

(assert (=> b!784339 (= c!87152 (= lt!349529 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784340 () Bool)

(declare-fun Unit!27070 () Unit!27068)

(assert (=> b!784340 (= e!436064 Unit!27070)))

(assert (=> b!784340 false))

(declare-fun b!784341 () Bool)

(assert (=> b!784341 (= e!436063 e!436056)))

(declare-fun res!530860 () Bool)

(assert (=> b!784341 (=> (not res!530860) (not e!436056))))

(declare-fun lt!349522 () SeekEntryResult!8050)

(assert (=> b!784341 (= res!530860 (or (= lt!349522 (MissingZero!8050 i!1173)) (= lt!349522 (MissingVacant!8050 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!784341 (= lt!349522 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!784342 () Bool)

(declare-fun res!530849 () Bool)

(assert (=> b!784342 (=> (not res!530849) (not e!436056))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784342 (= res!530849 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20874 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20874 a!3186))))))

(declare-fun b!784343 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42729 (_ BitVec 32)) SeekEntryResult!8050)

(assert (=> b!784343 (= e!436066 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20453 a!3186) j!159) a!3186 mask!3328) lt!349528))))

(declare-fun b!784344 () Bool)

(declare-fun lt!349532 () SeekEntryResult!8050)

(assert (=> b!784344 (= e!436061 (= lt!349527 lt!349532))))

(declare-fun b!784346 () Bool)

(declare-fun e!436057 () Bool)

(assert (=> b!784346 (= e!436056 e!436057)))

(declare-fun res!530848 () Bool)

(assert (=> b!784346 (=> (not res!530848) (not e!436057))))

(declare-fun lt!349526 () SeekEntryResult!8050)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42729 (_ BitVec 32)) SeekEntryResult!8050)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784346 (= res!530848 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20453 a!3186) j!159) mask!3328) (select (arr!20453 a!3186) j!159) a!3186 mask!3328) lt!349526))))

(assert (=> b!784346 (= lt!349526 (Intermediate!8050 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!784347 () Bool)

(declare-fun res!530855 () Bool)

(assert (=> b!784347 (=> (not res!530855) (not e!436056))))

(assert (=> b!784347 (= res!530855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!784348 () Bool)

(assert (=> b!784348 (= e!436057 e!436055)))

(declare-fun res!530853 () Bool)

(assert (=> b!784348 (=> (not res!530853) (not e!436055))))

(declare-fun lt!349530 () SeekEntryResult!8050)

(assert (=> b!784348 (= res!530853 (= lt!349530 lt!349524))))

(declare-fun lt!349523 () array!42729)

(declare-fun lt!349525 () (_ BitVec 64))

(assert (=> b!784348 (= lt!349524 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349525 lt!349523 mask!3328))))

(assert (=> b!784348 (= lt!349530 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349525 mask!3328) lt!349525 lt!349523 mask!3328))))

(assert (=> b!784348 (= lt!349525 (select (store (arr!20453 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!784348 (= lt!349523 (array!42730 (store (arr!20453 a!3186) i!1173 k0!2102) (size!20874 a!3186)))))

(declare-fun b!784349 () Bool)

(declare-fun res!530854 () Bool)

(assert (=> b!784349 (=> (not res!530854) (not e!436057))))

(declare-fun e!436060 () Bool)

(assert (=> b!784349 (= res!530854 e!436060)))

(declare-fun c!87153 () Bool)

(assert (=> b!784349 (= c!87153 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!784350 () Bool)

(declare-fun res!530850 () Bool)

(assert (=> b!784350 (=> (not res!530850) (not e!436063))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784350 (= res!530850 (validKeyInArray!0 (select (arr!20453 a!3186) j!159)))))

(declare-fun b!784351 () Bool)

(declare-fun res!530864 () Bool)

(assert (=> b!784351 (=> (not res!530864) (not e!436061))))

(assert (=> b!784351 (= res!530864 (= (seekEntryOrOpen!0 lt!349525 lt!349523 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349525 lt!349523 mask!3328)))))

(declare-fun b!784352 () Bool)

(declare-fun Unit!27071 () Unit!27068)

(assert (=> b!784352 (= e!436064 Unit!27071)))

(declare-fun b!784353 () Bool)

(declare-fun e!436065 () Bool)

(assert (=> b!784353 (= e!436065 e!436062)))

(declare-fun res!530861 () Bool)

(assert (=> b!784353 (=> res!530861 e!436062)))

(assert (=> b!784353 (= res!530861 (= lt!349529 lt!349525))))

(assert (=> b!784353 (= lt!349529 (select (store (arr!20453 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!784354 () Bool)

(assert (=> b!784354 (= e!436060 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20453 a!3186) j!159) a!3186 mask!3328) (Found!8050 j!159)))))

(declare-fun b!784345 () Bool)

(assert (=> b!784345 (= e!436058 e!436065)))

(declare-fun res!530863 () Bool)

(assert (=> b!784345 (=> res!530863 e!436065)))

(assert (=> b!784345 (= res!530863 (not (= lt!349532 lt!349528)))))

(assert (=> b!784345 (= lt!349532 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20453 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!530862 () Bool)

(assert (=> start!67670 (=> (not res!530862) (not e!436063))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67670 (= res!530862 (validMask!0 mask!3328))))

(assert (=> start!67670 e!436063))

(assert (=> start!67670 true))

(declare-fun array_inv!16336 (array!42729) Bool)

(assert (=> start!67670 (array_inv!16336 a!3186)))

(declare-fun b!784355 () Bool)

(declare-fun res!530856 () Bool)

(assert (=> b!784355 (=> (not res!530856) (not e!436057))))

(assert (=> b!784355 (= res!530856 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20453 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784356 () Bool)

(declare-fun res!530865 () Bool)

(assert (=> b!784356 (=> (not res!530865) (not e!436063))))

(declare-fun arrayContainsKey!0 (array!42729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784356 (= res!530865 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784357 () Bool)

(assert (=> b!784357 (= e!436060 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20453 a!3186) j!159) a!3186 mask!3328) lt!349526))))

(declare-fun b!784358 () Bool)

(declare-fun res!530857 () Bool)

(assert (=> b!784358 (=> (not res!530857) (not e!436063))))

(assert (=> b!784358 (= res!530857 (validKeyInArray!0 k0!2102))))

(assert (= (and start!67670 res!530862) b!784336))

(assert (= (and b!784336 res!530852) b!784350))

(assert (= (and b!784350 res!530850) b!784358))

(assert (= (and b!784358 res!530857) b!784356))

(assert (= (and b!784356 res!530865) b!784341))

(assert (= (and b!784341 res!530860) b!784347))

(assert (= (and b!784347 res!530855) b!784338))

(assert (= (and b!784338 res!530858) b!784342))

(assert (= (and b!784342 res!530849) b!784346))

(assert (= (and b!784346 res!530848) b!784355))

(assert (= (and b!784355 res!530856) b!784349))

(assert (= (and b!784349 c!87153) b!784357))

(assert (= (and b!784349 (not c!87153)) b!784354))

(assert (= (and b!784349 res!530854) b!784348))

(assert (= (and b!784348 res!530853) b!784337))

(assert (= (and b!784337 res!530847) b!784343))

(assert (= (and b!784337 (not res!530859)) b!784345))

(assert (= (and b!784345 (not res!530863)) b!784353))

(assert (= (and b!784353 (not res!530861)) b!784339))

(assert (= (and b!784339 c!87152) b!784340))

(assert (= (and b!784339 (not c!87152)) b!784352))

(assert (= (and b!784339 res!530851) b!784351))

(assert (= (and b!784351 res!530864) b!784344))

(declare-fun m!726111 () Bool)

(assert (=> b!784341 m!726111))

(declare-fun m!726113 () Bool)

(assert (=> b!784353 m!726113))

(declare-fun m!726115 () Bool)

(assert (=> b!784353 m!726115))

(declare-fun m!726117 () Bool)

(assert (=> b!784351 m!726117))

(declare-fun m!726119 () Bool)

(assert (=> b!784351 m!726119))

(declare-fun m!726121 () Bool)

(assert (=> b!784345 m!726121))

(assert (=> b!784345 m!726121))

(declare-fun m!726123 () Bool)

(assert (=> b!784345 m!726123))

(declare-fun m!726125 () Bool)

(assert (=> start!67670 m!726125))

(declare-fun m!726127 () Bool)

(assert (=> start!67670 m!726127))

(declare-fun m!726129 () Bool)

(assert (=> b!784356 m!726129))

(assert (=> b!784346 m!726121))

(assert (=> b!784346 m!726121))

(declare-fun m!726131 () Bool)

(assert (=> b!784346 m!726131))

(assert (=> b!784346 m!726131))

(assert (=> b!784346 m!726121))

(declare-fun m!726133 () Bool)

(assert (=> b!784346 m!726133))

(declare-fun m!726135 () Bool)

(assert (=> b!784358 m!726135))

(assert (=> b!784354 m!726121))

(assert (=> b!784354 m!726121))

(assert (=> b!784354 m!726123))

(assert (=> b!784350 m!726121))

(assert (=> b!784350 m!726121))

(declare-fun m!726137 () Bool)

(assert (=> b!784350 m!726137))

(assert (=> b!784343 m!726121))

(assert (=> b!784343 m!726121))

(declare-fun m!726139 () Bool)

(assert (=> b!784343 m!726139))

(declare-fun m!726141 () Bool)

(assert (=> b!784338 m!726141))

(declare-fun m!726143 () Bool)

(assert (=> b!784355 m!726143))

(assert (=> b!784337 m!726121))

(assert (=> b!784337 m!726121))

(declare-fun m!726145 () Bool)

(assert (=> b!784337 m!726145))

(declare-fun m!726147 () Bool)

(assert (=> b!784337 m!726147))

(declare-fun m!726149 () Bool)

(assert (=> b!784337 m!726149))

(declare-fun m!726151 () Bool)

(assert (=> b!784348 m!726151))

(declare-fun m!726153 () Bool)

(assert (=> b!784348 m!726153))

(declare-fun m!726155 () Bool)

(assert (=> b!784348 m!726155))

(assert (=> b!784348 m!726151))

(assert (=> b!784348 m!726113))

(declare-fun m!726157 () Bool)

(assert (=> b!784348 m!726157))

(declare-fun m!726159 () Bool)

(assert (=> b!784347 m!726159))

(assert (=> b!784357 m!726121))

(assert (=> b!784357 m!726121))

(declare-fun m!726161 () Bool)

(assert (=> b!784357 m!726161))

(check-sat (not b!784346) (not b!784351) (not b!784348) (not b!784343) (not b!784356) (not b!784341) (not b!784337) (not b!784354) (not b!784357) (not b!784350) (not b!784358) (not b!784345) (not b!784347) (not start!67670) (not b!784338))
(check-sat)
