; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!500 () Bool)

(assert start!500)

(declare-fun b!2945 () Bool)

(declare-fun e!1252 () Bool)

(declare-datatypes ((List!39 0))(
  ( (Nil!36) (Cons!35 (h!601 (_ BitVec 64)) (t!2166 List!39)) )
))
(declare-fun noDuplicate!6 (List!39) Bool)

(assert (=> b!2945 (= e!1252 (not (noDuplicate!6 Nil!36)))))

(declare-fun b!2946 () Bool)

(declare-fun res!4919 () Bool)

(assert (=> b!2946 (=> (not res!4919) (not e!1252))))

(declare-datatypes ((array!101 0))(
  ( (array!102 (arr!46 (Array (_ BitVec 32) (_ BitVec 64))) (size!108 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!101)

(assert (=> b!2946 (= res!4919 (and (bvsle #b00000000000000000000000000000000 (size!108 _keys!1806)) (bvslt (size!108 _keys!1806) #b01111111111111111111111111111111)))))

(declare-fun b!2947 () Bool)

(declare-fun e!1251 () Bool)

(declare-fun tp_is_empty!83 () Bool)

(assert (=> b!2947 (= e!1251 tp_is_empty!83)))

(declare-fun res!4916 () Bool)

(assert (=> start!500 (=> (not res!4916) (not e!1252))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!500 (= res!4916 (validMask!0 mask!2250))))

(assert (=> start!500 e!1252))

(assert (=> start!500 true))

(declare-datatypes ((V!287 0))(
  ( (V!288 (val!47 Int)) )
))
(declare-datatypes ((ValueCell!25 0))(
  ( (ValueCellFull!25 (v!1133 V!287)) (EmptyCell!25) )
))
(declare-datatypes ((array!103 0))(
  ( (array!104 (arr!47 (Array (_ BitVec 32) ValueCell!25)) (size!109 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!103)

(declare-fun e!1250 () Bool)

(declare-fun array_inv!27 (array!103) Bool)

(assert (=> start!500 (and (array_inv!27 _values!1492) e!1250)))

(declare-fun array_inv!28 (array!101) Bool)

(assert (=> start!500 (array_inv!28 _keys!1806)))

(declare-fun mapIsEmpty!74 () Bool)

(declare-fun mapRes!74 () Bool)

(assert (=> mapIsEmpty!74 mapRes!74))

(declare-fun b!2948 () Bool)

(declare-fun e!1254 () Bool)

(assert (=> b!2948 (= e!1254 tp_is_empty!83)))

(declare-fun b!2949 () Bool)

(declare-fun res!4917 () Bool)

(assert (=> b!2949 (=> (not res!4917) (not e!1252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101 (_ BitVec 32)) Bool)

(assert (=> b!2949 (= res!4917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!2950 () Bool)

(assert (=> b!2950 (= e!1250 (and e!1254 mapRes!74))))

(declare-fun condMapEmpty!74 () Bool)

(declare-fun mapDefault!74 () ValueCell!25)

