; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42448 () Bool)

(assert start!42448)

(declare-fun b_free!11917 () Bool)

(declare-fun b_next!11917 () Bool)

(assert (=> start!42448 (= b_free!11917 (not b_next!11917))))

(declare-fun tp!41788 () Bool)

(declare-fun b_and!20395 () Bool)

(assert (=> start!42448 (= tp!41788 b_and!20395)))

(declare-fun b!473696 () Bool)

(declare-fun res!282956 () Bool)

(declare-fun e!277928 () Bool)

(assert (=> b!473696 (=> (not res!282956) (not e!277928))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30424 0))(
  ( (array!30425 (arr!14630 (Array (_ BitVec 32) (_ BitVec 64))) (size!14982 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30424)

(declare-datatypes ((V!18899 0))(
  ( (V!18900 (val!6717 Int)) )
))
(declare-datatypes ((ValueCell!6329 0))(
  ( (ValueCellFull!6329 (v!9010 V!18899)) (EmptyCell!6329) )
))
(declare-datatypes ((array!30426 0))(
  ( (array!30427 (arr!14631 (Array (_ BitVec 32) ValueCell!6329)) (size!14983 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30426)

(assert (=> b!473696 (= res!282956 (and (= (size!14983 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14982 _keys!1025) (size!14983 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!473697 () Bool)

(declare-fun res!282958 () Bool)

(assert (=> b!473697 (=> (not res!282958) (not e!277928))))

(declare-datatypes ((List!8840 0))(
  ( (Nil!8837) (Cons!8836 (h!9692 (_ BitVec 64)) (t!14804 List!8840)) )
))
(declare-fun arrayNoDuplicates!0 (array!30424 (_ BitVec 32) List!8840) Bool)

(assert (=> b!473697 (= res!282958 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8837))))

(declare-fun mapIsEmpty!21733 () Bool)

(declare-fun mapRes!21733 () Bool)

(assert (=> mapIsEmpty!21733 mapRes!21733))

(declare-fun b!473698 () Bool)

(declare-fun res!282955 () Bool)

(assert (=> b!473698 (=> (not res!282955) (not e!277928))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30424 (_ BitVec 32)) Bool)

(assert (=> b!473698 (= res!282955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21733 () Bool)

(declare-fun tp!41787 () Bool)

(declare-fun e!277929 () Bool)

(assert (=> mapNonEmpty!21733 (= mapRes!21733 (and tp!41787 e!277929))))

(declare-fun mapKey!21733 () (_ BitVec 32))

(declare-fun mapValue!21733 () ValueCell!6329)

(declare-fun mapRest!21733 () (Array (_ BitVec 32) ValueCell!6329))

(assert (=> mapNonEmpty!21733 (= (arr!14631 _values!833) (store mapRest!21733 mapKey!21733 mapValue!21733))))

(declare-fun b!473699 () Bool)

(declare-fun tp_is_empty!13345 () Bool)

(assert (=> b!473699 (= e!277929 tp_is_empty!13345)))

(declare-fun b!473700 () Bool)

(declare-fun e!277930 () Bool)

(declare-fun e!277933 () Bool)

(assert (=> b!473700 (= e!277930 (and e!277933 mapRes!21733))))

(declare-fun condMapEmpty!21733 () Bool)

(declare-fun mapDefault!21733 () ValueCell!6329)

(assert (=> b!473700 (= condMapEmpty!21733 (= (arr!14631 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6329)) mapDefault!21733)))))

(declare-fun b!473702 () Bool)

(declare-fun e!277931 () Bool)

(assert (=> b!473702 (= e!277931 true)))

(declare-datatypes ((tuple2!8778 0))(
  ( (tuple2!8779 (_1!4400 (_ BitVec 64)) (_2!4400 V!18899)) )
))
(declare-datatypes ((List!8841 0))(
  ( (Nil!8838) (Cons!8837 (h!9693 tuple2!8778) (t!14805 List!8841)) )
))
(declare-datatypes ((ListLongMap!7693 0))(
  ( (ListLongMap!7694 (toList!3862 List!8841)) )
))
(declare-fun lt!215446 () ListLongMap!7693)

(declare-fun lt!215447 () tuple2!8778)

(declare-fun minValueBefore!38 () V!18899)

(declare-fun +!1745 (ListLongMap!7693 tuple2!8778) ListLongMap!7693)

(assert (=> b!473702 (= (+!1745 lt!215446 lt!215447) (+!1745 (+!1745 lt!215446 (tuple2!8779 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!215447))))

(declare-fun minValueAfter!38 () V!18899)

(assert (=> b!473702 (= lt!215447 (tuple2!8779 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13930 0))(
  ( (Unit!13931) )
))
(declare-fun lt!215444 () Unit!13930)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!147 (ListLongMap!7693 (_ BitVec 64) V!18899 V!18899) Unit!13930)

(assert (=> b!473702 (= lt!215444 (addSameAsAddTwiceSameKeyDiffValues!147 lt!215446 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!215449 () ListLongMap!7693)

(declare-fun zeroValue!794 () V!18899)

(assert (=> b!473702 (= lt!215446 (+!1745 lt!215449 (tuple2!8779 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!794)))))

(declare-fun defaultEntry!841 () Int)

(declare-fun lt!215448 () ListLongMap!7693)

(declare-fun getCurrentListMap!2225 (array!30424 array!30426 (_ BitVec 32) (_ BitVec 32) V!18899 V!18899 (_ BitVec 32) Int) ListLongMap!7693)

(assert (=> b!473702 (= lt!215448 (getCurrentListMap!2225 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!215451 () ListLongMap!7693)

(assert (=> b!473702 (= lt!215451 (getCurrentListMap!2225 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!473703 () Bool)

(assert (=> b!473703 (= e!277928 (not e!277931))))

(declare-fun res!282957 () Bool)

(assert (=> b!473703 (=> res!282957 e!277931)))

(assert (=> b!473703 (= res!282957 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!215445 () ListLongMap!7693)

(assert (=> b!473703 (= lt!215449 lt!215445)))

(declare-fun lt!215450 () Unit!13930)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!231 (array!30424 array!30426 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18899 V!18899 V!18899 V!18899 (_ BitVec 32) Int) Unit!13930)

(assert (=> b!473703 (= lt!215450 (lemmaNoChangeToArrayThenSameMapNoExtras!231 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2071 (array!30424 array!30426 (_ BitVec 32) (_ BitVec 32) V!18899 V!18899 (_ BitVec 32) Int) ListLongMap!7693)

(assert (=> b!473703 (= lt!215445 (getCurrentListMapNoExtraKeys!2071 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!473703 (= lt!215449 (getCurrentListMapNoExtraKeys!2071 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!282954 () Bool)

(assert (=> start!42448 (=> (not res!282954) (not e!277928))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42448 (= res!282954 (validMask!0 mask!1365))))

(assert (=> start!42448 e!277928))

(assert (=> start!42448 tp_is_empty!13345))

(assert (=> start!42448 tp!41788))

(assert (=> start!42448 true))

(declare-fun array_inv!10636 (array!30424) Bool)

(assert (=> start!42448 (array_inv!10636 _keys!1025)))

(declare-fun array_inv!10637 (array!30426) Bool)

(assert (=> start!42448 (and (array_inv!10637 _values!833) e!277930)))

(declare-fun b!473701 () Bool)

(assert (=> b!473701 (= e!277933 tp_is_empty!13345)))

(assert (= (and start!42448 res!282954) b!473696))

(assert (= (and b!473696 res!282956) b!473698))

(assert (= (and b!473698 res!282955) b!473697))

(assert (= (and b!473697 res!282958) b!473703))

(assert (= (and b!473703 (not res!282957)) b!473702))

(assert (= (and b!473700 condMapEmpty!21733) mapIsEmpty!21733))

(assert (= (and b!473700 (not condMapEmpty!21733)) mapNonEmpty!21733))

(get-info :version)

(assert (= (and mapNonEmpty!21733 ((_ is ValueCellFull!6329) mapValue!21733)) b!473699))

(assert (= (and b!473700 ((_ is ValueCellFull!6329) mapDefault!21733)) b!473701))

(assert (= start!42448 b!473700))

(declare-fun m!456067 () Bool)

(assert (=> start!42448 m!456067))

(declare-fun m!456069 () Bool)

(assert (=> start!42448 m!456069))

(declare-fun m!456071 () Bool)

(assert (=> start!42448 m!456071))

(declare-fun m!456073 () Bool)

(assert (=> b!473697 m!456073))

(declare-fun m!456075 () Bool)

(assert (=> b!473703 m!456075))

(declare-fun m!456077 () Bool)

(assert (=> b!473703 m!456077))

(declare-fun m!456079 () Bool)

(assert (=> b!473703 m!456079))

(declare-fun m!456081 () Bool)

(assert (=> b!473702 m!456081))

(declare-fun m!456083 () Bool)

(assert (=> b!473702 m!456083))

(declare-fun m!456085 () Bool)

(assert (=> b!473702 m!456085))

(declare-fun m!456087 () Bool)

(assert (=> b!473702 m!456087))

(declare-fun m!456089 () Bool)

(assert (=> b!473702 m!456089))

(assert (=> b!473702 m!456087))

(declare-fun m!456091 () Bool)

(assert (=> b!473702 m!456091))

(declare-fun m!456093 () Bool)

(assert (=> b!473702 m!456093))

(declare-fun m!456095 () Bool)

(assert (=> b!473698 m!456095))

(declare-fun m!456097 () Bool)

(assert (=> mapNonEmpty!21733 m!456097))

(check-sat (not b_next!11917) tp_is_empty!13345 b_and!20395 (not b!473702) (not mapNonEmpty!21733) (not start!42448) (not b!473703) (not b!473698) (not b!473697))
(check-sat b_and!20395 (not b_next!11917))
