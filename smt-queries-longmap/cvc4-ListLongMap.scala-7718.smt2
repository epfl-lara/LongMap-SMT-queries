; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96968 () Bool)

(assert start!96968)

(declare-fun b!1103169 () Bool)

(declare-fun e!629703 () Bool)

(declare-fun tp_is_empty!27287 () Bool)

(assert (=> b!1103169 (= e!629703 tp_is_empty!27287)))

(declare-fun mapIsEmpty!42727 () Bool)

(declare-fun mapRes!42727 () Bool)

(assert (=> mapIsEmpty!42727 mapRes!42727))

(declare-fun b!1103170 () Bool)

(declare-fun res!735996 () Bool)

(declare-fun e!629705 () Bool)

(assert (=> b!1103170 (=> (not res!735996) (not e!629705))))

(declare-datatypes ((array!71493 0))(
  ( (array!71494 (arr!34406 (Array (_ BitVec 32) (_ BitVec 64))) (size!34942 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71493)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71493 (_ BitVec 32)) Bool)

(assert (=> b!1103170 (= res!735996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!735995 () Bool)

(assert (=> start!96968 (=> (not res!735995) (not e!629705))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!96968 (= res!735995 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34942 _keys!1208))))))

(assert (=> start!96968 e!629705))

(declare-fun array_inv!26498 (array!71493) Bool)

(assert (=> start!96968 (array_inv!26498 _keys!1208)))

(assert (=> start!96968 true))

(declare-datatypes ((V!41509 0))(
  ( (V!41510 (val!13700 Int)) )
))
(declare-datatypes ((ValueCell!12934 0))(
  ( (ValueCellFull!12934 (v!16331 V!41509)) (EmptyCell!12934) )
))
(declare-datatypes ((array!71495 0))(
  ( (array!71496 (arr!34407 (Array (_ BitVec 32) ValueCell!12934)) (size!34943 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71495)

(declare-fun e!629704 () Bool)

(declare-fun array_inv!26499 (array!71495) Bool)

(assert (=> start!96968 (and (array_inv!26499 _values!996) e!629704)))

(declare-fun b!1103171 () Bool)

(declare-fun e!629707 () Bool)

(assert (=> b!1103171 (= e!629707 tp_is_empty!27287)))

(declare-fun mapNonEmpty!42727 () Bool)

(declare-fun tp!81647 () Bool)

(assert (=> mapNonEmpty!42727 (= mapRes!42727 (and tp!81647 e!629707))))

(declare-fun mapRest!42727 () (Array (_ BitVec 32) ValueCell!12934))

(declare-fun mapKey!42727 () (_ BitVec 32))

(declare-fun mapValue!42727 () ValueCell!12934)

(assert (=> mapNonEmpty!42727 (= (arr!34407 _values!996) (store mapRest!42727 mapKey!42727 mapValue!42727))))

(declare-fun b!1103172 () Bool)

(declare-fun res!735997 () Bool)

(assert (=> b!1103172 (=> (not res!735997) (not e!629705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103172 (= res!735997 (validMask!0 mask!1564))))

(declare-fun b!1103173 () Bool)

(assert (=> b!1103173 (= e!629704 (and e!629703 mapRes!42727))))

(declare-fun condMapEmpty!42727 () Bool)

(declare-fun mapDefault!42727 () ValueCell!12934)

