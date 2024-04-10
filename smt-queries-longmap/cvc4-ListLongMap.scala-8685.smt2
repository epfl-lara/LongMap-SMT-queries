; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105512 () Bool)

(assert start!105512)

(declare-fun b_free!27149 () Bool)

(declare-fun b_next!27149 () Bool)

(assert (=> start!105512 (= b_free!27149 (not b_next!27149))))

(declare-fun tp!94963 () Bool)

(declare-fun b_and!45005 () Bool)

(assert (=> start!105512 (= tp!94963 b_and!45005)))

(declare-fun mapNonEmpty!49864 () Bool)

(declare-fun mapRes!49864 () Bool)

(declare-fun tp!94964 () Bool)

(declare-fun e!714761 () Bool)

(assert (=> mapNonEmpty!49864 (= mapRes!49864 (and tp!94964 e!714761))))

(declare-datatypes ((V!48099 0))(
  ( (V!48100 (val!16088 Int)) )
))
(declare-datatypes ((ValueCell!15262 0))(
  ( (ValueCellFull!15262 (v!18789 V!48099)) (EmptyCell!15262) )
))
(declare-fun mapRest!49864 () (Array (_ BitVec 32) ValueCell!15262))

(declare-fun mapKey!49864 () (_ BitVec 32))

(declare-datatypes ((array!81736 0))(
  ( (array!81737 (arr!39426 (Array (_ BitVec 32) ValueCell!15262)) (size!39962 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81736)

(declare-fun mapValue!49864 () ValueCell!15262)

(assert (=> mapNonEmpty!49864 (= (arr!39426 _values!914) (store mapRest!49864 mapKey!49864 mapValue!49864))))

(declare-fun b!1257085 () Bool)

(declare-fun e!714762 () Bool)

(assert (=> b!1257085 (= e!714762 true)))

(declare-datatypes ((tuple2!20782 0))(
  ( (tuple2!20783 (_1!10402 (_ BitVec 64)) (_2!10402 V!48099)) )
))
(declare-datatypes ((List!27999 0))(
  ( (Nil!27996) (Cons!27995 (h!29204 tuple2!20782) (t!41488 List!27999)) )
))
(declare-datatypes ((ListLongMap!18655 0))(
  ( (ListLongMap!18656 (toList!9343 List!27999)) )
))
(declare-fun lt!568515 () ListLongMap!18655)

(declare-fun -!2091 (ListLongMap!18655 (_ BitVec 64)) ListLongMap!18655)

(assert (=> b!1257085 (= (-!2091 lt!568515 #b1000000000000000000000000000000000000000000000000000000000000000) lt!568515)))

(declare-datatypes ((Unit!41870 0))(
  ( (Unit!41871) )
))
(declare-fun lt!568514 () Unit!41870)

(declare-fun removeNotPresentStillSame!144 (ListLongMap!18655 (_ BitVec 64)) Unit!41870)

(assert (=> b!1257085 (= lt!568514 (removeNotPresentStillSame!144 lt!568515 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1257086 () Bool)

(declare-fun res!838003 () Bool)

(declare-fun e!714765 () Bool)

(assert (=> b!1257086 (=> (not res!838003) (not e!714765))))

(declare-datatypes ((array!81738 0))(
  ( (array!81739 (arr!39427 (Array (_ BitVec 32) (_ BitVec 64))) (size!39963 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81738)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81738 (_ BitVec 32)) Bool)

(assert (=> b!1257086 (= res!838003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1257087 () Bool)

(declare-fun e!714764 () Bool)

(assert (=> b!1257087 (= e!714764 e!714762)))

(declare-fun res!838005 () Bool)

(assert (=> b!1257087 (=> res!838005 e!714762)))

(declare-fun contains!7560 (ListLongMap!18655 (_ BitVec 64)) Bool)

(assert (=> b!1257087 (= res!838005 (contains!7560 lt!568515 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48099)

(declare-fun minValueBefore!43 () V!48099)

(declare-fun getCurrentListMap!4565 (array!81738 array!81736 (_ BitVec 32) (_ BitVec 32) V!48099 V!48099 (_ BitVec 32) Int) ListLongMap!18655)

(assert (=> b!1257087 (= lt!568515 (getCurrentListMap!4565 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!838004 () Bool)

(assert (=> start!105512 (=> (not res!838004) (not e!714765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105512 (= res!838004 (validMask!0 mask!1466))))

(assert (=> start!105512 e!714765))

(assert (=> start!105512 true))

(assert (=> start!105512 tp!94963))

(declare-fun tp_is_empty!32051 () Bool)

(assert (=> start!105512 tp_is_empty!32051))

(declare-fun array_inv!30031 (array!81738) Bool)

(assert (=> start!105512 (array_inv!30031 _keys!1118)))

(declare-fun e!714760 () Bool)

(declare-fun array_inv!30032 (array!81736) Bool)

(assert (=> start!105512 (and (array_inv!30032 _values!914) e!714760)))

(declare-fun b!1257088 () Bool)

(declare-fun res!838007 () Bool)

(assert (=> b!1257088 (=> (not res!838007) (not e!714765))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1257088 (= res!838007 (and (= (size!39962 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39963 _keys!1118) (size!39962 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1257089 () Bool)

(declare-fun e!714759 () Bool)

(assert (=> b!1257089 (= e!714760 (and e!714759 mapRes!49864))))

(declare-fun condMapEmpty!49864 () Bool)

(declare-fun mapDefault!49864 () ValueCell!15262)

