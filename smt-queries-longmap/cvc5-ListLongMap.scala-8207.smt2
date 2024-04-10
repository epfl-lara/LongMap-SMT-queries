; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100108 () Bool)

(assert start!100108)

(declare-fun b!1193787 () Bool)

(declare-fun res!794257 () Bool)

(declare-fun e!678463 () Bool)

(assert (=> b!1193787 (=> (not res!794257) (not e!678463))))

(declare-datatypes ((array!77213 0))(
  ( (array!77214 (arr!37256 (Array (_ BitVec 32) (_ BitVec 64))) (size!37792 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77213)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77213 (_ BitVec 32)) Bool)

(assert (=> b!1193787 (= res!794257 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193788 () Bool)

(declare-fun res!794260 () Bool)

(assert (=> b!1193788 (=> (not res!794260) (not e!678463))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45417 0))(
  ( (V!45418 (val!15165 Int)) )
))
(declare-datatypes ((ValueCell!14399 0))(
  ( (ValueCellFull!14399 (v!17803 V!45417)) (EmptyCell!14399) )
))
(declare-datatypes ((array!77215 0))(
  ( (array!77216 (arr!37257 (Array (_ BitVec 32) ValueCell!14399)) (size!37793 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77215)

(assert (=> b!1193788 (= res!794260 (and (= (size!37793 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37792 _keys!1208) (size!37793 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193789 () Bool)

(declare-fun res!794259 () Bool)

(assert (=> b!1193789 (=> (not res!794259) (not e!678463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193789 (= res!794259 (validMask!0 mask!1564))))

(declare-fun b!1193790 () Bool)

(assert (=> b!1193790 (= e!678463 false)))

(declare-fun lt!542679 () Bool)

(declare-datatypes ((List!26244 0))(
  ( (Nil!26241) (Cons!26240 (h!27449 (_ BitVec 64)) (t!38915 List!26244)) )
))
(declare-fun arrayNoDuplicates!0 (array!77213 (_ BitVec 32) List!26244) Bool)

(assert (=> b!1193790 (= lt!542679 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26241))))

(declare-fun mapIsEmpty!47153 () Bool)

(declare-fun mapRes!47153 () Bool)

(assert (=> mapIsEmpty!47153 mapRes!47153))

(declare-fun b!1193791 () Bool)

(declare-fun e!678462 () Bool)

(declare-fun tp_is_empty!30217 () Bool)

(assert (=> b!1193791 (= e!678462 tp_is_empty!30217)))

(declare-fun mapNonEmpty!47153 () Bool)

(declare-fun tp!89763 () Bool)

(assert (=> mapNonEmpty!47153 (= mapRes!47153 (and tp!89763 e!678462))))

(declare-fun mapKey!47153 () (_ BitVec 32))

(declare-fun mapValue!47153 () ValueCell!14399)

(declare-fun mapRest!47153 () (Array (_ BitVec 32) ValueCell!14399))

(assert (=> mapNonEmpty!47153 (= (arr!37257 _values!996) (store mapRest!47153 mapKey!47153 mapValue!47153))))

(declare-fun res!794258 () Bool)

(assert (=> start!100108 (=> (not res!794258) (not e!678463))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100108 (= res!794258 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37792 _keys!1208))))))

(assert (=> start!100108 e!678463))

(declare-fun array_inv!28406 (array!77213) Bool)

(assert (=> start!100108 (array_inv!28406 _keys!1208)))

(assert (=> start!100108 true))

(declare-fun e!678459 () Bool)

(declare-fun array_inv!28407 (array!77215) Bool)

(assert (=> start!100108 (and (array_inv!28407 _values!996) e!678459)))

(declare-fun b!1193792 () Bool)

(declare-fun e!678461 () Bool)

(assert (=> b!1193792 (= e!678459 (and e!678461 mapRes!47153))))

(declare-fun condMapEmpty!47153 () Bool)

(declare-fun mapDefault!47153 () ValueCell!14399)

