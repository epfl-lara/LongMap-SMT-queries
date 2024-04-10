; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134856 () Bool)

(assert start!134856)

(declare-fun res!1074040 () Bool)

(declare-fun e!876497 () Bool)

(assert (=> start!134856 (=> (not res!1074040) (not e!876497))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134856 (= res!1074040 (validMask!0 mask!889))))

(assert (=> start!134856 e!876497))

(assert (=> start!134856 true))

(declare-datatypes ((array!104953 0))(
  ( (array!104954 (arr!50646 (Array (_ BitVec 32) (_ BitVec 64))) (size!51196 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104953)

(declare-fun array_inv!39373 (array!104953) Bool)

(assert (=> start!134856 (array_inv!39373 _keys!600)))

(declare-fun b!1571923 () Bool)

(declare-fun res!1074041 () Bool)

(assert (=> b!1571923 (=> (not res!1074041) (not e!876497))))

(assert (=> b!1571923 (= res!1074041 (= (size!51196 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1571924 () Bool)

(declare-fun res!1074042 () Bool)

(assert (=> b!1571924 (=> (not res!1074042) (not e!876497))))

(declare-fun k!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1571924 (= res!1074042 (validKeyInArray!0 k!754))))

(declare-fun b!1571925 () Bool)

(declare-datatypes ((SeekEntryResult!13559 0))(
  ( (MissingZero!13559 (index!56634 (_ BitVec 32))) (Found!13559 (index!56635 (_ BitVec 32))) (Intermediate!13559 (undefined!14371 Bool) (index!56636 (_ BitVec 32)) (x!141395 (_ BitVec 32))) (Undefined!13559) (MissingVacant!13559 (index!56637 (_ BitVec 32))) )
))
(declare-fun lt!673786 () SeekEntryResult!13559)

(assert (=> b!1571925 (= e!876497 (and (is-Intermediate!13559 lt!673786) (not (undefined!14371 lt!673786)) (not (= (select (arr!50646 _keys!600) (index!56636 lt!673786)) k!754)) (not (= (select (arr!50646 _keys!600) (index!56636 lt!673786)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50646 _keys!600) (index!56636 lt!673786)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56636 lt!673786) #b00000000000000000000000000000000) (bvslt (index!56636 lt!673786) (bvadd #b00000000000000000000000000000001 mask!889)) (bvsge mask!889 #b00000000000000000000000000000000) (or (bvsgt (x!141395 lt!673786) #b01111111111111111111111111111110) (bvslt (x!141395 lt!673786) #b00000000000000000000000000000000))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104953 (_ BitVec 32)) SeekEntryResult!13559)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1571925 (= lt!673786 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(assert (= (and start!134856 res!1074040) b!1571923))

(assert (= (and b!1571923 res!1074041) b!1571924))

(assert (= (and b!1571924 res!1074042) b!1571925))

(declare-fun m!1445821 () Bool)

(assert (=> start!134856 m!1445821))

(declare-fun m!1445823 () Bool)

(assert (=> start!134856 m!1445823))

(declare-fun m!1445825 () Bool)

(assert (=> b!1571924 m!1445825))

(declare-fun m!1445827 () Bool)

(assert (=> b!1571925 m!1445827))

(declare-fun m!1445829 () Bool)

(assert (=> b!1571925 m!1445829))

(assert (=> b!1571925 m!1445829))

(declare-fun m!1445831 () Bool)

(assert (=> b!1571925 m!1445831))

(push 1)

(assert (not b!1571924))

(assert (not b!1571925))

(assert (not start!134856))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!164681 () Bool)

(assert (=> d!164681 (= (validKeyInArray!0 k!754) (and (not (= k!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1571924 d!164681))

(declare-fun b!1571998 () Bool)

(declare-fun e!876541 () Bool)

(declare-fun lt!673815 () SeekEntryResult!13559)

(assert (=> b!1571998 (= e!876541 (bvsge (x!141395 lt!673815) #b01111111111111111111111111111110))))

(declare-fun b!1571999 () Bool)

(assert (=> b!1571999 (and (bvsge (index!56636 lt!673815) #b00000000000000000000000000000000) (bvslt (index!56636 lt!673815) (size!51196 _keys!600)))))

(declare-fun e!876540 () Bool)

(assert (=> b!1571999 (= e!876540 (= (select (arr!50646 _keys!600) (index!56636 lt!673815)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1572000 () Bool)

(declare-fun e!876542 () SeekEntryResult!13559)

(declare-fun e!876538 () SeekEntryResult!13559)

(assert (=> b!1572000 (= e!876542 e!876538)))

(declare-fun c!145206 () Bool)

(declare-fun lt!673816 () (_ BitVec 64))

(assert (=> b!1572000 (= c!145206 (or (= lt!673816 k!754) (= (bvadd lt!673816 lt!673816) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1572001 () Bool)

(assert (=> b!1572001 (and (bvsge (index!56636 lt!673815) #b00000000000000000000000000000000) (bvslt (index!56636 lt!673815) (size!51196 _keys!600)))))

(declare-fun res!1074070 () Bool)

(assert (=> b!1572001 (= res!1074070 (= (select (arr!50646 _keys!600) (index!56636 lt!673815)) k!754))))

(assert (=> b!1572001 (=> res!1074070 e!876540)))

(declare-fun e!876539 () Bool)

(assert (=> b!1572001 (= e!876539 e!876540)))

(declare-fun d!164683 () Bool)

(assert (=> d!164683 e!876541))

(declare-fun c!145205 () Bool)

(assert (=> d!164683 (= c!145205 (and (is-Intermediate!13559 lt!673815) (undefined!14371 lt!673815)))))

(assert (=> d!164683 (= lt!673815 e!876542)))

(declare-fun c!145204 () Bool)

(assert (=> d!164683 (= c!145204 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!164683 (= lt!673816 (select (arr!50646 _keys!600) (toIndex!0 k!754 mask!889)))))

(assert (=> d!164683 (validMask!0 mask!889)))

(assert (=> d!164683 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889) lt!673815)))

(declare-fun b!1572002 () Bool)

(assert (=> b!1572002 (= e!876541 e!876539)))

(declare-fun res!1074069 () Bool)

(assert (=> b!1572002 (= res!1074069 (and (is-Intermediate!13559 lt!673815) (not (undefined!14371 lt!673815)) (bvslt (x!141395 lt!673815) #b01111111111111111111111111111110) (bvsge (x!141395 lt!673815) #b00000000000000000000000000000000) (bvsge (x!141395 lt!673815) #b00000000000000000000000000000000)))))

(assert (=> b!1572002 (=> (not res!1074069) (not e!876539))))

(declare-fun b!1572003 () Bool)

(assert (=> b!1572003 (= e!876538 (Intermediate!13559 false (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572004 () Bool)

(assert (=> b!1572004 (= e!876542 (Intermediate!13559 true (toIndex!0 k!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1572005 () Bool)

(assert (=> b!1572005 (and (bvsge (index!56636 lt!673815) #b00000000000000000000000000000000) (bvslt (index!56636 lt!673815) (size!51196 _keys!600)))))

(declare-fun res!1074071 () Bool)

(assert (=> b!1572005 (= res!1074071 (= (select (arr!50646 _keys!600) (index!56636 lt!673815)) #b0000000000000000000000000000000000000000000000000000000000000000))))

