; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41706 () Bool)

(assert start!41706)

(declare-fun b_free!11345 () Bool)

(declare-fun b_next!11345 () Bool)

(assert (=> start!41706 (= b_free!11345 (not b_next!11345))))

(declare-fun tp!40039 () Bool)

(declare-fun b_and!19701 () Bool)

(assert (=> start!41706 (= tp!40039 b_and!19701)))

(declare-fun b!465674 () Bool)

(declare-fun e!272180 () Bool)

(assert (=> b!465674 (= e!272180 true)))

(declare-datatypes ((V!18135 0))(
  ( (V!18136 (val!6431 Int)) )
))
(declare-fun zeroValue!794 () V!18135)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((tuple2!8426 0))(
  ( (tuple2!8427 (_1!4224 (_ BitVec 64)) (_2!4224 V!18135)) )
))
(declare-datatypes ((List!8518 0))(
  ( (Nil!8515) (Cons!8514 (h!9370 tuple2!8426) (t!14468 List!8518)) )
))
(declare-datatypes ((ListLongMap!7339 0))(
  ( (ListLongMap!7340 (toList!3685 List!8518)) )
))
(declare-fun lt!210308 () ListLongMap!7339)

(declare-datatypes ((array!29327 0))(
  ( (array!29328 (arr!14093 (Array (_ BitVec 32) (_ BitVec 64))) (size!14445 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29327)

(declare-datatypes ((ValueCell!6043 0))(
  ( (ValueCellFull!6043 (v!8718 V!18135)) (EmptyCell!6043) )
))
(declare-datatypes ((array!29329 0))(
  ( (array!29330 (arr!14094 (Array (_ BitVec 32) ValueCell!6043)) (size!14446 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29329)

(declare-fun minValueAfter!38 () V!18135)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2139 (array!29327 array!29329 (_ BitVec 32) (_ BitVec 32) V!18135 V!18135 (_ BitVec 32) Int) ListLongMap!7339)

(assert (=> b!465674 (= lt!210308 (getCurrentListMap!2139 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18135)

(declare-fun lt!210306 () ListLongMap!7339)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun +!1645 (ListLongMap!7339 tuple2!8426) ListLongMap!7339)

(assert (=> b!465674 (= lt!210306 (+!1645 (getCurrentListMap!2139 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8427 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!465675 () Bool)

(declare-fun e!272183 () Bool)

(declare-fun tp_is_empty!12773 () Bool)

(assert (=> b!465675 (= e!272183 tp_is_empty!12773)))

(declare-fun mapNonEmpty!20842 () Bool)

(declare-fun mapRes!20842 () Bool)

(declare-fun tp!40038 () Bool)

(assert (=> mapNonEmpty!20842 (= mapRes!20842 (and tp!40038 e!272183))))

(declare-fun mapRest!20842 () (Array (_ BitVec 32) ValueCell!6043))

(declare-fun mapValue!20842 () ValueCell!6043)

(declare-fun mapKey!20842 () (_ BitVec 32))

(assert (=> mapNonEmpty!20842 (= (arr!14094 _values!833) (store mapRest!20842 mapKey!20842 mapValue!20842))))

(declare-fun res!278362 () Bool)

(declare-fun e!272182 () Bool)

(assert (=> start!41706 (=> (not res!278362) (not e!272182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41706 (= res!278362 (validMask!0 mask!1365))))

(assert (=> start!41706 e!272182))

(assert (=> start!41706 tp_is_empty!12773))

(assert (=> start!41706 tp!40039))

(assert (=> start!41706 true))

(declare-fun array_inv!10180 (array!29327) Bool)

(assert (=> start!41706 (array_inv!10180 _keys!1025)))

(declare-fun e!272179 () Bool)

(declare-fun array_inv!10181 (array!29329) Bool)

(assert (=> start!41706 (and (array_inv!10181 _values!833) e!272179)))

(declare-fun mapIsEmpty!20842 () Bool)

(assert (=> mapIsEmpty!20842 mapRes!20842))

(declare-fun b!465676 () Bool)

(declare-fun res!278360 () Bool)

(assert (=> b!465676 (=> (not res!278360) (not e!272182))))

(declare-datatypes ((List!8519 0))(
  ( (Nil!8516) (Cons!8515 (h!9371 (_ BitVec 64)) (t!14469 List!8519)) )
))
(declare-fun arrayNoDuplicates!0 (array!29327 (_ BitVec 32) List!8519) Bool)

(assert (=> b!465676 (= res!278360 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8516))))

(declare-fun b!465677 () Bool)

(declare-fun res!278361 () Bool)

(assert (=> b!465677 (=> (not res!278361) (not e!272182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29327 (_ BitVec 32)) Bool)

(assert (=> b!465677 (= res!278361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465678 () Bool)

(declare-fun e!272181 () Bool)

(assert (=> b!465678 (= e!272181 tp_is_empty!12773)))

(declare-fun b!465679 () Bool)

(declare-fun res!278359 () Bool)

(assert (=> b!465679 (=> (not res!278359) (not e!272182))))

(assert (=> b!465679 (= res!278359 (and (= (size!14446 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14445 _keys!1025) (size!14446 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465680 () Bool)

(assert (=> b!465680 (= e!272182 (not e!272180))))

(declare-fun res!278358 () Bool)

(assert (=> b!465680 (=> res!278358 e!272180)))

(assert (=> b!465680 (= res!278358 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210309 () ListLongMap!7339)

(declare-fun lt!210307 () ListLongMap!7339)

(assert (=> b!465680 (= lt!210309 lt!210307)))

(declare-datatypes ((Unit!13538 0))(
  ( (Unit!13539) )
))
(declare-fun lt!210310 () Unit!13538)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!45 (array!29327 array!29329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18135 V!18135 V!18135 V!18135 (_ BitVec 32) Int) Unit!13538)

(assert (=> b!465680 (= lt!210310 (lemmaNoChangeToArrayThenSameMapNoExtras!45 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1865 (array!29327 array!29329 (_ BitVec 32) (_ BitVec 32) V!18135 V!18135 (_ BitVec 32) Int) ListLongMap!7339)

(assert (=> b!465680 (= lt!210307 (getCurrentListMapNoExtraKeys!1865 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465680 (= lt!210309 (getCurrentListMapNoExtraKeys!1865 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465681 () Bool)

(assert (=> b!465681 (= e!272179 (and e!272181 mapRes!20842))))

(declare-fun condMapEmpty!20842 () Bool)

(declare-fun mapDefault!20842 () ValueCell!6043)

