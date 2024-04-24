; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36750 () Bool)

(assert start!36750)

(declare-fun b!366917 () Bool)

(declare-fun res!205359 () Bool)

(declare-fun e!224597 () Bool)

(assert (=> b!366917 (=> (not res!205359) (not e!224597))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!366917 (= res!205359 (validKeyInArray!0 k0!778))))

(declare-fun b!366918 () Bool)

(declare-fun res!205360 () Bool)

(assert (=> b!366918 (=> (not res!205360) (not e!224597))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21022 0))(
  ( (array!21023 (arr!9979 (Array (_ BitVec 32) (_ BitVec 64))) (size!10331 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21022)

(assert (=> b!366918 (= res!205360 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10331 _keys!658))))))

(declare-fun b!366920 () Bool)

(declare-fun e!224598 () Bool)

(assert (=> b!366920 (= e!224597 e!224598)))

(declare-fun res!205367 () Bool)

(assert (=> b!366920 (=> (not res!205367) (not e!224598))))

(declare-fun lt!169323 () array!21022)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21022 (_ BitVec 32)) Bool)

(assert (=> b!366920 (= res!205367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169323 mask!970))))

(assert (=> b!366920 (= lt!169323 (array!21023 (store (arr!9979 _keys!658) i!548 k0!778) (size!10331 _keys!658)))))

(declare-fun b!366921 () Bool)

(declare-fun res!205366 () Bool)

(assert (=> b!366921 (=> (not res!205366) (not e!224597))))

(assert (=> b!366921 (= res!205366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!366922 () Bool)

(declare-fun res!205361 () Bool)

(assert (=> b!366922 (=> (not res!205361) (not e!224597))))

(declare-fun arrayContainsKey!0 (array!21022 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!366922 (= res!205361 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!366923 () Bool)

(declare-fun res!205363 () Bool)

(assert (=> b!366923 (=> (not res!205363) (not e!224597))))

(declare-datatypes ((List!5465 0))(
  ( (Nil!5462) (Cons!5461 (h!6317 (_ BitVec 64)) (t!10607 List!5465)) )
))
(declare-fun arrayNoDuplicates!0 (array!21022 (_ BitVec 32) List!5465) Bool)

(assert (=> b!366923 (= res!205363 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5462))))

(declare-fun b!366924 () Bool)

(declare-fun res!205362 () Bool)

(assert (=> b!366924 (=> (not res!205362) (not e!224597))))

(assert (=> b!366924 (= res!205362 (or (= (select (arr!9979 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9979 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!366925 () Bool)

(declare-fun e!224596 () Bool)

(declare-fun tp_is_empty!8539 () Bool)

(assert (=> b!366925 (= e!224596 tp_is_empty!8539)))

(declare-fun b!366926 () Bool)

(assert (=> b!366926 (= e!224598 false)))

(declare-fun lt!169324 () Bool)

(assert (=> b!366926 (= lt!169324 (arrayNoDuplicates!0 lt!169323 #b00000000000000000000000000000000 Nil!5462))))

(declare-fun b!366927 () Bool)

(declare-fun e!224601 () Bool)

(assert (=> b!366927 (= e!224601 tp_is_empty!8539)))

(declare-fun b!366928 () Bool)

(declare-fun e!224600 () Bool)

(declare-fun mapRes!14373 () Bool)

(assert (=> b!366928 (= e!224600 (and e!224601 mapRes!14373))))

(declare-fun condMapEmpty!14373 () Bool)

(declare-datatypes ((V!12491 0))(
  ( (V!12492 (val!4314 Int)) )
))
(declare-datatypes ((ValueCell!3926 0))(
  ( (ValueCellFull!3926 (v!6512 V!12491)) (EmptyCell!3926) )
))
(declare-datatypes ((array!21024 0))(
  ( (array!21025 (arr!9980 (Array (_ BitVec 32) ValueCell!3926)) (size!10332 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21024)

(declare-fun mapDefault!14373 () ValueCell!3926)

(assert (=> b!366928 (= condMapEmpty!14373 (= (arr!9980 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3926)) mapDefault!14373)))))

(declare-fun res!205365 () Bool)

(assert (=> start!36750 (=> (not res!205365) (not e!224597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36750 (= res!205365 (validMask!0 mask!970))))

(assert (=> start!36750 e!224597))

(assert (=> start!36750 true))

(declare-fun array_inv!7418 (array!21024) Bool)

(assert (=> start!36750 (and (array_inv!7418 _values!506) e!224600)))

(declare-fun array_inv!7419 (array!21022) Bool)

(assert (=> start!36750 (array_inv!7419 _keys!658)))

(declare-fun b!366919 () Bool)

(declare-fun res!205364 () Bool)

(assert (=> b!366919 (=> (not res!205364) (not e!224597))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!366919 (= res!205364 (and (= (size!10332 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10331 _keys!658) (size!10332 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14373 () Bool)

(declare-fun tp!28449 () Bool)

(assert (=> mapNonEmpty!14373 (= mapRes!14373 (and tp!28449 e!224596))))

(declare-fun mapValue!14373 () ValueCell!3926)

(declare-fun mapRest!14373 () (Array (_ BitVec 32) ValueCell!3926))

(declare-fun mapKey!14373 () (_ BitVec 32))

(assert (=> mapNonEmpty!14373 (= (arr!9980 _values!506) (store mapRest!14373 mapKey!14373 mapValue!14373))))

(declare-fun mapIsEmpty!14373 () Bool)

(assert (=> mapIsEmpty!14373 mapRes!14373))

(assert (= (and start!36750 res!205365) b!366919))

(assert (= (and b!366919 res!205364) b!366921))

(assert (= (and b!366921 res!205366) b!366923))

(assert (= (and b!366923 res!205363) b!366918))

(assert (= (and b!366918 res!205360) b!366917))

(assert (= (and b!366917 res!205359) b!366924))

(assert (= (and b!366924 res!205362) b!366922))

(assert (= (and b!366922 res!205361) b!366920))

(assert (= (and b!366920 res!205367) b!366926))

(assert (= (and b!366928 condMapEmpty!14373) mapIsEmpty!14373))

(assert (= (and b!366928 (not condMapEmpty!14373)) mapNonEmpty!14373))

(get-info :version)

(assert (= (and mapNonEmpty!14373 ((_ is ValueCellFull!3926) mapValue!14373)) b!366925))

(assert (= (and b!366928 ((_ is ValueCellFull!3926) mapDefault!14373)) b!366927))

(assert (= start!36750 b!366928))

(declare-fun m!364337 () Bool)

(assert (=> b!366922 m!364337))

(declare-fun m!364339 () Bool)

(assert (=> b!366926 m!364339))

(declare-fun m!364341 () Bool)

(assert (=> mapNonEmpty!14373 m!364341))

(declare-fun m!364343 () Bool)

(assert (=> start!36750 m!364343))

(declare-fun m!364345 () Bool)

(assert (=> start!36750 m!364345))

(declare-fun m!364347 () Bool)

(assert (=> start!36750 m!364347))

(declare-fun m!364349 () Bool)

(assert (=> b!366924 m!364349))

(declare-fun m!364351 () Bool)

(assert (=> b!366920 m!364351))

(declare-fun m!364353 () Bool)

(assert (=> b!366920 m!364353))

(declare-fun m!364355 () Bool)

(assert (=> b!366921 m!364355))

(declare-fun m!364357 () Bool)

(assert (=> b!366917 m!364357))

(declare-fun m!364359 () Bool)

(assert (=> b!366923 m!364359))

(check-sat (not b!366917) (not mapNonEmpty!14373) (not b!366922) (not b!366923) (not b!366920) (not start!36750) (not b!366921) (not b!366926) tp_is_empty!8539)
(check-sat)
