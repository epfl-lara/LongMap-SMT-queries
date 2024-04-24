; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48400 () Bool)

(assert start!48400)

(declare-fun b!531865 () Bool)

(declare-fun e!309740 () Bool)

(declare-fun e!309741 () Bool)

(assert (=> b!531865 (= e!309740 e!309741)))

(declare-fun res!327412 () Bool)

(assert (=> b!531865 (=> (not res!327412) (not e!309741))))

(declare-datatypes ((SeekEntryResult!4609 0))(
  ( (MissingZero!4609 (index!20660 (_ BitVec 32))) (Found!4609 (index!20661 (_ BitVec 32))) (Intermediate!4609 (undefined!5421 Bool) (index!20662 (_ BitVec 32)) (x!49780 (_ BitVec 32))) (Undefined!4609) (MissingVacant!4609 (index!20663 (_ BitVec 32))) )
))
(declare-fun lt!245109 () SeekEntryResult!4609)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531865 (= res!327412 (or (= lt!245109 (MissingZero!4609 i!1153)) (= lt!245109 (MissingVacant!4609 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!33707 0))(
  ( (array!33708 (arr!16195 (Array (_ BitVec 32) (_ BitVec 64))) (size!16559 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33707)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33707 (_ BitVec 32)) SeekEntryResult!4609)

(assert (=> b!531865 (= lt!245109 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!531866 () Bool)

(declare-fun res!327411 () Bool)

(assert (=> b!531866 (=> (not res!327411) (not e!309740))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!531866 (= res!327411 (and (= (size!16559 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16559 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16559 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531868 () Bool)

(declare-fun res!327410 () Bool)

(assert (=> b!531868 (=> (not res!327410) (not e!309740))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531868 (= res!327410 (validKeyInArray!0 (select (arr!16195 a!3154) j!147)))))

(declare-fun b!531869 () Bool)

(declare-fun res!327415 () Bool)

(assert (=> b!531869 (=> (not res!327415) (not e!309740))))

(assert (=> b!531869 (= res!327415 (validKeyInArray!0 k0!1998))))

(declare-fun b!531870 () Bool)

(declare-fun res!327409 () Bool)

(assert (=> b!531870 (=> (not res!327409) (not e!309740))))

(declare-fun arrayContainsKey!0 (array!33707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531870 (= res!327409 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531871 () Bool)

(assert (=> b!531871 (= e!309741 false)))

(declare-fun lt!245110 () Bool)

(declare-datatypes ((List!10221 0))(
  ( (Nil!10218) (Cons!10217 (h!11157 (_ BitVec 64)) (t!16441 List!10221)) )
))
(declare-fun arrayNoDuplicates!0 (array!33707 (_ BitVec 32) List!10221) Bool)

(assert (=> b!531871 (= lt!245110 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10218))))

(declare-fun b!531867 () Bool)

(declare-fun res!327413 () Bool)

(assert (=> b!531867 (=> (not res!327413) (not e!309741))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33707 (_ BitVec 32)) Bool)

(assert (=> b!531867 (= res!327413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!327414 () Bool)

(assert (=> start!48400 (=> (not res!327414) (not e!309740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48400 (= res!327414 (validMask!0 mask!3216))))

(assert (=> start!48400 e!309740))

(assert (=> start!48400 true))

(declare-fun array_inv!12054 (array!33707) Bool)

(assert (=> start!48400 (array_inv!12054 a!3154)))

(assert (= (and start!48400 res!327414) b!531866))

(assert (= (and b!531866 res!327411) b!531868))

(assert (= (and b!531868 res!327410) b!531869))

(assert (= (and b!531869 res!327415) b!531870))

(assert (= (and b!531870 res!327409) b!531865))

(assert (= (and b!531865 res!327412) b!531867))

(assert (= (and b!531867 res!327413) b!531871))

(declare-fun m!512443 () Bool)

(assert (=> b!531868 m!512443))

(assert (=> b!531868 m!512443))

(declare-fun m!512445 () Bool)

(assert (=> b!531868 m!512445))

(declare-fun m!512447 () Bool)

(assert (=> b!531869 m!512447))

(declare-fun m!512449 () Bool)

(assert (=> b!531871 m!512449))

(declare-fun m!512451 () Bool)

(assert (=> b!531865 m!512451))

(declare-fun m!512453 () Bool)

(assert (=> start!48400 m!512453))

(declare-fun m!512455 () Bool)

(assert (=> start!48400 m!512455))

(declare-fun m!512457 () Bool)

(assert (=> b!531870 m!512457))

(declare-fun m!512459 () Bool)

(assert (=> b!531867 m!512459))

(check-sat (not b!531868) (not b!531871) (not b!531867) (not b!531870) (not start!48400) (not b!531869) (not b!531865))
(check-sat)
