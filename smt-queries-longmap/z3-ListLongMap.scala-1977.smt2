; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34726 () Bool)

(assert start!34726)

(declare-fun b_free!7533 () Bool)

(declare-fun b_next!7533 () Bool)

(assert (=> start!34726 (= b_free!7533 (not b_next!7533))))

(declare-fun tp!26163 () Bool)

(declare-fun b_and!14753 () Bool)

(assert (=> start!34726 (= tp!26163 b_and!14753)))

(declare-fun b!347210 () Bool)

(declare-fun e!212759 () Bool)

(declare-fun tp_is_empty!7485 () Bool)

(assert (=> b!347210 (= e!212759 tp_is_empty!7485)))

(declare-fun b!347211 () Bool)

(declare-fun e!212755 () Bool)

(assert (=> b!347211 (= e!212755 (not true))))

(declare-datatypes ((array!18561 0))(
  ( (array!18562 (arr!8791 (Array (_ BitVec 32) (_ BitVec 64))) (size!9143 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18561)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18561 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!347211 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!10779 0))(
  ( (Unit!10780) )
))
(declare-fun lt!163509 () Unit!10779)

(declare-datatypes ((SeekEntryResult!3391 0))(
  ( (MissingZero!3391 (index!15743 (_ BitVec 32))) (Found!3391 (index!15744 (_ BitVec 32))) (Intermediate!3391 (undefined!4203 Bool) (index!15745 (_ BitVec 32)) (x!34589 (_ BitVec 32))) (Undefined!3391) (MissingVacant!3391 (index!15746 (_ BitVec 32))) )
))
(declare-fun lt!163510 () SeekEntryResult!3391)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!18561 (_ BitVec 64) (_ BitVec 32)) Unit!10779)

(assert (=> b!347211 (= lt!163509 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!15744 lt!163510)))))

(declare-fun mapIsEmpty!12684 () Bool)

(declare-fun mapRes!12684 () Bool)

(assert (=> mapIsEmpty!12684 mapRes!12684))

(declare-fun b!347212 () Bool)

(declare-fun res!192166 () Bool)

(declare-fun e!212756 () Bool)

(assert (=> b!347212 (=> (not res!192166) (not e!212756))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10957 0))(
  ( (V!10958 (val!3787 Int)) )
))
(declare-fun zeroValue!1467 () V!10957)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3399 0))(
  ( (ValueCellFull!3399 (v!5969 V!10957)) (EmptyCell!3399) )
))
(declare-datatypes ((array!18563 0))(
  ( (array!18564 (arr!8792 (Array (_ BitVec 32) ValueCell!3399)) (size!9144 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18563)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10957)

(declare-datatypes ((tuple2!5482 0))(
  ( (tuple2!5483 (_1!2752 (_ BitVec 64)) (_2!2752 V!10957)) )
))
(declare-datatypes ((List!5102 0))(
  ( (Nil!5099) (Cons!5098 (h!5954 tuple2!5482) (t!10230 List!5102)) )
))
(declare-datatypes ((ListLongMap!4395 0))(
  ( (ListLongMap!4396 (toList!2213 List!5102)) )
))
(declare-fun contains!2277 (ListLongMap!4395 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1734 (array!18561 array!18563 (_ BitVec 32) (_ BitVec 32) V!10957 V!10957 (_ BitVec 32) Int) ListLongMap!4395)

(assert (=> b!347212 (= res!192166 (not (contains!2277 (getCurrentListMap!1734 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!347213 () Bool)

(declare-fun e!212758 () Bool)

(declare-fun e!212757 () Bool)

(assert (=> b!347213 (= e!212758 (and e!212757 mapRes!12684))))

(declare-fun condMapEmpty!12684 () Bool)

(declare-fun mapDefault!12684 () ValueCell!3399)

(assert (=> b!347213 (= condMapEmpty!12684 (= (arr!8792 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3399)) mapDefault!12684)))))

(declare-fun b!347214 () Bool)

(assert (=> b!347214 (= e!212757 tp_is_empty!7485)))

(declare-fun res!192169 () Bool)

(assert (=> start!34726 (=> (not res!192169) (not e!212756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34726 (= res!192169 (validMask!0 mask!2385))))

(assert (=> start!34726 e!212756))

(assert (=> start!34726 true))

(assert (=> start!34726 tp_is_empty!7485))

(assert (=> start!34726 tp!26163))

(declare-fun array_inv!6508 (array!18563) Bool)

(assert (=> start!34726 (and (array_inv!6508 _values!1525) e!212758)))

(declare-fun array_inv!6509 (array!18561) Bool)

(assert (=> start!34726 (array_inv!6509 _keys!1895)))

(declare-fun b!347215 () Bool)

(declare-fun res!192165 () Bool)

(assert (=> b!347215 (=> (not res!192165) (not e!212756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18561 (_ BitVec 32)) Bool)

(assert (=> b!347215 (= res!192165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!347216 () Bool)

(declare-fun res!192163 () Bool)

(assert (=> b!347216 (=> (not res!192163) (not e!212756))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!347216 (= res!192163 (validKeyInArray!0 k0!1348))))

(declare-fun b!347217 () Bool)

(declare-fun res!192164 () Bool)

(assert (=> b!347217 (=> (not res!192164) (not e!212756))))

(declare-datatypes ((List!5103 0))(
  ( (Nil!5100) (Cons!5099 (h!5955 (_ BitVec 64)) (t!10231 List!5103)) )
))
(declare-fun arrayNoDuplicates!0 (array!18561 (_ BitVec 32) List!5103) Bool)

(assert (=> b!347217 (= res!192164 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5100))))

(declare-fun b!347218 () Bool)

(declare-fun res!192170 () Bool)

(assert (=> b!347218 (=> (not res!192170) (not e!212756))))

(assert (=> b!347218 (= res!192170 (and (= (size!9144 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9143 _keys!1895) (size!9144 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!347219 () Bool)

(assert (=> b!347219 (= e!212756 e!212755)))

(declare-fun res!192168 () Bool)

(assert (=> b!347219 (=> (not res!192168) (not e!212755))))

(get-info :version)

(assert (=> b!347219 (= res!192168 (and ((_ is Found!3391) lt!163510) (= (select (arr!8791 _keys!1895) (index!15744 lt!163510)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18561 (_ BitVec 32)) SeekEntryResult!3391)

(assert (=> b!347219 (= lt!163510 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!347220 () Bool)

(declare-fun res!192167 () Bool)

(assert (=> b!347220 (=> (not res!192167) (not e!212755))))

(assert (=> b!347220 (= res!192167 (arrayContainsKey!0 _keys!1895 k0!1348 (index!15744 lt!163510)))))

(declare-fun mapNonEmpty!12684 () Bool)

(declare-fun tp!26162 () Bool)

(assert (=> mapNonEmpty!12684 (= mapRes!12684 (and tp!26162 e!212759))))

(declare-fun mapKey!12684 () (_ BitVec 32))

(declare-fun mapValue!12684 () ValueCell!3399)

(declare-fun mapRest!12684 () (Array (_ BitVec 32) ValueCell!3399))

(assert (=> mapNonEmpty!12684 (= (arr!8792 _values!1525) (store mapRest!12684 mapKey!12684 mapValue!12684))))

(assert (= (and start!34726 res!192169) b!347218))

(assert (= (and b!347218 res!192170) b!347215))

(assert (= (and b!347215 res!192165) b!347217))

(assert (= (and b!347217 res!192164) b!347216))

(assert (= (and b!347216 res!192163) b!347212))

(assert (= (and b!347212 res!192166) b!347219))

(assert (= (and b!347219 res!192168) b!347220))

(assert (= (and b!347220 res!192167) b!347211))

(assert (= (and b!347213 condMapEmpty!12684) mapIsEmpty!12684))

(assert (= (and b!347213 (not condMapEmpty!12684)) mapNonEmpty!12684))

(assert (= (and mapNonEmpty!12684 ((_ is ValueCellFull!3399) mapValue!12684)) b!347210))

(assert (= (and b!347213 ((_ is ValueCellFull!3399) mapDefault!12684)) b!347214))

(assert (= start!34726 b!347213))

(declare-fun m!348175 () Bool)

(assert (=> b!347220 m!348175))

(declare-fun m!348177 () Bool)

(assert (=> b!347219 m!348177))

(declare-fun m!348179 () Bool)

(assert (=> b!347219 m!348179))

(declare-fun m!348181 () Bool)

(assert (=> mapNonEmpty!12684 m!348181))

(declare-fun m!348183 () Bool)

(assert (=> b!347216 m!348183))

(declare-fun m!348185 () Bool)

(assert (=> b!347217 m!348185))

(declare-fun m!348187 () Bool)

(assert (=> b!347212 m!348187))

(assert (=> b!347212 m!348187))

(declare-fun m!348189 () Bool)

(assert (=> b!347212 m!348189))

(declare-fun m!348191 () Bool)

(assert (=> start!34726 m!348191))

(declare-fun m!348193 () Bool)

(assert (=> start!34726 m!348193))

(declare-fun m!348195 () Bool)

(assert (=> start!34726 m!348195))

(declare-fun m!348197 () Bool)

(assert (=> b!347215 m!348197))

(declare-fun m!348199 () Bool)

(assert (=> b!347211 m!348199))

(declare-fun m!348201 () Bool)

(assert (=> b!347211 m!348201))

(check-sat tp_is_empty!7485 (not start!34726) b_and!14753 (not b!347220) (not b!347215) (not mapNonEmpty!12684) (not b!347217) (not b!347219) (not b_next!7533) (not b!347212) (not b!347211) (not b!347216))
(check-sat b_and!14753 (not b_next!7533))
