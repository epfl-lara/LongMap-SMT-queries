; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38052 () Bool)

(assert start!38052)

(declare-fun b_free!8999 () Bool)

(declare-fun b_next!8999 () Bool)

(assert (=> start!38052 (= b_free!8999 (not b_next!8999))))

(declare-fun tp!31769 () Bool)

(declare-fun b_and!16325 () Bool)

(assert (=> start!38052 (= tp!31769 b_and!16325)))

(declare-fun b!391879 () Bool)

(declare-fun res!224401 () Bool)

(declare-fun e!237324 () Bool)

(assert (=> b!391879 (=> (not res!224401) (not e!237324))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23245 0))(
  ( (array!23246 (arr!11084 (Array (_ BitVec 32) (_ BitVec 64))) (size!11436 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23245)

(assert (=> b!391879 (= res!224401 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11436 _keys!658))))))

(declare-fun b!391880 () Bool)

(declare-fun res!224398 () Bool)

(assert (=> b!391880 (=> (not res!224398) (not e!237324))))

(declare-datatypes ((List!6432 0))(
  ( (Nil!6429) (Cons!6428 (h!7284 (_ BitVec 64)) (t!11596 List!6432)) )
))
(declare-fun arrayNoDuplicates!0 (array!23245 (_ BitVec 32) List!6432) Bool)

(assert (=> b!391880 (= res!224398 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6429))))

(declare-fun b!391881 () Bool)

(declare-fun res!224397 () Bool)

(declare-fun e!237318 () Bool)

(assert (=> b!391881 (=> (not res!224397) (not e!237318))))

(declare-fun lt!185059 () array!23245)

(assert (=> b!391881 (= res!224397 (arrayNoDuplicates!0 lt!185059 #b00000000000000000000000000000000 Nil!6429))))

(declare-fun b!391882 () Bool)

(declare-fun e!237320 () Bool)

(declare-fun tp_is_empty!9671 () Bool)

(assert (=> b!391882 (= e!237320 tp_is_empty!9671)))

(declare-fun b!391883 () Bool)

(assert (=> b!391883 (= e!237324 e!237318)))

(declare-fun res!224405 () Bool)

(assert (=> b!391883 (=> (not res!224405) (not e!237318))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23245 (_ BitVec 32)) Bool)

(assert (=> b!391883 (= res!224405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185059 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!391883 (= lt!185059 (array!23246 (store (arr!11084 _keys!658) i!548 k!778) (size!11436 _keys!658)))))

(declare-fun res!224407 () Bool)

(assert (=> start!38052 (=> (not res!224407) (not e!237324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38052 (= res!224407 (validMask!0 mask!970))))

(assert (=> start!38052 e!237324))

(declare-datatypes ((V!13999 0))(
  ( (V!14000 (val!4880 Int)) )
))
(declare-datatypes ((ValueCell!4492 0))(
  ( (ValueCellFull!4492 (v!7105 V!13999)) (EmptyCell!4492) )
))
(declare-datatypes ((array!23247 0))(
  ( (array!23248 (arr!11085 (Array (_ BitVec 32) ValueCell!4492)) (size!11437 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23247)

(declare-fun e!237321 () Bool)

(declare-fun array_inv!8142 (array!23247) Bool)

(assert (=> start!38052 (and (array_inv!8142 _values!506) e!237321)))

(assert (=> start!38052 tp!31769))

(assert (=> start!38052 true))

(assert (=> start!38052 tp_is_empty!9671))

(declare-fun array_inv!8143 (array!23245) Bool)

(assert (=> start!38052 (array_inv!8143 _keys!658)))

(declare-fun b!391884 () Bool)

(declare-fun res!224403 () Bool)

(assert (=> b!391884 (=> (not res!224403) (not e!237324))))

(declare-fun arrayContainsKey!0 (array!23245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391884 (= res!224403 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!391885 () Bool)

(declare-fun e!237323 () Bool)

(assert (=> b!391885 (= e!237318 (not e!237323))))

(declare-fun res!224402 () Bool)

(assert (=> b!391885 (=> res!224402 e!237323)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391885 (= res!224402 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6578 0))(
  ( (tuple2!6579 (_1!3300 (_ BitVec 64)) (_2!3300 V!13999)) )
))
(declare-datatypes ((List!6433 0))(
  ( (Nil!6430) (Cons!6429 (h!7285 tuple2!6578) (t!11597 List!6433)) )
))
(declare-datatypes ((ListLongMap!5491 0))(
  ( (ListLongMap!5492 (toList!2761 List!6433)) )
))
(declare-fun lt!185060 () ListLongMap!5491)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13999)

(declare-fun minValue!472 () V!13999)

(declare-fun getCurrentListMap!2103 (array!23245 array!23247 (_ BitVec 32) (_ BitVec 32) V!13999 V!13999 (_ BitVec 32) Int) ListLongMap!5491)

(assert (=> b!391885 (= lt!185060 (getCurrentListMap!2103 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185061 () array!23247)

(declare-fun lt!185064 () ListLongMap!5491)

(assert (=> b!391885 (= lt!185064 (getCurrentListMap!2103 lt!185059 lt!185061 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185062 () ListLongMap!5491)

(declare-fun lt!185057 () ListLongMap!5491)

(assert (=> b!391885 (and (= lt!185062 lt!185057) (= lt!185057 lt!185062))))

(declare-fun lt!185058 () ListLongMap!5491)

(declare-fun v!373 () V!13999)

(declare-fun +!1056 (ListLongMap!5491 tuple2!6578) ListLongMap!5491)

(assert (=> b!391885 (= lt!185057 (+!1056 lt!185058 (tuple2!6579 k!778 v!373)))))

(declare-datatypes ((Unit!11994 0))(
  ( (Unit!11995) )
))
(declare-fun lt!185063 () Unit!11994)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!267 (array!23245 array!23247 (_ BitVec 32) (_ BitVec 32) V!13999 V!13999 (_ BitVec 32) (_ BitVec 64) V!13999 (_ BitVec 32) Int) Unit!11994)

(assert (=> b!391885 (= lt!185063 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!267 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!983 (array!23245 array!23247 (_ BitVec 32) (_ BitVec 32) V!13999 V!13999 (_ BitVec 32) Int) ListLongMap!5491)

(assert (=> b!391885 (= lt!185062 (getCurrentListMapNoExtraKeys!983 lt!185059 lt!185061 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391885 (= lt!185061 (array!23248 (store (arr!11085 _values!506) i!548 (ValueCellFull!4492 v!373)) (size!11437 _values!506)))))

(assert (=> b!391885 (= lt!185058 (getCurrentListMapNoExtraKeys!983 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391886 () Bool)

(declare-fun res!224404 () Bool)

(assert (=> b!391886 (=> (not res!224404) (not e!237324))))

(assert (=> b!391886 (= res!224404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!391887 () Bool)

(assert (=> b!391887 (= e!237323 (= lt!185064 (+!1056 lt!185062 (tuple2!6579 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!391888 () Bool)

(declare-fun res!224406 () Bool)

(assert (=> b!391888 (=> (not res!224406) (not e!237324))))

(assert (=> b!391888 (= res!224406 (and (= (size!11437 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11436 _keys!658) (size!11437 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16092 () Bool)

(declare-fun mapRes!16092 () Bool)

(declare-fun tp!31770 () Bool)

(assert (=> mapNonEmpty!16092 (= mapRes!16092 (and tp!31770 e!237320))))

(declare-fun mapValue!16092 () ValueCell!4492)

(declare-fun mapRest!16092 () (Array (_ BitVec 32) ValueCell!4492))

(declare-fun mapKey!16092 () (_ BitVec 32))

(assert (=> mapNonEmpty!16092 (= (arr!11085 _values!506) (store mapRest!16092 mapKey!16092 mapValue!16092))))

(declare-fun b!391889 () Bool)

(declare-fun e!237322 () Bool)

(assert (=> b!391889 (= e!237322 tp_is_empty!9671)))

(declare-fun b!391890 () Bool)

(declare-fun res!224399 () Bool)

(assert (=> b!391890 (=> (not res!224399) (not e!237324))))

(assert (=> b!391890 (= res!224399 (or (= (select (arr!11084 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11084 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16092 () Bool)

(assert (=> mapIsEmpty!16092 mapRes!16092))

(declare-fun b!391891 () Bool)

(assert (=> b!391891 (= e!237321 (and e!237322 mapRes!16092))))

(declare-fun condMapEmpty!16092 () Bool)

(declare-fun mapDefault!16092 () ValueCell!4492)

