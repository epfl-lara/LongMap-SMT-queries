; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41420 () Bool)

(assert start!41420)

(declare-fun b_free!11113 () Bool)

(declare-fun b_next!11113 () Bool)

(assert (=> start!41420 (= b_free!11113 (not b_next!11113))))

(declare-fun tp!39333 () Bool)

(declare-fun b_and!19423 () Bool)

(assert (=> start!41420 (= tp!39333 b_and!19423)))

(declare-fun b!462689 () Bool)

(declare-fun e!270074 () Bool)

(declare-fun tp_is_empty!12541 () Bool)

(assert (=> b!462689 (= e!270074 tp_is_empty!12541)))

(declare-fun res!276715 () Bool)

(declare-fun e!270071 () Bool)

(assert (=> start!41420 (=> (not res!276715) (not e!270071))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41420 (= res!276715 (validMask!0 mask!1365))))

(assert (=> start!41420 e!270071))

(assert (=> start!41420 tp_is_empty!12541))

(assert (=> start!41420 tp!39333))

(assert (=> start!41420 true))

(declare-datatypes ((array!28877 0))(
  ( (array!28878 (arr!13871 (Array (_ BitVec 32) (_ BitVec 64))) (size!14224 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28877)

(declare-fun array_inv!10098 (array!28877) Bool)

(assert (=> start!41420 (array_inv!10098 _keys!1025)))

(declare-datatypes ((V!17827 0))(
  ( (V!17828 (val!6315 Int)) )
))
(declare-datatypes ((ValueCell!5927 0))(
  ( (ValueCellFull!5927 (v!8596 V!17827)) (EmptyCell!5927) )
))
(declare-datatypes ((array!28879 0))(
  ( (array!28880 (arr!13872 (Array (_ BitVec 32) ValueCell!5927)) (size!14225 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28879)

(declare-fun e!270072 () Bool)

(declare-fun array_inv!10099 (array!28879) Bool)

(assert (=> start!41420 (and (array_inv!10099 _values!833) e!270072)))

(declare-fun b!462690 () Bool)

(declare-fun res!276714 () Bool)

(assert (=> b!462690 (=> (not res!276714) (not e!270071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28877 (_ BitVec 32)) Bool)

(assert (=> b!462690 (= res!276714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462691 () Bool)

(declare-fun res!276716 () Bool)

(assert (=> b!462691 (=> (not res!276716) (not e!270071))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462691 (= res!276716 (and (= (size!14225 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14224 _keys!1025) (size!14225 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20485 () Bool)

(declare-fun mapRes!20485 () Bool)

(declare-fun tp!39334 () Bool)

(declare-fun e!270075 () Bool)

(assert (=> mapNonEmpty!20485 (= mapRes!20485 (and tp!39334 e!270075))))

(declare-fun mapValue!20485 () ValueCell!5927)

(declare-fun mapKey!20485 () (_ BitVec 32))

(declare-fun mapRest!20485 () (Array (_ BitVec 32) ValueCell!5927))

(assert (=> mapNonEmpty!20485 (= (arr!13872 _values!833) (store mapRest!20485 mapKey!20485 mapValue!20485))))

(declare-fun b!462692 () Bool)

(assert (=> b!462692 (= e!270071 false)))

(declare-fun minValueBefore!38 () V!17827)

(declare-fun zeroValue!794 () V!17827)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8306 0))(
  ( (tuple2!8307 (_1!4164 (_ BitVec 64)) (_2!4164 V!17827)) )
))
(declare-datatypes ((List!8392 0))(
  ( (Nil!8389) (Cons!8388 (h!9244 tuple2!8306) (t!14327 List!8392)) )
))
(declare-datatypes ((ListLongMap!7209 0))(
  ( (ListLongMap!7210 (toList!3620 List!8392)) )
))
(declare-fun lt!209051 () ListLongMap!7209)

(declare-fun getCurrentListMapNoExtraKeys!1812 (array!28877 array!28879 (_ BitVec 32) (_ BitVec 32) V!17827 V!17827 (_ BitVec 32) Int) ListLongMap!7209)

(assert (=> b!462692 (= lt!209051 (getCurrentListMapNoExtraKeys!1812 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!462693 () Bool)

(assert (=> b!462693 (= e!270075 tp_is_empty!12541)))

(declare-fun b!462694 () Bool)

(declare-fun res!276713 () Bool)

(assert (=> b!462694 (=> (not res!276713) (not e!270071))))

(declare-datatypes ((List!8393 0))(
  ( (Nil!8390) (Cons!8389 (h!9245 (_ BitVec 64)) (t!14328 List!8393)) )
))
(declare-fun arrayNoDuplicates!0 (array!28877 (_ BitVec 32) List!8393) Bool)

(assert (=> b!462694 (= res!276713 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8390))))

(declare-fun b!462695 () Bool)

(assert (=> b!462695 (= e!270072 (and e!270074 mapRes!20485))))

(declare-fun condMapEmpty!20485 () Bool)

(declare-fun mapDefault!20485 () ValueCell!5927)

(assert (=> b!462695 (= condMapEmpty!20485 (= (arr!13872 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5927)) mapDefault!20485)))))

(declare-fun mapIsEmpty!20485 () Bool)

(assert (=> mapIsEmpty!20485 mapRes!20485))

(assert (= (and start!41420 res!276715) b!462691))

(assert (= (and b!462691 res!276716) b!462690))

(assert (= (and b!462690 res!276714) b!462694))

(assert (= (and b!462694 res!276713) b!462692))

(assert (= (and b!462695 condMapEmpty!20485) mapIsEmpty!20485))

(assert (= (and b!462695 (not condMapEmpty!20485)) mapNonEmpty!20485))

(get-info :version)

(assert (= (and mapNonEmpty!20485 ((_ is ValueCellFull!5927) mapValue!20485)) b!462693))

(assert (= (and b!462695 ((_ is ValueCellFull!5927) mapDefault!20485)) b!462689))

(assert (= start!41420 b!462695))

(declare-fun m!444979 () Bool)

(assert (=> b!462690 m!444979))

(declare-fun m!444981 () Bool)

(assert (=> start!41420 m!444981))

(declare-fun m!444983 () Bool)

(assert (=> start!41420 m!444983))

(declare-fun m!444985 () Bool)

(assert (=> start!41420 m!444985))

(declare-fun m!444987 () Bool)

(assert (=> mapNonEmpty!20485 m!444987))

(declare-fun m!444989 () Bool)

(assert (=> b!462694 m!444989))

(declare-fun m!444991 () Bool)

(assert (=> b!462692 m!444991))

(check-sat tp_is_empty!12541 (not b!462692) (not start!41420) (not b!462690) (not mapNonEmpty!20485) (not b_next!11113) b_and!19423 (not b!462694))
(check-sat b_and!19423 (not b_next!11113))
