; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108108 () Bool)

(assert start!108108)

(declare-fun b_free!27821 () Bool)

(declare-fun b_next!27821 () Bool)

(assert (=> start!108108 (= b_free!27821 (not b_next!27821))))

(declare-fun tp!98417 () Bool)

(declare-fun b_and!45877 () Bool)

(assert (=> start!108108 (= tp!98417 b_and!45877)))

(declare-fun b!1276691 () Bool)

(declare-fun res!848430 () Bool)

(declare-fun e!729064 () Bool)

(assert (=> b!1276691 (=> (not res!848430) (not e!729064))))

(declare-datatypes ((array!83834 0))(
  ( (array!83835 (arr!40428 (Array (_ BitVec 32) (_ BitVec 64))) (size!40978 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83834)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83834 (_ BitVec 32)) Bool)

(assert (=> b!1276691 (= res!848430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276692 () Bool)

(declare-fun e!729063 () Bool)

(declare-fun e!729066 () Bool)

(declare-fun mapRes!51587 () Bool)

(assert (=> b!1276692 (= e!729063 (and e!729066 mapRes!51587))))

(declare-fun condMapEmpty!51587 () Bool)

(declare-datatypes ((V!49597 0))(
  ( (V!49598 (val!16760 Int)) )
))
(declare-datatypes ((ValueCell!15787 0))(
  ( (ValueCellFull!15787 (v!19357 V!49597)) (EmptyCell!15787) )
))
(declare-datatypes ((array!83836 0))(
  ( (array!83837 (arr!40429 (Array (_ BitVec 32) ValueCell!15787)) (size!40979 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83836)

(declare-fun mapDefault!51587 () ValueCell!15787)

