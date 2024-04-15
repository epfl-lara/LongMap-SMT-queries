; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77780 () Bool)

(assert start!77780)

(declare-fun b_free!16357 () Bool)

(declare-fun b_next!16357 () Bool)

(assert (=> start!77780 (= b_free!16357 (not b_next!16357))))

(declare-fun tp!57336 () Bool)

(declare-fun b_and!26845 () Bool)

(assert (=> start!77780 (= tp!57336 b_and!26845)))

(declare-fun res!612702 () Bool)

(declare-fun e!508732 () Bool)

(assert (=> start!77780 (=> (not res!612702) (not e!508732))))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77780 (= res!612702 (validMask!0 mask!1756))))

(assert (=> start!77780 e!508732))

(declare-datatypes ((V!29999 0))(
  ( (V!30000 (val!9438 Int)) )
))
(declare-datatypes ((ValueCell!8906 0))(
  ( (ValueCellFull!8906 (v!11944 V!29999)) (EmptyCell!8906) )
))
(declare-datatypes ((array!53565 0))(
  ( (array!53566 (arr!25741 (Array (_ BitVec 32) ValueCell!8906)) (size!26202 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53565)

(declare-fun e!508738 () Bool)

(declare-fun array_inv!20198 (array!53565) Bool)

(assert (=> start!77780 (and (array_inv!20198 _values!1152) e!508738)))

(assert (=> start!77780 tp!57336))

(assert (=> start!77780 true))

(declare-fun tp_is_empty!18775 () Bool)

(assert (=> start!77780 tp_is_empty!18775))

(declare-datatypes ((array!53567 0))(
  ( (array!53568 (arr!25742 (Array (_ BitVec 32) (_ BitVec 64))) (size!26203 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53567)

(declare-fun array_inv!20199 (array!53567) Bool)

(assert (=> start!77780 (array_inv!20199 _keys!1386)))

(declare-fun b!907742 () Bool)

(declare-fun e!508733 () Bool)

(assert (=> b!907742 (= e!508733 true)))

(declare-datatypes ((tuple2!12322 0))(
  ( (tuple2!12323 (_1!6172 (_ BitVec 64)) (_2!6172 V!29999)) )
))
(declare-datatypes ((List!18107 0))(
  ( (Nil!18104) (Cons!18103 (h!19249 tuple2!12322) (t!25627 List!18107)) )
))
(declare-datatypes ((ListLongMap!11009 0))(
  ( (ListLongMap!11010 (toList!5520 List!18107)) )
))
(declare-fun lt!409310 () ListLongMap!11009)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun lt!409314 () V!29999)

(declare-fun apply!494 (ListLongMap!11009 (_ BitVec 64)) V!29999)

(assert (=> b!907742 (= (apply!494 lt!409310 k0!1033) lt!409314)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29999)

(declare-datatypes ((Unit!30742 0))(
  ( (Unit!30743) )
))
(declare-fun lt!409312 () Unit!30742)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29999)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!53 (array!53567 array!53565 (_ BitVec 32) (_ BitVec 32) V!29999 V!29999 (_ BitVec 64) V!29999 (_ BitVec 32) Int) Unit!30742)

(assert (=> b!907742 (= lt!409312 (lemmaListMapApplyFromThenApplyFromZero!53 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409314 i!717 defaultEntry!1160))))

(declare-fun b!907743 () Bool)

(declare-fun e!508737 () Bool)

(declare-fun mapRes!29878 () Bool)

(assert (=> b!907743 (= e!508738 (and e!508737 mapRes!29878))))

(declare-fun condMapEmpty!29878 () Bool)

(declare-fun mapDefault!29878 () ValueCell!8906)

(assert (=> b!907743 (= condMapEmpty!29878 (= (arr!25741 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8906)) mapDefault!29878)))))

(declare-fun b!907744 () Bool)

(declare-fun res!612694 () Bool)

(declare-fun e!508739 () Bool)

(assert (=> b!907744 (=> (not res!612694) (not e!508739))))

(assert (=> b!907744 (= res!612694 (and (= (select (arr!25742 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!29878 () Bool)

(declare-fun tp!57337 () Bool)

(declare-fun e!508735 () Bool)

(assert (=> mapNonEmpty!29878 (= mapRes!29878 (and tp!57337 e!508735))))

(declare-fun mapValue!29878 () ValueCell!8906)

(declare-fun mapRest!29878 () (Array (_ BitVec 32) ValueCell!8906))

(declare-fun mapKey!29878 () (_ BitVec 32))

(assert (=> mapNonEmpty!29878 (= (arr!25741 _values!1152) (store mapRest!29878 mapKey!29878 mapValue!29878))))

(declare-fun b!907745 () Bool)

(declare-fun res!612696 () Bool)

(assert (=> b!907745 (=> (not res!612696) (not e!508739))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907745 (= res!612696 (inRange!0 i!717 mask!1756))))

(declare-fun b!907746 () Bool)

(declare-fun e!508734 () Bool)

(assert (=> b!907746 (= e!508739 (not e!508734))))

(declare-fun res!612697 () Bool)

(assert (=> b!907746 (=> res!612697 e!508734)))

(assert (=> b!907746 (= res!612697 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26203 _keys!1386))))))

(declare-fun get!13550 (ValueCell!8906 V!29999) V!29999)

(declare-fun dynLambda!1362 (Int (_ BitVec 64)) V!29999)

(assert (=> b!907746 (= lt!409314 (get!13550 (select (arr!25741 _values!1152) i!717) (dynLambda!1362 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53567 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907746 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409313 () Unit!30742)

(declare-fun lemmaKeyInListMapIsInArray!238 (array!53567 array!53565 (_ BitVec 32) (_ BitVec 32) V!29999 V!29999 (_ BitVec 64) Int) Unit!30742)

(assert (=> b!907746 (= lt!409313 (lemmaKeyInListMapIsInArray!238 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!907747 () Bool)

(declare-fun res!612698 () Bool)

(assert (=> b!907747 (=> (not res!612698) (not e!508732))))

(declare-datatypes ((List!18108 0))(
  ( (Nil!18105) (Cons!18104 (h!19250 (_ BitVec 64)) (t!25628 List!18108)) )
))
(declare-fun arrayNoDuplicates!0 (array!53567 (_ BitVec 32) List!18108) Bool)

(assert (=> b!907747 (= res!612698 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18105))))

(declare-fun b!907748 () Bool)

(assert (=> b!907748 (= e!508734 e!508733)))

(declare-fun res!612703 () Bool)

(assert (=> b!907748 (=> res!612703 e!508733)))

(declare-fun lt!409311 () ListLongMap!11009)

(declare-fun contains!4521 (ListLongMap!11009 (_ BitVec 64)) Bool)

(assert (=> b!907748 (= res!612703 (not (contains!4521 lt!409311 k0!1033)))))

(declare-fun getCurrentListMap!2724 (array!53567 array!53565 (_ BitVec 32) (_ BitVec 32) V!29999 V!29999 (_ BitVec 32) Int) ListLongMap!11009)

(assert (=> b!907748 (= lt!409311 (getCurrentListMap!2724 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907749 () Bool)

(assert (=> b!907749 (= e!508735 tp_is_empty!18775)))

(declare-fun b!907750 () Bool)

(declare-fun res!612700 () Bool)

(assert (=> b!907750 (=> res!612700 e!508733)))

(assert (=> b!907750 (= res!612700 (not (= (apply!494 lt!409311 k0!1033) lt!409314)))))

(declare-fun b!907751 () Bool)

(assert (=> b!907751 (= e!508732 e!508739)))

(declare-fun res!612699 () Bool)

(assert (=> b!907751 (=> (not res!612699) (not e!508739))))

(assert (=> b!907751 (= res!612699 (contains!4521 lt!409310 k0!1033))))

(assert (=> b!907751 (= lt!409310 (getCurrentListMap!2724 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!907752 () Bool)

(assert (=> b!907752 (= e!508737 tp_is_empty!18775)))

(declare-fun b!907753 () Bool)

(declare-fun res!612701 () Bool)

(assert (=> b!907753 (=> (not res!612701) (not e!508732))))

(assert (=> b!907753 (= res!612701 (and (= (size!26202 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26203 _keys!1386) (size!26202 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!907754 () Bool)

(declare-fun res!612695 () Bool)

(assert (=> b!907754 (=> (not res!612695) (not e!508732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53567 (_ BitVec 32)) Bool)

(assert (=> b!907754 (= res!612695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun mapIsEmpty!29878 () Bool)

(assert (=> mapIsEmpty!29878 mapRes!29878))

(assert (= (and start!77780 res!612702) b!907753))

(assert (= (and b!907753 res!612701) b!907754))

(assert (= (and b!907754 res!612695) b!907747))

(assert (= (and b!907747 res!612698) b!907751))

(assert (= (and b!907751 res!612699) b!907745))

(assert (= (and b!907745 res!612696) b!907744))

(assert (= (and b!907744 res!612694) b!907746))

(assert (= (and b!907746 (not res!612697)) b!907748))

(assert (= (and b!907748 (not res!612703)) b!907750))

(assert (= (and b!907750 (not res!612700)) b!907742))

(assert (= (and b!907743 condMapEmpty!29878) mapIsEmpty!29878))

(assert (= (and b!907743 (not condMapEmpty!29878)) mapNonEmpty!29878))

(get-info :version)

(assert (= (and mapNonEmpty!29878 ((_ is ValueCellFull!8906) mapValue!29878)) b!907749))

(assert (= (and b!907743 ((_ is ValueCellFull!8906) mapDefault!29878)) b!907752))

(assert (= start!77780 b!907743))

(declare-fun b_lambda!13223 () Bool)

(assert (=> (not b_lambda!13223) (not b!907746)))

(declare-fun t!25626 () Bool)

(declare-fun tb!5371 () Bool)

(assert (=> (and start!77780 (= defaultEntry!1160 defaultEntry!1160) t!25626) tb!5371))

(declare-fun result!10547 () Bool)

(assert (=> tb!5371 (= result!10547 tp_is_empty!18775)))

(assert (=> b!907746 t!25626))

(declare-fun b_and!26847 () Bool)

(assert (= b_and!26845 (and (=> t!25626 result!10547) b_and!26847)))

(declare-fun m!842571 () Bool)

(assert (=> b!907750 m!842571))

(declare-fun m!842573 () Bool)

(assert (=> b!907751 m!842573))

(declare-fun m!842575 () Bool)

(assert (=> b!907751 m!842575))

(declare-fun m!842577 () Bool)

(assert (=> b!907745 m!842577))

(declare-fun m!842579 () Bool)

(assert (=> b!907746 m!842579))

(declare-fun m!842581 () Bool)

(assert (=> b!907746 m!842581))

(declare-fun m!842583 () Bool)

(assert (=> b!907746 m!842583))

(declare-fun m!842585 () Bool)

(assert (=> b!907746 m!842585))

(assert (=> b!907746 m!842579))

(assert (=> b!907746 m!842583))

(declare-fun m!842587 () Bool)

(assert (=> b!907746 m!842587))

(declare-fun m!842589 () Bool)

(assert (=> b!907754 m!842589))

(declare-fun m!842591 () Bool)

(assert (=> start!77780 m!842591))

(declare-fun m!842593 () Bool)

(assert (=> start!77780 m!842593))

(declare-fun m!842595 () Bool)

(assert (=> start!77780 m!842595))

(declare-fun m!842597 () Bool)

(assert (=> mapNonEmpty!29878 m!842597))

(declare-fun m!842599 () Bool)

(assert (=> b!907742 m!842599))

(declare-fun m!842601 () Bool)

(assert (=> b!907742 m!842601))

(declare-fun m!842603 () Bool)

(assert (=> b!907748 m!842603))

(declare-fun m!842605 () Bool)

(assert (=> b!907748 m!842605))

(declare-fun m!842607 () Bool)

(assert (=> b!907744 m!842607))

(declare-fun m!842609 () Bool)

(assert (=> b!907747 m!842609))

(check-sat (not b!907750) (not b!907746) (not b!907748) (not b!907747) (not b!907742) (not start!77780) (not b_lambda!13223) (not mapNonEmpty!29878) tp_is_empty!18775 (not b!907751) b_and!26847 (not b!907754) (not b!907745) (not b_next!16357))
(check-sat b_and!26847 (not b_next!16357))
