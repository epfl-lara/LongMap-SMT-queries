; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40236 () Bool)

(assert start!40236)

(declare-fun b_free!10503 () Bool)

(declare-fun b_next!10503 () Bool)

(assert (=> start!40236 (= b_free!10503 (not b_next!10503))))

(declare-fun tp!37037 () Bool)

(declare-fun b_and!18471 () Bool)

(assert (=> start!40236 (= tp!37037 b_and!18471)))

(declare-fun b!441428 () Bool)

(declare-fun res!261301 () Bool)

(declare-fun e!259923 () Bool)

(assert (=> b!441428 (=> (not res!261301) (not e!259923))))

(declare-datatypes ((array!27123 0))(
  ( (array!27124 (arr!13011 (Array (_ BitVec 32) (_ BitVec 64))) (size!13363 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27123)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16645 0))(
  ( (V!16646 (val!5872 Int)) )
))
(declare-datatypes ((ValueCell!5484 0))(
  ( (ValueCellFull!5484 (v!8119 V!16645)) (EmptyCell!5484) )
))
(declare-datatypes ((array!27125 0))(
  ( (array!27126 (arr!13012 (Array (_ BitVec 32) ValueCell!5484)) (size!13364 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27125)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!441428 (= res!261301 (and (= (size!13364 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13363 _keys!709) (size!13364 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!441429 () Bool)

(declare-fun res!261310 () Bool)

(assert (=> b!441429 (=> (not res!261310) (not e!259923))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441429 (= res!261310 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19104 () Bool)

(declare-fun mapRes!19104 () Bool)

(assert (=> mapIsEmpty!19104 mapRes!19104))

(declare-fun b!441430 () Bool)

(declare-fun res!261302 () Bool)

(assert (=> b!441430 (=> (not res!261302) (not e!259923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441430 (= res!261302 (validMask!0 mask!1025))))

(declare-fun b!441431 () Bool)

(declare-fun e!259925 () Bool)

(declare-fun tp_is_empty!11655 () Bool)

(assert (=> b!441431 (= e!259925 tp_is_empty!11655)))

(declare-fun b!441432 () Bool)

(declare-fun e!259929 () Bool)

(declare-fun e!259926 () Bool)

(assert (=> b!441432 (= e!259929 e!259926)))

(declare-fun res!261303 () Bool)

(assert (=> b!441432 (=> (not res!261303) (not e!259926))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441432 (= res!261303 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16645)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16645)

(declare-fun lt!202895 () array!27123)

(declare-datatypes ((tuple2!7814 0))(
  ( (tuple2!7815 (_1!3918 (_ BitVec 64)) (_2!3918 V!16645)) )
))
(declare-datatypes ((List!7810 0))(
  ( (Nil!7807) (Cons!7806 (h!8662 tuple2!7814) (t!13566 List!7810)) )
))
(declare-datatypes ((ListLongMap!6727 0))(
  ( (ListLongMap!6728 (toList!3379 List!7810)) )
))
(declare-fun lt!202891 () ListLongMap!6727)

(declare-fun lt!202892 () array!27125)

(declare-fun getCurrentListMapNoExtraKeys!1568 (array!27123 array!27125 (_ BitVec 32) (_ BitVec 32) V!16645 V!16645 (_ BitVec 32) Int) ListLongMap!6727)

(assert (=> b!441432 (= lt!202891 (getCurrentListMapNoExtraKeys!1568 lt!202895 lt!202892 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16645)

(assert (=> b!441432 (= lt!202892 (array!27126 (store (arr!13012 _values!549) i!563 (ValueCellFull!5484 v!412)) (size!13364 _values!549)))))

(declare-fun lt!202894 () ListLongMap!6727)

(assert (=> b!441432 (= lt!202894 (getCurrentListMapNoExtraKeys!1568 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441433 () Bool)

(declare-fun res!261312 () Bool)

(assert (=> b!441433 (=> (not res!261312) (not e!259923))))

(declare-datatypes ((List!7811 0))(
  ( (Nil!7808) (Cons!7807 (h!8663 (_ BitVec 64)) (t!13567 List!7811)) )
))
(declare-fun arrayNoDuplicates!0 (array!27123 (_ BitVec 32) List!7811) Bool)

(assert (=> b!441433 (= res!261312 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7808))))

(declare-fun b!441434 () Bool)

(declare-fun e!259924 () Bool)

(declare-fun e!259927 () Bool)

(assert (=> b!441434 (= e!259924 (and e!259927 mapRes!19104))))

(declare-fun condMapEmpty!19104 () Bool)

(declare-fun mapDefault!19104 () ValueCell!5484)

(assert (=> b!441434 (= condMapEmpty!19104 (= (arr!13012 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5484)) mapDefault!19104)))))

(declare-fun res!261308 () Bool)

(assert (=> start!40236 (=> (not res!261308) (not e!259923))))

(assert (=> start!40236 (= res!261308 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13363 _keys!709))))))

(assert (=> start!40236 e!259923))

(assert (=> start!40236 tp_is_empty!11655))

(assert (=> start!40236 tp!37037))

(assert (=> start!40236 true))

(declare-fun array_inv!9442 (array!27125) Bool)

(assert (=> start!40236 (and (array_inv!9442 _values!549) e!259924)))

(declare-fun array_inv!9443 (array!27123) Bool)

(assert (=> start!40236 (array_inv!9443 _keys!709)))

(declare-fun b!441435 () Bool)

(assert (=> b!441435 (= e!259923 e!259929)))

(declare-fun res!261306 () Bool)

(assert (=> b!441435 (=> (not res!261306) (not e!259929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27123 (_ BitVec 32)) Bool)

(assert (=> b!441435 (= res!261306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202895 mask!1025))))

(assert (=> b!441435 (= lt!202895 (array!27124 (store (arr!13011 _keys!709) i!563 k0!794) (size!13363 _keys!709)))))

(declare-fun b!441436 () Bool)

(declare-fun res!261309 () Bool)

(assert (=> b!441436 (=> (not res!261309) (not e!259929))))

(assert (=> b!441436 (= res!261309 (arrayNoDuplicates!0 lt!202895 #b00000000000000000000000000000000 Nil!7808))))

(declare-fun b!441437 () Bool)

(declare-fun res!261305 () Bool)

(assert (=> b!441437 (=> (not res!261305) (not e!259923))))

(assert (=> b!441437 (= res!261305 (or (= (select (arr!13011 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13011 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441438 () Bool)

(declare-fun res!261300 () Bool)

(assert (=> b!441438 (=> (not res!261300) (not e!259923))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441438 (= res!261300 (validKeyInArray!0 k0!794))))

(declare-fun b!441439 () Bool)

(assert (=> b!441439 (= e!259927 tp_is_empty!11655)))

(declare-fun b!441440 () Bool)

(declare-fun res!261304 () Bool)

(assert (=> b!441440 (=> (not res!261304) (not e!259923))))

(assert (=> b!441440 (= res!261304 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13363 _keys!709))))))

(declare-fun b!441441 () Bool)

(declare-fun res!261311 () Bool)

(assert (=> b!441441 (=> (not res!261311) (not e!259929))))

(assert (=> b!441441 (= res!261311 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!19104 () Bool)

(declare-fun tp!37038 () Bool)

(assert (=> mapNonEmpty!19104 (= mapRes!19104 (and tp!37038 e!259925))))

(declare-fun mapValue!19104 () ValueCell!5484)

(declare-fun mapRest!19104 () (Array (_ BitVec 32) ValueCell!5484))

(declare-fun mapKey!19104 () (_ BitVec 32))

(assert (=> mapNonEmpty!19104 (= (arr!13012 _values!549) (store mapRest!19104 mapKey!19104 mapValue!19104))))

(declare-fun b!441442 () Bool)

(declare-fun res!261307 () Bool)

(assert (=> b!441442 (=> (not res!261307) (not e!259923))))

(assert (=> b!441442 (= res!261307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441443 () Bool)

(assert (=> b!441443 (= e!259926 (not true))))

(declare-fun +!1515 (ListLongMap!6727 tuple2!7814) ListLongMap!6727)

(assert (=> b!441443 (= (getCurrentListMapNoExtraKeys!1568 lt!202895 lt!202892 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1515 (getCurrentListMapNoExtraKeys!1568 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7815 k0!794 v!412)))))

(declare-datatypes ((Unit!13134 0))(
  ( (Unit!13135) )
))
(declare-fun lt!202893 () Unit!13134)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!684 (array!27123 array!27125 (_ BitVec 32) (_ BitVec 32) V!16645 V!16645 (_ BitVec 32) (_ BitVec 64) V!16645 (_ BitVec 32) Int) Unit!13134)

(assert (=> b!441443 (= lt!202893 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!684 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!40236 res!261308) b!441430))

(assert (= (and b!441430 res!261302) b!441428))

(assert (= (and b!441428 res!261301) b!441442))

(assert (= (and b!441442 res!261307) b!441433))

(assert (= (and b!441433 res!261312) b!441440))

(assert (= (and b!441440 res!261304) b!441438))

(assert (= (and b!441438 res!261300) b!441437))

(assert (= (and b!441437 res!261305) b!441429))

(assert (= (and b!441429 res!261310) b!441435))

(assert (= (and b!441435 res!261306) b!441436))

(assert (= (and b!441436 res!261309) b!441441))

(assert (= (and b!441441 res!261311) b!441432))

(assert (= (and b!441432 res!261303) b!441443))

(assert (= (and b!441434 condMapEmpty!19104) mapIsEmpty!19104))

(assert (= (and b!441434 (not condMapEmpty!19104)) mapNonEmpty!19104))

(get-info :version)

(assert (= (and mapNonEmpty!19104 ((_ is ValueCellFull!5484) mapValue!19104)) b!441431))

(assert (= (and b!441434 ((_ is ValueCellFull!5484) mapDefault!19104)) b!441439))

(assert (= start!40236 b!441434))

(declare-fun m!428267 () Bool)

(assert (=> b!441429 m!428267))

(declare-fun m!428269 () Bool)

(assert (=> mapNonEmpty!19104 m!428269))

(declare-fun m!428271 () Bool)

(assert (=> b!441437 m!428271))

(declare-fun m!428273 () Bool)

(assert (=> b!441430 m!428273))

(declare-fun m!428275 () Bool)

(assert (=> b!441433 m!428275))

(declare-fun m!428277 () Bool)

(assert (=> b!441438 m!428277))

(declare-fun m!428279 () Bool)

(assert (=> start!40236 m!428279))

(declare-fun m!428281 () Bool)

(assert (=> start!40236 m!428281))

(declare-fun m!428283 () Bool)

(assert (=> b!441436 m!428283))

(declare-fun m!428285 () Bool)

(assert (=> b!441432 m!428285))

(declare-fun m!428287 () Bool)

(assert (=> b!441432 m!428287))

(declare-fun m!428289 () Bool)

(assert (=> b!441432 m!428289))

(declare-fun m!428291 () Bool)

(assert (=> b!441442 m!428291))

(declare-fun m!428293 () Bool)

(assert (=> b!441443 m!428293))

(declare-fun m!428295 () Bool)

(assert (=> b!441443 m!428295))

(assert (=> b!441443 m!428295))

(declare-fun m!428297 () Bool)

(assert (=> b!441443 m!428297))

(declare-fun m!428299 () Bool)

(assert (=> b!441443 m!428299))

(declare-fun m!428301 () Bool)

(assert (=> b!441435 m!428301))

(declare-fun m!428303 () Bool)

(assert (=> b!441435 m!428303))

(check-sat (not b_next!10503) (not b!441432) b_and!18471 (not b!441438) (not b!441436) (not mapNonEmpty!19104) (not b!441442) (not start!40236) (not b!441443) tp_is_empty!11655 (not b!441435) (not b!441429) (not b!441433) (not b!441430))
(check-sat b_and!18471 (not b_next!10503))
