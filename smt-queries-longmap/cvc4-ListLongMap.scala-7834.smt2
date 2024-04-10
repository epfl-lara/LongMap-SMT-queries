; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97752 () Bool)

(assert start!97752)

(declare-fun b_free!23453 () Bool)

(declare-fun b_next!23453 () Bool)

(assert (=> start!97752 (= b_free!23453 (not b_next!23453))))

(declare-fun tp!83063 () Bool)

(declare-fun b_and!37727 () Bool)

(assert (=> start!97752 (= tp!83063 b_and!37727)))

(declare-fun b!1117928 () Bool)

(declare-fun res!746597 () Bool)

(declare-fun e!636793 () Bool)

(assert (=> b!1117928 (=> (not res!746597) (not e!636793))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117928 (= res!746597 (validKeyInArray!0 k!934))))

(declare-fun b!1117929 () Bool)

(declare-fun e!636792 () Bool)

(assert (=> b!1117929 (= e!636792 true)))

(declare-datatypes ((V!42437 0))(
  ( (V!42438 (val!14048 Int)) )
))
(declare-fun zeroValue!944 () V!42437)

(declare-datatypes ((array!72857 0))(
  ( (array!72858 (arr!35081 (Array (_ BitVec 32) (_ BitVec 64))) (size!35617 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72857)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17614 0))(
  ( (tuple2!17615 (_1!8818 (_ BitVec 64)) (_2!8818 V!42437)) )
))
(declare-datatypes ((List!24401 0))(
  ( (Nil!24398) (Cons!24397 (h!25606 tuple2!17614) (t!34882 List!24401)) )
))
(declare-datatypes ((ListLongMap!15583 0))(
  ( (ListLongMap!15584 (toList!7807 List!24401)) )
))
(declare-fun lt!497386 () ListLongMap!15583)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13282 0))(
  ( (ValueCellFull!13282 (v!16681 V!42437)) (EmptyCell!13282) )
))
(declare-datatypes ((array!72859 0))(
  ( (array!72860 (arr!35082 (Array (_ BitVec 32) ValueCell!13282)) (size!35618 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72859)

(declare-fun minValue!944 () V!42437)

(declare-fun getCurrentListMapNoExtraKeys!4297 (array!72857 array!72859 (_ BitVec 32) (_ BitVec 32) V!42437 V!42437 (_ BitVec 32) Int) ListLongMap!15583)

(assert (=> b!1117929 (= lt!497386 (getCurrentListMapNoExtraKeys!4297 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1117930 () Bool)

(declare-fun res!746591 () Bool)

(assert (=> b!1117930 (=> (not res!746591) (not e!636793))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1117930 (= res!746591 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35617 _keys!1208))))))

(declare-fun b!1117931 () Bool)

(declare-fun res!746594 () Bool)

(assert (=> b!1117931 (=> (not res!746594) (not e!636793))))

(assert (=> b!1117931 (= res!746594 (= (select (arr!35081 _keys!1208) i!673) k!934))))

(declare-fun b!1117932 () Bool)

(declare-fun res!746592 () Bool)

(declare-fun e!636797 () Bool)

(assert (=> b!1117932 (=> (not res!746592) (not e!636797))))

(declare-fun lt!497387 () array!72857)

(declare-datatypes ((List!24402 0))(
  ( (Nil!24399) (Cons!24398 (h!25607 (_ BitVec 64)) (t!34883 List!24402)) )
))
(declare-fun arrayNoDuplicates!0 (array!72857 (_ BitVec 32) List!24402) Bool)

(assert (=> b!1117932 (= res!746592 (arrayNoDuplicates!0 lt!497387 #b00000000000000000000000000000000 Nil!24399))))

(declare-fun b!1117933 () Bool)

(declare-fun res!746593 () Bool)

(assert (=> b!1117933 (=> (not res!746593) (not e!636793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72857 (_ BitVec 32)) Bool)

(assert (=> b!1117933 (= res!746593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117934 () Bool)

(declare-fun res!746598 () Bool)

(assert (=> b!1117934 (=> (not res!746598) (not e!636793))))

(assert (=> b!1117934 (= res!746598 (and (= (size!35618 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35617 _keys!1208) (size!35618 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!43792 () Bool)

(declare-fun mapRes!43792 () Bool)

(declare-fun tp!83062 () Bool)

(declare-fun e!636796 () Bool)

(assert (=> mapNonEmpty!43792 (= mapRes!43792 (and tp!83062 e!636796))))

(declare-fun mapRest!43792 () (Array (_ BitVec 32) ValueCell!13282))

(declare-fun mapKey!43792 () (_ BitVec 32))

(declare-fun mapValue!43792 () ValueCell!13282)

(assert (=> mapNonEmpty!43792 (= (arr!35082 _values!996) (store mapRest!43792 mapKey!43792 mapValue!43792))))

(declare-fun b!1117935 () Bool)

(declare-fun res!746599 () Bool)

(assert (=> b!1117935 (=> (not res!746599) (not e!636793))))

(assert (=> b!1117935 (= res!746599 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24399))))

(declare-fun b!1117936 () Bool)

(declare-fun res!746590 () Bool)

(assert (=> b!1117936 (=> (not res!746590) (not e!636793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117936 (= res!746590 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!43792 () Bool)

(assert (=> mapIsEmpty!43792 mapRes!43792))

(declare-fun b!1117937 () Bool)

(declare-fun tp_is_empty!27983 () Bool)

(assert (=> b!1117937 (= e!636796 tp_is_empty!27983)))

(declare-fun b!1117938 () Bool)

(declare-fun e!636798 () Bool)

(declare-fun e!636795 () Bool)

(assert (=> b!1117938 (= e!636798 (and e!636795 mapRes!43792))))

(declare-fun condMapEmpty!43792 () Bool)

(declare-fun mapDefault!43792 () ValueCell!13282)

