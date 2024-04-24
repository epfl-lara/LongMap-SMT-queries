; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42106 () Bool)

(assert start!42106)

(declare-fun b_free!11653 () Bool)

(declare-fun b_next!11653 () Bool)

(assert (=> start!42106 (= b_free!11653 (not b_next!11653))))

(declare-fun tp!40980 () Bool)

(declare-fun b_and!20085 () Bool)

(assert (=> start!42106 (= tp!40980 b_and!20085)))

(declare-fun b!470176 () Bool)

(declare-fun e!275415 () Bool)

(declare-fun e!275416 () Bool)

(declare-fun mapRes!21322 () Bool)

(assert (=> b!470176 (= e!275415 (and e!275416 mapRes!21322))))

(declare-fun condMapEmpty!21322 () Bool)

(declare-datatypes ((V!18547 0))(
  ( (V!18548 (val!6585 Int)) )
))
(declare-datatypes ((ValueCell!6197 0))(
  ( (ValueCellFull!6197 (v!8877 V!18547)) (EmptyCell!6197) )
))
(declare-datatypes ((array!29920 0))(
  ( (array!29921 (arr!14383 (Array (_ BitVec 32) ValueCell!6197)) (size!14735 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29920)

(declare-fun mapDefault!21322 () ValueCell!6197)

(assert (=> b!470176 (= condMapEmpty!21322 (= (arr!14383 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6197)) mapDefault!21322)))))

(declare-fun mapNonEmpty!21322 () Bool)

(declare-fun tp!40981 () Bool)

(declare-fun e!275413 () Bool)

(assert (=> mapNonEmpty!21322 (= mapRes!21322 (and tp!40981 e!275413))))

(declare-fun mapKey!21322 () (_ BitVec 32))

(declare-fun mapValue!21322 () ValueCell!6197)

(declare-fun mapRest!21322 () (Array (_ BitVec 32) ValueCell!6197))

(assert (=> mapNonEmpty!21322 (= (arr!14383 _values!833) (store mapRest!21322 mapKey!21322 mapValue!21322))))

(declare-fun b!470177 () Bool)

(declare-fun tp_is_empty!13081 () Bool)

(assert (=> b!470177 (= e!275413 tp_is_empty!13081)))

(declare-fun b!470178 () Bool)

(declare-fun res!280976 () Bool)

(declare-fun e!275414 () Bool)

(assert (=> b!470178 (=> (not res!280976) (not e!275414))))

(declare-datatypes ((array!29922 0))(
  ( (array!29923 (arr!14384 (Array (_ BitVec 32) (_ BitVec 64))) (size!14736 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29922)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29922 (_ BitVec 32)) Bool)

(assert (=> b!470178 (= res!280976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470179 () Bool)

(declare-fun res!280977 () Bool)

(assert (=> b!470179 (=> (not res!280977) (not e!275414))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!470179 (= res!280977 (and (= (size!14735 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14736 _keys!1025) (size!14735 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!280979 () Bool)

(assert (=> start!42106 (=> (not res!280979) (not e!275414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42106 (= res!280979 (validMask!0 mask!1365))))

(assert (=> start!42106 e!275414))

(assert (=> start!42106 tp_is_empty!13081))

(assert (=> start!42106 tp!40980))

(assert (=> start!42106 true))

(declare-fun array_inv!10468 (array!29922) Bool)

(assert (=> start!42106 (array_inv!10468 _keys!1025)))

(declare-fun array_inv!10469 (array!29920) Bool)

(assert (=> start!42106 (and (array_inv!10469 _values!833) e!275415)))

(declare-fun b!470180 () Bool)

(assert (=> b!470180 (= e!275414 (not true))))

(declare-datatypes ((tuple2!8594 0))(
  ( (tuple2!8595 (_1!4308 (_ BitVec 64)) (_2!4308 V!18547)) )
))
(declare-datatypes ((List!8667 0))(
  ( (Nil!8664) (Cons!8663 (h!9519 tuple2!8594) (t!14621 List!8667)) )
))
(declare-datatypes ((ListLongMap!7509 0))(
  ( (ListLongMap!7510 (toList!3770 List!8667)) )
))
(declare-fun lt!213379 () ListLongMap!7509)

(declare-fun lt!213380 () ListLongMap!7509)

(assert (=> b!470180 (= lt!213379 lt!213380)))

(declare-fun zeroValue!794 () V!18547)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueBefore!38 () V!18547)

(declare-datatypes ((Unit!13753 0))(
  ( (Unit!13754) )
))
(declare-fun lt!213381 () Unit!13753)

(declare-fun minValueAfter!38 () V!18547)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!145 (array!29922 array!29920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18547 V!18547 V!18547 V!18547 (_ BitVec 32) Int) Unit!13753)

(assert (=> b!470180 (= lt!213381 (lemmaNoChangeToArrayThenSameMapNoExtras!145 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1985 (array!29922 array!29920 (_ BitVec 32) (_ BitVec 32) V!18547 V!18547 (_ BitVec 32) Int) ListLongMap!7509)

(assert (=> b!470180 (= lt!213380 (getCurrentListMapNoExtraKeys!1985 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470180 (= lt!213379 (getCurrentListMapNoExtraKeys!1985 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21322 () Bool)

(assert (=> mapIsEmpty!21322 mapRes!21322))

(declare-fun b!470181 () Bool)

(assert (=> b!470181 (= e!275416 tp_is_empty!13081)))

(declare-fun b!470182 () Bool)

(declare-fun res!280978 () Bool)

(assert (=> b!470182 (=> (not res!280978) (not e!275414))))

(declare-datatypes ((List!8668 0))(
  ( (Nil!8665) (Cons!8664 (h!9520 (_ BitVec 64)) (t!14622 List!8668)) )
))
(declare-fun arrayNoDuplicates!0 (array!29922 (_ BitVec 32) List!8668) Bool)

(assert (=> b!470182 (= res!280978 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8665))))

(assert (= (and start!42106 res!280979) b!470179))

(assert (= (and b!470179 res!280977) b!470178))

(assert (= (and b!470178 res!280976) b!470182))

(assert (= (and b!470182 res!280978) b!470180))

(assert (= (and b!470176 condMapEmpty!21322) mapIsEmpty!21322))

(assert (= (and b!470176 (not condMapEmpty!21322)) mapNonEmpty!21322))

(get-info :version)

(assert (= (and mapNonEmpty!21322 ((_ is ValueCellFull!6197) mapValue!21322)) b!470177))

(assert (= (and b!470176 ((_ is ValueCellFull!6197) mapDefault!21322)) b!470181))

(assert (= start!42106 b!470176))

(declare-fun m!452737 () Bool)

(assert (=> mapNonEmpty!21322 m!452737))

(declare-fun m!452739 () Bool)

(assert (=> start!42106 m!452739))

(declare-fun m!452741 () Bool)

(assert (=> start!42106 m!452741))

(declare-fun m!452743 () Bool)

(assert (=> start!42106 m!452743))

(declare-fun m!452745 () Bool)

(assert (=> b!470178 m!452745))

(declare-fun m!452747 () Bool)

(assert (=> b!470182 m!452747))

(declare-fun m!452749 () Bool)

(assert (=> b!470180 m!452749))

(declare-fun m!452751 () Bool)

(assert (=> b!470180 m!452751))

(declare-fun m!452753 () Bool)

(assert (=> b!470180 m!452753))

(check-sat (not b!470178) b_and!20085 (not start!42106) (not b!470182) tp_is_empty!13081 (not mapNonEmpty!21322) (not b_next!11653) (not b!470180))
(check-sat b_and!20085 (not b_next!11653))
