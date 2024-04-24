; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34296 () Bool)

(assert start!34296)

(declare-fun b_free!7285 () Bool)

(declare-fun b_next!7285 () Bool)

(assert (=> start!34296 (= b_free!7285 (not b_next!7285))))

(declare-fun tp!25394 () Bool)

(declare-fun b_and!14503 () Bool)

(assert (=> start!34296 (= tp!25394 b_and!14503)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun e!209922 () Bool)

(declare-fun b!342318 () Bool)

(declare-fun lt!162151 () Bool)

(declare-datatypes ((array!18062 0))(
  ( (array!18063 (arr!8549 (Array (_ BitVec 32) (_ BitVec 64))) (size!8901 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18062)

(assert (=> b!342318 (= e!209922 (and (not lt!162151) (not (= (size!8901 _keys!1895) (bvadd #b00000000000000000000000000000001 mask!2385)))))))

(declare-datatypes ((Unit!10623 0))(
  ( (Unit!10624) )
))
(declare-fun lt!162152 () Unit!10623)

(declare-fun e!209918 () Unit!10623)

(assert (=> b!342318 (= lt!162152 e!209918)))

(declare-fun c!52784 () Bool)

(assert (=> b!342318 (= c!52784 lt!162151)))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!18062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342318 (= lt!162151 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12288 () Bool)

(declare-fun mapRes!12288 () Bool)

(assert (=> mapIsEmpty!12288 mapRes!12288))

(declare-fun res!189246 () Bool)

(declare-fun e!209920 () Bool)

(assert (=> start!34296 (=> (not res!189246) (not e!209920))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34296 (= res!189246 (validMask!0 mask!2385))))

(assert (=> start!34296 e!209920))

(assert (=> start!34296 true))

(declare-fun tp_is_empty!7237 () Bool)

(assert (=> start!34296 tp_is_empty!7237))

(assert (=> start!34296 tp!25394))

(declare-datatypes ((V!10627 0))(
  ( (V!10628 (val!3663 Int)) )
))
(declare-datatypes ((ValueCell!3275 0))(
  ( (ValueCellFull!3275 (v!5838 V!10627)) (EmptyCell!3275) )
))
(declare-datatypes ((array!18064 0))(
  ( (array!18065 (arr!8550 (Array (_ BitVec 32) ValueCell!3275)) (size!8902 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18064)

(declare-fun e!209919 () Bool)

(declare-fun array_inv!6324 (array!18064) Bool)

(assert (=> start!34296 (and (array_inv!6324 _values!1525) e!209919)))

(declare-fun array_inv!6325 (array!18062) Bool)

(assert (=> start!34296 (array_inv!6325 _keys!1895)))

(declare-fun b!342319 () Bool)

(declare-fun res!189245 () Bool)

(assert (=> b!342319 (=> (not res!189245) (not e!209920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18062 (_ BitVec 32)) Bool)

(assert (=> b!342319 (= res!189245 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342320 () Bool)

(declare-fun res!189247 () Bool)

(assert (=> b!342320 (=> (not res!189247) (not e!209920))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342320 (= res!189247 (validKeyInArray!0 k0!1348))))

(declare-fun b!342321 () Bool)

(declare-fun res!189251 () Bool)

(assert (=> b!342321 (=> (not res!189251) (not e!209920))))

(declare-datatypes ((List!4827 0))(
  ( (Nil!4824) (Cons!4823 (h!5679 (_ BitVec 64)) (t!9931 List!4827)) )
))
(declare-fun arrayNoDuplicates!0 (array!18062 (_ BitVec 32) List!4827) Bool)

(assert (=> b!342321 (= res!189251 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4824))))

(declare-fun b!342322 () Bool)

(declare-fun res!189250 () Bool)

(assert (=> b!342322 (=> (not res!189250) (not e!209920))))

(declare-fun zeroValue!1467 () V!10627)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10627)

(declare-datatypes ((tuple2!5224 0))(
  ( (tuple2!5225 (_1!2623 (_ BitVec 64)) (_2!2623 V!10627)) )
))
(declare-datatypes ((List!4828 0))(
  ( (Nil!4825) (Cons!4824 (h!5680 tuple2!5224) (t!9932 List!4828)) )
))
(declare-datatypes ((ListLongMap!4139 0))(
  ( (ListLongMap!4140 (toList!2085 List!4828)) )
))
(declare-fun contains!2160 (ListLongMap!4139 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1614 (array!18062 array!18064 (_ BitVec 32) (_ BitVec 32) V!10627 V!10627 (_ BitVec 32) Int) ListLongMap!4139)

(assert (=> b!342322 (= res!189250 (not (contains!2160 (getCurrentListMap!1614 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!342323 () Bool)

(assert (=> b!342323 (= e!209920 e!209922)))

(declare-fun res!189248 () Bool)

(assert (=> b!342323 (=> (not res!189248) (not e!209922))))

(declare-datatypes ((SeekEntryResult!3253 0))(
  ( (MissingZero!3253 (index!15191 (_ BitVec 32))) (Found!3253 (index!15192 (_ BitVec 32))) (Intermediate!3253 (undefined!4065 Bool) (index!15193 (_ BitVec 32)) (x!34040 (_ BitVec 32))) (Undefined!3253) (MissingVacant!3253 (index!15194 (_ BitVec 32))) )
))
(declare-fun lt!162153 () SeekEntryResult!3253)

(get-info :version)

(assert (=> b!342323 (= res!189248 (and (not ((_ is Found!3253) lt!162153)) (not ((_ is MissingZero!3253) lt!162153)) ((_ is MissingVacant!3253) lt!162153)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18062 (_ BitVec 32)) SeekEntryResult!3253)

(assert (=> b!342323 (= lt!162153 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!342324 () Bool)

(declare-fun Unit!10625 () Unit!10623)

(assert (=> b!342324 (= e!209918 Unit!10625)))

(declare-fun b!342325 () Bool)

(declare-fun Unit!10626 () Unit!10623)

(assert (=> b!342325 (= e!209918 Unit!10626)))

(declare-fun lt!162154 () Unit!10623)

(declare-fun lemmaArrayContainsKeyThenInListMap!308 (array!18062 array!18064 (_ BitVec 32) (_ BitVec 32) V!10627 V!10627 (_ BitVec 64) (_ BitVec 32) Int) Unit!10623)

(declare-fun arrayScanForKey!0 (array!18062 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342325 (= lt!162154 (lemmaArrayContainsKeyThenInListMap!308 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k0!1348 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342325 false))

(declare-fun b!342326 () Bool)

(declare-fun e!209924 () Bool)

(assert (=> b!342326 (= e!209924 tp_is_empty!7237)))

(declare-fun b!342327 () Bool)

(declare-fun e!209923 () Bool)

(assert (=> b!342327 (= e!209923 tp_is_empty!7237)))

(declare-fun b!342328 () Bool)

(assert (=> b!342328 (= e!209919 (and e!209924 mapRes!12288))))

(declare-fun condMapEmpty!12288 () Bool)

(declare-fun mapDefault!12288 () ValueCell!3275)

(assert (=> b!342328 (= condMapEmpty!12288 (= (arr!8550 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3275)) mapDefault!12288)))))

(declare-fun b!342329 () Bool)

(declare-fun res!189249 () Bool)

(assert (=> b!342329 (=> (not res!189249) (not e!209920))))

(assert (=> b!342329 (= res!189249 (and (= (size!8902 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8901 _keys!1895) (size!8902 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!12288 () Bool)

(declare-fun tp!25395 () Bool)

(assert (=> mapNonEmpty!12288 (= mapRes!12288 (and tp!25395 e!209923))))

(declare-fun mapValue!12288 () ValueCell!3275)

(declare-fun mapRest!12288 () (Array (_ BitVec 32) ValueCell!3275))

(declare-fun mapKey!12288 () (_ BitVec 32))

(assert (=> mapNonEmpty!12288 (= (arr!8550 _values!1525) (store mapRest!12288 mapKey!12288 mapValue!12288))))

(assert (= (and start!34296 res!189246) b!342329))

(assert (= (and b!342329 res!189249) b!342319))

(assert (= (and b!342319 res!189245) b!342321))

(assert (= (and b!342321 res!189251) b!342320))

(assert (= (and b!342320 res!189247) b!342322))

(assert (= (and b!342322 res!189250) b!342323))

(assert (= (and b!342323 res!189248) b!342318))

(assert (= (and b!342318 c!52784) b!342325))

(assert (= (and b!342318 (not c!52784)) b!342324))

(assert (= (and b!342328 condMapEmpty!12288) mapIsEmpty!12288))

(assert (= (and b!342328 (not condMapEmpty!12288)) mapNonEmpty!12288))

(assert (= (and mapNonEmpty!12288 ((_ is ValueCellFull!3275) mapValue!12288)) b!342327))

(assert (= (and b!342328 ((_ is ValueCellFull!3275) mapDefault!12288)) b!342326))

(assert (= start!34296 b!342328))

(declare-fun m!344769 () Bool)

(assert (=> b!342319 m!344769))

(declare-fun m!344771 () Bool)

(assert (=> start!34296 m!344771))

(declare-fun m!344773 () Bool)

(assert (=> start!34296 m!344773))

(declare-fun m!344775 () Bool)

(assert (=> start!34296 m!344775))

(declare-fun m!344777 () Bool)

(assert (=> b!342321 m!344777))

(declare-fun m!344779 () Bool)

(assert (=> b!342325 m!344779))

(assert (=> b!342325 m!344779))

(declare-fun m!344781 () Bool)

(assert (=> b!342325 m!344781))

(declare-fun m!344783 () Bool)

(assert (=> b!342320 m!344783))

(declare-fun m!344785 () Bool)

(assert (=> b!342323 m!344785))

(declare-fun m!344787 () Bool)

(assert (=> b!342318 m!344787))

(declare-fun m!344789 () Bool)

(assert (=> mapNonEmpty!12288 m!344789))

(declare-fun m!344791 () Bool)

(assert (=> b!342322 m!344791))

(assert (=> b!342322 m!344791))

(declare-fun m!344793 () Bool)

(assert (=> b!342322 m!344793))

(check-sat (not b!342318) (not b!342320) b_and!14503 (not start!34296) (not mapNonEmpty!12288) (not b_next!7285) (not b!342323) (not b!342325) tp_is_empty!7237 (not b!342322) (not b!342319) (not b!342321))
(check-sat b_and!14503 (not b_next!7285))
