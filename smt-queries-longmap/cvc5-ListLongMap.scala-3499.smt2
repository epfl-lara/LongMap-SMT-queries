; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48564 () Bool)

(assert start!48564)

(declare-fun b!533181 () Bool)

(declare-fun res!328392 () Bool)

(declare-fun e!310329 () Bool)

(assert (=> b!533181 (=> (not res!328392) (not e!310329))))

(declare-datatypes ((array!33776 0))(
  ( (array!33777 (arr!16227 (Array (_ BitVec 32) (_ BitVec 64))) (size!16591 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33776)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33776 (_ BitVec 32)) Bool)

(assert (=> b!533181 (= res!328392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533182 () Bool)

(declare-fun res!328389 () Bool)

(assert (=> b!533182 (=> (not res!328389) (not e!310329))))

(declare-datatypes ((List!10346 0))(
  ( (Nil!10343) (Cons!10342 (h!11285 (_ BitVec 64)) (t!16574 List!10346)) )
))
(declare-fun arrayNoDuplicates!0 (array!33776 (_ BitVec 32) List!10346) Bool)

(assert (=> b!533182 (= res!328389 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10343))))

(declare-fun b!533183 () Bool)

(declare-fun res!328387 () Bool)

(declare-fun e!310328 () Bool)

(assert (=> b!533183 (=> (not res!328387) (not e!310328))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533183 (= res!328387 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533184 () Bool)

(declare-fun res!328391 () Bool)

(assert (=> b!533184 (=> (not res!328391) (not e!310328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533184 (= res!328391 (validKeyInArray!0 k!1998))))

(declare-fun b!533185 () Bool)

(declare-fun res!328393 () Bool)

(assert (=> b!533185 (=> (not res!328393) (not e!310328))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!533185 (= res!328393 (validKeyInArray!0 (select (arr!16227 a!3154) j!147)))))

(declare-fun b!533186 () Bool)

(declare-fun res!328386 () Bool)

(assert (=> b!533186 (=> (not res!328386) (not e!310328))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533186 (= res!328386 (and (= (size!16591 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16591 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16591 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533187 () Bool)

(declare-fun res!328394 () Bool)

(assert (=> b!533187 (=> (not res!328394) (not e!310329))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533187 (= res!328394 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16591 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16591 a!3154)) (= (select (arr!16227 a!3154) resIndex!32) (select (arr!16227 a!3154) j!147))))))

(declare-fun b!533188 () Bool)

(assert (=> b!533188 (= e!310329 false)))

(declare-datatypes ((SeekEntryResult!4685 0))(
  ( (MissingZero!4685 (index!20964 (_ BitVec 32))) (Found!4685 (index!20965 (_ BitVec 32))) (Intermediate!4685 (undefined!5497 Bool) (index!20966 (_ BitVec 32)) (x!49940 (_ BitVec 32))) (Undefined!4685) (MissingVacant!4685 (index!20967 (_ BitVec 32))) )
))
(declare-fun lt!245403 () SeekEntryResult!4685)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33776 (_ BitVec 32)) SeekEntryResult!4685)

(assert (=> b!533188 (= lt!245403 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16227 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533189 () Bool)

(assert (=> b!533189 (= e!310328 e!310329)))

(declare-fun res!328390 () Bool)

(assert (=> b!533189 (=> (not res!328390) (not e!310329))))

(declare-fun lt!245404 () SeekEntryResult!4685)

(assert (=> b!533189 (= res!328390 (or (= lt!245404 (MissingZero!4685 i!1153)) (= lt!245404 (MissingVacant!4685 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33776 (_ BitVec 32)) SeekEntryResult!4685)

(assert (=> b!533189 (= lt!245404 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!328388 () Bool)

(assert (=> start!48564 (=> (not res!328388) (not e!310328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48564 (= res!328388 (validMask!0 mask!3216))))

(assert (=> start!48564 e!310328))

(assert (=> start!48564 true))

(declare-fun array_inv!12023 (array!33776) Bool)

(assert (=> start!48564 (array_inv!12023 a!3154)))

(assert (= (and start!48564 res!328388) b!533186))

(assert (= (and b!533186 res!328386) b!533185))

(assert (= (and b!533185 res!328393) b!533184))

(assert (= (and b!533184 res!328391) b!533183))

(assert (= (and b!533183 res!328387) b!533189))

(assert (= (and b!533189 res!328390) b!533181))

(assert (= (and b!533181 res!328392) b!533182))

(assert (= (and b!533182 res!328389) b!533187))

(assert (= (and b!533187 res!328394) b!533188))

(declare-fun m!513117 () Bool)

(assert (=> b!533187 m!513117))

(declare-fun m!513119 () Bool)

(assert (=> b!533187 m!513119))

(declare-fun m!513121 () Bool)

(assert (=> b!533189 m!513121))

(assert (=> b!533188 m!513119))

(assert (=> b!533188 m!513119))

(declare-fun m!513123 () Bool)

(assert (=> b!533188 m!513123))

(declare-fun m!513125 () Bool)

(assert (=> start!48564 m!513125))

(declare-fun m!513127 () Bool)

(assert (=> start!48564 m!513127))

(declare-fun m!513129 () Bool)

(assert (=> b!533183 m!513129))

(declare-fun m!513131 () Bool)

(assert (=> b!533182 m!513131))

(declare-fun m!513133 () Bool)

(assert (=> b!533184 m!513133))

(declare-fun m!513135 () Bool)

(assert (=> b!533181 m!513135))

(assert (=> b!533185 m!513119))

(assert (=> b!533185 m!513119))

(declare-fun m!513137 () Bool)

(assert (=> b!533185 m!513137))

(push 1)

