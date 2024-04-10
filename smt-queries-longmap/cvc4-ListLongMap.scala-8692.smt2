; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105576 () Bool)

(assert start!105576)

(declare-fun b_free!27191 () Bool)

(declare-fun b_next!27191 () Bool)

(assert (=> start!105576 (= b_free!27191 (not b_next!27191))))

(declare-fun tp!95092 () Bool)

(declare-fun b_and!45057 () Bool)

(assert (=> start!105576 (= tp!95092 b_and!45057)))

(declare-fun b!1257721 () Bool)

(declare-fun e!715215 () Bool)

(assert (=> b!1257721 (= e!715215 (not true))))

(declare-datatypes ((V!48155 0))(
  ( (V!48156 (val!16109 Int)) )
))
(declare-datatypes ((tuple2!20814 0))(
  ( (tuple2!20815 (_1!10418 (_ BitVec 64)) (_2!10418 V!48155)) )
))
(declare-datatypes ((List!28028 0))(
  ( (Nil!28025) (Cons!28024 (h!29233 tuple2!20814) (t!41519 List!28028)) )
))
(declare-datatypes ((ListLongMap!18687 0))(
  ( (ListLongMap!18688 (toList!9359 List!28028)) )
))
(declare-fun lt!568864 () ListLongMap!18687)

(declare-fun lt!568865 () ListLongMap!18687)

(assert (=> b!1257721 (= lt!568864 lt!568865)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48155)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48155)

(declare-datatypes ((array!81818 0))(
  ( (array!81819 (arr!39466 (Array (_ BitVec 32) (_ BitVec 64))) (size!40002 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81818)

(declare-datatypes ((ValueCell!15283 0))(
  ( (ValueCellFull!15283 (v!18811 V!48155)) (EmptyCell!15283) )
))
(declare-datatypes ((array!81820 0))(
  ( (array!81821 (arr!39467 (Array (_ BitVec 32) ValueCell!15283)) (size!40003 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81820)

(declare-fun minValueBefore!43 () V!48155)

(declare-datatypes ((Unit!41902 0))(
  ( (Unit!41903) )
))
(declare-fun lt!568866 () Unit!41902)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1101 (array!81818 array!81820 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48155 V!48155 V!48155 V!48155 (_ BitVec 32) Int) Unit!41902)

(assert (=> b!1257721 (= lt!568866 (lemmaNoChangeToArrayThenSameMapNoExtras!1101 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5737 (array!81818 array!81820 (_ BitVec 32) (_ BitVec 32) V!48155 V!48155 (_ BitVec 32) Int) ListLongMap!18687)

(assert (=> b!1257721 (= lt!568865 (getCurrentListMapNoExtraKeys!5737 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1257721 (= lt!568864 (getCurrentListMapNoExtraKeys!5737 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!838357 () Bool)

(assert (=> start!105576 (=> (not res!838357) (not e!715215))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105576 (= res!838357 (validMask!0 mask!1466))))

(assert (=> start!105576 e!715215))

(assert (=> start!105576 true))

(assert (=> start!105576 tp!95092))

(declare-fun tp_is_empty!32093 () Bool)

(assert (=> start!105576 tp_is_empty!32093))

(declare-fun array_inv!30061 (array!81818) Bool)

(assert (=> start!105576 (array_inv!30061 _keys!1118)))

(declare-fun e!715216 () Bool)

(declare-fun array_inv!30062 (array!81820) Bool)

(assert (=> start!105576 (and (array_inv!30062 _values!914) e!715216)))

(declare-fun b!1257722 () Bool)

(declare-fun res!838355 () Bool)

(assert (=> b!1257722 (=> (not res!838355) (not e!715215))))

(declare-datatypes ((List!28029 0))(
  ( (Nil!28026) (Cons!28025 (h!29234 (_ BitVec 64)) (t!41520 List!28029)) )
))
(declare-fun arrayNoDuplicates!0 (array!81818 (_ BitVec 32) List!28029) Bool)

(assert (=> b!1257722 (= res!838355 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28026))))

(declare-fun b!1257723 () Bool)

(declare-fun e!715212 () Bool)

(assert (=> b!1257723 (= e!715212 tp_is_empty!32093)))

(declare-fun b!1257724 () Bool)

(declare-fun mapRes!49930 () Bool)

(assert (=> b!1257724 (= e!715216 (and e!715212 mapRes!49930))))

(declare-fun condMapEmpty!49930 () Bool)

(declare-fun mapDefault!49930 () ValueCell!15283)

