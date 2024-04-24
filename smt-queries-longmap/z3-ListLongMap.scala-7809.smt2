; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97834 () Bool)

(assert start!97834)

(declare-fun b!1116226 () Bool)

(declare-fun res!744779 () Bool)

(declare-fun e!636240 () Bool)

(assert (=> b!1116226 (=> (not res!744779) (not e!636240))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116226 (= res!744779 (validKeyInArray!0 k0!934))))

(declare-fun b!1116227 () Bool)

(declare-fun res!744780 () Bool)

(assert (=> b!1116227 (=> (not res!744780) (not e!636240))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116227 (= res!744780 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!43561 () Bool)

(declare-fun mapRes!43561 () Bool)

(declare-fun tp!82805 () Bool)

(declare-fun e!636236 () Bool)

(assert (=> mapNonEmpty!43561 (= mapRes!43561 (and tp!82805 e!636236))))

(declare-datatypes ((V!42233 0))(
  ( (V!42234 (val!13971 Int)) )
))
(declare-datatypes ((ValueCell!13205 0))(
  ( (ValueCellFull!13205 (v!16600 V!42233)) (EmptyCell!13205) )
))
(declare-fun mapRest!43561 () (Array (_ BitVec 32) ValueCell!13205))

(declare-fun mapKey!43561 () (_ BitVec 32))

(declare-datatypes ((array!72597 0))(
  ( (array!72598 (arr!34945 (Array (_ BitVec 32) ValueCell!13205)) (size!35482 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72597)

(declare-fun mapValue!43561 () ValueCell!13205)

(assert (=> mapNonEmpty!43561 (= (arr!34945 _values!996) (store mapRest!43561 mapKey!43561 mapValue!43561))))

(declare-fun b!1116228 () Bool)

(declare-fun res!744778 () Bool)

(declare-fun e!636235 () Bool)

(assert (=> b!1116228 (=> (not res!744778) (not e!636235))))

(declare-datatypes ((array!72599 0))(
  ( (array!72600 (arr!34946 (Array (_ BitVec 32) (_ BitVec 64))) (size!35483 (_ BitVec 32))) )
))
(declare-fun lt!497412 () array!72599)

(declare-datatypes ((List!24355 0))(
  ( (Nil!24352) (Cons!24351 (h!25569 (_ BitVec 64)) (t!34828 List!24355)) )
))
(declare-fun arrayNoDuplicates!0 (array!72599 (_ BitVec 32) List!24355) Bool)

(assert (=> b!1116228 (= res!744778 (arrayNoDuplicates!0 lt!497412 #b00000000000000000000000000000000 Nil!24352))))

(declare-fun b!1116229 () Bool)

(declare-fun res!744776 () Bool)

(assert (=> b!1116229 (=> (not res!744776) (not e!636240))))

(declare-fun _keys!1208 () array!72599)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72599 (_ BitVec 32)) Bool)

(assert (=> b!1116229 (= res!744776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116230 () Bool)

(assert (=> b!1116230 (= e!636235 (not true))))

(declare-fun arrayContainsKey!0 (array!72599 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116230 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36561 0))(
  ( (Unit!36562) )
))
(declare-fun lt!497413 () Unit!36561)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72599 (_ BitVec 64) (_ BitVec 32)) Unit!36561)

(assert (=> b!1116230 (= lt!497413 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116231 () Bool)

(declare-fun res!744781 () Bool)

(assert (=> b!1116231 (=> (not res!744781) (not e!636240))))

(assert (=> b!1116231 (= res!744781 (= (select (arr!34946 _keys!1208) i!673) k0!934))))

(declare-fun res!744775 () Bool)

(assert (=> start!97834 (=> (not res!744775) (not e!636240))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97834 (= res!744775 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35483 _keys!1208))))))

(assert (=> start!97834 e!636240))

(declare-fun array_inv!26926 (array!72599) Bool)

(assert (=> start!97834 (array_inv!26926 _keys!1208)))

(assert (=> start!97834 true))

(declare-fun e!636237 () Bool)

(declare-fun array_inv!26927 (array!72597) Bool)

(assert (=> start!97834 (and (array_inv!26927 _values!996) e!636237)))

(declare-fun b!1116232 () Bool)

(declare-fun res!744783 () Bool)

(assert (=> b!1116232 (=> (not res!744783) (not e!636240))))

(assert (=> b!1116232 (= res!744783 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24352))))

(declare-fun b!1116233 () Bool)

(declare-fun e!636238 () Bool)

(assert (=> b!1116233 (= e!636237 (and e!636238 mapRes!43561))))

(declare-fun condMapEmpty!43561 () Bool)

(declare-fun mapDefault!43561 () ValueCell!13205)

(assert (=> b!1116233 (= condMapEmpty!43561 (= (arr!34945 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13205)) mapDefault!43561)))))

(declare-fun mapIsEmpty!43561 () Bool)

(assert (=> mapIsEmpty!43561 mapRes!43561))

(declare-fun b!1116234 () Bool)

(declare-fun res!744782 () Bool)

(assert (=> b!1116234 (=> (not res!744782) (not e!636240))))

(assert (=> b!1116234 (= res!744782 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35483 _keys!1208))))))

(declare-fun b!1116235 () Bool)

(declare-fun res!744784 () Bool)

(assert (=> b!1116235 (=> (not res!744784) (not e!636240))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116235 (= res!744784 (and (= (size!35482 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35483 _keys!1208) (size!35482 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116236 () Bool)

(assert (=> b!1116236 (= e!636240 e!636235)))

(declare-fun res!744777 () Bool)

(assert (=> b!1116236 (=> (not res!744777) (not e!636235))))

(assert (=> b!1116236 (= res!744777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497412 mask!1564))))

(assert (=> b!1116236 (= lt!497412 (array!72600 (store (arr!34946 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35483 _keys!1208)))))

(declare-fun b!1116237 () Bool)

(declare-fun tp_is_empty!27829 () Bool)

(assert (=> b!1116237 (= e!636238 tp_is_empty!27829)))

(declare-fun b!1116238 () Bool)

(assert (=> b!1116238 (= e!636236 tp_is_empty!27829)))

(assert (= (and start!97834 res!744775) b!1116227))

(assert (= (and b!1116227 res!744780) b!1116235))

(assert (= (and b!1116235 res!744784) b!1116229))

(assert (= (and b!1116229 res!744776) b!1116232))

(assert (= (and b!1116232 res!744783) b!1116234))

(assert (= (and b!1116234 res!744782) b!1116226))

(assert (= (and b!1116226 res!744779) b!1116231))

(assert (= (and b!1116231 res!744781) b!1116236))

(assert (= (and b!1116236 res!744777) b!1116228))

(assert (= (and b!1116228 res!744778) b!1116230))

(assert (= (and b!1116233 condMapEmpty!43561) mapIsEmpty!43561))

(assert (= (and b!1116233 (not condMapEmpty!43561)) mapNonEmpty!43561))

(get-info :version)

(assert (= (and mapNonEmpty!43561 ((_ is ValueCellFull!13205) mapValue!43561)) b!1116238))

(assert (= (and b!1116233 ((_ is ValueCellFull!13205) mapDefault!43561)) b!1116237))

(assert (= start!97834 b!1116233))

(declare-fun m!1033293 () Bool)

(assert (=> b!1116231 m!1033293))

(declare-fun m!1033295 () Bool)

(assert (=> b!1116232 m!1033295))

(declare-fun m!1033297 () Bool)

(assert (=> b!1116227 m!1033297))

(declare-fun m!1033299 () Bool)

(assert (=> b!1116228 m!1033299))

(declare-fun m!1033301 () Bool)

(assert (=> b!1116229 m!1033301))

(declare-fun m!1033303 () Bool)

(assert (=> start!97834 m!1033303))

(declare-fun m!1033305 () Bool)

(assert (=> start!97834 m!1033305))

(declare-fun m!1033307 () Bool)

(assert (=> b!1116236 m!1033307))

(declare-fun m!1033309 () Bool)

(assert (=> b!1116236 m!1033309))

(declare-fun m!1033311 () Bool)

(assert (=> mapNonEmpty!43561 m!1033311))

(declare-fun m!1033313 () Bool)

(assert (=> b!1116230 m!1033313))

(declare-fun m!1033315 () Bool)

(assert (=> b!1116230 m!1033315))

(declare-fun m!1033317 () Bool)

(assert (=> b!1116226 m!1033317))

(check-sat (not b!1116228) (not mapNonEmpty!43561) (not b!1116226) (not b!1116229) (not b!1116236) (not b!1116232) (not b!1116230) tp_is_empty!27829 (not b!1116227) (not start!97834))
(check-sat)
