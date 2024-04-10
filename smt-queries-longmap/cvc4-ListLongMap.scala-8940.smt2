; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108370 () Bool)

(assert start!108370)

(declare-fun mapNonEmpty!51887 () Bool)

(declare-fun mapRes!51887 () Bool)

(declare-fun tp!98861 () Bool)

(declare-fun e!730745 () Bool)

(assert (=> mapNonEmpty!51887 (= mapRes!51887 (and tp!98861 e!730745))))

(declare-datatypes ((V!49845 0))(
  ( (V!49846 (val!16853 Int)) )
))
(declare-datatypes ((ValueCell!15880 0))(
  ( (ValueCellFull!15880 (v!19453 V!49845)) (EmptyCell!15880) )
))
(declare-fun mapRest!51887 () (Array (_ BitVec 32) ValueCell!15880))

(declare-fun mapKey!51887 () (_ BitVec 32))

(declare-datatypes ((array!84202 0))(
  ( (array!84203 (arr!40605 (Array (_ BitVec 32) ValueCell!15880)) (size!41155 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84202)

(declare-fun mapValue!51887 () ValueCell!15880)

(assert (=> mapNonEmpty!51887 (= (arr!40605 _values!1445) (store mapRest!51887 mapKey!51887 mapValue!51887))))

(declare-fun b!1279009 () Bool)

(declare-fun e!730743 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84204 0))(
  ( (array!84205 (arr!40606 (Array (_ BitVec 32) (_ BitVec 64))) (size!41156 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84204)

(assert (=> b!1279009 (= e!730743 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41156 _keys!1741)) (bvsgt from!2144 (size!41156 _keys!1741))))))

(declare-fun b!1279010 () Bool)

(declare-fun res!849639 () Bool)

(assert (=> b!1279010 (=> (not res!849639) (not e!730743))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84204 (_ BitVec 32)) Bool)

(assert (=> b!1279010 (= res!849639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279011 () Bool)

(declare-fun res!849638 () Bool)

(assert (=> b!1279011 (=> (not res!849638) (not e!730743))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279011 (= res!849638 (and (= (size!41155 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41156 _keys!1741) (size!41155 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279012 () Bool)

(declare-fun res!849640 () Bool)

(assert (=> b!1279012 (=> (not res!849640) (not e!730743))))

(declare-datatypes ((List!28759 0))(
  ( (Nil!28756) (Cons!28755 (h!29964 (_ BitVec 64)) (t!42299 List!28759)) )
))
(declare-fun arrayNoDuplicates!0 (array!84204 (_ BitVec 32) List!28759) Bool)

(assert (=> b!1279012 (= res!849640 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28756))))

(declare-fun b!1279013 () Bool)

(declare-fun e!730742 () Bool)

(declare-fun e!730744 () Bool)

(assert (=> b!1279013 (= e!730742 (and e!730744 mapRes!51887))))

(declare-fun condMapEmpty!51887 () Bool)

(declare-fun mapDefault!51887 () ValueCell!15880)

