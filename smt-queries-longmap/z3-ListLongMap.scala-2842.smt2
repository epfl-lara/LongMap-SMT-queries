; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41002 () Bool)

(assert start!41002)

(declare-fun b_free!10951 () Bool)

(declare-fun b_next!10951 () Bool)

(assert (=> start!41002 (= b_free!10951 (not b_next!10951))))

(declare-fun tp!38680 () Bool)

(declare-fun b_and!19103 () Bool)

(assert (=> start!41002 (= tp!38680 b_and!19103)))

(declare-fun b!457037 () Bool)

(declare-fun e!266954 () Bool)

(declare-fun e!266950 () Bool)

(assert (=> b!457037 (= e!266954 e!266950)))

(declare-fun res!272905 () Bool)

(assert (=> b!457037 (=> (not res!272905) (not e!266950))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!457037 (= res!272905 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!17491 0))(
  ( (V!17492 (val!6189 Int)) )
))
(declare-fun minValue!515 () V!17491)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5801 0))(
  ( (ValueCellFull!5801 (v!8456 V!17491)) (EmptyCell!5801) )
))
(declare-datatypes ((array!28370 0))(
  ( (array!28371 (arr!13628 (Array (_ BitVec 32) ValueCell!5801)) (size!13980 (_ BitVec 32))) )
))
(declare-fun lt!206768 () array!28370)

(declare-fun zeroValue!515 () V!17491)

(declare-datatypes ((array!28372 0))(
  ( (array!28373 (arr!13629 (Array (_ BitVec 32) (_ BitVec 64))) (size!13981 (_ BitVec 32))) )
))
(declare-fun lt!206767 () array!28372)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!8068 0))(
  ( (tuple2!8069 (_1!4045 (_ BitVec 64)) (_2!4045 V!17491)) )
))
(declare-datatypes ((List!8142 0))(
  ( (Nil!8139) (Cons!8138 (h!8994 tuple2!8068) (t!13964 List!8142)) )
))
(declare-datatypes ((ListLongMap!6983 0))(
  ( (ListLongMap!6984 (toList!3507 List!8142)) )
))
(declare-fun lt!206764 () ListLongMap!6983)

(declare-fun getCurrentListMapNoExtraKeys!1736 (array!28372 array!28370 (_ BitVec 32) (_ BitVec 32) V!17491 V!17491 (_ BitVec 32) Int) ListLongMap!6983)

(assert (=> b!457037 (= lt!206764 (getCurrentListMapNoExtraKeys!1736 lt!206767 lt!206768 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!28370)

(declare-fun v!412 () V!17491)

(assert (=> b!457037 (= lt!206768 (array!28371 (store (arr!13628 _values!549) i!563 (ValueCellFull!5801 v!412)) (size!13980 _values!549)))))

(declare-fun lt!206765 () ListLongMap!6983)

(declare-fun _keys!709 () array!28372)

(assert (=> b!457037 (= lt!206765 (getCurrentListMapNoExtraKeys!1736 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!457038 () Bool)

(declare-fun res!272911 () Bool)

(assert (=> b!457038 (=> (not res!272911) (not e!266954))))

(assert (=> b!457038 (= res!272911 (bvsle from!863 i!563))))

(declare-fun b!457039 () Bool)

(declare-fun res!272914 () Bool)

(declare-fun e!266951 () Bool)

(assert (=> b!457039 (=> (not res!272914) (not e!266951))))

(assert (=> b!457039 (= res!272914 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13981 _keys!709))))))

(declare-fun b!457040 () Bool)

(declare-fun e!266949 () Bool)

(assert (=> b!457040 (= e!266950 (not e!266949))))

(declare-fun res!272913 () Bool)

(assert (=> b!457040 (=> res!272913 e!266949)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!457040 (= res!272913 (not (validKeyInArray!0 (select (arr!13629 _keys!709) from!863))))))

(declare-fun lt!206766 () ListLongMap!6983)

(declare-fun lt!206769 () ListLongMap!6983)

(assert (=> b!457040 (= lt!206766 lt!206769)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!206770 () ListLongMap!6983)

(declare-fun +!1590 (ListLongMap!6983 tuple2!8068) ListLongMap!6983)

(assert (=> b!457040 (= lt!206769 (+!1590 lt!206770 (tuple2!8069 k0!794 v!412)))))

(assert (=> b!457040 (= lt!206766 (getCurrentListMapNoExtraKeys!1736 lt!206767 lt!206768 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!457040 (= lt!206770 (getCurrentListMapNoExtraKeys!1736 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13285 0))(
  ( (Unit!13286) )
))
(declare-fun lt!206771 () Unit!13285)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!750 (array!28372 array!28370 (_ BitVec 32) (_ BitVec 32) V!17491 V!17491 (_ BitVec 32) (_ BitVec 64) V!17491 (_ BitVec 32) Int) Unit!13285)

(assert (=> b!457040 (= lt!206771 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!750 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457041 () Bool)

(assert (=> b!457041 (= e!266951 e!266954)))

(declare-fun res!272902 () Bool)

(assert (=> b!457041 (=> (not res!272902) (not e!266954))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28372 (_ BitVec 32)) Bool)

(assert (=> b!457041 (= res!272902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206767 mask!1025))))

(assert (=> b!457041 (= lt!206767 (array!28373 (store (arr!13629 _keys!709) i!563 k0!794) (size!13981 _keys!709)))))

(declare-fun b!457042 () Bool)

(declare-fun res!272907 () Bool)

(assert (=> b!457042 (=> (not res!272907) (not e!266951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!457042 (= res!272907 (validMask!0 mask!1025))))

(declare-fun b!457043 () Bool)

(declare-fun get!6712 (ValueCell!5801 V!17491) V!17491)

(declare-fun dynLambda!874 (Int (_ BitVec 64)) V!17491)

(assert (=> b!457043 (= e!266949 (= lt!206764 (+!1590 lt!206769 (tuple2!8069 (select (arr!13629 _keys!709) from!863) (get!6712 (select (arr!13628 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!457044 () Bool)

(declare-fun res!272906 () Bool)

(assert (=> b!457044 (=> (not res!272906) (not e!266951))))

(declare-fun arrayContainsKey!0 (array!28372 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!457044 (= res!272906 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!457045 () Bool)

(declare-fun res!272904 () Bool)

(assert (=> b!457045 (=> (not res!272904) (not e!266954))))

(declare-datatypes ((List!8143 0))(
  ( (Nil!8140) (Cons!8139 (h!8995 (_ BitVec 64)) (t!13965 List!8143)) )
))
(declare-fun arrayNoDuplicates!0 (array!28372 (_ BitVec 32) List!8143) Bool)

(assert (=> b!457045 (= res!272904 (arrayNoDuplicates!0 lt!206767 #b00000000000000000000000000000000 Nil!8140))))

(declare-fun b!457046 () Bool)

(declare-fun e!266955 () Bool)

(declare-fun tp_is_empty!12289 () Bool)

(assert (=> b!457046 (= e!266955 tp_is_empty!12289)))

(declare-fun b!457047 () Bool)

(declare-fun e!266952 () Bool)

(declare-fun e!266956 () Bool)

(declare-fun mapRes!20074 () Bool)

(assert (=> b!457047 (= e!266952 (and e!266956 mapRes!20074))))

(declare-fun condMapEmpty!20074 () Bool)

(declare-fun mapDefault!20074 () ValueCell!5801)

(assert (=> b!457047 (= condMapEmpty!20074 (= (arr!13628 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5801)) mapDefault!20074)))))

(declare-fun b!457048 () Bool)

(declare-fun res!272901 () Bool)

(assert (=> b!457048 (=> (not res!272901) (not e!266951))))

(assert (=> b!457048 (= res!272901 (validKeyInArray!0 k0!794))))

(declare-fun b!457049 () Bool)

(declare-fun res!272910 () Bool)

(assert (=> b!457049 (=> (not res!272910) (not e!266951))))

(assert (=> b!457049 (= res!272910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!272903 () Bool)

(assert (=> start!41002 (=> (not res!272903) (not e!266951))))

(assert (=> start!41002 (= res!272903 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13981 _keys!709))))))

(assert (=> start!41002 e!266951))

(assert (=> start!41002 tp_is_empty!12289))

(assert (=> start!41002 tp!38680))

(assert (=> start!41002 true))

(declare-fun array_inv!9940 (array!28370) Bool)

(assert (=> start!41002 (and (array_inv!9940 _values!549) e!266952)))

(declare-fun array_inv!9941 (array!28372) Bool)

(assert (=> start!41002 (array_inv!9941 _keys!709)))

(declare-fun mapIsEmpty!20074 () Bool)

(assert (=> mapIsEmpty!20074 mapRes!20074))

(declare-fun b!457050 () Bool)

(assert (=> b!457050 (= e!266956 tp_is_empty!12289)))

(declare-fun b!457051 () Bool)

(declare-fun res!272912 () Bool)

(assert (=> b!457051 (=> (not res!272912) (not e!266951))))

(assert (=> b!457051 (= res!272912 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8140))))

(declare-fun b!457052 () Bool)

(declare-fun res!272908 () Bool)

(assert (=> b!457052 (=> (not res!272908) (not e!266951))))

(assert (=> b!457052 (= res!272908 (and (= (size!13980 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13981 _keys!709) (size!13980 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!457053 () Bool)

(declare-fun res!272909 () Bool)

(assert (=> b!457053 (=> (not res!272909) (not e!266951))))

(assert (=> b!457053 (= res!272909 (or (= (select (arr!13629 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13629 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!20074 () Bool)

(declare-fun tp!38679 () Bool)

(assert (=> mapNonEmpty!20074 (= mapRes!20074 (and tp!38679 e!266955))))

(declare-fun mapKey!20074 () (_ BitVec 32))

(declare-fun mapValue!20074 () ValueCell!5801)

(declare-fun mapRest!20074 () (Array (_ BitVec 32) ValueCell!5801))

(assert (=> mapNonEmpty!20074 (= (arr!13628 _values!549) (store mapRest!20074 mapKey!20074 mapValue!20074))))

(assert (= (and start!41002 res!272903) b!457042))

(assert (= (and b!457042 res!272907) b!457052))

(assert (= (and b!457052 res!272908) b!457049))

(assert (= (and b!457049 res!272910) b!457051))

(assert (= (and b!457051 res!272912) b!457039))

(assert (= (and b!457039 res!272914) b!457048))

(assert (= (and b!457048 res!272901) b!457053))

(assert (= (and b!457053 res!272909) b!457044))

(assert (= (and b!457044 res!272906) b!457041))

(assert (= (and b!457041 res!272902) b!457045))

(assert (= (and b!457045 res!272904) b!457038))

(assert (= (and b!457038 res!272911) b!457037))

(assert (= (and b!457037 res!272905) b!457040))

(assert (= (and b!457040 (not res!272913)) b!457043))

(assert (= (and b!457047 condMapEmpty!20074) mapIsEmpty!20074))

(assert (= (and b!457047 (not condMapEmpty!20074)) mapNonEmpty!20074))

(get-info :version)

(assert (= (and mapNonEmpty!20074 ((_ is ValueCellFull!5801) mapValue!20074)) b!457046))

(assert (= (and b!457047 ((_ is ValueCellFull!5801) mapDefault!20074)) b!457050))

(assert (= start!41002 b!457047))

(declare-fun b_lambda!9697 () Bool)

(assert (=> (not b_lambda!9697) (not b!457043)))

(declare-fun t!13963 () Bool)

(declare-fun tb!3779 () Bool)

(assert (=> (and start!41002 (= defaultEntry!557 defaultEntry!557) t!13963) tb!3779))

(declare-fun result!7105 () Bool)

(assert (=> tb!3779 (= result!7105 tp_is_empty!12289)))

(assert (=> b!457043 t!13963))

(declare-fun b_and!19105 () Bool)

(assert (= b_and!19103 (and (=> t!13963 result!7105) b_and!19105)))

(declare-fun m!440619 () Bool)

(assert (=> b!457051 m!440619))

(declare-fun m!440621 () Bool)

(assert (=> b!457045 m!440621))

(declare-fun m!440623 () Bool)

(assert (=> b!457049 m!440623))

(declare-fun m!440625 () Bool)

(assert (=> b!457044 m!440625))

(declare-fun m!440627 () Bool)

(assert (=> b!457037 m!440627))

(declare-fun m!440629 () Bool)

(assert (=> b!457037 m!440629))

(declare-fun m!440631 () Bool)

(assert (=> b!457037 m!440631))

(declare-fun m!440633 () Bool)

(assert (=> b!457040 m!440633))

(declare-fun m!440635 () Bool)

(assert (=> b!457040 m!440635))

(declare-fun m!440637 () Bool)

(assert (=> b!457040 m!440637))

(declare-fun m!440639 () Bool)

(assert (=> b!457040 m!440639))

(assert (=> b!457040 m!440633))

(declare-fun m!440641 () Bool)

(assert (=> b!457040 m!440641))

(declare-fun m!440643 () Bool)

(assert (=> b!457040 m!440643))

(declare-fun m!440645 () Bool)

(assert (=> b!457041 m!440645))

(declare-fun m!440647 () Bool)

(assert (=> b!457041 m!440647))

(declare-fun m!440649 () Bool)

(assert (=> mapNonEmpty!20074 m!440649))

(declare-fun m!440651 () Bool)

(assert (=> b!457042 m!440651))

(declare-fun m!440653 () Bool)

(assert (=> start!41002 m!440653))

(declare-fun m!440655 () Bool)

(assert (=> start!41002 m!440655))

(assert (=> b!457043 m!440633))

(declare-fun m!440657 () Bool)

(assert (=> b!457043 m!440657))

(declare-fun m!440659 () Bool)

(assert (=> b!457043 m!440659))

(declare-fun m!440661 () Bool)

(assert (=> b!457043 m!440661))

(assert (=> b!457043 m!440661))

(assert (=> b!457043 m!440659))

(declare-fun m!440663 () Bool)

(assert (=> b!457043 m!440663))

(declare-fun m!440665 () Bool)

(assert (=> b!457053 m!440665))

(declare-fun m!440667 () Bool)

(assert (=> b!457048 m!440667))

(check-sat (not mapNonEmpty!20074) (not b!457037) (not b_lambda!9697) (not b!457051) (not b!457044) (not b!457040) (not start!41002) (not b!457042) b_and!19105 (not b_next!10951) (not b!457048) (not b!457049) (not b!457041) (not b!457043) tp_is_empty!12289 (not b!457045))
(check-sat b_and!19105 (not b_next!10951))
(get-model)

(declare-fun b_lambda!9703 () Bool)

(assert (= b_lambda!9697 (or (and start!41002 b_free!10951) b_lambda!9703)))

(check-sat (not mapNonEmpty!20074) (not b!457037) (not b_lambda!9703) (not b!457051) (not b!457044) (not b!457040) (not start!41002) (not b!457042) b_and!19105 (not b_next!10951) (not b!457048) (not b!457049) (not b!457041) (not b!457043) tp_is_empty!12289 (not b!457045))
(check-sat b_and!19105 (not b_next!10951))
(get-model)

(declare-fun bm!30077 () Bool)

(declare-fun call!30080 () Bool)

(declare-fun c!56315 () Bool)

(assert (=> bm!30077 (= call!30080 (arrayNoDuplicates!0 lt!206767 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56315 (Cons!8139 (select (arr!13629 lt!206767) #b00000000000000000000000000000000) Nil!8140) Nil!8140)))))

(declare-fun b!457172 () Bool)

(declare-fun e!267013 () Bool)

(assert (=> b!457172 (= e!267013 call!30080)))

(declare-fun b!457173 () Bool)

(declare-fun e!267014 () Bool)

(declare-fun contains!2480 (List!8143 (_ BitVec 64)) Bool)

(assert (=> b!457173 (= e!267014 (contains!2480 Nil!8140 (select (arr!13629 lt!206767) #b00000000000000000000000000000000)))))

(declare-fun b!457174 () Bool)

(declare-fun e!267015 () Bool)

(declare-fun e!267016 () Bool)

(assert (=> b!457174 (= e!267015 e!267016)))

(declare-fun res!273005 () Bool)

(assert (=> b!457174 (=> (not res!273005) (not e!267016))))

(assert (=> b!457174 (= res!273005 (not e!267014))))

(declare-fun res!273007 () Bool)

(assert (=> b!457174 (=> (not res!273007) (not e!267014))))

(assert (=> b!457174 (= res!273007 (validKeyInArray!0 (select (arr!13629 lt!206767) #b00000000000000000000000000000000)))))

(declare-fun d!74691 () Bool)

(declare-fun res!273006 () Bool)

(assert (=> d!74691 (=> res!273006 e!267015)))

(assert (=> d!74691 (= res!273006 (bvsge #b00000000000000000000000000000000 (size!13981 lt!206767)))))

(assert (=> d!74691 (= (arrayNoDuplicates!0 lt!206767 #b00000000000000000000000000000000 Nil!8140) e!267015)))

(declare-fun b!457175 () Bool)

(assert (=> b!457175 (= e!267016 e!267013)))

(assert (=> b!457175 (= c!56315 (validKeyInArray!0 (select (arr!13629 lt!206767) #b00000000000000000000000000000000)))))

(declare-fun b!457176 () Bool)

(assert (=> b!457176 (= e!267013 call!30080)))

(assert (= (and d!74691 (not res!273006)) b!457174))

(assert (= (and b!457174 res!273007) b!457173))

(assert (= (and b!457174 res!273005) b!457175))

(assert (= (and b!457175 c!56315) b!457176))

(assert (= (and b!457175 (not c!56315)) b!457172))

(assert (= (or b!457176 b!457172) bm!30077))

(declare-fun m!440769 () Bool)

(assert (=> bm!30077 m!440769))

(declare-fun m!440771 () Bool)

(assert (=> bm!30077 m!440771))

(assert (=> b!457173 m!440769))

(assert (=> b!457173 m!440769))

(declare-fun m!440773 () Bool)

(assert (=> b!457173 m!440773))

(assert (=> b!457174 m!440769))

(assert (=> b!457174 m!440769))

(declare-fun m!440775 () Bool)

(assert (=> b!457174 m!440775))

(assert (=> b!457175 m!440769))

(assert (=> b!457175 m!440769))

(assert (=> b!457175 m!440775))

(assert (=> b!457045 d!74691))

(declare-fun b!457185 () Bool)

(declare-fun e!267024 () Bool)

(declare-fun e!267025 () Bool)

(assert (=> b!457185 (= e!267024 e!267025)))

(declare-fun lt!206828 () (_ BitVec 64))

(assert (=> b!457185 (= lt!206828 (select (arr!13629 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!206827 () Unit!13285)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28372 (_ BitVec 64) (_ BitVec 32)) Unit!13285)

(assert (=> b!457185 (= lt!206827 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!206828 #b00000000000000000000000000000000))))

(assert (=> b!457185 (arrayContainsKey!0 _keys!709 lt!206828 #b00000000000000000000000000000000)))

(declare-fun lt!206826 () Unit!13285)

(assert (=> b!457185 (= lt!206826 lt!206827)))

(declare-fun res!273012 () Bool)

(declare-datatypes ((SeekEntryResult!3482 0))(
  ( (MissingZero!3482 (index!16107 (_ BitVec 32))) (Found!3482 (index!16108 (_ BitVec 32))) (Intermediate!3482 (undefined!4294 Bool) (index!16109 (_ BitVec 32)) (x!42629 (_ BitVec 32))) (Undefined!3482) (MissingVacant!3482 (index!16110 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28372 (_ BitVec 32)) SeekEntryResult!3482)

(assert (=> b!457185 (= res!273012 (= (seekEntryOrOpen!0 (select (arr!13629 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3482 #b00000000000000000000000000000000)))))

(assert (=> b!457185 (=> (not res!273012) (not e!267025))))

(declare-fun bm!30080 () Bool)

(declare-fun call!30083 () Bool)

(assert (=> bm!30080 (= call!30083 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun d!74693 () Bool)

(declare-fun res!273013 () Bool)

(declare-fun e!267023 () Bool)

(assert (=> d!74693 (=> res!273013 e!267023)))

(assert (=> d!74693 (= res!273013 (bvsge #b00000000000000000000000000000000 (size!13981 _keys!709)))))

(assert (=> d!74693 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!267023)))

(declare-fun b!457186 () Bool)

(assert (=> b!457186 (= e!267025 call!30083)))

(declare-fun b!457187 () Bool)

(assert (=> b!457187 (= e!267023 e!267024)))

(declare-fun c!56318 () Bool)

(assert (=> b!457187 (= c!56318 (validKeyInArray!0 (select (arr!13629 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!457188 () Bool)

(assert (=> b!457188 (= e!267024 call!30083)))

(assert (= (and d!74693 (not res!273013)) b!457187))

(assert (= (and b!457187 c!56318) b!457185))

(assert (= (and b!457187 (not c!56318)) b!457188))

(assert (= (and b!457185 res!273012) b!457186))

(assert (= (or b!457186 b!457188) bm!30080))

(declare-fun m!440777 () Bool)

(assert (=> b!457185 m!440777))

(declare-fun m!440779 () Bool)

(assert (=> b!457185 m!440779))

(declare-fun m!440781 () Bool)

(assert (=> b!457185 m!440781))

(assert (=> b!457185 m!440777))

(declare-fun m!440783 () Bool)

(assert (=> b!457185 m!440783))

(declare-fun m!440785 () Bool)

(assert (=> bm!30080 m!440785))

(assert (=> b!457187 m!440777))

(assert (=> b!457187 m!440777))

(declare-fun m!440787 () Bool)

(assert (=> b!457187 m!440787))

(assert (=> b!457049 d!74693))

(declare-fun b!457213 () Bool)

(declare-fun e!267041 () ListLongMap!6983)

(assert (=> b!457213 (= e!267041 (ListLongMap!6984 Nil!8139))))

(declare-fun b!457214 () Bool)

(declare-fun e!267043 () Bool)

(assert (=> b!457214 (= e!267043 (validKeyInArray!0 (select (arr!13629 lt!206767) from!863)))))

(assert (=> b!457214 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun d!74695 () Bool)

(declare-fun e!267042 () Bool)

(assert (=> d!74695 e!267042))

(declare-fun res!273025 () Bool)

(assert (=> d!74695 (=> (not res!273025) (not e!267042))))

(declare-fun lt!206846 () ListLongMap!6983)

(declare-fun contains!2481 (ListLongMap!6983 (_ BitVec 64)) Bool)

(assert (=> d!74695 (= res!273025 (not (contains!2481 lt!206846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74695 (= lt!206846 e!267041)))

(declare-fun c!56328 () Bool)

(assert (=> d!74695 (= c!56328 (bvsge from!863 (size!13981 lt!206767)))))

(assert (=> d!74695 (validMask!0 mask!1025)))

(assert (=> d!74695 (= (getCurrentListMapNoExtraKeys!1736 lt!206767 lt!206768 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!206846)))

(declare-fun bm!30083 () Bool)

(declare-fun call!30086 () ListLongMap!6983)

(assert (=> bm!30083 (= call!30086 (getCurrentListMapNoExtraKeys!1736 lt!206767 lt!206768 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun e!267044 () Bool)

(declare-fun b!457215 () Bool)

(assert (=> b!457215 (= e!267044 (= lt!206846 (getCurrentListMapNoExtraKeys!1736 lt!206767 lt!206768 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!457216 () Bool)

(declare-fun res!273022 () Bool)

(assert (=> b!457216 (=> (not res!273022) (not e!267042))))

(assert (=> b!457216 (= res!273022 (not (contains!2481 lt!206846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457217 () Bool)

(declare-fun e!267045 () Bool)

(declare-fun e!267040 () Bool)

(assert (=> b!457217 (= e!267045 e!267040)))

(assert (=> b!457217 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13981 lt!206767)))))

(declare-fun res!273024 () Bool)

(assert (=> b!457217 (= res!273024 (contains!2481 lt!206846 (select (arr!13629 lt!206767) from!863)))))

(assert (=> b!457217 (=> (not res!273024) (not e!267040))))

(declare-fun b!457218 () Bool)

(assert (=> b!457218 (= e!267042 e!267045)))

(declare-fun c!56327 () Bool)

(assert (=> b!457218 (= c!56327 e!267043)))

(declare-fun res!273023 () Bool)

(assert (=> b!457218 (=> (not res!273023) (not e!267043))))

(assert (=> b!457218 (= res!273023 (bvslt from!863 (size!13981 lt!206767)))))

(declare-fun b!457219 () Bool)

(declare-fun isEmpty!567 (ListLongMap!6983) Bool)

(assert (=> b!457219 (= e!267044 (isEmpty!567 lt!206846))))

(declare-fun b!457220 () Bool)

(declare-fun e!267046 () ListLongMap!6983)

(assert (=> b!457220 (= e!267041 e!267046)))

(declare-fun c!56330 () Bool)

(assert (=> b!457220 (= c!56330 (validKeyInArray!0 (select (arr!13629 lt!206767) from!863)))))

(declare-fun b!457221 () Bool)

(declare-fun lt!206844 () Unit!13285)

(declare-fun lt!206845 () Unit!13285)

(assert (=> b!457221 (= lt!206844 lt!206845)))

(declare-fun lt!206847 () (_ BitVec 64))

(declare-fun lt!206843 () (_ BitVec 64))

(declare-fun lt!206848 () V!17491)

(declare-fun lt!206849 () ListLongMap!6983)

(assert (=> b!457221 (not (contains!2481 (+!1590 lt!206849 (tuple2!8069 lt!206843 lt!206848)) lt!206847))))

(declare-fun addStillNotContains!149 (ListLongMap!6983 (_ BitVec 64) V!17491 (_ BitVec 64)) Unit!13285)

(assert (=> b!457221 (= lt!206845 (addStillNotContains!149 lt!206849 lt!206843 lt!206848 lt!206847))))

(assert (=> b!457221 (= lt!206847 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!457221 (= lt!206848 (get!6712 (select (arr!13628 lt!206768) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!457221 (= lt!206843 (select (arr!13629 lt!206767) from!863))))

(assert (=> b!457221 (= lt!206849 call!30086)))

(assert (=> b!457221 (= e!267046 (+!1590 call!30086 (tuple2!8069 (select (arr!13629 lt!206767) from!863) (get!6712 (select (arr!13628 lt!206768) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457222 () Bool)

(assert (=> b!457222 (= e!267045 e!267044)))

(declare-fun c!56329 () Bool)

(assert (=> b!457222 (= c!56329 (bvslt from!863 (size!13981 lt!206767)))))

(declare-fun b!457223 () Bool)

(assert (=> b!457223 (= e!267046 call!30086)))

(declare-fun b!457224 () Bool)

(assert (=> b!457224 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13981 lt!206767)))))

(assert (=> b!457224 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13980 lt!206768)))))

(declare-fun apply!314 (ListLongMap!6983 (_ BitVec 64)) V!17491)

(assert (=> b!457224 (= e!267040 (= (apply!314 lt!206846 (select (arr!13629 lt!206767) from!863)) (get!6712 (select (arr!13628 lt!206768) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!74695 c!56328) b!457213))

(assert (= (and d!74695 (not c!56328)) b!457220))

(assert (= (and b!457220 c!56330) b!457221))

(assert (= (and b!457220 (not c!56330)) b!457223))

(assert (= (or b!457221 b!457223) bm!30083))

(assert (= (and d!74695 res!273025) b!457216))

(assert (= (and b!457216 res!273022) b!457218))

(assert (= (and b!457218 res!273023) b!457214))

(assert (= (and b!457218 c!56327) b!457217))

(assert (= (and b!457218 (not c!56327)) b!457222))

(assert (= (and b!457217 res!273024) b!457224))

(assert (= (and b!457222 c!56329) b!457215))

(assert (= (and b!457222 (not c!56329)) b!457219))

(declare-fun b_lambda!9705 () Bool)

(assert (=> (not b_lambda!9705) (not b!457221)))

(assert (=> b!457221 t!13963))

(declare-fun b_and!19115 () Bool)

(assert (= b_and!19105 (and (=> t!13963 result!7105) b_and!19115)))

(declare-fun b_lambda!9707 () Bool)

(assert (=> (not b_lambda!9707) (not b!457224)))

(assert (=> b!457224 t!13963))

(declare-fun b_and!19117 () Bool)

(assert (= b_and!19115 (and (=> t!13963 result!7105) b_and!19117)))

(declare-fun m!440789 () Bool)

(assert (=> b!457214 m!440789))

(assert (=> b!457214 m!440789))

(declare-fun m!440791 () Bool)

(assert (=> b!457214 m!440791))

(declare-fun m!440793 () Bool)

(assert (=> bm!30083 m!440793))

(assert (=> b!457224 m!440659))

(assert (=> b!457224 m!440789))

(declare-fun m!440795 () Bool)

(assert (=> b!457224 m!440795))

(assert (=> b!457224 m!440795))

(assert (=> b!457224 m!440659))

(declare-fun m!440797 () Bool)

(assert (=> b!457224 m!440797))

(assert (=> b!457224 m!440789))

(declare-fun m!440799 () Bool)

(assert (=> b!457224 m!440799))

(declare-fun m!440801 () Bool)

(assert (=> b!457216 m!440801))

(declare-fun m!440803 () Bool)

(assert (=> d!74695 m!440803))

(assert (=> d!74695 m!440651))

(declare-fun m!440805 () Bool)

(assert (=> b!457221 m!440805))

(declare-fun m!440807 () Bool)

(assert (=> b!457221 m!440807))

(declare-fun m!440809 () Bool)

(assert (=> b!457221 m!440809))

(assert (=> b!457221 m!440789))

(assert (=> b!457221 m!440795))

(assert (=> b!457221 m!440807))

(assert (=> b!457221 m!440795))

(assert (=> b!457221 m!440659))

(assert (=> b!457221 m!440797))

(assert (=> b!457221 m!440659))

(declare-fun m!440811 () Bool)

(assert (=> b!457221 m!440811))

(assert (=> b!457220 m!440789))

(assert (=> b!457220 m!440789))

(assert (=> b!457220 m!440791))

(assert (=> b!457217 m!440789))

(assert (=> b!457217 m!440789))

(declare-fun m!440813 () Bool)

(assert (=> b!457217 m!440813))

(declare-fun m!440815 () Bool)

(assert (=> b!457219 m!440815))

(assert (=> b!457215 m!440793))

(assert (=> b!457037 d!74695))

(declare-fun b!457225 () Bool)

(declare-fun e!267048 () ListLongMap!6983)

(assert (=> b!457225 (= e!267048 (ListLongMap!6984 Nil!8139))))

(declare-fun b!457226 () Bool)

(declare-fun e!267050 () Bool)

(assert (=> b!457226 (= e!267050 (validKeyInArray!0 (select (arr!13629 _keys!709) from!863)))))

(assert (=> b!457226 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun d!74697 () Bool)

(declare-fun e!267049 () Bool)

(assert (=> d!74697 e!267049))

(declare-fun res!273029 () Bool)

(assert (=> d!74697 (=> (not res!273029) (not e!267049))))

(declare-fun lt!206853 () ListLongMap!6983)

(assert (=> d!74697 (= res!273029 (not (contains!2481 lt!206853 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74697 (= lt!206853 e!267048)))

(declare-fun c!56332 () Bool)

(assert (=> d!74697 (= c!56332 (bvsge from!863 (size!13981 _keys!709)))))

(assert (=> d!74697 (validMask!0 mask!1025)))

(assert (=> d!74697 (= (getCurrentListMapNoExtraKeys!1736 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!206853)))

(declare-fun call!30087 () ListLongMap!6983)

(declare-fun bm!30084 () Bool)

(assert (=> bm!30084 (= call!30087 (getCurrentListMapNoExtraKeys!1736 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!457227 () Bool)

(declare-fun e!267051 () Bool)

(assert (=> b!457227 (= e!267051 (= lt!206853 (getCurrentListMapNoExtraKeys!1736 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!457228 () Bool)

(declare-fun res!273026 () Bool)

(assert (=> b!457228 (=> (not res!273026) (not e!267049))))

(assert (=> b!457228 (= res!273026 (not (contains!2481 lt!206853 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457229 () Bool)

(declare-fun e!267052 () Bool)

(declare-fun e!267047 () Bool)

(assert (=> b!457229 (= e!267052 e!267047)))

(assert (=> b!457229 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13981 _keys!709)))))

(declare-fun res!273028 () Bool)

(assert (=> b!457229 (= res!273028 (contains!2481 lt!206853 (select (arr!13629 _keys!709) from!863)))))

(assert (=> b!457229 (=> (not res!273028) (not e!267047))))

(declare-fun b!457230 () Bool)

(assert (=> b!457230 (= e!267049 e!267052)))

(declare-fun c!56331 () Bool)

(assert (=> b!457230 (= c!56331 e!267050)))

(declare-fun res!273027 () Bool)

(assert (=> b!457230 (=> (not res!273027) (not e!267050))))

(assert (=> b!457230 (= res!273027 (bvslt from!863 (size!13981 _keys!709)))))

(declare-fun b!457231 () Bool)

(assert (=> b!457231 (= e!267051 (isEmpty!567 lt!206853))))

(declare-fun b!457232 () Bool)

(declare-fun e!267053 () ListLongMap!6983)

(assert (=> b!457232 (= e!267048 e!267053)))

(declare-fun c!56334 () Bool)

(assert (=> b!457232 (= c!56334 (validKeyInArray!0 (select (arr!13629 _keys!709) from!863)))))

(declare-fun b!457233 () Bool)

(declare-fun lt!206851 () Unit!13285)

(declare-fun lt!206852 () Unit!13285)

(assert (=> b!457233 (= lt!206851 lt!206852)))

(declare-fun lt!206854 () (_ BitVec 64))

(declare-fun lt!206855 () V!17491)

(declare-fun lt!206856 () ListLongMap!6983)

(declare-fun lt!206850 () (_ BitVec 64))

(assert (=> b!457233 (not (contains!2481 (+!1590 lt!206856 (tuple2!8069 lt!206850 lt!206855)) lt!206854))))

(assert (=> b!457233 (= lt!206852 (addStillNotContains!149 lt!206856 lt!206850 lt!206855 lt!206854))))

(assert (=> b!457233 (= lt!206854 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!457233 (= lt!206855 (get!6712 (select (arr!13628 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!457233 (= lt!206850 (select (arr!13629 _keys!709) from!863))))

(assert (=> b!457233 (= lt!206856 call!30087)))

(assert (=> b!457233 (= e!267053 (+!1590 call!30087 (tuple2!8069 (select (arr!13629 _keys!709) from!863) (get!6712 (select (arr!13628 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457234 () Bool)

(assert (=> b!457234 (= e!267052 e!267051)))

(declare-fun c!56333 () Bool)

(assert (=> b!457234 (= c!56333 (bvslt from!863 (size!13981 _keys!709)))))

(declare-fun b!457235 () Bool)

(assert (=> b!457235 (= e!267053 call!30087)))

(declare-fun b!457236 () Bool)

(assert (=> b!457236 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13981 _keys!709)))))

(assert (=> b!457236 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13980 _values!549)))))

(assert (=> b!457236 (= e!267047 (= (apply!314 lt!206853 (select (arr!13629 _keys!709) from!863)) (get!6712 (select (arr!13628 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!74697 c!56332) b!457225))

(assert (= (and d!74697 (not c!56332)) b!457232))

(assert (= (and b!457232 c!56334) b!457233))

(assert (= (and b!457232 (not c!56334)) b!457235))

(assert (= (or b!457233 b!457235) bm!30084))

(assert (= (and d!74697 res!273029) b!457228))

(assert (= (and b!457228 res!273026) b!457230))

(assert (= (and b!457230 res!273027) b!457226))

(assert (= (and b!457230 c!56331) b!457229))

(assert (= (and b!457230 (not c!56331)) b!457234))

(assert (= (and b!457229 res!273028) b!457236))

(assert (= (and b!457234 c!56333) b!457227))

(assert (= (and b!457234 (not c!56333)) b!457231))

(declare-fun b_lambda!9709 () Bool)

(assert (=> (not b_lambda!9709) (not b!457233)))

(assert (=> b!457233 t!13963))

(declare-fun b_and!19119 () Bool)

(assert (= b_and!19117 (and (=> t!13963 result!7105) b_and!19119)))

(declare-fun b_lambda!9711 () Bool)

(assert (=> (not b_lambda!9711) (not b!457236)))

(assert (=> b!457236 t!13963))

(declare-fun b_and!19121 () Bool)

(assert (= b_and!19119 (and (=> t!13963 result!7105) b_and!19121)))

(assert (=> b!457226 m!440633))

(assert (=> b!457226 m!440633))

(assert (=> b!457226 m!440641))

(declare-fun m!440817 () Bool)

(assert (=> bm!30084 m!440817))

(assert (=> b!457236 m!440659))

(assert (=> b!457236 m!440633))

(assert (=> b!457236 m!440661))

(assert (=> b!457236 m!440661))

(assert (=> b!457236 m!440659))

(assert (=> b!457236 m!440663))

(assert (=> b!457236 m!440633))

(declare-fun m!440819 () Bool)

(assert (=> b!457236 m!440819))

(declare-fun m!440821 () Bool)

(assert (=> b!457228 m!440821))

(declare-fun m!440823 () Bool)

(assert (=> d!74697 m!440823))

(assert (=> d!74697 m!440651))

(declare-fun m!440825 () Bool)

(assert (=> b!457233 m!440825))

(declare-fun m!440827 () Bool)

(assert (=> b!457233 m!440827))

(declare-fun m!440829 () Bool)

(assert (=> b!457233 m!440829))

(assert (=> b!457233 m!440633))

(assert (=> b!457233 m!440661))

(assert (=> b!457233 m!440827))

(assert (=> b!457233 m!440661))

(assert (=> b!457233 m!440659))

(assert (=> b!457233 m!440663))

(assert (=> b!457233 m!440659))

(declare-fun m!440831 () Bool)

(assert (=> b!457233 m!440831))

(assert (=> b!457232 m!440633))

(assert (=> b!457232 m!440633))

(assert (=> b!457232 m!440641))

(assert (=> b!457229 m!440633))

(assert (=> b!457229 m!440633))

(declare-fun m!440833 () Bool)

(assert (=> b!457229 m!440833))

(declare-fun m!440835 () Bool)

(assert (=> b!457231 m!440835))

(assert (=> b!457227 m!440817))

(assert (=> b!457037 d!74697))

(declare-fun d!74699 () Bool)

(assert (=> d!74699 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!457048 d!74699))

(declare-fun d!74701 () Bool)

(assert (=> d!74701 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!457042 d!74701))

(declare-fun b!457237 () Bool)

(declare-fun e!267055 () Bool)

(declare-fun e!267056 () Bool)

(assert (=> b!457237 (= e!267055 e!267056)))

(declare-fun lt!206859 () (_ BitVec 64))

(assert (=> b!457237 (= lt!206859 (select (arr!13629 lt!206767) #b00000000000000000000000000000000))))

(declare-fun lt!206858 () Unit!13285)

(assert (=> b!457237 (= lt!206858 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!206767 lt!206859 #b00000000000000000000000000000000))))

(assert (=> b!457237 (arrayContainsKey!0 lt!206767 lt!206859 #b00000000000000000000000000000000)))

(declare-fun lt!206857 () Unit!13285)

(assert (=> b!457237 (= lt!206857 lt!206858)))

(declare-fun res!273030 () Bool)

(assert (=> b!457237 (= res!273030 (= (seekEntryOrOpen!0 (select (arr!13629 lt!206767) #b00000000000000000000000000000000) lt!206767 mask!1025) (Found!3482 #b00000000000000000000000000000000)))))

(assert (=> b!457237 (=> (not res!273030) (not e!267056))))

(declare-fun bm!30085 () Bool)

(declare-fun call!30088 () Bool)

(assert (=> bm!30085 (= call!30088 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!206767 mask!1025))))

(declare-fun d!74703 () Bool)

(declare-fun res!273031 () Bool)

(declare-fun e!267054 () Bool)

(assert (=> d!74703 (=> res!273031 e!267054)))

(assert (=> d!74703 (= res!273031 (bvsge #b00000000000000000000000000000000 (size!13981 lt!206767)))))

(assert (=> d!74703 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206767 mask!1025) e!267054)))

(declare-fun b!457238 () Bool)

(assert (=> b!457238 (= e!267056 call!30088)))

(declare-fun b!457239 () Bool)

(assert (=> b!457239 (= e!267054 e!267055)))

(declare-fun c!56335 () Bool)

(assert (=> b!457239 (= c!56335 (validKeyInArray!0 (select (arr!13629 lt!206767) #b00000000000000000000000000000000)))))

(declare-fun b!457240 () Bool)

(assert (=> b!457240 (= e!267055 call!30088)))

(assert (= (and d!74703 (not res!273031)) b!457239))

(assert (= (and b!457239 c!56335) b!457237))

(assert (= (and b!457239 (not c!56335)) b!457240))

(assert (= (and b!457237 res!273030) b!457238))

(assert (= (or b!457238 b!457240) bm!30085))

(assert (=> b!457237 m!440769))

(declare-fun m!440837 () Bool)

(assert (=> b!457237 m!440837))

(declare-fun m!440839 () Bool)

(assert (=> b!457237 m!440839))

(assert (=> b!457237 m!440769))

(declare-fun m!440841 () Bool)

(assert (=> b!457237 m!440841))

(declare-fun m!440843 () Bool)

(assert (=> bm!30085 m!440843))

(assert (=> b!457239 m!440769))

(assert (=> b!457239 m!440769))

(assert (=> b!457239 m!440775))

(assert (=> b!457041 d!74703))

(declare-fun d!74705 () Bool)

(assert (=> d!74705 (= (array_inv!9940 _values!549) (bvsge (size!13980 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!41002 d!74705))

(declare-fun d!74707 () Bool)

(assert (=> d!74707 (= (array_inv!9941 _keys!709) (bvsge (size!13981 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!41002 d!74707))

(declare-fun bm!30086 () Bool)

(declare-fun call!30089 () Bool)

(declare-fun c!56336 () Bool)

(assert (=> bm!30086 (= call!30089 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56336 (Cons!8139 (select (arr!13629 _keys!709) #b00000000000000000000000000000000) Nil!8140) Nil!8140)))))

(declare-fun b!457241 () Bool)

(declare-fun e!267057 () Bool)

(assert (=> b!457241 (= e!267057 call!30089)))

(declare-fun b!457242 () Bool)

(declare-fun e!267058 () Bool)

(assert (=> b!457242 (= e!267058 (contains!2480 Nil!8140 (select (arr!13629 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!457243 () Bool)

(declare-fun e!267059 () Bool)

(declare-fun e!267060 () Bool)

(assert (=> b!457243 (= e!267059 e!267060)))

(declare-fun res!273032 () Bool)

(assert (=> b!457243 (=> (not res!273032) (not e!267060))))

(assert (=> b!457243 (= res!273032 (not e!267058))))

(declare-fun res!273034 () Bool)

(assert (=> b!457243 (=> (not res!273034) (not e!267058))))

(assert (=> b!457243 (= res!273034 (validKeyInArray!0 (select (arr!13629 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74709 () Bool)

(declare-fun res!273033 () Bool)

(assert (=> d!74709 (=> res!273033 e!267059)))

(assert (=> d!74709 (= res!273033 (bvsge #b00000000000000000000000000000000 (size!13981 _keys!709)))))

(assert (=> d!74709 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8140) e!267059)))

(declare-fun b!457244 () Bool)

(assert (=> b!457244 (= e!267060 e!267057)))

(assert (=> b!457244 (= c!56336 (validKeyInArray!0 (select (arr!13629 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!457245 () Bool)

(assert (=> b!457245 (= e!267057 call!30089)))

(assert (= (and d!74709 (not res!273033)) b!457243))

(assert (= (and b!457243 res!273034) b!457242))

(assert (= (and b!457243 res!273032) b!457244))

(assert (= (and b!457244 c!56336) b!457245))

(assert (= (and b!457244 (not c!56336)) b!457241))

(assert (= (or b!457245 b!457241) bm!30086))

(assert (=> bm!30086 m!440777))

(declare-fun m!440845 () Bool)

(assert (=> bm!30086 m!440845))

(assert (=> b!457242 m!440777))

(assert (=> b!457242 m!440777))

(declare-fun m!440847 () Bool)

(assert (=> b!457242 m!440847))

(assert (=> b!457243 m!440777))

(assert (=> b!457243 m!440777))

(assert (=> b!457243 m!440787))

(assert (=> b!457244 m!440777))

(assert (=> b!457244 m!440777))

(assert (=> b!457244 m!440787))

(assert (=> b!457051 d!74709))

(declare-fun b!457246 () Bool)

(declare-fun e!267062 () ListLongMap!6983)

(assert (=> b!457246 (= e!267062 (ListLongMap!6984 Nil!8139))))

(declare-fun b!457247 () Bool)

(declare-fun e!267064 () Bool)

(assert (=> b!457247 (= e!267064 (validKeyInArray!0 (select (arr!13629 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!457247 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun d!74711 () Bool)

(declare-fun e!267063 () Bool)

(assert (=> d!74711 e!267063))

(declare-fun res!273038 () Bool)

(assert (=> d!74711 (=> (not res!273038) (not e!267063))))

(declare-fun lt!206863 () ListLongMap!6983)

(assert (=> d!74711 (= res!273038 (not (contains!2481 lt!206863 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74711 (= lt!206863 e!267062)))

(declare-fun c!56338 () Bool)

(assert (=> d!74711 (= c!56338 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13981 _keys!709)))))

(assert (=> d!74711 (validMask!0 mask!1025)))

(assert (=> d!74711 (= (getCurrentListMapNoExtraKeys!1736 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!206863)))

(declare-fun bm!30087 () Bool)

(declare-fun call!30090 () ListLongMap!6983)

(assert (=> bm!30087 (= call!30090 (getCurrentListMapNoExtraKeys!1736 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!457248 () Bool)

(declare-fun e!267065 () Bool)

(assert (=> b!457248 (= e!267065 (= lt!206863 (getCurrentListMapNoExtraKeys!1736 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!457249 () Bool)

(declare-fun res!273035 () Bool)

(assert (=> b!457249 (=> (not res!273035) (not e!267063))))

(assert (=> b!457249 (= res!273035 (not (contains!2481 lt!206863 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457250 () Bool)

(declare-fun e!267066 () Bool)

(declare-fun e!267061 () Bool)

(assert (=> b!457250 (= e!267066 e!267061)))

(assert (=> b!457250 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13981 _keys!709)))))

(declare-fun res!273037 () Bool)

(assert (=> b!457250 (= res!273037 (contains!2481 lt!206863 (select (arr!13629 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!457250 (=> (not res!273037) (not e!267061))))

(declare-fun b!457251 () Bool)

(assert (=> b!457251 (= e!267063 e!267066)))

(declare-fun c!56337 () Bool)

(assert (=> b!457251 (= c!56337 e!267064)))

(declare-fun res!273036 () Bool)

(assert (=> b!457251 (=> (not res!273036) (not e!267064))))

(assert (=> b!457251 (= res!273036 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13981 _keys!709)))))

(declare-fun b!457252 () Bool)

(assert (=> b!457252 (= e!267065 (isEmpty!567 lt!206863))))

(declare-fun b!457253 () Bool)

(declare-fun e!267067 () ListLongMap!6983)

(assert (=> b!457253 (= e!267062 e!267067)))

(declare-fun c!56340 () Bool)

(assert (=> b!457253 (= c!56340 (validKeyInArray!0 (select (arr!13629 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!457254 () Bool)

(declare-fun lt!206861 () Unit!13285)

(declare-fun lt!206862 () Unit!13285)

(assert (=> b!457254 (= lt!206861 lt!206862)))

(declare-fun lt!206860 () (_ BitVec 64))

(declare-fun lt!206866 () ListLongMap!6983)

(declare-fun lt!206864 () (_ BitVec 64))

(declare-fun lt!206865 () V!17491)

(assert (=> b!457254 (not (contains!2481 (+!1590 lt!206866 (tuple2!8069 lt!206860 lt!206865)) lt!206864))))

(assert (=> b!457254 (= lt!206862 (addStillNotContains!149 lt!206866 lt!206860 lt!206865 lt!206864))))

(assert (=> b!457254 (= lt!206864 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!457254 (= lt!206865 (get!6712 (select (arr!13628 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!457254 (= lt!206860 (select (arr!13629 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!457254 (= lt!206866 call!30090)))

(assert (=> b!457254 (= e!267067 (+!1590 call!30090 (tuple2!8069 (select (arr!13629 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (get!6712 (select (arr!13628 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457255 () Bool)

(assert (=> b!457255 (= e!267066 e!267065)))

(declare-fun c!56339 () Bool)

(assert (=> b!457255 (= c!56339 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13981 _keys!709)))))

(declare-fun b!457256 () Bool)

(assert (=> b!457256 (= e!267067 call!30090)))

(declare-fun b!457257 () Bool)

(assert (=> b!457257 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13981 _keys!709)))))

(assert (=> b!457257 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13980 _values!549)))))

(assert (=> b!457257 (= e!267061 (= (apply!314 lt!206863 (select (arr!13629 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))) (get!6712 (select (arr!13628 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!74711 c!56338) b!457246))

(assert (= (and d!74711 (not c!56338)) b!457253))

(assert (= (and b!457253 c!56340) b!457254))

(assert (= (and b!457253 (not c!56340)) b!457256))

(assert (= (or b!457254 b!457256) bm!30087))

(assert (= (and d!74711 res!273038) b!457249))

(assert (= (and b!457249 res!273035) b!457251))

(assert (= (and b!457251 res!273036) b!457247))

(assert (= (and b!457251 c!56337) b!457250))

(assert (= (and b!457251 (not c!56337)) b!457255))

(assert (= (and b!457250 res!273037) b!457257))

(assert (= (and b!457255 c!56339) b!457248))

(assert (= (and b!457255 (not c!56339)) b!457252))

(declare-fun b_lambda!9713 () Bool)

(assert (=> (not b_lambda!9713) (not b!457254)))

(assert (=> b!457254 t!13963))

(declare-fun b_and!19123 () Bool)

(assert (= b_and!19121 (and (=> t!13963 result!7105) b_and!19123)))

(declare-fun b_lambda!9715 () Bool)

(assert (=> (not b_lambda!9715) (not b!457257)))

(assert (=> b!457257 t!13963))

(declare-fun b_and!19125 () Bool)

(assert (= b_and!19123 (and (=> t!13963 result!7105) b_and!19125)))

(declare-fun m!440849 () Bool)

(assert (=> b!457247 m!440849))

(assert (=> b!457247 m!440849))

(declare-fun m!440851 () Bool)

(assert (=> b!457247 m!440851))

(declare-fun m!440853 () Bool)

(assert (=> bm!30087 m!440853))

(assert (=> b!457257 m!440659))

(assert (=> b!457257 m!440849))

(declare-fun m!440855 () Bool)

(assert (=> b!457257 m!440855))

(assert (=> b!457257 m!440855))

(assert (=> b!457257 m!440659))

(declare-fun m!440857 () Bool)

(assert (=> b!457257 m!440857))

(assert (=> b!457257 m!440849))

(declare-fun m!440859 () Bool)

(assert (=> b!457257 m!440859))

(declare-fun m!440861 () Bool)

(assert (=> b!457249 m!440861))

(declare-fun m!440863 () Bool)

(assert (=> d!74711 m!440863))

(assert (=> d!74711 m!440651))

(declare-fun m!440865 () Bool)

(assert (=> b!457254 m!440865))

(declare-fun m!440867 () Bool)

(assert (=> b!457254 m!440867))

(declare-fun m!440869 () Bool)

(assert (=> b!457254 m!440869))

(assert (=> b!457254 m!440849))

(assert (=> b!457254 m!440855))

(assert (=> b!457254 m!440867))

(assert (=> b!457254 m!440855))

(assert (=> b!457254 m!440659))

(assert (=> b!457254 m!440857))

(assert (=> b!457254 m!440659))

(declare-fun m!440871 () Bool)

(assert (=> b!457254 m!440871))

(assert (=> b!457253 m!440849))

(assert (=> b!457253 m!440849))

(assert (=> b!457253 m!440851))

(assert (=> b!457250 m!440849))

(assert (=> b!457250 m!440849))

(declare-fun m!440873 () Bool)

(assert (=> b!457250 m!440873))

(declare-fun m!440875 () Bool)

(assert (=> b!457252 m!440875))

(assert (=> b!457248 m!440853))

(assert (=> b!457040 d!74711))

(declare-fun b!457258 () Bool)

(declare-fun e!267069 () ListLongMap!6983)

(assert (=> b!457258 (= e!267069 (ListLongMap!6984 Nil!8139))))

(declare-fun b!457259 () Bool)

(declare-fun e!267071 () Bool)

(assert (=> b!457259 (= e!267071 (validKeyInArray!0 (select (arr!13629 lt!206767) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!457259 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun d!74713 () Bool)

(declare-fun e!267070 () Bool)

(assert (=> d!74713 e!267070))

(declare-fun res!273042 () Bool)

(assert (=> d!74713 (=> (not res!273042) (not e!267070))))

(declare-fun lt!206870 () ListLongMap!6983)

(assert (=> d!74713 (= res!273042 (not (contains!2481 lt!206870 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74713 (= lt!206870 e!267069)))

(declare-fun c!56342 () Bool)

(assert (=> d!74713 (= c!56342 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13981 lt!206767)))))

(assert (=> d!74713 (validMask!0 mask!1025)))

(assert (=> d!74713 (= (getCurrentListMapNoExtraKeys!1736 lt!206767 lt!206768 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!206870)))

(declare-fun call!30091 () ListLongMap!6983)

(declare-fun bm!30088 () Bool)

(assert (=> bm!30088 (= call!30091 (getCurrentListMapNoExtraKeys!1736 lt!206767 lt!206768 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun e!267072 () Bool)

(declare-fun b!457260 () Bool)

(assert (=> b!457260 (= e!267072 (= lt!206870 (getCurrentListMapNoExtraKeys!1736 lt!206767 lt!206768 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!457261 () Bool)

(declare-fun res!273039 () Bool)

(assert (=> b!457261 (=> (not res!273039) (not e!267070))))

(assert (=> b!457261 (= res!273039 (not (contains!2481 lt!206870 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457262 () Bool)

(declare-fun e!267073 () Bool)

(declare-fun e!267068 () Bool)

(assert (=> b!457262 (= e!267073 e!267068)))

(assert (=> b!457262 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13981 lt!206767)))))

(declare-fun res!273041 () Bool)

(assert (=> b!457262 (= res!273041 (contains!2481 lt!206870 (select (arr!13629 lt!206767) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!457262 (=> (not res!273041) (not e!267068))))

(declare-fun b!457263 () Bool)

(assert (=> b!457263 (= e!267070 e!267073)))

(declare-fun c!56341 () Bool)

(assert (=> b!457263 (= c!56341 e!267071)))

(declare-fun res!273040 () Bool)

(assert (=> b!457263 (=> (not res!273040) (not e!267071))))

(assert (=> b!457263 (= res!273040 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13981 lt!206767)))))

(declare-fun b!457264 () Bool)

(assert (=> b!457264 (= e!267072 (isEmpty!567 lt!206870))))

(declare-fun b!457265 () Bool)

(declare-fun e!267074 () ListLongMap!6983)

(assert (=> b!457265 (= e!267069 e!267074)))

(declare-fun c!56344 () Bool)

(assert (=> b!457265 (= c!56344 (validKeyInArray!0 (select (arr!13629 lt!206767) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!457266 () Bool)

(declare-fun lt!206868 () Unit!13285)

(declare-fun lt!206869 () Unit!13285)

(assert (=> b!457266 (= lt!206868 lt!206869)))

(declare-fun lt!206873 () ListLongMap!6983)

(declare-fun lt!206867 () (_ BitVec 64))

(declare-fun lt!206872 () V!17491)

(declare-fun lt!206871 () (_ BitVec 64))

(assert (=> b!457266 (not (contains!2481 (+!1590 lt!206873 (tuple2!8069 lt!206867 lt!206872)) lt!206871))))

(assert (=> b!457266 (= lt!206869 (addStillNotContains!149 lt!206873 lt!206867 lt!206872 lt!206871))))

(assert (=> b!457266 (= lt!206871 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!457266 (= lt!206872 (get!6712 (select (arr!13628 lt!206768) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!457266 (= lt!206867 (select (arr!13629 lt!206767) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!457266 (= lt!206873 call!30091)))

(assert (=> b!457266 (= e!267074 (+!1590 call!30091 (tuple2!8069 (select (arr!13629 lt!206767) (bvadd #b00000000000000000000000000000001 from!863)) (get!6712 (select (arr!13628 lt!206768) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!457267 () Bool)

(assert (=> b!457267 (= e!267073 e!267072)))

(declare-fun c!56343 () Bool)

(assert (=> b!457267 (= c!56343 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13981 lt!206767)))))

(declare-fun b!457268 () Bool)

(assert (=> b!457268 (= e!267074 call!30091)))

(declare-fun b!457269 () Bool)

(assert (=> b!457269 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13981 lt!206767)))))

(assert (=> b!457269 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13980 lt!206768)))))

(assert (=> b!457269 (= e!267068 (= (apply!314 lt!206870 (select (arr!13629 lt!206767) (bvadd #b00000000000000000000000000000001 from!863))) (get!6712 (select (arr!13628 lt!206768) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!74713 c!56342) b!457258))

(assert (= (and d!74713 (not c!56342)) b!457265))

(assert (= (and b!457265 c!56344) b!457266))

(assert (= (and b!457265 (not c!56344)) b!457268))

(assert (= (or b!457266 b!457268) bm!30088))

(assert (= (and d!74713 res!273042) b!457261))

(assert (= (and b!457261 res!273039) b!457263))

(assert (= (and b!457263 res!273040) b!457259))

(assert (= (and b!457263 c!56341) b!457262))

(assert (= (and b!457263 (not c!56341)) b!457267))

(assert (= (and b!457262 res!273041) b!457269))

(assert (= (and b!457267 c!56343) b!457260))

(assert (= (and b!457267 (not c!56343)) b!457264))

(declare-fun b_lambda!9717 () Bool)

(assert (=> (not b_lambda!9717) (not b!457266)))

(assert (=> b!457266 t!13963))

(declare-fun b_and!19127 () Bool)

(assert (= b_and!19125 (and (=> t!13963 result!7105) b_and!19127)))

(declare-fun b_lambda!9719 () Bool)

(assert (=> (not b_lambda!9719) (not b!457269)))

(assert (=> b!457269 t!13963))

(declare-fun b_and!19129 () Bool)

(assert (= b_and!19127 (and (=> t!13963 result!7105) b_and!19129)))

(declare-fun m!440877 () Bool)

(assert (=> b!457259 m!440877))

(assert (=> b!457259 m!440877))

(declare-fun m!440879 () Bool)

(assert (=> b!457259 m!440879))

(declare-fun m!440881 () Bool)

(assert (=> bm!30088 m!440881))

(assert (=> b!457269 m!440659))

(assert (=> b!457269 m!440877))

(declare-fun m!440883 () Bool)

(assert (=> b!457269 m!440883))

(assert (=> b!457269 m!440883))

(assert (=> b!457269 m!440659))

(declare-fun m!440885 () Bool)

(assert (=> b!457269 m!440885))

(assert (=> b!457269 m!440877))

(declare-fun m!440887 () Bool)

(assert (=> b!457269 m!440887))

(declare-fun m!440889 () Bool)

(assert (=> b!457261 m!440889))

(declare-fun m!440891 () Bool)

(assert (=> d!74713 m!440891))

(assert (=> d!74713 m!440651))

(declare-fun m!440893 () Bool)

(assert (=> b!457266 m!440893))

(declare-fun m!440895 () Bool)

(assert (=> b!457266 m!440895))

(declare-fun m!440897 () Bool)

(assert (=> b!457266 m!440897))

(assert (=> b!457266 m!440877))

(assert (=> b!457266 m!440883))

(assert (=> b!457266 m!440895))

(assert (=> b!457266 m!440883))

(assert (=> b!457266 m!440659))

(assert (=> b!457266 m!440885))

(assert (=> b!457266 m!440659))

(declare-fun m!440899 () Bool)

(assert (=> b!457266 m!440899))

(assert (=> b!457265 m!440877))

(assert (=> b!457265 m!440877))

(assert (=> b!457265 m!440879))

(assert (=> b!457262 m!440877))

(assert (=> b!457262 m!440877))

(declare-fun m!440901 () Bool)

(assert (=> b!457262 m!440901))

(declare-fun m!440903 () Bool)

(assert (=> b!457264 m!440903))

(assert (=> b!457260 m!440881))

(assert (=> b!457040 d!74713))

(declare-fun d!74715 () Bool)

(assert (=> d!74715 (= (validKeyInArray!0 (select (arr!13629 _keys!709) from!863)) (and (not (= (select (arr!13629 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13629 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!457040 d!74715))

(declare-fun d!74717 () Bool)

(declare-fun e!267077 () Bool)

(assert (=> d!74717 e!267077))

(declare-fun res!273047 () Bool)

(assert (=> d!74717 (=> (not res!273047) (not e!267077))))

(declare-fun lt!206884 () ListLongMap!6983)

(assert (=> d!74717 (= res!273047 (contains!2481 lt!206884 (_1!4045 (tuple2!8069 k0!794 v!412))))))

(declare-fun lt!206882 () List!8142)

(assert (=> d!74717 (= lt!206884 (ListLongMap!6984 lt!206882))))

(declare-fun lt!206883 () Unit!13285)

(declare-fun lt!206885 () Unit!13285)

(assert (=> d!74717 (= lt!206883 lt!206885)))

(declare-datatypes ((Option!378 0))(
  ( (Some!377 (v!8462 V!17491)) (None!376) )
))
(declare-fun getValueByKey!372 (List!8142 (_ BitVec 64)) Option!378)

(assert (=> d!74717 (= (getValueByKey!372 lt!206882 (_1!4045 (tuple2!8069 k0!794 v!412))) (Some!377 (_2!4045 (tuple2!8069 k0!794 v!412))))))

(declare-fun lemmaContainsTupThenGetReturnValue!194 (List!8142 (_ BitVec 64) V!17491) Unit!13285)

(assert (=> d!74717 (= lt!206885 (lemmaContainsTupThenGetReturnValue!194 lt!206882 (_1!4045 (tuple2!8069 k0!794 v!412)) (_2!4045 (tuple2!8069 k0!794 v!412))))))

(declare-fun insertStrictlySorted!197 (List!8142 (_ BitVec 64) V!17491) List!8142)

(assert (=> d!74717 (= lt!206882 (insertStrictlySorted!197 (toList!3507 lt!206770) (_1!4045 (tuple2!8069 k0!794 v!412)) (_2!4045 (tuple2!8069 k0!794 v!412))))))

(assert (=> d!74717 (= (+!1590 lt!206770 (tuple2!8069 k0!794 v!412)) lt!206884)))

(declare-fun b!457274 () Bool)

(declare-fun res!273048 () Bool)

(assert (=> b!457274 (=> (not res!273048) (not e!267077))))

(assert (=> b!457274 (= res!273048 (= (getValueByKey!372 (toList!3507 lt!206884) (_1!4045 (tuple2!8069 k0!794 v!412))) (Some!377 (_2!4045 (tuple2!8069 k0!794 v!412)))))))

(declare-fun b!457275 () Bool)

(declare-fun contains!2482 (List!8142 tuple2!8068) Bool)

(assert (=> b!457275 (= e!267077 (contains!2482 (toList!3507 lt!206884) (tuple2!8069 k0!794 v!412)))))

(assert (= (and d!74717 res!273047) b!457274))

(assert (= (and b!457274 res!273048) b!457275))

(declare-fun m!440905 () Bool)

(assert (=> d!74717 m!440905))

(declare-fun m!440907 () Bool)

(assert (=> d!74717 m!440907))

(declare-fun m!440909 () Bool)

(assert (=> d!74717 m!440909))

(declare-fun m!440911 () Bool)

(assert (=> d!74717 m!440911))

(declare-fun m!440913 () Bool)

(assert (=> b!457274 m!440913))

(declare-fun m!440915 () Bool)

(assert (=> b!457275 m!440915))

(assert (=> b!457040 d!74717))

(declare-fun e!267082 () Bool)

(declare-fun call!30097 () ListLongMap!6983)

(declare-fun call!30096 () ListLongMap!6983)

(declare-fun b!457282 () Bool)

(assert (=> b!457282 (= e!267082 (= call!30096 (+!1590 call!30097 (tuple2!8069 k0!794 v!412))))))

(declare-fun d!74719 () Bool)

(declare-fun e!267083 () Bool)

(assert (=> d!74719 e!267083))

(declare-fun res!273051 () Bool)

(assert (=> d!74719 (=> (not res!273051) (not e!267083))))

(assert (=> d!74719 (= res!273051 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13981 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13980 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13981 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13980 _values!549))))))))

(declare-fun lt!206888 () Unit!13285)

(declare-fun choose!1338 (array!28372 array!28370 (_ BitVec 32) (_ BitVec 32) V!17491 V!17491 (_ BitVec 32) (_ BitVec 64) V!17491 (_ BitVec 32) Int) Unit!13285)

(assert (=> d!74719 (= lt!206888 (choose!1338 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74719 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13981 _keys!709)))))

(assert (=> d!74719 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!750 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!206888)))

(declare-fun b!457283 () Bool)

(assert (=> b!457283 (= e!267082 (= call!30096 call!30097))))

(declare-fun bm!30093 () Bool)

(assert (=> bm!30093 (= call!30097 (getCurrentListMapNoExtraKeys!1736 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!457284 () Bool)

(assert (=> b!457284 (= e!267083 e!267082)))

(declare-fun c!56347 () Bool)

(assert (=> b!457284 (= c!56347 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun bm!30094 () Bool)

(assert (=> bm!30094 (= call!30096 (getCurrentListMapNoExtraKeys!1736 (array!28373 (store (arr!13629 _keys!709) i!563 k0!794) (size!13981 _keys!709)) (array!28371 (store (arr!13628 _values!549) i!563 (ValueCellFull!5801 v!412)) (size!13980 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and d!74719 res!273051) b!457284))

(assert (= (and b!457284 c!56347) b!457282))

(assert (= (and b!457284 (not c!56347)) b!457283))

(assert (= (or b!457282 b!457283) bm!30093))

(assert (= (or b!457282 b!457283) bm!30094))

(declare-fun m!440917 () Bool)

(assert (=> b!457282 m!440917))

(declare-fun m!440919 () Bool)

(assert (=> d!74719 m!440919))

(assert (=> bm!30093 m!440637))

(assert (=> bm!30094 m!440647))

(assert (=> bm!30094 m!440629))

(declare-fun m!440921 () Bool)

(assert (=> bm!30094 m!440921))

(assert (=> b!457040 d!74719))

(declare-fun d!74721 () Bool)

(declare-fun res!273056 () Bool)

(declare-fun e!267088 () Bool)

(assert (=> d!74721 (=> res!273056 e!267088)))

(assert (=> d!74721 (= res!273056 (= (select (arr!13629 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74721 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!267088)))

(declare-fun b!457289 () Bool)

(declare-fun e!267089 () Bool)

(assert (=> b!457289 (= e!267088 e!267089)))

(declare-fun res!273057 () Bool)

(assert (=> b!457289 (=> (not res!273057) (not e!267089))))

(assert (=> b!457289 (= res!273057 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13981 _keys!709)))))

(declare-fun b!457290 () Bool)

(assert (=> b!457290 (= e!267089 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74721 (not res!273056)) b!457289))

(assert (= (and b!457289 res!273057) b!457290))

(assert (=> d!74721 m!440777))

(declare-fun m!440923 () Bool)

(assert (=> b!457290 m!440923))

(assert (=> b!457044 d!74721))

(declare-fun d!74723 () Bool)

(declare-fun e!267090 () Bool)

(assert (=> d!74723 e!267090))

(declare-fun res!273058 () Bool)

(assert (=> d!74723 (=> (not res!273058) (not e!267090))))

(declare-fun lt!206891 () ListLongMap!6983)

(assert (=> d!74723 (= res!273058 (contains!2481 lt!206891 (_1!4045 (tuple2!8069 (select (arr!13629 _keys!709) from!863) (get!6712 (select (arr!13628 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!206889 () List!8142)

(assert (=> d!74723 (= lt!206891 (ListLongMap!6984 lt!206889))))

(declare-fun lt!206890 () Unit!13285)

(declare-fun lt!206892 () Unit!13285)

(assert (=> d!74723 (= lt!206890 lt!206892)))

(assert (=> d!74723 (= (getValueByKey!372 lt!206889 (_1!4045 (tuple2!8069 (select (arr!13629 _keys!709) from!863) (get!6712 (select (arr!13628 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!377 (_2!4045 (tuple2!8069 (select (arr!13629 _keys!709) from!863) (get!6712 (select (arr!13628 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74723 (= lt!206892 (lemmaContainsTupThenGetReturnValue!194 lt!206889 (_1!4045 (tuple2!8069 (select (arr!13629 _keys!709) from!863) (get!6712 (select (arr!13628 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4045 (tuple2!8069 (select (arr!13629 _keys!709) from!863) (get!6712 (select (arr!13628 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74723 (= lt!206889 (insertStrictlySorted!197 (toList!3507 lt!206769) (_1!4045 (tuple2!8069 (select (arr!13629 _keys!709) from!863) (get!6712 (select (arr!13628 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4045 (tuple2!8069 (select (arr!13629 _keys!709) from!863) (get!6712 (select (arr!13628 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74723 (= (+!1590 lt!206769 (tuple2!8069 (select (arr!13629 _keys!709) from!863) (get!6712 (select (arr!13628 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!206891)))

(declare-fun b!457291 () Bool)

(declare-fun res!273059 () Bool)

(assert (=> b!457291 (=> (not res!273059) (not e!267090))))

(assert (=> b!457291 (= res!273059 (= (getValueByKey!372 (toList!3507 lt!206891) (_1!4045 (tuple2!8069 (select (arr!13629 _keys!709) from!863) (get!6712 (select (arr!13628 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!377 (_2!4045 (tuple2!8069 (select (arr!13629 _keys!709) from!863) (get!6712 (select (arr!13628 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!457292 () Bool)

(assert (=> b!457292 (= e!267090 (contains!2482 (toList!3507 lt!206891) (tuple2!8069 (select (arr!13629 _keys!709) from!863) (get!6712 (select (arr!13628 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74723 res!273058) b!457291))

(assert (= (and b!457291 res!273059) b!457292))

(declare-fun m!440925 () Bool)

(assert (=> d!74723 m!440925))

(declare-fun m!440927 () Bool)

(assert (=> d!74723 m!440927))

(declare-fun m!440929 () Bool)

(assert (=> d!74723 m!440929))

(declare-fun m!440931 () Bool)

(assert (=> d!74723 m!440931))

(declare-fun m!440933 () Bool)

(assert (=> b!457291 m!440933))

(declare-fun m!440935 () Bool)

(assert (=> b!457292 m!440935))

(assert (=> b!457043 d!74723))

(declare-fun d!74725 () Bool)

(declare-fun c!56350 () Bool)

(assert (=> d!74725 (= c!56350 ((_ is ValueCellFull!5801) (select (arr!13628 _values!549) from!863)))))

(declare-fun e!267093 () V!17491)

(assert (=> d!74725 (= (get!6712 (select (arr!13628 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!267093)))

(declare-fun b!457297 () Bool)

(declare-fun get!6714 (ValueCell!5801 V!17491) V!17491)

(assert (=> b!457297 (= e!267093 (get!6714 (select (arr!13628 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!457298 () Bool)

(declare-fun get!6715 (ValueCell!5801 V!17491) V!17491)

(assert (=> b!457298 (= e!267093 (get!6715 (select (arr!13628 _values!549) from!863) (dynLambda!874 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74725 c!56350) b!457297))

(assert (= (and d!74725 (not c!56350)) b!457298))

(assert (=> b!457297 m!440661))

(assert (=> b!457297 m!440659))

(declare-fun m!440937 () Bool)

(assert (=> b!457297 m!440937))

(assert (=> b!457298 m!440661))

(assert (=> b!457298 m!440659))

(declare-fun m!440939 () Bool)

(assert (=> b!457298 m!440939))

(assert (=> b!457043 d!74725))

(declare-fun mapIsEmpty!20083 () Bool)

(declare-fun mapRes!20083 () Bool)

(assert (=> mapIsEmpty!20083 mapRes!20083))

(declare-fun mapNonEmpty!20083 () Bool)

(declare-fun tp!38695 () Bool)

(declare-fun e!267099 () Bool)

(assert (=> mapNonEmpty!20083 (= mapRes!20083 (and tp!38695 e!267099))))

(declare-fun mapKey!20083 () (_ BitVec 32))

(declare-fun mapValue!20083 () ValueCell!5801)

(declare-fun mapRest!20083 () (Array (_ BitVec 32) ValueCell!5801))

(assert (=> mapNonEmpty!20083 (= mapRest!20074 (store mapRest!20083 mapKey!20083 mapValue!20083))))

(declare-fun condMapEmpty!20083 () Bool)

(declare-fun mapDefault!20083 () ValueCell!5801)

(assert (=> mapNonEmpty!20074 (= condMapEmpty!20083 (= mapRest!20074 ((as const (Array (_ BitVec 32) ValueCell!5801)) mapDefault!20083)))))

(declare-fun e!267098 () Bool)

(assert (=> mapNonEmpty!20074 (= tp!38679 (and e!267098 mapRes!20083))))

(declare-fun b!457305 () Bool)

(assert (=> b!457305 (= e!267099 tp_is_empty!12289)))

(declare-fun b!457306 () Bool)

(assert (=> b!457306 (= e!267098 tp_is_empty!12289)))

(assert (= (and mapNonEmpty!20074 condMapEmpty!20083) mapIsEmpty!20083))

(assert (= (and mapNonEmpty!20074 (not condMapEmpty!20083)) mapNonEmpty!20083))

(assert (= (and mapNonEmpty!20083 ((_ is ValueCellFull!5801) mapValue!20083)) b!457305))

(assert (= (and mapNonEmpty!20074 ((_ is ValueCellFull!5801) mapDefault!20083)) b!457306))

(declare-fun m!440941 () Bool)

(assert (=> mapNonEmpty!20083 m!440941))

(declare-fun b_lambda!9721 () Bool)

(assert (= b_lambda!9709 (or (and start!41002 b_free!10951) b_lambda!9721)))

(declare-fun b_lambda!9723 () Bool)

(assert (= b_lambda!9705 (or (and start!41002 b_free!10951) b_lambda!9723)))

(declare-fun b_lambda!9725 () Bool)

(assert (= b_lambda!9707 (or (and start!41002 b_free!10951) b_lambda!9725)))

(declare-fun b_lambda!9727 () Bool)

(assert (= b_lambda!9717 (or (and start!41002 b_free!10951) b_lambda!9727)))

(declare-fun b_lambda!9729 () Bool)

(assert (= b_lambda!9711 (or (and start!41002 b_free!10951) b_lambda!9729)))

(declare-fun b_lambda!9731 () Bool)

(assert (= b_lambda!9719 (or (and start!41002 b_free!10951) b_lambda!9731)))

(declare-fun b_lambda!9733 () Bool)

(assert (= b_lambda!9715 (or (and start!41002 b_free!10951) b_lambda!9733)))

(declare-fun b_lambda!9735 () Bool)

(assert (= b_lambda!9713 (or (and start!41002 b_free!10951) b_lambda!9735)))

(check-sat (not b_lambda!9725) (not b!457173) (not b!457214) (not b!457252) (not b!457226) (not b!457282) (not b!457290) (not b!457269) (not bm!30086) (not b_lambda!9727) (not b!457298) (not b!457236) (not bm!30087) (not b!457291) (not b!457242) (not b_lambda!9721) (not bm!30083) (not b!457297) (not b!457249) (not b!457266) (not b_lambda!9735) (not b!457187) (not b!457292) (not b_lambda!9703) (not bm!30084) (not b_lambda!9723) (not b!457220) (not b!457219) (not b!457227) (not bm!30085) (not b!457247) (not b!457233) (not b!457215) (not d!74719) (not bm!30088) (not b!457260) (not b_lambda!9731) (not b!457243) (not b!457274) (not b!457261) (not b!457174) (not d!74697) (not d!74713) (not d!74695) (not b!457244) (not b!457250) (not b!457232) (not b!457217) (not b!457228) b_and!19129 (not b!457237) (not b!457231) (not b!457248) (not b!457259) tp_is_empty!12289 (not b!457265) (not b!457253) (not b!457262) (not b!457175) (not b_lambda!9733) (not mapNonEmpty!20083) (not b_lambda!9729) (not b!457239) (not bm!30080) (not b!457264) (not b!457221) (not b!457229) (not b!457224) (not d!74711) (not bm!30077) (not b!457185) (not d!74717) (not b!457257) (not b!457216) (not b_next!10951) (not bm!30094) (not b!457275) (not bm!30093) (not b!457254) (not d!74723))
(check-sat b_and!19129 (not b_next!10951))
