; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111598 () Bool)

(assert start!111598)

(declare-fun b_free!30255 () Bool)

(declare-fun b_next!30255 () Bool)

(assert (=> start!111598 (= b_free!30255 (not b_next!30255))))

(declare-fun tp!106241 () Bool)

(declare-fun b_and!48669 () Bool)

(assert (=> start!111598 (= tp!106241 b_and!48669)))

(declare-fun mapNonEmpty!55760 () Bool)

(declare-fun mapRes!55760 () Bool)

(declare-fun tp!106240 () Bool)

(declare-fun e!753754 () Bool)

(assert (=> mapNonEmpty!55760 (= mapRes!55760 (and tp!106240 e!753754))))

(declare-datatypes ((V!53203 0))(
  ( (V!53204 (val!18112 Int)) )
))
(declare-datatypes ((ValueCell!17139 0))(
  ( (ValueCellFull!17139 (v!20742 V!53203)) (EmptyCell!17139) )
))
(declare-datatypes ((array!89074 0))(
  ( (array!89075 (arr!43011 (Array (_ BitVec 32) ValueCell!17139)) (size!43561 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89074)

(declare-fun mapValue!55760 () ValueCell!17139)

(declare-fun mapRest!55760 () (Array (_ BitVec 32) ValueCell!17139))

(declare-fun mapKey!55760 () (_ BitVec 32))

(assert (=> mapNonEmpty!55760 (= (arr!43011 _values!1337) (store mapRest!55760 mapKey!55760 mapValue!55760))))

(declare-fun res!877239 () Bool)

(declare-fun e!753753 () Bool)

(assert (=> start!111598 (=> (not res!877239) (not e!753753))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111598 (= res!877239 (validMask!0 mask!2019))))

(assert (=> start!111598 e!753753))

(declare-datatypes ((array!89076 0))(
  ( (array!89077 (arr!43012 (Array (_ BitVec 32) (_ BitVec 64))) (size!43562 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89076)

(declare-fun array_inv!32471 (array!89076) Bool)

(assert (=> start!111598 (array_inv!32471 _keys!1609)))

(assert (=> start!111598 true))

(declare-fun tp_is_empty!36075 () Bool)

(assert (=> start!111598 tp_is_empty!36075))

(declare-fun e!753750 () Bool)

(declare-fun array_inv!32472 (array!89074) Bool)

(assert (=> start!111598 (and (array_inv!32472 _values!1337) e!753750)))

(assert (=> start!111598 tp!106241))

(declare-fun mapIsEmpty!55760 () Bool)

(assert (=> mapIsEmpty!55760 mapRes!55760))

(declare-fun b!1321680 () Bool)

(declare-fun e!753752 () Bool)

(assert (=> b!1321680 (= e!753752 tp_is_empty!36075)))

(declare-fun b!1321681 () Bool)

(declare-fun res!877242 () Bool)

(assert (=> b!1321681 (=> (not res!877242) (not e!753753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89076 (_ BitVec 32)) Bool)

(assert (=> b!1321681 (= res!877242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321682 () Bool)

(assert (=> b!1321682 (= e!753750 (and e!753752 mapRes!55760))))

(declare-fun condMapEmpty!55760 () Bool)

(declare-fun mapDefault!55760 () ValueCell!17139)

(assert (=> b!1321682 (= condMapEmpty!55760 (= (arr!43011 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17139)) mapDefault!55760)))))

(declare-fun b!1321683 () Bool)

(declare-fun from!2000 () (_ BitVec 32))

(assert (=> b!1321683 (= e!753753 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2000) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!23328 0))(
  ( (tuple2!23329 (_1!11675 (_ BitVec 64)) (_2!11675 V!53203)) )
))
(declare-datatypes ((List!30477 0))(
  ( (Nil!30474) (Cons!30473 (h!31682 tuple2!23328) (t!44281 List!30477)) )
))
(declare-datatypes ((ListLongMap!20985 0))(
  ( (ListLongMap!20986 (toList!10508 List!30477)) )
))
(declare-fun lt!587610 () ListLongMap!20985)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8663 (ListLongMap!20985 (_ BitVec 64)) Bool)

(assert (=> b!1321683 (contains!8663 lt!587610 k0!1164)))

(declare-datatypes ((Unit!43548 0))(
  ( (Unit!43549) )
))
(declare-fun lt!587613 () Unit!43548)

(declare-fun lt!587607 () V!53203)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!160 ((_ BitVec 64) (_ BitVec 64) V!53203 ListLongMap!20985) Unit!43548)

(assert (=> b!1321683 (= lt!587613 (lemmaInListMapAfterAddingDiffThenInBefore!160 k0!1164 (select (arr!43012 _keys!1609) from!2000) lt!587607 lt!587610))))

(declare-fun lt!587608 () ListLongMap!20985)

(assert (=> b!1321683 (contains!8663 lt!587608 k0!1164)))

(declare-fun zeroValue!1279 () V!53203)

(declare-fun lt!587611 () Unit!43548)

(assert (=> b!1321683 (= lt!587611 (lemmaInListMapAfterAddingDiffThenInBefore!160 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587608))))

(declare-fun lt!587609 () ListLongMap!20985)

(assert (=> b!1321683 (contains!8663 lt!587609 k0!1164)))

(declare-fun minValue!1279 () V!53203)

(declare-fun lt!587612 () Unit!43548)

(assert (=> b!1321683 (= lt!587612 (lemmaInListMapAfterAddingDiffThenInBefore!160 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587609))))

(declare-fun +!4564 (ListLongMap!20985 tuple2!23328) ListLongMap!20985)

(assert (=> b!1321683 (= lt!587609 (+!4564 lt!587608 (tuple2!23329 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(assert (=> b!1321683 (= lt!587608 (+!4564 lt!587610 (tuple2!23329 (select (arr!43012 _keys!1609) from!2000) lt!587607)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun get!21640 (ValueCell!17139 V!53203) V!53203)

(declare-fun dynLambda!3503 (Int (_ BitVec 64)) V!53203)

(assert (=> b!1321683 (= lt!587607 (get!21640 (select (arr!43011 _values!1337) from!2000) (dynLambda!3503 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6199 (array!89076 array!89074 (_ BitVec 32) (_ BitVec 32) V!53203 V!53203 (_ BitVec 32) Int) ListLongMap!20985)

(assert (=> b!1321683 (= lt!587610 (getCurrentListMapNoExtraKeys!6199 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340))))

(declare-fun b!1321684 () Bool)

(declare-fun res!877243 () Bool)

(assert (=> b!1321684 (=> (not res!877243) (not e!753753))))

(declare-fun getCurrentListMap!5509 (array!89076 array!89074 (_ BitVec 32) (_ BitVec 32) V!53203 V!53203 (_ BitVec 32) Int) ListLongMap!20985)

(assert (=> b!1321684 (= res!877243 (contains!8663 (getCurrentListMap!5509 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1321685 () Bool)

(declare-fun res!877244 () Bool)

(assert (=> b!1321685 (=> (not res!877244) (not e!753753))))

(declare-datatypes ((List!30478 0))(
  ( (Nil!30475) (Cons!30474 (h!31683 (_ BitVec 64)) (t!44282 List!30478)) )
))
(declare-fun arrayNoDuplicates!0 (array!89076 (_ BitVec 32) List!30478) Bool)

(assert (=> b!1321685 (= res!877244 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30475))))

(declare-fun b!1321686 () Bool)

(assert (=> b!1321686 (= e!753754 tp_is_empty!36075)))

(declare-fun b!1321687 () Bool)

(declare-fun res!877237 () Bool)

(assert (=> b!1321687 (=> (not res!877237) (not e!753753))))

(assert (=> b!1321687 (= res!877237 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43562 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321688 () Bool)

(declare-fun res!877240 () Bool)

(assert (=> b!1321688 (=> (not res!877240) (not e!753753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321688 (= res!877240 (validKeyInArray!0 (select (arr!43012 _keys!1609) from!2000)))))

(declare-fun b!1321689 () Bool)

(declare-fun res!877238 () Bool)

(assert (=> b!1321689 (=> (not res!877238) (not e!753753))))

(assert (=> b!1321689 (= res!877238 (and (= (size!43561 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43562 _keys!1609) (size!43561 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321690 () Bool)

(declare-fun res!877241 () Bool)

(assert (=> b!1321690 (=> (not res!877241) (not e!753753))))

(assert (=> b!1321690 (= res!877241 (not (= (select (arr!43012 _keys!1609) from!2000) k0!1164)))))

(assert (= (and start!111598 res!877239) b!1321689))

(assert (= (and b!1321689 res!877238) b!1321681))

(assert (= (and b!1321681 res!877242) b!1321685))

(assert (= (and b!1321685 res!877244) b!1321687))

(assert (= (and b!1321687 res!877237) b!1321684))

(assert (= (and b!1321684 res!877243) b!1321690))

(assert (= (and b!1321690 res!877241) b!1321688))

(assert (= (and b!1321688 res!877240) b!1321683))

(assert (= (and b!1321682 condMapEmpty!55760) mapIsEmpty!55760))

(assert (= (and b!1321682 (not condMapEmpty!55760)) mapNonEmpty!55760))

(get-info :version)

(assert (= (and mapNonEmpty!55760 ((_ is ValueCellFull!17139) mapValue!55760)) b!1321686))

(assert (= (and b!1321682 ((_ is ValueCellFull!17139) mapDefault!55760)) b!1321680))

(assert (= start!111598 b!1321682))

(declare-fun b_lambda!23581 () Bool)

(assert (=> (not b_lambda!23581) (not b!1321683)))

(declare-fun t!44280 () Bool)

(declare-fun tb!11607 () Bool)

(assert (=> (and start!111598 (= defaultEntry!1340 defaultEntry!1340) t!44280) tb!11607))

(declare-fun result!24269 () Bool)

(assert (=> tb!11607 (= result!24269 tp_is_empty!36075)))

(assert (=> b!1321683 t!44280))

(declare-fun b_and!48671 () Bool)

(assert (= b_and!48669 (and (=> t!44280 result!24269) b_and!48671)))

(declare-fun m!1209671 () Bool)

(assert (=> start!111598 m!1209671))

(declare-fun m!1209673 () Bool)

(assert (=> start!111598 m!1209673))

(declare-fun m!1209675 () Bool)

(assert (=> start!111598 m!1209675))

(declare-fun m!1209677 () Bool)

(assert (=> b!1321685 m!1209677))

(declare-fun m!1209679 () Bool)

(assert (=> b!1321684 m!1209679))

(assert (=> b!1321684 m!1209679))

(declare-fun m!1209681 () Bool)

(assert (=> b!1321684 m!1209681))

(declare-fun m!1209683 () Bool)

(assert (=> mapNonEmpty!55760 m!1209683))

(declare-fun m!1209685 () Bool)

(assert (=> b!1321683 m!1209685))

(declare-fun m!1209687 () Bool)

(assert (=> b!1321683 m!1209687))

(declare-fun m!1209689 () Bool)

(assert (=> b!1321683 m!1209689))

(declare-fun m!1209691 () Bool)

(assert (=> b!1321683 m!1209691))

(declare-fun m!1209693 () Bool)

(assert (=> b!1321683 m!1209693))

(declare-fun m!1209695 () Bool)

(assert (=> b!1321683 m!1209695))

(assert (=> b!1321683 m!1209695))

(assert (=> b!1321683 m!1209689))

(declare-fun m!1209697 () Bool)

(assert (=> b!1321683 m!1209697))

(declare-fun m!1209699 () Bool)

(assert (=> b!1321683 m!1209699))

(declare-fun m!1209701 () Bool)

(assert (=> b!1321683 m!1209701))

(declare-fun m!1209703 () Bool)

(assert (=> b!1321683 m!1209703))

(assert (=> b!1321683 m!1209701))

(declare-fun m!1209705 () Bool)

(assert (=> b!1321683 m!1209705))

(declare-fun m!1209707 () Bool)

(assert (=> b!1321683 m!1209707))

(declare-fun m!1209709 () Bool)

(assert (=> b!1321683 m!1209709))

(assert (=> b!1321688 m!1209701))

(assert (=> b!1321688 m!1209701))

(declare-fun m!1209711 () Bool)

(assert (=> b!1321688 m!1209711))

(declare-fun m!1209713 () Bool)

(assert (=> b!1321681 m!1209713))

(assert (=> b!1321690 m!1209701))

(check-sat (not b!1321685) (not start!111598) (not b_lambda!23581) (not b!1321688) (not mapNonEmpty!55760) tp_is_empty!36075 b_and!48671 (not b!1321684) (not b!1321681) (not b!1321683) (not b_next!30255))
(check-sat b_and!48671 (not b_next!30255))
