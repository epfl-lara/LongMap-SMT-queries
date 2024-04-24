; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83550 () Bool)

(assert start!83550)

(declare-fun b_free!19375 () Bool)

(declare-fun b_next!19375 () Bool)

(assert (=> start!83550 (= b_free!19375 (not b_next!19375))))

(declare-fun tp!67405 () Bool)

(declare-fun b_and!30981 () Bool)

(assert (=> start!83550 (= tp!67405 b_and!30981)))

(declare-fun mapIsEmpty!35419 () Bool)

(declare-fun mapRes!35419 () Bool)

(assert (=> mapIsEmpty!35419 mapRes!35419))

(declare-fun b!974604 () Bool)

(declare-fun e!549431 () Bool)

(declare-fun tp_is_empty!22273 () Bool)

(assert (=> b!974604 (= e!549431 tp_is_empty!22273)))

(declare-fun res!652120 () Bool)

(declare-fun e!549430 () Bool)

(assert (=> start!83550 (=> (not res!652120) (not e!549430))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83550 (= res!652120 (validMask!0 mask!2147))))

(assert (=> start!83550 e!549430))

(assert (=> start!83550 true))

(declare-datatypes ((V!34681 0))(
  ( (V!34682 (val!11187 Int)) )
))
(declare-datatypes ((ValueCell!10655 0))(
  ( (ValueCellFull!10655 (v!13743 V!34681)) (EmptyCell!10655) )
))
(declare-datatypes ((array!60618 0))(
  ( (array!60619 (arr!29168 (Array (_ BitVec 32) ValueCell!10655)) (size!29648 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60618)

(declare-fun e!549436 () Bool)

(declare-fun array_inv!22615 (array!60618) Bool)

(assert (=> start!83550 (and (array_inv!22615 _values!1425) e!549436)))

(assert (=> start!83550 tp_is_empty!22273))

(assert (=> start!83550 tp!67405))

(declare-datatypes ((array!60620 0))(
  ( (array!60621 (arr!29169 (Array (_ BitVec 32) (_ BitVec 64))) (size!29649 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60620)

(declare-fun array_inv!22616 (array!60620) Bool)

(assert (=> start!83550 (array_inv!22616 _keys!1717)))

(declare-fun b!974605 () Bool)

(declare-fun res!652119 () Bool)

(assert (=> b!974605 (=> (not res!652119) (not e!549430))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60620 (_ BitVec 32)) Bool)

(assert (=> b!974605 (= res!652119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974606 () Bool)

(declare-fun e!549434 () Bool)

(assert (=> b!974606 (= e!549434 tp_is_empty!22273)))

(declare-fun b!974607 () Bool)

(declare-fun e!549433 () Bool)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!974607 (= e!549433 (not (bvsle (bvsub from!2118 #b00000000000000000000000000000001) (size!29649 _keys!1717))))))

(declare-datatypes ((tuple2!14372 0))(
  ( (tuple2!14373 (_1!7197 (_ BitVec 64)) (_2!7197 V!34681)) )
))
(declare-datatypes ((List!20220 0))(
  ( (Nil!20217) (Cons!20216 (h!21384 tuple2!14372) (t!28685 List!20220)) )
))
(declare-datatypes ((ListLongMap!13071 0))(
  ( (ListLongMap!13072 (toList!6551 List!20220)) )
))
(declare-fun lt!433019 () ListLongMap!13071)

(declare-fun lt!433022 () tuple2!14372)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5657 (ListLongMap!13071 (_ BitVec 64)) Bool)

(declare-fun +!2923 (ListLongMap!13071 tuple2!14372) ListLongMap!13071)

(assert (=> b!974607 (contains!5657 (+!2923 lt!433019 lt!433022) (select (arr!29169 _keys!1717) i!822))))

(declare-fun lt!433020 () (_ BitVec 64))

(declare-fun lt!433018 () V!34681)

(declare-datatypes ((Unit!32410 0))(
  ( (Unit!32411) )
))
(declare-fun lt!433021 () Unit!32410)

(declare-fun addStillContains!605 (ListLongMap!13071 (_ BitVec 64) V!34681 (_ BitVec 64)) Unit!32410)

(assert (=> b!974607 (= lt!433021 (addStillContains!605 lt!433019 lt!433020 lt!433018 (select (arr!29169 _keys!1717) i!822)))))

(declare-fun lt!433017 () ListLongMap!13071)

(declare-fun zeroValue!1367 () V!34681)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34681)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3784 (array!60620 array!60618 (_ BitVec 32) (_ BitVec 32) V!34681 V!34681 (_ BitVec 32) Int) ListLongMap!13071)

(assert (=> b!974607 (= lt!433017 (+!2923 (getCurrentListMap!3784 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!433022))))

(assert (=> b!974607 (= lt!433022 (tuple2!14373 lt!433020 lt!433018))))

(declare-fun get!15140 (ValueCell!10655 V!34681) V!34681)

(declare-fun dynLambda!1720 (Int (_ BitVec 64)) V!34681)

(assert (=> b!974607 (= lt!433018 (get!15140 (select (arr!29168 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1720 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!433023 () Unit!32410)

(declare-fun lemmaListMapRecursiveValidKeyArray!279 (array!60620 array!60618 (_ BitVec 32) (_ BitVec 32) V!34681 V!34681 (_ BitVec 32) Int) Unit!32410)

(assert (=> b!974607 (= lt!433023 (lemmaListMapRecursiveValidKeyArray!279 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974608 () Bool)

(declare-fun res!652124 () Bool)

(assert (=> b!974608 (=> (not res!652124) (not e!549430))))

(declare-datatypes ((List!20221 0))(
  ( (Nil!20218) (Cons!20217 (h!21385 (_ BitVec 64)) (t!28686 List!20221)) )
))
(declare-fun arrayNoDuplicates!0 (array!60620 (_ BitVec 32) List!20221) Bool)

(assert (=> b!974608 (= res!652124 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20218))))

(declare-fun b!974609 () Bool)

(assert (=> b!974609 (= e!549436 (and e!549434 mapRes!35419))))

(declare-fun condMapEmpty!35419 () Bool)

(declare-fun mapDefault!35419 () ValueCell!10655)

(assert (=> b!974609 (= condMapEmpty!35419 (= (arr!29168 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10655)) mapDefault!35419)))))

(declare-fun b!974610 () Bool)

(declare-fun res!652117 () Bool)

(assert (=> b!974610 (=> (not res!652117) (not e!549430))))

(assert (=> b!974610 (= res!652117 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29649 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29649 _keys!1717))))))

(declare-fun mapNonEmpty!35419 () Bool)

(declare-fun tp!67404 () Bool)

(assert (=> mapNonEmpty!35419 (= mapRes!35419 (and tp!67404 e!549431))))

(declare-fun mapKey!35419 () (_ BitVec 32))

(declare-fun mapValue!35419 () ValueCell!10655)

(declare-fun mapRest!35419 () (Array (_ BitVec 32) ValueCell!10655))

(assert (=> mapNonEmpty!35419 (= (arr!29168 _values!1425) (store mapRest!35419 mapKey!35419 mapValue!35419))))

(declare-fun b!974611 () Bool)

(declare-fun res!652118 () Bool)

(assert (=> b!974611 (=> (not res!652118) (not e!549430))))

(assert (=> b!974611 (= res!652118 (and (= (size!29648 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29649 _keys!1717) (size!29648 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974612 () Bool)

(declare-fun e!549432 () Bool)

(assert (=> b!974612 (= e!549432 e!549433)))

(declare-fun res!652123 () Bool)

(assert (=> b!974612 (=> (not res!652123) (not e!549433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974612 (= res!652123 (validKeyInArray!0 lt!433020))))

(assert (=> b!974612 (= lt!433020 (select (arr!29169 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!974612 (= lt!433017 (getCurrentListMap!3784 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974613 () Bool)

(declare-fun res!652121 () Bool)

(assert (=> b!974613 (=> (not res!652121) (not e!549430))))

(assert (=> b!974613 (= res!652121 (validKeyInArray!0 (select (arr!29169 _keys!1717) i!822)))))

(declare-fun b!974614 () Bool)

(assert (=> b!974614 (= e!549430 e!549432)))

(declare-fun res!652122 () Bool)

(assert (=> b!974614 (=> (not res!652122) (not e!549432))))

(assert (=> b!974614 (= res!652122 (contains!5657 lt!433019 (select (arr!29169 _keys!1717) i!822)))))

(assert (=> b!974614 (= lt!433019 (getCurrentListMap!3784 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(assert (= (and start!83550 res!652120) b!974611))

(assert (= (and b!974611 res!652118) b!974605))

(assert (= (and b!974605 res!652119) b!974608))

(assert (= (and b!974608 res!652124) b!974610))

(assert (= (and b!974610 res!652117) b!974613))

(assert (= (and b!974613 res!652121) b!974614))

(assert (= (and b!974614 res!652122) b!974612))

(assert (= (and b!974612 res!652123) b!974607))

(assert (= (and b!974609 condMapEmpty!35419) mapIsEmpty!35419))

(assert (= (and b!974609 (not condMapEmpty!35419)) mapNonEmpty!35419))

(get-info :version)

(assert (= (and mapNonEmpty!35419 ((_ is ValueCellFull!10655) mapValue!35419)) b!974604))

(assert (= (and b!974609 ((_ is ValueCellFull!10655) mapDefault!35419)) b!974606))

(assert (= start!83550 b!974609))

(declare-fun b_lambda!14553 () Bool)

(assert (=> (not b_lambda!14553) (not b!974607)))

(declare-fun t!28684 () Bool)

(declare-fun tb!6315 () Bool)

(assert (=> (and start!83550 (= defaultEntry!1428 defaultEntry!1428) t!28684) tb!6315))

(declare-fun result!12615 () Bool)

(assert (=> tb!6315 (= result!12615 tp_is_empty!22273)))

(assert (=> b!974607 t!28684))

(declare-fun b_and!30983 () Bool)

(assert (= b_and!30981 (and (=> t!28684 result!12615) b_and!30983)))

(declare-fun m!902657 () Bool)

(assert (=> b!974607 m!902657))

(declare-fun m!902659 () Bool)

(assert (=> b!974607 m!902659))

(declare-fun m!902661 () Bool)

(assert (=> b!974607 m!902661))

(declare-fun m!902663 () Bool)

(assert (=> b!974607 m!902663))

(declare-fun m!902665 () Bool)

(assert (=> b!974607 m!902665))

(assert (=> b!974607 m!902659))

(assert (=> b!974607 m!902665))

(declare-fun m!902667 () Bool)

(assert (=> b!974607 m!902667))

(assert (=> b!974607 m!902661))

(assert (=> b!974607 m!902657))

(declare-fun m!902669 () Bool)

(assert (=> b!974607 m!902669))

(declare-fun m!902671 () Bool)

(assert (=> b!974607 m!902671))

(declare-fun m!902673 () Bool)

(assert (=> b!974607 m!902673))

(assert (=> b!974607 m!902661))

(declare-fun m!902675 () Bool)

(assert (=> b!974607 m!902675))

(assert (=> b!974607 m!902669))

(declare-fun m!902677 () Bool)

(assert (=> start!83550 m!902677))

(declare-fun m!902679 () Bool)

(assert (=> start!83550 m!902679))

(declare-fun m!902681 () Bool)

(assert (=> start!83550 m!902681))

(declare-fun m!902683 () Bool)

(assert (=> b!974612 m!902683))

(declare-fun m!902685 () Bool)

(assert (=> b!974612 m!902685))

(declare-fun m!902687 () Bool)

(assert (=> b!974612 m!902687))

(declare-fun m!902689 () Bool)

(assert (=> mapNonEmpty!35419 m!902689))

(assert (=> b!974613 m!902661))

(assert (=> b!974613 m!902661))

(declare-fun m!902691 () Bool)

(assert (=> b!974613 m!902691))

(declare-fun m!902693 () Bool)

(assert (=> b!974605 m!902693))

(declare-fun m!902695 () Bool)

(assert (=> b!974608 m!902695))

(assert (=> b!974614 m!902661))

(assert (=> b!974614 m!902661))

(declare-fun m!902697 () Bool)

(assert (=> b!974614 m!902697))

(declare-fun m!902699 () Bool)

(assert (=> b!974614 m!902699))

(check-sat (not b_next!19375) (not b!974608) (not b!974607) (not b_lambda!14553) (not b!974613) b_and!30983 tp_is_empty!22273 (not b!974612) (not start!83550) (not mapNonEmpty!35419) (not b!974614) (not b!974605))
(check-sat b_and!30983 (not b_next!19375))
