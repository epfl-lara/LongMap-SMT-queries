; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100276 () Bool)

(assert start!100276)

(declare-fun b!1196256 () Bool)

(declare-fun res!796090 () Bool)

(declare-fun e!679685 () Bool)

(assert (=> b!1196256 (=> (not res!796090) (not e!679685))))

(declare-datatypes ((array!77467 0))(
  ( (array!77468 (arr!37380 (Array (_ BitVec 32) (_ BitVec 64))) (size!37916 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77467)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1196256 (= res!796090 (= (select (arr!37380 _keys!1208) i!673) k!934))))

(declare-fun b!1196257 () Bool)

(declare-fun res!796091 () Bool)

(assert (=> b!1196257 (=> (not res!796091) (not e!679685))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77467 (_ BitVec 32)) Bool)

(assert (=> b!1196257 (= res!796091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1196258 () Bool)

(declare-fun e!679682 () Bool)

(declare-fun tp_is_empty!30343 () Bool)

(assert (=> b!1196258 (= e!679682 tp_is_empty!30343)))

(declare-fun b!1196259 () Bool)

(declare-fun res!796096 () Bool)

(assert (=> b!1196259 (=> (not res!796096) (not e!679685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196259 (= res!796096 (validMask!0 mask!1564))))

(declare-fun res!796087 () Bool)

(assert (=> start!100276 (=> (not res!796087) (not e!679685))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100276 (= res!796087 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37916 _keys!1208))))))

(assert (=> start!100276 e!679685))

(declare-fun array_inv!28490 (array!77467) Bool)

(assert (=> start!100276 (array_inv!28490 _keys!1208)))

(assert (=> start!100276 true))

(declare-datatypes ((V!45585 0))(
  ( (V!45586 (val!15228 Int)) )
))
(declare-datatypes ((ValueCell!14462 0))(
  ( (ValueCellFull!14462 (v!17866 V!45585)) (EmptyCell!14462) )
))
(declare-datatypes ((array!77469 0))(
  ( (array!77470 (arr!37381 (Array (_ BitVec 32) ValueCell!14462)) (size!37917 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77469)

(declare-fun e!679683 () Bool)

(declare-fun array_inv!28491 (array!77469) Bool)

(assert (=> start!100276 (and (array_inv!28491 _values!996) e!679683)))

(declare-fun b!1196260 () Bool)

(declare-fun res!796094 () Bool)

(declare-fun e!679687 () Bool)

(assert (=> b!1196260 (=> (not res!796094) (not e!679687))))

(declare-fun lt!543053 () array!77467)

(declare-datatypes ((List!26299 0))(
  ( (Nil!26296) (Cons!26295 (h!27504 (_ BitVec 64)) (t!38970 List!26299)) )
))
(declare-fun arrayNoDuplicates!0 (array!77467 (_ BitVec 32) List!26299) Bool)

(assert (=> b!1196260 (= res!796094 (arrayNoDuplicates!0 lt!543053 #b00000000000000000000000000000000 Nil!26296))))

(declare-fun b!1196261 () Bool)

(declare-fun res!796093 () Bool)

(assert (=> b!1196261 (=> (not res!796093) (not e!679685))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1196261 (= res!796093 (and (= (size!37917 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37916 _keys!1208) (size!37917 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1196262 () Bool)

(declare-fun mapRes!47351 () Bool)

(assert (=> b!1196262 (= e!679683 (and e!679682 mapRes!47351))))

(declare-fun condMapEmpty!47351 () Bool)

(declare-fun mapDefault!47351 () ValueCell!14462)

