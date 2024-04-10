; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48618 () Bool)

(assert start!48618)

(declare-fun b!533966 () Bool)

(declare-fun e!310571 () Bool)

(assert (=> b!533966 (= e!310571 false)))

(declare-datatypes ((SeekEntryResult!4712 0))(
  ( (MissingZero!4712 (index!21072 (_ BitVec 32))) (Found!4712 (index!21073 (_ BitVec 32))) (Intermediate!4712 (undefined!5524 Bool) (index!21074 (_ BitVec 32)) (x!50039 (_ BitVec 32))) (Undefined!4712) (MissingVacant!4712 (index!21075 (_ BitVec 32))) )
))
(declare-fun lt!245538 () SeekEntryResult!4712)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33830 0))(
  ( (array!33831 (arr!16254 (Array (_ BitVec 32) (_ BitVec 64))) (size!16618 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33830)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33830 (_ BitVec 32)) SeekEntryResult!4712)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533966 (= lt!245538 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16254 a!3154) j!147) mask!3216) (select (arr!16254 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533967 () Bool)

(declare-fun res!329178 () Bool)

(declare-fun e!310570 () Bool)

(assert (=> b!533967 (=> (not res!329178) (not e!310570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533967 (= res!329178 (validKeyInArray!0 (select (arr!16254 a!3154) j!147)))))

(declare-fun b!533968 () Bool)

(declare-fun res!329172 () Bool)

(assert (=> b!533968 (=> (not res!329172) (not e!310570))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!533968 (= res!329172 (validKeyInArray!0 k!1998))))

(declare-fun b!533969 () Bool)

(declare-fun res!329175 () Bool)

(assert (=> b!533969 (=> (not res!329175) (not e!310571))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!533969 (= res!329175 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16618 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16618 a!3154)) (= (select (arr!16254 a!3154) resIndex!32) (select (arr!16254 a!3154) j!147))))))

(declare-fun b!533970 () Bool)

(declare-fun res!329179 () Bool)

(assert (=> b!533970 (=> (not res!329179) (not e!310571))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33830 (_ BitVec 32)) Bool)

(assert (=> b!533970 (= res!329179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533971 () Bool)

(declare-fun res!329180 () Bool)

(assert (=> b!533971 (=> (not res!329180) (not e!310570))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533971 (= res!329180 (and (= (size!16618 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16618 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16618 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!329176 () Bool)

(assert (=> start!48618 (=> (not res!329176) (not e!310570))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48618 (= res!329176 (validMask!0 mask!3216))))

(assert (=> start!48618 e!310570))

(assert (=> start!48618 true))

(declare-fun array_inv!12050 (array!33830) Bool)

(assert (=> start!48618 (array_inv!12050 a!3154)))

(declare-fun b!533972 () Bool)

(assert (=> b!533972 (= e!310570 e!310571)))

(declare-fun res!329171 () Bool)

(assert (=> b!533972 (=> (not res!329171) (not e!310571))))

(declare-fun lt!245539 () SeekEntryResult!4712)

(assert (=> b!533972 (= res!329171 (or (= lt!245539 (MissingZero!4712 i!1153)) (= lt!245539 (MissingVacant!4712 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33830 (_ BitVec 32)) SeekEntryResult!4712)

(assert (=> b!533972 (= lt!245539 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!533973 () Bool)

(declare-fun res!329174 () Bool)

(assert (=> b!533973 (=> (not res!329174) (not e!310570))))

(declare-fun arrayContainsKey!0 (array!33830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533973 (= res!329174 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533974 () Bool)

(declare-fun res!329177 () Bool)

(assert (=> b!533974 (=> (not res!329177) (not e!310571))))

(declare-datatypes ((List!10373 0))(
  ( (Nil!10370) (Cons!10369 (h!11312 (_ BitVec 64)) (t!16601 List!10373)) )
))
(declare-fun arrayNoDuplicates!0 (array!33830 (_ BitVec 32) List!10373) Bool)

(assert (=> b!533974 (= res!329177 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10370))))

(declare-fun b!533975 () Bool)

(declare-fun res!329173 () Bool)

(assert (=> b!533975 (=> (not res!329173) (not e!310571))))

(assert (=> b!533975 (= res!329173 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16254 a!3154) j!147) a!3154 mask!3216) (Intermediate!4712 false resIndex!32 resX!32)))))

(assert (= (and start!48618 res!329176) b!533971))

(assert (= (and b!533971 res!329180) b!533967))

(assert (= (and b!533967 res!329178) b!533968))

(assert (= (and b!533968 res!329172) b!533973))

(assert (= (and b!533973 res!329174) b!533972))

(assert (= (and b!533972 res!329171) b!533970))

(assert (= (and b!533970 res!329179) b!533974))

(assert (= (and b!533974 res!329177) b!533969))

(assert (= (and b!533969 res!329175) b!533975))

(assert (= (and b!533975 res!329173) b!533966))

(declare-fun m!513747 () Bool)

(assert (=> b!533975 m!513747))

(assert (=> b!533975 m!513747))

(declare-fun m!513749 () Bool)

(assert (=> b!533975 m!513749))

(declare-fun m!513751 () Bool)

(assert (=> start!48618 m!513751))

(declare-fun m!513753 () Bool)

(assert (=> start!48618 m!513753))

(assert (=> b!533966 m!513747))

(assert (=> b!533966 m!513747))

(declare-fun m!513755 () Bool)

(assert (=> b!533966 m!513755))

(assert (=> b!533966 m!513755))

(assert (=> b!533966 m!513747))

(declare-fun m!513757 () Bool)

(assert (=> b!533966 m!513757))

(declare-fun m!513759 () Bool)

(assert (=> b!533969 m!513759))

(assert (=> b!533969 m!513747))

(declare-fun m!513761 () Bool)

(assert (=> b!533974 m!513761))

(declare-fun m!513763 () Bool)

(assert (=> b!533972 m!513763))

(declare-fun m!513765 () Bool)

(assert (=> b!533968 m!513765))

(declare-fun m!513767 () Bool)

(assert (=> b!533973 m!513767))

(assert (=> b!533967 m!513747))

(assert (=> b!533967 m!513747))

(declare-fun m!513769 () Bool)

(assert (=> b!533967 m!513769))

(declare-fun m!513771 () Bool)

(assert (=> b!533970 m!513771))

(push 1)

