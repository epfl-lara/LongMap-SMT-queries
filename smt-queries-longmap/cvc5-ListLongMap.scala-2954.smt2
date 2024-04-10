; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41944 () Bool)

(assert start!41944)

(declare-fun b_free!11533 () Bool)

(declare-fun b_next!11533 () Bool)

(assert (=> start!41944 (= b_free!11533 (not b_next!11533))))

(declare-fun tp!40611 () Bool)

(declare-fun b_and!19921 () Bool)

(assert (=> start!41944 (= tp!40611 b_and!19921)))

(declare-fun mapNonEmpty!21133 () Bool)

(declare-fun mapRes!21133 () Bool)

(declare-fun tp!40612 () Bool)

(declare-fun e!274066 () Bool)

(assert (=> mapNonEmpty!21133 (= mapRes!21133 (and tp!40612 e!274066))))

(declare-datatypes ((V!18387 0))(
  ( (V!18388 (val!6525 Int)) )
))
(declare-datatypes ((ValueCell!6137 0))(
  ( (ValueCellFull!6137 (v!8814 V!18387)) (EmptyCell!6137) )
))
(declare-fun mapValue!21133 () ValueCell!6137)

(declare-datatypes ((array!29697 0))(
  ( (array!29698 (arr!14275 (Array (_ BitVec 32) ValueCell!6137)) (size!14627 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29697)

(declare-fun mapRest!21133 () (Array (_ BitVec 32) ValueCell!6137))

(declare-fun mapKey!21133 () (_ BitVec 32))

(assert (=> mapNonEmpty!21133 (= (arr!14275 _values!833) (store mapRest!21133 mapKey!21133 mapValue!21133))))

(declare-fun b!468302 () Bool)

(declare-fun res!279883 () Bool)

(declare-fun e!274068 () Bool)

(assert (=> b!468302 (=> (not res!279883) (not e!274068))))

(declare-datatypes ((array!29699 0))(
  ( (array!29700 (arr!14276 (Array (_ BitVec 32) (_ BitVec 64))) (size!14628 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29699)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29699 (_ BitVec 32)) Bool)

(assert (=> b!468302 (= res!279883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468303 () Bool)

(declare-fun e!274067 () Bool)

(assert (=> b!468303 (= e!274068 (not e!274067))))

(declare-fun res!279885 () Bool)

(assert (=> b!468303 (=> res!279885 e!274067)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468303 (= res!279885 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8574 0))(
  ( (tuple2!8575 (_1!4298 (_ BitVec 64)) (_2!4298 V!18387)) )
))
(declare-datatypes ((List!8661 0))(
  ( (Nil!8658) (Cons!8657 (h!9513 tuple2!8574) (t!14617 List!8661)) )
))
(declare-datatypes ((ListLongMap!7487 0))(
  ( (ListLongMap!7488 (toList!3759 List!8661)) )
))
(declare-fun lt!211766 () ListLongMap!7487)

(declare-fun lt!211765 () ListLongMap!7487)

(assert (=> b!468303 (= lt!211766 lt!211765)))

(declare-fun minValueBefore!38 () V!18387)

(declare-fun zeroValue!794 () V!18387)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13674 0))(
  ( (Unit!13675) )
))
(declare-fun lt!211767 () Unit!13674)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18387)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!111 (array!29699 array!29697 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18387 V!18387 V!18387 V!18387 (_ BitVec 32) Int) Unit!13674)

(assert (=> b!468303 (= lt!211767 (lemmaNoChangeToArrayThenSameMapNoExtras!111 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1931 (array!29699 array!29697 (_ BitVec 32) (_ BitVec 32) V!18387 V!18387 (_ BitVec 32) Int) ListLongMap!7487)

(assert (=> b!468303 (= lt!211765 (getCurrentListMapNoExtraKeys!1931 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468303 (= lt!211766 (getCurrentListMapNoExtraKeys!1931 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468304 () Bool)

(assert (=> b!468304 (= e!274067 (bvsle #b00000000000000000000000000000000 (size!14628 _keys!1025)))))

(declare-fun lt!211764 () ListLongMap!7487)

(declare-fun getCurrentListMap!2186 (array!29699 array!29697 (_ BitVec 32) (_ BitVec 32) V!18387 V!18387 (_ BitVec 32) Int) ListLongMap!7487)

(assert (=> b!468304 (= lt!211764 (getCurrentListMap!2186 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468305 () Bool)

(declare-fun tp_is_empty!12961 () Bool)

(assert (=> b!468305 (= e!274066 tp_is_empty!12961)))

(declare-fun res!279886 () Bool)

(assert (=> start!41944 (=> (not res!279886) (not e!274068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41944 (= res!279886 (validMask!0 mask!1365))))

(assert (=> start!41944 e!274068))

(assert (=> start!41944 tp_is_empty!12961))

(assert (=> start!41944 tp!40611))

(assert (=> start!41944 true))

(declare-fun array_inv!10306 (array!29699) Bool)

(assert (=> start!41944 (array_inv!10306 _keys!1025)))

(declare-fun e!274069 () Bool)

(declare-fun array_inv!10307 (array!29697) Bool)

(assert (=> start!41944 (and (array_inv!10307 _values!833) e!274069)))

(declare-fun b!468306 () Bool)

(declare-fun res!279884 () Bool)

(assert (=> b!468306 (=> (not res!279884) (not e!274068))))

(declare-datatypes ((List!8662 0))(
  ( (Nil!8659) (Cons!8658 (h!9514 (_ BitVec 64)) (t!14618 List!8662)) )
))
(declare-fun arrayNoDuplicates!0 (array!29699 (_ BitVec 32) List!8662) Bool)

(assert (=> b!468306 (= res!279884 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8659))))

(declare-fun mapIsEmpty!21133 () Bool)

(assert (=> mapIsEmpty!21133 mapRes!21133))

(declare-fun b!468307 () Bool)

(declare-fun e!274065 () Bool)

(assert (=> b!468307 (= e!274069 (and e!274065 mapRes!21133))))

(declare-fun condMapEmpty!21133 () Bool)

(declare-fun mapDefault!21133 () ValueCell!6137)

