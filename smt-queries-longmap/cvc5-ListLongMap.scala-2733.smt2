; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40216 () Bool)

(assert start!40216)

(declare-fun b_free!10483 () Bool)

(declare-fun b_next!10483 () Bool)

(assert (=> start!40216 (= b_free!10483 (not b_next!10483))))

(declare-fun tp!36977 () Bool)

(declare-fun b_and!18451 () Bool)

(assert (=> start!40216 (= tp!36977 b_and!18451)))

(declare-fun b!440948 () Bool)

(declare-fun res!260917 () Bool)

(declare-fun e!259717 () Bool)

(assert (=> b!440948 (=> (not res!260917) (not e!259717))))

(declare-datatypes ((array!27083 0))(
  ( (array!27084 (arr!12991 (Array (_ BitVec 32) (_ BitVec 64))) (size!13343 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27083)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440948 (= res!260917 (or (= (select (arr!12991 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12991 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440949 () Bool)

(declare-fun e!259719 () Bool)

(declare-fun e!259714 () Bool)

(assert (=> b!440949 (= e!259719 e!259714)))

(declare-fun res!260919 () Bool)

(assert (=> b!440949 (=> (not res!260919) (not e!259714))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!440949 (= res!260919 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16619 0))(
  ( (V!16620 (val!5862 Int)) )
))
(declare-fun minValue!515 () V!16619)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5474 0))(
  ( (ValueCellFull!5474 (v!8109 V!16619)) (EmptyCell!5474) )
))
(declare-datatypes ((array!27085 0))(
  ( (array!27086 (arr!12992 (Array (_ BitVec 32) ValueCell!5474)) (size!13344 (_ BitVec 32))) )
))
(declare-fun lt!202745 () array!27085)

(declare-datatypes ((tuple2!7796 0))(
  ( (tuple2!7797 (_1!3909 (_ BitVec 64)) (_2!3909 V!16619)) )
))
(declare-datatypes ((List!7791 0))(
  ( (Nil!7788) (Cons!7787 (h!8643 tuple2!7796) (t!13547 List!7791)) )
))
(declare-datatypes ((ListLongMap!6709 0))(
  ( (ListLongMap!6710 (toList!3370 List!7791)) )
))
(declare-fun lt!202742 () ListLongMap!6709)

(declare-fun zeroValue!515 () V!16619)

(declare-fun lt!202744 () array!27083)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1559 (array!27083 array!27085 (_ BitVec 32) (_ BitVec 32) V!16619 V!16619 (_ BitVec 32) Int) ListLongMap!6709)

(assert (=> b!440949 (= lt!202742 (getCurrentListMapNoExtraKeys!1559 lt!202744 lt!202745 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!27085)

(declare-fun v!412 () V!16619)

(assert (=> b!440949 (= lt!202745 (array!27086 (store (arr!12992 _values!549) i!563 (ValueCellFull!5474 v!412)) (size!13344 _values!549)))))

(declare-fun lt!202741 () ListLongMap!6709)

(assert (=> b!440949 (= lt!202741 (getCurrentListMapNoExtraKeys!1559 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440950 () Bool)

(declare-fun res!260913 () Bool)

(assert (=> b!440950 (=> (not res!260913) (not e!259717))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440950 (= res!260913 (validKeyInArray!0 k!794))))

(declare-fun b!440951 () Bool)

(declare-fun res!260920 () Bool)

(assert (=> b!440951 (=> (not res!260920) (not e!259719))))

(declare-datatypes ((List!7792 0))(
  ( (Nil!7789) (Cons!7788 (h!8644 (_ BitVec 64)) (t!13548 List!7792)) )
))
(declare-fun arrayNoDuplicates!0 (array!27083 (_ BitVec 32) List!7792) Bool)

(assert (=> b!440951 (= res!260920 (arrayNoDuplicates!0 lt!202744 #b00000000000000000000000000000000 Nil!7789))))

(declare-fun res!260912 () Bool)

(assert (=> start!40216 (=> (not res!260912) (not e!259717))))

(assert (=> start!40216 (= res!260912 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13343 _keys!709))))))

(assert (=> start!40216 e!259717))

(declare-fun tp_is_empty!11635 () Bool)

(assert (=> start!40216 tp_is_empty!11635))

(assert (=> start!40216 tp!36977))

(assert (=> start!40216 true))

(declare-fun e!259713 () Bool)

(declare-fun array_inv!9428 (array!27085) Bool)

(assert (=> start!40216 (and (array_inv!9428 _values!549) e!259713)))

(declare-fun array_inv!9429 (array!27083) Bool)

(assert (=> start!40216 (array_inv!9429 _keys!709)))

(declare-fun b!440952 () Bool)

(declare-fun res!260921 () Bool)

(assert (=> b!440952 (=> (not res!260921) (not e!259717))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27083 (_ BitVec 32)) Bool)

(assert (=> b!440952 (= res!260921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440953 () Bool)

(assert (=> b!440953 (= e!259717 e!259719)))

(declare-fun res!260910 () Bool)

(assert (=> b!440953 (=> (not res!260910) (not e!259719))))

(assert (=> b!440953 (= res!260910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202744 mask!1025))))

(assert (=> b!440953 (= lt!202744 (array!27084 (store (arr!12991 _keys!709) i!563 k!794) (size!13343 _keys!709)))))

(declare-fun b!440954 () Bool)

(declare-fun res!260916 () Bool)

(assert (=> b!440954 (=> (not res!260916) (not e!259719))))

(assert (=> b!440954 (= res!260916 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!19074 () Bool)

(declare-fun mapRes!19074 () Bool)

(declare-fun tp!36978 () Bool)

(declare-fun e!259716 () Bool)

(assert (=> mapNonEmpty!19074 (= mapRes!19074 (and tp!36978 e!259716))))

(declare-fun mapValue!19074 () ValueCell!5474)

(declare-fun mapRest!19074 () (Array (_ BitVec 32) ValueCell!5474))

(declare-fun mapKey!19074 () (_ BitVec 32))

(assert (=> mapNonEmpty!19074 (= (arr!12992 _values!549) (store mapRest!19074 mapKey!19074 mapValue!19074))))

(declare-fun b!440955 () Bool)

(declare-fun res!260922 () Bool)

(assert (=> b!440955 (=> (not res!260922) (not e!259717))))

(declare-fun arrayContainsKey!0 (array!27083 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440955 (= res!260922 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!440956 () Bool)

(assert (=> b!440956 (= e!259714 (not true))))

(declare-fun +!1506 (ListLongMap!6709 tuple2!7796) ListLongMap!6709)

(assert (=> b!440956 (= (getCurrentListMapNoExtraKeys!1559 lt!202744 lt!202745 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1506 (getCurrentListMapNoExtraKeys!1559 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7797 k!794 v!412)))))

(declare-datatypes ((Unit!13116 0))(
  ( (Unit!13117) )
))
(declare-fun lt!202743 () Unit!13116)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!675 (array!27083 array!27085 (_ BitVec 32) (_ BitVec 32) V!16619 V!16619 (_ BitVec 32) (_ BitVec 64) V!16619 (_ BitVec 32) Int) Unit!13116)

(assert (=> b!440956 (= lt!202743 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!675 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440957 () Bool)

(declare-fun res!260911 () Bool)

(assert (=> b!440957 (=> (not res!260911) (not e!259717))))

(assert (=> b!440957 (= res!260911 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13343 _keys!709))))))

(declare-fun b!440958 () Bool)

(declare-fun e!259715 () Bool)

(assert (=> b!440958 (= e!259713 (and e!259715 mapRes!19074))))

(declare-fun condMapEmpty!19074 () Bool)

(declare-fun mapDefault!19074 () ValueCell!5474)

