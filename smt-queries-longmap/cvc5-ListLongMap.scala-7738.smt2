; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97172 () Bool)

(assert start!97172)

(declare-fun mapIsEmpty!42922 () Bool)

(declare-fun mapRes!42922 () Bool)

(assert (=> mapIsEmpty!42922 mapRes!42922))

(declare-fun b!1105368 () Bool)

(declare-fun res!737547 () Bool)

(declare-fun e!630881 () Bool)

(assert (=> b!1105368 (=> (not res!737547) (not e!630881))))

(declare-datatypes ((array!71729 0))(
  ( (array!71730 (arr!34517 (Array (_ BitVec 32) (_ BitVec 64))) (size!35053 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71729)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71729 (_ BitVec 32)) Bool)

(assert (=> b!1105368 (= res!737547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105369 () Bool)

(declare-fun e!630885 () Bool)

(declare-fun tp_is_empty!27403 () Bool)

(assert (=> b!1105369 (= e!630885 tp_is_empty!27403)))

(declare-fun res!737540 () Bool)

(assert (=> start!97172 (=> (not res!737540) (not e!630881))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97172 (= res!737540 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35053 _keys!1208))))))

(assert (=> start!97172 e!630881))

(declare-fun array_inv!26572 (array!71729) Bool)

(assert (=> start!97172 (array_inv!26572 _keys!1208)))

(assert (=> start!97172 true))

(declare-datatypes ((V!41665 0))(
  ( (V!41666 (val!13758 Int)) )
))
(declare-datatypes ((ValueCell!12992 0))(
  ( (ValueCellFull!12992 (v!16391 V!41665)) (EmptyCell!12992) )
))
(declare-datatypes ((array!71731 0))(
  ( (array!71732 (arr!34518 (Array (_ BitVec 32) ValueCell!12992)) (size!35054 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71731)

(declare-fun e!630880 () Bool)

(declare-fun array_inv!26573 (array!71731) Bool)

(assert (=> start!97172 (and (array_inv!26573 _values!996) e!630880)))

(declare-fun b!1105370 () Bool)

(declare-fun e!630884 () Bool)

(assert (=> b!1105370 (= e!630881 e!630884)))

(declare-fun res!737546 () Bool)

(assert (=> b!1105370 (=> (not res!737546) (not e!630884))))

(declare-fun lt!495296 () array!71729)

(assert (=> b!1105370 (= res!737546 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495296 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1105370 (= lt!495296 (array!71730 (store (arr!34517 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35053 _keys!1208)))))

(declare-fun b!1105371 () Bool)

(assert (=> b!1105371 (= e!630880 (and e!630885 mapRes!42922))))

(declare-fun condMapEmpty!42922 () Bool)

(declare-fun mapDefault!42922 () ValueCell!12992)

