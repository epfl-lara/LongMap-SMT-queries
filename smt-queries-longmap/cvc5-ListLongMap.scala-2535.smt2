; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39028 () Bool)

(assert start!39028)

(declare-fun b_free!9295 () Bool)

(declare-fun b_next!9295 () Bool)

(assert (=> start!39028 (= b_free!9295 (not b_next!9295))))

(declare-fun tp!33413 () Bool)

(declare-fun b_and!16681 () Bool)

(assert (=> start!39028 (= tp!33413 b_and!16681)))

(declare-fun b!409242 () Bool)

(declare-fun res!236943 () Bool)

(declare-fun e!245529 () Bool)

(assert (=> b!409242 (=> (not res!236943) (not e!245529))))

(declare-datatypes ((array!24767 0))(
  ( (array!24768 (arr!11833 (Array (_ BitVec 32) (_ BitVec 64))) (size!12185 (_ BitVec 32))) )
))
(declare-fun lt!188920 () array!24767)

(declare-datatypes ((List!6849 0))(
  ( (Nil!6846) (Cons!6845 (h!7701 (_ BitVec 64)) (t!12023 List!6849)) )
))
(declare-fun arrayNoDuplicates!0 (array!24767 (_ BitVec 32) List!6849) Bool)

(assert (=> b!409242 (= res!236943 (arrayNoDuplicates!0 lt!188920 #b00000000000000000000000000000000 Nil!6846))))

(declare-fun b!409243 () Bool)

(declare-fun res!236936 () Bool)

(declare-fun e!245528 () Bool)

(assert (=> b!409243 (=> (not res!236936) (not e!245528))))

(declare-fun _keys!709 () array!24767)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!409243 (= res!236936 (or (= (select (arr!11833 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11833 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!236933 () Bool)

(assert (=> start!39028 (=> (not res!236933) (not e!245528))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39028 (= res!236933 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12185 _keys!709))))))

(assert (=> start!39028 e!245528))

(declare-fun tp_is_empty!10447 () Bool)

(assert (=> start!39028 tp_is_empty!10447))

(assert (=> start!39028 tp!33413))

(assert (=> start!39028 true))

(declare-datatypes ((V!15035 0))(
  ( (V!15036 (val!5268 Int)) )
))
(declare-datatypes ((ValueCell!4880 0))(
  ( (ValueCellFull!4880 (v!7515 V!15035)) (EmptyCell!4880) )
))
(declare-datatypes ((array!24769 0))(
  ( (array!24770 (arr!11834 (Array (_ BitVec 32) ValueCell!4880)) (size!12186 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24769)

(declare-fun e!245527 () Bool)

(declare-fun array_inv!8636 (array!24769) Bool)

(assert (=> start!39028 (and (array_inv!8636 _values!549) e!245527)))

(declare-fun array_inv!8637 (array!24767) Bool)

(assert (=> start!39028 (array_inv!8637 _keys!709)))

(declare-fun mapNonEmpty!17292 () Bool)

(declare-fun mapRes!17292 () Bool)

(declare-fun tp!33414 () Bool)

(declare-fun e!245531 () Bool)

(assert (=> mapNonEmpty!17292 (= mapRes!17292 (and tp!33414 e!245531))))

(declare-fun mapKey!17292 () (_ BitVec 32))

(declare-fun mapRest!17292 () (Array (_ BitVec 32) ValueCell!4880))

(declare-fun mapValue!17292 () ValueCell!4880)

(assert (=> mapNonEmpty!17292 (= (arr!11834 _values!549) (store mapRest!17292 mapKey!17292 mapValue!17292))))

(declare-fun b!409244 () Bool)

(declare-fun res!236934 () Bool)

(assert (=> b!409244 (=> (not res!236934) (not e!245528))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24767 (_ BitVec 32)) Bool)

(assert (=> b!409244 (= res!236934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!409245 () Bool)

(declare-fun res!236941 () Bool)

(assert (=> b!409245 (=> (not res!236941) (not e!245528))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24767 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409245 (= res!236941 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!409246 () Bool)

(declare-fun res!236942 () Bool)

(assert (=> b!409246 (=> (not res!236942) (not e!245529))))

(assert (=> b!409246 (= res!236942 (bvsle from!863 i!563))))

(declare-fun b!409247 () Bool)

(assert (=> b!409247 (= e!245529 false)))

(declare-fun minValue!515 () V!15035)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!6826 0))(
  ( (tuple2!6827 (_1!3424 (_ BitVec 64)) (_2!3424 V!15035)) )
))
(declare-datatypes ((List!6850 0))(
  ( (Nil!6847) (Cons!6846 (h!7702 tuple2!6826) (t!12024 List!6850)) )
))
(declare-datatypes ((ListLongMap!5739 0))(
  ( (ListLongMap!5740 (toList!2885 List!6850)) )
))
(declare-fun lt!188921 () ListLongMap!5739)

(declare-fun zeroValue!515 () V!15035)

(declare-fun getCurrentListMapNoExtraKeys!1093 (array!24767 array!24769 (_ BitVec 32) (_ BitVec 32) V!15035 V!15035 (_ BitVec 32) Int) ListLongMap!5739)

(assert (=> b!409247 (= lt!188921 (getCurrentListMapNoExtraKeys!1093 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!409248 () Bool)

(declare-fun e!245530 () Bool)

(assert (=> b!409248 (= e!245527 (and e!245530 mapRes!17292))))

(declare-fun condMapEmpty!17292 () Bool)

(declare-fun mapDefault!17292 () ValueCell!4880)

