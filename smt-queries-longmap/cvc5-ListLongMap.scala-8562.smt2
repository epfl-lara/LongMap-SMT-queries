; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104542 () Bool)

(assert start!104542)

(declare-fun b!1247025 () Bool)

(declare-fun e!707347 () Bool)

(declare-fun tp_is_empty!31309 () Bool)

(assert (=> b!1247025 (= e!707347 tp_is_empty!31309)))

(declare-fun b!1247027 () Bool)

(declare-fun res!832150 () Bool)

(declare-fun e!707344 () Bool)

(assert (=> b!1247027 (=> (not res!832150) (not e!707344))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80308 0))(
  ( (array!80309 (arr!38727 (Array (_ BitVec 32) (_ BitVec 64))) (size!39263 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80308)

(declare-datatypes ((V!47111 0))(
  ( (V!47112 (val!15717 Int)) )
))
(declare-datatypes ((ValueCell!14891 0))(
  ( (ValueCellFull!14891 (v!18412 V!47111)) (EmptyCell!14891) )
))
(declare-datatypes ((array!80310 0))(
  ( (array!80311 (arr!38728 (Array (_ BitVec 32) ValueCell!14891)) (size!39264 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80310)

(assert (=> b!1247027 (= res!832150 (and (= (size!39264 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39263 _keys!1118) (size!39264 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247028 () Bool)

(declare-fun e!707346 () Bool)

(assert (=> b!1247028 (= e!707346 tp_is_empty!31309)))

(declare-fun mapIsEmpty!48706 () Bool)

(declare-fun mapRes!48706 () Bool)

(assert (=> mapIsEmpty!48706 mapRes!48706))

(declare-fun mapNonEmpty!48706 () Bool)

(declare-fun tp!92807 () Bool)

(assert (=> mapNonEmpty!48706 (= mapRes!48706 (and tp!92807 e!707346))))

(declare-fun mapKey!48706 () (_ BitVec 32))

(declare-fun mapValue!48706 () ValueCell!14891)

(declare-fun mapRest!48706 () (Array (_ BitVec 32) ValueCell!14891))

(assert (=> mapNonEmpty!48706 (= (arr!38728 _values!914) (store mapRest!48706 mapKey!48706 mapValue!48706))))

(declare-fun b!1247026 () Bool)

(declare-fun res!832149 () Bool)

(assert (=> b!1247026 (=> (not res!832149) (not e!707344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80308 (_ BitVec 32)) Bool)

(assert (=> b!1247026 (= res!832149 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun res!832148 () Bool)

(assert (=> start!104542 (=> (not res!832148) (not e!707344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104542 (= res!832148 (validMask!0 mask!1466))))

(assert (=> start!104542 e!707344))

(assert (=> start!104542 true))

(declare-fun array_inv!29573 (array!80308) Bool)

(assert (=> start!104542 (array_inv!29573 _keys!1118)))

(declare-fun e!707345 () Bool)

(declare-fun array_inv!29574 (array!80310) Bool)

(assert (=> start!104542 (and (array_inv!29574 _values!914) e!707345)))

(declare-fun b!1247029 () Bool)

(assert (=> b!1247029 (= e!707345 (and e!707347 mapRes!48706))))

(declare-fun condMapEmpty!48706 () Bool)

(declare-fun mapDefault!48706 () ValueCell!14891)

