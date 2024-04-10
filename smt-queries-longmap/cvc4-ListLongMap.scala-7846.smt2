; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97824 () Bool)

(assert start!97824)

(declare-fun b_free!23525 () Bool)

(declare-fun b_next!23525 () Bool)

(assert (=> start!97824 (= b_free!23525 (not b_next!23525))))

(declare-fun tp!83278 () Bool)

(declare-fun b_and!37833 () Bool)

(assert (=> start!97824 (= tp!83278 b_and!37833)))

(declare-fun b!1119474 () Bool)

(declare-fun e!637554 () Bool)

(declare-fun tp_is_empty!28055 () Bool)

(assert (=> b!1119474 (= e!637554 tp_is_empty!28055)))

(declare-fun b!1119475 () Bool)

(declare-fun e!637548 () Bool)

(assert (=> b!1119475 (= e!637548 true)))

(declare-datatypes ((V!42533 0))(
  ( (V!42534 (val!14084 Int)) )
))
(declare-fun zeroValue!944 () V!42533)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!72995 0))(
  ( (array!72996 (arr!35150 (Array (_ BitVec 32) (_ BitVec 64))) (size!35686 (_ BitVec 32))) )
))
(declare-fun lt!497763 () array!72995)

(declare-datatypes ((ValueCell!13318 0))(
  ( (ValueCellFull!13318 (v!16717 V!42533)) (EmptyCell!13318) )
))
(declare-datatypes ((array!72997 0))(
  ( (array!72998 (arr!35151 (Array (_ BitVec 32) ValueCell!13318)) (size!35687 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72997)

(declare-fun minValue!944 () V!42533)

(declare-datatypes ((tuple2!17670 0))(
  ( (tuple2!17671 (_1!8846 (_ BitVec 64)) (_2!8846 V!42533)) )
))
(declare-datatypes ((List!24454 0))(
  ( (Nil!24451) (Cons!24450 (h!25659 tuple2!17670) (t!34971 List!24454)) )
))
(declare-datatypes ((ListLongMap!15639 0))(
  ( (ListLongMap!15640 (toList!7835 List!24454)) )
))
(declare-fun lt!497765 () ListLongMap!15639)

(declare-fun getCurrentListMapNoExtraKeys!4325 (array!72995 array!72997 (_ BitVec 32) (_ BitVec 32) V!42533 V!42533 (_ BitVec 32) Int) ListLongMap!15639)

(declare-fun dynLambda!2429 (Int (_ BitVec 64)) V!42533)

(assert (=> b!1119475 (= lt!497765 (getCurrentListMapNoExtraKeys!4325 lt!497763 (array!72998 (store (arr!35151 _values!996) i!673 (ValueCellFull!13318 (dynLambda!2429 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35687 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _keys!1208 () array!72995)

(declare-fun lt!497764 () ListLongMap!15639)

(assert (=> b!1119475 (= lt!497764 (getCurrentListMapNoExtraKeys!4325 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119476 () Bool)

(declare-fun res!747782 () Bool)

(declare-fun e!637551 () Bool)

(assert (=> b!1119476 (=> (not res!747782) (not e!637551))))

(declare-datatypes ((List!24455 0))(
  ( (Nil!24452) (Cons!24451 (h!25660 (_ BitVec 64)) (t!34972 List!24455)) )
))
(declare-fun arrayNoDuplicates!0 (array!72995 (_ BitVec 32) List!24455) Bool)

(assert (=> b!1119476 (= res!747782 (arrayNoDuplicates!0 lt!497763 #b00000000000000000000000000000000 Nil!24452))))

(declare-fun b!1119477 () Bool)

(declare-fun res!747786 () Bool)

(declare-fun e!637549 () Bool)

(assert (=> b!1119477 (=> (not res!747786) (not e!637549))))

(assert (=> b!1119477 (= res!747786 (and (= (size!35687 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35686 _keys!1208) (size!35687 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43900 () Bool)

(declare-fun mapRes!43900 () Bool)

(assert (=> mapIsEmpty!43900 mapRes!43900))

(declare-fun b!1119478 () Bool)

(declare-fun res!747783 () Bool)

(assert (=> b!1119478 (=> (not res!747783) (not e!637549))))

(assert (=> b!1119478 (= res!747783 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35686 _keys!1208))))))

(declare-fun b!1119479 () Bool)

(declare-fun res!747784 () Bool)

(assert (=> b!1119479 (=> (not res!747784) (not e!637549))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119479 (= res!747784 (validKeyInArray!0 k!934))))

(declare-fun b!1119480 () Bool)

(declare-fun e!637552 () Bool)

(declare-fun e!637550 () Bool)

(assert (=> b!1119480 (= e!637552 (and e!637550 mapRes!43900))))

(declare-fun condMapEmpty!43900 () Bool)

(declare-fun mapDefault!43900 () ValueCell!13318)

