; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84244 () Bool)

(assert start!84244)

(declare-fun b_free!19945 () Bool)

(declare-fun b_next!19945 () Bool)

(assert (=> start!84244 (= b_free!19945 (not b_next!19945))))

(declare-fun tp!69438 () Bool)

(declare-fun b_and!31967 () Bool)

(assert (=> start!84244 (= tp!69438 b_and!31967)))

(declare-fun mapNonEmpty!36599 () Bool)

(declare-fun mapRes!36599 () Bool)

(declare-fun tp!69439 () Bool)

(declare-fun e!555549 () Bool)

(assert (=> mapNonEmpty!36599 (= mapRes!36599 (and tp!69439 e!555549))))

(declare-datatypes ((V!35713 0))(
  ( (V!35714 (val!11574 Int)) )
))
(declare-datatypes ((ValueCell!11042 0))(
  ( (ValueCellFull!11042 (v!14136 V!35713)) (EmptyCell!11042) )
))
(declare-fun mapRest!36599 () (Array (_ BitVec 32) ValueCell!11042))

(declare-datatypes ((array!62069 0))(
  ( (array!62070 (arr!29892 (Array (_ BitVec 32) ValueCell!11042)) (size!30371 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62069)

(declare-fun mapValue!36599 () ValueCell!11042)

(declare-fun mapKey!36599 () (_ BitVec 32))

(assert (=> mapNonEmpty!36599 (= (arr!29892 _values!1278) (store mapRest!36599 mapKey!36599 mapValue!36599))))

(declare-fun b!985577 () Bool)

(declare-fun res!659513 () Bool)

(declare-fun e!555552 () Bool)

(assert (=> b!985577 (=> (not res!659513) (not e!555552))))

(declare-datatypes ((array!62071 0))(
  ( (array!62072 (arr!29893 (Array (_ BitVec 32) (_ BitVec 64))) (size!30372 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62071)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62071 (_ BitVec 32)) Bool)

(assert (=> b!985577 (= res!659513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985578 () Bool)

(declare-fun res!659512 () Bool)

(assert (=> b!985578 (=> (not res!659512) (not e!555552))))

(declare-datatypes ((List!20705 0))(
  ( (Nil!20702) (Cons!20701 (h!21863 (_ BitVec 64)) (t!29594 List!20705)) )
))
(declare-fun arrayNoDuplicates!0 (array!62071 (_ BitVec 32) List!20705) Bool)

(assert (=> b!985578 (= res!659512 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20702))))

(declare-fun b!985579 () Bool)

(declare-fun res!659514 () Bool)

(assert (=> b!985579 (=> (not res!659514) (not e!555552))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985579 (= res!659514 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985580 () Bool)

(declare-fun e!555547 () Bool)

(assert (=> b!985580 (= e!555547 (not true))))

(declare-datatypes ((tuple2!14814 0))(
  ( (tuple2!14815 (_1!7418 (_ BitVec 64)) (_2!7418 V!35713)) )
))
(declare-datatypes ((List!20706 0))(
  ( (Nil!20703) (Cons!20702 (h!21864 tuple2!14814) (t!29595 List!20706)) )
))
(declare-datatypes ((ListLongMap!13511 0))(
  ( (ListLongMap!13512 (toList!6771 List!20706)) )
))
(declare-fun lt!437302 () ListLongMap!13511)

(declare-fun lt!437305 () tuple2!14814)

(declare-fun lt!437304 () tuple2!14814)

(declare-fun +!3057 (ListLongMap!13511 tuple2!14814) ListLongMap!13511)

(assert (=> b!985580 (= (+!3057 (+!3057 lt!437302 lt!437305) lt!437304) (+!3057 (+!3057 lt!437302 lt!437304) lt!437305))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!437303 () V!35713)

(assert (=> b!985580 (= lt!437304 (tuple2!14815 (select (arr!29893 _keys!1544) from!1932) lt!437303))))

(declare-fun minValue!1220 () V!35713)

(assert (=> b!985580 (= lt!437305 (tuple2!14815 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32753 0))(
  ( (Unit!32754) )
))
(declare-fun lt!437306 () Unit!32753)

(declare-fun addCommutativeForDiffKeys!685 (ListLongMap!13511 (_ BitVec 64) V!35713 (_ BitVec 64) V!35713) Unit!32753)

(assert (=> b!985580 (= lt!437306 (addCommutativeForDiffKeys!685 lt!437302 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29893 _keys!1544) from!1932) lt!437303))))

(declare-fun b!985581 () Bool)

(assert (=> b!985581 (= e!555552 e!555547)))

(declare-fun res!659517 () Bool)

(assert (=> b!985581 (=> (not res!659517) (not e!555547))))

(assert (=> b!985581 (= res!659517 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29893 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15519 (ValueCell!11042 V!35713) V!35713)

(declare-fun dynLambda!1842 (Int (_ BitVec 64)) V!35713)

(assert (=> b!985581 (= lt!437303 (get!15519 (select (arr!29892 _values!1278) from!1932) (dynLambda!1842 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35713)

(declare-fun getCurrentListMapNoExtraKeys!3462 (array!62071 array!62069 (_ BitVec 32) (_ BitVec 32) V!35713 V!35713 (_ BitVec 32) Int) ListLongMap!13511)

(assert (=> b!985581 (= lt!437302 (getCurrentListMapNoExtraKeys!3462 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!659516 () Bool)

(assert (=> start!84244 (=> (not res!659516) (not e!555552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84244 (= res!659516 (validMask!0 mask!1948))))

(assert (=> start!84244 e!555552))

(assert (=> start!84244 true))

(declare-fun tp_is_empty!23047 () Bool)

(assert (=> start!84244 tp_is_empty!23047))

(declare-fun e!555550 () Bool)

(declare-fun array_inv!23105 (array!62069) Bool)

(assert (=> start!84244 (and (array_inv!23105 _values!1278) e!555550)))

(assert (=> start!84244 tp!69438))

(declare-fun array_inv!23106 (array!62071) Bool)

(assert (=> start!84244 (array_inv!23106 _keys!1544)))

(declare-fun b!985582 () Bool)

(declare-fun res!659519 () Bool)

(assert (=> b!985582 (=> (not res!659519) (not e!555552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985582 (= res!659519 (validKeyInArray!0 (select (arr!29893 _keys!1544) from!1932)))))

(declare-fun b!985583 () Bool)

(declare-fun res!659518 () Bool)

(assert (=> b!985583 (=> (not res!659518) (not e!555552))))

(assert (=> b!985583 (= res!659518 (and (= (size!30371 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30372 _keys!1544) (size!30371 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36599 () Bool)

(assert (=> mapIsEmpty!36599 mapRes!36599))

(declare-fun b!985584 () Bool)

(declare-fun e!555548 () Bool)

(assert (=> b!985584 (= e!555548 tp_is_empty!23047)))

(declare-fun b!985585 () Bool)

(assert (=> b!985585 (= e!555549 tp_is_empty!23047)))

(declare-fun b!985586 () Bool)

(declare-fun res!659515 () Bool)

(assert (=> b!985586 (=> (not res!659515) (not e!555552))))

(assert (=> b!985586 (= res!659515 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30372 _keys!1544))))))

(declare-fun b!985587 () Bool)

(assert (=> b!985587 (= e!555550 (and e!555548 mapRes!36599))))

(declare-fun condMapEmpty!36599 () Bool)

(declare-fun mapDefault!36599 () ValueCell!11042)

