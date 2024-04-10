; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105548 () Bool)

(assert start!105548)

(declare-fun b_free!27163 () Bool)

(declare-fun b_next!27163 () Bool)

(assert (=> start!105548 (= b_free!27163 (not b_next!27163))))

(declare-fun tp!95009 () Bool)

(declare-fun b_and!45029 () Bool)

(assert (=> start!105548 (= tp!95009 b_and!45029)))

(declare-fun b!1257427 () Bool)

(declare-fun e!715005 () Bool)

(assert (=> b!1257427 (= e!715005 (not true))))

(declare-datatypes ((V!48119 0))(
  ( (V!48120 (val!16095 Int)) )
))
(declare-datatypes ((tuple2!20796 0))(
  ( (tuple2!20797 (_1!10409 (_ BitVec 64)) (_2!10409 V!48119)) )
))
(declare-datatypes ((List!28009 0))(
  ( (Nil!28006) (Cons!28005 (h!29214 tuple2!20796) (t!41500 List!28009)) )
))
(declare-datatypes ((ListLongMap!18669 0))(
  ( (ListLongMap!18670 (toList!9350 List!28009)) )
))
(declare-fun lt!568738 () ListLongMap!18669)

(declare-fun lt!568739 () ListLongMap!18669)

(assert (=> b!1257427 (= lt!568738 lt!568739)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48119)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-datatypes ((Unit!41884 0))(
  ( (Unit!41885) )
))
(declare-fun lt!568740 () Unit!41884)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48119)

(declare-datatypes ((array!81766 0))(
  ( (array!81767 (arr!39440 (Array (_ BitVec 32) (_ BitVec 64))) (size!39976 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81766)

(declare-datatypes ((ValueCell!15269 0))(
  ( (ValueCellFull!15269 (v!18797 V!48119)) (EmptyCell!15269) )
))
(declare-datatypes ((array!81768 0))(
  ( (array!81769 (arr!39441 (Array (_ BitVec 32) ValueCell!15269)) (size!39977 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81768)

(declare-fun minValueBefore!43 () V!48119)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1092 (array!81766 array!81768 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48119 V!48119 V!48119 V!48119 (_ BitVec 32) Int) Unit!41884)

(assert (=> b!1257427 (= lt!568740 (lemmaNoChangeToArrayThenSameMapNoExtras!1092 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5728 (array!81766 array!81768 (_ BitVec 32) (_ BitVec 32) V!48119 V!48119 (_ BitVec 32) Int) ListLongMap!18669)

(assert (=> b!1257427 (= lt!568739 (getCurrentListMapNoExtraKeys!5728 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257427 (= lt!568738 (getCurrentListMapNoExtraKeys!5728 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1257428 () Bool)

(declare-fun res!838187 () Bool)

(assert (=> b!1257428 (=> (not res!838187) (not e!715005))))

(declare-datatypes ((List!28010 0))(
  ( (Nil!28007) (Cons!28006 (h!29215 (_ BitVec 64)) (t!41501 List!28010)) )
))
(declare-fun arrayNoDuplicates!0 (array!81766 (_ BitVec 32) List!28010) Bool)

(assert (=> b!1257428 (= res!838187 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28007))))

(declare-fun b!1257429 () Bool)

(declare-fun res!838186 () Bool)

(assert (=> b!1257429 (=> (not res!838186) (not e!715005))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81766 (_ BitVec 32)) Bool)

(assert (=> b!1257429 (= res!838186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257430 () Bool)

(declare-fun e!715004 () Bool)

(declare-fun tp_is_empty!32065 () Bool)

(assert (=> b!1257430 (= e!715004 tp_is_empty!32065)))

(declare-fun res!838189 () Bool)

(assert (=> start!105548 (=> (not res!838189) (not e!715005))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105548 (= res!838189 (validMask!0 mask!1466))))

(assert (=> start!105548 e!715005))

(assert (=> start!105548 true))

(assert (=> start!105548 tp!95009))

(assert (=> start!105548 tp_is_empty!32065))

(declare-fun array_inv!30043 (array!81766) Bool)

(assert (=> start!105548 (array_inv!30043 _keys!1118)))

(declare-fun e!715003 () Bool)

(declare-fun array_inv!30044 (array!81768) Bool)

(assert (=> start!105548 (and (array_inv!30044 _values!914) e!715003)))

(declare-fun b!1257431 () Bool)

(declare-fun e!715006 () Bool)

(assert (=> b!1257431 (= e!715006 tp_is_empty!32065)))

(declare-fun b!1257432 () Bool)

(declare-fun mapRes!49888 () Bool)

(assert (=> b!1257432 (= e!715003 (and e!715004 mapRes!49888))))

(declare-fun condMapEmpty!49888 () Bool)

(declare-fun mapDefault!49888 () ValueCell!15269)

