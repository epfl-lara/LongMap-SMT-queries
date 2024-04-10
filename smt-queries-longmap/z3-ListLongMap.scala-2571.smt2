; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39246 () Bool)

(assert start!39246)

(declare-fun b_free!9513 () Bool)

(declare-fun b_next!9513 () Bool)

(assert (=> start!39246 (= b_free!9513 (not b_next!9513))))

(declare-fun tp!34067 () Bool)

(declare-fun b_and!16901 () Bool)

(assert (=> start!39246 (= tp!34067 b_and!16901)))

(declare-fun b!414421 () Bool)

(declare-fun res!240961 () Bool)

(declare-fun e!247676 () Bool)

(assert (=> b!414421 (=> (not res!240961) (not e!247676))))

(declare-datatypes ((array!25187 0))(
  ( (array!25188 (arr!12043 (Array (_ BitVec 32) (_ BitVec 64))) (size!12395 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25187)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25187 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414421 (= res!240961 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-datatypes ((V!15325 0))(
  ( (V!15326 (val!5377 Int)) )
))
(declare-fun minValue!515 () V!15325)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!189995 () array!25187)

(declare-datatypes ((ValueCell!4989 0))(
  ( (ValueCellFull!4989 (v!7624 V!15325)) (EmptyCell!4989) )
))
(declare-datatypes ((array!25189 0))(
  ( (array!25190 (arr!12044 (Array (_ BitVec 32) ValueCell!4989)) (size!12396 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25189)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!189997 () array!25189)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6994 0))(
  ( (tuple2!6995 (_1!3508 (_ BitVec 64)) (_2!3508 V!15325)) )
))
(declare-datatypes ((List!7016 0))(
  ( (Nil!7013) (Cons!7012 (h!7868 tuple2!6994) (t!12194 List!7016)) )
))
(declare-datatypes ((ListLongMap!5907 0))(
  ( (ListLongMap!5908 (toList!2969 List!7016)) )
))
(declare-fun call!28718 () ListLongMap!5907)

(declare-fun bm!28714 () Bool)

(declare-fun c!54983 () Bool)

(declare-fun zeroValue!515 () V!15325)

(declare-fun getCurrentListMapNoExtraKeys!1175 (array!25187 array!25189 (_ BitVec 32) (_ BitVec 32) V!15325 V!15325 (_ BitVec 32) Int) ListLongMap!5907)

(assert (=> bm!28714 (= call!28718 (getCurrentListMapNoExtraKeys!1175 (ite c!54983 lt!189995 _keys!709) (ite c!54983 lt!189997 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414422 () Bool)

(declare-fun res!240964 () Bool)

(assert (=> b!414422 (=> (not res!240964) (not e!247676))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414422 (= res!240964 (validKeyInArray!0 k0!794))))

(declare-fun b!414424 () Bool)

(declare-fun res!240959 () Bool)

(assert (=> b!414424 (=> (not res!240959) (not e!247676))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414424 (= res!240959 (or (= (select (arr!12043 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12043 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!414425 () Bool)

(declare-fun e!247677 () Bool)

(declare-fun tp_is_empty!10665 () Bool)

(assert (=> b!414425 (= e!247677 tp_is_empty!10665)))

(declare-fun mapIsEmpty!17619 () Bool)

(declare-fun mapRes!17619 () Bool)

(assert (=> mapIsEmpty!17619 mapRes!17619))

(declare-fun b!414426 () Bool)

(declare-fun e!247681 () Bool)

(declare-fun e!247683 () Bool)

(assert (=> b!414426 (= e!247681 (not e!247683))))

(declare-fun res!240965 () Bool)

(assert (=> b!414426 (=> res!240965 e!247683)))

(assert (=> b!414426 (= res!240965 (validKeyInArray!0 (select (arr!12043 _keys!709) from!863)))))

(declare-fun e!247680 () Bool)

(assert (=> b!414426 e!247680))

(assert (=> b!414426 (= c!54983 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12256 0))(
  ( (Unit!12257) )
))
(declare-fun lt!189998 () Unit!12256)

(declare-fun v!412 () V!15325)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!386 (array!25187 array!25189 (_ BitVec 32) (_ BitVec 32) V!15325 V!15325 (_ BitVec 32) (_ BitVec 64) V!15325 (_ BitVec 32) Int) Unit!12256)

(assert (=> b!414426 (= lt!189998 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!386 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!28717 () ListLongMap!5907)

(declare-fun b!414427 () Bool)

(declare-fun +!1175 (ListLongMap!5907 tuple2!6994) ListLongMap!5907)

(assert (=> b!414427 (= e!247680 (= call!28718 (+!1175 call!28717 (tuple2!6995 k0!794 v!412))))))

(declare-fun b!414428 () Bool)

(declare-fun res!240957 () Bool)

(assert (=> b!414428 (=> (not res!240957) (not e!247676))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25187 (_ BitVec 32)) Bool)

(assert (=> b!414428 (= res!240957 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!414429 () Bool)

(declare-fun e!247675 () Bool)

(assert (=> b!414429 (= e!247676 e!247675)))

(declare-fun res!240966 () Bool)

(assert (=> b!414429 (=> (not res!240966) (not e!247675))))

(assert (=> b!414429 (= res!240966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189995 mask!1025))))

(assert (=> b!414429 (= lt!189995 (array!25188 (store (arr!12043 _keys!709) i!563 k0!794) (size!12395 _keys!709)))))

(declare-fun b!414430 () Bool)

(assert (=> b!414430 (= e!247683 true)))

(declare-fun lt!189996 () ListLongMap!5907)

(declare-fun get!5938 (ValueCell!4989 V!15325) V!15325)

(declare-fun dynLambda!653 (Int (_ BitVec 64)) V!15325)

(assert (=> b!414430 (= lt!189996 (+!1175 (getCurrentListMapNoExtraKeys!1175 lt!189995 lt!189997 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!6995 (select (arr!12043 lt!189995) from!863) (get!5938 (select (arr!12044 lt!189997) from!863) (dynLambda!653 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!414431 () Bool)

(declare-fun e!247678 () Bool)

(assert (=> b!414431 (= e!247678 (and e!247677 mapRes!17619))))

(declare-fun condMapEmpty!17619 () Bool)

(declare-fun mapDefault!17619 () ValueCell!4989)

(assert (=> b!414431 (= condMapEmpty!17619 (= (arr!12044 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4989)) mapDefault!17619)))))

(declare-fun b!414432 () Bool)

(declare-fun res!240968 () Bool)

(assert (=> b!414432 (=> (not res!240968) (not e!247676))))

(assert (=> b!414432 (= res!240968 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12395 _keys!709))))))

(declare-fun b!414433 () Bool)

(declare-fun res!240963 () Bool)

(assert (=> b!414433 (=> (not res!240963) (not e!247675))))

(declare-datatypes ((List!7017 0))(
  ( (Nil!7014) (Cons!7013 (h!7869 (_ BitVec 64)) (t!12195 List!7017)) )
))
(declare-fun arrayNoDuplicates!0 (array!25187 (_ BitVec 32) List!7017) Bool)

(assert (=> b!414433 (= res!240963 (arrayNoDuplicates!0 lt!189995 #b00000000000000000000000000000000 Nil!7014))))

(declare-fun b!414434 () Bool)

(assert (=> b!414434 (= e!247680 (= call!28717 call!28718))))

(declare-fun b!414435 () Bool)

(declare-fun res!240958 () Bool)

(assert (=> b!414435 (=> (not res!240958) (not e!247676))))

(assert (=> b!414435 (= res!240958 (and (= (size!12396 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12395 _keys!709) (size!12396 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!28715 () Bool)

(assert (=> bm!28715 (= call!28717 (getCurrentListMapNoExtraKeys!1175 (ite c!54983 _keys!709 lt!189995) (ite c!54983 _values!549 lt!189997) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17619 () Bool)

(declare-fun tp!34068 () Bool)

(declare-fun e!247679 () Bool)

(assert (=> mapNonEmpty!17619 (= mapRes!17619 (and tp!34068 e!247679))))

(declare-fun mapValue!17619 () ValueCell!4989)

(declare-fun mapKey!17619 () (_ BitVec 32))

(declare-fun mapRest!17619 () (Array (_ BitVec 32) ValueCell!4989))

(assert (=> mapNonEmpty!17619 (= (arr!12044 _values!549) (store mapRest!17619 mapKey!17619 mapValue!17619))))

(declare-fun res!240956 () Bool)

(assert (=> start!39246 (=> (not res!240956) (not e!247676))))

(assert (=> start!39246 (= res!240956 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12395 _keys!709))))))

(assert (=> start!39246 e!247676))

(assert (=> start!39246 tp_is_empty!10665))

(assert (=> start!39246 tp!34067))

(assert (=> start!39246 true))

(declare-fun array_inv!8782 (array!25189) Bool)

(assert (=> start!39246 (and (array_inv!8782 _values!549) e!247678)))

(declare-fun array_inv!8783 (array!25187) Bool)

(assert (=> start!39246 (array_inv!8783 _keys!709)))

(declare-fun b!414423 () Bool)

(declare-fun res!240969 () Bool)

(assert (=> b!414423 (=> (not res!240969) (not e!247676))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414423 (= res!240969 (validMask!0 mask!1025))))

(declare-fun b!414436 () Bool)

(assert (=> b!414436 (= e!247679 tp_is_empty!10665)))

(declare-fun b!414437 () Bool)

(assert (=> b!414437 (= e!247675 e!247681)))

(declare-fun res!240960 () Bool)

(assert (=> b!414437 (=> (not res!240960) (not e!247681))))

(assert (=> b!414437 (= res!240960 (= from!863 i!563))))

(assert (=> b!414437 (= lt!189996 (getCurrentListMapNoExtraKeys!1175 lt!189995 lt!189997 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!414437 (= lt!189997 (array!25190 (store (arr!12044 _values!549) i!563 (ValueCellFull!4989 v!412)) (size!12396 _values!549)))))

(declare-fun lt!189994 () ListLongMap!5907)

(assert (=> b!414437 (= lt!189994 (getCurrentListMapNoExtraKeys!1175 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!414438 () Bool)

(declare-fun res!240962 () Bool)

(assert (=> b!414438 (=> (not res!240962) (not e!247676))))

(assert (=> b!414438 (= res!240962 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7014))))

(declare-fun b!414439 () Bool)

(declare-fun res!240967 () Bool)

(assert (=> b!414439 (=> (not res!240967) (not e!247675))))

(assert (=> b!414439 (= res!240967 (bvsle from!863 i!563))))

(assert (= (and start!39246 res!240956) b!414423))

(assert (= (and b!414423 res!240969) b!414435))

(assert (= (and b!414435 res!240958) b!414428))

(assert (= (and b!414428 res!240957) b!414438))

(assert (= (and b!414438 res!240962) b!414432))

(assert (= (and b!414432 res!240968) b!414422))

(assert (= (and b!414422 res!240964) b!414424))

(assert (= (and b!414424 res!240959) b!414421))

(assert (= (and b!414421 res!240961) b!414429))

(assert (= (and b!414429 res!240966) b!414433))

(assert (= (and b!414433 res!240963) b!414439))

(assert (= (and b!414439 res!240967) b!414437))

(assert (= (and b!414437 res!240960) b!414426))

(assert (= (and b!414426 c!54983) b!414427))

(assert (= (and b!414426 (not c!54983)) b!414434))

(assert (= (or b!414427 b!414434) bm!28714))

(assert (= (or b!414427 b!414434) bm!28715))

(assert (= (and b!414426 (not res!240965)) b!414430))

(assert (= (and b!414431 condMapEmpty!17619) mapIsEmpty!17619))

(assert (= (and b!414431 (not condMapEmpty!17619)) mapNonEmpty!17619))

(get-info :version)

(assert (= (and mapNonEmpty!17619 ((_ is ValueCellFull!4989) mapValue!17619)) b!414436))

(assert (= (and b!414431 ((_ is ValueCellFull!4989) mapDefault!17619)) b!414425))

(assert (= start!39246 b!414431))

(declare-fun b_lambda!8817 () Bool)

(assert (=> (not b_lambda!8817) (not b!414430)))

(declare-fun t!12193 () Bool)

(declare-fun tb!3135 () Bool)

(assert (=> (and start!39246 (= defaultEntry!557 defaultEntry!557) t!12193) tb!3135))

(declare-fun result!5797 () Bool)

(assert (=> tb!3135 (= result!5797 tp_is_empty!10665)))

(assert (=> b!414430 t!12193))

(declare-fun b_and!16903 () Bool)

(assert (= b_and!16901 (and (=> t!12193 result!5797) b_and!16903)))

(declare-fun m!403645 () Bool)

(assert (=> b!414427 m!403645))

(declare-fun m!403647 () Bool)

(assert (=> b!414433 m!403647))

(declare-fun m!403649 () Bool)

(assert (=> b!414437 m!403649))

(declare-fun m!403651 () Bool)

(assert (=> b!414437 m!403651))

(declare-fun m!403653 () Bool)

(assert (=> b!414437 m!403653))

(declare-fun m!403655 () Bool)

(assert (=> b!414423 m!403655))

(declare-fun m!403657 () Bool)

(assert (=> b!414429 m!403657))

(declare-fun m!403659 () Bool)

(assert (=> b!414429 m!403659))

(declare-fun m!403661 () Bool)

(assert (=> bm!28714 m!403661))

(declare-fun m!403663 () Bool)

(assert (=> start!39246 m!403663))

(declare-fun m!403665 () Bool)

(assert (=> start!39246 m!403665))

(declare-fun m!403667 () Bool)

(assert (=> b!414428 m!403667))

(declare-fun m!403669 () Bool)

(assert (=> b!414421 m!403669))

(declare-fun m!403671 () Bool)

(assert (=> b!414426 m!403671))

(assert (=> b!414426 m!403671))

(declare-fun m!403673 () Bool)

(assert (=> b!414426 m!403673))

(declare-fun m!403675 () Bool)

(assert (=> b!414426 m!403675))

(declare-fun m!403677 () Bool)

(assert (=> mapNonEmpty!17619 m!403677))

(declare-fun m!403679 () Bool)

(assert (=> b!414424 m!403679))

(declare-fun m!403681 () Bool)

(assert (=> b!414438 m!403681))

(declare-fun m!403683 () Bool)

(assert (=> b!414422 m!403683))

(declare-fun m!403685 () Bool)

(assert (=> b!414430 m!403685))

(assert (=> b!414430 m!403685))

(declare-fun m!403687 () Bool)

(assert (=> b!414430 m!403687))

(declare-fun m!403689 () Bool)

(assert (=> b!414430 m!403689))

(declare-fun m!403691 () Bool)

(assert (=> b!414430 m!403691))

(declare-fun m!403693 () Bool)

(assert (=> b!414430 m!403693))

(assert (=> b!414430 m!403691))

(assert (=> b!414430 m!403689))

(declare-fun m!403695 () Bool)

(assert (=> b!414430 m!403695))

(declare-fun m!403697 () Bool)

(assert (=> bm!28715 m!403697))

(check-sat (not b!414422) (not b!414433) (not b_lambda!8817) (not b!414437) (not b!414429) (not b!414428) (not bm!28714) (not b!414421) tp_is_empty!10665 (not bm!28715) (not mapNonEmpty!17619) (not b!414427) (not b!414438) (not b!414423) b_and!16903 (not start!39246) (not b!414430) (not b_next!9513) (not b!414426))
(check-sat b_and!16903 (not b_next!9513))
