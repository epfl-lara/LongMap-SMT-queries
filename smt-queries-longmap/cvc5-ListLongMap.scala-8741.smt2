; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106028 () Bool)

(assert start!106028)

(declare-fun b_free!27481 () Bool)

(declare-fun b_next!27481 () Bool)

(assert (=> start!106028 (= b_free!27481 (not b_next!27481))))

(declare-fun tp!95990 () Bool)

(declare-fun b_and!45443 () Bool)

(assert (=> start!106028 (= tp!95990 b_and!45443)))

(declare-fun b!1262635 () Bool)

(declare-fun res!841154 () Bool)

(declare-fun e!718761 () Bool)

(assert (=> b!1262635 (=> (not res!841154) (not e!718761))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82384 0))(
  ( (array!82385 (arr!39740 (Array (_ BitVec 32) (_ BitVec 64))) (size!40276 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82384)

(declare-datatypes ((V!48543 0))(
  ( (V!48544 (val!16254 Int)) )
))
(declare-datatypes ((ValueCell!15428 0))(
  ( (ValueCellFull!15428 (v!18962 V!48543)) (EmptyCell!15428) )
))
(declare-datatypes ((array!82386 0))(
  ( (array!82387 (arr!39741 (Array (_ BitVec 32) ValueCell!15428)) (size!40277 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82386)

(assert (=> b!1262635 (= res!841154 (and (= (size!40277 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40276 _keys!1118) (size!40277 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262636 () Bool)

(declare-fun res!841156 () Bool)

(assert (=> b!1262636 (=> (not res!841156) (not e!718761))))

(declare-datatypes ((List!28230 0))(
  ( (Nil!28227) (Cons!28226 (h!29435 (_ BitVec 64)) (t!41739 List!28230)) )
))
(declare-fun arrayNoDuplicates!0 (array!82384 (_ BitVec 32) List!28230) Bool)

(assert (=> b!1262636 (= res!841156 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28227))))

(declare-fun b!1262637 () Bool)

(declare-fun res!841157 () Bool)

(assert (=> b!1262637 (=> (not res!841157) (not e!718761))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82384 (_ BitVec 32)) Bool)

(assert (=> b!1262637 (= res!841157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1262638 () Bool)

(declare-fun e!718758 () Bool)

(assert (=> b!1262638 (= e!718761 (not e!718758))))

(declare-fun res!841153 () Bool)

(assert (=> b!1262638 (=> res!841153 e!718758)))

(assert (=> b!1262638 (= res!841153 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!21036 0))(
  ( (tuple2!21037 (_1!10529 (_ BitVec 64)) (_2!10529 V!48543)) )
))
(declare-datatypes ((List!28231 0))(
  ( (Nil!28228) (Cons!28227 (h!29436 tuple2!21036) (t!41740 List!28231)) )
))
(declare-datatypes ((ListLongMap!18909 0))(
  ( (ListLongMap!18910 (toList!9470 List!28231)) )
))
(declare-fun lt!572391 () ListLongMap!18909)

(declare-fun lt!572389 () ListLongMap!18909)

(assert (=> b!1262638 (= lt!572391 lt!572389)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48543)

(declare-datatypes ((Unit!42086 0))(
  ( (Unit!42087) )
))
(declare-fun lt!572393 () Unit!42086)

(declare-fun minValueBefore!43 () V!48543)

(declare-fun zeroValue!871 () V!48543)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1178 (array!82384 array!82386 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48543 V!48543 V!48543 V!48543 (_ BitVec 32) Int) Unit!42086)

(assert (=> b!1262638 (= lt!572393 (lemmaNoChangeToArrayThenSameMapNoExtras!1178 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5836 (array!82384 array!82386 (_ BitVec 32) (_ BitVec 32) V!48543 V!48543 (_ BitVec 32) Int) ListLongMap!18909)

(assert (=> b!1262638 (= lt!572389 (getCurrentListMapNoExtraKeys!5836 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262638 (= lt!572391 (getCurrentListMapNoExtraKeys!5836 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262639 () Bool)

(declare-fun contains!7594 (ListLongMap!18909 (_ BitVec 64)) Bool)

(assert (=> b!1262639 (= e!718758 (not (contains!7594 lt!572391 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!718756 () Bool)

(assert (=> b!1262639 e!718756))

(declare-fun res!841158 () Bool)

(assert (=> b!1262639 (=> (not res!841158) (not e!718756))))

(declare-fun lt!572390 () ListLongMap!18909)

(declare-fun +!4246 (ListLongMap!18909 tuple2!21036) ListLongMap!18909)

(assert (=> b!1262639 (= res!841158 (= lt!572390 (+!4246 lt!572391 (tuple2!21037 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun lt!572392 () ListLongMap!18909)

(declare-fun getCurrentListMap!4639 (array!82384 array!82386 (_ BitVec 32) (_ BitVec 32) V!48543 V!48543 (_ BitVec 32) Int) ListLongMap!18909)

(assert (=> b!1262639 (= lt!572392 (getCurrentListMap!4639 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262639 (= lt!572390 (getCurrentListMap!4639 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262640 () Bool)

(declare-fun e!718760 () Bool)

(declare-fun e!718757 () Bool)

(declare-fun mapRes!50392 () Bool)

(assert (=> b!1262640 (= e!718760 (and e!718757 mapRes!50392))))

(declare-fun condMapEmpty!50392 () Bool)

(declare-fun mapDefault!50392 () ValueCell!15428)

