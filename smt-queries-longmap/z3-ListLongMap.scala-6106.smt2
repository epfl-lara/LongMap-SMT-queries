; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78912 () Bool)

(assert start!78912)

(declare-fun b_free!16957 () Bool)

(declare-fun b_next!16957 () Bool)

(assert (=> start!78912 (= b_free!16957 (not b_next!16957))))

(declare-fun tp!59313 () Bool)

(declare-fun b_and!27661 () Bool)

(assert (=> start!78912 (= tp!59313 b_and!27661)))

(declare-fun res!619772 () Bool)

(declare-fun e!516291 () Bool)

(assert (=> start!78912 (=> (not res!619772) (not e!516291))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78912 (= res!619772 (validMask!0 mask!1881))))

(assert (=> start!78912 e!516291))

(assert (=> start!78912 true))

(declare-fun tp_is_empty!19465 () Bool)

(assert (=> start!78912 tp_is_empty!19465))

(declare-datatypes ((V!30919 0))(
  ( (V!30920 (val!9783 Int)) )
))
(declare-datatypes ((ValueCell!9251 0))(
  ( (ValueCellFull!9251 (v!12298 V!30919)) (EmptyCell!9251) )
))
(declare-datatypes ((array!54959 0))(
  ( (array!54960 (arr!26420 (Array (_ BitVec 32) ValueCell!9251)) (size!26880 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54959)

(declare-fun e!516292 () Bool)

(declare-fun array_inv!20688 (array!54959) Bool)

(assert (=> start!78912 (and (array_inv!20688 _values!1231) e!516292)))

(assert (=> start!78912 tp!59313))

(declare-datatypes ((array!54961 0))(
  ( (array!54962 (arr!26421 (Array (_ BitVec 32) (_ BitVec 64))) (size!26881 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54961)

(declare-fun array_inv!20689 (array!54961) Bool)

(assert (=> start!78912 (array_inv!20689 _keys!1487)))

(declare-fun b!919601 () Bool)

(declare-fun res!619771 () Bool)

(declare-fun e!516294 () Bool)

(assert (=> b!919601 (=> (not res!619771) (not e!516294))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!30919)

(declare-datatypes ((tuple2!12684 0))(
  ( (tuple2!12685 (_1!6353 (_ BitVec 64)) (_2!6353 V!30919)) )
))
(declare-datatypes ((List!18503 0))(
  ( (Nil!18500) (Cons!18499 (h!19651 tuple2!12684) (t!26182 List!18503)) )
))
(declare-datatypes ((ListLongMap!11383 0))(
  ( (ListLongMap!11384 (toList!5707 List!18503)) )
))
(declare-fun lt!412715 () ListLongMap!11383)

(declare-fun apply!582 (ListLongMap!11383 (_ BitVec 64)) V!30919)

(assert (=> b!919601 (= res!619771 (= (apply!582 lt!412715 k0!1099) v!791))))

(declare-fun b!919602 () Bool)

(assert (=> b!919602 (= e!516291 e!516294)))

(declare-fun res!619768 () Bool)

(assert (=> b!919602 (=> (not res!619768) (not e!516294))))

(declare-fun contains!4761 (ListLongMap!11383 (_ BitVec 64)) Bool)

(assert (=> b!919602 (= res!619768 (contains!4761 lt!412715 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30919)

(declare-fun minValue!1173 () V!30919)

(declare-fun getCurrentListMap!2961 (array!54961 array!54959 (_ BitVec 32) (_ BitVec 32) V!30919 V!30919 (_ BitVec 32) Int) ListLongMap!11383)

(assert (=> b!919602 (= lt!412715 (getCurrentListMap!2961 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919603 () Bool)

(declare-fun e!516293 () Bool)

(assert (=> b!919603 (= e!516293 tp_is_empty!19465)))

(declare-fun b!919604 () Bool)

(declare-fun e!516290 () Bool)

(assert (=> b!919604 (= e!516290 tp_is_empty!19465)))

(declare-fun mapIsEmpty!30954 () Bool)

(declare-fun mapRes!30954 () Bool)

(assert (=> mapIsEmpty!30954 mapRes!30954))

(declare-fun b!919605 () Bool)

(declare-fun res!619764 () Bool)

(assert (=> b!919605 (=> (not res!619764) (not e!516291))))

(declare-datatypes ((List!18504 0))(
  ( (Nil!18501) (Cons!18500 (h!19652 (_ BitVec 64)) (t!26183 List!18504)) )
))
(declare-fun arrayNoDuplicates!0 (array!54961 (_ BitVec 32) List!18504) Bool)

(assert (=> b!919605 (= res!619764 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18501))))

(declare-fun b!919606 () Bool)

(declare-fun e!516289 () Bool)

(assert (=> b!919606 (= e!516294 e!516289)))

(declare-fun res!619773 () Bool)

(assert (=> b!919606 (=> (not res!619773) (not e!516289))))

(declare-fun lt!412714 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919606 (= res!619773 (validKeyInArray!0 lt!412714))))

(assert (=> b!919606 (= lt!412714 (select (arr!26421 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!30954 () Bool)

(declare-fun tp!59312 () Bool)

(assert (=> mapNonEmpty!30954 (= mapRes!30954 (and tp!59312 e!516290))))

(declare-fun mapKey!30954 () (_ BitVec 32))

(declare-fun mapRest!30954 () (Array (_ BitVec 32) ValueCell!9251))

(declare-fun mapValue!30954 () ValueCell!9251)

(assert (=> mapNonEmpty!30954 (= (arr!26420 _values!1231) (store mapRest!30954 mapKey!30954 mapValue!30954))))

(declare-fun b!919607 () Bool)

(declare-fun res!619765 () Bool)

(assert (=> b!919607 (=> (not res!619765) (not e!516291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54961 (_ BitVec 32)) Bool)

(assert (=> b!919607 (= res!619765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919608 () Bool)

(declare-fun res!619767 () Bool)

(assert (=> b!919608 (=> (not res!619767) (not e!516291))))

(assert (=> b!919608 (= res!619767 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26881 _keys!1487))))))

(declare-fun b!919609 () Bool)

(declare-fun res!619769 () Bool)

(assert (=> b!919609 (=> (not res!619769) (not e!516291))))

(assert (=> b!919609 (= res!619769 (and (= (size!26880 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26881 _keys!1487) (size!26880 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919610 () Bool)

(declare-fun res!619766 () Bool)

(assert (=> b!919610 (=> (not res!619766) (not e!516294))))

(assert (=> b!919610 (= res!619766 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919611 () Bool)

(declare-fun res!619770 () Bool)

(assert (=> b!919611 (=> (not res!619770) (not e!516294))))

(assert (=> b!919611 (= res!619770 (validKeyInArray!0 k0!1099))))

(declare-fun b!919612 () Bool)

(assert (=> b!919612 (= e!516292 (and e!516293 mapRes!30954))))

(declare-fun condMapEmpty!30954 () Bool)

(declare-fun mapDefault!30954 () ValueCell!9251)

(assert (=> b!919612 (= condMapEmpty!30954 (= (arr!26420 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9251)) mapDefault!30954)))))

(declare-fun b!919613 () Bool)

(assert (=> b!919613 (= e!516289 (not true))))

(declare-fun lt!412713 () tuple2!12684)

(declare-fun +!2648 (ListLongMap!11383 tuple2!12684) ListLongMap!11383)

(assert (=> b!919613 (contains!4761 (+!2648 lt!412715 lt!412713) k0!1099)))

(declare-datatypes ((Unit!31008 0))(
  ( (Unit!31009) )
))
(declare-fun lt!412710 () Unit!31008)

(declare-fun lt!412712 () V!30919)

(declare-fun addStillContains!357 (ListLongMap!11383 (_ BitVec 64) V!30919 (_ BitVec 64)) Unit!31008)

(assert (=> b!919613 (= lt!412710 (addStillContains!357 lt!412715 lt!412714 lt!412712 k0!1099))))

(assert (=> b!919613 (= (getCurrentListMap!2961 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2648 (getCurrentListMap!2961 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412713))))

(assert (=> b!919613 (= lt!412713 (tuple2!12685 lt!412714 lt!412712))))

(declare-fun get!13869 (ValueCell!9251 V!30919) V!30919)

(declare-fun dynLambda!1445 (Int (_ BitVec 64)) V!30919)

(assert (=> b!919613 (= lt!412712 (get!13869 (select (arr!26420 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1445 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412711 () Unit!31008)

(declare-fun lemmaListMapRecursiveValidKeyArray!28 (array!54961 array!54959 (_ BitVec 32) (_ BitVec 32) V!30919 V!30919 (_ BitVec 32) Int) Unit!31008)

(assert (=> b!919613 (= lt!412711 (lemmaListMapRecursiveValidKeyArray!28 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (= (and start!78912 res!619772) b!919609))

(assert (= (and b!919609 res!619769) b!919607))

(assert (= (and b!919607 res!619765) b!919605))

(assert (= (and b!919605 res!619764) b!919608))

(assert (= (and b!919608 res!619767) b!919602))

(assert (= (and b!919602 res!619768) b!919601))

(assert (= (and b!919601 res!619771) b!919610))

(assert (= (and b!919610 res!619766) b!919611))

(assert (= (and b!919611 res!619770) b!919606))

(assert (= (and b!919606 res!619773) b!919613))

(assert (= (and b!919612 condMapEmpty!30954) mapIsEmpty!30954))

(assert (= (and b!919612 (not condMapEmpty!30954)) mapNonEmpty!30954))

(get-info :version)

(assert (= (and mapNonEmpty!30954 ((_ is ValueCellFull!9251) mapValue!30954)) b!919604))

(assert (= (and b!919612 ((_ is ValueCellFull!9251) mapDefault!30954)) b!919603))

(assert (= start!78912 b!919612))

(declare-fun b_lambda!13473 () Bool)

(assert (=> (not b_lambda!13473) (not b!919613)))

(declare-fun t!26181 () Bool)

(declare-fun tb!5529 () Bool)

(assert (=> (and start!78912 (= defaultEntry!1235 defaultEntry!1235) t!26181) tb!5529))

(declare-fun result!10889 () Bool)

(assert (=> tb!5529 (= result!10889 tp_is_empty!19465)))

(assert (=> b!919613 t!26181))

(declare-fun b_and!27663 () Bool)

(assert (= b_and!27661 (and (=> t!26181 result!10889) b_and!27663)))

(declare-fun m!853681 () Bool)

(assert (=> b!919607 m!853681))

(declare-fun m!853683 () Bool)

(assert (=> b!919605 m!853683))

(declare-fun m!853685 () Bool)

(assert (=> b!919613 m!853685))

(declare-fun m!853687 () Bool)

(assert (=> b!919613 m!853687))

(declare-fun m!853689 () Bool)

(assert (=> b!919613 m!853689))

(declare-fun m!853691 () Bool)

(assert (=> b!919613 m!853691))

(declare-fun m!853693 () Bool)

(assert (=> b!919613 m!853693))

(declare-fun m!853695 () Bool)

(assert (=> b!919613 m!853695))

(assert (=> b!919613 m!853693))

(assert (=> b!919613 m!853695))

(declare-fun m!853697 () Bool)

(assert (=> b!919613 m!853697))

(declare-fun m!853699 () Bool)

(assert (=> b!919613 m!853699))

(assert (=> b!919613 m!853691))

(declare-fun m!853701 () Bool)

(assert (=> b!919613 m!853701))

(assert (=> b!919613 m!853685))

(declare-fun m!853703 () Bool)

(assert (=> b!919613 m!853703))

(declare-fun m!853705 () Bool)

(assert (=> mapNonEmpty!30954 m!853705))

(declare-fun m!853707 () Bool)

(assert (=> start!78912 m!853707))

(declare-fun m!853709 () Bool)

(assert (=> start!78912 m!853709))

(declare-fun m!853711 () Bool)

(assert (=> start!78912 m!853711))

(declare-fun m!853713 () Bool)

(assert (=> b!919601 m!853713))

(declare-fun m!853715 () Bool)

(assert (=> b!919606 m!853715))

(declare-fun m!853717 () Bool)

(assert (=> b!919606 m!853717))

(declare-fun m!853719 () Bool)

(assert (=> b!919602 m!853719))

(declare-fun m!853721 () Bool)

(assert (=> b!919602 m!853721))

(declare-fun m!853723 () Bool)

(assert (=> b!919611 m!853723))

(check-sat (not b_next!16957) (not b!919607) (not b!919602) (not b!919601) (not start!78912) tp_is_empty!19465 (not b!919606) b_and!27663 (not mapNonEmpty!30954) (not b!919613) (not b!919605) (not b!919611) (not b_lambda!13473))
(check-sat b_and!27663 (not b_next!16957))
