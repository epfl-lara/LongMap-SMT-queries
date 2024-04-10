; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48556 () Bool)

(assert start!48556)

(declare-fun b!533063 () Bool)

(declare-fun res!328273 () Bool)

(declare-fun e!310293 () Bool)

(assert (=> b!533063 (=> (not res!328273) (not e!310293))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33768 0))(
  ( (array!33769 (arr!16223 (Array (_ BitVec 32) (_ BitVec 64))) (size!16587 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33768)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533063 (= res!328273 (and (= (size!16587 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16587 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16587 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533064 () Bool)

(declare-fun e!310292 () Bool)

(assert (=> b!533064 (= e!310293 e!310292)))

(declare-fun res!328276 () Bool)

(assert (=> b!533064 (=> (not res!328276) (not e!310292))))

(declare-datatypes ((SeekEntryResult!4681 0))(
  ( (MissingZero!4681 (index!20948 (_ BitVec 32))) (Found!4681 (index!20949 (_ BitVec 32))) (Intermediate!4681 (undefined!5493 Bool) (index!20950 (_ BitVec 32)) (x!49920 (_ BitVec 32))) (Undefined!4681) (MissingVacant!4681 (index!20951 (_ BitVec 32))) )
))
(declare-fun lt!245379 () SeekEntryResult!4681)

(assert (=> b!533064 (= res!328276 (or (= lt!245379 (MissingZero!4681 i!1153)) (= lt!245379 (MissingVacant!4681 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33768 (_ BitVec 32)) SeekEntryResult!4681)

(assert (=> b!533064 (= lt!245379 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!533065 () Bool)

(declare-fun res!328275 () Bool)

(assert (=> b!533065 (=> (not res!328275) (not e!310293))))

(declare-fun arrayContainsKey!0 (array!33768 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533065 (= res!328275 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533066 () Bool)

(declare-fun res!328277 () Bool)

(assert (=> b!533066 (=> (not res!328277) (not e!310292))))

(declare-datatypes ((List!10342 0))(
  ( (Nil!10339) (Cons!10338 (h!11281 (_ BitVec 64)) (t!16570 List!10342)) )
))
(declare-fun arrayNoDuplicates!0 (array!33768 (_ BitVec 32) List!10342) Bool)

(assert (=> b!533066 (= res!328277 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10339))))

(declare-fun b!533067 () Bool)

(assert (=> b!533067 (= e!310292 false)))

(declare-fun lt!245380 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533067 (= lt!245380 (toIndex!0 (select (arr!16223 a!3154) j!147) mask!3216))))

(declare-fun res!328274 () Bool)

(assert (=> start!48556 (=> (not res!328274) (not e!310293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48556 (= res!328274 (validMask!0 mask!3216))))

(assert (=> start!48556 e!310293))

(assert (=> start!48556 true))

(declare-fun array_inv!12019 (array!33768) Bool)

(assert (=> start!48556 (array_inv!12019 a!3154)))

(declare-fun b!533068 () Bool)

(declare-fun res!328270 () Bool)

(assert (=> b!533068 (=> (not res!328270) (not e!310293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533068 (= res!328270 (validKeyInArray!0 (select (arr!16223 a!3154) j!147)))))

(declare-fun b!533069 () Bool)

(declare-fun res!328268 () Bool)

(assert (=> b!533069 (=> (not res!328268) (not e!310292))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33768 (_ BitVec 32)) Bool)

(assert (=> b!533069 (= res!328268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533070 () Bool)

(declare-fun res!328272 () Bool)

(assert (=> b!533070 (=> (not res!328272) (not e!310292))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33768 (_ BitVec 32)) SeekEntryResult!4681)

(assert (=> b!533070 (= res!328272 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16223 a!3154) j!147) a!3154 mask!3216) (Intermediate!4681 false resIndex!32 resX!32)))))

(declare-fun b!533071 () Bool)

(declare-fun res!328269 () Bool)

(assert (=> b!533071 (=> (not res!328269) (not e!310292))))

(assert (=> b!533071 (= res!328269 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16587 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16587 a!3154)) (= (select (arr!16223 a!3154) resIndex!32) (select (arr!16223 a!3154) j!147))))))

(declare-fun b!533072 () Bool)

(declare-fun res!328271 () Bool)

(assert (=> b!533072 (=> (not res!328271) (not e!310293))))

(assert (=> b!533072 (= res!328271 (validKeyInArray!0 k!1998))))

(assert (= (and start!48556 res!328274) b!533063))

(assert (= (and b!533063 res!328273) b!533068))

(assert (= (and b!533068 res!328270) b!533072))

(assert (= (and b!533072 res!328271) b!533065))

(assert (= (and b!533065 res!328275) b!533064))

(assert (= (and b!533064 res!328276) b!533069))

(assert (= (and b!533069 res!328268) b!533066))

(assert (= (and b!533066 res!328277) b!533071))

(assert (= (and b!533071 res!328269) b!533070))

(assert (= (and b!533070 res!328272) b!533067))

(declare-fun m!513021 () Bool)

(assert (=> b!533071 m!513021))

(declare-fun m!513023 () Bool)

(assert (=> b!533071 m!513023))

(declare-fun m!513025 () Bool)

(assert (=> b!533066 m!513025))

(assert (=> b!533070 m!513023))

(assert (=> b!533070 m!513023))

(declare-fun m!513027 () Bool)

(assert (=> b!533070 m!513027))

(declare-fun m!513029 () Bool)

(assert (=> b!533065 m!513029))

(declare-fun m!513031 () Bool)

(assert (=> b!533064 m!513031))

(declare-fun m!513033 () Bool)

(assert (=> b!533072 m!513033))

(assert (=> b!533068 m!513023))

(assert (=> b!533068 m!513023))

(declare-fun m!513035 () Bool)

(assert (=> b!533068 m!513035))

(assert (=> b!533067 m!513023))

(assert (=> b!533067 m!513023))

(declare-fun m!513037 () Bool)

(assert (=> b!533067 m!513037))

(declare-fun m!513039 () Bool)

(assert (=> start!48556 m!513039))

(declare-fun m!513041 () Bool)

(assert (=> start!48556 m!513041))

(declare-fun m!513043 () Bool)

(assert (=> b!533069 m!513043))

(push 1)

(assert (not start!48556))

(assert (not b!533072))

(assert (not b!533070))

(assert (not b!533067))

(assert (not b!533065))

(assert (not b!533064))

(assert (not b!533069))

(assert (not b!533066))

