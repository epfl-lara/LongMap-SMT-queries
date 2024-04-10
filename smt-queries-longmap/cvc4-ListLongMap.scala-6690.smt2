; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84116 () Bool)

(assert start!84116)

(declare-fun res!658144 () Bool)

(declare-fun e!554442 () Bool)

(assert (=> start!84116 (=> (not res!658144) (not e!554442))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84116 (= res!658144 (validMask!0 mask!1948))))

(assert (=> start!84116 e!554442))

(assert (=> start!84116 true))

(declare-datatypes ((V!35541 0))(
  ( (V!35542 (val!11510 Int)) )
))
(declare-datatypes ((ValueCell!10978 0))(
  ( (ValueCellFull!10978 (v!14072 V!35541)) (EmptyCell!10978) )
))
(declare-datatypes ((array!61825 0))(
  ( (array!61826 (arr!29770 (Array (_ BitVec 32) ValueCell!10978)) (size!30249 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61825)

(declare-fun e!554441 () Bool)

(declare-fun array_inv!23019 (array!61825) Bool)

(assert (=> start!84116 (and (array_inv!23019 _values!1278) e!554441)))

(declare-datatypes ((array!61827 0))(
  ( (array!61828 (arr!29771 (Array (_ BitVec 32) (_ BitVec 64))) (size!30250 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61827)

(declare-fun array_inv!23020 (array!61827) Bool)

(assert (=> start!84116 (array_inv!23020 _keys!1544)))

(declare-fun mapNonEmpty!36407 () Bool)

(declare-fun mapRes!36407 () Bool)

(declare-fun tp!69091 () Bool)

(declare-fun e!554443 () Bool)

(assert (=> mapNonEmpty!36407 (= mapRes!36407 (and tp!69091 e!554443))))

(declare-fun mapKey!36407 () (_ BitVec 32))

(declare-fun mapValue!36407 () ValueCell!10978)

(declare-fun mapRest!36407 () (Array (_ BitVec 32) ValueCell!10978))

(assert (=> mapNonEmpty!36407 (= (arr!29770 _values!1278) (store mapRest!36407 mapKey!36407 mapValue!36407))))

(declare-fun mapIsEmpty!36407 () Bool)

(assert (=> mapIsEmpty!36407 mapRes!36407))

(declare-fun b!983536 () Bool)

(declare-fun e!554444 () Bool)

(declare-fun tp_is_empty!22919 () Bool)

(assert (=> b!983536 (= e!554444 tp_is_empty!22919)))

(declare-fun b!983537 () Bool)

(declare-fun res!658145 () Bool)

(assert (=> b!983537 (=> (not res!658145) (not e!554442))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983537 (= res!658145 (and (= (size!30249 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30250 _keys!1544) (size!30249 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983538 () Bool)

(declare-fun res!658143 () Bool)

(assert (=> b!983538 (=> (not res!658143) (not e!554442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61827 (_ BitVec 32)) Bool)

(assert (=> b!983538 (= res!658143 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983539 () Bool)

(assert (=> b!983539 (= e!554443 tp_is_empty!22919)))

(declare-fun b!983540 () Bool)

(assert (=> b!983540 (= e!554442 false)))

(declare-fun lt!436535 () Bool)

(declare-datatypes ((List!20615 0))(
  ( (Nil!20612) (Cons!20611 (h!21773 (_ BitVec 64)) (t!29406 List!20615)) )
))
(declare-fun arrayNoDuplicates!0 (array!61827 (_ BitVec 32) List!20615) Bool)

(assert (=> b!983540 (= lt!436535 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20612))))

(declare-fun b!983541 () Bool)

(assert (=> b!983541 (= e!554441 (and e!554444 mapRes!36407))))

(declare-fun condMapEmpty!36407 () Bool)

(declare-fun mapDefault!36407 () ValueCell!10978)

