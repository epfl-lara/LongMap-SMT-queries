; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48688 () Bool)

(assert start!48688)

(declare-fun b!535025 () Bool)

(declare-fun res!330234 () Bool)

(declare-fun e!310895 () Bool)

(assert (=> b!535025 (=> (not res!330234) (not e!310895))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33900 0))(
  ( (array!33901 (arr!16289 (Array (_ BitVec 32) (_ BitVec 64))) (size!16653 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33900)

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4747 0))(
  ( (MissingZero!4747 (index!21212 (_ BitVec 32))) (Found!4747 (index!21213 (_ BitVec 32))) (Intermediate!4747 (undefined!5559 Bool) (index!21214 (_ BitVec 32)) (x!50162 (_ BitVec 32))) (Undefined!4747) (MissingVacant!4747 (index!21215 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33900 (_ BitVec 32)) SeekEntryResult!4747)

(assert (=> b!535025 (= res!330234 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16289 a!3154) j!147) a!3154 mask!3216) (Intermediate!4747 false resIndex!32 resX!32)))))

(declare-fun b!535026 () Bool)

(declare-fun res!330235 () Bool)

(assert (=> b!535026 (=> (not res!330235) (not e!310895))))

(assert (=> b!535026 (= res!330235 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16653 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16653 a!3154)) (= (select (arr!16289 a!3154) resIndex!32) (select (arr!16289 a!3154) j!147))))))

(declare-fun res!330239 () Bool)

(declare-fun e!310894 () Bool)

(assert (=> start!48688 (=> (not res!330239) (not e!310894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48688 (= res!330239 (validMask!0 mask!3216))))

(assert (=> start!48688 e!310894))

(assert (=> start!48688 true))

(declare-fun array_inv!12085 (array!33900) Bool)

(assert (=> start!48688 (array_inv!12085 a!3154)))

(declare-fun b!535027 () Bool)

(declare-fun res!330238 () Bool)

(assert (=> b!535027 (=> (not res!330238) (not e!310894))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535027 (= res!330238 (and (= (size!16653 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16653 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16653 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535028 () Bool)

(declare-fun res!330233 () Bool)

(assert (=> b!535028 (=> (not res!330233) (not e!310894))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535028 (= res!330233 (validKeyInArray!0 (select (arr!16289 a!3154) j!147)))))

(declare-fun b!535029 () Bool)

(declare-fun res!330231 () Bool)

(assert (=> b!535029 (=> (not res!330231) (not e!310894))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33900 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535029 (= res!330231 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535030 () Bool)

(declare-fun res!330230 () Bool)

(assert (=> b!535030 (=> (not res!330230) (not e!310895))))

(declare-datatypes ((List!10408 0))(
  ( (Nil!10405) (Cons!10404 (h!11347 (_ BitVec 64)) (t!16636 List!10408)) )
))
(declare-fun arrayNoDuplicates!0 (array!33900 (_ BitVec 32) List!10408) Bool)

(assert (=> b!535030 (= res!330230 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10405))))

(declare-fun b!535031 () Bool)

(declare-fun res!330236 () Bool)

(assert (=> b!535031 (=> (not res!330236) (not e!310895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33900 (_ BitVec 32)) Bool)

(assert (=> b!535031 (= res!330236 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535032 () Bool)

(declare-fun res!330232 () Bool)

(assert (=> b!535032 (=> (not res!330232) (not e!310894))))

(assert (=> b!535032 (= res!330232 (validKeyInArray!0 k!1998))))

(declare-fun b!535033 () Bool)

(assert (=> b!535033 (= e!310895 false)))

(declare-fun lt!245748 () SeekEntryResult!4747)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535033 (= lt!245748 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16289 a!3154) j!147) mask!3216) (select (arr!16289 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535034 () Bool)

(assert (=> b!535034 (= e!310894 e!310895)))

(declare-fun res!330237 () Bool)

(assert (=> b!535034 (=> (not res!330237) (not e!310895))))

(declare-fun lt!245749 () SeekEntryResult!4747)

(assert (=> b!535034 (= res!330237 (or (= lt!245749 (MissingZero!4747 i!1153)) (= lt!245749 (MissingVacant!4747 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33900 (_ BitVec 32)) SeekEntryResult!4747)

(assert (=> b!535034 (= lt!245749 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!48688 res!330239) b!535027))

(assert (= (and b!535027 res!330238) b!535028))

(assert (= (and b!535028 res!330233) b!535032))

(assert (= (and b!535032 res!330232) b!535029))

(assert (= (and b!535029 res!330231) b!535034))

(assert (= (and b!535034 res!330237) b!535031))

(assert (= (and b!535031 res!330236) b!535030))

(assert (= (and b!535030 res!330230) b!535026))

(assert (= (and b!535026 res!330235) b!535025))

(assert (= (and b!535025 res!330234) b!535033))

(declare-fun m!514663 () Bool)

(assert (=> b!535030 m!514663))

(declare-fun m!514665 () Bool)

(assert (=> b!535028 m!514665))

(assert (=> b!535028 m!514665))

(declare-fun m!514667 () Bool)

(assert (=> b!535028 m!514667))

(declare-fun m!514669 () Bool)

(assert (=> start!48688 m!514669))

(declare-fun m!514671 () Bool)

(assert (=> start!48688 m!514671))

(assert (=> b!535033 m!514665))

(assert (=> b!535033 m!514665))

(declare-fun m!514673 () Bool)

(assert (=> b!535033 m!514673))

(assert (=> b!535033 m!514673))

(assert (=> b!535033 m!514665))

(declare-fun m!514675 () Bool)

(assert (=> b!535033 m!514675))

(declare-fun m!514677 () Bool)

(assert (=> b!535031 m!514677))

(declare-fun m!514679 () Bool)

(assert (=> b!535032 m!514679))

(declare-fun m!514681 () Bool)

(assert (=> b!535026 m!514681))

(assert (=> b!535026 m!514665))

(declare-fun m!514683 () Bool)

(assert (=> b!535034 m!514683))

(declare-fun m!514685 () Bool)

(assert (=> b!535029 m!514685))

(assert (=> b!535025 m!514665))

(assert (=> b!535025 m!514665))

(declare-fun m!514687 () Bool)

(assert (=> b!535025 m!514687))

(push 1)

(assert (not b!535030))

(assert (not start!48688))

(assert (not b!535034))

(assert (not b!535032))

(assert (not b!535031))

(assert (not b!535025))

(assert (not b!535029))

