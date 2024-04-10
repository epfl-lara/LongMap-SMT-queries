; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104786 () Bool)

(assert start!104786)

(declare-fun b_free!26591 () Bool)

(declare-fun b_next!26591 () Bool)

(assert (=> start!104786 (= b_free!26591 (not b_next!26591))))

(declare-fun tp!93263 () Bool)

(declare-fun b_and!44359 () Bool)

(assert (=> start!104786 (= tp!93263 b_and!44359)))

(declare-fun b!1249095 () Bool)

(declare-fun res!833269 () Bool)

(declare-fun e!708888 () Bool)

(assert (=> b!1249095 (=> (not res!833269) (not e!708888))))

(declare-datatypes ((array!80670 0))(
  ( (array!80671 (arr!38902 (Array (_ BitVec 32) (_ BitVec 64))) (size!39438 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80670)

(declare-datatypes ((List!27611 0))(
  ( (Nil!27608) (Cons!27607 (h!28816 (_ BitVec 64)) (t!41082 List!27611)) )
))
(declare-fun arrayNoDuplicates!0 (array!80670 (_ BitVec 32) List!27611) Bool)

(assert (=> b!1249095 (= res!833269 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27608))))

(declare-fun mapIsEmpty!49000 () Bool)

(declare-fun mapRes!49000 () Bool)

(assert (=> mapIsEmpty!49000 mapRes!49000))

(declare-fun b!1249096 () Bool)

(declare-fun e!708889 () Bool)

(declare-fun tp_is_empty!31493 () Bool)

(assert (=> b!1249096 (= e!708889 tp_is_empty!31493)))

(declare-fun b!1249097 () Bool)

(assert (=> b!1249097 (= e!708888 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((V!47355 0))(
  ( (V!47356 (val!15809 Int)) )
))
(declare-fun minValueAfter!43 () V!47355)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47355)

(declare-datatypes ((ValueCell!14983 0))(
  ( (ValueCellFull!14983 (v!18505 V!47355)) (EmptyCell!14983) )
))
(declare-datatypes ((array!80672 0))(
  ( (array!80673 (arr!38903 (Array (_ BitVec 32) ValueCell!14983)) (size!39439 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80672)

(declare-datatypes ((tuple2!20364 0))(
  ( (tuple2!20365 (_1!10193 (_ BitVec 64)) (_2!10193 V!47355)) )
))
(declare-datatypes ((List!27612 0))(
  ( (Nil!27609) (Cons!27608 (h!28817 tuple2!20364) (t!41083 List!27612)) )
))
(declare-datatypes ((ListLongMap!18237 0))(
  ( (ListLongMap!18238 (toList!9134 List!27612)) )
))
(declare-fun lt!563601 () ListLongMap!18237)

(declare-fun getCurrentListMapNoExtraKeys!5541 (array!80670 array!80672 (_ BitVec 32) (_ BitVec 32) V!47355 V!47355 (_ BitVec 32) Int) ListLongMap!18237)

(assert (=> b!1249097 (= lt!563601 (getCurrentListMapNoExtraKeys!5541 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!563602 () ListLongMap!18237)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!47355)

(assert (=> b!1249097 (= lt!563602 (getCurrentListMapNoExtraKeys!5541 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!833270 () Bool)

(assert (=> start!104786 (=> (not res!833270) (not e!708888))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104786 (= res!833270 (validMask!0 mask!1466))))

(assert (=> start!104786 e!708888))

(assert (=> start!104786 true))

(assert (=> start!104786 tp!93263))

(assert (=> start!104786 tp_is_empty!31493))

(declare-fun array_inv!29689 (array!80670) Bool)

(assert (=> start!104786 (array_inv!29689 _keys!1118)))

(declare-fun e!708891 () Bool)

(declare-fun array_inv!29690 (array!80672) Bool)

(assert (=> start!104786 (and (array_inv!29690 _values!914) e!708891)))

(declare-fun b!1249098 () Bool)

(assert (=> b!1249098 (= e!708891 (and e!708889 mapRes!49000))))

(declare-fun condMapEmpty!49000 () Bool)

(declare-fun mapDefault!49000 () ValueCell!14983)

