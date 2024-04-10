; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40780 () Bool)

(assert start!40780)

(declare-fun b_free!10769 () Bool)

(declare-fun b_next!10769 () Bool)

(assert (=> start!40780 (= b_free!10769 (not b_next!10769))))

(declare-fun tp!38129 () Bool)

(declare-fun b_and!18825 () Bool)

(assert (=> start!40780 (= tp!38129 b_and!18825)))

(declare-fun b!452058 () Bool)

(declare-fun e!264737 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17247 0))(
  ( (V!17248 (val!6098 Int)) )
))
(declare-datatypes ((ValueCell!5710 0))(
  ( (ValueCellFull!5710 (v!8357 V!17247)) (EmptyCell!5710) )
))
(declare-datatypes ((array!28021 0))(
  ( (array!28022 (arr!13455 (Array (_ BitVec 32) ValueCell!5710)) (size!13807 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28021)

(assert (=> b!452058 (= e!264737 (bvslt from!863 (size!13807 _values!549)))))

(declare-fun minValue!515 () V!17247)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!8024 0))(
  ( (tuple2!8025 (_1!4023 (_ BitVec 64)) (_2!4023 V!17247)) )
))
(declare-datatypes ((List!8084 0))(
  ( (Nil!8081) (Cons!8080 (h!8936 tuple2!8024) (t!13876 List!8084)) )
))
(declare-datatypes ((ListLongMap!6937 0))(
  ( (ListLongMap!6938 (toList!3484 List!8084)) )
))
(declare-fun lt!205088 () ListLongMap!6937)

(declare-fun zeroValue!515 () V!17247)

(declare-datatypes ((array!28023 0))(
  ( (array!28024 (arr!13456 (Array (_ BitVec 32) (_ BitVec 64))) (size!13808 (_ BitVec 32))) )
))
(declare-fun lt!205087 () array!28023)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!205084 () array!28021)

(declare-fun +!1561 (ListLongMap!6937 tuple2!8024) ListLongMap!6937)

(declare-fun getCurrentListMapNoExtraKeys!1668 (array!28023 array!28021 (_ BitVec 32) (_ BitVec 32) V!17247 V!17247 (_ BitVec 32) Int) ListLongMap!6937)

(declare-fun get!6628 (ValueCell!5710 V!17247) V!17247)

(declare-fun dynLambda!861 (Int (_ BitVec 64)) V!17247)

(assert (=> b!452058 (= lt!205088 (+!1561 (getCurrentListMapNoExtraKeys!1668 lt!205087 lt!205084 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8025 (select (arr!13456 lt!205087) from!863) (get!6628 (select (arr!13455 lt!205084) from!863) (dynLambda!861 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun call!29920 () ListLongMap!6937)

(declare-fun e!264736 () Bool)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun call!29921 () ListLongMap!6937)

(declare-fun b!452059 () Bool)

(declare-fun v!412 () V!17247)

(assert (=> b!452059 (= e!264736 (= call!29921 (+!1561 call!29920 (tuple2!8025 k!794 v!412))))))

(declare-fun b!452060 () Bool)

(declare-fun res!269219 () Bool)

(declare-fun e!264739 () Bool)

(assert (=> b!452060 (=> (not res!269219) (not e!264739))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452060 (= res!269219 (validKeyInArray!0 k!794))))

(declare-fun bm!29917 () Bool)

(declare-fun c!56102 () Bool)

(declare-fun _keys!709 () array!28023)

(assert (=> bm!29917 (= call!29920 (getCurrentListMapNoExtraKeys!1668 (ite c!56102 _keys!709 lt!205087) (ite c!56102 _values!549 lt!205084) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452061 () Bool)

(declare-fun res!269215 () Bool)

(assert (=> b!452061 (=> (not res!269215) (not e!264739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452061 (= res!269215 (validMask!0 mask!1025))))

(declare-fun b!452062 () Bool)

(declare-fun e!264742 () Bool)

(declare-fun tp_is_empty!12107 () Bool)

(assert (=> b!452062 (= e!264742 tp_is_empty!12107)))

(declare-fun b!452063 () Bool)

(declare-fun res!269220 () Bool)

(assert (=> b!452063 (=> (not res!269220) (not e!264739))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!452063 (= res!269220 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13808 _keys!709))))))

(declare-fun b!452064 () Bool)

(declare-fun res!269224 () Bool)

(assert (=> b!452064 (=> (not res!269224) (not e!264739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28023 (_ BitVec 32)) Bool)

(assert (=> b!452064 (= res!269224 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!452065 () Bool)

(declare-fun res!269212 () Bool)

(assert (=> b!452065 (=> (not res!269212) (not e!264739))))

(assert (=> b!452065 (= res!269212 (or (= (select (arr!13456 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13456 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!452066 () Bool)

(declare-fun res!269225 () Bool)

(assert (=> b!452066 (=> (not res!269225) (not e!264739))))

(declare-fun arrayContainsKey!0 (array!28023 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452066 (= res!269225 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!452067 () Bool)

(assert (=> b!452067 (= e!264736 (= call!29920 call!29921))))

(declare-fun b!452068 () Bool)

(declare-fun res!269216 () Bool)

(declare-fun e!264740 () Bool)

(assert (=> b!452068 (=> (not res!269216) (not e!264740))))

(assert (=> b!452068 (= res!269216 (bvsle from!863 i!563))))

(declare-fun b!452069 () Bool)

(declare-fun e!264735 () Bool)

(declare-fun e!264741 () Bool)

(declare-fun mapRes!19797 () Bool)

(assert (=> b!452069 (= e!264735 (and e!264741 mapRes!19797))))

(declare-fun condMapEmpty!19797 () Bool)

(declare-fun mapDefault!19797 () ValueCell!5710)

