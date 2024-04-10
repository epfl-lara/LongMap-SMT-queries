; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104680 () Bool)

(assert start!104680)

(declare-fun b_free!26497 () Bool)

(declare-fun b_next!26497 () Bool)

(assert (=> start!104680 (= b_free!26497 (not b_next!26497))))

(declare-fun tp!92977 () Bool)

(declare-fun b_and!44261 () Bool)

(assert (=> start!104680 (= tp!92977 b_and!44261)))

(declare-fun res!832677 () Bool)

(declare-fun e!708137 () Bool)

(assert (=> start!104680 (=> (not res!832677) (not e!708137))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104680 (= res!832677 (validMask!0 mask!1466))))

(assert (=> start!104680 e!708137))

(assert (=> start!104680 true))

(assert (=> start!104680 tp!92977))

(declare-fun tp_is_empty!31399 () Bool)

(assert (=> start!104680 tp_is_empty!31399))

(declare-datatypes ((array!80490 0))(
  ( (array!80491 (arr!38813 (Array (_ BitVec 32) (_ BitVec 64))) (size!39349 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80490)

(declare-fun array_inv!29629 (array!80490) Bool)

(assert (=> start!104680 (array_inv!29629 _keys!1118)))

(declare-datatypes ((V!47231 0))(
  ( (V!47232 (val!15762 Int)) )
))
(declare-datatypes ((ValueCell!14936 0))(
  ( (ValueCellFull!14936 (v!18458 V!47231)) (EmptyCell!14936) )
))
(declare-datatypes ((array!80492 0))(
  ( (array!80493 (arr!38814 (Array (_ BitVec 32) ValueCell!14936)) (size!39350 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80492)

(declare-fun e!708139 () Bool)

(declare-fun array_inv!29630 (array!80492) Bool)

(assert (=> start!104680 (and (array_inv!29630 _values!914) e!708139)))

(declare-fun b!1248035 () Bool)

(declare-fun res!832679 () Bool)

(assert (=> b!1248035 (=> (not res!832679) (not e!708137))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1248035 (= res!832679 (and (= (size!39350 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39349 _keys!1118) (size!39350 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!48856 () Bool)

(declare-fun mapRes!48856 () Bool)

(assert (=> mapIsEmpty!48856 mapRes!48856))

(declare-fun b!1248036 () Bool)

(assert (=> b!1248036 (= e!708137 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!20302 0))(
  ( (tuple2!20303 (_1!10162 (_ BitVec 64)) (_2!10162 V!47231)) )
))
(declare-datatypes ((List!27550 0))(
  ( (Nil!27547) (Cons!27546 (h!28755 tuple2!20302) (t!41019 List!27550)) )
))
(declare-datatypes ((ListLongMap!18175 0))(
  ( (ListLongMap!18176 (toList!9103 List!27550)) )
))
(declare-fun lt!563350 () ListLongMap!18175)

(declare-fun zeroValue!871 () V!47231)

(declare-fun minValueBefore!43 () V!47231)

(declare-fun getCurrentListMapNoExtraKeys!5510 (array!80490 array!80492 (_ BitVec 32) (_ BitVec 32) V!47231 V!47231 (_ BitVec 32) Int) ListLongMap!18175)

(assert (=> b!1248036 (= lt!563350 (getCurrentListMapNoExtraKeys!5510 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248037 () Bool)

(declare-fun e!708135 () Bool)

(assert (=> b!1248037 (= e!708139 (and e!708135 mapRes!48856))))

(declare-fun condMapEmpty!48856 () Bool)

(declare-fun mapDefault!48856 () ValueCell!14936)

