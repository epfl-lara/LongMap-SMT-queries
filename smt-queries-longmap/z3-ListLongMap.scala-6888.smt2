; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86584 () Bool)

(assert start!86584)

(declare-fun b!1003965 () Bool)

(declare-fun e!565403 () Bool)

(declare-fun e!565405 () Bool)

(assert (=> b!1003965 (= e!565403 e!565405)))

(declare-fun res!673450 () Bool)

(assert (=> b!1003965 (=> (not res!673450) (not e!565405))))

(declare-datatypes ((SeekEntryResult!9450 0))(
  ( (MissingZero!9450 (index!40171 (_ BitVec 32))) (Found!9450 (index!40172 (_ BitVec 32))) (Intermediate!9450 (undefined!10262 Bool) (index!40173 (_ BitVec 32)) (x!87574 (_ BitVec 32))) (Undefined!9450) (MissingVacant!9450 (index!40174 (_ BitVec 32))) )
))
(declare-fun lt!443944 () SeekEntryResult!9450)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003965 (= res!673450 (or (= lt!443944 (MissingVacant!9450 i!1194)) (= lt!443944 (MissingZero!9450 i!1194))))))

(declare-datatypes ((array!63385 0))(
  ( (array!63386 (arr!30518 (Array (_ BitVec 32) (_ BitVec 64))) (size!31020 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63385)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63385 (_ BitVec 32)) SeekEntryResult!9450)

(assert (=> b!1003965 (= lt!443944 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1003966 () Bool)

(declare-fun res!673446 () Bool)

(assert (=> b!1003966 (=> (not res!673446) (not e!565403))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1003966 (= res!673446 (and (= (size!31020 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31020 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31020 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003967 () Bool)

(declare-fun e!565404 () Bool)

(assert (=> b!1003967 (= e!565405 e!565404)))

(declare-fun res!673444 () Bool)

(assert (=> b!1003967 (=> (not res!673444) (not e!565404))))

(declare-fun lt!443940 () SeekEntryResult!9450)

(declare-fun lt!443943 () SeekEntryResult!9450)

(assert (=> b!1003967 (= res!673444 (= lt!443940 lt!443943))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003967 (= lt!443943 (Intermediate!9450 false resIndex!38 resX!38))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63385 (_ BitVec 32)) SeekEntryResult!9450)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003967 (= lt!443940 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30518 a!3219) j!170) mask!3464) (select (arr!30518 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003968 () Bool)

(declare-fun res!673449 () Bool)

(assert (=> b!1003968 (=> (not res!673449) (not e!565405))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63385 (_ BitVec 32)) Bool)

(assert (=> b!1003968 (= res!673449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003969 () Bool)

(declare-fun res!673454 () Bool)

(declare-fun e!565402 () Bool)

(assert (=> b!1003969 (=> (not res!673454) (not e!565402))))

(declare-fun lt!443939 () SeekEntryResult!9450)

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun lt!443938 () (_ BitVec 64))

(declare-fun lt!443942 () array!63385)

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!1003969 (= res!673454 (not (= lt!443939 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443938 lt!443942 mask!3464))))))

(declare-fun b!1003970 () Bool)

(declare-fun res!673453 () Bool)

(declare-fun e!565399 () Bool)

(assert (=> b!1003970 (=> (not res!673453) (not e!565399))))

(declare-fun lt!443941 () (_ BitVec 32))

(assert (=> b!1003970 (= res!673453 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443941 (select (arr!30518 a!3219) j!170) a!3219 mask!3464) lt!443943))))

(declare-fun b!1003971 () Bool)

(assert (=> b!1003971 (= e!565402 e!565399)))

(declare-fun res!673455 () Bool)

(assert (=> b!1003971 (=> (not res!673455) (not e!565399))))

(assert (=> b!1003971 (= res!673455 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443941 #b00000000000000000000000000000000) (bvslt lt!443941 (size!31020 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003971 (= lt!443941 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003972 () Bool)

(declare-fun e!565400 () Bool)

(assert (=> b!1003972 (= e!565400 e!565402)))

(declare-fun res!673443 () Bool)

(assert (=> b!1003972 (=> (not res!673443) (not e!565402))))

(assert (=> b!1003972 (= res!673443 (not (= lt!443940 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443938 mask!3464) lt!443938 lt!443942 mask!3464))))))

(assert (=> b!1003972 (= lt!443938 (select (store (arr!30518 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1003972 (= lt!443942 (array!63386 (store (arr!30518 a!3219) i!1194 k0!2224) (size!31020 a!3219)))))

(declare-fun b!1003973 () Bool)

(declare-fun res!673451 () Bool)

(assert (=> b!1003973 (=> (not res!673451) (not e!565403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003973 (= res!673451 (validKeyInArray!0 (select (arr!30518 a!3219) j!170)))))

(declare-fun b!1003974 () Bool)

(declare-fun res!673447 () Bool)

(assert (=> b!1003974 (=> (not res!673447) (not e!565403))))

(declare-fun arrayContainsKey!0 (array!63385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003974 (= res!673447 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003975 () Bool)

(declare-fun res!673445 () Bool)

(assert (=> b!1003975 (=> (not res!673445) (not e!565403))))

(assert (=> b!1003975 (= res!673445 (validKeyInArray!0 k0!2224))))

(declare-fun b!1003976 () Bool)

(declare-fun res!673458 () Bool)

(assert (=> b!1003976 (=> (not res!673458) (not e!565405))))

(assert (=> b!1003976 (= res!673458 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31020 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31020 a!3219))))))

(declare-fun b!1003978 () Bool)

(assert (=> b!1003978 (= e!565399 false)))

(declare-fun lt!443945 () SeekEntryResult!9450)

(assert (=> b!1003978 (= lt!443945 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443941 lt!443938 lt!443942 mask!3464))))

(declare-fun b!1003979 () Bool)

(assert (=> b!1003979 (= e!565404 e!565400)))

(declare-fun res!673456 () Bool)

(assert (=> b!1003979 (=> (not res!673456) (not e!565400))))

(assert (=> b!1003979 (= res!673456 (= lt!443939 lt!443943))))

(assert (=> b!1003979 (= lt!443939 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30518 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003980 () Bool)

(declare-fun res!673452 () Bool)

(assert (=> b!1003980 (=> (not res!673452) (not e!565405))))

(declare-datatypes ((List!21194 0))(
  ( (Nil!21191) (Cons!21190 (h!22367 (_ BitVec 64)) (t!30195 List!21194)) )
))
(declare-fun arrayNoDuplicates!0 (array!63385 (_ BitVec 32) List!21194) Bool)

(assert (=> b!1003980 (= res!673452 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21191))))

(declare-fun res!673457 () Bool)

(assert (=> start!86584 (=> (not res!673457) (not e!565403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86584 (= res!673457 (validMask!0 mask!3464))))

(assert (=> start!86584 e!565403))

(declare-fun array_inv!23642 (array!63385) Bool)

(assert (=> start!86584 (array_inv!23642 a!3219)))

(assert (=> start!86584 true))

(declare-fun b!1003977 () Bool)

(declare-fun res!673448 () Bool)

(assert (=> b!1003977 (=> (not res!673448) (not e!565402))))

(assert (=> b!1003977 (= res!673448 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(assert (= (and start!86584 res!673457) b!1003966))

(assert (= (and b!1003966 res!673446) b!1003973))

(assert (= (and b!1003973 res!673451) b!1003975))

(assert (= (and b!1003975 res!673445) b!1003974))

(assert (= (and b!1003974 res!673447) b!1003965))

(assert (= (and b!1003965 res!673450) b!1003968))

(assert (= (and b!1003968 res!673449) b!1003980))

(assert (= (and b!1003980 res!673452) b!1003976))

(assert (= (and b!1003976 res!673458) b!1003967))

(assert (= (and b!1003967 res!673444) b!1003979))

(assert (= (and b!1003979 res!673456) b!1003972))

(assert (= (and b!1003972 res!673443) b!1003969))

(assert (= (and b!1003969 res!673454) b!1003977))

(assert (= (and b!1003977 res!673448) b!1003971))

(assert (= (and b!1003971 res!673455) b!1003970))

(assert (= (and b!1003970 res!673453) b!1003978))

(declare-fun m!929589 () Bool)

(assert (=> b!1003975 m!929589))

(declare-fun m!929591 () Bool)

(assert (=> b!1003980 m!929591))

(declare-fun m!929593 () Bool)

(assert (=> b!1003970 m!929593))

(assert (=> b!1003970 m!929593))

(declare-fun m!929595 () Bool)

(assert (=> b!1003970 m!929595))

(declare-fun m!929597 () Bool)

(assert (=> start!86584 m!929597))

(declare-fun m!929599 () Bool)

(assert (=> start!86584 m!929599))

(declare-fun m!929601 () Bool)

(assert (=> b!1003971 m!929601))

(declare-fun m!929603 () Bool)

(assert (=> b!1003965 m!929603))

(declare-fun m!929605 () Bool)

(assert (=> b!1003969 m!929605))

(declare-fun m!929607 () Bool)

(assert (=> b!1003978 m!929607))

(assert (=> b!1003973 m!929593))

(assert (=> b!1003973 m!929593))

(declare-fun m!929609 () Bool)

(assert (=> b!1003973 m!929609))

(assert (=> b!1003967 m!929593))

(assert (=> b!1003967 m!929593))

(declare-fun m!929611 () Bool)

(assert (=> b!1003967 m!929611))

(assert (=> b!1003967 m!929611))

(assert (=> b!1003967 m!929593))

(declare-fun m!929613 () Bool)

(assert (=> b!1003967 m!929613))

(assert (=> b!1003979 m!929593))

(assert (=> b!1003979 m!929593))

(declare-fun m!929615 () Bool)

(assert (=> b!1003979 m!929615))

(declare-fun m!929617 () Bool)

(assert (=> b!1003972 m!929617))

(assert (=> b!1003972 m!929617))

(declare-fun m!929619 () Bool)

(assert (=> b!1003972 m!929619))

(declare-fun m!929621 () Bool)

(assert (=> b!1003972 m!929621))

(declare-fun m!929623 () Bool)

(assert (=> b!1003972 m!929623))

(declare-fun m!929625 () Bool)

(assert (=> b!1003968 m!929625))

(declare-fun m!929627 () Bool)

(assert (=> b!1003974 m!929627))

(check-sat (not b!1003980) (not b!1003972) (not b!1003965) (not b!1003974) (not b!1003967) (not start!86584) (not b!1003979) (not b!1003969) (not b!1003973) (not b!1003978) (not b!1003968) (not b!1003970) (not b!1003971) (not b!1003975))
(check-sat)
