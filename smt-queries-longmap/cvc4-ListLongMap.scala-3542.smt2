; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48826 () Bool)

(assert start!48826)

(declare-fun b!537587 () Bool)

(declare-fun res!332796 () Bool)

(declare-fun e!311856 () Bool)

(assert (=> b!537587 (=> (not res!332796) (not e!311856))))

(declare-datatypes ((array!34038 0))(
  ( (array!34039 (arr!16358 (Array (_ BitVec 32) (_ BitVec 64))) (size!16722 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34038)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537587 (= res!332796 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537588 () Bool)

(declare-fun res!332799 () Bool)

(assert (=> b!537588 (=> (not res!332799) (not e!311856))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537588 (= res!332799 (validKeyInArray!0 (select (arr!16358 a!3154) j!147)))))

(declare-fun b!537589 () Bool)

(declare-fun res!332798 () Bool)

(declare-fun e!311859 () Bool)

(assert (=> b!537589 (=> (not res!332798) (not e!311859))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537589 (= res!332798 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16722 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16722 a!3154)) (= (select (arr!16358 a!3154) resIndex!32) (select (arr!16358 a!3154) j!147))))))

(declare-fun res!332797 () Bool)

(assert (=> start!48826 (=> (not res!332797) (not e!311856))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48826 (= res!332797 (validMask!0 mask!3216))))

(assert (=> start!48826 e!311856))

(assert (=> start!48826 true))

(declare-fun array_inv!12154 (array!34038) Bool)

(assert (=> start!48826 (array_inv!12154 a!3154)))

(declare-fun b!537590 () Bool)

(declare-fun res!332794 () Bool)

(assert (=> b!537590 (=> (not res!332794) (not e!311859))))

(declare-datatypes ((List!10477 0))(
  ( (Nil!10474) (Cons!10473 (h!11416 (_ BitVec 64)) (t!16705 List!10477)) )
))
(declare-fun arrayNoDuplicates!0 (array!34038 (_ BitVec 32) List!10477) Bool)

(assert (=> b!537590 (= res!332794 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10474))))

(declare-fun b!537591 () Bool)

(declare-fun res!332792 () Bool)

(assert (=> b!537591 (=> (not res!332792) (not e!311856))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537591 (= res!332792 (and (= (size!16722 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16722 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16722 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537592 () Bool)

(declare-fun res!332795 () Bool)

(declare-fun e!311855 () Bool)

(assert (=> b!537592 (=> (not res!332795) (not e!311855))))

(declare-datatypes ((SeekEntryResult!4816 0))(
  ( (MissingZero!4816 (index!21488 (_ BitVec 32))) (Found!4816 (index!21489 (_ BitVec 32))) (Intermediate!4816 (undefined!5628 Bool) (index!21490 (_ BitVec 32)) (x!50415 (_ BitVec 32))) (Undefined!4816) (MissingVacant!4816 (index!21491 (_ BitVec 32))) )
))
(declare-fun lt!246451 () SeekEntryResult!4816)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34038 (_ BitVec 32)) SeekEntryResult!4816)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537592 (= res!332795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16358 a!3154) j!147) mask!3216) (select (arr!16358 a!3154) j!147) a!3154 mask!3216) lt!246451))))

(declare-fun b!537593 () Bool)

(assert (=> b!537593 (= e!311856 e!311859)))

(declare-fun res!332803 () Bool)

(assert (=> b!537593 (=> (not res!332803) (not e!311859))))

(declare-fun lt!246448 () SeekEntryResult!4816)

(assert (=> b!537593 (= res!332803 (or (= lt!246448 (MissingZero!4816 i!1153)) (= lt!246448 (MissingVacant!4816 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34038 (_ BitVec 32)) SeekEntryResult!4816)

(assert (=> b!537593 (= lt!246448 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!537594 () Bool)

(assert (=> b!537594 (= e!311859 e!311855)))

(declare-fun res!332793 () Bool)

(assert (=> b!537594 (=> (not res!332793) (not e!311855))))

(assert (=> b!537594 (= res!332793 (= lt!246451 (Intermediate!4816 false resIndex!32 resX!32)))))

(assert (=> b!537594 (= lt!246451 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16358 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537595 () Bool)

(declare-fun res!332800 () Bool)

(assert (=> b!537595 (=> (not res!332800) (not e!311859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34038 (_ BitVec 32)) Bool)

(assert (=> b!537595 (= res!332800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537596 () Bool)

(declare-fun e!311857 () Bool)

(assert (=> b!537596 (= e!311857 false)))

(declare-fun lt!246450 () SeekEntryResult!4816)

(declare-fun lt!246449 () (_ BitVec 32))

(assert (=> b!537596 (= lt!246450 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246449 (select (arr!16358 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537597 () Bool)

(declare-fun res!332802 () Bool)

(assert (=> b!537597 (=> (not res!332802) (not e!311855))))

(assert (=> b!537597 (= res!332802 (and (not (= (select (arr!16358 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16358 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16358 a!3154) index!1177) (select (arr!16358 a!3154) j!147)))))))

(declare-fun b!537598 () Bool)

(declare-fun res!332804 () Bool)

(assert (=> b!537598 (=> (not res!332804) (not e!311856))))

(assert (=> b!537598 (= res!332804 (validKeyInArray!0 k!1998))))

(declare-fun b!537599 () Bool)

(assert (=> b!537599 (= e!311855 e!311857)))

(declare-fun res!332801 () Bool)

(assert (=> b!537599 (=> (not res!332801) (not e!311857))))

(assert (=> b!537599 (= res!332801 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246449 #b00000000000000000000000000000000) (bvslt lt!246449 (size!16722 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537599 (= lt!246449 (nextIndex!0 index!1177 x!1030 mask!3216))))

(assert (= (and start!48826 res!332797) b!537591))

(assert (= (and b!537591 res!332792) b!537588))

(assert (= (and b!537588 res!332799) b!537598))

(assert (= (and b!537598 res!332804) b!537587))

(assert (= (and b!537587 res!332796) b!537593))

(assert (= (and b!537593 res!332803) b!537595))

(assert (= (and b!537595 res!332800) b!537590))

(assert (= (and b!537590 res!332794) b!537589))

(assert (= (and b!537589 res!332798) b!537594))

(assert (= (and b!537594 res!332793) b!537592))

(assert (= (and b!537592 res!332795) b!537597))

(assert (= (and b!537597 res!332802) b!537599))

(assert (= (and b!537599 res!332801) b!537596))

(declare-fun m!516793 () Bool)

(assert (=> b!537595 m!516793))

(declare-fun m!516795 () Bool)

(assert (=> b!537589 m!516795))

(declare-fun m!516797 () Bool)

(assert (=> b!537589 m!516797))

(declare-fun m!516799 () Bool)

(assert (=> b!537593 m!516799))

(assert (=> b!537596 m!516797))

(assert (=> b!537596 m!516797))

(declare-fun m!516801 () Bool)

(assert (=> b!537596 m!516801))

(declare-fun m!516803 () Bool)

(assert (=> b!537590 m!516803))

(declare-fun m!516805 () Bool)

(assert (=> b!537597 m!516805))

(assert (=> b!537597 m!516797))

(assert (=> b!537592 m!516797))

(assert (=> b!537592 m!516797))

(declare-fun m!516807 () Bool)

(assert (=> b!537592 m!516807))

(assert (=> b!537592 m!516807))

(assert (=> b!537592 m!516797))

(declare-fun m!516809 () Bool)

(assert (=> b!537592 m!516809))

(declare-fun m!516811 () Bool)

(assert (=> start!48826 m!516811))

(declare-fun m!516813 () Bool)

(assert (=> start!48826 m!516813))

(declare-fun m!516815 () Bool)

(assert (=> b!537598 m!516815))

(declare-fun m!516817 () Bool)

(assert (=> b!537599 m!516817))

(assert (=> b!537594 m!516797))

(assert (=> b!537594 m!516797))

(declare-fun m!516819 () Bool)

(assert (=> b!537594 m!516819))

(assert (=> b!537588 m!516797))

(assert (=> b!537588 m!516797))

(declare-fun m!516821 () Bool)

(assert (=> b!537588 m!516821))

(declare-fun m!516823 () Bool)

(assert (=> b!537587 m!516823))

(push 1)

(assert (not b!537587))

(assert (not b!537593))

(assert (not b!537590))

(assert (not b!537592))

(assert (not b!537595))

(assert (not b!537596))

(assert (not b!537588))

