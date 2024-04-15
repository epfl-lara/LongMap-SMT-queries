; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38726 () Bool)

(assert start!38726)

(declare-fun b_free!9277 () Bool)

(declare-fun b_next!9277 () Bool)

(assert (=> start!38726 (= b_free!9277 (not b_next!9277))))

(declare-fun tp!32955 () Bool)

(declare-fun b_and!16637 () Bool)

(assert (=> start!38726 (= tp!32955 b_and!16637)))

(declare-fun b!403251 () Bool)

(declare-fun res!232438 () Bool)

(declare-fun e!242736 () Bool)

(assert (=> b!403251 (=> (not res!232438) (not e!242736))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403251 (= res!232438 (validKeyInArray!0 k0!794))))

(declare-fun b!403252 () Bool)

(declare-fun res!232435 () Bool)

(assert (=> b!403252 (=> (not res!232435) (not e!242736))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403252 (= res!232435 (validMask!0 mask!1025))))

(declare-fun b!403253 () Bool)

(declare-fun res!232437 () Bool)

(declare-fun e!242742 () Bool)

(assert (=> b!403253 (=> (not res!232437) (not e!242742))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24199 0))(
  ( (array!24200 (arr!11549 (Array (_ BitVec 32) (_ BitVec 64))) (size!11902 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24199)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!403253 (= res!232437 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11902 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!403254 () Bool)

(declare-fun res!232432 () Bool)

(assert (=> b!403254 (=> (not res!232432) (not e!242736))))

(declare-fun arrayContainsKey!0 (array!24199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403254 (= res!232432 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!403255 () Bool)

(declare-fun e!242739 () Bool)

(declare-datatypes ((V!14651 0))(
  ( (V!14652 (val!5124 Int)) )
))
(declare-datatypes ((tuple2!6796 0))(
  ( (tuple2!6797 (_1!3409 (_ BitVec 64)) (_2!3409 V!14651)) )
))
(declare-datatypes ((List!6699 0))(
  ( (Nil!6696) (Cons!6695 (h!7551 tuple2!6796) (t!11864 List!6699)) )
))
(declare-datatypes ((ListLongMap!5699 0))(
  ( (ListLongMap!5700 (toList!2865 List!6699)) )
))
(declare-fun call!28471 () ListLongMap!5699)

(declare-fun call!28470 () ListLongMap!5699)

(assert (=> b!403255 (= e!242739 (= call!28471 call!28470))))

(declare-fun b!403256 () Bool)

(declare-fun res!232434 () Bool)

(assert (=> b!403256 (=> (not res!232434) (not e!242736))))

(declare-datatypes ((List!6700 0))(
  ( (Nil!6697) (Cons!6696 (h!7552 (_ BitVec 64)) (t!11865 List!6700)) )
))
(declare-fun arrayNoDuplicates!0 (array!24199 (_ BitVec 32) List!6700) Bool)

(assert (=> b!403256 (= res!232434 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6697))))

(declare-fun b!403257 () Bool)

(assert (=> b!403257 (= e!242742 (not true))))

(assert (=> b!403257 e!242739))

(declare-fun c!54801 () Bool)

(assert (=> b!403257 (= c!54801 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12176 0))(
  ( (Unit!12177) )
))
(declare-fun lt!187822 () Unit!12176)

(declare-fun minValue!515 () V!14651)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4736 0))(
  ( (ValueCellFull!4736 (v!7365 V!14651)) (EmptyCell!4736) )
))
(declare-datatypes ((array!24201 0))(
  ( (array!24202 (arr!11550 (Array (_ BitVec 32) ValueCell!4736)) (size!11903 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24201)

(declare-fun zeroValue!515 () V!14651)

(declare-fun v!412 () V!14651)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!351 (array!24199 array!24201 (_ BitVec 32) (_ BitVec 32) V!14651 V!14651 (_ BitVec 32) (_ BitVec 64) V!14651 (_ BitVec 32) Int) Unit!12176)

(assert (=> b!403257 (= lt!187822 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!351 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403259 () Bool)

(declare-fun +!1167 (ListLongMap!5699 tuple2!6796) ListLongMap!5699)

(assert (=> b!403259 (= e!242739 (= call!28470 (+!1167 call!28471 (tuple2!6797 k0!794 v!412))))))

(declare-fun bm!28467 () Bool)

(declare-fun lt!187823 () array!24199)

(declare-fun getCurrentListMapNoExtraKeys!1080 (array!24199 array!24201 (_ BitVec 32) (_ BitVec 32) V!14651 V!14651 (_ BitVec 32) Int) ListLongMap!5699)

(assert (=> bm!28467 (= call!28471 (getCurrentListMapNoExtraKeys!1080 (ite c!54801 _keys!709 lt!187823) (ite c!54801 _values!549 (array!24202 (store (arr!11550 _values!549) i!563 (ValueCellFull!4736 v!412)) (size!11903 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403260 () Bool)

(assert (=> b!403260 (= e!242736 e!242742)))

(declare-fun res!232433 () Bool)

(assert (=> b!403260 (=> (not res!232433) (not e!242742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24199 (_ BitVec 32)) Bool)

(assert (=> b!403260 (= res!232433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187823 mask!1025))))

(assert (=> b!403260 (= lt!187823 (array!24200 (store (arr!11549 _keys!709) i!563 k0!794) (size!11902 _keys!709)))))

(declare-fun b!403261 () Bool)

(declare-fun e!242737 () Bool)

(declare-fun tp_is_empty!10159 () Bool)

(assert (=> b!403261 (= e!242737 tp_is_empty!10159)))

(declare-fun b!403262 () Bool)

(declare-fun e!242738 () Bool)

(assert (=> b!403262 (= e!242738 tp_is_empty!10159)))

(declare-fun bm!28468 () Bool)

(assert (=> bm!28468 (= call!28470 (getCurrentListMapNoExtraKeys!1080 (ite c!54801 lt!187823 _keys!709) (ite c!54801 (array!24202 (store (arr!11550 _values!549) i!563 (ValueCellFull!4736 v!412)) (size!11903 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16860 () Bool)

(declare-fun mapRes!16860 () Bool)

(declare-fun tp!32954 () Bool)

(assert (=> mapNonEmpty!16860 (= mapRes!16860 (and tp!32954 e!242738))))

(declare-fun mapKey!16860 () (_ BitVec 32))

(declare-fun mapValue!16860 () ValueCell!4736)

(declare-fun mapRest!16860 () (Array (_ BitVec 32) ValueCell!4736))

(assert (=> mapNonEmpty!16860 (= (arr!11550 _values!549) (store mapRest!16860 mapKey!16860 mapValue!16860))))

(declare-fun b!403263 () Bool)

(declare-fun res!232429 () Bool)

(assert (=> b!403263 (=> (not res!232429) (not e!242736))))

(assert (=> b!403263 (= res!232429 (or (= (select (arr!11549 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11549 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!403264 () Bool)

(declare-fun res!232436 () Bool)

(assert (=> b!403264 (=> (not res!232436) (not e!242736))))

(assert (=> b!403264 (= res!232436 (and (= (size!11903 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11902 _keys!709) (size!11903 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!16860 () Bool)

(assert (=> mapIsEmpty!16860 mapRes!16860))

(declare-fun b!403265 () Bool)

(declare-fun res!232440 () Bool)

(assert (=> b!403265 (=> (not res!232440) (not e!242736))))

(assert (=> b!403265 (= res!232440 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11902 _keys!709))))))

(declare-fun b!403258 () Bool)

(declare-fun res!232439 () Bool)

(assert (=> b!403258 (=> (not res!232439) (not e!242742))))

(assert (=> b!403258 (= res!232439 (arrayNoDuplicates!0 lt!187823 #b00000000000000000000000000000000 Nil!6697))))

(declare-fun res!232431 () Bool)

(assert (=> start!38726 (=> (not res!232431) (not e!242736))))

(assert (=> start!38726 (= res!232431 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11902 _keys!709))))))

(assert (=> start!38726 e!242736))

(assert (=> start!38726 tp_is_empty!10159))

(assert (=> start!38726 tp!32955))

(assert (=> start!38726 true))

(declare-fun e!242741 () Bool)

(declare-fun array_inv!8472 (array!24201) Bool)

(assert (=> start!38726 (and (array_inv!8472 _values!549) e!242741)))

(declare-fun array_inv!8473 (array!24199) Bool)

(assert (=> start!38726 (array_inv!8473 _keys!709)))

(declare-fun b!403266 () Bool)

(assert (=> b!403266 (= e!242741 (and e!242737 mapRes!16860))))

(declare-fun condMapEmpty!16860 () Bool)

(declare-fun mapDefault!16860 () ValueCell!4736)

(assert (=> b!403266 (= condMapEmpty!16860 (= (arr!11550 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4736)) mapDefault!16860)))))

(declare-fun b!403267 () Bool)

(declare-fun res!232430 () Bool)

(assert (=> b!403267 (=> (not res!232430) (not e!242736))))

(assert (=> b!403267 (= res!232430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!38726 res!232431) b!403252))

(assert (= (and b!403252 res!232435) b!403264))

(assert (= (and b!403264 res!232436) b!403267))

(assert (= (and b!403267 res!232430) b!403256))

(assert (= (and b!403256 res!232434) b!403265))

(assert (= (and b!403265 res!232440) b!403251))

(assert (= (and b!403251 res!232438) b!403263))

(assert (= (and b!403263 res!232429) b!403254))

(assert (= (and b!403254 res!232432) b!403260))

(assert (= (and b!403260 res!232433) b!403258))

(assert (= (and b!403258 res!232439) b!403253))

(assert (= (and b!403253 res!232437) b!403257))

(assert (= (and b!403257 c!54801) b!403259))

(assert (= (and b!403257 (not c!54801)) b!403255))

(assert (= (or b!403259 b!403255) bm!28468))

(assert (= (or b!403259 b!403255) bm!28467))

(assert (= (and b!403266 condMapEmpty!16860) mapIsEmpty!16860))

(assert (= (and b!403266 (not condMapEmpty!16860)) mapNonEmpty!16860))

(get-info :version)

(assert (= (and mapNonEmpty!16860 ((_ is ValueCellFull!4736) mapValue!16860)) b!403262))

(assert (= (and b!403266 ((_ is ValueCellFull!4736) mapDefault!16860)) b!403261))

(assert (= start!38726 b!403266))

(declare-fun m!395961 () Bool)

(assert (=> b!403252 m!395961))

(declare-fun m!395963 () Bool)

(assert (=> b!403260 m!395963))

(declare-fun m!395965 () Bool)

(assert (=> b!403260 m!395965))

(declare-fun m!395967 () Bool)

(assert (=> b!403254 m!395967))

(declare-fun m!395969 () Bool)

(assert (=> bm!28467 m!395969))

(declare-fun m!395971 () Bool)

(assert (=> bm!28467 m!395971))

(declare-fun m!395973 () Bool)

(assert (=> b!403258 m!395973))

(assert (=> bm!28468 m!395969))

(declare-fun m!395975 () Bool)

(assert (=> bm!28468 m!395975))

(declare-fun m!395977 () Bool)

(assert (=> b!403256 m!395977))

(declare-fun m!395979 () Bool)

(assert (=> start!38726 m!395979))

(declare-fun m!395981 () Bool)

(assert (=> start!38726 m!395981))

(declare-fun m!395983 () Bool)

(assert (=> b!403263 m!395983))

(declare-fun m!395985 () Bool)

(assert (=> b!403267 m!395985))

(declare-fun m!395987 () Bool)

(assert (=> b!403257 m!395987))

(declare-fun m!395989 () Bool)

(assert (=> b!403259 m!395989))

(declare-fun m!395991 () Bool)

(assert (=> mapNonEmpty!16860 m!395991))

(declare-fun m!395993 () Bool)

(assert (=> b!403251 m!395993))

(check-sat (not b!403258) b_and!16637 (not b_next!9277) tp_is_empty!10159 (not b!403251) (not mapNonEmpty!16860) (not bm!28467) (not start!38726) (not b!403254) (not b!403257) (not b!403259) (not b!403256) (not b!403252) (not b!403267) (not b!403260) (not bm!28468))
(check-sat b_and!16637 (not b_next!9277))
