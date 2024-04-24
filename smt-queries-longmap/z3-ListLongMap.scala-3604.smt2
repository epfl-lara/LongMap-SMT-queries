; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49660 () Bool)

(assert start!49660)

(declare-fun b!546127 () Bool)

(declare-fun res!339958 () Bool)

(declare-fun e!315664 () Bool)

(assert (=> b!546127 (=> (not res!339958) (not e!315664))))

(declare-datatypes ((array!34421 0))(
  ( (array!34422 (arr!16537 (Array (_ BitVec 32) (_ BitVec 64))) (size!16901 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34421)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34421 (_ BitVec 32)) Bool)

(assert (=> b!546127 (= res!339958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!339961 () Bool)

(declare-fun e!315667 () Bool)

(assert (=> start!49660 (=> (not res!339961) (not e!315667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49660 (= res!339961 (validMask!0 mask!3216))))

(assert (=> start!49660 e!315667))

(assert (=> start!49660 true))

(declare-fun array_inv!12396 (array!34421) Bool)

(assert (=> start!49660 (array_inv!12396 a!3154)))

(declare-fun b!546128 () Bool)

(declare-fun e!315666 () Bool)

(declare-fun e!315668 () Bool)

(assert (=> b!546128 (= e!315666 e!315668)))

(declare-fun res!339952 () Bool)

(assert (=> b!546128 (=> (not res!339952) (not e!315668))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!249191 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!546128 (= res!339952 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!249191 #b00000000000000000000000000000000) (bvslt lt!249191 (size!16901 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!546128 (= lt!249191 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!546129 () Bool)

(declare-fun e!315663 () Bool)

(assert (=> b!546129 (= e!315663 (not true))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4951 0))(
  ( (MissingZero!4951 (index!22028 (_ BitVec 32))) (Found!4951 (index!22029 (_ BitVec 32))) (Intermediate!4951 (undefined!5763 Bool) (index!22030 (_ BitVec 32)) (x!51106 (_ BitVec 32))) (Undefined!4951) (MissingVacant!4951 (index!22031 (_ BitVec 32))) )
))
(declare-fun lt!249187 () SeekEntryResult!4951)

(declare-fun i!1153 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34421 (_ BitVec 32)) SeekEntryResult!4951)

(assert (=> b!546129 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249191 (select (store (arr!16537 a!3154) i!1153 k0!1998) j!147) (array!34422 (store (arr!16537 a!3154) i!1153 k0!1998) (size!16901 a!3154)) mask!3216) lt!249187)))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((Unit!16911 0))(
  ( (Unit!16912) )
))
(declare-fun lt!249192 () Unit!16911)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34421 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16911)

(assert (=> b!546129 (= lt!249192 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!249191 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!546130 () Bool)

(declare-fun res!339953 () Bool)

(assert (=> b!546130 (=> (not res!339953) (not e!315664))))

(declare-datatypes ((List!10563 0))(
  ( (Nil!10560) (Cons!10559 (h!11526 (_ BitVec 64)) (t!16783 List!10563)) )
))
(declare-fun arrayNoDuplicates!0 (array!34421 (_ BitVec 32) List!10563) Bool)

(assert (=> b!546130 (= res!339953 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10560))))

(declare-fun b!546131 () Bool)

(declare-fun res!339951 () Bool)

(assert (=> b!546131 (=> (not res!339951) (not e!315667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546131 (= res!339951 (validKeyInArray!0 (select (arr!16537 a!3154) j!147)))))

(declare-fun b!546132 () Bool)

(declare-fun res!339950 () Bool)

(assert (=> b!546132 (=> (not res!339950) (not e!315664))))

(assert (=> b!546132 (= res!339950 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16901 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16901 a!3154)) (= (select (arr!16537 a!3154) resIndex!32) (select (arr!16537 a!3154) j!147))))))

(declare-fun b!546133 () Bool)

(declare-fun e!315669 () Bool)

(assert (=> b!546133 (= e!315664 e!315669)))

(declare-fun res!339955 () Bool)

(assert (=> b!546133 (=> (not res!339955) (not e!315669))))

(declare-fun lt!249193 () SeekEntryResult!4951)

(assert (=> b!546133 (= res!339955 (= lt!249193 lt!249187))))

(assert (=> b!546133 (= lt!249187 (Intermediate!4951 false resIndex!32 resX!32))))

(assert (=> b!546133 (= lt!249193 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16537 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546134 () Bool)

(assert (=> b!546134 (= e!315667 e!315664)))

(declare-fun res!339949 () Bool)

(assert (=> b!546134 (=> (not res!339949) (not e!315664))))

(declare-fun lt!249188 () SeekEntryResult!4951)

(assert (=> b!546134 (= res!339949 (or (= lt!249188 (MissingZero!4951 i!1153)) (= lt!249188 (MissingVacant!4951 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34421 (_ BitVec 32)) SeekEntryResult!4951)

(assert (=> b!546134 (= lt!249188 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!546135 () Bool)

(assert (=> b!546135 (= e!315669 e!315666)))

(declare-fun res!339956 () Bool)

(assert (=> b!546135 (=> (not res!339956) (not e!315666))))

(declare-fun lt!249190 () SeekEntryResult!4951)

(assert (=> b!546135 (= res!339956 (and (= lt!249190 lt!249193) (not (= (select (arr!16537 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16537 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16537 a!3154) index!1177) (select (arr!16537 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!546135 (= lt!249190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16537 a!3154) j!147) mask!3216) (select (arr!16537 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546136 () Bool)

(declare-fun res!339954 () Bool)

(assert (=> b!546136 (=> (not res!339954) (not e!315667))))

(assert (=> b!546136 (= res!339954 (and (= (size!16901 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16901 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16901 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!546137 () Bool)

(declare-fun res!339960 () Bool)

(assert (=> b!546137 (=> (not res!339960) (not e!315667))))

(declare-fun arrayContainsKey!0 (array!34421 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546137 (= res!339960 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!546138 () Bool)

(declare-fun res!339957 () Bool)

(assert (=> b!546138 (=> (not res!339957) (not e!315667))))

(assert (=> b!546138 (= res!339957 (validKeyInArray!0 k0!1998))))

(declare-fun b!546139 () Bool)

(assert (=> b!546139 (= e!315668 e!315663)))

(declare-fun res!339959 () Bool)

(assert (=> b!546139 (=> (not res!339959) (not e!315663))))

(declare-fun lt!249189 () SeekEntryResult!4951)

(assert (=> b!546139 (= res!339959 (and (= lt!249189 lt!249187) (= lt!249190 lt!249189)))))

(assert (=> b!546139 (= lt!249189 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249191 (select (arr!16537 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49660 res!339961) b!546136))

(assert (= (and b!546136 res!339954) b!546131))

(assert (= (and b!546131 res!339951) b!546138))

(assert (= (and b!546138 res!339957) b!546137))

(assert (= (and b!546137 res!339960) b!546134))

(assert (= (and b!546134 res!339949) b!546127))

(assert (= (and b!546127 res!339958) b!546130))

(assert (= (and b!546130 res!339953) b!546132))

(assert (= (and b!546132 res!339950) b!546133))

(assert (= (and b!546133 res!339955) b!546135))

(assert (= (and b!546135 res!339956) b!546128))

(assert (= (and b!546128 res!339952) b!546139))

(assert (= (and b!546139 res!339959) b!546129))

(declare-fun m!523819 () Bool)

(assert (=> b!546132 m!523819))

(declare-fun m!523821 () Bool)

(assert (=> b!546132 m!523821))

(declare-fun m!523823 () Bool)

(assert (=> b!546137 m!523823))

(declare-fun m!523825 () Bool)

(assert (=> b!546134 m!523825))

(assert (=> b!546133 m!523821))

(assert (=> b!546133 m!523821))

(declare-fun m!523827 () Bool)

(assert (=> b!546133 m!523827))

(declare-fun m!523829 () Bool)

(assert (=> b!546127 m!523829))

(declare-fun m!523831 () Bool)

(assert (=> b!546135 m!523831))

(assert (=> b!546135 m!523821))

(assert (=> b!546135 m!523821))

(declare-fun m!523833 () Bool)

(assert (=> b!546135 m!523833))

(assert (=> b!546135 m!523833))

(assert (=> b!546135 m!523821))

(declare-fun m!523835 () Bool)

(assert (=> b!546135 m!523835))

(assert (=> b!546139 m!523821))

(assert (=> b!546139 m!523821))

(declare-fun m!523837 () Bool)

(assert (=> b!546139 m!523837))

(declare-fun m!523839 () Bool)

(assert (=> b!546129 m!523839))

(declare-fun m!523841 () Bool)

(assert (=> b!546129 m!523841))

(assert (=> b!546129 m!523841))

(declare-fun m!523843 () Bool)

(assert (=> b!546129 m!523843))

(declare-fun m!523845 () Bool)

(assert (=> b!546129 m!523845))

(declare-fun m!523847 () Bool)

(assert (=> b!546130 m!523847))

(declare-fun m!523849 () Bool)

(assert (=> start!49660 m!523849))

(declare-fun m!523851 () Bool)

(assert (=> start!49660 m!523851))

(declare-fun m!523853 () Bool)

(assert (=> b!546128 m!523853))

(declare-fun m!523855 () Bool)

(assert (=> b!546138 m!523855))

(assert (=> b!546131 m!523821))

(assert (=> b!546131 m!523821))

(declare-fun m!523857 () Bool)

(assert (=> b!546131 m!523857))

(check-sat (not b!546135) (not b!546133) (not start!49660) (not b!546134) (not b!546137) (not b!546138) (not b!546131) (not b!546129) (not b!546130) (not b!546128) (not b!546127) (not b!546139))
(check-sat)
