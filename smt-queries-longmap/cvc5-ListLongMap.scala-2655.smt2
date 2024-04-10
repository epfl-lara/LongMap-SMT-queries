; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39748 () Bool)

(assert start!39748)

(declare-fun b_free!10015 () Bool)

(declare-fun b_next!10015 () Bool)

(assert (=> start!39748 (= b_free!10015 (not b_next!10015))))

(declare-fun tp!35573 () Bool)

(declare-fun b_and!17689 () Bool)

(assert (=> start!39748 (= tp!35573 b_and!17689)))

(declare-fun b!427831 () Bool)

(declare-fun res!251022 () Bool)

(declare-fun e!253624 () Bool)

(assert (=> b!427831 (=> (not res!251022) (not e!253624))))

(declare-datatypes ((array!26171 0))(
  ( (array!26172 (arr!12535 (Array (_ BitVec 32) (_ BitVec 64))) (size!12887 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26171)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15995 0))(
  ( (V!15996 (val!5628 Int)) )
))
(declare-datatypes ((ValueCell!5240 0))(
  ( (ValueCellFull!5240 (v!7875 V!15995)) (EmptyCell!5240) )
))
(declare-datatypes ((array!26173 0))(
  ( (array!26174 (arr!12536 (Array (_ BitVec 32) ValueCell!5240)) (size!12888 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26173)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!427831 (= res!251022 (and (= (size!12888 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12887 _keys!709) (size!12888 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427832 () Bool)

(declare-fun res!251029 () Bool)

(assert (=> b!427832 (=> (not res!251029) (not e!253624))))

(declare-datatypes ((List!7414 0))(
  ( (Nil!7411) (Cons!7410 (h!8266 (_ BitVec 64)) (t!12878 List!7414)) )
))
(declare-fun arrayNoDuplicates!0 (array!26171 (_ BitVec 32) List!7414) Bool)

(assert (=> b!427832 (= res!251029 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7411))))

(declare-fun b!427833 () Bool)

(declare-fun res!251028 () Bool)

(assert (=> b!427833 (=> (not res!251028) (not e!253624))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427833 (= res!251028 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!427834 () Bool)

(declare-fun e!253627 () Bool)

(declare-fun tp_is_empty!11167 () Bool)

(assert (=> b!427834 (= e!253627 tp_is_empty!11167)))

(declare-fun b!427836 () Bool)

(declare-fun res!251031 () Bool)

(assert (=> b!427836 (=> (not res!251031) (not e!253624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427836 (= res!251031 (validMask!0 mask!1025))))

(declare-fun b!427837 () Bool)

(declare-fun res!251027 () Bool)

(assert (=> b!427837 (=> (not res!251027) (not e!253624))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26171 (_ BitVec 32)) Bool)

(assert (=> b!427837 (= res!251027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427838 () Bool)

(declare-fun res!251025 () Bool)

(assert (=> b!427838 (=> (not res!251025) (not e!253624))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427838 (= res!251025 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12887 _keys!709))))))

(declare-fun b!427839 () Bool)

(declare-fun res!251026 () Bool)

(assert (=> b!427839 (=> (not res!251026) (not e!253624))))

(assert (=> b!427839 (= res!251026 (or (= (select (arr!12535 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12535 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!427840 () Bool)

(declare-fun e!253623 () Bool)

(assert (=> b!427840 (= e!253623 tp_is_empty!11167)))

(declare-fun b!427841 () Bool)

(declare-fun e!253628 () Bool)

(declare-fun e!253629 () Bool)

(assert (=> b!427841 (= e!253628 e!253629)))

(declare-fun res!251021 () Bool)

(assert (=> b!427841 (=> (not res!251021) (not e!253629))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!427841 (= res!251021 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15995)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15995)

(declare-fun lt!195466 () array!26171)

(declare-fun lt!195470 () array!26173)

(declare-datatypes ((tuple2!7400 0))(
  ( (tuple2!7401 (_1!3711 (_ BitVec 64)) (_2!3711 V!15995)) )
))
(declare-datatypes ((List!7415 0))(
  ( (Nil!7412) (Cons!7411 (h!8267 tuple2!7400) (t!12879 List!7415)) )
))
(declare-datatypes ((ListLongMap!6313 0))(
  ( (ListLongMap!6314 (toList!3172 List!7415)) )
))
(declare-fun lt!195469 () ListLongMap!6313)

(declare-fun getCurrentListMapNoExtraKeys!1374 (array!26171 array!26173 (_ BitVec 32) (_ BitVec 32) V!15995 V!15995 (_ BitVec 32) Int) ListLongMap!6313)

(assert (=> b!427841 (= lt!195469 (getCurrentListMapNoExtraKeys!1374 lt!195466 lt!195470 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15995)

(assert (=> b!427841 (= lt!195470 (array!26174 (store (arr!12536 _values!549) i!563 (ValueCellFull!5240 v!412)) (size!12888 _values!549)))))

(declare-fun lt!195472 () ListLongMap!6313)

(assert (=> b!427841 (= lt!195472 (getCurrentListMapNoExtraKeys!1374 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427842 () Bool)

(declare-fun res!251034 () Bool)

(assert (=> b!427842 (=> (not res!251034) (not e!253628))))

(assert (=> b!427842 (= res!251034 (arrayNoDuplicates!0 lt!195466 #b00000000000000000000000000000000 Nil!7411))))

(declare-fun mapNonEmpty!18372 () Bool)

(declare-fun mapRes!18372 () Bool)

(declare-fun tp!35574 () Bool)

(assert (=> mapNonEmpty!18372 (= mapRes!18372 (and tp!35574 e!253623))))

(declare-fun mapValue!18372 () ValueCell!5240)

(declare-fun mapKey!18372 () (_ BitVec 32))

(declare-fun mapRest!18372 () (Array (_ BitVec 32) ValueCell!5240))

(assert (=> mapNonEmpty!18372 (= (arr!12536 _values!549) (store mapRest!18372 mapKey!18372 mapValue!18372))))

(declare-fun b!427843 () Bool)

(declare-fun e!253626 () Bool)

(assert (=> b!427843 (= e!253626 true)))

(declare-fun lt!195473 () ListLongMap!6313)

(declare-fun +!1327 (ListLongMap!6313 tuple2!7400) ListLongMap!6313)

(declare-fun get!6208 (ValueCell!5240 V!15995) V!15995)

(declare-fun dynLambda!755 (Int (_ BitVec 64)) V!15995)

(assert (=> b!427843 (= lt!195469 (+!1327 lt!195473 (tuple2!7401 (select (arr!12535 _keys!709) from!863) (get!6208 (select (arr!12536 _values!549) from!863) (dynLambda!755 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427844 () Bool)

(declare-fun res!251024 () Bool)

(assert (=> b!427844 (=> (not res!251024) (not e!253628))))

(assert (=> b!427844 (= res!251024 (bvsle from!863 i!563))))

(declare-fun b!427845 () Bool)

(declare-fun e!253625 () Bool)

(assert (=> b!427845 (= e!253625 (and e!253627 mapRes!18372))))

(declare-fun condMapEmpty!18372 () Bool)

(declare-fun mapDefault!18372 () ValueCell!5240)

