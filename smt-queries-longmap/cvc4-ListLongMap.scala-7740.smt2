; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97188 () Bool)

(assert start!97188)

(declare-fun b!1105680 () Bool)

(declare-fun res!737784 () Bool)

(declare-fun e!631026 () Bool)

(assert (=> b!1105680 (=> (not res!737784) (not e!631026))))

(declare-datatypes ((array!71757 0))(
  ( (array!71758 (arr!34531 (Array (_ BitVec 32) (_ BitVec 64))) (size!35067 (_ BitVec 32))) )
))
(declare-fun lt!495343 () array!71757)

(declare-datatypes ((List!24079 0))(
  ( (Nil!24076) (Cons!24075 (h!25284 (_ BitVec 64)) (t!34344 List!24079)) )
))
(declare-fun arrayNoDuplicates!0 (array!71757 (_ BitVec 32) List!24079) Bool)

(assert (=> b!1105680 (= res!737784 (arrayNoDuplicates!0 lt!495343 #b00000000000000000000000000000000 Nil!24076))))

(declare-fun b!1105681 () Bool)

(assert (=> b!1105681 (= e!631026 (not true))))

(declare-fun _keys!1208 () array!71757)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!71757 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105681 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36280 0))(
  ( (Unit!36281) )
))
(declare-fun lt!495344 () Unit!36280)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71757 (_ BitVec 64) (_ BitVec 32)) Unit!36280)

(assert (=> b!1105681 (= lt!495344 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1105682 () Bool)

(declare-fun res!737781 () Bool)

(declare-fun e!631027 () Bool)

(assert (=> b!1105682 (=> (not res!737781) (not e!631027))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105682 (= res!737781 (validMask!0 mask!1564))))

(declare-fun b!1105683 () Bool)

(declare-fun res!737788 () Bool)

(assert (=> b!1105683 (=> (not res!737788) (not e!631027))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41685 0))(
  ( (V!41686 (val!13766 Int)) )
))
(declare-datatypes ((ValueCell!13000 0))(
  ( (ValueCellFull!13000 (v!16399 V!41685)) (EmptyCell!13000) )
))
(declare-datatypes ((array!71759 0))(
  ( (array!71760 (arr!34532 (Array (_ BitVec 32) ValueCell!13000)) (size!35068 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71759)

(assert (=> b!1105683 (= res!737788 (and (= (size!35068 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35067 _keys!1208) (size!35068 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105684 () Bool)

(declare-fun res!737780 () Bool)

(assert (=> b!1105684 (=> (not res!737780) (not e!631027))))

(assert (=> b!1105684 (= res!737780 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24076))))

(declare-fun b!1105685 () Bool)

(declare-fun res!737783 () Bool)

(assert (=> b!1105685 (=> (not res!737783) (not e!631027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105685 (= res!737783 (validKeyInArray!0 k!934))))

(declare-fun b!1105686 () Bool)

(declare-fun res!737782 () Bool)

(assert (=> b!1105686 (=> (not res!737782) (not e!631027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71757 (_ BitVec 32)) Bool)

(assert (=> b!1105686 (= res!737782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1105687 () Bool)

(declare-fun e!631025 () Bool)

(declare-fun e!631029 () Bool)

(declare-fun mapRes!42946 () Bool)

(assert (=> b!1105687 (= e!631025 (and e!631029 mapRes!42946))))

(declare-fun condMapEmpty!42946 () Bool)

(declare-fun mapDefault!42946 () ValueCell!13000)

