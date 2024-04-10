; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99638 () Bool)

(assert start!99638)

(declare-fun b_free!25217 () Bool)

(declare-fun b_next!25217 () Bool)

(assert (=> start!99638 (= b_free!25217 (not b_next!25217))))

(declare-fun tp!88365 () Bool)

(declare-fun b_and!41301 () Bool)

(assert (=> start!99638 (= tp!88365 b_and!41301)))

(declare-fun b!1180958 () Bool)

(declare-fun res!784730 () Bool)

(declare-fun e!671413 () Bool)

(assert (=> b!1180958 (=> (not res!784730) (not e!671413))))

(declare-datatypes ((array!76297 0))(
  ( (array!76298 (arr!36798 (Array (_ BitVec 32) (_ BitVec 64))) (size!37334 (_ BitVec 32))) )
))
(declare-fun lt!534061 () array!76297)

(declare-datatypes ((List!25862 0))(
  ( (Nil!25859) (Cons!25858 (h!27067 (_ BitVec 64)) (t!38071 List!25862)) )
))
(declare-fun arrayNoDuplicates!0 (array!76297 (_ BitVec 32) List!25862) Bool)

(assert (=> b!1180958 (= res!784730 (arrayNoDuplicates!0 lt!534061 #b00000000000000000000000000000000 Nil!25859))))

(declare-fun b!1180959 () Bool)

(declare-fun res!784742 () Bool)

(declare-fun e!671412 () Bool)

(assert (=> b!1180959 (=> (not res!784742) (not e!671412))))

(declare-fun _keys!1208 () array!76297)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76297 (_ BitVec 32)) Bool)

(assert (=> b!1180959 (= res!784742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1180960 () Bool)

(declare-fun res!784729 () Bool)

(assert (=> b!1180960 (=> (not res!784729) (not e!671412))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44789 0))(
  ( (V!44790 (val!14930 Int)) )
))
(declare-datatypes ((ValueCell!14164 0))(
  ( (ValueCellFull!14164 (v!17568 V!44789)) (EmptyCell!14164) )
))
(declare-datatypes ((array!76299 0))(
  ( (array!76300 (arr!36799 (Array (_ BitVec 32) ValueCell!14164)) (size!37335 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76299)

(assert (=> b!1180960 (= res!784729 (and (= (size!37335 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37334 _keys!1208) (size!37335 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1180961 () Bool)

(declare-fun e!671414 () Bool)

(declare-fun e!671417 () Bool)

(declare-fun mapRes!46448 () Bool)

(assert (=> b!1180961 (= e!671414 (and e!671417 mapRes!46448))))

(declare-fun condMapEmpty!46448 () Bool)

(declare-fun mapDefault!46448 () ValueCell!14164)

