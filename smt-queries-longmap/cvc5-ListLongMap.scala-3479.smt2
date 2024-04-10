; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48216 () Bool)

(assert start!48216)

(declare-fun b!530818 () Bool)

(declare-fun res!326527 () Bool)

(declare-fun e!309213 () Bool)

(assert (=> b!530818 (=> (not res!326527) (not e!309213))))

(declare-datatypes ((array!33641 0))(
  ( (array!33642 (arr!16167 (Array (_ BitVec 32) (_ BitVec 64))) (size!16531 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33641)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530818 (= res!326527 (validKeyInArray!0 (select (arr!16167 a!3154) j!147)))))

(declare-fun res!326524 () Bool)

(assert (=> start!48216 (=> (not res!326524) (not e!309213))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48216 (= res!326524 (validMask!0 mask!3216))))

(assert (=> start!48216 e!309213))

(assert (=> start!48216 true))

(declare-fun array_inv!11963 (array!33641) Bool)

(assert (=> start!48216 (array_inv!11963 a!3154)))

(declare-fun b!530819 () Bool)

(declare-fun res!326526 () Bool)

(assert (=> b!530819 (=> (not res!326526) (not e!309213))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530819 (= res!326526 (and (= (size!16531 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16531 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16531 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530820 () Bool)

(assert (=> b!530820 (= e!309213 false)))

(declare-datatypes ((SeekEntryResult!4625 0))(
  ( (MissingZero!4625 (index!20724 (_ BitVec 32))) (Found!4625 (index!20725 (_ BitVec 32))) (Intermediate!4625 (undefined!5437 Bool) (index!20726 (_ BitVec 32)) (x!49711 (_ BitVec 32))) (Undefined!4625) (MissingVacant!4625 (index!20727 (_ BitVec 32))) )
))
(declare-fun lt!244804 () SeekEntryResult!4625)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33641 (_ BitVec 32)) SeekEntryResult!4625)

(assert (=> b!530820 (= lt!244804 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!530821 () Bool)

(declare-fun res!326528 () Bool)

(assert (=> b!530821 (=> (not res!326528) (not e!309213))))

(declare-fun arrayContainsKey!0 (array!33641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530821 (= res!326528 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!530822 () Bool)

(declare-fun res!326525 () Bool)

(assert (=> b!530822 (=> (not res!326525) (not e!309213))))

(assert (=> b!530822 (= res!326525 (validKeyInArray!0 k!1998))))

(assert (= (and start!48216 res!326524) b!530819))

(assert (= (and b!530819 res!326526) b!530818))

(assert (= (and b!530818 res!326527) b!530822))

(assert (= (and b!530822 res!326525) b!530821))

(assert (= (and b!530821 res!326528) b!530820))

(declare-fun m!511365 () Bool)

(assert (=> b!530821 m!511365))

(declare-fun m!511367 () Bool)

(assert (=> b!530820 m!511367))

(declare-fun m!511369 () Bool)

(assert (=> b!530818 m!511369))

(assert (=> b!530818 m!511369))

(declare-fun m!511371 () Bool)

(assert (=> b!530818 m!511371))

(declare-fun m!511373 () Bool)

(assert (=> start!48216 m!511373))

(declare-fun m!511375 () Bool)

(assert (=> start!48216 m!511375))

(declare-fun m!511377 () Bool)

(assert (=> b!530822 m!511377))

(push 1)

(assert (not b!530820))

(assert (not b!530822))

(assert (not start!48216))

(assert (not b!530821))

(assert (not b!530818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

