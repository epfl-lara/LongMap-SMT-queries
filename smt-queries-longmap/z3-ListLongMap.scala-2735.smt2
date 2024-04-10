; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40230 () Bool)

(assert start!40230)

(declare-fun b_free!10497 () Bool)

(declare-fun b_next!10497 () Bool)

(assert (=> start!40230 (= b_free!10497 (not b_next!10497))))

(declare-fun tp!37020 () Bool)

(declare-fun b_and!18465 () Bool)

(assert (=> start!40230 (= tp!37020 b_and!18465)))

(declare-fun b!441284 () Bool)

(declare-fun res!261183 () Bool)

(declare-fun e!259861 () Bool)

(assert (=> b!441284 (=> (not res!261183) (not e!259861))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27111 0))(
  ( (array!27112 (arr!13005 (Array (_ BitVec 32) (_ BitVec 64))) (size!13357 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27111)

(assert (=> b!441284 (= res!261183 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13357 _keys!709))))))

(declare-fun b!441285 () Bool)

(declare-fun e!259862 () Bool)

(declare-fun e!259860 () Bool)

(assert (=> b!441285 (= e!259862 e!259860)))

(declare-fun res!261190 () Bool)

(assert (=> b!441285 (=> (not res!261190) (not e!259860))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!441285 (= res!261190 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16637 0))(
  ( (V!16638 (val!5869 Int)) )
))
(declare-fun minValue!515 () V!16637)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!202847 () array!27111)

(declare-datatypes ((ValueCell!5481 0))(
  ( (ValueCellFull!5481 (v!8116 V!16637)) (EmptyCell!5481) )
))
(declare-datatypes ((array!27113 0))(
  ( (array!27114 (arr!13006 (Array (_ BitVec 32) ValueCell!5481)) (size!13358 (_ BitVec 32))) )
))
(declare-fun lt!202848 () array!27113)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7810 0))(
  ( (tuple2!7811 (_1!3916 (_ BitVec 64)) (_2!3916 V!16637)) )
))
(declare-datatypes ((List!7805 0))(
  ( (Nil!7802) (Cons!7801 (h!8657 tuple2!7810) (t!13561 List!7805)) )
))
(declare-datatypes ((ListLongMap!6723 0))(
  ( (ListLongMap!6724 (toList!3377 List!7805)) )
))
(declare-fun lt!202850 () ListLongMap!6723)

(declare-fun zeroValue!515 () V!16637)

(declare-fun getCurrentListMapNoExtraKeys!1566 (array!27111 array!27113 (_ BitVec 32) (_ BitVec 32) V!16637 V!16637 (_ BitVec 32) Int) ListLongMap!6723)

(assert (=> b!441285 (= lt!202850 (getCurrentListMapNoExtraKeys!1566 lt!202847 lt!202848 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!27113)

(declare-fun v!412 () V!16637)

(assert (=> b!441285 (= lt!202848 (array!27114 (store (arr!13006 _values!549) i!563 (ValueCellFull!5481 v!412)) (size!13358 _values!549)))))

(declare-fun lt!202846 () ListLongMap!6723)

(assert (=> b!441285 (= lt!202846 (getCurrentListMapNoExtraKeys!1566 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441286 () Bool)

(declare-fun res!261191 () Bool)

(assert (=> b!441286 (=> (not res!261191) (not e!259861))))

(assert (=> b!441286 (= res!261191 (or (= (select (arr!13005 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13005 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441287 () Bool)

(declare-fun res!261192 () Bool)

(assert (=> b!441287 (=> (not res!261192) (not e!259861))))

(declare-datatypes ((List!7806 0))(
  ( (Nil!7803) (Cons!7802 (h!8658 (_ BitVec 64)) (t!13562 List!7806)) )
))
(declare-fun arrayNoDuplicates!0 (array!27111 (_ BitVec 32) List!7806) Bool)

(assert (=> b!441287 (= res!261192 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7803))))

(declare-fun b!441288 () Bool)

(declare-fun res!261187 () Bool)

(assert (=> b!441288 (=> (not res!261187) (not e!259861))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27111 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441288 (= res!261187 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!441289 () Bool)

(declare-fun e!259863 () Bool)

(declare-fun e!259865 () Bool)

(declare-fun mapRes!19095 () Bool)

(assert (=> b!441289 (= e!259863 (and e!259865 mapRes!19095))))

(declare-fun condMapEmpty!19095 () Bool)

(declare-fun mapDefault!19095 () ValueCell!5481)

(assert (=> b!441289 (= condMapEmpty!19095 (= (arr!13006 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5481)) mapDefault!19095)))))

(declare-fun b!441290 () Bool)

(declare-fun tp_is_empty!11649 () Bool)

(assert (=> b!441290 (= e!259865 tp_is_empty!11649)))

(declare-fun b!441291 () Bool)

(assert (=> b!441291 (= e!259860 (not true))))

(declare-fun +!1513 (ListLongMap!6723 tuple2!7810) ListLongMap!6723)

(assert (=> b!441291 (= (getCurrentListMapNoExtraKeys!1566 lt!202847 lt!202848 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1513 (getCurrentListMapNoExtraKeys!1566 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7811 k0!794 v!412)))))

(declare-datatypes ((Unit!13130 0))(
  ( (Unit!13131) )
))
(declare-fun lt!202849 () Unit!13130)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!682 (array!27111 array!27113 (_ BitVec 32) (_ BitVec 32) V!16637 V!16637 (_ BitVec 32) (_ BitVec 64) V!16637 (_ BitVec 32) Int) Unit!13130)

(assert (=> b!441291 (= lt!202849 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!682 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441292 () Bool)

(declare-fun e!259864 () Bool)

(assert (=> b!441292 (= e!259864 tp_is_empty!11649)))

(declare-fun b!441293 () Bool)

(assert (=> b!441293 (= e!259861 e!259862)))

(declare-fun res!261193 () Bool)

(assert (=> b!441293 (=> (not res!261193) (not e!259862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27111 (_ BitVec 32)) Bool)

(assert (=> b!441293 (= res!261193 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202847 mask!1025))))

(assert (=> b!441293 (= lt!202847 (array!27112 (store (arr!13005 _keys!709) i!563 k0!794) (size!13357 _keys!709)))))

(declare-fun res!261194 () Bool)

(assert (=> start!40230 (=> (not res!261194) (not e!259861))))

(assert (=> start!40230 (= res!261194 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13357 _keys!709))))))

(assert (=> start!40230 e!259861))

(assert (=> start!40230 tp_is_empty!11649))

(assert (=> start!40230 tp!37020))

(assert (=> start!40230 true))

(declare-fun array_inv!9440 (array!27113) Bool)

(assert (=> start!40230 (and (array_inv!9440 _values!549) e!259863)))

(declare-fun array_inv!9441 (array!27111) Bool)

(assert (=> start!40230 (array_inv!9441 _keys!709)))

(declare-fun mapNonEmpty!19095 () Bool)

(declare-fun tp!37019 () Bool)

(assert (=> mapNonEmpty!19095 (= mapRes!19095 (and tp!37019 e!259864))))

(declare-fun mapValue!19095 () ValueCell!5481)

(declare-fun mapKey!19095 () (_ BitVec 32))

(declare-fun mapRest!19095 () (Array (_ BitVec 32) ValueCell!5481))

(assert (=> mapNonEmpty!19095 (= (arr!13006 _values!549) (store mapRest!19095 mapKey!19095 mapValue!19095))))

(declare-fun mapIsEmpty!19095 () Bool)

(assert (=> mapIsEmpty!19095 mapRes!19095))

(declare-fun b!441294 () Bool)

(declare-fun res!261188 () Bool)

(assert (=> b!441294 (=> (not res!261188) (not e!259861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441294 (= res!261188 (validMask!0 mask!1025))))

(declare-fun b!441295 () Bool)

(declare-fun res!261184 () Bool)

(assert (=> b!441295 (=> (not res!261184) (not e!259861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441295 (= res!261184 (validKeyInArray!0 k0!794))))

(declare-fun b!441296 () Bool)

(declare-fun res!261186 () Bool)

(assert (=> b!441296 (=> (not res!261186) (not e!259862))))

(assert (=> b!441296 (= res!261186 (arrayNoDuplicates!0 lt!202847 #b00000000000000000000000000000000 Nil!7803))))

(declare-fun b!441297 () Bool)

(declare-fun res!261185 () Bool)

(assert (=> b!441297 (=> (not res!261185) (not e!259861))))

(assert (=> b!441297 (= res!261185 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441298 () Bool)

(declare-fun res!261189 () Bool)

(assert (=> b!441298 (=> (not res!261189) (not e!259862))))

(assert (=> b!441298 (= res!261189 (bvsle from!863 i!563))))

(declare-fun b!441299 () Bool)

(declare-fun res!261195 () Bool)

(assert (=> b!441299 (=> (not res!261195) (not e!259861))))

(assert (=> b!441299 (= res!261195 (and (= (size!13358 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13357 _keys!709) (size!13358 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40230 res!261194) b!441294))

(assert (= (and b!441294 res!261188) b!441299))

(assert (= (and b!441299 res!261195) b!441297))

(assert (= (and b!441297 res!261185) b!441287))

(assert (= (and b!441287 res!261192) b!441284))

(assert (= (and b!441284 res!261183) b!441295))

(assert (= (and b!441295 res!261184) b!441286))

(assert (= (and b!441286 res!261191) b!441288))

(assert (= (and b!441288 res!261187) b!441293))

(assert (= (and b!441293 res!261193) b!441296))

(assert (= (and b!441296 res!261186) b!441298))

(assert (= (and b!441298 res!261189) b!441285))

(assert (= (and b!441285 res!261190) b!441291))

(assert (= (and b!441289 condMapEmpty!19095) mapIsEmpty!19095))

(assert (= (and b!441289 (not condMapEmpty!19095)) mapNonEmpty!19095))

(get-info :version)

(assert (= (and mapNonEmpty!19095 ((_ is ValueCellFull!5481) mapValue!19095)) b!441292))

(assert (= (and b!441289 ((_ is ValueCellFull!5481) mapDefault!19095)) b!441290))

(assert (= start!40230 b!441289))

(declare-fun m!428153 () Bool)

(assert (=> mapNonEmpty!19095 m!428153))

(declare-fun m!428155 () Bool)

(assert (=> b!441297 m!428155))

(declare-fun m!428157 () Bool)

(assert (=> b!441288 m!428157))

(declare-fun m!428159 () Bool)

(assert (=> b!441293 m!428159))

(declare-fun m!428161 () Bool)

(assert (=> b!441293 m!428161))

(declare-fun m!428163 () Bool)

(assert (=> b!441285 m!428163))

(declare-fun m!428165 () Bool)

(assert (=> b!441285 m!428165))

(declare-fun m!428167 () Bool)

(assert (=> b!441285 m!428167))

(declare-fun m!428169 () Bool)

(assert (=> b!441287 m!428169))

(declare-fun m!428171 () Bool)

(assert (=> b!441296 m!428171))

(declare-fun m!428173 () Bool)

(assert (=> b!441295 m!428173))

(declare-fun m!428175 () Bool)

(assert (=> start!40230 m!428175))

(declare-fun m!428177 () Bool)

(assert (=> start!40230 m!428177))

(declare-fun m!428179 () Bool)

(assert (=> b!441286 m!428179))

(declare-fun m!428181 () Bool)

(assert (=> b!441291 m!428181))

(declare-fun m!428183 () Bool)

(assert (=> b!441291 m!428183))

(assert (=> b!441291 m!428183))

(declare-fun m!428185 () Bool)

(assert (=> b!441291 m!428185))

(declare-fun m!428187 () Bool)

(assert (=> b!441291 m!428187))

(declare-fun m!428189 () Bool)

(assert (=> b!441294 m!428189))

(check-sat (not b!441285) (not b!441288) tp_is_empty!11649 (not b!441296) (not b!441291) (not b!441295) b_and!18465 (not start!40230) (not b!441293) (not b!441294) (not mapNonEmpty!19095) (not b!441287) (not b_next!10497) (not b!441297))
(check-sat b_and!18465 (not b_next!10497))
