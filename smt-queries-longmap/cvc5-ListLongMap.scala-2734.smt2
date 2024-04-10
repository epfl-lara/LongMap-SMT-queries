; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40222 () Bool)

(assert start!40222)

(declare-fun b_free!10489 () Bool)

(declare-fun b_next!10489 () Bool)

(assert (=> start!40222 (= b_free!10489 (not b_next!10489))))

(declare-fun tp!36995 () Bool)

(declare-fun b_and!18457 () Bool)

(assert (=> start!40222 (= tp!36995 b_and!18457)))

(declare-fun b!441092 () Bool)

(declare-fun e!259780 () Bool)

(declare-fun e!259778 () Bool)

(assert (=> b!441092 (= e!259780 e!259778)))

(declare-fun res!261035 () Bool)

(assert (=> b!441092 (=> (not res!261035) (not e!259778))))

(declare-datatypes ((array!27095 0))(
  ( (array!27096 (arr!12997 (Array (_ BitVec 32) (_ BitVec 64))) (size!13349 (_ BitVec 32))) )
))
(declare-fun lt!202789 () array!27095)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27095 (_ BitVec 32)) Bool)

(assert (=> b!441092 (= res!261035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202789 mask!1025))))

(declare-fun _keys!709 () array!27095)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441092 (= lt!202789 (array!27096 (store (arr!12997 _keys!709) i!563 k!794) (size!13349 _keys!709)))))

(declare-fun b!441093 () Bool)

(declare-fun e!259779 () Bool)

(assert (=> b!441093 (= e!259779 (not true))))

(declare-datatypes ((V!16627 0))(
  ( (V!16628 (val!5865 Int)) )
))
(declare-fun minValue!515 () V!16627)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5477 0))(
  ( (ValueCellFull!5477 (v!8112 V!16627)) (EmptyCell!5477) )
))
(declare-datatypes ((array!27097 0))(
  ( (array!27098 (arr!12998 (Array (_ BitVec 32) ValueCell!5477)) (size!13350 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27097)

(declare-fun zeroValue!515 () V!16627)

(declare-fun lt!202787 () array!27097)

(declare-fun v!412 () V!16627)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7802 0))(
  ( (tuple2!7803 (_1!3912 (_ BitVec 64)) (_2!3912 V!16627)) )
))
(declare-datatypes ((List!7797 0))(
  ( (Nil!7794) (Cons!7793 (h!8649 tuple2!7802) (t!13553 List!7797)) )
))
(declare-datatypes ((ListLongMap!6715 0))(
  ( (ListLongMap!6716 (toList!3373 List!7797)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1562 (array!27095 array!27097 (_ BitVec 32) (_ BitVec 32) V!16627 V!16627 (_ BitVec 32) Int) ListLongMap!6715)

(declare-fun +!1509 (ListLongMap!6715 tuple2!7802) ListLongMap!6715)

(assert (=> b!441093 (= (getCurrentListMapNoExtraKeys!1562 lt!202789 lt!202787 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1509 (getCurrentListMapNoExtraKeys!1562 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7803 k!794 v!412)))))

(declare-datatypes ((Unit!13122 0))(
  ( (Unit!13123) )
))
(declare-fun lt!202786 () Unit!13122)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!678 (array!27095 array!27097 (_ BitVec 32) (_ BitVec 32) V!16627 V!16627 (_ BitVec 32) (_ BitVec 64) V!16627 (_ BitVec 32) Int) Unit!13122)

(assert (=> b!441093 (= lt!202786 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!678 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441094 () Bool)

(declare-fun res!261031 () Bool)

(assert (=> b!441094 (=> (not res!261031) (not e!259780))))

(assert (=> b!441094 (= res!261031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441095 () Bool)

(declare-fun e!259777 () Bool)

(declare-fun tp_is_empty!11641 () Bool)

(assert (=> b!441095 (= e!259777 tp_is_empty!11641)))

(declare-fun b!441096 () Bool)

(assert (=> b!441096 (= e!259778 e!259779)))

(declare-fun res!261036 () Bool)

(assert (=> b!441096 (=> (not res!261036) (not e!259779))))

(assert (=> b!441096 (= res!261036 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202790 () ListLongMap!6715)

(assert (=> b!441096 (= lt!202790 (getCurrentListMapNoExtraKeys!1562 lt!202789 lt!202787 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!441096 (= lt!202787 (array!27098 (store (arr!12998 _values!549) i!563 (ValueCellFull!5477 v!412)) (size!13350 _values!549)))))

(declare-fun lt!202788 () ListLongMap!6715)

(assert (=> b!441096 (= lt!202788 (getCurrentListMapNoExtraKeys!1562 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441097 () Bool)

(declare-fun res!261027 () Bool)

(assert (=> b!441097 (=> (not res!261027) (not e!259778))))

(declare-datatypes ((List!7798 0))(
  ( (Nil!7795) (Cons!7794 (h!8650 (_ BitVec 64)) (t!13554 List!7798)) )
))
(declare-fun arrayNoDuplicates!0 (array!27095 (_ BitVec 32) List!7798) Bool)

(assert (=> b!441097 (= res!261027 (arrayNoDuplicates!0 lt!202789 #b00000000000000000000000000000000 Nil!7795))))

(declare-fun b!441098 () Bool)

(declare-fun res!261039 () Bool)

(assert (=> b!441098 (=> (not res!261039) (not e!259780))))

(assert (=> b!441098 (= res!261039 (or (= (select (arr!12997 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12997 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441099 () Bool)

(declare-fun res!261038 () Bool)

(assert (=> b!441099 (=> (not res!261038) (not e!259780))))

(declare-fun arrayContainsKey!0 (array!27095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441099 (= res!261038 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!441100 () Bool)

(declare-fun res!261033 () Bool)

(assert (=> b!441100 (=> (not res!261033) (not e!259780))))

(assert (=> b!441100 (= res!261033 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13349 _keys!709))))))

(declare-fun res!261032 () Bool)

(assert (=> start!40222 (=> (not res!261032) (not e!259780))))

(assert (=> start!40222 (= res!261032 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13349 _keys!709))))))

(assert (=> start!40222 e!259780))

(assert (=> start!40222 tp_is_empty!11641))

(assert (=> start!40222 tp!36995))

(assert (=> start!40222 true))

(declare-fun e!259782 () Bool)

(declare-fun array_inv!9434 (array!27097) Bool)

(assert (=> start!40222 (and (array_inv!9434 _values!549) e!259782)))

(declare-fun array_inv!9435 (array!27095) Bool)

(assert (=> start!40222 (array_inv!9435 _keys!709)))

(declare-fun b!441101 () Bool)

(declare-fun res!261028 () Bool)

(assert (=> b!441101 (=> (not res!261028) (not e!259780))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441101 (= res!261028 (validKeyInArray!0 k!794))))

(declare-fun b!441102 () Bool)

(declare-fun res!261037 () Bool)

(assert (=> b!441102 (=> (not res!261037) (not e!259780))))

(assert (=> b!441102 (= res!261037 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7795))))

(declare-fun b!441103 () Bool)

(declare-fun res!261034 () Bool)

(assert (=> b!441103 (=> (not res!261034) (not e!259780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441103 (= res!261034 (validMask!0 mask!1025))))

(declare-fun b!441104 () Bool)

(declare-fun e!259776 () Bool)

(assert (=> b!441104 (= e!259776 tp_is_empty!11641)))

(declare-fun mapNonEmpty!19083 () Bool)

(declare-fun mapRes!19083 () Bool)

(declare-fun tp!36996 () Bool)

(assert (=> mapNonEmpty!19083 (= mapRes!19083 (and tp!36996 e!259776))))

(declare-fun mapRest!19083 () (Array (_ BitVec 32) ValueCell!5477))

(declare-fun mapKey!19083 () (_ BitVec 32))

(declare-fun mapValue!19083 () ValueCell!5477)

(assert (=> mapNonEmpty!19083 (= (arr!12998 _values!549) (store mapRest!19083 mapKey!19083 mapValue!19083))))

(declare-fun b!441105 () Bool)

(declare-fun res!261030 () Bool)

(assert (=> b!441105 (=> (not res!261030) (not e!259780))))

(assert (=> b!441105 (= res!261030 (and (= (size!13350 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13349 _keys!709) (size!13350 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441106 () Bool)

(assert (=> b!441106 (= e!259782 (and e!259777 mapRes!19083))))

(declare-fun condMapEmpty!19083 () Bool)

(declare-fun mapDefault!19083 () ValueCell!5477)

