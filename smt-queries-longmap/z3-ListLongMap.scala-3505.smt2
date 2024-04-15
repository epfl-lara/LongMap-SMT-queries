; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48588 () Bool)

(assert start!48588)

(declare-fun b!533425 () Bool)

(declare-fun res!328776 () Bool)

(declare-fun e!310316 () Bool)

(assert (=> b!533425 (=> (not res!328776) (not e!310316))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533425 (= res!328776 (validKeyInArray!0 k0!1998))))

(declare-fun b!533426 () Bool)

(declare-fun res!328775 () Bool)

(assert (=> b!533426 (=> (not res!328775) (not e!310316))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33810 0))(
  ( (array!33811 (arr!16244 (Array (_ BitVec 32) (_ BitVec 64))) (size!16609 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33810)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533426 (= res!328775 (and (= (size!16609 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16609 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16609 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533427 () Bool)

(declare-fun e!310315 () Bool)

(assert (=> b!533427 (= e!310316 e!310315)))

(declare-fun res!328772 () Bool)

(assert (=> b!533427 (=> (not res!328772) (not e!310315))))

(declare-datatypes ((SeekEntryResult!4699 0))(
  ( (MissingZero!4699 (index!21020 (_ BitVec 32))) (Found!4699 (index!21021 (_ BitVec 32))) (Intermediate!4699 (undefined!5511 Bool) (index!21022 (_ BitVec 32)) (x!49997 (_ BitVec 32))) (Undefined!4699) (MissingVacant!4699 (index!21023 (_ BitVec 32))) )
))
(declare-fun lt!245251 () SeekEntryResult!4699)

(assert (=> b!533427 (= res!328772 (or (= lt!245251 (MissingZero!4699 i!1153)) (= lt!245251 (MissingVacant!4699 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33810 (_ BitVec 32)) SeekEntryResult!4699)

(assert (=> b!533427 (= lt!245251 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533428 () Bool)

(declare-fun res!328778 () Bool)

(assert (=> b!533428 (=> (not res!328778) (not e!310315))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33810 (_ BitVec 32)) Bool)

(assert (=> b!533428 (= res!328778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533429 () Bool)

(declare-fun res!328777 () Bool)

(assert (=> b!533429 (=> (not res!328777) (not e!310315))))

(declare-datatypes ((List!10402 0))(
  ( (Nil!10399) (Cons!10398 (h!11341 (_ BitVec 64)) (t!16621 List!10402)) )
))
(declare-fun arrayNoDuplicates!0 (array!33810 (_ BitVec 32) List!10402) Bool)

(assert (=> b!533429 (= res!328777 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10399))))

(declare-fun b!533430 () Bool)

(assert (=> b!533430 (= e!310315 false)))

(declare-fun lt!245250 () SeekEntryResult!4699)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33810 (_ BitVec 32)) SeekEntryResult!4699)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533430 (= lt!245250 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16244 a!3154) j!147) mask!3216) (select (arr!16244 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533431 () Bool)

(declare-fun res!328773 () Bool)

(assert (=> b!533431 (=> (not res!328773) (not e!310316))))

(declare-fun arrayContainsKey!0 (array!33810 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533431 (= res!328773 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533432 () Bool)

(declare-fun res!328774 () Bool)

(assert (=> b!533432 (=> (not res!328774) (not e!310315))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533432 (= res!328774 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16244 a!3154) j!147) a!3154 mask!3216) (Intermediate!4699 false resIndex!32 resX!32)))))

(declare-fun b!533433 () Bool)

(declare-fun res!328779 () Bool)

(assert (=> b!533433 (=> (not res!328779) (not e!310315))))

(assert (=> b!533433 (= res!328779 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16609 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16609 a!3154)) (= (select (arr!16244 a!3154) resIndex!32) (select (arr!16244 a!3154) j!147))))))

(declare-fun b!533434 () Bool)

(declare-fun res!328781 () Bool)

(assert (=> b!533434 (=> (not res!328781) (not e!310316))))

(assert (=> b!533434 (= res!328781 (validKeyInArray!0 (select (arr!16244 a!3154) j!147)))))

(declare-fun res!328780 () Bool)

(assert (=> start!48588 (=> (not res!328780) (not e!310316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48588 (= res!328780 (validMask!0 mask!3216))))

(assert (=> start!48588 e!310316))

(assert (=> start!48588 true))

(declare-fun array_inv!12127 (array!33810) Bool)

(assert (=> start!48588 (array_inv!12127 a!3154)))

(assert (= (and start!48588 res!328780) b!533426))

(assert (= (and b!533426 res!328775) b!533434))

(assert (= (and b!533434 res!328781) b!533425))

(assert (= (and b!533425 res!328776) b!533431))

(assert (= (and b!533431 res!328773) b!533427))

(assert (= (and b!533427 res!328772) b!533428))

(assert (= (and b!533428 res!328778) b!533429))

(assert (= (and b!533429 res!328777) b!533433))

(assert (= (and b!533433 res!328779) b!533432))

(assert (= (and b!533432 res!328774) b!533430))

(declare-fun m!512761 () Bool)

(assert (=> start!48588 m!512761))

(declare-fun m!512763 () Bool)

(assert (=> start!48588 m!512763))

(declare-fun m!512765 () Bool)

(assert (=> b!533428 m!512765))

(declare-fun m!512767 () Bool)

(assert (=> b!533430 m!512767))

(assert (=> b!533430 m!512767))

(declare-fun m!512769 () Bool)

(assert (=> b!533430 m!512769))

(assert (=> b!533430 m!512769))

(assert (=> b!533430 m!512767))

(declare-fun m!512771 () Bool)

(assert (=> b!533430 m!512771))

(declare-fun m!512773 () Bool)

(assert (=> b!533431 m!512773))

(declare-fun m!512775 () Bool)

(assert (=> b!533433 m!512775))

(assert (=> b!533433 m!512767))

(assert (=> b!533434 m!512767))

(assert (=> b!533434 m!512767))

(declare-fun m!512777 () Bool)

(assert (=> b!533434 m!512777))

(assert (=> b!533432 m!512767))

(assert (=> b!533432 m!512767))

(declare-fun m!512779 () Bool)

(assert (=> b!533432 m!512779))

(declare-fun m!512781 () Bool)

(assert (=> b!533427 m!512781))

(declare-fun m!512783 () Bool)

(assert (=> b!533429 m!512783))

(declare-fun m!512785 () Bool)

(assert (=> b!533425 m!512785))

(check-sat (not b!533427) (not b!533432) (not b!533425) (not start!48588) (not b!533430) (not b!533431) (not b!533428) (not b!533434) (not b!533429))
(check-sat)
