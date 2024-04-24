; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39152 () Bool)

(assert start!39152)

(declare-fun b_free!9433 () Bool)

(declare-fun b_next!9433 () Bool)

(assert (=> start!39152 (= b_free!9433 (not b_next!9433))))

(declare-fun tp!33827 () Bool)

(declare-fun b_and!16833 () Bool)

(assert (=> start!39152 (= tp!33827 b_and!16833)))

(declare-fun mapIsEmpty!17499 () Bool)

(declare-fun mapRes!17499 () Bool)

(assert (=> mapIsEmpty!17499 mapRes!17499))

(declare-fun b!412298 () Bool)

(declare-fun res!239414 () Bool)

(declare-fun e!246739 () Bool)

(assert (=> b!412298 (=> (not res!239414) (not e!246739))))

(declare-datatypes ((array!25032 0))(
  ( (array!25033 (arr!11965 (Array (_ BitVec 32) (_ BitVec 64))) (size!12317 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25032)

(declare-datatypes ((List!6818 0))(
  ( (Nil!6815) (Cons!6814 (h!7670 (_ BitVec 64)) (t!11984 List!6818)) )
))
(declare-fun arrayNoDuplicates!0 (array!25032 (_ BitVec 32) List!6818) Bool)

(assert (=> b!412298 (= res!239414 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6815))))

(declare-fun b!412299 () Bool)

(declare-fun res!239420 () Bool)

(declare-fun e!246740 () Bool)

(assert (=> b!412299 (=> (not res!239420) (not e!246740))))

(declare-fun lt!189481 () array!25032)

(assert (=> b!412299 (= res!239420 (arrayNoDuplicates!0 lt!189481 #b00000000000000000000000000000000 Nil!6815))))

(declare-fun b!412300 () Bool)

(declare-fun res!239419 () Bool)

(assert (=> b!412300 (=> (not res!239419) (not e!246739))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25032 (_ BitVec 32)) Bool)

(assert (=> b!412300 (= res!239419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!17499 () Bool)

(declare-fun tp!33828 () Bool)

(declare-fun e!246738 () Bool)

(assert (=> mapNonEmpty!17499 (= mapRes!17499 (and tp!33828 e!246738))))

(declare-fun mapKey!17499 () (_ BitVec 32))

(declare-datatypes ((V!15219 0))(
  ( (V!15220 (val!5337 Int)) )
))
(declare-datatypes ((ValueCell!4949 0))(
  ( (ValueCellFull!4949 (v!7585 V!15219)) (EmptyCell!4949) )
))
(declare-datatypes ((array!25034 0))(
  ( (array!25035 (arr!11966 (Array (_ BitVec 32) ValueCell!4949)) (size!12318 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25034)

(declare-fun mapRest!17499 () (Array (_ BitVec 32) ValueCell!4949))

(declare-fun mapValue!17499 () ValueCell!4949)

(assert (=> mapNonEmpty!17499 (= (arr!11966 _values!549) (store mapRest!17499 mapKey!17499 mapValue!17499))))

(declare-fun b!412301 () Bool)

(declare-fun res!239418 () Bool)

(assert (=> b!412301 (=> (not res!239418) (not e!246739))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412301 (= res!239418 (validKeyInArray!0 k0!794))))

(declare-fun b!412302 () Bool)

(declare-fun res!239424 () Bool)

(assert (=> b!412302 (=> (not res!239424) (not e!246739))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!412302 (= res!239424 (and (= (size!12318 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12317 _keys!709) (size!12318 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412303 () Bool)

(declare-fun res!239423 () Bool)

(assert (=> b!412303 (=> (not res!239423) (not e!246739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412303 (= res!239423 (validMask!0 mask!1025))))

(declare-fun b!412304 () Bool)

(declare-fun res!239415 () Bool)

(assert (=> b!412304 (=> (not res!239415) (not e!246739))))

(declare-fun arrayContainsKey!0 (array!25032 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412304 (= res!239415 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!412305 () Bool)

(declare-fun res!239416 () Bool)

(assert (=> b!412305 (=> (not res!239416) (not e!246739))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412305 (= res!239416 (or (= (select (arr!11965 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11965 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412306 () Bool)

(declare-fun res!239421 () Bool)

(assert (=> b!412306 (=> (not res!239421) (not e!246740))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!412306 (= res!239421 (bvsle from!863 i!563))))

(declare-fun b!412307 () Bool)

(declare-fun e!246742 () Bool)

(declare-fun e!246741 () Bool)

(assert (=> b!412307 (= e!246742 (and e!246741 mapRes!17499))))

(declare-fun condMapEmpty!17499 () Bool)

(declare-fun mapDefault!17499 () ValueCell!4949)

(assert (=> b!412307 (= condMapEmpty!17499 (= (arr!11966 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4949)) mapDefault!17499)))))

(declare-fun res!239413 () Bool)

(assert (=> start!39152 (=> (not res!239413) (not e!246739))))

(assert (=> start!39152 (= res!239413 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12317 _keys!709))))))

(assert (=> start!39152 e!246739))

(declare-fun tp_is_empty!10585 () Bool)

(assert (=> start!39152 tp_is_empty!10585))

(assert (=> start!39152 tp!33827))

(assert (=> start!39152 true))

(declare-fun array_inv!8804 (array!25034) Bool)

(assert (=> start!39152 (and (array_inv!8804 _values!549) e!246742)))

(declare-fun array_inv!8805 (array!25032) Bool)

(assert (=> start!39152 (array_inv!8805 _keys!709)))

(declare-fun b!412308 () Bool)

(assert (=> b!412308 (= e!246741 tp_is_empty!10585)))

(declare-fun b!412309 () Bool)

(declare-fun res!239417 () Bool)

(assert (=> b!412309 (=> (not res!239417) (not e!246739))))

(assert (=> b!412309 (= res!239417 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12317 _keys!709))))))

(declare-fun b!412310 () Bool)

(assert (=> b!412310 (= e!246740 false)))

(declare-fun minValue!515 () V!15219)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15219)

(declare-datatypes ((tuple2!6798 0))(
  ( (tuple2!6799 (_1!3410 (_ BitVec 64)) (_2!3410 V!15219)) )
))
(declare-datatypes ((List!6819 0))(
  ( (Nil!6816) (Cons!6815 (h!7671 tuple2!6798) (t!11985 List!6819)) )
))
(declare-datatypes ((ListLongMap!5713 0))(
  ( (ListLongMap!5714 (toList!2872 List!6819)) )
))
(declare-fun lt!189482 () ListLongMap!5713)

(declare-fun v!412 () V!15219)

(declare-fun getCurrentListMapNoExtraKeys!1124 (array!25032 array!25034 (_ BitVec 32) (_ BitVec 32) V!15219 V!15219 (_ BitVec 32) Int) ListLongMap!5713)

(assert (=> b!412310 (= lt!189482 (getCurrentListMapNoExtraKeys!1124 lt!189481 (array!25035 (store (arr!11966 _values!549) i!563 (ValueCellFull!4949 v!412)) (size!12318 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189483 () ListLongMap!5713)

(assert (=> b!412310 (= lt!189483 (getCurrentListMapNoExtraKeys!1124 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412311 () Bool)

(assert (=> b!412311 (= e!246738 tp_is_empty!10585)))

(declare-fun b!412312 () Bool)

(assert (=> b!412312 (= e!246739 e!246740)))

(declare-fun res!239422 () Bool)

(assert (=> b!412312 (=> (not res!239422) (not e!246740))))

(assert (=> b!412312 (= res!239422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189481 mask!1025))))

(assert (=> b!412312 (= lt!189481 (array!25033 (store (arr!11965 _keys!709) i!563 k0!794) (size!12317 _keys!709)))))

(assert (= (and start!39152 res!239413) b!412303))

(assert (= (and b!412303 res!239423) b!412302))

(assert (= (and b!412302 res!239424) b!412300))

(assert (= (and b!412300 res!239419) b!412298))

(assert (= (and b!412298 res!239414) b!412309))

(assert (= (and b!412309 res!239417) b!412301))

(assert (= (and b!412301 res!239418) b!412305))

(assert (= (and b!412305 res!239416) b!412304))

(assert (= (and b!412304 res!239415) b!412312))

(assert (= (and b!412312 res!239422) b!412299))

(assert (= (and b!412299 res!239420) b!412306))

(assert (= (and b!412306 res!239421) b!412310))

(assert (= (and b!412307 condMapEmpty!17499) mapIsEmpty!17499))

(assert (= (and b!412307 (not condMapEmpty!17499)) mapNonEmpty!17499))

(get-info :version)

(assert (= (and mapNonEmpty!17499 ((_ is ValueCellFull!4949) mapValue!17499)) b!412311))

(assert (= (and b!412307 ((_ is ValueCellFull!4949) mapDefault!17499)) b!412308))

(assert (= start!39152 b!412307))

(declare-fun m!402423 () Bool)

(assert (=> b!412305 m!402423))

(declare-fun m!402425 () Bool)

(assert (=> b!412310 m!402425))

(declare-fun m!402427 () Bool)

(assert (=> b!412310 m!402427))

(declare-fun m!402429 () Bool)

(assert (=> b!412310 m!402429))

(declare-fun m!402431 () Bool)

(assert (=> b!412304 m!402431))

(declare-fun m!402433 () Bool)

(assert (=> start!39152 m!402433))

(declare-fun m!402435 () Bool)

(assert (=> start!39152 m!402435))

(declare-fun m!402437 () Bool)

(assert (=> b!412301 m!402437))

(declare-fun m!402439 () Bool)

(assert (=> mapNonEmpty!17499 m!402439))

(declare-fun m!402441 () Bool)

(assert (=> b!412298 m!402441))

(declare-fun m!402443 () Bool)

(assert (=> b!412300 m!402443))

(declare-fun m!402445 () Bool)

(assert (=> b!412299 m!402445))

(declare-fun m!402447 () Bool)

(assert (=> b!412303 m!402447))

(declare-fun m!402449 () Bool)

(assert (=> b!412312 m!402449))

(declare-fun m!402451 () Bool)

(assert (=> b!412312 m!402451))

(check-sat (not b!412301) (not start!39152) tp_is_empty!10585 (not mapNonEmpty!17499) (not b!412298) (not b!412310) (not b!412304) (not b!412300) (not b!412303) b_and!16833 (not b!412299) (not b!412312) (not b_next!9433))
(check-sat b_and!16833 (not b_next!9433))
