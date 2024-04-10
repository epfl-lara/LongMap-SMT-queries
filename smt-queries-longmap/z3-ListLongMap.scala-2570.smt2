; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39240 () Bool)

(assert start!39240)

(declare-fun b_free!9507 () Bool)

(declare-fun b_next!9507 () Bool)

(assert (=> start!39240 (= b_free!9507 (not b_next!9507))))

(declare-fun tp!34050 () Bool)

(declare-fun b_and!16893 () Bool)

(assert (=> start!39240 (= tp!34050 b_and!16893)))

(declare-fun b!414248 () Bool)

(declare-fun res!240833 () Bool)

(declare-fun e!247595 () Bool)

(assert (=> b!414248 (=> (not res!240833) (not e!247595))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414248 (= res!240833 (validMask!0 mask!1025))))

(declare-fun b!414249 () Bool)

(declare-fun res!240843 () Bool)

(assert (=> b!414249 (=> (not res!240843) (not e!247595))))

(declare-datatypes ((array!25175 0))(
  ( (array!25176 (arr!12037 (Array (_ BitVec 32) (_ BitVec 64))) (size!12389 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25175)

(declare-datatypes ((List!7011 0))(
  ( (Nil!7008) (Cons!7007 (h!7863 (_ BitVec 64)) (t!12185 List!7011)) )
))
(declare-fun arrayNoDuplicates!0 (array!25175 (_ BitVec 32) List!7011) Bool)

(assert (=> b!414249 (= res!240843 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7008))))

(declare-fun b!414250 () Bool)

(declare-fun res!240832 () Bool)

(assert (=> b!414250 (=> (not res!240832) (not e!247595))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15317 0))(
  ( (V!15318 (val!5374 Int)) )
))
(declare-datatypes ((ValueCell!4986 0))(
  ( (ValueCellFull!4986 (v!7621 V!15317)) (EmptyCell!4986) )
))
(declare-datatypes ((array!25177 0))(
  ( (array!25178 (arr!12038 (Array (_ BitVec 32) ValueCell!4986)) (size!12390 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25177)

(assert (=> b!414250 (= res!240832 (and (= (size!12390 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12389 _keys!709) (size!12390 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414251 () Bool)

(declare-fun res!240837 () Bool)

(declare-fun e!247594 () Bool)

(assert (=> b!414251 (=> (not res!240837) (not e!247594))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414251 (= res!240837 (bvsle from!863 i!563))))

(declare-fun b!414252 () Bool)

(declare-fun res!240840 () Bool)

(assert (=> b!414252 (=> (not res!240840) (not e!247595))))

(assert (=> b!414252 (= res!240840 (or (= (select (arr!12037 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12037 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17610 () Bool)

(declare-fun mapRes!17610 () Bool)

(declare-fun tp!34049 () Bool)

(declare-fun e!247598 () Bool)

(assert (=> mapNonEmpty!17610 (= mapRes!17610 (and tp!34049 e!247598))))

(declare-fun mapValue!17610 () ValueCell!4986)

(declare-fun mapRest!17610 () (Array (_ BitVec 32) ValueCell!4986))

(declare-fun mapKey!17610 () (_ BitVec 32))

(assert (=> mapNonEmpty!17610 (= (arr!12038 _values!549) (store mapRest!17610 mapKey!17610 mapValue!17610))))

(declare-fun b!414253 () Bool)

(assert (=> b!414253 (= e!247595 e!247594)))

(declare-fun res!240841 () Bool)

(assert (=> b!414253 (=> (not res!240841) (not e!247594))))

(declare-fun lt!189953 () array!25175)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25175 (_ BitVec 32)) Bool)

(assert (=> b!414253 (= res!240841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189953 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!414253 (= lt!189953 (array!25176 (store (arr!12037 _keys!709) i!563 k0!794) (size!12389 _keys!709)))))

(declare-fun b!414254 () Bool)

(declare-fun e!247597 () Bool)

(declare-fun e!247599 () Bool)

(assert (=> b!414254 (= e!247597 (not e!247599))))

(declare-fun res!240834 () Bool)

(assert (=> b!414254 (=> res!240834 e!247599)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414254 (= res!240834 (validKeyInArray!0 (select (arr!12037 _keys!709) from!863)))))

(declare-fun e!247600 () Bool)

(assert (=> b!414254 e!247600))

(declare-fun c!54974 () Bool)

(assert (=> b!414254 (= c!54974 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15317)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((Unit!12252 0))(
  ( (Unit!12253) )
))
(declare-fun lt!189950 () Unit!12252)

(declare-fun zeroValue!515 () V!15317)

(declare-fun v!412 () V!15317)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!384 (array!25175 array!25177 (_ BitVec 32) (_ BitVec 32) V!15317 V!15317 (_ BitVec 32) (_ BitVec 64) V!15317 (_ BitVec 32) Int) Unit!12252)

(assert (=> b!414254 (= lt!189950 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!384 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414255 () Bool)

(declare-fun e!247602 () Bool)

(declare-fun tp_is_empty!10659 () Bool)

(assert (=> b!414255 (= e!247602 tp_is_empty!10659)))

(declare-fun b!414256 () Bool)

(declare-fun res!240831 () Bool)

(assert (=> b!414256 (=> (not res!240831) (not e!247595))))

(assert (=> b!414256 (= res!240831 (validKeyInArray!0 k0!794))))

(declare-fun b!414257 () Bool)

(assert (=> b!414257 (= e!247598 tp_is_empty!10659)))

(declare-fun b!414258 () Bool)

(declare-datatypes ((tuple2!6988 0))(
  ( (tuple2!6989 (_1!3505 (_ BitVec 64)) (_2!3505 V!15317)) )
))
(declare-datatypes ((List!7012 0))(
  ( (Nil!7009) (Cons!7008 (h!7864 tuple2!6988) (t!12186 List!7012)) )
))
(declare-datatypes ((ListLongMap!5901 0))(
  ( (ListLongMap!5902 (toList!2966 List!7012)) )
))
(declare-fun call!28699 () ListLongMap!5901)

(declare-fun call!28700 () ListLongMap!5901)

(assert (=> b!414258 (= e!247600 (= call!28699 call!28700))))

(declare-fun b!414259 () Bool)

(declare-fun e!247601 () Bool)

(assert (=> b!414259 (= e!247601 (and e!247602 mapRes!17610))))

(declare-fun condMapEmpty!17610 () Bool)

(declare-fun mapDefault!17610 () ValueCell!4986)

(assert (=> b!414259 (= condMapEmpty!17610 (= (arr!12038 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4986)) mapDefault!17610)))))

(declare-fun b!414260 () Bool)

(assert (=> b!414260 (= e!247599 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!12389 _keys!709))))))

(declare-fun lt!189951 () array!25177)

(declare-fun bm!28697 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1172 (array!25175 array!25177 (_ BitVec 32) (_ BitVec 32) V!15317 V!15317 (_ BitVec 32) Int) ListLongMap!5901)

(assert (=> bm!28697 (= call!28699 (getCurrentListMapNoExtraKeys!1172 (ite c!54974 _keys!709 lt!189953) (ite c!54974 _values!549 lt!189951) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414261 () Bool)

(declare-fun +!1173 (ListLongMap!5901 tuple2!6988) ListLongMap!5901)

(assert (=> b!414261 (= e!247600 (= call!28700 (+!1173 call!28699 (tuple2!6989 k0!794 v!412))))))

(declare-fun b!414262 () Bool)

(declare-fun res!240839 () Bool)

(assert (=> b!414262 (=> (not res!240839) (not e!247594))))

(assert (=> b!414262 (= res!240839 (arrayNoDuplicates!0 lt!189953 #b00000000000000000000000000000000 Nil!7008))))

(declare-fun b!414263 () Bool)

(declare-fun res!240835 () Bool)

(assert (=> b!414263 (=> (not res!240835) (not e!247595))))

(declare-fun arrayContainsKey!0 (array!25175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414263 (= res!240835 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17610 () Bool)

(assert (=> mapIsEmpty!17610 mapRes!17610))

(declare-fun b!414264 () Bool)

(declare-fun res!240838 () Bool)

(assert (=> b!414264 (=> (not res!240838) (not e!247595))))

(assert (=> b!414264 (= res!240838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!414265 () Bool)

(declare-fun res!240842 () Bool)

(assert (=> b!414265 (=> (not res!240842) (not e!247595))))

(assert (=> b!414265 (= res!240842 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12389 _keys!709))))))

(declare-fun b!414266 () Bool)

(assert (=> b!414266 (= e!247594 e!247597)))

(declare-fun res!240836 () Bool)

(assert (=> b!414266 (=> (not res!240836) (not e!247597))))

(assert (=> b!414266 (= res!240836 (= from!863 i!563))))

(declare-fun lt!189949 () ListLongMap!5901)

(assert (=> b!414266 (= lt!189949 (getCurrentListMapNoExtraKeys!1172 lt!189953 lt!189951 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!414266 (= lt!189951 (array!25178 (store (arr!12038 _values!549) i!563 (ValueCellFull!4986 v!412)) (size!12390 _values!549)))))

(declare-fun lt!189952 () ListLongMap!5901)

(assert (=> b!414266 (= lt!189952 (getCurrentListMapNoExtraKeys!1172 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun bm!28696 () Bool)

(assert (=> bm!28696 (= call!28700 (getCurrentListMapNoExtraKeys!1172 (ite c!54974 lt!189953 _keys!709) (ite c!54974 lt!189951 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!240830 () Bool)

(assert (=> start!39240 (=> (not res!240830) (not e!247595))))

(assert (=> start!39240 (= res!240830 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12389 _keys!709))))))

(assert (=> start!39240 e!247595))

(assert (=> start!39240 tp_is_empty!10659))

(assert (=> start!39240 tp!34050))

(assert (=> start!39240 true))

(declare-fun array_inv!8778 (array!25177) Bool)

(assert (=> start!39240 (and (array_inv!8778 _values!549) e!247601)))

(declare-fun array_inv!8779 (array!25175) Bool)

(assert (=> start!39240 (array_inv!8779 _keys!709)))

(assert (= (and start!39240 res!240830) b!414248))

(assert (= (and b!414248 res!240833) b!414250))

(assert (= (and b!414250 res!240832) b!414264))

(assert (= (and b!414264 res!240838) b!414249))

(assert (= (and b!414249 res!240843) b!414265))

(assert (= (and b!414265 res!240842) b!414256))

(assert (= (and b!414256 res!240831) b!414252))

(assert (= (and b!414252 res!240840) b!414263))

(assert (= (and b!414263 res!240835) b!414253))

(assert (= (and b!414253 res!240841) b!414262))

(assert (= (and b!414262 res!240839) b!414251))

(assert (= (and b!414251 res!240837) b!414266))

(assert (= (and b!414266 res!240836) b!414254))

(assert (= (and b!414254 c!54974) b!414261))

(assert (= (and b!414254 (not c!54974)) b!414258))

(assert (= (or b!414261 b!414258) bm!28696))

(assert (= (or b!414261 b!414258) bm!28697))

(assert (= (and b!414254 (not res!240834)) b!414260))

(assert (= (and b!414259 condMapEmpty!17610) mapIsEmpty!17610))

(assert (= (and b!414259 (not condMapEmpty!17610)) mapNonEmpty!17610))

(get-info :version)

(assert (= (and mapNonEmpty!17610 ((_ is ValueCellFull!4986) mapValue!17610)) b!414257))

(assert (= (and b!414259 ((_ is ValueCellFull!4986) mapDefault!17610)) b!414255))

(assert (= start!39240 b!414259))

(declare-fun m!403507 () Bool)

(assert (=> b!414256 m!403507))

(declare-fun m!403509 () Bool)

(assert (=> bm!28697 m!403509))

(declare-fun m!403511 () Bool)

(assert (=> b!414253 m!403511))

(declare-fun m!403513 () Bool)

(assert (=> b!414253 m!403513))

(declare-fun m!403515 () Bool)

(assert (=> bm!28696 m!403515))

(declare-fun m!403517 () Bool)

(assert (=> b!414252 m!403517))

(declare-fun m!403519 () Bool)

(assert (=> b!414264 m!403519))

(declare-fun m!403521 () Bool)

(assert (=> mapNonEmpty!17610 m!403521))

(declare-fun m!403523 () Bool)

(assert (=> b!414262 m!403523))

(declare-fun m!403525 () Bool)

(assert (=> b!414249 m!403525))

(declare-fun m!403527 () Bool)

(assert (=> b!414254 m!403527))

(assert (=> b!414254 m!403527))

(declare-fun m!403529 () Bool)

(assert (=> b!414254 m!403529))

(declare-fun m!403531 () Bool)

(assert (=> b!414254 m!403531))

(declare-fun m!403533 () Bool)

(assert (=> b!414261 m!403533))

(declare-fun m!403535 () Bool)

(assert (=> start!39240 m!403535))

(declare-fun m!403537 () Bool)

(assert (=> start!39240 m!403537))

(declare-fun m!403539 () Bool)

(assert (=> b!414266 m!403539))

(declare-fun m!403541 () Bool)

(assert (=> b!414266 m!403541))

(declare-fun m!403543 () Bool)

(assert (=> b!414266 m!403543))

(declare-fun m!403545 () Bool)

(assert (=> b!414248 m!403545))

(declare-fun m!403547 () Bool)

(assert (=> b!414263 m!403547))

(check-sat (not b!414263) (not start!39240) (not b!414256) (not b!414254) b_and!16893 (not mapNonEmpty!17610) (not b!414249) (not b!414261) (not bm!28697) (not b_next!9507) (not b!414248) (not b!414264) tp_is_empty!10659 (not b!414262) (not b!414266) (not b!414253) (not bm!28696))
(check-sat b_and!16893 (not b_next!9507))
