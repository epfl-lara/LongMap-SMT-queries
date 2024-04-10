; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113342 () Bool)

(assert start!113342)

(declare-fun b_free!31393 () Bool)

(declare-fun b_next!31393 () Bool)

(assert (=> start!113342 (= b_free!31393 (not b_next!31393))))

(declare-fun tp!109983 () Bool)

(declare-fun b_and!50639 () Bool)

(assert (=> start!113342 (= tp!109983 b_and!50639)))

(declare-fun b!1345050 () Bool)

(declare-fun res!892454 () Bool)

(declare-fun e!765449 () Bool)

(assert (=> b!1345050 (=> (not res!892454) (not e!765449))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91626 0))(
  ( (array!91627 (arr!44269 (Array (_ BitVec 32) (_ BitVec 64))) (size!44819 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91626)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1345050 (= res!892454 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44819 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57796 () Bool)

(declare-fun mapRes!57796 () Bool)

(assert (=> mapIsEmpty!57796 mapRes!57796))

(declare-fun b!1345051 () Bool)

(declare-fun e!765445 () Bool)

(assert (=> b!1345051 (= e!765449 e!765445)))

(declare-fun res!892447 () Bool)

(assert (=> b!1345051 (=> (not res!892447) (not e!765445))))

(declare-datatypes ((V!54961 0))(
  ( (V!54962 (val!18771 Int)) )
))
(declare-datatypes ((tuple2!24196 0))(
  ( (tuple2!24197 (_1!12109 (_ BitVec 64)) (_2!12109 V!54961)) )
))
(declare-datatypes ((List!31352 0))(
  ( (Nil!31349) (Cons!31348 (h!32557 tuple2!24196) (t!45902 List!31352)) )
))
(declare-datatypes ((ListLongMap!21853 0))(
  ( (ListLongMap!21854 (toList!10942 List!31352)) )
))
(declare-fun lt!595271 () ListLongMap!21853)

(declare-fun lt!595272 () V!54961)

(declare-fun contains!9118 (ListLongMap!21853 (_ BitVec 64)) Bool)

(declare-fun +!4825 (ListLongMap!21853 tuple2!24196) ListLongMap!21853)

(assert (=> b!1345051 (= res!892447 (contains!9118 (+!4825 lt!595271 (tuple2!24197 (select (arr!44269 _keys!1571) from!1960) lt!595272)) k!1142))))

(declare-fun minValue!1245 () V!54961)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54961)

(declare-datatypes ((ValueCell!17798 0))(
  ( (ValueCellFull!17798 (v!21419 V!54961)) (EmptyCell!17798) )
))
(declare-datatypes ((array!91628 0))(
  ( (array!91629 (arr!44270 (Array (_ BitVec 32) ValueCell!17798)) (size!44820 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91628)

(declare-fun getCurrentListMapNoExtraKeys!6467 (array!91626 array!91628 (_ BitVec 32) (_ BitVec 32) V!54961 V!54961 (_ BitVec 32) Int) ListLongMap!21853)

(assert (=> b!1345051 (= lt!595271 (getCurrentListMapNoExtraKeys!6467 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22362 (ValueCell!17798 V!54961) V!54961)

(declare-fun dynLambda!3764 (Int (_ BitVec 64)) V!54961)

(assert (=> b!1345051 (= lt!595272 (get!22362 (select (arr!44270 _values!1303) from!1960) (dynLambda!3764 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1345052 () Bool)

(declare-fun res!892446 () Bool)

(assert (=> b!1345052 (=> (not res!892446) (not e!765449))))

(declare-fun getCurrentListMap!5896 (array!91626 array!91628 (_ BitVec 32) (_ BitVec 32) V!54961 V!54961 (_ BitVec 32) Int) ListLongMap!21853)

(assert (=> b!1345052 (= res!892446 (contains!9118 (getCurrentListMap!5896 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1345053 () Bool)

(declare-fun res!892451 () Bool)

(assert (=> b!1345053 (=> (not res!892451) (not e!765449))))

(assert (=> b!1345053 (= res!892451 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!892453 () Bool)

(assert (=> start!113342 (=> (not res!892453) (not e!765449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113342 (= res!892453 (validMask!0 mask!1977))))

(assert (=> start!113342 e!765449))

(declare-fun tp_is_empty!37393 () Bool)

(assert (=> start!113342 tp_is_empty!37393))

(assert (=> start!113342 true))

(declare-fun array_inv!33363 (array!91626) Bool)

(assert (=> start!113342 (array_inv!33363 _keys!1571)))

(declare-fun e!765446 () Bool)

(declare-fun array_inv!33364 (array!91628) Bool)

(assert (=> start!113342 (and (array_inv!33364 _values!1303) e!765446)))

(assert (=> start!113342 tp!109983))

(declare-fun b!1345054 () Bool)

(declare-fun e!765447 () Bool)

(assert (=> b!1345054 (= e!765446 (and e!765447 mapRes!57796))))

(declare-fun condMapEmpty!57796 () Bool)

(declare-fun mapDefault!57796 () ValueCell!17798)

