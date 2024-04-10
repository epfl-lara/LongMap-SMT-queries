; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79024 () Bool)

(assert start!79024)

(declare-fun b_free!17237 () Bool)

(declare-fun b_next!17237 () Bool)

(assert (=> start!79024 (= b_free!17237 (not b_next!17237))))

(declare-fun tp!60151 () Bool)

(declare-fun b_and!28211 () Bool)

(assert (=> start!79024 (= tp!60151 b_and!28211)))

(declare-fun b!925763 () Bool)

(declare-datatypes ((Unit!31287 0))(
  ( (Unit!31288) )
))
(declare-fun e!519614 () Unit!31287)

(declare-fun Unit!31289 () Unit!31287)

(assert (=> b!925763 (= e!519614 Unit!31289)))

(declare-fun b!925764 () Bool)

(declare-fun e!519606 () Unit!31287)

(declare-fun Unit!31290 () Unit!31287)

(assert (=> b!925764 (= e!519606 Unit!31290)))

(declare-fun b!925765 () Bool)

(declare-fun res!623801 () Bool)

(declare-fun e!519607 () Bool)

(assert (=> b!925765 (=> (not res!623801) (not e!519607))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31291 0))(
  ( (V!31292 (val!9923 Int)) )
))
(declare-fun v!791 () V!31291)

(declare-datatypes ((tuple2!12942 0))(
  ( (tuple2!12943 (_1!6482 (_ BitVec 64)) (_2!6482 V!31291)) )
))
(declare-datatypes ((List!18743 0))(
  ( (Nil!18740) (Cons!18739 (h!19885 tuple2!12942) (t!26710 List!18743)) )
))
(declare-datatypes ((ListLongMap!11639 0))(
  ( (ListLongMap!11640 (toList!5835 List!18743)) )
))
(declare-fun lt!416716 () ListLongMap!11639)

(declare-fun apply!665 (ListLongMap!11639 (_ BitVec 64)) V!31291)

(assert (=> b!925765 (= res!623801 (= (apply!665 lt!416716 k!1099) v!791))))

(declare-fun b!925766 () Bool)

(declare-fun lt!416723 () ListLongMap!11639)

(declare-fun lt!416719 () V!31291)

(assert (=> b!925766 (= (apply!665 lt!416723 k!1099) lt!416719)))

(declare-fun lt!416714 () (_ BitVec 64))

(declare-fun lt!416724 () ListLongMap!11639)

(declare-fun lt!416715 () Unit!31287)

(declare-fun lt!416721 () V!31291)

(declare-fun addApplyDifferent!385 (ListLongMap!11639 (_ BitVec 64) V!31291 (_ BitVec 64)) Unit!31287)

(assert (=> b!925766 (= lt!416715 (addApplyDifferent!385 lt!416724 lt!416714 lt!416721 k!1099))))

(assert (=> b!925766 (not (= lt!416714 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!416727 () Unit!31287)

(declare-datatypes ((array!55456 0))(
  ( (array!55457 (arr!26673 (Array (_ BitVec 32) (_ BitVec 64))) (size!27132 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55456)

(declare-datatypes ((List!18744 0))(
  ( (Nil!18741) (Cons!18740 (h!19886 (_ BitVec 64)) (t!26711 List!18744)) )
))
(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55456 (_ BitVec 64) (_ BitVec 32) List!18744) Unit!31287)

(assert (=> b!925766 (= lt!416727 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18741))))

(declare-fun e!519616 () Bool)

(assert (=> b!925766 e!519616))

(declare-fun c!96625 () Bool)

(assert (=> b!925766 (= c!96625 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!416720 () Unit!31287)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9391 0))(
  ( (ValueCellFull!9391 (v!12441 V!31291)) (EmptyCell!9391) )
))
(declare-datatypes ((array!55458 0))(
  ( (array!55459 (arr!26674 (Array (_ BitVec 32) ValueCell!9391)) (size!27133 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55458)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31291)

(declare-fun minValue!1173 () V!31291)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!236 (array!55456 array!55458 (_ BitVec 32) (_ BitVec 32) V!31291 V!31291 (_ BitVec 64) (_ BitVec 32) Int) Unit!31287)

(assert (=> b!925766 (= lt!416720 (lemmaListMapContainsThenArrayContainsFrom!236 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(declare-fun arrayNoDuplicates!0 (array!55456 (_ BitVec 32) List!18744) Bool)

(assert (=> b!925766 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18741)))

(declare-fun lt!416713 () Unit!31287)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55456 (_ BitVec 32) (_ BitVec 32)) Unit!31287)

(assert (=> b!925766 (= lt!416713 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4894 (ListLongMap!11639 (_ BitVec 64)) Bool)

(assert (=> b!925766 (contains!4894 lt!416723 k!1099)))

(declare-fun lt!416728 () tuple2!12942)

(declare-fun +!2729 (ListLongMap!11639 tuple2!12942) ListLongMap!11639)

(assert (=> b!925766 (= lt!416723 (+!2729 lt!416724 lt!416728))))

(declare-fun lt!416725 () Unit!31287)

(declare-fun addStillContains!453 (ListLongMap!11639 (_ BitVec 64) V!31291 (_ BitVec 64)) Unit!31287)

(assert (=> b!925766 (= lt!416725 (addStillContains!453 lt!416724 lt!416714 lt!416721 k!1099))))

(declare-fun getCurrentListMap!3085 (array!55456 array!55458 (_ BitVec 32) (_ BitVec 32) V!31291 V!31291 (_ BitVec 32) Int) ListLongMap!11639)

(assert (=> b!925766 (= (getCurrentListMap!3085 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2729 (getCurrentListMap!3085 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416728))))

(assert (=> b!925766 (= lt!416728 (tuple2!12943 lt!416714 lt!416721))))

(declare-fun get!14030 (ValueCell!9391 V!31291) V!31291)

(declare-fun dynLambda!1518 (Int (_ BitVec 64)) V!31291)

(assert (=> b!925766 (= lt!416721 (get!14030 (select (arr!26674 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1518 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416717 () Unit!31287)

(declare-fun lemmaListMapRecursiveValidKeyArray!119 (array!55456 array!55458 (_ BitVec 32) (_ BitVec 32) V!31291 V!31291 (_ BitVec 32) Int) Unit!31287)

(assert (=> b!925766 (= lt!416717 (lemmaListMapRecursiveValidKeyArray!119 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!925766 (= e!519614 lt!416715)))

(declare-fun b!925767 () Bool)

(declare-fun e!519615 () Bool)

(declare-fun e!519610 () Bool)

(assert (=> b!925767 (= e!519615 e!519610)))

(declare-fun res!623805 () Bool)

(assert (=> b!925767 (=> (not res!623805) (not e!519610))))

(assert (=> b!925767 (= res!623805 (and (= lt!416719 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(assert (=> b!925767 (= lt!416719 (apply!665 lt!416724 k!1099))))

(declare-fun b!925768 () Bool)

(declare-fun e!519611 () Bool)

(assert (=> b!925768 (= e!519611 e!519615)))

(declare-fun res!623807 () Bool)

(assert (=> b!925768 (=> (not res!623807) (not e!519615))))

(assert (=> b!925768 (= res!623807 (contains!4894 lt!416724 k!1099))))

(assert (=> b!925768 (= lt!416724 (getCurrentListMap!3085 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!925769 () Bool)

(declare-fun res!623804 () Bool)

(assert (=> b!925769 (=> (not res!623804) (not e!519611))))

(assert (=> b!925769 (= res!623804 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18741))))

(declare-fun b!925770 () Bool)

(declare-fun res!623800 () Bool)

(assert (=> b!925770 (=> (not res!623800) (not e!519611))))

(assert (=> b!925770 (= res!623800 (and (= (size!27133 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27132 _keys!1487) (size!27133 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!925771 () Bool)

(declare-fun e!519604 () Bool)

(assert (=> b!925771 (= e!519604 e!519607)))

(declare-fun res!623808 () Bool)

(assert (=> b!925771 (=> (not res!623808) (not e!519607))))

(assert (=> b!925771 (= res!623808 (contains!4894 lt!416716 k!1099))))

(assert (=> b!925771 (= lt!416716 (getCurrentListMap!3085 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925772 () Bool)

(assert (=> b!925772 (= e!519606 e!519614)))

(assert (=> b!925772 (= lt!416714 (select (arr!26673 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96626 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925772 (= c!96626 (validKeyInArray!0 lt!416714))))

(declare-fun b!925773 () Bool)

(declare-fun res!623802 () Bool)

(assert (=> b!925773 (=> (not res!623802) (not e!519611))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55456 (_ BitVec 32)) Bool)

(assert (=> b!925773 (= res!623802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!925774 () Bool)

(declare-fun lt!416726 () ListLongMap!11639)

(declare-fun e!519613 () Bool)

(assert (=> b!925774 (= e!519613 (= (apply!665 lt!416726 k!1099) v!791))))

(declare-fun res!623803 () Bool)

(assert (=> start!79024 (=> (not res!623803) (not e!519611))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79024 (= res!623803 (validMask!0 mask!1881))))

(assert (=> start!79024 e!519611))

(assert (=> start!79024 true))

(declare-fun tp_is_empty!19745 () Bool)

(assert (=> start!79024 tp_is_empty!19745))

(declare-fun e!519609 () Bool)

(declare-fun array_inv!20774 (array!55458) Bool)

(assert (=> start!79024 (and (array_inv!20774 _values!1231) e!519609)))

(assert (=> start!79024 tp!60151))

(declare-fun array_inv!20775 (array!55456) Bool)

(assert (=> start!79024 (array_inv!20775 _keys!1487)))

(declare-fun mapNonEmpty!31374 () Bool)

(declare-fun mapRes!31374 () Bool)

(declare-fun tp!60152 () Bool)

(declare-fun e!519612 () Bool)

(assert (=> mapNonEmpty!31374 (= mapRes!31374 (and tp!60152 e!519612))))

(declare-fun mapValue!31374 () ValueCell!9391)

(declare-fun mapRest!31374 () (Array (_ BitVec 32) ValueCell!9391))

(declare-fun mapKey!31374 () (_ BitVec 32))

(assert (=> mapNonEmpty!31374 (= (arr!26674 _values!1231) (store mapRest!31374 mapKey!31374 mapValue!31374))))

(declare-fun mapIsEmpty!31374 () Bool)

(assert (=> mapIsEmpty!31374 mapRes!31374))

(declare-fun b!925775 () Bool)

(assert (=> b!925775 (= e!519610 e!519604)))

(declare-fun res!623809 () Bool)

(assert (=> b!925775 (=> (not res!623809) (not e!519604))))

(assert (=> b!925775 (= res!623809 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27132 _keys!1487)))))

(declare-fun lt!416722 () Unit!31287)

(assert (=> b!925775 (= lt!416722 e!519606)))

(declare-fun c!96627 () Bool)

(assert (=> b!925775 (= c!96627 (validKeyInArray!0 k!1099))))

(declare-fun b!925776 () Bool)

(declare-fun e!519608 () Bool)

(assert (=> b!925776 (= e!519609 (and e!519608 mapRes!31374))))

(declare-fun condMapEmpty!31374 () Bool)

(declare-fun mapDefault!31374 () ValueCell!9391)

