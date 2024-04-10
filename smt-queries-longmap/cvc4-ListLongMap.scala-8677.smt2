; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105442 () Bool)

(assert start!105442)

(declare-fun b_free!27101 () Bool)

(declare-fun b_next!27101 () Bool)

(assert (=> start!105442 (= b_free!27101 (not b_next!27101))))

(declare-fun tp!94817 () Bool)

(declare-fun b_and!44947 () Bool)

(assert (=> start!105442 (= tp!94817 b_and!44947)))

(declare-fun b!1256280 () Bool)

(declare-fun res!837515 () Bool)

(declare-fun e!714158 () Bool)

(assert (=> b!1256280 (=> (not res!837515) (not e!714158))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81646 0))(
  ( (array!81647 (arr!39382 (Array (_ BitVec 32) (_ BitVec 64))) (size!39918 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81646)

(declare-datatypes ((V!48035 0))(
  ( (V!48036 (val!16064 Int)) )
))
(declare-datatypes ((ValueCell!15238 0))(
  ( (ValueCellFull!15238 (v!18764 V!48035)) (EmptyCell!15238) )
))
(declare-datatypes ((array!81648 0))(
  ( (array!81649 (arr!39383 (Array (_ BitVec 32) ValueCell!15238)) (size!39919 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81648)

(assert (=> b!1256280 (= res!837515 (and (= (size!39919 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39918 _keys!1118) (size!39919 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!49789 () Bool)

(declare-fun mapRes!49789 () Bool)

(declare-fun tp!94816 () Bool)

(declare-fun e!714161 () Bool)

(assert (=> mapNonEmpty!49789 (= mapRes!49789 (and tp!94816 e!714161))))

(declare-fun mapKey!49789 () (_ BitVec 32))

(declare-fun mapValue!49789 () ValueCell!15238)

(declare-fun mapRest!49789 () (Array (_ BitVec 32) ValueCell!15238))

(assert (=> mapNonEmpty!49789 (= (arr!39383 _values!914) (store mapRest!49789 mapKey!49789 mapValue!49789))))

(declare-fun res!837512 () Bool)

(assert (=> start!105442 (=> (not res!837512) (not e!714158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105442 (= res!837512 (validMask!0 mask!1466))))

(assert (=> start!105442 e!714158))

(assert (=> start!105442 true))

(assert (=> start!105442 tp!94817))

(declare-fun tp_is_empty!32003 () Bool)

(assert (=> start!105442 tp_is_empty!32003))

(declare-fun array_inv!30001 (array!81646) Bool)

(assert (=> start!105442 (array_inv!30001 _keys!1118)))

(declare-fun e!714155 () Bool)

(declare-fun array_inv!30002 (array!81648) Bool)

(assert (=> start!105442 (and (array_inv!30002 _values!914) e!714155)))

(declare-fun b!1256281 () Bool)

(declare-fun e!714159 () Bool)

(declare-fun e!714160 () Bool)

(assert (=> b!1256281 (= e!714159 e!714160)))

(declare-fun res!837511 () Bool)

(assert (=> b!1256281 (=> res!837511 e!714160)))

(declare-datatypes ((tuple2!20752 0))(
  ( (tuple2!20753 (_1!10387 (_ BitVec 64)) (_2!10387 V!48035)) )
))
(declare-datatypes ((List!27969 0))(
  ( (Nil!27966) (Cons!27965 (h!29174 tuple2!20752) (t!41456 List!27969)) )
))
(declare-datatypes ((ListLongMap!18625 0))(
  ( (ListLongMap!18626 (toList!9328 List!27969)) )
))
(declare-fun lt!568032 () ListLongMap!18625)

(declare-fun contains!7545 (ListLongMap!18625 (_ BitVec 64)) Bool)

(assert (=> b!1256281 (= res!837511 (contains!7545 lt!568032 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!48035)

(declare-fun minValueBefore!43 () V!48035)

(declare-fun getCurrentListMap!4551 (array!81646 array!81648 (_ BitVec 32) (_ BitVec 32) V!48035 V!48035 (_ BitVec 32) Int) ListLongMap!18625)

(assert (=> b!1256281 (= lt!568032 (getCurrentListMap!4551 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1256282 () Bool)

(declare-fun res!837514 () Bool)

(assert (=> b!1256282 (=> (not res!837514) (not e!714158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81646 (_ BitVec 32)) Bool)

(assert (=> b!1256282 (= res!837514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1256283 () Bool)

(declare-fun res!837513 () Bool)

(assert (=> b!1256283 (=> (not res!837513) (not e!714158))))

(declare-datatypes ((List!27970 0))(
  ( (Nil!27967) (Cons!27966 (h!29175 (_ BitVec 64)) (t!41457 List!27970)) )
))
(declare-fun arrayNoDuplicates!0 (array!81646 (_ BitVec 32) List!27970) Bool)

(assert (=> b!1256283 (= res!837513 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27967))))

(declare-fun b!1256284 () Bool)

(declare-fun e!714157 () Bool)

(assert (=> b!1256284 (= e!714155 (and e!714157 mapRes!49789))))

(declare-fun condMapEmpty!49789 () Bool)

(declare-fun mapDefault!49789 () ValueCell!15238)

