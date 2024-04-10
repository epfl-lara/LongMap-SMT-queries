; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44954 () Bool)

(assert start!44954)

(declare-fun b!492987 () Bool)

(declare-fun res!295557 () Bool)

(declare-fun e!289582 () Bool)

(assert (=> b!492987 (=> (not res!295557) (not e!289582))))

(declare-datatypes ((array!31899 0))(
  ( (array!31900 (arr!15334 (Array (_ BitVec 32) (_ BitVec 64))) (size!15698 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31899)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492987 (= res!295557 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492988 () Bool)

(declare-fun res!295565 () Bool)

(assert (=> b!492988 (=> (not res!295565) (not e!289582))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492988 (= res!295565 (validKeyInArray!0 k0!2280))))

(declare-fun b!492989 () Bool)

(declare-fun res!295559 () Bool)

(declare-fun e!289581 () Bool)

(assert (=> b!492989 (=> (not res!295559) (not e!289581))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31899 (_ BitVec 32)) Bool)

(assert (=> b!492989 (= res!295559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!295562 () Bool)

(assert (=> start!44954 (=> (not res!295562) (not e!289582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44954 (= res!295562 (validMask!0 mask!3524))))

(assert (=> start!44954 e!289582))

(assert (=> start!44954 true))

(declare-fun array_inv!11130 (array!31899) Bool)

(assert (=> start!44954 (array_inv!11130 a!3235)))

(declare-fun b!492990 () Bool)

(assert (=> b!492990 (= e!289581 (not true))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3801 0))(
  ( (MissingZero!3801 (index!17383 (_ BitVec 32))) (Found!3801 (index!17384 (_ BitVec 32))) (Intermediate!3801 (undefined!4613 Bool) (index!17385 (_ BitVec 32)) (x!46471 (_ BitVec 32))) (Undefined!3801) (MissingVacant!3801 (index!17386 (_ BitVec 32))) )
))
(declare-fun lt!222894 () SeekEntryResult!3801)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!222890 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31899 (_ BitVec 32)) SeekEntryResult!3801)

(assert (=> b!492990 (= lt!222894 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222890 (select (store (arr!15334 a!3235) i!1204 k0!2280) j!176) (array!31900 (store (arr!15334 a!3235) i!1204 k0!2280) (size!15698 a!3235)) mask!3524))))

(declare-fun lt!222892 () SeekEntryResult!3801)

(declare-fun lt!222891 () (_ BitVec 32))

(assert (=> b!492990 (= lt!222892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222891 (select (arr!15334 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492990 (= lt!222890 (toIndex!0 (select (store (arr!15334 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!492990 (= lt!222891 (toIndex!0 (select (arr!15334 a!3235) j!176) mask!3524))))

(declare-fun e!289583 () Bool)

(assert (=> b!492990 e!289583))

(declare-fun res!295563 () Bool)

(assert (=> b!492990 (=> (not res!295563) (not e!289583))))

(assert (=> b!492990 (= res!295563 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14548 0))(
  ( (Unit!14549) )
))
(declare-fun lt!222895 () Unit!14548)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31899 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14548)

(assert (=> b!492990 (= lt!222895 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492991 () Bool)

(declare-fun res!295561 () Bool)

(assert (=> b!492991 (=> (not res!295561) (not e!289581))))

(declare-datatypes ((List!9492 0))(
  ( (Nil!9489) (Cons!9488 (h!10356 (_ BitVec 64)) (t!15720 List!9492)) )
))
(declare-fun arrayNoDuplicates!0 (array!31899 (_ BitVec 32) List!9492) Bool)

(assert (=> b!492991 (= res!295561 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9489))))

(declare-fun b!492992 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31899 (_ BitVec 32)) SeekEntryResult!3801)

(assert (=> b!492992 (= e!289583 (= (seekEntryOrOpen!0 (select (arr!15334 a!3235) j!176) a!3235 mask!3524) (Found!3801 j!176)))))

(declare-fun b!492993 () Bool)

(declare-fun res!295560 () Bool)

(assert (=> b!492993 (=> (not res!295560) (not e!289582))))

(assert (=> b!492993 (= res!295560 (and (= (size!15698 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15698 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15698 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492994 () Bool)

(declare-fun res!295564 () Bool)

(assert (=> b!492994 (=> (not res!295564) (not e!289582))))

(assert (=> b!492994 (= res!295564 (validKeyInArray!0 (select (arr!15334 a!3235) j!176)))))

(declare-fun b!492995 () Bool)

(assert (=> b!492995 (= e!289582 e!289581)))

(declare-fun res!295558 () Bool)

(assert (=> b!492995 (=> (not res!295558) (not e!289581))))

(declare-fun lt!222893 () SeekEntryResult!3801)

(assert (=> b!492995 (= res!295558 (or (= lt!222893 (MissingZero!3801 i!1204)) (= lt!222893 (MissingVacant!3801 i!1204))))))

(assert (=> b!492995 (= lt!222893 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!44954 res!295562) b!492993))

(assert (= (and b!492993 res!295560) b!492994))

(assert (= (and b!492994 res!295564) b!492988))

(assert (= (and b!492988 res!295565) b!492987))

(assert (= (and b!492987 res!295557) b!492995))

(assert (= (and b!492995 res!295558) b!492989))

(assert (= (and b!492989 res!295559) b!492991))

(assert (= (and b!492991 res!295561) b!492990))

(assert (= (and b!492990 res!295563) b!492992))

(declare-fun m!473703 () Bool)

(assert (=> b!492989 m!473703))

(declare-fun m!473705 () Bool)

(assert (=> b!492988 m!473705))

(declare-fun m!473707 () Bool)

(assert (=> b!492990 m!473707))

(declare-fun m!473709 () Bool)

(assert (=> b!492990 m!473709))

(declare-fun m!473711 () Bool)

(assert (=> b!492990 m!473711))

(declare-fun m!473713 () Bool)

(assert (=> b!492990 m!473713))

(declare-fun m!473715 () Bool)

(assert (=> b!492990 m!473715))

(assert (=> b!492990 m!473713))

(declare-fun m!473717 () Bool)

(assert (=> b!492990 m!473717))

(assert (=> b!492990 m!473711))

(declare-fun m!473719 () Bool)

(assert (=> b!492990 m!473719))

(assert (=> b!492990 m!473713))

(declare-fun m!473721 () Bool)

(assert (=> b!492990 m!473721))

(assert (=> b!492990 m!473711))

(declare-fun m!473723 () Bool)

(assert (=> b!492990 m!473723))

(assert (=> b!492992 m!473713))

(assert (=> b!492992 m!473713))

(declare-fun m!473725 () Bool)

(assert (=> b!492992 m!473725))

(declare-fun m!473727 () Bool)

(assert (=> b!492987 m!473727))

(declare-fun m!473729 () Bool)

(assert (=> b!492991 m!473729))

(declare-fun m!473731 () Bool)

(assert (=> b!492995 m!473731))

(declare-fun m!473733 () Bool)

(assert (=> start!44954 m!473733))

(declare-fun m!473735 () Bool)

(assert (=> start!44954 m!473735))

(assert (=> b!492994 m!473713))

(assert (=> b!492994 m!473713))

(declare-fun m!473737 () Bool)

(assert (=> b!492994 m!473737))

(check-sat (not b!492992) (not b!492991) (not b!492994) (not b!492989) (not b!492988) (not b!492987) (not b!492990) (not start!44954) (not b!492995))
(check-sat)
