; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104530 () Bool)

(assert start!104530)

(declare-fun mapNonEmpty!48694 () Bool)

(declare-fun mapRes!48694 () Bool)

(declare-fun tp!92795 () Bool)

(declare-fun e!707294 () Bool)

(assert (=> mapNonEmpty!48694 (= mapRes!48694 (and tp!92795 e!707294))))

(declare-datatypes ((V!47103 0))(
  ( (V!47104 (val!15714 Int)) )
))
(declare-datatypes ((ValueCell!14888 0))(
  ( (ValueCellFull!14888 (v!18409 V!47103)) (EmptyCell!14888) )
))
(declare-fun mapValue!48694 () ValueCell!14888)

(declare-datatypes ((array!80296 0))(
  ( (array!80297 (arr!38722 (Array (_ BitVec 32) ValueCell!14888)) (size!39258 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80296)

(declare-fun mapRest!48694 () (Array (_ BitVec 32) ValueCell!14888))

(declare-fun mapKey!48694 () (_ BitVec 32))

(assert (=> mapNonEmpty!48694 (= (arr!38722 _values!914) (store mapRest!48694 mapKey!48694 mapValue!48694))))

(declare-fun b!1246977 () Bool)

(declare-fun e!707296 () Bool)

(declare-fun tp_is_empty!31303 () Bool)

(assert (=> b!1246977 (= e!707296 tp_is_empty!31303)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun b!1246978 () Bool)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80298 0))(
  ( (array!80299 (arr!38723 (Array (_ BitVec 32) (_ BitVec 64))) (size!39259 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80298)

(declare-fun e!707293 () Bool)

(assert (=> b!1246978 (= e!707293 (and (= (size!39258 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39259 _keys!1118) (size!39258 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (size!39259 _keys!1118) (bvadd #b00000000000000000000000000000001 mask!1466)) (bvsgt #b00000000000000000000000000000000 (size!39259 _keys!1118))))))

(declare-fun res!832135 () Bool)

(assert (=> start!104530 (=> (not res!832135) (not e!707293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104530 (= res!832135 (validMask!0 mask!1466))))

(assert (=> start!104530 e!707293))

(assert (=> start!104530 true))

(declare-fun array_inv!29569 (array!80298) Bool)

(assert (=> start!104530 (array_inv!29569 _keys!1118)))

(declare-fun e!707297 () Bool)

(declare-fun array_inv!29570 (array!80296) Bool)

(assert (=> start!104530 (and (array_inv!29570 _values!914) e!707297)))

(declare-fun b!1246979 () Bool)

(assert (=> b!1246979 (= e!707297 (and e!707296 mapRes!48694))))

(declare-fun condMapEmpty!48694 () Bool)

(declare-fun mapDefault!48694 () ValueCell!14888)

