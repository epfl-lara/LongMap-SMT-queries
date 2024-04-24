; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36924 () Bool)

(assert start!36924)

(declare-fun b_free!8065 () Bool)

(declare-fun b_next!8065 () Bool)

(assert (=> start!36924 (= b_free!8065 (not b_next!8065))))

(declare-fun tp!28910 () Bool)

(declare-fun b_and!15321 () Bool)

(assert (=> start!36924 (= tp!28910 b_and!15321)))

(declare-fun b!370258 () Bool)

(declare-fun e!226165 () Bool)

(assert (=> b!370258 (= e!226165 false)))

(declare-datatypes ((V!12723 0))(
  ( (V!12724 (val!4401 Int)) )
))
(declare-datatypes ((ValueCell!4013 0))(
  ( (ValueCellFull!4013 (v!6599 V!12723)) (EmptyCell!4013) )
))
(declare-datatypes ((array!21354 0))(
  ( (array!21355 (arr!10145 (Array (_ BitVec 32) ValueCell!4013)) (size!10497 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21354)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5744 0))(
  ( (tuple2!5745 (_1!2883 (_ BitVec 64)) (_2!2883 V!12723)) )
))
(declare-datatypes ((List!5573 0))(
  ( (Nil!5570) (Cons!5569 (h!6425 tuple2!5744) (t!10715 List!5573)) )
))
(declare-datatypes ((ListLongMap!4659 0))(
  ( (ListLongMap!4660 (toList!2345 List!5573)) )
))
(declare-fun lt!169956 () ListLongMap!4659)

(declare-fun zeroValue!472 () V!12723)

(declare-datatypes ((array!21356 0))(
  ( (array!21357 (arr!10146 (Array (_ BitVec 32) (_ BitVec 64))) (size!10498 (_ BitVec 32))) )
))
(declare-fun lt!169955 () array!21356)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12723)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12723)

(declare-fun getCurrentListMapNoExtraKeys!654 (array!21356 array!21354 (_ BitVec 32) (_ BitVec 32) V!12723 V!12723 (_ BitVec 32) Int) ListLongMap!4659)

(assert (=> b!370258 (= lt!169956 (getCurrentListMapNoExtraKeys!654 lt!169955 (array!21355 (store (arr!10145 _values!506) i!548 (ValueCellFull!4013 v!373)) (size!10497 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169957 () ListLongMap!4659)

(declare-fun _keys!658 () array!21356)

(assert (=> b!370258 (= lt!169957 (getCurrentListMapNoExtraKeys!654 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370259 () Bool)

(declare-fun res!207921 () Bool)

(declare-fun e!226164 () Bool)

(assert (=> b!370259 (=> (not res!207921) (not e!226164))))

(assert (=> b!370259 (= res!207921 (and (= (size!10497 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10498 _keys!658) (size!10497 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370260 () Bool)

(declare-fun res!207924 () Bool)

(assert (=> b!370260 (=> (not res!207924) (not e!226164))))

(declare-datatypes ((List!5574 0))(
  ( (Nil!5571) (Cons!5570 (h!6426 (_ BitVec 64)) (t!10716 List!5574)) )
))
(declare-fun arrayNoDuplicates!0 (array!21356 (_ BitVec 32) List!5574) Bool)

(assert (=> b!370260 (= res!207924 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5571))))

(declare-fun res!207919 () Bool)

(assert (=> start!36924 (=> (not res!207919) (not e!226164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36924 (= res!207919 (validMask!0 mask!970))))

(assert (=> start!36924 e!226164))

(declare-fun e!226167 () Bool)

(declare-fun array_inv!7528 (array!21354) Bool)

(assert (=> start!36924 (and (array_inv!7528 _values!506) e!226167)))

(assert (=> start!36924 tp!28910))

(assert (=> start!36924 true))

(declare-fun tp_is_empty!8713 () Bool)

(assert (=> start!36924 tp_is_empty!8713))

(declare-fun array_inv!7529 (array!21356) Bool)

(assert (=> start!36924 (array_inv!7529 _keys!658)))

(declare-fun mapIsEmpty!14634 () Bool)

(declare-fun mapRes!14634 () Bool)

(assert (=> mapIsEmpty!14634 mapRes!14634))

(declare-fun b!370261 () Bool)

(declare-fun res!207923 () Bool)

(assert (=> b!370261 (=> (not res!207923) (not e!226164))))

(assert (=> b!370261 (= res!207923 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10498 _keys!658))))))

(declare-fun b!370262 () Bool)

(declare-fun res!207925 () Bool)

(assert (=> b!370262 (=> (not res!207925) (not e!226164))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21356 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370262 (= res!207925 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14634 () Bool)

(declare-fun tp!28911 () Bool)

(declare-fun e!226163 () Bool)

(assert (=> mapNonEmpty!14634 (= mapRes!14634 (and tp!28911 e!226163))))

(declare-fun mapKey!14634 () (_ BitVec 32))

(declare-fun mapValue!14634 () ValueCell!4013)

(declare-fun mapRest!14634 () (Array (_ BitVec 32) ValueCell!4013))

(assert (=> mapNonEmpty!14634 (= (arr!10145 _values!506) (store mapRest!14634 mapKey!14634 mapValue!14634))))

(declare-fun b!370263 () Bool)

(declare-fun res!207926 () Bool)

(assert (=> b!370263 (=> (not res!207926) (not e!226164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21356 (_ BitVec 32)) Bool)

(assert (=> b!370263 (= res!207926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370264 () Bool)

(assert (=> b!370264 (= e!226164 e!226165)))

(declare-fun res!207917 () Bool)

(assert (=> b!370264 (=> (not res!207917) (not e!226165))))

(assert (=> b!370264 (= res!207917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169955 mask!970))))

(assert (=> b!370264 (= lt!169955 (array!21357 (store (arr!10146 _keys!658) i!548 k0!778) (size!10498 _keys!658)))))

(declare-fun b!370265 () Bool)

(declare-fun res!207918 () Bool)

(assert (=> b!370265 (=> (not res!207918) (not e!226164))))

(assert (=> b!370265 (= res!207918 (or (= (select (arr!10146 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10146 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370266 () Bool)

(declare-fun res!207922 () Bool)

(assert (=> b!370266 (=> (not res!207922) (not e!226164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370266 (= res!207922 (validKeyInArray!0 k0!778))))

(declare-fun b!370267 () Bool)

(declare-fun e!226162 () Bool)

(assert (=> b!370267 (= e!226162 tp_is_empty!8713)))

(declare-fun b!370268 () Bool)

(assert (=> b!370268 (= e!226163 tp_is_empty!8713)))

(declare-fun b!370269 () Bool)

(assert (=> b!370269 (= e!226167 (and e!226162 mapRes!14634))))

(declare-fun condMapEmpty!14634 () Bool)

(declare-fun mapDefault!14634 () ValueCell!4013)

(assert (=> b!370269 (= condMapEmpty!14634 (= (arr!10145 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4013)) mapDefault!14634)))))

(declare-fun b!370270 () Bool)

(declare-fun res!207920 () Bool)

(assert (=> b!370270 (=> (not res!207920) (not e!226165))))

(assert (=> b!370270 (= res!207920 (arrayNoDuplicates!0 lt!169955 #b00000000000000000000000000000000 Nil!5571))))

(assert (= (and start!36924 res!207919) b!370259))

(assert (= (and b!370259 res!207921) b!370263))

(assert (= (and b!370263 res!207926) b!370260))

(assert (= (and b!370260 res!207924) b!370261))

(assert (= (and b!370261 res!207923) b!370266))

(assert (= (and b!370266 res!207922) b!370265))

(assert (= (and b!370265 res!207918) b!370262))

(assert (= (and b!370262 res!207925) b!370264))

(assert (= (and b!370264 res!207917) b!370270))

(assert (= (and b!370270 res!207920) b!370258))

(assert (= (and b!370269 condMapEmpty!14634) mapIsEmpty!14634))

(assert (= (and b!370269 (not condMapEmpty!14634)) mapNonEmpty!14634))

(get-info :version)

(assert (= (and mapNonEmpty!14634 ((_ is ValueCellFull!4013) mapValue!14634)) b!370268))

(assert (= (and b!370269 ((_ is ValueCellFull!4013) mapDefault!14634)) b!370267))

(assert (= start!36924 b!370269))

(declare-fun m!366713 () Bool)

(assert (=> start!36924 m!366713))

(declare-fun m!366715 () Bool)

(assert (=> start!36924 m!366715))

(declare-fun m!366717 () Bool)

(assert (=> start!36924 m!366717))

(declare-fun m!366719 () Bool)

(assert (=> b!370270 m!366719))

(declare-fun m!366721 () Bool)

(assert (=> b!370265 m!366721))

(declare-fun m!366723 () Bool)

(assert (=> b!370260 m!366723))

(declare-fun m!366725 () Bool)

(assert (=> b!370262 m!366725))

(declare-fun m!366727 () Bool)

(assert (=> b!370258 m!366727))

(declare-fun m!366729 () Bool)

(assert (=> b!370258 m!366729))

(declare-fun m!366731 () Bool)

(assert (=> b!370258 m!366731))

(declare-fun m!366733 () Bool)

(assert (=> mapNonEmpty!14634 m!366733))

(declare-fun m!366735 () Bool)

(assert (=> b!370263 m!366735))

(declare-fun m!366737 () Bool)

(assert (=> b!370266 m!366737))

(declare-fun m!366739 () Bool)

(assert (=> b!370264 m!366739))

(declare-fun m!366741 () Bool)

(assert (=> b!370264 m!366741))

(check-sat (not b!370258) (not b!370262) tp_is_empty!8713 (not b!370270) (not start!36924) (not b!370264) (not b_next!8065) (not b!370260) (not mapNonEmpty!14634) b_and!15321 (not b!370263) (not b!370266))
(check-sat b_and!15321 (not b_next!8065))
