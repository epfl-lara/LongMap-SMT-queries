; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109728 () Bool)

(assert start!109728)

(declare-fun b_free!29161 () Bool)

(declare-fun b_next!29161 () Bool)

(assert (=> start!109728 (= b_free!29161 (not b_next!29161))))

(declare-fun tp!102610 () Bool)

(declare-fun b_and!47263 () Bool)

(assert (=> start!109728 (= tp!102610 b_and!47263)))

(declare-fun b!1299744 () Bool)

(declare-fun res!863742 () Bool)

(declare-fun e!741463 () Bool)

(assert (=> b!1299744 (=> (not res!863742) (not e!741463))))

(declare-datatypes ((array!86610 0))(
  ( (array!86611 (arr!41803 (Array (_ BitVec 32) (_ BitVec 64))) (size!42353 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86610)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1299744 (= res!863742 (validKeyInArray!0 (select (arr!41803 _keys!1741) from!2144)))))

(declare-fun b!1299745 () Bool)

(declare-fun res!863744 () Bool)

(assert (=> b!1299745 (=> (not res!863744) (not e!741463))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86610 (_ BitVec 32)) Bool)

(assert (=> b!1299745 (= res!863744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1299746 () Bool)

(declare-fun res!863743 () Bool)

(assert (=> b!1299746 (=> (not res!863743) (not e!741463))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1299746 (= res!863743 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1299747 () Bool)

(declare-fun res!863737 () Bool)

(assert (=> b!1299747 (=> (not res!863737) (not e!741463))))

(declare-datatypes ((List!29668 0))(
  ( (Nil!29665) (Cons!29664 (h!30873 (_ BitVec 64)) (t!43238 List!29668)) )
))
(declare-fun arrayNoDuplicates!0 (array!86610 (_ BitVec 32) List!29668) Bool)

(assert (=> b!1299747 (= res!863737 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29665))))

(declare-fun b!1299748 () Bool)

(declare-fun e!741465 () Bool)

(declare-fun tp_is_empty!34801 () Bool)

(assert (=> b!1299748 (= e!741465 tp_is_empty!34801)))

(declare-fun b!1299749 () Bool)

(declare-fun e!741462 () Bool)

(declare-fun e!741464 () Bool)

(declare-fun mapRes!53771 () Bool)

(assert (=> b!1299749 (= e!741462 (and e!741464 mapRes!53771))))

(declare-fun condMapEmpty!53771 () Bool)

(declare-datatypes ((V!51505 0))(
  ( (V!51506 (val!17475 Int)) )
))
(declare-datatypes ((ValueCell!16502 0))(
  ( (ValueCellFull!16502 (v!20081 V!51505)) (EmptyCell!16502) )
))
(declare-datatypes ((array!86612 0))(
  ( (array!86613 (arr!41804 (Array (_ BitVec 32) ValueCell!16502)) (size!42354 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86612)

(declare-fun mapDefault!53771 () ValueCell!16502)

