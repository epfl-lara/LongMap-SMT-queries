; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97250 () Bool)

(assert start!97250)

(declare-fun b_free!23221 () Bool)

(declare-fun b_next!23221 () Bool)

(assert (=> start!97250 (= b_free!23221 (not b_next!23221))))

(declare-fun tp!81961 () Bool)

(declare-fun b_and!37273 () Bool)

(assert (=> start!97250 (= tp!81961 b_and!37273)))

(declare-fun b!1106895 () Bool)

(declare-fun res!738711 () Bool)

(declare-fun e!631590 () Bool)

(assert (=> b!1106895 (=> (not res!738711) (not e!631590))))

(declare-datatypes ((array!71879 0))(
  ( (array!71880 (arr!34592 (Array (_ BitVec 32) (_ BitVec 64))) (size!35128 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71879)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41769 0))(
  ( (V!41770 (val!13797 Int)) )
))
(declare-datatypes ((ValueCell!13031 0))(
  ( (ValueCellFull!13031 (v!16430 V!41769)) (EmptyCell!13031) )
))
(declare-datatypes ((array!71881 0))(
  ( (array!71882 (arr!34593 (Array (_ BitVec 32) ValueCell!13031)) (size!35129 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71881)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1106895 (= res!738711 (and (= (size!35129 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35128 _keys!1208) (size!35129 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun e!631592 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1106896 () Bool)

(declare-datatypes ((tuple2!17418 0))(
  ( (tuple2!17419 (_1!8720 (_ BitVec 64)) (_2!8720 V!41769)) )
))
(declare-datatypes ((List!24106 0))(
  ( (Nil!24103) (Cons!24102 (h!25311 tuple2!17418) (t!34373 List!24106)) )
))
(declare-datatypes ((ListLongMap!15387 0))(
  ( (ListLongMap!15388 (toList!7709 List!24106)) )
))
(declare-fun call!46359 () ListLongMap!15387)

(declare-fun call!46360 () ListLongMap!15387)

(declare-fun -!992 (ListLongMap!15387 (_ BitVec 64)) ListLongMap!15387)

(assert (=> b!1106896 (= e!631592 (= call!46360 (-!992 call!46359 k!934)))))

(declare-fun b!1106897 () Bool)

(declare-fun res!738716 () Bool)

(assert (=> b!1106897 (=> (not res!738716) (not e!631590))))

(declare-datatypes ((List!24107 0))(
  ( (Nil!24104) (Cons!24103 (h!25312 (_ BitVec 64)) (t!34374 List!24107)) )
))
(declare-fun arrayNoDuplicates!0 (array!71879 (_ BitVec 32) List!24107) Bool)

(assert (=> b!1106897 (= res!738716 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24104))))

(declare-fun zeroValue!944 () V!41769)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!41769)

(declare-fun bm!46356 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!495531 () array!71879)

(declare-fun getCurrentListMapNoExtraKeys!4209 (array!71879 array!71881 (_ BitVec 32) (_ BitVec 32) V!41769 V!41769 (_ BitVec 32) Int) ListLongMap!15387)

(declare-fun dynLambda!2344 (Int (_ BitVec 64)) V!41769)

(assert (=> bm!46356 (= call!46360 (getCurrentListMapNoExtraKeys!4209 lt!495531 (array!71882 (store (arr!34593 _values!996) i!673 (ValueCellFull!13031 (dynLambda!2344 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35129 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1106898 () Bool)

(declare-fun e!631593 () Bool)

(declare-fun tp_is_empty!27481 () Bool)

(assert (=> b!1106898 (= e!631593 tp_is_empty!27481)))

(declare-fun b!1106899 () Bool)

(declare-fun res!738721 () Bool)

(assert (=> b!1106899 (=> (not res!738721) (not e!631590))))

(assert (=> b!1106899 (= res!738721 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35128 _keys!1208))))))

(declare-fun b!1106900 () Bool)

(declare-fun res!738715 () Bool)

(assert (=> b!1106900 (=> (not res!738715) (not e!631590))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1106900 (= res!738715 (validKeyInArray!0 k!934))))

(declare-fun b!1106901 () Bool)

(assert (=> b!1106901 (= e!631592 (= call!46360 call!46359))))

(declare-fun mapIsEmpty!43039 () Bool)

(declare-fun mapRes!43039 () Bool)

(assert (=> mapIsEmpty!43039 mapRes!43039))

(declare-fun b!1106902 () Bool)

(declare-fun res!738717 () Bool)

(assert (=> b!1106902 (=> (not res!738717) (not e!631590))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71879 (_ BitVec 32)) Bool)

(assert (=> b!1106902 (= res!738717 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1106903 () Bool)

(declare-fun e!631591 () Bool)

(assert (=> b!1106903 (= e!631591 (and e!631593 mapRes!43039))))

(declare-fun condMapEmpty!43039 () Bool)

(declare-fun mapDefault!43039 () ValueCell!13031)

