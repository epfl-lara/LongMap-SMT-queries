; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100090 () Bool)

(assert start!100090)

(declare-fun b!1193391 () Bool)

(declare-fun res!793973 () Bool)

(declare-fun e!678267 () Bool)

(assert (=> b!1193391 (=> (not res!793973) (not e!678267))))

(declare-datatypes ((array!77177 0))(
  ( (array!77178 (arr!37238 (Array (_ BitVec 32) (_ BitVec 64))) (size!37774 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77177)

(declare-datatypes ((List!26230 0))(
  ( (Nil!26227) (Cons!26226 (h!27435 (_ BitVec 64)) (t!38889 List!26230)) )
))
(declare-fun arrayNoDuplicates!0 (array!77177 (_ BitVec 32) List!26230) Bool)

(assert (=> b!1193391 (= res!793973 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26227))))

(declare-fun b!1193392 () Bool)

(declare-fun res!793977 () Bool)

(assert (=> b!1193392 (=> (not res!793977) (not e!678267))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!45393 0))(
  ( (V!45394 (val!15156 Int)) )
))
(declare-datatypes ((ValueCell!14390 0))(
  ( (ValueCellFull!14390 (v!17794 V!45393)) (EmptyCell!14390) )
))
(declare-datatypes ((array!77179 0))(
  ( (array!77180 (arr!37239 (Array (_ BitVec 32) ValueCell!14390)) (size!37775 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77179)

(assert (=> b!1193392 (= res!793977 (and (= (size!37775 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37774 _keys!1208) (size!37775 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193393 () Bool)

(declare-fun res!793976 () Bool)

(assert (=> b!1193393 (=> (not res!793976) (not e!678267))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1193393 (= res!793976 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37774 _keys!1208))))))

(declare-fun b!1193394 () Bool)

(declare-fun res!793974 () Bool)

(declare-fun e!678265 () Bool)

(assert (=> b!1193394 (=> (not res!793974) (not e!678265))))

(declare-fun lt!542573 () array!77177)

(assert (=> b!1193394 (= res!793974 (arrayNoDuplicates!0 lt!542573 #b00000000000000000000000000000000 Nil!26227))))

(declare-fun b!1193395 () Bool)

(declare-fun res!793981 () Bool)

(assert (=> b!1193395 (=> (not res!793981) (not e!678267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193395 (= res!793981 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!47126 () Bool)

(declare-fun mapRes!47126 () Bool)

(declare-fun tp!89718 () Bool)

(declare-fun e!678264 () Bool)

(assert (=> mapNonEmpty!47126 (= mapRes!47126 (and tp!89718 e!678264))))

(declare-fun mapRest!47126 () (Array (_ BitVec 32) ValueCell!14390))

(declare-fun mapKey!47126 () (_ BitVec 32))

(declare-fun mapValue!47126 () ValueCell!14390)

(assert (=> mapNonEmpty!47126 (= (arr!37239 _values!996) (store mapRest!47126 mapKey!47126 mapValue!47126))))

(declare-fun b!1193396 () Bool)

(declare-fun e!678263 () Bool)

(declare-fun e!678268 () Bool)

(assert (=> b!1193396 (= e!678263 (and e!678268 mapRes!47126))))

(declare-fun condMapEmpty!47126 () Bool)

(declare-fun mapDefault!47126 () ValueCell!14390)

