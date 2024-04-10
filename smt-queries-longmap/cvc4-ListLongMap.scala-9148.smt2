; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109732 () Bool)

(assert start!109732)

(declare-fun b_free!29165 () Bool)

(declare-fun b_next!29165 () Bool)

(assert (=> start!109732 (= b_free!29165 (not b_next!29165))))

(declare-fun tp!102622 () Bool)

(declare-fun b_and!47267 () Bool)

(assert (=> start!109732 (= tp!102622 b_and!47267)))

(declare-fun b!1299816 () Bool)

(declare-fun res!863792 () Bool)

(declare-fun e!741495 () Bool)

(assert (=> b!1299816 (=> (not res!863792) (not e!741495))))

(declare-datatypes ((array!86618 0))(
  ( (array!86619 (arr!41807 (Array (_ BitVec 32) (_ BitVec 64))) (size!42357 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86618)

(declare-datatypes ((List!29671 0))(
  ( (Nil!29668) (Cons!29667 (h!30876 (_ BitVec 64)) (t!43241 List!29671)) )
))
(declare-fun arrayNoDuplicates!0 (array!86618 (_ BitVec 32) List!29671) Bool)

(assert (=> b!1299816 (= res!863792 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29668))))

(declare-fun b!1299817 () Bool)

(declare-fun res!863795 () Bool)

(assert (=> b!1299817 (=> (not res!863795) (not e!741495))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1299817 (= res!863795 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42357 _keys!1741))))))

(declare-fun b!1299818 () Bool)

(declare-fun res!863791 () Bool)

(assert (=> b!1299818 (=> (not res!863791) (not e!741495))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1299818 (= res!863791 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42357 _keys!1741))))))

(declare-fun b!1299819 () Bool)

(declare-fun e!741494 () Bool)

(declare-fun e!741493 () Bool)

(declare-fun mapRes!53777 () Bool)

(assert (=> b!1299819 (= e!741494 (and e!741493 mapRes!53777))))

(declare-fun condMapEmpty!53777 () Bool)

(declare-datatypes ((V!51509 0))(
  ( (V!51510 (val!17477 Int)) )
))
(declare-datatypes ((ValueCell!16504 0))(
  ( (ValueCellFull!16504 (v!20083 V!51509)) (EmptyCell!16504) )
))
(declare-datatypes ((array!86620 0))(
  ( (array!86621 (arr!41808 (Array (_ BitVec 32) ValueCell!16504)) (size!42358 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86620)

(declare-fun mapDefault!53777 () ValueCell!16504)

