; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105616 () Bool)

(assert start!105616)

(declare-fun b_free!27217 () Bool)

(declare-fun b_next!27217 () Bool)

(assert (=> start!105616 (= b_free!27217 (not b_next!27217))))

(declare-fun tp!95174 () Bool)

(declare-fun b_and!45091 () Bool)

(assert (=> start!105616 (= tp!95174 b_and!45091)))

(declare-fun b!1258081 () Bool)

(declare-fun res!838547 () Bool)

(declare-fun e!715464 () Bool)

(assert (=> b!1258081 (=> (not res!838547) (not e!715464))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81868 0))(
  ( (array!81869 (arr!39490 (Array (_ BitVec 32) (_ BitVec 64))) (size!40026 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81868)

(declare-datatypes ((V!48191 0))(
  ( (V!48192 (val!16122 Int)) )
))
(declare-datatypes ((ValueCell!15296 0))(
  ( (ValueCellFull!15296 (v!18824 V!48191)) (EmptyCell!15296) )
))
(declare-datatypes ((array!81870 0))(
  ( (array!81871 (arr!39491 (Array (_ BitVec 32) ValueCell!15296)) (size!40027 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81870)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1258081 (= res!838547 (and (= (size!40027 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40026 _keys!1118) (size!40027 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258082 () Bool)

(declare-fun e!715465 () Bool)

(declare-fun tp_is_empty!32119 () Bool)

(assert (=> b!1258082 (= e!715465 tp_is_empty!32119)))

(declare-fun mapIsEmpty!49972 () Bool)

(declare-fun mapRes!49972 () Bool)

(assert (=> mapIsEmpty!49972 mapRes!49972))

(declare-fun b!1258083 () Bool)

(declare-fun e!715467 () Bool)

(assert (=> b!1258083 (= e!715467 tp_is_empty!32119)))

(declare-fun mapNonEmpty!49972 () Bool)

(declare-fun tp!95173 () Bool)

(assert (=> mapNonEmpty!49972 (= mapRes!49972 (and tp!95173 e!715467))))

(declare-fun mapKey!49972 () (_ BitVec 32))

(declare-fun mapRest!49972 () (Array (_ BitVec 32) ValueCell!15296))

(declare-fun mapValue!49972 () ValueCell!15296)

(assert (=> mapNonEmpty!49972 (= (arr!39491 _values!914) (store mapRest!49972 mapKey!49972 mapValue!49972))))

(declare-fun b!1258084 () Bool)

(declare-fun res!838545 () Bool)

(assert (=> b!1258084 (=> (not res!838545) (not e!715464))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81868 (_ BitVec 32)) Bool)

(assert (=> b!1258084 (= res!838545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258085 () Bool)

(declare-fun res!838543 () Bool)

(assert (=> b!1258085 (=> (not res!838543) (not e!715464))))

(declare-datatypes ((List!28043 0))(
  ( (Nil!28040) (Cons!28039 (h!29248 (_ BitVec 64)) (t!41536 List!28043)) )
))
(declare-fun arrayNoDuplicates!0 (array!81868 (_ BitVec 32) List!28043) Bool)

(assert (=> b!1258085 (= res!838543 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28040))))

(declare-fun b!1258086 () Bool)

(declare-fun e!715469 () Bool)

(assert (=> b!1258086 (= e!715469 (and e!715465 mapRes!49972))))

(declare-fun condMapEmpty!49972 () Bool)

(declare-fun mapDefault!49972 () ValueCell!15296)

