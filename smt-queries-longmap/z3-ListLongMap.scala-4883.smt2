; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67462 () Bool)

(assert start!67462)

(declare-fun b!779335 () Bool)

(declare-fun res!527009 () Bool)

(declare-fun e!433657 () Bool)

(assert (=> b!779335 (=> (not res!527009) (not e!433657))))

(declare-datatypes ((array!42571 0))(
  ( (array!42572 (arr!20374 (Array (_ BitVec 32) (_ BitVec 64))) (size!20794 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42571)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42571 (_ BitVec 32)) Bool)

(assert (=> b!779335 (= res!527009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779336 () Bool)

(declare-fun res!527013 () Bool)

(declare-fun e!433655 () Bool)

(assert (=> b!779336 (=> (not res!527013) (not e!433655))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779336 (= res!527013 (validKeyInArray!0 k0!2102))))

(declare-fun b!779337 () Bool)

(declare-fun res!527015 () Bool)

(assert (=> b!779337 (=> (not res!527015) (not e!433655))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!779337 (= res!527015 (and (= (size!20794 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20794 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20794 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!779338 () Bool)

(declare-fun res!527012 () Bool)

(assert (=> b!779338 (=> (not res!527012) (not e!433657))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!779338 (= res!527012 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20794 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20794 a!3186))))))

(declare-fun b!779339 () Bool)

(declare-fun res!527006 () Bool)

(declare-fun e!433656 () Bool)

(assert (=> b!779339 (=> (not res!527006) (not e!433656))))

(declare-fun e!433651 () Bool)

(assert (=> b!779339 (= res!527006 e!433651)))

(declare-fun c!86573 () Bool)

(assert (=> b!779339 (= c!86573 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!779340 () Bool)

(declare-fun e!433653 () Bool)

(declare-fun e!433652 () Bool)

(assert (=> b!779340 (= e!433653 (not e!433652))))

(declare-fun res!527003 () Bool)

(assert (=> b!779340 (=> res!527003 e!433652)))

(declare-datatypes ((SeekEntryResult!7930 0))(
  ( (MissingZero!7930 (index!34088 (_ BitVec 32))) (Found!7930 (index!34089 (_ BitVec 32))) (Intermediate!7930 (undefined!8742 Bool) (index!34090 (_ BitVec 32)) (x!65198 (_ BitVec 32))) (Undefined!7930) (MissingVacant!7930 (index!34091 (_ BitVec 32))) )
))
(declare-fun lt!347194 () SeekEntryResult!7930)

(get-info :version)

(assert (=> b!779340 (= res!527003 (or (not ((_ is Intermediate!7930) lt!347194)) (bvslt x!1131 (x!65198 lt!347194)) (not (= x!1131 (x!65198 lt!347194))) (not (= index!1321 (index!34090 lt!347194)))))))

(declare-fun e!433650 () Bool)

(assert (=> b!779340 e!433650))

(declare-fun res!527001 () Bool)

(assert (=> b!779340 (=> (not res!527001) (not e!433650))))

(assert (=> b!779340 (= res!527001 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26833 0))(
  ( (Unit!26834) )
))
(declare-fun lt!347187 () Unit!26833)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42571 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26833)

(assert (=> b!779340 (= lt!347187 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!779341 () Bool)

(declare-fun res!527002 () Bool)

(assert (=> b!779341 (=> (not res!527002) (not e!433655))))

(declare-fun arrayContainsKey!0 (array!42571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779341 (= res!527002 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779342 () Bool)

(assert (=> b!779342 (= e!433657 e!433656)))

(declare-fun res!527004 () Bool)

(assert (=> b!779342 (=> (not res!527004) (not e!433656))))

(declare-fun lt!347188 () SeekEntryResult!7930)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42571 (_ BitVec 32)) SeekEntryResult!7930)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779342 (= res!527004 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20374 a!3186) j!159) mask!3328) (select (arr!20374 a!3186) j!159) a!3186 mask!3328) lt!347188))))

(assert (=> b!779342 (= lt!347188 (Intermediate!7930 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!779343 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42571 (_ BitVec 32)) SeekEntryResult!7930)

(assert (=> b!779343 (= e!433651 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20374 a!3186) j!159) a!3186 mask!3328) (Found!7930 j!159)))))

(declare-fun b!779344 () Bool)

(assert (=> b!779344 (= e!433655 e!433657)))

(declare-fun res!527008 () Bool)

(assert (=> b!779344 (=> (not res!527008) (not e!433657))))

(declare-fun lt!347192 () SeekEntryResult!7930)

(assert (=> b!779344 (= res!527008 (or (= lt!347192 (MissingZero!7930 i!1173)) (= lt!347192 (MissingVacant!7930 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42571 (_ BitVec 32)) SeekEntryResult!7930)

(assert (=> b!779344 (= lt!347192 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!779346 () Bool)

(declare-fun res!527016 () Bool)

(assert (=> b!779346 (=> (not res!527016) (not e!433656))))

(assert (=> b!779346 (= res!527016 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20374 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779347 () Bool)

(declare-fun e!433654 () Bool)

(assert (=> b!779347 (= e!433650 e!433654)))

(declare-fun res!527005 () Bool)

(assert (=> b!779347 (=> (not res!527005) (not e!433654))))

(declare-fun lt!347193 () SeekEntryResult!7930)

(assert (=> b!779347 (= res!527005 (= (seekEntryOrOpen!0 (select (arr!20374 a!3186) j!159) a!3186 mask!3328) lt!347193))))

(assert (=> b!779347 (= lt!347193 (Found!7930 j!159))))

(declare-fun b!779348 () Bool)

(declare-fun res!527010 () Bool)

(assert (=> b!779348 (=> (not res!527010) (not e!433655))))

(assert (=> b!779348 (= res!527010 (validKeyInArray!0 (select (arr!20374 a!3186) j!159)))))

(declare-fun b!779349 () Bool)

(assert (=> b!779349 (= e!433651 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20374 a!3186) j!159) a!3186 mask!3328) lt!347188))))

(declare-fun b!779350 () Bool)

(assert (=> b!779350 (= e!433654 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20374 a!3186) j!159) a!3186 mask!3328) lt!347193))))

(declare-fun b!779351 () Bool)

(declare-fun res!527014 () Bool)

(assert (=> b!779351 (=> (not res!527014) (not e!433657))))

(declare-datatypes ((List!14283 0))(
  ( (Nil!14280) (Cons!14279 (h!15399 (_ BitVec 64)) (t!20590 List!14283)) )
))
(declare-fun arrayNoDuplicates!0 (array!42571 (_ BitVec 32) List!14283) Bool)

(assert (=> b!779351 (= res!527014 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14280))))

(declare-fun b!779352 () Bool)

(assert (=> b!779352 (= e!433652 true)))

(declare-fun lt!347190 () SeekEntryResult!7930)

(assert (=> b!779352 (= lt!347190 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20374 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779345 () Bool)

(assert (=> b!779345 (= e!433656 e!433653)))

(declare-fun res!527011 () Bool)

(assert (=> b!779345 (=> (not res!527011) (not e!433653))))

(declare-fun lt!347186 () SeekEntryResult!7930)

(assert (=> b!779345 (= res!527011 (= lt!347186 lt!347194))))

(declare-fun lt!347189 () (_ BitVec 64))

(declare-fun lt!347191 () array!42571)

(assert (=> b!779345 (= lt!347194 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347189 lt!347191 mask!3328))))

(assert (=> b!779345 (= lt!347186 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347189 mask!3328) lt!347189 lt!347191 mask!3328))))

(assert (=> b!779345 (= lt!347189 (select (store (arr!20374 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!779345 (= lt!347191 (array!42572 (store (arr!20374 a!3186) i!1173 k0!2102) (size!20794 a!3186)))))

(declare-fun res!527007 () Bool)

(assert (=> start!67462 (=> (not res!527007) (not e!433655))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67462 (= res!527007 (validMask!0 mask!3328))))

(assert (=> start!67462 e!433655))

(assert (=> start!67462 true))

(declare-fun array_inv!16233 (array!42571) Bool)

(assert (=> start!67462 (array_inv!16233 a!3186)))

(assert (= (and start!67462 res!527007) b!779337))

(assert (= (and b!779337 res!527015) b!779348))

(assert (= (and b!779348 res!527010) b!779336))

(assert (= (and b!779336 res!527013) b!779341))

(assert (= (and b!779341 res!527002) b!779344))

(assert (= (and b!779344 res!527008) b!779335))

(assert (= (and b!779335 res!527009) b!779351))

(assert (= (and b!779351 res!527014) b!779338))

(assert (= (and b!779338 res!527012) b!779342))

(assert (= (and b!779342 res!527004) b!779346))

(assert (= (and b!779346 res!527016) b!779339))

(assert (= (and b!779339 c!86573) b!779349))

(assert (= (and b!779339 (not c!86573)) b!779343))

(assert (= (and b!779339 res!527006) b!779345))

(assert (= (and b!779345 res!527011) b!779340))

(assert (= (and b!779340 res!527001) b!779347))

(assert (= (and b!779347 res!527005) b!779350))

(assert (= (and b!779340 (not res!527003)) b!779352))

(declare-fun m!723365 () Bool)

(assert (=> b!779335 m!723365))

(declare-fun m!723367 () Bool)

(assert (=> b!779336 m!723367))

(declare-fun m!723369 () Bool)

(assert (=> b!779351 m!723369))

(declare-fun m!723371 () Bool)

(assert (=> b!779342 m!723371))

(assert (=> b!779342 m!723371))

(declare-fun m!723373 () Bool)

(assert (=> b!779342 m!723373))

(assert (=> b!779342 m!723373))

(assert (=> b!779342 m!723371))

(declare-fun m!723375 () Bool)

(assert (=> b!779342 m!723375))

(assert (=> b!779349 m!723371))

(assert (=> b!779349 m!723371))

(declare-fun m!723377 () Bool)

(assert (=> b!779349 m!723377))

(assert (=> b!779352 m!723371))

(assert (=> b!779352 m!723371))

(declare-fun m!723379 () Bool)

(assert (=> b!779352 m!723379))

(declare-fun m!723381 () Bool)

(assert (=> b!779340 m!723381))

(declare-fun m!723383 () Bool)

(assert (=> b!779340 m!723383))

(declare-fun m!723385 () Bool)

(assert (=> b!779344 m!723385))

(declare-fun m!723387 () Bool)

(assert (=> b!779346 m!723387))

(assert (=> b!779343 m!723371))

(assert (=> b!779343 m!723371))

(assert (=> b!779343 m!723379))

(declare-fun m!723389 () Bool)

(assert (=> start!67462 m!723389))

(declare-fun m!723391 () Bool)

(assert (=> start!67462 m!723391))

(assert (=> b!779347 m!723371))

(assert (=> b!779347 m!723371))

(declare-fun m!723393 () Bool)

(assert (=> b!779347 m!723393))

(assert (=> b!779348 m!723371))

(assert (=> b!779348 m!723371))

(declare-fun m!723395 () Bool)

(assert (=> b!779348 m!723395))

(declare-fun m!723397 () Bool)

(assert (=> b!779341 m!723397))

(assert (=> b!779350 m!723371))

(assert (=> b!779350 m!723371))

(declare-fun m!723399 () Bool)

(assert (=> b!779350 m!723399))

(declare-fun m!723401 () Bool)

(assert (=> b!779345 m!723401))

(declare-fun m!723403 () Bool)

(assert (=> b!779345 m!723403))

(declare-fun m!723405 () Bool)

(assert (=> b!779345 m!723405))

(assert (=> b!779345 m!723403))

(declare-fun m!723407 () Bool)

(assert (=> b!779345 m!723407))

(declare-fun m!723409 () Bool)

(assert (=> b!779345 m!723409))

(check-sat (not b!779335) (not b!779349) (not b!779348) (not b!779343) (not b!779345) (not b!779344) (not b!779340) (not b!779336) (not b!779347) (not b!779341) (not b!779350) (not b!779342) (not b!779351) (not start!67462) (not b!779352))
(check-sat)
