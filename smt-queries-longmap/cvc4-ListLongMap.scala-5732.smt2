; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74192 () Bool)

(assert start!74192)

(declare-fun mapNonEmpty!27449 () Bool)

(declare-fun mapRes!27449 () Bool)

(declare-fun tp!52648 () Bool)

(declare-fun e!486036 () Bool)

(assert (=> mapNonEmpty!27449 (= mapRes!27449 (and tp!52648 e!486036))))

(declare-datatypes ((V!28021 0))(
  ( (V!28022 (val!8663 Int)) )
))
(declare-datatypes ((ValueCell!8176 0))(
  ( (ValueCellFull!8176 (v!11088 V!28021)) (EmptyCell!8176) )
))
(declare-fun mapValue!27449 () ValueCell!8176)

(declare-fun mapRest!27449 () (Array (_ BitVec 32) ValueCell!8176))

(declare-fun mapKey!27449 () (_ BitVec 32))

(declare-datatypes ((array!50590 0))(
  ( (array!50591 (arr!24325 (Array (_ BitVec 32) ValueCell!8176)) (size!24765 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50590)

(assert (=> mapNonEmpty!27449 (= (arr!24325 _values!688) (store mapRest!27449 mapKey!27449 mapValue!27449))))

(declare-fun b!872743 () Bool)

(declare-fun e!486040 () Bool)

(declare-fun tp_is_empty!17231 () Bool)

(assert (=> b!872743 (= e!486040 tp_is_empty!17231)))

(declare-fun mapIsEmpty!27449 () Bool)

(assert (=> mapIsEmpty!27449 mapRes!27449))

(declare-fun b!872744 () Bool)

(declare-fun res!593142 () Bool)

(declare-fun e!486038 () Bool)

(assert (=> b!872744 (=> (not res!593142) (not e!486038))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50592 0))(
  ( (array!50593 (arr!24326 (Array (_ BitVec 32) (_ BitVec 64))) (size!24766 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50592)

(assert (=> b!872744 (= res!593142 (and (= (size!24765 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24766 _keys!868) (size!24765 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!872745 () Bool)

(declare-fun res!593144 () Bool)

(assert (=> b!872745 (=> (not res!593144) (not e!486038))))

(declare-datatypes ((List!17271 0))(
  ( (Nil!17268) (Cons!17267 (h!18398 (_ BitVec 64)) (t!24308 List!17271)) )
))
(declare-fun arrayNoDuplicates!0 (array!50592 (_ BitVec 32) List!17271) Bool)

(assert (=> b!872745 (= res!593144 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17268))))

(declare-fun b!872746 () Bool)

(declare-fun res!593140 () Bool)

(assert (=> b!872746 (=> (not res!593140) (not e!486038))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!872746 (= res!593140 (validKeyInArray!0 k!854))))

(declare-fun b!872748 () Bool)

(declare-fun res!593139 () Bool)

(assert (=> b!872748 (=> (not res!593139) (not e!486038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50592 (_ BitVec 32)) Bool)

(assert (=> b!872748 (= res!593139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!872749 () Bool)

(declare-fun res!593138 () Bool)

(assert (=> b!872749 (=> (not res!593138) (not e!486038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872749 (= res!593138 (validMask!0 mask!1196))))

(declare-fun b!872750 () Bool)

(assert (=> b!872750 (= e!486036 tp_is_empty!17231)))

(declare-fun b!872751 () Bool)

(declare-fun e!486039 () Bool)

(assert (=> b!872751 (= e!486039 (and e!486040 mapRes!27449))))

(declare-fun condMapEmpty!27449 () Bool)

(declare-fun mapDefault!27449 () ValueCell!8176)

