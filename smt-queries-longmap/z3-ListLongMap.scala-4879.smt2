; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67232 () Bool)

(assert start!67232)

(declare-fun b!777289 () Bool)

(declare-fun res!525857 () Bool)

(declare-fun e!432501 () Bool)

(assert (=> b!777289 (=> (not res!525857) (not e!432501))))

(declare-fun e!432499 () Bool)

(assert (=> b!777289 (= res!525857 e!432499)))

(declare-fun c!86121 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!777289 (= c!86121 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!777290 () Bool)

(declare-fun e!432498 () Bool)

(assert (=> b!777290 (= e!432501 e!432498)))

(declare-fun res!525865 () Bool)

(assert (=> b!777290 (=> (not res!525865) (not e!432498))))

(declare-datatypes ((SeekEntryResult!7963 0))(
  ( (MissingZero!7963 (index!34220 (_ BitVec 32))) (Found!7963 (index!34221 (_ BitVec 32))) (Intermediate!7963 (undefined!8775 Bool) (index!34222 (_ BitVec 32)) (x!65174 (_ BitVec 32))) (Undefined!7963) (MissingVacant!7963 (index!34223 (_ BitVec 32))) )
))
(declare-fun lt!346174 () SeekEntryResult!7963)

(declare-fun lt!346170 () SeekEntryResult!7963)

(assert (=> b!777290 (= res!525865 (= lt!346174 lt!346170))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!42543 0))(
  ( (array!42544 (arr!20366 (Array (_ BitVec 32) (_ BitVec 64))) (size!20787 (_ BitVec 32))) )
))
(declare-fun lt!346169 () array!42543)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!346168 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42543 (_ BitVec 32)) SeekEntryResult!7963)

(assert (=> b!777290 (= lt!346170 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346168 lt!346169 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!777290 (= lt!346174 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346168 mask!3328) lt!346168 lt!346169 mask!3328))))

(declare-fun a!3186 () array!42543)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!777290 (= lt!346168 (select (store (arr!20366 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!777290 (= lt!346169 (array!42544 (store (arr!20366 a!3186) i!1173 k0!2102) (size!20787 a!3186)))))

(declare-fun b!777291 () Bool)

(declare-fun res!525859 () Bool)

(declare-fun e!432496 () Bool)

(assert (=> b!777291 (=> (not res!525859) (not e!432496))))

(declare-datatypes ((List!14407 0))(
  ( (Nil!14404) (Cons!14403 (h!15514 (_ BitVec 64)) (t!20713 List!14407)) )
))
(declare-fun arrayNoDuplicates!0 (array!42543 (_ BitVec 32) List!14407) Bool)

(assert (=> b!777291 (= res!525859 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14404))))

(declare-fun b!777292 () Bool)

(declare-fun res!525863 () Bool)

(assert (=> b!777292 (=> (not res!525863) (not e!432496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42543 (_ BitVec 32)) Bool)

(assert (=> b!777292 (= res!525863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!777293 () Bool)

(declare-fun res!525852 () Bool)

(declare-fun e!432495 () Bool)

(assert (=> b!777293 (=> (not res!525852) (not e!432495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!777293 (= res!525852 (validKeyInArray!0 (select (arr!20366 a!3186) j!159)))))

(declare-fun b!777294 () Bool)

(assert (=> b!777294 (= e!432496 e!432501)))

(declare-fun res!525867 () Bool)

(assert (=> b!777294 (=> (not res!525867) (not e!432501))))

(declare-fun lt!346167 () SeekEntryResult!7963)

(assert (=> b!777294 (= res!525867 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20366 a!3186) j!159) mask!3328) (select (arr!20366 a!3186) j!159) a!3186 mask!3328) lt!346167))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!777294 (= lt!346167 (Intermediate!7963 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!777295 () Bool)

(declare-fun res!525855 () Bool)

(assert (=> b!777295 (=> (not res!525855) (not e!432495))))

(declare-fun arrayContainsKey!0 (array!42543 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!777295 (= res!525855 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!777296 () Bool)

(declare-fun lt!346172 () SeekEntryResult!7963)

(declare-fun e!432502 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42543 (_ BitVec 32)) SeekEntryResult!7963)

(assert (=> b!777296 (= e!432502 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20366 a!3186) j!159) a!3186 mask!3328) lt!346172))))

(declare-fun b!777297 () Bool)

(declare-fun e!432494 () Bool)

(assert (=> b!777297 (= e!432498 (not e!432494))))

(declare-fun res!525856 () Bool)

(assert (=> b!777297 (=> res!525856 e!432494)))

(get-info :version)

(assert (=> b!777297 (= res!525856 (or (not ((_ is Intermediate!7963) lt!346170)) (bvslt x!1131 (x!65174 lt!346170)) (not (= x!1131 (x!65174 lt!346170))) (not (= index!1321 (index!34222 lt!346170)))))))

(declare-fun e!432497 () Bool)

(assert (=> b!777297 e!432497))

(declare-fun res!525860 () Bool)

(assert (=> b!777297 (=> (not res!525860) (not e!432497))))

(assert (=> b!777297 (= res!525860 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26792 0))(
  ( (Unit!26793) )
))
(declare-fun lt!346175 () Unit!26792)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42543 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26792)

(assert (=> b!777297 (= lt!346175 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!777298 () Bool)

(assert (=> b!777298 (= e!432495 e!432496)))

(declare-fun res!525862 () Bool)

(assert (=> b!777298 (=> (not res!525862) (not e!432496))))

(declare-fun lt!346173 () SeekEntryResult!7963)

(assert (=> b!777298 (= res!525862 (or (= lt!346173 (MissingZero!7963 i!1173)) (= lt!346173 (MissingVacant!7963 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42543 (_ BitVec 32)) SeekEntryResult!7963)

(assert (=> b!777298 (= lt!346173 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!777299 () Bool)

(declare-fun res!525864 () Bool)

(assert (=> b!777299 (=> (not res!525864) (not e!432496))))

(assert (=> b!777299 (= res!525864 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20787 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20787 a!3186))))))

(declare-fun b!777300 () Bool)

(assert (=> b!777300 (= e!432499 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20366 a!3186) j!159) a!3186 mask!3328) lt!346167))))

(declare-fun b!777301 () Bool)

(declare-fun res!525854 () Bool)

(assert (=> b!777301 (=> res!525854 e!432494)))

(assert (=> b!777301 (= res!525854 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20366 a!3186) j!159) a!3186 mask!3328) (Found!7963 j!159))))))

(declare-fun b!777302 () Bool)

(declare-fun res!525850 () Bool)

(assert (=> b!777302 (=> (not res!525850) (not e!432495))))

(assert (=> b!777302 (= res!525850 (validKeyInArray!0 k0!2102))))

(declare-fun b!777303 () Bool)

(assert (=> b!777303 (= e!432497 e!432502)))

(declare-fun res!525851 () Bool)

(assert (=> b!777303 (=> (not res!525851) (not e!432502))))

(assert (=> b!777303 (= res!525851 (= (seekEntryOrOpen!0 (select (arr!20366 a!3186) j!159) a!3186 mask!3328) lt!346172))))

(assert (=> b!777303 (= lt!346172 (Found!7963 j!159))))

(declare-fun b!777304 () Bool)

(assert (=> b!777304 (= e!432494 true)))

(declare-fun lt!346171 () SeekEntryResult!7963)

(assert (=> b!777304 (= lt!346171 (seekEntryOrOpen!0 lt!346168 lt!346169 mask!3328))))

(declare-fun b!777305 () Bool)

(assert (=> b!777305 (= e!432499 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20366 a!3186) j!159) a!3186 mask!3328) (Found!7963 j!159)))))

(declare-fun b!777306 () Bool)

(declare-fun res!525853 () Bool)

(assert (=> b!777306 (=> res!525853 e!432494)))

(assert (=> b!777306 (= res!525853 (or (not (= (select (store (arr!20366 a!3186) i!1173 k0!2102) index!1321) lt!346168)) (undefined!8775 lt!346170)))))

(declare-fun b!777307 () Bool)

(declare-fun res!525861 () Bool)

(assert (=> b!777307 (=> (not res!525861) (not e!432501))))

(assert (=> b!777307 (= res!525861 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20366 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!525858 () Bool)

(assert (=> start!67232 (=> (not res!525858) (not e!432495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67232 (= res!525858 (validMask!0 mask!3328))))

(assert (=> start!67232 e!432495))

(assert (=> start!67232 true))

(declare-fun array_inv!16249 (array!42543) Bool)

(assert (=> start!67232 (array_inv!16249 a!3186)))

(declare-fun b!777308 () Bool)

(declare-fun res!525866 () Bool)

(assert (=> b!777308 (=> (not res!525866) (not e!432495))))

(assert (=> b!777308 (= res!525866 (and (= (size!20787 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20787 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20787 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!67232 res!525858) b!777308))

(assert (= (and b!777308 res!525866) b!777293))

(assert (= (and b!777293 res!525852) b!777302))

(assert (= (and b!777302 res!525850) b!777295))

(assert (= (and b!777295 res!525855) b!777298))

(assert (= (and b!777298 res!525862) b!777292))

(assert (= (and b!777292 res!525863) b!777291))

(assert (= (and b!777291 res!525859) b!777299))

(assert (= (and b!777299 res!525864) b!777294))

(assert (= (and b!777294 res!525867) b!777307))

(assert (= (and b!777307 res!525861) b!777289))

(assert (= (and b!777289 c!86121) b!777300))

(assert (= (and b!777289 (not c!86121)) b!777305))

(assert (= (and b!777289 res!525857) b!777290))

(assert (= (and b!777290 res!525865) b!777297))

(assert (= (and b!777297 res!525860) b!777303))

(assert (= (and b!777303 res!525851) b!777296))

(assert (= (and b!777297 (not res!525856)) b!777301))

(assert (= (and b!777301 (not res!525854)) b!777306))

(assert (= (and b!777306 (not res!525853)) b!777304))

(declare-fun m!720633 () Bool)

(assert (=> b!777298 m!720633))

(declare-fun m!720635 () Bool)

(assert (=> b!777301 m!720635))

(assert (=> b!777301 m!720635))

(declare-fun m!720637 () Bool)

(assert (=> b!777301 m!720637))

(declare-fun m!720639 () Bool)

(assert (=> b!777292 m!720639))

(assert (=> b!777296 m!720635))

(assert (=> b!777296 m!720635))

(declare-fun m!720641 () Bool)

(assert (=> b!777296 m!720641))

(declare-fun m!720643 () Bool)

(assert (=> b!777302 m!720643))

(declare-fun m!720645 () Bool)

(assert (=> b!777295 m!720645))

(assert (=> b!777303 m!720635))

(assert (=> b!777303 m!720635))

(declare-fun m!720647 () Bool)

(assert (=> b!777303 m!720647))

(declare-fun m!720649 () Bool)

(assert (=> b!777297 m!720649))

(declare-fun m!720651 () Bool)

(assert (=> b!777297 m!720651))

(assert (=> b!777300 m!720635))

(assert (=> b!777300 m!720635))

(declare-fun m!720653 () Bool)

(assert (=> b!777300 m!720653))

(assert (=> b!777293 m!720635))

(assert (=> b!777293 m!720635))

(declare-fun m!720655 () Bool)

(assert (=> b!777293 m!720655))

(declare-fun m!720657 () Bool)

(assert (=> start!67232 m!720657))

(declare-fun m!720659 () Bool)

(assert (=> start!67232 m!720659))

(assert (=> b!777294 m!720635))

(assert (=> b!777294 m!720635))

(declare-fun m!720661 () Bool)

(assert (=> b!777294 m!720661))

(assert (=> b!777294 m!720661))

(assert (=> b!777294 m!720635))

(declare-fun m!720663 () Bool)

(assert (=> b!777294 m!720663))

(assert (=> b!777305 m!720635))

(assert (=> b!777305 m!720635))

(assert (=> b!777305 m!720637))

(declare-fun m!720665 () Bool)

(assert (=> b!777304 m!720665))

(declare-fun m!720667 () Bool)

(assert (=> b!777307 m!720667))

(declare-fun m!720669 () Bool)

(assert (=> b!777306 m!720669))

(declare-fun m!720671 () Bool)

(assert (=> b!777306 m!720671))

(declare-fun m!720673 () Bool)

(assert (=> b!777291 m!720673))

(declare-fun m!720675 () Bool)

(assert (=> b!777290 m!720675))

(assert (=> b!777290 m!720669))

(assert (=> b!777290 m!720675))

(declare-fun m!720677 () Bool)

(assert (=> b!777290 m!720677))

(declare-fun m!720679 () Bool)

(assert (=> b!777290 m!720679))

(declare-fun m!720681 () Bool)

(assert (=> b!777290 m!720681))

(check-sat (not b!777290) (not b!777298) (not b!777296) (not b!777303) (not b!777295) (not start!67232) (not b!777293) (not b!777305) (not b!777300) (not b!777304) (not b!777294) (not b!777291) (not b!777301) (not b!777302) (not b!777292) (not b!777297))
(check-sat)
