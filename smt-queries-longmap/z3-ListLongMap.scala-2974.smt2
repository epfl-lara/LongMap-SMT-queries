; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42106 () Bool)

(assert start!42106)

(declare-fun b_free!11653 () Bool)

(declare-fun b_next!11653 () Bool)

(assert (=> start!42106 (= b_free!11653 (not b_next!11653))))

(declare-fun tp!40980 () Bool)

(declare-fun b_and!20049 () Bool)

(assert (=> start!42106 (= tp!40980 b_and!20049)))

(declare-fun res!280854 () Bool)

(declare-fun e!275279 () Bool)

(assert (=> start!42106 (=> (not res!280854) (not e!275279))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42106 (= res!280854 (validMask!0 mask!1365))))

(assert (=> start!42106 e!275279))

(declare-fun tp_is_empty!13081 () Bool)

(assert (=> start!42106 tp_is_empty!13081))

(assert (=> start!42106 tp!40980))

(assert (=> start!42106 true))

(declare-datatypes ((array!29917 0))(
  ( (array!29918 (arr!14382 (Array (_ BitVec 32) (_ BitVec 64))) (size!14735 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29917)

(declare-fun array_inv!10462 (array!29917) Bool)

(assert (=> start!42106 (array_inv!10462 _keys!1025)))

(declare-datatypes ((V!18547 0))(
  ( (V!18548 (val!6585 Int)) )
))
(declare-datatypes ((ValueCell!6197 0))(
  ( (ValueCellFull!6197 (v!8870 V!18547)) (EmptyCell!6197) )
))
(declare-datatypes ((array!29919 0))(
  ( (array!29920 (arr!14383 (Array (_ BitVec 32) ValueCell!6197)) (size!14736 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29919)

(declare-fun e!275280 () Bool)

(declare-fun array_inv!10463 (array!29919) Bool)

(assert (=> start!42106 (and (array_inv!10463 _values!833) e!275280)))

(declare-fun mapNonEmpty!21322 () Bool)

(declare-fun mapRes!21322 () Bool)

(declare-fun tp!40981 () Bool)

(declare-fun e!275281 () Bool)

(assert (=> mapNonEmpty!21322 (= mapRes!21322 (and tp!40981 e!275281))))

(declare-fun mapValue!21322 () ValueCell!6197)

(declare-fun mapRest!21322 () (Array (_ BitVec 32) ValueCell!6197))

(declare-fun mapKey!21322 () (_ BitVec 32))

(assert (=> mapNonEmpty!21322 (= (arr!14383 _values!833) (store mapRest!21322 mapKey!21322 mapValue!21322))))

(declare-fun b!469966 () Bool)

(declare-fun e!275277 () Bool)

(assert (=> b!469966 (= e!275277 tp_is_empty!13081)))

(declare-fun mapIsEmpty!21322 () Bool)

(assert (=> mapIsEmpty!21322 mapRes!21322))

(declare-fun b!469967 () Bool)

(assert (=> b!469967 (= e!275281 tp_is_empty!13081)))

(declare-fun b!469968 () Bool)

(assert (=> b!469968 (= e!275280 (and e!275277 mapRes!21322))))

(declare-fun condMapEmpty!21322 () Bool)

(declare-fun mapDefault!21322 () ValueCell!6197)

(assert (=> b!469968 (= condMapEmpty!21322 (= (arr!14383 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6197)) mapDefault!21322)))))

(declare-fun b!469969 () Bool)

(declare-fun res!280857 () Bool)

(assert (=> b!469969 (=> (not res!280857) (not e!275279))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29917 (_ BitVec 32)) Bool)

(assert (=> b!469969 (= res!280857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!469970 () Bool)

(declare-fun res!280855 () Bool)

(assert (=> b!469970 (=> (not res!280855) (not e!275279))))

(declare-datatypes ((List!8778 0))(
  ( (Nil!8775) (Cons!8774 (h!9630 (_ BitVec 64)) (t!14731 List!8778)) )
))
(declare-fun arrayNoDuplicates!0 (array!29917 (_ BitVec 32) List!8778) Bool)

(assert (=> b!469970 (= res!280855 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8775))))

(declare-fun b!469971 () Bool)

(assert (=> b!469971 (= e!275279 (not true))))

(declare-datatypes ((tuple2!8708 0))(
  ( (tuple2!8709 (_1!4365 (_ BitVec 64)) (_2!4365 V!18547)) )
))
(declare-datatypes ((List!8779 0))(
  ( (Nil!8776) (Cons!8775 (h!9631 tuple2!8708) (t!14732 List!8779)) )
))
(declare-datatypes ((ListLongMap!7611 0))(
  ( (ListLongMap!7612 (toList!3821 List!8779)) )
))
(declare-fun lt!213135 () ListLongMap!7611)

(declare-fun lt!213133 () ListLongMap!7611)

(assert (=> b!469971 (= lt!213135 lt!213133)))

(declare-fun minValueBefore!38 () V!18547)

(declare-fun zeroValue!794 () V!18547)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13743 0))(
  ( (Unit!13744) )
))
(declare-fun lt!213134 () Unit!13743)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18547)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!153 (array!29917 array!29919 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18547 V!18547 V!18547 V!18547 (_ BitVec 32) Int) Unit!13743)

(assert (=> b!469971 (= lt!213134 (lemmaNoChangeToArrayThenSameMapNoExtras!153 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1996 (array!29917 array!29919 (_ BitVec 32) (_ BitVec 32) V!18547 V!18547 (_ BitVec 32) Int) ListLongMap!7611)

(assert (=> b!469971 (= lt!213133 (getCurrentListMapNoExtraKeys!1996 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469971 (= lt!213135 (getCurrentListMapNoExtraKeys!1996 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469972 () Bool)

(declare-fun res!280856 () Bool)

(assert (=> b!469972 (=> (not res!280856) (not e!275279))))

(assert (=> b!469972 (= res!280856 (and (= (size!14736 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14735 _keys!1025) (size!14736 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42106 res!280854) b!469972))

(assert (= (and b!469972 res!280856) b!469969))

(assert (= (and b!469969 res!280857) b!469970))

(assert (= (and b!469970 res!280855) b!469971))

(assert (= (and b!469968 condMapEmpty!21322) mapIsEmpty!21322))

(assert (= (and b!469968 (not condMapEmpty!21322)) mapNonEmpty!21322))

(get-info :version)

(assert (= (and mapNonEmpty!21322 ((_ is ValueCellFull!6197) mapValue!21322)) b!469967))

(assert (= (and b!469968 ((_ is ValueCellFull!6197) mapDefault!21322)) b!469966))

(assert (= start!42106 b!469968))

(declare-fun m!451821 () Bool)

(assert (=> b!469971 m!451821))

(declare-fun m!451823 () Bool)

(assert (=> b!469971 m!451823))

(declare-fun m!451825 () Bool)

(assert (=> b!469971 m!451825))

(declare-fun m!451827 () Bool)

(assert (=> b!469969 m!451827))

(declare-fun m!451829 () Bool)

(assert (=> b!469970 m!451829))

(declare-fun m!451831 () Bool)

(assert (=> mapNonEmpty!21322 m!451831))

(declare-fun m!451833 () Bool)

(assert (=> start!42106 m!451833))

(declare-fun m!451835 () Bool)

(assert (=> start!42106 m!451835))

(declare-fun m!451837 () Bool)

(assert (=> start!42106 m!451837))

(check-sat (not mapNonEmpty!21322) (not b!469970) (not b_next!11653) (not b!469969) (not start!42106) tp_is_empty!13081 b_and!20049 (not b!469971))
(check-sat b_and!20049 (not b_next!11653))
