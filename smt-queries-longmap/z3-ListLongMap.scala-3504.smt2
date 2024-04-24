; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48586 () Bool)

(assert start!48586)

(declare-fun b!533552 () Bool)

(declare-fun e!310424 () Bool)

(declare-fun e!310423 () Bool)

(assert (=> b!533552 (= e!310424 e!310423)))

(declare-fun res!328814 () Bool)

(assert (=> b!533552 (=> (not res!328814) (not e!310423))))

(declare-datatypes ((SeekEntryResult!4651 0))(
  ( (MissingZero!4651 (index!20828 (_ BitVec 32))) (Found!4651 (index!20829 (_ BitVec 32))) (Intermediate!4651 (undefined!5463 Bool) (index!20830 (_ BitVec 32)) (x!49943 (_ BitVec 32))) (Undefined!4651) (MissingVacant!4651 (index!20831 (_ BitVec 32))) )
))
(declare-fun lt!245478 () SeekEntryResult!4651)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533552 (= res!328814 (or (= lt!245478 (MissingZero!4651 i!1153)) (= lt!245478 (MissingVacant!4651 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!33797 0))(
  ( (array!33798 (arr!16237 (Array (_ BitVec 32) (_ BitVec 64))) (size!16601 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33797)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33797 (_ BitVec 32)) SeekEntryResult!4651)

(assert (=> b!533552 (= lt!245478 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533553 () Bool)

(declare-fun res!328812 () Bool)

(assert (=> b!533553 (=> (not res!328812) (not e!310423))))

(declare-datatypes ((List!10263 0))(
  ( (Nil!10260) (Cons!10259 (h!11202 (_ BitVec 64)) (t!16483 List!10263)) )
))
(declare-fun arrayNoDuplicates!0 (array!33797 (_ BitVec 32) List!10263) Bool)

(assert (=> b!533553 (= res!328812 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10260))))

(declare-fun b!533554 () Bool)

(declare-fun res!328817 () Bool)

(assert (=> b!533554 (=> (not res!328817) (not e!310424))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533554 (= res!328817 (validKeyInArray!0 k0!1998))))

(declare-fun b!533555 () Bool)

(declare-fun res!328816 () Bool)

(assert (=> b!533555 (=> (not res!328816) (not e!310424))))

(declare-fun arrayContainsKey!0 (array!33797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533555 (= res!328816 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!328811 () Bool)

(assert (=> start!48586 (=> (not res!328811) (not e!310424))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48586 (= res!328811 (validMask!0 mask!3216))))

(assert (=> start!48586 e!310424))

(assert (=> start!48586 true))

(declare-fun array_inv!12096 (array!33797) Bool)

(assert (=> start!48586 (array_inv!12096 a!3154)))

(declare-fun b!533556 () Bool)

(declare-fun res!328819 () Bool)

(assert (=> b!533556 (=> (not res!328819) (not e!310424))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!533556 (= res!328819 (and (= (size!16601 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16601 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16601 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533557 () Bool)

(assert (=> b!533557 (= e!310423 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!245479 () SeekEntryResult!4651)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33797 (_ BitVec 32)) SeekEntryResult!4651)

(assert (=> b!533557 (= lt!245479 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16237 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533558 () Bool)

(declare-fun res!328813 () Bool)

(assert (=> b!533558 (=> (not res!328813) (not e!310423))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533558 (= res!328813 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16601 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16601 a!3154)) (= (select (arr!16237 a!3154) resIndex!32) (select (arr!16237 a!3154) j!147))))))

(declare-fun b!533559 () Bool)

(declare-fun res!328818 () Bool)

(assert (=> b!533559 (=> (not res!328818) (not e!310424))))

(assert (=> b!533559 (= res!328818 (validKeyInArray!0 (select (arr!16237 a!3154) j!147)))))

(declare-fun b!533560 () Bool)

(declare-fun res!328815 () Bool)

(assert (=> b!533560 (=> (not res!328815) (not e!310423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33797 (_ BitVec 32)) Bool)

(assert (=> b!533560 (= res!328815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48586 res!328811) b!533556))

(assert (= (and b!533556 res!328819) b!533559))

(assert (= (and b!533559 res!328818) b!533554))

(assert (= (and b!533554 res!328817) b!533555))

(assert (= (and b!533555 res!328816) b!533552))

(assert (= (and b!533552 res!328814) b!533560))

(assert (= (and b!533560 res!328815) b!533553))

(assert (= (and b!533553 res!328812) b!533558))

(assert (= (and b!533558 res!328813) b!533557))

(declare-fun m!513631 () Bool)

(assert (=> b!533559 m!513631))

(assert (=> b!533559 m!513631))

(declare-fun m!513633 () Bool)

(assert (=> b!533559 m!513633))

(declare-fun m!513635 () Bool)

(assert (=> start!48586 m!513635))

(declare-fun m!513637 () Bool)

(assert (=> start!48586 m!513637))

(declare-fun m!513639 () Bool)

(assert (=> b!533558 m!513639))

(assert (=> b!533558 m!513631))

(declare-fun m!513641 () Bool)

(assert (=> b!533553 m!513641))

(declare-fun m!513643 () Bool)

(assert (=> b!533555 m!513643))

(assert (=> b!533557 m!513631))

(assert (=> b!533557 m!513631))

(declare-fun m!513645 () Bool)

(assert (=> b!533557 m!513645))

(declare-fun m!513647 () Bool)

(assert (=> b!533552 m!513647))

(declare-fun m!513649 () Bool)

(assert (=> b!533560 m!513649))

(declare-fun m!513651 () Bool)

(assert (=> b!533554 m!513651))

(check-sat (not b!533553) (not start!48586) (not b!533559) (not b!533555) (not b!533557) (not b!533552) (not b!533560) (not b!533554))
(check-sat)
