; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99898 () Bool)

(assert start!99898)

(declare-fun b_free!25477 () Bool)

(declare-fun b_next!25477 () Bool)

(assert (=> start!99898 (= b_free!25477 (not b_next!25477))))

(declare-fun tp!89144 () Bool)

(declare-fun b_and!41821 () Bool)

(assert (=> start!99898 (= tp!89144 b_and!41821)))

(declare-fun b!1188883 () Bool)

(declare-fun e!675964 () Bool)

(declare-fun tp_is_empty!30007 () Bool)

(assert (=> b!1188883 (= e!675964 tp_is_empty!30007)))

(declare-fun b!1188884 () Bool)

(declare-fun res!790520 () Bool)

(declare-fun e!675963 () Bool)

(assert (=> b!1188884 (=> (not res!790520) (not e!675963))))

(declare-datatypes ((array!76809 0))(
  ( (array!76810 (arr!37054 (Array (_ BitVec 32) (_ BitVec 64))) (size!37590 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76809)

(declare-datatypes ((List!26084 0))(
  ( (Nil!26081) (Cons!26080 (h!27289 (_ BitVec 64)) (t!38553 List!26084)) )
))
(declare-fun arrayNoDuplicates!0 (array!76809 (_ BitVec 32) List!26084) Bool)

(assert (=> b!1188884 (= res!790520 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26081))))

(declare-fun b!1188885 () Bool)

(declare-fun res!790522 () Bool)

(assert (=> b!1188885 (=> (not res!790522) (not e!675963))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45137 0))(
  ( (V!45138 (val!15060 Int)) )
))
(declare-datatypes ((ValueCell!14294 0))(
  ( (ValueCellFull!14294 (v!17698 V!45137)) (EmptyCell!14294) )
))
(declare-datatypes ((array!76811 0))(
  ( (array!76812 (arr!37055 (Array (_ BitVec 32) ValueCell!14294)) (size!37591 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76811)

(assert (=> b!1188885 (= res!790522 (and (= (size!37591 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37590 _keys!1208) (size!37591 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1188886 () Bool)

(declare-fun e!675965 () Bool)

(assert (=> b!1188886 (= e!675963 e!675965)))

(declare-fun res!790528 () Bool)

(assert (=> b!1188886 (=> (not res!790528) (not e!675965))))

(declare-fun lt!540853 () array!76809)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76809 (_ BitVec 32)) Bool)

(assert (=> b!1188886 (= res!790528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540853 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1188886 (= lt!540853 (array!76810 (store (arr!37054 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37590 _keys!1208)))))

(declare-fun b!1188887 () Bool)

(declare-fun res!790530 () Bool)

(assert (=> b!1188887 (=> (not res!790530) (not e!675965))))

(assert (=> b!1188887 (= res!790530 (arrayNoDuplicates!0 lt!540853 #b00000000000000000000000000000000 Nil!26081))))

(declare-fun b!1188888 () Bool)

(declare-fun e!675967 () Bool)

(declare-fun mapRes!46838 () Bool)

(assert (=> b!1188888 (= e!675967 (and e!675964 mapRes!46838))))

(declare-fun condMapEmpty!46838 () Bool)

(declare-fun mapDefault!46838 () ValueCell!14294)

