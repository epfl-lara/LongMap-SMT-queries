; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136018 () Bool)

(assert start!136018)

(declare-fun b!1575955 () Bool)

(declare-fun res!1076789 () Bool)

(declare-fun e!878998 () Bool)

(assert (=> b!1575955 (=> (not res!1076789) (not e!878998))))

(declare-fun k!761 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1575955 (= res!1076789 (validKeyInArray!0 k!761))))

(declare-fun b!1575956 () Bool)

(declare-fun e!878999 () Bool)

(assert (=> b!1575956 (= e!878998 e!878999)))

(declare-fun res!1076790 () Bool)

(assert (=> b!1575956 (=> (not res!1076790) (not e!878999))))

(declare-datatypes ((array!105463 0))(
  ( (array!105464 (arr!50865 (Array (_ BitVec 32) (_ BitVec 64))) (size!51415 (_ BitVec 32))) )
))
(declare-fun _keys!605 () array!105463)

(declare-fun mask!898 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13730 0))(
  ( (MissingZero!13730 (index!57318 (_ BitVec 32))) (Found!13730 (index!57319 (_ BitVec 32))) (Intermediate!13730 (undefined!14542 Bool) (index!57320 (_ BitVec 32)) (x!142291 (_ BitVec 32))) (Undefined!13730) (MissingVacant!13730 (index!57321 (_ BitVec 32))) )
))
(declare-fun lt!675405 () SeekEntryResult!13730)

(assert (=> b!1575956 (= res!1076790 (and (not (undefined!14542 lt!675405)) (is-Intermediate!13730 lt!675405) (not (= (select (arr!50865 _keys!605) (index!57320 lt!675405)) k!761)) (not (= (select (arr!50865 _keys!605) (index!57320 lt!675405)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50865 _keys!605) (index!57320 lt!675405)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!57320 lt!675405) #b00000000000000000000000000000000) (bvslt (index!57320 lt!675405) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105463 (_ BitVec 32)) SeekEntryResult!13730)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1575956 (= lt!675405 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!761 mask!898) k!761 _keys!605 mask!898))))

(declare-fun b!1575954 () Bool)

(declare-fun res!1076788 () Bool)

(assert (=> b!1575954 (=> (not res!1076788) (not e!878998))))

(assert (=> b!1575954 (= res!1076788 (and (bvsge mask!898 #b00000000000000000000000000000000) (= (size!51415 _keys!605) (bvadd #b00000000000000000000000000000001 mask!898))))))

(declare-fun res!1076787 () Bool)

(assert (=> start!136018 (=> (not res!1076787) (not e!878998))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136018 (= res!1076787 (validMask!0 mask!898))))

(assert (=> start!136018 e!878998))

(assert (=> start!136018 true))

(declare-fun array_inv!39592 (array!105463) Bool)

(assert (=> start!136018 (array_inv!39592 _keys!605)))

(declare-fun b!1575957 () Bool)

(declare-fun lt!675406 () SeekEntryResult!13730)

(assert (=> b!1575957 (= e!878999 (and (not (is-Undefined!13730 lt!675406)) (not (is-Found!13730 lt!675406)) (is-MissingZero!13730 lt!675406) (or (bvslt (index!57318 lt!675406) #b00000000000000000000000000000000) (bvsge (index!57318 lt!675406) (size!51415 _keys!605)))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105463 (_ BitVec 32)) SeekEntryResult!13730)

(assert (=> b!1575957 (= lt!675406 (seekKeyOrZeroReturnVacant!0 (x!142291 lt!675405) (index!57320 lt!675405) (index!57320 lt!675405) k!761 _keys!605 mask!898))))

(assert (= (and start!136018 res!1076787) b!1575954))

(assert (= (and b!1575954 res!1076788) b!1575955))

(assert (= (and b!1575955 res!1076789) b!1575956))

(assert (= (and b!1575956 res!1076790) b!1575957))

(declare-fun m!1448807 () Bool)

(assert (=> b!1575955 m!1448807))

(declare-fun m!1448809 () Bool)

(assert (=> b!1575956 m!1448809))

(declare-fun m!1448811 () Bool)

(assert (=> b!1575956 m!1448811))

(assert (=> b!1575956 m!1448811))

(declare-fun m!1448813 () Bool)

(assert (=> b!1575956 m!1448813))

(declare-fun m!1448815 () Bool)

(assert (=> start!136018 m!1448815))

(declare-fun m!1448817 () Bool)

(assert (=> start!136018 m!1448817))

(declare-fun m!1448819 () Bool)

(assert (=> b!1575957 m!1448819))

(push 1)

(assert (not b!1575957))

(assert (not b!1575956))

(assert (not b!1575955))

(assert (not start!136018))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

