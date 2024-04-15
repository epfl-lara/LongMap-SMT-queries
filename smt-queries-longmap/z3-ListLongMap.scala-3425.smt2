; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47526 () Bool)

(assert start!47526)

(declare-fun b!522936 () Bool)

(declare-fun e!304973 () Bool)

(declare-fun e!304975 () Bool)

(assert (=> b!522936 (= e!304973 e!304975)))

(declare-fun res!320479 () Bool)

(assert (=> b!522936 (=> (not res!320479) (not e!304975))))

(declare-datatypes ((SeekEntryResult!4468 0))(
  ( (MissingZero!4468 (index!20078 (_ BitVec 32))) (Found!4468 (index!20079 (_ BitVec 32))) (Intermediate!4468 (undefined!5280 Bool) (index!20080 (_ BitVec 32)) (x!49066 (_ BitVec 32))) (Undefined!4468) (MissingVacant!4468 (index!20081 (_ BitVec 32))) )
))
(declare-fun lt!239798 () SeekEntryResult!4468)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!522936 (= res!320479 (or (= lt!239798 (MissingZero!4468 i!1204)) (= lt!239798 (MissingVacant!4468 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33299 0))(
  ( (array!33300 (arr!16004 (Array (_ BitVec 32) (_ BitVec 64))) (size!16369 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33299)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33299 (_ BitVec 32)) SeekEntryResult!4468)

(assert (=> b!522936 (= lt!239798 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!522937 () Bool)

(declare-datatypes ((Unit!16318 0))(
  ( (Unit!16319) )
))
(declare-fun e!304974 () Unit!16318)

(declare-fun Unit!16320 () Unit!16318)

(assert (=> b!522937 (= e!304974 Unit!16320)))

(declare-fun lt!239800 () SeekEntryResult!4468)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!239796 () (_ BitVec 32))

(declare-fun lt!239799 () Unit!16318)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33299 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16318)

(assert (=> b!522937 (= lt!239799 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!239796 #b00000000000000000000000000000000 (index!20080 lt!239800) (x!49066 lt!239800) mask!3524))))

(declare-fun lt!239797 () (_ BitVec 64))

(declare-fun lt!239795 () array!33299)

(declare-fun res!320476 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33299 (_ BitVec 32)) SeekEntryResult!4468)

(assert (=> b!522937 (= res!320476 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239796 lt!239797 lt!239795 mask!3524) (Intermediate!4468 false (index!20080 lt!239800) (x!49066 lt!239800))))))

(declare-fun e!304976 () Bool)

(assert (=> b!522937 (=> (not res!320476) (not e!304976))))

(assert (=> b!522937 e!304976))

(declare-fun b!522938 () Bool)

(declare-fun res!320473 () Bool)

(declare-fun e!304971 () Bool)

(assert (=> b!522938 (=> res!320473 e!304971)))

(get-info :version)

(assert (=> b!522938 (= res!320473 (or (undefined!5280 lt!239800) (not ((_ is Intermediate!4468) lt!239800))))))

(declare-fun e!304972 () Bool)

(declare-fun b!522939 () Bool)

(assert (=> b!522939 (= e!304972 (= (seekEntryOrOpen!0 (select (arr!16004 a!3235) j!176) a!3235 mask!3524) (Found!4468 j!176)))))

(declare-fun b!522940 () Bool)

(assert (=> b!522940 (= e!304971 (or (bvsgt #b00000000000000000000000000000000 (x!49066 lt!239800)) (bvsle (x!49066 lt!239800) #b01111111111111111111111111111110)))))

(assert (=> b!522940 (and (or (= (select (arr!16004 a!3235) (index!20080 lt!239800)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16004 a!3235) (index!20080 lt!239800)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16004 a!3235) (index!20080 lt!239800)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16004 a!3235) (index!20080 lt!239800)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!239802 () Unit!16318)

(assert (=> b!522940 (= lt!239802 e!304974)))

(declare-fun c!61536 () Bool)

(assert (=> b!522940 (= c!61536 (= (select (arr!16004 a!3235) (index!20080 lt!239800)) (select (arr!16004 a!3235) j!176)))))

(assert (=> b!522940 (and (bvslt (x!49066 lt!239800) #b01111111111111111111111111111110) (or (= (select (arr!16004 a!3235) (index!20080 lt!239800)) (select (arr!16004 a!3235) j!176)) (= (select (arr!16004 a!3235) (index!20080 lt!239800)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16004 a!3235) (index!20080 lt!239800)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!522941 () Bool)

(declare-fun Unit!16321 () Unit!16318)

(assert (=> b!522941 (= e!304974 Unit!16321)))

(declare-fun b!522942 () Bool)

(declare-fun res!320478 () Bool)

(assert (=> b!522942 (=> (not res!320478) (not e!304973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!522942 (= res!320478 (validKeyInArray!0 k0!2280))))

(declare-fun b!522943 () Bool)

(declare-fun res!320469 () Bool)

(assert (=> b!522943 (=> (not res!320469) (not e!304973))))

(assert (=> b!522943 (= res!320469 (and (= (size!16369 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16369 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16369 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!522944 () Bool)

(declare-fun res!320472 () Bool)

(assert (=> b!522944 (=> (not res!320472) (not e!304975))))

(declare-datatypes ((List!10201 0))(
  ( (Nil!10198) (Cons!10197 (h!11122 (_ BitVec 64)) (t!16420 List!10201)) )
))
(declare-fun arrayNoDuplicates!0 (array!33299 (_ BitVec 32) List!10201) Bool)

(assert (=> b!522944 (= res!320472 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10198))))

(declare-fun b!522946 () Bool)

(declare-fun res!320471 () Bool)

(assert (=> b!522946 (=> (not res!320471) (not e!304973))))

(assert (=> b!522946 (= res!320471 (validKeyInArray!0 (select (arr!16004 a!3235) j!176)))))

(declare-fun b!522947 () Bool)

(assert (=> b!522947 (= e!304976 false)))

(declare-fun b!522948 () Bool)

(assert (=> b!522948 (= e!304975 (not e!304971))))

(declare-fun res!320480 () Bool)

(assert (=> b!522948 (=> res!320480 e!304971)))

(declare-fun lt!239803 () (_ BitVec 32))

(assert (=> b!522948 (= res!320480 (= lt!239800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239803 lt!239797 lt!239795 mask!3524)))))

(assert (=> b!522948 (= lt!239800 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!239796 (select (arr!16004 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!522948 (= lt!239803 (toIndex!0 lt!239797 mask!3524))))

(assert (=> b!522948 (= lt!239797 (select (store (arr!16004 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!522948 (= lt!239796 (toIndex!0 (select (arr!16004 a!3235) j!176) mask!3524))))

(assert (=> b!522948 (= lt!239795 (array!33300 (store (arr!16004 a!3235) i!1204 k0!2280) (size!16369 a!3235)))))

(assert (=> b!522948 e!304972))

(declare-fun res!320470 () Bool)

(assert (=> b!522948 (=> (not res!320470) (not e!304972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33299 (_ BitVec 32)) Bool)

(assert (=> b!522948 (= res!320470 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!239801 () Unit!16318)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16318)

(assert (=> b!522948 (= lt!239801 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!522949 () Bool)

(declare-fun res!320477 () Bool)

(assert (=> b!522949 (=> (not res!320477) (not e!304973))))

(declare-fun arrayContainsKey!0 (array!33299 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!522949 (= res!320477 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!522945 () Bool)

(declare-fun res!320474 () Bool)

(assert (=> b!522945 (=> (not res!320474) (not e!304975))))

(assert (=> b!522945 (= res!320474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!320475 () Bool)

(assert (=> start!47526 (=> (not res!320475) (not e!304973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47526 (= res!320475 (validMask!0 mask!3524))))

(assert (=> start!47526 e!304973))

(assert (=> start!47526 true))

(declare-fun array_inv!11887 (array!33299) Bool)

(assert (=> start!47526 (array_inv!11887 a!3235)))

(assert (= (and start!47526 res!320475) b!522943))

(assert (= (and b!522943 res!320469) b!522946))

(assert (= (and b!522946 res!320471) b!522942))

(assert (= (and b!522942 res!320478) b!522949))

(assert (= (and b!522949 res!320477) b!522936))

(assert (= (and b!522936 res!320479) b!522945))

(assert (= (and b!522945 res!320474) b!522944))

(assert (= (and b!522944 res!320472) b!522948))

(assert (= (and b!522948 res!320470) b!522939))

(assert (= (and b!522948 (not res!320480)) b!522938))

(assert (= (and b!522938 (not res!320473)) b!522940))

(assert (= (and b!522940 c!61536) b!522937))

(assert (= (and b!522940 (not c!61536)) b!522941))

(assert (= (and b!522937 res!320476) b!522947))

(declare-fun m!503275 () Bool)

(assert (=> b!522937 m!503275))

(declare-fun m!503277 () Bool)

(assert (=> b!522937 m!503277))

(declare-fun m!503279 () Bool)

(assert (=> b!522939 m!503279))

(assert (=> b!522939 m!503279))

(declare-fun m!503281 () Bool)

(assert (=> b!522939 m!503281))

(declare-fun m!503283 () Bool)

(assert (=> b!522948 m!503283))

(declare-fun m!503285 () Bool)

(assert (=> b!522948 m!503285))

(declare-fun m!503287 () Bool)

(assert (=> b!522948 m!503287))

(declare-fun m!503289 () Bool)

(assert (=> b!522948 m!503289))

(assert (=> b!522948 m!503279))

(declare-fun m!503291 () Bool)

(assert (=> b!522948 m!503291))

(assert (=> b!522948 m!503279))

(declare-fun m!503293 () Bool)

(assert (=> b!522948 m!503293))

(assert (=> b!522948 m!503279))

(declare-fun m!503295 () Bool)

(assert (=> b!522948 m!503295))

(declare-fun m!503297 () Bool)

(assert (=> b!522948 m!503297))

(declare-fun m!503299 () Bool)

(assert (=> b!522949 m!503299))

(declare-fun m!503301 () Bool)

(assert (=> b!522945 m!503301))

(declare-fun m!503303 () Bool)

(assert (=> start!47526 m!503303))

(declare-fun m!503305 () Bool)

(assert (=> start!47526 m!503305))

(assert (=> b!522946 m!503279))

(assert (=> b!522946 m!503279))

(declare-fun m!503307 () Bool)

(assert (=> b!522946 m!503307))

(declare-fun m!503309 () Bool)

(assert (=> b!522944 m!503309))

(declare-fun m!503311 () Bool)

(assert (=> b!522940 m!503311))

(assert (=> b!522940 m!503279))

(declare-fun m!503313 () Bool)

(assert (=> b!522942 m!503313))

(declare-fun m!503315 () Bool)

(assert (=> b!522936 m!503315))

(check-sat (not b!522936) (not b!522937) (not b!522944) (not b!522948) (not b!522949) (not start!47526) (not b!522942) (not b!522945) (not b!522939) (not b!522946))
(check-sat)
