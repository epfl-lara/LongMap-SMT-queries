; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49198 () Bool)

(assert start!49198)

(declare-fun b!541766 () Bool)

(declare-fun e!313659 () Bool)

(declare-fun e!313657 () Bool)

(assert (=> b!541766 (= e!313659 e!313657)))

(declare-fun res!336496 () Bool)

(assert (=> b!541766 (=> (not res!336496) (not e!313657))))

(declare-datatypes ((SeekEntryResult!4921 0))(
  ( (MissingZero!4921 (index!21908 (_ BitVec 32))) (Found!4921 (index!21909 (_ BitVec 32))) (Intermediate!4921 (undefined!5733 Bool) (index!21910 (_ BitVec 32)) (x!50818 (_ BitVec 32))) (Undefined!4921) (MissingVacant!4921 (index!21911 (_ BitVec 32))) )
))
(declare-fun lt!247728 () SeekEntryResult!4921)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541766 (= res!336496 (or (= lt!247728 (MissingZero!4921 i!1153)) (= lt!247728 (MissingVacant!4921 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!34257 0))(
  ( (array!34258 (arr!16463 (Array (_ BitVec 32) (_ BitVec 64))) (size!16827 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34257)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34257 (_ BitVec 32)) SeekEntryResult!4921)

(assert (=> b!541766 (= lt!247728 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!541767 () Bool)

(assert (=> b!541767 (= e!313657 false)))

(declare-fun lt!247729 () SeekEntryResult!4921)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34257 (_ BitVec 32)) SeekEntryResult!4921)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541767 (= lt!247729 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16463 a!3154) j!147) mask!3216) (select (arr!16463 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!336499 () Bool)

(assert (=> start!49198 (=> (not res!336499) (not e!313659))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49198 (= res!336499 (validMask!0 mask!3216))))

(assert (=> start!49198 e!313659))

(assert (=> start!49198 true))

(declare-fun array_inv!12259 (array!34257) Bool)

(assert (=> start!49198 (array_inv!12259 a!3154)))

(declare-fun b!541768 () Bool)

(declare-fun res!336495 () Bool)

(assert (=> b!541768 (=> (not res!336495) (not e!313659))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541768 (= res!336495 (validKeyInArray!0 k!1998))))

(declare-fun b!541769 () Bool)

(declare-fun res!336497 () Bool)

(assert (=> b!541769 (=> (not res!336497) (not e!313659))))

(assert (=> b!541769 (= res!336497 (and (= (size!16827 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16827 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16827 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541770 () Bool)

(declare-fun res!336501 () Bool)

(assert (=> b!541770 (=> (not res!336501) (not e!313659))))

(assert (=> b!541770 (= res!336501 (validKeyInArray!0 (select (arr!16463 a!3154) j!147)))))

(declare-fun b!541771 () Bool)

(declare-fun res!336500 () Bool)

(assert (=> b!541771 (=> (not res!336500) (not e!313657))))

(declare-datatypes ((List!10582 0))(
  ( (Nil!10579) (Cons!10578 (h!11530 (_ BitVec 64)) (t!16810 List!10582)) )
))
(declare-fun arrayNoDuplicates!0 (array!34257 (_ BitVec 32) List!10582) Bool)

(assert (=> b!541771 (= res!336500 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10579))))

(declare-fun b!541772 () Bool)

(declare-fun res!336502 () Bool)

(assert (=> b!541772 (=> (not res!336502) (not e!313659))))

(declare-fun arrayContainsKey!0 (array!34257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541772 (= res!336502 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541773 () Bool)

(declare-fun res!336494 () Bool)

(assert (=> b!541773 (=> (not res!336494) (not e!313657))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!541773 (= res!336494 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16827 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16827 a!3154)) (= (select (arr!16463 a!3154) resIndex!32) (select (arr!16463 a!3154) j!147))))))

(declare-fun b!541774 () Bool)

(declare-fun res!336503 () Bool)

(assert (=> b!541774 (=> (not res!336503) (not e!313657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34257 (_ BitVec 32)) Bool)

(assert (=> b!541774 (= res!336503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541775 () Bool)

(declare-fun res!336498 () Bool)

(assert (=> b!541775 (=> (not res!336498) (not e!313657))))

(assert (=> b!541775 (= res!336498 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16463 a!3154) j!147) a!3154 mask!3216) (Intermediate!4921 false resIndex!32 resX!32)))))

(assert (= (and start!49198 res!336499) b!541769))

(assert (= (and b!541769 res!336497) b!541770))

(assert (= (and b!541770 res!336501) b!541768))

(assert (= (and b!541768 res!336495) b!541772))

(assert (= (and b!541772 res!336502) b!541766))

(assert (= (and b!541766 res!336496) b!541774))

(assert (= (and b!541774 res!336503) b!541771))

(assert (= (and b!541771 res!336500) b!541773))

(assert (= (and b!541773 res!336494) b!541775))

(assert (= (and b!541775 res!336498) b!541767))

(declare-fun m!520207 () Bool)

(assert (=> b!541770 m!520207))

(assert (=> b!541770 m!520207))

(declare-fun m!520209 () Bool)

(assert (=> b!541770 m!520209))

(declare-fun m!520211 () Bool)

(assert (=> b!541771 m!520211))

(assert (=> b!541775 m!520207))

(assert (=> b!541775 m!520207))

(declare-fun m!520213 () Bool)

(assert (=> b!541775 m!520213))

(declare-fun m!520215 () Bool)

(assert (=> b!541768 m!520215))

(declare-fun m!520217 () Bool)

(assert (=> b!541774 m!520217))

(declare-fun m!520219 () Bool)

(assert (=> start!49198 m!520219))

(declare-fun m!520221 () Bool)

(assert (=> start!49198 m!520221))

(declare-fun m!520223 () Bool)

(assert (=> b!541773 m!520223))

(assert (=> b!541773 m!520207))

(declare-fun m!520225 () Bool)

(assert (=> b!541772 m!520225))

(declare-fun m!520227 () Bool)

(assert (=> b!541766 m!520227))

(assert (=> b!541767 m!520207))

(assert (=> b!541767 m!520207))

(declare-fun m!520229 () Bool)

(assert (=> b!541767 m!520229))

(assert (=> b!541767 m!520229))

(assert (=> b!541767 m!520207))

(declare-fun m!520231 () Bool)

(assert (=> b!541767 m!520231))

(push 1)

(assert (not b!541771))

(assert (not b!541775))

(assert (not b!541774))

(assert (not b!541766))

(assert (not b!541767))

(assert (not b!541768))

(assert (not b!541772))

(assert (not b!541770))

(assert (not start!49198))

(check-sat)

