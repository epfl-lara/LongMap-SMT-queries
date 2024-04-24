; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45008 () Bool)

(assert start!45008)

(declare-fun res!296488 () Bool)

(declare-fun e!289936 () Bool)

(assert (=> start!45008 (=> (not res!296488) (not e!289936))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45008 (= res!296488 (validMask!0 mask!3524))))

(assert (=> start!45008 e!289936))

(assert (=> start!45008 true))

(declare-datatypes ((array!31954 0))(
  ( (array!31955 (arr!15361 (Array (_ BitVec 32) (_ BitVec 64))) (size!15725 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31954)

(declare-fun array_inv!11220 (array!31954) Bool)

(assert (=> start!45008 (array_inv!11220 a!3235)))

(declare-fun b!493855 () Bool)

(declare-fun res!296487 () Bool)

(assert (=> b!493855 (=> (not res!296487) (not e!289936))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493855 (= res!296487 (validKeyInArray!0 k0!2280))))

(declare-fun b!493856 () Bool)

(declare-fun res!296485 () Bool)

(assert (=> b!493856 (=> (not res!296485) (not e!289936))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!493856 (= res!296485 (validKeyInArray!0 (select (arr!15361 a!3235) j!176)))))

(declare-fun b!493857 () Bool)

(declare-fun res!296482 () Bool)

(assert (=> b!493857 (=> (not res!296482) (not e!289936))))

(declare-fun arrayContainsKey!0 (array!31954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493857 (= res!296482 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493858 () Bool)

(declare-fun res!296480 () Bool)

(assert (=> b!493858 (=> (not res!296480) (not e!289936))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!493858 (= res!296480 (and (= (size!15725 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15725 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15725 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493859 () Bool)

(declare-fun e!289935 () Bool)

(assert (=> b!493859 (= e!289935 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!3784 0))(
  ( (MissingZero!3784 (index!17315 (_ BitVec 32))) (Found!3784 (index!17316 (_ BitVec 32))) (Intermediate!3784 (undefined!4596 Bool) (index!17317 (_ BitVec 32)) (x!46539 (_ BitVec 32))) (Undefined!3784) (MissingVacant!3784 (index!17318 (_ BitVec 32))) )
))
(declare-fun lt!223471 () SeekEntryResult!3784)

(assert (=> b!493859 (= lt!223471 Undefined!3784)))

(declare-fun b!493860 () Bool)

(declare-fun e!289937 () Bool)

(assert (=> b!493860 (= e!289937 (not e!289935))))

(declare-fun res!296479 () Bool)

(assert (=> b!493860 (=> res!296479 e!289935)))

(declare-fun lt!223473 () SeekEntryResult!3784)

(declare-fun lt!223469 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31954 (_ BitVec 32)) SeekEntryResult!3784)

(assert (=> b!493860 (= res!296479 (= lt!223473 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223469 (select (store (arr!15361 a!3235) i!1204 k0!2280) j!176) (array!31955 (store (arr!15361 a!3235) i!1204 k0!2280) (size!15725 a!3235)) mask!3524)))))

(declare-fun lt!223472 () (_ BitVec 32))

(assert (=> b!493860 (= lt!223473 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223472 (select (arr!15361 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493860 (= lt!223469 (toIndex!0 (select (store (arr!15361 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493860 (= lt!223472 (toIndex!0 (select (arr!15361 a!3235) j!176) mask!3524))))

(assert (=> b!493860 (= lt!223471 (Found!3784 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31954 (_ BitVec 32)) SeekEntryResult!3784)

(assert (=> b!493860 (= lt!223471 (seekEntryOrOpen!0 (select (arr!15361 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31954 (_ BitVec 32)) Bool)

(assert (=> b!493860 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14575 0))(
  ( (Unit!14576) )
))
(declare-fun lt!223470 () Unit!14575)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31954 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14575)

(assert (=> b!493860 (= lt!223470 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493861 () Bool)

(assert (=> b!493861 (= e!289936 e!289937)))

(declare-fun res!296484 () Bool)

(assert (=> b!493861 (=> (not res!296484) (not e!289937))))

(declare-fun lt!223474 () SeekEntryResult!3784)

(assert (=> b!493861 (= res!296484 (or (= lt!223474 (MissingZero!3784 i!1204)) (= lt!223474 (MissingVacant!3784 i!1204))))))

(assert (=> b!493861 (= lt!223474 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493862 () Bool)

(declare-fun res!296483 () Bool)

(assert (=> b!493862 (=> res!296483 e!289935)))

(get-info :version)

(assert (=> b!493862 (= res!296483 (or (not ((_ is Intermediate!3784) lt!223473)) (not (undefined!4596 lt!223473))))))

(declare-fun b!493863 () Bool)

(declare-fun res!296486 () Bool)

(assert (=> b!493863 (=> (not res!296486) (not e!289937))))

(assert (=> b!493863 (= res!296486 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!493864 () Bool)

(declare-fun res!296481 () Bool)

(assert (=> b!493864 (=> (not res!296481) (not e!289937))))

(declare-datatypes ((List!9426 0))(
  ( (Nil!9423) (Cons!9422 (h!10290 (_ BitVec 64)) (t!15646 List!9426)) )
))
(declare-fun arrayNoDuplicates!0 (array!31954 (_ BitVec 32) List!9426) Bool)

(assert (=> b!493864 (= res!296481 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9423))))

(assert (= (and start!45008 res!296488) b!493858))

(assert (= (and b!493858 res!296480) b!493856))

(assert (= (and b!493856 res!296485) b!493855))

(assert (= (and b!493855 res!296487) b!493857))

(assert (= (and b!493857 res!296482) b!493861))

(assert (= (and b!493861 res!296484) b!493863))

(assert (= (and b!493863 res!296486) b!493864))

(assert (= (and b!493864 res!296481) b!493860))

(assert (= (and b!493860 (not res!296479)) b!493862))

(assert (= (and b!493862 (not res!296483)) b!493859))

(declare-fun m!475039 () Bool)

(assert (=> b!493863 m!475039))

(declare-fun m!475041 () Bool)

(assert (=> start!45008 m!475041))

(declare-fun m!475043 () Bool)

(assert (=> start!45008 m!475043))

(declare-fun m!475045 () Bool)

(assert (=> b!493861 m!475045))

(declare-fun m!475047 () Bool)

(assert (=> b!493857 m!475047))

(declare-fun m!475049 () Bool)

(assert (=> b!493860 m!475049))

(declare-fun m!475051 () Bool)

(assert (=> b!493860 m!475051))

(declare-fun m!475053 () Bool)

(assert (=> b!493860 m!475053))

(declare-fun m!475055 () Bool)

(assert (=> b!493860 m!475055))

(declare-fun m!475057 () Bool)

(assert (=> b!493860 m!475057))

(assert (=> b!493860 m!475055))

(declare-fun m!475059 () Bool)

(assert (=> b!493860 m!475059))

(assert (=> b!493860 m!475055))

(declare-fun m!475061 () Bool)

(assert (=> b!493860 m!475061))

(assert (=> b!493860 m!475053))

(declare-fun m!475063 () Bool)

(assert (=> b!493860 m!475063))

(assert (=> b!493860 m!475055))

(declare-fun m!475065 () Bool)

(assert (=> b!493860 m!475065))

(assert (=> b!493860 m!475053))

(declare-fun m!475067 () Bool)

(assert (=> b!493860 m!475067))

(declare-fun m!475069 () Bool)

(assert (=> b!493855 m!475069))

(declare-fun m!475071 () Bool)

(assert (=> b!493864 m!475071))

(assert (=> b!493856 m!475055))

(assert (=> b!493856 m!475055))

(declare-fun m!475073 () Bool)

(assert (=> b!493856 m!475073))

(check-sat (not b!493857) (not b!493856) (not b!493863) (not b!493864) (not b!493855) (not b!493860) (not start!45008) (not b!493861))
(check-sat)
