; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37076 () Bool)

(assert start!37076)

(declare-fun b_free!8203 () Bool)

(declare-fun b_next!8203 () Bool)

(assert (=> start!37076 (= b_free!8203 (not b_next!8203))))

(declare-fun tp!29325 () Bool)

(declare-fun b_and!15445 () Bool)

(assert (=> start!37076 (= tp!29325 b_and!15445)))

(declare-fun b!373004 () Bool)

(declare-fun e!227444 () Bool)

(assert (=> b!373004 (= e!227444 true)))

(declare-fun e!227442 () Bool)

(assert (=> b!373004 e!227442))

(declare-fun res!209996 () Bool)

(assert (=> b!373004 (=> (not res!209996) (not e!227442))))

(declare-datatypes ((V!12907 0))(
  ( (V!12908 (val!4470 Int)) )
))
(declare-datatypes ((tuple2!5928 0))(
  ( (tuple2!5929 (_1!2975 (_ BitVec 64)) (_2!2975 V!12907)) )
))
(declare-fun lt!171062 () tuple2!5928)

(declare-datatypes ((List!5774 0))(
  ( (Nil!5771) (Cons!5770 (h!6626 tuple2!5928) (t!10924 List!5774)) )
))
(declare-datatypes ((ListLongMap!4841 0))(
  ( (ListLongMap!4842 (toList!2436 List!5774)) )
))
(declare-fun lt!171064 () ListLongMap!4841)

(declare-fun lt!171060 () ListLongMap!4841)

(declare-fun lt!171057 () tuple2!5928)

(declare-fun +!782 (ListLongMap!4841 tuple2!5928) ListLongMap!4841)

(assert (=> b!373004 (= res!209996 (= lt!171060 (+!782 (+!782 lt!171064 lt!171057) lt!171062)))))

(declare-fun minValue!472 () V!12907)

(assert (=> b!373004 (= lt!171062 (tuple2!5929 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun zeroValue!472 () V!12907)

(assert (=> b!373004 (= lt!171057 (tuple2!5929 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!14841 () Bool)

(declare-fun mapRes!14841 () Bool)

(declare-fun tp!29324 () Bool)

(declare-fun e!227446 () Bool)

(assert (=> mapNonEmpty!14841 (= mapRes!14841 (and tp!29324 e!227446))))

(declare-datatypes ((ValueCell!4082 0))(
  ( (ValueCellFull!4082 (v!6667 V!12907)) (EmptyCell!4082) )
))
(declare-datatypes ((array!21643 0))(
  ( (array!21644 (arr!10290 (Array (_ BitVec 32) ValueCell!4082)) (size!10642 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21643)

(declare-fun mapValue!14841 () ValueCell!4082)

(declare-fun mapKey!14841 () (_ BitVec 32))

(declare-fun mapRest!14841 () (Array (_ BitVec 32) ValueCell!4082))

(assert (=> mapNonEmpty!14841 (= (arr!10290 _values!506) (store mapRest!14841 mapKey!14841 mapValue!14841))))

(declare-fun res!210004 () Bool)

(declare-fun e!227447 () Bool)

(assert (=> start!37076 (=> (not res!210004) (not e!227447))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37076 (= res!210004 (validMask!0 mask!970))))

(assert (=> start!37076 e!227447))

(declare-fun e!227441 () Bool)

(declare-fun array_inv!7588 (array!21643) Bool)

(assert (=> start!37076 (and (array_inv!7588 _values!506) e!227441)))

(assert (=> start!37076 tp!29325))

(assert (=> start!37076 true))

(declare-fun tp_is_empty!8851 () Bool)

(assert (=> start!37076 tp_is_empty!8851))

(declare-datatypes ((array!21645 0))(
  ( (array!21646 (arr!10291 (Array (_ BitVec 32) (_ BitVec 64))) (size!10643 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21645)

(declare-fun array_inv!7589 (array!21645) Bool)

(assert (=> start!37076 (array_inv!7589 _keys!658)))

(declare-fun b!373005 () Bool)

(declare-fun res!209998 () Bool)

(assert (=> b!373005 (=> (not res!209998) (not e!227447))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21645 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373005 (= res!209998 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!373006 () Bool)

(declare-fun e!227445 () Bool)

(assert (=> b!373006 (= e!227445 (not e!227444))))

(declare-fun res!210007 () Bool)

(assert (=> b!373006 (=> res!210007 e!227444)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373006 (= res!210007 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!171058 () ListLongMap!4841)

(declare-fun getCurrentListMap!1879 (array!21645 array!21643 (_ BitVec 32) (_ BitVec 32) V!12907 V!12907 (_ BitVec 32) Int) ListLongMap!4841)

(assert (=> b!373006 (= lt!171058 (getCurrentListMap!1879 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171059 () array!21643)

(declare-fun lt!171066 () array!21645)

(assert (=> b!373006 (= lt!171060 (getCurrentListMap!1879 lt!171066 lt!171059 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171065 () ListLongMap!4841)

(assert (=> b!373006 (and (= lt!171064 lt!171065) (= lt!171065 lt!171064))))

(declare-fun v!373 () V!12907)

(declare-fun lt!171063 () ListLongMap!4841)

(assert (=> b!373006 (= lt!171065 (+!782 lt!171063 (tuple2!5929 k!778 v!373)))))

(declare-datatypes ((Unit!11470 0))(
  ( (Unit!11471) )
))
(declare-fun lt!171061 () Unit!11470)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!37 (array!21645 array!21643 (_ BitVec 32) (_ BitVec 32) V!12907 V!12907 (_ BitVec 32) (_ BitVec 64) V!12907 (_ BitVec 32) Int) Unit!11470)

(assert (=> b!373006 (= lt!171061 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!37 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!713 (array!21645 array!21643 (_ BitVec 32) (_ BitVec 32) V!12907 V!12907 (_ BitVec 32) Int) ListLongMap!4841)

(assert (=> b!373006 (= lt!171064 (getCurrentListMapNoExtraKeys!713 lt!171066 lt!171059 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373006 (= lt!171059 (array!21644 (store (arr!10290 _values!506) i!548 (ValueCellFull!4082 v!373)) (size!10642 _values!506)))))

(assert (=> b!373006 (= lt!171063 (getCurrentListMapNoExtraKeys!713 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373007 () Bool)

(declare-fun res!210006 () Bool)

(assert (=> b!373007 (=> (not res!210006) (not e!227447))))

(assert (=> b!373007 (= res!210006 (and (= (size!10642 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10643 _keys!658) (size!10642 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14841 () Bool)

(assert (=> mapIsEmpty!14841 mapRes!14841))

(declare-fun b!373008 () Bool)

(declare-fun res!210002 () Bool)

(assert (=> b!373008 (=> (not res!210002) (not e!227447))))

(declare-datatypes ((List!5775 0))(
  ( (Nil!5772) (Cons!5771 (h!6627 (_ BitVec 64)) (t!10925 List!5775)) )
))
(declare-fun arrayNoDuplicates!0 (array!21645 (_ BitVec 32) List!5775) Bool)

(assert (=> b!373008 (= res!210002 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5772))))

(declare-fun b!373009 () Bool)

(declare-fun res!210005 () Bool)

(assert (=> b!373009 (=> (not res!210005) (not e!227445))))

(assert (=> b!373009 (= res!210005 (arrayNoDuplicates!0 lt!171066 #b00000000000000000000000000000000 Nil!5772))))

(declare-fun b!373010 () Bool)

(assert (=> b!373010 (= e!227442 (= lt!171060 (+!782 (+!782 lt!171065 lt!171057) lt!171062)))))

(declare-fun b!373011 () Bool)

(assert (=> b!373011 (= e!227447 e!227445)))

(declare-fun res!209999 () Bool)

(assert (=> b!373011 (=> (not res!209999) (not e!227445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21645 (_ BitVec 32)) Bool)

(assert (=> b!373011 (= res!209999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171066 mask!970))))

(assert (=> b!373011 (= lt!171066 (array!21646 (store (arr!10291 _keys!658) i!548 k!778) (size!10643 _keys!658)))))

(declare-fun b!373012 () Bool)

(declare-fun res!210001 () Bool)

(assert (=> b!373012 (=> (not res!210001) (not e!227447))))

(assert (=> b!373012 (= res!210001 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10643 _keys!658))))))

(declare-fun b!373013 () Bool)

(declare-fun res!210003 () Bool)

(assert (=> b!373013 (=> (not res!210003) (not e!227447))))

(assert (=> b!373013 (= res!210003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373014 () Bool)

(assert (=> b!373014 (= e!227446 tp_is_empty!8851)))

(declare-fun b!373015 () Bool)

(declare-fun res!209997 () Bool)

(assert (=> b!373015 (=> (not res!209997) (not e!227447))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373015 (= res!209997 (validKeyInArray!0 k!778))))

(declare-fun b!373016 () Bool)

(declare-fun res!210008 () Bool)

(assert (=> b!373016 (=> (not res!210008) (not e!227442))))

(assert (=> b!373016 (= res!210008 (= lt!171058 (+!782 (+!782 lt!171063 lt!171057) lt!171062)))))

(declare-fun b!373017 () Bool)

(declare-fun e!227440 () Bool)

(assert (=> b!373017 (= e!227440 tp_is_empty!8851)))

(declare-fun b!373018 () Bool)

(assert (=> b!373018 (= e!227441 (and e!227440 mapRes!14841))))

(declare-fun condMapEmpty!14841 () Bool)

(declare-fun mapDefault!14841 () ValueCell!4082)

