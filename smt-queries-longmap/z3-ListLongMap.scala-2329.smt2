; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37438 () Bool)

(assert start!37438)

(declare-fun b_free!8565 () Bool)

(declare-fun b_next!8565 () Bool)

(assert (=> start!37438 (= b_free!8565 (not b_next!8565))))

(declare-fun tp!30410 () Bool)

(declare-fun b_and!15807 () Bool)

(assert (=> start!37438 (= tp!30410 b_and!15807)))

(declare-fun b!381142 () Bool)

(declare-fun e!231754 () Bool)

(declare-fun tp_is_empty!9213 () Bool)

(assert (=> b!381142 (= e!231754 tp_is_empty!9213)))

(declare-fun b!381143 () Bool)

(declare-fun res!216510 () Bool)

(declare-fun e!231756 () Bool)

(assert (=> b!381143 (=> (not res!216510) (not e!231756))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381143 (= res!216510 (validKeyInArray!0 k0!778))))

(declare-fun b!381144 () Bool)

(declare-fun res!216513 () Bool)

(assert (=> b!381144 (=> (not res!216513) (not e!231756))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13389 0))(
  ( (V!13390 (val!4651 Int)) )
))
(declare-datatypes ((ValueCell!4263 0))(
  ( (ValueCellFull!4263 (v!6848 V!13389)) (EmptyCell!4263) )
))
(declare-datatypes ((array!22343 0))(
  ( (array!22344 (arr!10640 (Array (_ BitVec 32) ValueCell!4263)) (size!10992 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22343)

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((array!22345 0))(
  ( (array!22346 (arr!10641 (Array (_ BitVec 32) (_ BitVec 64))) (size!10993 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22345)

(assert (=> b!381144 (= res!216513 (and (= (size!10992 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10993 _keys!658) (size!10992 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381145 () Bool)

(declare-fun res!216507 () Bool)

(assert (=> b!381145 (=> (not res!216507) (not e!231756))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!381145 (= res!216507 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10993 _keys!658))))))

(declare-fun mapNonEmpty!15384 () Bool)

(declare-fun mapRes!15384 () Bool)

(declare-fun tp!30411 () Bool)

(assert (=> mapNonEmpty!15384 (= mapRes!15384 (and tp!30411 e!231754))))

(declare-fun mapKey!15384 () (_ BitVec 32))

(declare-fun mapValue!15384 () ValueCell!4263)

(declare-fun mapRest!15384 () (Array (_ BitVec 32) ValueCell!4263))

(assert (=> mapNonEmpty!15384 (= (arr!10640 _values!506) (store mapRest!15384 mapKey!15384 mapValue!15384))))

(declare-fun b!381146 () Bool)

(declare-fun e!231753 () Bool)

(assert (=> b!381146 (= e!231753 tp_is_empty!9213)))

(declare-fun b!381147 () Bool)

(declare-fun res!216509 () Bool)

(assert (=> b!381147 (=> (not res!216509) (not e!231756))))

(assert (=> b!381147 (= res!216509 (or (= (select (arr!10641 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10641 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381148 () Bool)

(declare-fun res!216512 () Bool)

(declare-fun e!231752 () Bool)

(assert (=> b!381148 (=> (not res!216512) (not e!231752))))

(declare-fun lt!178595 () array!22345)

(declare-datatypes ((List!6077 0))(
  ( (Nil!6074) (Cons!6073 (h!6929 (_ BitVec 64)) (t!11227 List!6077)) )
))
(declare-fun arrayNoDuplicates!0 (array!22345 (_ BitVec 32) List!6077) Bool)

(assert (=> b!381148 (= res!216512 (arrayNoDuplicates!0 lt!178595 #b00000000000000000000000000000000 Nil!6074))))

(declare-fun mapIsEmpty!15384 () Bool)

(assert (=> mapIsEmpty!15384 mapRes!15384))

(declare-fun b!381149 () Bool)

(declare-fun res!216506 () Bool)

(assert (=> b!381149 (=> (not res!216506) (not e!231756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22345 (_ BitVec 32)) Bool)

(assert (=> b!381149 (= res!216506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381150 () Bool)

(declare-fun res!216514 () Bool)

(assert (=> b!381150 (=> (not res!216514) (not e!231756))))

(declare-fun arrayContainsKey!0 (array!22345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381150 (= res!216514 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381151 () Bool)

(declare-fun e!231755 () Bool)

(assert (=> b!381151 (= e!231755 (and e!231753 mapRes!15384))))

(declare-fun condMapEmpty!15384 () Bool)

(declare-fun mapDefault!15384 () ValueCell!4263)

(assert (=> b!381151 (= condMapEmpty!15384 (= (arr!10640 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4263)) mapDefault!15384)))))

(declare-fun res!216515 () Bool)

(assert (=> start!37438 (=> (not res!216515) (not e!231756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37438 (= res!216515 (validMask!0 mask!970))))

(assert (=> start!37438 e!231756))

(declare-fun array_inv!7836 (array!22343) Bool)

(assert (=> start!37438 (and (array_inv!7836 _values!506) e!231755)))

(assert (=> start!37438 tp!30410))

(assert (=> start!37438 true))

(assert (=> start!37438 tp_is_empty!9213))

(declare-fun array_inv!7837 (array!22345) Bool)

(assert (=> start!37438 (array_inv!7837 _keys!658)))

(declare-fun b!381152 () Bool)

(declare-fun e!231758 () Bool)

(assert (=> b!381152 (= e!231752 (not e!231758))))

(declare-fun res!216505 () Bool)

(assert (=> b!381152 (=> res!216505 e!231758)))

(declare-fun lt!178592 () Bool)

(assert (=> b!381152 (= res!216505 (or (and (not lt!178592) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178592) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178592)))))

(assert (=> b!381152 (= lt!178592 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13389)

(declare-datatypes ((tuple2!6244 0))(
  ( (tuple2!6245 (_1!3133 (_ BitVec 64)) (_2!3133 V!13389)) )
))
(declare-datatypes ((List!6078 0))(
  ( (Nil!6075) (Cons!6074 (h!6930 tuple2!6244) (t!11228 List!6078)) )
))
(declare-datatypes ((ListLongMap!5157 0))(
  ( (ListLongMap!5158 (toList!2594 List!6078)) )
))
(declare-fun lt!178588 () ListLongMap!5157)

(declare-fun minValue!472 () V!13389)

(declare-fun getCurrentListMap!2009 (array!22345 array!22343 (_ BitVec 32) (_ BitVec 32) V!13389 V!13389 (_ BitVec 32) Int) ListLongMap!5157)

(assert (=> b!381152 (= lt!178588 (getCurrentListMap!2009 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178596 () ListLongMap!5157)

(declare-fun lt!178594 () array!22343)

(assert (=> b!381152 (= lt!178596 (getCurrentListMap!2009 lt!178595 lt!178594 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178590 () ListLongMap!5157)

(declare-fun lt!178593 () ListLongMap!5157)

(assert (=> b!381152 (and (= lt!178590 lt!178593) (= lt!178593 lt!178590))))

(declare-fun lt!178591 () ListLongMap!5157)

(declare-fun v!373 () V!13389)

(declare-fun +!939 (ListLongMap!5157 tuple2!6244) ListLongMap!5157)

(assert (=> b!381152 (= lt!178593 (+!939 lt!178591 (tuple2!6245 k0!778 v!373)))))

(declare-datatypes ((Unit!11772 0))(
  ( (Unit!11773) )
))
(declare-fun lt!178589 () Unit!11772)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!167 (array!22345 array!22343 (_ BitVec 32) (_ BitVec 32) V!13389 V!13389 (_ BitVec 32) (_ BitVec 64) V!13389 (_ BitVec 32) Int) Unit!11772)

(assert (=> b!381152 (= lt!178589 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!167 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!843 (array!22345 array!22343 (_ BitVec 32) (_ BitVec 32) V!13389 V!13389 (_ BitVec 32) Int) ListLongMap!5157)

(assert (=> b!381152 (= lt!178590 (getCurrentListMapNoExtraKeys!843 lt!178595 lt!178594 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381152 (= lt!178594 (array!22344 (store (arr!10640 _values!506) i!548 (ValueCellFull!4263 v!373)) (size!10992 _values!506)))))

(assert (=> b!381152 (= lt!178591 (getCurrentListMapNoExtraKeys!843 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381153 () Bool)

(declare-fun res!216508 () Bool)

(assert (=> b!381153 (=> (not res!216508) (not e!231756))))

(assert (=> b!381153 (= res!216508 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6074))))

(declare-fun b!381154 () Bool)

(assert (=> b!381154 (= e!231756 e!231752)))

(declare-fun res!216511 () Bool)

(assert (=> b!381154 (=> (not res!216511) (not e!231752))))

(assert (=> b!381154 (= res!216511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178595 mask!970))))

(assert (=> b!381154 (= lt!178595 (array!22346 (store (arr!10641 _keys!658) i!548 k0!778) (size!10993 _keys!658)))))

(declare-fun b!381155 () Bool)

(assert (=> b!381155 (= e!231758 true)))

(assert (=> b!381155 (= lt!178596 lt!178590)))

(assert (= (and start!37438 res!216515) b!381144))

(assert (= (and b!381144 res!216513) b!381149))

(assert (= (and b!381149 res!216506) b!381153))

(assert (= (and b!381153 res!216508) b!381145))

(assert (= (and b!381145 res!216507) b!381143))

(assert (= (and b!381143 res!216510) b!381147))

(assert (= (and b!381147 res!216509) b!381150))

(assert (= (and b!381150 res!216514) b!381154))

(assert (= (and b!381154 res!216511) b!381148))

(assert (= (and b!381148 res!216512) b!381152))

(assert (= (and b!381152 (not res!216505)) b!381155))

(assert (= (and b!381151 condMapEmpty!15384) mapIsEmpty!15384))

(assert (= (and b!381151 (not condMapEmpty!15384)) mapNonEmpty!15384))

(get-info :version)

(assert (= (and mapNonEmpty!15384 ((_ is ValueCellFull!4263) mapValue!15384)) b!381142))

(assert (= (and b!381151 ((_ is ValueCellFull!4263) mapDefault!15384)) b!381146))

(assert (= start!37438 b!381151))

(declare-fun m!378089 () Bool)

(assert (=> b!381143 m!378089))

(declare-fun m!378091 () Bool)

(assert (=> b!381154 m!378091))

(declare-fun m!378093 () Bool)

(assert (=> b!381154 m!378093))

(declare-fun m!378095 () Bool)

(assert (=> b!381149 m!378095))

(declare-fun m!378097 () Bool)

(assert (=> start!37438 m!378097))

(declare-fun m!378099 () Bool)

(assert (=> start!37438 m!378099))

(declare-fun m!378101 () Bool)

(assert (=> start!37438 m!378101))

(declare-fun m!378103 () Bool)

(assert (=> b!381152 m!378103))

(declare-fun m!378105 () Bool)

(assert (=> b!381152 m!378105))

(declare-fun m!378107 () Bool)

(assert (=> b!381152 m!378107))

(declare-fun m!378109 () Bool)

(assert (=> b!381152 m!378109))

(declare-fun m!378111 () Bool)

(assert (=> b!381152 m!378111))

(declare-fun m!378113 () Bool)

(assert (=> b!381152 m!378113))

(declare-fun m!378115 () Bool)

(assert (=> b!381152 m!378115))

(declare-fun m!378117 () Bool)

(assert (=> b!381147 m!378117))

(declare-fun m!378119 () Bool)

(assert (=> b!381148 m!378119))

(declare-fun m!378121 () Bool)

(assert (=> b!381153 m!378121))

(declare-fun m!378123 () Bool)

(assert (=> b!381150 m!378123))

(declare-fun m!378125 () Bool)

(assert (=> mapNonEmpty!15384 m!378125))

(check-sat (not b!381143) (not b!381150) b_and!15807 (not b!381148) (not b!381149) tp_is_empty!9213 (not b_next!8565) (not mapNonEmpty!15384) (not b!381154) (not start!37438) (not b!381152) (not b!381153))
(check-sat b_and!15807 (not b_next!8565))
