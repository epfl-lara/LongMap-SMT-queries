; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104734 () Bool)

(assert start!104734)

(declare-fun b_free!26539 () Bool)

(declare-fun b_next!26539 () Bool)

(assert (=> start!104734 (= b_free!26539 (not b_next!26539))))

(declare-fun tp!93106 () Bool)

(declare-fun b_and!44307 () Bool)

(assert (=> start!104734 (= tp!93106 b_and!44307)))

(declare-fun mapNonEmpty!48922 () Bool)

(declare-fun mapRes!48922 () Bool)

(declare-fun tp!93107 () Bool)

(declare-fun e!708502 () Bool)

(assert (=> mapNonEmpty!48922 (= mapRes!48922 (and tp!93107 e!708502))))

(declare-datatypes ((V!47287 0))(
  ( (V!47288 (val!15783 Int)) )
))
(declare-datatypes ((ValueCell!14957 0))(
  ( (ValueCellFull!14957 (v!18479 V!47287)) (EmptyCell!14957) )
))
(declare-fun mapValue!48922 () ValueCell!14957)

(declare-fun mapKey!48922 () (_ BitVec 32))

(declare-datatypes ((array!80574 0))(
  ( (array!80575 (arr!38854 (Array (_ BitVec 32) ValueCell!14957)) (size!39390 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80574)

(declare-fun mapRest!48922 () (Array (_ BitVec 32) ValueCell!14957))

(assert (=> mapNonEmpty!48922 (= (arr!38854 _values!914) (store mapRest!48922 mapKey!48922 mapValue!48922))))

(declare-fun b!1248549 () Bool)

(declare-fun e!708501 () Bool)

(declare-fun tp_is_empty!31441 () Bool)

(assert (=> b!1248549 (= e!708501 tp_is_empty!31441)))

(declare-fun b!1248550 () Bool)

(declare-fun res!832957 () Bool)

(declare-fun e!708500 () Bool)

(assert (=> b!1248550 (=> (not res!832957) (not e!708500))))

(declare-datatypes ((array!80576 0))(
  ( (array!80577 (arr!38855 (Array (_ BitVec 32) (_ BitVec 64))) (size!39391 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80576)

(declare-datatypes ((List!27575 0))(
  ( (Nil!27572) (Cons!27571 (h!28780 (_ BitVec 64)) (t!41046 List!27575)) )
))
(declare-fun arrayNoDuplicates!0 (array!80576 (_ BitVec 32) List!27575) Bool)

(assert (=> b!1248550 (= res!832957 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27572))))

(declare-fun b!1248551 () Bool)

(assert (=> b!1248551 (= e!708502 tp_is_empty!31441)))

(declare-fun b!1248552 () Bool)

(declare-fun res!832958 () Bool)

(assert (=> b!1248552 (=> (not res!832958) (not e!708500))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1248552 (= res!832958 (and (= (size!39390 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39391 _keys!1118) (size!39390 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1248553 () Bool)

(declare-fun res!832956 () Bool)

(assert (=> b!1248553 (=> (not res!832956) (not e!708500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80576 (_ BitVec 32)) Bool)

(assert (=> b!1248553 (= res!832956 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapIsEmpty!48922 () Bool)

(assert (=> mapIsEmpty!48922 mapRes!48922))

(declare-fun b!1248554 () Bool)

(declare-fun e!708498 () Bool)

(assert (=> b!1248554 (= e!708498 (and e!708501 mapRes!48922))))

(declare-fun condMapEmpty!48922 () Bool)

(declare-fun mapDefault!48922 () ValueCell!14957)

