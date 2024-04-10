; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42188 () Bool)

(assert start!42188)

(declare-fun b_free!11707 () Bool)

(declare-fun b_next!11707 () Bool)

(assert (=> start!42188 (= b_free!11707 (not b_next!11707))))

(declare-fun tp!41145 () Bool)

(declare-fun b_and!20137 () Bool)

(assert (=> start!42188 (= tp!41145 b_and!20137)))

(declare-fun b!470889 () Bool)

(declare-fun e!275913 () Bool)

(declare-fun tp_is_empty!13135 () Bool)

(assert (=> b!470889 (= e!275913 tp_is_empty!13135)))

(declare-fun b!470890 () Bool)

(declare-fun res!281339 () Bool)

(declare-fun e!275911 () Bool)

(assert (=> b!470890 (=> (not res!281339) (not e!275911))))

(declare-datatypes ((array!30039 0))(
  ( (array!30040 (arr!14442 (Array (_ BitVec 32) (_ BitVec 64))) (size!14794 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30039)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30039 (_ BitVec 32)) Bool)

(assert (=> b!470890 (= res!281339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470891 () Bool)

(declare-fun e!275912 () Bool)

(assert (=> b!470891 (= e!275912 tp_is_empty!13135)))

(declare-fun mapIsEmpty!21406 () Bool)

(declare-fun mapRes!21406 () Bool)

(assert (=> mapIsEmpty!21406 mapRes!21406))

(declare-fun b!470892 () Bool)

(declare-fun res!281341 () Bool)

(assert (=> b!470892 (=> (not res!281341) (not e!275911))))

(declare-datatypes ((List!8788 0))(
  ( (Nil!8785) (Cons!8784 (h!9640 (_ BitVec 64)) (t!14752 List!8788)) )
))
(declare-fun arrayNoDuplicates!0 (array!30039 (_ BitVec 32) List!8788) Bool)

(assert (=> b!470892 (= res!281341 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8785))))

(declare-fun mapNonEmpty!21406 () Bool)

(declare-fun tp!41146 () Bool)

(assert (=> mapNonEmpty!21406 (= mapRes!21406 (and tp!41146 e!275912))))

(declare-datatypes ((V!18619 0))(
  ( (V!18620 (val!6612 Int)) )
))
(declare-datatypes ((ValueCell!6224 0))(
  ( (ValueCellFull!6224 (v!8903 V!18619)) (EmptyCell!6224) )
))
(declare-fun mapValue!21406 () ValueCell!6224)

(declare-datatypes ((array!30041 0))(
  ( (array!30042 (arr!14443 (Array (_ BitVec 32) ValueCell!6224)) (size!14795 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30041)

(declare-fun mapKey!21406 () (_ BitVec 32))

(declare-fun mapRest!21406 () (Array (_ BitVec 32) ValueCell!6224))

(assert (=> mapNonEmpty!21406 (= (arr!14443 _values!833) (store mapRest!21406 mapKey!21406 mapValue!21406))))

(declare-fun b!470894 () Bool)

(declare-fun res!281338 () Bool)

(assert (=> b!470894 (=> (not res!281338) (not e!275911))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!470894 (= res!281338 (and (= (size!14795 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14794 _keys!1025) (size!14795 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470895 () Bool)

(assert (=> b!470895 (= e!275911 (not true))))

(declare-datatypes ((tuple2!8708 0))(
  ( (tuple2!8709 (_1!4365 (_ BitVec 64)) (_2!4365 V!18619)) )
))
(declare-datatypes ((List!8789 0))(
  ( (Nil!8786) (Cons!8785 (h!9641 tuple2!8708) (t!14753 List!8789)) )
))
(declare-datatypes ((ListLongMap!7621 0))(
  ( (ListLongMap!7622 (toList!3826 List!8789)) )
))
(declare-fun lt!213651 () ListLongMap!7621)

(declare-fun lt!213650 () ListLongMap!7621)

(assert (=> b!470895 (= lt!213651 lt!213650)))

(declare-datatypes ((Unit!13811 0))(
  ( (Unit!13812) )
))
(declare-fun lt!213652 () Unit!13811)

(declare-fun minValueBefore!38 () V!18619)

(declare-fun defaultEntry!841 () Int)

(declare-fun zeroValue!794 () V!18619)

(declare-fun minValueAfter!38 () V!18619)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!169 (array!30039 array!30041 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18619 V!18619 V!18619 V!18619 (_ BitVec 32) Int) Unit!13811)

(assert (=> b!470895 (= lt!213652 (lemmaNoChangeToArrayThenSameMapNoExtras!169 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1989 (array!30039 array!30041 (_ BitVec 32) (_ BitVec 32) V!18619 V!18619 (_ BitVec 32) Int) ListLongMap!7621)

(assert (=> b!470895 (= lt!213650 (getCurrentListMapNoExtraKeys!1989 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470895 (= lt!213651 (getCurrentListMapNoExtraKeys!1989 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470893 () Bool)

(declare-fun e!275915 () Bool)

(assert (=> b!470893 (= e!275915 (and e!275913 mapRes!21406))))

(declare-fun condMapEmpty!21406 () Bool)

(declare-fun mapDefault!21406 () ValueCell!6224)

