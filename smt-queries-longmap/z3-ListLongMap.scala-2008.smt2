; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35030 () Bool)

(assert start!35030)

(declare-fun b_free!7719 () Bool)

(declare-fun b_next!7719 () Bool)

(assert (=> start!35030 (= b_free!7719 (not b_next!7719))))

(declare-fun tp!26735 () Bool)

(declare-fun b_and!14949 () Bool)

(assert (=> start!35030 (= tp!26735 b_and!14949)))

(declare-fun res!194683 () Bool)

(declare-fun e!215029 () Bool)

(assert (=> start!35030 (=> (not res!194683) (not e!215029))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35030 (= res!194683 (validMask!0 mask!2385))))

(assert (=> start!35030 e!215029))

(assert (=> start!35030 true))

(declare-fun tp_is_empty!7671 () Bool)

(assert (=> start!35030 tp_is_empty!7671))

(assert (=> start!35030 tp!26735))

(declare-datatypes ((V!11205 0))(
  ( (V!11206 (val!3880 Int)) )
))
(declare-datatypes ((ValueCell!3492 0))(
  ( (ValueCellFull!3492 (v!6067 V!11205)) (EmptyCell!3492) )
))
(declare-datatypes ((array!18929 0))(
  ( (array!18930 (arr!8970 (Array (_ BitVec 32) ValueCell!3492)) (size!9322 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18929)

(declare-fun e!215025 () Bool)

(declare-fun array_inv!6622 (array!18929) Bool)

(assert (=> start!35030 (and (array_inv!6622 _values!1525) e!215025)))

(declare-datatypes ((array!18931 0))(
  ( (array!18932 (arr!8971 (Array (_ BitVec 32) (_ BitVec 64))) (size!9323 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18931)

(declare-fun array_inv!6623 (array!18931) Bool)

(assert (=> start!35030 (array_inv!6623 _keys!1895)))

(declare-fun b!351107 () Bool)

(declare-fun e!215027 () Bool)

(assert (=> b!351107 (= e!215027 tp_is_empty!7671)))

(declare-fun b!351108 () Bool)

(declare-fun e!215024 () Bool)

(assert (=> b!351108 (= e!215029 e!215024)))

(declare-fun res!194685 () Bool)

(assert (=> b!351108 (=> (not res!194685) (not e!215024))))

(declare-datatypes ((SeekEntryResult!3452 0))(
  ( (MissingZero!3452 (index!15987 (_ BitVec 32))) (Found!3452 (index!15988 (_ BitVec 32))) (Intermediate!3452 (undefined!4264 Bool) (index!15989 (_ BitVec 32)) (x!34948 (_ BitVec 32))) (Undefined!3452) (MissingVacant!3452 (index!15990 (_ BitVec 32))) )
))
(declare-fun lt!164703 () SeekEntryResult!3452)

(get-info :version)

(assert (=> b!351108 (= res!194685 (and (not ((_ is Found!3452) lt!164703)) (not ((_ is MissingZero!3452) lt!164703)) ((_ is MissingVacant!3452) lt!164703)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18931 (_ BitVec 32)) SeekEntryResult!3452)

(assert (=> b!351108 (= lt!164703 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12978 () Bool)

(declare-fun mapRes!12978 () Bool)

(declare-fun tp!26736 () Bool)

(declare-fun e!215026 () Bool)

(assert (=> mapNonEmpty!12978 (= mapRes!12978 (and tp!26736 e!215026))))

(declare-fun mapKey!12978 () (_ BitVec 32))

(declare-fun mapValue!12978 () ValueCell!3492)

(declare-fun mapRest!12978 () (Array (_ BitVec 32) ValueCell!3492))

(assert (=> mapNonEmpty!12978 (= (arr!8970 _values!1525) (store mapRest!12978 mapKey!12978 mapValue!12978))))

(declare-fun b!351109 () Bool)

(assert (=> b!351109 (= e!215025 (and e!215027 mapRes!12978))))

(declare-fun condMapEmpty!12978 () Bool)

(declare-fun mapDefault!12978 () ValueCell!3492)

(assert (=> b!351109 (= condMapEmpty!12978 (= (arr!8970 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3492)) mapDefault!12978)))))

(declare-fun b!351110 () Bool)

(declare-fun res!194687 () Bool)

(assert (=> b!351110 (=> (not res!194687) (not e!215029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18931 (_ BitVec 32)) Bool)

(assert (=> b!351110 (= res!194687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!351111 () Bool)

(declare-fun res!194686 () Bool)

(assert (=> b!351111 (=> (not res!194686) (not e!215024))))

(declare-fun arrayContainsKey!0 (array!18931 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!351111 (= res!194686 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351112 () Bool)

(assert (=> b!351112 (= e!215024 false)))

(declare-fun lt!164704 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18931 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351112 (= lt!164704 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!351113 () Bool)

(declare-fun res!194681 () Bool)

(assert (=> b!351113 (=> (not res!194681) (not e!215029))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!351113 (= res!194681 (and (= (size!9322 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9323 _keys!1895) (size!9322 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!351114 () Bool)

(declare-fun res!194684 () Bool)

(assert (=> b!351114 (=> (not res!194684) (not e!215029))))

(declare-datatypes ((List!5219 0))(
  ( (Nil!5216) (Cons!5215 (h!6071 (_ BitVec 64)) (t!10357 List!5219)) )
))
(declare-fun arrayNoDuplicates!0 (array!18931 (_ BitVec 32) List!5219) Bool)

(assert (=> b!351114 (= res!194684 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5216))))

(declare-fun b!351115 () Bool)

(declare-fun res!194688 () Bool)

(assert (=> b!351115 (=> (not res!194688) (not e!215029))))

(declare-fun zeroValue!1467 () V!11205)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!11205)

(declare-datatypes ((tuple2!5600 0))(
  ( (tuple2!5601 (_1!2811 (_ BitVec 64)) (_2!2811 V!11205)) )
))
(declare-datatypes ((List!5220 0))(
  ( (Nil!5217) (Cons!5216 (h!6072 tuple2!5600) (t!10358 List!5220)) )
))
(declare-datatypes ((ListLongMap!4513 0))(
  ( (ListLongMap!4514 (toList!2272 List!5220)) )
))
(declare-fun contains!2341 (ListLongMap!4513 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1793 (array!18931 array!18929 (_ BitVec 32) (_ BitVec 32) V!11205 V!11205 (_ BitVec 32) Int) ListLongMap!4513)

(assert (=> b!351115 (= res!194688 (not (contains!2341 (getCurrentListMap!1793 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!351116 () Bool)

(declare-fun res!194682 () Bool)

(assert (=> b!351116 (=> (not res!194682) (not e!215029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!351116 (= res!194682 (validKeyInArray!0 k0!1348))))

(declare-fun b!351117 () Bool)

(assert (=> b!351117 (= e!215026 tp_is_empty!7671)))

(declare-fun mapIsEmpty!12978 () Bool)

(assert (=> mapIsEmpty!12978 mapRes!12978))

(assert (= (and start!35030 res!194683) b!351113))

(assert (= (and b!351113 res!194681) b!351110))

(assert (= (and b!351110 res!194687) b!351114))

(assert (= (and b!351114 res!194684) b!351116))

(assert (= (and b!351116 res!194682) b!351115))

(assert (= (and b!351115 res!194688) b!351108))

(assert (= (and b!351108 res!194685) b!351111))

(assert (= (and b!351111 res!194686) b!351112))

(assert (= (and b!351109 condMapEmpty!12978) mapIsEmpty!12978))

(assert (= (and b!351109 (not condMapEmpty!12978)) mapNonEmpty!12978))

(assert (= (and mapNonEmpty!12978 ((_ is ValueCellFull!3492) mapValue!12978)) b!351117))

(assert (= (and b!351109 ((_ is ValueCellFull!3492) mapDefault!12978)) b!351107))

(assert (= start!35030 b!351109))

(declare-fun m!351121 () Bool)

(assert (=> b!351108 m!351121))

(declare-fun m!351123 () Bool)

(assert (=> b!351116 m!351123))

(declare-fun m!351125 () Bool)

(assert (=> b!351114 m!351125))

(declare-fun m!351127 () Bool)

(assert (=> mapNonEmpty!12978 m!351127))

(declare-fun m!351129 () Bool)

(assert (=> b!351111 m!351129))

(declare-fun m!351131 () Bool)

(assert (=> b!351110 m!351131))

(declare-fun m!351133 () Bool)

(assert (=> start!35030 m!351133))

(declare-fun m!351135 () Bool)

(assert (=> start!35030 m!351135))

(declare-fun m!351137 () Bool)

(assert (=> start!35030 m!351137))

(declare-fun m!351139 () Bool)

(assert (=> b!351112 m!351139))

(declare-fun m!351141 () Bool)

(assert (=> b!351115 m!351141))

(assert (=> b!351115 m!351141))

(declare-fun m!351143 () Bool)

(assert (=> b!351115 m!351143))

(check-sat (not b_next!7719) (not b!351114) (not mapNonEmpty!12978) (not b!351112) (not b!351111) (not b!351110) (not b!351108) (not b!351115) b_and!14949 (not b!351116) (not start!35030) tp_is_empty!7671)
(check-sat b_and!14949 (not b_next!7719))
