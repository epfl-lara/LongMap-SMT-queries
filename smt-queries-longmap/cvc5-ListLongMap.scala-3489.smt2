; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48402 () Bool)

(assert start!48402)

(declare-fun b!531856 () Bool)

(declare-fun res!327347 () Bool)

(declare-fun e!309752 () Bool)

(assert (=> b!531856 (=> (not res!327347) (not e!309752))))

(declare-datatypes ((array!33710 0))(
  ( (array!33711 (arr!16197 (Array (_ BitVec 32) (_ BitVec 64))) (size!16561 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33710)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33710 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531856 (= res!327347 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531857 () Bool)

(declare-fun e!309751 () Bool)

(assert (=> b!531857 (= e!309752 e!309751)))

(declare-fun res!327351 () Bool)

(assert (=> b!531857 (=> (not res!327351) (not e!309751))))

(declare-datatypes ((SeekEntryResult!4655 0))(
  ( (MissingZero!4655 (index!20844 (_ BitVec 32))) (Found!4655 (index!20845 (_ BitVec 32))) (Intermediate!4655 (undefined!5467 Bool) (index!20846 (_ BitVec 32)) (x!49821 (_ BitVec 32))) (Undefined!4655) (MissingVacant!4655 (index!20847 (_ BitVec 32))) )
))
(declare-fun lt!245086 () SeekEntryResult!4655)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531857 (= res!327351 (or (= lt!245086 (MissingZero!4655 i!1153)) (= lt!245086 (MissingVacant!4655 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33710 (_ BitVec 32)) SeekEntryResult!4655)

(assert (=> b!531857 (= lt!245086 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!531858 () Bool)

(declare-fun res!327350 () Bool)

(assert (=> b!531858 (=> (not res!327350) (not e!309752))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531858 (= res!327350 (validKeyInArray!0 k!1998))))

(declare-fun b!531859 () Bool)

(declare-fun res!327346 () Bool)

(assert (=> b!531859 (=> (not res!327346) (not e!309751))))

(declare-datatypes ((List!10316 0))(
  ( (Nil!10313) (Cons!10312 (h!11252 (_ BitVec 64)) (t!16544 List!10316)) )
))
(declare-fun arrayNoDuplicates!0 (array!33710 (_ BitVec 32) List!10316) Bool)

(assert (=> b!531859 (= res!327346 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10313))))

(declare-fun b!531860 () Bool)

(declare-fun res!327352 () Bool)

(assert (=> b!531860 (=> (not res!327352) (not e!309751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33710 (_ BitVec 32)) Bool)

(assert (=> b!531860 (= res!327352 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531861 () Bool)

(declare-fun res!327348 () Bool)

(assert (=> b!531861 (=> (not res!327348) (not e!309752))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!531861 (= res!327348 (and (= (size!16561 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16561 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16561 a!3154)) (not (= i!1153 j!147))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun b!531862 () Bool)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!531862 (= e!309751 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16561 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16561 a!3154)) (= (select (arr!16197 a!3154) resIndex!32) (select (arr!16197 a!3154) j!147)) (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(declare-fun b!531863 () Bool)

(declare-fun res!327349 () Bool)

(assert (=> b!531863 (=> (not res!327349) (not e!309752))))

(assert (=> b!531863 (= res!327349 (validKeyInArray!0 (select (arr!16197 a!3154) j!147)))))

(declare-fun res!327353 () Bool)

(assert (=> start!48402 (=> (not res!327353) (not e!309752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48402 (= res!327353 (validMask!0 mask!3216))))

(assert (=> start!48402 e!309752))

(assert (=> start!48402 true))

(declare-fun array_inv!11993 (array!33710) Bool)

(assert (=> start!48402 (array_inv!11993 a!3154)))

(assert (= (and start!48402 res!327353) b!531861))

(assert (= (and b!531861 res!327348) b!531863))

(assert (= (and b!531863 res!327349) b!531858))

(assert (= (and b!531858 res!327350) b!531856))

(assert (= (and b!531856 res!327347) b!531857))

(assert (= (and b!531857 res!327351) b!531860))

(assert (= (and b!531860 res!327352) b!531859))

(assert (= (and b!531859 res!327346) b!531862))

(declare-fun m!512199 () Bool)

(assert (=> start!48402 m!512199))

(declare-fun m!512201 () Bool)

(assert (=> start!48402 m!512201))

(declare-fun m!512203 () Bool)

(assert (=> b!531859 m!512203))

(declare-fun m!512205 () Bool)

(assert (=> b!531856 m!512205))

(declare-fun m!512207 () Bool)

(assert (=> b!531863 m!512207))

(assert (=> b!531863 m!512207))

(declare-fun m!512209 () Bool)

(assert (=> b!531863 m!512209))

(declare-fun m!512211 () Bool)

(assert (=> b!531857 m!512211))

(declare-fun m!512213 () Bool)

(assert (=> b!531862 m!512213))

(assert (=> b!531862 m!512207))

(declare-fun m!512215 () Bool)

(assert (=> b!531860 m!512215))

(declare-fun m!512217 () Bool)

(assert (=> b!531858 m!512217))

(push 1)

(assert (not b!531858))

(assert (not b!531859))

(assert (not b!531856))

(assert (not b!531860))

(assert (not start!48402))

(assert (not b!531857))

(assert (not b!531863))

