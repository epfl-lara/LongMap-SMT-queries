; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39522 () Bool)

(assert start!39522)

(declare-fun b_free!9789 () Bool)

(declare-fun b_next!9789 () Bool)

(assert (=> start!39522 (= b_free!9789 (not b_next!9789))))

(declare-fun tp!34895 () Bool)

(declare-fun b_and!17445 () Bool)

(assert (=> start!39522 (= tp!34895 b_and!17445)))

(declare-fun b!422499 () Bool)

(declare-fun res!246725 () Bool)

(declare-fun e!251361 () Bool)

(assert (=> b!422499 (=> (not res!246725) (not e!251361))))

(declare-datatypes ((array!25729 0))(
  ( (array!25730 (arr!12314 (Array (_ BitVec 32) (_ BitVec 64))) (size!12666 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25729)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422499 (= res!246725 (or (= (select (arr!12314 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12314 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422500 () Bool)

(declare-fun res!246729 () Bool)

(assert (=> b!422500 (=> (not res!246729) (not e!251361))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422500 (= res!246729 (validKeyInArray!0 k0!794))))

(declare-fun b!422501 () Bool)

(declare-fun e!251363 () Bool)

(assert (=> b!422501 (= e!251363 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15693 0))(
  ( (V!15694 (val!5515 Int)) )
))
(declare-fun minValue!515 () V!15693)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5127 0))(
  ( (ValueCellFull!5127 (v!7762 V!15693)) (EmptyCell!5127) )
))
(declare-datatypes ((array!25731 0))(
  ( (array!25732 (arr!12315 (Array (_ BitVec 32) ValueCell!5127)) (size!12667 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25731)

(declare-fun zeroValue!515 () V!15693)

(declare-datatypes ((tuple2!7244 0))(
  ( (tuple2!7245 (_1!3633 (_ BitVec 64)) (_2!3633 V!15693)) )
))
(declare-datatypes ((List!7249 0))(
  ( (Nil!7246) (Cons!7245 (h!8101 tuple2!7244) (t!12693 List!7249)) )
))
(declare-datatypes ((ListLongMap!6157 0))(
  ( (ListLongMap!6158 (toList!3094 List!7249)) )
))
(declare-fun lt!193982 () ListLongMap!6157)

(declare-fun v!412 () V!15693)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!193981 () array!25729)

(declare-fun getCurrentListMapNoExtraKeys!1298 (array!25729 array!25731 (_ BitVec 32) (_ BitVec 32) V!15693 V!15693 (_ BitVec 32) Int) ListLongMap!6157)

(assert (=> b!422501 (= lt!193982 (getCurrentListMapNoExtraKeys!1298 lt!193981 (array!25732 (store (arr!12315 _values!549) i!563 (ValueCellFull!5127 v!412)) (size!12667 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!193980 () ListLongMap!6157)

(assert (=> b!422501 (= lt!193980 (getCurrentListMapNoExtraKeys!1298 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422502 () Bool)

(declare-fun res!246728 () Bool)

(assert (=> b!422502 (=> (not res!246728) (not e!251361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422502 (= res!246728 (validMask!0 mask!1025))))

(declare-fun b!422504 () Bool)

(declare-fun res!246727 () Bool)

(assert (=> b!422504 (=> (not res!246727) (not e!251361))))

(assert (=> b!422504 (= res!246727 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12666 _keys!709))))))

(declare-fun b!422505 () Bool)

(declare-fun e!251364 () Bool)

(declare-fun tp_is_empty!10941 () Bool)

(assert (=> b!422505 (= e!251364 tp_is_empty!10941)))

(declare-fun b!422506 () Bool)

(declare-fun e!251359 () Bool)

(declare-fun mapRes!18033 () Bool)

(assert (=> b!422506 (= e!251359 (and e!251364 mapRes!18033))))

(declare-fun condMapEmpty!18033 () Bool)

(declare-fun mapDefault!18033 () ValueCell!5127)

(assert (=> b!422506 (= condMapEmpty!18033 (= (arr!12315 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5127)) mapDefault!18033)))))

(declare-fun b!422507 () Bool)

(declare-fun res!246733 () Bool)

(assert (=> b!422507 (=> (not res!246733) (not e!251361))))

(declare-fun arrayContainsKey!0 (array!25729 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422507 (= res!246733 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!422508 () Bool)

(declare-fun res!246731 () Bool)

(assert (=> b!422508 (=> (not res!246731) (not e!251361))))

(assert (=> b!422508 (= res!246731 (and (= (size!12667 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12666 _keys!709) (size!12667 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422509 () Bool)

(declare-fun res!246726 () Bool)

(assert (=> b!422509 (=> (not res!246726) (not e!251361))))

(declare-datatypes ((List!7250 0))(
  ( (Nil!7247) (Cons!7246 (h!8102 (_ BitVec 64)) (t!12694 List!7250)) )
))
(declare-fun arrayNoDuplicates!0 (array!25729 (_ BitVec 32) List!7250) Bool)

(assert (=> b!422509 (= res!246726 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7247))))

(declare-fun b!422510 () Bool)

(declare-fun res!246724 () Bool)

(assert (=> b!422510 (=> (not res!246724) (not e!251363))))

(assert (=> b!422510 (= res!246724 (arrayNoDuplicates!0 lt!193981 #b00000000000000000000000000000000 Nil!7247))))

(declare-fun b!422511 () Bool)

(declare-fun res!246734 () Bool)

(assert (=> b!422511 (=> (not res!246734) (not e!251363))))

(assert (=> b!422511 (= res!246734 (bvsle from!863 i!563))))

(declare-fun b!422512 () Bool)

(declare-fun res!246730 () Bool)

(assert (=> b!422512 (=> (not res!246730) (not e!251361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25729 (_ BitVec 32)) Bool)

(assert (=> b!422512 (= res!246730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422503 () Bool)

(assert (=> b!422503 (= e!251361 e!251363)))

(declare-fun res!246735 () Bool)

(assert (=> b!422503 (=> (not res!246735) (not e!251363))))

(assert (=> b!422503 (= res!246735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193981 mask!1025))))

(assert (=> b!422503 (= lt!193981 (array!25730 (store (arr!12314 _keys!709) i!563 k0!794) (size!12666 _keys!709)))))

(declare-fun res!246732 () Bool)

(assert (=> start!39522 (=> (not res!246732) (not e!251361))))

(assert (=> start!39522 (= res!246732 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12666 _keys!709))))))

(assert (=> start!39522 e!251361))

(assert (=> start!39522 tp_is_empty!10941))

(assert (=> start!39522 tp!34895))

(assert (=> start!39522 true))

(declare-fun array_inv!8974 (array!25731) Bool)

(assert (=> start!39522 (and (array_inv!8974 _values!549) e!251359)))

(declare-fun array_inv!8975 (array!25729) Bool)

(assert (=> start!39522 (array_inv!8975 _keys!709)))

(declare-fun b!422513 () Bool)

(declare-fun e!251360 () Bool)

(assert (=> b!422513 (= e!251360 tp_is_empty!10941)))

(declare-fun mapNonEmpty!18033 () Bool)

(declare-fun tp!34896 () Bool)

(assert (=> mapNonEmpty!18033 (= mapRes!18033 (and tp!34896 e!251360))))

(declare-fun mapRest!18033 () (Array (_ BitVec 32) ValueCell!5127))

(declare-fun mapValue!18033 () ValueCell!5127)

(declare-fun mapKey!18033 () (_ BitVec 32))

(assert (=> mapNonEmpty!18033 (= (arr!12315 _values!549) (store mapRest!18033 mapKey!18033 mapValue!18033))))

(declare-fun mapIsEmpty!18033 () Bool)

(assert (=> mapIsEmpty!18033 mapRes!18033))

(assert (= (and start!39522 res!246732) b!422502))

(assert (= (and b!422502 res!246728) b!422508))

(assert (= (and b!422508 res!246731) b!422512))

(assert (= (and b!422512 res!246730) b!422509))

(assert (= (and b!422509 res!246726) b!422504))

(assert (= (and b!422504 res!246727) b!422500))

(assert (= (and b!422500 res!246729) b!422499))

(assert (= (and b!422499 res!246725) b!422507))

(assert (= (and b!422507 res!246733) b!422503))

(assert (= (and b!422503 res!246735) b!422510))

(assert (= (and b!422510 res!246724) b!422511))

(assert (= (and b!422511 res!246734) b!422501))

(assert (= (and b!422506 condMapEmpty!18033) mapIsEmpty!18033))

(assert (= (and b!422506 (not condMapEmpty!18033)) mapNonEmpty!18033))

(get-info :version)

(assert (= (and mapNonEmpty!18033 ((_ is ValueCellFull!5127) mapValue!18033)) b!422513))

(assert (= (and b!422506 ((_ is ValueCellFull!5127) mapDefault!18033)) b!422505))

(assert (= start!39522 b!422506))

(declare-fun m!412293 () Bool)

(assert (=> start!39522 m!412293))

(declare-fun m!412295 () Bool)

(assert (=> start!39522 m!412295))

(declare-fun m!412297 () Bool)

(assert (=> b!422503 m!412297))

(declare-fun m!412299 () Bool)

(assert (=> b!422503 m!412299))

(declare-fun m!412301 () Bool)

(assert (=> b!422500 m!412301))

(declare-fun m!412303 () Bool)

(assert (=> b!422509 m!412303))

(declare-fun m!412305 () Bool)

(assert (=> mapNonEmpty!18033 m!412305))

(declare-fun m!412307 () Bool)

(assert (=> b!422507 m!412307))

(declare-fun m!412309 () Bool)

(assert (=> b!422499 m!412309))

(declare-fun m!412311 () Bool)

(assert (=> b!422501 m!412311))

(declare-fun m!412313 () Bool)

(assert (=> b!422501 m!412313))

(declare-fun m!412315 () Bool)

(assert (=> b!422501 m!412315))

(declare-fun m!412317 () Bool)

(assert (=> b!422512 m!412317))

(declare-fun m!412319 () Bool)

(assert (=> b!422502 m!412319))

(declare-fun m!412321 () Bool)

(assert (=> b!422510 m!412321))

(check-sat (not b_next!9789) (not b!422510) (not b!422507) (not b!422503) (not b!422501) (not start!39522) b_and!17445 (not b!422500) (not b!422502) (not b!422509) tp_is_empty!10941 (not b!422512) (not mapNonEmpty!18033))
(check-sat b_and!17445 (not b_next!9789))
