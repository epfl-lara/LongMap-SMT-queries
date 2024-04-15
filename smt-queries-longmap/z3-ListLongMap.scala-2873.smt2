; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41344 () Bool)

(assert start!41344)

(declare-fun b!462022 () Bool)

(declare-fun res!276364 () Bool)

(declare-fun e!269551 () Bool)

(assert (=> b!462022 (=> (not res!276364) (not e!269551))))

(declare-datatypes ((array!28747 0))(
  ( (array!28748 (arr!13807 (Array (_ BitVec 32) (_ BitVec 64))) (size!14160 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28747)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28747 (_ BitVec 32)) Bool)

(assert (=> b!462022 (= res!276364 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!276365 () Bool)

(assert (=> start!41344 (=> (not res!276365) (not e!269551))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41344 (= res!276365 (validMask!0 mask!1365))))

(assert (=> start!41344 e!269551))

(assert (=> start!41344 true))

(declare-fun array_inv!10054 (array!28747) Bool)

(assert (=> start!41344 (array_inv!10054 _keys!1025)))

(declare-datatypes ((V!17739 0))(
  ( (V!17740 (val!6282 Int)) )
))
(declare-datatypes ((ValueCell!5894 0))(
  ( (ValueCellFull!5894 (v!8563 V!17739)) (EmptyCell!5894) )
))
(declare-datatypes ((array!28749 0))(
  ( (array!28750 (arr!13808 (Array (_ BitVec 32) ValueCell!5894)) (size!14161 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28749)

(declare-fun e!269553 () Bool)

(declare-fun array_inv!10055 (array!28749) Bool)

(assert (=> start!41344 (and (array_inv!10055 _values!833) e!269553)))

(declare-fun b!462023 () Bool)

(declare-fun e!269549 () Bool)

(declare-fun tp_is_empty!12475 () Bool)

(assert (=> b!462023 (= e!269549 tp_is_empty!12475)))

(declare-fun b!462024 () Bool)

(declare-fun e!269552 () Bool)

(declare-fun mapRes!20383 () Bool)

(assert (=> b!462024 (= e!269553 (and e!269552 mapRes!20383))))

(declare-fun condMapEmpty!20383 () Bool)

(declare-fun mapDefault!20383 () ValueCell!5894)

(assert (=> b!462024 (= condMapEmpty!20383 (= (arr!13808 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5894)) mapDefault!20383)))))

(declare-fun b!462025 () Bool)

(assert (=> b!462025 (= e!269551 false)))

(declare-fun lt!208952 () Bool)

(declare-datatypes ((List!8359 0))(
  ( (Nil!8356) (Cons!8355 (h!9211 (_ BitVec 64)) (t!14294 List!8359)) )
))
(declare-fun arrayNoDuplicates!0 (array!28747 (_ BitVec 32) List!8359) Bool)

(assert (=> b!462025 (= lt!208952 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8356))))

(declare-fun b!462026 () Bool)

(declare-fun res!276363 () Bool)

(assert (=> b!462026 (=> (not res!276363) (not e!269551))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462026 (= res!276363 (and (= (size!14161 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14160 _keys!1025) (size!14161 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462027 () Bool)

(assert (=> b!462027 (= e!269552 tp_is_empty!12475)))

(declare-fun mapIsEmpty!20383 () Bool)

(assert (=> mapIsEmpty!20383 mapRes!20383))

(declare-fun mapNonEmpty!20383 () Bool)

(declare-fun tp!39202 () Bool)

(assert (=> mapNonEmpty!20383 (= mapRes!20383 (and tp!39202 e!269549))))

(declare-fun mapValue!20383 () ValueCell!5894)

(declare-fun mapKey!20383 () (_ BitVec 32))

(declare-fun mapRest!20383 () (Array (_ BitVec 32) ValueCell!5894))

(assert (=> mapNonEmpty!20383 (= (arr!13808 _values!833) (store mapRest!20383 mapKey!20383 mapValue!20383))))

(assert (= (and start!41344 res!276365) b!462026))

(assert (= (and b!462026 res!276363) b!462022))

(assert (= (and b!462022 res!276364) b!462025))

(assert (= (and b!462024 condMapEmpty!20383) mapIsEmpty!20383))

(assert (= (and b!462024 (not condMapEmpty!20383)) mapNonEmpty!20383))

(get-info :version)

(assert (= (and mapNonEmpty!20383 ((_ is ValueCellFull!5894) mapValue!20383)) b!462023))

(assert (= (and b!462024 ((_ is ValueCellFull!5894) mapDefault!20383)) b!462027))

(assert (= start!41344 b!462024))

(declare-fun m!444547 () Bool)

(assert (=> b!462022 m!444547))

(declare-fun m!444549 () Bool)

(assert (=> start!41344 m!444549))

(declare-fun m!444551 () Bool)

(assert (=> start!41344 m!444551))

(declare-fun m!444553 () Bool)

(assert (=> start!41344 m!444553))

(declare-fun m!444555 () Bool)

(assert (=> b!462025 m!444555))

(declare-fun m!444557 () Bool)

(assert (=> mapNonEmpty!20383 m!444557))

(check-sat (not b!462022) (not mapNonEmpty!20383) tp_is_empty!12475 (not start!41344) (not b!462025))
(check-sat)
