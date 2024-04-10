; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84272 () Bool)

(assert start!84272)

(declare-fun b!985921 () Bool)

(declare-fun res!659720 () Bool)

(declare-fun e!555774 () Bool)

(assert (=> b!985921 (=> (not res!659720) (not e!555774))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35749 0))(
  ( (V!35750 (val!11588 Int)) )
))
(declare-datatypes ((ValueCell!11056 0))(
  ( (ValueCellFull!11056 (v!14150 V!35749)) (EmptyCell!11056) )
))
(declare-datatypes ((array!62123 0))(
  ( (array!62124 (arr!29919 (Array (_ BitVec 32) ValueCell!11056)) (size!30398 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62123)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62125 0))(
  ( (array!62126 (arr!29920 (Array (_ BitVec 32) (_ BitVec 64))) (size!30399 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62125)

(assert (=> b!985921 (= res!659720 (and (= (size!30398 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30399 _keys!1544) (size!30398 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985922 () Bool)

(declare-fun res!659718 () Bool)

(assert (=> b!985922 (=> (not res!659718) (not e!555774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62125 (_ BitVec 32)) Bool)

(assert (=> b!985922 (= res!659718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun res!659719 () Bool)

(assert (=> start!84272 (=> (not res!659719) (not e!555774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84272 (= res!659719 (validMask!0 mask!1948))))

(assert (=> start!84272 e!555774))

(assert (=> start!84272 true))

(declare-fun e!555773 () Bool)

(declare-fun array_inv!23123 (array!62123) Bool)

(assert (=> start!84272 (and (array_inv!23123 _values!1278) e!555773)))

(declare-fun array_inv!23124 (array!62125) Bool)

(assert (=> start!84272 (array_inv!23124 _keys!1544)))

(declare-fun mapIsEmpty!36641 () Bool)

(declare-fun mapRes!36641 () Bool)

(assert (=> mapIsEmpty!36641 mapRes!36641))

(declare-fun b!985923 () Bool)

(declare-fun e!555775 () Bool)

(declare-fun tp_is_empty!23075 () Bool)

(assert (=> b!985923 (= e!555775 tp_is_empty!23075)))

(declare-fun b!985924 () Bool)

(assert (=> b!985924 (= e!555774 false)))

(declare-fun lt!437408 () Bool)

(declare-datatypes ((List!20721 0))(
  ( (Nil!20718) (Cons!20717 (h!21879 (_ BitVec 64)) (t!29620 List!20721)) )
))
(declare-fun arrayNoDuplicates!0 (array!62125 (_ BitVec 32) List!20721) Bool)

(assert (=> b!985924 (= lt!437408 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20718))))

(declare-fun b!985925 () Bool)

(declare-fun e!555776 () Bool)

(assert (=> b!985925 (= e!555776 tp_is_empty!23075)))

(declare-fun b!985926 () Bool)

(assert (=> b!985926 (= e!555773 (and e!555775 mapRes!36641))))

(declare-fun condMapEmpty!36641 () Bool)

(declare-fun mapDefault!36641 () ValueCell!11056)

