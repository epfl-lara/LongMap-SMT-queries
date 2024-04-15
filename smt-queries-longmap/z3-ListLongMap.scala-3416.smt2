; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47406 () Bool)

(assert start!47406)

(declare-fun b!521475 () Bool)

(declare-fun res!319375 () Bool)

(declare-fun e!304199 () Bool)

(assert (=> b!521475 (=> (not res!319375) (not e!304199))))

(declare-datatypes ((array!33242 0))(
  ( (array!33243 (arr!15977 (Array (_ BitVec 32) (_ BitVec 64))) (size!16342 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33242)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521475 (= res!319375 (validKeyInArray!0 (select (arr!15977 a!3235) j!176)))))

(declare-fun b!521476 () Bool)

(declare-fun e!304195 () Bool)

(assert (=> b!521476 (= e!304195 true)))

(declare-datatypes ((SeekEntryResult!4441 0))(
  ( (MissingZero!4441 (index!19967 (_ BitVec 32))) (Found!4441 (index!19968 (_ BitVec 32))) (Intermediate!4441 (undefined!5253 Bool) (index!19969 (_ BitVec 32)) (x!48958 (_ BitVec 32))) (Undefined!4441) (MissingVacant!4441 (index!19970 (_ BitVec 32))) )
))
(declare-fun lt!238930 () SeekEntryResult!4441)

(assert (=> b!521476 (and (or (= (select (arr!15977 a!3235) (index!19969 lt!238930)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15977 a!3235) (index!19969 lt!238930)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15977 a!3235) (index!19969 lt!238930)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15977 a!3235) (index!19969 lt!238930)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16210 0))(
  ( (Unit!16211) )
))
(declare-fun lt!238925 () Unit!16210)

(declare-fun e!304197 () Unit!16210)

(assert (=> b!521476 (= lt!238925 e!304197)))

(declare-fun c!61353 () Bool)

(assert (=> b!521476 (= c!61353 (= (select (arr!15977 a!3235) (index!19969 lt!238930)) (select (arr!15977 a!3235) j!176)))))

(assert (=> b!521476 (and (bvslt (x!48958 lt!238930) #b01111111111111111111111111111110) (or (= (select (arr!15977 a!3235) (index!19969 lt!238930)) (select (arr!15977 a!3235) j!176)) (= (select (arr!15977 a!3235) (index!19969 lt!238930)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15977 a!3235) (index!19969 lt!238930)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521477 () Bool)

(declare-fun e!304198 () Bool)

(assert (=> b!521477 (= e!304198 false)))

(declare-fun b!521478 () Bool)

(declare-fun Unit!16212 () Unit!16210)

(assert (=> b!521478 (= e!304197 Unit!16212)))

(declare-fun b!521479 () Bool)

(declare-fun res!319378 () Bool)

(assert (=> b!521479 (=> (not res!319378) (not e!304199))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33242 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521479 (= res!319378 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!521480 () Bool)

(declare-fun e!304194 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33242 (_ BitVec 32)) SeekEntryResult!4441)

(assert (=> b!521480 (= e!304194 (= (seekEntryOrOpen!0 (select (arr!15977 a!3235) j!176) a!3235 mask!3524) (Found!4441 j!176)))))

(declare-fun b!521481 () Bool)

(declare-fun e!304196 () Bool)

(assert (=> b!521481 (= e!304199 e!304196)))

(declare-fun res!319380 () Bool)

(assert (=> b!521481 (=> (not res!319380) (not e!304196))))

(declare-fun lt!238922 () SeekEntryResult!4441)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521481 (= res!319380 (or (= lt!238922 (MissingZero!4441 i!1204)) (= lt!238922 (MissingVacant!4441 i!1204))))))

(assert (=> b!521481 (= lt!238922 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!521482 () Bool)

(assert (=> b!521482 (= e!304196 (not e!304195))))

(declare-fun res!319377 () Bool)

(assert (=> b!521482 (=> res!319377 e!304195)))

(declare-fun lt!238923 () (_ BitVec 32))

(declare-fun lt!238926 () (_ BitVec 64))

(declare-fun lt!238929 () array!33242)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33242 (_ BitVec 32)) SeekEntryResult!4441)

(assert (=> b!521482 (= res!319377 (= lt!238930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238923 lt!238926 lt!238929 mask!3524)))))

(declare-fun lt!238924 () (_ BitVec 32))

(assert (=> b!521482 (= lt!238930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238924 (select (arr!15977 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521482 (= lt!238923 (toIndex!0 lt!238926 mask!3524))))

(assert (=> b!521482 (= lt!238926 (select (store (arr!15977 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!521482 (= lt!238924 (toIndex!0 (select (arr!15977 a!3235) j!176) mask!3524))))

(assert (=> b!521482 (= lt!238929 (array!33243 (store (arr!15977 a!3235) i!1204 k0!2280) (size!16342 a!3235)))))

(assert (=> b!521482 e!304194))

(declare-fun res!319374 () Bool)

(assert (=> b!521482 (=> (not res!319374) (not e!304194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33242 (_ BitVec 32)) Bool)

(assert (=> b!521482 (= res!319374 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238927 () Unit!16210)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33242 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16210)

(assert (=> b!521482 (= lt!238927 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521483 () Bool)

(declare-fun res!319376 () Bool)

(assert (=> b!521483 (=> (not res!319376) (not e!304196))))

(assert (=> b!521483 (= res!319376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!521484 () Bool)

(declare-fun Unit!16213 () Unit!16210)

(assert (=> b!521484 (= e!304197 Unit!16213)))

(declare-fun lt!238928 () Unit!16210)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33242 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16210)

(assert (=> b!521484 (= lt!238928 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!238924 #b00000000000000000000000000000000 (index!19969 lt!238930) (x!48958 lt!238930) mask!3524))))

(declare-fun res!319382 () Bool)

(assert (=> b!521484 (= res!319382 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238924 lt!238926 lt!238929 mask!3524) (Intermediate!4441 false (index!19969 lt!238930) (x!48958 lt!238930))))))

(assert (=> b!521484 (=> (not res!319382) (not e!304198))))

(assert (=> b!521484 e!304198))

(declare-fun b!521485 () Bool)

(declare-fun res!319379 () Bool)

(assert (=> b!521485 (=> (not res!319379) (not e!304196))))

(declare-datatypes ((List!10174 0))(
  ( (Nil!10171) (Cons!10170 (h!11092 (_ BitVec 64)) (t!16393 List!10174)) )
))
(declare-fun arrayNoDuplicates!0 (array!33242 (_ BitVec 32) List!10174) Bool)

(assert (=> b!521485 (= res!319379 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10171))))

(declare-fun res!319373 () Bool)

(assert (=> start!47406 (=> (not res!319373) (not e!304199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47406 (= res!319373 (validMask!0 mask!3524))))

(assert (=> start!47406 e!304199))

(assert (=> start!47406 true))

(declare-fun array_inv!11860 (array!33242) Bool)

(assert (=> start!47406 (array_inv!11860 a!3235)))

(declare-fun b!521486 () Bool)

(declare-fun res!319372 () Bool)

(assert (=> b!521486 (=> (not res!319372) (not e!304199))))

(assert (=> b!521486 (= res!319372 (validKeyInArray!0 k0!2280))))

(declare-fun b!521487 () Bool)

(declare-fun res!319381 () Bool)

(assert (=> b!521487 (=> res!319381 e!304195)))

(get-info :version)

(assert (=> b!521487 (= res!319381 (or (undefined!5253 lt!238930) (not ((_ is Intermediate!4441) lt!238930))))))

(declare-fun b!521488 () Bool)

(declare-fun res!319371 () Bool)

(assert (=> b!521488 (=> (not res!319371) (not e!304199))))

(assert (=> b!521488 (= res!319371 (and (= (size!16342 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16342 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16342 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!47406 res!319373) b!521488))

(assert (= (and b!521488 res!319371) b!521475))

(assert (= (and b!521475 res!319375) b!521486))

(assert (= (and b!521486 res!319372) b!521479))

(assert (= (and b!521479 res!319378) b!521481))

(assert (= (and b!521481 res!319380) b!521483))

(assert (= (and b!521483 res!319376) b!521485))

(assert (= (and b!521485 res!319379) b!521482))

(assert (= (and b!521482 res!319374) b!521480))

(assert (= (and b!521482 (not res!319377)) b!521487))

(assert (= (and b!521487 (not res!319381)) b!521476))

(assert (= (and b!521476 c!61353) b!521484))

(assert (= (and b!521476 (not c!61353)) b!521478))

(assert (= (and b!521484 res!319382) b!521477))

(declare-fun m!501907 () Bool)

(assert (=> b!521485 m!501907))

(declare-fun m!501909 () Bool)

(assert (=> b!521475 m!501909))

(assert (=> b!521475 m!501909))

(declare-fun m!501911 () Bool)

(assert (=> b!521475 m!501911))

(declare-fun m!501913 () Bool)

(assert (=> b!521479 m!501913))

(declare-fun m!501915 () Bool)

(assert (=> b!521483 m!501915))

(declare-fun m!501917 () Bool)

(assert (=> b!521486 m!501917))

(assert (=> b!521480 m!501909))

(assert (=> b!521480 m!501909))

(declare-fun m!501919 () Bool)

(assert (=> b!521480 m!501919))

(declare-fun m!501921 () Bool)

(assert (=> start!47406 m!501921))

(declare-fun m!501923 () Bool)

(assert (=> start!47406 m!501923))

(declare-fun m!501925 () Bool)

(assert (=> b!521481 m!501925))

(declare-fun m!501927 () Bool)

(assert (=> b!521484 m!501927))

(declare-fun m!501929 () Bool)

(assert (=> b!521484 m!501929))

(declare-fun m!501931 () Bool)

(assert (=> b!521476 m!501931))

(assert (=> b!521476 m!501909))

(declare-fun m!501933 () Bool)

(assert (=> b!521482 m!501933))

(declare-fun m!501935 () Bool)

(assert (=> b!521482 m!501935))

(declare-fun m!501937 () Bool)

(assert (=> b!521482 m!501937))

(assert (=> b!521482 m!501909))

(declare-fun m!501939 () Bool)

(assert (=> b!521482 m!501939))

(declare-fun m!501941 () Bool)

(assert (=> b!521482 m!501941))

(declare-fun m!501943 () Bool)

(assert (=> b!521482 m!501943))

(assert (=> b!521482 m!501909))

(declare-fun m!501945 () Bool)

(assert (=> b!521482 m!501945))

(declare-fun m!501947 () Bool)

(assert (=> b!521482 m!501947))

(assert (=> b!521482 m!501909))

(check-sat (not b!521475) (not b!521485) (not b!521482) (not b!521483) (not b!521484) (not b!521480) (not b!521486) (not start!47406) (not b!521481) (not b!521479))
(check-sat)
