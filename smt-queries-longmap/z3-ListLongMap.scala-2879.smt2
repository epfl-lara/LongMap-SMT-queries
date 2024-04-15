; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41380 () Bool)

(assert start!41380)

(declare-fun b!462346 () Bool)

(declare-fun e!269819 () Bool)

(declare-fun e!269821 () Bool)

(declare-fun mapRes!20437 () Bool)

(assert (=> b!462346 (= e!269819 (and e!269821 mapRes!20437))))

(declare-fun condMapEmpty!20437 () Bool)

(declare-datatypes ((V!17787 0))(
  ( (V!17788 (val!6300 Int)) )
))
(declare-datatypes ((ValueCell!5912 0))(
  ( (ValueCellFull!5912 (v!8581 V!17787)) (EmptyCell!5912) )
))
(declare-datatypes ((array!28817 0))(
  ( (array!28818 (arr!13842 (Array (_ BitVec 32) ValueCell!5912)) (size!14195 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28817)

(declare-fun mapDefault!20437 () ValueCell!5912)

(assert (=> b!462346 (= condMapEmpty!20437 (= (arr!13842 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5912)) mapDefault!20437)))))

(declare-fun mapNonEmpty!20437 () Bool)

(declare-fun tp!39256 () Bool)

(declare-fun e!269822 () Bool)

(assert (=> mapNonEmpty!20437 (= mapRes!20437 (and tp!39256 e!269822))))

(declare-fun mapValue!20437 () ValueCell!5912)

(declare-fun mapRest!20437 () (Array (_ BitVec 32) ValueCell!5912))

(declare-fun mapKey!20437 () (_ BitVec 32))

(assert (=> mapNonEmpty!20437 (= (arr!13842 _values!833) (store mapRest!20437 mapKey!20437 mapValue!20437))))

(declare-fun mapIsEmpty!20437 () Bool)

(assert (=> mapIsEmpty!20437 mapRes!20437))

(declare-fun b!462347 () Bool)

(declare-fun res!276526 () Bool)

(declare-fun e!269820 () Bool)

(assert (=> b!462347 (=> (not res!276526) (not e!269820))))

(declare-datatypes ((array!28819 0))(
  ( (array!28820 (arr!13843 (Array (_ BitVec 32) (_ BitVec 64))) (size!14196 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28819)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28819 (_ BitVec 32)) Bool)

(assert (=> b!462347 (= res!276526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462348 () Bool)

(declare-fun tp_is_empty!12511 () Bool)

(assert (=> b!462348 (= e!269821 tp_is_empty!12511)))

(declare-fun b!462349 () Bool)

(assert (=> b!462349 (= e!269820 false)))

(declare-fun lt!209006 () Bool)

(declare-datatypes ((List!8372 0))(
  ( (Nil!8369) (Cons!8368 (h!9224 (_ BitVec 64)) (t!14307 List!8372)) )
))
(declare-fun arrayNoDuplicates!0 (array!28819 (_ BitVec 32) List!8372) Bool)

(assert (=> b!462349 (= lt!209006 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8369))))

(declare-fun res!276525 () Bool)

(assert (=> start!41380 (=> (not res!276525) (not e!269820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41380 (= res!276525 (validMask!0 mask!1365))))

(assert (=> start!41380 e!269820))

(assert (=> start!41380 true))

(declare-fun array_inv!10080 (array!28819) Bool)

(assert (=> start!41380 (array_inv!10080 _keys!1025)))

(declare-fun array_inv!10081 (array!28817) Bool)

(assert (=> start!41380 (and (array_inv!10081 _values!833) e!269819)))

(declare-fun b!462350 () Bool)

(declare-fun res!276527 () Bool)

(assert (=> b!462350 (=> (not res!276527) (not e!269820))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462350 (= res!276527 (and (= (size!14195 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14196 _keys!1025) (size!14195 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462351 () Bool)

(assert (=> b!462351 (= e!269822 tp_is_empty!12511)))

(assert (= (and start!41380 res!276525) b!462350))

(assert (= (and b!462350 res!276527) b!462347))

(assert (= (and b!462347 res!276526) b!462349))

(assert (= (and b!462346 condMapEmpty!20437) mapIsEmpty!20437))

(assert (= (and b!462346 (not condMapEmpty!20437)) mapNonEmpty!20437))

(get-info :version)

(assert (= (and mapNonEmpty!20437 ((_ is ValueCellFull!5912) mapValue!20437)) b!462351))

(assert (= (and b!462346 ((_ is ValueCellFull!5912) mapDefault!20437)) b!462348))

(assert (= start!41380 b!462346))

(declare-fun m!444763 () Bool)

(assert (=> mapNonEmpty!20437 m!444763))

(declare-fun m!444765 () Bool)

(assert (=> b!462347 m!444765))

(declare-fun m!444767 () Bool)

(assert (=> b!462349 m!444767))

(declare-fun m!444769 () Bool)

(assert (=> start!41380 m!444769))

(declare-fun m!444771 () Bool)

(assert (=> start!41380 m!444771))

(declare-fun m!444773 () Bool)

(assert (=> start!41380 m!444773))

(check-sat (not mapNonEmpty!20437) (not start!41380) (not b!462347) (not b!462349) tp_is_empty!12511)
(check-sat)
