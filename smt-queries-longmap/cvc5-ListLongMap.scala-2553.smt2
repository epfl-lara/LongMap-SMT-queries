; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39136 () Bool)

(assert start!39136)

(declare-fun b_free!9403 () Bool)

(declare-fun b_next!9403 () Bool)

(assert (=> start!39136 (= b_free!9403 (not b_next!9403))))

(declare-fun tp!33738 () Bool)

(declare-fun b_and!16789 () Bool)

(assert (=> start!39136 (= tp!33738 b_and!16789)))

(declare-fun b!411672 () Bool)

(declare-fun e!246499 () Bool)

(declare-fun tp_is_empty!10555 () Bool)

(assert (=> b!411672 (= e!246499 tp_is_empty!10555)))

(declare-fun b!411673 () Bool)

(declare-fun res!238887 () Bool)

(declare-fun e!246504 () Bool)

(assert (=> b!411673 (=> (not res!238887) (not e!246504))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411673 (= res!238887 (validKeyInArray!0 k!794))))

(declare-fun b!411674 () Bool)

(declare-fun res!238876 () Bool)

(assert (=> b!411674 (=> (not res!238876) (not e!246504))))

(declare-datatypes ((array!24971 0))(
  ( (array!24972 (arr!11935 (Array (_ BitVec 32) (_ BitVec 64))) (size!12287 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24971)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411674 (= res!238876 (or (= (select (arr!11935 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11935 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!411675 () Bool)

(declare-fun res!238884 () Bool)

(assert (=> b!411675 (=> (not res!238884) (not e!246504))))

(declare-datatypes ((List!6929 0))(
  ( (Nil!6926) (Cons!6925 (h!7781 (_ BitVec 64)) (t!12103 List!6929)) )
))
(declare-fun arrayNoDuplicates!0 (array!24971 (_ BitVec 32) List!6929) Bool)

(assert (=> b!411675 (= res!238884 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6926))))

(declare-fun b!411676 () Bool)

(declare-fun res!238880 () Bool)

(assert (=> b!411676 (=> (not res!238880) (not e!246504))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24971 (_ BitVec 32)) Bool)

(assert (=> b!411676 (= res!238880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!238882 () Bool)

(assert (=> start!39136 (=> (not res!238882) (not e!246504))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39136 (= res!238882 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12287 _keys!709))))))

(assert (=> start!39136 e!246504))

(assert (=> start!39136 tp_is_empty!10555))

(assert (=> start!39136 tp!33738))

(assert (=> start!39136 true))

(declare-datatypes ((V!15179 0))(
  ( (V!15180 (val!5322 Int)) )
))
(declare-datatypes ((ValueCell!4934 0))(
  ( (ValueCellFull!4934 (v!7569 V!15179)) (EmptyCell!4934) )
))
(declare-datatypes ((array!24973 0))(
  ( (array!24974 (arr!11936 (Array (_ BitVec 32) ValueCell!4934)) (size!12288 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24973)

(declare-fun e!246501 () Bool)

(declare-fun array_inv!8708 (array!24973) Bool)

(assert (=> start!39136 (and (array_inv!8708 _values!549) e!246501)))

(declare-fun array_inv!8709 (array!24971) Bool)

(assert (=> start!39136 (array_inv!8709 _keys!709)))

(declare-fun b!411677 () Bool)

(declare-fun res!238878 () Bool)

(assert (=> b!411677 (=> (not res!238878) (not e!246504))))

(assert (=> b!411677 (= res!238878 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12287 _keys!709))))))

(declare-fun b!411678 () Bool)

(declare-fun e!246500 () Bool)

(assert (=> b!411678 (= e!246500 false)))

(declare-fun minValue!515 () V!15179)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!189327 () array!24971)

(declare-fun v!412 () V!15179)

(declare-datatypes ((tuple2!6904 0))(
  ( (tuple2!6905 (_1!3463 (_ BitVec 64)) (_2!3463 V!15179)) )
))
(declare-datatypes ((List!6930 0))(
  ( (Nil!6927) (Cons!6926 (h!7782 tuple2!6904) (t!12104 List!6930)) )
))
(declare-datatypes ((ListLongMap!5817 0))(
  ( (ListLongMap!5818 (toList!2924 List!6930)) )
))
(declare-fun lt!189328 () ListLongMap!5817)

(declare-fun zeroValue!515 () V!15179)

(declare-fun getCurrentListMapNoExtraKeys!1132 (array!24971 array!24973 (_ BitVec 32) (_ BitVec 32) V!15179 V!15179 (_ BitVec 32) Int) ListLongMap!5817)

(assert (=> b!411678 (= lt!189328 (getCurrentListMapNoExtraKeys!1132 lt!189327 (array!24974 (store (arr!11936 _values!549) i!563 (ValueCellFull!4934 v!412)) (size!12288 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189329 () ListLongMap!5817)

(assert (=> b!411678 (= lt!189329 (getCurrentListMapNoExtraKeys!1132 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411679 () Bool)

(declare-fun mapRes!17454 () Bool)

(assert (=> b!411679 (= e!246501 (and e!246499 mapRes!17454))))

(declare-fun condMapEmpty!17454 () Bool)

(declare-fun mapDefault!17454 () ValueCell!4934)

