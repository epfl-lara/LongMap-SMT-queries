; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133860 () Bool)

(assert start!133860)

(declare-fun b_free!32121 () Bool)

(declare-fun b_next!32121 () Bool)

(assert (=> start!133860 (= b_free!32121 (not b_next!32121))))

(declare-fun tp!113658 () Bool)

(declare-fun b_and!51691 () Bool)

(assert (=> start!133860 (= tp!113658 b_and!51691)))

(declare-fun mapIsEmpty!59728 () Bool)

(declare-fun mapRes!59728 () Bool)

(assert (=> mapIsEmpty!59728 mapRes!59728))

(declare-fun b!1564945 () Bool)

(declare-fun res!1069823 () Bool)

(declare-fun e!872274 () Bool)

(assert (=> b!1564945 (=> (not res!1069823) (not e!872274))))

(declare-datatypes ((array!104478 0))(
  ( (array!104479 (arr!50428 (Array (_ BitVec 32) (_ BitVec 64))) (size!50978 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104478)

(declare-datatypes ((List!36585 0))(
  ( (Nil!36582) (Cons!36581 (h!38027 (_ BitVec 64)) (t!51432 List!36585)) )
))
(declare-fun arrayNoDuplicates!0 (array!104478 (_ BitVec 32) List!36585) Bool)

(assert (=> b!1564945 (= res!1069823 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36582))))

(declare-fun b!1564946 () Bool)

(declare-fun res!1069825 () Bool)

(assert (=> b!1564946 (=> (not res!1069825) (not e!872274))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104478 (_ BitVec 32)) Bool)

(assert (=> b!1564946 (= res!1069825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564947 () Bool)

(declare-fun e!872271 () Bool)

(declare-fun tp_is_empty!38895 () Bool)

(assert (=> b!1564947 (= e!872271 tp_is_empty!38895)))

(declare-fun b!1564948 () Bool)

(declare-fun res!1069820 () Bool)

(assert (=> b!1564948 (=> (not res!1069820) (not e!872274))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1564948 (= res!1069820 (validKeyInArray!0 (select (arr!50428 _keys!637) from!782)))))

(declare-fun b!1564949 () Bool)

(assert (=> b!1564949 (= e!872274 false)))

(declare-fun defaultEntry!495 () Int)

(declare-datatypes ((V!60067 0))(
  ( (V!60068 (val!19531 Int)) )
))
(declare-fun zeroValue!453 () V!60067)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60067)

(declare-datatypes ((ValueCell!18417 0))(
  ( (ValueCellFull!18417 (v!22285 V!60067)) (EmptyCell!18417) )
))
(declare-datatypes ((array!104480 0))(
  ( (array!104481 (arr!50429 (Array (_ BitVec 32) ValueCell!18417)) (size!50979 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104480)

(declare-datatypes ((tuple2!25196 0))(
  ( (tuple2!25197 (_1!12609 (_ BitVec 64)) (_2!12609 V!60067)) )
))
(declare-datatypes ((List!36586 0))(
  ( (Nil!36583) (Cons!36582 (h!38028 tuple2!25196) (t!51433 List!36586)) )
))
(declare-datatypes ((ListLongMap!22631 0))(
  ( (ListLongMap!22632 (toList!11331 List!36586)) )
))
(declare-fun lt!672122 () ListLongMap!22631)

(declare-fun getCurrentListMapNoExtraKeys!6696 (array!104478 array!104480 (_ BitVec 32) (_ BitVec 32) V!60067 V!60067 (_ BitVec 32) Int) ListLongMap!22631)

(assert (=> b!1564949 (= lt!672122 (getCurrentListMapNoExtraKeys!6696 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1564950 () Bool)

(declare-fun e!872272 () Bool)

(assert (=> b!1564950 (= e!872272 tp_is_empty!38895)))

(declare-fun b!1564951 () Bool)

(declare-fun e!872273 () Bool)

(assert (=> b!1564951 (= e!872273 (and e!872272 mapRes!59728))))

(declare-fun condMapEmpty!59728 () Bool)

(declare-fun mapDefault!59728 () ValueCell!18417)

(assert (=> b!1564951 (= condMapEmpty!59728 (= (arr!50429 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18417)) mapDefault!59728)))))

(declare-fun mapNonEmpty!59728 () Bool)

(declare-fun tp!113659 () Bool)

(assert (=> mapNonEmpty!59728 (= mapRes!59728 (and tp!113659 e!872271))))

(declare-fun mapValue!59728 () ValueCell!18417)

(declare-fun mapKey!59728 () (_ BitVec 32))

(declare-fun mapRest!59728 () (Array (_ BitVec 32) ValueCell!18417))

(assert (=> mapNonEmpty!59728 (= (arr!50429 _values!487) (store mapRest!59728 mapKey!59728 mapValue!59728))))

(declare-fun b!1564952 () Bool)

(declare-fun res!1069824 () Bool)

(assert (=> b!1564952 (=> (not res!1069824) (not e!872274))))

(assert (=> b!1564952 (= res!1069824 (and (= (size!50979 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50978 _keys!637) (size!50979 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1069822 () Bool)

(assert (=> start!133860 (=> (not res!1069822) (not e!872274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133860 (= res!1069822 (validMask!0 mask!947))))

(assert (=> start!133860 e!872274))

(assert (=> start!133860 tp!113658))

(assert (=> start!133860 tp_is_empty!38895))

(assert (=> start!133860 true))

(declare-fun array_inv!39189 (array!104478) Bool)

(assert (=> start!133860 (array_inv!39189 _keys!637)))

(declare-fun array_inv!39190 (array!104480) Bool)

(assert (=> start!133860 (and (array_inv!39190 _values!487) e!872273)))

(declare-fun b!1564944 () Bool)

(declare-fun res!1069821 () Bool)

(assert (=> b!1564944 (=> (not res!1069821) (not e!872274))))

(assert (=> b!1564944 (= res!1069821 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50978 _keys!637)) (bvslt from!782 (size!50978 _keys!637))))))

(assert (= (and start!133860 res!1069822) b!1564952))

(assert (= (and b!1564952 res!1069824) b!1564946))

(assert (= (and b!1564946 res!1069825) b!1564945))

(assert (= (and b!1564945 res!1069823) b!1564944))

(assert (= (and b!1564944 res!1069821) b!1564948))

(assert (= (and b!1564948 res!1069820) b!1564949))

(assert (= (and b!1564951 condMapEmpty!59728) mapIsEmpty!59728))

(assert (= (and b!1564951 (not condMapEmpty!59728)) mapNonEmpty!59728))

(get-info :version)

(assert (= (and mapNonEmpty!59728 ((_ is ValueCellFull!18417) mapValue!59728)) b!1564947))

(assert (= (and b!1564951 ((_ is ValueCellFull!18417) mapDefault!59728)) b!1564950))

(assert (= start!133860 b!1564951))

(declare-fun m!1439965 () Bool)

(assert (=> b!1564949 m!1439965))

(declare-fun m!1439967 () Bool)

(assert (=> b!1564945 m!1439967))

(declare-fun m!1439969 () Bool)

(assert (=> mapNonEmpty!59728 m!1439969))

(declare-fun m!1439971 () Bool)

(assert (=> start!133860 m!1439971))

(declare-fun m!1439973 () Bool)

(assert (=> start!133860 m!1439973))

(declare-fun m!1439975 () Bool)

(assert (=> start!133860 m!1439975))

(declare-fun m!1439977 () Bool)

(assert (=> b!1564946 m!1439977))

(declare-fun m!1439979 () Bool)

(assert (=> b!1564948 m!1439979))

(assert (=> b!1564948 m!1439979))

(declare-fun m!1439981 () Bool)

(assert (=> b!1564948 m!1439981))

(check-sat (not b!1564946) (not b!1564945) tp_is_empty!38895 b_and!51691 (not mapNonEmpty!59728) (not b!1564949) (not b!1564948) (not b_next!32121) (not start!133860))
(check-sat b_and!51691 (not b_next!32121))
