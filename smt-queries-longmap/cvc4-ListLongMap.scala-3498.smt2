; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48562 () Bool)

(assert start!48562)

(declare-fun b!533153 () Bool)

(declare-fun res!328364 () Bool)

(declare-fun e!310319 () Bool)

(assert (=> b!533153 (=> (not res!328364) (not e!310319))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33774 0))(
  ( (array!33775 (arr!16226 (Array (_ BitVec 32) (_ BitVec 64))) (size!16590 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33774)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533153 (= res!328364 (and (= (size!16590 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16590 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16590 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533155 () Bool)

(declare-fun res!328362 () Bool)

(declare-fun e!310318 () Bool)

(assert (=> b!533155 (=> (not res!328362) (not e!310318))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4684 0))(
  ( (MissingZero!4684 (index!20960 (_ BitVec 32))) (Found!4684 (index!20961 (_ BitVec 32))) (Intermediate!4684 (undefined!5496 Bool) (index!20962 (_ BitVec 32)) (x!49931 (_ BitVec 32))) (Undefined!4684) (MissingVacant!4684 (index!20963 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33774 (_ BitVec 32)) SeekEntryResult!4684)

(assert (=> b!533155 (= res!328362 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16226 a!3154) j!147) a!3154 mask!3216) (Intermediate!4684 false resIndex!32 resX!32)))))

(declare-fun b!533156 () Bool)

(declare-fun res!328358 () Bool)

(assert (=> b!533156 (=> (not res!328358) (not e!310318))))

(assert (=> b!533156 (= res!328358 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16590 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16590 a!3154)) (= (select (arr!16226 a!3154) resIndex!32) (select (arr!16226 a!3154) j!147))))))

(declare-fun b!533157 () Bool)

(assert (=> b!533157 (= e!310318 false)))

(declare-fun lt!245397 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533157 (= lt!245397 (toIndex!0 (select (arr!16226 a!3154) j!147) mask!3216))))

(declare-fun b!533158 () Bool)

(declare-fun res!328360 () Bool)

(assert (=> b!533158 (=> (not res!328360) (not e!310319))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33774 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533158 (= res!328360 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533159 () Bool)

(declare-fun res!328359 () Bool)

(assert (=> b!533159 (=> (not res!328359) (not e!310319))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533159 (= res!328359 (validKeyInArray!0 (select (arr!16226 a!3154) j!147)))))

(declare-fun b!533160 () Bool)

(declare-fun res!328363 () Bool)

(assert (=> b!533160 (=> (not res!328363) (not e!310318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33774 (_ BitVec 32)) Bool)

(assert (=> b!533160 (= res!328363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!328365 () Bool)

(assert (=> start!48562 (=> (not res!328365) (not e!310319))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48562 (= res!328365 (validMask!0 mask!3216))))

(assert (=> start!48562 e!310319))

(assert (=> start!48562 true))

(declare-fun array_inv!12022 (array!33774) Bool)

(assert (=> start!48562 (array_inv!12022 a!3154)))

(declare-fun b!533154 () Bool)

(assert (=> b!533154 (= e!310319 e!310318)))

(declare-fun res!328367 () Bool)

(assert (=> b!533154 (=> (not res!328367) (not e!310318))))

(declare-fun lt!245398 () SeekEntryResult!4684)

(assert (=> b!533154 (= res!328367 (or (= lt!245398 (MissingZero!4684 i!1153)) (= lt!245398 (MissingVacant!4684 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33774 (_ BitVec 32)) SeekEntryResult!4684)

(assert (=> b!533154 (= lt!245398 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!533161 () Bool)

(declare-fun res!328361 () Bool)

(assert (=> b!533161 (=> (not res!328361) (not e!310318))))

(declare-datatypes ((List!10345 0))(
  ( (Nil!10342) (Cons!10341 (h!11284 (_ BitVec 64)) (t!16573 List!10345)) )
))
(declare-fun arrayNoDuplicates!0 (array!33774 (_ BitVec 32) List!10345) Bool)

(assert (=> b!533161 (= res!328361 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10342))))

(declare-fun b!533162 () Bool)

(declare-fun res!328366 () Bool)

(assert (=> b!533162 (=> (not res!328366) (not e!310319))))

(assert (=> b!533162 (= res!328366 (validKeyInArray!0 k!1998))))

(assert (= (and start!48562 res!328365) b!533153))

(assert (= (and b!533153 res!328364) b!533159))

(assert (= (and b!533159 res!328359) b!533162))

(assert (= (and b!533162 res!328366) b!533158))

(assert (= (and b!533158 res!328360) b!533154))

(assert (= (and b!533154 res!328367) b!533160))

(assert (= (and b!533160 res!328363) b!533161))

(assert (= (and b!533161 res!328361) b!533156))

(assert (= (and b!533156 res!328358) b!533155))

(assert (= (and b!533155 res!328362) b!533157))

(declare-fun m!513093 () Bool)

(assert (=> start!48562 m!513093))

(declare-fun m!513095 () Bool)

(assert (=> start!48562 m!513095))

(declare-fun m!513097 () Bool)

(assert (=> b!533155 m!513097))

(assert (=> b!533155 m!513097))

(declare-fun m!513099 () Bool)

(assert (=> b!533155 m!513099))

(declare-fun m!513101 () Bool)

(assert (=> b!533161 m!513101))

(declare-fun m!513103 () Bool)

(assert (=> b!533160 m!513103))

(declare-fun m!513105 () Bool)

(assert (=> b!533162 m!513105))

(assert (=> b!533157 m!513097))

(assert (=> b!533157 m!513097))

(declare-fun m!513107 () Bool)

(assert (=> b!533157 m!513107))

(declare-fun m!513109 () Bool)

(assert (=> b!533158 m!513109))

(declare-fun m!513111 () Bool)

(assert (=> b!533156 m!513111))

(assert (=> b!533156 m!513097))

(declare-fun m!513113 () Bool)

(assert (=> b!533154 m!513113))

(assert (=> b!533159 m!513097))

(assert (=> b!533159 m!513097))

(declare-fun m!513115 () Bool)

(assert (=> b!533159 m!513115))

(push 1)

(assert (not b!533159))

(assert (not start!48562))

(assert (not b!533157))

(assert (not b!533160))

(assert (not b!533155))

(assert (not b!533154))

(assert (not b!533158))

(assert (not b!533162))

