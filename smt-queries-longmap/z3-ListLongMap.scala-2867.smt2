; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41264 () Bool)

(assert start!41264)

(declare-fun mapIsEmpty!20314 () Bool)

(declare-fun mapRes!20314 () Bool)

(assert (=> mapIsEmpty!20314 mapRes!20314))

(declare-fun res!276135 () Bool)

(declare-fun e!269186 () Bool)

(assert (=> start!41264 (=> (not res!276135) (not e!269186))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41264 (= res!276135 (validMask!0 mask!1365))))

(assert (=> start!41264 e!269186))

(assert (=> start!41264 true))

(declare-datatypes ((array!28671 0))(
  ( (array!28672 (arr!13774 (Array (_ BitVec 32) (_ BitVec 64))) (size!14127 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28671)

(declare-fun array_inv!10030 (array!28671) Bool)

(assert (=> start!41264 (array_inv!10030 _keys!1025)))

(declare-datatypes ((V!17691 0))(
  ( (V!17692 (val!6264 Int)) )
))
(declare-datatypes ((ValueCell!5876 0))(
  ( (ValueCellFull!5876 (v!8544 V!17691)) (EmptyCell!5876) )
))
(declare-datatypes ((array!28673 0))(
  ( (array!28674 (arr!13775 (Array (_ BitVec 32) ValueCell!5876)) (size!14128 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28673)

(declare-fun e!269184 () Bool)

(declare-fun array_inv!10031 (array!28673) Bool)

(assert (=> start!41264 (and (array_inv!10031 _values!833) e!269184)))

(declare-fun b!461568 () Bool)

(declare-fun e!269185 () Bool)

(declare-fun tp_is_empty!12439 () Bool)

(assert (=> b!461568 (= e!269185 tp_is_empty!12439)))

(declare-fun mapNonEmpty!20314 () Bool)

(declare-fun tp!39133 () Bool)

(declare-fun e!269188 () Bool)

(assert (=> mapNonEmpty!20314 (= mapRes!20314 (and tp!39133 e!269188))))

(declare-fun mapValue!20314 () ValueCell!5876)

(declare-fun mapKey!20314 () (_ BitVec 32))

(declare-fun mapRest!20314 () (Array (_ BitVec 32) ValueCell!5876))

(assert (=> mapNonEmpty!20314 (= (arr!13775 _values!833) (store mapRest!20314 mapKey!20314 mapValue!20314))))

(declare-fun b!461569 () Bool)

(assert (=> b!461569 (= e!269184 (and e!269185 mapRes!20314))))

(declare-fun condMapEmpty!20314 () Bool)

(declare-fun mapDefault!20314 () ValueCell!5876)

(assert (=> b!461569 (= condMapEmpty!20314 (= (arr!13775 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5876)) mapDefault!20314)))))

(declare-fun b!461570 () Bool)

(assert (=> b!461570 (= e!269188 tp_is_empty!12439)))

(declare-fun b!461571 () Bool)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!461571 (= e!269186 (and (= (size!14128 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14127 _keys!1025) (size!14128 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (size!14127 _keys!1025) (bvadd #b00000000000000000000000000000001 mask!1365)) (bvsgt #b00000000000000000000000000000000 (size!14127 _keys!1025))))))

(assert (= (and start!41264 res!276135) b!461571))

(assert (= (and b!461569 condMapEmpty!20314) mapIsEmpty!20314))

(assert (= (and b!461569 (not condMapEmpty!20314)) mapNonEmpty!20314))

(get-info :version)

(assert (= (and mapNonEmpty!20314 ((_ is ValueCellFull!5876) mapValue!20314)) b!461570))

(assert (= (and b!461569 ((_ is ValueCellFull!5876) mapDefault!20314)) b!461568))

(assert (= start!41264 b!461569))

(declare-fun m!444267 () Bool)

(assert (=> start!41264 m!444267))

(declare-fun m!444269 () Bool)

(assert (=> start!41264 m!444269))

(declare-fun m!444271 () Bool)

(assert (=> start!41264 m!444271))

(declare-fun m!444273 () Bool)

(assert (=> mapNonEmpty!20314 m!444273))

(check-sat (not start!41264) (not mapNonEmpty!20314) tp_is_empty!12439)
(check-sat)
(get-model)

(declare-fun d!74699 () Bool)

(assert (=> d!74699 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41264 d!74699))

(declare-fun d!74701 () Bool)

(assert (=> d!74701 (= (array_inv!10030 _keys!1025) (bvsge (size!14127 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41264 d!74701))

(declare-fun d!74703 () Bool)

(assert (=> d!74703 (= (array_inv!10031 _values!833) (bvsge (size!14128 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41264 d!74703))

(declare-fun b!461602 () Bool)

(declare-fun e!269223 () Bool)

(assert (=> b!461602 (= e!269223 tp_is_empty!12439)))

(declare-fun mapIsEmpty!20323 () Bool)

(declare-fun mapRes!20323 () Bool)

(assert (=> mapIsEmpty!20323 mapRes!20323))

(declare-fun b!461603 () Bool)

(declare-fun e!269224 () Bool)

(assert (=> b!461603 (= e!269224 tp_is_empty!12439)))

(declare-fun mapNonEmpty!20323 () Bool)

(declare-fun tp!39142 () Bool)

(assert (=> mapNonEmpty!20323 (= mapRes!20323 (and tp!39142 e!269223))))

(declare-fun mapRest!20323 () (Array (_ BitVec 32) ValueCell!5876))

(declare-fun mapValue!20323 () ValueCell!5876)

(declare-fun mapKey!20323 () (_ BitVec 32))

(assert (=> mapNonEmpty!20323 (= mapRest!20314 (store mapRest!20323 mapKey!20323 mapValue!20323))))

(declare-fun condMapEmpty!20323 () Bool)

(declare-fun mapDefault!20323 () ValueCell!5876)

(assert (=> mapNonEmpty!20314 (= condMapEmpty!20323 (= mapRest!20314 ((as const (Array (_ BitVec 32) ValueCell!5876)) mapDefault!20323)))))

(assert (=> mapNonEmpty!20314 (= tp!39133 (and e!269224 mapRes!20323))))

(assert (= (and mapNonEmpty!20314 condMapEmpty!20323) mapIsEmpty!20323))

(assert (= (and mapNonEmpty!20314 (not condMapEmpty!20323)) mapNonEmpty!20323))

(assert (= (and mapNonEmpty!20323 ((_ is ValueCellFull!5876) mapValue!20323)) b!461602))

(assert (= (and mapNonEmpty!20314 ((_ is ValueCellFull!5876) mapDefault!20323)) b!461603))

(declare-fun m!444291 () Bool)

(assert (=> mapNonEmpty!20323 m!444291))

(check-sat (not mapNonEmpty!20323) tp_is_empty!12439)
(check-sat)
