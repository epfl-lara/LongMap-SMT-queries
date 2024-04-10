; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41066 () Bool)

(assert start!41066)

(declare-fun b_free!10979 () Bool)

(declare-fun b_next!10979 () Bool)

(assert (=> start!41066 (= b_free!10979 (not b_next!10979))))

(declare-fun tp!38766 () Bool)

(declare-fun b_and!19165 () Bool)

(assert (=> start!41066 (= tp!38766 b_and!19165)))

(declare-fun b!457985 () Bool)

(declare-fun res!273561 () Bool)

(declare-fun e!267419 () Bool)

(assert (=> b!457985 (=> (not res!273561) (not e!267419))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457985 (= res!273561 (bvsle from!863 i!563))))

(declare-fun b!457986 () Bool)

(declare-fun e!267423 () Bool)

(assert (=> b!457986 (= e!267423 true)))

(declare-datatypes ((V!17527 0))(
  ( (V!17528 (val!6203 Int)) )
))
(declare-datatypes ((tuple2!8172 0))(
  ( (tuple2!8173 (_1!4097 (_ BitVec 64)) (_2!4097 V!17527)) )
))
(declare-datatypes ((List!8245 0))(
  ( (Nil!8242) (Cons!8241 (h!9097 tuple2!8172) (t!14103 List!8245)) )
))
(declare-datatypes ((ListLongMap!7085 0))(
  ( (ListLongMap!7086 (toList!3558 List!8245)) )
))
(declare-fun lt!207162 () ListLongMap!7085)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5815 0))(
  ( (ValueCellFull!5815 (v!8473 V!17527)) (EmptyCell!5815) )
))
(declare-datatypes ((array!28435 0))(
  ( (array!28436 (arr!13660 (Array (_ BitVec 32) ValueCell!5815)) (size!14012 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28435)

(declare-fun lt!207161 () ListLongMap!7085)

(declare-datatypes ((array!28437 0))(
  ( (array!28438 (arr!13661 (Array (_ BitVec 32) (_ BitVec 64))) (size!14013 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28437)

(declare-fun +!1594 (ListLongMap!7085 tuple2!8172) ListLongMap!7085)

(declare-fun get!6726 (ValueCell!5815 V!17527) V!17527)

(declare-fun dynLambda!884 (Int (_ BitVec 64)) V!17527)

(assert (=> b!457986 (= lt!207162 (+!1594 lt!207161 (tuple2!8173 (select (arr!13661 _keys!709) from!863) (get!6726 (select (arr!13660 _values!549) from!863) (dynLambda!884 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457987 () Bool)

(declare-fun res!273567 () Bool)

(declare-fun e!267426 () Bool)

(assert (=> b!457987 (=> (not res!273567) (not e!267426))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!457987 (= res!273567 (and (= (size!14012 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14013 _keys!709) (size!14012 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457989 () Bool)

(declare-fun res!273568 () Bool)

(assert (=> b!457989 (=> (not res!273568) (not e!267426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28437 (_ BitVec 32)) Bool)

(assert (=> b!457989 (= res!273568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!457990 () Bool)

(declare-fun res!273560 () Bool)

(assert (=> b!457990 (=> (not res!273560) (not e!267426))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457990 (= res!273560 (validKeyInArray!0 k!794))))

(declare-fun b!457991 () Bool)

(assert (=> b!457991 (= e!267426 e!267419)))

(declare-fun res!273558 () Bool)

(assert (=> b!457991 (=> (not res!273558) (not e!267419))))

(declare-fun lt!207164 () array!28437)

(assert (=> b!457991 (= res!273558 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207164 mask!1025))))

(assert (=> b!457991 (= lt!207164 (array!28438 (store (arr!13661 _keys!709) i!563 k!794) (size!14013 _keys!709)))))

(declare-fun mapNonEmpty!20119 () Bool)

(declare-fun mapRes!20119 () Bool)

(declare-fun tp!38767 () Bool)

(declare-fun e!267425 () Bool)

(assert (=> mapNonEmpty!20119 (= mapRes!20119 (and tp!38767 e!267425))))

(declare-fun mapValue!20119 () ValueCell!5815)

(declare-fun mapRest!20119 () (Array (_ BitVec 32) ValueCell!5815))

(declare-fun mapKey!20119 () (_ BitVec 32))

(assert (=> mapNonEmpty!20119 (= (arr!13660 _values!549) (store mapRest!20119 mapKey!20119 mapValue!20119))))

(declare-fun b!457992 () Bool)

(declare-fun e!267424 () Bool)

(assert (=> b!457992 (= e!267424 (not e!267423))))

(declare-fun res!273570 () Bool)

(assert (=> b!457992 (=> res!273570 e!267423)))

(assert (=> b!457992 (= res!273570 (not (validKeyInArray!0 (select (arr!13661 _keys!709) from!863))))))

(declare-fun lt!207165 () ListLongMap!7085)

(assert (=> b!457992 (= lt!207165 lt!207161)))

(declare-fun lt!207168 () ListLongMap!7085)

(declare-fun v!412 () V!17527)

(assert (=> b!457992 (= lt!207161 (+!1594 lt!207168 (tuple2!8173 k!794 v!412)))))

(declare-fun minValue!515 () V!17527)

(declare-fun lt!207166 () array!28435)

(declare-fun zeroValue!515 () V!17527)

(declare-fun getCurrentListMapNoExtraKeys!1740 (array!28437 array!28435 (_ BitVec 32) (_ BitVec 32) V!17527 V!17527 (_ BitVec 32) Int) ListLongMap!7085)

(assert (=> b!457992 (= lt!207165 (getCurrentListMapNoExtraKeys!1740 lt!207164 lt!207166 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!457992 (= lt!207168 (getCurrentListMapNoExtraKeys!1740 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13308 0))(
  ( (Unit!13309) )
))
(declare-fun lt!207163 () Unit!13308)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!753 (array!28437 array!28435 (_ BitVec 32) (_ BitVec 32) V!17527 V!17527 (_ BitVec 32) (_ BitVec 64) V!17527 (_ BitVec 32) Int) Unit!13308)

(assert (=> b!457992 (= lt!207163 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!753 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457993 () Bool)

(declare-fun res!273566 () Bool)

(assert (=> b!457993 (=> (not res!273566) (not e!267426))))

(declare-fun arrayContainsKey!0 (array!28437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457993 (= res!273566 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!457994 () Bool)

(declare-fun e!267421 () Bool)

(declare-fun tp_is_empty!12317 () Bool)

(assert (=> b!457994 (= e!267421 tp_is_empty!12317)))

(declare-fun b!457995 () Bool)

(declare-fun res!273569 () Bool)

(assert (=> b!457995 (=> (not res!273569) (not e!267426))))

(declare-datatypes ((List!8246 0))(
  ( (Nil!8243) (Cons!8242 (h!9098 (_ BitVec 64)) (t!14104 List!8246)) )
))
(declare-fun arrayNoDuplicates!0 (array!28437 (_ BitVec 32) List!8246) Bool)

(assert (=> b!457995 (= res!273569 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8243))))

(declare-fun b!457996 () Bool)

(declare-fun res!273564 () Bool)

(assert (=> b!457996 (=> (not res!273564) (not e!267426))))

(assert (=> b!457996 (= res!273564 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14013 _keys!709))))))

(declare-fun b!457997 () Bool)

(declare-fun res!273565 () Bool)

(assert (=> b!457997 (=> (not res!273565) (not e!267426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457997 (= res!273565 (validMask!0 mask!1025))))

(declare-fun b!457988 () Bool)

(declare-fun res!273557 () Bool)

(assert (=> b!457988 (=> (not res!273557) (not e!267419))))

(assert (=> b!457988 (= res!273557 (arrayNoDuplicates!0 lt!207164 #b00000000000000000000000000000000 Nil!8243))))

(declare-fun res!273559 () Bool)

(assert (=> start!41066 (=> (not res!273559) (not e!267426))))

(assert (=> start!41066 (= res!273559 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14013 _keys!709))))))

(assert (=> start!41066 e!267426))

(assert (=> start!41066 tp_is_empty!12317))

(assert (=> start!41066 tp!38766))

(assert (=> start!41066 true))

(declare-fun e!267420 () Bool)

(declare-fun array_inv!9890 (array!28435) Bool)

(assert (=> start!41066 (and (array_inv!9890 _values!549) e!267420)))

(declare-fun array_inv!9891 (array!28437) Bool)

(assert (=> start!41066 (array_inv!9891 _keys!709)))

(declare-fun b!457998 () Bool)

(assert (=> b!457998 (= e!267420 (and e!267421 mapRes!20119))))

(declare-fun condMapEmpty!20119 () Bool)

(declare-fun mapDefault!20119 () ValueCell!5815)

