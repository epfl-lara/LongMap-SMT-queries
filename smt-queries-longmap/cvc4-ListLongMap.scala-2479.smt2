; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38696 () Bool)

(assert start!38696)

(declare-fun b_free!9233 () Bool)

(declare-fun b_next!9233 () Bool)

(assert (=> start!38696 (= b_free!9233 (not b_next!9233))))

(declare-fun tp!32823 () Bool)

(declare-fun b_and!16619 () Bool)

(assert (=> start!38696 (= tp!32823 b_and!16619)))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14591 0))(
  ( (V!14592 (val!5102 Int)) )
))
(declare-datatypes ((ValueCell!4714 0))(
  ( (ValueCellFull!4714 (v!7349 V!14591)) (EmptyCell!4714) )
))
(declare-datatypes ((array!24135 0))(
  ( (array!24136 (arr!11517 (Array (_ BitVec 32) ValueCell!4714)) (size!11869 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24135)

(declare-fun bm!28360 () Bool)

(declare-fun zeroValue!515 () V!14591)

(declare-fun v!412 () V!14591)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24137 0))(
  ( (array!24138 (arr!11518 (Array (_ BitVec 32) (_ BitVec 64))) (size!11870 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24137)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!14591)

(declare-fun lt!187925 () array!24137)

(declare-fun c!54806 () Bool)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6778 0))(
  ( (tuple2!6779 (_1!3400 (_ BitVec 64)) (_2!3400 V!14591)) )
))
(declare-datatypes ((List!6700 0))(
  ( (Nil!6697) (Cons!6696 (h!7552 tuple2!6778) (t!11874 List!6700)) )
))
(declare-datatypes ((ListLongMap!5691 0))(
  ( (ListLongMap!5692 (toList!2861 List!6700)) )
))
(declare-fun call!28364 () ListLongMap!5691)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1071 (array!24137 array!24135 (_ BitVec 32) (_ BitVec 32) V!14591 V!14591 (_ BitVec 32) Int) ListLongMap!5691)

(assert (=> bm!28360 (= call!28364 (getCurrentListMapNoExtraKeys!1071 (ite c!54806 lt!187925 _keys!709) (ite c!54806 (array!24136 (store (arr!11517 _values!549) i!563 (ValueCellFull!4714 v!412)) (size!11869 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402401 () Bool)

(declare-fun e!242454 () Bool)

(declare-fun e!242453 () Bool)

(assert (=> b!402401 (= e!242454 e!242453)))

(declare-fun res!231767 () Bool)

(assert (=> b!402401 (=> (not res!231767) (not e!242453))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24137 (_ BitVec 32)) Bool)

(assert (=> b!402401 (= res!231767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187925 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!402401 (= lt!187925 (array!24138 (store (arr!11518 _keys!709) i!563 k!794) (size!11870 _keys!709)))))

(declare-fun mapNonEmpty!16794 () Bool)

(declare-fun mapRes!16794 () Bool)

(declare-fun tp!32822 () Bool)

(declare-fun e!242450 () Bool)

(assert (=> mapNonEmpty!16794 (= mapRes!16794 (and tp!32822 e!242450))))

(declare-fun mapKey!16794 () (_ BitVec 32))

(declare-fun mapValue!16794 () ValueCell!4714)

(declare-fun mapRest!16794 () (Array (_ BitVec 32) ValueCell!4714))

(assert (=> mapNonEmpty!16794 (= (arr!11517 _values!549) (store mapRest!16794 mapKey!16794 mapValue!16794))))

(declare-fun b!402402 () Bool)

(declare-fun res!231777 () Bool)

(assert (=> b!402402 (=> (not res!231777) (not e!242454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402402 (= res!231777 (validMask!0 mask!1025))))

(declare-fun b!402403 () Bool)

(declare-fun tp_is_empty!10115 () Bool)

(assert (=> b!402403 (= e!242450 tp_is_empty!10115)))

(declare-fun mapIsEmpty!16794 () Bool)

(assert (=> mapIsEmpty!16794 mapRes!16794))

(declare-fun b!402404 () Bool)

(assert (=> b!402404 (= e!242453 (not true))))

(declare-fun e!242448 () Bool)

(assert (=> b!402404 e!242448))

(assert (=> b!402404 (= c!54806 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12182 0))(
  ( (Unit!12183) )
))
(declare-fun lt!187924 () Unit!12182)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!349 (array!24137 array!24135 (_ BitVec 32) (_ BitVec 32) V!14591 V!14591 (_ BitVec 32) (_ BitVec 64) V!14591 (_ BitVec 32) Int) Unit!12182)

(assert (=> b!402404 (= lt!187924 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!349 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402405 () Bool)

(declare-fun res!231766 () Bool)

(assert (=> b!402405 (=> (not res!231766) (not e!242453))))

(declare-datatypes ((List!6701 0))(
  ( (Nil!6698) (Cons!6697 (h!7553 (_ BitVec 64)) (t!11875 List!6701)) )
))
(declare-fun arrayNoDuplicates!0 (array!24137 (_ BitVec 32) List!6701) Bool)

(assert (=> b!402405 (= res!231766 (arrayNoDuplicates!0 lt!187925 #b00000000000000000000000000000000 Nil!6698))))

(declare-fun b!402406 () Bool)

(declare-fun res!231768 () Bool)

(assert (=> b!402406 (=> (not res!231768) (not e!242454))))

(assert (=> b!402406 (= res!231768 (and (= (size!11869 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11870 _keys!709) (size!11869 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402407 () Bool)

(declare-fun res!231776 () Bool)

(assert (=> b!402407 (=> (not res!231776) (not e!242454))))

(assert (=> b!402407 (= res!231776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!402408 () Bool)

(declare-fun res!231771 () Bool)

(assert (=> b!402408 (=> (not res!231771) (not e!242454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402408 (= res!231771 (validKeyInArray!0 k!794))))

(declare-fun b!402409 () Bool)

(declare-fun res!231774 () Bool)

(assert (=> b!402409 (=> (not res!231774) (not e!242454))))

(assert (=> b!402409 (= res!231774 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11870 _keys!709))))))

(declare-fun b!402410 () Bool)

(declare-fun call!28363 () ListLongMap!5691)

(assert (=> b!402410 (= e!242448 (= call!28363 call!28364))))

(declare-fun b!402411 () Bool)

(declare-fun e!242451 () Bool)

(assert (=> b!402411 (= e!242451 tp_is_empty!10115)))

(declare-fun res!231773 () Bool)

(assert (=> start!38696 (=> (not res!231773) (not e!242454))))

(assert (=> start!38696 (= res!231773 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11870 _keys!709))))))

(assert (=> start!38696 e!242454))

(assert (=> start!38696 tp_is_empty!10115))

(assert (=> start!38696 tp!32823))

(assert (=> start!38696 true))

(declare-fun e!242452 () Bool)

(declare-fun array_inv!8428 (array!24135) Bool)

(assert (=> start!38696 (and (array_inv!8428 _values!549) e!242452)))

(declare-fun array_inv!8429 (array!24137) Bool)

(assert (=> start!38696 (array_inv!8429 _keys!709)))

(declare-fun b!402400 () Bool)

(assert (=> b!402400 (= e!242452 (and e!242451 mapRes!16794))))

(declare-fun condMapEmpty!16794 () Bool)

(declare-fun mapDefault!16794 () ValueCell!4714)

