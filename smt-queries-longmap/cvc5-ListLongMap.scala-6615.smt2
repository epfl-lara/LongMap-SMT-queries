; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83618 () Bool)

(assert start!83618)

(declare-fun b!976938 () Bool)

(declare-fun e!550617 () Bool)

(declare-fun tp_is_empty!22465 () Bool)

(assert (=> b!976938 (= e!550617 tp_is_empty!22465)))

(declare-fun mapIsEmpty!35711 () Bool)

(declare-fun mapRes!35711 () Bool)

(assert (=> mapIsEmpty!35711 mapRes!35711))

(declare-fun res!653928 () Bool)

(declare-fun e!550618 () Bool)

(assert (=> start!83618 (=> (not res!653928) (not e!550618))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83618 (= res!653928 (validMask!0 mask!1948))))

(assert (=> start!83618 e!550618))

(assert (=> start!83618 true))

(declare-datatypes ((V!34937 0))(
  ( (V!34938 (val!11283 Int)) )
))
(declare-datatypes ((ValueCell!10751 0))(
  ( (ValueCellFull!10751 (v!13844 V!34937)) (EmptyCell!10751) )
))
(declare-datatypes ((array!60957 0))(
  ( (array!60958 (arr!29341 (Array (_ BitVec 32) ValueCell!10751)) (size!29820 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60957)

(declare-fun e!550621 () Bool)

(declare-fun array_inv!22683 (array!60957) Bool)

(assert (=> start!83618 (and (array_inv!22683 _values!1278) e!550621)))

(declare-datatypes ((array!60959 0))(
  ( (array!60960 (arr!29342 (Array (_ BitVec 32) (_ BitVec 64))) (size!29821 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60959)

(declare-fun array_inv!22684 (array!60959) Bool)

(assert (=> start!83618 (array_inv!22684 _keys!1544)))

(declare-fun b!976939 () Bool)

(declare-fun e!550620 () Bool)

(assert (=> b!976939 (= e!550620 tp_is_empty!22465)))

(declare-fun mapNonEmpty!35711 () Bool)

(declare-fun tp!67963 () Bool)

(assert (=> mapNonEmpty!35711 (= mapRes!35711 (and tp!67963 e!550617))))

(declare-fun mapValue!35711 () ValueCell!10751)

(declare-fun mapKey!35711 () (_ BitVec 32))

(declare-fun mapRest!35711 () (Array (_ BitVec 32) ValueCell!10751))

(assert (=> mapNonEmpty!35711 (= (arr!29341 _values!1278) (store mapRest!35711 mapKey!35711 mapValue!35711))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun b!976940 () Bool)

(assert (=> b!976940 (= e!550618 (and (= (size!29820 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29821 _keys!1544) (size!29820 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011) (= (size!29821 _keys!1544) (bvadd #b00000000000000000000000000000001 mask!1948)) (bvsgt #b00000000000000000000000000000000 (size!29821 _keys!1544))))))

(declare-fun b!976941 () Bool)

(assert (=> b!976941 (= e!550621 (and e!550620 mapRes!35711))))

(declare-fun condMapEmpty!35711 () Bool)

(declare-fun mapDefault!35711 () ValueCell!10751)

