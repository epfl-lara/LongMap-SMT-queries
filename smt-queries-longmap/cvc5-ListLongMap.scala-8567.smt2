; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104610 () Bool)

(assert start!104610)

(declare-fun b!1247431 () Bool)

(declare-fun res!832364 () Bool)

(declare-fun e!707662 () Bool)

(assert (=> b!1247431 (=> (not res!832364) (not e!707662))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80374 0))(
  ( (array!80375 (arr!38756 (Array (_ BitVec 32) (_ BitVec 64))) (size!39292 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80374)

(declare-datatypes ((V!47151 0))(
  ( (V!47152 (val!15732 Int)) )
))
(declare-datatypes ((ValueCell!14906 0))(
  ( (ValueCellFull!14906 (v!18428 V!47151)) (EmptyCell!14906) )
))
(declare-datatypes ((array!80376 0))(
  ( (array!80377 (arr!38757 (Array (_ BitVec 32) ValueCell!14906)) (size!39293 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80376)

(assert (=> b!1247431 (= res!832364 (and (= (size!39293 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39292 _keys!1118) (size!39293 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247432 () Bool)

(declare-fun res!832363 () Bool)

(assert (=> b!1247432 (=> (not res!832363) (not e!707662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80374 (_ BitVec 32)) Bool)

(assert (=> b!1247432 (= res!832363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!48763 () Bool)

(declare-fun mapRes!48763 () Bool)

(declare-fun tp!92864 () Bool)

(declare-fun e!707660 () Bool)

(assert (=> mapNonEmpty!48763 (= mapRes!48763 (and tp!92864 e!707660))))

(declare-fun mapRest!48763 () (Array (_ BitVec 32) ValueCell!14906))

(declare-fun mapValue!48763 () ValueCell!14906)

(declare-fun mapKey!48763 () (_ BitVec 32))

(assert (=> mapNonEmpty!48763 (= (arr!38757 _values!914) (store mapRest!48763 mapKey!48763 mapValue!48763))))

(declare-fun mapIsEmpty!48763 () Bool)

(assert (=> mapIsEmpty!48763 mapRes!48763))

(declare-fun b!1247433 () Bool)

(declare-fun e!707661 () Bool)

(declare-fun tp_is_empty!31339 () Bool)

(assert (=> b!1247433 (= e!707661 tp_is_empty!31339)))

(declare-fun res!832365 () Bool)

(assert (=> start!104610 (=> (not res!832365) (not e!707662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104610 (= res!832365 (validMask!0 mask!1466))))

(assert (=> start!104610 e!707662))

(assert (=> start!104610 true))

(declare-fun array_inv!29593 (array!80374) Bool)

(assert (=> start!104610 (array_inv!29593 _keys!1118)))

(declare-fun e!707659 () Bool)

(declare-fun array_inv!29594 (array!80376) Bool)

(assert (=> start!104610 (and (array_inv!29594 _values!914) e!707659)))

(declare-fun b!1247434 () Bool)

(assert (=> b!1247434 (= e!707662 false)))

(declare-fun lt!563260 () Bool)

(declare-datatypes ((List!27526 0))(
  ( (Nil!27523) (Cons!27522 (h!28731 (_ BitVec 64)) (t!40995 List!27526)) )
))
(declare-fun arrayNoDuplicates!0 (array!80374 (_ BitVec 32) List!27526) Bool)

(assert (=> b!1247434 (= lt!563260 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27523))))

(declare-fun b!1247435 () Bool)

(assert (=> b!1247435 (= e!707659 (and e!707661 mapRes!48763))))

(declare-fun condMapEmpty!48763 () Bool)

(declare-fun mapDefault!48763 () ValueCell!14906)

