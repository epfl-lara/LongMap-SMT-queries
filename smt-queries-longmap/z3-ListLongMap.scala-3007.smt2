; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42346 () Bool)

(assert start!42346)

(declare-fun b_free!11851 () Bool)

(declare-fun b_next!11851 () Bool)

(assert (=> start!42346 (= b_free!11851 (not b_next!11851))))

(declare-fun tp!41584 () Bool)

(declare-fun b_and!20307 () Bool)

(assert (=> start!42346 (= tp!41584 b_and!20307)))

(declare-fun b!472575 () Bool)

(declare-fun e!277130 () Bool)

(declare-fun e!277127 () Bool)

(assert (=> b!472575 (= e!277130 (not e!277127))))

(declare-fun res!282325 () Bool)

(assert (=> b!472575 (=> res!282325 e!277127)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472575 (= res!282325 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18811 0))(
  ( (V!18812 (val!6684 Int)) )
))
(declare-datatypes ((tuple2!8730 0))(
  ( (tuple2!8731 (_1!4376 (_ BitVec 64)) (_2!4376 V!18811)) )
))
(declare-datatypes ((List!8793 0))(
  ( (Nil!8790) (Cons!8789 (h!9645 tuple2!8730) (t!14753 List!8793)) )
))
(declare-datatypes ((ListLongMap!7645 0))(
  ( (ListLongMap!7646 (toList!3838 List!8793)) )
))
(declare-fun lt!214456 () ListLongMap!7645)

(declare-fun lt!214457 () ListLongMap!7645)

(assert (=> b!472575 (= lt!214456 lt!214457)))

(declare-fun minValueBefore!38 () V!18811)

(declare-fun zeroValue!794 () V!18811)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13883 0))(
  ( (Unit!13884) )
))
(declare-fun lt!214458 () Unit!13883)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30302 0))(
  ( (array!30303 (arr!14571 (Array (_ BitVec 32) (_ BitVec 64))) (size!14923 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30302)

(declare-datatypes ((ValueCell!6296 0))(
  ( (ValueCellFull!6296 (v!8976 V!18811)) (EmptyCell!6296) )
))
(declare-datatypes ((array!30304 0))(
  ( (array!30305 (arr!14572 (Array (_ BitVec 32) ValueCell!6296)) (size!14924 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30304)

(declare-fun minValueAfter!38 () V!18811)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!210 (array!30302 array!30304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18811 V!18811 V!18811 V!18811 (_ BitVec 32) Int) Unit!13883)

(assert (=> b!472575 (= lt!214458 (lemmaNoChangeToArrayThenSameMapNoExtras!210 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2050 (array!30302 array!30304 (_ BitVec 32) (_ BitVec 32) V!18811 V!18811 (_ BitVec 32) Int) ListLongMap!7645)

(assert (=> b!472575 (= lt!214457 (getCurrentListMapNoExtraKeys!2050 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472575 (= lt!214456 (getCurrentListMapNoExtraKeys!2050 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472576 () Bool)

(assert (=> b!472576 (= e!277127 true)))

(declare-fun lt!214455 () ListLongMap!7645)

(declare-fun getCurrentListMap!2205 (array!30302 array!30304 (_ BitVec 32) (_ BitVec 32) V!18811 V!18811 (_ BitVec 32) Int) ListLongMap!7645)

(assert (=> b!472576 (= lt!214455 (getCurrentListMap!2205 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21628 () Bool)

(declare-fun mapRes!21628 () Bool)

(declare-fun tp!41583 () Bool)

(declare-fun e!277132 () Bool)

(assert (=> mapNonEmpty!21628 (= mapRes!21628 (and tp!41583 e!277132))))

(declare-fun mapRest!21628 () (Array (_ BitVec 32) ValueCell!6296))

(declare-fun mapKey!21628 () (_ BitVec 32))

(declare-fun mapValue!21628 () ValueCell!6296)

(assert (=> mapNonEmpty!21628 (= (arr!14572 _values!833) (store mapRest!21628 mapKey!21628 mapValue!21628))))

(declare-fun b!472577 () Bool)

(declare-fun res!282322 () Bool)

(assert (=> b!472577 (=> (not res!282322) (not e!277130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30302 (_ BitVec 32)) Bool)

(assert (=> b!472577 (= res!282322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472578 () Bool)

(declare-fun res!282324 () Bool)

(assert (=> b!472578 (=> (not res!282324) (not e!277130))))

(assert (=> b!472578 (= res!282324 (and (= (size!14924 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14923 _keys!1025) (size!14924 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472579 () Bool)

(declare-fun e!277129 () Bool)

(declare-fun tp_is_empty!13279 () Bool)

(assert (=> b!472579 (= e!277129 tp_is_empty!13279)))

(declare-fun res!282326 () Bool)

(assert (=> start!42346 (=> (not res!282326) (not e!277130))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42346 (= res!282326 (validMask!0 mask!1365))))

(assert (=> start!42346 e!277130))

(assert (=> start!42346 tp_is_empty!13279))

(assert (=> start!42346 tp!41584))

(assert (=> start!42346 true))

(declare-fun array_inv!10598 (array!30302) Bool)

(assert (=> start!42346 (array_inv!10598 _keys!1025)))

(declare-fun e!277131 () Bool)

(declare-fun array_inv!10599 (array!30304) Bool)

(assert (=> start!42346 (and (array_inv!10599 _values!833) e!277131)))

(declare-fun b!472580 () Bool)

(declare-fun res!282323 () Bool)

(assert (=> b!472580 (=> (not res!282323) (not e!277130))))

(declare-datatypes ((List!8794 0))(
  ( (Nil!8791) (Cons!8790 (h!9646 (_ BitVec 64)) (t!14754 List!8794)) )
))
(declare-fun arrayNoDuplicates!0 (array!30302 (_ BitVec 32) List!8794) Bool)

(assert (=> b!472580 (= res!282323 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8791))))

(declare-fun mapIsEmpty!21628 () Bool)

(assert (=> mapIsEmpty!21628 mapRes!21628))

(declare-fun b!472581 () Bool)

(assert (=> b!472581 (= e!277131 (and e!277129 mapRes!21628))))

(declare-fun condMapEmpty!21628 () Bool)

(declare-fun mapDefault!21628 () ValueCell!6296)

(assert (=> b!472581 (= condMapEmpty!21628 (= (arr!14572 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6296)) mapDefault!21628)))))

(declare-fun b!472582 () Bool)

(assert (=> b!472582 (= e!277132 tp_is_empty!13279)))

(assert (= (and start!42346 res!282326) b!472578))

(assert (= (and b!472578 res!282324) b!472577))

(assert (= (and b!472577 res!282322) b!472580))

(assert (= (and b!472580 res!282323) b!472575))

(assert (= (and b!472575 (not res!282325)) b!472576))

(assert (= (and b!472581 condMapEmpty!21628) mapIsEmpty!21628))

(assert (= (and b!472581 (not condMapEmpty!21628)) mapNonEmpty!21628))

(get-info :version)

(assert (= (and mapNonEmpty!21628 ((_ is ValueCellFull!6296) mapValue!21628)) b!472582))

(assert (= (and b!472581 ((_ is ValueCellFull!6296) mapDefault!21628)) b!472579))

(assert (= start!42346 b!472581))

(declare-fun m!454759 () Bool)

(assert (=> mapNonEmpty!21628 m!454759))

(declare-fun m!454761 () Bool)

(assert (=> b!472576 m!454761))

(declare-fun m!454763 () Bool)

(assert (=> b!472577 m!454763))

(declare-fun m!454765 () Bool)

(assert (=> b!472580 m!454765))

(declare-fun m!454767 () Bool)

(assert (=> start!42346 m!454767))

(declare-fun m!454769 () Bool)

(assert (=> start!42346 m!454769))

(declare-fun m!454771 () Bool)

(assert (=> start!42346 m!454771))

(declare-fun m!454773 () Bool)

(assert (=> b!472575 m!454773))

(declare-fun m!454775 () Bool)

(assert (=> b!472575 m!454775))

(declare-fun m!454777 () Bool)

(assert (=> b!472575 m!454777))

(check-sat (not b_next!11851) (not b!472577) (not b!472576) (not b!472580) b_and!20307 (not start!42346) (not b!472575) tp_is_empty!13279 (not mapNonEmpty!21628))
(check-sat b_and!20307 (not b_next!11851))
