; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37214 () Bool)

(assert start!37214)

(declare-fun b_free!8341 () Bool)

(declare-fun b_next!8341 () Bool)

(assert (=> start!37214 (= b_free!8341 (not b_next!8341))))

(declare-fun tp!29738 () Bool)

(declare-fun b_and!15583 () Bool)

(assert (=> start!37214 (= tp!29738 b_and!15583)))

(declare-fun mapNonEmpty!15048 () Bool)

(declare-fun mapRes!15048 () Bool)

(declare-fun tp!29739 () Bool)

(declare-fun e!229094 () Bool)

(assert (=> mapNonEmpty!15048 (= mapRes!15048 (and tp!29739 e!229094))))

(declare-datatypes ((V!13091 0))(
  ( (V!13092 (val!4539 Int)) )
))
(declare-datatypes ((ValueCell!4151 0))(
  ( (ValueCellFull!4151 (v!6736 V!13091)) (EmptyCell!4151) )
))
(declare-datatypes ((array!21911 0))(
  ( (array!21912 (arr!10424 (Array (_ BitVec 32) ValueCell!4151)) (size!10776 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21911)

(declare-fun mapKey!15048 () (_ BitVec 32))

(declare-fun mapValue!15048 () ValueCell!4151)

(declare-fun mapRest!15048 () (Array (_ BitVec 32) ValueCell!4151))

(assert (=> mapNonEmpty!15048 (= (arr!10424 _values!506) (store mapRest!15048 mapKey!15048 mapValue!15048))))

(declare-fun b!376116 () Bool)

(declare-fun tp_is_empty!8989 () Bool)

(assert (=> b!376116 (= e!229094 tp_is_empty!8989)))

(declare-fun b!376117 () Bool)

(declare-fun e!229087 () Bool)

(declare-fun e!229089 () Bool)

(assert (=> b!376117 (= e!229087 e!229089)))

(declare-fun res!212489 () Bool)

(assert (=> b!376117 (=> res!212489 e!229089)))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!376117 (= res!212489 (= k!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6042 0))(
  ( (tuple2!6043 (_1!3032 (_ BitVec 64)) (_2!3032 V!13091)) )
))
(declare-datatypes ((List!5885 0))(
  ( (Nil!5882) (Cons!5881 (h!6737 tuple2!6042) (t!11035 List!5885)) )
))
(declare-datatypes ((ListLongMap!4955 0))(
  ( (ListLongMap!4956 (toList!2493 List!5885)) )
))
(declare-fun lt!174351 () ListLongMap!4955)

(declare-fun lt!174359 () ListLongMap!4955)

(assert (=> b!376117 (= lt!174351 lt!174359)))

(declare-fun lt!174356 () ListLongMap!4955)

(declare-fun lt!174353 () tuple2!6042)

(declare-fun +!839 (ListLongMap!4955 tuple2!6042) ListLongMap!4955)

(assert (=> b!376117 (= lt!174359 (+!839 lt!174356 lt!174353))))

(declare-fun lt!174355 () ListLongMap!4955)

(declare-fun lt!174357 () ListLongMap!4955)

(assert (=> b!376117 (= lt!174355 lt!174357)))

(declare-fun lt!174350 () ListLongMap!4955)

(assert (=> b!376117 (= lt!174357 (+!839 lt!174350 lt!174353))))

(declare-fun lt!174349 () ListLongMap!4955)

(assert (=> b!376117 (= lt!174351 (+!839 lt!174349 lt!174353))))

(declare-fun zeroValue!472 () V!13091)

(assert (=> b!376117 (= lt!174353 (tuple2!6043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!376118 () Bool)

(declare-fun res!212490 () Bool)

(declare-fun e!229090 () Bool)

(assert (=> b!376118 (=> (not res!212490) (not e!229090))))

(declare-datatypes ((array!21913 0))(
  ( (array!21914 (arr!10425 (Array (_ BitVec 32) (_ BitVec 64))) (size!10777 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21913)

(declare-fun arrayContainsKey!0 (array!21913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!376118 (= res!212490 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!376119 () Bool)

(declare-fun res!212497 () Bool)

(assert (=> b!376119 (=> (not res!212497) (not e!229090))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!376119 (= res!212497 (and (= (size!10776 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10777 _keys!658) (size!10776 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!376120 () Bool)

(declare-fun e!229091 () Bool)

(assert (=> b!376120 (= e!229091 (not e!229087))))

(declare-fun res!212498 () Bool)

(assert (=> b!376120 (=> res!212498 e!229087)))

(assert (=> b!376120 (= res!212498 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13091)

(declare-fun getCurrentListMap!1927 (array!21913 array!21911 (_ BitVec 32) (_ BitVec 32) V!13091 V!13091 (_ BitVec 32) Int) ListLongMap!4955)

(assert (=> b!376120 (= lt!174355 (getCurrentListMap!1927 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174354 () array!21913)

(declare-fun lt!174348 () array!21911)

(assert (=> b!376120 (= lt!174351 (getCurrentListMap!1927 lt!174354 lt!174348 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376120 (and (= lt!174349 lt!174356) (= lt!174356 lt!174349))))

(declare-fun lt!174358 () tuple2!6042)

(assert (=> b!376120 (= lt!174356 (+!839 lt!174350 lt!174358))))

(declare-fun v!373 () V!13091)

(assert (=> b!376120 (= lt!174358 (tuple2!6043 k!778 v!373))))

(declare-datatypes ((Unit!11584 0))(
  ( (Unit!11585) )
))
(declare-fun lt!174360 () Unit!11584)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!85 (array!21913 array!21911 (_ BitVec 32) (_ BitVec 32) V!13091 V!13091 (_ BitVec 32) (_ BitVec 64) V!13091 (_ BitVec 32) Int) Unit!11584)

(assert (=> b!376120 (= lt!174360 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!85 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!761 (array!21913 array!21911 (_ BitVec 32) (_ BitVec 32) V!13091 V!13091 (_ BitVec 32) Int) ListLongMap!4955)

(assert (=> b!376120 (= lt!174349 (getCurrentListMapNoExtraKeys!761 lt!174354 lt!174348 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!376120 (= lt!174348 (array!21912 (store (arr!10424 _values!506) i!548 (ValueCellFull!4151 v!373)) (size!10776 _values!506)))))

(assert (=> b!376120 (= lt!174350 (getCurrentListMapNoExtraKeys!761 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!376121 () Bool)

(declare-fun res!212488 () Bool)

(assert (=> b!376121 (=> (not res!212488) (not e!229090))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!376121 (= res!212488 (validKeyInArray!0 k!778))))

(declare-fun b!376122 () Bool)

(declare-fun res!212487 () Bool)

(assert (=> b!376122 (=> (not res!212487) (not e!229090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21913 (_ BitVec 32)) Bool)

(assert (=> b!376122 (= res!212487 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!376123 () Bool)

(declare-fun e!229092 () Bool)

(declare-fun e!229088 () Bool)

(assert (=> b!376123 (= e!229092 (and e!229088 mapRes!15048))))

(declare-fun condMapEmpty!15048 () Bool)

(declare-fun mapDefault!15048 () ValueCell!4151)

