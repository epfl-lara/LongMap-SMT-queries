; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49106 () Bool)

(assert start!49106)

(declare-fun b!540926 () Bool)

(declare-fun res!335822 () Bool)

(declare-fun e!313309 () Bool)

(assert (=> b!540926 (=> (not res!335822) (not e!313309))))

(declare-datatypes ((array!34216 0))(
  ( (array!34217 (arr!16444 (Array (_ BitVec 32) (_ BitVec 64))) (size!16808 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34216)

(declare-datatypes ((List!10563 0))(
  ( (Nil!10560) (Cons!10559 (h!11508 (_ BitVec 64)) (t!16791 List!10563)) )
))
(declare-fun arrayNoDuplicates!0 (array!34216 (_ BitVec 32) List!10563) Bool)

(assert (=> b!540926 (= res!335822 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10560))))

(declare-fun res!335819 () Bool)

(declare-fun e!313310 () Bool)

(assert (=> start!49106 (=> (not res!335819) (not e!313310))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49106 (= res!335819 (validMask!0 mask!3216))))

(assert (=> start!49106 e!313310))

(assert (=> start!49106 true))

(declare-fun array_inv!12240 (array!34216) Bool)

(assert (=> start!49106 (array_inv!12240 a!3154)))

(declare-fun b!540927 () Bool)

(assert (=> b!540927 (= e!313309 false)))

(declare-datatypes ((SeekEntryResult!4902 0))(
  ( (MissingZero!4902 (index!21832 (_ BitVec 32))) (Found!4902 (index!21833 (_ BitVec 32))) (Intermediate!4902 (undefined!5714 Bool) (index!21834 (_ BitVec 32)) (x!50745 (_ BitVec 32))) (Undefined!4902) (MissingVacant!4902 (index!21835 (_ BitVec 32))) )
))
(declare-fun lt!247518 () SeekEntryResult!4902)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34216 (_ BitVec 32)) SeekEntryResult!4902)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540927 (= lt!247518 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16444 a!3154) j!147) mask!3216) (select (arr!16444 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540928 () Bool)

(declare-fun res!335817 () Bool)

(assert (=> b!540928 (=> (not res!335817) (not e!313310))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540928 (= res!335817 (validKeyInArray!0 k0!1998))))

(declare-fun b!540929 () Bool)

(declare-fun res!335816 () Bool)

(assert (=> b!540929 (=> (not res!335816) (not e!313309))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!540929 (= res!335816 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16444 a!3154) j!147) a!3154 mask!3216) (Intermediate!4902 false resIndex!32 resX!32)))))

(declare-fun b!540930 () Bool)

(declare-fun res!335814 () Bool)

(assert (=> b!540930 (=> (not res!335814) (not e!313310))))

(assert (=> b!540930 (= res!335814 (validKeyInArray!0 (select (arr!16444 a!3154) j!147)))))

(declare-fun b!540931 () Bool)

(declare-fun res!335815 () Bool)

(assert (=> b!540931 (=> (not res!335815) (not e!313309))))

(assert (=> b!540931 (= res!335815 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16808 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16808 a!3154)) (= (select (arr!16444 a!3154) resIndex!32) (select (arr!16444 a!3154) j!147))))))

(declare-fun b!540932 () Bool)

(declare-fun res!335821 () Bool)

(assert (=> b!540932 (=> (not res!335821) (not e!313310))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540932 (= res!335821 (and (= (size!16808 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16808 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16808 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540933 () Bool)

(assert (=> b!540933 (= e!313310 e!313309)))

(declare-fun res!335820 () Bool)

(assert (=> b!540933 (=> (not res!335820) (not e!313309))))

(declare-fun lt!247519 () SeekEntryResult!4902)

(assert (=> b!540933 (= res!335820 (or (= lt!247519 (MissingZero!4902 i!1153)) (= lt!247519 (MissingVacant!4902 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34216 (_ BitVec 32)) SeekEntryResult!4902)

(assert (=> b!540933 (= lt!247519 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540934 () Bool)

(declare-fun res!335818 () Bool)

(assert (=> b!540934 (=> (not res!335818) (not e!313310))))

(declare-fun arrayContainsKey!0 (array!34216 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540934 (= res!335818 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540935 () Bool)

(declare-fun res!335813 () Bool)

(assert (=> b!540935 (=> (not res!335813) (not e!313309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34216 (_ BitVec 32)) Bool)

(assert (=> b!540935 (= res!335813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49106 res!335819) b!540932))

(assert (= (and b!540932 res!335821) b!540930))

(assert (= (and b!540930 res!335814) b!540928))

(assert (= (and b!540928 res!335817) b!540934))

(assert (= (and b!540934 res!335818) b!540933))

(assert (= (and b!540933 res!335820) b!540935))

(assert (= (and b!540935 res!335813) b!540926))

(assert (= (and b!540926 res!335822) b!540931))

(assert (= (and b!540931 res!335815) b!540929))

(assert (= (and b!540929 res!335816) b!540927))

(declare-fun m!519569 () Bool)

(assert (=> b!540935 m!519569))

(declare-fun m!519571 () Bool)

(assert (=> b!540928 m!519571))

(declare-fun m!519573 () Bool)

(assert (=> start!49106 m!519573))

(declare-fun m!519575 () Bool)

(assert (=> start!49106 m!519575))

(declare-fun m!519577 () Bool)

(assert (=> b!540930 m!519577))

(assert (=> b!540930 m!519577))

(declare-fun m!519579 () Bool)

(assert (=> b!540930 m!519579))

(assert (=> b!540927 m!519577))

(assert (=> b!540927 m!519577))

(declare-fun m!519581 () Bool)

(assert (=> b!540927 m!519581))

(assert (=> b!540927 m!519581))

(assert (=> b!540927 m!519577))

(declare-fun m!519583 () Bool)

(assert (=> b!540927 m!519583))

(assert (=> b!540929 m!519577))

(assert (=> b!540929 m!519577))

(declare-fun m!519585 () Bool)

(assert (=> b!540929 m!519585))

(declare-fun m!519587 () Bool)

(assert (=> b!540931 m!519587))

(assert (=> b!540931 m!519577))

(declare-fun m!519589 () Bool)

(assert (=> b!540933 m!519589))

(declare-fun m!519591 () Bool)

(assert (=> b!540926 m!519591))

(declare-fun m!519593 () Bool)

(assert (=> b!540934 m!519593))

(check-sat (not b!540935) (not b!540928) (not b!540927) (not b!540929) (not b!540934) (not start!49106) (not b!540930) (not b!540926) (not b!540933))
