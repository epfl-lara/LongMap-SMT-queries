; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104574 () Bool)

(assert start!104574)

(declare-fun b!1247217 () Bool)

(declare-fun e!707497 () Bool)

(declare-datatypes ((List!27521 0))(
  ( (Nil!27518) (Cons!27517 (h!28726 (_ BitVec 64)) (t!40990 List!27521)) )
))
(declare-fun noDuplicate!2039 (List!27521) Bool)

(assert (=> b!1247217 (= e!707497 (not (noDuplicate!2039 Nil!27518)))))

(declare-fun b!1247218 () Bool)

(declare-fun res!832241 () Bool)

(assert (=> b!1247218 (=> (not res!832241) (not e!707497))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80342 0))(
  ( (array!80343 (arr!38742 (Array (_ BitVec 32) (_ BitVec 64))) (size!39278 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80342)

(declare-datatypes ((V!47131 0))(
  ( (V!47132 (val!15725 Int)) )
))
(declare-datatypes ((ValueCell!14899 0))(
  ( (ValueCellFull!14899 (v!18420 V!47131)) (EmptyCell!14899) )
))
(declare-datatypes ((array!80344 0))(
  ( (array!80345 (arr!38743 (Array (_ BitVec 32) ValueCell!14899)) (size!39279 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80344)

(assert (=> b!1247218 (= res!832241 (and (= (size!39279 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39278 _keys!1118) (size!39279 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!48736 () Bool)

(declare-fun mapRes!48736 () Bool)

(assert (=> mapIsEmpty!48736 mapRes!48736))

(declare-fun b!1247219 () Bool)

(declare-fun res!832242 () Bool)

(assert (=> b!1247219 (=> (not res!832242) (not e!707497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80342 (_ BitVec 32)) Bool)

(assert (=> b!1247219 (= res!832242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247220 () Bool)

(declare-fun e!707494 () Bool)

(declare-fun tp_is_empty!31325 () Bool)

(assert (=> b!1247220 (= e!707494 tp_is_empty!31325)))

(declare-fun b!1247221 () Bool)

(declare-fun res!832240 () Bool)

(assert (=> b!1247221 (=> (not res!832240) (not e!707497))))

(assert (=> b!1247221 (= res!832240 (and (bvsle #b00000000000000000000000000000000 (size!39278 _keys!1118)) (bvslt (size!39278 _keys!1118) #b01111111111111111111111111111111)))))

(declare-fun res!832243 () Bool)

(assert (=> start!104574 (=> (not res!832243) (not e!707497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104574 (= res!832243 (validMask!0 mask!1466))))

(assert (=> start!104574 e!707497))

(assert (=> start!104574 true))

(declare-fun array_inv!29585 (array!80342) Bool)

(assert (=> start!104574 (array_inv!29585 _keys!1118)))

(declare-fun e!707498 () Bool)

(declare-fun array_inv!29586 (array!80344) Bool)

(assert (=> start!104574 (and (array_inv!29586 _values!914) e!707498)))

(declare-fun mapNonEmpty!48736 () Bool)

(declare-fun tp!92837 () Bool)

(assert (=> mapNonEmpty!48736 (= mapRes!48736 (and tp!92837 e!707494))))

(declare-fun mapRest!48736 () (Array (_ BitVec 32) ValueCell!14899))

(declare-fun mapValue!48736 () ValueCell!14899)

(declare-fun mapKey!48736 () (_ BitVec 32))

(assert (=> mapNonEmpty!48736 (= (arr!38743 _values!914) (store mapRest!48736 mapKey!48736 mapValue!48736))))

(declare-fun b!1247222 () Bool)

(declare-fun e!707495 () Bool)

(assert (=> b!1247222 (= e!707498 (and e!707495 mapRes!48736))))

(declare-fun condMapEmpty!48736 () Bool)

(declare-fun mapDefault!48736 () ValueCell!14899)

