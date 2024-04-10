; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45020 () Bool)

(assert start!45020)

(declare-fun b!493946 () Bool)

(declare-fun res!296524 () Bool)

(declare-fun e!289989 () Bool)

(assert (=> b!493946 (=> (not res!296524) (not e!289989))))

(declare-datatypes ((array!31965 0))(
  ( (array!31966 (arr!15367 (Array (_ BitVec 32) (_ BitVec 64))) (size!15731 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31965)

(declare-datatypes ((List!9525 0))(
  ( (Nil!9522) (Cons!9521 (h!10389 (_ BitVec 64)) (t!15753 List!9525)) )
))
(declare-fun arrayNoDuplicates!0 (array!31965 (_ BitVec 32) List!9525) Bool)

(assert (=> b!493946 (= res!296524 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9522))))

(declare-fun b!493947 () Bool)

(declare-fun e!289987 () Bool)

(assert (=> b!493947 (= e!289987 e!289989)))

(declare-fun res!296517 () Bool)

(assert (=> b!493947 (=> (not res!296517) (not e!289989))))

(declare-datatypes ((SeekEntryResult!3834 0))(
  ( (MissingZero!3834 (index!17515 (_ BitVec 32))) (Found!3834 (index!17516 (_ BitVec 32))) (Intermediate!3834 (undefined!4646 Bool) (index!17517 (_ BitVec 32)) (x!46592 (_ BitVec 32))) (Undefined!3834) (MissingVacant!3834 (index!17518 (_ BitVec 32))) )
))
(declare-fun lt!223479 () SeekEntryResult!3834)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493947 (= res!296517 (or (= lt!223479 (MissingZero!3834 i!1204)) (= lt!223479 (MissingVacant!3834 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31965 (_ BitVec 32)) SeekEntryResult!3834)

(assert (=> b!493947 (= lt!223479 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493948 () Bool)

(declare-fun res!296521 () Bool)

(assert (=> b!493948 (=> (not res!296521) (not e!289989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31965 (_ BitVec 32)) Bool)

(assert (=> b!493948 (= res!296521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493949 () Bool)

(declare-fun res!296525 () Bool)

(assert (=> b!493949 (=> (not res!296525) (not e!289987))))

(declare-fun arrayContainsKey!0 (array!31965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493949 (= res!296525 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493950 () Bool)

(declare-fun res!296520 () Bool)

(assert (=> b!493950 (=> (not res!296520) (not e!289987))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493950 (= res!296520 (validKeyInArray!0 (select (arr!15367 a!3235) j!176)))))

(declare-fun b!493951 () Bool)

(declare-fun res!296516 () Bool)

(assert (=> b!493951 (=> (not res!296516) (not e!289987))))

(assert (=> b!493951 (= res!296516 (validKeyInArray!0 k0!2280))))

(declare-fun res!296519 () Bool)

(assert (=> start!45020 (=> (not res!296519) (not e!289987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45020 (= res!296519 (validMask!0 mask!3524))))

(assert (=> start!45020 e!289987))

(assert (=> start!45020 true))

(declare-fun array_inv!11163 (array!31965) Bool)

(assert (=> start!45020 (array_inv!11163 a!3235)))

(declare-fun b!493952 () Bool)

(declare-fun res!296522 () Bool)

(declare-fun e!289986 () Bool)

(assert (=> b!493952 (=> res!296522 e!289986)))

(declare-fun lt!223480 () SeekEntryResult!3834)

(get-info :version)

(assert (=> b!493952 (= res!296522 (or (not ((_ is Intermediate!3834) lt!223480)) (not (undefined!4646 lt!223480))))))

(declare-fun b!493953 () Bool)

(assert (=> b!493953 (= e!289989 (not e!289986))))

(declare-fun res!296518 () Bool)

(assert (=> b!493953 (=> res!296518 e!289986)))

(declare-fun lt!223476 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31965 (_ BitVec 32)) SeekEntryResult!3834)

(assert (=> b!493953 (= res!296518 (= lt!223480 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223476 (select (store (arr!15367 a!3235) i!1204 k0!2280) j!176) (array!31966 (store (arr!15367 a!3235) i!1204 k0!2280) (size!15731 a!3235)) mask!3524)))))

(declare-fun lt!223478 () (_ BitVec 32))

(assert (=> b!493953 (= lt!223480 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223478 (select (arr!15367 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493953 (= lt!223476 (toIndex!0 (select (store (arr!15367 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493953 (= lt!223478 (toIndex!0 (select (arr!15367 a!3235) j!176) mask!3524))))

(declare-fun lt!223475 () SeekEntryResult!3834)

(assert (=> b!493953 (= lt!223475 (Found!3834 j!176))))

(assert (=> b!493953 (= lt!223475 (seekEntryOrOpen!0 (select (arr!15367 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!493953 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14614 0))(
  ( (Unit!14615) )
))
(declare-fun lt!223477 () Unit!14614)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31965 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14614)

(assert (=> b!493953 (= lt!223477 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493954 () Bool)

(declare-fun res!296523 () Bool)

(assert (=> b!493954 (=> (not res!296523) (not e!289987))))

(assert (=> b!493954 (= res!296523 (and (= (size!15731 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15731 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15731 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493955 () Bool)

(assert (=> b!493955 (= e!289986 (bvsge mask!3524 #b00000000000000000000000000000000))))

(assert (=> b!493955 (= lt!223475 Undefined!3834)))

(assert (= (and start!45020 res!296519) b!493954))

(assert (= (and b!493954 res!296523) b!493950))

(assert (= (and b!493950 res!296520) b!493951))

(assert (= (and b!493951 res!296516) b!493949))

(assert (= (and b!493949 res!296525) b!493947))

(assert (= (and b!493947 res!296517) b!493948))

(assert (= (and b!493948 res!296521) b!493946))

(assert (= (and b!493946 res!296524) b!493953))

(assert (= (and b!493953 (not res!296518)) b!493952))

(assert (= (and b!493952 (not res!296522)) b!493955))

(declare-fun m!474891 () Bool)

(assert (=> b!493946 m!474891))

(declare-fun m!474893 () Bool)

(assert (=> b!493949 m!474893))

(declare-fun m!474895 () Bool)

(assert (=> b!493951 m!474895))

(declare-fun m!474897 () Bool)

(assert (=> b!493948 m!474897))

(declare-fun m!474899 () Bool)

(assert (=> b!493947 m!474899))

(declare-fun m!474901 () Bool)

(assert (=> b!493953 m!474901))

(declare-fun m!474903 () Bool)

(assert (=> b!493953 m!474903))

(declare-fun m!474905 () Bool)

(assert (=> b!493953 m!474905))

(declare-fun m!474907 () Bool)

(assert (=> b!493953 m!474907))

(assert (=> b!493953 m!474905))

(declare-fun m!474909 () Bool)

(assert (=> b!493953 m!474909))

(assert (=> b!493953 m!474905))

(declare-fun m!474911 () Bool)

(assert (=> b!493953 m!474911))

(assert (=> b!493953 m!474903))

(declare-fun m!474913 () Bool)

(assert (=> b!493953 m!474913))

(declare-fun m!474915 () Bool)

(assert (=> b!493953 m!474915))

(assert (=> b!493953 m!474905))

(declare-fun m!474917 () Bool)

(assert (=> b!493953 m!474917))

(assert (=> b!493953 m!474903))

(declare-fun m!474919 () Bool)

(assert (=> b!493953 m!474919))

(assert (=> b!493950 m!474905))

(assert (=> b!493950 m!474905))

(declare-fun m!474921 () Bool)

(assert (=> b!493950 m!474921))

(declare-fun m!474923 () Bool)

(assert (=> start!45020 m!474923))

(declare-fun m!474925 () Bool)

(assert (=> start!45020 m!474925))

(check-sat (not b!493948) (not b!493947) (not b!493951) (not b!493949) (not b!493950) (not b!493953) (not b!493946) (not start!45020))
(check-sat)
