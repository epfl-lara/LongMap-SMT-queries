; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41280 () Bool)

(assert start!41280)

(declare-fun b!461851 () Bool)

(declare-fun e!269376 () Bool)

(declare-fun e!269377 () Bool)

(declare-fun mapRes!20317 () Bool)

(assert (=> b!461851 (= e!269376 (and e!269377 mapRes!20317))))

(declare-fun condMapEmpty!20317 () Bool)

(declare-datatypes ((V!17693 0))(
  ( (V!17694 (val!6265 Int)) )
))
(declare-datatypes ((ValueCell!5877 0))(
  ( (ValueCellFull!5877 (v!8551 V!17693)) (EmptyCell!5877) )
))
(declare-datatypes ((array!28679 0))(
  ( (array!28680 (arr!13778 (Array (_ BitVec 32) ValueCell!5877)) (size!14130 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28679)

(declare-fun mapDefault!20317 () ValueCell!5877)

(assert (=> b!461851 (= condMapEmpty!20317 (= (arr!13778 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5877)) mapDefault!20317)))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun b!461852 () Bool)

(declare-fun e!269375 () Bool)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28681 0))(
  ( (array!28682 (arr!13779 (Array (_ BitVec 32) (_ BitVec 64))) (size!14131 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28681)

(assert (=> b!461852 (= e!269375 (and (= (size!14130 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14131 _keys!1025) (size!14130 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (size!14131 _keys!1025) (bvadd #b00000000000000000000000000000001 mask!1365)) (bvsgt #b00000000000000000000000000000000 (size!14131 _keys!1025))))))

(declare-fun mapIsEmpty!20317 () Bool)

(assert (=> mapIsEmpty!20317 mapRes!20317))

(declare-fun b!461853 () Bool)

(declare-fun e!269374 () Bool)

(declare-fun tp_is_empty!12441 () Bool)

(assert (=> b!461853 (= e!269374 tp_is_empty!12441)))

(declare-fun res!276267 () Bool)

(assert (=> start!41280 (=> (not res!276267) (not e!269375))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41280 (= res!276267 (validMask!0 mask!1365))))

(assert (=> start!41280 e!269375))

(assert (=> start!41280 true))

(declare-fun array_inv!9966 (array!28681) Bool)

(assert (=> start!41280 (array_inv!9966 _keys!1025)))

(declare-fun array_inv!9967 (array!28679) Bool)

(assert (=> start!41280 (and (array_inv!9967 _values!833) e!269376)))

(declare-fun mapNonEmpty!20317 () Bool)

(declare-fun tp!39136 () Bool)

(assert (=> mapNonEmpty!20317 (= mapRes!20317 (and tp!39136 e!269374))))

(declare-fun mapValue!20317 () ValueCell!5877)

(declare-fun mapKey!20317 () (_ BitVec 32))

(declare-fun mapRest!20317 () (Array (_ BitVec 32) ValueCell!5877))

(assert (=> mapNonEmpty!20317 (= (arr!13778 _values!833) (store mapRest!20317 mapKey!20317 mapValue!20317))))

(declare-fun b!461854 () Bool)

(assert (=> b!461854 (= e!269377 tp_is_empty!12441)))

(assert (= (and start!41280 res!276267) b!461852))

(assert (= (and b!461851 condMapEmpty!20317) mapIsEmpty!20317))

(assert (= (and b!461851 (not condMapEmpty!20317)) mapNonEmpty!20317))

(get-info :version)

(assert (= (and mapNonEmpty!20317 ((_ is ValueCellFull!5877) mapValue!20317)) b!461853))

(assert (= (and b!461851 ((_ is ValueCellFull!5877) mapDefault!20317)) b!461854))

(assert (= start!41280 b!461851))

(declare-fun m!445009 () Bool)

(assert (=> start!41280 m!445009))

(declare-fun m!445011 () Bool)

(assert (=> start!41280 m!445011))

(declare-fun m!445013 () Bool)

(assert (=> start!41280 m!445013))

(declare-fun m!445015 () Bool)

(assert (=> mapNonEmpty!20317 m!445015))

(check-sat (not start!41280) (not mapNonEmpty!20317) tp_is_empty!12441)
(check-sat)
(get-model)

(declare-fun d!74903 () Bool)

(assert (=> d!74903 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41280 d!74903))

(declare-fun d!74905 () Bool)

(assert (=> d!74905 (= (array_inv!9966 _keys!1025) (bvsge (size!14131 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41280 d!74905))

(declare-fun d!74907 () Bool)

(assert (=> d!74907 (= (array_inv!9967 _values!833) (bvsge (size!14130 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41280 d!74907))

(declare-fun b!461873 () Bool)

(declare-fun e!269397 () Bool)

(assert (=> b!461873 (= e!269397 tp_is_empty!12441)))

(declare-fun mapNonEmpty!20323 () Bool)

(declare-fun mapRes!20323 () Bool)

(declare-fun tp!39142 () Bool)

(assert (=> mapNonEmpty!20323 (= mapRes!20323 (and tp!39142 e!269397))))

(declare-fun mapValue!20323 () ValueCell!5877)

(declare-fun mapRest!20323 () (Array (_ BitVec 32) ValueCell!5877))

(declare-fun mapKey!20323 () (_ BitVec 32))

(assert (=> mapNonEmpty!20323 (= mapRest!20317 (store mapRest!20323 mapKey!20323 mapValue!20323))))

(declare-fun b!461874 () Bool)

(declare-fun e!269398 () Bool)

(assert (=> b!461874 (= e!269398 tp_is_empty!12441)))

(declare-fun condMapEmpty!20323 () Bool)

(declare-fun mapDefault!20323 () ValueCell!5877)

(assert (=> mapNonEmpty!20317 (= condMapEmpty!20323 (= mapRest!20317 ((as const (Array (_ BitVec 32) ValueCell!5877)) mapDefault!20323)))))

(assert (=> mapNonEmpty!20317 (= tp!39136 (and e!269398 mapRes!20323))))

(declare-fun mapIsEmpty!20323 () Bool)

(assert (=> mapIsEmpty!20323 mapRes!20323))

(assert (= (and mapNonEmpty!20317 condMapEmpty!20323) mapIsEmpty!20323))

(assert (= (and mapNonEmpty!20317 (not condMapEmpty!20323)) mapNonEmpty!20323))

(assert (= (and mapNonEmpty!20323 ((_ is ValueCellFull!5877) mapValue!20323)) b!461873))

(assert (= (and mapNonEmpty!20317 ((_ is ValueCellFull!5877) mapDefault!20323)) b!461874))

(declare-fun m!445025 () Bool)

(assert (=> mapNonEmpty!20323 m!445025))

(check-sat (not mapNonEmpty!20323) tp_is_empty!12441)
(check-sat)
