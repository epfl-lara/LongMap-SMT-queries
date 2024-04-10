; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39192 () Bool)

(assert start!39192)

(declare-fun b_free!9459 () Bool)

(declare-fun b_next!9459 () Bool)

(assert (=> start!39192 (= b_free!9459 (not b_next!9459))))

(declare-fun tp!33906 () Bool)

(declare-fun b_and!16845 () Bool)

(assert (=> start!39192 (= tp!33906 b_and!16845)))

(declare-fun b!412947 () Bool)

(declare-fun res!239889 () Bool)

(declare-fun e!247013 () Bool)

(assert (=> b!412947 (=> (not res!239889) (not e!247013))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412947 (= res!239889 (bvsle from!863 i!563))))

(declare-fun b!412948 () Bool)

(declare-fun res!239892 () Bool)

(declare-fun e!247018 () Bool)

(assert (=> b!412948 (=> (not res!239892) (not e!247018))))

(declare-datatypes ((array!25081 0))(
  ( (array!25082 (arr!11990 (Array (_ BitVec 32) (_ BitVec 64))) (size!12342 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25081)

(declare-datatypes ((List!6971 0))(
  ( (Nil!6968) (Cons!6967 (h!7823 (_ BitVec 64)) (t!12145 List!6971)) )
))
(declare-fun arrayNoDuplicates!0 (array!25081 (_ BitVec 32) List!6971) Bool)

(assert (=> b!412948 (= res!239892 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6968))))

(declare-fun b!412949 () Bool)

(declare-fun e!247016 () Bool)

(declare-fun tp_is_empty!10611 () Bool)

(assert (=> b!412949 (= e!247016 tp_is_empty!10611)))

(declare-fun b!412951 () Bool)

(declare-fun res!239893 () Bool)

(assert (=> b!412951 (=> (not res!239893) (not e!247018))))

(assert (=> b!412951 (= res!239893 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12342 _keys!709))))))

(declare-fun b!412952 () Bool)

(declare-datatypes ((V!15253 0))(
  ( (V!15254 (val!5350 Int)) )
))
(declare-datatypes ((tuple2!6946 0))(
  ( (tuple2!6947 (_1!3484 (_ BitVec 64)) (_2!3484 V!15253)) )
))
(declare-datatypes ((List!6972 0))(
  ( (Nil!6969) (Cons!6968 (h!7824 tuple2!6946) (t!12146 List!6972)) )
))
(declare-datatypes ((ListLongMap!5859 0))(
  ( (ListLongMap!5860 (toList!2945 List!6972)) )
))
(declare-fun call!28555 () ListLongMap!5859)

(declare-fun e!247015 () Bool)

(declare-fun call!28556 () ListLongMap!5859)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15253)

(declare-fun +!1158 (ListLongMap!5859 tuple2!6946) ListLongMap!5859)

(assert (=> b!412952 (= e!247015 (= call!28556 (+!1158 call!28555 (tuple2!6947 k0!794 v!412))))))

(declare-fun b!412953 () Bool)

(declare-fun res!239890 () Bool)

(assert (=> b!412953 (=> (not res!239890) (not e!247018))))

(declare-fun arrayContainsKey!0 (array!25081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412953 (= res!239890 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun minValue!515 () V!15253)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4962 0))(
  ( (ValueCellFull!4962 (v!7597 V!15253)) (EmptyCell!4962) )
))
(declare-datatypes ((array!25083 0))(
  ( (array!25084 (arr!11991 (Array (_ BitVec 32) ValueCell!4962)) (size!12343 (_ BitVec 32))) )
))
(declare-fun lt!189592 () array!25083)

(declare-fun _values!549 () array!25083)

(declare-fun c!54902 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun bm!28552 () Bool)

(declare-fun lt!189589 () array!25081)

(declare-fun zeroValue!515 () V!15253)

(declare-fun getCurrentListMapNoExtraKeys!1153 (array!25081 array!25083 (_ BitVec 32) (_ BitVec 32) V!15253 V!15253 (_ BitVec 32) Int) ListLongMap!5859)

(assert (=> bm!28552 (= call!28555 (getCurrentListMapNoExtraKeys!1153 (ite c!54902 _keys!709 lt!189589) (ite c!54902 _values!549 lt!189592) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!412954 () Bool)

(declare-fun res!239899 () Bool)

(assert (=> b!412954 (=> (not res!239899) (not e!247018))))

(assert (=> b!412954 (= res!239899 (and (= (size!12343 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12342 _keys!709) (size!12343 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412955 () Bool)

(declare-fun e!247017 () Bool)

(assert (=> b!412955 (= e!247017 tp_is_empty!10611)))

(declare-fun bm!28553 () Bool)

(assert (=> bm!28553 (= call!28556 (getCurrentListMapNoExtraKeys!1153 (ite c!54902 lt!189589 _keys!709) (ite c!54902 lt!189592 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!412956 () Bool)

(declare-fun e!247014 () Bool)

(assert (=> b!412956 (= e!247013 e!247014)))

(declare-fun res!239900 () Bool)

(assert (=> b!412956 (=> (not res!239900) (not e!247014))))

(assert (=> b!412956 (= res!239900 (= from!863 i!563))))

(declare-fun lt!189593 () ListLongMap!5859)

(assert (=> b!412956 (= lt!189593 (getCurrentListMapNoExtraKeys!1153 lt!189589 lt!189592 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!412956 (= lt!189592 (array!25084 (store (arr!11991 _values!549) i!563 (ValueCellFull!4962 v!412)) (size!12343 _values!549)))))

(declare-fun lt!189591 () ListLongMap!5859)

(assert (=> b!412956 (= lt!189591 (getCurrentListMapNoExtraKeys!1153 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412957 () Bool)

(assert (=> b!412957 (= e!247015 (= call!28555 call!28556))))

(declare-fun b!412958 () Bool)

(declare-fun res!239895 () Bool)

(assert (=> b!412958 (=> (not res!239895) (not e!247018))))

(assert (=> b!412958 (= res!239895 (or (= (select (arr!11990 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11990 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!239896 () Bool)

(assert (=> start!39192 (=> (not res!239896) (not e!247018))))

(assert (=> start!39192 (= res!239896 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12342 _keys!709))))))

(assert (=> start!39192 e!247018))

(assert (=> start!39192 tp_is_empty!10611))

(assert (=> start!39192 tp!33906))

(assert (=> start!39192 true))

(declare-fun e!247020 () Bool)

(declare-fun array_inv!8744 (array!25083) Bool)

(assert (=> start!39192 (and (array_inv!8744 _values!549) e!247020)))

(declare-fun array_inv!8745 (array!25081) Bool)

(assert (=> start!39192 (array_inv!8745 _keys!709)))

(declare-fun b!412950 () Bool)

(assert (=> b!412950 (= e!247014 (not true))))

(assert (=> b!412950 e!247015))

(assert (=> b!412950 (= c!54902 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12220 0))(
  ( (Unit!12221) )
))
(declare-fun lt!189590 () Unit!12220)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!368 (array!25081 array!25083 (_ BitVec 32) (_ BitVec 32) V!15253 V!15253 (_ BitVec 32) (_ BitVec 64) V!15253 (_ BitVec 32) Int) Unit!12220)

(assert (=> b!412950 (= lt!189590 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!368 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17538 () Bool)

(declare-fun mapRes!17538 () Bool)

(assert (=> mapIsEmpty!17538 mapRes!17538))

(declare-fun b!412959 () Bool)

(declare-fun res!239901 () Bool)

(assert (=> b!412959 (=> (not res!239901) (not e!247018))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412959 (= res!239901 (validMask!0 mask!1025))))

(declare-fun b!412960 () Bool)

(declare-fun res!239898 () Bool)

(assert (=> b!412960 (=> (not res!239898) (not e!247018))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412960 (= res!239898 (validKeyInArray!0 k0!794))))

(declare-fun b!412961 () Bool)

(assert (=> b!412961 (= e!247020 (and e!247016 mapRes!17538))))

(declare-fun condMapEmpty!17538 () Bool)

(declare-fun mapDefault!17538 () ValueCell!4962)

(assert (=> b!412961 (= condMapEmpty!17538 (= (arr!11991 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4962)) mapDefault!17538)))))

(declare-fun b!412962 () Bool)

(assert (=> b!412962 (= e!247018 e!247013)))

(declare-fun res!239897 () Bool)

(assert (=> b!412962 (=> (not res!239897) (not e!247013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25081 (_ BitVec 32)) Bool)

(assert (=> b!412962 (= res!239897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189589 mask!1025))))

(assert (=> b!412962 (= lt!189589 (array!25082 (store (arr!11990 _keys!709) i!563 k0!794) (size!12342 _keys!709)))))

(declare-fun mapNonEmpty!17538 () Bool)

(declare-fun tp!33905 () Bool)

(assert (=> mapNonEmpty!17538 (= mapRes!17538 (and tp!33905 e!247017))))

(declare-fun mapRest!17538 () (Array (_ BitVec 32) ValueCell!4962))

(declare-fun mapKey!17538 () (_ BitVec 32))

(declare-fun mapValue!17538 () ValueCell!4962)

(assert (=> mapNonEmpty!17538 (= (arr!11991 _values!549) (store mapRest!17538 mapKey!17538 mapValue!17538))))

(declare-fun b!412963 () Bool)

(declare-fun res!239891 () Bool)

(assert (=> b!412963 (=> (not res!239891) (not e!247018))))

(assert (=> b!412963 (= res!239891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412964 () Bool)

(declare-fun res!239894 () Bool)

(assert (=> b!412964 (=> (not res!239894) (not e!247013))))

(assert (=> b!412964 (= res!239894 (arrayNoDuplicates!0 lt!189589 #b00000000000000000000000000000000 Nil!6968))))

(assert (= (and start!39192 res!239896) b!412959))

(assert (= (and b!412959 res!239901) b!412954))

(assert (= (and b!412954 res!239899) b!412963))

(assert (= (and b!412963 res!239891) b!412948))

(assert (= (and b!412948 res!239892) b!412951))

(assert (= (and b!412951 res!239893) b!412960))

(assert (= (and b!412960 res!239898) b!412958))

(assert (= (and b!412958 res!239895) b!412953))

(assert (= (and b!412953 res!239890) b!412962))

(assert (= (and b!412962 res!239897) b!412964))

(assert (= (and b!412964 res!239894) b!412947))

(assert (= (and b!412947 res!239889) b!412956))

(assert (= (and b!412956 res!239900) b!412950))

(assert (= (and b!412950 c!54902) b!412952))

(assert (= (and b!412950 (not c!54902)) b!412957))

(assert (= (or b!412952 b!412957) bm!28553))

(assert (= (or b!412952 b!412957) bm!28552))

(assert (= (and b!412961 condMapEmpty!17538) mapIsEmpty!17538))

(assert (= (and b!412961 (not condMapEmpty!17538)) mapNonEmpty!17538))

(get-info :version)

(assert (= (and mapNonEmpty!17538 ((_ is ValueCellFull!4962) mapValue!17538)) b!412955))

(assert (= (and b!412961 ((_ is ValueCellFull!4962) mapDefault!17538)) b!412949))

(assert (= start!39192 b!412961))

(declare-fun m!402591 () Bool)

(assert (=> start!39192 m!402591))

(declare-fun m!402593 () Bool)

(assert (=> start!39192 m!402593))

(declare-fun m!402595 () Bool)

(assert (=> b!412963 m!402595))

(declare-fun m!402597 () Bool)

(assert (=> b!412948 m!402597))

(declare-fun m!402599 () Bool)

(assert (=> bm!28552 m!402599))

(declare-fun m!402601 () Bool)

(assert (=> b!412956 m!402601))

(declare-fun m!402603 () Bool)

(assert (=> b!412956 m!402603))

(declare-fun m!402605 () Bool)

(assert (=> b!412956 m!402605))

(declare-fun m!402607 () Bool)

(assert (=> bm!28553 m!402607))

(declare-fun m!402609 () Bool)

(assert (=> b!412964 m!402609))

(declare-fun m!402611 () Bool)

(assert (=> b!412958 m!402611))

(declare-fun m!402613 () Bool)

(assert (=> b!412953 m!402613))

(declare-fun m!402615 () Bool)

(assert (=> b!412959 m!402615))

(declare-fun m!402617 () Bool)

(assert (=> mapNonEmpty!17538 m!402617))

(declare-fun m!402619 () Bool)

(assert (=> b!412950 m!402619))

(declare-fun m!402621 () Bool)

(assert (=> b!412960 m!402621))

(declare-fun m!402623 () Bool)

(assert (=> b!412952 m!402623))

(declare-fun m!402625 () Bool)

(assert (=> b!412962 m!402625))

(declare-fun m!402627 () Bool)

(assert (=> b!412962 m!402627))

(check-sat (not b!412952) (not bm!28553) (not bm!28552) (not b!412950) (not b!412960) (not b!412956) (not b!412962) (not mapNonEmpty!17538) (not b!412963) (not b_next!9459) tp_is_empty!10611 (not b!412948) (not b!412959) (not start!39192) (not b!412964) (not b!412953) b_and!16845)
(check-sat b_and!16845 (not b_next!9459))
