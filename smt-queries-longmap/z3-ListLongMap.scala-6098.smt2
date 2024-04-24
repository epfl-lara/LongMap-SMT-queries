; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78864 () Bool)

(assert start!78864)

(declare-fun b_free!16909 () Bool)

(declare-fun b_next!16909 () Bool)

(assert (=> start!78864 (= b_free!16909 (not b_next!16909))))

(declare-fun tp!59169 () Bool)

(declare-fun b_and!27565 () Bool)

(assert (=> start!78864 (= tp!59169 b_and!27565)))

(declare-fun b!918617 () Bool)

(declare-fun res!619052 () Bool)

(declare-fun e!515786 () Bool)

(assert (=> b!918617 (=> (not res!619052) (not e!515786))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54865 0))(
  ( (array!54866 (arr!26373 (Array (_ BitVec 32) (_ BitVec 64))) (size!26833 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54865)

(assert (=> b!918617 (= res!619052 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26833 _keys!1487))))))

(declare-fun b!918618 () Bool)

(declare-fun res!619046 () Bool)

(declare-fun e!515790 () Bool)

(assert (=> b!918618 (=> (not res!619046) (not e!515790))))

(assert (=> b!918618 (= res!619046 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918619 () Bool)

(declare-fun e!515787 () Bool)

(declare-fun e!515791 () Bool)

(declare-fun mapRes!30882 () Bool)

(assert (=> b!918619 (= e!515787 (and e!515791 mapRes!30882))))

(declare-fun condMapEmpty!30882 () Bool)

(declare-datatypes ((V!30855 0))(
  ( (V!30856 (val!9759 Int)) )
))
(declare-datatypes ((ValueCell!9227 0))(
  ( (ValueCellFull!9227 (v!12274 V!30855)) (EmptyCell!9227) )
))
(declare-datatypes ((array!54867 0))(
  ( (array!54868 (arr!26374 (Array (_ BitVec 32) ValueCell!9227)) (size!26834 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54867)

(declare-fun mapDefault!30882 () ValueCell!9227)

(assert (=> b!918619 (= condMapEmpty!30882 (= (arr!26374 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9227)) mapDefault!30882)))))

(declare-fun b!918620 () Bool)

(assert (=> b!918620 (= e!515786 e!515790)))

(declare-fun res!619048 () Bool)

(assert (=> b!918620 (=> (not res!619048) (not e!515790))))

(declare-datatypes ((tuple2!12638 0))(
  ( (tuple2!12639 (_1!6330 (_ BitVec 64)) (_2!6330 V!30855)) )
))
(declare-datatypes ((List!18461 0))(
  ( (Nil!18458) (Cons!18457 (h!19609 tuple2!12638) (t!26092 List!18461)) )
))
(declare-datatypes ((ListLongMap!11337 0))(
  ( (ListLongMap!11338 (toList!5684 List!18461)) )
))
(declare-fun lt!412434 () ListLongMap!11337)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4741 (ListLongMap!11337 (_ BitVec 64)) Bool)

(assert (=> b!918620 (= res!619048 (contains!4741 lt!412434 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30855)

(declare-fun minValue!1173 () V!30855)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!2939 (array!54865 array!54867 (_ BitVec 32) (_ BitVec 32) V!30855 V!30855 (_ BitVec 32) Int) ListLongMap!11337)

(assert (=> b!918620 (= lt!412434 (getCurrentListMap!2939 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!918621 () Bool)

(declare-fun tp_is_empty!19417 () Bool)

(assert (=> b!918621 (= e!515791 tp_is_empty!19417)))

(declare-fun mapIsEmpty!30882 () Bool)

(assert (=> mapIsEmpty!30882 mapRes!30882))

(declare-fun b!918623 () Bool)

(declare-fun e!515788 () Bool)

(assert (=> b!918623 (= e!515788 tp_is_empty!19417)))

(declare-fun b!918624 () Bool)

(declare-fun e!515785 () Bool)

(assert (=> b!918624 (= e!515785 (not true))))

(declare-fun lt!412436 () (_ BitVec 64))

(declare-fun +!2629 (ListLongMap!11337 tuple2!12638) ListLongMap!11337)

(declare-fun get!13834 (ValueCell!9227 V!30855) V!30855)

(declare-fun dynLambda!1426 (Int (_ BitVec 64)) V!30855)

(assert (=> b!918624 (= (getCurrentListMap!2939 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2629 (getCurrentListMap!2939 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12639 lt!412436 (get!13834 (select (arr!26374 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1426 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30970 0))(
  ( (Unit!30971) )
))
(declare-fun lt!412435 () Unit!30970)

(declare-fun lemmaListMapRecursiveValidKeyArray!9 (array!54865 array!54867 (_ BitVec 32) (_ BitVec 32) V!30855 V!30855 (_ BitVec 32) Int) Unit!30970)

(assert (=> b!918624 (= lt!412435 (lemmaListMapRecursiveValidKeyArray!9 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!30882 () Bool)

(declare-fun tp!59168 () Bool)

(assert (=> mapNonEmpty!30882 (= mapRes!30882 (and tp!59168 e!515788))))

(declare-fun mapKey!30882 () (_ BitVec 32))

(declare-fun mapValue!30882 () ValueCell!9227)

(declare-fun mapRest!30882 () (Array (_ BitVec 32) ValueCell!9227))

(assert (=> mapNonEmpty!30882 (= (arr!26374 _values!1231) (store mapRest!30882 mapKey!30882 mapValue!30882))))

(declare-fun res!619051 () Bool)

(assert (=> start!78864 (=> (not res!619051) (not e!515786))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78864 (= res!619051 (validMask!0 mask!1881))))

(assert (=> start!78864 e!515786))

(assert (=> start!78864 true))

(assert (=> start!78864 tp_is_empty!19417))

(declare-fun array_inv!20662 (array!54867) Bool)

(assert (=> start!78864 (and (array_inv!20662 _values!1231) e!515787)))

(assert (=> start!78864 tp!59169))

(declare-fun array_inv!20663 (array!54865) Bool)

(assert (=> start!78864 (array_inv!20663 _keys!1487)))

(declare-fun b!918622 () Bool)

(declare-fun res!619047 () Bool)

(assert (=> b!918622 (=> (not res!619047) (not e!515786))))

(declare-datatypes ((List!18462 0))(
  ( (Nil!18459) (Cons!18458 (h!19610 (_ BitVec 64)) (t!26093 List!18462)) )
))
(declare-fun arrayNoDuplicates!0 (array!54865 (_ BitVec 32) List!18462) Bool)

(assert (=> b!918622 (= res!619047 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18459))))

(declare-fun b!918625 () Bool)

(assert (=> b!918625 (= e!515790 e!515785)))

(declare-fun res!619053 () Bool)

(assert (=> b!918625 (=> (not res!619053) (not e!515785))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918625 (= res!619053 (validKeyInArray!0 lt!412436))))

(assert (=> b!918625 (= lt!412436 (select (arr!26373 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918626 () Bool)

(declare-fun res!619044 () Bool)

(assert (=> b!918626 (=> (not res!619044) (not e!515786))))

(assert (=> b!918626 (= res!619044 (and (= (size!26834 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26833 _keys!1487) (size!26834 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918627 () Bool)

(declare-fun res!619045 () Bool)

(assert (=> b!918627 (=> (not res!619045) (not e!515790))))

(assert (=> b!918627 (= res!619045 (validKeyInArray!0 k0!1099))))

(declare-fun b!918628 () Bool)

(declare-fun res!619050 () Bool)

(assert (=> b!918628 (=> (not res!619050) (not e!515786))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54865 (_ BitVec 32)) Bool)

(assert (=> b!918628 (= res!619050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918629 () Bool)

(declare-fun res!619049 () Bool)

(assert (=> b!918629 (=> (not res!619049) (not e!515790))))

(declare-fun v!791 () V!30855)

(declare-fun apply!564 (ListLongMap!11337 (_ BitVec 64)) V!30855)

(assert (=> b!918629 (= res!619049 (= (apply!564 lt!412434 k0!1099) v!791))))

(assert (= (and start!78864 res!619051) b!918626))

(assert (= (and b!918626 res!619044) b!918628))

(assert (= (and b!918628 res!619050) b!918622))

(assert (= (and b!918622 res!619047) b!918617))

(assert (= (and b!918617 res!619052) b!918620))

(assert (= (and b!918620 res!619048) b!918629))

(assert (= (and b!918629 res!619049) b!918618))

(assert (= (and b!918618 res!619046) b!918627))

(assert (= (and b!918627 res!619045) b!918625))

(assert (= (and b!918625 res!619053) b!918624))

(assert (= (and b!918619 condMapEmpty!30882) mapIsEmpty!30882))

(assert (= (and b!918619 (not condMapEmpty!30882)) mapNonEmpty!30882))

(get-info :version)

(assert (= (and mapNonEmpty!30882 ((_ is ValueCellFull!9227) mapValue!30882)) b!918623))

(assert (= (and b!918619 ((_ is ValueCellFull!9227) mapDefault!30882)) b!918621))

(assert (= start!78864 b!918619))

(declare-fun b_lambda!13425 () Bool)

(assert (=> (not b_lambda!13425) (not b!918624)))

(declare-fun t!26091 () Bool)

(declare-fun tb!5481 () Bool)

(assert (=> (and start!78864 (= defaultEntry!1235 defaultEntry!1235) t!26091) tb!5481))

(declare-fun result!10793 () Bool)

(assert (=> tb!5481 (= result!10793 tp_is_empty!19417)))

(assert (=> b!918624 t!26091))

(declare-fun b_and!27567 () Bool)

(assert (= b_and!27565 (and (=> t!26091 result!10793) b_and!27567)))

(declare-fun m!852733 () Bool)

(assert (=> mapNonEmpty!30882 m!852733))

(declare-fun m!852735 () Bool)

(assert (=> b!918627 m!852735))

(declare-fun m!852737 () Bool)

(assert (=> b!918628 m!852737))

(declare-fun m!852739 () Bool)

(assert (=> b!918629 m!852739))

(declare-fun m!852741 () Bool)

(assert (=> b!918625 m!852741))

(declare-fun m!852743 () Bool)

(assert (=> b!918625 m!852743))

(declare-fun m!852745 () Bool)

(assert (=> b!918624 m!852745))

(declare-fun m!852747 () Bool)

(assert (=> b!918624 m!852747))

(assert (=> b!918624 m!852745))

(assert (=> b!918624 m!852747))

(declare-fun m!852749 () Bool)

(assert (=> b!918624 m!852749))

(declare-fun m!852751 () Bool)

(assert (=> b!918624 m!852751))

(declare-fun m!852753 () Bool)

(assert (=> b!918624 m!852753))

(assert (=> b!918624 m!852753))

(declare-fun m!852755 () Bool)

(assert (=> b!918624 m!852755))

(declare-fun m!852757 () Bool)

(assert (=> b!918624 m!852757))

(declare-fun m!852759 () Bool)

(assert (=> b!918620 m!852759))

(declare-fun m!852761 () Bool)

(assert (=> b!918620 m!852761))

(declare-fun m!852763 () Bool)

(assert (=> b!918622 m!852763))

(declare-fun m!852765 () Bool)

(assert (=> start!78864 m!852765))

(declare-fun m!852767 () Bool)

(assert (=> start!78864 m!852767))

(declare-fun m!852769 () Bool)

(assert (=> start!78864 m!852769))

(check-sat b_and!27567 (not b!918625) (not mapNonEmpty!30882) (not b!918624) (not start!78864) (not b_next!16909) (not b!918628) (not b!918627) (not b!918629) (not b_lambda!13425) tp_is_empty!19417 (not b!918622) (not b!918620))
(check-sat b_and!27567 (not b_next!16909))
