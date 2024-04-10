; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104674 () Bool)

(assert start!104674)

(declare-fun b_free!26491 () Bool)

(declare-fun b_next!26491 () Bool)

(assert (=> start!104674 (= b_free!26491 (not b_next!26491))))

(declare-fun tp!92960 () Bool)

(declare-fun b_and!44255 () Bool)

(assert (=> start!104674 (= tp!92960 b_and!44255)))

(declare-fun b!1247972 () Bool)

(declare-fun e!708092 () Bool)

(assert (=> b!1247972 (= e!708092 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!47223 0))(
  ( (V!47224 (val!15759 Int)) )
))
(declare-fun zeroValue!871 () V!47223)

(declare-datatypes ((array!80480 0))(
  ( (array!80481 (arr!38808 (Array (_ BitVec 32) (_ BitVec 64))) (size!39344 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80480)

(declare-datatypes ((ValueCell!14933 0))(
  ( (ValueCellFull!14933 (v!18455 V!47223)) (EmptyCell!14933) )
))
(declare-datatypes ((array!80482 0))(
  ( (array!80483 (arr!38809 (Array (_ BitVec 32) ValueCell!14933)) (size!39345 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80482)

(declare-datatypes ((tuple2!20298 0))(
  ( (tuple2!20299 (_1!10160 (_ BitVec 64)) (_2!10160 V!47223)) )
))
(declare-datatypes ((List!27546 0))(
  ( (Nil!27543) (Cons!27542 (h!28751 tuple2!20298) (t!41015 List!27546)) )
))
(declare-datatypes ((ListLongMap!18171 0))(
  ( (ListLongMap!18172 (toList!9101 List!27546)) )
))
(declare-fun lt!563341 () ListLongMap!18171)

(declare-fun minValueBefore!43 () V!47223)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5508 (array!80480 array!80482 (_ BitVec 32) (_ BitVec 32) V!47223 V!47223 (_ BitVec 32) Int) ListLongMap!18171)

(assert (=> b!1247972 (= lt!563341 (getCurrentListMapNoExtraKeys!5508 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1247973 () Bool)

(declare-fun res!832642 () Bool)

(assert (=> b!1247973 (=> (not res!832642) (not e!708092))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1247973 (= res!832642 (and (= (size!39345 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39344 _keys!1118) (size!39345 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247974 () Bool)

(declare-fun res!832641 () Bool)

(assert (=> b!1247974 (=> (not res!832641) (not e!708092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80480 (_ BitVec 32)) Bool)

(assert (=> b!1247974 (= res!832641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247975 () Bool)

(declare-fun res!832643 () Bool)

(assert (=> b!1247975 (=> (not res!832643) (not e!708092))))

(declare-datatypes ((List!27547 0))(
  ( (Nil!27544) (Cons!27543 (h!28752 (_ BitVec 64)) (t!41016 List!27547)) )
))
(declare-fun arrayNoDuplicates!0 (array!80480 (_ BitVec 32) List!27547) Bool)

(assert (=> b!1247975 (= res!832643 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27544))))

(declare-fun b!1247976 () Bool)

(declare-fun e!708090 () Bool)

(declare-fun e!708093 () Bool)

(declare-fun mapRes!48847 () Bool)

(assert (=> b!1247976 (= e!708090 (and e!708093 mapRes!48847))))

(declare-fun condMapEmpty!48847 () Bool)

(declare-fun mapDefault!48847 () ValueCell!14933)

