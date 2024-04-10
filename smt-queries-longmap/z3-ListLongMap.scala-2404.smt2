; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38044 () Bool)

(assert start!38044)

(declare-fun b_free!8991 () Bool)

(declare-fun b_next!8991 () Bool)

(assert (=> start!38044 (= b_free!8991 (not b_next!8991))))

(declare-fun tp!31745 () Bool)

(declare-fun b_and!16317 () Bool)

(assert (=> start!38044 (= tp!31745 b_and!16317)))

(declare-fun b!391707 () Bool)

(declare-fun e!237237 () Bool)

(declare-fun e!237235 () Bool)

(assert (=> b!391707 (= e!237237 (not e!237235))))

(declare-fun res!224267 () Bool)

(assert (=> b!391707 (=> res!224267 e!237235)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391707 (= res!224267 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13989 0))(
  ( (V!13990 (val!4876 Int)) )
))
(declare-datatypes ((ValueCell!4488 0))(
  ( (ValueCellFull!4488 (v!7101 V!13989)) (EmptyCell!4488) )
))
(declare-datatypes ((array!23229 0))(
  ( (array!23230 (arr!11076 (Array (_ BitVec 32) ValueCell!4488)) (size!11428 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23229)

(declare-datatypes ((tuple2!6570 0))(
  ( (tuple2!6571 (_1!3296 (_ BitVec 64)) (_2!3296 V!13989)) )
))
(declare-datatypes ((List!6424 0))(
  ( (Nil!6421) (Cons!6420 (h!7276 tuple2!6570) (t!11588 List!6424)) )
))
(declare-datatypes ((ListLongMap!5483 0))(
  ( (ListLongMap!5484 (toList!2757 List!6424)) )
))
(declare-fun lt!184953 () ListLongMap!5483)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13989)

(declare-datatypes ((array!23231 0))(
  ( (array!23232 (arr!11077 (Array (_ BitVec 32) (_ BitVec 64))) (size!11429 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23231)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13989)

(declare-fun getCurrentListMap!2099 (array!23231 array!23229 (_ BitVec 32) (_ BitVec 32) V!13989 V!13989 (_ BitVec 32) Int) ListLongMap!5483)

(assert (=> b!391707 (= lt!184953 (getCurrentListMap!2099 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184945 () ListLongMap!5483)

(declare-fun lt!184948 () array!23229)

(declare-fun lt!184949 () array!23231)

(assert (=> b!391707 (= lt!184945 (getCurrentListMap!2099 lt!184949 lt!184948 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184951 () ListLongMap!5483)

(declare-fun lt!184944 () ListLongMap!5483)

(assert (=> b!391707 (and (= lt!184951 lt!184944) (= lt!184944 lt!184951))))

(declare-fun lt!184941 () ListLongMap!5483)

(declare-fun lt!184950 () tuple2!6570)

(declare-fun +!1052 (ListLongMap!5483 tuple2!6570) ListLongMap!5483)

(assert (=> b!391707 (= lt!184944 (+!1052 lt!184941 lt!184950))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13989)

(assert (=> b!391707 (= lt!184950 (tuple2!6571 k0!778 v!373))))

(declare-datatypes ((Unit!11986 0))(
  ( (Unit!11987) )
))
(declare-fun lt!184952 () Unit!11986)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!263 (array!23231 array!23229 (_ BitVec 32) (_ BitVec 32) V!13989 V!13989 (_ BitVec 32) (_ BitVec 64) V!13989 (_ BitVec 32) Int) Unit!11986)

(assert (=> b!391707 (= lt!184952 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!263 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!979 (array!23231 array!23229 (_ BitVec 32) (_ BitVec 32) V!13989 V!13989 (_ BitVec 32) Int) ListLongMap!5483)

(assert (=> b!391707 (= lt!184951 (getCurrentListMapNoExtraKeys!979 lt!184949 lt!184948 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391707 (= lt!184948 (array!23230 (store (arr!11076 _values!506) i!548 (ValueCellFull!4488 v!373)) (size!11428 _values!506)))))

(assert (=> b!391707 (= lt!184941 (getCurrentListMapNoExtraKeys!979 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391708 () Bool)

(declare-fun res!224270 () Bool)

(declare-fun e!237233 () Bool)

(assert (=> b!391708 (=> (not res!224270) (not e!237233))))

(declare-datatypes ((List!6425 0))(
  ( (Nil!6422) (Cons!6421 (h!7277 (_ BitVec 64)) (t!11589 List!6425)) )
))
(declare-fun arrayNoDuplicates!0 (array!23231 (_ BitVec 32) List!6425) Bool)

(assert (=> b!391708 (= res!224270 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6422))))

(declare-fun b!391709 () Bool)

(assert (=> b!391709 (= e!237233 e!237237)))

(declare-fun res!224266 () Bool)

(assert (=> b!391709 (=> (not res!224266) (not e!237237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23231 (_ BitVec 32)) Bool)

(assert (=> b!391709 (= res!224266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184949 mask!970))))

(assert (=> b!391709 (= lt!184949 (array!23232 (store (arr!11077 _keys!658) i!548 k0!778) (size!11429 _keys!658)))))

(declare-fun b!391710 () Bool)

(declare-fun e!237236 () Bool)

(assert (=> b!391710 (= e!237236 (= (+!1052 lt!184953 lt!184950) lt!184945))))

(declare-fun lt!184942 () ListLongMap!5483)

(declare-fun lt!184947 () ListLongMap!5483)

(assert (=> b!391710 (= lt!184942 (+!1052 lt!184947 lt!184950))))

(declare-fun lt!184943 () Unit!11986)

(declare-fun addCommutativeForDiffKeys!343 (ListLongMap!5483 (_ BitVec 64) V!13989 (_ BitVec 64) V!13989) Unit!11986)

(assert (=> b!391710 (= lt!184943 (addCommutativeForDiffKeys!343 lt!184941 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!391711 () Bool)

(declare-fun e!237234 () Bool)

(declare-fun tp_is_empty!9663 () Bool)

(assert (=> b!391711 (= e!237234 tp_is_empty!9663)))

(declare-fun b!391712 () Bool)

(assert (=> b!391712 (= e!237235 e!237236)))

(declare-fun res!224261 () Bool)

(assert (=> b!391712 (=> res!224261 e!237236)))

(assert (=> b!391712 (= res!224261 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!391712 (= lt!184945 lt!184942)))

(declare-fun lt!184946 () tuple2!6570)

(assert (=> b!391712 (= lt!184942 (+!1052 lt!184944 lt!184946))))

(assert (=> b!391712 (= lt!184953 lt!184947)))

(assert (=> b!391712 (= lt!184947 (+!1052 lt!184941 lt!184946))))

(assert (=> b!391712 (= lt!184945 (+!1052 lt!184951 lt!184946))))

(assert (=> b!391712 (= lt!184946 (tuple2!6571 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun res!224263 () Bool)

(assert (=> start!38044 (=> (not res!224263) (not e!237233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38044 (= res!224263 (validMask!0 mask!970))))

(assert (=> start!38044 e!237233))

(declare-fun e!237232 () Bool)

(declare-fun array_inv!8136 (array!23229) Bool)

(assert (=> start!38044 (and (array_inv!8136 _values!506) e!237232)))

(assert (=> start!38044 tp!31745))

(assert (=> start!38044 true))

(assert (=> start!38044 tp_is_empty!9663))

(declare-fun array_inv!8137 (array!23231) Bool)

(assert (=> start!38044 (array_inv!8137 _keys!658)))

(declare-fun b!391713 () Bool)

(declare-fun res!224271 () Bool)

(assert (=> b!391713 (=> (not res!224271) (not e!237233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391713 (= res!224271 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!16080 () Bool)

(declare-fun mapRes!16080 () Bool)

(assert (=> mapIsEmpty!16080 mapRes!16080))

(declare-fun b!391714 () Bool)

(declare-fun res!224269 () Bool)

(assert (=> b!391714 (=> (not res!224269) (not e!237233))))

(assert (=> b!391714 (= res!224269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!391715 () Bool)

(assert (=> b!391715 (= e!237232 (and e!237234 mapRes!16080))))

(declare-fun condMapEmpty!16080 () Bool)

(declare-fun mapDefault!16080 () ValueCell!4488)

(assert (=> b!391715 (= condMapEmpty!16080 (= (arr!11076 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4488)) mapDefault!16080)))))

(declare-fun b!391716 () Bool)

(declare-fun res!224268 () Bool)

(assert (=> b!391716 (=> (not res!224268) (not e!237233))))

(assert (=> b!391716 (= res!224268 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11429 _keys!658))))))

(declare-fun b!391717 () Bool)

(declare-fun res!224264 () Bool)

(assert (=> b!391717 (=> (not res!224264) (not e!237233))))

(assert (=> b!391717 (= res!224264 (or (= (select (arr!11077 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11077 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391718 () Bool)

(declare-fun res!224272 () Bool)

(assert (=> b!391718 (=> (not res!224272) (not e!237233))))

(declare-fun arrayContainsKey!0 (array!23231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391718 (= res!224272 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16080 () Bool)

(declare-fun tp!31746 () Bool)

(declare-fun e!237231 () Bool)

(assert (=> mapNonEmpty!16080 (= mapRes!16080 (and tp!31746 e!237231))))

(declare-fun mapKey!16080 () (_ BitVec 32))

(declare-fun mapValue!16080 () ValueCell!4488)

(declare-fun mapRest!16080 () (Array (_ BitVec 32) ValueCell!4488))

(assert (=> mapNonEmpty!16080 (= (arr!11076 _values!506) (store mapRest!16080 mapKey!16080 mapValue!16080))))

(declare-fun b!391719 () Bool)

(assert (=> b!391719 (= e!237231 tp_is_empty!9663)))

(declare-fun b!391720 () Bool)

(declare-fun res!224265 () Bool)

(assert (=> b!391720 (=> (not res!224265) (not e!237233))))

(assert (=> b!391720 (= res!224265 (and (= (size!11428 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11429 _keys!658) (size!11428 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!391721 () Bool)

(declare-fun res!224262 () Bool)

(assert (=> b!391721 (=> (not res!224262) (not e!237237))))

(assert (=> b!391721 (= res!224262 (arrayNoDuplicates!0 lt!184949 #b00000000000000000000000000000000 Nil!6422))))

(assert (= (and start!38044 res!224263) b!391720))

(assert (= (and b!391720 res!224265) b!391714))

(assert (= (and b!391714 res!224269) b!391708))

(assert (= (and b!391708 res!224270) b!391716))

(assert (= (and b!391716 res!224268) b!391713))

(assert (= (and b!391713 res!224271) b!391717))

(assert (= (and b!391717 res!224264) b!391718))

(assert (= (and b!391718 res!224272) b!391709))

(assert (= (and b!391709 res!224266) b!391721))

(assert (= (and b!391721 res!224262) b!391707))

(assert (= (and b!391707 (not res!224267)) b!391712))

(assert (= (and b!391712 (not res!224261)) b!391710))

(assert (= (and b!391715 condMapEmpty!16080) mapIsEmpty!16080))

(assert (= (and b!391715 (not condMapEmpty!16080)) mapNonEmpty!16080))

(get-info :version)

(assert (= (and mapNonEmpty!16080 ((_ is ValueCellFull!4488) mapValue!16080)) b!391719))

(assert (= (and b!391715 ((_ is ValueCellFull!4488) mapDefault!16080)) b!391711))

(assert (= start!38044 b!391715))

(declare-fun m!388093 () Bool)

(assert (=> b!391712 m!388093))

(declare-fun m!388095 () Bool)

(assert (=> b!391712 m!388095))

(declare-fun m!388097 () Bool)

(assert (=> b!391712 m!388097))

(declare-fun m!388099 () Bool)

(assert (=> b!391713 m!388099))

(declare-fun m!388101 () Bool)

(assert (=> start!38044 m!388101))

(declare-fun m!388103 () Bool)

(assert (=> start!38044 m!388103))

(declare-fun m!388105 () Bool)

(assert (=> start!38044 m!388105))

(declare-fun m!388107 () Bool)

(assert (=> b!391717 m!388107))

(declare-fun m!388109 () Bool)

(assert (=> b!391708 m!388109))

(declare-fun m!388111 () Bool)

(assert (=> b!391707 m!388111))

(declare-fun m!388113 () Bool)

(assert (=> b!391707 m!388113))

(declare-fun m!388115 () Bool)

(assert (=> b!391707 m!388115))

(declare-fun m!388117 () Bool)

(assert (=> b!391707 m!388117))

(declare-fun m!388119 () Bool)

(assert (=> b!391707 m!388119))

(declare-fun m!388121 () Bool)

(assert (=> b!391707 m!388121))

(declare-fun m!388123 () Bool)

(assert (=> b!391707 m!388123))

(declare-fun m!388125 () Bool)

(assert (=> mapNonEmpty!16080 m!388125))

(declare-fun m!388127 () Bool)

(assert (=> b!391709 m!388127))

(declare-fun m!388129 () Bool)

(assert (=> b!391709 m!388129))

(declare-fun m!388131 () Bool)

(assert (=> b!391714 m!388131))

(declare-fun m!388133 () Bool)

(assert (=> b!391710 m!388133))

(declare-fun m!388135 () Bool)

(assert (=> b!391710 m!388135))

(declare-fun m!388137 () Bool)

(assert (=> b!391710 m!388137))

(declare-fun m!388139 () Bool)

(assert (=> b!391718 m!388139))

(declare-fun m!388141 () Bool)

(assert (=> b!391721 m!388141))

(check-sat (not b_next!8991) (not b!391707) (not b!391713) b_and!16317 (not b!391714) tp_is_empty!9663 (not start!38044) (not b!391708) (not b!391718) (not b!391709) (not b!391712) (not mapNonEmpty!16080) (not b!391710) (not b!391721))
(check-sat b_and!16317 (not b_next!8991))
