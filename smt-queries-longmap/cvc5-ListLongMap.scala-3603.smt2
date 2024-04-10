; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49608 () Bool)

(assert start!49608)

(declare-fun b!545811 () Bool)

(declare-fun e!315476 () Bool)

(declare-fun e!315473 () Bool)

(assert (=> b!545811 (= e!315476 e!315473)))

(declare-fun res!339745 () Bool)

(assert (=> b!545811 (=> (not res!339745) (not e!315473))))

(declare-datatypes ((SeekEntryResult!4997 0))(
  ( (MissingZero!4997 (index!22212 (_ BitVec 32))) (Found!4997 (index!22213 (_ BitVec 32))) (Intermediate!4997 (undefined!5809 Bool) (index!22214 (_ BitVec 32)) (x!51141 (_ BitVec 32))) (Undefined!4997) (MissingVacant!4997 (index!22215 (_ BitVec 32))) )
))
(declare-fun lt!249013 () SeekEntryResult!4997)

(declare-fun lt!249015 () SeekEntryResult!4997)

(assert (=> b!545811 (= res!339745 (= lt!249013 lt!249015))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!545811 (= lt!249015 (Intermediate!4997 false resIndex!32 resX!32))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34421 0))(
  ( (array!34422 (arr!16539 (Array (_ BitVec 32) (_ BitVec 64))) (size!16903 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34421)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34421 (_ BitVec 32)) SeekEntryResult!4997)

(assert (=> b!545811 (= lt!249013 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16539 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545812 () Bool)

(declare-fun res!339742 () Bool)

(assert (=> b!545812 (=> (not res!339742) (not e!315476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34421 (_ BitVec 32)) Bool)

(assert (=> b!545812 (= res!339742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545813 () Bool)

(declare-fun e!315474 () Bool)

(assert (=> b!545813 (= e!315473 e!315474)))

(declare-fun res!339748 () Bool)

(assert (=> b!545813 (=> (not res!339748) (not e!315474))))

(declare-fun lt!249018 () SeekEntryResult!4997)

(assert (=> b!545813 (= res!339748 (and (= lt!249018 lt!249013) (not (= (select (arr!16539 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16539 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16539 a!3154) index!1177) (select (arr!16539 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545813 (= lt!249018 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16539 a!3154) j!147) mask!3216) (select (arr!16539 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545814 () Bool)

(declare-fun res!339739 () Bool)

(declare-fun e!315471 () Bool)

(assert (=> b!545814 (=> (not res!339739) (not e!315471))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545814 (= res!339739 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545815 () Bool)

(declare-fun res!339741 () Bool)

(assert (=> b!545815 (=> (not res!339741) (not e!315471))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545815 (= res!339741 (and (= (size!16903 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16903 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16903 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545816 () Bool)

(declare-fun res!339746 () Bool)

(assert (=> b!545816 (=> (not res!339746) (not e!315471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545816 (= res!339746 (validKeyInArray!0 k!1998))))

(declare-fun b!545817 () Bool)

(assert (=> b!545817 (= e!315471 e!315476)))

(declare-fun res!339738 () Bool)

(assert (=> b!545817 (=> (not res!339738) (not e!315476))))

(declare-fun lt!249019 () SeekEntryResult!4997)

(assert (=> b!545817 (= res!339738 (or (= lt!249019 (MissingZero!4997 i!1153)) (= lt!249019 (MissingVacant!4997 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34421 (_ BitVec 32)) SeekEntryResult!4997)

(assert (=> b!545817 (= lt!249019 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!545818 () Bool)

(declare-fun res!339747 () Bool)

(assert (=> b!545818 (=> (not res!339747) (not e!315471))))

(assert (=> b!545818 (= res!339747 (validKeyInArray!0 (select (arr!16539 a!3154) j!147)))))

(declare-fun b!545810 () Bool)

(declare-fun res!339743 () Bool)

(assert (=> b!545810 (=> (not res!339743) (not e!315476))))

(assert (=> b!545810 (= res!339743 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16903 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16903 a!3154)) (= (select (arr!16539 a!3154) resIndex!32) (select (arr!16539 a!3154) j!147))))))

(declare-fun res!339740 () Bool)

(assert (=> start!49608 (=> (not res!339740) (not e!315471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49608 (= res!339740 (validMask!0 mask!3216))))

(assert (=> start!49608 e!315471))

(assert (=> start!49608 true))

(declare-fun array_inv!12335 (array!34421) Bool)

(assert (=> start!49608 (array_inv!12335 a!3154)))

(declare-fun b!545819 () Bool)

(declare-fun e!315477 () Bool)

(assert (=> b!545819 (= e!315474 e!315477)))

(declare-fun res!339749 () Bool)

(assert (=> b!545819 (=> (not res!339749) (not e!315477))))

(declare-fun lt!249014 () (_ BitVec 32))

(assert (=> b!545819 (= res!339749 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!249014 #b00000000000000000000000000000000) (bvslt lt!249014 (size!16903 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545819 (= lt!249014 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545820 () Bool)

(declare-fun e!315475 () Bool)

(assert (=> b!545820 (= e!315475 (not true))))

(assert (=> b!545820 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249014 (select (store (arr!16539 a!3154) i!1153 k!1998) j!147) (array!34422 (store (arr!16539 a!3154) i!1153 k!1998) (size!16903 a!3154)) mask!3216) lt!249015)))

(declare-datatypes ((Unit!16928 0))(
  ( (Unit!16929) )
))
(declare-fun lt!249016 () Unit!16928)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34421 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16928)

(assert (=> b!545820 (= lt!249016 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!249014 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!545821 () Bool)

(declare-fun res!339744 () Bool)

(assert (=> b!545821 (=> (not res!339744) (not e!315476))))

(declare-datatypes ((List!10658 0))(
  ( (Nil!10655) (Cons!10654 (h!11618 (_ BitVec 64)) (t!16886 List!10658)) )
))
(declare-fun arrayNoDuplicates!0 (array!34421 (_ BitVec 32) List!10658) Bool)

(assert (=> b!545821 (= res!339744 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10655))))

(declare-fun b!545822 () Bool)

(assert (=> b!545822 (= e!315477 e!315475)))

(declare-fun res!339737 () Bool)

(assert (=> b!545822 (=> (not res!339737) (not e!315475))))

(declare-fun lt!249017 () SeekEntryResult!4997)

(assert (=> b!545822 (= res!339737 (and (= lt!249017 lt!249015) (= lt!249018 lt!249017)))))

(assert (=> b!545822 (= lt!249017 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249014 (select (arr!16539 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49608 res!339740) b!545815))

(assert (= (and b!545815 res!339741) b!545818))

(assert (= (and b!545818 res!339747) b!545816))

(assert (= (and b!545816 res!339746) b!545814))

(assert (= (and b!545814 res!339739) b!545817))

(assert (= (and b!545817 res!339738) b!545812))

(assert (= (and b!545812 res!339742) b!545821))

(assert (= (and b!545821 res!339744) b!545810))

(assert (= (and b!545810 res!339743) b!545811))

(assert (= (and b!545811 res!339745) b!545813))

(assert (= (and b!545813 res!339748) b!545819))

(assert (= (and b!545819 res!339749) b!545822))

(assert (= (and b!545822 res!339737) b!545820))

(declare-fun m!523353 () Bool)

(assert (=> b!545817 m!523353))

(declare-fun m!523355 () Bool)

(assert (=> b!545814 m!523355))

(declare-fun m!523357 () Bool)

(assert (=> b!545821 m!523357))

(declare-fun m!523359 () Bool)

(assert (=> start!49608 m!523359))

(declare-fun m!523361 () Bool)

(assert (=> start!49608 m!523361))

(declare-fun m!523363 () Bool)

(assert (=> b!545811 m!523363))

(assert (=> b!545811 m!523363))

(declare-fun m!523365 () Bool)

(assert (=> b!545811 m!523365))

(declare-fun m!523367 () Bool)

(assert (=> b!545816 m!523367))

(declare-fun m!523369 () Bool)

(assert (=> b!545810 m!523369))

(assert (=> b!545810 m!523363))

(declare-fun m!523371 () Bool)

(assert (=> b!545812 m!523371))

(declare-fun m!523373 () Bool)

(assert (=> b!545820 m!523373))

(declare-fun m!523375 () Bool)

(assert (=> b!545820 m!523375))

(assert (=> b!545820 m!523375))

(declare-fun m!523377 () Bool)

(assert (=> b!545820 m!523377))

(declare-fun m!523379 () Bool)

(assert (=> b!545820 m!523379))

(declare-fun m!523381 () Bool)

(assert (=> b!545819 m!523381))

(assert (=> b!545822 m!523363))

(assert (=> b!545822 m!523363))

(declare-fun m!523383 () Bool)

(assert (=> b!545822 m!523383))

(declare-fun m!523385 () Bool)

(assert (=> b!545813 m!523385))

(assert (=> b!545813 m!523363))

(assert (=> b!545813 m!523363))

(declare-fun m!523387 () Bool)

(assert (=> b!545813 m!523387))

(assert (=> b!545813 m!523387))

(assert (=> b!545813 m!523363))

(declare-fun m!523389 () Bool)

(assert (=> b!545813 m!523389))

(assert (=> b!545818 m!523363))

(assert (=> b!545818 m!523363))

(declare-fun m!523391 () Bool)

(assert (=> b!545818 m!523391))

(push 1)

