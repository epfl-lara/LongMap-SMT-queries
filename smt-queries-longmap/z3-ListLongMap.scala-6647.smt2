; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83856 () Bool)

(assert start!83856)

(declare-fun b_free!19665 () Bool)

(declare-fun b_next!19665 () Bool)

(assert (=> start!83856 (= b_free!19665 (not b_next!19665))))

(declare-fun tp!68436 () Bool)

(declare-fun b_and!31419 () Bool)

(assert (=> start!83856 (= tp!68436 b_and!31419)))

(declare-fun b!979681 () Bool)

(declare-fun e!552237 () Bool)

(declare-fun tp_is_empty!22659 () Bool)

(assert (=> b!979681 (= e!552237 tp_is_empty!22659)))

(declare-fun b!979682 () Bool)

(declare-fun res!655632 () Bool)

(declare-fun e!552235 () Bool)

(assert (=> b!979682 (=> (not res!655632) (not e!552235))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979682 (= res!655632 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36017 () Bool)

(declare-fun mapRes!36017 () Bool)

(declare-fun tp!68437 () Bool)

(assert (=> mapNonEmpty!36017 (= mapRes!36017 (and tp!68437 e!552237))))

(declare-datatypes ((V!35195 0))(
  ( (V!35196 (val!11380 Int)) )
))
(declare-datatypes ((ValueCell!10848 0))(
  ( (ValueCellFull!10848 (v!13942 V!35195)) (EmptyCell!10848) )
))
(declare-datatypes ((array!61335 0))(
  ( (array!61336 (arr!29525 (Array (_ BitVec 32) ValueCell!10848)) (size!30004 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61335)

(declare-fun mapValue!36017 () ValueCell!10848)

(declare-fun mapKey!36017 () (_ BitVec 32))

(declare-fun mapRest!36017 () (Array (_ BitVec 32) ValueCell!10848))

(assert (=> mapNonEmpty!36017 (= (arr!29525 _values!1278) (store mapRest!36017 mapKey!36017 mapValue!36017))))

(declare-fun b!979683 () Bool)

(declare-fun e!552240 () Bool)

(assert (=> b!979683 (= e!552240 true)))

(declare-datatypes ((tuple2!14596 0))(
  ( (tuple2!14597 (_1!7309 (_ BitVec 64)) (_2!7309 V!35195)) )
))
(declare-datatypes ((List!20465 0))(
  ( (Nil!20462) (Cons!20461 (h!21623 tuple2!14596) (t!29086 List!20465)) )
))
(declare-datatypes ((ListLongMap!13293 0))(
  ( (ListLongMap!13294 (toList!6662 List!20465)) )
))
(declare-fun lt!434660 () ListLongMap!13293)

(declare-fun lt!434663 () tuple2!14596)

(declare-fun lt!434666 () tuple2!14596)

(declare-fun lt!434661 () ListLongMap!13293)

(declare-fun +!2967 (ListLongMap!13293 tuple2!14596) ListLongMap!13293)

(assert (=> b!979683 (= lt!434661 (+!2967 (+!2967 lt!434660 lt!434663) lt!434666))))

(declare-fun lt!434667 () V!35195)

(declare-fun zeroValue!1220 () V!35195)

(declare-datatypes ((Unit!32573 0))(
  ( (Unit!32574) )
))
(declare-fun lt!434669 () Unit!32573)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61337 0))(
  ( (array!61338 (arr!29526 (Array (_ BitVec 32) (_ BitVec 64))) (size!30005 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61337)

(declare-fun addCommutativeForDiffKeys!595 (ListLongMap!13293 (_ BitVec 64) V!35195 (_ BitVec 64) V!35195) Unit!32573)

(assert (=> b!979683 (= lt!434669 (addCommutativeForDiffKeys!595 lt!434660 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29526 _keys!1544) from!1932) lt!434667))))

(declare-fun b!979684 () Bool)

(declare-fun res!655634 () Bool)

(assert (=> b!979684 (=> (not res!655634) (not e!552235))))

(declare-datatypes ((List!20466 0))(
  ( (Nil!20463) (Cons!20462 (h!21624 (_ BitVec 64)) (t!29087 List!20466)) )
))
(declare-fun arrayNoDuplicates!0 (array!61337 (_ BitVec 32) List!20466) Bool)

(assert (=> b!979684 (= res!655634 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20463))))

(declare-fun b!979685 () Bool)

(declare-fun e!552236 () Bool)

(declare-fun e!552238 () Bool)

(assert (=> b!979685 (= e!552236 (and e!552238 mapRes!36017))))

(declare-fun condMapEmpty!36017 () Bool)

(declare-fun mapDefault!36017 () ValueCell!10848)

(assert (=> b!979685 (= condMapEmpty!36017 (= (arr!29525 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10848)) mapDefault!36017)))))

(declare-fun b!979686 () Bool)

(assert (=> b!979686 (= e!552238 tp_is_empty!22659)))

(declare-fun b!979687 () Bool)

(declare-fun res!655631 () Bool)

(assert (=> b!979687 (=> (not res!655631) (not e!552235))))

(assert (=> b!979687 (= res!655631 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30005 _keys!1544))))))

(declare-fun b!979688 () Bool)

(assert (=> b!979688 (= e!552235 (not e!552240))))

(declare-fun res!655636 () Bool)

(assert (=> b!979688 (=> res!655636 e!552240)))

(assert (=> b!979688 (= res!655636 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29526 _keys!1544) from!1932)))))

(declare-fun lt!434665 () ListLongMap!13293)

(declare-fun lt!434664 () tuple2!14596)

(assert (=> b!979688 (= (+!2967 lt!434665 lt!434663) (+!2967 lt!434661 lt!434664))))

(declare-fun lt!434662 () ListLongMap!13293)

(assert (=> b!979688 (= lt!434661 (+!2967 lt!434662 lt!434663))))

(assert (=> b!979688 (= lt!434663 (tuple2!14597 (select (arr!29526 _keys!1544) from!1932) lt!434667))))

(assert (=> b!979688 (= lt!434665 (+!2967 lt!434662 lt!434664))))

(declare-fun minValue!1220 () V!35195)

(assert (=> b!979688 (= lt!434664 (tuple2!14597 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434668 () Unit!32573)

(assert (=> b!979688 (= lt!434668 (addCommutativeForDiffKeys!595 lt!434662 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29526 _keys!1544) from!1932) lt!434667))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15301 (ValueCell!10848 V!35195) V!35195)

(declare-fun dynLambda!1754 (Int (_ BitVec 64)) V!35195)

(assert (=> b!979688 (= lt!434667 (get!15301 (select (arr!29525 _values!1278) from!1932) (dynLambda!1754 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!979688 (= lt!434662 (+!2967 lt!434660 lt!434666))))

(assert (=> b!979688 (= lt!434666 (tuple2!14597 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3368 (array!61337 array!61335 (_ BitVec 32) (_ BitVec 32) V!35195 V!35195 (_ BitVec 32) Int) ListLongMap!13293)

(assert (=> b!979688 (= lt!434660 (getCurrentListMapNoExtraKeys!3368 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!655633 () Bool)

(assert (=> start!83856 (=> (not res!655633) (not e!552235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83856 (= res!655633 (validMask!0 mask!1948))))

(assert (=> start!83856 e!552235))

(assert (=> start!83856 true))

(assert (=> start!83856 tp_is_empty!22659))

(declare-fun array_inv!22829 (array!61335) Bool)

(assert (=> start!83856 (and (array_inv!22829 _values!1278) e!552236)))

(assert (=> start!83856 tp!68436))

(declare-fun array_inv!22830 (array!61337) Bool)

(assert (=> start!83856 (array_inv!22830 _keys!1544)))

(declare-fun b!979689 () Bool)

(declare-fun res!655630 () Bool)

(assert (=> b!979689 (=> (not res!655630) (not e!552235))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979689 (= res!655630 (validKeyInArray!0 (select (arr!29526 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36017 () Bool)

(assert (=> mapIsEmpty!36017 mapRes!36017))

(declare-fun b!979690 () Bool)

(declare-fun res!655637 () Bool)

(assert (=> b!979690 (=> (not res!655637) (not e!552235))))

(assert (=> b!979690 (= res!655637 (and (= (size!30004 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30005 _keys!1544) (size!30004 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979691 () Bool)

(declare-fun res!655635 () Bool)

(assert (=> b!979691 (=> (not res!655635) (not e!552235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61337 (_ BitVec 32)) Bool)

(assert (=> b!979691 (= res!655635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!83856 res!655633) b!979690))

(assert (= (and b!979690 res!655637) b!979691))

(assert (= (and b!979691 res!655635) b!979684))

(assert (= (and b!979684 res!655634) b!979687))

(assert (= (and b!979687 res!655631) b!979689))

(assert (= (and b!979689 res!655630) b!979682))

(assert (= (and b!979682 res!655632) b!979688))

(assert (= (and b!979688 (not res!655636)) b!979683))

(assert (= (and b!979685 condMapEmpty!36017) mapIsEmpty!36017))

(assert (= (and b!979685 (not condMapEmpty!36017)) mapNonEmpty!36017))

(get-info :version)

(assert (= (and mapNonEmpty!36017 ((_ is ValueCellFull!10848) mapValue!36017)) b!979681))

(assert (= (and b!979685 ((_ is ValueCellFull!10848) mapDefault!36017)) b!979686))

(assert (= start!83856 b!979685))

(declare-fun b_lambda!14709 () Bool)

(assert (=> (not b_lambda!14709) (not b!979688)))

(declare-fun t!29085 () Bool)

(declare-fun tb!6471 () Bool)

(assert (=> (and start!83856 (= defaultEntry!1281 defaultEntry!1281) t!29085) tb!6471))

(declare-fun result!12931 () Bool)

(assert (=> tb!6471 (= result!12931 tp_is_empty!22659)))

(assert (=> b!979688 t!29085))

(declare-fun b_and!31421 () Bool)

(assert (= b_and!31419 (and (=> t!29085 result!12931) b_and!31421)))

(declare-fun m!907039 () Bool)

(assert (=> b!979688 m!907039))

(declare-fun m!907041 () Bool)

(assert (=> b!979688 m!907041))

(declare-fun m!907043 () Bool)

(assert (=> b!979688 m!907043))

(declare-fun m!907045 () Bool)

(assert (=> b!979688 m!907045))

(declare-fun m!907047 () Bool)

(assert (=> b!979688 m!907047))

(declare-fun m!907049 () Bool)

(assert (=> b!979688 m!907049))

(declare-fun m!907051 () Bool)

(assert (=> b!979688 m!907051))

(assert (=> b!979688 m!907043))

(declare-fun m!907053 () Bool)

(assert (=> b!979688 m!907053))

(declare-fun m!907055 () Bool)

(assert (=> b!979688 m!907055))

(declare-fun m!907057 () Bool)

(assert (=> b!979688 m!907057))

(assert (=> b!979688 m!907039))

(assert (=> b!979688 m!907057))

(declare-fun m!907059 () Bool)

(assert (=> b!979688 m!907059))

(declare-fun m!907061 () Bool)

(assert (=> b!979684 m!907061))

(declare-fun m!907063 () Bool)

(assert (=> mapNonEmpty!36017 m!907063))

(declare-fun m!907065 () Bool)

(assert (=> b!979691 m!907065))

(declare-fun m!907067 () Bool)

(assert (=> b!979683 m!907067))

(assert (=> b!979683 m!907067))

(declare-fun m!907069 () Bool)

(assert (=> b!979683 m!907069))

(assert (=> b!979683 m!907043))

(assert (=> b!979683 m!907043))

(declare-fun m!907071 () Bool)

(assert (=> b!979683 m!907071))

(assert (=> b!979689 m!907043))

(assert (=> b!979689 m!907043))

(declare-fun m!907073 () Bool)

(assert (=> b!979689 m!907073))

(declare-fun m!907075 () Bool)

(assert (=> start!83856 m!907075))

(declare-fun m!907077 () Bool)

(assert (=> start!83856 m!907077))

(declare-fun m!907079 () Bool)

(assert (=> start!83856 m!907079))

(check-sat (not b!979689) (not mapNonEmpty!36017) (not start!83856) (not b!979683) (not b!979688) (not b_next!19665) (not b!979691) tp_is_empty!22659 (not b_lambda!14709) (not b!979684) b_and!31421)
(check-sat b_and!31421 (not b_next!19665))
