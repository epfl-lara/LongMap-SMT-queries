; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104692 () Bool)

(assert start!104692)

(declare-fun b_free!26509 () Bool)

(declare-fun b_next!26509 () Bool)

(assert (=> start!104692 (= b_free!26509 (not b_next!26509))))

(declare-fun tp!93014 () Bool)

(declare-fun b_and!44273 () Bool)

(assert (=> start!104692 (= tp!93014 b_and!44273)))

(declare-fun res!832751 () Bool)

(declare-fun e!708226 () Bool)

(assert (=> start!104692 (=> (not res!832751) (not e!708226))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104692 (= res!832751 (validMask!0 mask!1466))))

(assert (=> start!104692 e!708226))

(assert (=> start!104692 true))

(assert (=> start!104692 tp!93014))

(declare-fun tp_is_empty!31411 () Bool)

(assert (=> start!104692 tp_is_empty!31411))

(declare-datatypes ((array!80514 0))(
  ( (array!80515 (arr!38825 (Array (_ BitVec 32) (_ BitVec 64))) (size!39361 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80514)

(declare-fun array_inv!29635 (array!80514) Bool)

(assert (=> start!104692 (array_inv!29635 _keys!1118)))

(declare-datatypes ((V!47247 0))(
  ( (V!47248 (val!15768 Int)) )
))
(declare-datatypes ((ValueCell!14942 0))(
  ( (ValueCellFull!14942 (v!18464 V!47247)) (EmptyCell!14942) )
))
(declare-datatypes ((array!80516 0))(
  ( (array!80517 (arr!38826 (Array (_ BitVec 32) ValueCell!14942)) (size!39362 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80516)

(declare-fun e!708225 () Bool)

(declare-fun array_inv!29636 (array!80516) Bool)

(assert (=> start!104692 (and (array_inv!29636 _values!914) e!708225)))

(declare-fun mapIsEmpty!48874 () Bool)

(declare-fun mapRes!48874 () Bool)

(assert (=> mapIsEmpty!48874 mapRes!48874))

(declare-fun b!1248161 () Bool)

(declare-fun res!832752 () Bool)

(assert (=> b!1248161 (=> (not res!832752) (not e!708226))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80514 (_ BitVec 32)) Bool)

(assert (=> b!1248161 (= res!832752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1248162 () Bool)

(assert (=> b!1248162 (= e!708226 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!47247)

(declare-datatypes ((tuple2!20310 0))(
  ( (tuple2!20311 (_1!10166 (_ BitVec 64)) (_2!10166 V!47247)) )
))
(declare-datatypes ((List!27558 0))(
  ( (Nil!27555) (Cons!27554 (h!28763 tuple2!20310) (t!41027 List!27558)) )
))
(declare-datatypes ((ListLongMap!18183 0))(
  ( (ListLongMap!18184 (toList!9107 List!27558)) )
))
(declare-fun lt!563368 () ListLongMap!18183)

(declare-fun minValueBefore!43 () V!47247)

(declare-fun getCurrentListMapNoExtraKeys!5514 (array!80514 array!80516 (_ BitVec 32) (_ BitVec 32) V!47247 V!47247 (_ BitVec 32) Int) ListLongMap!18183)

(assert (=> b!1248162 (= lt!563368 (getCurrentListMapNoExtraKeys!5514 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1248163 () Bool)

(declare-fun e!708227 () Bool)

(assert (=> b!1248163 (= e!708225 (and e!708227 mapRes!48874))))

(declare-fun condMapEmpty!48874 () Bool)

(declare-fun mapDefault!48874 () ValueCell!14942)

