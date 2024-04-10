; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42328 () Bool)

(assert start!42328)

(declare-fun b_free!11819 () Bool)

(declare-fun b_next!11819 () Bool)

(assert (=> start!42328 (= b_free!11819 (not b_next!11819))))

(declare-fun tp!41488 () Bool)

(declare-fun b_and!20265 () Bool)

(assert (=> start!42328 (= tp!41488 b_and!20265)))

(declare-fun res!282090 () Bool)

(declare-fun e!276880 () Bool)

(assert (=> start!42328 (=> (not res!282090) (not e!276880))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42328 (= res!282090 (validMask!0 mask!1365))))

(assert (=> start!42328 e!276880))

(declare-fun tp_is_empty!13247 () Bool)

(assert (=> start!42328 tp_is_empty!13247))

(assert (=> start!42328 tp!41488))

(assert (=> start!42328 true))

(declare-datatypes ((array!30251 0))(
  ( (array!30252 (arr!14546 (Array (_ BitVec 32) (_ BitVec 64))) (size!14898 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30251)

(declare-fun array_inv!10486 (array!30251) Bool)

(assert (=> start!42328 (array_inv!10486 _keys!1025)))

(declare-datatypes ((V!18767 0))(
  ( (V!18768 (val!6668 Int)) )
))
(declare-datatypes ((ValueCell!6280 0))(
  ( (ValueCellFull!6280 (v!8959 V!18767)) (EmptyCell!6280) )
))
(declare-datatypes ((array!30253 0))(
  ( (array!30254 (arr!14547 (Array (_ BitVec 32) ValueCell!6280)) (size!14899 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30253)

(declare-fun e!276881 () Bool)

(declare-fun array_inv!10487 (array!30253) Bool)

(assert (=> start!42328 (and (array_inv!10487 _values!833) e!276881)))

(declare-fun b!472252 () Bool)

(declare-fun res!282091 () Bool)

(assert (=> b!472252 (=> (not res!282091) (not e!276880))))

(declare-datatypes ((List!8861 0))(
  ( (Nil!8858) (Cons!8857 (h!9713 (_ BitVec 64)) (t!14829 List!8861)) )
))
(declare-fun arrayNoDuplicates!0 (array!30251 (_ BitVec 32) List!8861) Bool)

(assert (=> b!472252 (= res!282091 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8858))))

(declare-fun b!472253 () Bool)

(declare-fun e!276879 () Bool)

(assert (=> b!472253 (= e!276880 (not e!276879))))

(declare-fun res!282092 () Bool)

(assert (=> b!472253 (=> res!282092 e!276879)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472253 (= res!282092 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8778 0))(
  ( (tuple2!8779 (_1!4400 (_ BitVec 64)) (_2!4400 V!18767)) )
))
(declare-datatypes ((List!8862 0))(
  ( (Nil!8859) (Cons!8858 (h!9714 tuple2!8778) (t!14830 List!8862)) )
))
(declare-datatypes ((ListLongMap!7691 0))(
  ( (ListLongMap!7692 (toList!3861 List!8862)) )
))
(declare-fun lt!214251 () ListLongMap!7691)

(declare-fun lt!214253 () ListLongMap!7691)

(assert (=> b!472253 (= lt!214251 lt!214253)))

(declare-fun minValueBefore!38 () V!18767)

(declare-fun zeroValue!794 () V!18767)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13881 0))(
  ( (Unit!13882) )
))
(declare-fun lt!214252 () Unit!13881)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18767)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!204 (array!30251 array!30253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18767 V!18767 V!18767 V!18767 (_ BitVec 32) Int) Unit!13881)

(assert (=> b!472253 (= lt!214252 (lemmaNoChangeToArrayThenSameMapNoExtras!204 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2024 (array!30251 array!30253 (_ BitVec 32) (_ BitVec 32) V!18767 V!18767 (_ BitVec 32) Int) ListLongMap!7691)

(assert (=> b!472253 (= lt!214253 (getCurrentListMapNoExtraKeys!2024 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472253 (= lt!214251 (getCurrentListMapNoExtraKeys!2024 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21580 () Bool)

(declare-fun mapRes!21580 () Bool)

(assert (=> mapIsEmpty!21580 mapRes!21580))

(declare-fun b!472254 () Bool)

(declare-fun e!276878 () Bool)

(assert (=> b!472254 (= e!276878 tp_is_empty!13247)))

(declare-fun b!472255 () Bool)

(declare-fun res!282093 () Bool)

(assert (=> b!472255 (=> (not res!282093) (not e!276880))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30251 (_ BitVec 32)) Bool)

(assert (=> b!472255 (= res!282093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21580 () Bool)

(declare-fun tp!41487 () Bool)

(assert (=> mapNonEmpty!21580 (= mapRes!21580 (and tp!41487 e!276878))))

(declare-fun mapValue!21580 () ValueCell!6280)

(declare-fun mapRest!21580 () (Array (_ BitVec 32) ValueCell!6280))

(declare-fun mapKey!21580 () (_ BitVec 32))

(assert (=> mapNonEmpty!21580 (= (arr!14547 _values!833) (store mapRest!21580 mapKey!21580 mapValue!21580))))

(declare-fun b!472256 () Bool)

(declare-fun e!276883 () Bool)

(assert (=> b!472256 (= e!276883 tp_is_empty!13247)))

(declare-fun b!472257 () Bool)

(declare-fun res!282089 () Bool)

(assert (=> b!472257 (=> (not res!282089) (not e!276880))))

(assert (=> b!472257 (= res!282089 (and (= (size!14899 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14898 _keys!1025) (size!14899 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!472258 () Bool)

(assert (=> b!472258 (= e!276879 true)))

(declare-fun lt!214254 () ListLongMap!7691)

(declare-fun getCurrentListMap!2232 (array!30251 array!30253 (_ BitVec 32) (_ BitVec 32) V!18767 V!18767 (_ BitVec 32) Int) ListLongMap!7691)

(assert (=> b!472258 (= lt!214254 (getCurrentListMap!2232 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472259 () Bool)

(assert (=> b!472259 (= e!276881 (and e!276883 mapRes!21580))))

(declare-fun condMapEmpty!21580 () Bool)

(declare-fun mapDefault!21580 () ValueCell!6280)

