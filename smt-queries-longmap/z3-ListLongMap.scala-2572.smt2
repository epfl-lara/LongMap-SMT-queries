; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39236 () Bool)

(assert start!39236)

(declare-fun b_free!9517 () Bool)

(declare-fun b_next!9517 () Bool)

(assert (=> start!39236 (= b_free!9517 (not b_next!9517))))

(declare-fun tp!34080 () Bool)

(declare-fun b_and!16923 () Bool)

(assert (=> start!39236 (= tp!34080 b_and!16923)))

(declare-fun mapNonEmpty!17625 () Bool)

(declare-fun mapRes!17625 () Bool)

(declare-fun tp!34079 () Bool)

(declare-fun e!247702 () Bool)

(assert (=> mapNonEmpty!17625 (= mapRes!17625 (and tp!34079 e!247702))))

(declare-datatypes ((V!15331 0))(
  ( (V!15332 (val!5379 Int)) )
))
(declare-datatypes ((ValueCell!4991 0))(
  ( (ValueCellFull!4991 (v!7627 V!15331)) (EmptyCell!4991) )
))
(declare-fun mapRest!17625 () (Array (_ BitVec 32) ValueCell!4991))

(declare-datatypes ((array!25200 0))(
  ( (array!25201 (arr!12049 (Array (_ BitVec 32) ValueCell!4991)) (size!12401 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25200)

(declare-fun mapKey!17625 () (_ BitVec 32))

(declare-fun mapValue!17625 () ValueCell!4991)

(assert (=> mapNonEmpty!17625 (= (arr!12049 _values!549) (store mapRest!17625 mapKey!17625 mapValue!17625))))

(declare-fun b!414490 () Bool)

(declare-fun e!247703 () Bool)

(declare-fun e!247705 () Bool)

(assert (=> b!414490 (= e!247703 (not e!247705))))

(declare-fun res!241038 () Bool)

(assert (=> b!414490 (=> res!241038 e!247705)))

(declare-datatypes ((array!25202 0))(
  ( (array!25203 (arr!12050 (Array (_ BitVec 32) (_ BitVec 64))) (size!12402 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25202)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414490 (= res!241038 (validKeyInArray!0 (select (arr!12050 _keys!709) from!863)))))

(declare-fun e!247704 () Bool)

(assert (=> b!414490 e!247704))

(declare-fun c!54966 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414490 (= c!54966 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15331)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15331)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15331)

(declare-datatypes ((Unit!12255 0))(
  ( (Unit!12256) )
))
(declare-fun lt!190046 () Unit!12255)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!395 (array!25202 array!25200 (_ BitVec 32) (_ BitVec 32) V!15331 V!15331 (_ BitVec 32) (_ BitVec 64) V!15331 (_ BitVec 32) Int) Unit!12255)

(assert (=> b!414490 (= lt!190046 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!395 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414491 () Bool)

(declare-fun tp_is_empty!10669 () Bool)

(assert (=> b!414491 (= e!247702 tp_is_empty!10669)))

(declare-fun res!241049 () Bool)

(declare-fun e!247700 () Bool)

(assert (=> start!39236 (=> (not res!241049) (not e!247700))))

(assert (=> start!39236 (= res!241049 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12402 _keys!709))))))

(assert (=> start!39236 e!247700))

(assert (=> start!39236 tp_is_empty!10669))

(assert (=> start!39236 tp!34080))

(assert (=> start!39236 true))

(declare-fun e!247697 () Bool)

(declare-fun array_inv!8870 (array!25200) Bool)

(assert (=> start!39236 (and (array_inv!8870 _values!549) e!247697)))

(declare-fun array_inv!8871 (array!25202) Bool)

(assert (=> start!39236 (array_inv!8871 _keys!709)))

(declare-fun b!414492 () Bool)

(declare-datatypes ((tuple2!6872 0))(
  ( (tuple2!6873 (_1!3447 (_ BitVec 64)) (_2!3447 V!15331)) )
))
(declare-datatypes ((List!6892 0))(
  ( (Nil!6889) (Cons!6888 (h!7744 tuple2!6872) (t!12066 List!6892)) )
))
(declare-datatypes ((ListLongMap!5787 0))(
  ( (ListLongMap!5788 (toList!2909 List!6892)) )
))
(declare-fun call!28716 () ListLongMap!5787)

(declare-fun call!28717 () ListLongMap!5787)

(assert (=> b!414492 (= e!247704 (= call!28716 call!28717))))

(declare-fun b!414493 () Bool)

(declare-fun res!241048 () Bool)

(assert (=> b!414493 (=> (not res!241048) (not e!247700))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414493 (= res!241048 (validMask!0 mask!1025))))

(declare-fun b!414494 () Bool)

(declare-fun res!241045 () Bool)

(assert (=> b!414494 (=> (not res!241045) (not e!247700))))

(assert (=> b!414494 (= res!241045 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12402 _keys!709))))))

(declare-fun b!414495 () Bool)

(assert (=> b!414495 (= e!247705 true)))

(declare-fun lt!190047 () ListLongMap!5787)

(declare-fun lt!190045 () array!25202)

(declare-fun lt!190044 () array!25200)

(declare-fun +!1186 (ListLongMap!5787 tuple2!6872) ListLongMap!5787)

(declare-fun getCurrentListMapNoExtraKeys!1158 (array!25202 array!25200 (_ BitVec 32) (_ BitVec 32) V!15331 V!15331 (_ BitVec 32) Int) ListLongMap!5787)

(declare-fun get!5948 (ValueCell!4991 V!15331) V!15331)

(declare-fun dynLambda!655 (Int (_ BitVec 64)) V!15331)

(assert (=> b!414495 (= lt!190047 (+!1186 (getCurrentListMapNoExtraKeys!1158 lt!190045 lt!190044 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!6873 (select (arr!12050 lt!190045) from!863) (get!5948 (select (arr!12049 lt!190044) from!863) (dynLambda!655 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!414496 () Bool)

(declare-fun res!241044 () Bool)

(assert (=> b!414496 (=> (not res!241044) (not e!247700))))

(assert (=> b!414496 (= res!241044 (and (= (size!12401 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12402 _keys!709) (size!12401 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414497 () Bool)

(assert (=> b!414497 (= e!247704 (= call!28717 (+!1186 call!28716 (tuple2!6873 k0!794 v!412))))))

(declare-fun mapIsEmpty!17625 () Bool)

(assert (=> mapIsEmpty!17625 mapRes!17625))

(declare-fun b!414498 () Bool)

(declare-fun res!241039 () Bool)

(assert (=> b!414498 (=> (not res!241039) (not e!247700))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25202 (_ BitVec 32)) Bool)

(assert (=> b!414498 (= res!241039 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!414499 () Bool)

(declare-fun res!241042 () Bool)

(assert (=> b!414499 (=> (not res!241042) (not e!247700))))

(declare-fun arrayContainsKey!0 (array!25202 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414499 (= res!241042 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!414500 () Bool)

(declare-fun res!241043 () Bool)

(declare-fun e!247698 () Bool)

(assert (=> b!414500 (=> (not res!241043) (not e!247698))))

(declare-datatypes ((List!6893 0))(
  ( (Nil!6890) (Cons!6889 (h!7745 (_ BitVec 64)) (t!12067 List!6893)) )
))
(declare-fun arrayNoDuplicates!0 (array!25202 (_ BitVec 32) List!6893) Bool)

(assert (=> b!414500 (= res!241043 (arrayNoDuplicates!0 lt!190045 #b00000000000000000000000000000000 Nil!6890))))

(declare-fun b!414501 () Bool)

(declare-fun e!247701 () Bool)

(assert (=> b!414501 (= e!247701 tp_is_empty!10669)))

(declare-fun bm!28713 () Bool)

(assert (=> bm!28713 (= call!28717 (getCurrentListMapNoExtraKeys!1158 (ite c!54966 lt!190045 _keys!709) (ite c!54966 lt!190044 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414502 () Bool)

(assert (=> b!414502 (= e!247697 (and e!247701 mapRes!17625))))

(declare-fun condMapEmpty!17625 () Bool)

(declare-fun mapDefault!17625 () ValueCell!4991)

(assert (=> b!414502 (= condMapEmpty!17625 (= (arr!12049 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4991)) mapDefault!17625)))))

(declare-fun b!414503 () Bool)

(assert (=> b!414503 (= e!247698 e!247703)))

(declare-fun res!241050 () Bool)

(assert (=> b!414503 (=> (not res!241050) (not e!247703))))

(assert (=> b!414503 (= res!241050 (= from!863 i!563))))

(assert (=> b!414503 (= lt!190047 (getCurrentListMapNoExtraKeys!1158 lt!190045 lt!190044 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!414503 (= lt!190044 (array!25201 (store (arr!12049 _values!549) i!563 (ValueCellFull!4991 v!412)) (size!12401 _values!549)))))

(declare-fun lt!190043 () ListLongMap!5787)

(assert (=> b!414503 (= lt!190043 (getCurrentListMapNoExtraKeys!1158 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun bm!28714 () Bool)

(assert (=> bm!28714 (= call!28716 (getCurrentListMapNoExtraKeys!1158 (ite c!54966 _keys!709 lt!190045) (ite c!54966 _values!549 lt!190044) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414504 () Bool)

(declare-fun res!241040 () Bool)

(assert (=> b!414504 (=> (not res!241040) (not e!247700))))

(assert (=> b!414504 (= res!241040 (validKeyInArray!0 k0!794))))

(declare-fun b!414505 () Bool)

(declare-fun res!241041 () Bool)

(assert (=> b!414505 (=> (not res!241041) (not e!247700))))

(assert (=> b!414505 (= res!241041 (or (= (select (arr!12050 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12050 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!414506 () Bool)

(assert (=> b!414506 (= e!247700 e!247698)))

(declare-fun res!241046 () Bool)

(assert (=> b!414506 (=> (not res!241046) (not e!247698))))

(assert (=> b!414506 (= res!241046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190045 mask!1025))))

(assert (=> b!414506 (= lt!190045 (array!25203 (store (arr!12050 _keys!709) i!563 k0!794) (size!12402 _keys!709)))))

(declare-fun b!414507 () Bool)

(declare-fun res!241037 () Bool)

(assert (=> b!414507 (=> (not res!241037) (not e!247698))))

(assert (=> b!414507 (= res!241037 (bvsle from!863 i!563))))

(declare-fun b!414508 () Bool)

(declare-fun res!241047 () Bool)

(assert (=> b!414508 (=> (not res!241047) (not e!247700))))

(assert (=> b!414508 (= res!241047 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6890))))

(assert (= (and start!39236 res!241049) b!414493))

(assert (= (and b!414493 res!241048) b!414496))

(assert (= (and b!414496 res!241044) b!414498))

(assert (= (and b!414498 res!241039) b!414508))

(assert (= (and b!414508 res!241047) b!414494))

(assert (= (and b!414494 res!241045) b!414504))

(assert (= (and b!414504 res!241040) b!414505))

(assert (= (and b!414505 res!241041) b!414499))

(assert (= (and b!414499 res!241042) b!414506))

(assert (= (and b!414506 res!241046) b!414500))

(assert (= (and b!414500 res!241043) b!414507))

(assert (= (and b!414507 res!241037) b!414503))

(assert (= (and b!414503 res!241050) b!414490))

(assert (= (and b!414490 c!54966) b!414497))

(assert (= (and b!414490 (not c!54966)) b!414492))

(assert (= (or b!414497 b!414492) bm!28713))

(assert (= (or b!414497 b!414492) bm!28714))

(assert (= (and b!414490 (not res!241038)) b!414495))

(assert (= (and b!414502 condMapEmpty!17625) mapIsEmpty!17625))

(assert (= (and b!414502 (not condMapEmpty!17625)) mapNonEmpty!17625))

(get-info :version)

(assert (= (and mapNonEmpty!17625 ((_ is ValueCellFull!4991) mapValue!17625)) b!414491))

(assert (= (and b!414502 ((_ is ValueCellFull!4991) mapDefault!17625)) b!414501))

(assert (= start!39236 b!414502))

(declare-fun b_lambda!8843 () Bool)

(assert (=> (not b_lambda!8843) (not b!414495)))

(declare-fun t!12065 () Bool)

(declare-fun tb!3131 () Bool)

(assert (=> (and start!39236 (= defaultEntry!557 defaultEntry!557) t!12065) tb!3131))

(declare-fun result!5797 () Bool)

(assert (=> tb!3131 (= result!5797 tp_is_empty!10669)))

(assert (=> b!414495 t!12065))

(declare-fun b_and!16925 () Bool)

(assert (= b_and!16923 (and (=> t!12065 result!5797) b_and!16925)))

(declare-fun m!403983 () Bool)

(assert (=> b!414498 m!403983))

(declare-fun m!403985 () Bool)

(assert (=> bm!28713 m!403985))

(declare-fun m!403987 () Bool)

(assert (=> b!414503 m!403987))

(declare-fun m!403989 () Bool)

(assert (=> b!414503 m!403989))

(declare-fun m!403991 () Bool)

(assert (=> b!414503 m!403991))

(declare-fun m!403993 () Bool)

(assert (=> b!414495 m!403993))

(declare-fun m!403995 () Bool)

(assert (=> b!414495 m!403995))

(declare-fun m!403997 () Bool)

(assert (=> b!414495 m!403997))

(declare-fun m!403999 () Bool)

(assert (=> b!414495 m!403999))

(assert (=> b!414495 m!403997))

(assert (=> b!414495 m!403999))

(declare-fun m!404001 () Bool)

(assert (=> b!414495 m!404001))

(declare-fun m!404003 () Bool)

(assert (=> b!414495 m!404003))

(assert (=> b!414495 m!403993))

(declare-fun m!404005 () Bool)

(assert (=> b!414490 m!404005))

(assert (=> b!414490 m!404005))

(declare-fun m!404007 () Bool)

(assert (=> b!414490 m!404007))

(declare-fun m!404009 () Bool)

(assert (=> b!414490 m!404009))

(declare-fun m!404011 () Bool)

(assert (=> mapNonEmpty!17625 m!404011))

(declare-fun m!404013 () Bool)

(assert (=> b!414493 m!404013))

(declare-fun m!404015 () Bool)

(assert (=> b!414505 m!404015))

(declare-fun m!404017 () Bool)

(assert (=> bm!28714 m!404017))

(declare-fun m!404019 () Bool)

(assert (=> b!414500 m!404019))

(declare-fun m!404021 () Bool)

(assert (=> start!39236 m!404021))

(declare-fun m!404023 () Bool)

(assert (=> start!39236 m!404023))

(declare-fun m!404025 () Bool)

(assert (=> b!414499 m!404025))

(declare-fun m!404027 () Bool)

(assert (=> b!414508 m!404027))

(declare-fun m!404029 () Bool)

(assert (=> b!414506 m!404029))

(declare-fun m!404031 () Bool)

(assert (=> b!414506 m!404031))

(declare-fun m!404033 () Bool)

(assert (=> b!414504 m!404033))

(declare-fun m!404035 () Bool)

(assert (=> b!414497 m!404035))

(check-sat (not bm!28713) (not b_lambda!8843) (not b_next!9517) (not start!39236) (not b!414500) b_and!16925 (not bm!28714) (not b!414499) (not b!414506) (not b!414508) (not mapNonEmpty!17625) (not b!414498) tp_is_empty!10669 (not b!414503) (not b!414495) (not b!414490) (not b!414497) (not b!414504) (not b!414493))
(check-sat b_and!16925 (not b_next!9517))
