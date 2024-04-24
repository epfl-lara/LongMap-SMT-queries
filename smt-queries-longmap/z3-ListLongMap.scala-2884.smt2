; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41420 () Bool)

(assert start!41420)

(declare-fun b_free!11113 () Bool)

(declare-fun b_next!11113 () Bool)

(assert (=> start!41420 (= b_free!11113 (not b_next!11113))))

(declare-fun tp!39333 () Bool)

(declare-fun b_and!19459 () Bool)

(assert (=> start!41420 (= tp!39333 b_and!19459)))

(declare-fun b!462899 () Bool)

(declare-fun e!270210 () Bool)

(assert (=> b!462899 (= e!270210 false)))

(declare-datatypes ((V!17827 0))(
  ( (V!17828 (val!6315 Int)) )
))
(declare-fun minValueBefore!38 () V!17827)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!28878 0))(
  ( (array!28879 (arr!13871 (Array (_ BitVec 32) (_ BitVec 64))) (size!14223 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28878)

(declare-datatypes ((ValueCell!5927 0))(
  ( (ValueCellFull!5927 (v!8603 V!17827)) (EmptyCell!5927) )
))
(declare-datatypes ((array!28880 0))(
  ( (array!28881 (arr!13872 (Array (_ BitVec 32) ValueCell!5927)) (size!14224 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28880)

(declare-fun zeroValue!794 () V!17827)

(declare-datatypes ((tuple2!8208 0))(
  ( (tuple2!8209 (_1!4115 (_ BitVec 64)) (_2!4115 V!17827)) )
))
(declare-datatypes ((List!8290 0))(
  ( (Nil!8287) (Cons!8286 (h!9142 tuple2!8208) (t!14226 List!8290)) )
))
(declare-datatypes ((ListLongMap!7123 0))(
  ( (ListLongMap!7124 (toList!3577 List!8290)) )
))
(declare-fun lt!209297 () ListLongMap!7123)

(declare-fun getCurrentListMapNoExtraKeys!1804 (array!28878 array!28880 (_ BitVec 32) (_ BitVec 32) V!17827 V!17827 (_ BitVec 32) Int) ListLongMap!7123)

(assert (=> b!462899 (= lt!209297 (getCurrentListMapNoExtraKeys!1804 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!462900 () Bool)

(declare-fun e!270207 () Bool)

(declare-fun e!270209 () Bool)

(declare-fun mapRes!20485 () Bool)

(assert (=> b!462900 (= e!270207 (and e!270209 mapRes!20485))))

(declare-fun condMapEmpty!20485 () Bool)

(declare-fun mapDefault!20485 () ValueCell!5927)

(assert (=> b!462900 (= condMapEmpty!20485 (= (arr!13872 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5927)) mapDefault!20485)))))

(declare-fun b!462901 () Bool)

(declare-fun tp_is_empty!12541 () Bool)

(assert (=> b!462901 (= e!270209 tp_is_empty!12541)))

(declare-fun b!462902 () Bool)

(declare-fun res!276838 () Bool)

(assert (=> b!462902 (=> (not res!276838) (not e!270210))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28878 (_ BitVec 32)) Bool)

(assert (=> b!462902 (= res!276838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462903 () Bool)

(declare-fun res!276835 () Bool)

(assert (=> b!462903 (=> (not res!276835) (not e!270210))))

(declare-datatypes ((List!8291 0))(
  ( (Nil!8288) (Cons!8287 (h!9143 (_ BitVec 64)) (t!14227 List!8291)) )
))
(declare-fun arrayNoDuplicates!0 (array!28878 (_ BitVec 32) List!8291) Bool)

(assert (=> b!462903 (= res!276835 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8288))))

(declare-fun mapNonEmpty!20485 () Bool)

(declare-fun tp!39334 () Bool)

(declare-fun e!270208 () Bool)

(assert (=> mapNonEmpty!20485 (= mapRes!20485 (and tp!39334 e!270208))))

(declare-fun mapValue!20485 () ValueCell!5927)

(declare-fun mapRest!20485 () (Array (_ BitVec 32) ValueCell!5927))

(declare-fun mapKey!20485 () (_ BitVec 32))

(assert (=> mapNonEmpty!20485 (= (arr!13872 _values!833) (store mapRest!20485 mapKey!20485 mapValue!20485))))

(declare-fun b!462904 () Bool)

(declare-fun res!276837 () Bool)

(assert (=> b!462904 (=> (not res!276837) (not e!270210))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462904 (= res!276837 (and (= (size!14224 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14223 _keys!1025) (size!14224 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20485 () Bool)

(assert (=> mapIsEmpty!20485 mapRes!20485))

(declare-fun res!276836 () Bool)

(assert (=> start!41420 (=> (not res!276836) (not e!270210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41420 (= res!276836 (validMask!0 mask!1365))))

(assert (=> start!41420 e!270210))

(assert (=> start!41420 tp_is_empty!12541))

(assert (=> start!41420 tp!39333))

(assert (=> start!41420 true))

(declare-fun array_inv!10110 (array!28878) Bool)

(assert (=> start!41420 (array_inv!10110 _keys!1025)))

(declare-fun array_inv!10111 (array!28880) Bool)

(assert (=> start!41420 (and (array_inv!10111 _values!833) e!270207)))

(declare-fun b!462905 () Bool)

(assert (=> b!462905 (= e!270208 tp_is_empty!12541)))

(assert (= (and start!41420 res!276836) b!462904))

(assert (= (and b!462904 res!276837) b!462902))

(assert (= (and b!462902 res!276838) b!462903))

(assert (= (and b!462903 res!276835) b!462899))

(assert (= (and b!462900 condMapEmpty!20485) mapIsEmpty!20485))

(assert (= (and b!462900 (not condMapEmpty!20485)) mapNonEmpty!20485))

(get-info :version)

(assert (= (and mapNonEmpty!20485 ((_ is ValueCellFull!5927) mapValue!20485)) b!462905))

(assert (= (and b!462900 ((_ is ValueCellFull!5927) mapDefault!20485)) b!462901))

(assert (= start!41420 b!462900))

(declare-fun m!445895 () Bool)

(assert (=> b!462903 m!445895))

(declare-fun m!445897 () Bool)

(assert (=> mapNonEmpty!20485 m!445897))

(declare-fun m!445899 () Bool)

(assert (=> start!41420 m!445899))

(declare-fun m!445901 () Bool)

(assert (=> start!41420 m!445901))

(declare-fun m!445903 () Bool)

(assert (=> start!41420 m!445903))

(declare-fun m!445905 () Bool)

(assert (=> b!462899 m!445905))

(declare-fun m!445907 () Bool)

(assert (=> b!462902 m!445907))

(check-sat (not b_next!11113) (not b!462903) (not start!41420) (not b!462902) b_and!19459 tp_is_empty!12541 (not mapNonEmpty!20485) (not b!462899))
(check-sat b_and!19459 (not b_next!11113))
