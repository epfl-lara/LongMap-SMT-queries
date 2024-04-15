; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42310 () Bool)

(assert start!42310)

(declare-fun b_free!11815 () Bool)

(declare-fun b_next!11815 () Bool)

(assert (=> start!42310 (= b_free!11815 (not b_next!11815))))

(declare-fun tp!41476 () Bool)

(declare-fun b_and!20235 () Bool)

(assert (=> start!42310 (= tp!41476 b_and!20235)))

(declare-fun b!471933 () Bool)

(declare-fun res!281933 () Bool)

(declare-fun e!276673 () Bool)

(assert (=> b!471933 (=> (not res!281933) (not e!276673))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30231 0))(
  ( (array!30232 (arr!14536 (Array (_ BitVec 32) (_ BitVec 64))) (size!14889 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30231)

(declare-datatypes ((V!18763 0))(
  ( (V!18764 (val!6666 Int)) )
))
(declare-datatypes ((ValueCell!6278 0))(
  ( (ValueCellFull!6278 (v!8951 V!18763)) (EmptyCell!6278) )
))
(declare-datatypes ((array!30233 0))(
  ( (array!30234 (arr!14537 (Array (_ BitVec 32) ValueCell!6278)) (size!14890 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30233)

(assert (=> b!471933 (= res!281933 (and (= (size!14890 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14889 _keys!1025) (size!14890 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471934 () Bool)

(declare-fun res!281931 () Bool)

(assert (=> b!471934 (=> (not res!281931) (not e!276673))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30231 (_ BitVec 32)) Bool)

(assert (=> b!471934 (= res!281931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471935 () Bool)

(declare-fun e!276672 () Bool)

(assert (=> b!471935 (= e!276673 (not e!276672))))

(declare-fun res!281930 () Bool)

(assert (=> b!471935 (=> res!281930 e!276672)))

(assert (=> b!471935 (= res!281930 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8816 0))(
  ( (tuple2!8817 (_1!4419 (_ BitVec 64)) (_2!4419 V!18763)) )
))
(declare-datatypes ((List!8889 0))(
  ( (Nil!8886) (Cons!8885 (h!9741 tuple2!8816) (t!14848 List!8889)) )
))
(declare-datatypes ((ListLongMap!7719 0))(
  ( (ListLongMap!7720 (toList!3875 List!8889)) )
))
(declare-fun lt!213995 () ListLongMap!7719)

(declare-fun lt!213994 () ListLongMap!7719)

(assert (=> b!471935 (= lt!213995 lt!213994)))

(declare-fun zeroValue!794 () V!18763)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13849 0))(
  ( (Unit!13850) )
))
(declare-fun lt!213996 () Unit!13849)

(declare-fun minValueBefore!38 () V!18763)

(declare-fun minValueAfter!38 () V!18763)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!206 (array!30231 array!30233 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18763 V!18763 V!18763 V!18763 (_ BitVec 32) Int) Unit!13849)

(assert (=> b!471935 (= lt!213996 (lemmaNoChangeToArrayThenSameMapNoExtras!206 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2049 (array!30231 array!30233 (_ BitVec 32) (_ BitVec 32) V!18763 V!18763 (_ BitVec 32) Int) ListLongMap!7719)

(assert (=> b!471935 (= lt!213994 (getCurrentListMapNoExtraKeys!2049 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471935 (= lt!213995 (getCurrentListMapNoExtraKeys!2049 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21574 () Bool)

(declare-fun mapRes!21574 () Bool)

(assert (=> mapIsEmpty!21574 mapRes!21574))

(declare-fun mapNonEmpty!21574 () Bool)

(declare-fun tp!41475 () Bool)

(declare-fun e!276671 () Bool)

(assert (=> mapNonEmpty!21574 (= mapRes!21574 (and tp!41475 e!276671))))

(declare-fun mapRest!21574 () (Array (_ BitVec 32) ValueCell!6278))

(declare-fun mapKey!21574 () (_ BitVec 32))

(declare-fun mapValue!21574 () ValueCell!6278)

(assert (=> mapNonEmpty!21574 (= (arr!14537 _values!833) (store mapRest!21574 mapKey!21574 mapValue!21574))))

(declare-fun res!281932 () Bool)

(assert (=> start!42310 (=> (not res!281932) (not e!276673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42310 (= res!281932 (validMask!0 mask!1365))))

(assert (=> start!42310 e!276673))

(declare-fun tp_is_empty!13243 () Bool)

(assert (=> start!42310 tp_is_empty!13243))

(assert (=> start!42310 tp!41476))

(assert (=> start!42310 true))

(declare-fun array_inv!10570 (array!30231) Bool)

(assert (=> start!42310 (array_inv!10570 _keys!1025)))

(declare-fun e!276669 () Bool)

(declare-fun array_inv!10571 (array!30233) Bool)

(assert (=> start!42310 (and (array_inv!10571 _values!833) e!276669)))

(declare-fun b!471936 () Bool)

(assert (=> b!471936 (= e!276671 tp_is_empty!13243)))

(declare-fun b!471937 () Bool)

(assert (=> b!471937 (= e!276672 true)))

(declare-fun lt!213993 () ListLongMap!7719)

(declare-fun getCurrentListMap!2183 (array!30231 array!30233 (_ BitVec 32) (_ BitVec 32) V!18763 V!18763 (_ BitVec 32) Int) ListLongMap!7719)

(assert (=> b!471937 (= lt!213993 (getCurrentListMap!2183 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471938 () Bool)

(declare-fun e!276670 () Bool)

(assert (=> b!471938 (= e!276669 (and e!276670 mapRes!21574))))

(declare-fun condMapEmpty!21574 () Bool)

(declare-fun mapDefault!21574 () ValueCell!6278)

(assert (=> b!471938 (= condMapEmpty!21574 (= (arr!14537 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6278)) mapDefault!21574)))))

(declare-fun b!471939 () Bool)

(assert (=> b!471939 (= e!276670 tp_is_empty!13243)))

(declare-fun b!471940 () Bool)

(declare-fun res!281934 () Bool)

(assert (=> b!471940 (=> (not res!281934) (not e!276673))))

(declare-datatypes ((List!8890 0))(
  ( (Nil!8887) (Cons!8886 (h!9742 (_ BitVec 64)) (t!14849 List!8890)) )
))
(declare-fun arrayNoDuplicates!0 (array!30231 (_ BitVec 32) List!8890) Bool)

(assert (=> b!471940 (= res!281934 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8887))))

(assert (= (and start!42310 res!281932) b!471933))

(assert (= (and b!471933 res!281933) b!471934))

(assert (= (and b!471934 res!281931) b!471940))

(assert (= (and b!471940 res!281934) b!471935))

(assert (= (and b!471935 (not res!281930)) b!471937))

(assert (= (and b!471938 condMapEmpty!21574) mapIsEmpty!21574))

(assert (= (and b!471938 (not condMapEmpty!21574)) mapNonEmpty!21574))

(get-info :version)

(assert (= (and mapNonEmpty!21574 ((_ is ValueCellFull!6278) mapValue!21574)) b!471936))

(assert (= (and b!471938 ((_ is ValueCellFull!6278) mapDefault!21574)) b!471939))

(assert (= start!42310 b!471938))

(declare-fun m!453483 () Bool)

(assert (=> b!471934 m!453483))

(declare-fun m!453485 () Bool)

(assert (=> mapNonEmpty!21574 m!453485))

(declare-fun m!453487 () Bool)

(assert (=> b!471935 m!453487))

(declare-fun m!453489 () Bool)

(assert (=> b!471935 m!453489))

(declare-fun m!453491 () Bool)

(assert (=> b!471935 m!453491))

(declare-fun m!453493 () Bool)

(assert (=> start!42310 m!453493))

(declare-fun m!453495 () Bool)

(assert (=> start!42310 m!453495))

(declare-fun m!453497 () Bool)

(assert (=> start!42310 m!453497))

(declare-fun m!453499 () Bool)

(assert (=> b!471940 m!453499))

(declare-fun m!453501 () Bool)

(assert (=> b!471937 m!453501))

(check-sat (not mapNonEmpty!21574) (not b!471934) (not b!471940) (not start!42310) tp_is_empty!13243 (not b_next!11815) (not b!471935) (not b!471937) b_and!20235)
(check-sat b_and!20235 (not b_next!11815))
