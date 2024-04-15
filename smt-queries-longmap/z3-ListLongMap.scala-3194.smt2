; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44778 () Bool)

(assert start!44778)

(declare-fun b!491506 () Bool)

(declare-fun e!288740 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!491506 (= e!288740 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun res!294587 () Bool)

(declare-fun e!288741 () Bool)

(assert (=> start!44778 (=> (not res!294587) (not e!288741))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44778 (= res!294587 (validMask!0 mask!3524))))

(assert (=> start!44778 e!288741))

(assert (=> start!44778 true))

(declare-datatypes ((array!31847 0))(
  ( (array!31848 (arr!15311 (Array (_ BitVec 32) (_ BitVec 64))) (size!15676 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31847)

(declare-fun array_inv!11194 (array!31847) Bool)

(assert (=> start!44778 (array_inv!11194 a!3235)))

(declare-fun b!491507 () Bool)

(declare-fun e!288737 () Bool)

(assert (=> b!491507 (= e!288741 e!288737)))

(declare-fun res!294590 () Bool)

(assert (=> b!491507 (=> (not res!294590) (not e!288737))))

(declare-datatypes ((SeekEntryResult!3775 0))(
  ( (MissingZero!3775 (index!17279 (_ BitVec 32))) (Found!3775 (index!17280 (_ BitVec 32))) (Intermediate!3775 (undefined!4587 Bool) (index!17281 (_ BitVec 32)) (x!46372 (_ BitVec 32))) (Undefined!3775) (MissingVacant!3775 (index!17282 (_ BitVec 32))) )
))
(declare-fun lt!222129 () SeekEntryResult!3775)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491507 (= res!294590 (or (= lt!222129 (MissingZero!3775 i!1204)) (= lt!222129 (MissingVacant!3775 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31847 (_ BitVec 32)) SeekEntryResult!3775)

(assert (=> b!491507 (= lt!222129 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!491508 () Bool)

(assert (=> b!491508 (= e!288737 (not e!288740))))

(declare-fun res!294588 () Bool)

(assert (=> b!491508 (=> res!294588 e!288740)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31847 (_ BitVec 32)) SeekEntryResult!3775)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491508 (= res!294588 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15311 a!3235) j!176) mask!3524) (select (arr!15311 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!15311 a!3235) i!1204 k0!2280) j!176) mask!3524) (select (store (arr!15311 a!3235) i!1204 k0!2280) j!176) (array!31848 (store (arr!15311 a!3235) i!1204 k0!2280) (size!15676 a!3235)) mask!3524)))))

(declare-fun e!288738 () Bool)

(assert (=> b!491508 e!288738))

(declare-fun res!294592 () Bool)

(assert (=> b!491508 (=> (not res!294592) (not e!288738))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31847 (_ BitVec 32)) Bool)

(assert (=> b!491508 (= res!294592 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14482 0))(
  ( (Unit!14483) )
))
(declare-fun lt!222130 () Unit!14482)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31847 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14482)

(assert (=> b!491508 (= lt!222130 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491509 () Bool)

(declare-fun res!294591 () Bool)

(assert (=> b!491509 (=> (not res!294591) (not e!288741))))

(assert (=> b!491509 (= res!294591 (and (= (size!15676 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15676 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15676 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491510 () Bool)

(declare-fun res!294584 () Bool)

(assert (=> b!491510 (=> (not res!294584) (not e!288737))))

(assert (=> b!491510 (= res!294584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491511 () Bool)

(declare-fun res!294589 () Bool)

(assert (=> b!491511 (=> (not res!294589) (not e!288741))))

(declare-fun arrayContainsKey!0 (array!31847 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491511 (= res!294589 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491512 () Bool)

(assert (=> b!491512 (= e!288738 (= (seekEntryOrOpen!0 (select (arr!15311 a!3235) j!176) a!3235 mask!3524) (Found!3775 j!176)))))

(declare-fun b!491513 () Bool)

(declare-fun res!294585 () Bool)

(assert (=> b!491513 (=> (not res!294585) (not e!288741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491513 (= res!294585 (validKeyInArray!0 k0!2280))))

(declare-fun b!491514 () Bool)

(declare-fun res!294593 () Bool)

(assert (=> b!491514 (=> (not res!294593) (not e!288741))))

(assert (=> b!491514 (= res!294593 (validKeyInArray!0 (select (arr!15311 a!3235) j!176)))))

(declare-fun b!491515 () Bool)

(declare-fun res!294586 () Bool)

(assert (=> b!491515 (=> (not res!294586) (not e!288737))))

(declare-datatypes ((List!9508 0))(
  ( (Nil!9505) (Cons!9504 (h!10366 (_ BitVec 64)) (t!15727 List!9508)) )
))
(declare-fun arrayNoDuplicates!0 (array!31847 (_ BitVec 32) List!9508) Bool)

(assert (=> b!491515 (= res!294586 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9505))))

(assert (= (and start!44778 res!294587) b!491509))

(assert (= (and b!491509 res!294591) b!491514))

(assert (= (and b!491514 res!294593) b!491513))

(assert (= (and b!491513 res!294585) b!491511))

(assert (= (and b!491511 res!294589) b!491507))

(assert (= (and b!491507 res!294590) b!491510))

(assert (= (and b!491510 res!294584) b!491515))

(assert (= (and b!491515 res!294586) b!491508))

(assert (= (and b!491508 res!294592) b!491512))

(assert (= (and b!491508 (not res!294588)) b!491506))

(declare-fun m!471757 () Bool)

(assert (=> b!491511 m!471757))

(declare-fun m!471759 () Bool)

(assert (=> b!491508 m!471759))

(declare-fun m!471761 () Bool)

(assert (=> b!491508 m!471761))

(declare-fun m!471763 () Bool)

(assert (=> b!491508 m!471763))

(declare-fun m!471765 () Bool)

(assert (=> b!491508 m!471765))

(declare-fun m!471767 () Bool)

(assert (=> b!491508 m!471767))

(declare-fun m!471769 () Bool)

(assert (=> b!491508 m!471769))

(assert (=> b!491508 m!471767))

(assert (=> b!491508 m!471765))

(declare-fun m!471771 () Bool)

(assert (=> b!491508 m!471771))

(assert (=> b!491508 m!471763))

(declare-fun m!471773 () Bool)

(assert (=> b!491508 m!471773))

(assert (=> b!491508 m!471767))

(declare-fun m!471775 () Bool)

(assert (=> b!491508 m!471775))

(assert (=> b!491508 m!471763))

(assert (=> b!491508 m!471771))

(assert (=> b!491514 m!471767))

(assert (=> b!491514 m!471767))

(declare-fun m!471777 () Bool)

(assert (=> b!491514 m!471777))

(declare-fun m!471779 () Bool)

(assert (=> start!44778 m!471779))

(declare-fun m!471781 () Bool)

(assert (=> start!44778 m!471781))

(assert (=> b!491512 m!471767))

(assert (=> b!491512 m!471767))

(declare-fun m!471783 () Bool)

(assert (=> b!491512 m!471783))

(declare-fun m!471785 () Bool)

(assert (=> b!491507 m!471785))

(declare-fun m!471787 () Bool)

(assert (=> b!491513 m!471787))

(declare-fun m!471789 () Bool)

(assert (=> b!491510 m!471789))

(declare-fun m!471791 () Bool)

(assert (=> b!491515 m!471791))

(check-sat (not start!44778) (not b!491513) (not b!491508) (not b!491510) (not b!491507) (not b!491512) (not b!491511) (not b!491515) (not b!491514))
(check-sat)
