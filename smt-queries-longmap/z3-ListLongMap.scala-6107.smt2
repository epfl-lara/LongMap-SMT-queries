; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78752 () Bool)

(assert start!78752)

(declare-fun b_free!16965 () Bool)

(declare-fun b_next!16965 () Bool)

(assert (=> start!78752 (= b_free!16965 (not b_next!16965))))

(declare-fun tp!59336 () Bool)

(declare-fun b_and!27667 () Bool)

(assert (=> start!78752 (= tp!59336 b_and!27667)))

(declare-fun mapNonEmpty!30966 () Bool)

(declare-fun mapRes!30966 () Bool)

(declare-fun tp!59335 () Bool)

(declare-fun e!515796 () Bool)

(assert (=> mapNonEmpty!30966 (= mapRes!30966 (and tp!59335 e!515796))))

(declare-fun mapKey!30966 () (_ BitVec 32))

(declare-datatypes ((V!30929 0))(
  ( (V!30930 (val!9787 Int)) )
))
(declare-datatypes ((ValueCell!9255 0))(
  ( (ValueCellFull!9255 (v!12305 V!30929)) (EmptyCell!9255) )
))
(declare-fun mapRest!30966 () (Array (_ BitVec 32) ValueCell!9255))

(declare-fun mapValue!30966 () ValueCell!9255)

(declare-datatypes ((array!54930 0))(
  ( (array!54931 (arr!26410 (Array (_ BitVec 32) ValueCell!9255)) (size!26869 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54930)

(assert (=> mapNonEmpty!30966 (= (arr!26410 _values!1231) (store mapRest!30966 mapKey!30966 mapValue!30966))))

(declare-fun b!918862 () Bool)

(declare-fun res!619544 () Bool)

(declare-fun e!515794 () Bool)

(assert (=> b!918862 (=> (not res!619544) (not e!515794))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918862 (= res!619544 (validKeyInArray!0 k0!1099))))

(declare-fun b!918863 () Bool)

(declare-fun e!515797 () Bool)

(assert (=> b!918863 (= e!515797 (not true))))

(declare-datatypes ((tuple2!12720 0))(
  ( (tuple2!12721 (_1!6371 (_ BitVec 64)) (_2!6371 V!30929)) )
))
(declare-datatypes ((List!18524 0))(
  ( (Nil!18521) (Cons!18520 (h!19666 tuple2!12720) (t!26219 List!18524)) )
))
(declare-datatypes ((ListLongMap!11417 0))(
  ( (ListLongMap!11418 (toList!5724 List!18524)) )
))
(declare-fun lt!412423 () ListLongMap!11417)

(declare-fun lt!412426 () tuple2!12720)

(declare-fun contains!4770 (ListLongMap!11417 (_ BitVec 64)) Bool)

(declare-fun +!2635 (ListLongMap!11417 tuple2!12720) ListLongMap!11417)

(assert (=> b!918863 (contains!4770 (+!2635 lt!412423 lt!412426) k0!1099)))

(declare-fun lt!412422 () V!30929)

(declare-datatypes ((Unit!31018 0))(
  ( (Unit!31019) )
))
(declare-fun lt!412421 () Unit!31018)

(declare-fun lt!412424 () (_ BitVec 64))

(declare-fun addStillContains!359 (ListLongMap!11417 (_ BitVec 64) V!30929 (_ BitVec 64)) Unit!31018)

(assert (=> b!918863 (= lt!412421 (addStillContains!359 lt!412423 lt!412424 lt!412422 k0!1099))))

(declare-datatypes ((array!54932 0))(
  ( (array!54933 (arr!26411 (Array (_ BitVec 32) (_ BitVec 64))) (size!26870 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54932)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30929)

(declare-fun minValue!1173 () V!30929)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!2980 (array!54932 array!54930 (_ BitVec 32) (_ BitVec 32) V!30929 V!30929 (_ BitVec 32) Int) ListLongMap!11417)

(assert (=> b!918863 (= (getCurrentListMap!2980 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2635 (getCurrentListMap!2980 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412426))))

(assert (=> b!918863 (= lt!412426 (tuple2!12721 lt!412424 lt!412422))))

(declare-fun get!13846 (ValueCell!9255 V!30929) V!30929)

(declare-fun dynLambda!1424 (Int (_ BitVec 64)) V!30929)

(assert (=> b!918863 (= lt!412422 (get!13846 (select (arr!26410 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1424 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412425 () Unit!31018)

(declare-fun lemmaListMapRecursiveValidKeyArray!25 (array!54932 array!54930 (_ BitVec 32) (_ BitVec 32) V!30929 V!30929 (_ BitVec 32) Int) Unit!31018)

(assert (=> b!918863 (= lt!412425 (lemmaListMapRecursiveValidKeyArray!25 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918864 () Bool)

(declare-fun res!619545 () Bool)

(declare-fun e!515793 () Bool)

(assert (=> b!918864 (=> (not res!619545) (not e!515793))))

(assert (=> b!918864 (= res!619545 (and (= (size!26869 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26870 _keys!1487) (size!26869 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918865 () Bool)

(declare-fun res!619541 () Bool)

(assert (=> b!918865 (=> (not res!619541) (not e!515793))))

(assert (=> b!918865 (= res!619541 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26870 _keys!1487))))))

(declare-fun res!619547 () Bool)

(assert (=> start!78752 (=> (not res!619547) (not e!515793))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78752 (= res!619547 (validMask!0 mask!1881))))

(assert (=> start!78752 e!515793))

(assert (=> start!78752 true))

(declare-fun tp_is_empty!19473 () Bool)

(assert (=> start!78752 tp_is_empty!19473))

(declare-fun e!515792 () Bool)

(declare-fun array_inv!20584 (array!54930) Bool)

(assert (=> start!78752 (and (array_inv!20584 _values!1231) e!515792)))

(assert (=> start!78752 tp!59336))

(declare-fun array_inv!20585 (array!54932) Bool)

(assert (=> start!78752 (array_inv!20585 _keys!1487)))

(declare-fun b!918866 () Bool)

(declare-fun res!619540 () Bool)

(assert (=> b!918866 (=> (not res!619540) (not e!515794))))

(assert (=> b!918866 (= res!619540 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918867 () Bool)

(declare-fun e!515795 () Bool)

(assert (=> b!918867 (= e!515795 tp_is_empty!19473)))

(declare-fun b!918868 () Bool)

(declare-fun res!619548 () Bool)

(assert (=> b!918868 (=> (not res!619548) (not e!515793))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54932 (_ BitVec 32)) Bool)

(assert (=> b!918868 (= res!619548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918869 () Bool)

(assert (=> b!918869 (= e!515793 e!515794)))

(declare-fun res!619543 () Bool)

(assert (=> b!918869 (=> (not res!619543) (not e!515794))))

(assert (=> b!918869 (= res!619543 (contains!4770 lt!412423 k0!1099))))

(assert (=> b!918869 (= lt!412423 (getCurrentListMap!2980 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!918870 () Bool)

(assert (=> b!918870 (= e!515796 tp_is_empty!19473)))

(declare-fun b!918871 () Bool)

(declare-fun res!619542 () Bool)

(assert (=> b!918871 (=> (not res!619542) (not e!515793))))

(declare-datatypes ((List!18525 0))(
  ( (Nil!18522) (Cons!18521 (h!19667 (_ BitVec 64)) (t!26220 List!18525)) )
))
(declare-fun arrayNoDuplicates!0 (array!54932 (_ BitVec 32) List!18525) Bool)

(assert (=> b!918871 (= res!619542 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18522))))

(declare-fun b!918872 () Bool)

(declare-fun res!619546 () Bool)

(assert (=> b!918872 (=> (not res!619546) (not e!515794))))

(declare-fun v!791 () V!30929)

(declare-fun apply!570 (ListLongMap!11417 (_ BitVec 64)) V!30929)

(assert (=> b!918872 (= res!619546 (= (apply!570 lt!412423 k0!1099) v!791))))

(declare-fun b!918873 () Bool)

(assert (=> b!918873 (= e!515792 (and e!515795 mapRes!30966))))

(declare-fun condMapEmpty!30966 () Bool)

(declare-fun mapDefault!30966 () ValueCell!9255)

(assert (=> b!918873 (= condMapEmpty!30966 (= (arr!26410 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9255)) mapDefault!30966)))))

(declare-fun mapIsEmpty!30966 () Bool)

(assert (=> mapIsEmpty!30966 mapRes!30966))

(declare-fun b!918874 () Bool)

(assert (=> b!918874 (= e!515794 e!515797)))

(declare-fun res!619549 () Bool)

(assert (=> b!918874 (=> (not res!619549) (not e!515797))))

(assert (=> b!918874 (= res!619549 (validKeyInArray!0 lt!412424))))

(assert (=> b!918874 (= lt!412424 (select (arr!26411 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (= (and start!78752 res!619547) b!918864))

(assert (= (and b!918864 res!619545) b!918868))

(assert (= (and b!918868 res!619548) b!918871))

(assert (= (and b!918871 res!619542) b!918865))

(assert (= (and b!918865 res!619541) b!918869))

(assert (= (and b!918869 res!619543) b!918872))

(assert (= (and b!918872 res!619546) b!918866))

(assert (= (and b!918866 res!619540) b!918862))

(assert (= (and b!918862 res!619544) b!918874))

(assert (= (and b!918874 res!619549) b!918863))

(assert (= (and b!918873 condMapEmpty!30966) mapIsEmpty!30966))

(assert (= (and b!918873 (not condMapEmpty!30966)) mapNonEmpty!30966))

(get-info :version)

(assert (= (and mapNonEmpty!30966 ((_ is ValueCellFull!9255) mapValue!30966)) b!918870))

(assert (= (and b!918873 ((_ is ValueCellFull!9255) mapDefault!30966)) b!918867))

(assert (= start!78752 b!918873))

(declare-fun b_lambda!13467 () Bool)

(assert (=> (not b_lambda!13467) (not b!918863)))

(declare-fun t!26218 () Bool)

(declare-fun tb!5545 () Bool)

(assert (=> (and start!78752 (= defaultEntry!1235 defaultEntry!1235) t!26218) tb!5545))

(declare-fun result!10913 () Bool)

(assert (=> tb!5545 (= result!10913 tp_is_empty!19473)))

(assert (=> b!918863 t!26218))

(declare-fun b_and!27669 () Bool)

(assert (= b_and!27667 (and (=> t!26218 result!10913) b_and!27669)))

(declare-fun m!852563 () Bool)

(assert (=> b!918862 m!852563))

(declare-fun m!852565 () Bool)

(assert (=> b!918869 m!852565))

(declare-fun m!852567 () Bool)

(assert (=> b!918869 m!852567))

(declare-fun m!852569 () Bool)

(assert (=> b!918872 m!852569))

(declare-fun m!852571 () Bool)

(assert (=> start!78752 m!852571))

(declare-fun m!852573 () Bool)

(assert (=> start!78752 m!852573))

(declare-fun m!852575 () Bool)

(assert (=> start!78752 m!852575))

(declare-fun m!852577 () Bool)

(assert (=> b!918863 m!852577))

(declare-fun m!852579 () Bool)

(assert (=> b!918863 m!852579))

(declare-fun m!852581 () Bool)

(assert (=> b!918863 m!852581))

(declare-fun m!852583 () Bool)

(assert (=> b!918863 m!852583))

(declare-fun m!852585 () Bool)

(assert (=> b!918863 m!852585))

(assert (=> b!918863 m!852581))

(assert (=> b!918863 m!852583))

(declare-fun m!852587 () Bool)

(assert (=> b!918863 m!852587))

(declare-fun m!852589 () Bool)

(assert (=> b!918863 m!852589))

(assert (=> b!918863 m!852577))

(declare-fun m!852591 () Bool)

(assert (=> b!918863 m!852591))

(assert (=> b!918863 m!852591))

(declare-fun m!852593 () Bool)

(assert (=> b!918863 m!852593))

(declare-fun m!852595 () Bool)

(assert (=> b!918863 m!852595))

(declare-fun m!852597 () Bool)

(assert (=> mapNonEmpty!30966 m!852597))

(declare-fun m!852599 () Bool)

(assert (=> b!918868 m!852599))

(declare-fun m!852601 () Bool)

(assert (=> b!918871 m!852601))

(declare-fun m!852603 () Bool)

(assert (=> b!918874 m!852603))

(declare-fun m!852605 () Bool)

(assert (=> b!918874 m!852605))

(check-sat (not b!918874) (not b!918871) (not b!918863) b_and!27669 (not b!918862) (not b_next!16965) (not start!78752) (not mapNonEmpty!30966) tp_is_empty!19473 (not b!918868) (not b_lambda!13467) (not b!918869) (not b!918872))
(check-sat b_and!27669 (not b_next!16965))
