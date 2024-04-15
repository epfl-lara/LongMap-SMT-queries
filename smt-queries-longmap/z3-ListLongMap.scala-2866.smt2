; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41258 () Bool)

(assert start!41258)

(declare-fun b!461532 () Bool)

(declare-fun e!269140 () Bool)

(declare-fun e!269141 () Bool)

(declare-fun mapRes!20305 () Bool)

(assert (=> b!461532 (= e!269140 (and e!269141 mapRes!20305))))

(declare-fun condMapEmpty!20305 () Bool)

(declare-datatypes ((V!17683 0))(
  ( (V!17684 (val!6261 Int)) )
))
(declare-datatypes ((ValueCell!5873 0))(
  ( (ValueCellFull!5873 (v!8541 V!17683)) (EmptyCell!5873) )
))
(declare-datatypes ((array!28661 0))(
  ( (array!28662 (arr!13769 (Array (_ BitVec 32) ValueCell!5873)) (size!14122 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28661)

(declare-fun mapDefault!20305 () ValueCell!5873)

(assert (=> b!461532 (= condMapEmpty!20305 (= (arr!13769 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5873)) mapDefault!20305)))))

(declare-fun mapNonEmpty!20305 () Bool)

(declare-fun tp!39124 () Bool)

(declare-fun e!269143 () Bool)

(assert (=> mapNonEmpty!20305 (= mapRes!20305 (and tp!39124 e!269143))))

(declare-fun mapValue!20305 () ValueCell!5873)

(declare-fun mapKey!20305 () (_ BitVec 32))

(declare-fun mapRest!20305 () (Array (_ BitVec 32) ValueCell!5873))

(assert (=> mapNonEmpty!20305 (= (arr!13769 _values!833) (store mapRest!20305 mapKey!20305 mapValue!20305))))

(declare-fun mapIsEmpty!20305 () Bool)

(assert (=> mapIsEmpty!20305 mapRes!20305))

(declare-fun b!461533 () Bool)

(declare-fun tp_is_empty!12433 () Bool)

(assert (=> b!461533 (= e!269141 tp_is_empty!12433)))

(declare-fun res!276126 () Bool)

(declare-fun e!269139 () Bool)

(assert (=> start!41258 (=> (not res!276126) (not e!269139))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41258 (= res!276126 (validMask!0 mask!1365))))

(assert (=> start!41258 e!269139))

(assert (=> start!41258 true))

(declare-datatypes ((array!28663 0))(
  ( (array!28664 (arr!13770 (Array (_ BitVec 32) (_ BitVec 64))) (size!14123 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28663)

(declare-fun array_inv!10026 (array!28663) Bool)

(assert (=> start!41258 (array_inv!10026 _keys!1025)))

(declare-fun array_inv!10027 (array!28661) Bool)

(assert (=> start!41258 (and (array_inv!10027 _values!833) e!269140)))

(declare-fun b!461534 () Bool)

(assert (=> b!461534 (= e!269143 tp_is_empty!12433)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun b!461535 () Bool)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!461535 (= e!269139 (and (= (size!14122 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14123 _keys!1025) (size!14122 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (size!14123 _keys!1025) (bvadd #b00000000000000000000000000000001 mask!1365)))))))

(assert (= (and start!41258 res!276126) b!461535))

(assert (= (and b!461532 condMapEmpty!20305) mapIsEmpty!20305))

(assert (= (and b!461532 (not condMapEmpty!20305)) mapNonEmpty!20305))

(get-info :version)

(assert (= (and mapNonEmpty!20305 ((_ is ValueCellFull!5873) mapValue!20305)) b!461534))

(assert (= (and b!461532 ((_ is ValueCellFull!5873) mapDefault!20305)) b!461533))

(assert (= start!41258 b!461532))

(declare-fun m!444243 () Bool)

(assert (=> mapNonEmpty!20305 m!444243))

(declare-fun m!444245 () Bool)

(assert (=> start!41258 m!444245))

(declare-fun m!444247 () Bool)

(assert (=> start!41258 m!444247))

(declare-fun m!444249 () Bool)

(assert (=> start!41258 m!444249))

(check-sat (not start!41258) (not mapNonEmpty!20305) tp_is_empty!12433)
(check-sat)
