; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41408 () Bool)

(assert start!41408)

(declare-fun b_free!11101 () Bool)

(declare-fun b_next!11101 () Bool)

(assert (=> start!41408 (= b_free!11101 (not b_next!11101))))

(declare-fun tp!39297 () Bool)

(declare-fun b_and!19411 () Bool)

(assert (=> start!41408 (= tp!39297 b_and!19411)))

(declare-fun b!462563 () Bool)

(declare-fun e!269982 () Bool)

(declare-fun tp_is_empty!12529 () Bool)

(assert (=> b!462563 (= e!269982 tp_is_empty!12529)))

(declare-fun b!462564 () Bool)

(declare-fun res!276641 () Bool)

(declare-fun e!269984 () Bool)

(assert (=> b!462564 (=> (not res!276641) (not e!269984))))

(declare-datatypes ((array!28853 0))(
  ( (array!28854 (arr!13859 (Array (_ BitVec 32) (_ BitVec 64))) (size!14212 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28853)

(declare-datatypes ((List!8381 0))(
  ( (Nil!8378) (Cons!8377 (h!9233 (_ BitVec 64)) (t!14316 List!8381)) )
))
(declare-fun arrayNoDuplicates!0 (array!28853 (_ BitVec 32) List!8381) Bool)

(assert (=> b!462564 (= res!276641 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8378))))

(declare-fun mapIsEmpty!20467 () Bool)

(declare-fun mapRes!20467 () Bool)

(assert (=> mapIsEmpty!20467 mapRes!20467))

(declare-fun b!462565 () Bool)

(assert (=> b!462565 (= e!269984 false)))

(declare-datatypes ((V!17811 0))(
  ( (V!17812 (val!6309 Int)) )
))
(declare-fun minValueBefore!38 () V!17811)

(declare-fun zeroValue!794 () V!17811)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8294 0))(
  ( (tuple2!8295 (_1!4158 (_ BitVec 64)) (_2!4158 V!17811)) )
))
(declare-datatypes ((List!8382 0))(
  ( (Nil!8379) (Cons!8378 (h!9234 tuple2!8294) (t!14317 List!8382)) )
))
(declare-datatypes ((ListLongMap!7197 0))(
  ( (ListLongMap!7198 (toList!3614 List!8382)) )
))
(declare-fun lt!209033 () ListLongMap!7197)

(declare-datatypes ((ValueCell!5921 0))(
  ( (ValueCellFull!5921 (v!8590 V!17811)) (EmptyCell!5921) )
))
(declare-datatypes ((array!28855 0))(
  ( (array!28856 (arr!13860 (Array (_ BitVec 32) ValueCell!5921)) (size!14213 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28855)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1806 (array!28853 array!28855 (_ BitVec 32) (_ BitVec 32) V!17811 V!17811 (_ BitVec 32) Int) ListLongMap!7197)

(assert (=> b!462565 (= lt!209033 (getCurrentListMapNoExtraKeys!1806 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!276644 () Bool)

(assert (=> start!41408 (=> (not res!276644) (not e!269984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41408 (= res!276644 (validMask!0 mask!1365))))

(assert (=> start!41408 e!269984))

(assert (=> start!41408 tp_is_empty!12529))

(assert (=> start!41408 tp!39297))

(assert (=> start!41408 true))

(declare-fun array_inv!10090 (array!28853) Bool)

(assert (=> start!41408 (array_inv!10090 _keys!1025)))

(declare-fun e!269983 () Bool)

(declare-fun array_inv!10091 (array!28855) Bool)

(assert (=> start!41408 (and (array_inv!10091 _values!833) e!269983)))

(declare-fun b!462566 () Bool)

(declare-fun res!276643 () Bool)

(assert (=> b!462566 (=> (not res!276643) (not e!269984))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462566 (= res!276643 (and (= (size!14213 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14212 _keys!1025) (size!14213 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462567 () Bool)

(declare-fun e!269981 () Bool)

(assert (=> b!462567 (= e!269981 tp_is_empty!12529)))

(declare-fun b!462568 () Bool)

(declare-fun res!276642 () Bool)

(assert (=> b!462568 (=> (not res!276642) (not e!269984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28853 (_ BitVec 32)) Bool)

(assert (=> b!462568 (= res!276642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462569 () Bool)

(assert (=> b!462569 (= e!269983 (and e!269982 mapRes!20467))))

(declare-fun condMapEmpty!20467 () Bool)

(declare-fun mapDefault!20467 () ValueCell!5921)

(assert (=> b!462569 (= condMapEmpty!20467 (= (arr!13860 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5921)) mapDefault!20467)))))

(declare-fun mapNonEmpty!20467 () Bool)

(declare-fun tp!39298 () Bool)

(assert (=> mapNonEmpty!20467 (= mapRes!20467 (and tp!39298 e!269981))))

(declare-fun mapRest!20467 () (Array (_ BitVec 32) ValueCell!5921))

(declare-fun mapValue!20467 () ValueCell!5921)

(declare-fun mapKey!20467 () (_ BitVec 32))

(assert (=> mapNonEmpty!20467 (= (arr!13860 _values!833) (store mapRest!20467 mapKey!20467 mapValue!20467))))

(assert (= (and start!41408 res!276644) b!462566))

(assert (= (and b!462566 res!276643) b!462568))

(assert (= (and b!462568 res!276642) b!462564))

(assert (= (and b!462564 res!276641) b!462565))

(assert (= (and b!462569 condMapEmpty!20467) mapIsEmpty!20467))

(assert (= (and b!462569 (not condMapEmpty!20467)) mapNonEmpty!20467))

(get-info :version)

(assert (= (and mapNonEmpty!20467 ((_ is ValueCellFull!5921) mapValue!20467)) b!462567))

(assert (= (and b!462569 ((_ is ValueCellFull!5921) mapDefault!20467)) b!462563))

(assert (= start!41408 b!462569))

(declare-fun m!444895 () Bool)

(assert (=> start!41408 m!444895))

(declare-fun m!444897 () Bool)

(assert (=> start!41408 m!444897))

(declare-fun m!444899 () Bool)

(assert (=> start!41408 m!444899))

(declare-fun m!444901 () Bool)

(assert (=> b!462565 m!444901))

(declare-fun m!444903 () Bool)

(assert (=> b!462568 m!444903))

(declare-fun m!444905 () Bool)

(assert (=> b!462564 m!444905))

(declare-fun m!444907 () Bool)

(assert (=> mapNonEmpty!20467 m!444907))

(check-sat b_and!19411 (not b_next!11101) tp_is_empty!12529 (not b!462564) (not start!41408) (not mapNonEmpty!20467) (not b!462568) (not b!462565))
(check-sat b_and!19411 (not b_next!11101))
