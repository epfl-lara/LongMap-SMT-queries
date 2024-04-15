; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78744 () Bool)

(assert start!78744)

(declare-fun b_free!16975 () Bool)

(declare-fun b_next!16975 () Bool)

(assert (=> start!78744 (= b_free!16975 (not b_next!16975))))

(declare-fun tp!59367 () Bool)

(declare-fun b_and!27661 () Bool)

(assert (=> start!78744 (= tp!59367 b_and!27661)))

(declare-fun b!918828 () Bool)

(declare-fun e!515753 () Bool)

(assert (=> b!918828 (= e!515753 (not true))))

(declare-datatypes ((array!54931 0))(
  ( (array!54932 (arr!26411 (Array (_ BitVec 32) (_ BitVec 64))) (size!26872 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54931)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((List!18562 0))(
  ( (Nil!18559) (Cons!18558 (h!19704 (_ BitVec 64)) (t!26258 List!18562)) )
))
(declare-fun arrayNoDuplicates!0 (array!54931 (_ BitVec 32) List!18562) Bool)

(assert (=> b!918828 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18559)))

(declare-datatypes ((Unit!30942 0))(
  ( (Unit!30943) )
))
(declare-fun lt!412279 () Unit!30942)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!54931 (_ BitVec 32) (_ BitVec 32)) Unit!30942)

(assert (=> b!918828 (= lt!412279 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!30943 0))(
  ( (V!30944 (val!9792 Int)) )
))
(declare-datatypes ((tuple2!12776 0))(
  ( (tuple2!12777 (_1!6399 (_ BitVec 64)) (_2!6399 V!30943)) )
))
(declare-datatypes ((List!18563 0))(
  ( (Nil!18560) (Cons!18559 (h!19705 tuple2!12776) (t!26259 List!18563)) )
))
(declare-datatypes ((ListLongMap!11463 0))(
  ( (ListLongMap!11464 (toList!5747 List!18563)) )
))
(declare-fun lt!412280 () ListLongMap!11463)

(declare-fun lt!412281 () tuple2!12776)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4747 (ListLongMap!11463 (_ BitVec 64)) Bool)

(declare-fun +!2665 (ListLongMap!11463 tuple2!12776) ListLongMap!11463)

(assert (=> b!918828 (contains!4747 (+!2665 lt!412280 lt!412281) k0!1099)))

(declare-fun lt!412278 () (_ BitVec 64))

(declare-fun lt!412277 () V!30943)

(declare-fun lt!412282 () Unit!30942)

(declare-fun addStillContains!362 (ListLongMap!11463 (_ BitVec 64) V!30943 (_ BitVec 64)) Unit!30942)

(assert (=> b!918828 (= lt!412282 (addStillContains!362 lt!412280 lt!412278 lt!412277 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9260 0))(
  ( (ValueCellFull!9260 (v!12309 V!30943)) (EmptyCell!9260) )
))
(declare-datatypes ((array!54933 0))(
  ( (array!54934 (arr!26412 (Array (_ BitVec 32) ValueCell!9260)) (size!26873 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54933)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30943)

(declare-fun minValue!1173 () V!30943)

(declare-fun getCurrentListMap!2939 (array!54931 array!54933 (_ BitVec 32) (_ BitVec 32) V!30943 V!30943 (_ BitVec 32) Int) ListLongMap!11463)

(assert (=> b!918828 (= (getCurrentListMap!2939 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2665 (getCurrentListMap!2939 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412281))))

(assert (=> b!918828 (= lt!412281 (tuple2!12777 lt!412278 lt!412277))))

(declare-fun get!13852 (ValueCell!9260 V!30943) V!30943)

(declare-fun dynLambda!1421 (Int (_ BitVec 64)) V!30943)

(assert (=> b!918828 (= lt!412277 (get!13852 (select (arr!26412 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1421 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412283 () Unit!30942)

(declare-fun lemmaListMapRecursiveValidKeyArray!29 (array!54931 array!54933 (_ BitVec 32) (_ BitVec 32) V!30943 V!30943 (_ BitVec 32) Int) Unit!30942)

(assert (=> b!918828 (= lt!412283 (lemmaListMapRecursiveValidKeyArray!29 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918829 () Bool)

(declare-fun res!619580 () Bool)

(declare-fun e!515754 () Bool)

(assert (=> b!918829 (=> (not res!619580) (not e!515754))))

(assert (=> b!918829 (= res!619580 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26872 _keys!1487))))))

(declare-fun b!918830 () Bool)

(declare-fun e!515749 () Bool)

(assert (=> b!918830 (= e!515754 e!515749)))

(declare-fun res!619582 () Bool)

(assert (=> b!918830 (=> (not res!619582) (not e!515749))))

(assert (=> b!918830 (= res!619582 (contains!4747 lt!412280 k0!1099))))

(assert (=> b!918830 (= lt!412280 (getCurrentListMap!2939 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!918831 () Bool)

(declare-fun res!619584 () Bool)

(assert (=> b!918831 (=> (not res!619584) (not e!515754))))

(assert (=> b!918831 (= res!619584 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18559))))

(declare-fun b!918832 () Bool)

(assert (=> b!918832 (= e!515749 e!515753)))

(declare-fun res!619586 () Bool)

(assert (=> b!918832 (=> (not res!619586) (not e!515753))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918832 (= res!619586 (validKeyInArray!0 lt!412278))))

(assert (=> b!918832 (= lt!412278 (select (arr!26411 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun res!619588 () Bool)

(assert (=> start!78744 (=> (not res!619588) (not e!515754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78744 (= res!619588 (validMask!0 mask!1881))))

(assert (=> start!78744 e!515754))

(assert (=> start!78744 true))

(declare-fun tp_is_empty!19483 () Bool)

(assert (=> start!78744 tp_is_empty!19483))

(declare-fun e!515748 () Bool)

(declare-fun array_inv!20668 (array!54933) Bool)

(assert (=> start!78744 (and (array_inv!20668 _values!1231) e!515748)))

(assert (=> start!78744 tp!59367))

(declare-fun array_inv!20669 (array!54931) Bool)

(assert (=> start!78744 (array_inv!20669 _keys!1487)))

(declare-fun mapNonEmpty!30981 () Bool)

(declare-fun mapRes!30981 () Bool)

(declare-fun tp!59366 () Bool)

(declare-fun e!515751 () Bool)

(assert (=> mapNonEmpty!30981 (= mapRes!30981 (and tp!59366 e!515751))))

(declare-fun mapRest!30981 () (Array (_ BitVec 32) ValueCell!9260))

(declare-fun mapValue!30981 () ValueCell!9260)

(declare-fun mapKey!30981 () (_ BitVec 32))

(assert (=> mapNonEmpty!30981 (= (arr!26412 _values!1231) (store mapRest!30981 mapKey!30981 mapValue!30981))))

(declare-fun b!918833 () Bool)

(declare-fun res!619587 () Bool)

(assert (=> b!918833 (=> (not res!619587) (not e!515754))))

(assert (=> b!918833 (= res!619587 (and (= (size!26873 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26872 _keys!1487) (size!26873 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30981 () Bool)

(assert (=> mapIsEmpty!30981 mapRes!30981))

(declare-fun b!918834 () Bool)

(assert (=> b!918834 (= e!515751 tp_is_empty!19483)))

(declare-fun b!918835 () Bool)

(declare-fun res!619583 () Bool)

(assert (=> b!918835 (=> (not res!619583) (not e!515749))))

(assert (=> b!918835 (= res!619583 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918836 () Bool)

(declare-fun e!515752 () Bool)

(assert (=> b!918836 (= e!515752 tp_is_empty!19483)))

(declare-fun b!918837 () Bool)

(declare-fun res!619589 () Bool)

(assert (=> b!918837 (=> (not res!619589) (not e!515754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54931 (_ BitVec 32)) Bool)

(assert (=> b!918837 (= res!619589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918838 () Bool)

(assert (=> b!918838 (= e!515748 (and e!515752 mapRes!30981))))

(declare-fun condMapEmpty!30981 () Bool)

(declare-fun mapDefault!30981 () ValueCell!9260)

(assert (=> b!918838 (= condMapEmpty!30981 (= (arr!26412 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9260)) mapDefault!30981)))))

(declare-fun b!918839 () Bool)

(declare-fun res!619581 () Bool)

(assert (=> b!918839 (=> (not res!619581) (not e!515749))))

(declare-fun v!791 () V!30943)

(declare-fun apply!578 (ListLongMap!11463 (_ BitVec 64)) V!30943)

(assert (=> b!918839 (= res!619581 (= (apply!578 lt!412280 k0!1099) v!791))))

(declare-fun b!918840 () Bool)

(declare-fun res!619585 () Bool)

(assert (=> b!918840 (=> (not res!619585) (not e!515749))))

(assert (=> b!918840 (= res!619585 (validKeyInArray!0 k0!1099))))

(assert (= (and start!78744 res!619588) b!918833))

(assert (= (and b!918833 res!619587) b!918837))

(assert (= (and b!918837 res!619589) b!918831))

(assert (= (and b!918831 res!619584) b!918829))

(assert (= (and b!918829 res!619580) b!918830))

(assert (= (and b!918830 res!619582) b!918839))

(assert (= (and b!918839 res!619581) b!918835))

(assert (= (and b!918835 res!619583) b!918840))

(assert (= (and b!918840 res!619585) b!918832))

(assert (= (and b!918832 res!619586) b!918828))

(assert (= (and b!918838 condMapEmpty!30981) mapIsEmpty!30981))

(assert (= (and b!918838 (not condMapEmpty!30981)) mapNonEmpty!30981))

(get-info :version)

(assert (= (and mapNonEmpty!30981 ((_ is ValueCellFull!9260) mapValue!30981)) b!918834))

(assert (= (and b!918838 ((_ is ValueCellFull!9260) mapDefault!30981)) b!918836))

(assert (= start!78744 b!918838))

(declare-fun b_lambda!13459 () Bool)

(assert (=> (not b_lambda!13459) (not b!918828)))

(declare-fun t!26257 () Bool)

(declare-fun tb!5547 () Bool)

(assert (=> (and start!78744 (= defaultEntry!1235 defaultEntry!1235) t!26257) tb!5547))

(declare-fun result!10925 () Bool)

(assert (=> tb!5547 (= result!10925 tp_is_empty!19483)))

(assert (=> b!918828 t!26257))

(declare-fun b_and!27663 () Bool)

(assert (= b_and!27661 (and (=> t!26257 result!10925) b_and!27663)))

(declare-fun m!852025 () Bool)

(assert (=> b!918837 m!852025))

(declare-fun m!852027 () Bool)

(assert (=> b!918830 m!852027))

(declare-fun m!852029 () Bool)

(assert (=> b!918830 m!852029))

(declare-fun m!852031 () Bool)

(assert (=> b!918840 m!852031))

(declare-fun m!852033 () Bool)

(assert (=> b!918832 m!852033))

(declare-fun m!852035 () Bool)

(assert (=> b!918832 m!852035))

(declare-fun m!852037 () Bool)

(assert (=> b!918831 m!852037))

(declare-fun m!852039 () Bool)

(assert (=> b!918839 m!852039))

(declare-fun m!852041 () Bool)

(assert (=> start!78744 m!852041))

(declare-fun m!852043 () Bool)

(assert (=> start!78744 m!852043))

(declare-fun m!852045 () Bool)

(assert (=> start!78744 m!852045))

(declare-fun m!852047 () Bool)

(assert (=> b!918828 m!852047))

(declare-fun m!852049 () Bool)

(assert (=> b!918828 m!852049))

(declare-fun m!852051 () Bool)

(assert (=> b!918828 m!852051))

(declare-fun m!852053 () Bool)

(assert (=> b!918828 m!852053))

(declare-fun m!852055 () Bool)

(assert (=> b!918828 m!852055))

(declare-fun m!852057 () Bool)

(assert (=> b!918828 m!852057))

(declare-fun m!852059 () Bool)

(assert (=> b!918828 m!852059))

(assert (=> b!918828 m!852047))

(assert (=> b!918828 m!852057))

(assert (=> b!918828 m!852059))

(declare-fun m!852061 () Bool)

(assert (=> b!918828 m!852061))

(declare-fun m!852063 () Bool)

(assert (=> b!918828 m!852063))

(declare-fun m!852065 () Bool)

(assert (=> b!918828 m!852065))

(declare-fun m!852067 () Bool)

(assert (=> b!918828 m!852067))

(assert (=> b!918828 m!852053))

(declare-fun m!852069 () Bool)

(assert (=> b!918828 m!852069))

(declare-fun m!852071 () Bool)

(assert (=> mapNonEmpty!30981 m!852071))

(check-sat (not b!918832) (not b!918837) (not start!78744) (not mapNonEmpty!30981) tp_is_empty!19483 (not b!918839) (not b_lambda!13459) (not b!918831) b_and!27663 (not b_next!16975) (not b!918830) (not b!918828) (not b!918840))
(check-sat b_and!27663 (not b_next!16975))
