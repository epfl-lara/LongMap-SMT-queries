; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97832 () Bool)

(assert start!97832)

(declare-fun b_free!23533 () Bool)

(declare-fun b_next!23533 () Bool)

(assert (=> start!97832 (= b_free!23533 (not b_next!23533))))

(declare-fun tp!83303 () Bool)

(declare-fun b_and!37849 () Bool)

(assert (=> start!97832 (= tp!83303 b_and!37849)))

(declare-fun b!1119650 () Bool)

(declare-fun e!637636 () Bool)

(declare-fun tp_is_empty!28063 () Bool)

(assert (=> b!1119650 (= e!637636 tp_is_empty!28063)))

(declare-fun res!747912 () Bool)

(declare-fun e!637637 () Bool)

(assert (=> start!97832 (=> (not res!747912) (not e!637637))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!73009 0))(
  ( (array!73010 (arr!35157 (Array (_ BitVec 32) (_ BitVec 64))) (size!35693 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73009)

(assert (=> start!97832 (= res!747912 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35693 _keys!1208))))))

(assert (=> start!97832 e!637637))

(assert (=> start!97832 tp_is_empty!28063))

(declare-fun array_inv!27010 (array!73009) Bool)

(assert (=> start!97832 (array_inv!27010 _keys!1208)))

(assert (=> start!97832 true))

(assert (=> start!97832 tp!83303))

(declare-datatypes ((V!42545 0))(
  ( (V!42546 (val!14088 Int)) )
))
(declare-datatypes ((ValueCell!13322 0))(
  ( (ValueCellFull!13322 (v!16721 V!42545)) (EmptyCell!13322) )
))
(declare-datatypes ((array!73011 0))(
  ( (array!73012 (arr!35158 (Array (_ BitVec 32) ValueCell!13322)) (size!35694 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73011)

(declare-fun e!637633 () Bool)

(declare-fun array_inv!27011 (array!73011) Bool)

(assert (=> start!97832 (and (array_inv!27011 _values!996) e!637633)))

(declare-fun b!1119651 () Bool)

(declare-fun e!637632 () Bool)

(assert (=> b!1119651 (= e!637632 true)))

(declare-fun zeroValue!944 () V!42545)

(declare-fun lt!497811 () array!73009)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17676 0))(
  ( (tuple2!17677 (_1!8849 (_ BitVec 64)) (_2!8849 V!42545)) )
))
(declare-datatypes ((List!24460 0))(
  ( (Nil!24457) (Cons!24456 (h!25665 tuple2!17676) (t!34985 List!24460)) )
))
(declare-datatypes ((ListLongMap!15645 0))(
  ( (ListLongMap!15646 (toList!7838 List!24460)) )
))
(declare-fun lt!497810 () ListLongMap!15645)

(declare-fun minValue!944 () V!42545)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4328 (array!73009 array!73011 (_ BitVec 32) (_ BitVec 32) V!42545 V!42545 (_ BitVec 32) Int) ListLongMap!15645)

(declare-fun dynLambda!2432 (Int (_ BitVec 64)) V!42545)

(assert (=> b!1119651 (= lt!497810 (getCurrentListMapNoExtraKeys!4328 lt!497811 (array!73012 (store (arr!35158 _values!996) i!673 (ValueCellFull!13322 (dynLambda!2432 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35694 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!497813 () ListLongMap!15645)

(assert (=> b!1119651 (= lt!497813 (getCurrentListMapNoExtraKeys!4328 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1119652 () Bool)

(declare-fun res!747910 () Bool)

(assert (=> b!1119652 (=> (not res!747910) (not e!637637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73009 (_ BitVec 32)) Bool)

(assert (=> b!1119652 (= res!747910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119653 () Bool)

(declare-fun res!747918 () Bool)

(assert (=> b!1119653 (=> (not res!747918) (not e!637637))))

(assert (=> b!1119653 (= res!747918 (and (= (size!35694 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35693 _keys!1208) (size!35694 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119654 () Bool)

(declare-fun res!747913 () Bool)

(assert (=> b!1119654 (=> (not res!747913) (not e!637637))))

(assert (=> b!1119654 (= res!747913 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35693 _keys!1208))))))

(declare-fun b!1119655 () Bool)

(declare-fun res!747909 () Bool)

(declare-fun e!637635 () Bool)

(assert (=> b!1119655 (=> (not res!747909) (not e!637635))))

(declare-datatypes ((List!24461 0))(
  ( (Nil!24458) (Cons!24457 (h!25666 (_ BitVec 64)) (t!34986 List!24461)) )
))
(declare-fun arrayNoDuplicates!0 (array!73009 (_ BitVec 32) List!24461) Bool)

(assert (=> b!1119655 (= res!747909 (arrayNoDuplicates!0 lt!497811 #b00000000000000000000000000000000 Nil!24458))))

(declare-fun b!1119656 () Bool)

(declare-fun res!747917 () Bool)

(assert (=> b!1119656 (=> (not res!747917) (not e!637637))))

(assert (=> b!1119656 (= res!747917 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24458))))

(declare-fun b!1119657 () Bool)

(declare-fun e!637638 () Bool)

(declare-fun mapRes!43912 () Bool)

(assert (=> b!1119657 (= e!637633 (and e!637638 mapRes!43912))))

(declare-fun condMapEmpty!43912 () Bool)

(declare-fun mapDefault!43912 () ValueCell!13322)

