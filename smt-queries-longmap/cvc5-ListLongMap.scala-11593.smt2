; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!135140 () Bool)

(assert start!135140)

(declare-fun b!1572888 () Bool)

(declare-fun res!1074699 () Bool)

(declare-fun e!877090 () Bool)

(assert (=> b!1572888 (=> (not res!1074699) (not e!877090))))

(declare-datatypes ((array!105075 0))(
  ( (array!105076 (arr!50698 (Array (_ BitVec 32) (_ BitVec 64))) (size!51248 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105075)

(declare-fun mask!889 () (_ BitVec 32))

(assert (=> b!1572888 (= res!1074699 (= (size!51248 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun res!1074700 () Bool)

(assert (=> start!135140 (=> (not res!1074700) (not e!877090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135140 (= res!1074700 (validMask!0 mask!889))))

(assert (=> start!135140 e!877090))

(assert (=> start!135140 true))

(declare-fun array_inv!39425 (array!105075) Bool)

(assert (=> start!135140 (array_inv!39425 _keys!600)))

(declare-fun b!1572890 () Bool)

(declare-fun e!877091 () Bool)

(assert (=> b!1572890 (= e!877090 e!877091)))

(declare-fun res!1074701 () Bool)

(assert (=> b!1572890 (=> (not res!1074701) (not e!877091))))

(declare-datatypes ((SeekEntryResult!13611 0))(
  ( (MissingZero!13611 (index!56842 (_ BitVec 32))) (Found!13611 (index!56843 (_ BitVec 32))) (Intermediate!13611 (undefined!14423 Bool) (index!56844 (_ BitVec 32)) (x!141627 (_ BitVec 32))) (Undefined!13611) (MissingVacant!13611 (index!56845 (_ BitVec 32))) )
))
(declare-fun lt!674169 () SeekEntryResult!13611)

(declare-fun k!754 () (_ BitVec 64))

(assert (=> b!1572890 (= res!1074701 (and (not (undefined!14423 lt!674169)) (is-Intermediate!13611 lt!674169) (not (= (select (arr!50698 _keys!600) (index!56844 lt!674169)) k!754)) (not (= (select (arr!50698 _keys!600) (index!56844 lt!674169)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50698 _keys!600) (index!56844 lt!674169)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56844 lt!674169) #b00000000000000000000000000000000) (bvslt (index!56844 lt!674169) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105075 (_ BitVec 32)) SeekEntryResult!13611)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572890 (= lt!674169 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!754 mask!889) k!754 _keys!600 mask!889))))

(declare-fun b!1572891 () Bool)

(assert (=> b!1572891 (= e!877091 false)))

(declare-fun lt!674170 () SeekEntryResult!13611)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105075 (_ BitVec 32)) SeekEntryResult!13611)

(assert (=> b!1572891 (= lt!674170 (seekKeyOrZeroReturnVacant!0 (x!141627 lt!674169) (index!56844 lt!674169) (index!56844 lt!674169) k!754 _keys!600 mask!889))))

(declare-fun b!1572889 () Bool)

(declare-fun res!1074702 () Bool)

(assert (=> b!1572889 (=> (not res!1074702) (not e!877090))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572889 (= res!1074702 (validKeyInArray!0 k!754))))

(assert (= (and start!135140 res!1074700) b!1572888))

(assert (= (and b!1572888 res!1074699) b!1572889))

(assert (= (and b!1572889 res!1074702) b!1572890))

(assert (= (and b!1572890 res!1074701) b!1572891))

(declare-fun m!1446523 () Bool)

(assert (=> start!135140 m!1446523))

(declare-fun m!1446525 () Bool)

(assert (=> start!135140 m!1446525))

(declare-fun m!1446527 () Bool)

(assert (=> b!1572890 m!1446527))

(declare-fun m!1446529 () Bool)

(assert (=> b!1572890 m!1446529))

(assert (=> b!1572890 m!1446529))

(declare-fun m!1446531 () Bool)

(assert (=> b!1572890 m!1446531))

(declare-fun m!1446533 () Bool)

(assert (=> b!1572891 m!1446533))

(declare-fun m!1446535 () Bool)

(assert (=> b!1572889 m!1446535))

(push 1)

(assert (not b!1572891))

(assert (not b!1572889))

(assert (not b!1572890))

(assert (not start!135140))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

