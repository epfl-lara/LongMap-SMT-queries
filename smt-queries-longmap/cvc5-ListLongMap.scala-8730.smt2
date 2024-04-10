; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105874 () Bool)

(assert start!105874)

(declare-fun b_free!27415 () Bool)

(declare-fun b_next!27415 () Bool)

(assert (=> start!105874 (= b_free!27415 (not b_next!27415))))

(declare-fun tp!95776 () Bool)

(declare-fun b_and!45323 () Bool)

(assert (=> start!105874 (= tp!95776 b_and!45323)))

(declare-fun b!1261105 () Bool)

(declare-fun e!717706 () Bool)

(declare-fun tp_is_empty!32317 () Bool)

(assert (=> b!1261105 (= e!717706 tp_is_empty!32317)))

(declare-fun b!1261106 () Bool)

(declare-fun res!840385 () Bool)

(declare-fun e!717708 () Bool)

(assert (=> b!1261106 (=> (not res!840385) (not e!717708))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82248 0))(
  ( (array!82249 (arr!39677 (Array (_ BitVec 32) (_ BitVec 64))) (size!40213 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82248)

(declare-datatypes ((V!48455 0))(
  ( (V!48456 (val!16221 Int)) )
))
(declare-datatypes ((ValueCell!15395 0))(
  ( (ValueCellFull!15395 (v!18925 V!48455)) (EmptyCell!15395) )
))
(declare-datatypes ((array!82250 0))(
  ( (array!82251 (arr!39678 (Array (_ BitVec 32) ValueCell!15395)) (size!40214 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82250)

(assert (=> b!1261106 (= res!840385 (and (= (size!40214 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40213 _keys!1118) (size!40214 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50278 () Bool)

(declare-fun mapRes!50278 () Bool)

(declare-fun tp!95777 () Bool)

(assert (=> mapNonEmpty!50278 (= mapRes!50278 (and tp!95777 e!717706))))

(declare-fun mapKey!50278 () (_ BitVec 32))

(declare-fun mapRest!50278 () (Array (_ BitVec 32) ValueCell!15395))

(declare-fun mapValue!50278 () ValueCell!15395)

(assert (=> mapNonEmpty!50278 (= (arr!39678 _values!914) (store mapRest!50278 mapKey!50278 mapValue!50278))))

(declare-fun b!1261107 () Bool)

(declare-fun res!840384 () Bool)

(assert (=> b!1261107 (=> (not res!840384) (not e!717708))))

(declare-datatypes ((List!28189 0))(
  ( (Nil!28186) (Cons!28185 (h!29394 (_ BitVec 64)) (t!41688 List!28189)) )
))
(declare-fun arrayNoDuplicates!0 (array!82248 (_ BitVec 32) List!28189) Bool)

(assert (=> b!1261107 (= res!840384 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28186))))

(declare-fun b!1261108 () Bool)

(declare-fun res!840382 () Bool)

(assert (=> b!1261108 (=> (not res!840382) (not e!717708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82248 (_ BitVec 32)) Bool)

(assert (=> b!1261108 (= res!840382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!840383 () Bool)

(assert (=> start!105874 (=> (not res!840383) (not e!717708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105874 (= res!840383 (validMask!0 mask!1466))))

(assert (=> start!105874 e!717708))

(assert (=> start!105874 true))

(assert (=> start!105874 tp!95776))

(assert (=> start!105874 tp_is_empty!32317))

(declare-fun array_inv!30207 (array!82248) Bool)

(assert (=> start!105874 (array_inv!30207 _keys!1118)))

(declare-fun e!717710 () Bool)

(declare-fun array_inv!30208 (array!82250) Bool)

(assert (=> start!105874 (and (array_inv!30208 _values!914) e!717710)))

(declare-fun b!1261109 () Bool)

(declare-fun e!717709 () Bool)

(assert (=> b!1261109 (= e!717709 tp_is_empty!32317)))

(declare-fun mapIsEmpty!50278 () Bool)

(assert (=> mapIsEmpty!50278 mapRes!50278))

(declare-fun b!1261110 () Bool)

(assert (=> b!1261110 (= e!717710 (and e!717709 mapRes!50278))))

(declare-fun condMapEmpty!50278 () Bool)

(declare-fun mapDefault!50278 () ValueCell!15395)

