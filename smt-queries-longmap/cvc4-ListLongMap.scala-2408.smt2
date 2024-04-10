; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38114 () Bool)

(assert start!38114)

(declare-fun b_free!9017 () Bool)

(declare-fun b_next!9017 () Bool)

(assert (=> start!38114 (= b_free!9017 (not b_next!9017))))

(declare-fun tp!31829 () Bool)

(declare-fun b_and!16367 () Bool)

(assert (=> start!38114 (= tp!31829 b_and!16367)))

(declare-fun b!392688 () Bool)

(declare-fun e!237792 () Bool)

(declare-fun e!237788 () Bool)

(assert (=> b!392688 (= e!237792 e!237788)))

(declare-fun res!224910 () Bool)

(assert (=> b!392688 (=> (not res!224910) (not e!237788))))

(declare-datatypes ((array!23285 0))(
  ( (array!23286 (arr!11102 (Array (_ BitVec 32) (_ BitVec 64))) (size!11454 (_ BitVec 32))) )
))
(declare-fun lt!185604 () array!23285)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23285 (_ BitVec 32)) Bool)

(assert (=> b!392688 (= res!224910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185604 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23285)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!392688 (= lt!185604 (array!23286 (store (arr!11102 _keys!658) i!548 k!778) (size!11454 _keys!658)))))

(declare-fun b!392689 () Bool)

(declare-fun res!224902 () Bool)

(assert (=> b!392689 (=> (not res!224902) (not e!237792))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!14023 0))(
  ( (V!14024 (val!4889 Int)) )
))
(declare-datatypes ((ValueCell!4501 0))(
  ( (ValueCellFull!4501 (v!7122 V!14023)) (EmptyCell!4501) )
))
(declare-datatypes ((array!23287 0))(
  ( (array!23288 (arr!11103 (Array (_ BitVec 32) ValueCell!4501)) (size!11455 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23287)

(assert (=> b!392689 (= res!224902 (and (= (size!11455 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11454 _keys!658) (size!11455 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!392691 () Bool)

(declare-fun e!237789 () Bool)

(declare-fun tp_is_empty!9689 () Bool)

(assert (=> b!392691 (= e!237789 tp_is_empty!9689)))

(declare-fun b!392692 () Bool)

(declare-fun e!237793 () Bool)

(assert (=> b!392692 (= e!237788 (not e!237793))))

(declare-fun res!224908 () Bool)

(assert (=> b!392692 (=> res!224908 e!237793)))

(assert (=> b!392692 (= res!224908 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6596 0))(
  ( (tuple2!6597 (_1!3309 (_ BitVec 64)) (_2!3309 V!14023)) )
))
(declare-datatypes ((List!6449 0))(
  ( (Nil!6446) (Cons!6445 (h!7301 tuple2!6596) (t!11617 List!6449)) )
))
(declare-datatypes ((ListLongMap!5509 0))(
  ( (ListLongMap!5510 (toList!2770 List!6449)) )
))
(declare-fun lt!185603 () ListLongMap!5509)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14023)

(declare-fun minValue!472 () V!14023)

(declare-fun getCurrentListMap!2112 (array!23285 array!23287 (_ BitVec 32) (_ BitVec 32) V!14023 V!14023 (_ BitVec 32) Int) ListLongMap!5509)

(assert (=> b!392692 (= lt!185603 (getCurrentListMap!2112 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185609 () array!23287)

(declare-fun lt!185605 () ListLongMap!5509)

(assert (=> b!392692 (= lt!185605 (getCurrentListMap!2112 lt!185604 lt!185609 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185606 () ListLongMap!5509)

(declare-fun lt!185607 () ListLongMap!5509)

(assert (=> b!392692 (and (= lt!185606 lt!185607) (= lt!185607 lt!185606))))

(declare-fun v!373 () V!14023)

(declare-fun lt!185602 () ListLongMap!5509)

(declare-fun +!1065 (ListLongMap!5509 tuple2!6596) ListLongMap!5509)

(assert (=> b!392692 (= lt!185607 (+!1065 lt!185602 (tuple2!6597 k!778 v!373)))))

(declare-datatypes ((Unit!12016 0))(
  ( (Unit!12017) )
))
(declare-fun lt!185608 () Unit!12016)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!276 (array!23285 array!23287 (_ BitVec 32) (_ BitVec 32) V!14023 V!14023 (_ BitVec 32) (_ BitVec 64) V!14023 (_ BitVec 32) Int) Unit!12016)

(assert (=> b!392692 (= lt!185608 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!276 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!992 (array!23285 array!23287 (_ BitVec 32) (_ BitVec 32) V!14023 V!14023 (_ BitVec 32) Int) ListLongMap!5509)

(assert (=> b!392692 (= lt!185606 (getCurrentListMapNoExtraKeys!992 lt!185604 lt!185609 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392692 (= lt!185609 (array!23288 (store (arr!11103 _values!506) i!548 (ValueCellFull!4501 v!373)) (size!11455 _values!506)))))

(assert (=> b!392692 (= lt!185602 (getCurrentListMapNoExtraKeys!992 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392693 () Bool)

(declare-fun res!224907 () Bool)

(assert (=> b!392693 (=> (not res!224907) (not e!237792))))

(declare-datatypes ((List!6450 0))(
  ( (Nil!6447) (Cons!6446 (h!7302 (_ BitVec 64)) (t!11618 List!6450)) )
))
(declare-fun arrayNoDuplicates!0 (array!23285 (_ BitVec 32) List!6450) Bool)

(assert (=> b!392693 (= res!224907 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6447))))

(declare-fun e!237790 () Bool)

(declare-fun b!392694 () Bool)

(declare-fun lt!185601 () tuple2!6596)

(assert (=> b!392694 (= e!237790 (= lt!185603 (+!1065 lt!185602 lt!185601)))))

(declare-fun b!392695 () Bool)

(declare-fun res!224904 () Bool)

(assert (=> b!392695 (=> (not res!224904) (not e!237792))))

(assert (=> b!392695 (= res!224904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!392696 () Bool)

(declare-fun res!224905 () Bool)

(assert (=> b!392696 (=> (not res!224905) (not e!237790))))

(assert (=> b!392696 (= res!224905 (= lt!185605 (+!1065 lt!185607 lt!185601)))))

(declare-fun b!392697 () Bool)

(declare-fun res!224901 () Bool)

(assert (=> b!392697 (=> (not res!224901) (not e!237792))))

(declare-fun arrayContainsKey!0 (array!23285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!392697 (= res!224901 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!392698 () Bool)

(assert (=> b!392698 (= e!237793 (not (= k!778 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!392698 e!237790))

(declare-fun res!224913 () Bool)

(assert (=> b!392698 (=> (not res!224913) (not e!237790))))

(assert (=> b!392698 (= res!224913 (= lt!185605 (+!1065 lt!185606 lt!185601)))))

(assert (=> b!392698 (= lt!185601 (tuple2!6597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!392699 () Bool)

(declare-fun res!224906 () Bool)

(assert (=> b!392699 (=> (not res!224906) (not e!237792))))

(assert (=> b!392699 (= res!224906 (or (= (select (arr!11102 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11102 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!224903 () Bool)

(assert (=> start!38114 (=> (not res!224903) (not e!237792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38114 (= res!224903 (validMask!0 mask!970))))

(assert (=> start!38114 e!237792))

(declare-fun e!237786 () Bool)

(declare-fun array_inv!8154 (array!23287) Bool)

(assert (=> start!38114 (and (array_inv!8154 _values!506) e!237786)))

(assert (=> start!38114 tp!31829))

(assert (=> start!38114 true))

(assert (=> start!38114 tp_is_empty!9689))

(declare-fun array_inv!8155 (array!23285) Bool)

(assert (=> start!38114 (array_inv!8155 _keys!658)))

(declare-fun b!392690 () Bool)

(declare-fun e!237791 () Bool)

(assert (=> b!392690 (= e!237791 tp_is_empty!9689)))

(declare-fun b!392700 () Bool)

(declare-fun res!224909 () Bool)

(assert (=> b!392700 (=> (not res!224909) (not e!237792))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!392700 (= res!224909 (validKeyInArray!0 k!778))))

(declare-fun mapNonEmpty!16125 () Bool)

(declare-fun mapRes!16125 () Bool)

(declare-fun tp!31830 () Bool)

(assert (=> mapNonEmpty!16125 (= mapRes!16125 (and tp!31830 e!237791))))

(declare-fun mapRest!16125 () (Array (_ BitVec 32) ValueCell!4501))

(declare-fun mapKey!16125 () (_ BitVec 32))

(declare-fun mapValue!16125 () ValueCell!4501)

(assert (=> mapNonEmpty!16125 (= (arr!11103 _values!506) (store mapRest!16125 mapKey!16125 mapValue!16125))))

(declare-fun mapIsEmpty!16125 () Bool)

(assert (=> mapIsEmpty!16125 mapRes!16125))

(declare-fun b!392701 () Bool)

(declare-fun res!224912 () Bool)

(assert (=> b!392701 (=> (not res!224912) (not e!237788))))

(assert (=> b!392701 (= res!224912 (arrayNoDuplicates!0 lt!185604 #b00000000000000000000000000000000 Nil!6447))))

(declare-fun b!392702 () Bool)

(assert (=> b!392702 (= e!237786 (and e!237789 mapRes!16125))))

(declare-fun condMapEmpty!16125 () Bool)

(declare-fun mapDefault!16125 () ValueCell!4501)

