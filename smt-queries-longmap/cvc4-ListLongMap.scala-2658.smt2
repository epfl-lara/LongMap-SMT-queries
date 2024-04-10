; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39770 () Bool)

(assert start!39770)

(declare-fun b_free!10037 () Bool)

(declare-fun b_next!10037 () Bool)

(assert (=> start!39770 (= b_free!10037 (not b_next!10037))))

(declare-fun tp!35640 () Bool)

(declare-fun b_and!17733 () Bool)

(assert (=> start!39770 (= tp!35640 b_and!17733)))

(declare-fun mapNonEmpty!18405 () Bool)

(declare-fun mapRes!18405 () Bool)

(declare-fun tp!35639 () Bool)

(declare-fun e!253901 () Bool)

(assert (=> mapNonEmpty!18405 (= mapRes!18405 (and tp!35639 e!253901))))

(declare-datatypes ((V!16023 0))(
  ( (V!16024 (val!5639 Int)) )
))
(declare-datatypes ((ValueCell!5251 0))(
  ( (ValueCellFull!5251 (v!7886 V!16023)) (EmptyCell!5251) )
))
(declare-fun mapRest!18405 () (Array (_ BitVec 32) ValueCell!5251))

(declare-datatypes ((array!26215 0))(
  ( (array!26216 (arr!12557 (Array (_ BitVec 32) ValueCell!5251)) (size!12909 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26215)

(declare-fun mapKey!18405 () (_ BitVec 32))

(declare-fun mapValue!18405 () ValueCell!5251)

(assert (=> mapNonEmpty!18405 (= (arr!12557 _values!549) (store mapRest!18405 mapKey!18405 mapValue!18405))))

(declare-fun b!428430 () Bool)

(declare-datatypes ((Unit!12572 0))(
  ( (Unit!12573) )
))
(declare-fun e!253898 () Unit!12572)

(declare-fun Unit!12574 () Unit!12572)

(assert (=> b!428430 (= e!253898 Unit!12574)))

(declare-fun b!428431 () Bool)

(declare-fun e!253900 () Bool)

(declare-fun e!253899 () Bool)

(assert (=> b!428431 (= e!253900 e!253899)))

(declare-fun res!251485 () Bool)

(assert (=> b!428431 (=> (not res!251485) (not e!253899))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428431 (= res!251485 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16023)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7422 0))(
  ( (tuple2!7423 (_1!3722 (_ BitVec 64)) (_2!3722 V!16023)) )
))
(declare-datatypes ((List!7435 0))(
  ( (Nil!7432) (Cons!7431 (h!8287 tuple2!7422) (t!12921 List!7435)) )
))
(declare-datatypes ((ListLongMap!6335 0))(
  ( (ListLongMap!6336 (toList!3183 List!7435)) )
))
(declare-fun lt!195750 () ListLongMap!6335)

(declare-datatypes ((array!26217 0))(
  ( (array!26218 (arr!12558 (Array (_ BitVec 32) (_ BitVec 64))) (size!12910 (_ BitVec 32))) )
))
(declare-fun lt!195747 () array!26217)

(declare-fun zeroValue!515 () V!16023)

(declare-fun lt!195754 () array!26215)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1385 (array!26217 array!26215 (_ BitVec 32) (_ BitVec 32) V!16023 V!16023 (_ BitVec 32) Int) ListLongMap!6335)

(assert (=> b!428431 (= lt!195750 (getCurrentListMapNoExtraKeys!1385 lt!195747 lt!195754 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16023)

(assert (=> b!428431 (= lt!195754 (array!26216 (store (arr!12557 _values!549) i!563 (ValueCellFull!5251 v!412)) (size!12909 _values!549)))))

(declare-fun lt!195748 () ListLongMap!6335)

(declare-fun _keys!709 () array!26217)

(assert (=> b!428431 (= lt!195748 (getCurrentListMapNoExtraKeys!1385 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428432 () Bool)

(declare-fun res!251493 () Bool)

(assert (=> b!428432 (=> (not res!251493) (not e!253900))))

(declare-datatypes ((List!7436 0))(
  ( (Nil!7433) (Cons!7432 (h!8288 (_ BitVec 64)) (t!12922 List!7436)) )
))
(declare-fun arrayNoDuplicates!0 (array!26217 (_ BitVec 32) List!7436) Bool)

(assert (=> b!428432 (= res!251493 (arrayNoDuplicates!0 lt!195747 #b00000000000000000000000000000000 Nil!7433))))

(declare-fun b!428433 () Bool)

(declare-fun res!251491 () Bool)

(declare-fun e!253902 () Bool)

(assert (=> b!428433 (=> (not res!251491) (not e!253902))))

(assert (=> b!428433 (= res!251491 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7433))))

(declare-fun b!428434 () Bool)

(declare-fun e!253894 () Bool)

(assert (=> b!428434 (= e!253894 true)))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!428434 (not (= (select (arr!12558 _keys!709) from!863) k!794))))

(declare-fun lt!195746 () Unit!12572)

(assert (=> b!428434 (= lt!195746 e!253898)))

(declare-fun c!55391 () Bool)

(assert (=> b!428434 (= c!55391 (= (select (arr!12558 _keys!709) from!863) k!794))))

(declare-fun lt!195749 () ListLongMap!6335)

(declare-fun +!1336 (ListLongMap!6335 tuple2!7422) ListLongMap!6335)

(declare-fun get!6222 (ValueCell!5251 V!16023) V!16023)

(declare-fun dynLambda!763 (Int (_ BitVec 64)) V!16023)

(assert (=> b!428434 (= lt!195750 (+!1336 lt!195749 (tuple2!7423 (select (arr!12558 _keys!709) from!863) (get!6222 (select (arr!12557 _values!549) from!863) (dynLambda!763 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428435 () Bool)

(declare-fun res!251487 () Bool)

(assert (=> b!428435 (=> (not res!251487) (not e!253902))))

(declare-fun arrayContainsKey!0 (array!26217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428435 (= res!251487 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!428436 () Bool)

(assert (=> b!428436 (= e!253902 e!253900)))

(declare-fun res!251484 () Bool)

(assert (=> b!428436 (=> (not res!251484) (not e!253900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26217 (_ BitVec 32)) Bool)

(assert (=> b!428436 (= res!251484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195747 mask!1025))))

(assert (=> b!428436 (= lt!195747 (array!26218 (store (arr!12558 _keys!709) i!563 k!794) (size!12910 _keys!709)))))

(declare-fun res!251492 () Bool)

(assert (=> start!39770 (=> (not res!251492) (not e!253902))))

(assert (=> start!39770 (= res!251492 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12910 _keys!709))))))

(assert (=> start!39770 e!253902))

(declare-fun tp_is_empty!11189 () Bool)

(assert (=> start!39770 tp_is_empty!11189))

(assert (=> start!39770 tp!35640))

(assert (=> start!39770 true))

(declare-fun e!253895 () Bool)

(declare-fun array_inv!9154 (array!26215) Bool)

(assert (=> start!39770 (and (array_inv!9154 _values!549) e!253895)))

(declare-fun array_inv!9155 (array!26217) Bool)

(assert (=> start!39770 (array_inv!9155 _keys!709)))

(declare-fun mapIsEmpty!18405 () Bool)

(assert (=> mapIsEmpty!18405 mapRes!18405))

(declare-fun b!428437 () Bool)

(declare-fun res!251486 () Bool)

(assert (=> b!428437 (=> (not res!251486) (not e!253902))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428437 (= res!251486 (validKeyInArray!0 k!794))))

(declare-fun b!428438 () Bool)

(declare-fun e!253897 () Bool)

(assert (=> b!428438 (= e!253897 tp_is_empty!11189)))

(declare-fun b!428439 () Bool)

(assert (=> b!428439 (= e!253895 (and e!253897 mapRes!18405))))

(declare-fun condMapEmpty!18405 () Bool)

(declare-fun mapDefault!18405 () ValueCell!5251)

