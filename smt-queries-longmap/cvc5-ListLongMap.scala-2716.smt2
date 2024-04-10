; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40114 () Bool)

(assert start!40114)

(declare-fun b_free!10381 () Bool)

(declare-fun b_next!10381 () Bool)

(assert (=> start!40114 (= b_free!10381 (not b_next!10381))))

(declare-fun tp!36671 () Bool)

(declare-fun b_and!18349 () Bool)

(assert (=> start!40114 (= tp!36671 b_and!18349)))

(declare-fun b!438500 () Bool)

(declare-fun e!258645 () Bool)

(declare-fun e!258644 () Bool)

(assert (=> b!438500 (= e!258645 e!258644)))

(declare-fun res!258931 () Bool)

(assert (=> b!438500 (=> (not res!258931) (not e!258644))))

(declare-datatypes ((array!26883 0))(
  ( (array!26884 (arr!12891 (Array (_ BitVec 32) (_ BitVec 64))) (size!13243 (_ BitVec 32))) )
))
(declare-fun lt!201976 () array!26883)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26883 (_ BitVec 32)) Bool)

(assert (=> b!438500 (= res!258931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201976 mask!1025))))

(declare-fun _keys!709 () array!26883)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438500 (= lt!201976 (array!26884 (store (arr!12891 _keys!709) i!563 k!794) (size!13243 _keys!709)))))

(declare-fun b!438501 () Bool)

(declare-fun res!258930 () Bool)

(assert (=> b!438501 (=> (not res!258930) (not e!258645))))

(assert (=> b!438501 (= res!258930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438502 () Bool)

(declare-fun res!258922 () Bool)

(assert (=> b!438502 (=> (not res!258922) (not e!258644))))

(declare-datatypes ((List!7706 0))(
  ( (Nil!7703) (Cons!7702 (h!8558 (_ BitVec 64)) (t!13462 List!7706)) )
))
(declare-fun arrayNoDuplicates!0 (array!26883 (_ BitVec 32) List!7706) Bool)

(assert (=> b!438502 (= res!258922 (arrayNoDuplicates!0 lt!201976 #b00000000000000000000000000000000 Nil!7703))))

(declare-fun b!438503 () Bool)

(declare-fun e!258647 () Bool)

(declare-fun tp_is_empty!11533 () Bool)

(assert (=> b!438503 (= e!258647 tp_is_empty!11533)))

(declare-fun mapIsEmpty!18921 () Bool)

(declare-fun mapRes!18921 () Bool)

(assert (=> mapIsEmpty!18921 mapRes!18921))

(declare-fun res!258932 () Bool)

(assert (=> start!40114 (=> (not res!258932) (not e!258645))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40114 (= res!258932 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13243 _keys!709))))))

(assert (=> start!40114 e!258645))

(assert (=> start!40114 tp_is_empty!11533))

(assert (=> start!40114 tp!36671))

(assert (=> start!40114 true))

(declare-datatypes ((V!16483 0))(
  ( (V!16484 (val!5811 Int)) )
))
(declare-datatypes ((ValueCell!5423 0))(
  ( (ValueCellFull!5423 (v!8058 V!16483)) (EmptyCell!5423) )
))
(declare-datatypes ((array!26885 0))(
  ( (array!26886 (arr!12892 (Array (_ BitVec 32) ValueCell!5423)) (size!13244 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26885)

(declare-fun e!258642 () Bool)

(declare-fun array_inv!9362 (array!26885) Bool)

(assert (=> start!40114 (and (array_inv!9362 _values!549) e!258642)))

(declare-fun array_inv!9363 (array!26883) Bool)

(assert (=> start!40114 (array_inv!9363 _keys!709)))

(declare-fun b!438504 () Bool)

(declare-fun e!258648 () Bool)

(assert (=> b!438504 (= e!258648 (not true))))

(declare-fun minValue!515 () V!16483)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16483)

(declare-fun v!412 () V!16483)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!201978 () array!26885)

(declare-datatypes ((tuple2!7708 0))(
  ( (tuple2!7709 (_1!3865 (_ BitVec 64)) (_2!3865 V!16483)) )
))
(declare-datatypes ((List!7707 0))(
  ( (Nil!7704) (Cons!7703 (h!8559 tuple2!7708) (t!13463 List!7707)) )
))
(declare-datatypes ((ListLongMap!6621 0))(
  ( (ListLongMap!6622 (toList!3326 List!7707)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1515 (array!26883 array!26885 (_ BitVec 32) (_ BitVec 32) V!16483 V!16483 (_ BitVec 32) Int) ListLongMap!6621)

(declare-fun +!1469 (ListLongMap!6621 tuple2!7708) ListLongMap!6621)

(assert (=> b!438504 (= (getCurrentListMapNoExtraKeys!1515 lt!201976 lt!201978 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1469 (getCurrentListMapNoExtraKeys!1515 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7709 k!794 v!412)))))

(declare-datatypes ((Unit!13042 0))(
  ( (Unit!13043) )
))
(declare-fun lt!201979 () Unit!13042)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!638 (array!26883 array!26885 (_ BitVec 32) (_ BitVec 32) V!16483 V!16483 (_ BitVec 32) (_ BitVec 64) V!16483 (_ BitVec 32) Int) Unit!13042)

(assert (=> b!438504 (= lt!201979 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!638 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438505 () Bool)

(declare-fun res!258927 () Bool)

(assert (=> b!438505 (=> (not res!258927) (not e!258644))))

(assert (=> b!438505 (= res!258927 (bvsle from!863 i!563))))

(declare-fun b!438506 () Bool)

(assert (=> b!438506 (= e!258644 e!258648)))

(declare-fun res!258929 () Bool)

(assert (=> b!438506 (=> (not res!258929) (not e!258648))))

(assert (=> b!438506 (= res!258929 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201977 () ListLongMap!6621)

(assert (=> b!438506 (= lt!201977 (getCurrentListMapNoExtraKeys!1515 lt!201976 lt!201978 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!438506 (= lt!201978 (array!26886 (store (arr!12892 _values!549) i!563 (ValueCellFull!5423 v!412)) (size!13244 _values!549)))))

(declare-fun lt!201980 () ListLongMap!6621)

(assert (=> b!438506 (= lt!201980 (getCurrentListMapNoExtraKeys!1515 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438507 () Bool)

(declare-fun e!258643 () Bool)

(assert (=> b!438507 (= e!258643 tp_is_empty!11533)))

(declare-fun b!438508 () Bool)

(assert (=> b!438508 (= e!258642 (and e!258647 mapRes!18921))))

(declare-fun condMapEmpty!18921 () Bool)

(declare-fun mapDefault!18921 () ValueCell!5423)

