; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48196 () Bool)

(assert start!48196)

(declare-fun b!530668 () Bool)

(declare-fun res!326377 () Bool)

(declare-fun e!309153 () Bool)

(assert (=> b!530668 (=> (not res!326377) (not e!309153))))

(declare-datatypes ((array!33621 0))(
  ( (array!33622 (arr!16157 (Array (_ BitVec 32) (_ BitVec 64))) (size!16521 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33621)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530668 (= res!326377 (validKeyInArray!0 (select (arr!16157 a!3154) j!147)))))

(declare-fun b!530669 () Bool)

(assert (=> b!530669 (= e!309153 false)))

(declare-datatypes ((SeekEntryResult!4615 0))(
  ( (MissingZero!4615 (index!20684 (_ BitVec 32))) (Found!4615 (index!20685 (_ BitVec 32))) (Intermediate!4615 (undefined!5427 Bool) (index!20686 (_ BitVec 32)) (x!49669 (_ BitVec 32))) (Undefined!4615) (MissingVacant!4615 (index!20687 (_ BitVec 32))) )
))
(declare-fun lt!244774 () SeekEntryResult!4615)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33621 (_ BitVec 32)) SeekEntryResult!4615)

(assert (=> b!530669 (= lt!244774 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!326374 () Bool)

(assert (=> start!48196 (=> (not res!326374) (not e!309153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48196 (= res!326374 (validMask!0 mask!3216))))

(assert (=> start!48196 e!309153))

(assert (=> start!48196 true))

(declare-fun array_inv!11953 (array!33621) Bool)

(assert (=> start!48196 (array_inv!11953 a!3154)))

(declare-fun b!530670 () Bool)

(declare-fun res!326378 () Bool)

(assert (=> b!530670 (=> (not res!326378) (not e!309153))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530670 (= res!326378 (and (= (size!16521 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16521 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16521 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530671 () Bool)

(declare-fun res!326376 () Bool)

(assert (=> b!530671 (=> (not res!326376) (not e!309153))))

(declare-fun arrayContainsKey!0 (array!33621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530671 (= res!326376 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530672 () Bool)

(declare-fun res!326375 () Bool)

(assert (=> b!530672 (=> (not res!326375) (not e!309153))))

(assert (=> b!530672 (= res!326375 (validKeyInArray!0 k!1998))))

(assert (= (and start!48196 res!326374) b!530670))

(assert (= (and b!530670 res!326378) b!530668))

(assert (= (and b!530668 res!326377) b!530672))

(assert (= (and b!530672 res!326375) b!530671))

(assert (= (and b!530671 res!326376) b!530669))

(declare-fun m!511225 () Bool)

(assert (=> start!48196 m!511225))

(declare-fun m!511227 () Bool)

(assert (=> start!48196 m!511227))

(declare-fun m!511229 () Bool)

(assert (=> b!530669 m!511229))

(declare-fun m!511231 () Bool)

(assert (=> b!530668 m!511231))

(assert (=> b!530668 m!511231))

(declare-fun m!511233 () Bool)

(assert (=> b!530668 m!511233))

(declare-fun m!511235 () Bool)

(assert (=> b!530672 m!511235))

(declare-fun m!511237 () Bool)

(assert (=> b!530671 m!511237))

(push 1)

(assert (not start!48196))

(assert (not b!530671))

(assert (not b!530669))

(assert (not b!530668))

(assert (not b!530672))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

