; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37254 () Bool)

(assert start!37254)

(declare-fun b_free!8395 () Bool)

(declare-fun b_next!8395 () Bool)

(assert (=> start!37254 (= b_free!8395 (not b_next!8395))))

(declare-fun tp!29901 () Bool)

(declare-fun b_and!15611 () Bool)

(assert (=> start!37254 (= tp!29901 b_and!15611)))

(declare-fun b!377060 () Bool)

(declare-fun e!229561 () Bool)

(declare-fun tp_is_empty!9043 () Bool)

(assert (=> b!377060 (= e!229561 tp_is_empty!9043)))

(declare-fun b!377061 () Bool)

(declare-fun e!229564 () Bool)

(declare-fun e!229565 () Bool)

(declare-fun mapRes!15129 () Bool)

(assert (=> b!377061 (= e!229564 (and e!229565 mapRes!15129))))

(declare-fun condMapEmpty!15129 () Bool)

(declare-datatypes ((V!13163 0))(
  ( (V!13164 (val!4566 Int)) )
))
(declare-datatypes ((ValueCell!4178 0))(
  ( (ValueCellFull!4178 (v!6757 V!13163)) (EmptyCell!4178) )
))
(declare-datatypes ((array!21997 0))(
  ( (array!21998 (arr!10467 (Array (_ BitVec 32) ValueCell!4178)) (size!10820 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21997)

(declare-fun mapDefault!15129 () ValueCell!4178)

(assert (=> b!377061 (= condMapEmpty!15129 (= (arr!10467 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4178)) mapDefault!15129)))))

(declare-fun b!377062 () Bool)

(declare-fun e!229567 () Bool)

(declare-fun e!229562 () Bool)

(assert (=> b!377062 (= e!229567 e!229562)))

(declare-fun res!213334 () Bool)

(assert (=> b!377062 (=> (not res!213334) (not e!229562))))

(declare-datatypes ((array!21999 0))(
  ( (array!22000 (arr!10468 (Array (_ BitVec 32) (_ BitVec 64))) (size!10821 (_ BitVec 32))) )
))
(declare-fun lt!175177 () array!21999)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21999 (_ BitVec 32)) Bool)

(assert (=> b!377062 (= res!213334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!175177 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!21999)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!377062 (= lt!175177 (array!22000 (store (arr!10468 _keys!658) i!548 k0!778) (size!10821 _keys!658)))))

(declare-fun b!377064 () Bool)

(declare-fun e!229563 () Bool)

(assert (=> b!377064 (= e!229562 (not e!229563))))

(declare-fun res!213336 () Bool)

(assert (=> b!377064 (=> res!213336 e!229563)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!377064 (= res!213336 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6070 0))(
  ( (tuple2!6071 (_1!3046 (_ BitVec 64)) (_2!3046 V!13163)) )
))
(declare-datatypes ((List!5900 0))(
  ( (Nil!5897) (Cons!5896 (h!6752 tuple2!6070) (t!11041 List!5900)) )
))
(declare-datatypes ((ListLongMap!4973 0))(
  ( (ListLongMap!4974 (toList!2502 List!5900)) )
))
(declare-fun lt!175169 () ListLongMap!4973)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13163)

(declare-fun minValue!472 () V!13163)

(declare-fun getCurrentListMap!1911 (array!21999 array!21997 (_ BitVec 32) (_ BitVec 32) V!13163 V!13163 (_ BitVec 32) Int) ListLongMap!4973)

(assert (=> b!377064 (= lt!175169 (getCurrentListMap!1911 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175172 () array!21997)

(declare-fun lt!175171 () ListLongMap!4973)

(assert (=> b!377064 (= lt!175171 (getCurrentListMap!1911 lt!175177 lt!175172 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!175170 () ListLongMap!4973)

(declare-fun lt!175167 () ListLongMap!4973)

(assert (=> b!377064 (and (= lt!175170 lt!175167) (= lt!175167 lt!175170))))

(declare-fun lt!175179 () ListLongMap!4973)

(declare-fun lt!175168 () tuple2!6070)

(declare-fun +!870 (ListLongMap!4973 tuple2!6070) ListLongMap!4973)

(assert (=> b!377064 (= lt!175167 (+!870 lt!175179 lt!175168))))

(declare-fun v!373 () V!13163)

(assert (=> b!377064 (= lt!175168 (tuple2!6071 k0!778 v!373))))

(declare-datatypes ((Unit!11610 0))(
  ( (Unit!11611) )
))
(declare-fun lt!175178 () Unit!11610)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!104 (array!21999 array!21997 (_ BitVec 32) (_ BitVec 32) V!13163 V!13163 (_ BitVec 32) (_ BitVec 64) V!13163 (_ BitVec 32) Int) Unit!11610)

(assert (=> b!377064 (= lt!175178 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!104 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!776 (array!21999 array!21997 (_ BitVec 32) (_ BitVec 32) V!13163 V!13163 (_ BitVec 32) Int) ListLongMap!4973)

(assert (=> b!377064 (= lt!175170 (getCurrentListMapNoExtraKeys!776 lt!175177 lt!175172 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!377064 (= lt!175172 (array!21998 (store (arr!10467 _values!506) i!548 (ValueCellFull!4178 v!373)) (size!10820 _values!506)))))

(assert (=> b!377064 (= lt!175179 (getCurrentListMapNoExtraKeys!776 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!377065 () Bool)

(declare-fun res!213331 () Bool)

(assert (=> b!377065 (=> (not res!213331) (not e!229567))))

(declare-fun arrayContainsKey!0 (array!21999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!377065 (= res!213331 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!377066 () Bool)

(declare-fun res!213341 () Bool)

(assert (=> b!377066 (=> (not res!213341) (not e!229567))))

(assert (=> b!377066 (= res!213341 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10821 _keys!658))))))

(declare-fun b!377067 () Bool)

(declare-fun res!213338 () Bool)

(assert (=> b!377067 (=> (not res!213338) (not e!229567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!377067 (= res!213338 (validKeyInArray!0 k0!778))))

(declare-fun b!377068 () Bool)

(declare-fun res!213330 () Bool)

(assert (=> b!377068 (=> (not res!213330) (not e!229562))))

(declare-datatypes ((List!5901 0))(
  ( (Nil!5898) (Cons!5897 (h!6753 (_ BitVec 64)) (t!11042 List!5901)) )
))
(declare-fun arrayNoDuplicates!0 (array!21999 (_ BitVec 32) List!5901) Bool)

(assert (=> b!377068 (= res!213330 (arrayNoDuplicates!0 lt!175177 #b00000000000000000000000000000000 Nil!5898))))

(declare-fun b!377069 () Bool)

(declare-fun res!213332 () Bool)

(assert (=> b!377069 (=> (not res!213332) (not e!229567))))

(assert (=> b!377069 (= res!213332 (and (= (size!10820 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10821 _keys!658) (size!10820 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!377070 () Bool)

(assert (=> b!377070 (= e!229565 tp_is_empty!9043)))

(declare-fun b!377071 () Bool)

(declare-fun e!229566 () Bool)

(assert (=> b!377071 (= e!229566 true)))

(declare-fun lt!175175 () ListLongMap!4973)

(declare-fun lt!175174 () ListLongMap!4973)

(assert (=> b!377071 (= lt!175175 (+!870 lt!175174 lt!175168))))

(declare-fun lt!175173 () Unit!11610)

(declare-fun addCommutativeForDiffKeys!277 (ListLongMap!4973 (_ BitVec 64) V!13163 (_ BitVec 64) V!13163) Unit!11610)

(assert (=> b!377071 (= lt!175173 (addCommutativeForDiffKeys!277 lt!175179 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!377063 () Bool)

(declare-fun res!213340 () Bool)

(assert (=> b!377063 (=> (not res!213340) (not e!229567))))

(assert (=> b!377063 (= res!213340 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!213339 () Bool)

(assert (=> start!37254 (=> (not res!213339) (not e!229567))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37254 (= res!213339 (validMask!0 mask!970))))

(assert (=> start!37254 e!229567))

(declare-fun array_inv!7714 (array!21997) Bool)

(assert (=> start!37254 (and (array_inv!7714 _values!506) e!229564)))

(assert (=> start!37254 tp!29901))

(assert (=> start!37254 true))

(assert (=> start!37254 tp_is_empty!9043))

(declare-fun array_inv!7715 (array!21999) Bool)

(assert (=> start!37254 (array_inv!7715 _keys!658)))

(declare-fun b!377072 () Bool)

(declare-fun res!213333 () Bool)

(assert (=> b!377072 (=> (not res!213333) (not e!229567))))

(assert (=> b!377072 (= res!213333 (or (= (select (arr!10468 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10468 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!377073 () Bool)

(declare-fun res!213337 () Bool)

(assert (=> b!377073 (=> (not res!213337) (not e!229567))))

(assert (=> b!377073 (= res!213337 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5898))))

(declare-fun mapIsEmpty!15129 () Bool)

(assert (=> mapIsEmpty!15129 mapRes!15129))

(declare-fun b!377074 () Bool)

(assert (=> b!377074 (= e!229563 e!229566)))

(declare-fun res!213335 () Bool)

(assert (=> b!377074 (=> res!213335 e!229566)))

(assert (=> b!377074 (= res!213335 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!377074 (= lt!175171 lt!175175)))

(declare-fun lt!175176 () tuple2!6070)

(assert (=> b!377074 (= lt!175175 (+!870 lt!175167 lt!175176))))

(assert (=> b!377074 (= lt!175169 lt!175174)))

(assert (=> b!377074 (= lt!175174 (+!870 lt!175179 lt!175176))))

(assert (=> b!377074 (= lt!175171 (+!870 lt!175170 lt!175176))))

(assert (=> b!377074 (= lt!175176 (tuple2!6071 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!15129 () Bool)

(declare-fun tp!29900 () Bool)

(assert (=> mapNonEmpty!15129 (= mapRes!15129 (and tp!29900 e!229561))))

(declare-fun mapRest!15129 () (Array (_ BitVec 32) ValueCell!4178))

(declare-fun mapValue!15129 () ValueCell!4178)

(declare-fun mapKey!15129 () (_ BitVec 32))

(assert (=> mapNonEmpty!15129 (= (arr!10467 _values!506) (store mapRest!15129 mapKey!15129 mapValue!15129))))

(assert (= (and start!37254 res!213339) b!377069))

(assert (= (and b!377069 res!213332) b!377063))

(assert (= (and b!377063 res!213340) b!377073))

(assert (= (and b!377073 res!213337) b!377066))

(assert (= (and b!377066 res!213341) b!377067))

(assert (= (and b!377067 res!213338) b!377072))

(assert (= (and b!377072 res!213333) b!377065))

(assert (= (and b!377065 res!213331) b!377062))

(assert (= (and b!377062 res!213334) b!377068))

(assert (= (and b!377068 res!213330) b!377064))

(assert (= (and b!377064 (not res!213336)) b!377074))

(assert (= (and b!377074 (not res!213335)) b!377071))

(assert (= (and b!377061 condMapEmpty!15129) mapIsEmpty!15129))

(assert (= (and b!377061 (not condMapEmpty!15129)) mapNonEmpty!15129))

(get-info :version)

(assert (= (and mapNonEmpty!15129 ((_ is ValueCellFull!4178) mapValue!15129)) b!377060))

(assert (= (and b!377061 ((_ is ValueCellFull!4178) mapDefault!15129)) b!377070))

(assert (= start!37254 b!377061))

(declare-fun m!373367 () Bool)

(assert (=> b!377067 m!373367))

(declare-fun m!373369 () Bool)

(assert (=> b!377073 m!373369))

(declare-fun m!373371 () Bool)

(assert (=> b!377072 m!373371))

(declare-fun m!373373 () Bool)

(assert (=> b!377068 m!373373))

(declare-fun m!373375 () Bool)

(assert (=> b!377065 m!373375))

(declare-fun m!373377 () Bool)

(assert (=> b!377063 m!373377))

(declare-fun m!373379 () Bool)

(assert (=> b!377064 m!373379))

(declare-fun m!373381 () Bool)

(assert (=> b!377064 m!373381))

(declare-fun m!373383 () Bool)

(assert (=> b!377064 m!373383))

(declare-fun m!373385 () Bool)

(assert (=> b!377064 m!373385))

(declare-fun m!373387 () Bool)

(assert (=> b!377064 m!373387))

(declare-fun m!373389 () Bool)

(assert (=> b!377064 m!373389))

(declare-fun m!373391 () Bool)

(assert (=> b!377064 m!373391))

(declare-fun m!373393 () Bool)

(assert (=> start!37254 m!373393))

(declare-fun m!373395 () Bool)

(assert (=> start!37254 m!373395))

(declare-fun m!373397 () Bool)

(assert (=> start!37254 m!373397))

(declare-fun m!373399 () Bool)

(assert (=> b!377062 m!373399))

(declare-fun m!373401 () Bool)

(assert (=> b!377062 m!373401))

(declare-fun m!373403 () Bool)

(assert (=> mapNonEmpty!15129 m!373403))

(declare-fun m!373405 () Bool)

(assert (=> b!377071 m!373405))

(declare-fun m!373407 () Bool)

(assert (=> b!377071 m!373407))

(declare-fun m!373409 () Bool)

(assert (=> b!377074 m!373409))

(declare-fun m!373411 () Bool)

(assert (=> b!377074 m!373411))

(declare-fun m!373413 () Bool)

(assert (=> b!377074 m!373413))

(check-sat (not b_next!8395) (not b!377065) tp_is_empty!9043 (not start!37254) b_and!15611 (not b!377073) (not b!377068) (not b!377062) (not b!377071) (not b!377074) (not b!377064) (not mapNonEmpty!15129) (not b!377063) (not b!377067))
(check-sat b_and!15611 (not b_next!8395))
