; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40172 () Bool)

(assert start!40172)

(declare-fun b_free!10439 () Bool)

(declare-fun b_next!10439 () Bool)

(assert (=> start!40172 (= b_free!10439 (not b_next!10439))))

(declare-fun tp!36845 () Bool)

(declare-fun b_and!18407 () Bool)

(assert (=> start!40172 (= tp!36845 b_and!18407)))

(declare-fun b!439892 () Bool)

(declare-fun e!259252 () Bool)

(declare-fun e!259251 () Bool)

(assert (=> b!439892 (= e!259252 e!259251)))

(declare-fun res!260054 () Bool)

(assert (=> b!439892 (=> (not res!260054) (not e!259251))))

(declare-datatypes ((array!26997 0))(
  ( (array!26998 (arr!12948 (Array (_ BitVec 32) (_ BitVec 64))) (size!13300 (_ BitVec 32))) )
))
(declare-fun lt!202412 () array!26997)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26997 (_ BitVec 32)) Bool)

(assert (=> b!439892 (= res!260054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202412 mask!1025))))

(declare-fun _keys!709 () array!26997)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!439892 (= lt!202412 (array!26998 (store (arr!12948 _keys!709) i!563 k!794) (size!13300 _keys!709)))))

(declare-fun b!439893 () Bool)

(declare-fun res!260053 () Bool)

(assert (=> b!439893 (=> (not res!260053) (not e!259252))))

(declare-datatypes ((List!7754 0))(
  ( (Nil!7751) (Cons!7750 (h!8606 (_ BitVec 64)) (t!13510 List!7754)) )
))
(declare-fun arrayNoDuplicates!0 (array!26997 (_ BitVec 32) List!7754) Bool)

(assert (=> b!439893 (= res!260053 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7751))))

(declare-fun b!439894 () Bool)

(declare-fun res!260055 () Bool)

(assert (=> b!439894 (=> (not res!260055) (not e!259252))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16559 0))(
  ( (V!16560 (val!5840 Int)) )
))
(declare-datatypes ((ValueCell!5452 0))(
  ( (ValueCellFull!5452 (v!8087 V!16559)) (EmptyCell!5452) )
))
(declare-datatypes ((array!26999 0))(
  ( (array!27000 (arr!12949 (Array (_ BitVec 32) ValueCell!5452)) (size!13301 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26999)

(assert (=> b!439894 (= res!260055 (and (= (size!13301 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13300 _keys!709) (size!13301 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19008 () Bool)

(declare-fun mapRes!19008 () Bool)

(declare-fun tp!36846 () Bool)

(declare-fun e!259254 () Bool)

(assert (=> mapNonEmpty!19008 (= mapRes!19008 (and tp!36846 e!259254))))

(declare-fun mapRest!19008 () (Array (_ BitVec 32) ValueCell!5452))

(declare-fun mapKey!19008 () (_ BitVec 32))

(declare-fun mapValue!19008 () ValueCell!5452)

(assert (=> mapNonEmpty!19008 (= (arr!12949 _values!549) (store mapRest!19008 mapKey!19008 mapValue!19008))))

(declare-fun b!439895 () Bool)

(declare-fun res!260064 () Bool)

(assert (=> b!439895 (=> (not res!260064) (not e!259252))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439895 (= res!260064 (validKeyInArray!0 k!794))))

(declare-fun b!439896 () Bool)

(declare-fun res!260056 () Bool)

(assert (=> b!439896 (=> (not res!260056) (not e!259252))))

(assert (=> b!439896 (= res!260056 (or (= (select (arr!12948 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12948 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439897 () Bool)

(declare-fun e!259253 () Bool)

(assert (=> b!439897 (= e!259253 (not true))))

(declare-fun minValue!515 () V!16559)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16559)

(declare-fun lt!202414 () array!26999)

(declare-fun v!412 () V!16559)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7756 0))(
  ( (tuple2!7757 (_1!3889 (_ BitVec 64)) (_2!3889 V!16559)) )
))
(declare-datatypes ((List!7755 0))(
  ( (Nil!7752) (Cons!7751 (h!8607 tuple2!7756) (t!13511 List!7755)) )
))
(declare-datatypes ((ListLongMap!6669 0))(
  ( (ListLongMap!6670 (toList!3350 List!7755)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1539 (array!26997 array!26999 (_ BitVec 32) (_ BitVec 32) V!16559 V!16559 (_ BitVec 32) Int) ListLongMap!6669)

(declare-fun +!1490 (ListLongMap!6669 tuple2!7756) ListLongMap!6669)

(assert (=> b!439897 (= (getCurrentListMapNoExtraKeys!1539 lt!202412 lt!202414 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1490 (getCurrentListMapNoExtraKeys!1539 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7757 k!794 v!412)))))

(declare-datatypes ((Unit!13084 0))(
  ( (Unit!13085) )
))
(declare-fun lt!202411 () Unit!13084)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!659 (array!26997 array!26999 (_ BitVec 32) (_ BitVec 32) V!16559 V!16559 (_ BitVec 32) (_ BitVec 64) V!16559 (_ BitVec 32) Int) Unit!13084)

(assert (=> b!439897 (= lt!202411 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!659 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439898 () Bool)

(declare-fun tp_is_empty!11591 () Bool)

(assert (=> b!439898 (= e!259254 tp_is_empty!11591)))

(declare-fun b!439899 () Bool)

(declare-fun e!259255 () Bool)

(assert (=> b!439899 (= e!259255 tp_is_empty!11591)))

(declare-fun b!439900 () Bool)

(declare-fun res!260057 () Bool)

(assert (=> b!439900 (=> (not res!260057) (not e!259252))))

(assert (=> b!439900 (= res!260057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439901 () Bool)

(declare-fun res!260060 () Bool)

(assert (=> b!439901 (=> (not res!260060) (not e!259252))))

(assert (=> b!439901 (= res!260060 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13300 _keys!709))))))

(declare-fun b!439902 () Bool)

(declare-fun res!260061 () Bool)

(assert (=> b!439902 (=> (not res!260061) (not e!259252))))

(declare-fun arrayContainsKey!0 (array!26997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439902 (= res!260061 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!439903 () Bool)

(declare-fun res!260062 () Bool)

(assert (=> b!439903 (=> (not res!260062) (not e!259252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439903 (= res!260062 (validMask!0 mask!1025))))

(declare-fun b!439904 () Bool)

(declare-fun res!260058 () Bool)

(assert (=> b!439904 (=> (not res!260058) (not e!259251))))

(assert (=> b!439904 (= res!260058 (arrayNoDuplicates!0 lt!202412 #b00000000000000000000000000000000 Nil!7751))))

(declare-fun b!439905 () Bool)

(declare-fun e!259257 () Bool)

(assert (=> b!439905 (= e!259257 (and e!259255 mapRes!19008))))

(declare-fun condMapEmpty!19008 () Bool)

(declare-fun mapDefault!19008 () ValueCell!5452)

