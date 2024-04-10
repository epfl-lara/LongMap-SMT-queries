; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39130 () Bool)

(assert start!39130)

(declare-fun b_free!9397 () Bool)

(declare-fun b_next!9397 () Bool)

(assert (=> start!39130 (= b_free!9397 (not b_next!9397))))

(declare-fun tp!33720 () Bool)

(declare-fun b_and!16783 () Bool)

(assert (=> start!39130 (= tp!33720 b_and!16783)))

(declare-fun b!411537 () Bool)

(declare-fun res!238774 () Bool)

(declare-fun e!246446 () Bool)

(assert (=> b!411537 (=> (not res!238774) (not e!246446))))

(declare-datatypes ((array!24959 0))(
  ( (array!24960 (arr!11929 (Array (_ BitVec 32) (_ BitVec 64))) (size!12281 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24959)

(declare-datatypes ((List!6925 0))(
  ( (Nil!6922) (Cons!6921 (h!7777 (_ BitVec 64)) (t!12099 List!6925)) )
))
(declare-fun arrayNoDuplicates!0 (array!24959 (_ BitVec 32) List!6925) Bool)

(assert (=> b!411537 (= res!238774 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6922))))

(declare-fun b!411538 () Bool)

(declare-fun e!246448 () Bool)

(assert (=> b!411538 (= e!246448 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15171 0))(
  ( (V!15172 (val!5319 Int)) )
))
(declare-fun minValue!515 () V!15171)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4931 0))(
  ( (ValueCellFull!4931 (v!7566 V!15171)) (EmptyCell!4931) )
))
(declare-datatypes ((array!24961 0))(
  ( (array!24962 (arr!11930 (Array (_ BitVec 32) ValueCell!4931)) (size!12282 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24961)

(declare-datatypes ((tuple2!6900 0))(
  ( (tuple2!6901 (_1!3461 (_ BitVec 64)) (_2!3461 V!15171)) )
))
(declare-datatypes ((List!6926 0))(
  ( (Nil!6923) (Cons!6922 (h!7778 tuple2!6900) (t!12100 List!6926)) )
))
(declare-datatypes ((ListLongMap!5813 0))(
  ( (ListLongMap!5814 (toList!2922 List!6926)) )
))
(declare-fun lt!189301 () ListLongMap!5813)

(declare-fun zeroValue!515 () V!15171)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!189300 () array!24959)

(declare-fun v!412 () V!15171)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1130 (array!24959 array!24961 (_ BitVec 32) (_ BitVec 32) V!15171 V!15171 (_ BitVec 32) Int) ListLongMap!5813)

(assert (=> b!411538 (= lt!189301 (getCurrentListMapNoExtraKeys!1130 lt!189300 (array!24962 (store (arr!11930 _values!549) i!563 (ValueCellFull!4931 v!412)) (size!12282 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189302 () ListLongMap!5813)

(assert (=> b!411538 (= lt!189302 (getCurrentListMapNoExtraKeys!1130 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411539 () Bool)

(declare-fun res!238776 () Bool)

(assert (=> b!411539 (=> (not res!238776) (not e!246446))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411539 (= res!238776 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!17445 () Bool)

(declare-fun mapRes!17445 () Bool)

(declare-fun tp!33719 () Bool)

(declare-fun e!246445 () Bool)

(assert (=> mapNonEmpty!17445 (= mapRes!17445 (and tp!33719 e!246445))))

(declare-fun mapRest!17445 () (Array (_ BitVec 32) ValueCell!4931))

(declare-fun mapKey!17445 () (_ BitVec 32))

(declare-fun mapValue!17445 () ValueCell!4931)

(assert (=> mapNonEmpty!17445 (= (arr!11930 _values!549) (store mapRest!17445 mapKey!17445 mapValue!17445))))

(declare-fun b!411541 () Bool)

(declare-fun res!238777 () Bool)

(assert (=> b!411541 (=> (not res!238777) (not e!246446))))

(assert (=> b!411541 (= res!238777 (and (= (size!12282 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12281 _keys!709) (size!12282 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!411542 () Bool)

(declare-fun res!238771 () Bool)

(assert (=> b!411542 (=> (not res!238771) (not e!246446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411542 (= res!238771 (validMask!0 mask!1025))))

(declare-fun b!411543 () Bool)

(declare-fun res!238769 () Bool)

(assert (=> b!411543 (=> (not res!238769) (not e!246446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24959 (_ BitVec 32)) Bool)

(assert (=> b!411543 (= res!238769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17445 () Bool)

(assert (=> mapIsEmpty!17445 mapRes!17445))

(declare-fun b!411544 () Bool)

(assert (=> b!411544 (= e!246446 e!246448)))

(declare-fun res!238772 () Bool)

(assert (=> b!411544 (=> (not res!238772) (not e!246448))))

(assert (=> b!411544 (= res!238772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189300 mask!1025))))

(assert (=> b!411544 (= lt!189300 (array!24960 (store (arr!11929 _keys!709) i!563 k!794) (size!12281 _keys!709)))))

(declare-fun b!411545 () Bool)

(declare-fun res!238770 () Bool)

(assert (=> b!411545 (=> (not res!238770) (not e!246446))))

(assert (=> b!411545 (= res!238770 (or (= (select (arr!11929 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11929 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!411546 () Bool)

(declare-fun res!238779 () Bool)

(assert (=> b!411546 (=> (not res!238779) (not e!246448))))

(assert (=> b!411546 (= res!238779 (bvsle from!863 i!563))))

(declare-fun b!411547 () Bool)

(declare-fun res!238778 () Bool)

(assert (=> b!411547 (=> (not res!238778) (not e!246446))))

(declare-fun arrayContainsKey!0 (array!24959 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411547 (= res!238778 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!411548 () Bool)

(declare-fun res!238775 () Bool)

(assert (=> b!411548 (=> (not res!238775) (not e!246446))))

(assert (=> b!411548 (= res!238775 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12281 _keys!709))))))

(declare-fun b!411549 () Bool)

(declare-fun e!246449 () Bool)

(declare-fun tp_is_empty!10549 () Bool)

(assert (=> b!411549 (= e!246449 tp_is_empty!10549)))

(declare-fun res!238773 () Bool)

(assert (=> start!39130 (=> (not res!238773) (not e!246446))))

(assert (=> start!39130 (= res!238773 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12281 _keys!709))))))

(assert (=> start!39130 e!246446))

(assert (=> start!39130 tp_is_empty!10549))

(assert (=> start!39130 tp!33720))

(assert (=> start!39130 true))

(declare-fun e!246450 () Bool)

(declare-fun array_inv!8702 (array!24961) Bool)

(assert (=> start!39130 (and (array_inv!8702 _values!549) e!246450)))

(declare-fun array_inv!8703 (array!24959) Bool)

(assert (=> start!39130 (array_inv!8703 _keys!709)))

(declare-fun b!411540 () Bool)

(assert (=> b!411540 (= e!246445 tp_is_empty!10549)))

(declare-fun b!411550 () Bool)

(assert (=> b!411550 (= e!246450 (and e!246449 mapRes!17445))))

(declare-fun condMapEmpty!17445 () Bool)

(declare-fun mapDefault!17445 () ValueCell!4931)

