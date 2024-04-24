; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39182 () Bool)

(assert start!39182)

(declare-fun b_free!9463 () Bool)

(declare-fun b_next!9463 () Bool)

(assert (=> start!39182 (= b_free!9463 (not b_next!9463))))

(declare-fun tp!33917 () Bool)

(declare-fun b_and!16863 () Bool)

(assert (=> start!39182 (= tp!33917 b_and!16863)))

(declare-fun res!239975 () Bool)

(declare-fun e!247029 () Bool)

(assert (=> start!39182 (=> (not res!239975) (not e!247029))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25092 0))(
  ( (array!25093 (arr!11995 (Array (_ BitVec 32) (_ BitVec 64))) (size!12347 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25092)

(assert (=> start!39182 (= res!239975 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12347 _keys!709))))))

(assert (=> start!39182 e!247029))

(declare-fun tp_is_empty!10615 () Bool)

(assert (=> start!39182 tp_is_empty!10615))

(assert (=> start!39182 tp!33917))

(assert (=> start!39182 true))

(declare-datatypes ((V!15259 0))(
  ( (V!15260 (val!5352 Int)) )
))
(declare-datatypes ((ValueCell!4964 0))(
  ( (ValueCellFull!4964 (v!7600 V!15259)) (EmptyCell!4964) )
))
(declare-datatypes ((array!25094 0))(
  ( (array!25095 (arr!11996 (Array (_ BitVec 32) ValueCell!4964)) (size!12348 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25094)

(declare-fun e!247034 () Bool)

(declare-fun array_inv!8824 (array!25094) Bool)

(assert (=> start!39182 (and (array_inv!8824 _values!549) e!247034)))

(declare-fun array_inv!8825 (array!25092) Bool)

(assert (=> start!39182 (array_inv!8825 _keys!709)))

(declare-fun mapNonEmpty!17544 () Bool)

(declare-fun mapRes!17544 () Bool)

(declare-fun tp!33918 () Bool)

(declare-fun e!247036 () Bool)

(assert (=> mapNonEmpty!17544 (= mapRes!17544 (and tp!33918 e!247036))))

(declare-fun mapKey!17544 () (_ BitVec 32))

(declare-fun mapRest!17544 () (Array (_ BitVec 32) ValueCell!4964))

(declare-fun mapValue!17544 () ValueCell!4964)

(assert (=> mapNonEmpty!17544 (= (arr!11996 _values!549) (store mapRest!17544 mapKey!17544 mapValue!17544))))

(declare-fun b!413006 () Bool)

(declare-fun e!247032 () Bool)

(declare-datatypes ((tuple2!6820 0))(
  ( (tuple2!6821 (_1!3421 (_ BitVec 64)) (_2!3421 V!15259)) )
))
(declare-datatypes ((List!6840 0))(
  ( (Nil!6837) (Cons!6836 (h!7692 tuple2!6820) (t!12006 List!6840)) )
))
(declare-datatypes ((ListLongMap!5735 0))(
  ( (ListLongMap!5736 (toList!2883 List!6840)) )
))
(declare-fun call!28554 () ListLongMap!5735)

(declare-fun call!28555 () ListLongMap!5735)

(assert (=> b!413006 (= e!247032 (= call!28554 call!28555))))

(declare-fun b!413007 () Bool)

(declare-fun e!247031 () Bool)

(assert (=> b!413007 (= e!247029 e!247031)))

(declare-fun res!239966 () Bool)

(assert (=> b!413007 (=> (not res!239966) (not e!247031))))

(declare-fun lt!189641 () array!25092)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25092 (_ BitVec 32)) Bool)

(assert (=> b!413007 (= res!239966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189641 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413007 (= lt!189641 (array!25093 (store (arr!11995 _keys!709) i!563 k0!794) (size!12347 _keys!709)))))

(declare-fun b!413008 () Bool)

(declare-fun res!239965 () Bool)

(assert (=> b!413008 (=> (not res!239965) (not e!247029))))

(assert (=> b!413008 (= res!239965 (or (= (select (arr!11995 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11995 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!189642 () array!25094)

(declare-fun zeroValue!515 () V!15259)

(declare-fun c!54885 () Bool)

(declare-fun minValue!515 () V!15259)

(declare-fun bm!28551 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1134 (array!25092 array!25094 (_ BitVec 32) (_ BitVec 32) V!15259 V!15259 (_ BitVec 32) Int) ListLongMap!5735)

(assert (=> bm!28551 (= call!28554 (getCurrentListMapNoExtraKeys!1134 (ite c!54885 _keys!709 lt!189641) (ite c!54885 _values!549 lt!189642) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413009 () Bool)

(declare-fun v!412 () V!15259)

(declare-fun +!1162 (ListLongMap!5735 tuple2!6820) ListLongMap!5735)

(assert (=> b!413009 (= e!247032 (= call!28555 (+!1162 call!28554 (tuple2!6821 k0!794 v!412))))))

(declare-fun b!413010 () Bool)

(declare-fun res!239964 () Bool)

(assert (=> b!413010 (=> (not res!239964) (not e!247029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413010 (= res!239964 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17544 () Bool)

(assert (=> mapIsEmpty!17544 mapRes!17544))

(declare-fun b!413011 () Bool)

(declare-fun e!247035 () Bool)

(assert (=> b!413011 (= e!247034 (and e!247035 mapRes!17544))))

(declare-fun condMapEmpty!17544 () Bool)

(declare-fun mapDefault!17544 () ValueCell!4964)

(assert (=> b!413011 (= condMapEmpty!17544 (= (arr!11996 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4964)) mapDefault!17544)))))

(declare-fun b!413012 () Bool)

(declare-fun res!239970 () Bool)

(assert (=> b!413012 (=> (not res!239970) (not e!247029))))

(declare-datatypes ((List!6841 0))(
  ( (Nil!6838) (Cons!6837 (h!7693 (_ BitVec 64)) (t!12007 List!6841)) )
))
(declare-fun arrayNoDuplicates!0 (array!25092 (_ BitVec 32) List!6841) Bool)

(assert (=> b!413012 (= res!239970 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6838))))

(declare-fun b!413013 () Bool)

(declare-fun e!247030 () Bool)

(assert (=> b!413013 (= e!247031 e!247030)))

(declare-fun res!239967 () Bool)

(assert (=> b!413013 (=> (not res!239967) (not e!247030))))

(assert (=> b!413013 (= res!239967 (= from!863 i!563))))

(declare-fun lt!189639 () ListLongMap!5735)

(assert (=> b!413013 (= lt!189639 (getCurrentListMapNoExtraKeys!1134 lt!189641 lt!189642 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!413013 (= lt!189642 (array!25095 (store (arr!11996 _values!549) i!563 (ValueCellFull!4964 v!412)) (size!12348 _values!549)))))

(declare-fun lt!189638 () ListLongMap!5735)

(assert (=> b!413013 (= lt!189638 (getCurrentListMapNoExtraKeys!1134 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!413014 () Bool)

(declare-fun res!239969 () Bool)

(assert (=> b!413014 (=> (not res!239969) (not e!247029))))

(assert (=> b!413014 (= res!239969 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12347 _keys!709))))))

(declare-fun b!413015 () Bool)

(declare-fun res!239973 () Bool)

(assert (=> b!413015 (=> (not res!239973) (not e!247031))))

(assert (=> b!413015 (= res!239973 (bvsle from!863 i!563))))

(declare-fun b!413016 () Bool)

(assert (=> b!413016 (= e!247036 tp_is_empty!10615)))

(declare-fun b!413017 () Bool)

(declare-fun res!239971 () Bool)

(assert (=> b!413017 (=> (not res!239971) (not e!247029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413017 (= res!239971 (validKeyInArray!0 k0!794))))

(declare-fun b!413018 () Bool)

(assert (=> b!413018 (= e!247030 (not true))))

(assert (=> b!413018 e!247032))

(assert (=> b!413018 (= c!54885 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12217 0))(
  ( (Unit!12218) )
))
(declare-fun lt!189640 () Unit!12217)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!376 (array!25092 array!25094 (_ BitVec 32) (_ BitVec 32) V!15259 V!15259 (_ BitVec 32) (_ BitVec 64) V!15259 (_ BitVec 32) Int) Unit!12217)

(assert (=> b!413018 (= lt!189640 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!376 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28552 () Bool)

(assert (=> bm!28552 (= call!28555 (getCurrentListMapNoExtraKeys!1134 (ite c!54885 lt!189641 _keys!709) (ite c!54885 lt!189642 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413019 () Bool)

(declare-fun res!239968 () Bool)

(assert (=> b!413019 (=> (not res!239968) (not e!247029))))

(declare-fun arrayContainsKey!0 (array!25092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413019 (= res!239968 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!413020 () Bool)

(declare-fun res!239972 () Bool)

(assert (=> b!413020 (=> (not res!239972) (not e!247029))))

(assert (=> b!413020 (= res!239972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!413021 () Bool)

(assert (=> b!413021 (= e!247035 tp_is_empty!10615)))

(declare-fun b!413022 () Bool)

(declare-fun res!239974 () Bool)

(assert (=> b!413022 (=> (not res!239974) (not e!247029))))

(assert (=> b!413022 (= res!239974 (and (= (size!12348 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12347 _keys!709) (size!12348 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413023 () Bool)

(declare-fun res!239976 () Bool)

(assert (=> b!413023 (=> (not res!239976) (not e!247031))))

(assert (=> b!413023 (= res!239976 (arrayNoDuplicates!0 lt!189641 #b00000000000000000000000000000000 Nil!6838))))

(assert (= (and start!39182 res!239975) b!413010))

(assert (= (and b!413010 res!239964) b!413022))

(assert (= (and b!413022 res!239974) b!413020))

(assert (= (and b!413020 res!239972) b!413012))

(assert (= (and b!413012 res!239970) b!413014))

(assert (= (and b!413014 res!239969) b!413017))

(assert (= (and b!413017 res!239971) b!413008))

(assert (= (and b!413008 res!239965) b!413019))

(assert (= (and b!413019 res!239968) b!413007))

(assert (= (and b!413007 res!239966) b!413023))

(assert (= (and b!413023 res!239976) b!413015))

(assert (= (and b!413015 res!239973) b!413013))

(assert (= (and b!413013 res!239967) b!413018))

(assert (= (and b!413018 c!54885) b!413009))

(assert (= (and b!413018 (not c!54885)) b!413006))

(assert (= (or b!413009 b!413006) bm!28552))

(assert (= (or b!413009 b!413006) bm!28551))

(assert (= (and b!413011 condMapEmpty!17544) mapIsEmpty!17544))

(assert (= (and b!413011 (not condMapEmpty!17544)) mapNonEmpty!17544))

(get-info :version)

(assert (= (and mapNonEmpty!17544 ((_ is ValueCellFull!4964) mapValue!17544)) b!413016))

(assert (= (and b!413011 ((_ is ValueCellFull!4964) mapDefault!17544)) b!413021))

(assert (= start!39182 b!413011))

(declare-fun m!402897 () Bool)

(assert (=> b!413018 m!402897))

(declare-fun m!402899 () Bool)

(assert (=> b!413020 m!402899))

(declare-fun m!402901 () Bool)

(assert (=> b!413010 m!402901))

(declare-fun m!402903 () Bool)

(assert (=> bm!28551 m!402903))

(declare-fun m!402905 () Bool)

(assert (=> b!413009 m!402905))

(declare-fun m!402907 () Bool)

(assert (=> b!413007 m!402907))

(declare-fun m!402909 () Bool)

(assert (=> b!413007 m!402909))

(declare-fun m!402911 () Bool)

(assert (=> mapNonEmpty!17544 m!402911))

(declare-fun m!402913 () Bool)

(assert (=> b!413013 m!402913))

(declare-fun m!402915 () Bool)

(assert (=> b!413013 m!402915))

(declare-fun m!402917 () Bool)

(assert (=> b!413013 m!402917))

(declare-fun m!402919 () Bool)

(assert (=> b!413012 m!402919))

(declare-fun m!402921 () Bool)

(assert (=> b!413017 m!402921))

(declare-fun m!402923 () Bool)

(assert (=> b!413023 m!402923))

(declare-fun m!402925 () Bool)

(assert (=> start!39182 m!402925))

(declare-fun m!402927 () Bool)

(assert (=> start!39182 m!402927))

(declare-fun m!402929 () Bool)

(assert (=> b!413019 m!402929))

(declare-fun m!402931 () Bool)

(assert (=> b!413008 m!402931))

(declare-fun m!402933 () Bool)

(assert (=> bm!28552 m!402933))

(check-sat (not b!413012) (not mapNonEmpty!17544) (not b!413013) (not bm!28551) (not b!413018) (not b!413020) tp_is_empty!10615 (not bm!28552) (not b!413023) (not b!413007) (not b!413010) (not b!413019) (not b_next!9463) (not b!413009) (not b!413017) (not start!39182) b_and!16863)
(check-sat b_and!16863 (not b_next!9463))
