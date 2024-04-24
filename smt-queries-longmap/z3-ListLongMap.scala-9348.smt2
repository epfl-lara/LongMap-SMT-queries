; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111748 () Bool)

(assert start!111748)

(declare-fun b_free!30181 () Bool)

(declare-fun b_next!30181 () Bool)

(assert (=> start!111748 (= b_free!30181 (not b_next!30181))))

(declare-fun tp!106018 () Bool)

(declare-fun b_and!48523 () Bool)

(assert (=> start!111748 (= tp!106018 b_and!48523)))

(declare-fun b!1321684 () Bool)

(declare-fun res!876867 () Bool)

(declare-fun e!754039 () Bool)

(assert (=> b!1321684 (=> (not res!876867) (not e!754039))))

(declare-datatypes ((array!89009 0))(
  ( (array!89010 (arr!42974 (Array (_ BitVec 32) (_ BitVec 64))) (size!43525 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89009)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53105 0))(
  ( (V!53106 (val!18075 Int)) )
))
(declare-datatypes ((ValueCell!17102 0))(
  ( (ValueCellFull!17102 (v!20700 V!53105)) (EmptyCell!17102) )
))
(declare-datatypes ((array!89011 0))(
  ( (array!89012 (arr!42975 (Array (_ BitVec 32) ValueCell!17102)) (size!43526 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89011)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1321684 (= res!876867 (and (= (size!43526 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43525 _keys!1609) (size!43526 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1321685 () Bool)

(declare-fun res!876870 () Bool)

(assert (=> b!1321685 (=> (not res!876870) (not e!754039))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89009 (_ BitVec 32)) Bool)

(assert (=> b!1321685 (= res!876870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1321686 () Bool)

(assert (=> b!1321686 (= e!754039 (not true))))

(declare-datatypes ((tuple2!23308 0))(
  ( (tuple2!23309 (_1!11665 (_ BitVec 64)) (_2!11665 V!53105)) )
))
(declare-datatypes ((List!30463 0))(
  ( (Nil!30460) (Cons!30459 (h!31677 tuple2!23308) (t!44185 List!30463)) )
))
(declare-datatypes ((ListLongMap!20973 0))(
  ( (ListLongMap!20974 (toList!10502 List!30463)) )
))
(declare-fun lt!587409 () ListLongMap!20973)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8669 (ListLongMap!20973 (_ BitVec 64)) Bool)

(assert (=> b!1321686 (contains!8669 lt!587409 k0!1164)))

(declare-fun zeroValue!1279 () V!53105)

(declare-datatypes ((Unit!43459 0))(
  ( (Unit!43460) )
))
(declare-fun lt!587411 () Unit!43459)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!141 ((_ BitVec 64) (_ BitVec 64) V!53105 ListLongMap!20973) Unit!43459)

(assert (=> b!1321686 (= lt!587411 (lemmaInListMapAfterAddingDiffThenInBefore!141 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!587409))))

(declare-fun lt!587410 () ListLongMap!20973)

(assert (=> b!1321686 (contains!8669 lt!587410 k0!1164)))

(declare-fun minValue!1279 () V!53105)

(declare-fun lt!587408 () Unit!43459)

(assert (=> b!1321686 (= lt!587408 (lemmaInListMapAfterAddingDiffThenInBefore!141 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!587410))))

(declare-fun +!4586 (ListLongMap!20973 tuple2!23308) ListLongMap!20973)

(assert (=> b!1321686 (= lt!587410 (+!4586 lt!587409 (tuple2!23309 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun defaultEntry!1340 () Int)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6225 (array!89009 array!89011 (_ BitVec 32) (_ BitVec 32) V!53105 V!53105 (_ BitVec 32) Int) ListLongMap!20973)

(declare-fun get!21641 (ValueCell!17102 V!53105) V!53105)

(declare-fun dynLambda!3540 (Int (_ BitVec 64)) V!53105)

(assert (=> b!1321686 (= lt!587409 (+!4586 (getCurrentListMapNoExtraKeys!6225 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23309 (select (arr!42974 _keys!1609) from!2000) (get!21641 (select (arr!42975 _values!1337) from!2000) (dynLambda!3540 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1321687 () Bool)

(declare-fun res!876874 () Bool)

(assert (=> b!1321687 (=> (not res!876874) (not e!754039))))

(declare-datatypes ((List!30464 0))(
  ( (Nil!30461) (Cons!30460 (h!31678 (_ BitVec 64)) (t!44186 List!30464)) )
))
(declare-fun arrayNoDuplicates!0 (array!89009 (_ BitVec 32) List!30464) Bool)

(assert (=> b!1321687 (= res!876874 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30461))))

(declare-fun res!876869 () Bool)

(assert (=> start!111748 (=> (not res!876869) (not e!754039))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111748 (= res!876869 (validMask!0 mask!2019))))

(assert (=> start!111748 e!754039))

(declare-fun array_inv!32721 (array!89009) Bool)

(assert (=> start!111748 (array_inv!32721 _keys!1609)))

(assert (=> start!111748 true))

(declare-fun tp_is_empty!36001 () Bool)

(assert (=> start!111748 tp_is_empty!36001))

(declare-fun e!754041 () Bool)

(declare-fun array_inv!32722 (array!89011) Bool)

(assert (=> start!111748 (and (array_inv!32722 _values!1337) e!754041)))

(assert (=> start!111748 tp!106018))

(declare-fun b!1321688 () Bool)

(declare-fun e!754042 () Bool)

(declare-fun mapRes!55649 () Bool)

(assert (=> b!1321688 (= e!754041 (and e!754042 mapRes!55649))))

(declare-fun condMapEmpty!55649 () Bool)

(declare-fun mapDefault!55649 () ValueCell!17102)

(assert (=> b!1321688 (= condMapEmpty!55649 (= (arr!42975 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17102)) mapDefault!55649)))))

(declare-fun b!1321689 () Bool)

(declare-fun res!876873 () Bool)

(assert (=> b!1321689 (=> (not res!876873) (not e!754039))))

(assert (=> b!1321689 (= res!876873 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43525 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1321690 () Bool)

(declare-fun res!876871 () Bool)

(assert (=> b!1321690 (=> (not res!876871) (not e!754039))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1321690 (= res!876871 (validKeyInArray!0 (select (arr!42974 _keys!1609) from!2000)))))

(declare-fun b!1321691 () Bool)

(assert (=> b!1321691 (= e!754042 tp_is_empty!36001)))

(declare-fun mapIsEmpty!55649 () Bool)

(assert (=> mapIsEmpty!55649 mapRes!55649))

(declare-fun b!1321692 () Bool)

(declare-fun res!876868 () Bool)

(assert (=> b!1321692 (=> (not res!876868) (not e!754039))))

(assert (=> b!1321692 (= res!876868 (not (= (select (arr!42974 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1321693 () Bool)

(declare-fun e!754038 () Bool)

(assert (=> b!1321693 (= e!754038 tp_is_empty!36001)))

(declare-fun b!1321694 () Bool)

(declare-fun res!876872 () Bool)

(assert (=> b!1321694 (=> (not res!876872) (not e!754039))))

(declare-fun getCurrentListMap!5498 (array!89009 array!89011 (_ BitVec 32) (_ BitVec 32) V!53105 V!53105 (_ BitVec 32) Int) ListLongMap!20973)

(assert (=> b!1321694 (= res!876872 (contains!8669 (getCurrentListMap!5498 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun mapNonEmpty!55649 () Bool)

(declare-fun tp!106019 () Bool)

(assert (=> mapNonEmpty!55649 (= mapRes!55649 (and tp!106019 e!754038))))

(declare-fun mapKey!55649 () (_ BitVec 32))

(declare-fun mapValue!55649 () ValueCell!17102)

(declare-fun mapRest!55649 () (Array (_ BitVec 32) ValueCell!17102))

(assert (=> mapNonEmpty!55649 (= (arr!42975 _values!1337) (store mapRest!55649 mapKey!55649 mapValue!55649))))

(assert (= (and start!111748 res!876869) b!1321684))

(assert (= (and b!1321684 res!876867) b!1321685))

(assert (= (and b!1321685 res!876870) b!1321687))

(assert (= (and b!1321687 res!876874) b!1321689))

(assert (= (and b!1321689 res!876873) b!1321694))

(assert (= (and b!1321694 res!876872) b!1321692))

(assert (= (and b!1321692 res!876868) b!1321690))

(assert (= (and b!1321690 res!876871) b!1321686))

(assert (= (and b!1321688 condMapEmpty!55649) mapIsEmpty!55649))

(assert (= (and b!1321688 (not condMapEmpty!55649)) mapNonEmpty!55649))

(get-info :version)

(assert (= (and mapNonEmpty!55649 ((_ is ValueCellFull!17102) mapValue!55649)) b!1321693))

(assert (= (and b!1321688 ((_ is ValueCellFull!17102) mapDefault!55649)) b!1321691))

(assert (= start!111748 b!1321688))

(declare-fun b_lambda!23501 () Bool)

(assert (=> (not b_lambda!23501) (not b!1321686)))

(declare-fun t!44184 () Bool)

(declare-fun tb!11525 () Bool)

(assert (=> (and start!111748 (= defaultEntry!1340 defaultEntry!1340) t!44184) tb!11525))

(declare-fun result!24113 () Bool)

(assert (=> tb!11525 (= result!24113 tp_is_empty!36001)))

(assert (=> b!1321686 t!44184))

(declare-fun b_and!48525 () Bool)

(assert (= b_and!48523 (and (=> t!44184 result!24113) b_and!48525)))

(declare-fun m!1209689 () Bool)

(assert (=> start!111748 m!1209689))

(declare-fun m!1209691 () Bool)

(assert (=> start!111748 m!1209691))

(declare-fun m!1209693 () Bool)

(assert (=> start!111748 m!1209693))

(declare-fun m!1209695 () Bool)

(assert (=> b!1321694 m!1209695))

(assert (=> b!1321694 m!1209695))

(declare-fun m!1209697 () Bool)

(assert (=> b!1321694 m!1209697))

(declare-fun m!1209699 () Bool)

(assert (=> b!1321686 m!1209699))

(declare-fun m!1209701 () Bool)

(assert (=> b!1321686 m!1209701))

(assert (=> b!1321686 m!1209699))

(declare-fun m!1209703 () Bool)

(assert (=> b!1321686 m!1209703))

(declare-fun m!1209705 () Bool)

(assert (=> b!1321686 m!1209705))

(declare-fun m!1209707 () Bool)

(assert (=> b!1321686 m!1209707))

(declare-fun m!1209709 () Bool)

(assert (=> b!1321686 m!1209709))

(assert (=> b!1321686 m!1209701))

(declare-fun m!1209711 () Bool)

(assert (=> b!1321686 m!1209711))

(declare-fun m!1209713 () Bool)

(assert (=> b!1321686 m!1209713))

(declare-fun m!1209715 () Bool)

(assert (=> b!1321686 m!1209715))

(declare-fun m!1209717 () Bool)

(assert (=> b!1321686 m!1209717))

(assert (=> b!1321686 m!1209709))

(declare-fun m!1209719 () Bool)

(assert (=> b!1321686 m!1209719))

(assert (=> b!1321692 m!1209713))

(declare-fun m!1209721 () Bool)

(assert (=> mapNonEmpty!55649 m!1209721))

(assert (=> b!1321690 m!1209713))

(assert (=> b!1321690 m!1209713))

(declare-fun m!1209723 () Bool)

(assert (=> b!1321690 m!1209723))

(declare-fun m!1209725 () Bool)

(assert (=> b!1321687 m!1209725))

(declare-fun m!1209727 () Bool)

(assert (=> b!1321685 m!1209727))

(check-sat tp_is_empty!36001 (not b!1321687) (not start!111748) (not b!1321686) (not mapNonEmpty!55649) (not b_next!30181) (not b!1321690) (not b_lambda!23501) b_and!48525 (not b!1321685) (not b!1321694))
(check-sat b_and!48525 (not b_next!30181))
