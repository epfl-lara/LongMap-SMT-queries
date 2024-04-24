; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38588 () Bool)

(assert start!38588)

(declare-fun b_free!9139 () Bool)

(declare-fun b_next!9139 () Bool)

(assert (=> start!38588 (= b_free!9139 (not b_next!9139))))

(declare-fun tp!32540 () Bool)

(declare-fun b_and!16539 () Bool)

(assert (=> start!38588 (= tp!32540 b_and!16539)))

(declare-fun b!399954 () Bool)

(declare-fun res!230073 () Bool)

(declare-fun e!241432 () Bool)

(assert (=> b!399954 (=> (not res!230073) (not e!241432))))

(declare-datatypes ((array!23930 0))(
  ( (array!23931 (arr!11414 (Array (_ BitVec 32) (_ BitVec 64))) (size!11766 (_ BitVec 32))) )
))
(declare-fun lt!187662 () array!23930)

(declare-datatypes ((List!6482 0))(
  ( (Nil!6479) (Cons!6478 (h!7334 (_ BitVec 64)) (t!11648 List!6482)) )
))
(declare-fun arrayNoDuplicates!0 (array!23930 (_ BitVec 32) List!6482) Bool)

(assert (=> b!399954 (= res!230073 (arrayNoDuplicates!0 lt!187662 #b00000000000000000000000000000000 Nil!6479))))

(declare-fun b!399955 () Bool)

(declare-fun e!241435 () Bool)

(declare-fun tp_is_empty!10021 () Bool)

(assert (=> b!399955 (= e!241435 tp_is_empty!10021)))

(declare-datatypes ((V!14467 0))(
  ( (V!14468 (val!5055 Int)) )
))
(declare-fun minValue!515 () V!14467)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4667 0))(
  ( (ValueCellFull!4667 (v!7303 V!14467)) (EmptyCell!4667) )
))
(declare-datatypes ((array!23932 0))(
  ( (array!23933 (arr!11415 (Array (_ BitVec 32) ValueCell!4667)) (size!11767 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23932)

(declare-fun zeroValue!515 () V!14467)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun bm!28065 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!23930)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!6562 0))(
  ( (tuple2!6563 (_1!3292 (_ BitVec 64)) (_2!3292 V!14467)) )
))
(declare-datatypes ((List!6483 0))(
  ( (Nil!6480) (Cons!6479 (h!7335 tuple2!6562) (t!11649 List!6483)) )
))
(declare-datatypes ((ListLongMap!5477 0))(
  ( (ListLongMap!5478 (toList!2754 List!6483)) )
))
(declare-fun call!28068 () ListLongMap!5477)

(declare-fun v!412 () V!14467)

(declare-fun c!54642 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1012 (array!23930 array!23932 (_ BitVec 32) (_ BitVec 32) V!14467 V!14467 (_ BitVec 32) Int) ListLongMap!5477)

(assert (=> bm!28065 (= call!28068 (getCurrentListMapNoExtraKeys!1012 (ite c!54642 lt!187662 _keys!709) (ite c!54642 (array!23933 (store (arr!11415 _values!549) i!563 (ValueCellFull!4667 v!412)) (size!11767 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399956 () Bool)

(declare-fun e!241434 () Bool)

(declare-fun mapRes!16653 () Bool)

(assert (=> b!399956 (= e!241434 (and e!241435 mapRes!16653))))

(declare-fun condMapEmpty!16653 () Bool)

(declare-fun mapDefault!16653 () ValueCell!4667)

(assert (=> b!399956 (= condMapEmpty!16653 (= (arr!11415 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4667)) mapDefault!16653)))))

(declare-fun b!399957 () Bool)

(declare-fun res!230082 () Bool)

(declare-fun e!241433 () Bool)

(assert (=> b!399957 (=> (not res!230082) (not e!241433))))

(assert (=> b!399957 (= res!230082 (and (= (size!11767 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11766 _keys!709) (size!11767 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!399958 () Bool)

(declare-fun res!230079 () Bool)

(assert (=> b!399958 (=> (not res!230079) (not e!241433))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23930 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399958 (= res!230079 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16653 () Bool)

(assert (=> mapIsEmpty!16653 mapRes!16653))

(declare-fun b!399959 () Bool)

(declare-fun res!230077 () Bool)

(assert (=> b!399959 (=> (not res!230077) (not e!241432))))

(assert (=> b!399959 (= res!230077 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11766 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!399960 () Bool)

(assert (=> b!399960 (= e!241432 (not true))))

(declare-fun e!241430 () Bool)

(assert (=> b!399960 e!241430))

(assert (=> b!399960 (= c!54642 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12093 0))(
  ( (Unit!12094) )
))
(declare-fun lt!187661 () Unit!12093)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!314 (array!23930 array!23932 (_ BitVec 32) (_ BitVec 32) V!14467 V!14467 (_ BitVec 32) (_ BitVec 64) V!14467 (_ BitVec 32) Int) Unit!12093)

(assert (=> b!399960 (= lt!187661 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!314 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399961 () Bool)

(declare-fun res!230080 () Bool)

(assert (=> b!399961 (=> (not res!230080) (not e!241433))))

(assert (=> b!399961 (= res!230080 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11766 _keys!709))))))

(declare-fun res!230072 () Bool)

(assert (=> start!38588 (=> (not res!230072) (not e!241433))))

(assert (=> start!38588 (= res!230072 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11766 _keys!709))))))

(assert (=> start!38588 e!241433))

(assert (=> start!38588 tp_is_empty!10021))

(assert (=> start!38588 tp!32540))

(assert (=> start!38588 true))

(declare-fun array_inv!8432 (array!23932) Bool)

(assert (=> start!38588 (and (array_inv!8432 _values!549) e!241434)))

(declare-fun array_inv!8433 (array!23930) Bool)

(assert (=> start!38588 (array_inv!8433 _keys!709)))

(declare-fun b!399962 () Bool)

(declare-fun res!230074 () Bool)

(assert (=> b!399962 (=> (not res!230074) (not e!241433))))

(assert (=> b!399962 (= res!230074 (or (= (select (arr!11414 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11414 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!399963 () Bool)

(declare-fun e!241431 () Bool)

(assert (=> b!399963 (= e!241431 tp_is_empty!10021)))

(declare-fun b!399964 () Bool)

(declare-fun res!230078 () Bool)

(assert (=> b!399964 (=> (not res!230078) (not e!241433))))

(assert (=> b!399964 (= res!230078 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6479))))

(declare-fun mapNonEmpty!16653 () Bool)

(declare-fun tp!32541 () Bool)

(assert (=> mapNonEmpty!16653 (= mapRes!16653 (and tp!32541 e!241431))))

(declare-fun mapValue!16653 () ValueCell!4667)

(declare-fun mapRest!16653 () (Array (_ BitVec 32) ValueCell!4667))

(declare-fun mapKey!16653 () (_ BitVec 32))

(assert (=> mapNonEmpty!16653 (= (arr!11415 _values!549) (store mapRest!16653 mapKey!16653 mapValue!16653))))

(declare-fun b!399965 () Bool)

(declare-fun call!28069 () ListLongMap!5477)

(assert (=> b!399965 (= e!241430 (= call!28069 call!28068))))

(declare-fun bm!28066 () Bool)

(assert (=> bm!28066 (= call!28069 (getCurrentListMapNoExtraKeys!1012 (ite c!54642 _keys!709 lt!187662) (ite c!54642 _values!549 (array!23933 (store (arr!11415 _values!549) i!563 (ValueCellFull!4667 v!412)) (size!11767 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399966 () Bool)

(declare-fun res!230081 () Bool)

(assert (=> b!399966 (=> (not res!230081) (not e!241433))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399966 (= res!230081 (validMask!0 mask!1025))))

(declare-fun b!399967 () Bool)

(assert (=> b!399967 (= e!241433 e!241432)))

(declare-fun res!230075 () Bool)

(assert (=> b!399967 (=> (not res!230075) (not e!241432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23930 (_ BitVec 32)) Bool)

(assert (=> b!399967 (= res!230075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187662 mask!1025))))

(assert (=> b!399967 (= lt!187662 (array!23931 (store (arr!11414 _keys!709) i!563 k0!794) (size!11766 _keys!709)))))

(declare-fun b!399968 () Bool)

(declare-fun +!1102 (ListLongMap!5477 tuple2!6562) ListLongMap!5477)

(assert (=> b!399968 (= e!241430 (= call!28068 (+!1102 call!28069 (tuple2!6563 k0!794 v!412))))))

(declare-fun b!399969 () Bool)

(declare-fun res!230071 () Bool)

(assert (=> b!399969 (=> (not res!230071) (not e!241433))))

(assert (=> b!399969 (= res!230071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!399970 () Bool)

(declare-fun res!230076 () Bool)

(assert (=> b!399970 (=> (not res!230076) (not e!241433))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399970 (= res!230076 (validKeyInArray!0 k0!794))))

(assert (= (and start!38588 res!230072) b!399966))

(assert (= (and b!399966 res!230081) b!399957))

(assert (= (and b!399957 res!230082) b!399969))

(assert (= (and b!399969 res!230071) b!399964))

(assert (= (and b!399964 res!230078) b!399961))

(assert (= (and b!399961 res!230080) b!399970))

(assert (= (and b!399970 res!230076) b!399962))

(assert (= (and b!399962 res!230074) b!399958))

(assert (= (and b!399958 res!230079) b!399967))

(assert (= (and b!399967 res!230075) b!399954))

(assert (= (and b!399954 res!230073) b!399959))

(assert (= (and b!399959 res!230077) b!399960))

(assert (= (and b!399960 c!54642) b!399968))

(assert (= (and b!399960 (not c!54642)) b!399965))

(assert (= (or b!399968 b!399965) bm!28065))

(assert (= (or b!399968 b!399965) bm!28066))

(assert (= (and b!399956 condMapEmpty!16653) mapIsEmpty!16653))

(assert (= (and b!399956 (not condMapEmpty!16653)) mapNonEmpty!16653))

(get-info :version)

(assert (= (and mapNonEmpty!16653 ((_ is ValueCellFull!4667) mapValue!16653)) b!399963))

(assert (= (and b!399956 ((_ is ValueCellFull!4667) mapDefault!16653)) b!399955))

(assert (= start!38588 b!399956))

(declare-fun m!394569 () Bool)

(assert (=> mapNonEmpty!16653 m!394569))

(declare-fun m!394571 () Bool)

(assert (=> b!399954 m!394571))

(declare-fun m!394573 () Bool)

(assert (=> b!399969 m!394573))

(declare-fun m!394575 () Bool)

(assert (=> b!399970 m!394575))

(declare-fun m!394577 () Bool)

(assert (=> bm!28065 m!394577))

(declare-fun m!394579 () Bool)

(assert (=> bm!28065 m!394579))

(declare-fun m!394581 () Bool)

(assert (=> b!399968 m!394581))

(declare-fun m!394583 () Bool)

(assert (=> b!399962 m!394583))

(declare-fun m!394585 () Bool)

(assert (=> start!38588 m!394585))

(declare-fun m!394587 () Bool)

(assert (=> start!38588 m!394587))

(declare-fun m!394589 () Bool)

(assert (=> b!399967 m!394589))

(declare-fun m!394591 () Bool)

(assert (=> b!399967 m!394591))

(declare-fun m!394593 () Bool)

(assert (=> b!399964 m!394593))

(declare-fun m!394595 () Bool)

(assert (=> b!399966 m!394595))

(assert (=> bm!28066 m!394577))

(declare-fun m!394597 () Bool)

(assert (=> bm!28066 m!394597))

(declare-fun m!394599 () Bool)

(assert (=> b!399958 m!394599))

(declare-fun m!394601 () Bool)

(assert (=> b!399960 m!394601))

(check-sat (not b!399964) (not mapNonEmpty!16653) (not b!399954) (not b!399969) (not b!399968) (not b!399970) tp_is_empty!10021 (not b!399960) (not bm!28066) (not b!399966) (not start!38588) (not b!399967) (not b!399958) b_and!16539 (not b_next!9139) (not bm!28065))
(check-sat b_and!16539 (not b_next!9139))
