; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39188 () Bool)

(assert start!39188)

(declare-fun b_free!9469 () Bool)

(declare-fun b_next!9469 () Bool)

(assert (=> start!39188 (= b_free!9469 (not b_next!9469))))

(declare-fun tp!33936 () Bool)

(declare-fun b_and!16829 () Bool)

(assert (=> start!39188 (= tp!33936 b_and!16829)))

(declare-fun b!412946 () Bool)

(declare-fun res!239957 () Bool)

(declare-fun e!246964 () Bool)

(assert (=> b!412946 (=> (not res!239957) (not e!246964))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!412946 (= res!239957 (bvsle from!863 i!563))))

(declare-datatypes ((V!15267 0))(
  ( (V!15268 (val!5355 Int)) )
))
(declare-fun minValue!515 () V!15267)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4967 0))(
  ( (ValueCellFull!4967 (v!7596 V!15267)) (EmptyCell!4967) )
))
(declare-datatypes ((array!25093 0))(
  ( (array!25094 (arr!11996 (Array (_ BitVec 32) ValueCell!4967)) (size!12349 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25093)

(declare-datatypes ((tuple2!6936 0))(
  ( (tuple2!6937 (_1!3479 (_ BitVec 64)) (_2!3479 V!15267)) )
))
(declare-datatypes ((List!6955 0))(
  ( (Nil!6952) (Cons!6951 (h!7807 tuple2!6936) (t!12120 List!6955)) )
))
(declare-datatypes ((ListLongMap!5839 0))(
  ( (ListLongMap!5840 (toList!2935 List!6955)) )
))
(declare-fun call!28561 () ListLongMap!5839)

(declare-fun lt!189430 () array!25093)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!25095 0))(
  ( (array!25096 (arr!11997 (Array (_ BitVec 32) (_ BitVec 64))) (size!12350 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25095)

(declare-fun lt!189433 () array!25095)

(declare-fun zeroValue!515 () V!15267)

(declare-fun c!54846 () Bool)

(declare-fun bm!28557 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1149 (array!25095 array!25093 (_ BitVec 32) (_ BitVec 32) V!15267 V!15267 (_ BitVec 32) Int) ListLongMap!5839)

(assert (=> bm!28557 (= call!28561 (getCurrentListMapNoExtraKeys!1149 (ite c!54846 _keys!709 lt!189433) (ite c!54846 _values!549 lt!189430) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17553 () Bool)

(declare-fun mapRes!17553 () Bool)

(declare-fun tp!33935 () Bool)

(declare-fun e!246960 () Bool)

(assert (=> mapNonEmpty!17553 (= mapRes!17553 (and tp!33935 e!246960))))

(declare-fun mapRest!17553 () (Array (_ BitVec 32) ValueCell!4967))

(declare-fun mapKey!17553 () (_ BitVec 32))

(declare-fun mapValue!17553 () ValueCell!4967)

(assert (=> mapNonEmpty!17553 (= (arr!11996 _values!549) (store mapRest!17553 mapKey!17553 mapValue!17553))))

(declare-fun b!412947 () Bool)

(declare-fun e!246961 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun call!28560 () ListLongMap!5839)

(declare-fun v!412 () V!15267)

(declare-fun +!1178 (ListLongMap!5839 tuple2!6936) ListLongMap!5839)

(assert (=> b!412947 (= e!246961 (= call!28560 (+!1178 call!28561 (tuple2!6937 k0!794 v!412))))))

(declare-fun b!412948 () Bool)

(declare-fun res!239961 () Bool)

(assert (=> b!412948 (=> (not res!239961) (not e!246964))))

(declare-datatypes ((List!6956 0))(
  ( (Nil!6953) (Cons!6952 (h!7808 (_ BitVec 64)) (t!12121 List!6956)) )
))
(declare-fun arrayNoDuplicates!0 (array!25095 (_ BitVec 32) List!6956) Bool)

(assert (=> b!412948 (= res!239961 (arrayNoDuplicates!0 lt!189433 #b00000000000000000000000000000000 Nil!6953))))

(declare-fun bm!28558 () Bool)

(assert (=> bm!28558 (= call!28560 (getCurrentListMapNoExtraKeys!1149 (ite c!54846 lt!189433 _keys!709) (ite c!54846 lt!189430 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!412949 () Bool)

(declare-fun res!239960 () Bool)

(declare-fun e!246962 () Bool)

(assert (=> b!412949 (=> (not res!239960) (not e!246962))))

(assert (=> b!412949 (= res!239960 (and (= (size!12349 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12350 _keys!709) (size!12349 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412950 () Bool)

(declare-fun res!239958 () Bool)

(assert (=> b!412950 (=> (not res!239958) (not e!246962))))

(assert (=> b!412950 (= res!239958 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12350 _keys!709))))))

(declare-fun b!412952 () Bool)

(assert (=> b!412952 (= e!246962 e!246964)))

(declare-fun res!239963 () Bool)

(assert (=> b!412952 (=> (not res!239963) (not e!246964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25095 (_ BitVec 32)) Bool)

(assert (=> b!412952 (= res!239963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189433 mask!1025))))

(assert (=> b!412952 (= lt!189433 (array!25096 (store (arr!11997 _keys!709) i!563 k0!794) (size!12350 _keys!709)))))

(declare-fun b!412953 () Bool)

(declare-fun e!246963 () Bool)

(declare-fun e!246959 () Bool)

(assert (=> b!412953 (= e!246963 (and e!246959 mapRes!17553))))

(declare-fun condMapEmpty!17553 () Bool)

(declare-fun mapDefault!17553 () ValueCell!4967)

(assert (=> b!412953 (= condMapEmpty!17553 (= (arr!11996 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4967)) mapDefault!17553)))))

(declare-fun b!412954 () Bool)

(declare-fun res!239956 () Bool)

(assert (=> b!412954 (=> (not res!239956) (not e!246962))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412954 (= res!239956 (validMask!0 mask!1025))))

(declare-fun b!412955 () Bool)

(declare-fun tp_is_empty!10621 () Bool)

(assert (=> b!412955 (= e!246960 tp_is_empty!10621)))

(declare-fun b!412956 () Bool)

(declare-fun res!239962 () Bool)

(assert (=> b!412956 (=> (not res!239962) (not e!246962))))

(assert (=> b!412956 (= res!239962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17553 () Bool)

(assert (=> mapIsEmpty!17553 mapRes!17553))

(declare-fun b!412957 () Bool)

(assert (=> b!412957 (= e!246959 tp_is_empty!10621)))

(declare-fun b!412958 () Bool)

(declare-fun res!239955 () Bool)

(assert (=> b!412958 (=> (not res!239955) (not e!246962))))

(assert (=> b!412958 (= res!239955 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6953))))

(declare-fun b!412959 () Bool)

(declare-fun res!239959 () Bool)

(assert (=> b!412959 (=> (not res!239959) (not e!246962))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412959 (= res!239959 (validKeyInArray!0 k0!794))))

(declare-fun b!412960 () Bool)

(declare-fun e!246965 () Bool)

(assert (=> b!412960 (= e!246964 e!246965)))

(declare-fun res!239965 () Bool)

(assert (=> b!412960 (=> (not res!239965) (not e!246965))))

(assert (=> b!412960 (= res!239965 (= from!863 i!563))))

(declare-fun lt!189434 () ListLongMap!5839)

(assert (=> b!412960 (= lt!189434 (getCurrentListMapNoExtraKeys!1149 lt!189433 lt!189430 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!412960 (= lt!189430 (array!25094 (store (arr!11996 _values!549) i!563 (ValueCellFull!4967 v!412)) (size!12349 _values!549)))))

(declare-fun lt!189431 () ListLongMap!5839)

(assert (=> b!412960 (= lt!189431 (getCurrentListMapNoExtraKeys!1149 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412961 () Bool)

(assert (=> b!412961 (= e!246961 (= call!28561 call!28560))))

(declare-fun b!412962 () Bool)

(declare-fun res!239967 () Bool)

(assert (=> b!412962 (=> (not res!239967) (not e!246962))))

(assert (=> b!412962 (= res!239967 (or (= (select (arr!11997 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11997 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412963 () Bool)

(assert (=> b!412963 (= e!246965 (not true))))

(assert (=> b!412963 e!246961))

(assert (=> b!412963 (= c!54846 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12198 0))(
  ( (Unit!12199) )
))
(declare-fun lt!189432 () Unit!12198)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!362 (array!25095 array!25093 (_ BitVec 32) (_ BitVec 32) V!15267 V!15267 (_ BitVec 32) (_ BitVec 64) V!15267 (_ BitVec 32) Int) Unit!12198)

(assert (=> b!412963 (= lt!189432 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!362 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!412951 () Bool)

(declare-fun res!239966 () Bool)

(assert (=> b!412951 (=> (not res!239966) (not e!246962))))

(declare-fun arrayContainsKey!0 (array!25095 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412951 (= res!239966 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!239964 () Bool)

(assert (=> start!39188 (=> (not res!239964) (not e!246962))))

(assert (=> start!39188 (= res!239964 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12350 _keys!709))))))

(assert (=> start!39188 e!246962))

(assert (=> start!39188 tp_is_empty!10621))

(assert (=> start!39188 tp!33936))

(assert (=> start!39188 true))

(declare-fun array_inv!8804 (array!25093) Bool)

(assert (=> start!39188 (and (array_inv!8804 _values!549) e!246963)))

(declare-fun array_inv!8805 (array!25095) Bool)

(assert (=> start!39188 (array_inv!8805 _keys!709)))

(assert (= (and start!39188 res!239964) b!412954))

(assert (= (and b!412954 res!239956) b!412949))

(assert (= (and b!412949 res!239960) b!412956))

(assert (= (and b!412956 res!239962) b!412958))

(assert (= (and b!412958 res!239955) b!412950))

(assert (= (and b!412950 res!239958) b!412959))

(assert (= (and b!412959 res!239959) b!412962))

(assert (= (and b!412962 res!239967) b!412951))

(assert (= (and b!412951 res!239966) b!412952))

(assert (= (and b!412952 res!239963) b!412948))

(assert (= (and b!412948 res!239961) b!412946))

(assert (= (and b!412946 res!239957) b!412960))

(assert (= (and b!412960 res!239965) b!412963))

(assert (= (and b!412963 c!54846) b!412947))

(assert (= (and b!412963 (not c!54846)) b!412961))

(assert (= (or b!412947 b!412961) bm!28558))

(assert (= (or b!412947 b!412961) bm!28557))

(assert (= (and b!412953 condMapEmpty!17553) mapIsEmpty!17553))

(assert (= (and b!412953 (not condMapEmpty!17553)) mapNonEmpty!17553))

(get-info :version)

(assert (= (and mapNonEmpty!17553 ((_ is ValueCellFull!4967) mapValue!17553)) b!412955))

(assert (= (and b!412953 ((_ is ValueCellFull!4967) mapDefault!17553)) b!412957))

(assert (= start!39188 b!412953))

(declare-fun m!402057 () Bool)

(assert (=> bm!28558 m!402057))

(declare-fun m!402059 () Bool)

(assert (=> b!412958 m!402059))

(declare-fun m!402061 () Bool)

(assert (=> b!412962 m!402061))

(declare-fun m!402063 () Bool)

(assert (=> mapNonEmpty!17553 m!402063))

(declare-fun m!402065 () Bool)

(assert (=> b!412951 m!402065))

(declare-fun m!402067 () Bool)

(assert (=> b!412960 m!402067))

(declare-fun m!402069 () Bool)

(assert (=> b!412960 m!402069))

(declare-fun m!402071 () Bool)

(assert (=> b!412960 m!402071))

(declare-fun m!402073 () Bool)

(assert (=> b!412956 m!402073))

(declare-fun m!402075 () Bool)

(assert (=> b!412954 m!402075))

(declare-fun m!402077 () Bool)

(assert (=> b!412959 m!402077))

(declare-fun m!402079 () Bool)

(assert (=> b!412952 m!402079))

(declare-fun m!402081 () Bool)

(assert (=> b!412952 m!402081))

(declare-fun m!402083 () Bool)

(assert (=> start!39188 m!402083))

(declare-fun m!402085 () Bool)

(assert (=> start!39188 m!402085))

(declare-fun m!402087 () Bool)

(assert (=> bm!28557 m!402087))

(declare-fun m!402089 () Bool)

(assert (=> b!412948 m!402089))

(declare-fun m!402091 () Bool)

(assert (=> b!412963 m!402091))

(declare-fun m!402093 () Bool)

(assert (=> b!412947 m!402093))

(check-sat (not b!412954) (not start!39188) (not b!412958) (not b!412960) (not b!412948) (not bm!28558) (not b!412963) (not bm!28557) (not b!412959) (not b!412947) (not b_next!9469) (not b!412952) (not b!412956) (not mapNonEmpty!17553) tp_is_empty!10621 (not b!412951) b_and!16829)
(check-sat b_and!16829 (not b_next!9469))
