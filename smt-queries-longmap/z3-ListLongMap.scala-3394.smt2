; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46778 () Bool)

(assert start!46778)

(declare-fun b!516701 () Bool)

(declare-fun res!316274 () Bool)

(declare-fun e!301520 () Bool)

(assert (=> b!516701 (=> (not res!316274) (not e!301520))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33090 0))(
  ( (array!33091 (arr!15913 (Array (_ BitVec 32) (_ BitVec 64))) (size!16277 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33090)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!516701 (= res!316274 (and (= (size!16277 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16277 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16277 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516702 () Bool)

(declare-fun e!301521 () Bool)

(declare-fun e!301523 () Bool)

(assert (=> b!516702 (= e!301521 (not e!301523))))

(declare-fun res!316272 () Bool)

(assert (=> b!516702 (=> res!316272 e!301523)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4380 0))(
  ( (MissingZero!4380 (index!19708 (_ BitVec 32))) (Found!4380 (index!19709 (_ BitVec 32))) (Intermediate!4380 (undefined!5192 Bool) (index!19710 (_ BitVec 32)) (x!48663 (_ BitVec 32))) (Undefined!4380) (MissingVacant!4380 (index!19711 (_ BitVec 32))) )
))
(declare-fun lt!236538 () SeekEntryResult!4380)

(declare-fun lt!236535 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33090 (_ BitVec 32)) SeekEntryResult!4380)

(assert (=> b!516702 (= res!316272 (= lt!236538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236535 (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176) (array!33091 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235)) mask!3524)))))

(declare-fun lt!236539 () (_ BitVec 32))

(assert (=> b!516702 (= lt!236538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236539 (select (arr!15913 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516702 (= lt!236535 (toIndex!0 (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516702 (= lt!236539 (toIndex!0 (select (arr!15913 a!3235) j!176) mask!3524))))

(declare-fun e!301524 () Bool)

(assert (=> b!516702 e!301524))

(declare-fun res!316271 () Bool)

(assert (=> b!516702 (=> (not res!316271) (not e!301524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33090 (_ BitVec 32)) Bool)

(assert (=> b!516702 (= res!316271 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16018 0))(
  ( (Unit!16019) )
))
(declare-fun lt!236537 () Unit!16018)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33090 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16018)

(assert (=> b!516702 (= lt!236537 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516703 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33090 (_ BitVec 32)) SeekEntryResult!4380)

(assert (=> b!516703 (= e!301524 (= (seekEntryOrOpen!0 (select (arr!15913 a!3235) j!176) a!3235 mask!3524) (Found!4380 j!176)))))

(declare-fun b!516704 () Bool)

(declare-fun res!316270 () Bool)

(assert (=> b!516704 (=> (not res!316270) (not e!301520))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516704 (= res!316270 (validKeyInArray!0 (select (arr!15913 a!3235) j!176)))))

(declare-fun b!516705 () Bool)

(declare-fun res!316273 () Bool)

(assert (=> b!516705 (=> (not res!316273) (not e!301520))))

(assert (=> b!516705 (= res!316273 (validKeyInArray!0 k0!2280))))

(declare-fun b!516706 () Bool)

(declare-fun res!316268 () Bool)

(assert (=> b!516706 (=> res!316268 e!301523)))

(get-info :version)

(assert (=> b!516706 (= res!316268 (or (undefined!5192 lt!236538) (not ((_ is Intermediate!4380) lt!236538))))))

(declare-fun b!516707 () Bool)

(assert (=> b!516707 (= e!301520 e!301521)))

(declare-fun res!316267 () Bool)

(assert (=> b!516707 (=> (not res!316267) (not e!301521))))

(declare-fun lt!236536 () SeekEntryResult!4380)

(assert (=> b!516707 (= res!316267 (or (= lt!236536 (MissingZero!4380 i!1204)) (= lt!236536 (MissingVacant!4380 i!1204))))))

(assert (=> b!516707 (= lt!236536 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516708 () Bool)

(declare-fun res!316266 () Bool)

(assert (=> b!516708 (=> (not res!316266) (not e!301520))))

(declare-fun arrayContainsKey!0 (array!33090 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516708 (= res!316266 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!316269 () Bool)

(assert (=> start!46778 (=> (not res!316269) (not e!301520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46778 (= res!316269 (validMask!0 mask!3524))))

(assert (=> start!46778 e!301520))

(assert (=> start!46778 true))

(declare-fun array_inv!11709 (array!33090) Bool)

(assert (=> start!46778 (array_inv!11709 a!3235)))

(declare-fun b!516700 () Bool)

(declare-fun res!316264 () Bool)

(assert (=> b!516700 (=> (not res!316264) (not e!301521))))

(assert (=> b!516700 (= res!316264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516709 () Bool)

(declare-fun res!316265 () Bool)

(assert (=> b!516709 (=> (not res!316265) (not e!301521))))

(declare-datatypes ((List!10071 0))(
  ( (Nil!10068) (Cons!10067 (h!10965 (_ BitVec 64)) (t!16299 List!10071)) )
))
(declare-fun arrayNoDuplicates!0 (array!33090 (_ BitVec 32) List!10071) Bool)

(assert (=> b!516709 (= res!316265 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10068))))

(declare-fun b!516710 () Bool)

(assert (=> b!516710 (= e!301523 (or (not (= (select (arr!15913 a!3235) (index!19710 lt!236538)) (select (arr!15913 a!3235) j!176))) (bvsgt (x!48663 lt!236538) #b01111111111111111111111111111110) (bvsle #b00000000000000000000000000000000 (x!48663 lt!236538))))))

(assert (=> b!516710 (and (bvslt (x!48663 lt!236538) #b01111111111111111111111111111110) (or (= (select (arr!15913 a!3235) (index!19710 lt!236538)) (select (arr!15913 a!3235) j!176)) (= (select (arr!15913 a!3235) (index!19710 lt!236538)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15913 a!3235) (index!19710 lt!236538)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!46778 res!316269) b!516701))

(assert (= (and b!516701 res!316274) b!516704))

(assert (= (and b!516704 res!316270) b!516705))

(assert (= (and b!516705 res!316273) b!516708))

(assert (= (and b!516708 res!316266) b!516707))

(assert (= (and b!516707 res!316267) b!516700))

(assert (= (and b!516700 res!316264) b!516709))

(assert (= (and b!516709 res!316265) b!516702))

(assert (= (and b!516702 res!316271) b!516703))

(assert (= (and b!516702 (not res!316272)) b!516706))

(assert (= (and b!516706 (not res!316268)) b!516710))

(declare-fun m!498227 () Bool)

(assert (=> b!516705 m!498227))

(declare-fun m!498229 () Bool)

(assert (=> b!516710 m!498229))

(declare-fun m!498231 () Bool)

(assert (=> b!516710 m!498231))

(declare-fun m!498233 () Bool)

(assert (=> b!516708 m!498233))

(declare-fun m!498235 () Bool)

(assert (=> b!516709 m!498235))

(declare-fun m!498237 () Bool)

(assert (=> start!46778 m!498237))

(declare-fun m!498239 () Bool)

(assert (=> start!46778 m!498239))

(assert (=> b!516704 m!498231))

(assert (=> b!516704 m!498231))

(declare-fun m!498241 () Bool)

(assert (=> b!516704 m!498241))

(assert (=> b!516703 m!498231))

(assert (=> b!516703 m!498231))

(declare-fun m!498243 () Bool)

(assert (=> b!516703 m!498243))

(declare-fun m!498245 () Bool)

(assert (=> b!516702 m!498245))

(declare-fun m!498247 () Bool)

(assert (=> b!516702 m!498247))

(declare-fun m!498249 () Bool)

(assert (=> b!516702 m!498249))

(declare-fun m!498251 () Bool)

(assert (=> b!516702 m!498251))

(assert (=> b!516702 m!498247))

(assert (=> b!516702 m!498231))

(declare-fun m!498253 () Bool)

(assert (=> b!516702 m!498253))

(assert (=> b!516702 m!498231))

(declare-fun m!498255 () Bool)

(assert (=> b!516702 m!498255))

(assert (=> b!516702 m!498231))

(declare-fun m!498257 () Bool)

(assert (=> b!516702 m!498257))

(assert (=> b!516702 m!498247))

(declare-fun m!498259 () Bool)

(assert (=> b!516702 m!498259))

(declare-fun m!498261 () Bool)

(assert (=> b!516707 m!498261))

(declare-fun m!498263 () Bool)

(assert (=> b!516700 m!498263))

(check-sat (not b!516705) (not b!516703) (not b!516702) (not b!516700) (not b!516707) (not b!516708) (not start!46778) (not b!516709) (not b!516704))
(check-sat)
(get-model)

(declare-fun d!79575 () Bool)

(declare-fun lt!236561 () SeekEntryResult!4380)

(assert (=> d!79575 (and (or ((_ is Undefined!4380) lt!236561) (not ((_ is Found!4380) lt!236561)) (and (bvsge (index!19709 lt!236561) #b00000000000000000000000000000000) (bvslt (index!19709 lt!236561) (size!16277 a!3235)))) (or ((_ is Undefined!4380) lt!236561) ((_ is Found!4380) lt!236561) (not ((_ is MissingZero!4380) lt!236561)) (and (bvsge (index!19708 lt!236561) #b00000000000000000000000000000000) (bvslt (index!19708 lt!236561) (size!16277 a!3235)))) (or ((_ is Undefined!4380) lt!236561) ((_ is Found!4380) lt!236561) ((_ is MissingZero!4380) lt!236561) (not ((_ is MissingVacant!4380) lt!236561)) (and (bvsge (index!19711 lt!236561) #b00000000000000000000000000000000) (bvslt (index!19711 lt!236561) (size!16277 a!3235)))) (or ((_ is Undefined!4380) lt!236561) (ite ((_ is Found!4380) lt!236561) (= (select (arr!15913 a!3235) (index!19709 lt!236561)) k0!2280) (ite ((_ is MissingZero!4380) lt!236561) (= (select (arr!15913 a!3235) (index!19708 lt!236561)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4380) lt!236561) (= (select (arr!15913 a!3235) (index!19711 lt!236561)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!301548 () SeekEntryResult!4380)

(assert (=> d!79575 (= lt!236561 e!301548)))

(declare-fun c!60513 () Bool)

(declare-fun lt!236563 () SeekEntryResult!4380)

(assert (=> d!79575 (= c!60513 (and ((_ is Intermediate!4380) lt!236563) (undefined!5192 lt!236563)))))

(assert (=> d!79575 (= lt!236563 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79575 (validMask!0 mask!3524)))

(assert (=> d!79575 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!236561)))

(declare-fun b!516756 () Bool)

(declare-fun c!60514 () Bool)

(declare-fun lt!236562 () (_ BitVec 64))

(assert (=> b!516756 (= c!60514 (= lt!236562 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!301547 () SeekEntryResult!4380)

(declare-fun e!301546 () SeekEntryResult!4380)

(assert (=> b!516756 (= e!301547 e!301546)))

(declare-fun b!516757 () Bool)

(assert (=> b!516757 (= e!301548 e!301547)))

(assert (=> b!516757 (= lt!236562 (select (arr!15913 a!3235) (index!19710 lt!236563)))))

(declare-fun c!60515 () Bool)

(assert (=> b!516757 (= c!60515 (= lt!236562 k0!2280))))

(declare-fun b!516758 () Bool)

(assert (=> b!516758 (= e!301547 (Found!4380 (index!19710 lt!236563)))))

(declare-fun b!516759 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33090 (_ BitVec 32)) SeekEntryResult!4380)

(assert (=> b!516759 (= e!301546 (seekKeyOrZeroReturnVacant!0 (x!48663 lt!236563) (index!19710 lt!236563) (index!19710 lt!236563) k0!2280 a!3235 mask!3524))))

(declare-fun b!516760 () Bool)

(assert (=> b!516760 (= e!301548 Undefined!4380)))

(declare-fun b!516761 () Bool)

(assert (=> b!516761 (= e!301546 (MissingZero!4380 (index!19710 lt!236563)))))

(assert (= (and d!79575 c!60513) b!516760))

(assert (= (and d!79575 (not c!60513)) b!516757))

(assert (= (and b!516757 c!60515) b!516758))

(assert (= (and b!516757 (not c!60515)) b!516756))

(assert (= (and b!516756 c!60514) b!516761))

(assert (= (and b!516756 (not c!60514)) b!516759))

(assert (=> d!79575 m!498237))

(declare-fun m!498303 () Bool)

(assert (=> d!79575 m!498303))

(declare-fun m!498305 () Bool)

(assert (=> d!79575 m!498305))

(assert (=> d!79575 m!498305))

(declare-fun m!498307 () Bool)

(assert (=> d!79575 m!498307))

(declare-fun m!498309 () Bool)

(assert (=> d!79575 m!498309))

(declare-fun m!498311 () Bool)

(assert (=> d!79575 m!498311))

(declare-fun m!498313 () Bool)

(assert (=> b!516757 m!498313))

(declare-fun m!498315 () Bool)

(assert (=> b!516759 m!498315))

(assert (=> b!516707 d!79575))

(declare-fun d!79577 () Bool)

(declare-fun lt!236569 () (_ BitVec 32))

(declare-fun lt!236568 () (_ BitVec 32))

(assert (=> d!79577 (= lt!236569 (bvmul (bvxor lt!236568 (bvlshr lt!236568 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79577 (= lt!236568 ((_ extract 31 0) (bvand (bvxor (select (arr!15913 a!3235) j!176) (bvlshr (select (arr!15913 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79577 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316308 (let ((h!10967 ((_ extract 31 0) (bvand (bvxor (select (arr!15913 a!3235) j!176) (bvlshr (select (arr!15913 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48665 (bvmul (bvxor h!10967 (bvlshr h!10967 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48665 (bvlshr x!48665 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316308 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316308 #b00000000000000000000000000000000))))))

(assert (=> d!79577 (= (toIndex!0 (select (arr!15913 a!3235) j!176) mask!3524) (bvand (bvxor lt!236569 (bvlshr lt!236569 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!516702 d!79577))

(declare-fun b!516803 () Bool)

(declare-fun e!301577 () Bool)

(declare-fun lt!236581 () SeekEntryResult!4380)

(assert (=> b!516803 (= e!301577 (bvsge (x!48663 lt!236581) #b01111111111111111111111111111110))))

(declare-fun b!516804 () Bool)

(assert (=> b!516804 (and (bvsge (index!19710 lt!236581) #b00000000000000000000000000000000) (bvslt (index!19710 lt!236581) (size!16277 (array!33091 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235)))))))

(declare-fun e!301581 () Bool)

(assert (=> b!516804 (= e!301581 (= (select (arr!15913 (array!33091 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235))) (index!19710 lt!236581)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!79579 () Bool)

(assert (=> d!79579 e!301577))

(declare-fun c!60528 () Bool)

(assert (=> d!79579 (= c!60528 (and ((_ is Intermediate!4380) lt!236581) (undefined!5192 lt!236581)))))

(declare-fun e!301580 () SeekEntryResult!4380)

(assert (=> d!79579 (= lt!236581 e!301580)))

(declare-fun c!60527 () Bool)

(assert (=> d!79579 (= c!60527 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!236580 () (_ BitVec 64))

(assert (=> d!79579 (= lt!236580 (select (arr!15913 (array!33091 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235))) lt!236535))))

(assert (=> d!79579 (validMask!0 mask!3524)))

(assert (=> d!79579 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236535 (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176) (array!33091 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235)) mask!3524) lt!236581)))

(declare-fun e!301578 () SeekEntryResult!4380)

(declare-fun b!516805 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516805 (= e!301578 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236535 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176) (array!33091 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235)) mask!3524))))

(declare-fun b!516806 () Bool)

(assert (=> b!516806 (and (bvsge (index!19710 lt!236581) #b00000000000000000000000000000000) (bvslt (index!19710 lt!236581) (size!16277 (array!33091 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235)))))))

(declare-fun res!316328 () Bool)

(assert (=> b!516806 (= res!316328 (= (select (arr!15913 (array!33091 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235))) (index!19710 lt!236581)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!516806 (=> res!316328 e!301581)))

(declare-fun b!516807 () Bool)

(assert (=> b!516807 (= e!301580 e!301578)))

(declare-fun c!60529 () Bool)

(assert (=> b!516807 (= c!60529 (or (= lt!236580 (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!236580 lt!236580) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516808 () Bool)

(declare-fun e!301579 () Bool)

(assert (=> b!516808 (= e!301577 e!301579)))

(declare-fun res!316329 () Bool)

(assert (=> b!516808 (= res!316329 (and ((_ is Intermediate!4380) lt!236581) (not (undefined!5192 lt!236581)) (bvslt (x!48663 lt!236581) #b01111111111111111111111111111110) (bvsge (x!48663 lt!236581) #b00000000000000000000000000000000) (bvsge (x!48663 lt!236581) #b00000000000000000000000000000000)))))

(assert (=> b!516808 (=> (not res!316329) (not e!301579))))

(declare-fun b!516809 () Bool)

(assert (=> b!516809 (= e!301578 (Intermediate!4380 false lt!236535 #b00000000000000000000000000000000))))

(declare-fun b!516810 () Bool)

(assert (=> b!516810 (= e!301580 (Intermediate!4380 true lt!236535 #b00000000000000000000000000000000))))

(declare-fun b!516811 () Bool)

(assert (=> b!516811 (and (bvsge (index!19710 lt!236581) #b00000000000000000000000000000000) (bvslt (index!19710 lt!236581) (size!16277 (array!33091 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235)))))))

(declare-fun res!316330 () Bool)

(assert (=> b!516811 (= res!316330 (= (select (arr!15913 (array!33091 (store (arr!15913 a!3235) i!1204 k0!2280) (size!16277 a!3235))) (index!19710 lt!236581)) (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!516811 (=> res!316330 e!301581)))

(assert (=> b!516811 (= e!301579 e!301581)))

(assert (= (and d!79579 c!60527) b!516810))

(assert (= (and d!79579 (not c!60527)) b!516807))

(assert (= (and b!516807 c!60529) b!516809))

(assert (= (and b!516807 (not c!60529)) b!516805))

(assert (= (and d!79579 c!60528) b!516803))

(assert (= (and d!79579 (not c!60528)) b!516808))

(assert (= (and b!516808 res!316329) b!516811))

(assert (= (and b!516811 (not res!316330)) b!516806))

(assert (= (and b!516806 (not res!316328)) b!516804))

(declare-fun m!498325 () Bool)

(assert (=> b!516811 m!498325))

(declare-fun m!498327 () Bool)

(assert (=> d!79579 m!498327))

(assert (=> d!79579 m!498237))

(declare-fun m!498329 () Bool)

(assert (=> b!516805 m!498329))

(assert (=> b!516805 m!498329))

(assert (=> b!516805 m!498247))

(declare-fun m!498331 () Bool)

(assert (=> b!516805 m!498331))

(assert (=> b!516804 m!498325))

(assert (=> b!516806 m!498325))

(assert (=> b!516702 d!79579))

(declare-fun call!31649 () Bool)

(declare-fun bm!31646 () Bool)

(assert (=> bm!31646 (= call!31649 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!79591 () Bool)

(declare-fun res!316338 () Bool)

(declare-fun e!301598 () Bool)

(assert (=> d!79591 (=> res!316338 e!301598)))

(assert (=> d!79591 (= res!316338 (bvsge j!176 (size!16277 a!3235)))))

(assert (=> d!79591 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!301598)))

(declare-fun b!516836 () Bool)

(declare-fun e!301597 () Bool)

(assert (=> b!516836 (= e!301598 e!301597)))

(declare-fun c!60539 () Bool)

(assert (=> b!516836 (= c!60539 (validKeyInArray!0 (select (arr!15913 a!3235) j!176)))))

(declare-fun b!516837 () Bool)

(declare-fun e!301599 () Bool)

(assert (=> b!516837 (= e!301597 e!301599)))

(declare-fun lt!236597 () (_ BitVec 64))

(assert (=> b!516837 (= lt!236597 (select (arr!15913 a!3235) j!176))))

(declare-fun lt!236599 () Unit!16018)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33090 (_ BitVec 64) (_ BitVec 32)) Unit!16018)

(assert (=> b!516837 (= lt!236599 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236597 j!176))))

(assert (=> b!516837 (arrayContainsKey!0 a!3235 lt!236597 #b00000000000000000000000000000000)))

(declare-fun lt!236598 () Unit!16018)

(assert (=> b!516837 (= lt!236598 lt!236599)))

(declare-fun res!316337 () Bool)

(assert (=> b!516837 (= res!316337 (= (seekEntryOrOpen!0 (select (arr!15913 a!3235) j!176) a!3235 mask!3524) (Found!4380 j!176)))))

(assert (=> b!516837 (=> (not res!316337) (not e!301599))))

(declare-fun b!516838 () Bool)

(assert (=> b!516838 (= e!301599 call!31649)))

(declare-fun b!516839 () Bool)

(assert (=> b!516839 (= e!301597 call!31649)))

(assert (= (and d!79591 (not res!316338)) b!516836))

(assert (= (and b!516836 c!60539) b!516837))

(assert (= (and b!516836 (not c!60539)) b!516839))

(assert (= (and b!516837 res!316337) b!516838))

(assert (= (or b!516838 b!516839) bm!31646))

(declare-fun m!498341 () Bool)

(assert (=> bm!31646 m!498341))

(assert (=> b!516836 m!498231))

(assert (=> b!516836 m!498231))

(assert (=> b!516836 m!498241))

(assert (=> b!516837 m!498231))

(declare-fun m!498343 () Bool)

(assert (=> b!516837 m!498343))

(declare-fun m!498345 () Bool)

(assert (=> b!516837 m!498345))

(assert (=> b!516837 m!498231))

(assert (=> b!516837 m!498243))

(assert (=> b!516702 d!79591))

(declare-fun b!516840 () Bool)

(declare-fun e!301600 () Bool)

(declare-fun lt!236601 () SeekEntryResult!4380)

(assert (=> b!516840 (= e!301600 (bvsge (x!48663 lt!236601) #b01111111111111111111111111111110))))

(declare-fun b!516841 () Bool)

(assert (=> b!516841 (and (bvsge (index!19710 lt!236601) #b00000000000000000000000000000000) (bvslt (index!19710 lt!236601) (size!16277 a!3235)))))

(declare-fun e!301604 () Bool)

(assert (=> b!516841 (= e!301604 (= (select (arr!15913 a!3235) (index!19710 lt!236601)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!79595 () Bool)

(assert (=> d!79595 e!301600))

(declare-fun c!60541 () Bool)

(assert (=> d!79595 (= c!60541 (and ((_ is Intermediate!4380) lt!236601) (undefined!5192 lt!236601)))))

(declare-fun e!301603 () SeekEntryResult!4380)

(assert (=> d!79595 (= lt!236601 e!301603)))

(declare-fun c!60540 () Bool)

(assert (=> d!79595 (= c!60540 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!236600 () (_ BitVec 64))

(assert (=> d!79595 (= lt!236600 (select (arr!15913 a!3235) lt!236539))))

(assert (=> d!79595 (validMask!0 mask!3524)))

(assert (=> d!79595 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236539 (select (arr!15913 a!3235) j!176) a!3235 mask!3524) lt!236601)))

(declare-fun b!516842 () Bool)

(declare-fun e!301601 () SeekEntryResult!4380)

(assert (=> b!516842 (= e!301601 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236539 #b00000000000000000000000000000000 mask!3524) (select (arr!15913 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!516843 () Bool)

(assert (=> b!516843 (and (bvsge (index!19710 lt!236601) #b00000000000000000000000000000000) (bvslt (index!19710 lt!236601) (size!16277 a!3235)))))

(declare-fun res!316339 () Bool)

(assert (=> b!516843 (= res!316339 (= (select (arr!15913 a!3235) (index!19710 lt!236601)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!516843 (=> res!316339 e!301604)))

(declare-fun b!516844 () Bool)

(assert (=> b!516844 (= e!301603 e!301601)))

(declare-fun c!60542 () Bool)

(assert (=> b!516844 (= c!60542 (or (= lt!236600 (select (arr!15913 a!3235) j!176)) (= (bvadd lt!236600 lt!236600) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516845 () Bool)

(declare-fun e!301602 () Bool)

(assert (=> b!516845 (= e!301600 e!301602)))

(declare-fun res!316340 () Bool)

(assert (=> b!516845 (= res!316340 (and ((_ is Intermediate!4380) lt!236601) (not (undefined!5192 lt!236601)) (bvslt (x!48663 lt!236601) #b01111111111111111111111111111110) (bvsge (x!48663 lt!236601) #b00000000000000000000000000000000) (bvsge (x!48663 lt!236601) #b00000000000000000000000000000000)))))

(assert (=> b!516845 (=> (not res!316340) (not e!301602))))

(declare-fun b!516846 () Bool)

(assert (=> b!516846 (= e!301601 (Intermediate!4380 false lt!236539 #b00000000000000000000000000000000))))

(declare-fun b!516847 () Bool)

(assert (=> b!516847 (= e!301603 (Intermediate!4380 true lt!236539 #b00000000000000000000000000000000))))

(declare-fun b!516848 () Bool)

(assert (=> b!516848 (and (bvsge (index!19710 lt!236601) #b00000000000000000000000000000000) (bvslt (index!19710 lt!236601) (size!16277 a!3235)))))

(declare-fun res!316341 () Bool)

(assert (=> b!516848 (= res!316341 (= (select (arr!15913 a!3235) (index!19710 lt!236601)) (select (arr!15913 a!3235) j!176)))))

(assert (=> b!516848 (=> res!316341 e!301604)))

(assert (=> b!516848 (= e!301602 e!301604)))

(assert (= (and d!79595 c!60540) b!516847))

(assert (= (and d!79595 (not c!60540)) b!516844))

(assert (= (and b!516844 c!60542) b!516846))

(assert (= (and b!516844 (not c!60542)) b!516842))

(assert (= (and d!79595 c!60541) b!516840))

(assert (= (and d!79595 (not c!60541)) b!516845))

(assert (= (and b!516845 res!316340) b!516848))

(assert (= (and b!516848 (not res!316341)) b!516843))

(assert (= (and b!516843 (not res!316339)) b!516841))

(declare-fun m!498347 () Bool)

(assert (=> b!516848 m!498347))

(declare-fun m!498349 () Bool)

(assert (=> d!79595 m!498349))

(assert (=> d!79595 m!498237))

(declare-fun m!498351 () Bool)

(assert (=> b!516842 m!498351))

(assert (=> b!516842 m!498351))

(assert (=> b!516842 m!498231))

(declare-fun m!498353 () Bool)

(assert (=> b!516842 m!498353))

(assert (=> b!516841 m!498347))

(assert (=> b!516843 m!498347))

(assert (=> b!516702 d!79595))

(declare-fun d!79597 () Bool)

(assert (=> d!79597 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!236607 () Unit!16018)

(declare-fun choose!38 (array!33090 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16018)

(assert (=> d!79597 (= lt!236607 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79597 (validMask!0 mask!3524)))

(assert (=> d!79597 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!236607)))

(declare-fun bs!16327 () Bool)

(assert (= bs!16327 d!79597))

(assert (=> bs!16327 m!498257))

(declare-fun m!498367 () Bool)

(assert (=> bs!16327 m!498367))

(assert (=> bs!16327 m!498237))

(assert (=> b!516702 d!79597))

(declare-fun d!79607 () Bool)

(declare-fun lt!236609 () (_ BitVec 32))

(declare-fun lt!236608 () (_ BitVec 32))

(assert (=> d!79607 (= lt!236609 (bvmul (bvxor lt!236608 (bvlshr lt!236608 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79607 (= lt!236608 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79607 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316308 (let ((h!10967 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48665 (bvmul (bvxor h!10967 (bvlshr h!10967 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48665 (bvlshr x!48665 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316308 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316308 #b00000000000000000000000000000000))))))

(assert (=> d!79607 (= (toIndex!0 (select (store (arr!15913 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!236609 (bvlshr lt!236609 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!516702 d!79607))

(declare-fun d!79611 () Bool)

(declare-fun res!316355 () Bool)

(declare-fun e!301621 () Bool)

(assert (=> d!79611 (=> res!316355 e!301621)))

(assert (=> d!79611 (= res!316355 (= (select (arr!15913 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79611 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!301621)))

(declare-fun b!516869 () Bool)

(declare-fun e!301622 () Bool)

(assert (=> b!516869 (= e!301621 e!301622)))

(declare-fun res!316356 () Bool)

(assert (=> b!516869 (=> (not res!316356) (not e!301622))))

(assert (=> b!516869 (= res!316356 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16277 a!3235)))))

(declare-fun b!516870 () Bool)

(assert (=> b!516870 (= e!301622 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79611 (not res!316355)) b!516869))

(assert (= (and b!516869 res!316356) b!516870))

(declare-fun m!498373 () Bool)

(assert (=> d!79611 m!498373))

(declare-fun m!498375 () Bool)

(assert (=> b!516870 m!498375))

(assert (=> b!516708 d!79611))

(declare-fun d!79615 () Bool)

(assert (=> d!79615 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46778 d!79615))

(declare-fun d!79625 () Bool)

(assert (=> d!79625 (= (array_inv!11709 a!3235) (bvsge (size!16277 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46778 d!79625))

(declare-fun d!79627 () Bool)

(assert (=> d!79627 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!516705 d!79627))

(declare-fun bm!31651 () Bool)

(declare-fun call!31654 () Bool)

(assert (=> bm!31651 (= call!31654 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!79629 () Bool)

(declare-fun res!316367 () Bool)

(declare-fun e!301636 () Bool)

(assert (=> d!79629 (=> res!316367 e!301636)))

(assert (=> d!79629 (= res!316367 (bvsge #b00000000000000000000000000000000 (size!16277 a!3235)))))

(assert (=> d!79629 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!301636)))

(declare-fun b!516886 () Bool)

(declare-fun e!301635 () Bool)

(assert (=> b!516886 (= e!301636 e!301635)))

(declare-fun c!60550 () Bool)

(assert (=> b!516886 (= c!60550 (validKeyInArray!0 (select (arr!15913 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!516887 () Bool)

(declare-fun e!301637 () Bool)

(assert (=> b!516887 (= e!301635 e!301637)))

(declare-fun lt!236624 () (_ BitVec 64))

(assert (=> b!516887 (= lt!236624 (select (arr!15913 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!236626 () Unit!16018)

(assert (=> b!516887 (= lt!236626 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236624 #b00000000000000000000000000000000))))

(assert (=> b!516887 (arrayContainsKey!0 a!3235 lt!236624 #b00000000000000000000000000000000)))

(declare-fun lt!236625 () Unit!16018)

(assert (=> b!516887 (= lt!236625 lt!236626)))

(declare-fun res!316366 () Bool)

(assert (=> b!516887 (= res!316366 (= (seekEntryOrOpen!0 (select (arr!15913 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4380 #b00000000000000000000000000000000)))))

(assert (=> b!516887 (=> (not res!316366) (not e!301637))))

(declare-fun b!516888 () Bool)

(assert (=> b!516888 (= e!301637 call!31654)))

(declare-fun b!516889 () Bool)

(assert (=> b!516889 (= e!301635 call!31654)))

(assert (= (and d!79629 (not res!316367)) b!516886))

(assert (= (and b!516886 c!60550) b!516887))

(assert (= (and b!516886 (not c!60550)) b!516889))

(assert (= (and b!516887 res!316366) b!516888))

(assert (= (or b!516888 b!516889) bm!31651))

(declare-fun m!498391 () Bool)

(assert (=> bm!31651 m!498391))

(assert (=> b!516886 m!498373))

(assert (=> b!516886 m!498373))

(declare-fun m!498393 () Bool)

(assert (=> b!516886 m!498393))

(assert (=> b!516887 m!498373))

(declare-fun m!498395 () Bool)

(assert (=> b!516887 m!498395))

(declare-fun m!498397 () Bool)

(assert (=> b!516887 m!498397))

(assert (=> b!516887 m!498373))

(declare-fun m!498399 () Bool)

(assert (=> b!516887 m!498399))

(assert (=> b!516700 d!79629))

(declare-fun d!79631 () Bool)

(declare-fun lt!236627 () SeekEntryResult!4380)

(assert (=> d!79631 (and (or ((_ is Undefined!4380) lt!236627) (not ((_ is Found!4380) lt!236627)) (and (bvsge (index!19709 lt!236627) #b00000000000000000000000000000000) (bvslt (index!19709 lt!236627) (size!16277 a!3235)))) (or ((_ is Undefined!4380) lt!236627) ((_ is Found!4380) lt!236627) (not ((_ is MissingZero!4380) lt!236627)) (and (bvsge (index!19708 lt!236627) #b00000000000000000000000000000000) (bvslt (index!19708 lt!236627) (size!16277 a!3235)))) (or ((_ is Undefined!4380) lt!236627) ((_ is Found!4380) lt!236627) ((_ is MissingZero!4380) lt!236627) (not ((_ is MissingVacant!4380) lt!236627)) (and (bvsge (index!19711 lt!236627) #b00000000000000000000000000000000) (bvslt (index!19711 lt!236627) (size!16277 a!3235)))) (or ((_ is Undefined!4380) lt!236627) (ite ((_ is Found!4380) lt!236627) (= (select (arr!15913 a!3235) (index!19709 lt!236627)) (select (arr!15913 a!3235) j!176)) (ite ((_ is MissingZero!4380) lt!236627) (= (select (arr!15913 a!3235) (index!19708 lt!236627)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4380) lt!236627) (= (select (arr!15913 a!3235) (index!19711 lt!236627)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!301640 () SeekEntryResult!4380)

(assert (=> d!79631 (= lt!236627 e!301640)))

(declare-fun c!60551 () Bool)

(declare-fun lt!236629 () SeekEntryResult!4380)

(assert (=> d!79631 (= c!60551 (and ((_ is Intermediate!4380) lt!236629) (undefined!5192 lt!236629)))))

(assert (=> d!79631 (= lt!236629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15913 a!3235) j!176) mask!3524) (select (arr!15913 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79631 (validMask!0 mask!3524)))

(assert (=> d!79631 (= (seekEntryOrOpen!0 (select (arr!15913 a!3235) j!176) a!3235 mask!3524) lt!236627)))

(declare-fun b!516890 () Bool)

(declare-fun c!60552 () Bool)

(declare-fun lt!236628 () (_ BitVec 64))

(assert (=> b!516890 (= c!60552 (= lt!236628 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!301639 () SeekEntryResult!4380)

(declare-fun e!301638 () SeekEntryResult!4380)

(assert (=> b!516890 (= e!301639 e!301638)))

(declare-fun b!516891 () Bool)

(assert (=> b!516891 (= e!301640 e!301639)))

(assert (=> b!516891 (= lt!236628 (select (arr!15913 a!3235) (index!19710 lt!236629)))))

(declare-fun c!60553 () Bool)

(assert (=> b!516891 (= c!60553 (= lt!236628 (select (arr!15913 a!3235) j!176)))))

(declare-fun b!516892 () Bool)

(assert (=> b!516892 (= e!301639 (Found!4380 (index!19710 lt!236629)))))

(declare-fun b!516893 () Bool)

(assert (=> b!516893 (= e!301638 (seekKeyOrZeroReturnVacant!0 (x!48663 lt!236629) (index!19710 lt!236629) (index!19710 lt!236629) (select (arr!15913 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!516894 () Bool)

(assert (=> b!516894 (= e!301640 Undefined!4380)))

(declare-fun b!516895 () Bool)

(assert (=> b!516895 (= e!301638 (MissingZero!4380 (index!19710 lt!236629)))))

(assert (= (and d!79631 c!60551) b!516894))

(assert (= (and d!79631 (not c!60551)) b!516891))

(assert (= (and b!516891 c!60553) b!516892))

(assert (= (and b!516891 (not c!60553)) b!516890))

(assert (= (and b!516890 c!60552) b!516895))

(assert (= (and b!516890 (not c!60552)) b!516893))

(assert (=> d!79631 m!498237))

(declare-fun m!498401 () Bool)

(assert (=> d!79631 m!498401))

(assert (=> d!79631 m!498231))

(assert (=> d!79631 m!498255))

(assert (=> d!79631 m!498255))

(assert (=> d!79631 m!498231))

(declare-fun m!498403 () Bool)

(assert (=> d!79631 m!498403))

(declare-fun m!498405 () Bool)

(assert (=> d!79631 m!498405))

(declare-fun m!498407 () Bool)

(assert (=> d!79631 m!498407))

(declare-fun m!498409 () Bool)

(assert (=> b!516891 m!498409))

(assert (=> b!516893 m!498231))

(declare-fun m!498411 () Bool)

(assert (=> b!516893 m!498411))

(assert (=> b!516703 d!79631))

(declare-fun b!516906 () Bool)

(declare-fun e!301650 () Bool)

(declare-fun call!31657 () Bool)

(assert (=> b!516906 (= e!301650 call!31657)))

(declare-fun bm!31654 () Bool)

(declare-fun c!60556 () Bool)

(assert (=> bm!31654 (= call!31657 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60556 (Cons!10067 (select (arr!15913 a!3235) #b00000000000000000000000000000000) Nil!10068) Nil!10068)))))

(declare-fun d!79633 () Bool)

(declare-fun res!316375 () Bool)

(declare-fun e!301651 () Bool)

(assert (=> d!79633 (=> res!316375 e!301651)))

(assert (=> d!79633 (= res!316375 (bvsge #b00000000000000000000000000000000 (size!16277 a!3235)))))

(assert (=> d!79633 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10068) e!301651)))

(declare-fun b!516907 () Bool)

(declare-fun e!301652 () Bool)

(assert (=> b!516907 (= e!301651 e!301652)))

(declare-fun res!316376 () Bool)

(assert (=> b!516907 (=> (not res!316376) (not e!301652))))

(declare-fun e!301649 () Bool)

(assert (=> b!516907 (= res!316376 (not e!301649))))

(declare-fun res!316374 () Bool)

(assert (=> b!516907 (=> (not res!316374) (not e!301649))))

(assert (=> b!516907 (= res!316374 (validKeyInArray!0 (select (arr!15913 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!516908 () Bool)

(assert (=> b!516908 (= e!301652 e!301650)))

(assert (=> b!516908 (= c!60556 (validKeyInArray!0 (select (arr!15913 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!516909 () Bool)

(assert (=> b!516909 (= e!301650 call!31657)))

(declare-fun b!516910 () Bool)

(declare-fun contains!2742 (List!10071 (_ BitVec 64)) Bool)

(assert (=> b!516910 (= e!301649 (contains!2742 Nil!10068 (select (arr!15913 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79633 (not res!316375)) b!516907))

(assert (= (and b!516907 res!316374) b!516910))

(assert (= (and b!516907 res!316376) b!516908))

(assert (= (and b!516908 c!60556) b!516909))

(assert (= (and b!516908 (not c!60556)) b!516906))

(assert (= (or b!516909 b!516906) bm!31654))

(assert (=> bm!31654 m!498373))

(declare-fun m!498413 () Bool)

(assert (=> bm!31654 m!498413))

(assert (=> b!516907 m!498373))

(assert (=> b!516907 m!498373))

(assert (=> b!516907 m!498393))

(assert (=> b!516908 m!498373))

(assert (=> b!516908 m!498373))

(assert (=> b!516908 m!498393))

(assert (=> b!516910 m!498373))

(assert (=> b!516910 m!498373))

(declare-fun m!498415 () Bool)

(assert (=> b!516910 m!498415))

(assert (=> b!516709 d!79633))

(declare-fun d!79641 () Bool)

(assert (=> d!79641 (= (validKeyInArray!0 (select (arr!15913 a!3235) j!176)) (and (not (= (select (arr!15913 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15913 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!516704 d!79641))

(check-sat (not b!516887) (not d!79575) (not bm!31651) (not b!516910) (not b!516842) (not d!79595) (not b!516870) (not bm!31654) (not d!79631) (not d!79597) (not b!516907) (not b!516837) (not bm!31646) (not b!516886) (not b!516908) (not b!516893) (not b!516759) (not b!516836) (not d!79579) (not b!516805))
(check-sat)
