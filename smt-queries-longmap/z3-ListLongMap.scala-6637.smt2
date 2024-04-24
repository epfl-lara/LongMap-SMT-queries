; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83962 () Bool)

(assert start!83962)

(declare-fun b_free!19603 () Bool)

(declare-fun b_next!19603 () Bool)

(assert (=> start!83962 (= b_free!19603 (not b_next!19603))))

(declare-fun tp!68251 () Bool)

(declare-fun b_and!31305 () Bool)

(assert (=> start!83962 (= tp!68251 b_and!31305)))

(declare-fun b!979525 () Bool)

(declare-fun e!552288 () Bool)

(declare-fun e!552284 () Bool)

(declare-fun mapRes!35924 () Bool)

(assert (=> b!979525 (= e!552288 (and e!552284 mapRes!35924))))

(declare-fun condMapEmpty!35924 () Bool)

(declare-datatypes ((V!35113 0))(
  ( (V!35114 (val!11349 Int)) )
))
(declare-datatypes ((ValueCell!10817 0))(
  ( (ValueCellFull!10817 (v!13908 V!35113)) (EmptyCell!10817) )
))
(declare-datatypes ((array!61244 0))(
  ( (array!61245 (arr!29475 (Array (_ BitVec 32) ValueCell!10817)) (size!29955 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61244)

(declare-fun mapDefault!35924 () ValueCell!10817)

(assert (=> b!979525 (= condMapEmpty!35924 (= (arr!29475 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10817)) mapDefault!35924)))))

(declare-fun b!979526 () Bool)

(declare-fun e!552285 () Bool)

(assert (=> b!979526 (= e!552285 (not true))))

(declare-datatypes ((tuple2!14560 0))(
  ( (tuple2!14561 (_1!7291 (_ BitVec 64)) (_2!7291 V!35113)) )
))
(declare-datatypes ((List!20421 0))(
  ( (Nil!20418) (Cons!20417 (h!21585 tuple2!14560) (t!28972 List!20421)) )
))
(declare-datatypes ((ListLongMap!13259 0))(
  ( (ListLongMap!13260 (toList!6645 List!20421)) )
))
(declare-fun lt!434219 () ListLongMap!13259)

(declare-fun lt!434220 () tuple2!14560)

(declare-fun lt!434218 () tuple2!14560)

(declare-fun +!2960 (ListLongMap!13259 tuple2!14560) ListLongMap!13259)

(assert (=> b!979526 (= (+!2960 (+!2960 lt!434219 lt!434220) lt!434218) (+!2960 (+!2960 lt!434219 lt!434218) lt!434220))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61246 0))(
  ( (array!61247 (arr!29476 (Array (_ BitVec 32) (_ BitVec 64))) (size!29956 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61246)

(declare-fun lt!434216 () V!35113)

(assert (=> b!979526 (= lt!434218 (tuple2!14561 (select (arr!29476 _keys!1544) from!1932) lt!434216))))

(declare-fun minValue!1220 () V!35113)

(assert (=> b!979526 (= lt!434220 (tuple2!14561 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32500 0))(
  ( (Unit!32501) )
))
(declare-fun lt!434217 () Unit!32500)

(declare-fun addCommutativeForDiffKeys!567 (ListLongMap!13259 (_ BitVec 64) V!35113 (_ BitVec 64) V!35113) Unit!32500)

(assert (=> b!979526 (= lt!434217 (addCommutativeForDiffKeys!567 lt!434219 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29476 _keys!1544) from!1932) lt!434216))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15286 (ValueCell!10817 V!35113) V!35113)

(declare-fun dynLambda!1755 (Int (_ BitVec 64)) V!35113)

(assert (=> b!979526 (= lt!434216 (get!15286 (select (arr!29475 _values!1278) from!1932) (dynLambda!1755 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35113)

(declare-fun getCurrentListMapNoExtraKeys!3393 (array!61246 array!61244 (_ BitVec 32) (_ BitVec 32) V!35113 V!35113 (_ BitVec 32) Int) ListLongMap!13259)

(assert (=> b!979526 (= lt!434219 (+!2960 (getCurrentListMapNoExtraKeys!3393 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14561 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!979527 () Bool)

(declare-fun res!655260 () Bool)

(assert (=> b!979527 (=> (not res!655260) (not e!552285))))

(assert (=> b!979527 (= res!655260 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29956 _keys!1544))))))

(declare-fun b!979528 () Bool)

(declare-fun res!655255 () Bool)

(assert (=> b!979528 (=> (not res!655255) (not e!552285))))

(assert (=> b!979528 (= res!655255 (and (= (size!29955 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29956 _keys!1544) (size!29955 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979529 () Bool)

(declare-fun res!655259 () Bool)

(assert (=> b!979529 (=> (not res!655259) (not e!552285))))

(declare-datatypes ((List!20422 0))(
  ( (Nil!20419) (Cons!20418 (h!21586 (_ BitVec 64)) (t!28973 List!20422)) )
))
(declare-fun arrayNoDuplicates!0 (array!61246 (_ BitVec 32) List!20422) Bool)

(assert (=> b!979529 (= res!655259 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20419))))

(declare-fun b!979530 () Bool)

(declare-fun res!655258 () Bool)

(assert (=> b!979530 (=> (not res!655258) (not e!552285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61246 (_ BitVec 32)) Bool)

(assert (=> b!979530 (= res!655258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979531 () Bool)

(declare-fun res!655257 () Bool)

(assert (=> b!979531 (=> (not res!655257) (not e!552285))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979531 (= res!655257 (validKeyInArray!0 (select (arr!29476 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!35924 () Bool)

(declare-fun tp!68252 () Bool)

(declare-fun e!552286 () Bool)

(assert (=> mapNonEmpty!35924 (= mapRes!35924 (and tp!68252 e!552286))))

(declare-fun mapValue!35924 () ValueCell!10817)

(declare-fun mapKey!35924 () (_ BitVec 32))

(declare-fun mapRest!35924 () (Array (_ BitVec 32) ValueCell!10817))

(assert (=> mapNonEmpty!35924 (= (arr!29475 _values!1278) (store mapRest!35924 mapKey!35924 mapValue!35924))))

(declare-fun b!979532 () Bool)

(declare-fun tp_is_empty!22597 () Bool)

(assert (=> b!979532 (= e!552286 tp_is_empty!22597)))

(declare-fun res!655256 () Bool)

(assert (=> start!83962 (=> (not res!655256) (not e!552285))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83962 (= res!655256 (validMask!0 mask!1948))))

(assert (=> start!83962 e!552285))

(assert (=> start!83962 true))

(assert (=> start!83962 tp_is_empty!22597))

(declare-fun array_inv!22829 (array!61244) Bool)

(assert (=> start!83962 (and (array_inv!22829 _values!1278) e!552288)))

(assert (=> start!83962 tp!68251))

(declare-fun array_inv!22830 (array!61246) Bool)

(assert (=> start!83962 (array_inv!22830 _keys!1544)))

(declare-fun b!979524 () Bool)

(assert (=> b!979524 (= e!552284 tp_is_empty!22597)))

(declare-fun b!979533 () Bool)

(declare-fun res!655261 () Bool)

(assert (=> b!979533 (=> (not res!655261) (not e!552285))))

(assert (=> b!979533 (= res!655261 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!35924 () Bool)

(assert (=> mapIsEmpty!35924 mapRes!35924))

(assert (= (and start!83962 res!655256) b!979528))

(assert (= (and b!979528 res!655255) b!979530))

(assert (= (and b!979530 res!655258) b!979529))

(assert (= (and b!979529 res!655259) b!979527))

(assert (= (and b!979527 res!655260) b!979531))

(assert (= (and b!979531 res!655257) b!979533))

(assert (= (and b!979533 res!655261) b!979526))

(assert (= (and b!979525 condMapEmpty!35924) mapIsEmpty!35924))

(assert (= (and b!979525 (not condMapEmpty!35924)) mapNonEmpty!35924))

(get-info :version)

(assert (= (and mapNonEmpty!35924 ((_ is ValueCellFull!10817) mapValue!35924)) b!979532))

(assert (= (and b!979525 ((_ is ValueCellFull!10817) mapDefault!35924)) b!979524))

(assert (= start!83962 b!979525))

(declare-fun b_lambda!14661 () Bool)

(assert (=> (not b_lambda!14661) (not b!979526)))

(declare-fun t!28971 () Bool)

(declare-fun tb!6401 () Bool)

(assert (=> (and start!83962 (= defaultEntry!1281 defaultEntry!1281) t!28971) tb!6401))

(declare-fun result!12799 () Bool)

(assert (=> tb!6401 (= result!12799 tp_is_empty!22597)))

(assert (=> b!979526 t!28971))

(declare-fun b_and!31307 () Bool)

(assert (= b_and!31305 (and (=> t!28971 result!12799) b_and!31307)))

(declare-fun m!907085 () Bool)

(assert (=> b!979531 m!907085))

(assert (=> b!979531 m!907085))

(declare-fun m!907087 () Bool)

(assert (=> b!979531 m!907087))

(declare-fun m!907089 () Bool)

(assert (=> b!979530 m!907089))

(assert (=> b!979526 m!907085))

(declare-fun m!907091 () Bool)

(assert (=> b!979526 m!907091))

(declare-fun m!907093 () Bool)

(assert (=> b!979526 m!907093))

(assert (=> b!979526 m!907085))

(declare-fun m!907095 () Bool)

(assert (=> b!979526 m!907095))

(declare-fun m!907097 () Bool)

(assert (=> b!979526 m!907097))

(declare-fun m!907099 () Bool)

(assert (=> b!979526 m!907099))

(declare-fun m!907101 () Bool)

(assert (=> b!979526 m!907101))

(assert (=> b!979526 m!907097))

(assert (=> b!979526 m!907093))

(declare-fun m!907103 () Bool)

(assert (=> b!979526 m!907103))

(assert (=> b!979526 m!907101))

(declare-fun m!907105 () Bool)

(assert (=> b!979526 m!907105))

(declare-fun m!907107 () Bool)

(assert (=> b!979526 m!907107))

(assert (=> b!979526 m!907091))

(assert (=> b!979526 m!907107))

(declare-fun m!907109 () Bool)

(assert (=> b!979526 m!907109))

(declare-fun m!907111 () Bool)

(assert (=> b!979529 m!907111))

(declare-fun m!907113 () Bool)

(assert (=> start!83962 m!907113))

(declare-fun m!907115 () Bool)

(assert (=> start!83962 m!907115))

(declare-fun m!907117 () Bool)

(assert (=> start!83962 m!907117))

(declare-fun m!907119 () Bool)

(assert (=> mapNonEmpty!35924 m!907119))

(check-sat (not b!979529) (not b!979526) tp_is_empty!22597 (not b!979531) (not mapNonEmpty!35924) (not b_lambda!14661) (not start!83962) (not b!979530) b_and!31307 (not b_next!19603))
(check-sat b_and!31307 (not b_next!19603))
