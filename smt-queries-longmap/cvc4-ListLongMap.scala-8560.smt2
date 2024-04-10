; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104528 () Bool)

(assert start!104528)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun b!1246965 () Bool)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((V!47099 0))(
  ( (V!47100 (val!15713 Int)) )
))
(declare-datatypes ((ValueCell!14887 0))(
  ( (ValueCellFull!14887 (v!18408 V!47099)) (EmptyCell!14887) )
))
(declare-datatypes ((array!80292 0))(
  ( (array!80293 (arr!38720 (Array (_ BitVec 32) ValueCell!14887)) (size!39256 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80292)

(declare-datatypes ((array!80294 0))(
  ( (array!80295 (arr!38721 (Array (_ BitVec 32) (_ BitVec 64))) (size!39257 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80294)

(declare-fun e!707280 () Bool)

(assert (=> b!1246965 (= e!707280 (and (= (size!39256 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39257 _keys!1118) (size!39256 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (size!39257 _keys!1118) (bvadd #b00000000000000000000000000000001 mask!1466)))))))

(declare-fun res!832132 () Bool)

(assert (=> start!104528 (=> (not res!832132) (not e!707280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104528 (= res!832132 (validMask!0 mask!1466))))

(assert (=> start!104528 e!707280))

(assert (=> start!104528 true))

(declare-fun array_inv!29567 (array!80294) Bool)

(assert (=> start!104528 (array_inv!29567 _keys!1118)))

(declare-fun e!707281 () Bool)

(declare-fun array_inv!29568 (array!80292) Bool)

(assert (=> start!104528 (and (array_inv!29568 _values!914) e!707281)))

(declare-fun b!1246966 () Bool)

(declare-fun e!707282 () Bool)

(declare-fun tp_is_empty!31301 () Bool)

(assert (=> b!1246966 (= e!707282 tp_is_empty!31301)))

(declare-fun mapIsEmpty!48691 () Bool)

(declare-fun mapRes!48691 () Bool)

(assert (=> mapIsEmpty!48691 mapRes!48691))

(declare-fun b!1246967 () Bool)

(assert (=> b!1246967 (= e!707281 (and e!707282 mapRes!48691))))

(declare-fun condMapEmpty!48691 () Bool)

(declare-fun mapDefault!48691 () ValueCell!14887)

