; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118562 () Bool)

(assert start!118562)

(declare-fun b!1386057 () Bool)

(declare-fun res!927313 () Bool)

(declare-fun e!785251 () Bool)

(assert (=> b!1386057 (=> (not res!927313) (not e!785251))))

(declare-datatypes ((array!94838 0))(
  ( (array!94839 (arr!45795 (Array (_ BitVec 32) (_ BitVec 64))) (size!46345 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94838)

(declare-datatypes ((List!32323 0))(
  ( (Nil!32320) (Cons!32319 (h!33528 (_ BitVec 64)) (t!47017 List!32323)) )
))
(declare-fun arrayNoDuplicates!0 (array!94838 (_ BitVec 32) List!32323) Bool)

(assert (=> b!1386057 (= res!927313 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32320))))

(declare-fun b!1386058 () Bool)

(declare-fun res!927308 () Bool)

(assert (=> b!1386058 (=> (not res!927308) (not e!785251))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94838 (_ BitVec 32)) Bool)

(assert (=> b!1386058 (= res!927308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386059 () Bool)

(declare-fun res!927310 () Bool)

(assert (=> b!1386059 (=> (not res!927310) (not e!785251))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386059 (= res!927310 (and (= (size!46345 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46345 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46345 a!2938))))))

(declare-fun b!1386060 () Bool)

(declare-fun res!927312 () Bool)

(assert (=> b!1386060 (=> (not res!927312) (not e!785251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386060 (= res!927312 (validKeyInArray!0 (select (arr!45795 a!2938) startIndex!16)))))

(declare-fun b!1386061 () Bool)

(declare-fun res!927309 () Bool)

(assert (=> b!1386061 (=> (not res!927309) (not e!785251))))

(assert (=> b!1386061 (= res!927309 (and (not (= (select (arr!45795 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45795 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun res!927311 () Bool)

(assert (=> start!118562 (=> (not res!927311) (not e!785251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118562 (= res!927311 (validMask!0 mask!2987))))

(assert (=> start!118562 e!785251))

(assert (=> start!118562 true))

(declare-fun array_inv!34823 (array!94838) Bool)

(assert (=> start!118562 (array_inv!34823 a!2938)))

(declare-fun b!1386062 () Bool)

(declare-fun res!927307 () Bool)

(assert (=> b!1386062 (=> (not res!927307) (not e!785251))))

(assert (=> b!1386062 (= res!927307 (validKeyInArray!0 (select (arr!45795 a!2938) i!1065)))))

(declare-fun b!1386063 () Bool)

(assert (=> b!1386063 (= e!785251 (not (bvsle #b00000000000000000000000000000000 (size!46345 a!2938))))))

(declare-datatypes ((SeekEntryResult!10138 0))(
  ( (MissingZero!10138 (index!42923 (_ BitVec 32))) (Found!10138 (index!42924 (_ BitVec 32))) (Intermediate!10138 (undefined!10950 Bool) (index!42925 (_ BitVec 32)) (x!124547 (_ BitVec 32))) (Undefined!10138) (MissingVacant!10138 (index!42926 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94838 (_ BitVec 32)) SeekEntryResult!10138)

(assert (=> b!1386063 (= (seekEntryOrOpen!0 (select (arr!45795 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45795 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94839 (store (arr!45795 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46345 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46264 0))(
  ( (Unit!46265) )
))
(declare-fun lt!609366 () Unit!46264)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46264)

(assert (=> b!1386063 (= lt!609366 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(assert (= (and start!118562 res!927311) b!1386059))

(assert (= (and b!1386059 res!927310) b!1386062))

(assert (= (and b!1386062 res!927307) b!1386057))

(assert (= (and b!1386057 res!927313) b!1386058))

(assert (= (and b!1386058 res!927308) b!1386061))

(assert (= (and b!1386061 res!927309) b!1386060))

(assert (= (and b!1386060 res!927312) b!1386063))

(declare-fun m!1271363 () Bool)

(assert (=> b!1386057 m!1271363))

(declare-fun m!1271365 () Bool)

(assert (=> b!1386061 m!1271365))

(declare-fun m!1271367 () Bool)

(assert (=> b!1386060 m!1271367))

(assert (=> b!1386060 m!1271367))

(declare-fun m!1271369 () Bool)

(assert (=> b!1386060 m!1271369))

(assert (=> b!1386062 m!1271365))

(assert (=> b!1386062 m!1271365))

(declare-fun m!1271371 () Bool)

(assert (=> b!1386062 m!1271371))

(declare-fun m!1271373 () Bool)

(assert (=> start!118562 m!1271373))

(declare-fun m!1271375 () Bool)

(assert (=> start!118562 m!1271375))

(declare-fun m!1271377 () Bool)

(assert (=> b!1386058 m!1271377))

(declare-fun m!1271379 () Bool)

(assert (=> b!1386063 m!1271379))

(assert (=> b!1386063 m!1271379))

(declare-fun m!1271381 () Bool)

(assert (=> b!1386063 m!1271381))

(declare-fun m!1271383 () Bool)

(assert (=> b!1386063 m!1271383))

(declare-fun m!1271385 () Bool)

(assert (=> b!1386063 m!1271385))

(assert (=> b!1386063 m!1271367))

(assert (=> b!1386063 m!1271367))

(declare-fun m!1271387 () Bool)

(assert (=> b!1386063 m!1271387))

(check-sat (not start!118562) (not b!1386060) (not b!1386057) (not b!1386058) (not b!1386063) (not b!1386062))
(check-sat)
