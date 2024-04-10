; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39514 () Bool)

(assert start!39514)

(declare-fun b_free!9781 () Bool)

(declare-fun b_next!9781 () Bool)

(assert (=> start!39514 (= b_free!9781 (not b_next!9781))))

(declare-fun tp!34871 () Bool)

(declare-fun b_and!17437 () Bool)

(assert (=> start!39514 (= tp!34871 b_and!17437)))

(declare-fun b!422319 () Bool)

(declare-fun res!246583 () Bool)

(declare-fun e!251289 () Bool)

(assert (=> b!422319 (=> (not res!246583) (not e!251289))))

(declare-datatypes ((array!25713 0))(
  ( (array!25714 (arr!12306 (Array (_ BitVec 32) (_ BitVec 64))) (size!12658 (_ BitVec 32))) )
))
(declare-fun lt!193944 () array!25713)

(declare-datatypes ((List!7241 0))(
  ( (Nil!7238) (Cons!7237 (h!8093 (_ BitVec 64)) (t!12685 List!7241)) )
))
(declare-fun arrayNoDuplicates!0 (array!25713 (_ BitVec 32) List!7241) Bool)

(assert (=> b!422319 (= res!246583 (arrayNoDuplicates!0 lt!193944 #b00000000000000000000000000000000 Nil!7238))))

(declare-fun b!422320 () Bool)

(declare-fun res!246591 () Bool)

(declare-fun e!251288 () Bool)

(assert (=> b!422320 (=> (not res!246591) (not e!251288))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422320 (= res!246591 (validMask!0 mask!1025))))

(declare-fun b!422321 () Bool)

(assert (=> b!422321 (= e!251289 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15683 0))(
  ( (V!15684 (val!5511 Int)) )
))
(declare-fun minValue!515 () V!15683)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15683)

(declare-fun v!412 () V!15683)

(declare-datatypes ((tuple2!7236 0))(
  ( (tuple2!7237 (_1!3629 (_ BitVec 64)) (_2!3629 V!15683)) )
))
(declare-datatypes ((List!7242 0))(
  ( (Nil!7239) (Cons!7238 (h!8094 tuple2!7236) (t!12686 List!7242)) )
))
(declare-datatypes ((ListLongMap!6149 0))(
  ( (ListLongMap!6150 (toList!3090 List!7242)) )
))
(declare-fun lt!193946 () ListLongMap!6149)

(declare-datatypes ((ValueCell!5123 0))(
  ( (ValueCellFull!5123 (v!7758 V!15683)) (EmptyCell!5123) )
))
(declare-datatypes ((array!25715 0))(
  ( (array!25716 (arr!12307 (Array (_ BitVec 32) ValueCell!5123)) (size!12659 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25715)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1294 (array!25713 array!25715 (_ BitVec 32) (_ BitVec 32) V!15683 V!15683 (_ BitVec 32) Int) ListLongMap!6149)

(assert (=> b!422321 (= lt!193946 (getCurrentListMapNoExtraKeys!1294 lt!193944 (array!25716 (store (arr!12307 _values!549) i!563 (ValueCellFull!5123 v!412)) (size!12659 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _keys!709 () array!25713)

(declare-fun lt!193945 () ListLongMap!6149)

(assert (=> b!422321 (= lt!193945 (getCurrentListMapNoExtraKeys!1294 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18021 () Bool)

(declare-fun mapRes!18021 () Bool)

(assert (=> mapIsEmpty!18021 mapRes!18021))

(declare-fun b!422322 () Bool)

(assert (=> b!422322 (= e!251288 e!251289)))

(declare-fun res!246584 () Bool)

(assert (=> b!422322 (=> (not res!246584) (not e!251289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25713 (_ BitVec 32)) Bool)

(assert (=> b!422322 (= res!246584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193944 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!422322 (= lt!193944 (array!25714 (store (arr!12306 _keys!709) i!563 k!794) (size!12658 _keys!709)))))

(declare-fun res!246582 () Bool)

(assert (=> start!39514 (=> (not res!246582) (not e!251288))))

(assert (=> start!39514 (= res!246582 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12658 _keys!709))))))

(assert (=> start!39514 e!251288))

(declare-fun tp_is_empty!10933 () Bool)

(assert (=> start!39514 tp_is_empty!10933))

(assert (=> start!39514 tp!34871))

(assert (=> start!39514 true))

(declare-fun e!251291 () Bool)

(declare-fun array_inv!8966 (array!25715) Bool)

(assert (=> start!39514 (and (array_inv!8966 _values!549) e!251291)))

(declare-fun array_inv!8967 (array!25713) Bool)

(assert (=> start!39514 (array_inv!8967 _keys!709)))

(declare-fun b!422323 () Bool)

(declare-fun res!246587 () Bool)

(assert (=> b!422323 (=> (not res!246587) (not e!251288))))

(assert (=> b!422323 (= res!246587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422324 () Bool)

(declare-fun res!246586 () Bool)

(assert (=> b!422324 (=> (not res!246586) (not e!251288))))

(assert (=> b!422324 (= res!246586 (and (= (size!12659 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12658 _keys!709) (size!12659 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422325 () Bool)

(declare-fun res!246580 () Bool)

(assert (=> b!422325 (=> (not res!246580) (not e!251288))))

(assert (=> b!422325 (= res!246580 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7238))))

(declare-fun b!422326 () Bool)

(declare-fun res!246589 () Bool)

(assert (=> b!422326 (=> (not res!246589) (not e!251288))))

(assert (=> b!422326 (= res!246589 (or (= (select (arr!12306 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12306 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422327 () Bool)

(declare-fun res!246585 () Bool)

(assert (=> b!422327 (=> (not res!246585) (not e!251288))))

(assert (=> b!422327 (= res!246585 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12658 _keys!709))))))

(declare-fun b!422328 () Bool)

(declare-fun e!251290 () Bool)

(assert (=> b!422328 (= e!251290 tp_is_empty!10933)))

(declare-fun b!422329 () Bool)

(assert (=> b!422329 (= e!251291 (and e!251290 mapRes!18021))))

(declare-fun condMapEmpty!18021 () Bool)

(declare-fun mapDefault!18021 () ValueCell!5123)

