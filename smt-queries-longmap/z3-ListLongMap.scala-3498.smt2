; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48560 () Bool)

(assert start!48560)

(declare-fun b!533123 () Bool)

(declare-fun e!310310 () Bool)

(assert (=> b!533123 (= e!310310 false)))

(declare-fun lt!245392 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33772 0))(
  ( (array!33773 (arr!16225 (Array (_ BitVec 32) (_ BitVec 64))) (size!16589 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33772)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533123 (= lt!245392 (toIndex!0 (select (arr!16225 a!3154) j!147) mask!3216))))

(declare-fun b!533124 () Bool)

(declare-fun res!328330 () Bool)

(assert (=> b!533124 (=> (not res!328330) (not e!310310))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33772 (_ BitVec 32)) Bool)

(assert (=> b!533124 (= res!328330 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533125 () Bool)

(declare-fun res!328337 () Bool)

(declare-fun e!310311 () Bool)

(assert (=> b!533125 (=> (not res!328337) (not e!310311))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33772 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533125 (= res!328337 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533126 () Bool)

(declare-fun res!328334 () Bool)

(assert (=> b!533126 (=> (not res!328334) (not e!310310))))

(declare-datatypes ((List!10344 0))(
  ( (Nil!10341) (Cons!10340 (h!11283 (_ BitVec 64)) (t!16572 List!10344)) )
))
(declare-fun arrayNoDuplicates!0 (array!33772 (_ BitVec 32) List!10344) Bool)

(assert (=> b!533126 (= res!328334 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10341))))

(declare-fun b!533127 () Bool)

(declare-fun res!328333 () Bool)

(assert (=> b!533127 (=> (not res!328333) (not e!310311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533127 (= res!328333 (validKeyInArray!0 k0!1998))))

(declare-fun b!533129 () Bool)

(declare-fun res!328331 () Bool)

(assert (=> b!533129 (=> (not res!328331) (not e!310310))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!533129 (= res!328331 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16589 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16589 a!3154)) (= (select (arr!16225 a!3154) resIndex!32) (select (arr!16225 a!3154) j!147))))))

(declare-fun b!533130 () Bool)

(declare-fun res!328328 () Bool)

(assert (=> b!533130 (=> (not res!328328) (not e!310311))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533130 (= res!328328 (and (= (size!16589 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16589 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16589 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533131 () Bool)

(assert (=> b!533131 (= e!310311 e!310310)))

(declare-fun res!328329 () Bool)

(assert (=> b!533131 (=> (not res!328329) (not e!310310))))

(declare-datatypes ((SeekEntryResult!4683 0))(
  ( (MissingZero!4683 (index!20956 (_ BitVec 32))) (Found!4683 (index!20957 (_ BitVec 32))) (Intermediate!4683 (undefined!5495 Bool) (index!20958 (_ BitVec 32)) (x!49930 (_ BitVec 32))) (Undefined!4683) (MissingVacant!4683 (index!20959 (_ BitVec 32))) )
))
(declare-fun lt!245391 () SeekEntryResult!4683)

(assert (=> b!533131 (= res!328329 (or (= lt!245391 (MissingZero!4683 i!1153)) (= lt!245391 (MissingVacant!4683 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33772 (_ BitVec 32)) SeekEntryResult!4683)

(assert (=> b!533131 (= lt!245391 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533132 () Bool)

(declare-fun res!328336 () Bool)

(assert (=> b!533132 (=> (not res!328336) (not e!310311))))

(assert (=> b!533132 (= res!328336 (validKeyInArray!0 (select (arr!16225 a!3154) j!147)))))

(declare-fun res!328332 () Bool)

(assert (=> start!48560 (=> (not res!328332) (not e!310311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48560 (= res!328332 (validMask!0 mask!3216))))

(assert (=> start!48560 e!310311))

(assert (=> start!48560 true))

(declare-fun array_inv!12021 (array!33772) Bool)

(assert (=> start!48560 (array_inv!12021 a!3154)))

(declare-fun b!533128 () Bool)

(declare-fun res!328335 () Bool)

(assert (=> b!533128 (=> (not res!328335) (not e!310310))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33772 (_ BitVec 32)) SeekEntryResult!4683)

(assert (=> b!533128 (= res!328335 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16225 a!3154) j!147) a!3154 mask!3216) (Intermediate!4683 false resIndex!32 resX!32)))))

(assert (= (and start!48560 res!328332) b!533130))

(assert (= (and b!533130 res!328328) b!533132))

(assert (= (and b!533132 res!328336) b!533127))

(assert (= (and b!533127 res!328333) b!533125))

(assert (= (and b!533125 res!328337) b!533131))

(assert (= (and b!533131 res!328329) b!533124))

(assert (= (and b!533124 res!328330) b!533126))

(assert (= (and b!533126 res!328334) b!533129))

(assert (= (and b!533129 res!328331) b!533128))

(assert (= (and b!533128 res!328335) b!533123))

(declare-fun m!513069 () Bool)

(assert (=> b!533129 m!513069))

(declare-fun m!513071 () Bool)

(assert (=> b!533129 m!513071))

(assert (=> b!533128 m!513071))

(assert (=> b!533128 m!513071))

(declare-fun m!513073 () Bool)

(assert (=> b!533128 m!513073))

(declare-fun m!513075 () Bool)

(assert (=> b!533125 m!513075))

(assert (=> b!533132 m!513071))

(assert (=> b!533132 m!513071))

(declare-fun m!513077 () Bool)

(assert (=> b!533132 m!513077))

(declare-fun m!513079 () Bool)

(assert (=> b!533131 m!513079))

(declare-fun m!513081 () Bool)

(assert (=> b!533127 m!513081))

(assert (=> b!533123 m!513071))

(assert (=> b!533123 m!513071))

(declare-fun m!513083 () Bool)

(assert (=> b!533123 m!513083))

(declare-fun m!513085 () Bool)

(assert (=> start!48560 m!513085))

(declare-fun m!513087 () Bool)

(assert (=> start!48560 m!513087))

(declare-fun m!513089 () Bool)

(assert (=> b!533126 m!513089))

(declare-fun m!513091 () Bool)

(assert (=> b!533124 m!513091))

(check-sat (not b!533132) (not b!533123) (not start!48560) (not b!533125) (not b!533124) (not b!533127) (not b!533128) (not b!533131) (not b!533126))
(check-sat)
