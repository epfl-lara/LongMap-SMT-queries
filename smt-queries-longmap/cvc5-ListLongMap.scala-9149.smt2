; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109734 () Bool)

(assert start!109734)

(declare-fun b_free!29167 () Bool)

(declare-fun b_next!29167 () Bool)

(assert (=> start!109734 (= b_free!29167 (not b_next!29167))))

(declare-fun tp!102629 () Bool)

(declare-fun b_and!47269 () Bool)

(assert (=> start!109734 (= tp!102629 b_and!47269)))

(declare-fun b!1299852 () Bool)

(declare-fun res!863821 () Bool)

(declare-fun e!741511 () Bool)

(assert (=> b!1299852 (=> (not res!863821) (not e!741511))))

(declare-datatypes ((array!86622 0))(
  ( (array!86623 (arr!41809 (Array (_ BitVec 32) (_ BitVec 64))) (size!42359 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86622)

(declare-datatypes ((List!29672 0))(
  ( (Nil!29669) (Cons!29668 (h!30877 (_ BitVec 64)) (t!43242 List!29672)) )
))
(declare-fun arrayNoDuplicates!0 (array!86622 (_ BitVec 32) List!29672) Bool)

(assert (=> b!1299852 (= res!863821 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29669))))

(declare-fun mapNonEmpty!53780 () Bool)

(declare-fun mapRes!53780 () Bool)

(declare-fun tp!102628 () Bool)

(declare-fun e!741510 () Bool)

(assert (=> mapNonEmpty!53780 (= mapRes!53780 (and tp!102628 e!741510))))

(declare-datatypes ((V!51513 0))(
  ( (V!51514 (val!17478 Int)) )
))
(declare-datatypes ((ValueCell!16505 0))(
  ( (ValueCellFull!16505 (v!20084 V!51513)) (EmptyCell!16505) )
))
(declare-fun mapValue!53780 () ValueCell!16505)

(declare-datatypes ((array!86624 0))(
  ( (array!86625 (arr!41810 (Array (_ BitVec 32) ValueCell!16505)) (size!42360 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86624)

(declare-fun mapKey!53780 () (_ BitVec 32))

(declare-fun mapRest!53780 () (Array (_ BitVec 32) ValueCell!16505))

(assert (=> mapNonEmpty!53780 (= (arr!41810 _values!1445) (store mapRest!53780 mapKey!53780 mapValue!53780))))

(declare-fun minValue!1387 () V!51513)

(declare-fun zeroValue!1387 () V!51513)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun b!1299853 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22540 0))(
  ( (tuple2!22541 (_1!11281 (_ BitVec 64)) (_2!11281 V!51513)) )
))
(declare-datatypes ((List!29673 0))(
  ( (Nil!29670) (Cons!29669 (h!30878 tuple2!22540) (t!43243 List!29673)) )
))
(declare-datatypes ((ListLongMap!20197 0))(
  ( (ListLongMap!20198 (toList!10114 List!29673)) )
))
(declare-fun contains!8236 (ListLongMap!20197 (_ BitVec 64)) Bool)

(declare-fun +!4446 (ListLongMap!20197 tuple2!22540) ListLongMap!20197)

(declare-fun getCurrentListMapNoExtraKeys!6077 (array!86622 array!86624 (_ BitVec 32) (_ BitVec 32) V!51513 V!51513 (_ BitVec 32) Int) ListLongMap!20197)

(assert (=> b!1299853 (= e!741511 (not (contains!8236 (+!4446 (getCurrentListMapNoExtraKeys!6077 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!22541 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205)))))

(declare-fun b!1299854 () Bool)

(declare-fun res!863823 () Bool)

(assert (=> b!1299854 (=> (not res!863823) (not e!741511))))

(assert (=> b!1299854 (= res!863823 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42359 _keys!1741))))))

(declare-fun b!1299855 () Bool)

(declare-fun res!863818 () Bool)

(assert (=> b!1299855 (=> (not res!863818) (not e!741511))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1299855 (= res!863818 (validKeyInArray!0 (select (arr!41809 _keys!1741) from!2144)))))

(declare-fun b!1299856 () Bool)

(declare-fun res!863820 () Bool)

(assert (=> b!1299856 (=> (not res!863820) (not e!741511))))

(assert (=> b!1299856 (= res!863820 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!1299858 () Bool)

(declare-fun res!863822 () Bool)

(assert (=> b!1299858 (=> (not res!863822) (not e!741511))))

(assert (=> b!1299858 (= res!863822 (and (= (size!42360 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42359 _keys!1741) (size!42360 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1299859 () Bool)

(declare-fun e!741509 () Bool)

(declare-fun e!741508 () Bool)

(assert (=> b!1299859 (= e!741509 (and e!741508 mapRes!53780))))

(declare-fun condMapEmpty!53780 () Bool)

(declare-fun mapDefault!53780 () ValueCell!16505)

