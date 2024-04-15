; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37386 () Bool)

(assert start!37386)

(declare-fun b_free!8527 () Bool)

(declare-fun b_next!8527 () Bool)

(assert (=> start!37386 (= b_free!8527 (not b_next!8527))))

(declare-fun tp!30296 () Bool)

(declare-fun b_and!15743 () Bool)

(assert (=> start!37386 (= tp!30296 b_and!15743)))

(declare-fun b!380039 () Bool)

(declare-fun e!231148 () Bool)

(assert (=> b!380039 (= e!231148 true)))

(declare-datatypes ((V!13339 0))(
  ( (V!13340 (val!4632 Int)) )
))
(declare-datatypes ((tuple2!6182 0))(
  ( (tuple2!6183 (_1!3102 (_ BitVec 64)) (_2!3102 V!13339)) )
))
(declare-datatypes ((List!6010 0))(
  ( (Nil!6007) (Cons!6006 (h!6862 tuple2!6182) (t!11151 List!6010)) )
))
(declare-datatypes ((ListLongMap!5085 0))(
  ( (ListLongMap!5086 (toList!2558 List!6010)) )
))
(declare-fun lt!177709 () ListLongMap!5085)

(declare-fun lt!177717 () ListLongMap!5085)

(declare-fun lt!177705 () tuple2!6182)

(declare-fun +!926 (ListLongMap!5085 tuple2!6182) ListLongMap!5085)

(assert (=> b!380039 (= lt!177709 (+!926 lt!177717 lt!177705))))

(declare-fun lt!177714 () ListLongMap!5085)

(declare-fun v!373 () V!13339)

(declare-fun k0!778 () (_ BitVec 64))

(declare-datatypes ((Unit!11712 0))(
  ( (Unit!11713) )
))
(declare-fun lt!177716 () Unit!11712)

(declare-fun minValue!472 () V!13339)

(declare-fun addCommutativeForDiffKeys!318 (ListLongMap!5085 (_ BitVec 64) V!13339 (_ BitVec 64) V!13339) Unit!11712)

(assert (=> b!380039 (= lt!177716 (addCommutativeForDiffKeys!318 lt!177714 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380040 () Bool)

(declare-fun e!231147 () Bool)

(declare-fun tp_is_empty!9175 () Bool)

(assert (=> b!380040 (= e!231147 tp_is_empty!9175)))

(declare-fun b!380041 () Bool)

(declare-fun e!231145 () Bool)

(declare-fun e!231149 () Bool)

(assert (=> b!380041 (= e!231145 (not e!231149))))

(declare-fun res!215719 () Bool)

(assert (=> b!380041 (=> res!215719 e!231149)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380041 (= res!215719 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!4244 0))(
  ( (ValueCellFull!4244 (v!6823 V!13339)) (EmptyCell!4244) )
))
(declare-datatypes ((array!22251 0))(
  ( (array!22252 (arr!10594 (Array (_ BitVec 32) ValueCell!4244)) (size!10947 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22251)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13339)

(declare-datatypes ((array!22253 0))(
  ( (array!22254 (arr!10595 (Array (_ BitVec 32) (_ BitVec 64))) (size!10948 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22253)

(declare-fun lt!177711 () ListLongMap!5085)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun getCurrentListMap!1953 (array!22253 array!22251 (_ BitVec 32) (_ BitVec 32) V!13339 V!13339 (_ BitVec 32) Int) ListLongMap!5085)

(assert (=> b!380041 (= lt!177711 (getCurrentListMap!1953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177713 () ListLongMap!5085)

(declare-fun lt!177712 () array!22251)

(declare-fun lt!177707 () array!22253)

(assert (=> b!380041 (= lt!177713 (getCurrentListMap!1953 lt!177707 lt!177712 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177708 () ListLongMap!5085)

(declare-fun lt!177710 () ListLongMap!5085)

(assert (=> b!380041 (and (= lt!177708 lt!177710) (= lt!177710 lt!177708))))

(assert (=> b!380041 (= lt!177710 (+!926 lt!177714 lt!177705))))

(assert (=> b!380041 (= lt!177705 (tuple2!6183 k0!778 v!373))))

(declare-fun lt!177715 () Unit!11712)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!146 (array!22253 array!22251 (_ BitVec 32) (_ BitVec 32) V!13339 V!13339 (_ BitVec 32) (_ BitVec 64) V!13339 (_ BitVec 32) Int) Unit!11712)

(assert (=> b!380041 (= lt!177715 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!146 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!818 (array!22253 array!22251 (_ BitVec 32) (_ BitVec 32) V!13339 V!13339 (_ BitVec 32) Int) ListLongMap!5085)

(assert (=> b!380041 (= lt!177708 (getCurrentListMapNoExtraKeys!818 lt!177707 lt!177712 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380041 (= lt!177712 (array!22252 (store (arr!10594 _values!506) i!548 (ValueCellFull!4244 v!373)) (size!10947 _values!506)))))

(assert (=> b!380041 (= lt!177714 (getCurrentListMapNoExtraKeys!818 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380042 () Bool)

(declare-fun res!215726 () Bool)

(assert (=> b!380042 (=> (not res!215726) (not e!231145))))

(declare-datatypes ((List!6011 0))(
  ( (Nil!6008) (Cons!6007 (h!6863 (_ BitVec 64)) (t!11152 List!6011)) )
))
(declare-fun arrayNoDuplicates!0 (array!22253 (_ BitVec 32) List!6011) Bool)

(assert (=> b!380042 (= res!215726 (arrayNoDuplicates!0 lt!177707 #b00000000000000000000000000000000 Nil!6008))))

(declare-fun b!380043 () Bool)

(declare-fun e!231150 () Bool)

(declare-fun mapRes!15327 () Bool)

(assert (=> b!380043 (= e!231150 (and e!231147 mapRes!15327))))

(declare-fun condMapEmpty!15327 () Bool)

(declare-fun mapDefault!15327 () ValueCell!4244)

(assert (=> b!380043 (= condMapEmpty!15327 (= (arr!10594 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4244)) mapDefault!15327)))))

(declare-fun b!380044 () Bool)

(declare-fun res!215721 () Bool)

(declare-fun e!231151 () Bool)

(assert (=> b!380044 (=> (not res!215721) (not e!231151))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380044 (= res!215721 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!15327 () Bool)

(declare-fun tp!30297 () Bool)

(declare-fun e!231152 () Bool)

(assert (=> mapNonEmpty!15327 (= mapRes!15327 (and tp!30297 e!231152))))

(declare-fun mapRest!15327 () (Array (_ BitVec 32) ValueCell!4244))

(declare-fun mapKey!15327 () (_ BitVec 32))

(declare-fun mapValue!15327 () ValueCell!4244)

(assert (=> mapNonEmpty!15327 (= (arr!10594 _values!506) (store mapRest!15327 mapKey!15327 mapValue!15327))))

(declare-fun b!380045 () Bool)

(declare-fun res!215716 () Bool)

(assert (=> b!380045 (=> (not res!215716) (not e!231151))))

(assert (=> b!380045 (= res!215716 (or (= (select (arr!10595 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10595 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15327 () Bool)

(assert (=> mapIsEmpty!15327 mapRes!15327))

(declare-fun res!215717 () Bool)

(assert (=> start!37386 (=> (not res!215717) (not e!231151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37386 (= res!215717 (validMask!0 mask!970))))

(assert (=> start!37386 e!231151))

(declare-fun array_inv!7802 (array!22251) Bool)

(assert (=> start!37386 (and (array_inv!7802 _values!506) e!231150)))

(assert (=> start!37386 tp!30296))

(assert (=> start!37386 true))

(assert (=> start!37386 tp_is_empty!9175))

(declare-fun array_inv!7803 (array!22253) Bool)

(assert (=> start!37386 (array_inv!7803 _keys!658)))

(declare-fun b!380046 () Bool)

(assert (=> b!380046 (= e!231152 tp_is_empty!9175)))

(declare-fun b!380047 () Bool)

(declare-fun res!215718 () Bool)

(assert (=> b!380047 (=> (not res!215718) (not e!231151))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22253 (_ BitVec 32)) Bool)

(assert (=> b!380047 (= res!215718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380048 () Bool)

(assert (=> b!380048 (= e!231149 e!231148)))

(declare-fun res!215720 () Bool)

(assert (=> b!380048 (=> res!215720 e!231148)))

(assert (=> b!380048 (= res!215720 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!380048 (= lt!177711 lt!177717)))

(declare-fun lt!177706 () tuple2!6182)

(assert (=> b!380048 (= lt!177717 (+!926 lt!177714 lt!177706))))

(assert (=> b!380048 (= lt!177713 lt!177709)))

(assert (=> b!380048 (= lt!177709 (+!926 lt!177710 lt!177706))))

(assert (=> b!380048 (= lt!177713 (+!926 lt!177708 lt!177706))))

(assert (=> b!380048 (= lt!177706 (tuple2!6183 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380049 () Bool)

(declare-fun res!215725 () Bool)

(assert (=> b!380049 (=> (not res!215725) (not e!231151))))

(assert (=> b!380049 (= res!215725 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10948 _keys!658))))))

(declare-fun b!380050 () Bool)

(declare-fun res!215723 () Bool)

(assert (=> b!380050 (=> (not res!215723) (not e!231151))))

(assert (=> b!380050 (= res!215723 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6008))))

(declare-fun b!380051 () Bool)

(declare-fun res!215715 () Bool)

(assert (=> b!380051 (=> (not res!215715) (not e!231151))))

(assert (=> b!380051 (= res!215715 (and (= (size!10947 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10948 _keys!658) (size!10947 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380052 () Bool)

(assert (=> b!380052 (= e!231151 e!231145)))

(declare-fun res!215722 () Bool)

(assert (=> b!380052 (=> (not res!215722) (not e!231145))))

(assert (=> b!380052 (= res!215722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177707 mask!970))))

(assert (=> b!380052 (= lt!177707 (array!22254 (store (arr!10595 _keys!658) i!548 k0!778) (size!10948 _keys!658)))))

(declare-fun b!380053 () Bool)

(declare-fun res!215724 () Bool)

(assert (=> b!380053 (=> (not res!215724) (not e!231151))))

(declare-fun arrayContainsKey!0 (array!22253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380053 (= res!215724 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37386 res!215717) b!380051))

(assert (= (and b!380051 res!215715) b!380047))

(assert (= (and b!380047 res!215718) b!380050))

(assert (= (and b!380050 res!215723) b!380049))

(assert (= (and b!380049 res!215725) b!380044))

(assert (= (and b!380044 res!215721) b!380045))

(assert (= (and b!380045 res!215716) b!380053))

(assert (= (and b!380053 res!215724) b!380052))

(assert (= (and b!380052 res!215722) b!380042))

(assert (= (and b!380042 res!215726) b!380041))

(assert (= (and b!380041 (not res!215719)) b!380048))

(assert (= (and b!380048 (not res!215720)) b!380039))

(assert (= (and b!380043 condMapEmpty!15327) mapIsEmpty!15327))

(assert (= (and b!380043 (not condMapEmpty!15327)) mapNonEmpty!15327))

(get-info :version)

(assert (= (and mapNonEmpty!15327 ((_ is ValueCellFull!4244) mapValue!15327)) b!380046))

(assert (= (and b!380043 ((_ is ValueCellFull!4244) mapDefault!15327)) b!380040))

(assert (= start!37386 b!380043))

(declare-fun m!376523 () Bool)

(assert (=> mapNonEmpty!15327 m!376523))

(declare-fun m!376525 () Bool)

(assert (=> b!380047 m!376525))

(declare-fun m!376527 () Bool)

(assert (=> b!380050 m!376527))

(declare-fun m!376529 () Bool)

(assert (=> b!380045 m!376529))

(declare-fun m!376531 () Bool)

(assert (=> b!380048 m!376531))

(declare-fun m!376533 () Bool)

(assert (=> b!380048 m!376533))

(declare-fun m!376535 () Bool)

(assert (=> b!380048 m!376535))

(declare-fun m!376537 () Bool)

(assert (=> b!380052 m!376537))

(declare-fun m!376539 () Bool)

(assert (=> b!380052 m!376539))

(declare-fun m!376541 () Bool)

(assert (=> b!380039 m!376541))

(declare-fun m!376543 () Bool)

(assert (=> b!380039 m!376543))

(declare-fun m!376545 () Bool)

(assert (=> b!380042 m!376545))

(declare-fun m!376547 () Bool)

(assert (=> b!380041 m!376547))

(declare-fun m!376549 () Bool)

(assert (=> b!380041 m!376549))

(declare-fun m!376551 () Bool)

(assert (=> b!380041 m!376551))

(declare-fun m!376553 () Bool)

(assert (=> b!380041 m!376553))

(declare-fun m!376555 () Bool)

(assert (=> b!380041 m!376555))

(declare-fun m!376557 () Bool)

(assert (=> b!380041 m!376557))

(declare-fun m!376559 () Bool)

(assert (=> b!380041 m!376559))

(declare-fun m!376561 () Bool)

(assert (=> b!380053 m!376561))

(declare-fun m!376563 () Bool)

(assert (=> b!380044 m!376563))

(declare-fun m!376565 () Bool)

(assert (=> start!37386 m!376565))

(declare-fun m!376567 () Bool)

(assert (=> start!37386 m!376567))

(declare-fun m!376569 () Bool)

(assert (=> start!37386 m!376569))

(check-sat (not b!380044) (not b!380047) (not mapNonEmpty!15327) (not b_next!8527) (not start!37386) (not b!380050) (not b!380041) (not b!380048) (not b!380052) tp_is_empty!9175 (not b!380039) (not b!380053) (not b!380042) b_and!15743)
(check-sat b_and!15743 (not b_next!8527))
