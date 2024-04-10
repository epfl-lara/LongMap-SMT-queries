; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82970 () Bool)

(assert start!82970)

(declare-fun b_free!19097 () Bool)

(declare-fun b_next!19097 () Bool)

(assert (=> start!82970 (= b_free!19097 (not b_next!19097))))

(declare-fun tp!66420 () Bool)

(declare-fun b_and!30585 () Bool)

(assert (=> start!82970 (= tp!66420 b_and!30585)))

(declare-fun res!648363 () Bool)

(declare-fun e!545757 () Bool)

(assert (=> start!82970 (=> (not res!648363) (not e!545757))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82970 (= res!648363 (validMask!0 mask!2110))))

(assert (=> start!82970 e!545757))

(assert (=> start!82970 true))

(declare-datatypes ((V!34189 0))(
  ( (V!34190 (val!11003 Int)) )
))
(declare-datatypes ((ValueCell!10471 0))(
  ( (ValueCellFull!10471 (v!13561 V!34189)) (EmptyCell!10471) )
))
(declare-datatypes ((array!59879 0))(
  ( (array!59880 (arr!28808 (Array (_ BitVec 32) ValueCell!10471)) (size!29287 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59879)

(declare-fun e!545759 () Bool)

(declare-fun array_inv!22299 (array!59879) Bool)

(assert (=> start!82970 (and (array_inv!22299 _values!1400) e!545759)))

(declare-datatypes ((array!59881 0))(
  ( (array!59882 (arr!28809 (Array (_ BitVec 32) (_ BitVec 64))) (size!29288 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59881)

(declare-fun array_inv!22300 (array!59881) Bool)

(assert (=> start!82970 (array_inv!22300 _keys!1686)))

(assert (=> start!82970 tp!66420))

(declare-fun tp_is_empty!21905 () Bool)

(assert (=> start!82970 tp_is_empty!21905))

(declare-fun mapIsEmpty!34852 () Bool)

(declare-fun mapRes!34852 () Bool)

(assert (=> mapIsEmpty!34852 mapRes!34852))

(declare-fun b!968457 () Bool)

(declare-fun e!545758 () Bool)

(assert (=> b!968457 (= e!545758 tp_is_empty!21905)))

(declare-fun b!968458 () Bool)

(declare-fun res!648357 () Bool)

(assert (=> b!968458 (=> (not res!648357) (not e!545757))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59881 (_ BitVec 32)) Bool)

(assert (=> b!968458 (= res!648357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!968459 () Bool)

(declare-fun res!648359 () Bool)

(assert (=> b!968459 (=> (not res!648359) (not e!545757))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!968459 (= res!648359 (bvsle from!2084 newFrom!159))))

(declare-fun b!968460 () Bool)

(declare-fun res!648360 () Bool)

(assert (=> b!968460 (=> (not res!648360) (not e!545757))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!968460 (= res!648360 (and (= (size!29287 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29288 _keys!1686) (size!29287 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!968461 () Bool)

(declare-fun e!545755 () Bool)

(assert (=> b!968461 (= e!545759 (and e!545755 mapRes!34852))))

(declare-fun condMapEmpty!34852 () Bool)

(declare-fun mapDefault!34852 () ValueCell!10471)

