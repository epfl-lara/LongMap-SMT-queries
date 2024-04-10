; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105488 () Bool)

(assert start!105488)

(declare-fun b_free!27125 () Bool)

(declare-fun b_next!27125 () Bool)

(assert (=> start!105488 (= b_free!27125 (not b_next!27125))))

(declare-fun tp!94891 () Bool)

(declare-fun b_and!44981 () Bool)

(assert (=> start!105488 (= tp!94891 b_and!44981)))

(declare-fun b!1256761 () Bool)

(declare-fun e!714507 () Bool)

(declare-fun e!714511 () Bool)

(assert (=> b!1256761 (= e!714507 (not e!714511))))

(declare-fun res!837790 () Bool)

(assert (=> b!1256761 (=> res!837790 e!714511)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1256761 (= res!837790 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!48067 0))(
  ( (V!48068 (val!16076 Int)) )
))
(declare-datatypes ((tuple2!20768 0))(
  ( (tuple2!20769 (_1!10395 (_ BitVec 64)) (_2!10395 V!48067)) )
))
(declare-datatypes ((List!27985 0))(
  ( (Nil!27982) (Cons!27981 (h!29190 tuple2!20768) (t!41474 List!27985)) )
))
(declare-datatypes ((ListLongMap!18641 0))(
  ( (ListLongMap!18642 (toList!9336 List!27985)) )
))
(declare-fun lt!568335 () ListLongMap!18641)

(declare-fun lt!568333 () ListLongMap!18641)

(assert (=> b!1256761 (= lt!568335 lt!568333)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-datatypes ((Unit!41856 0))(
  ( (Unit!41857) )
))
(declare-fun lt!568334 () Unit!41856)

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48067)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48067)

(declare-datatypes ((array!81692 0))(
  ( (array!81693 (arr!39404 (Array (_ BitVec 32) (_ BitVec 64))) (size!39940 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81692)

(declare-datatypes ((ValueCell!15250 0))(
  ( (ValueCellFull!15250 (v!18777 V!48067)) (EmptyCell!15250) )
))
(declare-datatypes ((array!81694 0))(
  ( (array!81695 (arr!39405 (Array (_ BitVec 32) ValueCell!15250)) (size!39941 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81694)

(declare-fun minValueBefore!43 () V!48067)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1082 (array!81692 array!81694 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48067 V!48067 V!48067 V!48067 (_ BitVec 32) Int) Unit!41856)

(assert (=> b!1256761 (= lt!568334 (lemmaNoChangeToArrayThenSameMapNoExtras!1082 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5718 (array!81692 array!81694 (_ BitVec 32) (_ BitVec 32) V!48067 V!48067 (_ BitVec 32) Int) ListLongMap!18641)

(assert (=> b!1256761 (= lt!568333 (getCurrentListMapNoExtraKeys!5718 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1256761 (= lt!568335 (getCurrentListMapNoExtraKeys!5718 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256762 () Bool)

(declare-fun e!714512 () Bool)

(declare-fun tp_is_empty!32027 () Bool)

(assert (=> b!1256762 (= e!714512 tp_is_empty!32027)))

(declare-fun b!1256763 () Bool)

(declare-fun e!714513 () Bool)

(declare-fun mapRes!49828 () Bool)

(assert (=> b!1256763 (= e!714513 (and e!714512 mapRes!49828))))

(declare-fun condMapEmpty!49828 () Bool)

(declare-fun mapDefault!49828 () ValueCell!15250)

