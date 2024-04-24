; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35412 () Bool)

(assert start!35412)

(declare-fun b_free!7813 () Bool)

(declare-fun b_next!7813 () Bool)

(assert (=> start!35412 (= b_free!7813 (not b_next!7813))))

(declare-fun tp!27224 () Bool)

(declare-fun b_and!15069 () Bool)

(assert (=> start!35412 (= tp!27224 b_and!15069)))

(declare-fun res!196584 () Bool)

(declare-fun e!217356 () Bool)

(assert (=> start!35412 (=> (not res!196584) (not e!217356))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35412 (= res!196584 (validMask!0 mask!1842))))

(assert (=> start!35412 e!217356))

(declare-fun tp_is_empty!7879 () Bool)

(assert (=> start!35412 tp_is_empty!7879))

(assert (=> start!35412 true))

(assert (=> start!35412 tp!27224))

(declare-datatypes ((array!19328 0))(
  ( (array!19329 (arr!9157 (Array (_ BitVec 32) (_ BitVec 64))) (size!9509 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19328)

(declare-fun array_inv!6768 (array!19328) Bool)

(assert (=> start!35412 (array_inv!6768 _keys!1456)))

(declare-datatypes ((V!11483 0))(
  ( (V!11484 (val!3984 Int)) )
))
(declare-datatypes ((ValueCell!3596 0))(
  ( (ValueCellFull!3596 (v!6179 V!11483)) (EmptyCell!3596) )
))
(declare-datatypes ((array!19330 0))(
  ( (array!19331 (arr!9158 (Array (_ BitVec 32) ValueCell!3596)) (size!9510 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19330)

(declare-fun e!217357 () Bool)

(declare-fun array_inv!6769 (array!19330) Bool)

(assert (=> start!35412 (and (array_inv!6769 _values!1208) e!217357)))

(declare-fun b!354579 () Bool)

(assert (=> b!354579 (= e!217356 (not true))))

(declare-fun minValue!1150 () V!11483)

(declare-fun defaultEntry!1216 () Int)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11483)

(declare-datatypes ((tuple2!5574 0))(
  ( (tuple2!5575 (_1!2798 (_ BitVec 64)) (_2!2798 V!11483)) )
))
(declare-datatypes ((List!5210 0))(
  ( (Nil!5207) (Cons!5206 (h!6062 tuple2!5574) (t!10352 List!5210)) )
))
(declare-datatypes ((ListLongMap!4489 0))(
  ( (ListLongMap!4490 (toList!2260 List!5210)) )
))
(declare-fun contains!2359 (ListLongMap!4489 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1788 (array!19328 array!19330 (_ BitVec 32) (_ BitVec 32) V!11483 V!11483 (_ BitVec 32) Int) ListLongMap!4489)

(assert (=> b!354579 (contains!2359 (getCurrentListMap!1788 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9157 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10905 0))(
  ( (Unit!10906) )
))
(declare-fun lt!165752 () Unit!10905)

(declare-fun lemmaValidKeyInArrayIsInListMap!178 (array!19328 array!19330 (_ BitVec 32) (_ BitVec 32) V!11483 V!11483 (_ BitVec 32) Int) Unit!10905)

(assert (=> b!354579 (= lt!165752 (lemmaValidKeyInArrayIsInListMap!178 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun b!354580 () Bool)

(declare-fun e!217353 () Bool)

(declare-fun mapRes!13326 () Bool)

(assert (=> b!354580 (= e!217357 (and e!217353 mapRes!13326))))

(declare-fun condMapEmpty!13326 () Bool)

(declare-fun mapDefault!13326 () ValueCell!3596)

(assert (=> b!354580 (= condMapEmpty!13326 (= (arr!9158 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3596)) mapDefault!13326)))))

(declare-fun mapNonEmpty!13326 () Bool)

(declare-fun tp!27225 () Bool)

(declare-fun e!217355 () Bool)

(assert (=> mapNonEmpty!13326 (= mapRes!13326 (and tp!27225 e!217355))))

(declare-fun mapValue!13326 () ValueCell!3596)

(declare-fun mapRest!13326 () (Array (_ BitVec 32) ValueCell!3596))

(declare-fun mapKey!13326 () (_ BitVec 32))

(assert (=> mapNonEmpty!13326 (= (arr!9158 _values!1208) (store mapRest!13326 mapKey!13326 mapValue!13326))))

(declare-fun b!354581 () Bool)

(declare-fun res!196583 () Bool)

(assert (=> b!354581 (=> (not res!196583) (not e!217356))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!354581 (= res!196583 (validKeyInArray!0 k0!1077))))

(declare-fun b!354582 () Bool)

(assert (=> b!354582 (= e!217355 tp_is_empty!7879)))

(declare-fun b!354583 () Bool)

(declare-fun res!196578 () Bool)

(assert (=> b!354583 (=> (not res!196578) (not e!217356))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19328 (_ BitVec 32)) Bool)

(assert (=> b!354583 (= res!196578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354584 () Bool)

(declare-fun res!196579 () Bool)

(assert (=> b!354584 (=> (not res!196579) (not e!217356))))

(declare-fun arrayContainsKey!0 (array!19328 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!354584 (= res!196579 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!354585 () Bool)

(assert (=> b!354585 (= e!217353 tp_is_empty!7879)))

(declare-fun b!354586 () Bool)

(declare-fun res!196580 () Bool)

(assert (=> b!354586 (=> (not res!196580) (not e!217356))))

(assert (=> b!354586 (= res!196580 (and (= (size!9510 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9509 _keys!1456) (size!9510 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!354587 () Bool)

(declare-fun res!196582 () Bool)

(assert (=> b!354587 (=> (not res!196582) (not e!217356))))

(declare-datatypes ((List!5211 0))(
  ( (Nil!5208) (Cons!5207 (h!6063 (_ BitVec 64)) (t!10353 List!5211)) )
))
(declare-fun arrayNoDuplicates!0 (array!19328 (_ BitVec 32) List!5211) Bool)

(assert (=> b!354587 (= res!196582 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5208))))

(declare-fun b!354588 () Bool)

(declare-fun res!196577 () Bool)

(assert (=> b!354588 (=> (not res!196577) (not e!217356))))

(assert (=> b!354588 (= res!196577 (= (select (arr!9157 _keys!1456) from!1805) k0!1077))))

(declare-fun b!354589 () Bool)

(declare-fun res!196585 () Bool)

(assert (=> b!354589 (=> (not res!196585) (not e!217356))))

(assert (=> b!354589 (= res!196585 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9509 _keys!1456))))))

(declare-fun mapIsEmpty!13326 () Bool)

(assert (=> mapIsEmpty!13326 mapRes!13326))

(declare-fun b!354590 () Bool)

(declare-fun res!196581 () Bool)

(assert (=> b!354590 (=> (not res!196581) (not e!217356))))

(assert (=> b!354590 (= res!196581 (validKeyInArray!0 (select (arr!9157 _keys!1456) from!1805)))))

(assert (= (and start!35412 res!196584) b!354586))

(assert (= (and b!354586 res!196580) b!354583))

(assert (= (and b!354583 res!196578) b!354587))

(assert (= (and b!354587 res!196582) b!354581))

(assert (= (and b!354581 res!196583) b!354589))

(assert (= (and b!354589 res!196585) b!354584))

(assert (= (and b!354584 res!196579) b!354588))

(assert (= (and b!354588 res!196577) b!354590))

(assert (= (and b!354590 res!196581) b!354579))

(assert (= (and b!354580 condMapEmpty!13326) mapIsEmpty!13326))

(assert (= (and b!354580 (not condMapEmpty!13326)) mapNonEmpty!13326))

(get-info :version)

(assert (= (and mapNonEmpty!13326 ((_ is ValueCellFull!3596) mapValue!13326)) b!354582))

(assert (= (and b!354580 ((_ is ValueCellFull!3596) mapDefault!13326)) b!354585))

(assert (= start!35412 b!354580))

(declare-fun m!353799 () Bool)

(assert (=> b!354579 m!353799))

(declare-fun m!353801 () Bool)

(assert (=> b!354579 m!353801))

(assert (=> b!354579 m!353799))

(assert (=> b!354579 m!353801))

(declare-fun m!353803 () Bool)

(assert (=> b!354579 m!353803))

(declare-fun m!353805 () Bool)

(assert (=> b!354579 m!353805))

(assert (=> b!354590 m!353801))

(assert (=> b!354590 m!353801))

(declare-fun m!353807 () Bool)

(assert (=> b!354590 m!353807))

(declare-fun m!353809 () Bool)

(assert (=> b!354587 m!353809))

(declare-fun m!353811 () Bool)

(assert (=> start!35412 m!353811))

(declare-fun m!353813 () Bool)

(assert (=> start!35412 m!353813))

(declare-fun m!353815 () Bool)

(assert (=> start!35412 m!353815))

(declare-fun m!353817 () Bool)

(assert (=> b!354583 m!353817))

(declare-fun m!353819 () Bool)

(assert (=> b!354581 m!353819))

(declare-fun m!353821 () Bool)

(assert (=> b!354584 m!353821))

(assert (=> b!354588 m!353801))

(declare-fun m!353823 () Bool)

(assert (=> mapNonEmpty!13326 m!353823))

(check-sat (not b_next!7813) (not b!354590) tp_is_empty!7879 (not b!354583) (not b!354579) (not b!354581) (not b!354584) (not b!354587) b_and!15069 (not mapNonEmpty!13326) (not start!35412))
(check-sat b_and!15069 (not b_next!7813))
