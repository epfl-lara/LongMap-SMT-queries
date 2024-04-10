; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97286 () Bool)

(assert start!97286)

(declare-fun b_free!23257 () Bool)

(declare-fun b_next!23257 () Bool)

(assert (=> start!97286 (= b_free!23257 (not b_next!23257))))

(declare-fun tp!82069 () Bool)

(declare-fun b_and!37345 () Bool)

(assert (=> start!97286 (= tp!82069 b_and!37345)))

(declare-fun b!1107795 () Bool)

(declare-fun res!739314 () Bool)

(declare-fun e!632022 () Bool)

(assert (=> b!1107795 (=> (not res!739314) (not e!632022))))

(declare-datatypes ((array!71951 0))(
  ( (array!71952 (arr!34628 (Array (_ BitVec 32) (_ BitVec 64))) (size!35164 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71951)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1107795 (= res!739314 (= (select (arr!34628 _keys!1208) i!673) k!934))))

(declare-fun b!1107796 () Bool)

(declare-fun res!739311 () Bool)

(assert (=> b!1107796 (=> (not res!739311) (not e!632022))))

(assert (=> b!1107796 (= res!739311 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35164 _keys!1208))))))

(declare-fun b!1107797 () Bool)

(declare-fun res!739308 () Bool)

(assert (=> b!1107797 (=> (not res!739308) (not e!632022))))

(declare-datatypes ((List!24138 0))(
  ( (Nil!24135) (Cons!24134 (h!25343 (_ BitVec 64)) (t!34441 List!24138)) )
))
(declare-fun arrayNoDuplicates!0 (array!71951 (_ BitVec 32) List!24138) Bool)

(assert (=> b!1107797 (= res!739308 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24135))))

(declare-fun b!1107798 () Bool)

(declare-fun res!739310 () Bool)

(assert (=> b!1107798 (=> (not res!739310) (not e!632022))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71951 (_ BitVec 32)) Bool)

(assert (=> b!1107798 (= res!739310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!739307 () Bool)

(assert (=> start!97286 (=> (not res!739307) (not e!632022))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97286 (= res!739307 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35164 _keys!1208))))))

(assert (=> start!97286 e!632022))

(declare-fun tp_is_empty!27517 () Bool)

(assert (=> start!97286 tp_is_empty!27517))

(declare-fun array_inv!26650 (array!71951) Bool)

(assert (=> start!97286 (array_inv!26650 _keys!1208)))

(assert (=> start!97286 true))

(assert (=> start!97286 tp!82069))

(declare-datatypes ((V!41817 0))(
  ( (V!41818 (val!13815 Int)) )
))
(declare-datatypes ((ValueCell!13049 0))(
  ( (ValueCellFull!13049 (v!16448 V!41817)) (EmptyCell!13049) )
))
(declare-datatypes ((array!71953 0))(
  ( (array!71954 (arr!34629 (Array (_ BitVec 32) ValueCell!13049)) (size!35165 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71953)

(declare-fun e!632024 () Bool)

(declare-fun array_inv!26651 (array!71953) Bool)

(assert (=> start!97286 (and (array_inv!26651 _values!996) e!632024)))

(declare-fun e!632025 () Bool)

(declare-fun b!1107799 () Bool)

(declare-datatypes ((tuple2!17454 0))(
  ( (tuple2!17455 (_1!8738 (_ BitVec 64)) (_2!8738 V!41817)) )
))
(declare-datatypes ((List!24139 0))(
  ( (Nil!24136) (Cons!24135 (h!25344 tuple2!17454) (t!34442 List!24139)) )
))
(declare-datatypes ((ListLongMap!15423 0))(
  ( (ListLongMap!15424 (toList!7727 List!24139)) )
))
(declare-fun call!46468 () ListLongMap!15423)

(declare-fun call!46467 () ListLongMap!15423)

(declare-fun -!1007 (ListLongMap!15423 (_ BitVec 64)) ListLongMap!15423)

(assert (=> b!1107799 (= e!632025 (= call!46467 (-!1007 call!46468 k!934)))))

(declare-fun b!1107800 () Bool)

(declare-fun res!739315 () Bool)

(assert (=> b!1107800 (=> (not res!739315) (not e!632022))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1107800 (= res!739315 (and (= (size!35165 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35164 _keys!1208) (size!35165 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43093 () Bool)

(declare-fun mapRes!43093 () Bool)

(assert (=> mapIsEmpty!43093 mapRes!43093))

(declare-fun b!1107801 () Bool)

(declare-fun e!632023 () Bool)

(assert (=> b!1107801 (= e!632024 (and e!632023 mapRes!43093))))

(declare-fun condMapEmpty!43093 () Bool)

(declare-fun mapDefault!43093 () ValueCell!13049)

