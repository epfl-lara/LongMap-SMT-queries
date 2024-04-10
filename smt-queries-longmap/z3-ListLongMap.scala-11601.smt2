; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135386 () Bool)

(assert start!135386)

(declare-fun b!1573827 () Bool)

(declare-fun res!1075170 () Bool)

(declare-fun e!877657 () Bool)

(assert (=> b!1573827 (=> (not res!1075170) (not e!877657))))

(declare-datatypes ((array!105143 0))(
  ( (array!105144 (arr!50723 (Array (_ BitVec 32) (_ BitVec 64))) (size!51273 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105143)

(declare-fun mask!889 () (_ BitVec 32))

(assert (=> b!1573827 (= res!1075170 (= (size!51273 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1573828 () Bool)

(declare-fun res!1075173 () Bool)

(assert (=> b!1573828 (=> (not res!1075173) (not e!877657))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573828 (= res!1075173 (validKeyInArray!0 k0!754))))

(declare-fun b!1573829 () Bool)

(declare-fun e!877658 () Bool)

(assert (=> b!1573829 (= e!877657 e!877658)))

(declare-fun res!1075171 () Bool)

(assert (=> b!1573829 (=> (not res!1075171) (not e!877658))))

(declare-fun lt!674613 () Bool)

(declare-datatypes ((SeekEntryResult!13636 0))(
  ( (MissingZero!13636 (index!56942 (_ BitVec 32))) (Found!13636 (index!56943 (_ BitVec 32))) (Intermediate!13636 (undefined!14448 Bool) (index!56944 (_ BitVec 32)) (x!141761 (_ BitVec 32))) (Undefined!13636) (MissingVacant!13636 (index!56945 (_ BitVec 32))) )
))
(declare-fun lt!674614 () SeekEntryResult!13636)

(assert (=> b!1573829 (= res!1075171 (and (or lt!674613 (not (undefined!14448 lt!674614))) (or lt!674613 (undefined!14448 lt!674614))))))

(get-info :version)

(assert (=> b!1573829 (= lt!674613 (not ((_ is Intermediate!13636) lt!674614)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105143 (_ BitVec 32)) SeekEntryResult!13636)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573829 (= lt!674614 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1573830 () Bool)

(declare-fun lt!674612 () SeekEntryResult!13636)

(assert (=> b!1573830 (= e!877658 (or ((_ is MissingVacant!13636) lt!674612) (and ((_ is Found!13636) lt!674612) (not (= (select (arr!50723 _keys!600) (index!56943 lt!674612)) k0!754)))))))

(declare-fun err!166 () SeekEntryResult!13636)

(assert (=> b!1573830 (= lt!674612 err!166)))

(assert (=> b!1573830 true))

(declare-fun res!1075172 () Bool)

(assert (=> start!135386 (=> (not res!1075172) (not e!877657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135386 (= res!1075172 (validMask!0 mask!889))))

(assert (=> start!135386 e!877657))

(assert (=> start!135386 true))

(declare-fun array_inv!39450 (array!105143) Bool)

(assert (=> start!135386 (array_inv!39450 _keys!600)))

(assert (= (and start!135386 res!1075172) b!1573827))

(assert (= (and b!1573827 res!1075170) b!1573828))

(assert (= (and b!1573828 res!1075173) b!1573829))

(assert (= (and b!1573829 res!1075171) b!1573830))

(declare-fun m!1447057 () Bool)

(assert (=> b!1573828 m!1447057))

(declare-fun m!1447059 () Bool)

(assert (=> b!1573829 m!1447059))

(assert (=> b!1573829 m!1447059))

(declare-fun m!1447061 () Bool)

(assert (=> b!1573829 m!1447061))

(declare-fun m!1447063 () Bool)

(assert (=> b!1573830 m!1447063))

(declare-fun m!1447065 () Bool)

(assert (=> start!135386 m!1447065))

(declare-fun m!1447067 () Bool)

(assert (=> start!135386 m!1447067))

(check-sat (not b!1573829) (not start!135386) (not b!1573828))
(check-sat)
(get-model)

(declare-fun b!1573888 () Bool)

(declare-fun lt!674638 () SeekEntryResult!13636)

(assert (=> b!1573888 (and (bvsge (index!56944 lt!674638) #b00000000000000000000000000000000) (bvslt (index!56944 lt!674638) (size!51273 _keys!600)))))

(declare-fun res!1075202 () Bool)

(assert (=> b!1573888 (= res!1075202 (= (select (arr!50723 _keys!600) (index!56944 lt!674638)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!877695 () Bool)

(assert (=> b!1573888 (=> res!1075202 e!877695)))

(declare-fun d!165101 () Bool)

(declare-fun e!877697 () Bool)

(assert (=> d!165101 e!877697))

(declare-fun c!145602 () Bool)

(assert (=> d!165101 (= c!145602 (and ((_ is Intermediate!13636) lt!674638) (undefined!14448 lt!674638)))))

(declare-fun e!877693 () SeekEntryResult!13636)

(assert (=> d!165101 (= lt!674638 e!877693)))

(declare-fun c!145601 () Bool)

(assert (=> d!165101 (= c!145601 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674639 () (_ BitVec 64))

(assert (=> d!165101 (= lt!674639 (select (arr!50723 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!165101 (validMask!0 mask!889)))

(assert (=> d!165101 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!674638)))

(declare-fun b!1573889 () Bool)

(declare-fun e!877694 () SeekEntryResult!13636)

(assert (=> b!1573889 (= e!877694 (Intermediate!13636 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573890 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573890 (= e!877694 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1573891 () Bool)

(assert (=> b!1573891 (and (bvsge (index!56944 lt!674638) #b00000000000000000000000000000000) (bvslt (index!56944 lt!674638) (size!51273 _keys!600)))))

(declare-fun res!1075203 () Bool)

(assert (=> b!1573891 (= res!1075203 (= (select (arr!50723 _keys!600) (index!56944 lt!674638)) k0!754))))

(assert (=> b!1573891 (=> res!1075203 e!877695)))

(declare-fun e!877696 () Bool)

(assert (=> b!1573891 (= e!877696 e!877695)))

(declare-fun b!1573892 () Bool)

(assert (=> b!1573892 (and (bvsge (index!56944 lt!674638) #b00000000000000000000000000000000) (bvslt (index!56944 lt!674638) (size!51273 _keys!600)))))

(assert (=> b!1573892 (= e!877695 (= (select (arr!50723 _keys!600) (index!56944 lt!674638)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1573893 () Bool)

(assert (=> b!1573893 (= e!877697 (bvsge (x!141761 lt!674638) #b01111111111111111111111111111110))))

(declare-fun b!1573894 () Bool)

(assert (=> b!1573894 (= e!877693 (Intermediate!13636 true (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun b!1573895 () Bool)

(assert (=> b!1573895 (= e!877693 e!877694)))

(declare-fun c!145600 () Bool)

