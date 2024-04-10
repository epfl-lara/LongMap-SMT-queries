; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48146 () Bool)

(assert start!48146)

(declare-fun e!309024 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33582 0))(
  ( (array!33583 (arr!16138 (Array (_ BitVec 32) (_ BitVec 64))) (size!16502 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33582)

(declare-fun b!530368 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4605 0))(
  ( (MissingZero!4605 (index!20644 (_ BitVec 32))) (Found!4605 (index!20645 (_ BitVec 32))) (Intermediate!4605 (undefined!5417 Bool) (index!20646 (_ BitVec 32)) (x!49611 (_ BitVec 32))) (Undefined!4605) (MissingVacant!4605 (index!20647 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33582 (_ BitVec 32)) SeekEntryResult!4605)

(assert (=> b!530368 (= e!309024 (= (seekEntryOrOpen!0 (select (arr!16138 a!3235) j!176) a!3235 mask!3524) (Found!4605 j!176)))))

(declare-fun b!530369 () Bool)

(declare-fun res!326079 () Bool)

(declare-fun e!309022 () Bool)

(assert (=> b!530369 (=> (not res!326079) (not e!309022))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530369 (= res!326079 (validKeyInArray!0 k0!2280))))

(declare-fun b!530370 () Bool)

(declare-fun res!326083 () Bool)

(assert (=> b!530370 (=> (not res!326083) (not e!309022))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!530370 (= res!326083 (and (= (size!16502 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16502 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16502 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!530371 () Bool)

(declare-fun res!326082 () Bool)

(assert (=> b!530371 (=> (not res!326082) (not e!309022))))

(assert (=> b!530371 (= res!326082 (validKeyInArray!0 (select (arr!16138 a!3235) j!176)))))

(declare-fun b!530372 () Bool)

(declare-fun e!309026 () Bool)

(assert (=> b!530372 (= e!309026 true)))

(declare-fun lt!244723 () SeekEntryResult!4605)

(declare-fun lt!244729 () (_ BitVec 64))

(declare-fun lt!244726 () array!33582)

(assert (=> b!530372 (= lt!244723 (seekEntryOrOpen!0 lt!244729 lt!244726 mask!3524))))

(assert (=> b!530372 false))

(declare-fun b!530374 () Bool)

(declare-fun res!326081 () Bool)

(declare-fun e!309027 () Bool)

(assert (=> b!530374 (=> (not res!326081) (not e!309027))))

(declare-datatypes ((List!10296 0))(
  ( (Nil!10293) (Cons!10292 (h!11232 (_ BitVec 64)) (t!16524 List!10296)) )
))
(declare-fun arrayNoDuplicates!0 (array!33582 (_ BitVec 32) List!10296) Bool)

(assert (=> b!530374 (= res!326081 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10293))))

(declare-fun b!530375 () Bool)

(assert (=> b!530375 (= e!309022 e!309027)))

(declare-fun res!326078 () Bool)

(assert (=> b!530375 (=> (not res!326078) (not e!309027))))

(declare-fun lt!244727 () SeekEntryResult!4605)

(assert (=> b!530375 (= res!326078 (or (= lt!244727 (MissingZero!4605 i!1204)) (= lt!244727 (MissingVacant!4605 i!1204))))))

(assert (=> b!530375 (= lt!244727 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!530376 () Bool)

(declare-fun res!326084 () Bool)

(assert (=> b!530376 (=> (not res!326084) (not e!309027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33582 (_ BitVec 32)) Bool)

(assert (=> b!530376 (= res!326084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!530377 () Bool)

(declare-fun res!326077 () Bool)

(assert (=> b!530377 (=> (not res!326077) (not e!309022))))

(declare-fun arrayContainsKey!0 (array!33582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530377 (= res!326077 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!530378 () Bool)

(declare-fun e!309025 () Bool)

(assert (=> b!530378 (= e!309027 (not e!309025))))

(declare-fun res!326074 () Bool)

(assert (=> b!530378 (=> res!326074 e!309025)))

(declare-fun lt!244721 () SeekEntryResult!4605)

(declare-fun lt!244722 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33582 (_ BitVec 32)) SeekEntryResult!4605)

(assert (=> b!530378 (= res!326074 (= lt!244721 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244722 lt!244729 lt!244726 mask!3524)))))

(declare-fun lt!244725 () (_ BitVec 32))

(assert (=> b!530378 (= lt!244721 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!244725 (select (arr!16138 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!530378 (= lt!244722 (toIndex!0 lt!244729 mask!3524))))

(assert (=> b!530378 (= lt!244729 (select (store (arr!16138 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!530378 (= lt!244725 (toIndex!0 (select (arr!16138 a!3235) j!176) mask!3524))))

(assert (=> b!530378 (= lt!244726 (array!33583 (store (arr!16138 a!3235) i!1204 k0!2280) (size!16502 a!3235)))))

(assert (=> b!530378 e!309024))

(declare-fun res!326080 () Bool)

(assert (=> b!530378 (=> (not res!326080) (not e!309024))))

(assert (=> b!530378 (= res!326080 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16822 0))(
  ( (Unit!16823) )
))
(declare-fun lt!244724 () Unit!16822)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33582 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16822)

(assert (=> b!530378 (= lt!244724 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!326076 () Bool)

(assert (=> start!48146 (=> (not res!326076) (not e!309022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48146 (= res!326076 (validMask!0 mask!3524))))

(assert (=> start!48146 e!309022))

(assert (=> start!48146 true))

(declare-fun array_inv!11934 (array!33582) Bool)

(assert (=> start!48146 (array_inv!11934 a!3235)))

(declare-fun b!530373 () Bool)

(assert (=> b!530373 (= e!309025 e!309026)))

(declare-fun res!326075 () Bool)

(assert (=> b!530373 (=> res!326075 e!309026)))

(declare-fun lt!244728 () Bool)

(assert (=> b!530373 (= res!326075 (or (and (not lt!244728) (undefined!5417 lt!244721)) (and (not lt!244728) (not (undefined!5417 lt!244721)))))))

(get-info :version)

(assert (=> b!530373 (= lt!244728 (not ((_ is Intermediate!4605) lt!244721)))))

(assert (= (and start!48146 res!326076) b!530370))

(assert (= (and b!530370 res!326083) b!530371))

(assert (= (and b!530371 res!326082) b!530369))

(assert (= (and b!530369 res!326079) b!530377))

(assert (= (and b!530377 res!326077) b!530375))

(assert (= (and b!530375 res!326078) b!530376))

(assert (= (and b!530376 res!326084) b!530374))

(assert (= (and b!530374 res!326081) b!530378))

(assert (= (and b!530378 res!326080) b!530368))

(assert (= (and b!530378 (not res!326074)) b!530373))

(assert (= (and b!530373 (not res!326075)) b!530372))

(declare-fun m!510941 () Bool)

(assert (=> start!48146 m!510941))

(declare-fun m!510943 () Bool)

(assert (=> start!48146 m!510943))

(declare-fun m!510945 () Bool)

(assert (=> b!530374 m!510945))

(declare-fun m!510947 () Bool)

(assert (=> b!530378 m!510947))

(declare-fun m!510949 () Bool)

(assert (=> b!530378 m!510949))

(declare-fun m!510951 () Bool)

(assert (=> b!530378 m!510951))

(declare-fun m!510953 () Bool)

(assert (=> b!530378 m!510953))

(declare-fun m!510955 () Bool)

(assert (=> b!530378 m!510955))

(declare-fun m!510957 () Bool)

(assert (=> b!530378 m!510957))

(declare-fun m!510959 () Bool)

(assert (=> b!530378 m!510959))

(assert (=> b!530378 m!510955))

(declare-fun m!510961 () Bool)

(assert (=> b!530378 m!510961))

(assert (=> b!530378 m!510955))

(declare-fun m!510963 () Bool)

(assert (=> b!530378 m!510963))

(declare-fun m!510965 () Bool)

(assert (=> b!530372 m!510965))

(declare-fun m!510967 () Bool)

(assert (=> b!530369 m!510967))

(declare-fun m!510969 () Bool)

(assert (=> b!530375 m!510969))

(assert (=> b!530368 m!510955))

(assert (=> b!530368 m!510955))

(declare-fun m!510971 () Bool)

(assert (=> b!530368 m!510971))

(declare-fun m!510973 () Bool)

(assert (=> b!530376 m!510973))

(declare-fun m!510975 () Bool)

(assert (=> b!530377 m!510975))

(assert (=> b!530371 m!510955))

(assert (=> b!530371 m!510955))

(declare-fun m!510977 () Bool)

(assert (=> b!530371 m!510977))

(check-sat (not b!530375) (not b!530369) (not b!530378) (not b!530374) (not b!530368) (not b!530377) (not b!530376) (not start!48146) (not b!530371) (not b!530372))
(check-sat)
