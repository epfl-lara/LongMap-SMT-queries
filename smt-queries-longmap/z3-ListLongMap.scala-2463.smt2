; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38598 () Bool)

(assert start!38598)

(declare-fun b_free!9135 () Bool)

(declare-fun b_next!9135 () Bool)

(assert (=> start!38598 (= b_free!9135 (not b_next!9135))))

(declare-fun tp!32529 () Bool)

(declare-fun b_and!16521 () Bool)

(assert (=> start!38598 (= tp!32529 b_and!16521)))

(declare-datatypes ((V!14461 0))(
  ( (V!14462 (val!5053 Int)) )
))
(declare-fun minValue!515 () V!14461)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!28066 () Bool)

(declare-datatypes ((ValueCell!4665 0))(
  ( (ValueCellFull!4665 (v!7300 V!14461)) (EmptyCell!4665) )
))
(declare-datatypes ((array!23945 0))(
  ( (array!23946 (arr!11422 (Array (_ BitVec 32) ValueCell!4665)) (size!11774 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23945)

(declare-datatypes ((tuple2!6694 0))(
  ( (tuple2!6695 (_1!3358 (_ BitVec 64)) (_2!3358 V!14461)) )
))
(declare-datatypes ((List!6619 0))(
  ( (Nil!6616) (Cons!6615 (h!7471 tuple2!6694) (t!11793 List!6619)) )
))
(declare-datatypes ((ListLongMap!5607 0))(
  ( (ListLongMap!5608 (toList!2819 List!6619)) )
))
(declare-fun call!28069 () ListLongMap!5607)

(declare-fun zeroValue!515 () V!14461)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun c!54659 () Bool)

(declare-datatypes ((array!23947 0))(
  ( (array!23948 (arr!11423 (Array (_ BitVec 32) (_ BitVec 64))) (size!11775 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23947)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!187630 () array!23947)

(declare-fun v!412 () V!14461)

(declare-fun getCurrentListMapNoExtraKeys!1036 (array!23947 array!23945 (_ BitVec 32) (_ BitVec 32) V!14461 V!14461 (_ BitVec 32) Int) ListLongMap!5607)

(assert (=> bm!28066 (= call!28069 (getCurrentListMapNoExtraKeys!1036 (ite c!54659 lt!187630 _keys!709) (ite c!54659 (array!23946 (store (arr!11422 _values!549) i!563 (ValueCellFull!4665 v!412)) (size!11774 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399901 () Bool)

(declare-fun e!241419 () Bool)

(declare-fun e!241421 () Bool)

(assert (=> b!399901 (= e!241419 e!241421)))

(declare-fun res!230008 () Bool)

(assert (=> b!399901 (=> (not res!230008) (not e!241421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23947 (_ BitVec 32)) Bool)

(assert (=> b!399901 (= res!230008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187630 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!399901 (= lt!187630 (array!23948 (store (arr!11423 _keys!709) i!563 k0!794) (size!11775 _keys!709)))))

(declare-fun mapNonEmpty!16647 () Bool)

(declare-fun mapRes!16647 () Bool)

(declare-fun tp!32528 () Bool)

(declare-fun e!241422 () Bool)

(assert (=> mapNonEmpty!16647 (= mapRes!16647 (and tp!32528 e!241422))))

(declare-fun mapKey!16647 () (_ BitVec 32))

(declare-fun mapRest!16647 () (Array (_ BitVec 32) ValueCell!4665))

(declare-fun mapValue!16647 () ValueCell!4665)

(assert (=> mapNonEmpty!16647 (= (arr!11422 _values!549) (store mapRest!16647 mapKey!16647 mapValue!16647))))

(declare-fun b!399902 () Bool)

(declare-fun res!230005 () Bool)

(assert (=> b!399902 (=> (not res!230005) (not e!241421))))

(assert (=> b!399902 (= res!230005 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11775 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun bm!28067 () Bool)

(declare-fun call!28070 () ListLongMap!5607)

(assert (=> bm!28067 (= call!28070 (getCurrentListMapNoExtraKeys!1036 (ite c!54659 _keys!709 lt!187630) (ite c!54659 _values!549 (array!23946 (store (arr!11422 _values!549) i!563 (ValueCellFull!4665 v!412)) (size!11774 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16647 () Bool)

(assert (=> mapIsEmpty!16647 mapRes!16647))

(declare-fun b!399903 () Bool)

(declare-fun e!241420 () Bool)

(declare-fun tp_is_empty!10017 () Bool)

(assert (=> b!399903 (= e!241420 tp_is_empty!10017)))

(declare-fun b!399904 () Bool)

(declare-fun res!230013 () Bool)

(assert (=> b!399904 (=> (not res!230013) (not e!241419))))

(assert (=> b!399904 (= res!230013 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11775 _keys!709))))))

(declare-fun b!399905 () Bool)

(declare-fun res!230009 () Bool)

(assert (=> b!399905 (=> (not res!230009) (not e!241419))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399905 (= res!230009 (validMask!0 mask!1025))))

(declare-fun b!399907 () Bool)

(declare-fun e!241424 () Bool)

(assert (=> b!399907 (= e!241424 (and e!241420 mapRes!16647))))

(declare-fun condMapEmpty!16647 () Bool)

(declare-fun mapDefault!16647 () ValueCell!4665)

(assert (=> b!399907 (= condMapEmpty!16647 (= (arr!11422 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4665)) mapDefault!16647)))))

(declare-fun b!399908 () Bool)

(declare-fun res!230011 () Bool)

(assert (=> b!399908 (=> (not res!230011) (not e!241419))))

(declare-fun arrayContainsKey!0 (array!23947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399908 (= res!230011 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!399909 () Bool)

(declare-fun res!230012 () Bool)

(assert (=> b!399909 (=> (not res!230012) (not e!241419))))

(assert (=> b!399909 (= res!230012 (and (= (size!11774 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11775 _keys!709) (size!11774 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!399910 () Bool)

(declare-fun res!230004 () Bool)

(assert (=> b!399910 (=> (not res!230004) (not e!241419))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399910 (= res!230004 (validKeyInArray!0 k0!794))))

(declare-fun b!399911 () Bool)

(declare-fun res!230003 () Bool)

(assert (=> b!399911 (=> (not res!230003) (not e!241419))))

(declare-datatypes ((List!6620 0))(
  ( (Nil!6617) (Cons!6616 (h!7472 (_ BitVec 64)) (t!11794 List!6620)) )
))
(declare-fun arrayNoDuplicates!0 (array!23947 (_ BitVec 32) List!6620) Bool)

(assert (=> b!399911 (= res!230003 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6617))))

(declare-fun b!399912 () Bool)

(declare-fun e!241425 () Bool)

(assert (=> b!399912 (= e!241425 (= call!28070 call!28069))))

(declare-fun b!399913 () Bool)

(declare-fun res!230007 () Bool)

(assert (=> b!399913 (=> (not res!230007) (not e!241421))))

(assert (=> b!399913 (= res!230007 (arrayNoDuplicates!0 lt!187630 #b00000000000000000000000000000000 Nil!6617))))

(declare-fun b!399914 () Bool)

(declare-fun res!230010 () Bool)

(assert (=> b!399914 (=> (not res!230010) (not e!241419))))

(assert (=> b!399914 (= res!230010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!399915 () Bool)

(declare-fun res!230006 () Bool)

(assert (=> b!399915 (=> (not res!230006) (not e!241419))))

(assert (=> b!399915 (= res!230006 (or (= (select (arr!11423 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11423 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!399916 () Bool)

(assert (=> b!399916 (= e!241422 tp_is_empty!10017)))

(declare-fun b!399917 () Bool)

(assert (=> b!399917 (= e!241421 (not true))))

(assert (=> b!399917 e!241425))

(assert (=> b!399917 (= c!54659 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12122 0))(
  ( (Unit!12123) )
))
(declare-fun lt!187631 () Unit!12122)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!319 (array!23947 array!23945 (_ BitVec 32) (_ BitVec 32) V!14461 V!14461 (_ BitVec 32) (_ BitVec 64) V!14461 (_ BitVec 32) Int) Unit!12122)

(assert (=> b!399917 (= lt!187631 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!319 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!230002 () Bool)

(assert (=> start!38598 (=> (not res!230002) (not e!241419))))

(assert (=> start!38598 (= res!230002 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11775 _keys!709))))))

(assert (=> start!38598 e!241419))

(assert (=> start!38598 tp_is_empty!10017))

(assert (=> start!38598 tp!32529))

(assert (=> start!38598 true))

(declare-fun array_inv!8368 (array!23945) Bool)

(assert (=> start!38598 (and (array_inv!8368 _values!549) e!241424)))

(declare-fun array_inv!8369 (array!23947) Bool)

(assert (=> start!38598 (array_inv!8369 _keys!709)))

(declare-fun b!399906 () Bool)

(declare-fun +!1107 (ListLongMap!5607 tuple2!6694) ListLongMap!5607)

(assert (=> b!399906 (= e!241425 (= call!28069 (+!1107 call!28070 (tuple2!6695 k0!794 v!412))))))

(assert (= (and start!38598 res!230002) b!399905))

(assert (= (and b!399905 res!230009) b!399909))

(assert (= (and b!399909 res!230012) b!399914))

(assert (= (and b!399914 res!230010) b!399911))

(assert (= (and b!399911 res!230003) b!399904))

(assert (= (and b!399904 res!230013) b!399910))

(assert (= (and b!399910 res!230004) b!399915))

(assert (= (and b!399915 res!230006) b!399908))

(assert (= (and b!399908 res!230011) b!399901))

(assert (= (and b!399901 res!230008) b!399913))

(assert (= (and b!399913 res!230007) b!399902))

(assert (= (and b!399902 res!230005) b!399917))

(assert (= (and b!399917 c!54659) b!399906))

(assert (= (and b!399917 (not c!54659)) b!399912))

(assert (= (or b!399906 b!399912) bm!28066))

(assert (= (or b!399906 b!399912) bm!28067))

(assert (= (and b!399907 condMapEmpty!16647) mapIsEmpty!16647))

(assert (= (and b!399907 (not condMapEmpty!16647)) mapNonEmpty!16647))

(get-info :version)

(assert (= (and mapNonEmpty!16647 ((_ is ValueCellFull!4665) mapValue!16647)) b!399916))

(assert (= (and b!399907 ((_ is ValueCellFull!4665) mapDefault!16647)) b!399903))

(assert (= start!38598 b!399907))

(declare-fun m!394271 () Bool)

(assert (=> b!399913 m!394271))

(declare-fun m!394273 () Bool)

(assert (=> b!399911 m!394273))

(declare-fun m!394275 () Bool)

(assert (=> mapNonEmpty!16647 m!394275))

(declare-fun m!394277 () Bool)

(assert (=> b!399906 m!394277))

(declare-fun m!394279 () Bool)

(assert (=> b!399914 m!394279))

(declare-fun m!394281 () Bool)

(assert (=> start!38598 m!394281))

(declare-fun m!394283 () Bool)

(assert (=> start!38598 m!394283))

(declare-fun m!394285 () Bool)

(assert (=> bm!28066 m!394285))

(declare-fun m!394287 () Bool)

(assert (=> bm!28066 m!394287))

(declare-fun m!394289 () Bool)

(assert (=> b!399915 m!394289))

(declare-fun m!394291 () Bool)

(assert (=> b!399908 m!394291))

(declare-fun m!394293 () Bool)

(assert (=> b!399917 m!394293))

(declare-fun m!394295 () Bool)

(assert (=> b!399905 m!394295))

(assert (=> bm!28067 m!394285))

(declare-fun m!394297 () Bool)

(assert (=> bm!28067 m!394297))

(declare-fun m!394299 () Bool)

(assert (=> b!399910 m!394299))

(declare-fun m!394301 () Bool)

(assert (=> b!399901 m!394301))

(declare-fun m!394303 () Bool)

(assert (=> b!399901 m!394303))

(check-sat (not b!399911) (not start!38598) (not b!399913) (not b!399908) b_and!16521 (not b!399906) (not bm!28067) (not b!399917) (not b!399901) (not b!399910) (not b!399905) (not b!399914) (not mapNonEmpty!16647) (not b_next!9135) tp_is_empty!10017 (not bm!28066))
(check-sat b_and!16521 (not b_next!9135))
