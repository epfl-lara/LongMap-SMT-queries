; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97194 () Bool)

(assert start!97194)

(declare-fun b!1105797 () Bool)

(declare-fun res!737874 () Bool)

(declare-fun e!631082 () Bool)

(assert (=> b!1105797 (=> (not res!737874) (not e!631082))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105797 (= res!737874 (validKeyInArray!0 k!934))))

(declare-fun b!1105798 () Bool)

(declare-fun res!737876 () Bool)

(assert (=> b!1105798 (=> (not res!737876) (not e!631082))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!71767 0))(
  ( (array!71768 (arr!34536 (Array (_ BitVec 32) (_ BitVec 64))) (size!35072 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71767)

(assert (=> b!1105798 (= res!737876 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35072 _keys!1208))))))

(declare-fun b!1105799 () Bool)

(declare-fun res!737875 () Bool)

(assert (=> b!1105799 (=> (not res!737875) (not e!631082))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41693 0))(
  ( (V!41694 (val!13769 Int)) )
))
(declare-datatypes ((ValueCell!13003 0))(
  ( (ValueCellFull!13003 (v!16402 V!41693)) (EmptyCell!13003) )
))
(declare-datatypes ((array!71769 0))(
  ( (array!71770 (arr!34537 (Array (_ BitVec 32) ValueCell!13003)) (size!35073 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71769)

(assert (=> b!1105799 (= res!737875 (and (= (size!35073 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35072 _keys!1208) (size!35073 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105800 () Bool)

(declare-fun e!631080 () Bool)

(declare-fun tp_is_empty!27425 () Bool)

(assert (=> b!1105800 (= e!631080 tp_is_empty!27425)))

(declare-fun b!1105801 () Bool)

(declare-fun res!737870 () Bool)

(declare-fun e!631081 () Bool)

(assert (=> b!1105801 (=> (not res!737870) (not e!631081))))

(declare-fun lt!495361 () array!71767)

(declare-datatypes ((List!24081 0))(
  ( (Nil!24078) (Cons!24077 (h!25286 (_ BitVec 64)) (t!34346 List!24081)) )
))
(declare-fun arrayNoDuplicates!0 (array!71767 (_ BitVec 32) List!24081) Bool)

(assert (=> b!1105801 (= res!737870 (arrayNoDuplicates!0 lt!495361 #b00000000000000000000000000000000 Nil!24078))))

(declare-fun b!1105802 () Bool)

(assert (=> b!1105802 (= e!631082 e!631081)))

(declare-fun res!737878 () Bool)

(assert (=> b!1105802 (=> (not res!737878) (not e!631081))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71767 (_ BitVec 32)) Bool)

(assert (=> b!1105802 (= res!737878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495361 mask!1564))))

(assert (=> b!1105802 (= lt!495361 (array!71768 (store (arr!34536 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35072 _keys!1208)))))

(declare-fun mapIsEmpty!42955 () Bool)

(declare-fun mapRes!42955 () Bool)

(assert (=> mapIsEmpty!42955 mapRes!42955))

(declare-fun mapNonEmpty!42955 () Bool)

(declare-fun tp!81875 () Bool)

(assert (=> mapNonEmpty!42955 (= mapRes!42955 (and tp!81875 e!631080))))

(declare-fun mapRest!42955 () (Array (_ BitVec 32) ValueCell!13003))

(declare-fun mapValue!42955 () ValueCell!13003)

(declare-fun mapKey!42955 () (_ BitVec 32))

(assert (=> mapNonEmpty!42955 (= (arr!34537 _values!996) (store mapRest!42955 mapKey!42955 mapValue!42955))))

(declare-fun b!1105803 () Bool)

(declare-fun res!737877 () Bool)

(assert (=> b!1105803 (=> (not res!737877) (not e!631082))))

(assert (=> b!1105803 (= res!737877 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105804 () Bool)

(declare-fun res!737872 () Bool)

(assert (=> b!1105804 (=> (not res!737872) (not e!631082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105804 (= res!737872 (validMask!0 mask!1564))))

(declare-fun b!1105805 () Bool)

(declare-fun e!631079 () Bool)

(declare-fun e!631078 () Bool)

(assert (=> b!1105805 (= e!631079 (and e!631078 mapRes!42955))))

(declare-fun condMapEmpty!42955 () Bool)

(declare-fun mapDefault!42955 () ValueCell!13003)

