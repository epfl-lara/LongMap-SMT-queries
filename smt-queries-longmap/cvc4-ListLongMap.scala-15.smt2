; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!486 () Bool)

(assert start!486)

(declare-fun b!2863 () Bool)

(declare-fun res!4876 () Bool)

(declare-fun e!1193 () Bool)

(assert (=> b!2863 (=> (not res!4876) (not e!1193))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!279 0))(
  ( (V!280 (val!44 Int)) )
))
(declare-datatypes ((ValueCell!22 0))(
  ( (ValueCellFull!22 (v!1130 V!279)) (EmptyCell!22) )
))
(declare-datatypes ((array!87 0))(
  ( (array!88 (arr!40 (Array (_ BitVec 32) ValueCell!22)) (size!102 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!87)

(declare-datatypes ((array!89 0))(
  ( (array!90 (arr!41 (Array (_ BitVec 32) (_ BitVec 64))) (size!103 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!89)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!2863 (= res!4876 (and (= (size!102 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!103 _keys!1806) (size!102 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!2864 () Bool)

(declare-fun e!1192 () Bool)

(declare-fun tp_is_empty!77 () Bool)

(assert (=> b!2864 (= e!1192 tp_is_empty!77)))

(declare-fun res!4875 () Bool)

(assert (=> start!486 (=> (not res!4875) (not e!1193))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!486 (= res!4875 (validMask!0 mask!2250))))

(assert (=> start!486 e!1193))

(assert (=> start!486 true))

(declare-fun e!1191 () Bool)

(declare-fun array_inv!21 (array!87) Bool)

(assert (=> start!486 (and (array_inv!21 _values!1492) e!1191)))

(declare-fun array_inv!22 (array!89) Bool)

(assert (=> start!486 (array_inv!22 _keys!1806)))

(declare-fun b!2865 () Bool)

(assert (=> b!2865 (= e!1193 (and (bvsle #b00000000000000000000000000000000 (size!103 _keys!1806)) (bvsge (size!103 _keys!1806) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!62 () Bool)

(declare-fun mapRes!62 () Bool)

(declare-fun tp!302 () Bool)

(declare-fun e!1190 () Bool)

(assert (=> mapNonEmpty!62 (= mapRes!62 (and tp!302 e!1190))))

(declare-fun mapValue!62 () ValueCell!22)

(declare-fun mapRest!62 () (Array (_ BitVec 32) ValueCell!22))

(declare-fun mapKey!62 () (_ BitVec 32))

(assert (=> mapNonEmpty!62 (= (arr!40 _values!1492) (store mapRest!62 mapKey!62 mapValue!62))))

(declare-fun mapIsEmpty!62 () Bool)

(assert (=> mapIsEmpty!62 mapRes!62))

(declare-fun b!2866 () Bool)

(assert (=> b!2866 (= e!1190 tp_is_empty!77)))

(declare-fun b!2867 () Bool)

(assert (=> b!2867 (= e!1191 (and e!1192 mapRes!62))))

(declare-fun condMapEmpty!62 () Bool)

(declare-fun mapDefault!62 () ValueCell!22)

