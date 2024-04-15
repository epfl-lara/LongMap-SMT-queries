; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35412 () Bool)

(assert start!35412)

(declare-fun b_free!7813 () Bool)

(declare-fun b_next!7813 () Bool)

(assert (=> start!35412 (= b_free!7813 (not b_next!7813))))

(declare-fun tp!27225 () Bool)

(declare-fun b_and!15029 () Bool)

(assert (=> start!35412 (= tp!27225 b_and!15029)))

(declare-fun b!354357 () Bool)

(declare-fun res!196458 () Bool)

(declare-fun e!217214 () Bool)

(assert (=> b!354357 (=> (not res!196458) (not e!217214))))

(declare-datatypes ((array!19323 0))(
  ( (array!19324 (arr!9155 (Array (_ BitVec 32) (_ BitVec 64))) (size!9508 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19323)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19323 (_ BitVec 32)) Bool)

(assert (=> b!354357 (= res!196458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354358 () Bool)

(assert (=> b!354358 (= e!217214 (not true))))

(declare-datatypes ((V!11483 0))(
  ( (V!11484 (val!3984 Int)) )
))
(declare-fun minValue!1150 () V!11483)

(declare-fun defaultEntry!1216 () Int)

(declare-fun from!1805 () (_ BitVec 32))

(declare-datatypes ((ValueCell!3596 0))(
  ( (ValueCellFull!3596 (v!6172 V!11483)) (EmptyCell!3596) )
))
(declare-datatypes ((array!19325 0))(
  ( (array!19326 (arr!9156 (Array (_ BitVec 32) ValueCell!3596)) (size!9509 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19325)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11483)

(declare-datatypes ((tuple2!5634 0))(
  ( (tuple2!5635 (_1!2828 (_ BitVec 64)) (_2!2828 V!11483)) )
))
(declare-datatypes ((List!5274 0))(
  ( (Nil!5271) (Cons!5270 (h!6126 tuple2!5634) (t!10415 List!5274)) )
))
(declare-datatypes ((ListLongMap!4537 0))(
  ( (ListLongMap!4538 (toList!2284 List!5274)) )
))
(declare-fun contains!2374 (ListLongMap!4537 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1789 (array!19323 array!19325 (_ BitVec 32) (_ BitVec 32) V!11483 V!11483 (_ BitVec 32) Int) ListLongMap!4537)

(assert (=> b!354358 (contains!2374 (getCurrentListMap!1789 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9155 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10914 0))(
  ( (Unit!10915) )
))
(declare-fun lt!165499 () Unit!10914)

(declare-fun lemmaValidKeyInArrayIsInListMap!181 (array!19323 array!19325 (_ BitVec 32) (_ BitVec 32) V!11483 V!11483 (_ BitVec 32) Int) Unit!10914)

(assert (=> b!354358 (= lt!165499 (lemmaValidKeyInArrayIsInListMap!181 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!354359 () Bool)

(declare-fun res!196455 () Bool)

(assert (=> b!354359 (=> (not res!196455) (not e!217214))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19323 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!354359 (= res!196455 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!354360 () Bool)

(declare-fun res!196452 () Bool)

(assert (=> b!354360 (=> (not res!196452) (not e!217214))))

(assert (=> b!354360 (= res!196452 (and (= (size!9509 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9508 _keys!1456) (size!9509 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!13326 () Bool)

(declare-fun mapRes!13326 () Bool)

(declare-fun tp!27224 () Bool)

(declare-fun e!217215 () Bool)

(assert (=> mapNonEmpty!13326 (= mapRes!13326 (and tp!27224 e!217215))))

(declare-fun mapValue!13326 () ValueCell!3596)

(declare-fun mapRest!13326 () (Array (_ BitVec 32) ValueCell!3596))

(declare-fun mapKey!13326 () (_ BitVec 32))

(assert (=> mapNonEmpty!13326 (= (arr!9156 _values!1208) (store mapRest!13326 mapKey!13326 mapValue!13326))))

(declare-fun b!354361 () Bool)

(declare-fun res!196451 () Bool)

(assert (=> b!354361 (=> (not res!196451) (not e!217214))))

(declare-datatypes ((List!5275 0))(
  ( (Nil!5272) (Cons!5271 (h!6127 (_ BitVec 64)) (t!10416 List!5275)) )
))
(declare-fun arrayNoDuplicates!0 (array!19323 (_ BitVec 32) List!5275) Bool)

(assert (=> b!354361 (= res!196451 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5272))))

(declare-fun b!354362 () Bool)

(declare-fun res!196456 () Bool)

(assert (=> b!354362 (=> (not res!196456) (not e!217214))))

(assert (=> b!354362 (= res!196456 (= (select (arr!9155 _keys!1456) from!1805) k0!1077))))

(declare-fun b!354363 () Bool)

(declare-fun res!196453 () Bool)

(assert (=> b!354363 (=> (not res!196453) (not e!217214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!354363 (= res!196453 (validKeyInArray!0 (select (arr!9155 _keys!1456) from!1805)))))

(declare-fun b!354364 () Bool)

(declare-fun res!196454 () Bool)

(assert (=> b!354364 (=> (not res!196454) (not e!217214))))

(assert (=> b!354364 (= res!196454 (validKeyInArray!0 k0!1077))))

(declare-fun mapIsEmpty!13326 () Bool)

(assert (=> mapIsEmpty!13326 mapRes!13326))

(declare-fun res!196457 () Bool)

(assert (=> start!35412 (=> (not res!196457) (not e!217214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35412 (= res!196457 (validMask!0 mask!1842))))

(assert (=> start!35412 e!217214))

(declare-fun tp_is_empty!7879 () Bool)

(assert (=> start!35412 tp_is_empty!7879))

(assert (=> start!35412 true))

(assert (=> start!35412 tp!27225))

(declare-fun array_inv!6780 (array!19323) Bool)

(assert (=> start!35412 (array_inv!6780 _keys!1456)))

(declare-fun e!217211 () Bool)

(declare-fun array_inv!6781 (array!19325) Bool)

(assert (=> start!35412 (and (array_inv!6781 _values!1208) e!217211)))

(declare-fun b!354365 () Bool)

(declare-fun e!217212 () Bool)

(assert (=> b!354365 (= e!217211 (and e!217212 mapRes!13326))))

(declare-fun condMapEmpty!13326 () Bool)

(declare-fun mapDefault!13326 () ValueCell!3596)

(assert (=> b!354365 (= condMapEmpty!13326 (= (arr!9156 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3596)) mapDefault!13326)))))

(declare-fun b!354366 () Bool)

(assert (=> b!354366 (= e!217212 tp_is_empty!7879)))

(declare-fun b!354367 () Bool)

(assert (=> b!354367 (= e!217215 tp_is_empty!7879)))

(declare-fun b!354368 () Bool)

(declare-fun res!196459 () Bool)

(assert (=> b!354368 (=> (not res!196459) (not e!217214))))

(assert (=> b!354368 (= res!196459 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9508 _keys!1456))))))

(assert (= (and start!35412 res!196457) b!354360))

(assert (= (and b!354360 res!196452) b!354357))

(assert (= (and b!354357 res!196458) b!354361))

(assert (= (and b!354361 res!196451) b!354364))

(assert (= (and b!354364 res!196454) b!354368))

(assert (= (and b!354368 res!196459) b!354359))

(assert (= (and b!354359 res!196455) b!354362))

(assert (= (and b!354362 res!196456) b!354363))

(assert (= (and b!354363 res!196453) b!354358))

(assert (= (and b!354365 condMapEmpty!13326) mapIsEmpty!13326))

(assert (= (and b!354365 (not condMapEmpty!13326)) mapNonEmpty!13326))

(get-info :version)

(assert (= (and mapNonEmpty!13326 ((_ is ValueCellFull!3596) mapValue!13326)) b!354367))

(assert (= (and b!354365 ((_ is ValueCellFull!3596) mapDefault!13326)) b!354366))

(assert (= start!35412 b!354365))

(declare-fun m!352845 () Bool)

(assert (=> b!354362 m!352845))

(declare-fun m!352847 () Bool)

(assert (=> b!354357 m!352847))

(declare-fun m!352849 () Bool)

(assert (=> b!354364 m!352849))

(assert (=> b!354363 m!352845))

(assert (=> b!354363 m!352845))

(declare-fun m!352851 () Bool)

(assert (=> b!354363 m!352851))

(declare-fun m!352853 () Bool)

(assert (=> b!354361 m!352853))

(declare-fun m!352855 () Bool)

(assert (=> b!354359 m!352855))

(declare-fun m!352857 () Bool)

(assert (=> start!35412 m!352857))

(declare-fun m!352859 () Bool)

(assert (=> start!35412 m!352859))

(declare-fun m!352861 () Bool)

(assert (=> start!35412 m!352861))

(declare-fun m!352863 () Bool)

(assert (=> b!354358 m!352863))

(assert (=> b!354358 m!352845))

(assert (=> b!354358 m!352863))

(assert (=> b!354358 m!352845))

(declare-fun m!352865 () Bool)

(assert (=> b!354358 m!352865))

(declare-fun m!352867 () Bool)

(assert (=> b!354358 m!352867))

(declare-fun m!352869 () Bool)

(assert (=> mapNonEmpty!13326 m!352869))

(check-sat b_and!15029 (not b_next!7813) (not b!354358) (not b!354363) (not mapNonEmpty!13326) (not b!354359) (not b!354361) (not b!354357) (not b!354364) (not start!35412) tp_is_empty!7879)
(check-sat b_and!15029 (not b_next!7813))
