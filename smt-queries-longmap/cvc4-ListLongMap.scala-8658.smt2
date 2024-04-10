; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105292 () Bool)

(assert start!105292)

(declare-fun b_free!26987 () Bool)

(declare-fun b_next!26987 () Bool)

(assert (=> start!105292 (= b_free!26987 (not b_next!26987))))

(declare-fun tp!94468 () Bool)

(declare-fun b_and!44813 () Bool)

(assert (=> start!105292 (= tp!94468 b_and!44813)))

(declare-fun b!1254653 () Bool)

(declare-fun e!712967 () Bool)

(declare-fun tp_is_empty!31889 () Bool)

(assert (=> b!1254653 (= e!712967 tp_is_empty!31889)))

(declare-fun mapIsEmpty!49612 () Bool)

(declare-fun mapRes!49612 () Bool)

(assert (=> mapIsEmpty!49612 mapRes!49612))

(declare-fun b!1254654 () Bool)

(declare-fun res!836554 () Bool)

(declare-fun e!712969 () Bool)

(assert (=> b!1254654 (=> (not res!836554) (not e!712969))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81432 0))(
  ( (array!81433 (arr!39277 (Array (_ BitVec 32) (_ BitVec 64))) (size!39813 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81432)

(declare-datatypes ((V!47883 0))(
  ( (V!47884 (val!16007 Int)) )
))
(declare-datatypes ((ValueCell!15181 0))(
  ( (ValueCellFull!15181 (v!18706 V!47883)) (EmptyCell!15181) )
))
(declare-datatypes ((array!81434 0))(
  ( (array!81435 (arr!39278 (Array (_ BitVec 32) ValueCell!15181)) (size!39814 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81434)

(assert (=> b!1254654 (= res!836554 (and (= (size!39814 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39813 _keys!1118) (size!39814 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1254655 () Bool)

(declare-fun res!836555 () Bool)

(assert (=> b!1254655 (=> (not res!836555) (not e!712969))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81432 (_ BitVec 32)) Bool)

(assert (=> b!1254655 (= res!836555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!49612 () Bool)

(declare-fun tp!94469 () Bool)

(declare-fun e!712970 () Bool)

(assert (=> mapNonEmpty!49612 (= mapRes!49612 (and tp!94469 e!712970))))

(declare-fun mapKey!49612 () (_ BitVec 32))

(declare-fun mapValue!49612 () ValueCell!15181)

(declare-fun mapRest!49612 () (Array (_ BitVec 32) ValueCell!15181))

(assert (=> mapNonEmpty!49612 (= (arr!39278 _values!914) (store mapRest!49612 mapKey!49612 mapValue!49612))))

(declare-fun b!1254656 () Bool)

(declare-fun res!836552 () Bool)

(assert (=> b!1254656 (=> (not res!836552) (not e!712969))))

(declare-datatypes ((List!27899 0))(
  ( (Nil!27896) (Cons!27895 (h!29104 (_ BitVec 64)) (t!41382 List!27899)) )
))
(declare-fun arrayNoDuplicates!0 (array!81432 (_ BitVec 32) List!27899) Bool)

(assert (=> b!1254656 (= res!836552 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27896))))

(declare-fun b!1254658 () Bool)

(declare-fun e!712965 () Bool)

(assert (=> b!1254658 (= e!712965 (and e!712967 mapRes!49612))))

(declare-fun condMapEmpty!49612 () Bool)

(declare-fun mapDefault!49612 () ValueCell!15181)

