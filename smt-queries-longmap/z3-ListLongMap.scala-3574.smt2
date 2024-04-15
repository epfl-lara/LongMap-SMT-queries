; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49110 () Bool)

(assert start!49110)

(declare-fun b!540895 () Bool)

(declare-fun res!335929 () Bool)

(declare-fun e!313207 () Bool)

(assert (=> b!540895 (=> (not res!335929) (not e!313207))))

(declare-datatypes ((array!34230 0))(
  ( (array!34231 (arr!16451 (Array (_ BitVec 32) (_ BitVec 64))) (size!16816 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34230)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34230 (_ BitVec 32)) Bool)

(assert (=> b!540895 (= res!335929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540896 () Bool)

(declare-fun res!335932 () Bool)

(declare-fun e!313208 () Bool)

(assert (=> b!540896 (=> (not res!335932) (not e!313208))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34230 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540896 (= res!335932 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540897 () Bool)

(declare-fun res!335926 () Bool)

(assert (=> b!540897 (=> (not res!335926) (not e!313208))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540897 (= res!335926 (and (= (size!16816 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16816 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16816 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540898 () Bool)

(declare-fun res!335930 () Bool)

(assert (=> b!540898 (=> (not res!335930) (not e!313207))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540898 (= res!335930 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16816 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16816 a!3154)) (= (select (arr!16451 a!3154) resIndex!32) (select (arr!16451 a!3154) j!147))))))

(declare-fun b!540899 () Bool)

(assert (=> b!540899 (= e!313208 e!313207)))

(declare-fun res!335933 () Bool)

(assert (=> b!540899 (=> (not res!335933) (not e!313207))))

(declare-datatypes ((SeekEntryResult!4906 0))(
  ( (MissingZero!4906 (index!21848 (_ BitVec 32))) (Found!4906 (index!21849 (_ BitVec 32))) (Intermediate!4906 (undefined!5718 Bool) (index!21850 (_ BitVec 32)) (x!50768 (_ BitVec 32))) (Undefined!4906) (MissingVacant!4906 (index!21851 (_ BitVec 32))) )
))
(declare-fun lt!247333 () SeekEntryResult!4906)

(assert (=> b!540899 (= res!335933 (or (= lt!247333 (MissingZero!4906 i!1153)) (= lt!247333 (MissingVacant!4906 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34230 (_ BitVec 32)) SeekEntryResult!4906)

(assert (=> b!540899 (= lt!247333 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540900 () Bool)

(declare-fun res!335931 () Bool)

(assert (=> b!540900 (=> (not res!335931) (not e!313207))))

(declare-datatypes ((List!10609 0))(
  ( (Nil!10606) (Cons!10605 (h!11554 (_ BitVec 64)) (t!16828 List!10609)) )
))
(declare-fun arrayNoDuplicates!0 (array!34230 (_ BitVec 32) List!10609) Bool)

(assert (=> b!540900 (= res!335931 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10606))))

(declare-fun res!335924 () Bool)

(assert (=> start!49110 (=> (not res!335924) (not e!313208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49110 (= res!335924 (validMask!0 mask!3216))))

(assert (=> start!49110 e!313208))

(assert (=> start!49110 true))

(declare-fun array_inv!12334 (array!34230) Bool)

(assert (=> start!49110 (array_inv!12334 a!3154)))

(declare-fun b!540901 () Bool)

(declare-fun res!335927 () Bool)

(assert (=> b!540901 (=> (not res!335927) (not e!313208))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540901 (= res!335927 (validKeyInArray!0 (select (arr!16451 a!3154) j!147)))))

(declare-fun b!540902 () Bool)

(declare-fun res!335928 () Bool)

(assert (=> b!540902 (=> (not res!335928) (not e!313207))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34230 (_ BitVec 32)) SeekEntryResult!4906)

(assert (=> b!540902 (= res!335928 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16451 a!3154) j!147) a!3154 mask!3216) (Intermediate!4906 false resIndex!32 resX!32)))))

(declare-fun b!540903 () Bool)

(declare-fun res!335925 () Bool)

(assert (=> b!540903 (=> (not res!335925) (not e!313208))))

(assert (=> b!540903 (= res!335925 (validKeyInArray!0 k0!1998))))

(declare-fun b!540904 () Bool)

(assert (=> b!540904 (= e!313207 false)))

(declare-fun lt!247332 () SeekEntryResult!4906)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540904 (= lt!247332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16451 a!3154) j!147) mask!3216) (select (arr!16451 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49110 res!335924) b!540897))

(assert (= (and b!540897 res!335926) b!540901))

(assert (= (and b!540901 res!335927) b!540903))

(assert (= (and b!540903 res!335925) b!540896))

(assert (= (and b!540896 res!335932) b!540899))

(assert (= (and b!540899 res!335933) b!540895))

(assert (= (and b!540895 res!335929) b!540900))

(assert (= (and b!540900 res!335931) b!540898))

(assert (= (and b!540898 res!335930) b!540902))

(assert (= (and b!540902 res!335928) b!540904))

(declare-fun m!519025 () Bool)

(assert (=> b!540901 m!519025))

(assert (=> b!540901 m!519025))

(declare-fun m!519027 () Bool)

(assert (=> b!540901 m!519027))

(declare-fun m!519029 () Bool)

(assert (=> b!540899 m!519029))

(declare-fun m!519031 () Bool)

(assert (=> b!540896 m!519031))

(declare-fun m!519033 () Bool)

(assert (=> b!540898 m!519033))

(assert (=> b!540898 m!519025))

(declare-fun m!519035 () Bool)

(assert (=> b!540895 m!519035))

(declare-fun m!519037 () Bool)

(assert (=> start!49110 m!519037))

(declare-fun m!519039 () Bool)

(assert (=> start!49110 m!519039))

(declare-fun m!519041 () Bool)

(assert (=> b!540903 m!519041))

(declare-fun m!519043 () Bool)

(assert (=> b!540900 m!519043))

(assert (=> b!540904 m!519025))

(assert (=> b!540904 m!519025))

(declare-fun m!519045 () Bool)

(assert (=> b!540904 m!519045))

(assert (=> b!540904 m!519045))

(assert (=> b!540904 m!519025))

(declare-fun m!519047 () Bool)

(assert (=> b!540904 m!519047))

(assert (=> b!540902 m!519025))

(assert (=> b!540902 m!519025))

(declare-fun m!519049 () Bool)

(assert (=> b!540902 m!519049))

(check-sat (not b!540896) (not start!49110) (not b!540904) (not b!540895) (not b!540899) (not b!540901) (not b!540902) (not b!540903) (not b!540900))
(check-sat)
