; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39262 () Bool)

(assert start!39262)

(declare-fun b_free!9529 () Bool)

(declare-fun b_next!9529 () Bool)

(assert (=> start!39262 (= b_free!9529 (not b_next!9529))))

(declare-fun tp!34115 () Bool)

(declare-fun b_and!16933 () Bool)

(assert (=> start!39262 (= tp!34115 b_and!16933)))

(declare-fun b!414893 () Bool)

(declare-fun res!241305 () Bool)

(declare-fun e!247893 () Bool)

(assert (=> b!414893 (=> (not res!241305) (not e!247893))))

(declare-datatypes ((array!25219 0))(
  ( (array!25220 (arr!12059 (Array (_ BitVec 32) (_ BitVec 64))) (size!12411 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25219)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414893 (= res!241305 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!414894 () Bool)

(declare-fun e!247892 () Bool)

(declare-fun e!247898 () Bool)

(assert (=> b!414894 (= e!247892 (not e!247898))))

(declare-fun res!241294 () Bool)

(assert (=> b!414894 (=> res!241294 e!247898)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414894 (= res!241294 (validKeyInArray!0 (select (arr!12059 _keys!709) from!863)))))

(declare-fun e!247895 () Bool)

(assert (=> b!414894 e!247895))

(declare-fun c!55007 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414894 (= c!55007 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!15347 0))(
  ( (V!15348 (val!5385 Int)) )
))
(declare-fun minValue!515 () V!15347)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4997 0))(
  ( (ValueCellFull!4997 (v!7632 V!15347)) (EmptyCell!4997) )
))
(declare-datatypes ((array!25221 0))(
  ( (array!25222 (arr!12060 (Array (_ BitVec 32) ValueCell!4997)) (size!12412 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25221)

(declare-datatypes ((Unit!12268 0))(
  ( (Unit!12269) )
))
(declare-fun lt!190114 () Unit!12268)

(declare-fun zeroValue!515 () V!15347)

(declare-fun v!412 () V!15347)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!392 (array!25219 array!25221 (_ BitVec 32) (_ BitVec 32) V!15347 V!15347 (_ BitVec 32) (_ BitVec 64) V!15347 (_ BitVec 32) Int) Unit!12268)

(assert (=> b!414894 (= lt!190114 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!392 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414895 () Bool)

(declare-fun e!247891 () Bool)

(assert (=> b!414895 (= e!247891 e!247892)))

(declare-fun res!241299 () Bool)

(assert (=> b!414895 (=> (not res!241299) (not e!247892))))

(assert (=> b!414895 (= res!241299 (= from!863 i!563))))

(declare-datatypes ((tuple2!7010 0))(
  ( (tuple2!7011 (_1!3516 (_ BitVec 64)) (_2!3516 V!15347)) )
))
(declare-datatypes ((List!7032 0))(
  ( (Nil!7029) (Cons!7028 (h!7884 tuple2!7010) (t!12226 List!7032)) )
))
(declare-datatypes ((ListLongMap!5923 0))(
  ( (ListLongMap!5924 (toList!2977 List!7032)) )
))
(declare-fun lt!190116 () ListLongMap!5923)

(declare-fun lt!190115 () array!25221)

(declare-fun lt!190117 () array!25219)

(declare-fun getCurrentListMapNoExtraKeys!1183 (array!25219 array!25221 (_ BitVec 32) (_ BitVec 32) V!15347 V!15347 (_ BitVec 32) Int) ListLongMap!5923)

(assert (=> b!414895 (= lt!190116 (getCurrentListMapNoExtraKeys!1183 lt!190117 lt!190115 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!414895 (= lt!190115 (array!25222 (store (arr!12060 _values!549) i!563 (ValueCellFull!4997 v!412)) (size!12412 _values!549)))))

(declare-fun lt!190118 () ListLongMap!5923)

(assert (=> b!414895 (= lt!190118 (getCurrentListMapNoExtraKeys!1183 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!414896 () Bool)

(declare-fun res!241300 () Bool)

(assert (=> b!414896 (=> (not res!241300) (not e!247891))))

(declare-datatypes ((List!7033 0))(
  ( (Nil!7030) (Cons!7029 (h!7885 (_ BitVec 64)) (t!12227 List!7033)) )
))
(declare-fun arrayNoDuplicates!0 (array!25219 (_ BitVec 32) List!7033) Bool)

(assert (=> b!414896 (= res!241300 (arrayNoDuplicates!0 lt!190117 #b00000000000000000000000000000000 Nil!7030))))

(declare-fun b!414897 () Bool)

(declare-fun res!241293 () Bool)

(assert (=> b!414897 (=> (not res!241293) (not e!247893))))

(assert (=> b!414897 (= res!241293 (or (= (select (arr!12059 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12059 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!28763 () Bool)

(declare-fun call!28765 () ListLongMap!5923)

(assert (=> bm!28763 (= call!28765 (getCurrentListMapNoExtraKeys!1183 (ite c!55007 lt!190117 _keys!709) (ite c!55007 lt!190115 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!241295 () Bool)

(assert (=> start!39262 (=> (not res!241295) (not e!247893))))

(assert (=> start!39262 (= res!241295 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12411 _keys!709))))))

(assert (=> start!39262 e!247893))

(declare-fun tp_is_empty!10681 () Bool)

(assert (=> start!39262 tp_is_empty!10681))

(assert (=> start!39262 tp!34115))

(assert (=> start!39262 true))

(declare-fun e!247899 () Bool)

(declare-fun array_inv!8796 (array!25221) Bool)

(assert (=> start!39262 (and (array_inv!8796 _values!549) e!247899)))

(declare-fun array_inv!8797 (array!25219) Bool)

(assert (=> start!39262 (array_inv!8797 _keys!709)))

(declare-fun bm!28762 () Bool)

(declare-fun call!28766 () ListLongMap!5923)

(assert (=> bm!28762 (= call!28766 (getCurrentListMapNoExtraKeys!1183 (ite c!55007 _keys!709 lt!190117) (ite c!55007 _values!549 lt!190115) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414898 () Bool)

(declare-fun res!241298 () Bool)

(assert (=> b!414898 (=> (not res!241298) (not e!247893))))

(assert (=> b!414898 (= res!241298 (and (= (size!12412 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12411 _keys!709) (size!12412 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414899 () Bool)

(declare-fun res!241297 () Bool)

(assert (=> b!414899 (=> (not res!241297) (not e!247893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414899 (= res!241297 (validMask!0 mask!1025))))

(declare-fun b!414900 () Bool)

(assert (=> b!414900 (= e!247898 true)))

(declare-fun +!1182 (ListLongMap!5923 tuple2!7010) ListLongMap!5923)

(declare-fun get!5950 (ValueCell!4997 V!15347) V!15347)

(declare-fun dynLambda!659 (Int (_ BitVec 64)) V!15347)

(assert (=> b!414900 (= lt!190116 (+!1182 (getCurrentListMapNoExtraKeys!1183 lt!190117 lt!190115 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7011 (select (arr!12059 lt!190117) from!863) (get!5950 (select (arr!12060 lt!190115) from!863) (dynLambda!659 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!414901 () Bool)

(declare-fun e!247896 () Bool)

(declare-fun mapRes!17643 () Bool)

(assert (=> b!414901 (= e!247899 (and e!247896 mapRes!17643))))

(declare-fun condMapEmpty!17643 () Bool)

(declare-fun mapDefault!17643 () ValueCell!4997)

