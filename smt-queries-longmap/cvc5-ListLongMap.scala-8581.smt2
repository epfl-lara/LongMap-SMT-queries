; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104704 () Bool)

(assert start!104704)

(declare-fun b_free!26521 () Bool)

(declare-fun b_next!26521 () Bool)

(assert (=> start!104704 (= b_free!26521 (not b_next!26521))))

(declare-fun tp!93050 () Bool)

(declare-fun b_and!44285 () Bool)

(assert (=> start!104704 (= tp!93050 b_and!44285)))

(declare-fun b!1248287 () Bool)

(declare-fun res!832823 () Bool)

(declare-fun e!708318 () Bool)

(assert (=> b!1248287 (=> (not res!832823) (not e!708318))))

(declare-datatypes ((array!80538 0))(
  ( (array!80539 (arr!38837 (Array (_ BitVec 32) (_ BitVec 64))) (size!39373 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80538)

(declare-datatypes ((List!27567 0))(
  ( (Nil!27564) (Cons!27563 (h!28772 (_ BitVec 64)) (t!41036 List!27567)) )
))
(declare-fun arrayNoDuplicates!0 (array!80538 (_ BitVec 32) List!27567) Bool)

(assert (=> b!1248287 (= res!832823 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27564))))

(declare-fun res!832824 () Bool)

(assert (=> start!104704 (=> (not res!832824) (not e!708318))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104704 (= res!832824 (validMask!0 mask!1466))))

(assert (=> start!104704 e!708318))

(assert (=> start!104704 true))

(assert (=> start!104704 tp!93050))

(declare-fun tp_is_empty!31423 () Bool)

(assert (=> start!104704 tp_is_empty!31423))

(declare-fun array_inv!29643 (array!80538) Bool)

(assert (=> start!104704 (array_inv!29643 _keys!1118)))

(declare-datatypes ((V!47263 0))(
  ( (V!47264 (val!15774 Int)) )
))
(declare-datatypes ((ValueCell!14948 0))(
  ( (ValueCellFull!14948 (v!18470 V!47263)) (EmptyCell!14948) )
))
(declare-datatypes ((array!80540 0))(
  ( (array!80541 (arr!38838 (Array (_ BitVec 32) ValueCell!14948)) (size!39374 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80540)

(declare-fun e!708316 () Bool)

(declare-fun array_inv!29644 (array!80540) Bool)

(assert (=> start!104704 (and (array_inv!29644 _values!914) e!708316)))

(declare-fun mapIsEmpty!48892 () Bool)

(declare-fun mapRes!48892 () Bool)

(assert (=> mapIsEmpty!48892 mapRes!48892))

(declare-fun b!1248288 () Bool)

(assert (=> b!1248288 (= e!708318 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47263)

(declare-fun minValueBefore!43 () V!47263)

(declare-datatypes ((tuple2!20320 0))(
  ( (tuple2!20321 (_1!10171 (_ BitVec 64)) (_2!10171 V!47263)) )
))
(declare-datatypes ((List!27568 0))(
  ( (Nil!27565) (Cons!27564 (h!28773 tuple2!20320) (t!41037 List!27568)) )
))
(declare-datatypes ((ListLongMap!18193 0))(
  ( (ListLongMap!18194 (toList!9112 List!27568)) )
))
(declare-fun lt!563386 () ListLongMap!18193)

(declare-fun getCurrentListMapNoExtraKeys!5519 (array!80538 array!80540 (_ BitVec 32) (_ BitVec 32) V!47263 V!47263 (_ BitVec 32) Int) ListLongMap!18193)

(assert (=> b!1248288 (= lt!563386 (getCurrentListMapNoExtraKeys!5519 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapNonEmpty!48892 () Bool)

(declare-fun tp!93049 () Bool)

(declare-fun e!708317 () Bool)

(assert (=> mapNonEmpty!48892 (= mapRes!48892 (and tp!93049 e!708317))))

(declare-fun mapKey!48892 () (_ BitVec 32))

(declare-fun mapRest!48892 () (Array (_ BitVec 32) ValueCell!14948))

(declare-fun mapValue!48892 () ValueCell!14948)

(assert (=> mapNonEmpty!48892 (= (arr!38838 _values!914) (store mapRest!48892 mapKey!48892 mapValue!48892))))

(declare-fun b!1248289 () Bool)

(declare-fun res!832821 () Bool)

(assert (=> b!1248289 (=> (not res!832821) (not e!708318))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1248289 (= res!832821 (and (= (size!39374 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39373 _keys!1118) (size!39374 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248290 () Bool)

(declare-fun e!708319 () Bool)

(assert (=> b!1248290 (= e!708316 (and e!708319 mapRes!48892))))

(declare-fun condMapEmpty!48892 () Bool)

(declare-fun mapDefault!48892 () ValueCell!14948)

