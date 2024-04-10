; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100494 () Bool)

(assert start!100494)

(declare-fun b_free!25817 () Bool)

(declare-fun b_next!25817 () Bool)

(assert (=> start!100494 (= b_free!25817 (not b_next!25817))))

(declare-fun tp!90441 () Bool)

(declare-fun b_and!42521 () Bool)

(assert (=> start!100494 (= tp!90441 b_and!42521)))

(declare-fun res!799063 () Bool)

(declare-fun e!681695 () Bool)

(assert (=> start!100494 (=> (not res!799063) (not e!681695))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!77815 0))(
  ( (array!77816 (arr!37552 (Array (_ BitVec 32) (_ BitVec 64))) (size!38088 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77815)

(assert (=> start!100494 (= res!799063 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38088 _keys!1208))))))

(assert (=> start!100494 e!681695))

(declare-fun tp_is_empty!30521 () Bool)

(assert (=> start!100494 tp_is_empty!30521))

(declare-fun array_inv!28620 (array!77815) Bool)

(assert (=> start!100494 (array_inv!28620 _keys!1208)))

(assert (=> start!100494 true))

(assert (=> start!100494 tp!90441))

(declare-datatypes ((V!45821 0))(
  ( (V!45822 (val!15317 Int)) )
))
(declare-datatypes ((ValueCell!14551 0))(
  ( (ValueCellFull!14551 (v!17955 V!45821)) (EmptyCell!14551) )
))
(declare-datatypes ((array!77817 0))(
  ( (array!77818 (arr!37553 (Array (_ BitVec 32) ValueCell!14551)) (size!38089 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77817)

(declare-fun e!681691 () Bool)

(declare-fun array_inv!28621 (array!77817) Bool)

(assert (=> start!100494 (and (array_inv!28621 _values!996) e!681691)))

(declare-fun b!1200376 () Bool)

(declare-fun e!681697 () Bool)

(assert (=> b!1200376 (= e!681695 e!681697)))

(declare-fun res!799067 () Bool)

(assert (=> b!1200376 (=> (not res!799067) (not e!681697))))

(declare-fun lt!544025 () array!77815)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77815 (_ BitVec 32)) Bool)

(assert (=> b!1200376 (= res!799067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!544025 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1200376 (= lt!544025 (array!77816 (store (arr!37552 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38088 _keys!1208)))))

(declare-fun mapIsEmpty!47624 () Bool)

(declare-fun mapRes!47624 () Bool)

(assert (=> mapIsEmpty!47624 mapRes!47624))

(declare-fun b!1200377 () Bool)

(declare-fun res!799065 () Bool)

(assert (=> b!1200377 (=> (not res!799065) (not e!681695))))

(assert (=> b!1200377 (= res!799065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1200378 () Bool)

(declare-fun res!799068 () Bool)

(assert (=> b!1200378 (=> (not res!799068) (not e!681697))))

(declare-datatypes ((List!26428 0))(
  ( (Nil!26425) (Cons!26424 (h!27633 (_ BitVec 64)) (t!39225 List!26428)) )
))
(declare-fun arrayNoDuplicates!0 (array!77815 (_ BitVec 32) List!26428) Bool)

(assert (=> b!1200378 (= res!799068 (arrayNoDuplicates!0 lt!544025 #b00000000000000000000000000000000 Nil!26425))))

(declare-fun b!1200379 () Bool)

(declare-fun e!681694 () Bool)

(assert (=> b!1200379 (= e!681694 tp_is_empty!30521)))

(declare-fun b!1200380 () Bool)

(declare-fun e!681696 () Bool)

(assert (=> b!1200380 (= e!681696 tp_is_empty!30521)))

(declare-fun mapNonEmpty!47624 () Bool)

(declare-fun tp!90440 () Bool)

(assert (=> mapNonEmpty!47624 (= mapRes!47624 (and tp!90440 e!681696))))

(declare-fun mapRest!47624 () (Array (_ BitVec 32) ValueCell!14551))

(declare-fun mapKey!47624 () (_ BitVec 32))

(declare-fun mapValue!47624 () ValueCell!14551)

(assert (=> mapNonEmpty!47624 (= (arr!37553 _values!996) (store mapRest!47624 mapKey!47624 mapValue!47624))))

(declare-fun b!1200381 () Bool)

(declare-fun res!799061 () Bool)

(assert (=> b!1200381 (=> (not res!799061) (not e!681695))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1200381 (= res!799061 (and (= (size!38089 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38088 _keys!1208) (size!38089 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1200382 () Bool)

(assert (=> b!1200382 (= e!681691 (and e!681694 mapRes!47624))))

(declare-fun condMapEmpty!47624 () Bool)

(declare-fun mapDefault!47624 () ValueCell!14551)

