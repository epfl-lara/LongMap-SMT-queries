; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39782 () Bool)

(assert start!39782)

(declare-fun b_free!10049 () Bool)

(declare-fun b_next!10049 () Bool)

(assert (=> start!39782 (= b_free!10049 (not b_next!10049))))

(declare-fun tp!35675 () Bool)

(declare-fun b_and!17757 () Bool)

(assert (=> start!39782 (= tp!35675 b_and!17757)))

(declare-fun mapNonEmpty!18423 () Bool)

(declare-fun mapRes!18423 () Bool)

(declare-fun tp!35676 () Bool)

(declare-fun e!254061 () Bool)

(assert (=> mapNonEmpty!18423 (= mapRes!18423 (and tp!35676 e!254061))))

(declare-datatypes ((V!16039 0))(
  ( (V!16040 (val!5645 Int)) )
))
(declare-datatypes ((ValueCell!5257 0))(
  ( (ValueCellFull!5257 (v!7892 V!16039)) (EmptyCell!5257) )
))
(declare-datatypes ((array!26239 0))(
  ( (array!26240 (arr!12569 (Array (_ BitVec 32) ValueCell!5257)) (size!12921 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26239)

(declare-fun mapValue!18423 () ValueCell!5257)

(declare-fun mapRest!18423 () (Array (_ BitVec 32) ValueCell!5257))

(declare-fun mapKey!18423 () (_ BitVec 32))

(assert (=> mapNonEmpty!18423 (= (arr!12569 _values!549) (store mapRest!18423 mapKey!18423 mapValue!18423))))

(declare-fun res!251741 () Bool)

(declare-fun e!254064 () Bool)

(assert (=> start!39782 (=> (not res!251741) (not e!254064))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26241 0))(
  ( (array!26242 (arr!12570 (Array (_ BitVec 32) (_ BitVec 64))) (size!12922 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26241)

(assert (=> start!39782 (= res!251741 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12922 _keys!709))))))

(assert (=> start!39782 e!254064))

(declare-fun tp_is_empty!11201 () Bool)

(assert (=> start!39782 tp_is_empty!11201))

(assert (=> start!39782 tp!35675))

(assert (=> start!39782 true))

(declare-fun e!254059 () Bool)

(declare-fun array_inv!9160 (array!26239) Bool)

(assert (=> start!39782 (and (array_inv!9160 _values!549) e!254059)))

(declare-fun array_inv!9161 (array!26241) Bool)

(assert (=> start!39782 (array_inv!9161 _keys!709)))

(declare-fun b!428784 () Bool)

(declare-fun res!251743 () Bool)

(assert (=> b!428784 (=> (not res!251743) (not e!254064))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428784 (= res!251743 (validKeyInArray!0 k!794))))

(declare-fun b!428785 () Bool)

(declare-datatypes ((Unit!12593 0))(
  ( (Unit!12594) )
))
(declare-fun e!254063 () Unit!12593)

(declare-fun Unit!12595 () Unit!12593)

(assert (=> b!428785 (= e!254063 Unit!12595)))

(declare-fun lt!195926 () Unit!12593)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26241 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12593)

(assert (=> b!428785 (= lt!195926 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428785 false))

(declare-fun b!428786 () Bool)

(declare-fun res!251737 () Bool)

(assert (=> b!428786 (=> (not res!251737) (not e!254064))))

(declare-fun arrayContainsKey!0 (array!26241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428786 (= res!251737 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!428787 () Bool)

(declare-fun res!251738 () Bool)

(assert (=> b!428787 (=> (not res!251738) (not e!254064))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428787 (= res!251738 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12922 _keys!709))))))

(declare-fun b!428788 () Bool)

(declare-fun e!254060 () Bool)

(assert (=> b!428788 (= e!254060 tp_is_empty!11201)))

(declare-fun b!428789 () Bool)

(declare-fun e!254058 () Bool)

(declare-fun e!254057 () Bool)

(assert (=> b!428789 (= e!254058 e!254057)))

(declare-fun res!251736 () Bool)

(assert (=> b!428789 (=> (not res!251736) (not e!254057))))

(assert (=> b!428789 (= res!251736 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16039)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7432 0))(
  ( (tuple2!7433 (_1!3727 (_ BitVec 64)) (_2!3727 V!16039)) )
))
(declare-datatypes ((List!7446 0))(
  ( (Nil!7443) (Cons!7442 (h!8298 tuple2!7432) (t!12944 List!7446)) )
))
(declare-datatypes ((ListLongMap!6345 0))(
  ( (ListLongMap!6346 (toList!3188 List!7446)) )
))
(declare-fun lt!195929 () ListLongMap!6345)

(declare-fun zeroValue!515 () V!16039)

(declare-fun lt!195931 () array!26239)

(declare-fun lt!195935 () array!26241)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1390 (array!26241 array!26239 (_ BitVec 32) (_ BitVec 32) V!16039 V!16039 (_ BitVec 32) Int) ListLongMap!6345)

(assert (=> b!428789 (= lt!195929 (getCurrentListMapNoExtraKeys!1390 lt!195935 lt!195931 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16039)

(assert (=> b!428789 (= lt!195931 (array!26240 (store (arr!12569 _values!549) i!563 (ValueCellFull!5257 v!412)) (size!12921 _values!549)))))

(declare-fun lt!195930 () ListLongMap!6345)

(assert (=> b!428789 (= lt!195930 (getCurrentListMapNoExtraKeys!1390 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18423 () Bool)

(assert (=> mapIsEmpty!18423 mapRes!18423))

(declare-fun b!428790 () Bool)

(declare-fun res!251742 () Bool)

(assert (=> b!428790 (=> (not res!251742) (not e!254064))))

(declare-datatypes ((List!7447 0))(
  ( (Nil!7444) (Cons!7443 (h!8299 (_ BitVec 64)) (t!12945 List!7447)) )
))
(declare-fun arrayNoDuplicates!0 (array!26241 (_ BitVec 32) List!7447) Bool)

(assert (=> b!428790 (= res!251742 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7444))))

(declare-fun b!428791 () Bool)

(declare-fun res!251745 () Bool)

(assert (=> b!428791 (=> (not res!251745) (not e!254058))))

(assert (=> b!428791 (= res!251745 (bvsle from!863 i!563))))

(declare-fun b!428792 () Bool)

(declare-fun res!251740 () Bool)

(assert (=> b!428792 (=> (not res!251740) (not e!254064))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26241 (_ BitVec 32)) Bool)

(assert (=> b!428792 (= res!251740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428793 () Bool)

(assert (=> b!428793 (= e!254059 (and e!254060 mapRes!18423))))

(declare-fun condMapEmpty!18423 () Bool)

(declare-fun mapDefault!18423 () ValueCell!5257)

