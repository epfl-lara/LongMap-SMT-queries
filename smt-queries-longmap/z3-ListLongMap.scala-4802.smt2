; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65874 () Bool)

(assert start!65874)

(declare-fun res!513919 () Bool)

(declare-fun e!423346 () Bool)

(assert (=> start!65874 (=> (not res!513919) (not e!423346))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65874 (= res!513919 (validMask!0 mask!3328))))

(assert (=> start!65874 e!423346))

(assert (=> start!65874 true))

(declare-datatypes ((array!42047 0))(
  ( (array!42048 (arr!20137 (Array (_ BitVec 32) (_ BitVec 64))) (size!20558 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42047)

(declare-fun array_inv!15933 (array!42047) Bool)

(assert (=> start!65874 (array_inv!15933 a!3186)))

(declare-fun b!759401 () Bool)

(declare-fun e!423344 () Bool)

(declare-fun e!423345 () Bool)

(assert (=> b!759401 (= e!423344 e!423345)))

(declare-fun res!513914 () Bool)

(assert (=> b!759401 (=> (not res!513914) (not e!423345))))

(declare-fun lt!338390 () array!42047)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!338391 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7737 0))(
  ( (MissingZero!7737 (index!33316 (_ BitVec 32))) (Found!7737 (index!33317 (_ BitVec 32))) (Intermediate!7737 (undefined!8549 Bool) (index!33318 (_ BitVec 32)) (x!64199 (_ BitVec 32))) (Undefined!7737) (MissingVacant!7737 (index!33319 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42047 (_ BitVec 32)) SeekEntryResult!7737)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!759401 (= res!513914 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338391 mask!3328) lt!338391 lt!338390 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338391 lt!338390 mask!3328)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!759401 (= lt!338391 (select (store (arr!20137 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!759401 (= lt!338390 (array!42048 (store (arr!20137 a!3186) i!1173 k0!2102) (size!20558 a!3186)))))

(declare-fun b!759402 () Bool)

(declare-fun res!513911 () Bool)

(declare-fun e!423348 () Bool)

(assert (=> b!759402 (=> (not res!513911) (not e!423348))))

(declare-datatypes ((List!14139 0))(
  ( (Nil!14136) (Cons!14135 (h!15207 (_ BitVec 64)) (t!20454 List!14139)) )
))
(declare-fun arrayNoDuplicates!0 (array!42047 (_ BitVec 32) List!14139) Bool)

(assert (=> b!759402 (= res!513911 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14136))))

(declare-fun b!759403 () Bool)

(declare-fun res!513917 () Bool)

(assert (=> b!759403 (=> (not res!513917) (not e!423344))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!759403 (= res!513917 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20137 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!759404 () Bool)

(assert (=> b!759404 (= e!423345 (not true))))

(declare-fun e!423347 () Bool)

(assert (=> b!759404 e!423347))

(declare-fun res!513908 () Bool)

(assert (=> b!759404 (=> (not res!513908) (not e!423347))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42047 (_ BitVec 32)) Bool)

(assert (=> b!759404 (= res!513908 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26314 0))(
  ( (Unit!26315) )
))
(declare-fun lt!338388 () Unit!26314)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42047 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26314)

(assert (=> b!759404 (= lt!338388 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!759405 () Bool)

(declare-fun lt!338393 () SeekEntryResult!7737)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!423349 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42047 (_ BitVec 32)) SeekEntryResult!7737)

(assert (=> b!759405 (= e!423349 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20137 a!3186) j!159) a!3186 mask!3328) lt!338393))))

(declare-fun b!759406 () Bool)

(declare-fun res!513918 () Bool)

(assert (=> b!759406 (=> (not res!513918) (not e!423344))))

(declare-fun e!423343 () Bool)

(assert (=> b!759406 (= res!513918 e!423343)))

(declare-fun c!83128 () Bool)

(assert (=> b!759406 (= c!83128 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!759407 () Bool)

(declare-fun res!513906 () Bool)

(assert (=> b!759407 (=> (not res!513906) (not e!423348))))

(assert (=> b!759407 (= res!513906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!759408 () Bool)

(assert (=> b!759408 (= e!423346 e!423348)))

(declare-fun res!513910 () Bool)

(assert (=> b!759408 (=> (not res!513910) (not e!423348))))

(declare-fun lt!338392 () SeekEntryResult!7737)

(assert (=> b!759408 (= res!513910 (or (= lt!338392 (MissingZero!7737 i!1173)) (= lt!338392 (MissingVacant!7737 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42047 (_ BitVec 32)) SeekEntryResult!7737)

(assert (=> b!759408 (= lt!338392 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!759409 () Bool)

(declare-fun lt!338389 () SeekEntryResult!7737)

(assert (=> b!759409 (= e!423343 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20137 a!3186) j!159) a!3186 mask!3328) lt!338389))))

(declare-fun b!759410 () Bool)

(assert (=> b!759410 (= e!423347 e!423349)))

(declare-fun res!513912 () Bool)

(assert (=> b!759410 (=> (not res!513912) (not e!423349))))

(assert (=> b!759410 (= res!513912 (= (seekEntryOrOpen!0 (select (arr!20137 a!3186) j!159) a!3186 mask!3328) lt!338393))))

(assert (=> b!759410 (= lt!338393 (Found!7737 j!159))))

(declare-fun b!759411 () Bool)

(declare-fun res!513913 () Bool)

(assert (=> b!759411 (=> (not res!513913) (not e!423346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!759411 (= res!513913 (validKeyInArray!0 k0!2102))))

(declare-fun b!759412 () Bool)

(assert (=> b!759412 (= e!423348 e!423344)))

(declare-fun res!513907 () Bool)

(assert (=> b!759412 (=> (not res!513907) (not e!423344))))

(assert (=> b!759412 (= res!513907 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20137 a!3186) j!159) mask!3328) (select (arr!20137 a!3186) j!159) a!3186 mask!3328) lt!338389))))

(assert (=> b!759412 (= lt!338389 (Intermediate!7737 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!759413 () Bool)

(declare-fun res!513915 () Bool)

(assert (=> b!759413 (=> (not res!513915) (not e!423346))))

(assert (=> b!759413 (= res!513915 (and (= (size!20558 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20558 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20558 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!759414 () Bool)

(declare-fun res!513909 () Bool)

(assert (=> b!759414 (=> (not res!513909) (not e!423346))))

(declare-fun arrayContainsKey!0 (array!42047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!759414 (= res!513909 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!759415 () Bool)

(declare-fun res!513920 () Bool)

(assert (=> b!759415 (=> (not res!513920) (not e!423346))))

(assert (=> b!759415 (= res!513920 (validKeyInArray!0 (select (arr!20137 a!3186) j!159)))))

(declare-fun b!759416 () Bool)

(declare-fun res!513916 () Bool)

(assert (=> b!759416 (=> (not res!513916) (not e!423348))))

(assert (=> b!759416 (= res!513916 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20558 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20558 a!3186))))))

(declare-fun b!759417 () Bool)

(assert (=> b!759417 (= e!423343 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20137 a!3186) j!159) a!3186 mask!3328) (Found!7737 j!159)))))

(assert (= (and start!65874 res!513919) b!759413))

(assert (= (and b!759413 res!513915) b!759415))

(assert (= (and b!759415 res!513920) b!759411))

(assert (= (and b!759411 res!513913) b!759414))

(assert (= (and b!759414 res!513909) b!759408))

(assert (= (and b!759408 res!513910) b!759407))

(assert (= (and b!759407 res!513906) b!759402))

(assert (= (and b!759402 res!513911) b!759416))

(assert (= (and b!759416 res!513916) b!759412))

(assert (= (and b!759412 res!513907) b!759403))

(assert (= (and b!759403 res!513917) b!759406))

(assert (= (and b!759406 c!83128) b!759409))

(assert (= (and b!759406 (not c!83128)) b!759417))

(assert (= (and b!759406 res!513918) b!759401))

(assert (= (and b!759401 res!513914) b!759404))

(assert (= (and b!759404 res!513908) b!759410))

(assert (= (and b!759410 res!513912) b!759405))

(declare-fun m!706763 () Bool)

(assert (=> b!759410 m!706763))

(assert (=> b!759410 m!706763))

(declare-fun m!706765 () Bool)

(assert (=> b!759410 m!706765))

(assert (=> b!759405 m!706763))

(assert (=> b!759405 m!706763))

(declare-fun m!706767 () Bool)

(assert (=> b!759405 m!706767))

(assert (=> b!759409 m!706763))

(assert (=> b!759409 m!706763))

(declare-fun m!706769 () Bool)

(assert (=> b!759409 m!706769))

(declare-fun m!706771 () Bool)

(assert (=> b!759407 m!706771))

(declare-fun m!706773 () Bool)

(assert (=> b!759414 m!706773))

(declare-fun m!706775 () Bool)

(assert (=> b!759408 m!706775))

(declare-fun m!706777 () Bool)

(assert (=> b!759411 m!706777))

(assert (=> b!759417 m!706763))

(assert (=> b!759417 m!706763))

(declare-fun m!706779 () Bool)

(assert (=> b!759417 m!706779))

(assert (=> b!759415 m!706763))

(assert (=> b!759415 m!706763))

(declare-fun m!706781 () Bool)

(assert (=> b!759415 m!706781))

(assert (=> b!759412 m!706763))

(assert (=> b!759412 m!706763))

(declare-fun m!706783 () Bool)

(assert (=> b!759412 m!706783))

(assert (=> b!759412 m!706783))

(assert (=> b!759412 m!706763))

(declare-fun m!706785 () Bool)

(assert (=> b!759412 m!706785))

(declare-fun m!706787 () Bool)

(assert (=> start!65874 m!706787))

(declare-fun m!706789 () Bool)

(assert (=> start!65874 m!706789))

(declare-fun m!706791 () Bool)

(assert (=> b!759402 m!706791))

(declare-fun m!706793 () Bool)

(assert (=> b!759403 m!706793))

(declare-fun m!706795 () Bool)

(assert (=> b!759404 m!706795))

(declare-fun m!706797 () Bool)

(assert (=> b!759404 m!706797))

(declare-fun m!706799 () Bool)

(assert (=> b!759401 m!706799))

(declare-fun m!706801 () Bool)

(assert (=> b!759401 m!706801))

(declare-fun m!706803 () Bool)

(assert (=> b!759401 m!706803))

(assert (=> b!759401 m!706799))

(declare-fun m!706805 () Bool)

(assert (=> b!759401 m!706805))

(declare-fun m!706807 () Bool)

(assert (=> b!759401 m!706807))

(check-sat (not b!759409) (not b!759417) (not b!759401) (not b!759402) (not b!759410) (not b!759404) (not start!65874) (not b!759412) (not b!759405) (not b!759411) (not b!759408) (not b!759415) (not b!759414) (not b!759407))
(check-sat)
