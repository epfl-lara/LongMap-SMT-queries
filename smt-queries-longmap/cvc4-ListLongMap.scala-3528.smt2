; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48742 () Bool)

(assert start!48742)

(declare-fun b!535949 () Bool)

(declare-fun res!331158 () Bool)

(declare-fun e!311228 () Bool)

(assert (=> b!535949 (=> (not res!331158) (not e!311228))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33954 0))(
  ( (array!33955 (arr!16316 (Array (_ BitVec 32) (_ BitVec 64))) (size!16680 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33954)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535949 (= res!331158 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16680 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16680 a!3154)) (= (select (arr!16316 a!3154) resIndex!32) (select (arr!16316 a!3154) j!147))))))

(declare-fun b!535950 () Bool)

(declare-fun e!311229 () Bool)

(declare-fun e!311226 () Bool)

(assert (=> b!535950 (= e!311229 e!311226)))

(declare-fun res!331156 () Bool)

(assert (=> b!535950 (=> (not res!331156) (not e!311226))))

(declare-fun lt!245947 () (_ BitVec 32))

(assert (=> b!535950 (= res!331156 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245947 #b00000000000000000000000000000000) (bvslt lt!245947 (size!16680 a!3154))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535950 (= lt!245947 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!535951 () Bool)

(declare-fun res!331166 () Bool)

(assert (=> b!535951 (=> (not res!331166) (not e!311229))))

(assert (=> b!535951 (= res!331166 (and (not (= (select (arr!16316 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16316 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16316 a!3154) index!1177) (select (arr!16316 a!3154) j!147)))))))

(declare-fun b!535952 () Bool)

(declare-fun res!331155 () Bool)

(assert (=> b!535952 (=> (not res!331155) (not e!311229))))

(declare-datatypes ((SeekEntryResult!4774 0))(
  ( (MissingZero!4774 (index!21320 (_ BitVec 32))) (Found!4774 (index!21321 (_ BitVec 32))) (Intermediate!4774 (undefined!5586 Bool) (index!21322 (_ BitVec 32)) (x!50261 (_ BitVec 32))) (Undefined!4774) (MissingVacant!4774 (index!21323 (_ BitVec 32))) )
))
(declare-fun lt!245944 () SeekEntryResult!4774)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33954 (_ BitVec 32)) SeekEntryResult!4774)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535952 (= res!331155 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16316 a!3154) j!147) mask!3216) (select (arr!16316 a!3154) j!147) a!3154 mask!3216) lt!245944))))

(declare-fun b!535953 () Bool)

(declare-fun res!331160 () Bool)

(declare-fun e!311227 () Bool)

(assert (=> b!535953 (=> (not res!331160) (not e!311227))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535953 (= res!331160 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535954 () Bool)

(assert (=> b!535954 (= e!311227 e!311228)))

(declare-fun res!331159 () Bool)

(assert (=> b!535954 (=> (not res!331159) (not e!311228))))

(declare-fun lt!245946 () SeekEntryResult!4774)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535954 (= res!331159 (or (= lt!245946 (MissingZero!4774 i!1153)) (= lt!245946 (MissingVacant!4774 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33954 (_ BitVec 32)) SeekEntryResult!4774)

(assert (=> b!535954 (= lt!245946 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!535955 () Bool)

(declare-fun res!331165 () Bool)

(assert (=> b!535955 (=> (not res!331165) (not e!311227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535955 (= res!331165 (validKeyInArray!0 k!1998))))

(declare-fun b!535956 () Bool)

(declare-fun res!331164 () Bool)

(assert (=> b!535956 (=> (not res!331164) (not e!311228))))

(declare-datatypes ((List!10435 0))(
  ( (Nil!10432) (Cons!10431 (h!11374 (_ BitVec 64)) (t!16663 List!10435)) )
))
(declare-fun arrayNoDuplicates!0 (array!33954 (_ BitVec 32) List!10435) Bool)

(assert (=> b!535956 (= res!331164 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10432))))

(declare-fun b!535957 () Bool)

(declare-fun res!331162 () Bool)

(assert (=> b!535957 (=> (not res!331162) (not e!311227))))

(assert (=> b!535957 (= res!331162 (validKeyInArray!0 (select (arr!16316 a!3154) j!147)))))

(declare-fun b!535958 () Bool)

(declare-fun res!331163 () Bool)

(assert (=> b!535958 (=> (not res!331163) (not e!311227))))

(assert (=> b!535958 (= res!331163 (and (= (size!16680 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16680 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16680 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535959 () Bool)

(declare-fun res!331161 () Bool)

(assert (=> b!535959 (=> (not res!331161) (not e!311228))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33954 (_ BitVec 32)) Bool)

(assert (=> b!535959 (= res!331161 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!331157 () Bool)

(assert (=> start!48742 (=> (not res!331157) (not e!311227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48742 (= res!331157 (validMask!0 mask!3216))))

(assert (=> start!48742 e!311227))

(assert (=> start!48742 true))

(declare-fun array_inv!12112 (array!33954) Bool)

(assert (=> start!48742 (array_inv!12112 a!3154)))

(declare-fun b!535960 () Bool)

(assert (=> b!535960 (= e!311226 false)))

(declare-fun lt!245945 () SeekEntryResult!4774)

(assert (=> b!535960 (= lt!245945 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245947 (select (arr!16316 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535961 () Bool)

(assert (=> b!535961 (= e!311228 e!311229)))

(declare-fun res!331154 () Bool)

(assert (=> b!535961 (=> (not res!331154) (not e!311229))))

(assert (=> b!535961 (= res!331154 (= lt!245944 (Intermediate!4774 false resIndex!32 resX!32)))))

(assert (=> b!535961 (= lt!245944 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16316 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48742 res!331157) b!535958))

(assert (= (and b!535958 res!331163) b!535957))

(assert (= (and b!535957 res!331162) b!535955))

(assert (= (and b!535955 res!331165) b!535953))

(assert (= (and b!535953 res!331160) b!535954))

(assert (= (and b!535954 res!331159) b!535959))

(assert (= (and b!535959 res!331161) b!535956))

(assert (= (and b!535956 res!331164) b!535949))

(assert (= (and b!535949 res!331158) b!535961))

(assert (= (and b!535961 res!331154) b!535952))

(assert (= (and b!535952 res!331155) b!535951))

(assert (= (and b!535951 res!331166) b!535950))

(assert (= (and b!535950 res!331156) b!535960))

(declare-fun m!515449 () Bool)

(assert (=> b!535952 m!515449))

(assert (=> b!535952 m!515449))

(declare-fun m!515451 () Bool)

(assert (=> b!535952 m!515451))

(assert (=> b!535952 m!515451))

(assert (=> b!535952 m!515449))

(declare-fun m!515453 () Bool)

(assert (=> b!535952 m!515453))

(declare-fun m!515455 () Bool)

(assert (=> start!48742 m!515455))

(declare-fun m!515457 () Bool)

(assert (=> start!48742 m!515457))

(declare-fun m!515459 () Bool)

(assert (=> b!535956 m!515459))

(declare-fun m!515461 () Bool)

(assert (=> b!535951 m!515461))

(assert (=> b!535951 m!515449))

(assert (=> b!535961 m!515449))

(assert (=> b!535961 m!515449))

(declare-fun m!515463 () Bool)

(assert (=> b!535961 m!515463))

(declare-fun m!515465 () Bool)

(assert (=> b!535949 m!515465))

(assert (=> b!535949 m!515449))

(declare-fun m!515467 () Bool)

(assert (=> b!535954 m!515467))

(assert (=> b!535960 m!515449))

(assert (=> b!535960 m!515449))

(declare-fun m!515469 () Bool)

(assert (=> b!535960 m!515469))

(assert (=> b!535957 m!515449))

(assert (=> b!535957 m!515449))

(declare-fun m!515471 () Bool)

(assert (=> b!535957 m!515471))

(declare-fun m!515473 () Bool)

(assert (=> b!535950 m!515473))

(declare-fun m!515475 () Bool)

(assert (=> b!535955 m!515475))

(declare-fun m!515477 () Bool)

(assert (=> b!535953 m!515477))

(declare-fun m!515479 () Bool)

(assert (=> b!535959 m!515479))

(push 1)

(assert (not b!535954))

(assert (not b!535953))

(assert (not b!535960))

(assert (not b!535952))

(assert (not start!48742))

(assert (not b!535950))

(assert (not b!535956))

(assert (not b!535959))

