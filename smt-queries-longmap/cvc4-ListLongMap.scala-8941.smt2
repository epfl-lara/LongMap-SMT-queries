; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108376 () Bool)

(assert start!108376)

(declare-fun b_free!27923 () Bool)

(declare-fun b_next!27923 () Bool)

(assert (=> start!108376 (= b_free!27923 (not b_next!27923))))

(declare-fun tp!98878 () Bool)

(declare-fun b_and!45983 () Bool)

(assert (=> start!108376 (= tp!98878 b_and!45983)))

(declare-fun b!1279080 () Bool)

(declare-fun e!730790 () Bool)

(assert (=> b!1279080 (= e!730790 false)))

(declare-datatypes ((V!49853 0))(
  ( (V!49854 (val!16856 Int)) )
))
(declare-fun minValue!1387 () V!49853)

(declare-fun zeroValue!1387 () V!49853)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!575966 () Bool)

(declare-datatypes ((ValueCell!15883 0))(
  ( (ValueCellFull!15883 (v!19456 V!49853)) (EmptyCell!15883) )
))
(declare-datatypes ((array!84214 0))(
  ( (array!84215 (arr!40611 (Array (_ BitVec 32) ValueCell!15883)) (size!41161 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84214)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84216 0))(
  ( (array!84217 (arr!40612 (Array (_ BitVec 32) (_ BitVec 64))) (size!41162 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84216)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21564 0))(
  ( (tuple2!21565 (_1!10793 (_ BitVec 64)) (_2!10793 V!49853)) )
))
(declare-datatypes ((List!28763 0))(
  ( (Nil!28760) (Cons!28759 (h!29968 tuple2!21564) (t!42303 List!28763)) )
))
(declare-datatypes ((ListLongMap!19221 0))(
  ( (ListLongMap!19222 (toList!9626 List!28763)) )
))
(declare-fun contains!7741 (ListLongMap!19221 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4710 (array!84216 array!84214 (_ BitVec 32) (_ BitVec 32) V!49853 V!49853 (_ BitVec 32) Int) ListLongMap!19221)

(assert (=> b!1279080 (= lt!575966 (contains!7741 (getCurrentListMap!4710 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1279081 () Bool)

(declare-fun e!730786 () Bool)

(declare-fun tp_is_empty!33563 () Bool)

(assert (=> b!1279081 (= e!730786 tp_is_empty!33563)))

(declare-fun mapIsEmpty!51896 () Bool)

(declare-fun mapRes!51896 () Bool)

(assert (=> mapIsEmpty!51896 mapRes!51896))

(declare-fun b!1279082 () Bool)

(declare-fun res!849682 () Bool)

(assert (=> b!1279082 (=> (not res!849682) (not e!730790))))

(assert (=> b!1279082 (= res!849682 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41162 _keys!1741))))))

(declare-fun b!1279083 () Bool)

(declare-fun res!849685 () Bool)

(assert (=> b!1279083 (=> (not res!849685) (not e!730790))))

(assert (=> b!1279083 (= res!849685 (and (= (size!41161 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41162 _keys!1741) (size!41161 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279084 () Bool)

(declare-fun res!849684 () Bool)

(assert (=> b!1279084 (=> (not res!849684) (not e!730790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84216 (_ BitVec 32)) Bool)

(assert (=> b!1279084 (= res!849684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279085 () Bool)

(declare-fun res!849683 () Bool)

(assert (=> b!1279085 (=> (not res!849683) (not e!730790))))

(declare-datatypes ((List!28764 0))(
  ( (Nil!28761) (Cons!28760 (h!29969 (_ BitVec 64)) (t!42304 List!28764)) )
))
(declare-fun arrayNoDuplicates!0 (array!84216 (_ BitVec 32) List!28764) Bool)

(assert (=> b!1279085 (= res!849683 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28761))))

(declare-fun b!1279086 () Bool)

(declare-fun e!730788 () Bool)

(assert (=> b!1279086 (= e!730788 (and e!730786 mapRes!51896))))

(declare-fun condMapEmpty!51896 () Bool)

(declare-fun mapDefault!51896 () ValueCell!15883)

