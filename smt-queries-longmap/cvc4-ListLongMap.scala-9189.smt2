; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110486 () Bool)

(assert start!110486)

(declare-fun res!867593 () Bool)

(declare-fun e!745768 () Bool)

(assert (=> start!110486 (=> (not res!867593) (not e!745768))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110486 (= res!867593 (validMask!0 mask!2040))))

(assert (=> start!110486 e!745768))

(declare-datatypes ((array!87108 0))(
  ( (array!87109 (arr!42034 (Array (_ BitVec 32) (_ BitVec 64))) (size!42584 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87108)

(declare-fun array_inv!31777 (array!87108) Bool)

(assert (=> start!110486 (array_inv!31777 _keys!1628)))

(assert (=> start!110486 true))

(declare-datatypes ((V!51837 0))(
  ( (V!51838 (val!17600 Int)) )
))
(declare-datatypes ((ValueCell!16627 0))(
  ( (ValueCellFull!16627 (v!20227 V!51837)) (EmptyCell!16627) )
))
(declare-datatypes ((array!87110 0))(
  ( (array!87111 (arr!42035 (Array (_ BitVec 32) ValueCell!16627)) (size!42585 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87110)

(declare-fun e!745772 () Bool)

(declare-fun array_inv!31778 (array!87110) Bool)

(assert (=> start!110486 (and (array_inv!31778 _values!1354) e!745772)))

(declare-fun b!1306992 () Bool)

(declare-fun e!745769 () Bool)

(declare-fun tp_is_empty!35051 () Bool)

(assert (=> b!1306992 (= e!745769 tp_is_empty!35051)))

(declare-fun b!1306993 () Bool)

(declare-fun res!867594 () Bool)

(assert (=> b!1306993 (=> (not res!867594) (not e!745768))))

(declare-datatypes ((List!29805 0))(
  ( (Nil!29802) (Cons!29801 (h!31010 (_ BitVec 64)) (t!43411 List!29805)) )
))
(declare-fun arrayNoDuplicates!0 (array!87108 (_ BitVec 32) List!29805) Bool)

(assert (=> b!1306993 (= res!867594 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29802))))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun b!1306994 () Bool)

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1306994 (= e!745768 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42584 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!2020 (size!42584 _keys!1628))))))

(declare-fun mapNonEmpty!54205 () Bool)

(declare-fun mapRes!54205 () Bool)

(declare-fun tp!103285 () Bool)

(assert (=> mapNonEmpty!54205 (= mapRes!54205 (and tp!103285 e!745769))))

(declare-fun mapKey!54205 () (_ BitVec 32))

(declare-fun mapValue!54205 () ValueCell!16627)

(declare-fun mapRest!54205 () (Array (_ BitVec 32) ValueCell!16627))

(assert (=> mapNonEmpty!54205 (= (arr!42035 _values!1354) (store mapRest!54205 mapKey!54205 mapValue!54205))))

(declare-fun b!1306995 () Bool)

(declare-fun res!867591 () Bool)

(assert (=> b!1306995 (=> (not res!867591) (not e!745768))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306995 (= res!867591 (and (= (size!42585 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42584 _keys!1628) (size!42585 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1306996 () Bool)

(declare-fun e!745771 () Bool)

(assert (=> b!1306996 (= e!745771 tp_is_empty!35051)))

(declare-fun b!1306997 () Bool)

(declare-fun res!867592 () Bool)

(assert (=> b!1306997 (=> (not res!867592) (not e!745768))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87108 (_ BitVec 32)) Bool)

(assert (=> b!1306997 (= res!867592 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1306998 () Bool)

(assert (=> b!1306998 (= e!745772 (and e!745771 mapRes!54205))))

(declare-fun condMapEmpty!54205 () Bool)

(declare-fun mapDefault!54205 () ValueCell!16627)

