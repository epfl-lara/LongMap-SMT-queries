; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109286 () Bool)

(assert start!109286)

(declare-fun b_free!28775 () Bool)

(declare-fun b_next!28775 () Bool)

(assert (=> start!109286 (= b_free!28775 (not b_next!28775))))

(declare-fun tp!101444 () Bool)

(declare-fun b_and!46865 () Bool)

(assert (=> start!109286 (= tp!101444 b_and!46865)))

(declare-fun res!859285 () Bool)

(declare-fun e!738035 () Bool)

(assert (=> start!109286 (=> (not res!859285) (not e!738035))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109286 (= res!859285 (validMask!0 mask!2175))))

(assert (=> start!109286 e!738035))

(declare-fun tp_is_empty!34415 () Bool)

(assert (=> start!109286 tp_is_empty!34415))

(assert (=> start!109286 true))

(declare-datatypes ((V!50989 0))(
  ( (V!50990 (val!17282 Int)) )
))
(declare-datatypes ((ValueCell!16309 0))(
  ( (ValueCellFull!16309 (v!19885 V!50989)) (EmptyCell!16309) )
))
(declare-datatypes ((array!85860 0))(
  ( (array!85861 (arr!41431 (Array (_ BitVec 32) ValueCell!16309)) (size!41981 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85860)

(declare-fun e!738034 () Bool)

(declare-fun array_inv!31391 (array!85860) Bool)

(assert (=> start!109286 (and (array_inv!31391 _values!1445) e!738034)))

(declare-datatypes ((array!85862 0))(
  ( (array!85863 (arr!41432 (Array (_ BitVec 32) (_ BitVec 64))) (size!41982 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85862)

(declare-fun array_inv!31392 (array!85862) Bool)

(assert (=> start!109286 (array_inv!31392 _keys!1741)))

(assert (=> start!109286 tp!101444))

(declare-fun mapNonEmpty!53183 () Bool)

(declare-fun mapRes!53183 () Bool)

(declare-fun tp!101443 () Bool)

(declare-fun e!738031 () Bool)

(assert (=> mapNonEmpty!53183 (= mapRes!53183 (and tp!101443 e!738031))))

(declare-fun mapRest!53183 () (Array (_ BitVec 32) ValueCell!16309))

(declare-fun mapValue!53183 () ValueCell!16309)

(declare-fun mapKey!53183 () (_ BitVec 32))

(assert (=> mapNonEmpty!53183 (= (arr!41431 _values!1445) (store mapRest!53183 mapKey!53183 mapValue!53183))))

(declare-fun b!1293152 () Bool)

(declare-fun e!738030 () Bool)

(assert (=> b!1293152 (= e!738034 (and e!738030 mapRes!53183))))

(declare-fun condMapEmpty!53183 () Bool)

(declare-fun mapDefault!53183 () ValueCell!16309)

