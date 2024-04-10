; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136014 () Bool)

(assert start!136014)

(declare-fun b!1575930 () Bool)

(declare-fun res!1076766 () Bool)

(declare-fun e!878980 () Bool)

(assert (=> b!1575930 (=> (not res!1076766) (not e!878980))))

(declare-fun mask!898 () (_ BitVec 32))

(declare-datatypes ((array!105459 0))(
  ( (array!105460 (arr!50863 (Array (_ BitVec 32) (_ BitVec 64))) (size!51413 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105459)

(assert (=> b!1575930 (= res!1076766 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51413 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun b!1575931 () Bool)

(declare-fun res!1076765 () Bool)

(assert (=> b!1575931 (=> (not res!1076765) (not e!878980))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575931 (= res!1076765 (validKeyInArray!0 k!761))))

(declare-fun res!1076764 () Bool)

(assert (=> start!136014 (=> (not res!1076764) (not e!878980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136014 (= res!1076764 (validMask!0 mask!898))))

(assert (=> start!136014 e!878980))

(assert (=> start!136014 true))

(declare-fun array_inv!39590 (array!105459) Bool)

(assert (=> start!136014 (array_inv!39590 _keys!605)))

(declare-fun b!1575933 () Bool)

(declare-fun e!878981 () Bool)

(declare-datatypes ((SeekEntryResult!13728 0))(
  ( (MissingZero!13728 (index!57310 (_ BitVec 32))) (Found!13728 (index!57311 (_ BitVec 32))) (Intermediate!13728 (undefined!14540 Bool) (index!57312 (_ BitVec 32)) (x!142289 (_ BitVec 32))) (Undefined!13728) (MissingVacant!13728 (index!57313 (_ BitVec 32))) )
))
(declare-fun lt!675394 () SeekEntryResult!13728)

(assert (=> b!1575933 (= e!878981 (and (not (is-Undefined!13728 lt!675394)) (not (is-Found!13728 lt!675394)) (is-MissingZero!13728 lt!675394) (or (bvslt (index!57310 lt!675394) #b00000000000000000000000000000000) (bvsge (index!57310 lt!675394) (size!51413 _keys!605)))))))

(declare-fun lt!675393 () SeekEntryResult!13728)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105459 (_ BitVec 32)) SeekEntryResult!13728)

(assert (=> b!1575933 (= lt!675394 (seekKeyOrZeroReturnVacant!0 (x!142289 lt!675393) (index!57312 lt!675393) (index!57312 lt!675393) k!761 _keys!605 mask!898))))

(declare-fun b!1575932 () Bool)

(assert (=> b!1575932 (= e!878980 e!878981)))

(declare-fun res!1076763 () Bool)

(assert (=> b!1575932 (=> (not res!1076763) (not e!878981))))

(assert (=> b!1575932 (= res!1076763 (and (not (undefined!14540 lt!675393)) (is-Intermediate!13728 lt!675393) (not (= (select (arr!50863 _keys!605) (index!57312 lt!675393)) k!761)) (not (= (select (arr!50863 _keys!605) (index!57312 lt!675393)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50863 _keys!605) (index!57312 lt!675393)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57312 lt!675393) #b00000000000000000000000000000000) (bvslt (index!57312 lt!675393) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105459 (_ BitVec 32)) SeekEntryResult!13728)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575932 (= lt!675393 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(assert (= (and start!136014 res!1076764) b!1575930))

(assert (= (and b!1575930 res!1076766) b!1575931))

(assert (= (and b!1575931 res!1076765) b!1575932))

(assert (= (and b!1575932 res!1076763) b!1575933))

(declare-fun m!1448779 () Bool)

(assert (=> b!1575931 m!1448779))

(declare-fun m!1448781 () Bool)

(assert (=> start!136014 m!1448781))

(declare-fun m!1448783 () Bool)

(assert (=> start!136014 m!1448783))

(declare-fun m!1448785 () Bool)

(assert (=> b!1575933 m!1448785))

(declare-fun m!1448787 () Bool)

(assert (=> b!1575932 m!1448787))

(declare-fun m!1448789 () Bool)

(assert (=> b!1575932 m!1448789))

(assert (=> b!1575932 m!1448789))

(declare-fun m!1448791 () Bool)

(assert (=> b!1575932 m!1448791))

(push 1)

(assert (not b!1575933))

(assert (not b!1575932))

(assert (not b!1575931))

(assert (not start!136014))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165545 () Bool)

(declare-fun lt!675423 () SeekEntryResult!13728)

(assert (=> d!165545 (and (or (is-Undefined!13728 lt!675423) (not (is-Found!13728 lt!675423)) (and (bvsge (index!57311 lt!675423) #b00000000000000000000000000000000) (bvslt (index!57311 lt!675423) (size!51413 _keys!605)))) (or (is-Undefined!13728 lt!675423) (is-Found!13728 lt!675423) (not (is-MissingVacant!13728 lt!675423)) (not (= (index!57313 lt!675423) (index!57312 lt!675393))) (and (bvsge (index!57313 lt!675423) #b00000000000000000000000000000000) (bvslt (index!57313 lt!675423) (size!51413 _keys!605)))) (or (is-Undefined!13728 lt!675423) (ite (is-Found!13728 lt!675423) (= (select (arr!50863 _keys!605) (index!57311 lt!675423)) k!761) (and (is-MissingVacant!13728 lt!675423) (= (index!57313 lt!675423) (index!57312 lt!675393)) (= (select (arr!50863 _keys!605) (index!57313 lt!675423)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!879022 () SeekEntryResult!13728)

(assert (=> d!165545 (= lt!675423 e!879022)))

(declare-fun c!145872 () Bool)

(assert (=> d!165545 (= c!145872 (bvsge (x!142289 lt!675393) #b01111111111111111111111111111110))))

(declare-fun lt!675424 () (_ BitVec 64))

(assert (=> d!165545 (= lt!675424 (select (arr!50863 _keys!605) (index!57312 lt!675393)))))

(assert (=> d!165545 (validMask!0 mask!898)))

