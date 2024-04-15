; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39692 () Bool)

(assert start!39692)

(declare-fun b_free!9973 () Bool)

(declare-fun b_next!9973 () Bool)

(assert (=> start!39692 (= b_free!9973 (not b_next!9973))))

(declare-fun tp!35448 () Bool)

(declare-fun b_and!17603 () Bool)

(assert (=> start!39692 (= tp!35448 b_and!17603)))

(declare-fun b!426496 () Bool)

(declare-fun res!250038 () Bool)

(declare-fun e!252972 () Bool)

(assert (=> b!426496 (=> (not res!250038) (not e!252972))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26079 0))(
  ( (array!26080 (arr!12489 (Array (_ BitVec 32) (_ BitVec 64))) (size!12842 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26079)

(assert (=> b!426496 (= res!250038 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12842 _keys!709))))))

(declare-fun b!426497 () Bool)

(declare-fun res!250044 () Bool)

(assert (=> b!426497 (=> (not res!250044) (not e!252972))))

(assert (=> b!426497 (= res!250044 (or (= (select (arr!12489 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12489 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426498 () Bool)

(declare-fun res!250047 () Bool)

(assert (=> b!426498 (=> (not res!250047) (not e!252972))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426498 (= res!250047 (validKeyInArray!0 k0!794))))

(declare-fun b!426499 () Bool)

(declare-fun res!250043 () Bool)

(assert (=> b!426499 (=> (not res!250043) (not e!252972))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26079 (_ BitVec 32)) Bool)

(assert (=> b!426499 (= res!250043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!250045 () Bool)

(assert (=> start!39692 (=> (not res!250045) (not e!252972))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39692 (= res!250045 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12842 _keys!709))))))

(assert (=> start!39692 e!252972))

(declare-fun tp_is_empty!11125 () Bool)

(assert (=> start!39692 tp_is_empty!11125))

(assert (=> start!39692 tp!35448))

(assert (=> start!39692 true))

(declare-datatypes ((V!15939 0))(
  ( (V!15940 (val!5607 Int)) )
))
(declare-datatypes ((ValueCell!5219 0))(
  ( (ValueCellFull!5219 (v!7848 V!15939)) (EmptyCell!5219) )
))
(declare-datatypes ((array!26081 0))(
  ( (array!26082 (arr!12490 (Array (_ BitVec 32) ValueCell!5219)) (size!12843 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26081)

(declare-fun e!252975 () Bool)

(declare-fun array_inv!9128 (array!26081) Bool)

(assert (=> start!39692 (and (array_inv!9128 _values!549) e!252975)))

(declare-fun array_inv!9129 (array!26079) Bool)

(assert (=> start!39692 (array_inv!9129 _keys!709)))

(declare-fun mapNonEmpty!18309 () Bool)

(declare-fun mapRes!18309 () Bool)

(declare-fun tp!35447 () Bool)

(declare-fun e!252971 () Bool)

(assert (=> mapNonEmpty!18309 (= mapRes!18309 (and tp!35447 e!252971))))

(declare-fun mapKey!18309 () (_ BitVec 32))

(declare-fun mapRest!18309 () (Array (_ BitVec 32) ValueCell!5219))

(declare-fun mapValue!18309 () ValueCell!5219)

(assert (=> mapNonEmpty!18309 (= (arr!12490 _values!549) (store mapRest!18309 mapKey!18309 mapValue!18309))))

(declare-fun b!426500 () Bool)

(declare-fun e!252970 () Bool)

(assert (=> b!426500 (= e!252970 tp_is_empty!11125)))

(declare-fun b!426501 () Bool)

(assert (=> b!426501 (= e!252971 tp_is_empty!11125)))

(declare-fun b!426502 () Bool)

(declare-fun res!250046 () Bool)

(assert (=> b!426502 (=> (not res!250046) (not e!252972))))

(declare-fun arrayContainsKey!0 (array!26079 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426502 (= res!250046 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!426503 () Bool)

(declare-fun res!250040 () Bool)

(assert (=> b!426503 (=> (not res!250040) (not e!252972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426503 (= res!250040 (validMask!0 mask!1025))))

(declare-fun b!426504 () Bool)

(assert (=> b!426504 (= e!252975 (and e!252970 mapRes!18309))))

(declare-fun condMapEmpty!18309 () Bool)

(declare-fun mapDefault!18309 () ValueCell!5219)

(assert (=> b!426504 (= condMapEmpty!18309 (= (arr!12490 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5219)) mapDefault!18309)))))

(declare-fun b!426505 () Bool)

(declare-fun res!250035 () Bool)

(assert (=> b!426505 (=> (not res!250035) (not e!252972))))

(declare-datatypes ((List!7367 0))(
  ( (Nil!7364) (Cons!7363 (h!8219 (_ BitVec 64)) (t!12802 List!7367)) )
))
(declare-fun arrayNoDuplicates!0 (array!26079 (_ BitVec 32) List!7367) Bool)

(assert (=> b!426505 (= res!250035 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7364))))

(declare-fun b!426506 () Bool)

(declare-fun e!252974 () Bool)

(declare-fun e!252973 () Bool)

(assert (=> b!426506 (= e!252974 e!252973)))

(declare-fun res!250039 () Bool)

(assert (=> b!426506 (=> (not res!250039) (not e!252973))))

(assert (=> b!426506 (= res!250039 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15939)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!194832 () array!26081)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!194831 () array!26079)

(declare-datatypes ((tuple2!7364 0))(
  ( (tuple2!7365 (_1!3693 (_ BitVec 64)) (_2!3693 V!15939)) )
))
(declare-datatypes ((List!7368 0))(
  ( (Nil!7365) (Cons!7364 (h!8220 tuple2!7364) (t!12803 List!7368)) )
))
(declare-datatypes ((ListLongMap!6267 0))(
  ( (ListLongMap!6268 (toList!3149 List!7368)) )
))
(declare-fun lt!194830 () ListLongMap!6267)

(declare-fun zeroValue!515 () V!15939)

(declare-fun getCurrentListMapNoExtraKeys!1357 (array!26079 array!26081 (_ BitVec 32) (_ BitVec 32) V!15939 V!15939 (_ BitVec 32) Int) ListLongMap!6267)

(assert (=> b!426506 (= lt!194830 (getCurrentListMapNoExtraKeys!1357 lt!194831 lt!194832 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15939)

(assert (=> b!426506 (= lt!194832 (array!26082 (store (arr!12490 _values!549) i!563 (ValueCellFull!5219 v!412)) (size!12843 _values!549)))))

(declare-fun lt!194833 () ListLongMap!6267)

(assert (=> b!426506 (= lt!194833 (getCurrentListMapNoExtraKeys!1357 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426507 () Bool)

(declare-fun res!250041 () Bool)

(assert (=> b!426507 (=> (not res!250041) (not e!252972))))

(assert (=> b!426507 (= res!250041 (and (= (size!12843 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12842 _keys!709) (size!12843 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426508 () Bool)

(declare-fun res!250037 () Bool)

(assert (=> b!426508 (=> (not res!250037) (not e!252974))))

(assert (=> b!426508 (= res!250037 (bvsle from!863 i!563))))

(declare-fun b!426509 () Bool)

(declare-fun res!250042 () Bool)

(assert (=> b!426509 (=> (not res!250042) (not e!252974))))

(assert (=> b!426509 (= res!250042 (arrayNoDuplicates!0 lt!194831 #b00000000000000000000000000000000 Nil!7364))))

(declare-fun mapIsEmpty!18309 () Bool)

(assert (=> mapIsEmpty!18309 mapRes!18309))

(declare-fun b!426510 () Bool)

(assert (=> b!426510 (= e!252973 (not true))))

(declare-fun +!1328 (ListLongMap!6267 tuple2!7364) ListLongMap!6267)

(assert (=> b!426510 (= (getCurrentListMapNoExtraKeys!1357 lt!194831 lt!194832 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1328 (getCurrentListMapNoExtraKeys!1357 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7365 k0!794 v!412)))))

(declare-datatypes ((Unit!12502 0))(
  ( (Unit!12503) )
))
(declare-fun lt!194834 () Unit!12502)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!499 (array!26079 array!26081 (_ BitVec 32) (_ BitVec 32) V!15939 V!15939 (_ BitVec 32) (_ BitVec 64) V!15939 (_ BitVec 32) Int) Unit!12502)

(assert (=> b!426510 (= lt!194834 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!499 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426511 () Bool)

(assert (=> b!426511 (= e!252972 e!252974)))

(declare-fun res!250036 () Bool)

(assert (=> b!426511 (=> (not res!250036) (not e!252974))))

(assert (=> b!426511 (= res!250036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194831 mask!1025))))

(assert (=> b!426511 (= lt!194831 (array!26080 (store (arr!12489 _keys!709) i!563 k0!794) (size!12842 _keys!709)))))

(assert (= (and start!39692 res!250045) b!426503))

(assert (= (and b!426503 res!250040) b!426507))

(assert (= (and b!426507 res!250041) b!426499))

(assert (= (and b!426499 res!250043) b!426505))

(assert (= (and b!426505 res!250035) b!426496))

(assert (= (and b!426496 res!250038) b!426498))

(assert (= (and b!426498 res!250047) b!426497))

(assert (= (and b!426497 res!250044) b!426502))

(assert (= (and b!426502 res!250046) b!426511))

(assert (= (and b!426511 res!250036) b!426509))

(assert (= (and b!426509 res!250042) b!426508))

(assert (= (and b!426508 res!250037) b!426506))

(assert (= (and b!426506 res!250039) b!426510))

(assert (= (and b!426504 condMapEmpty!18309) mapIsEmpty!18309))

(assert (= (and b!426504 (not condMapEmpty!18309)) mapNonEmpty!18309))

(get-info :version)

(assert (= (and mapNonEmpty!18309 ((_ is ValueCellFull!5219) mapValue!18309)) b!426501))

(assert (= (and b!426504 ((_ is ValueCellFull!5219) mapDefault!18309)) b!426500))

(assert (= start!39692 b!426504))

(declare-fun m!414657 () Bool)

(assert (=> b!426499 m!414657))

(declare-fun m!414659 () Bool)

(assert (=> b!426509 m!414659))

(declare-fun m!414661 () Bool)

(assert (=> b!426510 m!414661))

(declare-fun m!414663 () Bool)

(assert (=> b!426510 m!414663))

(assert (=> b!426510 m!414663))

(declare-fun m!414665 () Bool)

(assert (=> b!426510 m!414665))

(declare-fun m!414667 () Bool)

(assert (=> b!426510 m!414667))

(declare-fun m!414669 () Bool)

(assert (=> b!426506 m!414669))

(declare-fun m!414671 () Bool)

(assert (=> b!426506 m!414671))

(declare-fun m!414673 () Bool)

(assert (=> b!426506 m!414673))

(declare-fun m!414675 () Bool)

(assert (=> b!426511 m!414675))

(declare-fun m!414677 () Bool)

(assert (=> b!426511 m!414677))

(declare-fun m!414679 () Bool)

(assert (=> b!426505 m!414679))

(declare-fun m!414681 () Bool)

(assert (=> b!426503 m!414681))

(declare-fun m!414683 () Bool)

(assert (=> start!39692 m!414683))

(declare-fun m!414685 () Bool)

(assert (=> start!39692 m!414685))

(declare-fun m!414687 () Bool)

(assert (=> mapNonEmpty!18309 m!414687))

(declare-fun m!414689 () Bool)

(assert (=> b!426497 m!414689))

(declare-fun m!414691 () Bool)

(assert (=> b!426502 m!414691))

(declare-fun m!414693 () Bool)

(assert (=> b!426498 m!414693))

(check-sat (not b!426499) (not b!426506) (not b!426498) tp_is_empty!11125 (not b_next!9973) (not b!426502) (not b!426509) (not b!426511) (not mapNonEmpty!18309) (not b!426510) (not start!39692) (not b!426505) (not b!426503) b_and!17603)
(check-sat b_and!17603 (not b_next!9973))
