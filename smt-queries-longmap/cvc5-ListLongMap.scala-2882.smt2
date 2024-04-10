; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41422 () Bool)

(assert start!41422)

(declare-fun b_free!11101 () Bool)

(declare-fun b_next!11101 () Bool)

(assert (=> start!41422 (= b_free!11101 (not b_next!11101))))

(declare-fun tp!39298 () Bool)

(declare-fun b_and!19437 () Bool)

(assert (=> start!41422 (= tp!39298 b_and!19437)))

(declare-fun res!276772 () Bool)

(declare-fun e!270155 () Bool)

(assert (=> start!41422 (=> (not res!276772) (not e!270155))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41422 (= res!276772 (validMask!0 mask!1365))))

(assert (=> start!41422 e!270155))

(declare-fun tp_is_empty!12529 () Bool)

(assert (=> start!41422 tp_is_empty!12529))

(assert (=> start!41422 tp!39298))

(assert (=> start!41422 true))

(declare-datatypes ((array!28859 0))(
  ( (array!28860 (arr!13862 (Array (_ BitVec 32) (_ BitVec 64))) (size!14214 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28859)

(declare-fun array_inv!10024 (array!28859) Bool)

(assert (=> start!41422 (array_inv!10024 _keys!1025)))

(declare-datatypes ((V!17811 0))(
  ( (V!17812 (val!6309 Int)) )
))
(declare-datatypes ((ValueCell!5921 0))(
  ( (ValueCellFull!5921 (v!8596 V!17811)) (EmptyCell!5921) )
))
(declare-datatypes ((array!28861 0))(
  ( (array!28862 (arr!13863 (Array (_ BitVec 32) ValueCell!5921)) (size!14215 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28861)

(declare-fun e!270157 () Bool)

(declare-fun array_inv!10025 (array!28861) Bool)

(assert (=> start!41422 (and (array_inv!10025 _values!833) e!270157)))

(declare-fun b!462834 () Bool)

(declare-fun res!276773 () Bool)

(assert (=> b!462834 (=> (not res!276773) (not e!270155))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462834 (= res!276773 (and (= (size!14215 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14214 _keys!1025) (size!14215 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462835 () Bool)

(declare-fun res!276770 () Bool)

(assert (=> b!462835 (=> (not res!276770) (not e!270155))))

(declare-datatypes ((List!8358 0))(
  ( (Nil!8355) (Cons!8354 (h!9210 (_ BitVec 64)) (t!14302 List!8358)) )
))
(declare-fun arrayNoDuplicates!0 (array!28859 (_ BitVec 32) List!8358) Bool)

(assert (=> b!462835 (= res!276770 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8355))))

(declare-fun b!462836 () Bool)

(declare-fun e!270159 () Bool)

(assert (=> b!462836 (= e!270159 tp_is_empty!12529)))

(declare-fun mapIsEmpty!20467 () Bool)

(declare-fun mapRes!20467 () Bool)

(assert (=> mapIsEmpty!20467 mapRes!20467))

(declare-fun b!462837 () Bool)

(assert (=> b!462837 (= e!270155 false)))

(declare-datatypes ((tuple2!8266 0))(
  ( (tuple2!8267 (_1!4144 (_ BitVec 64)) (_2!4144 V!17811)) )
))
(declare-datatypes ((List!8359 0))(
  ( (Nil!8356) (Cons!8355 (h!9211 tuple2!8266) (t!14303 List!8359)) )
))
(declare-datatypes ((ListLongMap!7179 0))(
  ( (ListLongMap!7180 (toList!3605 List!8359)) )
))
(declare-fun lt!209267 () ListLongMap!7179)

(declare-fun minValueBefore!38 () V!17811)

(declare-fun zeroValue!794 () V!17811)

(declare-fun defaultEntry!841 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1785 (array!28859 array!28861 (_ BitVec 32) (_ BitVec 32) V!17811 V!17811 (_ BitVec 32) Int) ListLongMap!7179)

(assert (=> b!462837 (= lt!209267 (getCurrentListMapNoExtraKeys!1785 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!462838 () Bool)

(declare-fun res!276771 () Bool)

(assert (=> b!462838 (=> (not res!276771) (not e!270155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28859 (_ BitVec 32)) Bool)

(assert (=> b!462838 (= res!276771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!20467 () Bool)

(declare-fun tp!39297 () Bool)

(assert (=> mapNonEmpty!20467 (= mapRes!20467 (and tp!39297 e!270159))))

(declare-fun mapRest!20467 () (Array (_ BitVec 32) ValueCell!5921))

(declare-fun mapKey!20467 () (_ BitVec 32))

(declare-fun mapValue!20467 () ValueCell!5921)

(assert (=> mapNonEmpty!20467 (= (arr!13863 _values!833) (store mapRest!20467 mapKey!20467 mapValue!20467))))

(declare-fun b!462839 () Bool)

(declare-fun e!270158 () Bool)

(assert (=> b!462839 (= e!270158 tp_is_empty!12529)))

(declare-fun b!462840 () Bool)

(assert (=> b!462840 (= e!270157 (and e!270158 mapRes!20467))))

(declare-fun condMapEmpty!20467 () Bool)

(declare-fun mapDefault!20467 () ValueCell!5921)

