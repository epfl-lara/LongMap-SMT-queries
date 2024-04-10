; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39164 () Bool)

(assert start!39164)

(declare-fun b_free!9431 () Bool)

(declare-fun b_next!9431 () Bool)

(assert (=> start!39164 (= b_free!9431 (not b_next!9431))))

(declare-fun tp!33822 () Bool)

(declare-fun b_and!16817 () Bool)

(assert (=> start!39164 (= tp!33822 b_and!16817)))

(declare-fun b!412302 () Bool)

(declare-fun res!239385 () Bool)

(declare-fun e!246751 () Bool)

(assert (=> b!412302 (=> (not res!239385) (not e!246751))))

(declare-datatypes ((array!25027 0))(
  ( (array!25028 (arr!11963 (Array (_ BitVec 32) (_ BitVec 64))) (size!12315 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25027)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25027 (_ BitVec 32)) Bool)

(assert (=> b!412302 (= res!239385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412303 () Bool)

(declare-fun e!246754 () Bool)

(declare-fun tp_is_empty!10583 () Bool)

(assert (=> b!412303 (= e!246754 tp_is_empty!10583)))

(declare-fun b!412304 () Bool)

(declare-fun e!246753 () Bool)

(assert (=> b!412304 (= e!246753 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15215 0))(
  ( (V!15216 (val!5336 Int)) )
))
(declare-fun minValue!515 () V!15215)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!6922 0))(
  ( (tuple2!6923 (_1!3472 (_ BitVec 64)) (_2!3472 V!15215)) )
))
(declare-datatypes ((List!6948 0))(
  ( (Nil!6945) (Cons!6944 (h!7800 tuple2!6922) (t!12122 List!6948)) )
))
(declare-datatypes ((ListLongMap!5835 0))(
  ( (ListLongMap!5836 (toList!2933 List!6948)) )
))
(declare-fun lt!189454 () ListLongMap!5835)

(declare-datatypes ((ValueCell!4948 0))(
  ( (ValueCellFull!4948 (v!7583 V!15215)) (EmptyCell!4948) )
))
(declare-datatypes ((array!25029 0))(
  ( (array!25030 (arr!11964 (Array (_ BitVec 32) ValueCell!4948)) (size!12316 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25029)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15215)

(declare-fun lt!189453 () array!25027)

(declare-fun zeroValue!515 () V!15215)

(declare-fun getCurrentListMapNoExtraKeys!1141 (array!25027 array!25029 (_ BitVec 32) (_ BitVec 32) V!15215 V!15215 (_ BitVec 32) Int) ListLongMap!5835)

(assert (=> b!412304 (= lt!189454 (getCurrentListMapNoExtraKeys!1141 lt!189453 (array!25030 (store (arr!11964 _values!549) i!563 (ValueCellFull!4948 v!412)) (size!12316 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189455 () ListLongMap!5835)

(assert (=> b!412304 (= lt!189455 (getCurrentListMapNoExtraKeys!1141 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412305 () Bool)

(declare-fun res!239383 () Bool)

(assert (=> b!412305 (=> (not res!239383) (not e!246751))))

(declare-datatypes ((List!6949 0))(
  ( (Nil!6946) (Cons!6945 (h!7801 (_ BitVec 64)) (t!12123 List!6949)) )
))
(declare-fun arrayNoDuplicates!0 (array!25027 (_ BitVec 32) List!6949) Bool)

(assert (=> b!412305 (= res!239383 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6946))))

(declare-fun b!412306 () Bool)

(declare-fun res!239391 () Bool)

(assert (=> b!412306 (=> (not res!239391) (not e!246751))))

(assert (=> b!412306 (= res!239391 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12315 _keys!709))))))

(declare-fun b!412307 () Bool)

(declare-fun e!246755 () Bool)

(declare-fun mapRes!17496 () Bool)

(assert (=> b!412307 (= e!246755 (and e!246754 mapRes!17496))))

(declare-fun condMapEmpty!17496 () Bool)

(declare-fun mapDefault!17496 () ValueCell!4948)

