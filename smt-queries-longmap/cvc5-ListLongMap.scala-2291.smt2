; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37208 () Bool)

(assert start!37208)

(declare-fun b_free!8335 () Bool)

(declare-fun b_next!8335 () Bool)

(assert (=> start!37208 (= b_free!8335 (not b_next!8335))))

(declare-fun tp!29720 () Bool)

(declare-fun b_and!15577 () Bool)

(assert (=> start!37208 (= tp!29720 b_and!15577)))

(declare-fun b!375981 () Bool)

(declare-fun res!212388 () Bool)

(declare-fun e!229016 () Bool)

(assert (=> b!375981 (=> (not res!212388) (not e!229016))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13083 0))(
  ( (V!13084 (val!4536 Int)) )
))
(declare-datatypes ((ValueCell!4148 0))(
  ( (ValueCellFull!4148 (v!6733 V!13083)) (EmptyCell!4148) )
))
(declare-datatypes ((array!21899 0))(
  ( (array!21900 (arr!10418 (Array (_ BitVec 32) ValueCell!4148)) (size!10770 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21899)

(declare-datatypes ((array!21901 0))(
  ( (array!21902 (arr!10419 (Array (_ BitVec 32) (_ BitVec 64))) (size!10771 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21901)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!375981 (= res!212388 (and (= (size!10770 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10771 _keys!658) (size!10770 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375982 () Bool)

(declare-fun res!212390 () Bool)

(assert (=> b!375982 (=> (not res!212390) (not e!229016))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375982 (= res!212390 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10771 _keys!658))))))

(declare-fun mapIsEmpty!15039 () Bool)

(declare-fun mapRes!15039 () Bool)

(assert (=> mapIsEmpty!15039 mapRes!15039))

(declare-fun b!375983 () Bool)

(declare-fun res!212389 () Bool)

(assert (=> b!375983 (=> (not res!212389) (not e!229016))))

(declare-datatypes ((List!5880 0))(
  ( (Nil!5877) (Cons!5876 (h!6732 (_ BitVec 64)) (t!11030 List!5880)) )
))
(declare-fun arrayNoDuplicates!0 (array!21901 (_ BitVec 32) List!5880) Bool)

(assert (=> b!375983 (= res!212389 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5877))))

(declare-fun b!375984 () Bool)

(declare-fun res!212380 () Bool)

(assert (=> b!375984 (=> (not res!212380) (not e!229016))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375984 (= res!212380 (validKeyInArray!0 k!778))))

(declare-fun res!212387 () Bool)

(assert (=> start!37208 (=> (not res!212387) (not e!229016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37208 (= res!212387 (validMask!0 mask!970))))

(assert (=> start!37208 e!229016))

(declare-fun e!229020 () Bool)

(declare-fun array_inv!7680 (array!21899) Bool)

(assert (=> start!37208 (and (array_inv!7680 _values!506) e!229020)))

(assert (=> start!37208 tp!29720))

(assert (=> start!37208 true))

(declare-fun tp_is_empty!8983 () Bool)

(assert (=> start!37208 tp_is_empty!8983))

(declare-fun array_inv!7681 (array!21901) Bool)

(assert (=> start!37208 (array_inv!7681 _keys!658)))

(declare-fun b!375985 () Bool)

(declare-fun e!229018 () Bool)

(declare-fun e!229017 () Bool)

(assert (=> b!375985 (= e!229018 (not e!229017))))

(declare-fun res!212381 () Bool)

(assert (=> b!375985 (=> res!212381 e!229017)))

(assert (=> b!375985 (= res!212381 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13083)

(declare-datatypes ((tuple2!6038 0))(
  ( (tuple2!6039 (_1!3030 (_ BitVec 64)) (_2!3030 V!13083)) )
))
(declare-datatypes ((List!5881 0))(
  ( (Nil!5878) (Cons!5877 (h!6733 tuple2!6038) (t!11031 List!5881)) )
))
(declare-datatypes ((ListLongMap!4951 0))(
  ( (ListLongMap!4952 (toList!2491 List!5881)) )
))
(declare-fun lt!174233 () ListLongMap!4951)

(declare-fun minValue!472 () V!13083)

(declare-fun getCurrentListMap!1925 (array!21901 array!21899 (_ BitVec 32) (_ BitVec 32) V!13083 V!13083 (_ BitVec 32) Int) ListLongMap!4951)

(assert (=> b!375985 (= lt!174233 (getCurrentListMap!1925 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174231 () array!21901)

(declare-fun lt!174236 () array!21899)

(declare-fun lt!174234 () ListLongMap!4951)

(assert (=> b!375985 (= lt!174234 (getCurrentListMap!1925 lt!174231 lt!174236 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174232 () ListLongMap!4951)

(declare-fun lt!174240 () ListLongMap!4951)

(assert (=> b!375985 (and (= lt!174232 lt!174240) (= lt!174240 lt!174232))))

(declare-fun lt!174235 () ListLongMap!4951)

(declare-fun lt!174239 () tuple2!6038)

(declare-fun +!837 (ListLongMap!4951 tuple2!6038) ListLongMap!4951)

(assert (=> b!375985 (= lt!174240 (+!837 lt!174235 lt!174239))))

(declare-fun v!373 () V!13083)

(assert (=> b!375985 (= lt!174239 (tuple2!6039 k!778 v!373))))

(declare-datatypes ((Unit!11580 0))(
  ( (Unit!11581) )
))
(declare-fun lt!174242 () Unit!11580)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!83 (array!21901 array!21899 (_ BitVec 32) (_ BitVec 32) V!13083 V!13083 (_ BitVec 32) (_ BitVec 64) V!13083 (_ BitVec 32) Int) Unit!11580)

(assert (=> b!375985 (= lt!174242 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!83 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!759 (array!21901 array!21899 (_ BitVec 32) (_ BitVec 32) V!13083 V!13083 (_ BitVec 32) Int) ListLongMap!4951)

(assert (=> b!375985 (= lt!174232 (getCurrentListMapNoExtraKeys!759 lt!174231 lt!174236 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375985 (= lt!174236 (array!21900 (store (arr!10418 _values!506) i!548 (ValueCellFull!4148 v!373)) (size!10770 _values!506)))))

(assert (=> b!375985 (= lt!174235 (getCurrentListMapNoExtraKeys!759 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375986 () Bool)

(declare-fun res!212382 () Bool)

(assert (=> b!375986 (=> (not res!212382) (not e!229016))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21901 (_ BitVec 32)) Bool)

(assert (=> b!375986 (= res!212382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375987 () Bool)

(declare-fun e!229015 () Bool)

(assert (=> b!375987 (= e!229015 tp_is_empty!8983)))

(declare-fun b!375988 () Bool)

(declare-fun e!229021 () Bool)

(assert (=> b!375988 (= e!229021 true)))

(declare-fun lt!174238 () ListLongMap!4951)

(declare-fun lt!174243 () ListLongMap!4951)

(assert (=> b!375988 (= lt!174238 (+!837 lt!174243 lt!174239))))

(declare-fun lt!174237 () Unit!11580)

(declare-fun addCommutativeForDiffKeys!253 (ListLongMap!4951 (_ BitVec 64) V!13083 (_ BitVec 64) V!13083) Unit!11580)

(assert (=> b!375988 (= lt!174237 (addCommutativeForDiffKeys!253 lt!174235 k!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375989 () Bool)

(assert (=> b!375989 (= e!229016 e!229018)))

(declare-fun res!212383 () Bool)

(assert (=> b!375989 (=> (not res!212383) (not e!229018))))

(assert (=> b!375989 (= res!212383 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174231 mask!970))))

(assert (=> b!375989 (= lt!174231 (array!21902 (store (arr!10419 _keys!658) i!548 k!778) (size!10771 _keys!658)))))

(declare-fun mapNonEmpty!15039 () Bool)

(declare-fun tp!29721 () Bool)

(assert (=> mapNonEmpty!15039 (= mapRes!15039 (and tp!29721 e!229015))))

(declare-fun mapKey!15039 () (_ BitVec 32))

(declare-fun mapValue!15039 () ValueCell!4148)

(declare-fun mapRest!15039 () (Array (_ BitVec 32) ValueCell!4148))

(assert (=> mapNonEmpty!15039 (= (arr!10418 _values!506) (store mapRest!15039 mapKey!15039 mapValue!15039))))

(declare-fun b!375990 () Bool)

(declare-fun res!212386 () Bool)

(assert (=> b!375990 (=> (not res!212386) (not e!229016))))

(assert (=> b!375990 (= res!212386 (or (= (select (arr!10419 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10419 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375991 () Bool)

(declare-fun e!229019 () Bool)

(assert (=> b!375991 (= e!229020 (and e!229019 mapRes!15039))))

(declare-fun condMapEmpty!15039 () Bool)

(declare-fun mapDefault!15039 () ValueCell!4148)

