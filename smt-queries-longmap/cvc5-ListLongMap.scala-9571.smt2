; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113288 () Bool)

(assert start!113288)

(declare-fun b_free!31339 () Bool)

(declare-fun b_next!31339 () Bool)

(assert (=> start!113288 (= b_free!31339 (not b_next!31339))))

(declare-fun tp!109821 () Bool)

(declare-fun b_and!50561 () Bool)

(assert (=> start!113288 (= tp!109821 b_and!50561)))

(declare-fun mapIsEmpty!57715 () Bool)

(declare-fun mapRes!57715 () Bool)

(assert (=> mapIsEmpty!57715 mapRes!57715))

(declare-fun b!1344159 () Bool)

(declare-fun res!891821 () Bool)

(declare-fun e!765021 () Bool)

(assert (=> b!1344159 (=> (not res!891821) (not e!765021))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91522 0))(
  ( (array!91523 (arr!44217 (Array (_ BitVec 32) (_ BitVec 64))) (size!44767 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91522)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344159 (= res!891821 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44767 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344160 () Bool)

(assert (=> b!1344160 (= e!765021 false)))

(declare-datatypes ((V!54889 0))(
  ( (V!54890 (val!18744 Int)) )
))
(declare-fun minValue!1245 () V!54889)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54889)

(declare-datatypes ((ValueCell!17771 0))(
  ( (ValueCellFull!17771 (v!21392 V!54889)) (EmptyCell!17771) )
))
(declare-datatypes ((array!91524 0))(
  ( (array!91525 (arr!44218 (Array (_ BitVec 32) ValueCell!17771)) (size!44768 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91524)

(declare-fun lt!595158 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24154 0))(
  ( (tuple2!24155 (_1!12088 (_ BitVec 64)) (_2!12088 V!54889)) )
))
(declare-datatypes ((List!31309 0))(
  ( (Nil!31306) (Cons!31305 (h!32514 tuple2!24154) (t!45833 List!31309)) )
))
(declare-datatypes ((ListLongMap!21811 0))(
  ( (ListLongMap!21812 (toList!10921 List!31309)) )
))
(declare-fun contains!9097 (ListLongMap!21811 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5877 (array!91522 array!91524 (_ BitVec 32) (_ BitVec 32) V!54889 V!54889 (_ BitVec 32) Int) ListLongMap!21811)

(assert (=> b!1344160 (= lt!595158 (contains!9097 (getCurrentListMap!5877 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1344161 () Bool)

(declare-fun res!891822 () Bool)

(assert (=> b!1344161 (=> (not res!891822) (not e!765021))))

(assert (=> b!1344161 (= res!891822 (and (= (size!44768 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44767 _keys!1571) (size!44768 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57715 () Bool)

(declare-fun tp!109822 () Bool)

(declare-fun e!765022 () Bool)

(assert (=> mapNonEmpty!57715 (= mapRes!57715 (and tp!109822 e!765022))))

(declare-fun mapKey!57715 () (_ BitVec 32))

(declare-fun mapRest!57715 () (Array (_ BitVec 32) ValueCell!17771))

(declare-fun mapValue!57715 () ValueCell!17771)

(assert (=> mapNonEmpty!57715 (= (arr!44218 _values!1303) (store mapRest!57715 mapKey!57715 mapValue!57715))))

(declare-fun b!1344163 () Bool)

(declare-fun res!891824 () Bool)

(assert (=> b!1344163 (=> (not res!891824) (not e!765021))))

(declare-datatypes ((List!31310 0))(
  ( (Nil!31307) (Cons!31306 (h!32515 (_ BitVec 64)) (t!45834 List!31310)) )
))
(declare-fun arrayNoDuplicates!0 (array!91522 (_ BitVec 32) List!31310) Bool)

(assert (=> b!1344163 (= res!891824 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31307))))

(declare-fun b!1344164 () Bool)

(declare-fun e!765023 () Bool)

(declare-fun tp_is_empty!37339 () Bool)

(assert (=> b!1344164 (= e!765023 tp_is_empty!37339)))

(declare-fun b!1344165 () Bool)

(declare-fun res!891825 () Bool)

(assert (=> b!1344165 (=> (not res!891825) (not e!765021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91522 (_ BitVec 32)) Bool)

(assert (=> b!1344165 (= res!891825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344166 () Bool)

(assert (=> b!1344166 (= e!765022 tp_is_empty!37339)))

(declare-fun b!1344162 () Bool)

(declare-fun e!765019 () Bool)

(assert (=> b!1344162 (= e!765019 (and e!765023 mapRes!57715))))

(declare-fun condMapEmpty!57715 () Bool)

(declare-fun mapDefault!57715 () ValueCell!17771)

