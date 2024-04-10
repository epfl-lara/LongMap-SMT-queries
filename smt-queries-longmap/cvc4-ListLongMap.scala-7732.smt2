; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97124 () Bool)

(assert start!97124)

(declare-fun b!1104704 () Bool)

(declare-fun res!737047 () Bool)

(declare-fun e!630555 () Bool)

(assert (=> b!1104704 (=> (not res!737047) (not e!630555))))

(declare-datatypes ((array!71665 0))(
  ( (array!71666 (arr!34486 (Array (_ BitVec 32) (_ BitVec 64))) (size!35022 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71665)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71665 (_ BitVec 32)) Bool)

(assert (=> b!1104704 (= res!737047 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!737044 () Bool)

(assert (=> start!97124 (=> (not res!737044) (not e!630555))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97124 (= res!737044 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35022 _keys!1208))))))

(assert (=> start!97124 e!630555))

(declare-fun array_inv!26550 (array!71665) Bool)

(assert (=> start!97124 (array_inv!26550 _keys!1208)))

(assert (=> start!97124 true))

(declare-datatypes ((V!41621 0))(
  ( (V!41622 (val!13742 Int)) )
))
(declare-datatypes ((ValueCell!12976 0))(
  ( (ValueCellFull!12976 (v!16375 V!41621)) (EmptyCell!12976) )
))
(declare-datatypes ((array!71667 0))(
  ( (array!71668 (arr!34487 (Array (_ BitVec 32) ValueCell!12976)) (size!35023 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71667)

(declare-fun e!630556 () Bool)

(declare-fun array_inv!26551 (array!71667) Bool)

(assert (=> start!97124 (and (array_inv!26551 _values!996) e!630556)))

(declare-fun b!1104705 () Bool)

(declare-fun res!737051 () Bool)

(assert (=> b!1104705 (=> (not res!737051) (not e!630555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104705 (= res!737051 (validMask!0 mask!1564))))

(declare-fun b!1104706 () Bool)

(declare-fun res!737043 () Bool)

(assert (=> b!1104706 (=> (not res!737043) (not e!630555))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1104706 (= res!737043 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35022 _keys!1208))))))

(declare-fun b!1104707 () Bool)

(declare-fun res!737049 () Bool)

(assert (=> b!1104707 (=> (not res!737049) (not e!630555))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1104707 (= res!737049 (= (select (arr!34486 _keys!1208) i!673) k!934))))

(declare-fun b!1104708 () Bool)

(declare-fun res!737048 () Bool)

(assert (=> b!1104708 (=> (not res!737048) (not e!630555))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1104708 (= res!737048 (and (= (size!35023 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35022 _keys!1208) (size!35023 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104709 () Bool)

(declare-fun res!737046 () Bool)

(assert (=> b!1104709 (=> (not res!737046) (not e!630555))))

(declare-datatypes ((List!24062 0))(
  ( (Nil!24059) (Cons!24058 (h!25267 (_ BitVec 64)) (t!34327 List!24062)) )
))
(declare-fun arrayNoDuplicates!0 (array!71665 (_ BitVec 32) List!24062) Bool)

(assert (=> b!1104709 (= res!737046 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24059))))

(declare-fun b!1104710 () Bool)

(declare-fun e!630552 () Bool)

(declare-fun tp_is_empty!27371 () Bool)

(assert (=> b!1104710 (= e!630552 tp_is_empty!27371)))

(declare-fun mapNonEmpty!42871 () Bool)

(declare-fun mapRes!42871 () Bool)

(declare-fun tp!81791 () Bool)

(assert (=> mapNonEmpty!42871 (= mapRes!42871 (and tp!81791 e!630552))))

(declare-fun mapRest!42871 () (Array (_ BitVec 32) ValueCell!12976))

(declare-fun mapValue!42871 () ValueCell!12976)

(declare-fun mapKey!42871 () (_ BitVec 32))

(assert (=> mapNonEmpty!42871 (= (arr!34487 _values!996) (store mapRest!42871 mapKey!42871 mapValue!42871))))

(declare-fun b!1104711 () Bool)

(declare-fun e!630554 () Bool)

(assert (=> b!1104711 (= e!630554 false)))

(declare-fun lt!495185 () Bool)

(declare-fun lt!495184 () array!71665)

(assert (=> b!1104711 (= lt!495185 (arrayNoDuplicates!0 lt!495184 #b00000000000000000000000000000000 Nil!24059))))

(declare-fun b!1104712 () Bool)

(declare-fun e!630557 () Bool)

(assert (=> b!1104712 (= e!630556 (and e!630557 mapRes!42871))))

(declare-fun condMapEmpty!42871 () Bool)

(declare-fun mapDefault!42871 () ValueCell!12976)

