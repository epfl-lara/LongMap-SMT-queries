; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49296 () Bool)

(assert start!49296)

(declare-fun b!542771 () Bool)

(declare-fun res!337464 () Bool)

(declare-fun e!313992 () Bool)

(assert (=> b!542771 (=> (not res!337464) (not e!313992))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542771 (= res!337464 (validKeyInArray!0 k0!1998))))

(declare-fun res!337475 () Bool)

(assert (=> start!49296 (=> (not res!337475) (not e!313992))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49296 (= res!337475 (validMask!0 mask!3216))))

(assert (=> start!49296 e!313992))

(assert (=> start!49296 true))

(declare-datatypes ((array!34314 0))(
  ( (array!34315 (arr!16490 (Array (_ BitVec 32) (_ BitVec 64))) (size!16855 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34314)

(declare-fun array_inv!12373 (array!34314) Bool)

(assert (=> start!49296 (array_inv!12373 a!3154)))

(declare-fun b!542772 () Bool)

(declare-fun e!313994 () Bool)

(assert (=> b!542772 (= e!313994 false)))

(declare-fun lt!247838 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542772 (= lt!247838 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542773 () Bool)

(declare-fun e!313993 () Bool)

(assert (=> b!542773 (= e!313993 e!313994)))

(declare-fun res!337471 () Bool)

(assert (=> b!542773 (=> (not res!337471) (not e!313994))))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4945 0))(
  ( (MissingZero!4945 (index!22004 (_ BitVec 32))) (Found!4945 (index!22005 (_ BitVec 32))) (Intermediate!4945 (undefined!5757 Bool) (index!22006 (_ BitVec 32)) (x!50923 (_ BitVec 32))) (Undefined!4945) (MissingVacant!4945 (index!22007 (_ BitVec 32))) )
))
(declare-fun lt!247839 () SeekEntryResult!4945)

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!542773 (= res!337471 (= lt!247839 (Intermediate!4945 false resIndex!32 resX!32)))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34314 (_ BitVec 32)) SeekEntryResult!4945)

(assert (=> b!542773 (= lt!247839 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16490 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542774 () Bool)

(declare-fun res!337473 () Bool)

(assert (=> b!542774 (=> (not res!337473) (not e!313994))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542774 (= res!337473 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16490 a!3154) j!147) mask!3216) (select (arr!16490 a!3154) j!147) a!3154 mask!3216) lt!247839))))

(declare-fun b!542775 () Bool)

(declare-fun res!337465 () Bool)

(assert (=> b!542775 (=> (not res!337465) (not e!313994))))

(assert (=> b!542775 (= res!337465 (and (not (= (select (arr!16490 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16490 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16490 a!3154) index!1177) (select (arr!16490 a!3154) j!147)))))))

(declare-fun b!542776 () Bool)

(declare-fun res!337472 () Bool)

(assert (=> b!542776 (=> (not res!337472) (not e!313992))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542776 (= res!337472 (and (= (size!16855 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16855 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16855 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542777 () Bool)

(assert (=> b!542777 (= e!313992 e!313993)))

(declare-fun res!337467 () Bool)

(assert (=> b!542777 (=> (not res!337467) (not e!313993))))

(declare-fun lt!247840 () SeekEntryResult!4945)

(assert (=> b!542777 (= res!337467 (or (= lt!247840 (MissingZero!4945 i!1153)) (= lt!247840 (MissingVacant!4945 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34314 (_ BitVec 32)) SeekEntryResult!4945)

(assert (=> b!542777 (= lt!247840 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542778 () Bool)

(declare-fun res!337466 () Bool)

(assert (=> b!542778 (=> (not res!337466) (not e!313993))))

(declare-datatypes ((List!10648 0))(
  ( (Nil!10645) (Cons!10644 (h!11599 (_ BitVec 64)) (t!16867 List!10648)) )
))
(declare-fun arrayNoDuplicates!0 (array!34314 (_ BitVec 32) List!10648) Bool)

(assert (=> b!542778 (= res!337466 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10645))))

(declare-fun b!542779 () Bool)

(declare-fun res!337470 () Bool)

(assert (=> b!542779 (=> (not res!337470) (not e!313992))))

(assert (=> b!542779 (= res!337470 (validKeyInArray!0 (select (arr!16490 a!3154) j!147)))))

(declare-fun b!542780 () Bool)

(declare-fun res!337469 () Bool)

(assert (=> b!542780 (=> (not res!337469) (not e!313992))))

(declare-fun arrayContainsKey!0 (array!34314 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542780 (= res!337469 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542781 () Bool)

(declare-fun res!337468 () Bool)

(assert (=> b!542781 (=> (not res!337468) (not e!313993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34314 (_ BitVec 32)) Bool)

(assert (=> b!542781 (= res!337468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542782 () Bool)

(declare-fun res!337474 () Bool)

(assert (=> b!542782 (=> (not res!337474) (not e!313993))))

(assert (=> b!542782 (= res!337474 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16855 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16855 a!3154)) (= (select (arr!16490 a!3154) resIndex!32) (select (arr!16490 a!3154) j!147))))))

(assert (= (and start!49296 res!337475) b!542776))

(assert (= (and b!542776 res!337472) b!542779))

(assert (= (and b!542779 res!337470) b!542771))

(assert (= (and b!542771 res!337464) b!542780))

(assert (= (and b!542780 res!337469) b!542777))

(assert (= (and b!542777 res!337467) b!542781))

(assert (= (and b!542781 res!337468) b!542778))

(assert (= (and b!542778 res!337466) b!542782))

(assert (= (and b!542782 res!337474) b!542773))

(assert (= (and b!542773 res!337471) b!542774))

(assert (= (and b!542774 res!337473) b!542775))

(assert (= (and b!542775 res!337465) b!542772))

(declare-fun m!520447 () Bool)

(assert (=> b!542771 m!520447))

(declare-fun m!520449 () Bool)

(assert (=> b!542777 m!520449))

(declare-fun m!520451 () Bool)

(assert (=> b!542774 m!520451))

(assert (=> b!542774 m!520451))

(declare-fun m!520453 () Bool)

(assert (=> b!542774 m!520453))

(assert (=> b!542774 m!520453))

(assert (=> b!542774 m!520451))

(declare-fun m!520455 () Bool)

(assert (=> b!542774 m!520455))

(declare-fun m!520457 () Bool)

(assert (=> b!542778 m!520457))

(declare-fun m!520459 () Bool)

(assert (=> b!542782 m!520459))

(assert (=> b!542782 m!520451))

(declare-fun m!520461 () Bool)

(assert (=> start!49296 m!520461))

(declare-fun m!520463 () Bool)

(assert (=> start!49296 m!520463))

(declare-fun m!520465 () Bool)

(assert (=> b!542775 m!520465))

(assert (=> b!542775 m!520451))

(declare-fun m!520467 () Bool)

(assert (=> b!542772 m!520467))

(declare-fun m!520469 () Bool)

(assert (=> b!542781 m!520469))

(assert (=> b!542773 m!520451))

(assert (=> b!542773 m!520451))

(declare-fun m!520471 () Bool)

(assert (=> b!542773 m!520471))

(assert (=> b!542779 m!520451))

(assert (=> b!542779 m!520451))

(declare-fun m!520473 () Bool)

(assert (=> b!542779 m!520473))

(declare-fun m!520475 () Bool)

(assert (=> b!542780 m!520475))

(check-sat (not b!542771) (not b!542774) (not b!542780) (not start!49296) (not b!542773) (not b!542781) (not b!542778) (not b!542777) (not b!542779) (not b!542772))
(check-sat)
