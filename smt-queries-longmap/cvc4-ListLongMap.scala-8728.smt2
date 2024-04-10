; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105866 () Bool)

(assert start!105866)

(declare-fun b_free!27407 () Bool)

(declare-fun b_next!27407 () Bool)

(assert (=> start!105866 (= b_free!27407 (not b_next!27407))))

(declare-fun tp!95753 () Bool)

(declare-fun b_and!45315 () Bool)

(assert (=> start!105866 (= tp!95753 b_and!45315)))

(declare-fun b!1261021 () Bool)

(declare-fun e!717647 () Bool)

(assert (=> b!1261021 (= e!717647 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!48443 0))(
  ( (V!48444 (val!16217 Int)) )
))
(declare-fun minValueAfter!43 () V!48443)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48443)

(declare-datatypes ((array!82232 0))(
  ( (array!82233 (arr!39669 (Array (_ BitVec 32) (_ BitVec 64))) (size!40205 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82232)

(declare-datatypes ((ValueCell!15391 0))(
  ( (ValueCellFull!15391 (v!18921 V!48443)) (EmptyCell!15391) )
))
(declare-datatypes ((array!82234 0))(
  ( (array!82235 (arr!39670 (Array (_ BitVec 32) ValueCell!15391)) (size!40206 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82234)

(declare-datatypes ((tuple2!20986 0))(
  ( (tuple2!20987 (_1!10504 (_ BitVec 64)) (_2!10504 V!48443)) )
))
(declare-datatypes ((List!28183 0))(
  ( (Nil!28180) (Cons!28179 (h!29388 tuple2!20986) (t!41682 List!28183)) )
))
(declare-datatypes ((ListLongMap!18859 0))(
  ( (ListLongMap!18860 (toList!9445 List!28183)) )
))
(declare-fun lt!571509 () ListLongMap!18859)

(declare-fun getCurrentListMapNoExtraKeys!5813 (array!82232 array!82234 (_ BitVec 32) (_ BitVec 32) V!48443 V!48443 (_ BitVec 32) Int) ListLongMap!18859)

(assert (=> b!1261021 (= lt!571509 (getCurrentListMapNoExtraKeys!5813 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun lt!571508 () ListLongMap!18859)

(declare-fun minValueBefore!43 () V!48443)

(assert (=> b!1261021 (= lt!571508 (getCurrentListMapNoExtraKeys!5813 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261022 () Bool)

(declare-fun res!840334 () Bool)

(assert (=> b!1261022 (=> (not res!840334) (not e!717647))))

(declare-datatypes ((List!28184 0))(
  ( (Nil!28181) (Cons!28180 (h!29389 (_ BitVec 64)) (t!41683 List!28184)) )
))
(declare-fun arrayNoDuplicates!0 (array!82232 (_ BitVec 32) List!28184) Bool)

(assert (=> b!1261022 (= res!840334 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28181))))

(declare-fun b!1261023 () Bool)

(declare-fun res!840335 () Bool)

(assert (=> b!1261023 (=> (not res!840335) (not e!717647))))

(assert (=> b!1261023 (= res!840335 (and (= (size!40206 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40205 _keys!1118) (size!40206 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!840337 () Bool)

(assert (=> start!105866 (=> (not res!840337) (not e!717647))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105866 (= res!840337 (validMask!0 mask!1466))))

(assert (=> start!105866 e!717647))

(assert (=> start!105866 true))

(assert (=> start!105866 tp!95753))

(declare-fun tp_is_empty!32309 () Bool)

(assert (=> start!105866 tp_is_empty!32309))

(declare-fun array_inv!30199 (array!82232) Bool)

(assert (=> start!105866 (array_inv!30199 _keys!1118)))

(declare-fun e!717649 () Bool)

(declare-fun array_inv!30200 (array!82234) Bool)

(assert (=> start!105866 (and (array_inv!30200 _values!914) e!717649)))

(declare-fun b!1261024 () Bool)

(declare-fun e!717648 () Bool)

(assert (=> b!1261024 (= e!717648 tp_is_empty!32309)))

(declare-fun b!1261025 () Bool)

(declare-fun res!840336 () Bool)

(assert (=> b!1261025 (=> (not res!840336) (not e!717647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82232 (_ BitVec 32)) Bool)

(assert (=> b!1261025 (= res!840336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261026 () Bool)

(declare-fun e!717646 () Bool)

(assert (=> b!1261026 (= e!717646 tp_is_empty!32309)))

(declare-fun mapNonEmpty!50266 () Bool)

(declare-fun mapRes!50266 () Bool)

(declare-fun tp!95752 () Bool)

(assert (=> mapNonEmpty!50266 (= mapRes!50266 (and tp!95752 e!717648))))

(declare-fun mapKey!50266 () (_ BitVec 32))

(declare-fun mapRest!50266 () (Array (_ BitVec 32) ValueCell!15391))

(declare-fun mapValue!50266 () ValueCell!15391)

(assert (=> mapNonEmpty!50266 (= (arr!39670 _values!914) (store mapRest!50266 mapKey!50266 mapValue!50266))))

(declare-fun mapIsEmpty!50266 () Bool)

(assert (=> mapIsEmpty!50266 mapRes!50266))

(declare-fun b!1261027 () Bool)

(assert (=> b!1261027 (= e!717649 (and e!717646 mapRes!50266))))

(declare-fun condMapEmpty!50266 () Bool)

(declare-fun mapDefault!50266 () ValueCell!15391)

