; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48608 () Bool)

(assert start!48608)

(declare-fun b!533816 () Bool)

(declare-fun e!310525 () Bool)

(assert (=> b!533816 (= e!310525 false)))

(declare-datatypes ((SeekEntryResult!4707 0))(
  ( (MissingZero!4707 (index!21052 (_ BitVec 32))) (Found!4707 (index!21053 (_ BitVec 32))) (Intermediate!4707 (undefined!5519 Bool) (index!21054 (_ BitVec 32)) (x!50018 (_ BitVec 32))) (Undefined!4707) (MissingVacant!4707 (index!21055 (_ BitVec 32))) )
))
(declare-fun lt!245508 () SeekEntryResult!4707)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33820 0))(
  ( (array!33821 (arr!16249 (Array (_ BitVec 32) (_ BitVec 64))) (size!16613 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33820)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33820 (_ BitVec 32)) SeekEntryResult!4707)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533816 (= lt!245508 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16249 a!3154) j!147) mask!3216) (select (arr!16249 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533817 () Bool)

(declare-fun res!329029 () Bool)

(declare-fun e!310527 () Bool)

(assert (=> b!533817 (=> (not res!329029) (not e!310527))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533817 (= res!329029 (and (= (size!16613 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16613 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16613 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533818 () Bool)

(declare-fun res!329022 () Bool)

(assert (=> b!533818 (=> (not res!329022) (not e!310525))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533818 (= res!329022 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16249 a!3154) j!147) a!3154 mask!3216) (Intermediate!4707 false resIndex!32 resX!32)))))

(declare-fun b!533819 () Bool)

(assert (=> b!533819 (= e!310527 e!310525)))

(declare-fun res!329028 () Bool)

(assert (=> b!533819 (=> (not res!329028) (not e!310525))))

(declare-fun lt!245509 () SeekEntryResult!4707)

(assert (=> b!533819 (= res!329028 (or (= lt!245509 (MissingZero!4707 i!1153)) (= lt!245509 (MissingVacant!4707 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33820 (_ BitVec 32)) SeekEntryResult!4707)

(assert (=> b!533819 (= lt!245509 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533820 () Bool)

(declare-fun res!329026 () Bool)

(assert (=> b!533820 (=> (not res!329026) (not e!310527))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533820 (= res!329026 (validKeyInArray!0 (select (arr!16249 a!3154) j!147)))))

(declare-fun b!533822 () Bool)

(declare-fun res!329024 () Bool)

(assert (=> b!533822 (=> (not res!329024) (not e!310525))))

(declare-datatypes ((List!10368 0))(
  ( (Nil!10365) (Cons!10364 (h!11307 (_ BitVec 64)) (t!16596 List!10368)) )
))
(declare-fun arrayNoDuplicates!0 (array!33820 (_ BitVec 32) List!10368) Bool)

(assert (=> b!533822 (= res!329024 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10365))))

(declare-fun b!533823 () Bool)

(declare-fun res!329025 () Bool)

(assert (=> b!533823 (=> (not res!329025) (not e!310525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33820 (_ BitVec 32)) Bool)

(assert (=> b!533823 (= res!329025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!329023 () Bool)

(assert (=> start!48608 (=> (not res!329023) (not e!310527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48608 (= res!329023 (validMask!0 mask!3216))))

(assert (=> start!48608 e!310527))

(assert (=> start!48608 true))

(declare-fun array_inv!12045 (array!33820) Bool)

(assert (=> start!48608 (array_inv!12045 a!3154)))

(declare-fun b!533821 () Bool)

(declare-fun res!329030 () Bool)

(assert (=> b!533821 (=> (not res!329030) (not e!310527))))

(assert (=> b!533821 (= res!329030 (validKeyInArray!0 k0!1998))))

(declare-fun b!533824 () Bool)

(declare-fun res!329027 () Bool)

(assert (=> b!533824 (=> (not res!329027) (not e!310527))))

(declare-fun arrayContainsKey!0 (array!33820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533824 (= res!329027 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533825 () Bool)

(declare-fun res!329021 () Bool)

(assert (=> b!533825 (=> (not res!329021) (not e!310525))))

(assert (=> b!533825 (= res!329021 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16613 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16613 a!3154)) (= (select (arr!16249 a!3154) resIndex!32) (select (arr!16249 a!3154) j!147))))))

(assert (= (and start!48608 res!329023) b!533817))

(assert (= (and b!533817 res!329029) b!533820))

(assert (= (and b!533820 res!329026) b!533821))

(assert (= (and b!533821 res!329030) b!533824))

(assert (= (and b!533824 res!329027) b!533819))

(assert (= (and b!533819 res!329028) b!533823))

(assert (= (and b!533823 res!329025) b!533822))

(assert (= (and b!533822 res!329024) b!533825))

(assert (= (and b!533825 res!329021) b!533818))

(assert (= (and b!533818 res!329022) b!533816))

(declare-fun m!513617 () Bool)

(assert (=> b!533825 m!513617))

(declare-fun m!513619 () Bool)

(assert (=> b!533825 m!513619))

(declare-fun m!513621 () Bool)

(assert (=> b!533819 m!513621))

(assert (=> b!533816 m!513619))

(assert (=> b!533816 m!513619))

(declare-fun m!513623 () Bool)

(assert (=> b!533816 m!513623))

(assert (=> b!533816 m!513623))

(assert (=> b!533816 m!513619))

(declare-fun m!513625 () Bool)

(assert (=> b!533816 m!513625))

(declare-fun m!513627 () Bool)

(assert (=> b!533824 m!513627))

(declare-fun m!513629 () Bool)

(assert (=> b!533823 m!513629))

(declare-fun m!513631 () Bool)

(assert (=> b!533822 m!513631))

(declare-fun m!513633 () Bool)

(assert (=> start!48608 m!513633))

(declare-fun m!513635 () Bool)

(assert (=> start!48608 m!513635))

(declare-fun m!513637 () Bool)

(assert (=> b!533821 m!513637))

(assert (=> b!533818 m!513619))

(assert (=> b!533818 m!513619))

(declare-fun m!513639 () Bool)

(assert (=> b!533818 m!513639))

(assert (=> b!533820 m!513619))

(assert (=> b!533820 m!513619))

(declare-fun m!513641 () Bool)

(assert (=> b!533820 m!513641))

(check-sat (not start!48608) (not b!533822) (not b!533820) (not b!533818) (not b!533823) (not b!533824) (not b!533819) (not b!533821) (not b!533816))
(check-sat)
