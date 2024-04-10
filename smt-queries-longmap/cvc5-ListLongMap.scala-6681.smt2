; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84058 () Bool)

(assert start!84058)

(declare-fun b_free!19813 () Bool)

(declare-fun b_next!19813 () Bool)

(assert (=> start!84058 (= b_free!19813 (not b_next!19813))))

(declare-fun tp!68961 () Bool)

(declare-fun b_and!31709 () Bool)

(assert (=> start!84058 (= tp!68961 b_and!31709)))

(declare-fun b!982769 () Bool)

(declare-fun res!657674 () Bool)

(declare-fun e!553968 () Bool)

(assert (=> b!982769 (=> (not res!657674) (not e!553968))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61711 0))(
  ( (array!61712 (arr!29713 (Array (_ BitVec 32) (_ BitVec 64))) (size!30192 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61711)

(assert (=> b!982769 (= res!657674 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30192 _keys!1544))))))

(declare-fun mapNonEmpty!36320 () Bool)

(declare-fun mapRes!36320 () Bool)

(declare-fun tp!68962 () Bool)

(declare-fun e!553964 () Bool)

(assert (=> mapNonEmpty!36320 (= mapRes!36320 (and tp!68962 e!553964))))

(declare-datatypes ((V!35465 0))(
  ( (V!35466 (val!11481 Int)) )
))
(declare-datatypes ((ValueCell!10949 0))(
  ( (ValueCellFull!10949 (v!14043 V!35465)) (EmptyCell!10949) )
))
(declare-datatypes ((array!61713 0))(
  ( (array!61714 (arr!29714 (Array (_ BitVec 32) ValueCell!10949)) (size!30193 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61713)

(declare-fun mapValue!36320 () ValueCell!10949)

(declare-fun mapKey!36320 () (_ BitVec 32))

(declare-fun mapRest!36320 () (Array (_ BitVec 32) ValueCell!10949))

(assert (=> mapNonEmpty!36320 (= (arr!29714 _values!1278) (store mapRest!36320 mapKey!36320 mapValue!36320))))

(declare-fun b!982770 () Bool)

(declare-fun res!657670 () Bool)

(assert (=> b!982770 (=> (not res!657670) (not e!553968))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982770 (= res!657670 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!657673 () Bool)

(assert (=> start!84058 (=> (not res!657673) (not e!553968))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84058 (= res!657673 (validMask!0 mask!1948))))

(assert (=> start!84058 e!553968))

(assert (=> start!84058 true))

(declare-fun tp_is_empty!22861 () Bool)

(assert (=> start!84058 tp_is_empty!22861))

(declare-fun e!553966 () Bool)

(declare-fun array_inv!22979 (array!61713) Bool)

(assert (=> start!84058 (and (array_inv!22979 _values!1278) e!553966)))

(assert (=> start!84058 tp!68961))

(declare-fun array_inv!22980 (array!61711) Bool)

(assert (=> start!84058 (array_inv!22980 _keys!1544)))

(declare-fun b!982771 () Bool)

(declare-fun e!553965 () Bool)

(assert (=> b!982771 (= e!553966 (and e!553965 mapRes!36320))))

(declare-fun condMapEmpty!36320 () Bool)

(declare-fun mapDefault!36320 () ValueCell!10949)

