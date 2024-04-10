; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!530 () Bool)

(assert start!530)

(declare-fun b!3105 () Bool)

(declare-fun res!5014 () Bool)

(declare-fun e!1371 () Bool)

(assert (=> b!3105 (=> (not res!5014) (not e!1371))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!299 0))(
  ( (V!300 (val!51 Int)) )
))
(declare-datatypes ((ValueCell!29 0))(
  ( (ValueCellFull!29 (v!1138 V!299)) (EmptyCell!29) )
))
(declare-datatypes ((array!121 0))(
  ( (array!122 (arr!54 (Array (_ BitVec 32) ValueCell!29)) (size!116 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!121)

(declare-datatypes ((array!123 0))(
  ( (array!124 (arr!55 (Array (_ BitVec 32) (_ BitVec 64))) (size!117 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!123)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3105 (= res!5014 (and (= (size!116 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!117 _keys!1806) (size!116 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun res!5012 () Bool)

(assert (=> start!530 (=> (not res!5012) (not e!1371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!530 (= res!5012 (validMask!0 mask!2250))))

(assert (=> start!530 e!1371))

(assert (=> start!530 true))

(declare-fun e!1372 () Bool)

(declare-fun array_inv!35 (array!121) Bool)

(assert (=> start!530 (and (array_inv!35 _values!1492) e!1372)))

(declare-fun array_inv!36 (array!123) Bool)

(assert (=> start!530 (array_inv!36 _keys!1806)))

(declare-fun b!3106 () Bool)

(assert (=> b!3106 (= e!1371 false)))

(declare-fun lt!420 () Bool)

(declare-datatypes ((List!43 0))(
  ( (Nil!40) (Cons!39 (h!605 (_ BitVec 64)) (t!2170 List!43)) )
))
(declare-fun arrayNoDuplicates!0 (array!123 (_ BitVec 32) List!43) Bool)

(assert (=> b!3106 (= lt!420 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!40))))

(declare-fun mapNonEmpty!92 () Bool)

(declare-fun mapRes!92 () Bool)

(declare-fun tp!332 () Bool)

(declare-fun e!1370 () Bool)

(assert (=> mapNonEmpty!92 (= mapRes!92 (and tp!332 e!1370))))

(declare-fun mapKey!92 () (_ BitVec 32))

(declare-fun mapRest!92 () (Array (_ BitVec 32) ValueCell!29))

(declare-fun mapValue!92 () ValueCell!29)

(assert (=> mapNonEmpty!92 (= (arr!54 _values!1492) (store mapRest!92 mapKey!92 mapValue!92))))

(declare-fun b!3107 () Bool)

(declare-fun tp_is_empty!91 () Bool)

(assert (=> b!3107 (= e!1370 tp_is_empty!91)))

(declare-fun b!3108 () Bool)

(declare-fun e!1373 () Bool)

(assert (=> b!3108 (= e!1372 (and e!1373 mapRes!92))))

(declare-fun condMapEmpty!92 () Bool)

(declare-fun mapDefault!92 () ValueCell!29)

