; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42336 () Bool)

(assert start!42336)

(declare-fun b_free!11827 () Bool)

(declare-fun b_next!11827 () Bool)

(assert (=> start!42336 (= b_free!11827 (not b_next!11827))))

(declare-fun tp!41511 () Bool)

(declare-fun b_and!20273 () Bool)

(assert (=> start!42336 (= tp!41511 b_and!20273)))

(declare-fun b!472348 () Bool)

(declare-fun res!282153 () Bool)

(declare-fun e!276950 () Bool)

(assert (=> b!472348 (=> (not res!282153) (not e!276950))))

(declare-datatypes ((array!30267 0))(
  ( (array!30268 (arr!14554 (Array (_ BitVec 32) (_ BitVec 64))) (size!14906 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30267)

(declare-datatypes ((List!8867 0))(
  ( (Nil!8864) (Cons!8863 (h!9719 (_ BitVec 64)) (t!14835 List!8867)) )
))
(declare-fun arrayNoDuplicates!0 (array!30267 (_ BitVec 32) List!8867) Bool)

(assert (=> b!472348 (= res!282153 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8864))))

(declare-fun b!472349 () Bool)

(declare-fun e!276953 () Bool)

(declare-fun tp_is_empty!13255 () Bool)

(assert (=> b!472349 (= e!276953 tp_is_empty!13255)))

(declare-fun b!472350 () Bool)

(declare-fun e!276952 () Bool)

(assert (=> b!472350 (= e!276950 (not e!276952))))

(declare-fun res!282152 () Bool)

(assert (=> b!472350 (=> res!282152 e!276952)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!472350 (= res!282152 (or (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18779 0))(
  ( (V!18780 (val!6672 Int)) )
))
(declare-datatypes ((tuple2!8786 0))(
  ( (tuple2!8787 (_1!4404 (_ BitVec 64)) (_2!4404 V!18779)) )
))
(declare-datatypes ((List!8868 0))(
  ( (Nil!8865) (Cons!8864 (h!9720 tuple2!8786) (t!14836 List!8868)) )
))
(declare-datatypes ((ListLongMap!7699 0))(
  ( (ListLongMap!7700 (toList!3865 List!8868)) )
))
(declare-fun lt!214302 () ListLongMap!7699)

(declare-fun lt!214301 () ListLongMap!7699)

(assert (=> b!472350 (= lt!214302 lt!214301)))

(declare-fun minValueBefore!38 () V!18779)

(declare-fun zeroValue!794 () V!18779)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13887 0))(
  ( (Unit!13888) )
))
(declare-fun lt!214300 () Unit!13887)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6284 0))(
  ( (ValueCellFull!6284 (v!8963 V!18779)) (EmptyCell!6284) )
))
(declare-datatypes ((array!30269 0))(
  ( (array!30270 (arr!14555 (Array (_ BitVec 32) ValueCell!6284)) (size!14907 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30269)

(declare-fun minValueAfter!38 () V!18779)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!207 (array!30267 array!30269 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18779 V!18779 V!18779 V!18779 (_ BitVec 32) Int) Unit!13887)

(assert (=> b!472350 (= lt!214300 (lemmaNoChangeToArrayThenSameMapNoExtras!207 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2027 (array!30267 array!30269 (_ BitVec 32) (_ BitVec 32) V!18779 V!18779 (_ BitVec 32) Int) ListLongMap!7699)

(assert (=> b!472350 (= lt!214301 (getCurrentListMapNoExtraKeys!2027 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!472350 (= lt!214302 (getCurrentListMapNoExtraKeys!2027 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!472351 () Bool)

(declare-fun res!282150 () Bool)

(assert (=> b!472351 (=> (not res!282150) (not e!276950))))

(assert (=> b!472351 (= res!282150 (and (= (size!14907 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14906 _keys!1025) (size!14907 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!282149 () Bool)

(assert (=> start!42336 (=> (not res!282149) (not e!276950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42336 (= res!282149 (validMask!0 mask!1365))))

(assert (=> start!42336 e!276950))

(assert (=> start!42336 tp_is_empty!13255))

(assert (=> start!42336 tp!41511))

(assert (=> start!42336 true))

(declare-fun array_inv!10494 (array!30267) Bool)

(assert (=> start!42336 (array_inv!10494 _keys!1025)))

(declare-fun e!276955 () Bool)

(declare-fun array_inv!10495 (array!30269) Bool)

(assert (=> start!42336 (and (array_inv!10495 _values!833) e!276955)))

(declare-fun mapIsEmpty!21592 () Bool)

(declare-fun mapRes!21592 () Bool)

(assert (=> mapIsEmpty!21592 mapRes!21592))

(declare-fun mapNonEmpty!21592 () Bool)

(declare-fun tp!41512 () Bool)

(declare-fun e!276954 () Bool)

(assert (=> mapNonEmpty!21592 (= mapRes!21592 (and tp!41512 e!276954))))

(declare-fun mapRest!21592 () (Array (_ BitVec 32) ValueCell!6284))

(declare-fun mapKey!21592 () (_ BitVec 32))

(declare-fun mapValue!21592 () ValueCell!6284)

(assert (=> mapNonEmpty!21592 (= (arr!14555 _values!833) (store mapRest!21592 mapKey!21592 mapValue!21592))))

(declare-fun b!472352 () Bool)

(assert (=> b!472352 (= e!276955 (and e!276953 mapRes!21592))))

(declare-fun condMapEmpty!21592 () Bool)

(declare-fun mapDefault!21592 () ValueCell!6284)

