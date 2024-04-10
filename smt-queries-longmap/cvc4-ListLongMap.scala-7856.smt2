; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97884 () Bool)

(assert start!97884)

(declare-fun b_free!23585 () Bool)

(declare-fun b_next!23585 () Bool)

(assert (=> start!97884 (= b_free!23585 (not b_next!23585))))

(declare-fun tp!83459 () Bool)

(declare-fun b_and!37953 () Bool)

(assert (=> start!97884 (= tp!83459 b_and!37953)))

(declare-fun b!1120845 () Bool)

(declare-datatypes ((V!42613 0))(
  ( (V!42614 (val!14114 Int)) )
))
(declare-datatypes ((tuple2!17712 0))(
  ( (tuple2!17713 (_1!8867 (_ BitVec 64)) (_2!8867 V!42613)) )
))
(declare-datatypes ((List!24496 0))(
  ( (Nil!24493) (Cons!24492 (h!25701 tuple2!17712) (t!35073 List!24496)) )
))
(declare-datatypes ((ListLongMap!15681 0))(
  ( (ListLongMap!15682 (toList!7856 List!24496)) )
))
(declare-fun call!47038 () ListLongMap!15681)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun call!47037 () ListLongMap!15681)

(declare-fun e!638219 () Bool)

(declare-fun -!1068 (ListLongMap!15681 (_ BitVec 64)) ListLongMap!15681)

(assert (=> b!1120845 (= e!638219 (= call!47037 (-!1068 call!47038 k!934)))))

(declare-fun b!1120846 () Bool)

(declare-fun e!638215 () Bool)

(declare-fun tp_is_empty!28115 () Bool)

(assert (=> b!1120846 (= e!638215 tp_is_empty!28115)))

(declare-fun b!1120847 () Bool)

(declare-fun res!748784 () Bool)

(declare-fun e!638220 () Bool)

(assert (=> b!1120847 (=> (not res!748784) (not e!638220))))

(declare-datatypes ((array!73111 0))(
  ( (array!73112 (arr!35208 (Array (_ BitVec 32) (_ BitVec 64))) (size!35744 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73111)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73111 (_ BitVec 32)) Bool)

(assert (=> b!1120847 (= res!748784 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!748788 () Bool)

(assert (=> start!97884 (=> (not res!748788) (not e!638220))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97884 (= res!748788 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35744 _keys!1208))))))

(assert (=> start!97884 e!638220))

(assert (=> start!97884 tp_is_empty!28115))

(declare-fun array_inv!27040 (array!73111) Bool)

(assert (=> start!97884 (array_inv!27040 _keys!1208)))

(assert (=> start!97884 true))

(assert (=> start!97884 tp!83459))

(declare-datatypes ((ValueCell!13348 0))(
  ( (ValueCellFull!13348 (v!16747 V!42613)) (EmptyCell!13348) )
))
(declare-datatypes ((array!73113 0))(
  ( (array!73114 (arr!35209 (Array (_ BitVec 32) ValueCell!13348)) (size!35745 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73113)

(declare-fun e!638218 () Bool)

(declare-fun array_inv!27041 (array!73113) Bool)

(assert (=> start!97884 (and (array_inv!27041 _values!996) e!638218)))

(declare-fun b!1120848 () Bool)

(declare-fun res!748785 () Bool)

(declare-fun e!638216 () Bool)

(assert (=> b!1120848 (=> (not res!748785) (not e!638216))))

(declare-fun lt!498160 () array!73111)

(declare-datatypes ((List!24497 0))(
  ( (Nil!24494) (Cons!24493 (h!25702 (_ BitVec 64)) (t!35074 List!24497)) )
))
(declare-fun arrayNoDuplicates!0 (array!73111 (_ BitVec 32) List!24497) Bool)

(assert (=> b!1120848 (= res!748785 (arrayNoDuplicates!0 lt!498160 #b00000000000000000000000000000000 Nil!24494))))

(declare-fun zeroValue!944 () V!42613)

(declare-fun bm!47034 () Bool)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42613)

(declare-fun getCurrentListMapNoExtraKeys!4346 (array!73111 array!73113 (_ BitVec 32) (_ BitVec 32) V!42613 V!42613 (_ BitVec 32) Int) ListLongMap!15681)

(assert (=> bm!47034 (= call!47038 (getCurrentListMapNoExtraKeys!4346 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun bm!47035 () Bool)

(declare-fun lt!498161 () array!73113)

(assert (=> bm!47035 (= call!47037 (getCurrentListMapNoExtraKeys!4346 lt!498160 lt!498161 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1120849 () Bool)

(declare-fun res!748790 () Bool)

(assert (=> b!1120849 (=> (not res!748790) (not e!638220))))

(assert (=> b!1120849 (= res!748790 (and (= (size!35745 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35744 _keys!1208) (size!35745 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1120850 () Bool)

(declare-fun res!748787 () Bool)

(assert (=> b!1120850 (=> (not res!748787) (not e!638220))))

(assert (=> b!1120850 (= res!748787 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24494))))

(declare-fun b!1120851 () Bool)

(declare-fun res!748795 () Bool)

(assert (=> b!1120851 (=> (not res!748795) (not e!638220))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1120851 (= res!748795 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35744 _keys!1208))))))

(declare-fun b!1120852 () Bool)

(declare-fun e!638213 () Bool)

(assert (=> b!1120852 (= e!638213 tp_is_empty!28115)))

(declare-fun mapIsEmpty!43990 () Bool)

(declare-fun mapRes!43990 () Bool)

(assert (=> mapIsEmpty!43990 mapRes!43990))

(declare-fun b!1120853 () Bool)

(declare-fun e!638212 () Bool)

(declare-fun e!638217 () Bool)

(assert (=> b!1120853 (= e!638212 e!638217)))

(declare-fun res!748792 () Bool)

(assert (=> b!1120853 (=> res!748792 e!638217)))

(assert (=> b!1120853 (= res!748792 (not (= from!1455 i!673)))))

(declare-fun lt!498159 () ListLongMap!15681)

(assert (=> b!1120853 (= lt!498159 (getCurrentListMapNoExtraKeys!4346 lt!498160 lt!498161 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2448 (Int (_ BitVec 64)) V!42613)

(assert (=> b!1120853 (= lt!498161 (array!73114 (store (arr!35209 _values!996) i!673 (ValueCellFull!13348 (dynLambda!2448 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35745 _values!996)))))

(declare-fun lt!498158 () ListLongMap!15681)

(assert (=> b!1120853 (= lt!498158 (getCurrentListMapNoExtraKeys!4346 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1120854 () Bool)

(declare-fun res!748791 () Bool)

(assert (=> b!1120854 (=> (not res!748791) (not e!638220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1120854 (= res!748791 (validMask!0 mask!1564))))

(declare-fun b!1120855 () Bool)

(assert (=> b!1120855 (= e!638218 (and e!638213 mapRes!43990))))

(declare-fun condMapEmpty!43990 () Bool)

(declare-fun mapDefault!43990 () ValueCell!13348)

