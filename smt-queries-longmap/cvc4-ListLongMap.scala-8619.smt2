; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104984 () Bool)

(assert start!104984)

(declare-fun b_free!26753 () Bool)

(declare-fun b_next!26753 () Bool)

(assert (=> start!104984 (= b_free!26753 (not b_next!26753))))

(declare-fun tp!93755 () Bool)

(declare-fun b_and!44539 () Bool)

(assert (=> start!104984 (= tp!93755 b_and!44539)))

(declare-fun b!1251315 () Bool)

(declare-fun res!834609 () Bool)

(declare-fun e!710539 () Bool)

(assert (=> b!1251315 (=> (not res!834609) (not e!710539))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80974 0))(
  ( (array!80975 (arr!39052 (Array (_ BitVec 32) (_ BitVec 64))) (size!39588 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80974)

(declare-datatypes ((V!47571 0))(
  ( (V!47572 (val!15890 Int)) )
))
(declare-datatypes ((ValueCell!15064 0))(
  ( (ValueCellFull!15064 (v!18587 V!47571)) (EmptyCell!15064) )
))
(declare-datatypes ((array!80976 0))(
  ( (array!80977 (arr!39053 (Array (_ BitVec 32) ValueCell!15064)) (size!39589 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80976)

(assert (=> b!1251315 (= res!834609 (and (= (size!39589 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39588 _keys!1118) (size!39589 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1251316 () Bool)

(declare-fun e!710541 () Bool)

(declare-fun e!710538 () Bool)

(assert (=> b!1251316 (= e!710541 e!710538)))

(declare-fun res!834613 () Bool)

(assert (=> b!1251316 (=> res!834613 e!710538)))

(declare-datatypes ((tuple2!20486 0))(
  ( (tuple2!20487 (_1!10254 (_ BitVec 64)) (_2!10254 V!47571)) )
))
(declare-datatypes ((List!27719 0))(
  ( (Nil!27716) (Cons!27715 (h!28924 tuple2!20486) (t!41194 List!27719)) )
))
(declare-datatypes ((ListLongMap!18359 0))(
  ( (ListLongMap!18360 (toList!9195 List!27719)) )
))
(declare-fun lt!564755 () ListLongMap!18359)

(declare-fun contains!7506 (ListLongMap!18359 (_ BitVec 64)) Bool)

(assert (=> b!1251316 (= res!834613 (contains!7506 lt!564755 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun zeroValue!871 () V!47571)

(declare-fun minValueBefore!43 () V!47571)

(declare-fun getCurrentListMap!4466 (array!80974 array!80976 (_ BitVec 32) (_ BitVec 32) V!47571 V!47571 (_ BitVec 32) Int) ListLongMap!18359)

(assert (=> b!1251316 (= lt!564755 (getCurrentListMap!4466 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1251317 () Bool)

(declare-fun e!710537 () Bool)

(declare-fun tp_is_empty!31655 () Bool)

(assert (=> b!1251317 (= e!710537 tp_is_empty!31655)))

(declare-fun res!834610 () Bool)

(assert (=> start!104984 (=> (not res!834610) (not e!710539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104984 (= res!834610 (validMask!0 mask!1466))))

(assert (=> start!104984 e!710539))

(assert (=> start!104984 true))

(assert (=> start!104984 tp!93755))

(assert (=> start!104984 tp_is_empty!31655))

(declare-fun array_inv!29791 (array!80974) Bool)

(assert (=> start!104984 (array_inv!29791 _keys!1118)))

(declare-fun e!710535 () Bool)

(declare-fun array_inv!29792 (array!80976) Bool)

(assert (=> start!104984 (and (array_inv!29792 _values!914) e!710535)))

(declare-fun b!1251318 () Bool)

(declare-fun res!834612 () Bool)

(assert (=> b!1251318 (=> (not res!834612) (not e!710539))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80974 (_ BitVec 32)) Bool)

(assert (=> b!1251318 (= res!834612 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1251319 () Bool)

(declare-fun res!834611 () Bool)

(assert (=> b!1251319 (=> (not res!834611) (not e!710539))))

(declare-datatypes ((List!27720 0))(
  ( (Nil!27717) (Cons!27716 (h!28925 (_ BitVec 64)) (t!41195 List!27720)) )
))
(declare-fun arrayNoDuplicates!0 (array!80974 (_ BitVec 32) List!27720) Bool)

(assert (=> b!1251319 (= res!834611 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27717))))

(declare-fun mapNonEmpty!49249 () Bool)

(declare-fun mapRes!49249 () Bool)

(declare-fun tp!93754 () Bool)

(assert (=> mapNonEmpty!49249 (= mapRes!49249 (and tp!93754 e!710537))))

(declare-fun mapKey!49249 () (_ BitVec 32))

(declare-fun mapValue!49249 () ValueCell!15064)

(declare-fun mapRest!49249 () (Array (_ BitVec 32) ValueCell!15064))

(assert (=> mapNonEmpty!49249 (= (arr!39053 _values!914) (store mapRest!49249 mapKey!49249 mapValue!49249))))

(declare-fun mapIsEmpty!49249 () Bool)

(assert (=> mapIsEmpty!49249 mapRes!49249))

(declare-fun b!1251320 () Bool)

(declare-fun e!710536 () Bool)

(assert (=> b!1251320 (= e!710536 tp_is_empty!31655)))

(declare-fun b!1251321 () Bool)

(assert (=> b!1251321 (= e!710535 (and e!710536 mapRes!49249))))

(declare-fun condMapEmpty!49249 () Bool)

(declare-fun mapDefault!49249 () ValueCell!15064)

