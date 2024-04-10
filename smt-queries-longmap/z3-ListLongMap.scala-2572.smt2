; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39252 () Bool)

(assert start!39252)

(declare-fun b_free!9519 () Bool)

(declare-fun b_next!9519 () Bool)

(assert (=> start!39252 (= b_free!9519 (not b_next!9519))))

(declare-fun tp!34086 () Bool)

(declare-fun b_and!16913 () Bool)

(assert (=> start!39252 (= tp!34086 b_and!16913)))

(declare-fun b!414598 () Bool)

(declare-fun e!247759 () Bool)

(declare-fun e!247758 () Bool)

(declare-fun mapRes!17628 () Bool)

(assert (=> b!414598 (= e!247759 (and e!247758 mapRes!17628))))

(declare-fun condMapEmpty!17628 () Bool)

(declare-datatypes ((V!15333 0))(
  ( (V!15334 (val!5380 Int)) )
))
(declare-datatypes ((ValueCell!4992 0))(
  ( (ValueCellFull!4992 (v!7627 V!15333)) (EmptyCell!4992) )
))
(declare-datatypes ((array!25199 0))(
  ( (array!25200 (arr!12049 (Array (_ BitVec 32) ValueCell!4992)) (size!12401 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25199)

(declare-fun mapDefault!17628 () ValueCell!4992)

(assert (=> b!414598 (= condMapEmpty!17628 (= (arr!12049 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4992)) mapDefault!17628)))))

(declare-fun res!241087 () Bool)

(declare-fun e!247757 () Bool)

(assert (=> start!39252 (=> (not res!241087) (not e!247757))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25201 0))(
  ( (array!25202 (arr!12050 (Array (_ BitVec 32) (_ BitVec 64))) (size!12402 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25201)

(assert (=> start!39252 (= res!241087 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12402 _keys!709))))))

(assert (=> start!39252 e!247757))

(declare-fun tp_is_empty!10671 () Bool)

(assert (=> start!39252 tp_is_empty!10671))

(assert (=> start!39252 tp!34086))

(assert (=> start!39252 true))

(declare-fun array_inv!8788 (array!25199) Bool)

(assert (=> start!39252 (and (array_inv!8788 _values!549) e!247759)))

(declare-fun array_inv!8789 (array!25201) Bool)

(assert (=> start!39252 (array_inv!8789 _keys!709)))

(declare-fun b!414599 () Bool)

(declare-fun res!241086 () Bool)

(assert (=> b!414599 (=> (not res!241086) (not e!247757))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414599 (= res!241086 (validKeyInArray!0 k0!794))))

(declare-fun b!414600 () Bool)

(declare-fun res!241095 () Bool)

(assert (=> b!414600 (=> (not res!241095) (not e!247757))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414600 (= res!241095 (or (= (select (arr!12050 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12050 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!414601 () Bool)

(declare-fun e!247764 () Bool)

(declare-datatypes ((tuple2!7000 0))(
  ( (tuple2!7001 (_1!3511 (_ BitVec 64)) (_2!3511 V!15333)) )
))
(declare-datatypes ((List!7022 0))(
  ( (Nil!7019) (Cons!7018 (h!7874 tuple2!7000) (t!12206 List!7022)) )
))
(declare-datatypes ((ListLongMap!5913 0))(
  ( (ListLongMap!5914 (toList!2972 List!7022)) )
))
(declare-fun call!28736 () ListLongMap!5913)

(declare-fun call!28735 () ListLongMap!5913)

(assert (=> b!414601 (= e!247764 (= call!28736 call!28735))))

(declare-fun b!414602 () Bool)

(declare-fun res!241083 () Bool)

(declare-fun e!247756 () Bool)

(assert (=> b!414602 (=> (not res!241083) (not e!247756))))

(assert (=> b!414602 (= res!241083 (bvsle from!863 i!563))))

(declare-fun b!414603 () Bool)

(assert (=> b!414603 (= e!247757 e!247756)))

(declare-fun res!241088 () Bool)

(assert (=> b!414603 (=> (not res!241088) (not e!247756))))

(declare-fun lt!190040 () array!25201)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25201 (_ BitVec 32)) Bool)

(assert (=> b!414603 (= res!241088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190040 mask!1025))))

(assert (=> b!414603 (= lt!190040 (array!25202 (store (arr!12050 _keys!709) i!563 k0!794) (size!12402 _keys!709)))))

(declare-fun b!414604 () Bool)

(declare-fun e!247760 () Bool)

(assert (=> b!414604 (= e!247756 e!247760)))

(declare-fun res!241085 () Bool)

(assert (=> b!414604 (=> (not res!241085) (not e!247760))))

(assert (=> b!414604 (= res!241085 (= from!863 i!563))))

(declare-fun lt!190041 () array!25199)

(declare-fun minValue!515 () V!15333)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!190042 () ListLongMap!5913)

(declare-fun zeroValue!515 () V!15333)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1178 (array!25201 array!25199 (_ BitVec 32) (_ BitVec 32) V!15333 V!15333 (_ BitVec 32) Int) ListLongMap!5913)

(assert (=> b!414604 (= lt!190042 (getCurrentListMapNoExtraKeys!1178 lt!190040 lt!190041 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15333)

(assert (=> b!414604 (= lt!190041 (array!25200 (store (arr!12049 _values!549) i!563 (ValueCellFull!4992 v!412)) (size!12401 _values!549)))))

(declare-fun lt!190043 () ListLongMap!5913)

(assert (=> b!414604 (= lt!190043 (getCurrentListMapNoExtraKeys!1178 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!414605 () Bool)

(declare-fun +!1178 (ListLongMap!5913 tuple2!7000) ListLongMap!5913)

(assert (=> b!414605 (= e!247764 (= call!28735 (+!1178 call!28736 (tuple2!7001 k0!794 v!412))))))

(declare-fun b!414606 () Bool)

(declare-fun res!241092 () Bool)

(assert (=> b!414606 (=> (not res!241092) (not e!247756))))

(declare-datatypes ((List!7023 0))(
  ( (Nil!7020) (Cons!7019 (h!7875 (_ BitVec 64)) (t!12207 List!7023)) )
))
(declare-fun arrayNoDuplicates!0 (array!25201 (_ BitVec 32) List!7023) Bool)

(assert (=> b!414606 (= res!241092 (arrayNoDuplicates!0 lt!190040 #b00000000000000000000000000000000 Nil!7020))))

(declare-fun b!414607 () Bool)

(declare-fun e!247762 () Bool)

(assert (=> b!414607 (= e!247762 true)))

(declare-fun get!5942 (ValueCell!4992 V!15333) V!15333)

(declare-fun dynLambda!655 (Int (_ BitVec 64)) V!15333)

(assert (=> b!414607 (= lt!190042 (+!1178 (getCurrentListMapNoExtraKeys!1178 lt!190040 lt!190041 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7001 (select (arr!12050 lt!190040) from!863) (get!5942 (select (arr!12049 lt!190041) from!863) (dynLambda!655 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun bm!28732 () Bool)

(declare-fun c!54992 () Bool)

(assert (=> bm!28732 (= call!28736 (getCurrentListMapNoExtraKeys!1178 (ite c!54992 _keys!709 lt!190040) (ite c!54992 _values!549 lt!190041) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17628 () Bool)

(assert (=> mapIsEmpty!17628 mapRes!17628))

(declare-fun b!414608 () Bool)

(declare-fun res!241091 () Bool)

(assert (=> b!414608 (=> (not res!241091) (not e!247757))))

(assert (=> b!414608 (= res!241091 (and (= (size!12401 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12402 _keys!709) (size!12401 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414609 () Bool)

(declare-fun res!241090 () Bool)

(assert (=> b!414609 (=> (not res!241090) (not e!247757))))

(assert (=> b!414609 (= res!241090 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7020))))

(declare-fun b!414610 () Bool)

(declare-fun res!241089 () Bool)

(assert (=> b!414610 (=> (not res!241089) (not e!247757))))

(declare-fun arrayContainsKey!0 (array!25201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414610 (= res!241089 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun bm!28733 () Bool)

(assert (=> bm!28733 (= call!28735 (getCurrentListMapNoExtraKeys!1178 (ite c!54992 lt!190040 _keys!709) (ite c!54992 lt!190041 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414611 () Bool)

(declare-fun res!241094 () Bool)

(assert (=> b!414611 (=> (not res!241094) (not e!247757))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414611 (= res!241094 (validMask!0 mask!1025))))

(declare-fun b!414612 () Bool)

(assert (=> b!414612 (= e!247758 tp_is_empty!10671)))

(declare-fun b!414613 () Bool)

(declare-fun res!241082 () Bool)

(assert (=> b!414613 (=> (not res!241082) (not e!247757))))

(assert (=> b!414613 (= res!241082 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12402 _keys!709))))))

(declare-fun b!414614 () Bool)

(declare-fun res!241084 () Bool)

(assert (=> b!414614 (=> (not res!241084) (not e!247757))))

(assert (=> b!414614 (= res!241084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!17628 () Bool)

(declare-fun tp!34085 () Bool)

(declare-fun e!247761 () Bool)

(assert (=> mapNonEmpty!17628 (= mapRes!17628 (and tp!34085 e!247761))))

(declare-fun mapValue!17628 () ValueCell!4992)

(declare-fun mapRest!17628 () (Array (_ BitVec 32) ValueCell!4992))

(declare-fun mapKey!17628 () (_ BitVec 32))

(assert (=> mapNonEmpty!17628 (= (arr!12049 _values!549) (store mapRest!17628 mapKey!17628 mapValue!17628))))

(declare-fun b!414615 () Bool)

(assert (=> b!414615 (= e!247760 (not e!247762))))

(declare-fun res!241093 () Bool)

(assert (=> b!414615 (=> res!241093 e!247762)))

(assert (=> b!414615 (= res!241093 (validKeyInArray!0 (select (arr!12050 _keys!709) from!863)))))

(assert (=> b!414615 e!247764))

(assert (=> b!414615 (= c!54992 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12260 0))(
  ( (Unit!12261) )
))
(declare-fun lt!190039 () Unit!12260)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!388 (array!25201 array!25199 (_ BitVec 32) (_ BitVec 32) V!15333 V!15333 (_ BitVec 32) (_ BitVec 64) V!15333 (_ BitVec 32) Int) Unit!12260)

(assert (=> b!414615 (= lt!190039 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!388 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414616 () Bool)

(assert (=> b!414616 (= e!247761 tp_is_empty!10671)))

(assert (= (and start!39252 res!241087) b!414611))

(assert (= (and b!414611 res!241094) b!414608))

(assert (= (and b!414608 res!241091) b!414614))

(assert (= (and b!414614 res!241084) b!414609))

(assert (= (and b!414609 res!241090) b!414613))

(assert (= (and b!414613 res!241082) b!414599))

(assert (= (and b!414599 res!241086) b!414600))

(assert (= (and b!414600 res!241095) b!414610))

(assert (= (and b!414610 res!241089) b!414603))

(assert (= (and b!414603 res!241088) b!414606))

(assert (= (and b!414606 res!241092) b!414602))

(assert (= (and b!414602 res!241083) b!414604))

(assert (= (and b!414604 res!241085) b!414615))

(assert (= (and b!414615 c!54992) b!414605))

(assert (= (and b!414615 (not c!54992)) b!414601))

(assert (= (or b!414605 b!414601) bm!28733))

(assert (= (or b!414605 b!414601) bm!28732))

(assert (= (and b!414615 (not res!241093)) b!414607))

(assert (= (and b!414598 condMapEmpty!17628) mapIsEmpty!17628))

(assert (= (and b!414598 (not condMapEmpty!17628)) mapNonEmpty!17628))

(get-info :version)

(assert (= (and mapNonEmpty!17628 ((_ is ValueCellFull!4992) mapValue!17628)) b!414616))

(assert (= (and b!414598 ((_ is ValueCellFull!4992) mapDefault!17628)) b!414612))

(assert (= start!39252 b!414598))

(declare-fun b_lambda!8823 () Bool)

(assert (=> (not b_lambda!8823) (not b!414607)))

(declare-fun t!12205 () Bool)

(declare-fun tb!3141 () Bool)

(assert (=> (and start!39252 (= defaultEntry!557 defaultEntry!557) t!12205) tb!3141))

(declare-fun result!5809 () Bool)

(assert (=> tb!3141 (= result!5809 tp_is_empty!10671)))

(assert (=> b!414607 t!12205))

(declare-fun b_and!16915 () Bool)

(assert (= b_and!16913 (and (=> t!12205 result!5809) b_and!16915)))

(declare-fun m!403807 () Bool)

(assert (=> b!414614 m!403807))

(declare-fun m!403809 () Bool)

(assert (=> bm!28733 m!403809))

(declare-fun m!403811 () Bool)

(assert (=> b!414611 m!403811))

(declare-fun m!403813 () Bool)

(assert (=> b!414604 m!403813))

(declare-fun m!403815 () Bool)

(assert (=> b!414604 m!403815))

(declare-fun m!403817 () Bool)

(assert (=> b!414604 m!403817))

(declare-fun m!403819 () Bool)

(assert (=> b!414605 m!403819))

(declare-fun m!403821 () Bool)

(assert (=> b!414606 m!403821))

(declare-fun m!403823 () Bool)

(assert (=> b!414600 m!403823))

(declare-fun m!403825 () Bool)

(assert (=> b!414610 m!403825))

(declare-fun m!403827 () Bool)

(assert (=> b!414599 m!403827))

(declare-fun m!403829 () Bool)

(assert (=> bm!28732 m!403829))

(declare-fun m!403831 () Bool)

(assert (=> b!414607 m!403831))

(declare-fun m!403833 () Bool)

(assert (=> b!414607 m!403833))

(declare-fun m!403835 () Bool)

(assert (=> b!414607 m!403835))

(declare-fun m!403837 () Bool)

(assert (=> b!414607 m!403837))

(declare-fun m!403839 () Bool)

(assert (=> b!414607 m!403839))

(declare-fun m!403841 () Bool)

(assert (=> b!414607 m!403841))

(assert (=> b!414607 m!403833))

(assert (=> b!414607 m!403839))

(assert (=> b!414607 m!403837))

(declare-fun m!403843 () Bool)

(assert (=> mapNonEmpty!17628 m!403843))

(declare-fun m!403845 () Bool)

(assert (=> b!414609 m!403845))

(declare-fun m!403847 () Bool)

(assert (=> b!414615 m!403847))

(assert (=> b!414615 m!403847))

(declare-fun m!403849 () Bool)

(assert (=> b!414615 m!403849))

(declare-fun m!403851 () Bool)

(assert (=> b!414615 m!403851))

(declare-fun m!403853 () Bool)

(assert (=> start!39252 m!403853))

(declare-fun m!403855 () Bool)

(assert (=> start!39252 m!403855))

(declare-fun m!403857 () Bool)

(assert (=> b!414603 m!403857))

(declare-fun m!403859 () Bool)

(assert (=> b!414603 m!403859))

(check-sat (not mapNonEmpty!17628) (not b!414604) (not bm!28733) (not bm!28732) (not b!414614) (not b!414615) (not b!414609) (not b!414603) tp_is_empty!10671 b_and!16915 (not b_lambda!8823) (not b!414599) (not start!39252) (not b_next!9519) (not b!414611) (not b!414605) (not b!414607) (not b!414610) (not b!414606))
(check-sat b_and!16915 (not b_next!9519))
