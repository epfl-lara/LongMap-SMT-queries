; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38036 () Bool)

(assert start!38036)

(declare-fun b_free!8983 () Bool)

(declare-fun b_next!8983 () Bool)

(assert (=> start!38036 (= b_free!8983 (not b_next!8983))))

(declare-fun tp!31721 () Bool)

(declare-fun b_and!16309 () Bool)

(assert (=> start!38036 (= tp!31721 b_and!16309)))

(declare-fun b!391527 () Bool)

(declare-fun res!224122 () Bool)

(declare-fun e!237134 () Bool)

(assert (=> b!391527 (=> (not res!224122) (not e!237134))))

(declare-datatypes ((array!23213 0))(
  ( (array!23214 (arr!11068 (Array (_ BitVec 32) (_ BitVec 64))) (size!11420 (_ BitVec 32))) )
))
(declare-fun lt!184788 () array!23213)

(declare-datatypes ((List!6418 0))(
  ( (Nil!6415) (Cons!6414 (h!7270 (_ BitVec 64)) (t!11582 List!6418)) )
))
(declare-fun arrayNoDuplicates!0 (array!23213 (_ BitVec 32) List!6418) Bool)

(assert (=> b!391527 (= res!224122 (arrayNoDuplicates!0 lt!184788 #b00000000000000000000000000000000 Nil!6415))))

(declare-fun b!391528 () Bool)

(declare-fun e!237135 () Bool)

(declare-fun tp_is_empty!9655 () Bool)

(assert (=> b!391528 (= e!237135 tp_is_empty!9655)))

(declare-fun b!391529 () Bool)

(declare-fun res!224121 () Bool)

(declare-fun e!237136 () Bool)

(assert (=> b!391529 (=> (not res!224121) (not e!237136))))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun _keys!658 () array!23213)

(assert (=> b!391529 (= res!224121 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11420 _keys!658))))))

(declare-fun b!391530 () Bool)

(declare-fun res!224125 () Bool)

(assert (=> b!391530 (=> (not res!224125) (not e!237136))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391530 (= res!224125 (validKeyInArray!0 k!778))))

(declare-fun mapIsEmpty!16068 () Bool)

(declare-fun mapRes!16068 () Bool)

(assert (=> mapIsEmpty!16068 mapRes!16068))

(declare-fun b!391531 () Bool)

(declare-fun res!224124 () Bool)

(assert (=> b!391531 (=> (not res!224124) (not e!237136))))

(declare-fun arrayContainsKey!0 (array!23213 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391531 (= res!224124 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!391532 () Bool)

(declare-fun e!237138 () Bool)

(declare-datatypes ((V!13979 0))(
  ( (V!13980 (val!4872 Int)) )
))
(declare-datatypes ((ValueCell!4484 0))(
  ( (ValueCellFull!4484 (v!7097 V!13979)) (EmptyCell!4484) )
))
(declare-datatypes ((array!23215 0))(
  ( (array!23216 (arr!11069 (Array (_ BitVec 32) ValueCell!4484)) (size!11421 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23215)

(assert (=> b!391532 (= e!237138 (bvslt i!548 (size!11421 _values!506)))))

(declare-datatypes ((tuple2!6564 0))(
  ( (tuple2!6565 (_1!3293 (_ BitVec 64)) (_2!3293 V!13979)) )
))
(declare-datatypes ((List!6419 0))(
  ( (Nil!6416) (Cons!6415 (h!7271 tuple2!6564) (t!11583 List!6419)) )
))
(declare-datatypes ((ListLongMap!5477 0))(
  ( (ListLongMap!5478 (toList!2754 List!6419)) )
))
(declare-fun lt!184787 () ListLongMap!5477)

(declare-fun lt!184795 () ListLongMap!5477)

(declare-fun lt!184786 () tuple2!6564)

(declare-fun +!1049 (ListLongMap!5477 tuple2!6564) ListLongMap!5477)

(assert (=> b!391532 (= lt!184787 (+!1049 lt!184795 lt!184786))))

(declare-datatypes ((Unit!11980 0))(
  ( (Unit!11981) )
))
(declare-fun lt!184792 () Unit!11980)

(declare-fun v!373 () V!13979)

(declare-fun lt!184793 () ListLongMap!5477)

(declare-fun zeroValue!472 () V!13979)

(declare-fun addCommutativeForDiffKeys!340 (ListLongMap!5477 (_ BitVec 64) V!13979 (_ BitVec 64) V!13979) Unit!11980)

(assert (=> b!391532 (= lt!184792 (addCommutativeForDiffKeys!340 lt!184793 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun res!224118 () Bool)

(assert (=> start!38036 (=> (not res!224118) (not e!237136))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38036 (= res!224118 (validMask!0 mask!970))))

(assert (=> start!38036 e!237136))

(declare-fun e!237141 () Bool)

(declare-fun array_inv!8128 (array!23215) Bool)

(assert (=> start!38036 (and (array_inv!8128 _values!506) e!237141)))

(assert (=> start!38036 tp!31721))

(assert (=> start!38036 true))

(assert (=> start!38036 tp_is_empty!9655))

(declare-fun array_inv!8129 (array!23213) Bool)

(assert (=> start!38036 (array_inv!8129 _keys!658)))

(declare-fun b!391533 () Bool)

(assert (=> b!391533 (= e!237136 e!237134)))

(declare-fun res!224127 () Bool)

(assert (=> b!391533 (=> (not res!224127) (not e!237134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23213 (_ BitVec 32)) Bool)

(assert (=> b!391533 (= res!224127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184788 mask!970))))

(assert (=> b!391533 (= lt!184788 (array!23214 (store (arr!11068 _keys!658) i!548 k!778) (size!11420 _keys!658)))))

(declare-fun b!391534 () Bool)

(declare-fun e!237137 () Bool)

(assert (=> b!391534 (= e!237137 tp_is_empty!9655)))

(declare-fun b!391535 () Bool)

(declare-fun res!224117 () Bool)

(assert (=> b!391535 (=> (not res!224117) (not e!237136))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391535 (= res!224117 (and (= (size!11421 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11420 _keys!658) (size!11421 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!391536 () Bool)

(declare-fun res!224123 () Bool)

(assert (=> b!391536 (=> (not res!224123) (not e!237136))))

(assert (=> b!391536 (= res!224123 (or (= (select (arr!11068 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11068 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16068 () Bool)

(declare-fun tp!31722 () Bool)

(assert (=> mapNonEmpty!16068 (= mapRes!16068 (and tp!31722 e!237137))))

(declare-fun mapKey!16068 () (_ BitVec 32))

(declare-fun mapValue!16068 () ValueCell!4484)

(declare-fun mapRest!16068 () (Array (_ BitVec 32) ValueCell!4484))

(assert (=> mapNonEmpty!16068 (= (arr!11069 _values!506) (store mapRest!16068 mapKey!16068 mapValue!16068))))

(declare-fun b!391537 () Bool)

(declare-fun e!237140 () Bool)

(assert (=> b!391537 (= e!237134 (not e!237140))))

(declare-fun res!224126 () Bool)

(assert (=> b!391537 (=> res!224126 e!237140)))

(assert (=> b!391537 (= res!224126 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!184794 () ListLongMap!5477)

(declare-fun minValue!472 () V!13979)

(declare-fun getCurrentListMap!2097 (array!23213 array!23215 (_ BitVec 32) (_ BitVec 32) V!13979 V!13979 (_ BitVec 32) Int) ListLongMap!5477)

(assert (=> b!391537 (= lt!184794 (getCurrentListMap!2097 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184797 () array!23215)

(declare-fun lt!184790 () ListLongMap!5477)

(assert (=> b!391537 (= lt!184790 (getCurrentListMap!2097 lt!184788 lt!184797 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184796 () ListLongMap!5477)

(declare-fun lt!184785 () ListLongMap!5477)

(assert (=> b!391537 (and (= lt!184796 lt!184785) (= lt!184785 lt!184796))))

(assert (=> b!391537 (= lt!184785 (+!1049 lt!184793 lt!184786))))

(assert (=> b!391537 (= lt!184786 (tuple2!6565 k!778 v!373))))

(declare-fun lt!184789 () Unit!11980)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!261 (array!23213 array!23215 (_ BitVec 32) (_ BitVec 32) V!13979 V!13979 (_ BitVec 32) (_ BitVec 64) V!13979 (_ BitVec 32) Int) Unit!11980)

(assert (=> b!391537 (= lt!184789 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!261 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!977 (array!23213 array!23215 (_ BitVec 32) (_ BitVec 32) V!13979 V!13979 (_ BitVec 32) Int) ListLongMap!5477)

(assert (=> b!391537 (= lt!184796 (getCurrentListMapNoExtraKeys!977 lt!184788 lt!184797 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391537 (= lt!184797 (array!23216 (store (arr!11069 _values!506) i!548 (ValueCellFull!4484 v!373)) (size!11421 _values!506)))))

(assert (=> b!391537 (= lt!184793 (getCurrentListMapNoExtraKeys!977 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391538 () Bool)

(declare-fun res!224120 () Bool)

(assert (=> b!391538 (=> (not res!224120) (not e!237136))))

(assert (=> b!391538 (= res!224120 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6415))))

(declare-fun b!391539 () Bool)

(assert (=> b!391539 (= e!237141 (and e!237135 mapRes!16068))))

(declare-fun condMapEmpty!16068 () Bool)

(declare-fun mapDefault!16068 () ValueCell!4484)

