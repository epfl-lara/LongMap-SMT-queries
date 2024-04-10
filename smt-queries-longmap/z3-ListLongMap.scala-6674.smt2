; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84018 () Bool)

(assert start!84018)

(declare-fun b_free!19773 () Bool)

(declare-fun b_next!19773 () Bool)

(assert (=> start!84018 (= b_free!19773 (not b_next!19773))))

(declare-fun tp!68841 () Bool)

(declare-fun b_and!31629 () Bool)

(assert (=> start!84018 (= tp!68841 b_and!31629)))

(declare-fun b!982069 () Bool)

(declare-fun res!657193 () Bool)

(declare-fun e!553605 () Bool)

(assert (=> b!982069 (=> (not res!657193) (not e!553605))))

(declare-datatypes ((array!61637 0))(
  ( (array!61638 (arr!29676 (Array (_ BitVec 32) (_ BitVec 64))) (size!30155 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61637)

(declare-datatypes ((List!20557 0))(
  ( (Nil!20554) (Cons!20553 (h!21715 (_ BitVec 64)) (t!29280 List!20557)) )
))
(declare-fun arrayNoDuplicates!0 (array!61637 (_ BitVec 32) List!20557) Bool)

(assert (=> b!982069 (= res!657193 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20554))))

(declare-fun b!982070 () Bool)

(declare-fun res!657190 () Bool)

(assert (=> b!982070 (=> (not res!657190) (not e!553605))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35411 0))(
  ( (V!35412 (val!11461 Int)) )
))
(declare-datatypes ((ValueCell!10929 0))(
  ( (ValueCellFull!10929 (v!14023 V!35411)) (EmptyCell!10929) )
))
(declare-datatypes ((array!61639 0))(
  ( (array!61640 (arr!29677 (Array (_ BitVec 32) ValueCell!10929)) (size!30156 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61639)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!982070 (= res!657190 (and (= (size!30156 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30155 _keys!1544) (size!30156 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982071 () Bool)

(declare-fun e!553607 () Bool)

(assert (=> b!982071 (= e!553605 e!553607)))

(declare-fun res!657191 () Bool)

(assert (=> b!982071 (=> (not res!657191) (not e!553607))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982071 (= res!657191 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29676 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!435978 () V!35411)

(declare-fun get!15386 (ValueCell!10929 V!35411) V!35411)

(declare-fun dynLambda!1785 (Int (_ BitVec 64)) V!35411)

(assert (=> b!982071 (= lt!435978 (get!15386 (select (arr!29677 _values!1278) from!1932) (dynLambda!1785 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35411)

(declare-fun zeroValue!1220 () V!35411)

(declare-datatypes ((tuple2!14676 0))(
  ( (tuple2!14677 (_1!7349 (_ BitVec 64)) (_2!7349 V!35411)) )
))
(declare-datatypes ((List!20558 0))(
  ( (Nil!20555) (Cons!20554 (h!21716 tuple2!14676) (t!29281 List!20558)) )
))
(declare-datatypes ((ListLongMap!13373 0))(
  ( (ListLongMap!13374 (toList!6702 List!20558)) )
))
(declare-fun lt!435976 () ListLongMap!13373)

(declare-fun getCurrentListMapNoExtraKeys!3402 (array!61637 array!61639 (_ BitVec 32) (_ BitVec 32) V!35411 V!35411 (_ BitVec 32) Int) ListLongMap!13373)

(assert (=> b!982071 (= lt!435976 (getCurrentListMapNoExtraKeys!3402 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!982072 () Bool)

(declare-fun res!657189 () Bool)

(assert (=> b!982072 (=> (not res!657189) (not e!553605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982072 (= res!657189 (validKeyInArray!0 (select (arr!29676 _keys!1544) from!1932)))))

(declare-fun b!982073 () Bool)

(declare-fun res!657187 () Bool)

(assert (=> b!982073 (=> (not res!657187) (not e!553605))))

(assert (=> b!982073 (= res!657187 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30155 _keys!1544))))))

(declare-fun b!982074 () Bool)

(assert (=> b!982074 (= e!553607 (not true))))

(declare-fun lt!435977 () tuple2!14676)

(declare-fun lt!435980 () tuple2!14676)

(declare-fun +!3000 (ListLongMap!13373 tuple2!14676) ListLongMap!13373)

(assert (=> b!982074 (= (+!3000 (+!3000 lt!435976 lt!435977) lt!435980) (+!3000 (+!3000 lt!435976 lt!435980) lt!435977))))

(assert (=> b!982074 (= lt!435980 (tuple2!14677 (select (arr!29676 _keys!1544) from!1932) lt!435978))))

(assert (=> b!982074 (= lt!435977 (tuple2!14677 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32639 0))(
  ( (Unit!32640) )
))
(declare-fun lt!435979 () Unit!32639)

(declare-fun addCommutativeForDiffKeys!628 (ListLongMap!13373 (_ BitVec 64) V!35411 (_ BitVec 64) V!35411) Unit!32639)

(assert (=> b!982074 (= lt!435979 (addCommutativeForDiffKeys!628 lt!435976 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29676 _keys!1544) from!1932) lt!435978))))

(declare-fun b!982075 () Bool)

(declare-fun res!657188 () Bool)

(assert (=> b!982075 (=> (not res!657188) (not e!553605))))

(assert (=> b!982075 (= res!657188 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!982076 () Bool)

(declare-fun e!553606 () Bool)

(declare-fun tp_is_empty!22821 () Bool)

(assert (=> b!982076 (= e!553606 tp_is_empty!22821)))

(declare-fun b!982077 () Bool)

(declare-fun e!553604 () Bool)

(declare-fun e!553603 () Bool)

(declare-fun mapRes!36260 () Bool)

(assert (=> b!982077 (= e!553604 (and e!553603 mapRes!36260))))

(declare-fun condMapEmpty!36260 () Bool)

(declare-fun mapDefault!36260 () ValueCell!10929)

(assert (=> b!982077 (= condMapEmpty!36260 (= (arr!29677 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10929)) mapDefault!36260)))))

(declare-fun res!657194 () Bool)

(assert (=> start!84018 (=> (not res!657194) (not e!553605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84018 (= res!657194 (validMask!0 mask!1948))))

(assert (=> start!84018 e!553605))

(assert (=> start!84018 true))

(assert (=> start!84018 tp_is_empty!22821))

(declare-fun array_inv!22947 (array!61639) Bool)

(assert (=> start!84018 (and (array_inv!22947 _values!1278) e!553604)))

(assert (=> start!84018 tp!68841))

(declare-fun array_inv!22948 (array!61637) Bool)

(assert (=> start!84018 (array_inv!22948 _keys!1544)))

(declare-fun b!982078 () Bool)

(assert (=> b!982078 (= e!553603 tp_is_empty!22821)))

(declare-fun mapNonEmpty!36260 () Bool)

(declare-fun tp!68842 () Bool)

(assert (=> mapNonEmpty!36260 (= mapRes!36260 (and tp!68842 e!553606))))

(declare-fun mapKey!36260 () (_ BitVec 32))

(declare-fun mapRest!36260 () (Array (_ BitVec 32) ValueCell!10929))

(declare-fun mapValue!36260 () ValueCell!10929)

(assert (=> mapNonEmpty!36260 (= (arr!29677 _values!1278) (store mapRest!36260 mapKey!36260 mapValue!36260))))

(declare-fun b!982079 () Bool)

(declare-fun res!657192 () Bool)

(assert (=> b!982079 (=> (not res!657192) (not e!553605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61637 (_ BitVec 32)) Bool)

(assert (=> b!982079 (= res!657192 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36260 () Bool)

(assert (=> mapIsEmpty!36260 mapRes!36260))

(assert (= (and start!84018 res!657194) b!982070))

(assert (= (and b!982070 res!657190) b!982079))

(assert (= (and b!982079 res!657192) b!982069))

(assert (= (and b!982069 res!657193) b!982073))

(assert (= (and b!982073 res!657187) b!982072))

(assert (= (and b!982072 res!657189) b!982075))

(assert (= (and b!982075 res!657188) b!982071))

(assert (= (and b!982071 res!657191) b!982074))

(assert (= (and b!982077 condMapEmpty!36260) mapIsEmpty!36260))

(assert (= (and b!982077 (not condMapEmpty!36260)) mapNonEmpty!36260))

(get-info :version)

(assert (= (and mapNonEmpty!36260 ((_ is ValueCellFull!10929) mapValue!36260)) b!982076))

(assert (= (and b!982077 ((_ is ValueCellFull!10929) mapDefault!36260)) b!982078))

(assert (= start!84018 b!982077))

(declare-fun b_lambda!14811 () Bool)

(assert (=> (not b_lambda!14811) (not b!982071)))

(declare-fun t!29279 () Bool)

(declare-fun tb!6573 () Bool)

(assert (=> (and start!84018 (= defaultEntry!1281 defaultEntry!1281) t!29279) tb!6573))

(declare-fun result!13135 () Bool)

(assert (=> tb!6573 (= result!13135 tp_is_empty!22821)))

(assert (=> b!982071 t!29279))

(declare-fun b_and!31631 () Bool)

(assert (= b_and!31629 (and (=> t!29279 result!13135) b_and!31631)))

(declare-fun m!909419 () Bool)

(assert (=> start!84018 m!909419))

(declare-fun m!909421 () Bool)

(assert (=> start!84018 m!909421))

(declare-fun m!909423 () Bool)

(assert (=> start!84018 m!909423))

(declare-fun m!909425 () Bool)

(assert (=> b!982079 m!909425))

(declare-fun m!909427 () Bool)

(assert (=> b!982071 m!909427))

(declare-fun m!909429 () Bool)

(assert (=> b!982071 m!909429))

(declare-fun m!909431 () Bool)

(assert (=> b!982071 m!909431))

(declare-fun m!909433 () Bool)

(assert (=> b!982071 m!909433))

(assert (=> b!982071 m!909429))

(assert (=> b!982071 m!909433))

(declare-fun m!909435 () Bool)

(assert (=> b!982071 m!909435))

(declare-fun m!909437 () Bool)

(assert (=> mapNonEmpty!36260 m!909437))

(declare-fun m!909439 () Bool)

(assert (=> b!982069 m!909439))

(declare-fun m!909441 () Bool)

(assert (=> b!982074 m!909441))

(declare-fun m!909443 () Bool)

(assert (=> b!982074 m!909443))

(assert (=> b!982074 m!909427))

(declare-fun m!909445 () Bool)

(assert (=> b!982074 m!909445))

(assert (=> b!982074 m!909427))

(declare-fun m!909447 () Bool)

(assert (=> b!982074 m!909447))

(assert (=> b!982074 m!909441))

(assert (=> b!982074 m!909445))

(declare-fun m!909449 () Bool)

(assert (=> b!982074 m!909449))

(assert (=> b!982072 m!909427))

(assert (=> b!982072 m!909427))

(declare-fun m!909451 () Bool)

(assert (=> b!982072 m!909451))

(check-sat (not b!982072) (not b_next!19773) (not b!982074) (not mapNonEmpty!36260) (not b!982069) tp_is_empty!22821 (not b_lambda!14811) (not b!982071) b_and!31631 (not b!982079) (not start!84018))
(check-sat b_and!31631 (not b_next!19773))
