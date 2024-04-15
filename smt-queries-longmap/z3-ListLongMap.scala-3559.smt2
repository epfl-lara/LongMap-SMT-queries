; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48912 () Bool)

(assert start!48912)

(declare-fun b!539003 () Bool)

(declare-fun res!334358 () Bool)

(declare-fun e!312440 () Bool)

(assert (=> b!539003 (=> (not res!334358) (not e!312440))))

(declare-datatypes ((array!34134 0))(
  ( (array!34135 (arr!16406 (Array (_ BitVec 32) (_ BitVec 64))) (size!16771 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34134)

(declare-datatypes ((List!10564 0))(
  ( (Nil!10561) (Cons!10560 (h!11503 (_ BitVec 64)) (t!16783 List!10564)) )
))
(declare-fun arrayNoDuplicates!0 (array!34134 (_ BitVec 32) List!10564) Bool)

(assert (=> b!539003 (= res!334358 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10561))))

(declare-fun b!539004 () Bool)

(declare-fun res!334356 () Bool)

(declare-fun e!312439 () Bool)

(assert (=> b!539004 (=> (not res!334356) (not e!312439))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539004 (= res!334356 (validKeyInArray!0 k0!1998))))

(declare-fun b!539005 () Bool)

(declare-fun res!334350 () Bool)

(assert (=> b!539005 (=> (not res!334350) (not e!312439))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!539005 (= res!334350 (validKeyInArray!0 (select (arr!16406 a!3154) j!147)))))

(declare-fun b!539006 () Bool)

(declare-fun res!334357 () Bool)

(assert (=> b!539006 (=> (not res!334357) (not e!312439))))

(declare-fun arrayContainsKey!0 (array!34134 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539006 (= res!334357 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539007 () Bool)

(assert (=> b!539007 (= e!312439 e!312440)))

(declare-fun res!334354 () Bool)

(assert (=> b!539007 (=> (not res!334354) (not e!312440))))

(declare-datatypes ((SeekEntryResult!4861 0))(
  ( (MissingZero!4861 (index!21668 (_ BitVec 32))) (Found!4861 (index!21669 (_ BitVec 32))) (Intermediate!4861 (undefined!5673 Bool) (index!21670 (_ BitVec 32)) (x!50591 (_ BitVec 32))) (Undefined!4861) (MissingVacant!4861 (index!21671 (_ BitVec 32))) )
))
(declare-fun lt!246871 () SeekEntryResult!4861)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539007 (= res!334354 (or (= lt!246871 (MissingZero!4861 i!1153)) (= lt!246871 (MissingVacant!4861 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34134 (_ BitVec 32)) SeekEntryResult!4861)

(assert (=> b!539007 (= lt!246871 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539008 () Bool)

(declare-fun res!334352 () Bool)

(assert (=> b!539008 (=> (not res!334352) (not e!312440))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!539008 (= res!334352 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16771 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16771 a!3154)) (= (select (arr!16406 a!3154) resIndex!32) (select (arr!16406 a!3154) j!147))))))

(declare-fun b!539009 () Bool)

(declare-fun res!334355 () Bool)

(assert (=> b!539009 (=> (not res!334355) (not e!312440))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34134 (_ BitVec 32)) Bool)

(assert (=> b!539009 (= res!334355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539010 () Bool)

(declare-fun res!334353 () Bool)

(assert (=> b!539010 (=> (not res!334353) (not e!312439))))

(assert (=> b!539010 (= res!334353 (and (= (size!16771 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16771 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16771 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!334351 () Bool)

(assert (=> start!48912 (=> (not res!334351) (not e!312439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48912 (= res!334351 (validMask!0 mask!3216))))

(assert (=> start!48912 e!312439))

(assert (=> start!48912 true))

(declare-fun array_inv!12289 (array!34134) Bool)

(assert (=> start!48912 (array_inv!12289 a!3154)))

(declare-fun b!539011 () Bool)

(assert (=> b!539011 (= e!312440 false)))

(declare-fun lt!246870 () SeekEntryResult!4861)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34134 (_ BitVec 32)) SeekEntryResult!4861)

(assert (=> b!539011 (= lt!246870 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16406 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48912 res!334351) b!539010))

(assert (= (and b!539010 res!334353) b!539005))

(assert (= (and b!539005 res!334350) b!539004))

(assert (= (and b!539004 res!334356) b!539006))

(assert (= (and b!539006 res!334357) b!539007))

(assert (= (and b!539007 res!334354) b!539009))

(assert (= (and b!539009 res!334355) b!539003))

(assert (= (and b!539003 res!334358) b!539008))

(assert (= (and b!539008 res!334352) b!539011))

(declare-fun m!517579 () Bool)

(assert (=> start!48912 m!517579))

(declare-fun m!517581 () Bool)

(assert (=> start!48912 m!517581))

(declare-fun m!517583 () Bool)

(assert (=> b!539005 m!517583))

(assert (=> b!539005 m!517583))

(declare-fun m!517585 () Bool)

(assert (=> b!539005 m!517585))

(declare-fun m!517587 () Bool)

(assert (=> b!539009 m!517587))

(declare-fun m!517589 () Bool)

(assert (=> b!539004 m!517589))

(assert (=> b!539011 m!517583))

(assert (=> b!539011 m!517583))

(declare-fun m!517591 () Bool)

(assert (=> b!539011 m!517591))

(declare-fun m!517593 () Bool)

(assert (=> b!539003 m!517593))

(declare-fun m!517595 () Bool)

(assert (=> b!539006 m!517595))

(declare-fun m!517597 () Bool)

(assert (=> b!539007 m!517597))

(declare-fun m!517599 () Bool)

(assert (=> b!539008 m!517599))

(assert (=> b!539008 m!517583))

(check-sat (not b!539009) (not b!539004) (not b!539007) (not start!48912) (not b!539006) (not b!539011) (not b!539005) (not b!539003))
(check-sat)
