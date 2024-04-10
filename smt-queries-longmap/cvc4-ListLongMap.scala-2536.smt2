; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39038 () Bool)

(assert start!39038)

(declare-fun b_free!9305 () Bool)

(declare-fun b_next!9305 () Bool)

(assert (=> start!39038 (= b_free!9305 (not b_next!9305))))

(declare-fun tp!33444 () Bool)

(declare-fun b_and!16691 () Bool)

(assert (=> start!39038 (= tp!33444 b_and!16691)))

(declare-fun b!409467 () Bool)

(declare-fun res!237114 () Bool)

(declare-fun e!245620 () Bool)

(assert (=> b!409467 (=> (not res!237114) (not e!245620))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409467 (= res!237114 (validKeyInArray!0 k!794))))

(declare-fun b!409468 () Bool)

(declare-fun e!245621 () Bool)

(assert (=> b!409468 (= e!245621 false)))

(declare-datatypes ((V!15047 0))(
  ( (V!15048 (val!5273 Int)) )
))
(declare-fun minValue!515 () V!15047)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4885 0))(
  ( (ValueCellFull!4885 (v!7520 V!15047)) (EmptyCell!4885) )
))
(declare-datatypes ((array!24787 0))(
  ( (array!24788 (arr!11843 (Array (_ BitVec 32) ValueCell!4885)) (size!12195 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24787)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24789 0))(
  ( (array!24790 (arr!11844 (Array (_ BitVec 32) (_ BitVec 64))) (size!12196 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24789)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!6836 0))(
  ( (tuple2!6837 (_1!3429 (_ BitVec 64)) (_2!3429 V!15047)) )
))
(declare-datatypes ((List!6859 0))(
  ( (Nil!6856) (Cons!6855 (h!7711 tuple2!6836) (t!12033 List!6859)) )
))
(declare-datatypes ((ListLongMap!5749 0))(
  ( (ListLongMap!5750 (toList!2890 List!6859)) )
))
(declare-fun lt!188951 () ListLongMap!5749)

(declare-fun zeroValue!515 () V!15047)

(declare-fun getCurrentListMapNoExtraKeys!1098 (array!24789 array!24787 (_ BitVec 32) (_ BitVec 32) V!15047 V!15047 (_ BitVec 32) Int) ListLongMap!5749)

(assert (=> b!409468 (= lt!188951 (getCurrentListMapNoExtraKeys!1098 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!409469 () Bool)

(declare-fun res!237115 () Bool)

(assert (=> b!409469 (=> (not res!237115) (not e!245620))))

(assert (=> b!409469 (= res!237115 (and (= (size!12195 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12196 _keys!709) (size!12195 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!237113 () Bool)

(assert (=> start!39038 (=> (not res!237113) (not e!245620))))

(assert (=> start!39038 (= res!237113 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12196 _keys!709))))))

(assert (=> start!39038 e!245620))

(declare-fun tp_is_empty!10457 () Bool)

(assert (=> start!39038 tp_is_empty!10457))

(assert (=> start!39038 tp!33444))

(assert (=> start!39038 true))

(declare-fun e!245622 () Bool)

(declare-fun array_inv!8642 (array!24787) Bool)

(assert (=> start!39038 (and (array_inv!8642 _values!549) e!245622)))

(declare-fun array_inv!8643 (array!24789) Bool)

(assert (=> start!39038 (array_inv!8643 _keys!709)))

(declare-fun b!409470 () Bool)

(declare-fun res!237116 () Bool)

(assert (=> b!409470 (=> (not res!237116) (not e!245620))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409470 (= res!237116 (validMask!0 mask!1025))))

(declare-fun b!409471 () Bool)

(declare-fun res!237121 () Bool)

(assert (=> b!409471 (=> (not res!237121) (not e!245620))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409471 (= res!237121 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12196 _keys!709))))))

(declare-fun b!409472 () Bool)

(declare-fun e!245618 () Bool)

(declare-fun mapRes!17307 () Bool)

(assert (=> b!409472 (= e!245622 (and e!245618 mapRes!17307))))

(declare-fun condMapEmpty!17307 () Bool)

(declare-fun mapDefault!17307 () ValueCell!4885)

