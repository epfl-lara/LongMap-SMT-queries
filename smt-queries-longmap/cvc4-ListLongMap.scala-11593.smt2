; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135144 () Bool)

(assert start!135144)

(declare-fun b!1572914 () Bool)

(declare-fun e!877108 () Bool)

(declare-fun e!877107 () Bool)

(assert (=> b!1572914 (= e!877108 e!877107)))

(declare-fun res!1074726 () Bool)

(assert (=> b!1572914 (=> (not res!1074726) (not e!877107))))

(declare-datatypes ((SeekEntryResult!13613 0))(
  ( (MissingZero!13613 (index!56850 (_ BitVec 32))) (Found!13613 (index!56851 (_ BitVec 32))) (Intermediate!13613 (undefined!14425 Bool) (index!56852 (_ BitVec 32)) (x!141629 (_ BitVec 32))) (Undefined!13613) (MissingVacant!13613 (index!56853 (_ BitVec 32))) )
))
(declare-fun lt!674181 () SeekEntryResult!13613)

(declare-fun mask!889 () (_ BitVec 32))

(declare-datatypes ((array!105079 0))(
  ( (array!105080 (arr!50700 (Array (_ BitVec 32) (_ BitVec 64))) (size!51250 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105079)

(declare-fun k!754 () (_ BitVec 64))

(assert (=> b!1572914 (= res!1074726 (and (not (undefined!14425 lt!674181)) (is-Intermediate!13613 lt!674181) (not (= (select (arr!50700 _keys!600) (index!56852 lt!674181)) k!754)) (not (= (select (arr!50700 _keys!600) (index!56852 lt!674181)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50700 _keys!600) (index!56852 lt!674181)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56852 lt!674181) #b00000000000000000000000000000000) (bvslt (index!56852 lt!674181) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105079 (_ BitVec 32)) SeekEntryResult!13613)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572914 (= lt!674181 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1572913 () Bool)

(declare-fun res!1074723 () Bool)

(assert (=> b!1572913 (=> (not res!1074723) (not e!877108))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572913 (= res!1074723 (validKeyInArray!0 k!754))))

(declare-fun b!1572912 () Bool)

(declare-fun res!1074724 () Bool)

(assert (=> b!1572912 (=> (not res!1074724) (not e!877108))))

(assert (=> b!1572912 (= res!1074724 (= (size!51250 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572915 () Bool)

(assert (=> b!1572915 (= e!877107 false)))

(declare-fun lt!674182 () SeekEntryResult!13613)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105079 (_ BitVec 32)) SeekEntryResult!13613)

(assert (=> b!1572915 (= lt!674182 (seekKeyOrZeroReturnVacant!0 (x!141629 lt!674181) (index!56852 lt!674181) (index!56852 lt!674181) k!754 _keys!600 mask!889))))

(declare-fun res!1074725 () Bool)

(assert (=> start!135144 (=> (not res!1074725) (not e!877108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135144 (= res!1074725 (validMask!0 mask!889))))

(assert (=> start!135144 e!877108))

(assert (=> start!135144 true))

(declare-fun array_inv!39427 (array!105079) Bool)

(assert (=> start!135144 (array_inv!39427 _keys!600)))

(assert (= (and start!135144 res!1074725) b!1572912))

(assert (= (and b!1572912 res!1074724) b!1572913))

(assert (= (and b!1572913 res!1074723) b!1572914))

(assert (= (and b!1572914 res!1074726) b!1572915))

(declare-fun m!1446551 () Bool)

(assert (=> b!1572914 m!1446551))

(declare-fun m!1446553 () Bool)

(assert (=> b!1572914 m!1446553))

(assert (=> b!1572914 m!1446553))

(declare-fun m!1446555 () Bool)

(assert (=> b!1572914 m!1446555))

(declare-fun m!1446557 () Bool)

(assert (=> b!1572913 m!1446557))

(declare-fun m!1446559 () Bool)

(assert (=> b!1572915 m!1446559))

(declare-fun m!1446561 () Bool)

(assert (=> start!135144 m!1446561))

(declare-fun m!1446563 () Bool)

(assert (=> start!135144 m!1446563))

(push 1)

(assert (not b!1572915))

(assert (not b!1572913))

(assert (not b!1572914))

(assert (not start!135144))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

