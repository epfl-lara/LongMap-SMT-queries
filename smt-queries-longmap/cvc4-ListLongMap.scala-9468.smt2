; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112420 () Bool)

(assert start!112420)

(declare-fun b_free!30815 () Bool)

(declare-fun b_next!30815 () Bool)

(assert (=> start!112420 (= b_free!30815 (not b_next!30815))))

(declare-fun tp!108081 () Bool)

(declare-fun b_and!49657 () Bool)

(assert (=> start!112420 (= tp!108081 b_and!49657)))

(declare-fun b!1332843 () Bool)

(declare-fun e!759316 () Bool)

(declare-fun tp_is_empty!36725 () Bool)

(assert (=> b!1332843 (= e!759316 tp_is_empty!36725)))

(declare-fun mapIsEmpty!56761 () Bool)

(declare-fun mapRes!56761 () Bool)

(assert (=> mapIsEmpty!56761 mapRes!56761))

(declare-fun b!1332844 () Bool)

(declare-fun res!884483 () Bool)

(declare-fun e!759312 () Bool)

(assert (=> b!1332844 (=> (not res!884483) (not e!759312))))

(declare-datatypes ((array!90326 0))(
  ( (array!90327 (arr!43629 (Array (_ BitVec 32) (_ BitVec 64))) (size!44179 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90326)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90326 (_ BitVec 32)) Bool)

(assert (=> b!1332844 (= res!884483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapNonEmpty!56761 () Bool)

(declare-fun tp!108082 () Bool)

(declare-fun e!759313 () Bool)

(assert (=> mapNonEmpty!56761 (= mapRes!56761 (and tp!108082 e!759313))))

(declare-datatypes ((V!54069 0))(
  ( (V!54070 (val!18437 Int)) )
))
(declare-datatypes ((ValueCell!17464 0))(
  ( (ValueCellFull!17464 (v!21074 V!54069)) (EmptyCell!17464) )
))
(declare-datatypes ((array!90328 0))(
  ( (array!90329 (arr!43630 (Array (_ BitVec 32) ValueCell!17464)) (size!44180 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90328)

(declare-fun mapValue!56761 () ValueCell!17464)

(declare-fun mapKey!56761 () (_ BitVec 32))

(declare-fun mapRest!56761 () (Array (_ BitVec 32) ValueCell!17464))

(assert (=> mapNonEmpty!56761 (= (arr!43630 _values!1320) (store mapRest!56761 mapKey!56761 mapValue!56761))))

(declare-fun b!1332846 () Bool)

(declare-fun res!884485 () Bool)

(assert (=> b!1332846 (=> (not res!884485) (not e!759312))))

(declare-datatypes ((List!30906 0))(
  ( (Nil!30903) (Cons!30902 (h!32111 (_ BitVec 64)) (t!45104 List!30906)) )
))
(declare-fun arrayNoDuplicates!0 (array!90326 (_ BitVec 32) List!30906) Bool)

(assert (=> b!1332846 (= res!884485 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30903))))

(declare-fun b!1332847 () Bool)

(assert (=> b!1332847 (= e!759312 false)))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun lt!592075 () Bool)

(declare-fun minValue!1262 () V!54069)

(declare-fun zeroValue!1262 () V!54069)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23762 0))(
  ( (tuple2!23763 (_1!11892 (_ BitVec 64)) (_2!11892 V!54069)) )
))
(declare-datatypes ((List!30907 0))(
  ( (Nil!30904) (Cons!30903 (h!32112 tuple2!23762) (t!45105 List!30907)) )
))
(declare-datatypes ((ListLongMap!21419 0))(
  ( (ListLongMap!21420 (toList!10725 List!30907)) )
))
(declare-fun contains!8889 (ListLongMap!21419 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5706 (array!90326 array!90328 (_ BitVec 32) (_ BitVec 32) V!54069 V!54069 (_ BitVec 32) Int) ListLongMap!21419)

(assert (=> b!1332847 (= lt!592075 (contains!8889 (getCurrentListMap!5706 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1332848 () Bool)

(assert (=> b!1332848 (= e!759313 tp_is_empty!36725)))

(declare-fun b!1332849 () Bool)

(declare-fun e!759315 () Bool)

(assert (=> b!1332849 (= e!759315 (and e!759316 mapRes!56761))))

(declare-fun condMapEmpty!56761 () Bool)

(declare-fun mapDefault!56761 () ValueCell!17464)

