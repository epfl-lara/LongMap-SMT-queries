; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42566 () Bool)

(assert start!42566)

(declare-fun b_free!12001 () Bool)

(declare-fun b_next!12001 () Bool)

(assert (=> start!42566 (= b_free!12001 (not b_next!12001))))

(declare-fun tp!42042 () Bool)

(declare-fun b_and!20481 () Bool)

(assert (=> start!42566 (= tp!42042 b_and!20481)))

(declare-fun mapIsEmpty!21862 () Bool)

(declare-fun mapRes!21862 () Bool)

(assert (=> mapIsEmpty!21862 mapRes!21862))

(declare-fun mapNonEmpty!21862 () Bool)

(declare-fun tp!42043 () Bool)

(declare-fun e!278793 () Bool)

(assert (=> mapNonEmpty!21862 (= mapRes!21862 (and tp!42043 e!278793))))

(declare-datatypes ((V!19011 0))(
  ( (V!19012 (val!6759 Int)) )
))
(declare-datatypes ((ValueCell!6371 0))(
  ( (ValueCellFull!6371 (v!9052 V!19011)) (EmptyCell!6371) )
))
(declare-fun mapRest!21862 () (Array (_ BitVec 32) ValueCell!6371))

(declare-datatypes ((array!30601 0))(
  ( (array!30602 (arr!14718 (Array (_ BitVec 32) ValueCell!6371)) (size!15070 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30601)

(declare-fun mapKey!21862 () (_ BitVec 32))

(declare-fun mapValue!21862 () ValueCell!6371)

(assert (=> mapNonEmpty!21862 (= (arr!14718 _values!833) (store mapRest!21862 mapKey!21862 mapValue!21862))))

(declare-fun res!283625 () Bool)

(declare-fun e!278792 () Bool)

(assert (=> start!42566 (=> (not res!283625) (not e!278792))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42566 (= res!283625 (validMask!0 mask!1365))))

(assert (=> start!42566 e!278792))

(declare-fun tp_is_empty!13429 () Bool)

(assert (=> start!42566 tp_is_empty!13429))

(assert (=> start!42566 tp!42042))

(assert (=> start!42566 true))

(declare-datatypes ((array!30603 0))(
  ( (array!30604 (arr!14719 (Array (_ BitVec 32) (_ BitVec 64))) (size!15071 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30603)

(declare-fun array_inv!10620 (array!30603) Bool)

(assert (=> start!42566 (array_inv!10620 _keys!1025)))

(declare-fun e!278789 () Bool)

(declare-fun array_inv!10621 (array!30601) Bool)

(assert (=> start!42566 (and (array_inv!10621 _values!833) e!278789)))

(declare-fun b!474899 () Bool)

(declare-fun res!283623 () Bool)

(assert (=> b!474899 (=> (not res!283623) (not e!278792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30603 (_ BitVec 32)) Bool)

(assert (=> b!474899 (= res!283623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474900 () Bool)

(declare-fun res!283626 () Bool)

(assert (=> b!474900 (=> (not res!283626) (not e!278792))))

(declare-datatypes ((List!8991 0))(
  ( (Nil!8988) (Cons!8987 (h!9843 (_ BitVec 64)) (t!14965 List!8991)) )
))
(declare-fun arrayNoDuplicates!0 (array!30603 (_ BitVec 32) List!8991) Bool)

(assert (=> b!474900 (= res!283626 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8988))))

(declare-fun b!474901 () Bool)

(assert (=> b!474901 (= e!278793 tp_is_empty!13429)))

(declare-fun b!474902 () Bool)

(declare-fun res!283624 () Bool)

(assert (=> b!474902 (=> (not res!283624) (not e!278792))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!474902 (= res!283624 (and (= (size!15070 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15071 _keys!1025) (size!15070 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474903 () Bool)

(assert (=> b!474903 (= e!278792 false)))

(declare-fun zeroValue!794 () V!19011)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8916 0))(
  ( (tuple2!8917 (_1!4469 (_ BitVec 64)) (_2!4469 V!19011)) )
))
(declare-datatypes ((List!8992 0))(
  ( (Nil!8989) (Cons!8988 (h!9844 tuple2!8916) (t!14966 List!8992)) )
))
(declare-datatypes ((ListLongMap!7829 0))(
  ( (ListLongMap!7830 (toList!3930 List!8992)) )
))
(declare-fun lt!216323 () ListLongMap!7829)

(declare-fun minValueAfter!38 () V!19011)

(declare-fun getCurrentListMapNoExtraKeys!2087 (array!30603 array!30601 (_ BitVec 32) (_ BitVec 32) V!19011 V!19011 (_ BitVec 32) Int) ListLongMap!7829)

(assert (=> b!474903 (= lt!216323 (getCurrentListMapNoExtraKeys!2087 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!19011)

(declare-fun lt!216322 () ListLongMap!7829)

(assert (=> b!474903 (= lt!216322 (getCurrentListMapNoExtraKeys!2087 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474904 () Bool)

(declare-fun e!278790 () Bool)

(assert (=> b!474904 (= e!278790 tp_is_empty!13429)))

(declare-fun b!474905 () Bool)

(assert (=> b!474905 (= e!278789 (and e!278790 mapRes!21862))))

(declare-fun condMapEmpty!21862 () Bool)

(declare-fun mapDefault!21862 () ValueCell!6371)

