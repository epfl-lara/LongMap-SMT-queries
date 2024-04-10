; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83612 () Bool)

(assert start!83612)

(declare-fun mapNonEmpty!35702 () Bool)

(declare-fun mapRes!35702 () Bool)

(declare-fun tp!67954 () Bool)

(declare-fun e!550576 () Bool)

(assert (=> mapNonEmpty!35702 (= mapRes!35702 (and tp!67954 e!550576))))

(declare-fun mapKey!35702 () (_ BitVec 32))

(declare-datatypes ((V!34929 0))(
  ( (V!34930 (val!11280 Int)) )
))
(declare-datatypes ((ValueCell!10748 0))(
  ( (ValueCellFull!10748 (v!13841 V!34929)) (EmptyCell!10748) )
))
(declare-datatypes ((array!60945 0))(
  ( (array!60946 (arr!29335 (Array (_ BitVec 32) ValueCell!10748)) (size!29814 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60945)

(declare-fun mapRest!35702 () (Array (_ BitVec 32) ValueCell!10748))

(declare-fun mapValue!35702 () ValueCell!10748)

(assert (=> mapNonEmpty!35702 (= (arr!29335 _values!1278) (store mapRest!35702 mapKey!35702 mapValue!35702))))

(declare-fun b!976902 () Bool)

(declare-fun e!550573 () Bool)

(declare-fun tp_is_empty!22459 () Bool)

(assert (=> b!976902 (= e!550573 tp_is_empty!22459)))

(declare-fun res!653919 () Bool)

(declare-fun e!550574 () Bool)

(assert (=> start!83612 (=> (not res!653919) (not e!550574))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83612 (= res!653919 (validMask!0 mask!1948))))

(assert (=> start!83612 e!550574))

(assert (=> start!83612 true))

(declare-fun e!550575 () Bool)

(declare-fun array_inv!22677 (array!60945) Bool)

(assert (=> start!83612 (and (array_inv!22677 _values!1278) e!550575)))

(declare-datatypes ((array!60947 0))(
  ( (array!60948 (arr!29336 (Array (_ BitVec 32) (_ BitVec 64))) (size!29815 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60947)

(declare-fun array_inv!22678 (array!60947) Bool)

(assert (=> start!83612 (array_inv!22678 _keys!1544)))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun b!976903 () Bool)

(assert (=> b!976903 (= e!550574 (and (= (size!29814 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29815 _keys!1544) (size!29814 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011) (not (= (size!29815 _keys!1544) (bvadd #b00000000000000000000000000000001 mask!1948)))))))

(declare-fun b!976904 () Bool)

(assert (=> b!976904 (= e!550575 (and e!550573 mapRes!35702))))

(declare-fun condMapEmpty!35702 () Bool)

(declare-fun mapDefault!35702 () ValueCell!10748)

