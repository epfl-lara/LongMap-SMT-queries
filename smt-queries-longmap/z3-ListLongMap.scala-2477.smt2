; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38666 () Bool)

(assert start!38666)

(declare-fun b_free!9217 () Bool)

(declare-fun b_next!9217 () Bool)

(assert (=> start!38666 (= b_free!9217 (not b_next!9217))))

(declare-fun tp!32775 () Bool)

(declare-fun b_and!16617 () Bool)

(assert (=> start!38666 (= tp!32775 b_and!16617)))

(declare-fun res!231480 () Bool)

(declare-fun e!242249 () Bool)

(assert (=> start!38666 (=> (not res!231480) (not e!242249))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!24082 0))(
  ( (array!24083 (arr!11490 (Array (_ BitVec 32) (_ BitVec 64))) (size!11842 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24082)

(assert (=> start!38666 (= res!231480 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11842 _keys!709))))))

(assert (=> start!38666 e!242249))

(declare-fun tp_is_empty!10099 () Bool)

(assert (=> start!38666 tp_is_empty!10099))

(assert (=> start!38666 tp!32775))

(assert (=> start!38666 true))

(declare-datatypes ((V!14571 0))(
  ( (V!14572 (val!5094 Int)) )
))
(declare-datatypes ((ValueCell!4706 0))(
  ( (ValueCellFull!4706 (v!7342 V!14571)) (EmptyCell!4706) )
))
(declare-datatypes ((array!24084 0))(
  ( (array!24085 (arr!11491 (Array (_ BitVec 32) ValueCell!4706)) (size!11843 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24084)

(declare-fun e!242251 () Bool)

(declare-fun array_inv!8488 (array!24084) Bool)

(assert (=> start!38666 (and (array_inv!8488 _values!549) e!242251)))

(declare-fun array_inv!8489 (array!24082) Bool)

(assert (=> start!38666 (array_inv!8489 _keys!709)))

(declare-fun b!401943 () Bool)

(declare-fun e!242253 () Bool)

(assert (=> b!401943 (= e!242253 (not true))))

(declare-fun e!242250 () Bool)

(assert (=> b!401943 e!242250))

(declare-fun c!54759 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!401943 (= c!54759 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14571)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12149 0))(
  ( (Unit!12150) )
))
(declare-fun lt!187895 () Unit!12149)

(declare-fun zeroValue!515 () V!14571)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!14571)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!342 (array!24082 array!24084 (_ BitVec 32) (_ BitVec 32) V!14571 V!14571 (_ BitVec 32) (_ BitVec 64) V!14571 (_ BitVec 32) Int) Unit!12149)

(assert (=> b!401943 (= lt!187895 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!342 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401944 () Bool)

(declare-fun res!231475 () Bool)

(assert (=> b!401944 (=> (not res!231475) (not e!242249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401944 (= res!231475 (validMask!0 mask!1025))))

(declare-fun b!401945 () Bool)

(declare-fun e!242248 () Bool)

(assert (=> b!401945 (= e!242248 tp_is_empty!10099)))

(declare-fun b!401946 () Bool)

(declare-fun e!242254 () Bool)

(declare-fun mapRes!16770 () Bool)

(assert (=> b!401946 (= e!242251 (and e!242254 mapRes!16770))))

(declare-fun condMapEmpty!16770 () Bool)

(declare-fun mapDefault!16770 () ValueCell!4706)

(assert (=> b!401946 (= condMapEmpty!16770 (= (arr!11491 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4706)) mapDefault!16770)))))

(declare-fun b!401947 () Bool)

(declare-fun res!231476 () Bool)

(assert (=> b!401947 (=> (not res!231476) (not e!242253))))

(assert (=> b!401947 (= res!231476 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11842 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun bm!28299 () Bool)

(declare-datatypes ((tuple2!6628 0))(
  ( (tuple2!6629 (_1!3325 (_ BitVec 64)) (_2!3325 V!14571)) )
))
(declare-datatypes ((List!6549 0))(
  ( (Nil!6546) (Cons!6545 (h!7401 tuple2!6628) (t!11715 List!6549)) )
))
(declare-datatypes ((ListLongMap!5543 0))(
  ( (ListLongMap!5544 (toList!2787 List!6549)) )
))
(declare-fun call!28303 () ListLongMap!5543)

(declare-fun lt!187896 () array!24082)

(declare-fun getCurrentListMapNoExtraKeys!1042 (array!24082 array!24084 (_ BitVec 32) (_ BitVec 32) V!14571 V!14571 (_ BitVec 32) Int) ListLongMap!5543)

(assert (=> bm!28299 (= call!28303 (getCurrentListMapNoExtraKeys!1042 (ite c!54759 _keys!709 lt!187896) (ite c!54759 _values!549 (array!24085 (store (arr!11491 _values!549) i!563 (ValueCellFull!4706 v!412)) (size!11843 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!28302 () ListLongMap!5543)

(declare-fun b!401948 () Bool)

(declare-fun +!1131 (ListLongMap!5543 tuple2!6628) ListLongMap!5543)

(assert (=> b!401948 (= e!242250 (= call!28302 (+!1131 call!28303 (tuple2!6629 k0!794 v!412))))))

(declare-fun mapNonEmpty!16770 () Bool)

(declare-fun tp!32774 () Bool)

(assert (=> mapNonEmpty!16770 (= mapRes!16770 (and tp!32774 e!242248))))

(declare-fun mapValue!16770 () ValueCell!4706)

(declare-fun mapRest!16770 () (Array (_ BitVec 32) ValueCell!4706))

(declare-fun mapKey!16770 () (_ BitVec 32))

(assert (=> mapNonEmpty!16770 (= (arr!11491 _values!549) (store mapRest!16770 mapKey!16770 mapValue!16770))))

(declare-fun b!401949 () Bool)

(declare-fun res!231484 () Bool)

(assert (=> b!401949 (=> (not res!231484) (not e!242249))))

(assert (=> b!401949 (= res!231484 (and (= (size!11843 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11842 _keys!709) (size!11843 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401950 () Bool)

(declare-fun res!231486 () Bool)

(assert (=> b!401950 (=> (not res!231486) (not e!242249))))

(assert (=> b!401950 (= res!231486 (or (= (select (arr!11490 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11490 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!401951 () Bool)

(declare-fun res!231479 () Bool)

(assert (=> b!401951 (=> (not res!231479) (not e!242249))))

(declare-datatypes ((List!6550 0))(
  ( (Nil!6547) (Cons!6546 (h!7402 (_ BitVec 64)) (t!11716 List!6550)) )
))
(declare-fun arrayNoDuplicates!0 (array!24082 (_ BitVec 32) List!6550) Bool)

(assert (=> b!401951 (= res!231479 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6547))))

(declare-fun b!401952 () Bool)

(declare-fun res!231482 () Bool)

(assert (=> b!401952 (=> (not res!231482) (not e!242249))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24082 (_ BitVec 32)) Bool)

(assert (=> b!401952 (= res!231482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!401953 () Bool)

(assert (=> b!401953 (= e!242250 (= call!28303 call!28302))))

(declare-fun b!401954 () Bool)

(declare-fun res!231477 () Bool)

(assert (=> b!401954 (=> (not res!231477) (not e!242249))))

(assert (=> b!401954 (= res!231477 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11842 _keys!709))))))

(declare-fun b!401955 () Bool)

(declare-fun res!231485 () Bool)

(assert (=> b!401955 (=> (not res!231485) (not e!242249))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401955 (= res!231485 (validKeyInArray!0 k0!794))))

(declare-fun bm!28300 () Bool)

(assert (=> bm!28300 (= call!28302 (getCurrentListMapNoExtraKeys!1042 (ite c!54759 lt!187896 _keys!709) (ite c!54759 (array!24085 (store (arr!11491 _values!549) i!563 (ValueCellFull!4706 v!412)) (size!11843 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401956 () Bool)

(assert (=> b!401956 (= e!242254 tp_is_empty!10099)))

(declare-fun b!401957 () Bool)

(declare-fun res!231481 () Bool)

(assert (=> b!401957 (=> (not res!231481) (not e!242249))))

(declare-fun arrayContainsKey!0 (array!24082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401957 (= res!231481 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!401958 () Bool)

(declare-fun res!231483 () Bool)

(assert (=> b!401958 (=> (not res!231483) (not e!242253))))

(assert (=> b!401958 (= res!231483 (arrayNoDuplicates!0 lt!187896 #b00000000000000000000000000000000 Nil!6547))))

(declare-fun b!401959 () Bool)

(assert (=> b!401959 (= e!242249 e!242253)))

(declare-fun res!231478 () Bool)

(assert (=> b!401959 (=> (not res!231478) (not e!242253))))

(assert (=> b!401959 (= res!231478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187896 mask!1025))))

(assert (=> b!401959 (= lt!187896 (array!24083 (store (arr!11490 _keys!709) i!563 k0!794) (size!11842 _keys!709)))))

(declare-fun mapIsEmpty!16770 () Bool)

(assert (=> mapIsEmpty!16770 mapRes!16770))

(assert (= (and start!38666 res!231480) b!401944))

(assert (= (and b!401944 res!231475) b!401949))

(assert (= (and b!401949 res!231484) b!401952))

(assert (= (and b!401952 res!231482) b!401951))

(assert (= (and b!401951 res!231479) b!401954))

(assert (= (and b!401954 res!231477) b!401955))

(assert (= (and b!401955 res!231485) b!401950))

(assert (= (and b!401950 res!231486) b!401957))

(assert (= (and b!401957 res!231481) b!401959))

(assert (= (and b!401959 res!231478) b!401958))

(assert (= (and b!401958 res!231483) b!401947))

(assert (= (and b!401947 res!231476) b!401943))

(assert (= (and b!401943 c!54759) b!401948))

(assert (= (and b!401943 (not c!54759)) b!401953))

(assert (= (or b!401948 b!401953) bm!28300))

(assert (= (or b!401948 b!401953) bm!28299))

(assert (= (and b!401946 condMapEmpty!16770) mapIsEmpty!16770))

(assert (= (and b!401946 (not condMapEmpty!16770)) mapNonEmpty!16770))

(get-info :version)

(assert (= (and mapNonEmpty!16770 ((_ is ValueCellFull!4706) mapValue!16770)) b!401945))

(assert (= (and b!401946 ((_ is ValueCellFull!4706) mapDefault!16770)) b!401956))

(assert (= start!38666 b!401946))

(declare-fun m!395895 () Bool)

(assert (=> b!401958 m!395895))

(declare-fun m!395897 () Bool)

(assert (=> start!38666 m!395897))

(declare-fun m!395899 () Bool)

(assert (=> start!38666 m!395899))

(declare-fun m!395901 () Bool)

(assert (=> b!401955 m!395901))

(declare-fun m!395903 () Bool)

(assert (=> b!401951 m!395903))

(declare-fun m!395905 () Bool)

(assert (=> b!401959 m!395905))

(declare-fun m!395907 () Bool)

(assert (=> b!401959 m!395907))

(declare-fun m!395909 () Bool)

(assert (=> b!401943 m!395909))

(declare-fun m!395911 () Bool)

(assert (=> b!401948 m!395911))

(declare-fun m!395913 () Bool)

(assert (=> b!401950 m!395913))

(declare-fun m!395915 () Bool)

(assert (=> b!401944 m!395915))

(declare-fun m!395917 () Bool)

(assert (=> b!401957 m!395917))

(declare-fun m!395919 () Bool)

(assert (=> bm!28300 m!395919))

(declare-fun m!395921 () Bool)

(assert (=> bm!28300 m!395921))

(declare-fun m!395923 () Bool)

(assert (=> b!401952 m!395923))

(assert (=> bm!28299 m!395919))

(declare-fun m!395925 () Bool)

(assert (=> bm!28299 m!395925))

(declare-fun m!395927 () Bool)

(assert (=> mapNonEmpty!16770 m!395927))

(check-sat (not mapNonEmpty!16770) (not start!38666) (not b!401951) (not b!401952) (not b!401955) (not b!401948) b_and!16617 (not b!401943) (not b!401959) (not b!401958) (not bm!28299) tp_is_empty!10099 (not b!401944) (not b_next!9217) (not b!401957) (not bm!28300))
(check-sat b_and!16617 (not b_next!9217))
