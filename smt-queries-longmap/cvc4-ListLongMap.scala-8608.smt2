; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104896 () Bool)

(assert start!104896)

(declare-fun b_free!26687 () Bool)

(declare-fun b_next!26687 () Bool)

(assert (=> start!104896 (= b_free!26687 (not b_next!26687))))

(declare-fun tp!93554 () Bool)

(declare-fun b_and!44463 () Bool)

(assert (=> start!104896 (= tp!93554 b_and!44463)))

(declare-fun mapIsEmpty!49147 () Bool)

(declare-fun mapRes!49147 () Bool)

(assert (=> mapIsEmpty!49147 mapRes!49147))

(declare-fun b!1250267 () Bool)

(declare-fun e!709747 () Bool)

(declare-fun e!709746 () Bool)

(assert (=> b!1250267 (= e!709747 e!709746)))

(declare-fun res!833955 () Bool)

(assert (=> b!1250267 (=> res!833955 e!709746)))

(declare-datatypes ((V!47483 0))(
  ( (V!47484 (val!15857 Int)) )
))
(declare-datatypes ((tuple2!20428 0))(
  ( (tuple2!20429 (_1!10225 (_ BitVec 64)) (_2!10225 V!47483)) )
))
(declare-datatypes ((List!27670 0))(
  ( (Nil!27667) (Cons!27666 (h!28875 tuple2!20428) (t!41143 List!27670)) )
))
(declare-datatypes ((ListLongMap!18301 0))(
  ( (ListLongMap!18302 (toList!9166 List!27670)) )
))
(declare-fun lt!564135 () ListLongMap!18301)

(declare-fun contains!7482 (ListLongMap!18301 (_ BitVec 64)) Bool)

(assert (=> b!1250267 (= res!833955 (contains!7482 lt!564135 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47483)

(declare-datatypes ((ValueCell!15031 0))(
  ( (ValueCellFull!15031 (v!18553 V!47483)) (EmptyCell!15031) )
))
(declare-datatypes ((array!80848 0))(
  ( (array!80849 (arr!38990 (Array (_ BitVec 32) ValueCell!15031)) (size!39526 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80848)

(declare-fun minValueBefore!43 () V!47483)

(declare-datatypes ((array!80850 0))(
  ( (array!80851 (arr!38991 (Array (_ BitVec 32) (_ BitVec 64))) (size!39527 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80850)

(declare-fun getCurrentListMap!4443 (array!80850 array!80848 (_ BitVec 32) (_ BitVec 32) V!47483 V!47483 (_ BitVec 32) Int) ListLongMap!18301)

(assert (=> b!1250267 (= lt!564135 (getCurrentListMap!4443 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1250268 () Bool)

(declare-fun res!833956 () Bool)

(declare-fun e!709742 () Bool)

(assert (=> b!1250268 (=> (not res!833956) (not e!709742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80850 (_ BitVec 32)) Bool)

(assert (=> b!1250268 (= res!833956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1250269 () Bool)

(declare-fun res!833959 () Bool)

(assert (=> b!1250269 (=> (not res!833959) (not e!709742))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1250269 (= res!833959 (and (= (size!39526 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39527 _keys!1118) (size!39526 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49147 () Bool)

(declare-fun tp!93553 () Bool)

(declare-fun e!709744 () Bool)

(assert (=> mapNonEmpty!49147 (= mapRes!49147 (and tp!93553 e!709744))))

(declare-fun mapRest!49147 () (Array (_ BitVec 32) ValueCell!15031))

(declare-fun mapValue!49147 () ValueCell!15031)

(declare-fun mapKey!49147 () (_ BitVec 32))

(assert (=> mapNonEmpty!49147 (= (arr!38990 _values!914) (store mapRest!49147 mapKey!49147 mapValue!49147))))

(declare-fun b!1250270 () Bool)

(assert (=> b!1250270 (= e!709746 true)))

(declare-fun -!1995 (ListLongMap!18301 (_ BitVec 64)) ListLongMap!18301)

(assert (=> b!1250270 (= (-!1995 lt!564135 #b1000000000000000000000000000000000000000000000000000000000000000) lt!564135)))

(declare-datatypes ((Unit!41525 0))(
  ( (Unit!41526) )
))
(declare-fun lt!564137 () Unit!41525)

(declare-fun removeNotPresentStillSame!90 (ListLongMap!18301 (_ BitVec 64)) Unit!41525)

(assert (=> b!1250270 (= lt!564137 (removeNotPresentStillSame!90 lt!564135 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1250271 () Bool)

(declare-fun res!833957 () Bool)

(assert (=> b!1250271 (=> (not res!833957) (not e!709742))))

(declare-datatypes ((List!27671 0))(
  ( (Nil!27668) (Cons!27667 (h!28876 (_ BitVec 64)) (t!41144 List!27671)) )
))
(declare-fun arrayNoDuplicates!0 (array!80850 (_ BitVec 32) List!27671) Bool)

(assert (=> b!1250271 (= res!833957 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27668))))

(declare-fun b!1250272 () Bool)

(declare-fun tp_is_empty!31589 () Bool)

(assert (=> b!1250272 (= e!709744 tp_is_empty!31589)))

(declare-fun res!833954 () Bool)

(assert (=> start!104896 (=> (not res!833954) (not e!709742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104896 (= res!833954 (validMask!0 mask!1466))))

(assert (=> start!104896 e!709742))

(assert (=> start!104896 true))

(assert (=> start!104896 tp!93554))

(assert (=> start!104896 tp_is_empty!31589))

(declare-fun array_inv!29747 (array!80850) Bool)

(assert (=> start!104896 (array_inv!29747 _keys!1118)))

(declare-fun e!709748 () Bool)

(declare-fun array_inv!29748 (array!80848) Bool)

(assert (=> start!104896 (and (array_inv!29748 _values!914) e!709748)))

(declare-fun b!1250273 () Bool)

(declare-fun e!709745 () Bool)

(assert (=> b!1250273 (= e!709748 (and e!709745 mapRes!49147))))

(declare-fun condMapEmpty!49147 () Bool)

(declare-fun mapDefault!49147 () ValueCell!15031)

