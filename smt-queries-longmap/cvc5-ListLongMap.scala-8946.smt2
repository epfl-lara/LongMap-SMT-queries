; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108402 () Bool)

(assert start!108402)

(declare-fun b_free!27949 () Bool)

(declare-fun b_next!27949 () Bool)

(assert (=> start!108402 (= b_free!27949 (not b_next!27949))))

(declare-fun tp!98956 () Bool)

(declare-fun b_and!46009 () Bool)

(assert (=> start!108402 (= tp!98956 b_and!46009)))

(declare-fun b!1279392 () Bool)

(declare-fun e!730984 () Bool)

(declare-fun tp_is_empty!33589 () Bool)

(assert (=> b!1279392 (= e!730984 tp_is_empty!33589)))

(declare-fun b!1279393 () Bool)

(declare-fun res!849880 () Bool)

(declare-fun e!730983 () Bool)

(assert (=> b!1279393 (=> (not res!849880) (not e!730983))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49889 0))(
  ( (V!49890 (val!16869 Int)) )
))
(declare-datatypes ((ValueCell!15896 0))(
  ( (ValueCellFull!15896 (v!19469 V!49889)) (EmptyCell!15896) )
))
(declare-datatypes ((array!84264 0))(
  ( (array!84265 (arr!40636 (Array (_ BitVec 32) ValueCell!15896)) (size!41186 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84264)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84266 0))(
  ( (array!84267 (arr!40637 (Array (_ BitVec 32) (_ BitVec 64))) (size!41187 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84266)

(assert (=> b!1279393 (= res!849880 (and (= (size!41186 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41187 _keys!1741) (size!41186 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51935 () Bool)

(declare-fun mapRes!51935 () Bool)

(declare-fun tp!98957 () Bool)

(assert (=> mapNonEmpty!51935 (= mapRes!51935 (and tp!98957 e!730984))))

(declare-fun mapRest!51935 () (Array (_ BitVec 32) ValueCell!15896))

(declare-fun mapKey!51935 () (_ BitVec 32))

(declare-fun mapValue!51935 () ValueCell!15896)

(assert (=> mapNonEmpty!51935 (= (arr!40636 _values!1445) (store mapRest!51935 mapKey!51935 mapValue!51935))))

(declare-fun b!1279394 () Bool)

(assert (=> b!1279394 (= e!730983 false)))

(declare-fun minValue!1387 () V!49889)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576005 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun zeroValue!1387 () V!49889)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21582 0))(
  ( (tuple2!21583 (_1!10802 (_ BitVec 64)) (_2!10802 V!49889)) )
))
(declare-datatypes ((List!28781 0))(
  ( (Nil!28778) (Cons!28777 (h!29986 tuple2!21582) (t!42321 List!28781)) )
))
(declare-datatypes ((ListLongMap!19239 0))(
  ( (ListLongMap!19240 (toList!9635 List!28781)) )
))
(declare-fun contains!7750 (ListLongMap!19239 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4719 (array!84266 array!84264 (_ BitVec 32) (_ BitVec 32) V!49889 V!49889 (_ BitVec 32) Int) ListLongMap!19239)

(assert (=> b!1279394 (= lt!576005 (contains!7750 (getCurrentListMap!4719 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1279395 () Bool)

(declare-fun res!849878 () Bool)

(assert (=> b!1279395 (=> (not res!849878) (not e!730983))))

(declare-datatypes ((List!28782 0))(
  ( (Nil!28779) (Cons!28778 (h!29987 (_ BitVec 64)) (t!42322 List!28782)) )
))
(declare-fun arrayNoDuplicates!0 (array!84266 (_ BitVec 32) List!28782) Bool)

(assert (=> b!1279395 (= res!849878 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28779))))

(declare-fun b!1279396 () Bool)

(declare-fun res!849881 () Bool)

(assert (=> b!1279396 (=> (not res!849881) (not e!730983))))

(assert (=> b!1279396 (= res!849881 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41187 _keys!1741))))))

(declare-fun b!1279397 () Bool)

(declare-fun res!849879 () Bool)

(assert (=> b!1279397 (=> (not res!849879) (not e!730983))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84266 (_ BitVec 32)) Bool)

(assert (=> b!1279397 (= res!849879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!849877 () Bool)

(assert (=> start!108402 (=> (not res!849877) (not e!730983))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108402 (= res!849877 (validMask!0 mask!2175))))

(assert (=> start!108402 e!730983))

(assert (=> start!108402 tp_is_empty!33589))

(assert (=> start!108402 true))

(declare-fun e!730981 () Bool)

(declare-fun array_inv!30851 (array!84264) Bool)

(assert (=> start!108402 (and (array_inv!30851 _values!1445) e!730981)))

(declare-fun array_inv!30852 (array!84266) Bool)

(assert (=> start!108402 (array_inv!30852 _keys!1741)))

(assert (=> start!108402 tp!98956))

(declare-fun b!1279398 () Bool)

(declare-fun e!730982 () Bool)

(assert (=> b!1279398 (= e!730982 tp_is_empty!33589)))

(declare-fun mapIsEmpty!51935 () Bool)

(assert (=> mapIsEmpty!51935 mapRes!51935))

(declare-fun b!1279399 () Bool)

(assert (=> b!1279399 (= e!730981 (and e!730982 mapRes!51935))))

(declare-fun condMapEmpty!51935 () Bool)

(declare-fun mapDefault!51935 () ValueCell!15896)

