; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48892 () Bool)

(assert start!48892)

(declare-fun b!538882 () Bool)

(declare-fun e!312468 () Bool)

(declare-fun e!312465 () Bool)

(assert (=> b!538882 (= e!312468 e!312465)))

(declare-fun res!334091 () Bool)

(assert (=> b!538882 (=> (not res!334091) (not e!312465))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4849 0))(
  ( (MissingZero!4849 (index!21620 (_ BitVec 32))) (Found!4849 (index!21621 (_ BitVec 32))) (Intermediate!4849 (undefined!5661 Bool) (index!21622 (_ BitVec 32)) (x!50536 (_ BitVec 32))) (Undefined!4849) (MissingVacant!4849 (index!21623 (_ BitVec 32))) )
))
(declare-fun lt!247005 () SeekEntryResult!4849)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun lt!247004 () SeekEntryResult!4849)

(declare-datatypes ((array!34104 0))(
  ( (array!34105 (arr!16391 (Array (_ BitVec 32) (_ BitVec 64))) (size!16755 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34104)

(assert (=> b!538882 (= res!334091 (and (= lt!247004 lt!247005) (not (= (select (arr!16391 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16391 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16391 a!3154) index!1177) (select (arr!16391 a!3154) j!147)))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34104 (_ BitVec 32)) SeekEntryResult!4849)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538882 (= lt!247004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16391 a!3154) j!147) mask!3216) (select (arr!16391 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538883 () Bool)

(declare-fun e!312467 () Bool)

(assert (=> b!538883 (= e!312467 e!312468)))

(declare-fun res!334094 () Bool)

(assert (=> b!538883 (=> (not res!334094) (not e!312468))))

(declare-fun lt!247007 () SeekEntryResult!4849)

(assert (=> b!538883 (= res!334094 (= lt!247005 lt!247007))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538883 (= lt!247007 (Intermediate!4849 false resIndex!32 resX!32))))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!538883 (= lt!247005 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16391 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538884 () Bool)

(declare-fun res!334090 () Bool)

(assert (=> b!538884 (=> (not res!334090) (not e!312467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34104 (_ BitVec 32)) Bool)

(assert (=> b!538884 (= res!334090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538885 () Bool)

(declare-fun res!334089 () Bool)

(assert (=> b!538885 (=> (not res!334089) (not e!312467))))

(declare-datatypes ((List!10510 0))(
  ( (Nil!10507) (Cons!10506 (h!11449 (_ BitVec 64)) (t!16738 List!10510)) )
))
(declare-fun arrayNoDuplicates!0 (array!34104 (_ BitVec 32) List!10510) Bool)

(assert (=> b!538885 (= res!334089 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10507))))

(declare-fun b!538886 () Bool)

(declare-fun res!334092 () Bool)

(declare-fun e!312470 () Bool)

(assert (=> b!538886 (=> (not res!334092) (not e!312470))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538886 (= res!334092 (and (= (size!16755 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16755 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16755 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538887 () Bool)

(declare-fun res!334098 () Bool)

(assert (=> b!538887 (=> (not res!334098) (not e!312470))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538887 (= res!334098 (validKeyInArray!0 k!1998))))

(declare-fun b!538888 () Bool)

(assert (=> b!538888 (= e!312470 e!312467)))

(declare-fun res!334100 () Bool)

(assert (=> b!538888 (=> (not res!334100) (not e!312467))))

(declare-fun lt!247008 () SeekEntryResult!4849)

(assert (=> b!538888 (= res!334100 (or (= lt!247008 (MissingZero!4849 i!1153)) (= lt!247008 (MissingVacant!4849 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34104 (_ BitVec 32)) SeekEntryResult!4849)

(assert (=> b!538888 (= lt!247008 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun e!312466 () Bool)

(declare-fun b!538889 () Bool)

(assert (=> b!538889 (= e!312466 (validKeyInArray!0 (select (store (arr!16391 a!3154) i!1153 k!1998) j!147)))))

(declare-fun b!538890 () Bool)

(declare-fun e!312471 () Bool)

(assert (=> b!538890 (= e!312465 e!312471)))

(declare-fun res!334096 () Bool)

(assert (=> b!538890 (=> (not res!334096) (not e!312471))))

(declare-fun lt!247009 () (_ BitVec 32))

(assert (=> b!538890 (= res!334096 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!247009 #b00000000000000000000000000000000) (bvslt lt!247009 (size!16755 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538890 (= lt!247009 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538891 () Bool)

(declare-fun res!334093 () Bool)

(assert (=> b!538891 (=> (not res!334093) (not e!312470))))

(declare-fun arrayContainsKey!0 (array!34104 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538891 (= res!334093 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538892 () Bool)

(declare-fun e!312464 () Bool)

(assert (=> b!538892 (= e!312464 (not e!312466))))

(declare-fun res!334097 () Bool)

(assert (=> b!538892 (=> res!334097 e!312466)))

(assert (=> b!538892 (= res!334097 (or (bvslt mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(assert (=> b!538892 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!247009 (select (store (arr!16391 a!3154) i!1153 k!1998) j!147) (array!34105 (store (arr!16391 a!3154) i!1153 k!1998) (size!16755 a!3154)) mask!3216) lt!247007)))

(declare-datatypes ((Unit!16882 0))(
  ( (Unit!16883) )
))
(declare-fun lt!247006 () Unit!16882)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34104 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16882)

(assert (=> b!538892 (= lt!247006 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!247009 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538893 () Bool)

(declare-fun res!334087 () Bool)

(assert (=> b!538893 (=> (not res!334087) (not e!312470))))

(assert (=> b!538893 (= res!334087 (validKeyInArray!0 (select (arr!16391 a!3154) j!147)))))

(declare-fun res!334099 () Bool)

(assert (=> start!48892 (=> (not res!334099) (not e!312470))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48892 (= res!334099 (validMask!0 mask!3216))))

(assert (=> start!48892 e!312470))

(assert (=> start!48892 true))

(declare-fun array_inv!12187 (array!34104) Bool)

(assert (=> start!48892 (array_inv!12187 a!3154)))

(declare-fun b!538894 () Bool)

(declare-fun res!334095 () Bool)

(assert (=> b!538894 (=> (not res!334095) (not e!312467))))

(assert (=> b!538894 (= res!334095 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16755 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16755 a!3154)) (= (select (arr!16391 a!3154) resIndex!32) (select (arr!16391 a!3154) j!147))))))

(declare-fun b!538895 () Bool)

(assert (=> b!538895 (= e!312471 e!312464)))

(declare-fun res!334088 () Bool)

(assert (=> b!538895 (=> (not res!334088) (not e!312464))))

(declare-fun lt!247003 () SeekEntryResult!4849)

(assert (=> b!538895 (= res!334088 (and (= lt!247003 lt!247007) (= lt!247004 lt!247003)))))

(assert (=> b!538895 (= lt!247003 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!247009 (select (arr!16391 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48892 res!334099) b!538886))

(assert (= (and b!538886 res!334092) b!538893))

(assert (= (and b!538893 res!334087) b!538887))

(assert (= (and b!538887 res!334098) b!538891))

(assert (= (and b!538891 res!334093) b!538888))

(assert (= (and b!538888 res!334100) b!538884))

(assert (= (and b!538884 res!334090) b!538885))

(assert (= (and b!538885 res!334089) b!538894))

(assert (= (and b!538894 res!334095) b!538883))

(assert (= (and b!538883 res!334094) b!538882))

(assert (= (and b!538882 res!334091) b!538890))

(assert (= (and b!538890 res!334096) b!538895))

(assert (= (and b!538895 res!334088) b!538892))

(assert (= (and b!538892 (not res!334097)) b!538889))

(declare-fun m!517989 () Bool)

(assert (=> b!538883 m!517989))

(assert (=> b!538883 m!517989))

(declare-fun m!517991 () Bool)

(assert (=> b!538883 m!517991))

(declare-fun m!517993 () Bool)

(assert (=> b!538884 m!517993))

(assert (=> b!538893 m!517989))

(assert (=> b!538893 m!517989))

(declare-fun m!517995 () Bool)

(assert (=> b!538893 m!517995))

(declare-fun m!517997 () Bool)

(assert (=> b!538892 m!517997))

(declare-fun m!517999 () Bool)

(assert (=> b!538892 m!517999))

(assert (=> b!538892 m!517999))

(declare-fun m!518001 () Bool)

(assert (=> b!538892 m!518001))

(declare-fun m!518003 () Bool)

(assert (=> b!538892 m!518003))

(declare-fun m!518005 () Bool)

(assert (=> b!538888 m!518005))

(declare-fun m!518007 () Bool)

(assert (=> start!48892 m!518007))

(declare-fun m!518009 () Bool)

(assert (=> start!48892 m!518009))

(declare-fun m!518011 () Bool)

(assert (=> b!538891 m!518011))

(assert (=> b!538895 m!517989))

(assert (=> b!538895 m!517989))

(declare-fun m!518013 () Bool)

(assert (=> b!538895 m!518013))

(assert (=> b!538889 m!517997))

(assert (=> b!538889 m!517999))

(assert (=> b!538889 m!517999))

(declare-fun m!518015 () Bool)

(assert (=> b!538889 m!518015))

(declare-fun m!518017 () Bool)

(assert (=> b!538885 m!518017))

(declare-fun m!518019 () Bool)

(assert (=> b!538887 m!518019))

(declare-fun m!518021 () Bool)

(assert (=> b!538890 m!518021))

(declare-fun m!518023 () Bool)

(assert (=> b!538882 m!518023))

(assert (=> b!538882 m!517989))

(assert (=> b!538882 m!517989))

(declare-fun m!518025 () Bool)

(assert (=> b!538882 m!518025))

(assert (=> b!538882 m!518025))

(assert (=> b!538882 m!517989))

(declare-fun m!518027 () Bool)

(assert (=> b!538882 m!518027))

(declare-fun m!518029 () Bool)

(assert (=> b!538894 m!518029))

(assert (=> b!538894 m!517989))

(push 1)

(assert (not b!538889))

(assert (not b!538895))

(assert (not b!538887))

(assert (not b!538891))

(assert (not b!538890))

(assert (not b!538883))

(assert (not b!538882))

(assert (not b!538888))

(assert (not b!538884))

(assert (not b!538892))

(assert (not b!538885))

(assert (not b!538893))

(assert (not start!48892))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

