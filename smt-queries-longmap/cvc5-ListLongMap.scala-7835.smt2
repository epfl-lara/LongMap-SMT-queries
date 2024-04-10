; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97754 () Bool)

(assert start!97754)

(declare-fun b_free!23455 () Bool)

(declare-fun b_next!23455 () Bool)

(assert (=> start!97754 (= b_free!23455 (not b_next!23455))))

(declare-fun tp!83068 () Bool)

(declare-fun b_and!37729 () Bool)

(assert (=> start!97754 (= tp!83068 b_and!37729)))

(declare-fun b!1117971 () Bool)

(declare-fun e!636818 () Bool)

(declare-fun e!636815 () Bool)

(assert (=> b!1117971 (= e!636818 e!636815)))

(declare-fun res!746630 () Bool)

(assert (=> b!1117971 (=> (not res!746630) (not e!636815))))

(declare-datatypes ((array!72861 0))(
  ( (array!72862 (arr!35083 (Array (_ BitVec 32) (_ BitVec 64))) (size!35619 (_ BitVec 32))) )
))
(declare-fun lt!497394 () array!72861)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72861 (_ BitVec 32)) Bool)

(assert (=> b!1117971 (= res!746630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497394 mask!1564))))

(declare-fun _keys!1208 () array!72861)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1117971 (= lt!497394 (array!72862 (store (arr!35083 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35619 _keys!1208)))))

(declare-fun b!1117972 () Bool)

(declare-fun e!636819 () Bool)

(assert (=> b!1117972 (= e!636819 true)))

(declare-datatypes ((V!42441 0))(
  ( (V!42442 (val!14049 Int)) )
))
(declare-fun zeroValue!944 () V!42441)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17616 0))(
  ( (tuple2!17617 (_1!8819 (_ BitVec 64)) (_2!8819 V!42441)) )
))
(declare-datatypes ((List!24403 0))(
  ( (Nil!24400) (Cons!24399 (h!25608 tuple2!17616) (t!34884 List!24403)) )
))
(declare-datatypes ((ListLongMap!15585 0))(
  ( (ListLongMap!15586 (toList!7808 List!24403)) )
))
(declare-fun lt!497395 () ListLongMap!15585)

(declare-datatypes ((ValueCell!13283 0))(
  ( (ValueCellFull!13283 (v!16682 V!42441)) (EmptyCell!13283) )
))
(declare-datatypes ((array!72863 0))(
  ( (array!72864 (arr!35084 (Array (_ BitVec 32) ValueCell!13283)) (size!35620 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72863)

(declare-fun minValue!944 () V!42441)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4298 (array!72861 array!72863 (_ BitVec 32) (_ BitVec 32) V!42441 V!42441 (_ BitVec 32) Int) ListLongMap!15585)

(assert (=> b!1117972 (= lt!497395 (getCurrentListMapNoExtraKeys!4298 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!43795 () Bool)

(declare-fun mapRes!43795 () Bool)

(declare-fun tp!83069 () Bool)

(declare-fun e!636817 () Bool)

(assert (=> mapNonEmpty!43795 (= mapRes!43795 (and tp!83069 e!636817))))

(declare-fun mapKey!43795 () (_ BitVec 32))

(declare-fun mapRest!43795 () (Array (_ BitVec 32) ValueCell!13283))

(declare-fun mapValue!43795 () ValueCell!13283)

(assert (=> mapNonEmpty!43795 (= (arr!35084 _values!996) (store mapRest!43795 mapKey!43795 mapValue!43795))))

(declare-fun b!1117973 () Bool)

(declare-fun e!636814 () Bool)

(declare-fun e!636816 () Bool)

(assert (=> b!1117973 (= e!636814 (and e!636816 mapRes!43795))))

(declare-fun condMapEmpty!43795 () Bool)

(declare-fun mapDefault!43795 () ValueCell!13283)

