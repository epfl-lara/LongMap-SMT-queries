; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38552 () Bool)

(assert start!38552)

(declare-fun b_free!9103 () Bool)

(declare-fun b_next!9103 () Bool)

(assert (=> start!38552 (= b_free!9103 (not b_next!9103))))

(declare-fun tp!32433 () Bool)

(declare-fun b_and!16463 () Bool)

(assert (=> start!38552 (= tp!32433 b_and!16463)))

(declare-fun b!398814 () Bool)

(declare-fun e!240909 () Bool)

(declare-datatypes ((V!14419 0))(
  ( (V!14420 (val!5037 Int)) )
))
(declare-datatypes ((tuple2!6638 0))(
  ( (tuple2!6639 (_1!3330 (_ BitVec 64)) (_2!3330 V!14419)) )
))
(declare-datatypes ((List!6549 0))(
  ( (Nil!6546) (Cons!6545 (h!7401 tuple2!6638) (t!11714 List!6549)) )
))
(declare-datatypes ((ListLongMap!5541 0))(
  ( (ListLongMap!5542 (toList!2786 List!6549)) )
))
(declare-fun call!27949 () ListLongMap!5541)

(declare-fun call!27948 () ListLongMap!5541)

(assert (=> b!398814 (= e!240909 (= call!27949 call!27948))))

(declare-fun b!398815 () Bool)

(declare-fun res!229297 () Bool)

(declare-fun e!240911 () Bool)

(assert (=> b!398815 (=> (not res!229297) (not e!240911))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398815 (= res!229297 (validMask!0 mask!1025))))

(declare-fun b!398816 () Bool)

(declare-fun res!229308 () Bool)

(assert (=> b!398816 (=> (not res!229308) (not e!240911))))

(declare-datatypes ((array!23859 0))(
  ( (array!23860 (arr!11379 (Array (_ BitVec 32) (_ BitVec 64))) (size!11732 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23859)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398816 (= res!229308 (or (= (select (arr!11379 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11379 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398817 () Bool)

(declare-fun res!229306 () Bool)

(assert (=> b!398817 (=> (not res!229306) (not e!240911))))

(declare-datatypes ((List!6550 0))(
  ( (Nil!6547) (Cons!6546 (h!7402 (_ BitVec 64)) (t!11715 List!6550)) )
))
(declare-fun arrayNoDuplicates!0 (array!23859 (_ BitVec 32) List!6550) Bool)

(assert (=> b!398817 (= res!229306 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6547))))

(declare-fun mapIsEmpty!16599 () Bool)

(declare-fun mapRes!16599 () Bool)

(assert (=> mapIsEmpty!16599 mapRes!16599))

(declare-fun b!398818 () Bool)

(declare-fun res!229304 () Bool)

(declare-fun e!240912 () Bool)

(assert (=> b!398818 (=> (not res!229304) (not e!240912))))

(declare-fun lt!187301 () array!23859)

(assert (=> b!398818 (= res!229304 (arrayNoDuplicates!0 lt!187301 #b00000000000000000000000000000000 Nil!6547))))

(declare-fun minValue!515 () V!14419)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4649 0))(
  ( (ValueCellFull!4649 (v!7278 V!14419)) (EmptyCell!4649) )
))
(declare-datatypes ((array!23861 0))(
  ( (array!23862 (arr!11380 (Array (_ BitVec 32) ValueCell!4649)) (size!11733 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23861)

(declare-fun bm!27945 () Bool)

(declare-fun v!412 () V!14419)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun c!54540 () Bool)

(declare-fun zeroValue!515 () V!14419)

(declare-fun getCurrentListMapNoExtraKeys!1007 (array!23859 array!23861 (_ BitVec 32) (_ BitVec 32) V!14419 V!14419 (_ BitVec 32) Int) ListLongMap!5541)

(assert (=> bm!27945 (= call!27949 (getCurrentListMapNoExtraKeys!1007 (ite c!54540 _keys!709 lt!187301) (ite c!54540 _values!549 (array!23862 (store (arr!11380 _values!549) i!563 (ValueCellFull!4649 v!412)) (size!11733 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398819 () Bool)

(declare-fun e!240910 () Bool)

(declare-fun tp_is_empty!9985 () Bool)

(assert (=> b!398819 (= e!240910 tp_is_empty!9985)))

(declare-fun bm!27946 () Bool)

(assert (=> bm!27946 (= call!27948 (getCurrentListMapNoExtraKeys!1007 (ite c!54540 lt!187301 _keys!709) (ite c!54540 (array!23862 (store (arr!11380 _values!549) i!563 (ValueCellFull!4649 v!412)) (size!11733 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16599 () Bool)

(declare-fun tp!32432 () Bool)

(assert (=> mapNonEmpty!16599 (= mapRes!16599 (and tp!32432 e!240910))))

(declare-fun mapKey!16599 () (_ BitVec 32))

(declare-fun mapRest!16599 () (Array (_ BitVec 32) ValueCell!4649))

(declare-fun mapValue!16599 () ValueCell!4649)

(assert (=> mapNonEmpty!16599 (= (arr!11380 _values!549) (store mapRest!16599 mapKey!16599 mapValue!16599))))

(declare-fun b!398820 () Bool)

(assert (=> b!398820 (= e!240912 (not true))))

(assert (=> b!398820 e!240909))

(assert (=> b!398820 (= c!54540 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12066 0))(
  ( (Unit!12067) )
))
(declare-fun lt!187300 () Unit!12066)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!296 (array!23859 array!23861 (_ BitVec 32) (_ BitVec 32) V!14419 V!14419 (_ BitVec 32) (_ BitVec 64) V!14419 (_ BitVec 32) Int) Unit!12066)

(assert (=> b!398820 (= lt!187300 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!296 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398821 () Bool)

(declare-fun res!229300 () Bool)

(assert (=> b!398821 (=> (not res!229300) (not e!240911))))

(assert (=> b!398821 (= res!229300 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11732 _keys!709))))))

(declare-fun b!398822 () Bool)

(declare-fun res!229298 () Bool)

(assert (=> b!398822 (=> (not res!229298) (not e!240911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23859 (_ BitVec 32)) Bool)

(assert (=> b!398822 (= res!229298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!398823 () Bool)

(declare-fun res!229305 () Bool)

(assert (=> b!398823 (=> (not res!229305) (not e!240911))))

(declare-fun arrayContainsKey!0 (array!23859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398823 (= res!229305 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!398824 () Bool)

(declare-fun res!229299 () Bool)

(assert (=> b!398824 (=> (not res!229299) (not e!240912))))

(assert (=> b!398824 (= res!229299 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11732 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!398825 () Bool)

(declare-fun res!229303 () Bool)

(assert (=> b!398825 (=> (not res!229303) (not e!240911))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398825 (= res!229303 (validKeyInArray!0 k0!794))))

(declare-fun b!398826 () Bool)

(declare-fun +!1103 (ListLongMap!5541 tuple2!6638) ListLongMap!5541)

(assert (=> b!398826 (= e!240909 (= call!27948 (+!1103 call!27949 (tuple2!6639 k0!794 v!412))))))

(declare-fun res!229307 () Bool)

(assert (=> start!38552 (=> (not res!229307) (not e!240911))))

(assert (=> start!38552 (= res!229307 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11732 _keys!709))))))

(assert (=> start!38552 e!240911))

(assert (=> start!38552 tp_is_empty!9985))

(assert (=> start!38552 tp!32433))

(assert (=> start!38552 true))

(declare-fun e!240915 () Bool)

(declare-fun array_inv!8354 (array!23861) Bool)

(assert (=> start!38552 (and (array_inv!8354 _values!549) e!240915)))

(declare-fun array_inv!8355 (array!23859) Bool)

(assert (=> start!38552 (array_inv!8355 _keys!709)))

(declare-fun b!398827 () Bool)

(assert (=> b!398827 (= e!240911 e!240912)))

(declare-fun res!229301 () Bool)

(assert (=> b!398827 (=> (not res!229301) (not e!240912))))

(assert (=> b!398827 (= res!229301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187301 mask!1025))))

(assert (=> b!398827 (= lt!187301 (array!23860 (store (arr!11379 _keys!709) i!563 k0!794) (size!11732 _keys!709)))))

(declare-fun b!398828 () Bool)

(declare-fun e!240913 () Bool)

(assert (=> b!398828 (= e!240913 tp_is_empty!9985)))

(declare-fun b!398829 () Bool)

(assert (=> b!398829 (= e!240915 (and e!240913 mapRes!16599))))

(declare-fun condMapEmpty!16599 () Bool)

(declare-fun mapDefault!16599 () ValueCell!4649)

(assert (=> b!398829 (= condMapEmpty!16599 (= (arr!11380 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4649)) mapDefault!16599)))))

(declare-fun b!398830 () Bool)

(declare-fun res!229302 () Bool)

(assert (=> b!398830 (=> (not res!229302) (not e!240911))))

(assert (=> b!398830 (= res!229302 (and (= (size!11733 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11732 _keys!709) (size!11733 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!38552 res!229307) b!398815))

(assert (= (and b!398815 res!229297) b!398830))

(assert (= (and b!398830 res!229302) b!398822))

(assert (= (and b!398822 res!229298) b!398817))

(assert (= (and b!398817 res!229306) b!398821))

(assert (= (and b!398821 res!229300) b!398825))

(assert (= (and b!398825 res!229303) b!398816))

(assert (= (and b!398816 res!229308) b!398823))

(assert (= (and b!398823 res!229305) b!398827))

(assert (= (and b!398827 res!229301) b!398818))

(assert (= (and b!398818 res!229304) b!398824))

(assert (= (and b!398824 res!229299) b!398820))

(assert (= (and b!398820 c!54540) b!398826))

(assert (= (and b!398820 (not c!54540)) b!398814))

(assert (= (or b!398826 b!398814) bm!27946))

(assert (= (or b!398826 b!398814) bm!27945))

(assert (= (and b!398829 condMapEmpty!16599) mapIsEmpty!16599))

(assert (= (and b!398829 (not condMapEmpty!16599)) mapNonEmpty!16599))

(get-info :version)

(assert (= (and mapNonEmpty!16599 ((_ is ValueCellFull!4649) mapValue!16599)) b!398819))

(assert (= (and b!398829 ((_ is ValueCellFull!4649) mapDefault!16599)) b!398828))

(assert (= start!38552 b!398829))

(declare-fun m!393003 () Bool)

(assert (=> start!38552 m!393003))

(declare-fun m!393005 () Bool)

(assert (=> start!38552 m!393005))

(declare-fun m!393007 () Bool)

(assert (=> bm!27945 m!393007))

(declare-fun m!393009 () Bool)

(assert (=> bm!27945 m!393009))

(declare-fun m!393011 () Bool)

(assert (=> b!398818 m!393011))

(declare-fun m!393013 () Bool)

(assert (=> b!398827 m!393013))

(declare-fun m!393015 () Bool)

(assert (=> b!398827 m!393015))

(declare-fun m!393017 () Bool)

(assert (=> b!398815 m!393017))

(declare-fun m!393019 () Bool)

(assert (=> b!398825 m!393019))

(declare-fun m!393021 () Bool)

(assert (=> b!398822 m!393021))

(declare-fun m!393023 () Bool)

(assert (=> b!398816 m!393023))

(declare-fun m!393025 () Bool)

(assert (=> b!398823 m!393025))

(declare-fun m!393027 () Bool)

(assert (=> mapNonEmpty!16599 m!393027))

(assert (=> bm!27946 m!393007))

(declare-fun m!393029 () Bool)

(assert (=> bm!27946 m!393029))

(declare-fun m!393031 () Bool)

(assert (=> b!398820 m!393031))

(declare-fun m!393033 () Bool)

(assert (=> b!398826 m!393033))

(declare-fun m!393035 () Bool)

(assert (=> b!398817 m!393035))

(check-sat (not b!398823) (not b!398820) (not b!398825) (not start!38552) (not mapNonEmpty!16599) (not b!398822) tp_is_empty!9985 (not b!398827) (not bm!27946) (not b_next!9103) (not b!398818) (not b!398815) (not b!398817) b_and!16463 (not b!398826) (not bm!27945))
(check-sat b_and!16463 (not b_next!9103))
