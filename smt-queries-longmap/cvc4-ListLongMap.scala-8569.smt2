; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104626 () Bool)

(assert start!104626)

(declare-fun b!1247575 () Bool)

(declare-fun e!707779 () Bool)

(declare-fun tp_is_empty!31355 () Bool)

(assert (=> b!1247575 (= e!707779 tp_is_empty!31355)))

(declare-fun mapNonEmpty!48787 () Bool)

(declare-fun mapRes!48787 () Bool)

(declare-fun tp!92888 () Bool)

(declare-fun e!707781 () Bool)

(assert (=> mapNonEmpty!48787 (= mapRes!48787 (and tp!92888 e!707781))))

(declare-datatypes ((V!47171 0))(
  ( (V!47172 (val!15740 Int)) )
))
(declare-datatypes ((ValueCell!14914 0))(
  ( (ValueCellFull!14914 (v!18436 V!47171)) (EmptyCell!14914) )
))
(declare-fun mapRest!48787 () (Array (_ BitVec 32) ValueCell!14914))

(declare-fun mapKey!48787 () (_ BitVec 32))

(declare-datatypes ((array!80406 0))(
  ( (array!80407 (arr!38772 (Array (_ BitVec 32) ValueCell!14914)) (size!39308 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80406)

(declare-fun mapValue!48787 () ValueCell!14914)

(assert (=> mapNonEmpty!48787 (= (arr!38772 _values!914) (store mapRest!48787 mapKey!48787 mapValue!48787))))

(declare-fun b!1247576 () Bool)

(declare-fun res!832435 () Bool)

(declare-fun e!707780 () Bool)

(assert (=> b!1247576 (=> (not res!832435) (not e!707780))))

(declare-datatypes ((array!80408 0))(
  ( (array!80409 (arr!38773 (Array (_ BitVec 32) (_ BitVec 64))) (size!39309 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80408)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80408 (_ BitVec 32)) Bool)

(assert (=> b!1247576 (= res!832435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247577 () Bool)

(declare-fun res!832437 () Bool)

(assert (=> b!1247577 (=> (not res!832437) (not e!707780))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1247577 (= res!832437 (and (= (size!39308 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39309 _keys!1118) (size!39308 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247578 () Bool)

(declare-fun e!707782 () Bool)

(assert (=> b!1247578 (= e!707782 (and e!707779 mapRes!48787))))

(declare-fun condMapEmpty!48787 () Bool)

(declare-fun mapDefault!48787 () ValueCell!14914)

