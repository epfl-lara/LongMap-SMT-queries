; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41264 () Bool)

(assert start!41264)

(declare-fun mapIsEmpty!20314 () Bool)

(declare-fun mapRes!20314 () Bool)

(assert (=> mapIsEmpty!20314 mapRes!20314))

(declare-fun b!461778 () Bool)

(declare-fun e!269323 () Bool)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28672 0))(
  ( (array!28673 (arr!13774 (Array (_ BitVec 32) (_ BitVec 64))) (size!14126 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28672)

(declare-datatypes ((V!17691 0))(
  ( (V!17692 (val!6264 Int)) )
))
(declare-datatypes ((ValueCell!5876 0))(
  ( (ValueCellFull!5876 (v!8551 V!17691)) (EmptyCell!5876) )
))
(declare-datatypes ((array!28674 0))(
  ( (array!28675 (arr!13775 (Array (_ BitVec 32) ValueCell!5876)) (size!14127 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28674)

(assert (=> b!461778 (= e!269323 (and (= (size!14127 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14126 _keys!1025) (size!14127 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (size!14126 _keys!1025) (bvadd #b00000000000000000000000000000001 mask!1365)) (bvsgt #b00000000000000000000000000000000 (size!14126 _keys!1025))))))

(declare-fun mapNonEmpty!20314 () Bool)

(declare-fun tp!39133 () Bool)

(declare-fun e!269321 () Bool)

(assert (=> mapNonEmpty!20314 (= mapRes!20314 (and tp!39133 e!269321))))

(declare-fun mapKey!20314 () (_ BitVec 32))

(declare-fun mapValue!20314 () ValueCell!5876)

(declare-fun mapRest!20314 () (Array (_ BitVec 32) ValueCell!5876))

(assert (=> mapNonEmpty!20314 (= (arr!13775 _values!833) (store mapRest!20314 mapKey!20314 mapValue!20314))))

(declare-fun b!461779 () Bool)

(declare-fun e!269319 () Bool)

(declare-fun e!269320 () Bool)

(assert (=> b!461779 (= e!269319 (and e!269320 mapRes!20314))))

(declare-fun condMapEmpty!20314 () Bool)

(declare-fun mapDefault!20314 () ValueCell!5876)

(assert (=> b!461779 (= condMapEmpty!20314 (= (arr!13775 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5876)) mapDefault!20314)))))

(declare-fun res!276257 () Bool)

(assert (=> start!41264 (=> (not res!276257) (not e!269323))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41264 (= res!276257 (validMask!0 mask!1365))))

(assert (=> start!41264 e!269323))

(assert (=> start!41264 true))

(declare-fun array_inv!10042 (array!28672) Bool)

(assert (=> start!41264 (array_inv!10042 _keys!1025)))

(declare-fun array_inv!10043 (array!28674) Bool)

(assert (=> start!41264 (and (array_inv!10043 _values!833) e!269319)))

(declare-fun b!461780 () Bool)

(declare-fun tp_is_empty!12439 () Bool)

(assert (=> b!461780 (= e!269320 tp_is_empty!12439)))

(declare-fun b!461781 () Bool)

(assert (=> b!461781 (= e!269321 tp_is_empty!12439)))

(assert (= (and start!41264 res!276257) b!461778))

(assert (= (and b!461779 condMapEmpty!20314) mapIsEmpty!20314))

(assert (= (and b!461779 (not condMapEmpty!20314)) mapNonEmpty!20314))

(get-info :version)

(assert (= (and mapNonEmpty!20314 ((_ is ValueCellFull!5876) mapValue!20314)) b!461781))

(assert (= (and b!461779 ((_ is ValueCellFull!5876) mapDefault!20314)) b!461780))

(assert (= start!41264 b!461779))

(declare-fun m!445183 () Bool)

(assert (=> mapNonEmpty!20314 m!445183))

(declare-fun m!445185 () Bool)

(assert (=> start!41264 m!445185))

(declare-fun m!445187 () Bool)

(assert (=> start!41264 m!445187))

(declare-fun m!445189 () Bool)

(assert (=> start!41264 m!445189))

(check-sat (not start!41264) (not mapNonEmpty!20314) tp_is_empty!12439)
(check-sat)
(get-model)

(declare-fun d!74931 () Bool)

(assert (=> d!74931 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41264 d!74931))

(declare-fun d!74933 () Bool)

(assert (=> d!74933 (= (array_inv!10042 _keys!1025) (bvsge (size!14126 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41264 d!74933))

(declare-fun d!74935 () Bool)

(assert (=> d!74935 (= (array_inv!10043 _values!833) (bvsge (size!14127 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41264 d!74935))

(declare-fun condMapEmpty!20323 () Bool)

(declare-fun mapDefault!20323 () ValueCell!5876)

(assert (=> mapNonEmpty!20314 (= condMapEmpty!20323 (= mapRest!20314 ((as const (Array (_ BitVec 32) ValueCell!5876)) mapDefault!20323)))))

(declare-fun e!269358 () Bool)

(declare-fun mapRes!20323 () Bool)

(assert (=> mapNonEmpty!20314 (= tp!39133 (and e!269358 mapRes!20323))))

(declare-fun mapNonEmpty!20323 () Bool)

(declare-fun tp!39142 () Bool)

(declare-fun e!269359 () Bool)

(assert (=> mapNonEmpty!20323 (= mapRes!20323 (and tp!39142 e!269359))))

(declare-fun mapKey!20323 () (_ BitVec 32))

(declare-fun mapRest!20323 () (Array (_ BitVec 32) ValueCell!5876))

(declare-fun mapValue!20323 () ValueCell!5876)

(assert (=> mapNonEmpty!20323 (= mapRest!20314 (store mapRest!20323 mapKey!20323 mapValue!20323))))

(declare-fun mapIsEmpty!20323 () Bool)

(assert (=> mapIsEmpty!20323 mapRes!20323))

(declare-fun b!461813 () Bool)

(assert (=> b!461813 (= e!269358 tp_is_empty!12439)))

(declare-fun b!461812 () Bool)

(assert (=> b!461812 (= e!269359 tp_is_empty!12439)))

(assert (= (and mapNonEmpty!20314 condMapEmpty!20323) mapIsEmpty!20323))

(assert (= (and mapNonEmpty!20314 (not condMapEmpty!20323)) mapNonEmpty!20323))

(assert (= (and mapNonEmpty!20323 ((_ is ValueCellFull!5876) mapValue!20323)) b!461812))

(assert (= (and mapNonEmpty!20314 ((_ is ValueCellFull!5876) mapDefault!20323)) b!461813))

(declare-fun m!445207 () Bool)

(assert (=> mapNonEmpty!20323 m!445207))

(check-sat (not mapNonEmpty!20323) tp_is_empty!12439)
(check-sat)
