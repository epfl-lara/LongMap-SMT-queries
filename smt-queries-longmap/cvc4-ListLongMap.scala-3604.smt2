; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49618 () Bool)

(assert start!49618)

(declare-fun b!546005 () Bool)

(declare-fun e!315582 () Bool)

(declare-fun e!315578 () Bool)

(assert (=> b!546005 (= e!315582 e!315578)))

(declare-fun res!339934 () Bool)

(assert (=> b!546005 (=> (not res!339934) (not e!315578))))

(declare-datatypes ((SeekEntryResult!5002 0))(
  ( (MissingZero!5002 (index!22232 (_ BitVec 32))) (Found!5002 (index!22233 (_ BitVec 32))) (Intermediate!5002 (undefined!5814 Bool) (index!22234 (_ BitVec 32)) (x!51154 (_ BitVec 32))) (Undefined!5002) (MissingVacant!5002 (index!22235 (_ BitVec 32))) )
))
(declare-fun lt!249122 () SeekEntryResult!5002)

(declare-fun lt!249120 () SeekEntryResult!5002)

(declare-fun lt!249123 () SeekEntryResult!5002)

(assert (=> b!546005 (= res!339934 (and (= lt!249120 lt!249123) (= lt!249122 lt!249120)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34431 0))(
  ( (array!34432 (arr!16544 (Array (_ BitVec 32) (_ BitVec 64))) (size!16908 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34431)

(declare-fun lt!249119 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34431 (_ BitVec 32)) SeekEntryResult!5002)

(assert (=> b!546005 (= lt!249120 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249119 (select (arr!16544 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546006 () Bool)

(declare-fun res!339943 () Bool)

(declare-fun e!315580 () Bool)

(assert (=> b!546006 (=> (not res!339943) (not e!315580))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!546006 (= res!339943 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16908 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16908 a!3154)) (= (select (arr!16544 a!3154) resIndex!32) (select (arr!16544 a!3154) j!147))))))

(declare-fun b!546007 () Bool)

(declare-fun res!339937 () Bool)

(declare-fun e!315579 () Bool)

(assert (=> b!546007 (=> (not res!339937) (not e!315579))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!546007 (= res!339937 (validKeyInArray!0 k!1998))))

(declare-fun b!546008 () Bool)

(declare-fun res!339938 () Bool)

(assert (=> b!546008 (=> (not res!339938) (not e!315580))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34431 (_ BitVec 32)) Bool)

(assert (=> b!546008 (= res!339938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!546009 () Bool)

(declare-fun e!315576 () Bool)

(assert (=> b!546009 (= e!315576 e!315582)))

(declare-fun res!339939 () Bool)

(assert (=> b!546009 (=> (not res!339939) (not e!315582))))

(assert (=> b!546009 (= res!339939 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!249119 #b00000000000000000000000000000000) (bvslt lt!249119 (size!16908 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!546009 (= lt!249119 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!546010 () Bool)

(declare-fun res!339933 () Bool)

(assert (=> b!546010 (=> (not res!339933) (not e!315579))))

(assert (=> b!546010 (= res!339933 (validKeyInArray!0 (select (arr!16544 a!3154) j!147)))))

(declare-fun b!546011 () Bool)

(declare-fun res!339944 () Bool)

(assert (=> b!546011 (=> (not res!339944) (not e!315579))))

(declare-fun arrayContainsKey!0 (array!34431 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!546011 (= res!339944 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!546012 () Bool)

(declare-fun e!315577 () Bool)

(assert (=> b!546012 (= e!315577 e!315576)))

(declare-fun res!339935 () Bool)

(assert (=> b!546012 (=> (not res!339935) (not e!315576))))

(declare-fun lt!249121 () SeekEntryResult!5002)

(assert (=> b!546012 (= res!339935 (and (= lt!249122 lt!249121) (not (= (select (arr!16544 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16544 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16544 a!3154) index!1177) (select (arr!16544 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!546012 (= lt!249122 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16544 a!3154) j!147) mask!3216) (select (arr!16544 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!339942 () Bool)

(assert (=> start!49618 (=> (not res!339942) (not e!315579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49618 (= res!339942 (validMask!0 mask!3216))))

(assert (=> start!49618 e!315579))

(assert (=> start!49618 true))

(declare-fun array_inv!12340 (array!34431) Bool)

(assert (=> start!49618 (array_inv!12340 a!3154)))

(declare-fun b!546013 () Bool)

(assert (=> b!546013 (= e!315578 (not true))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!546013 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249119 (select (store (arr!16544 a!3154) i!1153 k!1998) j!147) (array!34432 (store (arr!16544 a!3154) i!1153 k!1998) (size!16908 a!3154)) mask!3216) lt!249123)))

(declare-datatypes ((Unit!16938 0))(
  ( (Unit!16939) )
))
(declare-fun lt!249118 () Unit!16938)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34431 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16938)

(assert (=> b!546013 (= lt!249118 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k!1998 j!147 lt!249119 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!546014 () Bool)

(assert (=> b!546014 (= e!315580 e!315577)))

(declare-fun res!339941 () Bool)

(assert (=> b!546014 (=> (not res!339941) (not e!315577))))

(assert (=> b!546014 (= res!339941 (= lt!249121 lt!249123))))

(assert (=> b!546014 (= lt!249123 (Intermediate!5002 false resIndex!32 resX!32))))

(assert (=> b!546014 (= lt!249121 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16544 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!546015 () Bool)

(declare-fun res!339932 () Bool)

(assert (=> b!546015 (=> (not res!339932) (not e!315579))))

(assert (=> b!546015 (= res!339932 (and (= (size!16908 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16908 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16908 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!546016 () Bool)

(declare-fun res!339936 () Bool)

(assert (=> b!546016 (=> (not res!339936) (not e!315580))))

(declare-datatypes ((List!10663 0))(
  ( (Nil!10660) (Cons!10659 (h!11623 (_ BitVec 64)) (t!16891 List!10663)) )
))
(declare-fun arrayNoDuplicates!0 (array!34431 (_ BitVec 32) List!10663) Bool)

(assert (=> b!546016 (= res!339936 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10660))))

(declare-fun b!546017 () Bool)

(assert (=> b!546017 (= e!315579 e!315580)))

(declare-fun res!339940 () Bool)

(assert (=> b!546017 (=> (not res!339940) (not e!315580))))

(declare-fun lt!249124 () SeekEntryResult!5002)

(assert (=> b!546017 (= res!339940 (or (= lt!249124 (MissingZero!5002 i!1153)) (= lt!249124 (MissingVacant!5002 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34431 (_ BitVec 32)) SeekEntryResult!5002)

(assert (=> b!546017 (= lt!249124 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!49618 res!339942) b!546015))

(assert (= (and b!546015 res!339932) b!546010))

(assert (= (and b!546010 res!339933) b!546007))

(assert (= (and b!546007 res!339937) b!546011))

(assert (= (and b!546011 res!339944) b!546017))

(assert (= (and b!546017 res!339940) b!546008))

(assert (= (and b!546008 res!339938) b!546016))

(assert (= (and b!546016 res!339936) b!546006))

(assert (= (and b!546006 res!339943) b!546014))

(assert (= (and b!546014 res!339941) b!546012))

(assert (= (and b!546012 res!339935) b!546009))

(assert (= (and b!546009 res!339939) b!546005))

(assert (= (and b!546005 res!339934) b!546013))

(declare-fun m!523553 () Bool)

(assert (=> b!546013 m!523553))

(declare-fun m!523555 () Bool)

(assert (=> b!546013 m!523555))

(assert (=> b!546013 m!523555))

(declare-fun m!523557 () Bool)

(assert (=> b!546013 m!523557))

(declare-fun m!523559 () Bool)

(assert (=> b!546013 m!523559))

(declare-fun m!523561 () Bool)

(assert (=> b!546016 m!523561))

(declare-fun m!523563 () Bool)

(assert (=> b!546005 m!523563))

(assert (=> b!546005 m!523563))

(declare-fun m!523565 () Bool)

(assert (=> b!546005 m!523565))

(declare-fun m!523567 () Bool)

(assert (=> b!546007 m!523567))

(declare-fun m!523569 () Bool)

(assert (=> start!49618 m!523569))

(declare-fun m!523571 () Bool)

(assert (=> start!49618 m!523571))

(declare-fun m!523573 () Bool)

(assert (=> b!546006 m!523573))

(assert (=> b!546006 m!523563))

(declare-fun m!523575 () Bool)

(assert (=> b!546008 m!523575))

(declare-fun m!523577 () Bool)

(assert (=> b!546011 m!523577))

(declare-fun m!523579 () Bool)

(assert (=> b!546017 m!523579))

(declare-fun m!523581 () Bool)

(assert (=> b!546012 m!523581))

(assert (=> b!546012 m!523563))

(assert (=> b!546012 m!523563))

(declare-fun m!523583 () Bool)

(assert (=> b!546012 m!523583))

(assert (=> b!546012 m!523583))

(assert (=> b!546012 m!523563))

(declare-fun m!523585 () Bool)

(assert (=> b!546012 m!523585))

(assert (=> b!546014 m!523563))

(assert (=> b!546014 m!523563))

(declare-fun m!523587 () Bool)

(assert (=> b!546014 m!523587))

(assert (=> b!546010 m!523563))

(assert (=> b!546010 m!523563))

(declare-fun m!523589 () Bool)

(assert (=> b!546010 m!523589))

(declare-fun m!523591 () Bool)

(assert (=> b!546009 m!523591))

(push 1)

(assert (not b!546012))

(assert (not b!546016))

