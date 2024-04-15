; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38648 () Bool)

(assert start!38648)

(declare-fun b_free!9199 () Bool)

(declare-fun b_next!9199 () Bool)

(assert (=> start!38648 (= b_free!9199 (not b_next!9199))))

(declare-fun tp!32720 () Bool)

(declare-fun b_and!16559 () Bool)

(assert (=> start!38648 (= tp!32720 b_and!16559)))

(declare-fun b!401262 () Bool)

(declare-fun res!231028 () Bool)

(declare-fun e!241920 () Bool)

(assert (=> b!401262 (=> (not res!231028) (not e!241920))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24047 0))(
  ( (array!24048 (arr!11473 (Array (_ BitVec 32) (_ BitVec 64))) (size!11826 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24047)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!401262 (= res!231028 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11826 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun res!231032 () Bool)

(declare-fun e!241918 () Bool)

(assert (=> start!38648 (=> (not res!231032) (not e!241918))))

(assert (=> start!38648 (= res!231032 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11826 _keys!709))))))

(assert (=> start!38648 e!241918))

(declare-fun tp_is_empty!10081 () Bool)

(assert (=> start!38648 tp_is_empty!10081))

(assert (=> start!38648 tp!32720))

(assert (=> start!38648 true))

(declare-datatypes ((V!14547 0))(
  ( (V!14548 (val!5085 Int)) )
))
(declare-datatypes ((ValueCell!4697 0))(
  ( (ValueCellFull!4697 (v!7326 V!14547)) (EmptyCell!4697) )
))
(declare-datatypes ((array!24049 0))(
  ( (array!24050 (arr!11474 (Array (_ BitVec 32) ValueCell!4697)) (size!11827 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24049)

(declare-fun e!241917 () Bool)

(declare-fun array_inv!8416 (array!24049) Bool)

(assert (=> start!38648 (and (array_inv!8416 _values!549) e!241917)))

(declare-fun array_inv!8417 (array!24047) Bool)

(assert (=> start!38648 (array_inv!8417 _keys!709)))

(declare-fun b!401263 () Bool)

(declare-fun res!231030 () Bool)

(assert (=> b!401263 (=> (not res!231030) (not e!241918))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!401263 (= res!231030 (and (= (size!11827 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11826 _keys!709) (size!11827 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!28233 () Bool)

(declare-fun minValue!515 () V!14547)

(declare-fun defaultEntry!557 () Int)

(declare-fun c!54684 () Bool)

(declare-fun zeroValue!515 () V!14547)

(declare-fun lt!187588 () array!24047)

(declare-datatypes ((tuple2!6728 0))(
  ( (tuple2!6729 (_1!3375 (_ BitVec 64)) (_2!3375 V!14547)) )
))
(declare-datatypes ((List!6634 0))(
  ( (Nil!6631) (Cons!6630 (h!7486 tuple2!6728) (t!11799 List!6634)) )
))
(declare-datatypes ((ListLongMap!5631 0))(
  ( (ListLongMap!5632 (toList!2831 List!6634)) )
))
(declare-fun call!28236 () ListLongMap!5631)

(declare-fun v!412 () V!14547)

(declare-fun getCurrentListMapNoExtraKeys!1049 (array!24047 array!24049 (_ BitVec 32) (_ BitVec 32) V!14547 V!14547 (_ BitVec 32) Int) ListLongMap!5631)

(assert (=> bm!28233 (= call!28236 (getCurrentListMapNoExtraKeys!1049 (ite c!54684 _keys!709 lt!187588) (ite c!54684 _values!549 (array!24050 (store (arr!11474 _values!549) i!563 (ValueCellFull!4697 v!412)) (size!11827 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401264 () Bool)

(assert (=> b!401264 (= e!241918 e!241920)))

(declare-fun res!231031 () Bool)

(assert (=> b!401264 (=> (not res!231031) (not e!241920))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24047 (_ BitVec 32)) Bool)

(assert (=> b!401264 (= res!231031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187588 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!401264 (= lt!187588 (array!24048 (store (arr!11473 _keys!709) i!563 k0!794) (size!11826 _keys!709)))))

(declare-fun b!401265 () Bool)

(declare-fun e!241922 () Bool)

(assert (=> b!401265 (= e!241922 tp_is_empty!10081)))

(declare-fun b!401266 () Bool)

(declare-fun res!231033 () Bool)

(assert (=> b!401266 (=> (not res!231033) (not e!241920))))

(declare-datatypes ((List!6635 0))(
  ( (Nil!6632) (Cons!6631 (h!7487 (_ BitVec 64)) (t!11800 List!6635)) )
))
(declare-fun arrayNoDuplicates!0 (array!24047 (_ BitVec 32) List!6635) Bool)

(assert (=> b!401266 (= res!231033 (arrayNoDuplicates!0 lt!187588 #b00000000000000000000000000000000 Nil!6632))))

(declare-fun b!401267 () Bool)

(declare-fun res!231026 () Bool)

(assert (=> b!401267 (=> (not res!231026) (not e!241918))))

(assert (=> b!401267 (= res!231026 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6632))))

(declare-fun b!401268 () Bool)

(declare-fun res!231027 () Bool)

(assert (=> b!401268 (=> (not res!231027) (not e!241918))))

(assert (=> b!401268 (= res!231027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!401269 () Bool)

(declare-fun e!241923 () Bool)

(declare-fun mapRes!16743 () Bool)

(assert (=> b!401269 (= e!241917 (and e!241923 mapRes!16743))))

(declare-fun condMapEmpty!16743 () Bool)

(declare-fun mapDefault!16743 () ValueCell!4697)

(assert (=> b!401269 (= condMapEmpty!16743 (= (arr!11474 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4697)) mapDefault!16743)))))

(declare-fun b!401270 () Bool)

(assert (=> b!401270 (= e!241923 tp_is_empty!10081)))

(declare-fun b!401271 () Bool)

(declare-fun res!231035 () Bool)

(assert (=> b!401271 (=> (not res!231035) (not e!241918))))

(assert (=> b!401271 (= res!231035 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11826 _keys!709))))))

(declare-fun mapIsEmpty!16743 () Bool)

(assert (=> mapIsEmpty!16743 mapRes!16743))

(declare-fun b!401272 () Bool)

(declare-fun res!231034 () Bool)

(assert (=> b!401272 (=> (not res!231034) (not e!241918))))

(assert (=> b!401272 (= res!231034 (or (= (select (arr!11473 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11473 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!401273 () Bool)

(declare-fun res!231036 () Bool)

(assert (=> b!401273 (=> (not res!231036) (not e!241918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401273 (= res!231036 (validMask!0 mask!1025))))

(declare-fun b!401274 () Bool)

(assert (=> b!401274 (= e!241920 (not true))))

(declare-fun e!241921 () Bool)

(assert (=> b!401274 e!241921))

(assert (=> b!401274 (= c!54684 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12130 0))(
  ( (Unit!12131) )
))
(declare-fun lt!187589 () Unit!12130)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!328 (array!24047 array!24049 (_ BitVec 32) (_ BitVec 32) V!14547 V!14547 (_ BitVec 32) (_ BitVec 64) V!14547 (_ BitVec 32) Int) Unit!12130)

(assert (=> b!401274 (= lt!187589 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!328 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!28237 () ListLongMap!5631)

(declare-fun bm!28234 () Bool)

(assert (=> bm!28234 (= call!28237 (getCurrentListMapNoExtraKeys!1049 (ite c!54684 lt!187588 _keys!709) (ite c!54684 (array!24050 (store (arr!11474 _values!549) i!563 (ValueCellFull!4697 v!412)) (size!11827 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401275 () Bool)

(declare-fun res!231025 () Bool)

(assert (=> b!401275 (=> (not res!231025) (not e!241918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401275 (= res!231025 (validKeyInArray!0 k0!794))))

(declare-fun b!401276 () Bool)

(declare-fun +!1136 (ListLongMap!5631 tuple2!6728) ListLongMap!5631)

(assert (=> b!401276 (= e!241921 (= call!28237 (+!1136 call!28236 (tuple2!6729 k0!794 v!412))))))

(declare-fun b!401277 () Bool)

(assert (=> b!401277 (= e!241921 (= call!28236 call!28237))))

(declare-fun mapNonEmpty!16743 () Bool)

(declare-fun tp!32721 () Bool)

(assert (=> mapNonEmpty!16743 (= mapRes!16743 (and tp!32721 e!241922))))

(declare-fun mapRest!16743 () (Array (_ BitVec 32) ValueCell!4697))

(declare-fun mapValue!16743 () ValueCell!4697)

(declare-fun mapKey!16743 () (_ BitVec 32))

(assert (=> mapNonEmpty!16743 (= (arr!11474 _values!549) (store mapRest!16743 mapKey!16743 mapValue!16743))))

(declare-fun b!401278 () Bool)

(declare-fun res!231029 () Bool)

(assert (=> b!401278 (=> (not res!231029) (not e!241918))))

(declare-fun arrayContainsKey!0 (array!24047 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401278 (= res!231029 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!38648 res!231032) b!401273))

(assert (= (and b!401273 res!231036) b!401263))

(assert (= (and b!401263 res!231030) b!401268))

(assert (= (and b!401268 res!231027) b!401267))

(assert (= (and b!401267 res!231026) b!401271))

(assert (= (and b!401271 res!231035) b!401275))

(assert (= (and b!401275 res!231025) b!401272))

(assert (= (and b!401272 res!231034) b!401278))

(assert (= (and b!401278 res!231029) b!401264))

(assert (= (and b!401264 res!231031) b!401266))

(assert (= (and b!401266 res!231033) b!401262))

(assert (= (and b!401262 res!231028) b!401274))

(assert (= (and b!401274 c!54684) b!401276))

(assert (= (and b!401274 (not c!54684)) b!401277))

(assert (= (or b!401276 b!401277) bm!28234))

(assert (= (or b!401276 b!401277) bm!28233))

(assert (= (and b!401269 condMapEmpty!16743) mapIsEmpty!16743))

(assert (= (and b!401269 (not condMapEmpty!16743)) mapNonEmpty!16743))

(get-info :version)

(assert (= (and mapNonEmpty!16743 ((_ is ValueCellFull!4697) mapValue!16743)) b!401265))

(assert (= (and b!401269 ((_ is ValueCellFull!4697) mapDefault!16743)) b!401270))

(assert (= start!38648 b!401269))

(declare-fun m!394635 () Bool)

(assert (=> b!401273 m!394635))

(declare-fun m!394637 () Bool)

(assert (=> b!401272 m!394637))

(declare-fun m!394639 () Bool)

(assert (=> b!401267 m!394639))

(declare-fun m!394641 () Bool)

(assert (=> b!401266 m!394641))

(declare-fun m!394643 () Bool)

(assert (=> b!401264 m!394643))

(declare-fun m!394645 () Bool)

(assert (=> b!401264 m!394645))

(declare-fun m!394647 () Bool)

(assert (=> b!401275 m!394647))

(declare-fun m!394649 () Bool)

(assert (=> mapNonEmpty!16743 m!394649))

(declare-fun m!394651 () Bool)

(assert (=> start!38648 m!394651))

(declare-fun m!394653 () Bool)

(assert (=> start!38648 m!394653))

(declare-fun m!394655 () Bool)

(assert (=> bm!28233 m!394655))

(declare-fun m!394657 () Bool)

(assert (=> bm!28233 m!394657))

(declare-fun m!394659 () Bool)

(assert (=> b!401274 m!394659))

(declare-fun m!394661 () Bool)

(assert (=> b!401276 m!394661))

(declare-fun m!394663 () Bool)

(assert (=> b!401278 m!394663))

(declare-fun m!394665 () Bool)

(assert (=> b!401268 m!394665))

(assert (=> bm!28234 m!394655))

(declare-fun m!394667 () Bool)

(assert (=> bm!28234 m!394667))

(check-sat (not b!401275) (not b!401273) (not b!401268) (not b!401276) (not bm!28233) (not bm!28234) (not b!401278) tp_is_empty!10081 (not b_next!9199) (not b!401266) (not start!38648) (not mapNonEmpty!16743) (not b!401264) (not b!401267) b_and!16559 (not b!401274))
(check-sat b_and!16559 (not b_next!9199))
