; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79014 () Bool)

(assert start!79014)

(declare-fun b_free!17245 () Bool)

(declare-fun b_next!17245 () Bool)

(assert (=> start!79014 (= b_free!17245 (not b_next!17245))))

(declare-fun tp!60176 () Bool)

(declare-fun b_and!28201 () Bool)

(assert (=> start!79014 (= tp!60176 b_and!28201)))

(declare-fun b!925773 () Bool)

(declare-datatypes ((Unit!31205 0))(
  ( (Unit!31206) )
))
(declare-fun e!519616 () Unit!31205)

(declare-fun Unit!31207 () Unit!31205)

(assert (=> b!925773 (= e!519616 Unit!31207)))

(declare-fun b!925774 () Bool)

(declare-fun e!519612 () Bool)

(declare-fun tp_is_empty!19753 () Bool)

(assert (=> b!925774 (= e!519612 tp_is_empty!19753)))

(declare-fun b!925775 () Bool)

(declare-fun e!519624 () Bool)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!925775 (= e!519624 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!925776 () Bool)

(declare-fun res!623828 () Bool)

(declare-fun e!519619 () Bool)

(assert (=> b!925776 (=> (not res!623828) (not e!519619))))

(declare-datatypes ((array!55447 0))(
  ( (array!55448 (arr!26669 (Array (_ BitVec 32) (_ BitVec 64))) (size!27130 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55447)

(declare-datatypes ((List!18781 0))(
  ( (Nil!18778) (Cons!18777 (h!19923 (_ BitVec 64)) (t!26747 List!18781)) )
))
(declare-fun arrayNoDuplicates!0 (array!55447 (_ BitVec 32) List!18781) Bool)

(assert (=> b!925776 (= res!623828 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18778))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun b!925777 () Bool)

(declare-fun arrayContainsKey!0 (array!55447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!925777 (= e!519624 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!925778 () Bool)

(declare-fun e!519621 () Unit!31205)

(assert (=> b!925778 (= e!519616 e!519621)))

(declare-fun lt!416675 () (_ BitVec 64))

(assert (=> b!925778 (= lt!416675 (select (arr!26669 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96598 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!925778 (= c!96598 (validKeyInArray!0 lt!416675))))

(declare-fun b!925779 () Bool)

(declare-fun e!519615 () Bool)

(assert (=> b!925779 (= e!519615 tp_is_empty!19753)))

(declare-fun b!925780 () Bool)

(declare-fun res!623822 () Bool)

(declare-fun e!519614 () Bool)

(assert (=> b!925780 (=> (not res!623822) (not e!519614))))

(declare-datatypes ((V!31303 0))(
  ( (V!31304 (val!9927 Int)) )
))
(declare-fun v!791 () V!31303)

(declare-datatypes ((tuple2!13008 0))(
  ( (tuple2!13009 (_1!6515 (_ BitVec 64)) (_2!6515 V!31303)) )
))
(declare-datatypes ((List!18782 0))(
  ( (Nil!18779) (Cons!18778 (h!19924 tuple2!13008) (t!26748 List!18782)) )
))
(declare-datatypes ((ListLongMap!11695 0))(
  ( (ListLongMap!11696 (toList!5863 List!18782)) )
))
(declare-fun lt!416682 () ListLongMap!11695)

(declare-fun apply!674 (ListLongMap!11695 (_ BitVec 64)) V!31303)

(assert (=> b!925780 (= res!623822 (= (apply!674 lt!416682 k0!1099) v!791))))

(declare-fun lt!416671 () ListLongMap!11695)

(declare-fun e!519618 () Bool)

(declare-fun b!925781 () Bool)

(assert (=> b!925781 (= e!519618 (= (apply!674 lt!416671 k0!1099) v!791))))

(declare-fun res!623823 () Bool)

(assert (=> start!79014 (=> (not res!623823) (not e!519619))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79014 (= res!623823 (validMask!0 mask!1881))))

(assert (=> start!79014 e!519619))

(assert (=> start!79014 true))

(assert (=> start!79014 tp_is_empty!19753))

(declare-datatypes ((ValueCell!9395 0))(
  ( (ValueCellFull!9395 (v!12444 V!31303)) (EmptyCell!9395) )
))
(declare-datatypes ((array!55449 0))(
  ( (array!55450 (arr!26670 (Array (_ BitVec 32) ValueCell!9395)) (size!27131 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55449)

(declare-fun e!519617 () Bool)

(declare-fun array_inv!20854 (array!55449) Bool)

(assert (=> start!79014 (and (array_inv!20854 _values!1231) e!519617)))

(assert (=> start!79014 tp!60176))

(declare-fun array_inv!20855 (array!55447) Bool)

(assert (=> start!79014 (array_inv!20855 _keys!1487)))

(declare-fun b!925772 () Bool)

(declare-fun e!519613 () Bool)

(declare-fun e!519623 () Bool)

(assert (=> b!925772 (= e!519613 e!519623)))

(declare-fun res!623830 () Bool)

(assert (=> b!925772 (=> (not res!623830) (not e!519623))))

(assert (=> b!925772 (= res!623830 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27130 _keys!1487)))))

(declare-fun lt!416681 () Unit!31205)

(assert (=> b!925772 (= lt!416681 e!519616)))

(declare-fun c!96597 () Bool)

(assert (=> b!925772 (= c!96597 (validKeyInArray!0 k0!1099))))

(declare-fun b!925782 () Bool)

(declare-fun Unit!31208 () Unit!31205)

(assert (=> b!925782 (= e!519621 Unit!31208)))

(declare-fun b!925783 () Bool)

(declare-fun e!519620 () Bool)

(assert (=> b!925783 (= e!519620 e!519613)))

(declare-fun res!623824 () Bool)

(assert (=> b!925783 (=> (not res!623824) (not e!519613))))

(declare-fun lt!416670 () V!31303)

(assert (=> b!925783 (= res!623824 (and (= lt!416670 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!416679 () ListLongMap!11695)

(assert (=> b!925783 (= lt!416670 (apply!674 lt!416679 k0!1099))))

(declare-fun b!925784 () Bool)

(assert (=> b!925784 (= e!519623 e!519614)))

(declare-fun res!623829 () Bool)

(assert (=> b!925784 (=> (not res!623829) (not e!519614))))

(declare-fun contains!4875 (ListLongMap!11695 (_ BitVec 64)) Bool)

(assert (=> b!925784 (= res!623829 (contains!4875 lt!416682 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31303)

(declare-fun minValue!1173 () V!31303)

(declare-fun getCurrentListMap!3049 (array!55447 array!55449 (_ BitVec 32) (_ BitVec 32) V!31303 V!31303 (_ BitVec 32) Int) ListLongMap!11695)

(assert (=> b!925784 (= lt!416682 (getCurrentListMap!3049 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925785 () Bool)

(declare-fun mapRes!31386 () Bool)

(assert (=> b!925785 (= e!519617 (and e!519615 mapRes!31386))))

(declare-fun condMapEmpty!31386 () Bool)

(declare-fun mapDefault!31386 () ValueCell!9395)

(assert (=> b!925785 (= condMapEmpty!31386 (= (arr!26670 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9395)) mapDefault!31386)))))

(declare-fun mapNonEmpty!31386 () Bool)

(declare-fun tp!60177 () Bool)

(assert (=> mapNonEmpty!31386 (= mapRes!31386 (and tp!60177 e!519612))))

(declare-fun mapRest!31386 () (Array (_ BitVec 32) ValueCell!9395))

(declare-fun mapKey!31386 () (_ BitVec 32))

(declare-fun mapValue!31386 () ValueCell!9395)

(assert (=> mapNonEmpty!31386 (= (arr!26670 _values!1231) (store mapRest!31386 mapKey!31386 mapValue!31386))))

(declare-fun b!925786 () Bool)

(declare-fun res!623826 () Bool)

(assert (=> b!925786 (=> (not res!623826) (not e!519619))))

(assert (=> b!925786 (= res!623826 (and (= (size!27131 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27130 _keys!1487) (size!27131 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!925787 () Bool)

(assert (=> b!925787 (= e!519614 (not true))))

(assert (=> b!925787 e!519618))

(declare-fun res!623825 () Bool)

(assert (=> b!925787 (=> (not res!623825) (not e!519618))))

(assert (=> b!925787 (= res!623825 (contains!4875 lt!416671 k0!1099))))

(assert (=> b!925787 (= lt!416671 (getCurrentListMap!3049 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun lt!416669 () Unit!31205)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!82 (array!55447 array!55449 (_ BitVec 32) (_ BitVec 32) V!31303 V!31303 (_ BitVec 64) V!31303 (_ BitVec 32) Int) Unit!31205)

(assert (=> b!925787 (= lt!416669 (lemmaListMapApplyFromThenApplyFromZero!82 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!925788 () Bool)

(declare-fun res!623821 () Bool)

(assert (=> b!925788 (=> (not res!623821) (not e!519619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55447 (_ BitVec 32)) Bool)

(assert (=> b!925788 (= res!623821 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!925789 () Bool)

(assert (=> b!925789 (= e!519619 e!519620)))

(declare-fun res!623831 () Bool)

(assert (=> b!925789 (=> (not res!623831) (not e!519620))))

(assert (=> b!925789 (= res!623831 (contains!4875 lt!416679 k0!1099))))

(assert (=> b!925789 (= lt!416679 (getCurrentListMap!3049 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!925790 () Bool)

(declare-fun lt!416683 () ListLongMap!11695)

(assert (=> b!925790 (= (apply!674 lt!416683 k0!1099) lt!416670)))

(declare-fun lt!416677 () Unit!31205)

(declare-fun lt!416678 () V!31303)

(declare-fun addApplyDifferent!384 (ListLongMap!11695 (_ BitVec 64) V!31303 (_ BitVec 64)) Unit!31205)

(assert (=> b!925790 (= lt!416677 (addApplyDifferent!384 lt!416679 lt!416675 lt!416678 k0!1099))))

(assert (=> b!925790 (not (= lt!416675 k0!1099))))

(declare-fun lt!416684 () Unit!31205)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55447 (_ BitVec 64) (_ BitVec 32) List!18781) Unit!31205)

(assert (=> b!925790 (= lt!416684 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18778))))

(assert (=> b!925790 e!519624))

(declare-fun c!96596 () Bool)

(assert (=> b!925790 (= c!96596 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!416672 () Unit!31205)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!244 (array!55447 array!55449 (_ BitVec 32) (_ BitVec 32) V!31303 V!31303 (_ BitVec 64) (_ BitVec 32) Int) Unit!31205)

(assert (=> b!925790 (= lt!416672 (lemmaListMapContainsThenArrayContainsFrom!244 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!925790 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18778)))

(declare-fun lt!416674 () Unit!31205)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55447 (_ BitVec 32) (_ BitVec 32)) Unit!31205)

(assert (=> b!925790 (= lt!416674 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!925790 (contains!4875 lt!416683 k0!1099)))

(declare-fun lt!416680 () tuple2!13008)

(declare-fun +!2756 (ListLongMap!11695 tuple2!13008) ListLongMap!11695)

(assert (=> b!925790 (= lt!416683 (+!2756 lt!416679 lt!416680))))

(declare-fun lt!416673 () Unit!31205)

(declare-fun addStillContains!453 (ListLongMap!11695 (_ BitVec 64) V!31303 (_ BitVec 64)) Unit!31205)

(assert (=> b!925790 (= lt!416673 (addStillContains!453 lt!416679 lt!416675 lt!416678 k0!1099))))

(assert (=> b!925790 (= (getCurrentListMap!3049 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2756 (getCurrentListMap!3049 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!416680))))

(assert (=> b!925790 (= lt!416680 (tuple2!13009 lt!416675 lt!416678))))

(declare-fun get!14033 (ValueCell!9395 V!31303) V!31303)

(declare-fun dynLambda!1512 (Int (_ BitVec 64)) V!31303)

(assert (=> b!925790 (= lt!416678 (get!14033 (select (arr!26670 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1512 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!416676 () Unit!31205)

(declare-fun lemmaListMapRecursiveValidKeyArray!120 (array!55447 array!55449 (_ BitVec 32) (_ BitVec 32) V!31303 V!31303 (_ BitVec 32) Int) Unit!31205)

(assert (=> b!925790 (= lt!416676 (lemmaListMapRecursiveValidKeyArray!120 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!925790 (= e!519621 lt!416677)))

(declare-fun mapIsEmpty!31386 () Bool)

(assert (=> mapIsEmpty!31386 mapRes!31386))

(declare-fun b!925791 () Bool)

(declare-fun res!623827 () Bool)

(assert (=> b!925791 (=> (not res!623827) (not e!519619))))

(assert (=> b!925791 (= res!623827 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27130 _keys!1487))))))

(assert (= (and start!79014 res!623823) b!925786))

(assert (= (and b!925786 res!623826) b!925788))

(assert (= (and b!925788 res!623821) b!925776))

(assert (= (and b!925776 res!623828) b!925791))

(assert (= (and b!925791 res!623827) b!925789))

(assert (= (and b!925789 res!623831) b!925783))

(assert (= (and b!925783 res!623824) b!925772))

(assert (= (and b!925772 c!96597) b!925778))

(assert (= (and b!925772 (not c!96597)) b!925773))

(assert (= (and b!925778 c!96598) b!925790))

(assert (= (and b!925778 (not c!96598)) b!925782))

(assert (= (and b!925790 c!96596) b!925777))

(assert (= (and b!925790 (not c!96596)) b!925775))

(assert (= (and b!925772 res!623830) b!925784))

(assert (= (and b!925784 res!623829) b!925780))

(assert (= (and b!925780 res!623822) b!925787))

(assert (= (and b!925787 res!623825) b!925781))

(assert (= (and b!925785 condMapEmpty!31386) mapIsEmpty!31386))

(assert (= (and b!925785 (not condMapEmpty!31386)) mapNonEmpty!31386))

(get-info :version)

(assert (= (and mapNonEmpty!31386 ((_ is ValueCellFull!9395) mapValue!31386)) b!925774))

(assert (= (and b!925785 ((_ is ValueCellFull!9395) mapDefault!31386)) b!925779))

(assert (= start!79014 b!925785))

(declare-fun b_lambda!13729 () Bool)

(assert (=> (not b_lambda!13729) (not b!925790)))

(declare-fun t!26746 () Bool)

(declare-fun tb!5817 () Bool)

(assert (=> (and start!79014 (= defaultEntry!1235 defaultEntry!1235) t!26746) tb!5817))

(declare-fun result!11465 () Bool)

(assert (=> tb!5817 (= result!11465 tp_is_empty!19753)))

(assert (=> b!925790 t!26746))

(declare-fun b_and!28203 () Bool)

(assert (= b_and!28201 (and (=> t!26746 result!11465) b_and!28203)))

(declare-fun m!859747 () Bool)

(assert (=> b!925776 m!859747))

(declare-fun m!859749 () Bool)

(assert (=> b!925772 m!859749))

(declare-fun m!859751 () Bool)

(assert (=> b!925777 m!859751))

(declare-fun m!859753 () Bool)

(assert (=> start!79014 m!859753))

(declare-fun m!859755 () Bool)

(assert (=> start!79014 m!859755))

(declare-fun m!859757 () Bool)

(assert (=> start!79014 m!859757))

(declare-fun m!859759 () Bool)

(assert (=> b!925784 m!859759))

(declare-fun m!859761 () Bool)

(assert (=> b!925784 m!859761))

(declare-fun m!859763 () Bool)

(assert (=> mapNonEmpty!31386 m!859763))

(declare-fun m!859765 () Bool)

(assert (=> b!925789 m!859765))

(declare-fun m!859767 () Bool)

(assert (=> b!925789 m!859767))

(declare-fun m!859769 () Bool)

(assert (=> b!925788 m!859769))

(declare-fun m!859771 () Bool)

(assert (=> b!925778 m!859771))

(declare-fun m!859773 () Bool)

(assert (=> b!925778 m!859773))

(declare-fun m!859775 () Bool)

(assert (=> b!925783 m!859775))

(declare-fun m!859777 () Bool)

(assert (=> b!925790 m!859777))

(declare-fun m!859779 () Bool)

(assert (=> b!925790 m!859779))

(declare-fun m!859781 () Bool)

(assert (=> b!925790 m!859781))

(declare-fun m!859783 () Bool)

(assert (=> b!925790 m!859783))

(assert (=> b!925790 m!859781))

(declare-fun m!859785 () Bool)

(assert (=> b!925790 m!859785))

(assert (=> b!925790 m!859761))

(declare-fun m!859787 () Bool)

(assert (=> b!925790 m!859787))

(declare-fun m!859789 () Bool)

(assert (=> b!925790 m!859789))

(declare-fun m!859791 () Bool)

(assert (=> b!925790 m!859791))

(declare-fun m!859793 () Bool)

(assert (=> b!925790 m!859793))

(declare-fun m!859795 () Bool)

(assert (=> b!925790 m!859795))

(declare-fun m!859797 () Bool)

(assert (=> b!925790 m!859797))

(assert (=> b!925790 m!859783))

(declare-fun m!859799 () Bool)

(assert (=> b!925790 m!859799))

(assert (=> b!925790 m!859787))

(declare-fun m!859801 () Bool)

(assert (=> b!925790 m!859801))

(declare-fun m!859803 () Bool)

(assert (=> b!925790 m!859803))

(declare-fun m!859805 () Bool)

(assert (=> b!925790 m!859805))

(declare-fun m!859807 () Bool)

(assert (=> b!925781 m!859807))

(declare-fun m!859809 () Bool)

(assert (=> b!925780 m!859809))

(declare-fun m!859811 () Bool)

(assert (=> b!925787 m!859811))

(declare-fun m!859813 () Bool)

(assert (=> b!925787 m!859813))

(declare-fun m!859815 () Bool)

(assert (=> b!925787 m!859815))

(check-sat (not b_lambda!13729) (not b!925784) (not start!79014) (not b!925789) (not b!925780) (not b!925783) (not b!925776) tp_is_empty!19753 (not mapNonEmpty!31386) (not b!925790) b_and!28203 (not b!925788) (not b!925787) (not b!925777) (not b!925772) (not b!925781) (not b!925778) (not b_next!17245))
(check-sat b_and!28203 (not b_next!17245))
