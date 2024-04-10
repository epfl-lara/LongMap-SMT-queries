; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46060 () Bool)

(assert start!46060)

(declare-fun b!510108 () Bool)

(declare-fun res!310958 () Bool)

(declare-fun e!298219 () Bool)

(assert (=> b!510108 (=> (not res!310958) (not e!298219))))

(declare-datatypes ((array!32771 0))(
  ( (array!32772 (arr!15764 (Array (_ BitVec 32) (_ BitVec 64))) (size!16128 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32771)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510108 (= res!310958 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!310955 () Bool)

(assert (=> start!46060 (=> (not res!310955) (not e!298219))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46060 (= res!310955 (validMask!0 mask!3524))))

(assert (=> start!46060 e!298219))

(assert (=> start!46060 true))

(declare-fun array_inv!11560 (array!32771) Bool)

(assert (=> start!46060 (array_inv!11560 a!3235)))

(declare-fun b!510109 () Bool)

(declare-fun e!298221 () Bool)

(assert (=> b!510109 (= e!298219 e!298221)))

(declare-fun res!310956 () Bool)

(assert (=> b!510109 (=> (not res!310956) (not e!298221))))

(declare-datatypes ((SeekEntryResult!4231 0))(
  ( (MissingZero!4231 (index!19112 (_ BitVec 32))) (Found!4231 (index!19113 (_ BitVec 32))) (Intermediate!4231 (undefined!5043 Bool) (index!19114 (_ BitVec 32)) (x!48072 (_ BitVec 32))) (Undefined!4231) (MissingVacant!4231 (index!19115 (_ BitVec 32))) )
))
(declare-fun lt!233167 () SeekEntryResult!4231)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510109 (= res!310956 (or (= lt!233167 (MissingZero!4231 i!1204)) (= lt!233167 (MissingVacant!4231 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32771 (_ BitVec 32)) SeekEntryResult!4231)

(assert (=> b!510109 (= lt!233167 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!510110 () Bool)

(declare-fun res!310959 () Bool)

(assert (=> b!510110 (=> (not res!310959) (not e!298221))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32771 (_ BitVec 32)) Bool)

(assert (=> b!510110 (= res!310959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510111 () Bool)

(declare-fun res!310953 () Bool)

(assert (=> b!510111 (=> (not res!310953) (not e!298221))))

(declare-datatypes ((List!9922 0))(
  ( (Nil!9919) (Cons!9918 (h!10795 (_ BitVec 64)) (t!16150 List!9922)) )
))
(declare-fun arrayNoDuplicates!0 (array!32771 (_ BitVec 32) List!9922) Bool)

(assert (=> b!510111 (= res!310953 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9919))))

(declare-fun b!510112 () Bool)

(declare-fun res!310960 () Bool)

(assert (=> b!510112 (=> (not res!310960) (not e!298219))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510112 (= res!310960 (validKeyInArray!0 (select (arr!15764 a!3235) j!176)))))

(declare-fun e!298218 () Bool)

(declare-fun b!510113 () Bool)

(assert (=> b!510113 (= e!298218 (= (seekEntryOrOpen!0 (select (arr!15764 a!3235) j!176) a!3235 mask!3524) (Found!4231 j!176)))))

(declare-fun b!510114 () Bool)

(assert (=> b!510114 (= e!298221 (not true))))

(declare-fun lt!233165 () SeekEntryResult!4231)

(declare-fun lt!233162 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32771 (_ BitVec 32)) SeekEntryResult!4231)

(assert (=> b!510114 (= lt!233165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233162 (select (store (arr!15764 a!3235) i!1204 k!2280) j!176) (array!32772 (store (arr!15764 a!3235) i!1204 k!2280) (size!16128 a!3235)) mask!3524))))

(declare-fun lt!233163 () SeekEntryResult!4231)

(declare-fun lt!233164 () (_ BitVec 32))

(assert (=> b!510114 (= lt!233163 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233164 (select (arr!15764 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510114 (= lt!233162 (toIndex!0 (select (store (arr!15764 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!510114 (= lt!233164 (toIndex!0 (select (arr!15764 a!3235) j!176) mask!3524))))

(assert (=> b!510114 e!298218))

(declare-fun res!310957 () Bool)

(assert (=> b!510114 (=> (not res!310957) (not e!298218))))

(assert (=> b!510114 (= res!310957 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15720 0))(
  ( (Unit!15721) )
))
(declare-fun lt!233166 () Unit!15720)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32771 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15720)

(assert (=> b!510114 (= lt!233166 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510115 () Bool)

(declare-fun res!310961 () Bool)

(assert (=> b!510115 (=> (not res!310961) (not e!298219))))

(assert (=> b!510115 (= res!310961 (validKeyInArray!0 k!2280))))

(declare-fun b!510116 () Bool)

(declare-fun res!310954 () Bool)

(assert (=> b!510116 (=> (not res!310954) (not e!298219))))

(assert (=> b!510116 (= res!310954 (and (= (size!16128 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16128 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16128 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46060 res!310955) b!510116))

(assert (= (and b!510116 res!310954) b!510112))

(assert (= (and b!510112 res!310960) b!510115))

(assert (= (and b!510115 res!310961) b!510108))

(assert (= (and b!510108 res!310958) b!510109))

(assert (= (and b!510109 res!310956) b!510110))

(assert (= (and b!510110 res!310959) b!510111))

(assert (= (and b!510111 res!310953) b!510114))

(assert (= (and b!510114 res!310957) b!510113))

(declare-fun m!491217 () Bool)

(assert (=> b!510109 m!491217))

(declare-fun m!491219 () Bool)

(assert (=> b!510112 m!491219))

(assert (=> b!510112 m!491219))

(declare-fun m!491221 () Bool)

(assert (=> b!510112 m!491221))

(declare-fun m!491223 () Bool)

(assert (=> b!510114 m!491223))

(declare-fun m!491225 () Bool)

(assert (=> b!510114 m!491225))

(declare-fun m!491227 () Bool)

(assert (=> b!510114 m!491227))

(assert (=> b!510114 m!491227))

(declare-fun m!491229 () Bool)

(assert (=> b!510114 m!491229))

(assert (=> b!510114 m!491219))

(declare-fun m!491231 () Bool)

(assert (=> b!510114 m!491231))

(assert (=> b!510114 m!491219))

(declare-fun m!491233 () Bool)

(assert (=> b!510114 m!491233))

(assert (=> b!510114 m!491219))

(declare-fun m!491235 () Bool)

(assert (=> b!510114 m!491235))

(assert (=> b!510114 m!491227))

(declare-fun m!491237 () Bool)

(assert (=> b!510114 m!491237))

(declare-fun m!491239 () Bool)

(assert (=> b!510110 m!491239))

(declare-fun m!491241 () Bool)

(assert (=> b!510111 m!491241))

(declare-fun m!491243 () Bool)

(assert (=> start!46060 m!491243))

(declare-fun m!491245 () Bool)

(assert (=> start!46060 m!491245))

(assert (=> b!510113 m!491219))

(assert (=> b!510113 m!491219))

(declare-fun m!491247 () Bool)

(assert (=> b!510113 m!491247))

(declare-fun m!491249 () Bool)

(assert (=> b!510115 m!491249))

(declare-fun m!491251 () Bool)

(assert (=> b!510108 m!491251))

(push 1)

(assert (not b!510108))

