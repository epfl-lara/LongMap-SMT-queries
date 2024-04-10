; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97136 () Bool)

(assert start!97136)

(declare-fun mapNonEmpty!42889 () Bool)

(declare-fun mapRes!42889 () Bool)

(declare-fun tp!81809 () Bool)

(declare-fun e!630660 () Bool)

(assert (=> mapNonEmpty!42889 (= mapRes!42889 (and tp!81809 e!630660))))

(declare-fun mapKey!42889 () (_ BitVec 32))

(declare-datatypes ((V!41637 0))(
  ( (V!41638 (val!13748 Int)) )
))
(declare-datatypes ((ValueCell!12982 0))(
  ( (ValueCellFull!12982 (v!16381 V!41637)) (EmptyCell!12982) )
))
(declare-fun mapRest!42889 () (Array (_ BitVec 32) ValueCell!12982))

(declare-fun mapValue!42889 () ValueCell!12982)

(declare-datatypes ((array!71687 0))(
  ( (array!71688 (arr!34497 (Array (_ BitVec 32) ValueCell!12982)) (size!35033 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71687)

(assert (=> mapNonEmpty!42889 (= (arr!34497 _values!996) (store mapRest!42889 mapKey!42889 mapValue!42889))))

(declare-fun b!1104928 () Bool)

(declare-fun e!630664 () Bool)

(declare-fun tp_is_empty!27383 () Bool)

(assert (=> b!1104928 (= e!630664 tp_is_empty!27383)))

(declare-fun b!1104929 () Bool)

(declare-fun e!630661 () Bool)

(assert (=> b!1104929 (= e!630661 (not true))))

(declare-datatypes ((array!71689 0))(
  ( (array!71690 (arr!34498 (Array (_ BitVec 32) (_ BitVec 64))) (size!35034 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71689)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71689 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1104929 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36256 0))(
  ( (Unit!36257) )
))
(declare-fun lt!495221 () Unit!36256)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71689 (_ BitVec 64) (_ BitVec 32)) Unit!36256)

(assert (=> b!1104929 (= lt!495221 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1104930 () Bool)

(declare-fun res!737220 () Bool)

(declare-fun e!630663 () Bool)

(assert (=> b!1104930 (=> (not res!737220) (not e!630663))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1104930 (= res!737220 (and (= (size!35033 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35034 _keys!1208) (size!35033 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42889 () Bool)

(assert (=> mapIsEmpty!42889 mapRes!42889))

(declare-fun b!1104931 () Bool)

(declare-fun e!630665 () Bool)

(assert (=> b!1104931 (= e!630665 (and e!630664 mapRes!42889))))

(declare-fun condMapEmpty!42889 () Bool)

(declare-fun mapDefault!42889 () ValueCell!12982)

