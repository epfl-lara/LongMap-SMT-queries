; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95642 () Bool)

(assert start!95642)

(declare-fun b_free!22295 () Bool)

(declare-fun b_next!22295 () Bool)

(assert (=> start!95642 (= b_free!22295 (not b_next!22295))))

(declare-fun tp!78734 () Bool)

(declare-fun b_and!35273 () Bool)

(assert (=> start!95642 (= tp!78734 b_and!35273)))

(declare-fun b!1080825 () Bool)

(declare-fun e!617833 () Bool)

(declare-fun tp_is_empty!26297 () Bool)

(assert (=> b!1080825 (= e!617833 tp_is_empty!26297)))

(declare-fun b!1080826 () Bool)

(declare-fun res!720379 () Bool)

(declare-fun e!617835 () Bool)

(assert (=> b!1080826 (=> (not res!720379) (not e!617835))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1080826 (= res!720379 (validKeyInArray!0 k!904))))

(declare-fun b!1080827 () Bool)

(declare-fun e!617834 () Bool)

(assert (=> b!1080827 (= e!617835 e!617834)))

(declare-fun res!720380 () Bool)

(assert (=> b!1080827 (=> (not res!720380) (not e!617834))))

(declare-datatypes ((array!69545 0))(
  ( (array!69546 (arr!33446 (Array (_ BitVec 32) (_ BitVec 64))) (size!33982 (_ BitVec 32))) )
))
(declare-fun lt!479115 () array!69545)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69545 (_ BitVec 32)) Bool)

(assert (=> b!1080827 (= res!720380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!479115 mask!1414))))

(declare-fun _keys!1070 () array!69545)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1080827 (= lt!479115 (array!69546 (store (arr!33446 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33982 _keys!1070)))))

(declare-fun b!1080828 () Bool)

(declare-fun res!720384 () Bool)

(assert (=> b!1080828 (=> (not res!720384) (not e!617835))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40189 0))(
  ( (V!40190 (val!13205 Int)) )
))
(declare-datatypes ((ValueCell!12439 0))(
  ( (ValueCellFull!12439 (v!15826 V!40189)) (EmptyCell!12439) )
))
(declare-datatypes ((array!69547 0))(
  ( (array!69548 (arr!33447 (Array (_ BitVec 32) ValueCell!12439)) (size!33983 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69547)

(assert (=> b!1080828 (= res!720384 (and (= (size!33983 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33982 _keys!1070) (size!33983 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080829 () Bool)

(assert (=> b!1080829 (= e!617834 (not true))))

(declare-fun defaultEntry!882 () Int)

(declare-fun minValue!831 () V!40189)

(declare-datatypes ((tuple2!16724 0))(
  ( (tuple2!16725 (_1!8373 (_ BitVec 64)) (_2!8373 V!40189)) )
))
(declare-datatypes ((List!23306 0))(
  ( (Nil!23303) (Cons!23302 (h!24511 tuple2!16724) (t!32665 List!23306)) )
))
(declare-datatypes ((ListLongMap!14693 0))(
  ( (ListLongMap!14694 (toList!7362 List!23306)) )
))
(declare-fun lt!479114 () ListLongMap!14693)

(declare-fun zeroValue!831 () V!40189)

(declare-fun getCurrentListMapNoExtraKeys!3910 (array!69545 array!69547 (_ BitVec 32) (_ BitVec 32) V!40189 V!40189 (_ BitVec 32) Int) ListLongMap!14693)

(assert (=> b!1080829 (= lt!479114 (getCurrentListMapNoExtraKeys!3910 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!69545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1080829 (arrayContainsKey!0 _keys!1070 k!904 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!35544 0))(
  ( (Unit!35545) )
))
(declare-fun lt!479116 () Unit!35544)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!69545 (_ BitVec 64) (_ BitVec 32)) Unit!35544)

(assert (=> b!1080829 (= lt!479116 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k!904 i!650))))

(declare-fun b!1080830 () Bool)

(declare-fun e!617836 () Bool)

(assert (=> b!1080830 (= e!617836 tp_is_empty!26297)))

(declare-fun mapNonEmpty!41200 () Bool)

(declare-fun mapRes!41200 () Bool)

(declare-fun tp!78733 () Bool)

(assert (=> mapNonEmpty!41200 (= mapRes!41200 (and tp!78733 e!617833))))

(declare-fun mapValue!41200 () ValueCell!12439)

(declare-fun mapRest!41200 () (Array (_ BitVec 32) ValueCell!12439))

(declare-fun mapKey!41200 () (_ BitVec 32))

(assert (=> mapNonEmpty!41200 (= (arr!33447 _values!874) (store mapRest!41200 mapKey!41200 mapValue!41200))))

(declare-fun b!1080831 () Bool)

(declare-fun res!720387 () Bool)

(assert (=> b!1080831 (=> (not res!720387) (not e!617834))))

(declare-datatypes ((List!23307 0))(
  ( (Nil!23304) (Cons!23303 (h!24512 (_ BitVec 64)) (t!32666 List!23307)) )
))
(declare-fun arrayNoDuplicates!0 (array!69545 (_ BitVec 32) List!23307) Bool)

(assert (=> b!1080831 (= res!720387 (arrayNoDuplicates!0 lt!479115 #b00000000000000000000000000000000 Nil!23304))))

(declare-fun b!1080832 () Bool)

(declare-fun res!720386 () Bool)

(assert (=> b!1080832 (=> (not res!720386) (not e!617835))))

(assert (=> b!1080832 (= res!720386 (= (select (arr!33446 _keys!1070) i!650) k!904))))

(declare-fun res!720383 () Bool)

(assert (=> start!95642 (=> (not res!720383) (not e!617835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95642 (= res!720383 (validMask!0 mask!1414))))

(assert (=> start!95642 e!617835))

(assert (=> start!95642 tp!78734))

(assert (=> start!95642 true))

(assert (=> start!95642 tp_is_empty!26297))

(declare-fun array_inv!25822 (array!69545) Bool)

(assert (=> start!95642 (array_inv!25822 _keys!1070)))

(declare-fun e!617832 () Bool)

(declare-fun array_inv!25823 (array!69547) Bool)

(assert (=> start!95642 (and (array_inv!25823 _values!874) e!617832)))

(declare-fun b!1080833 () Bool)

(declare-fun res!720381 () Bool)

(assert (=> b!1080833 (=> (not res!720381) (not e!617835))))

(assert (=> b!1080833 (= res!720381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun mapIsEmpty!41200 () Bool)

(assert (=> mapIsEmpty!41200 mapRes!41200))

(declare-fun b!1080834 () Bool)

(assert (=> b!1080834 (= e!617832 (and e!617836 mapRes!41200))))

(declare-fun condMapEmpty!41200 () Bool)

(declare-fun mapDefault!41200 () ValueCell!12439)

