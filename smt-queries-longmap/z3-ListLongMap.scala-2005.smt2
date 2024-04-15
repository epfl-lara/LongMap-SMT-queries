; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34996 () Bool)

(assert start!34996)

(declare-fun b_free!7699 () Bool)

(declare-fun b_next!7699 () Bool)

(assert (=> start!34996 (= b_free!7699 (not b_next!7699))))

(declare-fun tp!26676 () Bool)

(declare-fun b_and!14903 () Bool)

(assert (=> start!34996 (= tp!26676 b_and!14903)))

(declare-fun b!350502 () Bool)

(declare-fun res!194312 () Bool)

(declare-fun e!214669 () Bool)

(assert (=> b!350502 (=> (not res!194312) (not e!214669))))

(declare-datatypes ((array!18869 0))(
  ( (array!18870 (arr!8940 (Array (_ BitVec 32) (_ BitVec 64))) (size!9293 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18869)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18869 (_ BitVec 32)) Bool)

(assert (=> b!350502 (= res!194312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!350503 () Bool)

(declare-fun res!194319 () Bool)

(assert (=> b!350503 (=> (not res!194319) (not e!214669))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((V!11179 0))(
  ( (V!11180 (val!3870 Int)) )
))
(declare-fun zeroValue!1467 () V!11179)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3482 0))(
  ( (ValueCellFull!3482 (v!6051 V!11179)) (EmptyCell!3482) )
))
(declare-datatypes ((array!18871 0))(
  ( (array!18872 (arr!8941 (Array (_ BitVec 32) ValueCell!3482)) (size!9294 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18871)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11179)

(declare-datatypes ((tuple2!5558 0))(
  ( (tuple2!5559 (_1!2790 (_ BitVec 64)) (_2!2790 V!11179)) )
))
(declare-datatypes ((List!5172 0))(
  ( (Nil!5169) (Cons!5168 (h!6024 tuple2!5558) (t!10301 List!5172)) )
))
(declare-datatypes ((ListLongMap!4461 0))(
  ( (ListLongMap!4462 (toList!2246 List!5172)) )
))
(declare-fun contains!2326 (ListLongMap!4461 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1751 (array!18869 array!18871 (_ BitVec 32) (_ BitVec 32) V!11179 V!11179 (_ BitVec 32) Int) ListLongMap!4461)

(assert (=> b!350503 (= res!194319 (not (contains!2326 (getCurrentListMap!1751 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!350505 () Bool)

(declare-fun e!214668 () Bool)

(declare-fun tp_is_empty!7651 () Bool)

(assert (=> b!350505 (= e!214668 tp_is_empty!7651)))

(declare-fun b!350506 () Bool)

(declare-fun e!214672 () Bool)

(assert (=> b!350506 (= e!214672 tp_is_empty!7651)))

(declare-fun mapNonEmpty!12948 () Bool)

(declare-fun mapRes!12948 () Bool)

(declare-fun tp!26675 () Bool)

(assert (=> mapNonEmpty!12948 (= mapRes!12948 (and tp!26675 e!214672))))

(declare-fun mapValue!12948 () ValueCell!3482)

(declare-fun mapKey!12948 () (_ BitVec 32))

(declare-fun mapRest!12948 () (Array (_ BitVec 32) ValueCell!3482))

(assert (=> mapNonEmpty!12948 (= (arr!8941 _values!1525) (store mapRest!12948 mapKey!12948 mapValue!12948))))

(declare-fun mapIsEmpty!12948 () Bool)

(assert (=> mapIsEmpty!12948 mapRes!12948))

(declare-fun b!350507 () Bool)

(declare-fun res!194315 () Bool)

(assert (=> b!350507 (=> (not res!194315) (not e!214669))))

(declare-datatypes ((List!5173 0))(
  ( (Nil!5170) (Cons!5169 (h!6025 (_ BitVec 64)) (t!10302 List!5173)) )
))
(declare-fun arrayNoDuplicates!0 (array!18869 (_ BitVec 32) List!5173) Bool)

(assert (=> b!350507 (= res!194315 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5170))))

(declare-fun b!350508 () Bool)

(declare-fun res!194318 () Bool)

(assert (=> b!350508 (=> (not res!194318) (not e!214669))))

(assert (=> b!350508 (= res!194318 (and (= (size!9294 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9293 _keys!1895) (size!9294 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!350509 () Bool)

(declare-fun res!194316 () Bool)

(declare-fun e!214673 () Bool)

(assert (=> b!350509 (=> (not res!194316) (not e!214673))))

(declare-fun arrayContainsKey!0 (array!18869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!350509 (= res!194316 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350510 () Bool)

(assert (=> b!350510 (= e!214673 false)))

(declare-fun lt!164408 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18869 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!350510 (= lt!164408 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!350511 () Bool)

(declare-fun res!194317 () Bool)

(assert (=> b!350511 (=> (not res!194317) (not e!214669))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!350511 (= res!194317 (validKeyInArray!0 k0!1348))))

(declare-fun b!350512 () Bool)

(declare-fun e!214670 () Bool)

(assert (=> b!350512 (= e!214670 (and e!214668 mapRes!12948))))

(declare-fun condMapEmpty!12948 () Bool)

(declare-fun mapDefault!12948 () ValueCell!3482)

(assert (=> b!350512 (= condMapEmpty!12948 (= (arr!8941 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3482)) mapDefault!12948)))))

(declare-fun b!350504 () Bool)

(assert (=> b!350504 (= e!214669 e!214673)))

(declare-fun res!194313 () Bool)

(assert (=> b!350504 (=> (not res!194313) (not e!214673))))

(declare-datatypes ((SeekEntryResult!3445 0))(
  ( (MissingZero!3445 (index!15959 (_ BitVec 32))) (Found!3445 (index!15960 (_ BitVec 32))) (Intermediate!3445 (undefined!4257 Bool) (index!15961 (_ BitVec 32)) (x!34912 (_ BitVec 32))) (Undefined!3445) (MissingVacant!3445 (index!15962 (_ BitVec 32))) )
))
(declare-fun lt!164409 () SeekEntryResult!3445)

(get-info :version)

(assert (=> b!350504 (= res!194313 (and (not ((_ is Found!3445) lt!164409)) (not ((_ is MissingZero!3445) lt!164409)) ((_ is MissingVacant!3445) lt!164409)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18869 (_ BitVec 32)) SeekEntryResult!3445)

(assert (=> b!350504 (= lt!164409 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!194314 () Bool)

(assert (=> start!34996 (=> (not res!194314) (not e!214669))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34996 (= res!194314 (validMask!0 mask!2385))))

(assert (=> start!34996 e!214669))

(assert (=> start!34996 true))

(assert (=> start!34996 tp_is_empty!7651))

(assert (=> start!34996 tp!26676))

(declare-fun array_inv!6626 (array!18871) Bool)

(assert (=> start!34996 (and (array_inv!6626 _values!1525) e!214670)))

(declare-fun array_inv!6627 (array!18869) Bool)

(assert (=> start!34996 (array_inv!6627 _keys!1895)))

(assert (= (and start!34996 res!194314) b!350508))

(assert (= (and b!350508 res!194318) b!350502))

(assert (= (and b!350502 res!194312) b!350507))

(assert (= (and b!350507 res!194315) b!350511))

(assert (= (and b!350511 res!194317) b!350503))

(assert (= (and b!350503 res!194319) b!350504))

(assert (= (and b!350504 res!194313) b!350509))

(assert (= (and b!350509 res!194316) b!350510))

(assert (= (and b!350512 condMapEmpty!12948) mapIsEmpty!12948))

(assert (= (and b!350512 (not condMapEmpty!12948)) mapNonEmpty!12948))

(assert (= (and mapNonEmpty!12948 ((_ is ValueCellFull!3482) mapValue!12948)) b!350506))

(assert (= (and b!350512 ((_ is ValueCellFull!3482) mapDefault!12948)) b!350505))

(assert (= start!34996 b!350512))

(declare-fun m!350151 () Bool)

(assert (=> b!350504 m!350151))

(declare-fun m!350153 () Bool)

(assert (=> b!350509 m!350153))

(declare-fun m!350155 () Bool)

(assert (=> b!350507 m!350155))

(declare-fun m!350157 () Bool)

(assert (=> start!34996 m!350157))

(declare-fun m!350159 () Bool)

(assert (=> start!34996 m!350159))

(declare-fun m!350161 () Bool)

(assert (=> start!34996 m!350161))

(declare-fun m!350163 () Bool)

(assert (=> b!350511 m!350163))

(declare-fun m!350165 () Bool)

(assert (=> b!350510 m!350165))

(declare-fun m!350167 () Bool)

(assert (=> b!350503 m!350167))

(assert (=> b!350503 m!350167))

(declare-fun m!350169 () Bool)

(assert (=> b!350503 m!350169))

(declare-fun m!350171 () Bool)

(assert (=> mapNonEmpty!12948 m!350171))

(declare-fun m!350173 () Bool)

(assert (=> b!350502 m!350173))

(check-sat (not b!350511) (not start!34996) (not b!350504) (not b!350503) tp_is_empty!7651 (not b_next!7699) (not mapNonEmpty!12948) (not b!350509) (not b!350507) (not b!350502) b_and!14903 (not b!350510))
(check-sat b_and!14903 (not b_next!7699))
