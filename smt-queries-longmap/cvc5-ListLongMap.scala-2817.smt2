; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40812 () Bool)

(assert start!40812)

(declare-fun b_free!10801 () Bool)

(declare-fun b_next!10801 () Bool)

(assert (=> start!40812 (= b_free!10801 (not b_next!10801))))

(declare-fun tp!38225 () Bool)

(declare-fun b_and!18889 () Bool)

(assert (=> start!40812 (= tp!38225 b_and!18889)))

(declare-fun b!453002 () Bool)

(declare-fun res!269894 () Bool)

(declare-fun e!265172 () Bool)

(assert (=> b!453002 (=> (not res!269894) (not e!265172))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!453002 (= res!269894 (bvsle from!863 i!563))))

(declare-fun b!453003 () Bool)

(declare-fun res!269896 () Bool)

(declare-fun e!265167 () Bool)

(assert (=> b!453003 (=> (not res!269896) (not e!265167))))

(declare-datatypes ((array!28085 0))(
  ( (array!28086 (arr!13487 (Array (_ BitVec 32) (_ BitVec 64))) (size!13839 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28085)

(declare-datatypes ((List!8111 0))(
  ( (Nil!8108) (Cons!8107 (h!8963 (_ BitVec 64)) (t!13935 List!8111)) )
))
(declare-fun arrayNoDuplicates!0 (array!28085 (_ BitVec 32) List!8111) Bool)

(assert (=> b!453003 (= res!269896 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8108))))

(declare-fun b!453004 () Bool)

(declare-fun res!269884 () Bool)

(assert (=> b!453004 (=> (not res!269884) (not e!265167))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!453004 (= res!269884 (validKeyInArray!0 k!794))))

(declare-fun b!453005 () Bool)

(declare-fun e!265169 () Bool)

(declare-fun tp_is_empty!12139 () Bool)

(assert (=> b!453005 (= e!265169 tp_is_empty!12139)))

(declare-datatypes ((V!17291 0))(
  ( (V!17292 (val!6114 Int)) )
))
(declare-datatypes ((tuple2!8054 0))(
  ( (tuple2!8055 (_1!4038 (_ BitVec 64)) (_2!4038 V!17291)) )
))
(declare-datatypes ((List!8112 0))(
  ( (Nil!8109) (Cons!8108 (h!8964 tuple2!8054) (t!13936 List!8112)) )
))
(declare-datatypes ((ListLongMap!6967 0))(
  ( (ListLongMap!6968 (toList!3499 List!8112)) )
))
(declare-fun call!30016 () ListLongMap!6967)

(declare-fun b!453006 () Bool)

(declare-fun e!265173 () Bool)

(declare-fun call!30017 () ListLongMap!6967)

(declare-fun v!412 () V!17291)

(declare-fun +!1575 (ListLongMap!6967 tuple2!8054) ListLongMap!6967)

(assert (=> b!453006 (= e!265173 (= call!30016 (+!1575 call!30017 (tuple2!8055 k!794 v!412))))))

(declare-fun b!453007 () Bool)

(declare-fun res!269885 () Bool)

(assert (=> b!453007 (=> (not res!269885) (not e!265167))))

(declare-fun arrayContainsKey!0 (array!28085 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!453007 (= res!269885 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun lt!205556 () ListLongMap!6967)

(declare-fun b!453008 () Bool)

(declare-fun lt!205560 () ListLongMap!6967)

(declare-fun e!265170 () Bool)

(assert (=> b!453008 (= e!265170 (= lt!205556 (+!1575 lt!205560 (tuple2!8055 k!794 v!412))))))

(declare-fun lt!205555 () V!17291)

(declare-fun lt!205554 () tuple2!8054)

(declare-fun lt!205552 () ListLongMap!6967)

(assert (=> b!453008 (= (+!1575 lt!205552 lt!205554) (+!1575 (+!1575 lt!205552 (tuple2!8055 k!794 lt!205555)) lt!205554))))

(declare-fun lt!205559 () V!17291)

(assert (=> b!453008 (= lt!205554 (tuple2!8055 k!794 lt!205559))))

(declare-datatypes ((Unit!13246 0))(
  ( (Unit!13247) )
))
(declare-fun lt!205553 () Unit!13246)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!86 (ListLongMap!6967 (_ BitVec 64) V!17291 V!17291) Unit!13246)

(assert (=> b!453008 (= lt!205553 (addSameAsAddTwiceSameKeyDiffValues!86 lt!205552 k!794 lt!205555 lt!205559))))

(declare-fun lt!205558 () V!17291)

(declare-datatypes ((ValueCell!5726 0))(
  ( (ValueCellFull!5726 (v!8373 V!17291)) (EmptyCell!5726) )
))
(declare-datatypes ((array!28087 0))(
  ( (array!28088 (arr!13488 (Array (_ BitVec 32) ValueCell!5726)) (size!13840 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28087)

(declare-fun get!6652 (ValueCell!5726 V!17291) V!17291)

(assert (=> b!453008 (= lt!205555 (get!6652 (select (arr!13488 _values!549) from!863) lt!205558))))

(declare-fun lt!205562 () array!28085)

(assert (=> b!453008 (= lt!205556 (+!1575 lt!205552 (tuple2!8055 (select (arr!13487 lt!205562) from!863) lt!205559)))))

(assert (=> b!453008 (= lt!205559 (get!6652 (select (store (arr!13488 _values!549) i!563 (ValueCellFull!5726 v!412)) from!863) lt!205558))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!873 (Int (_ BitVec 64)) V!17291)

(assert (=> b!453008 (= lt!205558 (dynLambda!873 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17291)

(declare-fun lt!205557 () array!28087)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun minValue!515 () V!17291)

(declare-fun getCurrentListMapNoExtraKeys!1682 (array!28085 array!28087 (_ BitVec 32) (_ BitVec 32) V!17291 V!17291 (_ BitVec 32) Int) ListLongMap!6967)

(assert (=> b!453008 (= lt!205552 (getCurrentListMapNoExtraKeys!1682 lt!205562 lt!205557 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!453009 () Bool)

(declare-fun e!265175 () Bool)

(assert (=> b!453009 (= e!265172 e!265175)))

(declare-fun res!269893 () Bool)

(assert (=> b!453009 (=> (not res!269893) (not e!265175))))

(assert (=> b!453009 (= res!269893 (= from!863 i!563))))

(assert (=> b!453009 (= lt!205556 (getCurrentListMapNoExtraKeys!1682 lt!205562 lt!205557 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!453009 (= lt!205557 (array!28088 (store (arr!13488 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13840 _values!549)))))

(assert (=> b!453009 (= lt!205560 (getCurrentListMapNoExtraKeys!1682 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!19845 () Bool)

(declare-fun mapRes!19845 () Bool)

(declare-fun tp!38226 () Bool)

(declare-fun e!265168 () Bool)

(assert (=> mapNonEmpty!19845 (= mapRes!19845 (and tp!38226 e!265168))))

(declare-fun mapRest!19845 () (Array (_ BitVec 32) ValueCell!5726))

(declare-fun mapValue!19845 () ValueCell!5726)

(declare-fun mapKey!19845 () (_ BitVec 32))

(assert (=> mapNonEmpty!19845 (= (arr!13488 _values!549) (store mapRest!19845 mapKey!19845 mapValue!19845))))

(declare-fun c!56150 () Bool)

(declare-fun bm!30013 () Bool)

(assert (=> bm!30013 (= call!30017 (getCurrentListMapNoExtraKeys!1682 (ite c!56150 _keys!709 lt!205562) (ite c!56150 _values!549 lt!205557) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!453011 () Bool)

(assert (=> b!453011 (= e!265168 tp_is_empty!12139)))

(declare-fun b!453012 () Bool)

(declare-fun res!269892 () Bool)

(assert (=> b!453012 (=> (not res!269892) (not e!265167))))

(assert (=> b!453012 (= res!269892 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13839 _keys!709))))))

(declare-fun b!453013 () Bool)

(declare-fun res!269888 () Bool)

(assert (=> b!453013 (=> (not res!269888) (not e!265167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28085 (_ BitVec 32)) Bool)

(assert (=> b!453013 (= res!269888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!30014 () Bool)

(assert (=> bm!30014 (= call!30016 (getCurrentListMapNoExtraKeys!1682 (ite c!56150 lt!205562 _keys!709) (ite c!56150 lt!205557 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!453014 () Bool)

(declare-fun res!269887 () Bool)

(assert (=> b!453014 (=> (not res!269887) (not e!265167))))

(assert (=> b!453014 (= res!269887 (and (= (size!13840 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13839 _keys!709) (size!13840 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!453015 () Bool)

(declare-fun res!269895 () Bool)

(assert (=> b!453015 (=> (not res!269895) (not e!265172))))

(assert (=> b!453015 (= res!269895 (arrayNoDuplicates!0 lt!205562 #b00000000000000000000000000000000 Nil!8108))))

(declare-fun b!453016 () Bool)

(assert (=> b!453016 (= e!265167 e!265172)))

(declare-fun res!269889 () Bool)

(assert (=> b!453016 (=> (not res!269889) (not e!265172))))

(assert (=> b!453016 (= res!269889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205562 mask!1025))))

(assert (=> b!453016 (= lt!205562 (array!28086 (store (arr!13487 _keys!709) i!563 k!794) (size!13839 _keys!709)))))

(declare-fun b!453017 () Bool)

(declare-fun res!269890 () Bool)

(assert (=> b!453017 (=> (not res!269890) (not e!265167))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!453017 (= res!269890 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19845 () Bool)

(assert (=> mapIsEmpty!19845 mapRes!19845))

(declare-fun b!453018 () Bool)

(declare-fun e!265171 () Bool)

(assert (=> b!453018 (= e!265171 (and e!265169 mapRes!19845))))

(declare-fun condMapEmpty!19845 () Bool)

(declare-fun mapDefault!19845 () ValueCell!5726)

