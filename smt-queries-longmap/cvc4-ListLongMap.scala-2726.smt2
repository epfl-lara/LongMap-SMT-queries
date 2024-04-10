; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40178 () Bool)

(assert start!40178)

(declare-fun b_free!10445 () Bool)

(declare-fun b_next!10445 () Bool)

(assert (=> start!40178 (= b_free!10445 (not b_next!10445))))

(declare-fun tp!36863 () Bool)

(declare-fun b_and!18413 () Bool)

(assert (=> start!40178 (= tp!36863 b_and!18413)))

(declare-fun mapIsEmpty!19017 () Bool)

(declare-fun mapRes!19017 () Bool)

(assert (=> mapIsEmpty!19017 mapRes!19017))

(declare-fun res!260175 () Bool)

(declare-fun e!259317 () Bool)

(assert (=> start!40178 (=> (not res!260175) (not e!259317))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27009 0))(
  ( (array!27010 (arr!12954 (Array (_ BitVec 32) (_ BitVec 64))) (size!13306 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27009)

(assert (=> start!40178 (= res!260175 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13306 _keys!709))))))

(assert (=> start!40178 e!259317))

(declare-fun tp_is_empty!11597 () Bool)

(assert (=> start!40178 tp_is_empty!11597))

(assert (=> start!40178 tp!36863))

(assert (=> start!40178 true))

(declare-datatypes ((V!16567 0))(
  ( (V!16568 (val!5843 Int)) )
))
(declare-datatypes ((ValueCell!5455 0))(
  ( (ValueCellFull!5455 (v!8090 V!16567)) (EmptyCell!5455) )
))
(declare-datatypes ((array!27011 0))(
  ( (array!27012 (arr!12955 (Array (_ BitVec 32) ValueCell!5455)) (size!13307 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27011)

(declare-fun e!259319 () Bool)

(declare-fun array_inv!9406 (array!27011) Bool)

(assert (=> start!40178 (and (array_inv!9406 _values!549) e!259319)))

(declare-fun array_inv!9407 (array!27009) Bool)

(assert (=> start!40178 (array_inv!9407 _keys!709)))

(declare-fun mapNonEmpty!19017 () Bool)

(declare-fun tp!36864 () Bool)

(declare-fun e!259315 () Bool)

(assert (=> mapNonEmpty!19017 (= mapRes!19017 (and tp!36864 e!259315))))

(declare-fun mapValue!19017 () ValueCell!5455)

(declare-fun mapRest!19017 () (Array (_ BitVec 32) ValueCell!5455))

(declare-fun mapKey!19017 () (_ BitVec 32))

(assert (=> mapNonEmpty!19017 (= (arr!12955 _values!549) (store mapRest!19017 mapKey!19017 mapValue!19017))))

(declare-fun b!440036 () Bool)

(declare-fun res!260169 () Bool)

(assert (=> b!440036 (=> (not res!260169) (not e!259317))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27009 (_ BitVec 32)) Bool)

(assert (=> b!440036 (= res!260169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440037 () Bool)

(declare-fun res!260177 () Bool)

(declare-fun e!259316 () Bool)

(assert (=> b!440037 (=> (not res!260177) (not e!259316))))

(declare-fun lt!202458 () array!27009)

(declare-datatypes ((List!7760 0))(
  ( (Nil!7757) (Cons!7756 (h!8612 (_ BitVec 64)) (t!13516 List!7760)) )
))
(declare-fun arrayNoDuplicates!0 (array!27009 (_ BitVec 32) List!7760) Bool)

(assert (=> b!440037 (= res!260177 (arrayNoDuplicates!0 lt!202458 #b00000000000000000000000000000000 Nil!7757))))

(declare-fun b!440038 () Bool)

(declare-fun res!260171 () Bool)

(assert (=> b!440038 (=> (not res!260171) (not e!259317))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!440038 (= res!260171 (and (= (size!13307 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13306 _keys!709) (size!13307 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!440039 () Bool)

(assert (=> b!440039 (= e!259317 e!259316)))

(declare-fun res!260179 () Bool)

(assert (=> b!440039 (=> (not res!260179) (not e!259316))))

(assert (=> b!440039 (= res!260179 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202458 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440039 (= lt!202458 (array!27010 (store (arr!12954 _keys!709) i!563 k!794) (size!13306 _keys!709)))))

(declare-fun b!440040 () Bool)

(declare-fun res!260173 () Bool)

(assert (=> b!440040 (=> (not res!260173) (not e!259317))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440040 (= res!260173 (validKeyInArray!0 k!794))))

(declare-fun b!440041 () Bool)

(declare-fun res!260170 () Bool)

(assert (=> b!440041 (=> (not res!260170) (not e!259317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440041 (= res!260170 (validMask!0 mask!1025))))

(declare-fun b!440042 () Bool)

(declare-fun res!260172 () Bool)

(assert (=> b!440042 (=> (not res!260172) (not e!259316))))

(assert (=> b!440042 (= res!260172 (bvsle from!863 i!563))))

(declare-fun b!440043 () Bool)

(assert (=> b!440043 (= e!259315 tp_is_empty!11597)))

(declare-fun b!440044 () Bool)

(declare-fun res!260178 () Bool)

(assert (=> b!440044 (=> (not res!260178) (not e!259317))))

(assert (=> b!440044 (= res!260178 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13306 _keys!709))))))

(declare-fun b!440045 () Bool)

(declare-fun res!260174 () Bool)

(assert (=> b!440045 (=> (not res!260174) (not e!259317))))

(assert (=> b!440045 (= res!260174 (or (= (select (arr!12954 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12954 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440046 () Bool)

(declare-fun e!259318 () Bool)

(assert (=> b!440046 (= e!259316 e!259318)))

(declare-fun res!260180 () Bool)

(assert (=> b!440046 (=> (not res!260180) (not e!259318))))

(assert (=> b!440046 (= res!260180 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16567)

(declare-fun lt!202459 () array!27011)

(declare-fun minValue!515 () V!16567)

(declare-datatypes ((tuple2!7762 0))(
  ( (tuple2!7763 (_1!3892 (_ BitVec 64)) (_2!3892 V!16567)) )
))
(declare-datatypes ((List!7761 0))(
  ( (Nil!7758) (Cons!7757 (h!8613 tuple2!7762) (t!13517 List!7761)) )
))
(declare-datatypes ((ListLongMap!6675 0))(
  ( (ListLongMap!6676 (toList!3353 List!7761)) )
))
(declare-fun lt!202457 () ListLongMap!6675)

(declare-fun getCurrentListMapNoExtraKeys!1542 (array!27009 array!27011 (_ BitVec 32) (_ BitVec 32) V!16567 V!16567 (_ BitVec 32) Int) ListLongMap!6675)

(assert (=> b!440046 (= lt!202457 (getCurrentListMapNoExtraKeys!1542 lt!202458 lt!202459 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16567)

(assert (=> b!440046 (= lt!202459 (array!27012 (store (arr!12955 _values!549) i!563 (ValueCellFull!5455 v!412)) (size!13307 _values!549)))))

(declare-fun lt!202460 () ListLongMap!6675)

(assert (=> b!440046 (= lt!202460 (getCurrentListMapNoExtraKeys!1542 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440047 () Bool)

(assert (=> b!440047 (= e!259318 (not true))))

(declare-fun +!1493 (ListLongMap!6675 tuple2!7762) ListLongMap!6675)

(assert (=> b!440047 (= (getCurrentListMapNoExtraKeys!1542 lt!202458 lt!202459 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1493 (getCurrentListMapNoExtraKeys!1542 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7763 k!794 v!412)))))

(declare-datatypes ((Unit!13090 0))(
  ( (Unit!13091) )
))
(declare-fun lt!202456 () Unit!13090)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!662 (array!27009 array!27011 (_ BitVec 32) (_ BitVec 32) V!16567 V!16567 (_ BitVec 32) (_ BitVec 64) V!16567 (_ BitVec 32) Int) Unit!13090)

(assert (=> b!440047 (= lt!202456 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!662 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440048 () Bool)

(declare-fun e!259314 () Bool)

(assert (=> b!440048 (= e!259314 tp_is_empty!11597)))

(declare-fun b!440049 () Bool)

(assert (=> b!440049 (= e!259319 (and e!259314 mapRes!19017))))

(declare-fun condMapEmpty!19017 () Bool)

(declare-fun mapDefault!19017 () ValueCell!5455)

