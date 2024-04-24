; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36816 () Bool)

(assert start!36816)

(declare-fun b_free!7957 () Bool)

(declare-fun b_next!7957 () Bool)

(assert (=> start!36816 (= b_free!7957 (not b_next!7957))))

(declare-fun tp!28586 () Bool)

(declare-fun b_and!15213 () Bool)

(assert (=> start!36816 (= tp!28586 b_and!15213)))

(declare-fun res!206299 () Bool)

(declare-fun e!225192 () Bool)

(assert (=> start!36816 (=> (not res!206299) (not e!225192))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36816 (= res!206299 (validMask!0 mask!970))))

(assert (=> start!36816 e!225192))

(assert (=> start!36816 true))

(declare-datatypes ((V!12579 0))(
  ( (V!12580 (val!4347 Int)) )
))
(declare-datatypes ((ValueCell!3959 0))(
  ( (ValueCellFull!3959 (v!6545 V!12579)) (EmptyCell!3959) )
))
(declare-datatypes ((array!21146 0))(
  ( (array!21147 (arr!10041 (Array (_ BitVec 32) ValueCell!3959)) (size!10393 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21146)

(declare-fun e!225190 () Bool)

(declare-fun array_inv!7458 (array!21146) Bool)

(assert (=> start!36816 (and (array_inv!7458 _values!506) e!225190)))

(assert (=> start!36816 tp!28586))

(declare-fun tp_is_empty!8605 () Bool)

(assert (=> start!36816 tp_is_empty!8605))

(declare-datatypes ((array!21148 0))(
  ( (array!21149 (arr!10042 (Array (_ BitVec 32) (_ BitVec 64))) (size!10394 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21148)

(declare-fun array_inv!7459 (array!21148) Bool)

(assert (=> start!36816 (array_inv!7459 _keys!658)))

(declare-fun b!368152 () Bool)

(declare-fun res!206305 () Bool)

(assert (=> b!368152 (=> (not res!206305) (not e!225192))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!368152 (= res!206305 (and (= (size!10393 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10394 _keys!658) (size!10393 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368153 () Bool)

(declare-fun res!206301 () Bool)

(assert (=> b!368153 (=> (not res!206301) (not e!225192))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368153 (= res!206301 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10394 _keys!658))))))

(declare-fun b!368154 () Bool)

(declare-fun e!225194 () Bool)

(assert (=> b!368154 (= e!225192 e!225194)))

(declare-fun res!206302 () Bool)

(assert (=> b!368154 (=> (not res!206302) (not e!225194))))

(declare-fun lt!169512 () array!21148)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21148 (_ BitVec 32)) Bool)

(assert (=> b!368154 (= res!206302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169512 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!368154 (= lt!169512 (array!21149 (store (arr!10042 _keys!658) i!548 k0!778) (size!10394 _keys!658)))))

(declare-fun b!368155 () Bool)

(declare-fun res!206298 () Bool)

(assert (=> b!368155 (=> (not res!206298) (not e!225192))))

(assert (=> b!368155 (= res!206298 (or (= (select (arr!10042 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10042 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14472 () Bool)

(declare-fun mapRes!14472 () Bool)

(assert (=> mapIsEmpty!14472 mapRes!14472))

(declare-fun b!368156 () Bool)

(assert (=> b!368156 (= e!225194 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5678 0))(
  ( (tuple2!5679 (_1!2850 (_ BitVec 64)) (_2!2850 V!12579)) )
))
(declare-datatypes ((List!5498 0))(
  ( (Nil!5495) (Cons!5494 (h!6350 tuple2!5678) (t!10640 List!5498)) )
))
(declare-datatypes ((ListLongMap!4593 0))(
  ( (ListLongMap!4594 (toList!2312 List!5498)) )
))
(declare-fun lt!169513 () ListLongMap!4593)

(declare-fun zeroValue!472 () V!12579)

(declare-fun minValue!472 () V!12579)

(declare-fun getCurrentListMapNoExtraKeys!621 (array!21148 array!21146 (_ BitVec 32) (_ BitVec 32) V!12579 V!12579 (_ BitVec 32) Int) ListLongMap!4593)

(assert (=> b!368156 (= lt!169513 (getCurrentListMapNoExtraKeys!621 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368157 () Bool)

(declare-fun e!225193 () Bool)

(assert (=> b!368157 (= e!225193 tp_is_empty!8605)))

(declare-fun b!368158 () Bool)

(declare-fun e!225195 () Bool)

(assert (=> b!368158 (= e!225195 tp_is_empty!8605)))

(declare-fun b!368159 () Bool)

(declare-fun res!206306 () Bool)

(assert (=> b!368159 (=> (not res!206306) (not e!225192))))

(assert (=> b!368159 (= res!206306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368160 () Bool)

(assert (=> b!368160 (= e!225190 (and e!225195 mapRes!14472))))

(declare-fun condMapEmpty!14472 () Bool)

(declare-fun mapDefault!14472 () ValueCell!3959)

(assert (=> b!368160 (= condMapEmpty!14472 (= (arr!10041 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3959)) mapDefault!14472)))))

(declare-fun b!368161 () Bool)

(declare-fun res!206300 () Bool)

(assert (=> b!368161 (=> (not res!206300) (not e!225192))))

(declare-datatypes ((List!5499 0))(
  ( (Nil!5496) (Cons!5495 (h!6351 (_ BitVec 64)) (t!10641 List!5499)) )
))
(declare-fun arrayNoDuplicates!0 (array!21148 (_ BitVec 32) List!5499) Bool)

(assert (=> b!368161 (= res!206300 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5496))))

(declare-fun b!368162 () Bool)

(declare-fun res!206303 () Bool)

(assert (=> b!368162 (=> (not res!206303) (not e!225192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368162 (= res!206303 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!14472 () Bool)

(declare-fun tp!28587 () Bool)

(assert (=> mapNonEmpty!14472 (= mapRes!14472 (and tp!28587 e!225193))))

(declare-fun mapKey!14472 () (_ BitVec 32))

(declare-fun mapRest!14472 () (Array (_ BitVec 32) ValueCell!3959))

(declare-fun mapValue!14472 () ValueCell!3959)

(assert (=> mapNonEmpty!14472 (= (arr!10041 _values!506) (store mapRest!14472 mapKey!14472 mapValue!14472))))

(declare-fun b!368163 () Bool)

(declare-fun res!206297 () Bool)

(assert (=> b!368163 (=> (not res!206297) (not e!225192))))

(declare-fun arrayContainsKey!0 (array!21148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368163 (= res!206297 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!368164 () Bool)

(declare-fun res!206304 () Bool)

(assert (=> b!368164 (=> (not res!206304) (not e!225194))))

(assert (=> b!368164 (= res!206304 (arrayNoDuplicates!0 lt!169512 #b00000000000000000000000000000000 Nil!5496))))

(assert (= (and start!36816 res!206299) b!368152))

(assert (= (and b!368152 res!206305) b!368159))

(assert (= (and b!368159 res!206306) b!368161))

(assert (= (and b!368161 res!206300) b!368153))

(assert (= (and b!368153 res!206301) b!368162))

(assert (= (and b!368162 res!206303) b!368155))

(assert (= (and b!368155 res!206298) b!368163))

(assert (= (and b!368163 res!206297) b!368154))

(assert (= (and b!368154 res!206302) b!368164))

(assert (= (and b!368164 res!206304) b!368156))

(assert (= (and b!368160 condMapEmpty!14472) mapIsEmpty!14472))

(assert (= (and b!368160 (not condMapEmpty!14472)) mapNonEmpty!14472))

(get-info :version)

(assert (= (and mapNonEmpty!14472 ((_ is ValueCellFull!3959) mapValue!14472)) b!368157))

(assert (= (and b!368160 ((_ is ValueCellFull!3959) mapDefault!14472)) b!368158))

(assert (= start!36816 b!368160))

(declare-fun m!365153 () Bool)

(assert (=> b!368154 m!365153))

(declare-fun m!365155 () Bool)

(assert (=> b!368154 m!365155))

(declare-fun m!365157 () Bool)

(assert (=> b!368156 m!365157))

(declare-fun m!365159 () Bool)

(assert (=> b!368164 m!365159))

(declare-fun m!365161 () Bool)

(assert (=> b!368162 m!365161))

(declare-fun m!365163 () Bool)

(assert (=> b!368163 m!365163))

(declare-fun m!365165 () Bool)

(assert (=> start!36816 m!365165))

(declare-fun m!365167 () Bool)

(assert (=> start!36816 m!365167))

(declare-fun m!365169 () Bool)

(assert (=> start!36816 m!365169))

(declare-fun m!365171 () Bool)

(assert (=> b!368159 m!365171))

(declare-fun m!365173 () Bool)

(assert (=> b!368161 m!365173))

(declare-fun m!365175 () Bool)

(assert (=> mapNonEmpty!14472 m!365175))

(declare-fun m!365177 () Bool)

(assert (=> b!368155 m!365177))

(check-sat (not b!368161) (not start!36816) (not b!368154) (not b!368164) b_and!15213 (not b!368163) (not b!368159) (not b!368156) (not b!368162) (not b_next!7957) (not mapNonEmpty!14472) tp_is_empty!8605)
(check-sat b_and!15213 (not b_next!7957))
