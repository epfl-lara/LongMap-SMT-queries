; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83110 () Bool)

(assert start!83110)

(declare-fun b_free!19103 () Bool)

(declare-fun b_next!19103 () Bool)

(assert (=> start!83110 (= b_free!19103 (not b_next!19103))))

(declare-fun tp!66588 () Bool)

(declare-fun b_and!30591 () Bool)

(assert (=> start!83110 (= tp!66588 b_and!30591)))

(declare-fun mapNonEmpty!35011 () Bool)

(declare-fun mapRes!35011 () Bool)

(declare-fun tp!66587 () Bool)

(declare-fun e!546574 () Bool)

(assert (=> mapNonEmpty!35011 (= mapRes!35011 (and tp!66587 e!546574))))

(declare-datatypes ((V!34317 0))(
  ( (V!34318 (val!11051 Int)) )
))
(declare-datatypes ((ValueCell!10519 0))(
  ( (ValueCellFull!10519 (v!13610 V!34317)) (EmptyCell!10519) )
))
(declare-datatypes ((array!60067 0))(
  ( (array!60068 (arr!28897 (Array (_ BitVec 32) ValueCell!10519)) (size!29376 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60067)

(declare-fun mapKey!35011 () (_ BitVec 32))

(declare-fun mapRest!35011 () (Array (_ BitVec 32) ValueCell!10519))

(declare-fun mapValue!35011 () ValueCell!10519)

(assert (=> mapNonEmpty!35011 (= (arr!28897 _values!1425) (store mapRest!35011 mapKey!35011 mapValue!35011))))

(declare-fun b!969485 () Bool)

(declare-fun res!648893 () Bool)

(declare-fun e!546573 () Bool)

(assert (=> b!969485 (=> (not res!648893) (not e!546573))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60069 0))(
  ( (array!60070 (arr!28898 (Array (_ BitVec 32) (_ BitVec 64))) (size!29377 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60069)

(assert (=> b!969485 (= res!648893 (and (= (size!29376 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29377 _keys!1717) (size!29376 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969486 () Bool)

(declare-fun tp_is_empty!22001 () Bool)

(assert (=> b!969486 (= e!546574 tp_is_empty!22001)))

(declare-fun b!969487 () Bool)

(declare-fun e!546572 () Bool)

(declare-fun e!546570 () Bool)

(assert (=> b!969487 (= e!546572 (and e!546570 mapRes!35011))))

(declare-fun condMapEmpty!35011 () Bool)

(declare-fun mapDefault!35011 () ValueCell!10519)

