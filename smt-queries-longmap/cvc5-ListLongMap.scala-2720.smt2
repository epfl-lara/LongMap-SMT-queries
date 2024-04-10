; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40138 () Bool)

(assert start!40138)

(declare-fun b_free!10405 () Bool)

(declare-fun b_next!10405 () Bool)

(assert (=> start!40138 (= b_free!10405 (not b_next!10405))))

(declare-fun tp!36743 () Bool)

(declare-fun b_and!18373 () Bool)

(assert (=> start!40138 (= tp!36743 b_and!18373)))

(declare-fun b!439076 () Bool)

(declare-fun res!259395 () Bool)

(declare-fun e!258896 () Bool)

(assert (=> b!439076 (=> (not res!259395) (not e!258896))))

(declare-datatypes ((array!26931 0))(
  ( (array!26932 (arr!12915 (Array (_ BitVec 32) (_ BitVec 64))) (size!13267 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26931)

(declare-datatypes ((List!7727 0))(
  ( (Nil!7724) (Cons!7723 (h!8579 (_ BitVec 64)) (t!13483 List!7727)) )
))
(declare-fun arrayNoDuplicates!0 (array!26931 (_ BitVec 32) List!7727) Bool)

(assert (=> b!439076 (= res!259395 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7724))))

(declare-fun mapNonEmpty!18957 () Bool)

(declare-fun mapRes!18957 () Bool)

(declare-fun tp!36744 () Bool)

(declare-fun e!258898 () Bool)

(assert (=> mapNonEmpty!18957 (= mapRes!18957 (and tp!36744 e!258898))))

(declare-datatypes ((V!16515 0))(
  ( (V!16516 (val!5823 Int)) )
))
(declare-datatypes ((ValueCell!5435 0))(
  ( (ValueCellFull!5435 (v!8070 V!16515)) (EmptyCell!5435) )
))
(declare-datatypes ((array!26933 0))(
  ( (array!26934 (arr!12916 (Array (_ BitVec 32) ValueCell!5435)) (size!13268 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26933)

(declare-fun mapValue!18957 () ValueCell!5435)

(declare-fun mapKey!18957 () (_ BitVec 32))

(declare-fun mapRest!18957 () (Array (_ BitVec 32) ValueCell!5435))

(assert (=> mapNonEmpty!18957 (= (arr!12916 _values!549) (store mapRest!18957 mapKey!18957 mapValue!18957))))

(declare-fun b!439077 () Bool)

(declare-fun res!259394 () Bool)

(assert (=> b!439077 (=> (not res!259394) (not e!258896))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439077 (= res!259394 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13267 _keys!709))))))

(declare-fun b!439078 () Bool)

(declare-fun res!259392 () Bool)

(assert (=> b!439078 (=> (not res!259392) (not e!258896))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439078 (= res!259392 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!439079 () Bool)

(declare-fun tp_is_empty!11557 () Bool)

(assert (=> b!439079 (= e!258898 tp_is_empty!11557)))

(declare-fun b!439080 () Bool)

(declare-fun e!258899 () Bool)

(declare-fun e!258897 () Bool)

(assert (=> b!439080 (= e!258899 e!258897)))

(declare-fun res!259389 () Bool)

(assert (=> b!439080 (=> (not res!259389) (not e!258897))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!439080 (= res!259389 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16515)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!202159 () array!26931)

(declare-fun zeroValue!515 () V!16515)

(declare-fun lt!202156 () array!26933)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7730 0))(
  ( (tuple2!7731 (_1!3876 (_ BitVec 64)) (_2!3876 V!16515)) )
))
(declare-datatypes ((List!7728 0))(
  ( (Nil!7725) (Cons!7724 (h!8580 tuple2!7730) (t!13484 List!7728)) )
))
(declare-datatypes ((ListLongMap!6643 0))(
  ( (ListLongMap!6644 (toList!3337 List!7728)) )
))
(declare-fun lt!202158 () ListLongMap!6643)

(declare-fun getCurrentListMapNoExtraKeys!1526 (array!26931 array!26933 (_ BitVec 32) (_ BitVec 32) V!16515 V!16515 (_ BitVec 32) Int) ListLongMap!6643)

(assert (=> b!439080 (= lt!202158 (getCurrentListMapNoExtraKeys!1526 lt!202159 lt!202156 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16515)

(assert (=> b!439080 (= lt!202156 (array!26934 (store (arr!12916 _values!549) i!563 (ValueCellFull!5435 v!412)) (size!13268 _values!549)))))

(declare-fun lt!202160 () ListLongMap!6643)

(assert (=> b!439080 (= lt!202160 (getCurrentListMapNoExtraKeys!1526 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!439081 () Bool)

(declare-fun e!258895 () Bool)

(assert (=> b!439081 (= e!258895 tp_is_empty!11557)))

(declare-fun b!439082 () Bool)

(declare-fun res!259393 () Bool)

(assert (=> b!439082 (=> (not res!259393) (not e!258896))))

(assert (=> b!439082 (= res!259393 (or (= (select (arr!12915 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12915 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!259391 () Bool)

(assert (=> start!40138 (=> (not res!259391) (not e!258896))))

(assert (=> start!40138 (= res!259391 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13267 _keys!709))))))

(assert (=> start!40138 e!258896))

(assert (=> start!40138 tp_is_empty!11557))

(assert (=> start!40138 tp!36743))

(assert (=> start!40138 true))

(declare-fun e!258900 () Bool)

(declare-fun array_inv!9382 (array!26933) Bool)

(assert (=> start!40138 (and (array_inv!9382 _values!549) e!258900)))

(declare-fun array_inv!9383 (array!26931) Bool)

(assert (=> start!40138 (array_inv!9383 _keys!709)))

(declare-fun b!439083 () Bool)

(declare-fun res!259390 () Bool)

(assert (=> b!439083 (=> (not res!259390) (not e!258896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26931 (_ BitVec 32)) Bool)

(assert (=> b!439083 (= res!259390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439084 () Bool)

(assert (=> b!439084 (= e!258900 (and e!258895 mapRes!18957))))

(declare-fun condMapEmpty!18957 () Bool)

(declare-fun mapDefault!18957 () ValueCell!5435)

