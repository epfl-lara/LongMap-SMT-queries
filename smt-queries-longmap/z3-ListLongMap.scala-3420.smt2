; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47444 () Bool)

(assert start!47444)

(declare-fun b!522292 () Bool)

(declare-fun e!304646 () Bool)

(assert (=> b!522292 (= e!304646 true)))

(declare-datatypes ((array!33270 0))(
  ( (array!33271 (arr!15991 (Array (_ BitVec 32) (_ BitVec 64))) (size!16355 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33270)

(declare-datatypes ((SeekEntryResult!4458 0))(
  ( (MissingZero!4458 (index!20035 (_ BitVec 32))) (Found!4458 (index!20036 (_ BitVec 32))) (Intermediate!4458 (undefined!5270 Bool) (index!20037 (_ BitVec 32)) (x!49012 (_ BitVec 32))) (Undefined!4458) (MissingVacant!4458 (index!20038 (_ BitVec 32))) )
))
(declare-fun lt!239507 () SeekEntryResult!4458)

(assert (=> b!522292 (and (or (= (select (arr!15991 a!3235) (index!20037 lt!239507)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15991 a!3235) (index!20037 lt!239507)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15991 a!3235) (index!20037 lt!239507)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15991 a!3235) (index!20037 lt!239507)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16284 0))(
  ( (Unit!16285) )
))
(declare-fun lt!239508 () Unit!16284)

(declare-fun e!304644 () Unit!16284)

(assert (=> b!522292 (= lt!239508 e!304644)))

(declare-fun c!61463 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!522292 (= c!61463 (= (select (arr!15991 a!3235) (index!20037 lt!239507)) (select (arr!15991 a!3235) j!176)))))

(assert (=> b!522292 (and (bvslt (x!49012 lt!239507) #b01111111111111111111111111111110) (or (= (select (arr!15991 a!3235) (index!20037 lt!239507)) (select (arr!15991 a!3235) j!176)) (= (select (arr!15991 a!3235) (index!20037 lt!239507)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15991 a!3235) (index!20037 lt!239507)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522293 () Bool)

(declare-fun e!304642 () Bool)

(assert (=> b!522293 (= e!304642 false)))

(declare-fun b!522294 () Bool)

(declare-fun res!319976 () Bool)

(declare-fun e!304647 () Bool)

(assert (=> b!522294 (=> (not res!319976) (not e!304647))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33270 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522294 (= res!319976 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522295 () Bool)

(declare-fun e!304641 () Bool)

(assert (=> b!522295 (= e!304647 e!304641)))

(declare-fun res!319979 () Bool)

(assert (=> b!522295 (=> (not res!319979) (not e!304641))))

(declare-fun lt!239510 () SeekEntryResult!4458)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!522295 (= res!319979 (or (= lt!239510 (MissingZero!4458 i!1204)) (= lt!239510 (MissingVacant!4458 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33270 (_ BitVec 32)) SeekEntryResult!4458)

(assert (=> b!522295 (= lt!239510 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!522296 () Bool)

(assert (=> b!522296 (= e!304641 (not e!304646))))

(declare-fun res!319971 () Bool)

(assert (=> b!522296 (=> res!319971 e!304646)))

(declare-fun lt!239515 () (_ BitVec 32))

(declare-fun lt!239513 () array!33270)

(declare-fun lt!239511 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33270 (_ BitVec 32)) SeekEntryResult!4458)

(assert (=> b!522296 (= res!319971 (= lt!239507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239515 lt!239511 lt!239513 mask!3524)))))

(declare-fun lt!239514 () (_ BitVec 32))

(assert (=> b!522296 (= lt!239507 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239514 (select (arr!15991 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522296 (= lt!239515 (toIndex!0 lt!239511 mask!3524))))

(assert (=> b!522296 (= lt!239511 (select (store (arr!15991 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!522296 (= lt!239514 (toIndex!0 (select (arr!15991 a!3235) j!176) mask!3524))))

(assert (=> b!522296 (= lt!239513 (array!33271 (store (arr!15991 a!3235) i!1204 k0!2280) (size!16355 a!3235)))))

(declare-fun e!304643 () Bool)

(assert (=> b!522296 e!304643))

(declare-fun res!319974 () Bool)

(assert (=> b!522296 (=> (not res!319974) (not e!304643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33270 (_ BitVec 32)) Bool)

(assert (=> b!522296 (= res!319974 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239512 () Unit!16284)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33270 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16284)

(assert (=> b!522296 (= lt!239512 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522297 () Bool)

(declare-fun res!319972 () Bool)

(assert (=> b!522297 (=> res!319972 e!304646)))

(get-info :version)

(assert (=> b!522297 (= res!319972 (or (undefined!5270 lt!239507) (not ((_ is Intermediate!4458) lt!239507))))))

(declare-fun b!522298 () Bool)

(declare-fun res!319970 () Bool)

(assert (=> b!522298 (=> (not res!319970) (not e!304647))))

(assert (=> b!522298 (= res!319970 (and (= (size!16355 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16355 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16355 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!319969 () Bool)

(assert (=> start!47444 (=> (not res!319969) (not e!304647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47444 (= res!319969 (validMask!0 mask!3524))))

(assert (=> start!47444 e!304647))

(assert (=> start!47444 true))

(declare-fun array_inv!11787 (array!33270) Bool)

(assert (=> start!47444 (array_inv!11787 a!3235)))

(declare-fun b!522299 () Bool)

(declare-fun res!319977 () Bool)

(assert (=> b!522299 (=> (not res!319977) (not e!304641))))

(assert (=> b!522299 (= res!319977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!522300 () Bool)

(declare-fun res!319978 () Bool)

(assert (=> b!522300 (=> (not res!319978) (not e!304641))))

(declare-datatypes ((List!10149 0))(
  ( (Nil!10146) (Cons!10145 (h!11067 (_ BitVec 64)) (t!16377 List!10149)) )
))
(declare-fun arrayNoDuplicates!0 (array!33270 (_ BitVec 32) List!10149) Bool)

(assert (=> b!522300 (= res!319978 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10146))))

(declare-fun b!522301 () Bool)

(declare-fun Unit!16286 () Unit!16284)

(assert (=> b!522301 (= e!304644 Unit!16286)))

(declare-fun lt!239509 () Unit!16284)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33270 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16284)

(assert (=> b!522301 (= lt!239509 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239514 #b00000000000000000000000000000000 (index!20037 lt!239507) (x!49012 lt!239507) mask!3524))))

(declare-fun res!319973 () Bool)

(assert (=> b!522301 (= res!319973 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239514 lt!239511 lt!239513 mask!3524) (Intermediate!4458 false (index!20037 lt!239507) (x!49012 lt!239507))))))

(assert (=> b!522301 (=> (not res!319973) (not e!304642))))

(assert (=> b!522301 e!304642))

(declare-fun b!522302 () Bool)

(declare-fun res!319975 () Bool)

(assert (=> b!522302 (=> (not res!319975) (not e!304647))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522302 (= res!319975 (validKeyInArray!0 (select (arr!15991 a!3235) j!176)))))

(declare-fun b!522303 () Bool)

(declare-fun res!319968 () Bool)

(assert (=> b!522303 (=> (not res!319968) (not e!304647))))

(assert (=> b!522303 (= res!319968 (validKeyInArray!0 k0!2280))))

(declare-fun b!522304 () Bool)

(declare-fun Unit!16287 () Unit!16284)

(assert (=> b!522304 (= e!304644 Unit!16287)))

(declare-fun b!522305 () Bool)

(assert (=> b!522305 (= e!304643 (= (seekEntryOrOpen!0 (select (arr!15991 a!3235) j!176) a!3235 mask!3524) (Found!4458 j!176)))))

(assert (= (and start!47444 res!319969) b!522298))

(assert (= (and b!522298 res!319970) b!522302))

(assert (= (and b!522302 res!319975) b!522303))

(assert (= (and b!522303 res!319968) b!522294))

(assert (= (and b!522294 res!319976) b!522295))

(assert (= (and b!522295 res!319979) b!522299))

(assert (= (and b!522299 res!319977) b!522300))

(assert (= (and b!522300 res!319978) b!522296))

(assert (= (and b!522296 res!319974) b!522305))

(assert (= (and b!522296 (not res!319971)) b!522297))

(assert (= (and b!522297 (not res!319972)) b!522292))

(assert (= (and b!522292 c!61463) b!522301))

(assert (= (and b!522292 (not c!61463)) b!522304))

(assert (= (and b!522301 res!319973) b!522293))

(declare-fun m!503205 () Bool)

(assert (=> b!522300 m!503205))

(declare-fun m!503207 () Bool)

(assert (=> b!522305 m!503207))

(assert (=> b!522305 m!503207))

(declare-fun m!503209 () Bool)

(assert (=> b!522305 m!503209))

(declare-fun m!503211 () Bool)

(assert (=> b!522295 m!503211))

(declare-fun m!503213 () Bool)

(assert (=> b!522292 m!503213))

(assert (=> b!522292 m!503207))

(declare-fun m!503215 () Bool)

(assert (=> b!522301 m!503215))

(declare-fun m!503217 () Bool)

(assert (=> b!522301 m!503217))

(declare-fun m!503219 () Bool)

(assert (=> start!47444 m!503219))

(declare-fun m!503221 () Bool)

(assert (=> start!47444 m!503221))

(declare-fun m!503223 () Bool)

(assert (=> b!522296 m!503223))

(declare-fun m!503225 () Bool)

(assert (=> b!522296 m!503225))

(declare-fun m!503227 () Bool)

(assert (=> b!522296 m!503227))

(assert (=> b!522296 m!503207))

(declare-fun m!503229 () Bool)

(assert (=> b!522296 m!503229))

(assert (=> b!522296 m!503207))

(declare-fun m!503231 () Bool)

(assert (=> b!522296 m!503231))

(declare-fun m!503233 () Bool)

(assert (=> b!522296 m!503233))

(assert (=> b!522296 m!503207))

(declare-fun m!503235 () Bool)

(assert (=> b!522296 m!503235))

(declare-fun m!503237 () Bool)

(assert (=> b!522296 m!503237))

(declare-fun m!503239 () Bool)

(assert (=> b!522294 m!503239))

(declare-fun m!503241 () Bool)

(assert (=> b!522299 m!503241))

(assert (=> b!522302 m!503207))

(assert (=> b!522302 m!503207))

(declare-fun m!503243 () Bool)

(assert (=> b!522302 m!503243))

(declare-fun m!503245 () Bool)

(assert (=> b!522303 m!503245))

(check-sat (not b!522303) (not b!522299) (not start!47444) (not b!522305) (not b!522302) (not b!522301) (not b!522294) (not b!522300) (not b!522296) (not b!522295))
(check-sat)
