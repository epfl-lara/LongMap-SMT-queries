; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113304 () Bool)

(assert start!113304)

(declare-fun b_free!31355 () Bool)

(declare-fun b_next!31355 () Bool)

(assert (=> start!113304 (= b_free!31355 (not b_next!31355))))

(declare-fun tp!109870 () Bool)

(declare-fun b_and!50577 () Bool)

(assert (=> start!113304 (= tp!109870 b_and!50577)))

(declare-fun b!1344351 () Bool)

(declare-fun res!891944 () Bool)

(declare-fun e!765142 () Bool)

(assert (=> b!1344351 (=> (not res!891944) (not e!765142))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91552 0))(
  ( (array!91553 (arr!44232 (Array (_ BitVec 32) (_ BitVec 64))) (size!44782 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91552)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344351 (= res!891944 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44782 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344352 () Bool)

(declare-fun res!891943 () Bool)

(assert (=> b!1344352 (=> (not res!891943) (not e!765142))))

(declare-datatypes ((List!31320 0))(
  ( (Nil!31317) (Cons!31316 (h!32525 (_ BitVec 64)) (t!45844 List!31320)) )
))
(declare-fun arrayNoDuplicates!0 (array!91552 (_ BitVec 32) List!31320) Bool)

(assert (=> b!1344352 (= res!891943 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31317))))

(declare-fun mapNonEmpty!57739 () Bool)

(declare-fun mapRes!57739 () Bool)

(declare-fun tp!109869 () Bool)

(declare-fun e!765139 () Bool)

(assert (=> mapNonEmpty!57739 (= mapRes!57739 (and tp!109869 e!765139))))

(declare-datatypes ((V!54909 0))(
  ( (V!54910 (val!18752 Int)) )
))
(declare-datatypes ((ValueCell!17779 0))(
  ( (ValueCellFull!17779 (v!21400 V!54909)) (EmptyCell!17779) )
))
(declare-fun mapValue!57739 () ValueCell!17779)

(declare-fun mapRest!57739 () (Array (_ BitVec 32) ValueCell!17779))

(declare-fun mapKey!57739 () (_ BitVec 32))

(declare-datatypes ((array!91554 0))(
  ( (array!91555 (arr!44233 (Array (_ BitVec 32) ValueCell!17779)) (size!44783 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91554)

(assert (=> mapNonEmpty!57739 (= (arr!44233 _values!1303) (store mapRest!57739 mapKey!57739 mapValue!57739))))

(declare-fun res!891941 () Bool)

(assert (=> start!113304 (=> (not res!891941) (not e!765142))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113304 (= res!891941 (validMask!0 mask!1977))))

(assert (=> start!113304 e!765142))

(declare-fun tp_is_empty!37355 () Bool)

(assert (=> start!113304 tp_is_empty!37355))

(assert (=> start!113304 true))

(declare-fun array_inv!33333 (array!91552) Bool)

(assert (=> start!113304 (array_inv!33333 _keys!1571)))

(declare-fun e!765140 () Bool)

(declare-fun array_inv!33334 (array!91554) Bool)

(assert (=> start!113304 (and (array_inv!33334 _values!1303) e!765140)))

(assert (=> start!113304 tp!109870))

(declare-fun b!1344353 () Bool)

(declare-fun res!891945 () Bool)

(assert (=> b!1344353 (=> (not res!891945) (not e!765142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91552 (_ BitVec 32)) Bool)

(assert (=> b!1344353 (= res!891945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344354 () Bool)

(declare-fun e!765143 () Bool)

(assert (=> b!1344354 (= e!765143 tp_is_empty!37355)))

(declare-fun b!1344355 () Bool)

(declare-fun res!891942 () Bool)

(assert (=> b!1344355 (=> (not res!891942) (not e!765142))))

(assert (=> b!1344355 (= res!891942 (and (= (size!44783 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44782 _keys!1571) (size!44783 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57739 () Bool)

(assert (=> mapIsEmpty!57739 mapRes!57739))

(declare-fun b!1344356 () Bool)

(assert (=> b!1344356 (= e!765142 false)))

(declare-fun minValue!1245 () V!54909)

(declare-fun lt!595182 () Bool)

(declare-fun zeroValue!1245 () V!54909)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24164 0))(
  ( (tuple2!24165 (_1!12093 (_ BitVec 64)) (_2!12093 V!54909)) )
))
(declare-datatypes ((List!31321 0))(
  ( (Nil!31318) (Cons!31317 (h!32526 tuple2!24164) (t!45845 List!31321)) )
))
(declare-datatypes ((ListLongMap!21821 0))(
  ( (ListLongMap!21822 (toList!10926 List!31321)) )
))
(declare-fun contains!9102 (ListLongMap!21821 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5882 (array!91552 array!91554 (_ BitVec 32) (_ BitVec 32) V!54909 V!54909 (_ BitVec 32) Int) ListLongMap!21821)

(assert (=> b!1344356 (= lt!595182 (contains!9102 (getCurrentListMap!5882 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1344357 () Bool)

(assert (=> b!1344357 (= e!765139 tp_is_empty!37355)))

(declare-fun b!1344358 () Bool)

(assert (=> b!1344358 (= e!765140 (and e!765143 mapRes!57739))))

(declare-fun condMapEmpty!57739 () Bool)

(declare-fun mapDefault!57739 () ValueCell!17779)

