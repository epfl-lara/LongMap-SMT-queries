; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73240 () Bool)

(assert start!73240)

(declare-fun b_free!14155 () Bool)

(declare-fun b_next!14155 () Bool)

(assert (=> start!73240 (= b_free!14155 (not b_next!14155))))

(declare-fun tp!49968 () Bool)

(declare-fun b_and!23469 () Bool)

(assert (=> start!73240 (= tp!49968 b_and!23469)))

(declare-fun b!853797 () Bool)

(declare-fun res!579855 () Bool)

(declare-fun e!476122 () Bool)

(assert (=> b!853797 (=> (not res!579855) (not e!476122))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48780 0))(
  ( (array!48781 (arr!23421 (Array (_ BitVec 32) (_ BitVec 64))) (size!23861 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48780)

(declare-datatypes ((V!26769 0))(
  ( (V!26770 (val!8193 Int)) )
))
(declare-datatypes ((ValueCell!7706 0))(
  ( (ValueCellFull!7706 (v!10618 V!26769)) (EmptyCell!7706) )
))
(declare-datatypes ((array!48782 0))(
  ( (array!48783 (arr!23422 (Array (_ BitVec 32) ValueCell!7706)) (size!23862 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48782)

(assert (=> b!853797 (= res!579855 (and (= (size!23862 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23861 _keys!868) (size!23862 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!853798 () Bool)

(declare-fun e!476124 () Bool)

(declare-datatypes ((tuple2!10776 0))(
  ( (tuple2!10777 (_1!5399 (_ BitVec 64)) (_2!5399 V!26769)) )
))
(declare-datatypes ((List!16599 0))(
  ( (Nil!16596) (Cons!16595 (h!17726 tuple2!10776) (t!23200 List!16599)) )
))
(declare-datatypes ((ListLongMap!9545 0))(
  ( (ListLongMap!9546 (toList!4788 List!16599)) )
))
(declare-fun call!38320 () ListLongMap!9545)

(declare-fun call!38321 () ListLongMap!9545)

(assert (=> b!853798 (= e!476124 (= call!38320 call!38321))))

(declare-fun bm!38317 () Bool)

(declare-fun lt!384972 () array!48782)

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26769)

(declare-fun zeroValue!654 () V!26769)

(declare-fun getCurrentListMapNoExtraKeys!2769 (array!48780 array!48782 (_ BitVec 32) (_ BitVec 32) V!26769 V!26769 (_ BitVec 32) Int) ListLongMap!9545)

(assert (=> bm!38317 (= call!38320 (getCurrentListMapNoExtraKeys!2769 _keys!868 lt!384972 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38318 () Bool)

(assert (=> bm!38318 (= call!38321 (getCurrentListMapNoExtraKeys!2769 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853799 () Bool)

(declare-fun res!579852 () Bool)

(assert (=> b!853799 (=> (not res!579852) (not e!476122))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853799 (= res!579852 (validMask!0 mask!1196))))

(declare-fun b!853800 () Bool)

(declare-fun e!476123 () Bool)

(declare-fun e!476127 () Bool)

(declare-fun mapRes!26036 () Bool)

(assert (=> b!853800 (= e!476123 (and e!476127 mapRes!26036))))

(declare-fun condMapEmpty!26036 () Bool)

(declare-fun mapDefault!26036 () ValueCell!7706)

