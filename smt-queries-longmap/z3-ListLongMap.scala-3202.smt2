; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44948 () Bool)

(assert start!44948)

(declare-fun res!295610 () Bool)

(declare-fun e!289566 () Bool)

(assert (=> start!44948 (=> (not res!295610) (not e!289566))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44948 (= res!295610 (validMask!0 mask!3524))))

(assert (=> start!44948 e!289566))

(assert (=> start!44948 true))

(declare-datatypes ((array!31894 0))(
  ( (array!31895 (arr!15331 (Array (_ BitVec 32) (_ BitVec 64))) (size!15695 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31894)

(declare-fun array_inv!11190 (array!31894) Bool)

(assert (=> start!44948 (array_inv!11190 a!3235)))

(declare-fun b!492980 () Bool)

(declare-fun e!289569 () Bool)

(assert (=> b!492980 (= e!289569 (not true))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!222942 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3754 0))(
  ( (MissingZero!3754 (index!17195 (_ BitVec 32))) (Found!3754 (index!17196 (_ BitVec 32))) (Intermediate!3754 (undefined!4566 Bool) (index!17197 (_ BitVec 32)) (x!46429 (_ BitVec 32))) (Undefined!3754) (MissingVacant!3754 (index!17198 (_ BitVec 32))) )
))
(declare-fun lt!222940 () SeekEntryResult!3754)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31894 (_ BitVec 32)) SeekEntryResult!3754)

(assert (=> b!492980 (= lt!222940 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222942 (select (store (arr!15331 a!3235) i!1204 k0!2280) j!176) (array!31895 (store (arr!15331 a!3235) i!1204 k0!2280) (size!15695 a!3235)) mask!3524))))

(declare-fun lt!222943 () SeekEntryResult!3754)

(declare-fun lt!222939 () (_ BitVec 32))

(assert (=> b!492980 (= lt!222943 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222939 (select (arr!15331 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492980 (= lt!222942 (toIndex!0 (select (store (arr!15331 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!492980 (= lt!222939 (toIndex!0 (select (arr!15331 a!3235) j!176) mask!3524))))

(declare-fun e!289567 () Bool)

(assert (=> b!492980 e!289567))

(declare-fun res!295612 () Bool)

(assert (=> b!492980 (=> (not res!295612) (not e!289567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31894 (_ BitVec 32)) Bool)

(assert (=> b!492980 (= res!295612 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14515 0))(
  ( (Unit!14516) )
))
(declare-fun lt!222941 () Unit!14515)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31894 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14515)

(assert (=> b!492980 (= lt!222941 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492981 () Bool)

(declare-fun res!295606 () Bool)

(assert (=> b!492981 (=> (not res!295606) (not e!289566))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492981 (= res!295606 (validKeyInArray!0 k0!2280))))

(declare-fun b!492982 () Bool)

(declare-fun res!295608 () Bool)

(assert (=> b!492982 (=> (not res!295608) (not e!289566))))

(assert (=> b!492982 (= res!295608 (validKeyInArray!0 (select (arr!15331 a!3235) j!176)))))

(declare-fun b!492983 () Bool)

(declare-fun res!295611 () Bool)

(assert (=> b!492983 (=> (not res!295611) (not e!289569))))

(declare-datatypes ((List!9396 0))(
  ( (Nil!9393) (Cons!9392 (h!10260 (_ BitVec 64)) (t!15616 List!9396)) )
))
(declare-fun arrayNoDuplicates!0 (array!31894 (_ BitVec 32) List!9396) Bool)

(assert (=> b!492983 (= res!295611 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9393))))

(declare-fun b!492984 () Bool)

(declare-fun res!295605 () Bool)

(assert (=> b!492984 (=> (not res!295605) (not e!289569))))

(assert (=> b!492984 (= res!295605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492985 () Bool)

(declare-fun res!295607 () Bool)

(assert (=> b!492985 (=> (not res!295607) (not e!289566))))

(declare-fun arrayContainsKey!0 (array!31894 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492985 (= res!295607 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492986 () Bool)

(declare-fun res!295609 () Bool)

(assert (=> b!492986 (=> (not res!295609) (not e!289566))))

(assert (=> b!492986 (= res!295609 (and (= (size!15695 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15695 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15695 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492987 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31894 (_ BitVec 32)) SeekEntryResult!3754)

(assert (=> b!492987 (= e!289567 (= (seekEntryOrOpen!0 (select (arr!15331 a!3235) j!176) a!3235 mask!3524) (Found!3754 j!176)))))

(declare-fun b!492988 () Bool)

(assert (=> b!492988 (= e!289566 e!289569)))

(declare-fun res!295604 () Bool)

(assert (=> b!492988 (=> (not res!295604) (not e!289569))))

(declare-fun lt!222938 () SeekEntryResult!3754)

(assert (=> b!492988 (= res!295604 (or (= lt!222938 (MissingZero!3754 i!1204)) (= lt!222938 (MissingVacant!3754 i!1204))))))

(assert (=> b!492988 (= lt!222938 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44948 res!295610) b!492986))

(assert (= (and b!492986 res!295609) b!492982))

(assert (= (and b!492982 res!295608) b!492981))

(assert (= (and b!492981 res!295606) b!492985))

(assert (= (and b!492985 res!295607) b!492988))

(assert (= (and b!492988 res!295604) b!492984))

(assert (= (and b!492984 res!295605) b!492983))

(assert (= (and b!492983 res!295611) b!492980))

(assert (= (and b!492980 res!295612) b!492987))

(declare-fun m!473959 () Bool)

(assert (=> b!492983 m!473959))

(declare-fun m!473961 () Bool)

(assert (=> start!44948 m!473961))

(declare-fun m!473963 () Bool)

(assert (=> start!44948 m!473963))

(declare-fun m!473965 () Bool)

(assert (=> b!492982 m!473965))

(assert (=> b!492982 m!473965))

(declare-fun m!473967 () Bool)

(assert (=> b!492982 m!473967))

(declare-fun m!473969 () Bool)

(assert (=> b!492984 m!473969))

(declare-fun m!473971 () Bool)

(assert (=> b!492980 m!473971))

(declare-fun m!473973 () Bool)

(assert (=> b!492980 m!473973))

(declare-fun m!473975 () Bool)

(assert (=> b!492980 m!473975))

(assert (=> b!492980 m!473975))

(declare-fun m!473977 () Bool)

(assert (=> b!492980 m!473977))

(assert (=> b!492980 m!473965))

(declare-fun m!473979 () Bool)

(assert (=> b!492980 m!473979))

(assert (=> b!492980 m!473965))

(declare-fun m!473981 () Bool)

(assert (=> b!492980 m!473981))

(assert (=> b!492980 m!473965))

(declare-fun m!473983 () Bool)

(assert (=> b!492980 m!473983))

(assert (=> b!492980 m!473975))

(declare-fun m!473985 () Bool)

(assert (=> b!492980 m!473985))

(declare-fun m!473987 () Bool)

(assert (=> b!492988 m!473987))

(assert (=> b!492987 m!473965))

(assert (=> b!492987 m!473965))

(declare-fun m!473989 () Bool)

(assert (=> b!492987 m!473989))

(declare-fun m!473991 () Bool)

(assert (=> b!492981 m!473991))

(declare-fun m!473993 () Bool)

(assert (=> b!492985 m!473993))

(check-sat (not b!492981) (not b!492985) (not b!492983) (not b!492980) (not start!44948) (not b!492982) (not b!492988) (not b!492984) (not b!492987))
(check-sat)
