; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49120 () Bool)

(assert start!49120)

(declare-fun res!336026 () Bool)

(declare-fun e!313372 () Bool)

(assert (=> start!49120 (=> (not res!336026) (not e!313372))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49120 (= res!336026 (validMask!0 mask!3216))))

(assert (=> start!49120 e!313372))

(assert (=> start!49120 true))

(declare-datatypes ((array!34230 0))(
  ( (array!34231 (arr!16451 (Array (_ BitVec 32) (_ BitVec 64))) (size!16815 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34230)

(declare-fun array_inv!12247 (array!34230) Bool)

(assert (=> start!49120 (array_inv!12247 a!3154)))

(declare-fun b!541136 () Bool)

(declare-fun res!336024 () Bool)

(assert (=> b!541136 (=> (not res!336024) (not e!313372))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541136 (= res!336024 (validKeyInArray!0 (select (arr!16451 a!3154) j!147)))))

(declare-fun b!541137 () Bool)

(declare-fun res!336025 () Bool)

(assert (=> b!541137 (=> (not res!336025) (not e!313372))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!541137 (= res!336025 (validKeyInArray!0 k!1998))))

(declare-fun b!541138 () Bool)

(declare-fun res!336031 () Bool)

(assert (=> b!541138 (=> (not res!336031) (not e!313372))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541138 (= res!336031 (and (= (size!16815 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16815 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16815 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541139 () Bool)

(declare-fun e!313373 () Bool)

(assert (=> b!541139 (= e!313373 false)))

(declare-datatypes ((SeekEntryResult!4909 0))(
  ( (MissingZero!4909 (index!21860 (_ BitVec 32))) (Found!4909 (index!21861 (_ BitVec 32))) (Intermediate!4909 (undefined!5721 Bool) (index!21862 (_ BitVec 32)) (x!50768 (_ BitVec 32))) (Undefined!4909) (MissingVacant!4909 (index!21863 (_ BitVec 32))) )
))
(declare-fun lt!247561 () SeekEntryResult!4909)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34230 (_ BitVec 32)) SeekEntryResult!4909)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541139 (= lt!247561 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16451 a!3154) j!147) mask!3216) (select (arr!16451 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541140 () Bool)

(assert (=> b!541140 (= e!313372 e!313373)))

(declare-fun res!336029 () Bool)

(assert (=> b!541140 (=> (not res!336029) (not e!313373))))

(declare-fun lt!247560 () SeekEntryResult!4909)

(assert (=> b!541140 (= res!336029 (or (= lt!247560 (MissingZero!4909 i!1153)) (= lt!247560 (MissingVacant!4909 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34230 (_ BitVec 32)) SeekEntryResult!4909)

(assert (=> b!541140 (= lt!247560 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!541141 () Bool)

(declare-fun res!336032 () Bool)

(assert (=> b!541141 (=> (not res!336032) (not e!313372))))

(declare-fun arrayContainsKey!0 (array!34230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541141 (= res!336032 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541142 () Bool)

(declare-fun res!336030 () Bool)

(assert (=> b!541142 (=> (not res!336030) (not e!313373))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!541142 (= res!336030 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16451 a!3154) j!147) a!3154 mask!3216) (Intermediate!4909 false resIndex!32 resX!32)))))

(declare-fun b!541143 () Bool)

(declare-fun res!336028 () Bool)

(assert (=> b!541143 (=> (not res!336028) (not e!313373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34230 (_ BitVec 32)) Bool)

(assert (=> b!541143 (= res!336028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541144 () Bool)

(declare-fun res!336023 () Bool)

(assert (=> b!541144 (=> (not res!336023) (not e!313373))))

(declare-datatypes ((List!10570 0))(
  ( (Nil!10567) (Cons!10566 (h!11515 (_ BitVec 64)) (t!16798 List!10570)) )
))
(declare-fun arrayNoDuplicates!0 (array!34230 (_ BitVec 32) List!10570) Bool)

(assert (=> b!541144 (= res!336023 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10567))))

(declare-fun b!541145 () Bool)

(declare-fun res!336027 () Bool)

(assert (=> b!541145 (=> (not res!336027) (not e!313373))))

(assert (=> b!541145 (= res!336027 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16815 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16815 a!3154)) (= (select (arr!16451 a!3154) resIndex!32) (select (arr!16451 a!3154) j!147))))))

(assert (= (and start!49120 res!336026) b!541138))

(assert (= (and b!541138 res!336031) b!541136))

(assert (= (and b!541136 res!336024) b!541137))

(assert (= (and b!541137 res!336025) b!541141))

(assert (= (and b!541141 res!336032) b!541140))

(assert (= (and b!541140 res!336029) b!541143))

(assert (= (and b!541143 res!336028) b!541144))

(assert (= (and b!541144 res!336023) b!541145))

(assert (= (and b!541145 res!336027) b!541142))

(assert (= (and b!541142 res!336030) b!541139))

(declare-fun m!519751 () Bool)

(assert (=> b!541141 m!519751))

(declare-fun m!519753 () Bool)

(assert (=> b!541140 m!519753))

(declare-fun m!519755 () Bool)

(assert (=> b!541145 m!519755))

(declare-fun m!519757 () Bool)

(assert (=> b!541145 m!519757))

(declare-fun m!519759 () Bool)

(assert (=> b!541144 m!519759))

(assert (=> b!541142 m!519757))

(assert (=> b!541142 m!519757))

(declare-fun m!519761 () Bool)

(assert (=> b!541142 m!519761))

(assert (=> b!541136 m!519757))

(assert (=> b!541136 m!519757))

(declare-fun m!519763 () Bool)

(assert (=> b!541136 m!519763))

(declare-fun m!519765 () Bool)

(assert (=> b!541137 m!519765))

(declare-fun m!519767 () Bool)

(assert (=> start!49120 m!519767))

(declare-fun m!519769 () Bool)

(assert (=> start!49120 m!519769))

(declare-fun m!519771 () Bool)

(assert (=> b!541143 m!519771))

(assert (=> b!541139 m!519757))

(assert (=> b!541139 m!519757))

(declare-fun m!519773 () Bool)

(assert (=> b!541139 m!519773))

(assert (=> b!541139 m!519773))

(assert (=> b!541139 m!519757))

(declare-fun m!519775 () Bool)

(assert (=> b!541139 m!519775))

(push 1)

(assert (not start!49120))

(assert (not b!541141))

(assert (not b!541136))

(assert (not b!541137))

(assert (not b!541139))

(assert (not b!541144))

(assert (not b!541140))

(assert (not b!541143))

(assert (not b!541142))

(check-sat)

(pop 1)

