; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105632 () Bool)

(assert start!105632)

(declare-fun b_free!27233 () Bool)

(declare-fun b_next!27233 () Bool)

(assert (=> start!105632 (= b_free!27233 (not b_next!27233))))

(declare-fun tp!95221 () Bool)

(declare-fun b_and!45107 () Bool)

(assert (=> start!105632 (= tp!95221 b_and!45107)))

(declare-fun b!1258273 () Bool)

(declare-fun res!838666 () Bool)

(declare-fun e!715608 () Bool)

(assert (=> b!1258273 (=> (not res!838666) (not e!715608))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!81894 0))(
  ( (array!81895 (arr!39503 (Array (_ BitVec 32) (_ BitVec 64))) (size!40039 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81894)

(declare-datatypes ((V!48211 0))(
  ( (V!48212 (val!16130 Int)) )
))
(declare-datatypes ((ValueCell!15304 0))(
  ( (ValueCellFull!15304 (v!18832 V!48211)) (EmptyCell!15304) )
))
(declare-datatypes ((array!81896 0))(
  ( (array!81897 (arr!39504 (Array (_ BitVec 32) ValueCell!15304)) (size!40040 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81896)

(assert (=> b!1258273 (= res!838666 (and (= (size!40040 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40039 _keys!1118) (size!40040 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49996 () Bool)

(declare-fun mapRes!49996 () Bool)

(assert (=> mapIsEmpty!49996 mapRes!49996))

(declare-fun mapNonEmpty!49996 () Bool)

(declare-fun tp!95222 () Bool)

(declare-fun e!715612 () Bool)

(assert (=> mapNonEmpty!49996 (= mapRes!49996 (and tp!95222 e!715612))))

(declare-fun mapRest!49996 () (Array (_ BitVec 32) ValueCell!15304))

(declare-fun mapKey!49996 () (_ BitVec 32))

(declare-fun mapValue!49996 () ValueCell!15304)

(assert (=> mapNonEmpty!49996 (= (arr!39504 _values!914) (store mapRest!49996 mapKey!49996 mapValue!49996))))

(declare-fun b!1258274 () Bool)

(declare-fun res!838664 () Bool)

(assert (=> b!1258274 (=> (not res!838664) (not e!715608))))

(declare-datatypes ((List!28052 0))(
  ( (Nil!28049) (Cons!28048 (h!29257 (_ BitVec 64)) (t!41545 List!28052)) )
))
(declare-fun arrayNoDuplicates!0 (array!81894 (_ BitVec 32) List!28052) Bool)

(assert (=> b!1258274 (= res!838664 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28049))))

(declare-fun b!1258275 () Bool)

(declare-fun e!715611 () Bool)

(declare-fun e!715609 () Bool)

(assert (=> b!1258275 (= e!715611 (and e!715609 mapRes!49996))))

(declare-fun condMapEmpty!49996 () Bool)

(declare-fun mapDefault!49996 () ValueCell!15304)

