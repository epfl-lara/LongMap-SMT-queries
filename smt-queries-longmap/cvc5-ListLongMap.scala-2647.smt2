; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39700 () Bool)

(assert start!39700)

(declare-fun b_free!9967 () Bool)

(declare-fun b_next!9967 () Bool)

(assert (=> start!39700 (= b_free!9967 (not b_next!9967))))

(declare-fun tp!35430 () Bool)

(declare-fun b_and!17623 () Bool)

(assert (=> start!39700 (= tp!35430 b_and!17623)))

(declare-fun b!426623 () Bool)

(declare-fun res!250055 () Bool)

(declare-fun e!253086 () Bool)

(assert (=> b!426623 (=> (not res!250055) (not e!253086))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426623 (= res!250055 (validMask!0 mask!1025))))

(declare-fun b!426624 () Bool)

(declare-fun e!253084 () Bool)

(declare-fun e!253085 () Bool)

(assert (=> b!426624 (= e!253084 e!253085)))

(declare-fun res!250050 () Bool)

(assert (=> b!426624 (=> (not res!250050) (not e!253085))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426624 (= res!250050 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!15931 0))(
  ( (V!15932 (val!5604 Int)) )
))
(declare-fun minValue!515 () V!15931)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7364 0))(
  ( (tuple2!7365 (_1!3693 (_ BitVec 64)) (_2!3693 V!15931)) )
))
(declare-datatypes ((List!7379 0))(
  ( (Nil!7376) (Cons!7375 (h!8231 tuple2!7364) (t!12823 List!7379)) )
))
(declare-datatypes ((ListLongMap!6277 0))(
  ( (ListLongMap!6278 (toList!3154 List!7379)) )
))
(declare-fun lt!195023 () ListLongMap!6277)

(declare-fun zeroValue!515 () V!15931)

(declare-datatypes ((array!26077 0))(
  ( (array!26078 (arr!12488 (Array (_ BitVec 32) (_ BitVec 64))) (size!12840 (_ BitVec 32))) )
))
(declare-fun lt!195020 () array!26077)

(declare-datatypes ((ValueCell!5216 0))(
  ( (ValueCellFull!5216 (v!7851 V!15931)) (EmptyCell!5216) )
))
(declare-datatypes ((array!26079 0))(
  ( (array!26080 (arr!12489 (Array (_ BitVec 32) ValueCell!5216)) (size!12841 (_ BitVec 32))) )
))
(declare-fun lt!195022 () array!26079)

(declare-fun getCurrentListMapNoExtraKeys!1358 (array!26077 array!26079 (_ BitVec 32) (_ BitVec 32) V!15931 V!15931 (_ BitVec 32) Int) ListLongMap!6277)

(assert (=> b!426624 (= lt!195023 (getCurrentListMapNoExtraKeys!1358 lt!195020 lt!195022 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26079)

(declare-fun v!412 () V!15931)

(assert (=> b!426624 (= lt!195022 (array!26080 (store (arr!12489 _values!549) i!563 (ValueCellFull!5216 v!412)) (size!12841 _values!549)))))

(declare-fun lt!195021 () ListLongMap!6277)

(declare-fun _keys!709 () array!26077)

(assert (=> b!426624 (= lt!195021 (getCurrentListMapNoExtraKeys!1358 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426625 () Bool)

(declare-fun res!250059 () Bool)

(assert (=> b!426625 (=> (not res!250059) (not e!253086))))

(assert (=> b!426625 (= res!250059 (or (= (select (arr!12488 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12488 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426626 () Bool)

(declare-fun res!250053 () Bool)

(assert (=> b!426626 (=> (not res!250053) (not e!253086))))

(declare-datatypes ((List!7380 0))(
  ( (Nil!7377) (Cons!7376 (h!8232 (_ BitVec 64)) (t!12824 List!7380)) )
))
(declare-fun arrayNoDuplicates!0 (array!26077 (_ BitVec 32) List!7380) Bool)

(assert (=> b!426626 (= res!250053 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7377))))

(declare-fun res!250048 () Bool)

(assert (=> start!39700 (=> (not res!250048) (not e!253086))))

(assert (=> start!39700 (= res!250048 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12840 _keys!709))))))

(assert (=> start!39700 e!253086))

(declare-fun tp_is_empty!11119 () Bool)

(assert (=> start!39700 tp_is_empty!11119))

(assert (=> start!39700 tp!35430))

(assert (=> start!39700 true))

(declare-fun e!253081 () Bool)

(declare-fun array_inv!9104 (array!26079) Bool)

(assert (=> start!39700 (and (array_inv!9104 _values!549) e!253081)))

(declare-fun array_inv!9105 (array!26077) Bool)

(assert (=> start!39700 (array_inv!9105 _keys!709)))

(declare-fun mapIsEmpty!18300 () Bool)

(declare-fun mapRes!18300 () Bool)

(assert (=> mapIsEmpty!18300 mapRes!18300))

(declare-fun b!426627 () Bool)

(declare-fun res!250052 () Bool)

(assert (=> b!426627 (=> (not res!250052) (not e!253086))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426627 (= res!250052 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18300 () Bool)

(declare-fun tp!35429 () Bool)

(declare-fun e!253080 () Bool)

(assert (=> mapNonEmpty!18300 (= mapRes!18300 (and tp!35429 e!253080))))

(declare-fun mapKey!18300 () (_ BitVec 32))

(declare-fun mapValue!18300 () ValueCell!5216)

(declare-fun mapRest!18300 () (Array (_ BitVec 32) ValueCell!5216))

(assert (=> mapNonEmpty!18300 (= (arr!12489 _values!549) (store mapRest!18300 mapKey!18300 mapValue!18300))))

(declare-fun b!426628 () Bool)

(assert (=> b!426628 (= e!253086 e!253084)))

(declare-fun res!250054 () Bool)

(assert (=> b!426628 (=> (not res!250054) (not e!253084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26077 (_ BitVec 32)) Bool)

(assert (=> b!426628 (= res!250054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195020 mask!1025))))

(assert (=> b!426628 (= lt!195020 (array!26078 (store (arr!12488 _keys!709) i!563 k!794) (size!12840 _keys!709)))))

(declare-fun b!426629 () Bool)

(assert (=> b!426629 (= e!253080 tp_is_empty!11119)))

(declare-fun b!426630 () Bool)

(declare-fun e!253082 () Bool)

(assert (=> b!426630 (= e!253081 (and e!253082 mapRes!18300))))

(declare-fun condMapEmpty!18300 () Bool)

(declare-fun mapDefault!18300 () ValueCell!5216)

