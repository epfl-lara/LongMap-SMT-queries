; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39570 () Bool)

(assert start!39570)

(declare-fun b_free!9837 () Bool)

(declare-fun b_next!9837 () Bool)

(assert (=> start!39570 (= b_free!9837 (not b_next!9837))))

(declare-fun tp!35039 () Bool)

(declare-fun b_and!17493 () Bool)

(assert (=> start!39570 (= tp!35039 b_and!17493)))

(declare-fun b!423579 () Bool)

(declare-fun res!247589 () Bool)

(declare-fun e!251796 () Bool)

(assert (=> b!423579 (=> (not res!247589) (not e!251796))))

(declare-datatypes ((array!25821 0))(
  ( (array!25822 (arr!12360 (Array (_ BitVec 32) (_ BitVec 64))) (size!12712 (_ BitVec 32))) )
))
(declare-fun lt!194197 () array!25821)

(declare-datatypes ((List!7282 0))(
  ( (Nil!7279) (Cons!7278 (h!8134 (_ BitVec 64)) (t!12726 List!7282)) )
))
(declare-fun arrayNoDuplicates!0 (array!25821 (_ BitVec 32) List!7282) Bool)

(assert (=> b!423579 (= res!247589 (arrayNoDuplicates!0 lt!194197 #b00000000000000000000000000000000 Nil!7279))))

(declare-fun mapIsEmpty!18105 () Bool)

(declare-fun mapRes!18105 () Bool)

(assert (=> mapIsEmpty!18105 mapRes!18105))

(declare-fun b!423580 () Bool)

(declare-fun res!247592 () Bool)

(declare-fun e!251792 () Bool)

(assert (=> b!423580 (=> (not res!247592) (not e!251792))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!25821)

(assert (=> b!423580 (= res!247592 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12712 _keys!709))))))

(declare-fun mapNonEmpty!18105 () Bool)

(declare-fun tp!35040 () Bool)

(declare-fun e!251791 () Bool)

(assert (=> mapNonEmpty!18105 (= mapRes!18105 (and tp!35040 e!251791))))

(declare-fun mapKey!18105 () (_ BitVec 32))

(declare-datatypes ((V!15757 0))(
  ( (V!15758 (val!5539 Int)) )
))
(declare-datatypes ((ValueCell!5151 0))(
  ( (ValueCellFull!5151 (v!7786 V!15757)) (EmptyCell!5151) )
))
(declare-datatypes ((array!25823 0))(
  ( (array!25824 (arr!12361 (Array (_ BitVec 32) ValueCell!5151)) (size!12713 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25823)

(declare-fun mapRest!18105 () (Array (_ BitVec 32) ValueCell!5151))

(declare-fun mapValue!18105 () ValueCell!5151)

(assert (=> mapNonEmpty!18105 (= (arr!12361 _values!549) (store mapRest!18105 mapKey!18105 mapValue!18105))))

(declare-fun b!423581 () Bool)

(declare-fun res!247598 () Bool)

(assert (=> b!423581 (=> (not res!247598) (not e!251796))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!423581 (= res!247598 (bvsle from!863 i!563))))

(declare-fun b!423582 () Bool)

(declare-fun res!247595 () Bool)

(assert (=> b!423582 (=> (not res!247595) (not e!251792))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423582 (= res!247595 (validKeyInArray!0 k0!794))))

(declare-fun b!423584 () Bool)

(declare-fun res!247596 () Bool)

(assert (=> b!423584 (=> (not res!247596) (not e!251792))))

(declare-fun arrayContainsKey!0 (array!25821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423584 (= res!247596 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!423585 () Bool)

(assert (=> b!423585 (= e!251796 false)))

(declare-fun minValue!515 () V!15757)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15757)

(declare-fun v!412 () V!15757)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7274 0))(
  ( (tuple2!7275 (_1!3648 (_ BitVec 64)) (_2!3648 V!15757)) )
))
(declare-datatypes ((List!7283 0))(
  ( (Nil!7280) (Cons!7279 (h!8135 tuple2!7274) (t!12727 List!7283)) )
))
(declare-datatypes ((ListLongMap!6187 0))(
  ( (ListLongMap!6188 (toList!3109 List!7283)) )
))
(declare-fun lt!194196 () ListLongMap!6187)

(declare-fun getCurrentListMapNoExtraKeys!1313 (array!25821 array!25823 (_ BitVec 32) (_ BitVec 32) V!15757 V!15757 (_ BitVec 32) Int) ListLongMap!6187)

(assert (=> b!423585 (= lt!194196 (getCurrentListMapNoExtraKeys!1313 lt!194197 (array!25824 (store (arr!12361 _values!549) i!563 (ValueCellFull!5151 v!412)) (size!12713 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194198 () ListLongMap!6187)

(assert (=> b!423585 (= lt!194198 (getCurrentListMapNoExtraKeys!1313 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423586 () Bool)

(declare-fun res!247594 () Bool)

(assert (=> b!423586 (=> (not res!247594) (not e!251792))))

(assert (=> b!423586 (= res!247594 (and (= (size!12713 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12712 _keys!709) (size!12713 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423587 () Bool)

(declare-fun res!247597 () Bool)

(assert (=> b!423587 (=> (not res!247597) (not e!251792))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423587 (= res!247597 (validMask!0 mask!1025))))

(declare-fun b!423588 () Bool)

(declare-fun e!251793 () Bool)

(declare-fun e!251794 () Bool)

(assert (=> b!423588 (= e!251793 (and e!251794 mapRes!18105))))

(declare-fun condMapEmpty!18105 () Bool)

(declare-fun mapDefault!18105 () ValueCell!5151)

(assert (=> b!423588 (= condMapEmpty!18105 (= (arr!12361 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5151)) mapDefault!18105)))))

(declare-fun b!423589 () Bool)

(declare-fun tp_is_empty!10989 () Bool)

(assert (=> b!423589 (= e!251794 tp_is_empty!10989)))

(declare-fun b!423590 () Bool)

(declare-fun res!247588 () Bool)

(assert (=> b!423590 (=> (not res!247588) (not e!251792))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25821 (_ BitVec 32)) Bool)

(assert (=> b!423590 (= res!247588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423591 () Bool)

(declare-fun res!247599 () Bool)

(assert (=> b!423591 (=> (not res!247599) (not e!251792))))

(assert (=> b!423591 (= res!247599 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7279))))

(declare-fun b!423592 () Bool)

(assert (=> b!423592 (= e!251792 e!251796)))

(declare-fun res!247590 () Bool)

(assert (=> b!423592 (=> (not res!247590) (not e!251796))))

(assert (=> b!423592 (= res!247590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194197 mask!1025))))

(assert (=> b!423592 (= lt!194197 (array!25822 (store (arr!12360 _keys!709) i!563 k0!794) (size!12712 _keys!709)))))

(declare-fun b!423593 () Bool)

(assert (=> b!423593 (= e!251791 tp_is_empty!10989)))

(declare-fun b!423583 () Bool)

(declare-fun res!247591 () Bool)

(assert (=> b!423583 (=> (not res!247591) (not e!251792))))

(assert (=> b!423583 (= res!247591 (or (= (select (arr!12360 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12360 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!247593 () Bool)

(assert (=> start!39570 (=> (not res!247593) (not e!251792))))

(assert (=> start!39570 (= res!247593 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12712 _keys!709))))))

(assert (=> start!39570 e!251792))

(assert (=> start!39570 tp_is_empty!10989))

(assert (=> start!39570 tp!35039))

(assert (=> start!39570 true))

(declare-fun array_inv!9006 (array!25823) Bool)

(assert (=> start!39570 (and (array_inv!9006 _values!549) e!251793)))

(declare-fun array_inv!9007 (array!25821) Bool)

(assert (=> start!39570 (array_inv!9007 _keys!709)))

(assert (= (and start!39570 res!247593) b!423587))

(assert (= (and b!423587 res!247597) b!423586))

(assert (= (and b!423586 res!247594) b!423590))

(assert (= (and b!423590 res!247588) b!423591))

(assert (= (and b!423591 res!247599) b!423580))

(assert (= (and b!423580 res!247592) b!423582))

(assert (= (and b!423582 res!247595) b!423583))

(assert (= (and b!423583 res!247591) b!423584))

(assert (= (and b!423584 res!247596) b!423592))

(assert (= (and b!423592 res!247590) b!423579))

(assert (= (and b!423579 res!247589) b!423581))

(assert (= (and b!423581 res!247598) b!423585))

(assert (= (and b!423588 condMapEmpty!18105) mapIsEmpty!18105))

(assert (= (and b!423588 (not condMapEmpty!18105)) mapNonEmpty!18105))

(get-info :version)

(assert (= (and mapNonEmpty!18105 ((_ is ValueCellFull!5151) mapValue!18105)) b!423593))

(assert (= (and b!423588 ((_ is ValueCellFull!5151) mapDefault!18105)) b!423589))

(assert (= start!39570 b!423588))

(declare-fun m!413013 () Bool)

(assert (=> b!423587 m!413013))

(declare-fun m!413015 () Bool)

(assert (=> b!423583 m!413015))

(declare-fun m!413017 () Bool)

(assert (=> mapNonEmpty!18105 m!413017))

(declare-fun m!413019 () Bool)

(assert (=> b!423584 m!413019))

(declare-fun m!413021 () Bool)

(assert (=> b!423585 m!413021))

(declare-fun m!413023 () Bool)

(assert (=> b!423585 m!413023))

(declare-fun m!413025 () Bool)

(assert (=> b!423585 m!413025))

(declare-fun m!413027 () Bool)

(assert (=> b!423590 m!413027))

(declare-fun m!413029 () Bool)

(assert (=> b!423582 m!413029))

(declare-fun m!413031 () Bool)

(assert (=> b!423579 m!413031))

(declare-fun m!413033 () Bool)

(assert (=> b!423592 m!413033))

(declare-fun m!413035 () Bool)

(assert (=> b!423592 m!413035))

(declare-fun m!413037 () Bool)

(assert (=> b!423591 m!413037))

(declare-fun m!413039 () Bool)

(assert (=> start!39570 m!413039))

(declare-fun m!413041 () Bool)

(assert (=> start!39570 m!413041))

(check-sat (not mapNonEmpty!18105) b_and!17493 (not b!423579) (not b!423582) (not b!423592) (not b!423584) (not b!423587) tp_is_empty!10989 (not b!423590) (not b!423585) (not start!39570) (not b_next!9837) (not b!423591))
(check-sat b_and!17493 (not b_next!9837))
