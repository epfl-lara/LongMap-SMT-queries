; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33694 () Bool)

(assert start!33694)

(declare-fun b_free!6943 () Bool)

(declare-fun b_next!6943 () Bool)

(assert (=> start!33694 (= b_free!6943 (not b_next!6943))))

(declare-fun tp!24333 () Bool)

(declare-fun b_and!14097 () Bool)

(assert (=> start!33694 (= tp!24333 b_and!14097)))

(declare-fun b!334789 () Bool)

(declare-fun e!205493 () Bool)

(declare-fun e!205490 () Bool)

(assert (=> b!334789 (= e!205493 e!205490)))

(declare-fun res!184701 () Bool)

(assert (=> b!334789 (=> (not res!184701) (not e!205490))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3177 0))(
  ( (MissingZero!3177 (index!14887 (_ BitVec 32))) (Found!3177 (index!14888 (_ BitVec 32))) (Intermediate!3177 (undefined!3989 Bool) (index!14889 (_ BitVec 32)) (x!33386 (_ BitVec 32))) (Undefined!3177) (MissingVacant!3177 (index!14890 (_ BitVec 32))) )
))
(declare-fun lt!159461 () SeekEntryResult!3177)

(declare-datatypes ((array!17363 0))(
  ( (array!17364 (arr!8212 (Array (_ BitVec 32) (_ BitVec 64))) (size!8565 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17363)

(get-info :version)

(assert (=> b!334789 (= res!184701 (and ((_ is Found!3177) lt!159461) (= (select (arr!8212 _keys!1895) (index!14888 lt!159461)) k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17363 (_ BitVec 32)) SeekEntryResult!3177)

(assert (=> b!334789 (= lt!159461 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334790 () Bool)

(declare-fun e!205489 () Bool)

(declare-fun tp_is_empty!6895 () Bool)

(assert (=> b!334790 (= e!205489 tp_is_empty!6895)))

(declare-fun b!334791 () Bool)

(declare-fun res!184700 () Bool)

(declare-fun e!205494 () Bool)

(assert (=> b!334791 (=> (not res!184700) (not e!205494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17363 (_ BitVec 32)) Bool)

(assert (=> b!334791 (= res!184700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!334792 () Bool)

(declare-fun e!205495 () Bool)

(assert (=> b!334792 (= e!205495 tp_is_empty!6895)))

(declare-fun res!184702 () Bool)

(assert (=> start!33694 (=> (not res!184702) (not e!205494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33694 (= res!184702 (validMask!0 mask!2385))))

(assert (=> start!33694 e!205494))

(assert (=> start!33694 true))

(assert (=> start!33694 tp_is_empty!6895))

(assert (=> start!33694 tp!24333))

(declare-datatypes ((V!10171 0))(
  ( (V!10172 (val!3492 Int)) )
))
(declare-datatypes ((ValueCell!3104 0))(
  ( (ValueCellFull!3104 (v!5648 V!10171)) (EmptyCell!3104) )
))
(declare-datatypes ((array!17365 0))(
  ( (array!17366 (arr!8213 (Array (_ BitVec 32) ValueCell!3104)) (size!8566 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17365)

(declare-fun e!205492 () Bool)

(declare-fun array_inv!6124 (array!17365) Bool)

(assert (=> start!33694 (and (array_inv!6124 _values!1525) e!205492)))

(declare-fun array_inv!6125 (array!17363) Bool)

(assert (=> start!33694 (array_inv!6125 _keys!1895)))

(declare-fun b!334793 () Bool)

(declare-fun res!184699 () Bool)

(assert (=> b!334793 (=> (not res!184699) (not e!205494))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!334793 (= res!184699 (and (= (size!8566 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8565 _keys!1895) (size!8566 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334794 () Bool)

(declare-fun res!184704 () Bool)

(assert (=> b!334794 (=> (not res!184704) (not e!205494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334794 (= res!184704 (validKeyInArray!0 k0!1348))))

(declare-fun b!334795 () Bool)

(declare-fun mapRes!11739 () Bool)

(assert (=> b!334795 (= e!205492 (and e!205495 mapRes!11739))))

(declare-fun condMapEmpty!11739 () Bool)

(declare-fun mapDefault!11739 () ValueCell!3104)

(assert (=> b!334795 (= condMapEmpty!11739 (= (arr!8213 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3104)) mapDefault!11739)))))

(declare-fun mapIsEmpty!11739 () Bool)

(assert (=> mapIsEmpty!11739 mapRes!11739))

(declare-fun b!334796 () Bool)

(assert (=> b!334796 (= e!205490 (not true))))

(declare-datatypes ((tuple2!5016 0))(
  ( (tuple2!5017 (_1!2519 (_ BitVec 64)) (_2!2519 V!10171)) )
))
(declare-datatypes ((List!4656 0))(
  ( (Nil!4653) (Cons!4652 (h!5508 tuple2!5016) (t!9735 List!4656)) )
))
(declare-datatypes ((ListLongMap!3919 0))(
  ( (ListLongMap!3920 (toList!1975 List!4656)) )
))
(declare-fun lt!159459 () ListLongMap!3919)

(declare-fun contains!2030 (ListLongMap!3919 (_ BitVec 64)) Bool)

(assert (=> b!334796 (contains!2030 lt!159459 (select (arr!8212 _keys!1895) (index!14888 lt!159461)))))

(declare-datatypes ((Unit!10404 0))(
  ( (Unit!10405) )
))
(declare-fun lt!159460 () Unit!10404)

(declare-fun zeroValue!1467 () V!10171)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10171)

(declare-fun lemmaValidKeyInArrayIsInListMap!159 (array!17363 array!17365 (_ BitVec 32) (_ BitVec 32) V!10171 V!10171 (_ BitVec 32) Int) Unit!10404)

(assert (=> b!334796 (= lt!159460 (lemmaValidKeyInArrayIsInListMap!159 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14888 lt!159461) defaultEntry!1528))))

(declare-fun arrayContainsKey!0 (array!17363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334796 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159462 () Unit!10404)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17363 (_ BitVec 64) (_ BitVec 32)) Unit!10404)

(assert (=> b!334796 (= lt!159462 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14888 lt!159461)))))

(declare-fun mapNonEmpty!11739 () Bool)

(declare-fun tp!24332 () Bool)

(assert (=> mapNonEmpty!11739 (= mapRes!11739 (and tp!24332 e!205489))))

(declare-fun mapRest!11739 () (Array (_ BitVec 32) ValueCell!3104))

(declare-fun mapKey!11739 () (_ BitVec 32))

(declare-fun mapValue!11739 () ValueCell!3104)

(assert (=> mapNonEmpty!11739 (= (arr!8213 _values!1525) (store mapRest!11739 mapKey!11739 mapValue!11739))))

(declare-fun b!334797 () Bool)

(declare-fun res!184703 () Bool)

(assert (=> b!334797 (=> (not res!184703) (not e!205494))))

(declare-datatypes ((List!4657 0))(
  ( (Nil!4654) (Cons!4653 (h!5509 (_ BitVec 64)) (t!9736 List!4657)) )
))
(declare-fun arrayNoDuplicates!0 (array!17363 (_ BitVec 32) List!4657) Bool)

(assert (=> b!334797 (= res!184703 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4654))))

(declare-fun b!334798 () Bool)

(declare-fun res!184705 () Bool)

(assert (=> b!334798 (=> (not res!184705) (not e!205490))))

(assert (=> b!334798 (= res!184705 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14888 lt!159461)))))

(declare-fun b!334799 () Bool)

(assert (=> b!334799 (= e!205494 e!205493)))

(declare-fun res!184706 () Bool)

(assert (=> b!334799 (=> (not res!184706) (not e!205493))))

(assert (=> b!334799 (= res!184706 (not (contains!2030 lt!159459 k0!1348)))))

(declare-fun getCurrentListMap!1484 (array!17363 array!17365 (_ BitVec 32) (_ BitVec 32) V!10171 V!10171 (_ BitVec 32) Int) ListLongMap!3919)

(assert (=> b!334799 (= lt!159459 (getCurrentListMap!1484 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(assert (= (and start!33694 res!184702) b!334793))

(assert (= (and b!334793 res!184699) b!334791))

(assert (= (and b!334791 res!184700) b!334797))

(assert (= (and b!334797 res!184703) b!334794))

(assert (= (and b!334794 res!184704) b!334799))

(assert (= (and b!334799 res!184706) b!334789))

(assert (= (and b!334789 res!184701) b!334798))

(assert (= (and b!334798 res!184705) b!334796))

(assert (= (and b!334795 condMapEmpty!11739) mapIsEmpty!11739))

(assert (= (and b!334795 (not condMapEmpty!11739)) mapNonEmpty!11739))

(assert (= (and mapNonEmpty!11739 ((_ is ValueCellFull!3104) mapValue!11739)) b!334790))

(assert (= (and b!334795 ((_ is ValueCellFull!3104) mapDefault!11739)) b!334792))

(assert (= start!33694 b!334795))

(declare-fun m!338339 () Bool)

(assert (=> start!33694 m!338339))

(declare-fun m!338341 () Bool)

(assert (=> start!33694 m!338341))

(declare-fun m!338343 () Bool)

(assert (=> start!33694 m!338343))

(declare-fun m!338345 () Bool)

(assert (=> b!334796 m!338345))

(declare-fun m!338347 () Bool)

(assert (=> b!334796 m!338347))

(declare-fun m!338349 () Bool)

(assert (=> b!334796 m!338349))

(declare-fun m!338351 () Bool)

(assert (=> b!334796 m!338351))

(assert (=> b!334796 m!338349))

(declare-fun m!338353 () Bool)

(assert (=> b!334796 m!338353))

(declare-fun m!338355 () Bool)

(assert (=> b!334791 m!338355))

(declare-fun m!338357 () Bool)

(assert (=> b!334798 m!338357))

(declare-fun m!338359 () Bool)

(assert (=> b!334799 m!338359))

(declare-fun m!338361 () Bool)

(assert (=> b!334799 m!338361))

(assert (=> b!334789 m!338349))

(declare-fun m!338363 () Bool)

(assert (=> b!334789 m!338363))

(declare-fun m!338365 () Bool)

(assert (=> b!334794 m!338365))

(declare-fun m!338367 () Bool)

(assert (=> b!334797 m!338367))

(declare-fun m!338369 () Bool)

(assert (=> mapNonEmpty!11739 m!338369))

(check-sat (not b!334791) (not b!334796) (not mapNonEmpty!11739) tp_is_empty!6895 (not b!334794) (not b!334797) (not b!334789) b_and!14097 (not b!334798) (not b!334799) (not b_next!6943) (not start!33694))
(check-sat b_and!14097 (not b_next!6943))
