; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44946 () Bool)

(assert start!44946)

(declare-fun b!492770 () Bool)

(declare-fun res!295489 () Bool)

(declare-fun e!289431 () Bool)

(assert (=> b!492770 (=> (not res!295489) (not e!289431))))

(declare-datatypes ((array!31901 0))(
  ( (array!31902 (arr!15335 (Array (_ BitVec 32) (_ BitVec 64))) (size!15700 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31901)

(declare-datatypes ((List!9532 0))(
  ( (Nil!9529) (Cons!9528 (h!10396 (_ BitVec 64)) (t!15751 List!9532)) )
))
(declare-fun arrayNoDuplicates!0 (array!31901 (_ BitVec 32) List!9532) Bool)

(assert (=> b!492770 (= res!295489 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9529))))

(declare-fun b!492771 () Bool)

(declare-fun res!295484 () Bool)

(declare-fun e!289434 () Bool)

(assert (=> b!492771 (=> (not res!295484) (not e!289434))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31901 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!492771 (= res!295484 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!492773 () Bool)

(declare-fun res!295488 () Bool)

(assert (=> b!492773 (=> (not res!295488) (not e!289434))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!492773 (= res!295488 (validKeyInArray!0 (select (arr!15335 a!3235) j!176)))))

(declare-fun b!492774 () Bool)

(declare-fun res!295486 () Bool)

(assert (=> b!492774 (=> (not res!295486) (not e!289434))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!492774 (= res!295486 (and (= (size!15700 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15700 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15700 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!492775 () Bool)

(assert (=> b!492775 (= e!289431 (not true))))

(declare-fun lt!222696 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3799 0))(
  ( (MissingZero!3799 (index!17375 (_ BitVec 32))) (Found!3799 (index!17376 (_ BitVec 32))) (Intermediate!3799 (undefined!4611 Bool) (index!17377 (_ BitVec 32)) (x!46472 (_ BitVec 32))) (Undefined!3799) (MissingVacant!3799 (index!17378 (_ BitVec 32))) )
))
(declare-fun lt!222692 () SeekEntryResult!3799)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31901 (_ BitVec 32)) SeekEntryResult!3799)

(assert (=> b!492775 (= lt!222692 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222696 (select (store (arr!15335 a!3235) i!1204 k0!2280) j!176) (array!31902 (store (arr!15335 a!3235) i!1204 k0!2280) (size!15700 a!3235)) mask!3524))))

(declare-fun lt!222694 () SeekEntryResult!3799)

(declare-fun lt!222697 () (_ BitVec 32))

(assert (=> b!492775 (= lt!222694 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!222697 (select (arr!15335 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!492775 (= lt!222696 (toIndex!0 (select (store (arr!15335 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!492775 (= lt!222697 (toIndex!0 (select (arr!15335 a!3235) j!176) mask!3524))))

(declare-fun e!289432 () Bool)

(assert (=> b!492775 e!289432))

(declare-fun res!295483 () Bool)

(assert (=> b!492775 (=> (not res!295483) (not e!289432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31901 (_ BitVec 32)) Bool)

(assert (=> b!492775 (= res!295483 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14530 0))(
  ( (Unit!14531) )
))
(declare-fun lt!222693 () Unit!14530)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31901 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14530)

(assert (=> b!492775 (= lt!222693 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!492776 () Bool)

(declare-fun res!295490 () Bool)

(assert (=> b!492776 (=> (not res!295490) (not e!289431))))

(assert (=> b!492776 (= res!295490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!492777 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31901 (_ BitVec 32)) SeekEntryResult!3799)

(assert (=> b!492777 (= e!289432 (= (seekEntryOrOpen!0 (select (arr!15335 a!3235) j!176) a!3235 mask!3524) (Found!3799 j!176)))))

(declare-fun b!492778 () Bool)

(assert (=> b!492778 (= e!289434 e!289431)))

(declare-fun res!295485 () Bool)

(assert (=> b!492778 (=> (not res!295485) (not e!289431))))

(declare-fun lt!222695 () SeekEntryResult!3799)

(assert (=> b!492778 (= res!295485 (or (= lt!222695 (MissingZero!3799 i!1204)) (= lt!222695 (MissingVacant!3799 i!1204))))))

(assert (=> b!492778 (= lt!222695 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!492772 () Bool)

(declare-fun res!295482 () Bool)

(assert (=> b!492772 (=> (not res!295482) (not e!289434))))

(assert (=> b!492772 (= res!295482 (validKeyInArray!0 k0!2280))))

(declare-fun res!295487 () Bool)

(assert (=> start!44946 (=> (not res!295487) (not e!289434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44946 (= res!295487 (validMask!0 mask!3524))))

(assert (=> start!44946 e!289434))

(assert (=> start!44946 true))

(declare-fun array_inv!11218 (array!31901) Bool)

(assert (=> start!44946 (array_inv!11218 a!3235)))

(assert (= (and start!44946 res!295487) b!492774))

(assert (= (and b!492774 res!295486) b!492773))

(assert (= (and b!492773 res!295488) b!492772))

(assert (= (and b!492772 res!295482) b!492771))

(assert (= (and b!492771 res!295484) b!492778))

(assert (= (and b!492778 res!295485) b!492776))

(assert (= (and b!492776 res!295490) b!492770))

(assert (= (and b!492770 res!295489) b!492775))

(assert (= (and b!492775 res!295483) b!492777))

(declare-fun m!473023 () Bool)

(assert (=> b!492773 m!473023))

(assert (=> b!492773 m!473023))

(declare-fun m!473025 () Bool)

(assert (=> b!492773 m!473025))

(declare-fun m!473027 () Bool)

(assert (=> b!492775 m!473027))

(declare-fun m!473029 () Bool)

(assert (=> b!492775 m!473029))

(assert (=> b!492775 m!473023))

(declare-fun m!473031 () Bool)

(assert (=> b!492775 m!473031))

(assert (=> b!492775 m!473023))

(declare-fun m!473033 () Bool)

(assert (=> b!492775 m!473033))

(assert (=> b!492775 m!473023))

(declare-fun m!473035 () Bool)

(assert (=> b!492775 m!473035))

(assert (=> b!492775 m!473029))

(declare-fun m!473037 () Bool)

(assert (=> b!492775 m!473037))

(assert (=> b!492775 m!473029))

(declare-fun m!473039 () Bool)

(assert (=> b!492775 m!473039))

(declare-fun m!473041 () Bool)

(assert (=> b!492775 m!473041))

(declare-fun m!473043 () Bool)

(assert (=> b!492771 m!473043))

(declare-fun m!473045 () Bool)

(assert (=> b!492770 m!473045))

(declare-fun m!473047 () Bool)

(assert (=> start!44946 m!473047))

(declare-fun m!473049 () Bool)

(assert (=> start!44946 m!473049))

(declare-fun m!473051 () Bool)

(assert (=> b!492778 m!473051))

(assert (=> b!492777 m!473023))

(assert (=> b!492777 m!473023))

(declare-fun m!473053 () Bool)

(assert (=> b!492777 m!473053))

(declare-fun m!473055 () Bool)

(assert (=> b!492772 m!473055))

(declare-fun m!473057 () Bool)

(assert (=> b!492776 m!473057))

(check-sat (not b!492778) (not b!492777) (not start!44946) (not b!492770) (not b!492772) (not b!492771) (not b!492775) (not b!492776) (not b!492773))
(check-sat)
