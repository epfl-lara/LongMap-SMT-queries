; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41356 () Bool)

(assert start!41356)

(declare-fun res!276541 () Bool)

(declare-fun e!269774 () Bool)

(assert (=> start!41356 (=> (not res!276541) (not e!269774))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41356 (= res!276541 (validMask!0 mask!1365))))

(assert (=> start!41356 e!269774))

(assert (=> start!41356 true))

(declare-datatypes ((array!28776 0))(
  ( (array!28777 (arr!13821 (Array (_ BitVec 32) (_ BitVec 64))) (size!14173 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28776)

(declare-fun array_inv!10074 (array!28776) Bool)

(assert (=> start!41356 (array_inv!10074 _keys!1025)))

(declare-datatypes ((V!17755 0))(
  ( (V!17756 (val!6288 Int)) )
))
(declare-datatypes ((ValueCell!5900 0))(
  ( (ValueCellFull!5900 (v!8576 V!17755)) (EmptyCell!5900) )
))
(declare-datatypes ((array!28778 0))(
  ( (array!28779 (arr!13822 (Array (_ BitVec 32) ValueCell!5900)) (size!14174 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28778)

(declare-fun e!269778 () Bool)

(declare-fun array_inv!10075 (array!28778) Bool)

(assert (=> start!41356 (and (array_inv!10075 _values!833) e!269778)))

(declare-fun b!462340 () Bool)

(declare-fun e!269777 () Bool)

(declare-fun mapRes!20401 () Bool)

(assert (=> b!462340 (= e!269778 (and e!269777 mapRes!20401))))

(declare-fun condMapEmpty!20401 () Bool)

(declare-fun mapDefault!20401 () ValueCell!5900)

(assert (=> b!462340 (= condMapEmpty!20401 (= (arr!13822 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5900)) mapDefault!20401)))))

(declare-fun b!462341 () Bool)

(declare-fun res!276540 () Bool)

(assert (=> b!462341 (=> (not res!276540) (not e!269774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28776 (_ BitVec 32)) Bool)

(assert (=> b!462341 (= res!276540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462342 () Bool)

(declare-fun tp_is_empty!12487 () Bool)

(assert (=> b!462342 (= e!269777 tp_is_empty!12487)))

(declare-fun mapNonEmpty!20401 () Bool)

(declare-fun tp!39220 () Bool)

(declare-fun e!269776 () Bool)

(assert (=> mapNonEmpty!20401 (= mapRes!20401 (and tp!39220 e!269776))))

(declare-fun mapKey!20401 () (_ BitVec 32))

(declare-fun mapValue!20401 () ValueCell!5900)

(declare-fun mapRest!20401 () (Array (_ BitVec 32) ValueCell!5900))

(assert (=> mapNonEmpty!20401 (= (arr!13822 _values!833) (store mapRest!20401 mapKey!20401 mapValue!20401))))

(declare-fun b!462343 () Bool)

(assert (=> b!462343 (= e!269774 false)))

(declare-fun lt!209216 () Bool)

(declare-datatypes ((List!8267 0))(
  ( (Nil!8264) (Cons!8263 (h!9119 (_ BitVec 64)) (t!14203 List!8267)) )
))
(declare-fun arrayNoDuplicates!0 (array!28776 (_ BitVec 32) List!8267) Bool)

(assert (=> b!462343 (= lt!209216 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8264))))

(declare-fun mapIsEmpty!20401 () Bool)

(assert (=> mapIsEmpty!20401 mapRes!20401))

(declare-fun b!462344 () Bool)

(declare-fun res!276539 () Bool)

(assert (=> b!462344 (=> (not res!276539) (not e!269774))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462344 (= res!276539 (and (= (size!14174 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14173 _keys!1025) (size!14174 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462345 () Bool)

(assert (=> b!462345 (= e!269776 tp_is_empty!12487)))

(assert (= (and start!41356 res!276541) b!462344))

(assert (= (and b!462344 res!276539) b!462341))

(assert (= (and b!462341 res!276540) b!462343))

(assert (= (and b!462340 condMapEmpty!20401) mapIsEmpty!20401))

(assert (= (and b!462340 (not condMapEmpty!20401)) mapNonEmpty!20401))

(get-info :version)

(assert (= (and mapNonEmpty!20401 ((_ is ValueCellFull!5900) mapValue!20401)) b!462345))

(assert (= (and b!462340 ((_ is ValueCellFull!5900) mapDefault!20401)) b!462342))

(assert (= start!41356 b!462340))

(declare-fun m!445535 () Bool)

(assert (=> start!41356 m!445535))

(declare-fun m!445537 () Bool)

(assert (=> start!41356 m!445537))

(declare-fun m!445539 () Bool)

(assert (=> start!41356 m!445539))

(declare-fun m!445541 () Bool)

(assert (=> b!462341 m!445541))

(declare-fun m!445543 () Bool)

(assert (=> mapNonEmpty!20401 m!445543))

(declare-fun m!445545 () Bool)

(assert (=> b!462343 m!445545))

(check-sat (not b!462341) (not mapNonEmpty!20401) (not start!41356) (not b!462343) tp_is_empty!12487)
(check-sat)
