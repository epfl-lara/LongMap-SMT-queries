; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48736 () Bool)

(assert start!48736)

(declare-fun b!535833 () Bool)

(declare-fun e!311181 () Bool)

(assert (=> b!535833 (= e!311181 false)))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4771 0))(
  ( (MissingZero!4771 (index!21308 (_ BitVec 32))) (Found!4771 (index!21309 (_ BitVec 32))) (Intermediate!4771 (undefined!5583 Bool) (index!21310 (_ BitVec 32)) (x!50250 (_ BitVec 32))) (Undefined!4771) (MissingVacant!4771 (index!21311 (_ BitVec 32))) )
))
(declare-fun lt!245908 () SeekEntryResult!4771)

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33948 0))(
  ( (array!33949 (arr!16313 (Array (_ BitVec 32) (_ BitVec 64))) (size!16677 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33948)

(declare-fun lt!245911 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33948 (_ BitVec 32)) SeekEntryResult!4771)

(assert (=> b!535833 (= lt!245908 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245911 (select (arr!16313 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535834 () Bool)

(declare-fun res!331044 () Bool)

(declare-fun e!311180 () Bool)

(assert (=> b!535834 (=> (not res!331044) (not e!311180))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535834 (= res!331044 (and (= (size!16677 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16677 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16677 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535835 () Bool)

(declare-fun res!331046 () Bool)

(assert (=> b!535835 (=> (not res!331046) (not e!311180))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535835 (= res!331046 (validKeyInArray!0 (select (arr!16313 a!3154) j!147)))))

(declare-fun b!535836 () Bool)

(declare-fun e!311183 () Bool)

(assert (=> b!535836 (= e!311183 e!311181)))

(declare-fun res!331039 () Bool)

(assert (=> b!535836 (=> (not res!331039) (not e!311181))))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535836 (= res!331039 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245911 #b00000000000000000000000000000000) (bvslt lt!245911 (size!16677 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535836 (= lt!245911 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!535837 () Bool)

(declare-fun res!331041 () Bool)

(assert (=> b!535837 (=> (not res!331041) (not e!311183))))

(declare-fun lt!245910 () SeekEntryResult!4771)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535837 (= res!331041 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16313 a!3154) j!147) mask!3216) (select (arr!16313 a!3154) j!147) a!3154 mask!3216) lt!245910))))

(declare-fun b!535838 () Bool)

(declare-fun res!331038 () Bool)

(declare-fun e!311182 () Bool)

(assert (=> b!535838 (=> (not res!331038) (not e!311182))))

(declare-datatypes ((List!10432 0))(
  ( (Nil!10429) (Cons!10428 (h!11371 (_ BitVec 64)) (t!16660 List!10432)) )
))
(declare-fun arrayNoDuplicates!0 (array!33948 (_ BitVec 32) List!10432) Bool)

(assert (=> b!535838 (= res!331038 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10429))))

(declare-fun b!535839 () Bool)

(assert (=> b!535839 (= e!311180 e!311182)))

(declare-fun res!331043 () Bool)

(assert (=> b!535839 (=> (not res!331043) (not e!311182))))

(declare-fun lt!245909 () SeekEntryResult!4771)

(assert (=> b!535839 (= res!331043 (or (= lt!245909 (MissingZero!4771 i!1153)) (= lt!245909 (MissingVacant!4771 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33948 (_ BitVec 32)) SeekEntryResult!4771)

(assert (=> b!535839 (= lt!245909 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!535840 () Bool)

(assert (=> b!535840 (= e!311182 e!311183)))

(declare-fun res!331040 () Bool)

(assert (=> b!535840 (=> (not res!331040) (not e!311183))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!535840 (= res!331040 (= lt!245910 (Intermediate!4771 false resIndex!32 resX!32)))))

(assert (=> b!535840 (= lt!245910 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16313 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535841 () Bool)

(declare-fun res!331042 () Bool)

(assert (=> b!535841 (=> (not res!331042) (not e!311180))))

(assert (=> b!535841 (= res!331042 (validKeyInArray!0 k!1998))))

(declare-fun b!535842 () Bool)

(declare-fun res!331037 () Bool)

(assert (=> b!535842 (=> (not res!331037) (not e!311182))))

(assert (=> b!535842 (= res!331037 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16677 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16677 a!3154)) (= (select (arr!16313 a!3154) resIndex!32) (select (arr!16313 a!3154) j!147))))))

(declare-fun res!331049 () Bool)

(assert (=> start!48736 (=> (not res!331049) (not e!311180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48736 (= res!331049 (validMask!0 mask!3216))))

(assert (=> start!48736 e!311180))

(assert (=> start!48736 true))

(declare-fun array_inv!12109 (array!33948) Bool)

(assert (=> start!48736 (array_inv!12109 a!3154)))

(declare-fun b!535832 () Bool)

(declare-fun res!331047 () Bool)

(assert (=> b!535832 (=> (not res!331047) (not e!311183))))

(assert (=> b!535832 (= res!331047 (and (not (= (select (arr!16313 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16313 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16313 a!3154) index!1177) (select (arr!16313 a!3154) j!147)))))))

(declare-fun b!535843 () Bool)

(declare-fun res!331045 () Bool)

(assert (=> b!535843 (=> (not res!331045) (not e!311182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33948 (_ BitVec 32)) Bool)

(assert (=> b!535843 (= res!331045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535844 () Bool)

(declare-fun res!331048 () Bool)

(assert (=> b!535844 (=> (not res!331048) (not e!311180))))

(declare-fun arrayContainsKey!0 (array!33948 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535844 (= res!331048 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48736 res!331049) b!535834))

(assert (= (and b!535834 res!331044) b!535835))

(assert (= (and b!535835 res!331046) b!535841))

(assert (= (and b!535841 res!331042) b!535844))

(assert (= (and b!535844 res!331048) b!535839))

(assert (= (and b!535839 res!331043) b!535843))

(assert (= (and b!535843 res!331045) b!535838))

(assert (= (and b!535838 res!331038) b!535842))

(assert (= (and b!535842 res!331037) b!535840))

(assert (= (and b!535840 res!331040) b!535837))

(assert (= (and b!535837 res!331041) b!535832))

(assert (= (and b!535832 res!331047) b!535836))

(assert (= (and b!535836 res!331039) b!535833))

(declare-fun m!515353 () Bool)

(assert (=> b!535835 m!515353))

(assert (=> b!535835 m!515353))

(declare-fun m!515355 () Bool)

(assert (=> b!535835 m!515355))

(declare-fun m!515357 () Bool)

(assert (=> b!535841 m!515357))

(declare-fun m!515359 () Bool)

(assert (=> b!535838 m!515359))

(declare-fun m!515361 () Bool)

(assert (=> b!535842 m!515361))

(assert (=> b!535842 m!515353))

(declare-fun m!515363 () Bool)

(assert (=> b!535843 m!515363))

(assert (=> b!535833 m!515353))

(assert (=> b!535833 m!515353))

(declare-fun m!515365 () Bool)

(assert (=> b!535833 m!515365))

(declare-fun m!515367 () Bool)

(assert (=> b!535832 m!515367))

(assert (=> b!535832 m!515353))

(declare-fun m!515369 () Bool)

(assert (=> b!535844 m!515369))

(declare-fun m!515371 () Bool)

(assert (=> b!535836 m!515371))

(declare-fun m!515373 () Bool)

(assert (=> start!48736 m!515373))

(declare-fun m!515375 () Bool)

(assert (=> start!48736 m!515375))

(assert (=> b!535837 m!515353))

(assert (=> b!535837 m!515353))

(declare-fun m!515377 () Bool)

(assert (=> b!535837 m!515377))

(assert (=> b!535837 m!515377))

(assert (=> b!535837 m!515353))

(declare-fun m!515379 () Bool)

(assert (=> b!535837 m!515379))

(declare-fun m!515381 () Bool)

(assert (=> b!535839 m!515381))

(assert (=> b!535840 m!515353))

(assert (=> b!535840 m!515353))

(declare-fun m!515383 () Bool)

(assert (=> b!535840 m!515383))

(push 1)

(assert (not b!535841))

(assert (not b!535840))

(assert (not b!535839))

(assert (not b!535844))

(assert (not b!535838))

(assert (not b!535836))

(assert (not b!535833))

(assert (not b!535835))

(assert (not b!535837))

