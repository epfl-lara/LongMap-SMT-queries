; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48224 () Bool)

(assert start!48224)

(declare-fun b!530878 () Bool)

(declare-fun res!326586 () Bool)

(declare-fun e!309237 () Bool)

(assert (=> b!530878 (=> (not res!326586) (not e!309237))))

(declare-datatypes ((array!33649 0))(
  ( (array!33650 (arr!16171 (Array (_ BitVec 32) (_ BitVec 64))) (size!16535 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33649)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530878 (= res!326586 (validKeyInArray!0 (select (arr!16171 a!3154) j!147)))))

(declare-fun b!530879 () Bool)

(declare-fun res!326587 () Bool)

(assert (=> b!530879 (=> (not res!326587) (not e!309237))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530879 (= res!326587 (and (= (size!16535 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16535 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16535 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!530880 () Bool)

(declare-fun res!326584 () Bool)

(assert (=> b!530880 (=> (not res!326584) (not e!309237))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!530880 (= res!326584 (validKeyInArray!0 k0!1998))))

(declare-fun b!530881 () Bool)

(declare-fun res!326585 () Bool)

(assert (=> b!530881 (=> (not res!326585) (not e!309237))))

(declare-fun arrayContainsKey!0 (array!33649 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!530881 (= res!326585 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!4629 0))(
  ( (MissingZero!4629 (index!20740 (_ BitVec 32))) (Found!4629 (index!20741 (_ BitVec 32))) (Intermediate!4629 (undefined!5441 Bool) (index!20742 (_ BitVec 32)) (x!49723 (_ BitVec 32))) (Undefined!4629) (MissingVacant!4629 (index!20743 (_ BitVec 32))) )
))
(declare-fun lt!244816 () SeekEntryResult!4629)

(declare-fun b!530882 () Bool)

(assert (=> b!530882 (= e!309237 (and (or (= lt!244816 (MissingZero!4629 i!1153)) (= lt!244816 (MissingVacant!4629 i!1153))) (bvsgt #b00000000000000000000000000000000 (size!16535 a!3154))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33649 (_ BitVec 32)) SeekEntryResult!4629)

(assert (=> b!530882 (= lt!244816 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun res!326588 () Bool)

(assert (=> start!48224 (=> (not res!326588) (not e!309237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48224 (= res!326588 (validMask!0 mask!3216))))

(assert (=> start!48224 e!309237))

(assert (=> start!48224 true))

(declare-fun array_inv!11967 (array!33649) Bool)

(assert (=> start!48224 (array_inv!11967 a!3154)))

(assert (= (and start!48224 res!326588) b!530879))

(assert (= (and b!530879 res!326587) b!530878))

(assert (= (and b!530878 res!326586) b!530880))

(assert (= (and b!530880 res!326584) b!530881))

(assert (= (and b!530881 res!326585) b!530882))

(declare-fun m!511421 () Bool)

(assert (=> b!530882 m!511421))

(declare-fun m!511423 () Bool)

(assert (=> b!530880 m!511423))

(declare-fun m!511425 () Bool)

(assert (=> b!530878 m!511425))

(assert (=> b!530878 m!511425))

(declare-fun m!511427 () Bool)

(assert (=> b!530878 m!511427))

(declare-fun m!511429 () Bool)

(assert (=> start!48224 m!511429))

(declare-fun m!511431 () Bool)

(assert (=> start!48224 m!511431))

(declare-fun m!511433 () Bool)

(assert (=> b!530881 m!511433))

(check-sat (not b!530882) (not start!48224) (not b!530880) (not b!530881) (not b!530878))
(check-sat)
