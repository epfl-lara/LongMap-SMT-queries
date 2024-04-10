; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49188 () Bool)

(assert start!49188)

(declare-fun b!541616 () Bool)

(declare-fun e!313614 () Bool)

(declare-fun e!313612 () Bool)

(assert (=> b!541616 (= e!313614 e!313612)))

(declare-fun res!336345 () Bool)

(assert (=> b!541616 (=> (not res!336345) (not e!313612))))

(declare-datatypes ((SeekEntryResult!4916 0))(
  ( (MissingZero!4916 (index!21888 (_ BitVec 32))) (Found!4916 (index!21889 (_ BitVec 32))) (Intermediate!4916 (undefined!5728 Bool) (index!21890 (_ BitVec 32)) (x!50805 (_ BitVec 32))) (Undefined!4916) (MissingVacant!4916 (index!21891 (_ BitVec 32))) )
))
(declare-fun lt!247698 () SeekEntryResult!4916)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541616 (= res!336345 (or (= lt!247698 (MissingZero!4916 i!1153)) (= lt!247698 (MissingVacant!4916 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!34247 0))(
  ( (array!34248 (arr!16458 (Array (_ BitVec 32) (_ BitVec 64))) (size!16822 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34247)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34247 (_ BitVec 32)) SeekEntryResult!4916)

(assert (=> b!541616 (= lt!247698 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!541617 () Bool)

(assert (=> b!541617 (= e!313612 false)))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun lt!247699 () SeekEntryResult!4916)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34247 (_ BitVec 32)) SeekEntryResult!4916)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541617 (= lt!247699 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16458 a!3154) j!147) mask!3216) (select (arr!16458 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541618 () Bool)

(declare-fun res!336353 () Bool)

(assert (=> b!541618 (=> (not res!336353) (not e!313614))))

(declare-fun arrayContainsKey!0 (array!34247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541618 (= res!336353 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!336350 () Bool)

(assert (=> start!49188 (=> (not res!336350) (not e!313614))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49188 (= res!336350 (validMask!0 mask!3216))))

(assert (=> start!49188 e!313614))

(assert (=> start!49188 true))

(declare-fun array_inv!12254 (array!34247) Bool)

(assert (=> start!49188 (array_inv!12254 a!3154)))

(declare-fun b!541619 () Bool)

(declare-fun res!336351 () Bool)

(assert (=> b!541619 (=> (not res!336351) (not e!313614))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541619 (= res!336351 (validKeyInArray!0 k!1998))))

(declare-fun b!541620 () Bool)

(declare-fun res!336348 () Bool)

(assert (=> b!541620 (=> (not res!336348) (not e!313612))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34247 (_ BitVec 32)) Bool)

(assert (=> b!541620 (= res!336348 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541621 () Bool)

(declare-fun res!336347 () Bool)

(assert (=> b!541621 (=> (not res!336347) (not e!313612))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!541621 (= res!336347 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16458 a!3154) j!147) a!3154 mask!3216) (Intermediate!4916 false resIndex!32 resX!32)))))

(declare-fun b!541622 () Bool)

(declare-fun res!336344 () Bool)

(assert (=> b!541622 (=> (not res!336344) (not e!313614))))

(assert (=> b!541622 (= res!336344 (and (= (size!16822 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16822 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16822 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541623 () Bool)

(declare-fun res!336346 () Bool)

(assert (=> b!541623 (=> (not res!336346) (not e!313614))))

(assert (=> b!541623 (= res!336346 (validKeyInArray!0 (select (arr!16458 a!3154) j!147)))))

(declare-fun b!541624 () Bool)

(declare-fun res!336349 () Bool)

(assert (=> b!541624 (=> (not res!336349) (not e!313612))))

(declare-datatypes ((List!10577 0))(
  ( (Nil!10574) (Cons!10573 (h!11525 (_ BitVec 64)) (t!16805 List!10577)) )
))
(declare-fun arrayNoDuplicates!0 (array!34247 (_ BitVec 32) List!10577) Bool)

(assert (=> b!541624 (= res!336349 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10574))))

(declare-fun b!541625 () Bool)

(declare-fun res!336352 () Bool)

(assert (=> b!541625 (=> (not res!336352) (not e!313612))))

(assert (=> b!541625 (= res!336352 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16822 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16822 a!3154)) (= (select (arr!16458 a!3154) resIndex!32) (select (arr!16458 a!3154) j!147))))))

(assert (= (and start!49188 res!336350) b!541622))

(assert (= (and b!541622 res!336344) b!541623))

(assert (= (and b!541623 res!336346) b!541619))

(assert (= (and b!541619 res!336351) b!541618))

(assert (= (and b!541618 res!336353) b!541616))

(assert (= (and b!541616 res!336345) b!541620))

(assert (= (and b!541620 res!336348) b!541624))

(assert (= (and b!541624 res!336349) b!541625))

(assert (= (and b!541625 res!336352) b!541621))

(assert (= (and b!541621 res!336347) b!541617))

(declare-fun m!520077 () Bool)

(assert (=> b!541623 m!520077))

(assert (=> b!541623 m!520077))

(declare-fun m!520079 () Bool)

(assert (=> b!541623 m!520079))

(declare-fun m!520081 () Bool)

(assert (=> b!541620 m!520081))

(declare-fun m!520083 () Bool)

(assert (=> start!49188 m!520083))

(declare-fun m!520085 () Bool)

(assert (=> start!49188 m!520085))

(declare-fun m!520087 () Bool)

(assert (=> b!541619 m!520087))

(declare-fun m!520089 () Bool)

(assert (=> b!541625 m!520089))

(assert (=> b!541625 m!520077))

(declare-fun m!520091 () Bool)

(assert (=> b!541624 m!520091))

(assert (=> b!541617 m!520077))

(assert (=> b!541617 m!520077))

(declare-fun m!520093 () Bool)

(assert (=> b!541617 m!520093))

(assert (=> b!541617 m!520093))

(assert (=> b!541617 m!520077))

(declare-fun m!520095 () Bool)

(assert (=> b!541617 m!520095))

(declare-fun m!520097 () Bool)

(assert (=> b!541616 m!520097))

(assert (=> b!541621 m!520077))

(assert (=> b!541621 m!520077))

(declare-fun m!520099 () Bool)

(assert (=> b!541621 m!520099))

(declare-fun m!520101 () Bool)

(assert (=> b!541618 m!520101))

(push 1)

