; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40344 () Bool)

(assert start!40344)

(declare-fun mapNonEmpty!19242 () Bool)

(declare-fun mapRes!19242 () Bool)

(declare-fun tp!37224 () Bool)

(declare-fun e!260830 () Bool)

(assert (=> mapNonEmpty!19242 (= mapRes!19242 (and tp!37224 e!260830))))

(declare-datatypes ((V!16763 0))(
  ( (V!16764 (val!5916 Int)) )
))
(declare-datatypes ((ValueCell!5528 0))(
  ( (ValueCellFull!5528 (v!8168 V!16763)) (EmptyCell!5528) )
))
(declare-fun mapValue!19242 () ValueCell!5528)

(declare-datatypes ((array!27300 0))(
  ( (array!27301 (arr!13097 (Array (_ BitVec 32) ValueCell!5528)) (size!13449 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27300)

(declare-fun mapKey!19242 () (_ BitVec 32))

(declare-fun mapRest!19242 () (Array (_ BitVec 32) ValueCell!5528))

(assert (=> mapNonEmpty!19242 (= (arr!13097 _values!549) (store mapRest!19242 mapKey!19242 mapValue!19242))))

(declare-fun b!443278 () Bool)

(declare-fun e!260829 () Bool)

(declare-fun e!260831 () Bool)

(assert (=> b!443278 (= e!260829 e!260831)))

(declare-fun res!262678 () Bool)

(assert (=> b!443278 (=> (not res!262678) (not e!260831))))

(declare-datatypes ((array!27302 0))(
  ( (array!27303 (arr!13098 (Array (_ BitVec 32) (_ BitVec 64))) (size!13450 (_ BitVec 32))) )
))
(declare-fun lt!203339 () array!27302)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27302 (_ BitVec 32)) Bool)

(assert (=> b!443278 (= res!262678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203339 mask!1025))))

(declare-fun _keys!709 () array!27302)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443278 (= lt!203339 (array!27303 (store (arr!13098 _keys!709) i!563 k0!794) (size!13450 _keys!709)))))

(declare-fun b!443279 () Bool)

(declare-fun res!262681 () Bool)

(assert (=> b!443279 (=> (not res!262681) (not e!260829))))

(assert (=> b!443279 (= res!262681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443280 () Bool)

(assert (=> b!443280 (= e!260831 false)))

(declare-fun lt!203340 () Bool)

(declare-datatypes ((List!7759 0))(
  ( (Nil!7756) (Cons!7755 (h!8611 (_ BitVec 64)) (t!13509 List!7759)) )
))
(declare-fun arrayNoDuplicates!0 (array!27302 (_ BitVec 32) List!7759) Bool)

(assert (=> b!443280 (= lt!203340 (arrayNoDuplicates!0 lt!203339 #b00000000000000000000000000000000 Nil!7756))))

(declare-fun b!443281 () Bool)

(declare-fun e!260827 () Bool)

(declare-fun e!260832 () Bool)

(assert (=> b!443281 (= e!260827 (and e!260832 mapRes!19242))))

(declare-fun condMapEmpty!19242 () Bool)

(declare-fun mapDefault!19242 () ValueCell!5528)

(assert (=> b!443281 (= condMapEmpty!19242 (= (arr!13097 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5528)) mapDefault!19242)))))

(declare-fun b!443282 () Bool)

(declare-fun tp_is_empty!11743 () Bool)

(assert (=> b!443282 (= e!260832 tp_is_empty!11743)))

(declare-fun b!443283 () Bool)

(declare-fun res!262680 () Bool)

(assert (=> b!443283 (=> (not res!262680) (not e!260829))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!443283 (= res!262680 (and (= (size!13449 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13450 _keys!709) (size!13449 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443284 () Bool)

(assert (=> b!443284 (= e!260830 tp_is_empty!11743)))

(declare-fun b!443285 () Bool)

(declare-fun res!262686 () Bool)

(assert (=> b!443285 (=> (not res!262686) (not e!260829))))

(declare-fun arrayContainsKey!0 (array!27302 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443285 (= res!262686 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!262684 () Bool)

(assert (=> start!40344 (=> (not res!262684) (not e!260829))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40344 (= res!262684 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13450 _keys!709))))))

(assert (=> start!40344 e!260829))

(assert (=> start!40344 true))

(declare-fun array_inv!9570 (array!27300) Bool)

(assert (=> start!40344 (and (array_inv!9570 _values!549) e!260827)))

(declare-fun array_inv!9571 (array!27302) Bool)

(assert (=> start!40344 (array_inv!9571 _keys!709)))

(declare-fun b!443286 () Bool)

(declare-fun res!262679 () Bool)

(assert (=> b!443286 (=> (not res!262679) (not e!260829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443286 (= res!262679 (validKeyInArray!0 k0!794))))

(declare-fun b!443287 () Bool)

(declare-fun res!262683 () Bool)

(assert (=> b!443287 (=> (not res!262683) (not e!260829))))

(assert (=> b!443287 (= res!262683 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13450 _keys!709))))))

(declare-fun b!443288 () Bool)

(declare-fun res!262685 () Bool)

(assert (=> b!443288 (=> (not res!262685) (not e!260829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443288 (= res!262685 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19242 () Bool)

(assert (=> mapIsEmpty!19242 mapRes!19242))

(declare-fun b!443289 () Bool)

(declare-fun res!262687 () Bool)

(assert (=> b!443289 (=> (not res!262687) (not e!260829))))

(assert (=> b!443289 (= res!262687 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7756))))

(declare-fun b!443290 () Bool)

(declare-fun res!262682 () Bool)

(assert (=> b!443290 (=> (not res!262682) (not e!260829))))

(assert (=> b!443290 (= res!262682 (or (= (select (arr!13098 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13098 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!40344 res!262684) b!443288))

(assert (= (and b!443288 res!262685) b!443283))

(assert (= (and b!443283 res!262680) b!443279))

(assert (= (and b!443279 res!262681) b!443289))

(assert (= (and b!443289 res!262687) b!443287))

(assert (= (and b!443287 res!262683) b!443286))

(assert (= (and b!443286 res!262679) b!443290))

(assert (= (and b!443290 res!262682) b!443285))

(assert (= (and b!443285 res!262686) b!443278))

(assert (= (and b!443278 res!262678) b!443280))

(assert (= (and b!443281 condMapEmpty!19242) mapIsEmpty!19242))

(assert (= (and b!443281 (not condMapEmpty!19242)) mapNonEmpty!19242))

(get-info :version)

(assert (= (and mapNonEmpty!19242 ((_ is ValueCellFull!5528) mapValue!19242)) b!443284))

(assert (= (and b!443281 ((_ is ValueCellFull!5528) mapDefault!19242)) b!443282))

(assert (= start!40344 b!443281))

(declare-fun m!429855 () Bool)

(assert (=> b!443279 m!429855))

(declare-fun m!429857 () Bool)

(assert (=> b!443286 m!429857))

(declare-fun m!429859 () Bool)

(assert (=> b!443280 m!429859))

(declare-fun m!429861 () Bool)

(assert (=> start!40344 m!429861))

(declare-fun m!429863 () Bool)

(assert (=> start!40344 m!429863))

(declare-fun m!429865 () Bool)

(assert (=> b!443289 m!429865))

(declare-fun m!429867 () Bool)

(assert (=> b!443285 m!429867))

(declare-fun m!429869 () Bool)

(assert (=> mapNonEmpty!19242 m!429869))

(declare-fun m!429871 () Bool)

(assert (=> b!443288 m!429871))

(declare-fun m!429873 () Bool)

(assert (=> b!443290 m!429873))

(declare-fun m!429875 () Bool)

(assert (=> b!443278 m!429875))

(declare-fun m!429877 () Bool)

(assert (=> b!443278 m!429877))

(check-sat (not b!443289) tp_is_empty!11743 (not b!443279) (not b!443286) (not b!443285) (not start!40344) (not b!443288) (not mapNonEmpty!19242) (not b!443278) (not b!443280))
(check-sat)
