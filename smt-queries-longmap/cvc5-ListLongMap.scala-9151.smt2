; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109766 () Bool)

(assert start!109766)

(declare-fun b_free!29179 () Bool)

(declare-fun b_next!29179 () Bool)

(assert (=> start!109766 (= b_free!29179 (not b_next!29179))))

(declare-fun tp!102668 () Bool)

(declare-fun b_and!47287 () Bool)

(assert (=> start!109766 (= tp!102668 b_and!47287)))

(declare-fun b!1300222 () Bool)

(declare-fun res!864052 () Bool)

(declare-fun e!741696 () Bool)

(assert (=> b!1300222 (=> (not res!864052) (not e!741696))))

(declare-datatypes ((array!86648 0))(
  ( (array!86649 (arr!41821 (Array (_ BitVec 32) (_ BitVec 64))) (size!42371 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86648)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1300222 (= res!864052 (validKeyInArray!0 (select (arr!41821 _keys!1741) from!2144)))))

(declare-fun b!1300223 () Bool)

(declare-fun res!864050 () Bool)

(assert (=> b!1300223 (=> (not res!864050) (not e!741696))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1300223 (= res!864050 (and (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!53801 () Bool)

(declare-fun mapRes!53801 () Bool)

(declare-fun tp!102667 () Bool)

(declare-fun e!741698 () Bool)

(assert (=> mapNonEmpty!53801 (= mapRes!53801 (and tp!102667 e!741698))))

(declare-fun mapKey!53801 () (_ BitVec 32))

(declare-datatypes ((V!51529 0))(
  ( (V!51530 (val!17484 Int)) )
))
(declare-datatypes ((ValueCell!16511 0))(
  ( (ValueCellFull!16511 (v!20091 V!51529)) (EmptyCell!16511) )
))
(declare-fun mapRest!53801 () (Array (_ BitVec 32) ValueCell!16511))

(declare-datatypes ((array!86650 0))(
  ( (array!86651 (arr!41822 (Array (_ BitVec 32) ValueCell!16511)) (size!42372 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86650)

(declare-fun mapValue!53801 () ValueCell!16511)

(assert (=> mapNonEmpty!53801 (= (arr!41822 _values!1445) (store mapRest!53801 mapKey!53801 mapValue!53801))))

(declare-fun res!864047 () Bool)

(assert (=> start!109766 (=> (not res!864047) (not e!741696))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109766 (= res!864047 (validMask!0 mask!2175))))

(assert (=> start!109766 e!741696))

(declare-fun tp_is_empty!34819 () Bool)

(assert (=> start!109766 tp_is_empty!34819))

(assert (=> start!109766 true))

(declare-fun e!741699 () Bool)

(declare-fun array_inv!31641 (array!86650) Bool)

(assert (=> start!109766 (and (array_inv!31641 _values!1445) e!741699)))

(declare-fun array_inv!31642 (array!86648) Bool)

(assert (=> start!109766 (array_inv!31642 _keys!1741)))

(assert (=> start!109766 tp!102668))

(declare-fun mapIsEmpty!53801 () Bool)

(assert (=> mapIsEmpty!53801 mapRes!53801))

(declare-fun b!1300224 () Bool)

(declare-fun res!864048 () Bool)

(assert (=> b!1300224 (=> (not res!864048) (not e!741696))))

(declare-datatypes ((List!29680 0))(
  ( (Nil!29677) (Cons!29676 (h!30885 (_ BitVec 64)) (t!43252 List!29680)) )
))
(declare-fun arrayNoDuplicates!0 (array!86648 (_ BitVec 32) List!29680) Bool)

(assert (=> b!1300224 (= res!864048 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29677))))

(declare-fun b!1300225 () Bool)

(declare-fun res!864046 () Bool)

(assert (=> b!1300225 (=> (not res!864046) (not e!741696))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86648 (_ BitVec 32)) Bool)

(assert (=> b!1300225 (= res!864046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1300226 () Bool)

(declare-fun res!864044 () Bool)

(assert (=> b!1300226 (=> (not res!864044) (not e!741696))))

(assert (=> b!1300226 (= res!864044 (and (= (size!42372 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42371 _keys!1741) (size!42372 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1300227 () Bool)

(declare-fun e!741697 () Bool)

(assert (=> b!1300227 (= e!741699 (and e!741697 mapRes!53801))))

(declare-fun condMapEmpty!53801 () Bool)

(declare-fun mapDefault!53801 () ValueCell!16511)

