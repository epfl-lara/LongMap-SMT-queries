; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40408 () Bool)

(assert start!40408)

(declare-fun b!444302 () Bool)

(declare-fun res!263434 () Bool)

(declare-fun e!261309 () Bool)

(assert (=> b!444302 (=> (not res!263434) (not e!261309))))

(declare-datatypes ((array!27395 0))(
  ( (array!27396 (arr!13145 (Array (_ BitVec 32) (_ BitVec 64))) (size!13497 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27395)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27395 (_ BitVec 32)) Bool)

(assert (=> b!444302 (= res!263434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!444303 () Bool)

(declare-fun res!263440 () Bool)

(assert (=> b!444303 (=> (not res!263440) (not e!261309))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!444303 (= res!263440 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!444304 () Bool)

(declare-fun res!263438 () Bool)

(assert (=> b!444304 (=> (not res!263438) (not e!261309))))

(declare-datatypes ((List!7870 0))(
  ( (Nil!7867) (Cons!7866 (h!8722 (_ BitVec 64)) (t!13628 List!7870)) )
))
(declare-fun arrayNoDuplicates!0 (array!27395 (_ BitVec 32) List!7870) Bool)

(assert (=> b!444304 (= res!263438 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7867))))

(declare-fun b!444305 () Bool)

(declare-fun e!261310 () Bool)

(declare-fun tp_is_empty!11793 () Bool)

(assert (=> b!444305 (= e!261310 tp_is_empty!11793)))

(declare-fun b!444306 () Bool)

(declare-fun e!261311 () Bool)

(assert (=> b!444306 (= e!261311 false)))

(declare-fun lt!203471 () Bool)

(declare-fun lt!203470 () array!27395)

(assert (=> b!444306 (= lt!203471 (arrayNoDuplicates!0 lt!203470 #b00000000000000000000000000000000 Nil!7867))))

(declare-fun mapIsEmpty!19317 () Bool)

(declare-fun mapRes!19317 () Bool)

(assert (=> mapIsEmpty!19317 mapRes!19317))

(declare-fun mapNonEmpty!19317 () Bool)

(declare-fun tp!37299 () Bool)

(assert (=> mapNonEmpty!19317 (= mapRes!19317 (and tp!37299 e!261310))))

(declare-datatypes ((V!16829 0))(
  ( (V!16830 (val!5941 Int)) )
))
(declare-datatypes ((ValueCell!5553 0))(
  ( (ValueCellFull!5553 (v!8192 V!16829)) (EmptyCell!5553) )
))
(declare-fun mapValue!19317 () ValueCell!5553)

(declare-fun mapKey!19317 () (_ BitVec 32))

(declare-datatypes ((array!27397 0))(
  ( (array!27398 (arr!13146 (Array (_ BitVec 32) ValueCell!5553)) (size!13498 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27397)

(declare-fun mapRest!19317 () (Array (_ BitVec 32) ValueCell!5553))

(assert (=> mapNonEmpty!19317 (= (arr!13146 _values!549) (store mapRest!19317 mapKey!19317 mapValue!19317))))

(declare-fun res!263432 () Bool)

(assert (=> start!40408 (=> (not res!263432) (not e!261309))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40408 (= res!263432 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13497 _keys!709))))))

(assert (=> start!40408 e!261309))

(assert (=> start!40408 true))

(declare-fun e!261312 () Bool)

(declare-fun array_inv!9534 (array!27397) Bool)

(assert (=> start!40408 (and (array_inv!9534 _values!549) e!261312)))

(declare-fun array_inv!9535 (array!27395) Bool)

(assert (=> start!40408 (array_inv!9535 _keys!709)))

(declare-fun b!444307 () Bool)

(declare-fun res!263436 () Bool)

(assert (=> b!444307 (=> (not res!263436) (not e!261309))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!444307 (= res!263436 (validKeyInArray!0 k0!794))))

(declare-fun b!444308 () Bool)

(declare-fun e!261314 () Bool)

(assert (=> b!444308 (= e!261314 tp_is_empty!11793)))

(declare-fun b!444309 () Bool)

(assert (=> b!444309 (= e!261309 e!261311)))

(declare-fun res!263439 () Bool)

(assert (=> b!444309 (=> (not res!263439) (not e!261311))))

(assert (=> b!444309 (= res!263439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203470 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!444309 (= lt!203470 (array!27396 (store (arr!13145 _keys!709) i!563 k0!794) (size!13497 _keys!709)))))

(declare-fun b!444310 () Bool)

(declare-fun res!263435 () Bool)

(assert (=> b!444310 (=> (not res!263435) (not e!261309))))

(assert (=> b!444310 (= res!263435 (or (= (select (arr!13145 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13145 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!444311 () Bool)

(declare-fun res!263431 () Bool)

(assert (=> b!444311 (=> (not res!263431) (not e!261309))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!444311 (= res!263431 (validMask!0 mask!1025))))

(declare-fun b!444312 () Bool)

(assert (=> b!444312 (= e!261312 (and e!261314 mapRes!19317))))

(declare-fun condMapEmpty!19317 () Bool)

(declare-fun mapDefault!19317 () ValueCell!5553)

(assert (=> b!444312 (= condMapEmpty!19317 (= (arr!13146 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5553)) mapDefault!19317)))))

(declare-fun b!444313 () Bool)

(declare-fun res!263437 () Bool)

(assert (=> b!444313 (=> (not res!263437) (not e!261309))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!444313 (= res!263437 (and (= (size!13498 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13497 _keys!709) (size!13498 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!444314 () Bool)

(declare-fun res!263433 () Bool)

(assert (=> b!444314 (=> (not res!263433) (not e!261309))))

(assert (=> b!444314 (= res!263433 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13497 _keys!709))))))

(assert (= (and start!40408 res!263432) b!444311))

(assert (= (and b!444311 res!263431) b!444313))

(assert (= (and b!444313 res!263437) b!444302))

(assert (= (and b!444302 res!263434) b!444304))

(assert (= (and b!444304 res!263438) b!444314))

(assert (= (and b!444314 res!263433) b!444307))

(assert (= (and b!444307 res!263436) b!444310))

(assert (= (and b!444310 res!263435) b!444303))

(assert (= (and b!444303 res!263440) b!444309))

(assert (= (and b!444309 res!263439) b!444306))

(assert (= (and b!444312 condMapEmpty!19317) mapIsEmpty!19317))

(assert (= (and b!444312 (not condMapEmpty!19317)) mapNonEmpty!19317))

(get-info :version)

(assert (= (and mapNonEmpty!19317 ((_ is ValueCellFull!5553) mapValue!19317)) b!444305))

(assert (= (and b!444312 ((_ is ValueCellFull!5553) mapDefault!19317)) b!444308))

(assert (= start!40408 b!444312))

(declare-fun m!430237 () Bool)

(assert (=> b!444309 m!430237))

(declare-fun m!430239 () Bool)

(assert (=> b!444309 m!430239))

(declare-fun m!430241 () Bool)

(assert (=> mapNonEmpty!19317 m!430241))

(declare-fun m!430243 () Bool)

(assert (=> b!444302 m!430243))

(declare-fun m!430245 () Bool)

(assert (=> b!444306 m!430245))

(declare-fun m!430247 () Bool)

(assert (=> b!444303 m!430247))

(declare-fun m!430249 () Bool)

(assert (=> b!444310 m!430249))

(declare-fun m!430251 () Bool)

(assert (=> b!444304 m!430251))

(declare-fun m!430253 () Bool)

(assert (=> start!40408 m!430253))

(declare-fun m!430255 () Bool)

(assert (=> start!40408 m!430255))

(declare-fun m!430257 () Bool)

(assert (=> b!444307 m!430257))

(declare-fun m!430259 () Bool)

(assert (=> b!444311 m!430259))

(check-sat (not b!444304) (not b!444306) (not b!444302) (not b!444309) (not b!444307) tp_is_empty!11793 (not start!40408) (not b!444311) (not mapNonEmpty!19317) (not b!444303))
(check-sat)
