; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49104 () Bool)

(assert start!49104)

(declare-fun b!540896 () Bool)

(declare-fun res!335792 () Bool)

(declare-fun e!313301 () Bool)

(assert (=> b!540896 (=> (not res!335792) (not e!313301))))

(declare-datatypes ((array!34214 0))(
  ( (array!34215 (arr!16443 (Array (_ BitVec 32) (_ BitVec 64))) (size!16807 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34214)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34214 (_ BitVec 32)) Bool)

(assert (=> b!540896 (= res!335792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540897 () Bool)

(assert (=> b!540897 (= e!313301 false)))

(declare-datatypes ((SeekEntryResult!4901 0))(
  ( (MissingZero!4901 (index!21828 (_ BitVec 32))) (Found!4901 (index!21829 (_ BitVec 32))) (Intermediate!4901 (undefined!5713 Bool) (index!21830 (_ BitVec 32)) (x!50744 (_ BitVec 32))) (Undefined!4901) (MissingVacant!4901 (index!21831 (_ BitVec 32))) )
))
(declare-fun lt!247512 () SeekEntryResult!4901)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34214 (_ BitVec 32)) SeekEntryResult!4901)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540897 (= lt!247512 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16443 a!3154) j!147) mask!3216) (select (arr!16443 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540898 () Bool)

(declare-fun e!313300 () Bool)

(assert (=> b!540898 (= e!313300 e!313301)))

(declare-fun res!335786 () Bool)

(assert (=> b!540898 (=> (not res!335786) (not e!313301))))

(declare-fun lt!247513 () SeekEntryResult!4901)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540898 (= res!335786 (or (= lt!247513 (MissingZero!4901 i!1153)) (= lt!247513 (MissingVacant!4901 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34214 (_ BitVec 32)) SeekEntryResult!4901)

(assert (=> b!540898 (= lt!247513 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!540899 () Bool)

(declare-fun res!335787 () Bool)

(assert (=> b!540899 (=> (not res!335787) (not e!313301))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540899 (= res!335787 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16807 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16807 a!3154)) (= (select (arr!16443 a!3154) resIndex!32) (select (arr!16443 a!3154) j!147))))))

(declare-fun b!540900 () Bool)

(declare-fun res!335785 () Bool)

(assert (=> b!540900 (=> (not res!335785) (not e!313301))))

(declare-datatypes ((List!10562 0))(
  ( (Nil!10559) (Cons!10558 (h!11507 (_ BitVec 64)) (t!16790 List!10562)) )
))
(declare-fun arrayNoDuplicates!0 (array!34214 (_ BitVec 32) List!10562) Bool)

(assert (=> b!540900 (= res!335785 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10559))))

(declare-fun b!540901 () Bool)

(declare-fun res!335783 () Bool)

(assert (=> b!540901 (=> (not res!335783) (not e!313301))))

(assert (=> b!540901 (= res!335783 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16443 a!3154) j!147) a!3154 mask!3216) (Intermediate!4901 false resIndex!32 resX!32)))))

(declare-fun b!540902 () Bool)

(declare-fun res!335788 () Bool)

(assert (=> b!540902 (=> (not res!335788) (not e!313300))))

(declare-fun arrayContainsKey!0 (array!34214 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540902 (= res!335788 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!335791 () Bool)

(assert (=> start!49104 (=> (not res!335791) (not e!313300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49104 (= res!335791 (validMask!0 mask!3216))))

(assert (=> start!49104 e!313300))

(assert (=> start!49104 true))

(declare-fun array_inv!12239 (array!34214) Bool)

(assert (=> start!49104 (array_inv!12239 a!3154)))

(declare-fun b!540903 () Bool)

(declare-fun res!335784 () Bool)

(assert (=> b!540903 (=> (not res!335784) (not e!313300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540903 (= res!335784 (validKeyInArray!0 (select (arr!16443 a!3154) j!147)))))

(declare-fun b!540904 () Bool)

(declare-fun res!335789 () Bool)

(assert (=> b!540904 (=> (not res!335789) (not e!313300))))

(assert (=> b!540904 (= res!335789 (and (= (size!16807 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16807 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16807 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540905 () Bool)

(declare-fun res!335790 () Bool)

(assert (=> b!540905 (=> (not res!335790) (not e!313300))))

(assert (=> b!540905 (= res!335790 (validKeyInArray!0 k!1998))))

(assert (= (and start!49104 res!335791) b!540904))

(assert (= (and b!540904 res!335789) b!540903))

(assert (= (and b!540903 res!335784) b!540905))

(assert (= (and b!540905 res!335790) b!540902))

(assert (= (and b!540902 res!335788) b!540898))

(assert (= (and b!540898 res!335786) b!540896))

(assert (= (and b!540896 res!335792) b!540900))

(assert (= (and b!540900 res!335785) b!540899))

(assert (= (and b!540899 res!335787) b!540901))

(assert (= (and b!540901 res!335783) b!540897))

(declare-fun m!519543 () Bool)

(assert (=> b!540901 m!519543))

(assert (=> b!540901 m!519543))

(declare-fun m!519545 () Bool)

(assert (=> b!540901 m!519545))

(declare-fun m!519547 () Bool)

(assert (=> b!540898 m!519547))

(declare-fun m!519549 () Bool)

(assert (=> b!540902 m!519549))

(declare-fun m!519551 () Bool)

(assert (=> b!540905 m!519551))

(declare-fun m!519553 () Bool)

(assert (=> b!540896 m!519553))

(declare-fun m!519555 () Bool)

(assert (=> start!49104 m!519555))

(declare-fun m!519557 () Bool)

(assert (=> start!49104 m!519557))

(assert (=> b!540897 m!519543))

(assert (=> b!540897 m!519543))

(declare-fun m!519559 () Bool)

(assert (=> b!540897 m!519559))

(assert (=> b!540897 m!519559))

(assert (=> b!540897 m!519543))

(declare-fun m!519561 () Bool)

(assert (=> b!540897 m!519561))

(declare-fun m!519563 () Bool)

(assert (=> b!540899 m!519563))

(assert (=> b!540899 m!519543))

(assert (=> b!540903 m!519543))

(assert (=> b!540903 m!519543))

(declare-fun m!519565 () Bool)

(assert (=> b!540903 m!519565))

(declare-fun m!519567 () Bool)

(assert (=> b!540900 m!519567))

(push 1)

