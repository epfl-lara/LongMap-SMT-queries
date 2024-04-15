; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49302 () Bool)

(assert start!49302)

(declare-fun b!542879 () Bool)

(declare-fun res!337583 () Bool)

(declare-fun e!314030 () Bool)

(assert (=> b!542879 (=> (not res!337583) (not e!314030))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34320 0))(
  ( (array!34321 (arr!16493 (Array (_ BitVec 32) (_ BitVec 64))) (size!16858 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34320)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542879 (= res!337583 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16858 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16858 a!3154)) (= (select (arr!16493 a!3154) resIndex!32) (select (arr!16493 a!3154) j!147))))))

(declare-fun b!542880 () Bool)

(declare-fun res!337575 () Bool)

(declare-fun e!314028 () Bool)

(assert (=> b!542880 (=> (not res!337575) (not e!314028))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542880 (= res!337575 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542881 () Bool)

(declare-fun res!337579 () Bool)

(assert (=> b!542881 (=> (not res!337579) (not e!314028))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542881 (= res!337579 (validKeyInArray!0 k0!1998))))

(declare-fun b!542883 () Bool)

(declare-fun res!337580 () Bool)

(declare-fun e!314031 () Bool)

(assert (=> b!542883 (=> (not res!337580) (not e!314031))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4948 0))(
  ( (MissingZero!4948 (index!22016 (_ BitVec 32))) (Found!4948 (index!22017 (_ BitVec 32))) (Intermediate!4948 (undefined!5760 Bool) (index!22018 (_ BitVec 32)) (x!50934 (_ BitVec 32))) (Undefined!4948) (MissingVacant!4948 (index!22019 (_ BitVec 32))) )
))
(declare-fun lt!247865 () SeekEntryResult!4948)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34320 (_ BitVec 32)) SeekEntryResult!4948)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542883 (= res!337580 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16493 a!3154) j!147) mask!3216) (select (arr!16493 a!3154) j!147) a!3154 mask!3216) lt!247865))))

(declare-fun b!542884 () Bool)

(assert (=> b!542884 (= e!314030 e!314031)))

(declare-fun res!337577 () Bool)

(assert (=> b!542884 (=> (not res!337577) (not e!314031))))

(assert (=> b!542884 (= res!337577 (= lt!247865 (Intermediate!4948 false resIndex!32 resX!32)))))

(assert (=> b!542884 (= lt!247865 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16493 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542885 () Bool)

(declare-fun res!337581 () Bool)

(assert (=> b!542885 (=> (not res!337581) (not e!314028))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542885 (= res!337581 (and (= (size!16858 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16858 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16858 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542886 () Bool)

(declare-fun res!337578 () Bool)

(assert (=> b!542886 (=> (not res!337578) (not e!314030))))

(declare-datatypes ((List!10651 0))(
  ( (Nil!10648) (Cons!10647 (h!11602 (_ BitVec 64)) (t!16870 List!10651)) )
))
(declare-fun arrayNoDuplicates!0 (array!34320 (_ BitVec 32) List!10651) Bool)

(assert (=> b!542886 (= res!337578 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10648))))

(declare-fun b!542887 () Bool)

(assert (=> b!542887 (= e!314028 e!314030)))

(declare-fun res!337582 () Bool)

(assert (=> b!542887 (=> (not res!337582) (not e!314030))))

(declare-fun lt!247866 () SeekEntryResult!4948)

(assert (=> b!542887 (= res!337582 (or (= lt!247866 (MissingZero!4948 i!1153)) (= lt!247866 (MissingVacant!4948 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34320 (_ BitVec 32)) SeekEntryResult!4948)

(assert (=> b!542887 (= lt!247866 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542888 () Bool)

(declare-fun res!337572 () Bool)

(assert (=> b!542888 (=> (not res!337572) (not e!314031))))

(assert (=> b!542888 (= res!337572 (and (not (= (select (arr!16493 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16493 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16493 a!3154) index!1177) (select (arr!16493 a!3154) j!147)))))))

(declare-fun res!337576 () Bool)

(assert (=> start!49302 (=> (not res!337576) (not e!314028))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49302 (= res!337576 (validMask!0 mask!3216))))

(assert (=> start!49302 e!314028))

(assert (=> start!49302 true))

(declare-fun array_inv!12376 (array!34320) Bool)

(assert (=> start!49302 (array_inv!12376 a!3154)))

(declare-fun b!542882 () Bool)

(assert (=> b!542882 (= e!314031 false)))

(declare-fun lt!247867 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542882 (= lt!247867 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542889 () Bool)

(declare-fun res!337573 () Bool)

(assert (=> b!542889 (=> (not res!337573) (not e!314028))))

(assert (=> b!542889 (= res!337573 (validKeyInArray!0 (select (arr!16493 a!3154) j!147)))))

(declare-fun b!542890 () Bool)

(declare-fun res!337574 () Bool)

(assert (=> b!542890 (=> (not res!337574) (not e!314030))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34320 (_ BitVec 32)) Bool)

(assert (=> b!542890 (= res!337574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49302 res!337576) b!542885))

(assert (= (and b!542885 res!337581) b!542889))

(assert (= (and b!542889 res!337573) b!542881))

(assert (= (and b!542881 res!337579) b!542880))

(assert (= (and b!542880 res!337575) b!542887))

(assert (= (and b!542887 res!337582) b!542890))

(assert (= (and b!542890 res!337574) b!542886))

(assert (= (and b!542886 res!337578) b!542879))

(assert (= (and b!542879 res!337583) b!542884))

(assert (= (and b!542884 res!337577) b!542883))

(assert (= (and b!542883 res!337580) b!542888))

(assert (= (and b!542888 res!337572) b!542882))

(declare-fun m!520537 () Bool)

(assert (=> b!542887 m!520537))

(declare-fun m!520539 () Bool)

(assert (=> b!542886 m!520539))

(declare-fun m!520541 () Bool)

(assert (=> b!542889 m!520541))

(assert (=> b!542889 m!520541))

(declare-fun m!520543 () Bool)

(assert (=> b!542889 m!520543))

(declare-fun m!520545 () Bool)

(assert (=> b!542881 m!520545))

(assert (=> b!542884 m!520541))

(assert (=> b!542884 m!520541))

(declare-fun m!520547 () Bool)

(assert (=> b!542884 m!520547))

(declare-fun m!520549 () Bool)

(assert (=> b!542880 m!520549))

(declare-fun m!520551 () Bool)

(assert (=> start!49302 m!520551))

(declare-fun m!520553 () Bool)

(assert (=> start!49302 m!520553))

(assert (=> b!542883 m!520541))

(assert (=> b!542883 m!520541))

(declare-fun m!520555 () Bool)

(assert (=> b!542883 m!520555))

(assert (=> b!542883 m!520555))

(assert (=> b!542883 m!520541))

(declare-fun m!520557 () Bool)

(assert (=> b!542883 m!520557))

(declare-fun m!520559 () Bool)

(assert (=> b!542879 m!520559))

(assert (=> b!542879 m!520541))

(declare-fun m!520561 () Bool)

(assert (=> b!542888 m!520561))

(assert (=> b!542888 m!520541))

(declare-fun m!520563 () Bool)

(assert (=> b!542882 m!520563))

(declare-fun m!520565 () Bool)

(assert (=> b!542890 m!520565))

(check-sat (not start!49302) (not b!542880) (not b!542882) (not b!542884) (not b!542886) (not b!542889) (not b!542887) (not b!542883) (not b!542881) (not b!542890))
(check-sat)
