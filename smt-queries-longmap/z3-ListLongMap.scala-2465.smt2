; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38594 () Bool)

(assert start!38594)

(declare-fun b_free!9145 () Bool)

(declare-fun b_next!9145 () Bool)

(assert (=> start!38594 (= b_free!9145 (not b_next!9145))))

(declare-fun tp!32559 () Bool)

(declare-fun b_and!16505 () Bool)

(assert (=> start!38594 (= tp!32559 b_and!16505)))

(declare-fun b!399885 () Bool)

(declare-fun res!230058 () Bool)

(declare-fun e!241354 () Bool)

(assert (=> b!399885 (=> (not res!230058) (not e!241354))))

(declare-datatypes ((array!23943 0))(
  ( (array!23944 (arr!11421 (Array (_ BitVec 32) (_ BitVec 64))) (size!11774 (_ BitVec 32))) )
))
(declare-fun lt!187427 () array!23943)

(declare-datatypes ((List!6586 0))(
  ( (Nil!6583) (Cons!6582 (h!7438 (_ BitVec 64)) (t!11751 List!6586)) )
))
(declare-fun arrayNoDuplicates!0 (array!23943 (_ BitVec 32) List!6586) Bool)

(assert (=> b!399885 (= res!230058 (arrayNoDuplicates!0 lt!187427 #b00000000000000000000000000000000 Nil!6583))))

(declare-fun b!399886 () Bool)

(declare-fun e!241353 () Bool)

(assert (=> b!399886 (= e!241353 e!241354)))

(declare-fun res!230053 () Bool)

(assert (=> b!399886 (=> (not res!230053) (not e!241354))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23943 (_ BitVec 32)) Bool)

(assert (=> b!399886 (= res!230053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187427 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!23943)

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!399886 (= lt!187427 (array!23944 (store (arr!11421 _keys!709) i!563 k0!794) (size!11774 _keys!709)))))

(declare-datatypes ((V!14475 0))(
  ( (V!14476 (val!5058 Int)) )
))
(declare-fun minValue!515 () V!14475)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!54603 () Bool)

(declare-datatypes ((ValueCell!4670 0))(
  ( (ValueCellFull!4670 (v!7299 V!14475)) (EmptyCell!4670) )
))
(declare-datatypes ((array!23945 0))(
  ( (array!23946 (arr!11422 (Array (_ BitVec 32) ValueCell!4670)) (size!11775 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23945)

(declare-fun zeroValue!515 () V!14475)

(declare-fun bm!28071 () Bool)

(declare-datatypes ((tuple2!6678 0))(
  ( (tuple2!6679 (_1!3350 (_ BitVec 64)) (_2!3350 V!14475)) )
))
(declare-datatypes ((List!6587 0))(
  ( (Nil!6584) (Cons!6583 (h!7439 tuple2!6678) (t!11752 List!6587)) )
))
(declare-datatypes ((ListLongMap!5581 0))(
  ( (ListLongMap!5582 (toList!2806 List!6587)) )
))
(declare-fun call!28074 () ListLongMap!5581)

(declare-fun v!412 () V!14475)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1025 (array!23943 array!23945 (_ BitVec 32) (_ BitVec 32) V!14475 V!14475 (_ BitVec 32) Int) ListLongMap!5581)

(assert (=> bm!28071 (= call!28074 (getCurrentListMapNoExtraKeys!1025 (ite c!54603 lt!187427 _keys!709) (ite c!54603 (array!23946 (store (arr!11422 _values!549) i!563 (ValueCellFull!4670 v!412)) (size!11775 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun e!241352 () Bool)

(declare-fun call!28075 () ListLongMap!5581)

(declare-fun b!399887 () Bool)

(declare-fun +!1118 (ListLongMap!5581 tuple2!6678) ListLongMap!5581)

(assert (=> b!399887 (= e!241352 (= call!28074 (+!1118 call!28075 (tuple2!6679 k0!794 v!412))))))

(declare-fun b!399888 () Bool)

(declare-fun res!230063 () Bool)

(assert (=> b!399888 (=> (not res!230063) (not e!241353))))

(assert (=> b!399888 (= res!230063 (and (= (size!11775 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11774 _keys!709) (size!11775 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!230055 () Bool)

(assert (=> start!38594 (=> (not res!230055) (not e!241353))))

(assert (=> start!38594 (= res!230055 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11774 _keys!709))))))

(assert (=> start!38594 e!241353))

(declare-fun tp_is_empty!10027 () Bool)

(assert (=> start!38594 tp_is_empty!10027))

(assert (=> start!38594 tp!32559))

(assert (=> start!38594 true))

(declare-fun e!241355 () Bool)

(declare-fun array_inv!8380 (array!23945) Bool)

(assert (=> start!38594 (and (array_inv!8380 _values!549) e!241355)))

(declare-fun array_inv!8381 (array!23943) Bool)

(assert (=> start!38594 (array_inv!8381 _keys!709)))

(declare-fun b!399889 () Bool)

(declare-fun res!230057 () Bool)

(assert (=> b!399889 (=> (not res!230057) (not e!241353))))

(assert (=> b!399889 (= res!230057 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11774 _keys!709))))))

(declare-fun b!399890 () Bool)

(declare-fun res!230054 () Bool)

(assert (=> b!399890 (=> (not res!230054) (not e!241354))))

(assert (=> b!399890 (= res!230054 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11774 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!399891 () Bool)

(declare-fun res!230061 () Bool)

(assert (=> b!399891 (=> (not res!230061) (not e!241353))))

(assert (=> b!399891 (= res!230061 (or (= (select (arr!11421 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11421 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16662 () Bool)

(declare-fun mapRes!16662 () Bool)

(declare-fun tp!32558 () Bool)

(declare-fun e!241351 () Bool)

(assert (=> mapNonEmpty!16662 (= mapRes!16662 (and tp!32558 e!241351))))

(declare-fun mapKey!16662 () (_ BitVec 32))

(declare-fun mapRest!16662 () (Array (_ BitVec 32) ValueCell!4670))

(declare-fun mapValue!16662 () ValueCell!4670)

(assert (=> mapNonEmpty!16662 (= (arr!11422 _values!549) (store mapRest!16662 mapKey!16662 mapValue!16662))))

(declare-fun b!399892 () Bool)

(assert (=> b!399892 (= e!241351 tp_is_empty!10027)))

(declare-fun bm!28072 () Bool)

(assert (=> bm!28072 (= call!28075 (getCurrentListMapNoExtraKeys!1025 (ite c!54603 _keys!709 lt!187427) (ite c!54603 _values!549 (array!23946 (store (arr!11422 _values!549) i!563 (ValueCellFull!4670 v!412)) (size!11775 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399893 () Bool)

(assert (=> b!399893 (= e!241354 (not true))))

(assert (=> b!399893 e!241352))

(assert (=> b!399893 (= c!54603 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12094 0))(
  ( (Unit!12095) )
))
(declare-fun lt!187426 () Unit!12094)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!310 (array!23943 array!23945 (_ BitVec 32) (_ BitVec 32) V!14475 V!14475 (_ BitVec 32) (_ BitVec 64) V!14475 (_ BitVec 32) Int) Unit!12094)

(assert (=> b!399893 (= lt!187426 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!310 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399894 () Bool)

(declare-fun res!230062 () Bool)

(assert (=> b!399894 (=> (not res!230062) (not e!241353))))

(assert (=> b!399894 (= res!230062 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6583))))

(declare-fun mapIsEmpty!16662 () Bool)

(assert (=> mapIsEmpty!16662 mapRes!16662))

(declare-fun b!399895 () Bool)

(assert (=> b!399895 (= e!241352 (= call!28075 call!28074))))

(declare-fun b!399896 () Bool)

(declare-fun e!241356 () Bool)

(assert (=> b!399896 (= e!241356 tp_is_empty!10027)))

(declare-fun b!399897 () Bool)

(declare-fun res!230059 () Bool)

(assert (=> b!399897 (=> (not res!230059) (not e!241353))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399897 (= res!230059 (validKeyInArray!0 k0!794))))

(declare-fun b!399898 () Bool)

(declare-fun res!230060 () Bool)

(assert (=> b!399898 (=> (not res!230060) (not e!241353))))

(declare-fun arrayContainsKey!0 (array!23943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399898 (= res!230060 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!399899 () Bool)

(declare-fun res!230064 () Bool)

(assert (=> b!399899 (=> (not res!230064) (not e!241353))))

(assert (=> b!399899 (= res!230064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!399900 () Bool)

(assert (=> b!399900 (= e!241355 (and e!241356 mapRes!16662))))

(declare-fun condMapEmpty!16662 () Bool)

(declare-fun mapDefault!16662 () ValueCell!4670)

(assert (=> b!399900 (= condMapEmpty!16662 (= (arr!11422 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4670)) mapDefault!16662)))))

(declare-fun b!399901 () Bool)

(declare-fun res!230056 () Bool)

(assert (=> b!399901 (=> (not res!230056) (not e!241353))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!399901 (= res!230056 (validMask!0 mask!1025))))

(assert (= (and start!38594 res!230055) b!399901))

(assert (= (and b!399901 res!230056) b!399888))

(assert (= (and b!399888 res!230063) b!399899))

(assert (= (and b!399899 res!230064) b!399894))

(assert (= (and b!399894 res!230062) b!399889))

(assert (= (and b!399889 res!230057) b!399897))

(assert (= (and b!399897 res!230059) b!399891))

(assert (= (and b!399891 res!230061) b!399898))

(assert (= (and b!399898 res!230060) b!399886))

(assert (= (and b!399886 res!230053) b!399885))

(assert (= (and b!399885 res!230058) b!399890))

(assert (= (and b!399890 res!230054) b!399893))

(assert (= (and b!399893 c!54603) b!399887))

(assert (= (and b!399893 (not c!54603)) b!399895))

(assert (= (or b!399887 b!399895) bm!28071))

(assert (= (or b!399887 b!399895) bm!28072))

(assert (= (and b!399900 condMapEmpty!16662) mapIsEmpty!16662))

(assert (= (and b!399900 (not condMapEmpty!16662)) mapNonEmpty!16662))

(get-info :version)

(assert (= (and mapNonEmpty!16662 ((_ is ValueCellFull!4670) mapValue!16662)) b!399892))

(assert (= (and b!399900 ((_ is ValueCellFull!4670) mapDefault!16662)) b!399896))

(assert (= start!38594 b!399900))

(declare-fun m!393717 () Bool)

(assert (=> bm!28072 m!393717))

(declare-fun m!393719 () Bool)

(assert (=> bm!28072 m!393719))

(declare-fun m!393721 () Bool)

(assert (=> b!399891 m!393721))

(declare-fun m!393723 () Bool)

(assert (=> mapNonEmpty!16662 m!393723))

(declare-fun m!393725 () Bool)

(assert (=> b!399886 m!393725))

(declare-fun m!393727 () Bool)

(assert (=> b!399886 m!393727))

(declare-fun m!393729 () Bool)

(assert (=> start!38594 m!393729))

(declare-fun m!393731 () Bool)

(assert (=> start!38594 m!393731))

(declare-fun m!393733 () Bool)

(assert (=> b!399901 m!393733))

(declare-fun m!393735 () Bool)

(assert (=> b!399897 m!393735))

(declare-fun m!393737 () Bool)

(assert (=> b!399887 m!393737))

(declare-fun m!393739 () Bool)

(assert (=> b!399885 m!393739))

(declare-fun m!393741 () Bool)

(assert (=> b!399894 m!393741))

(declare-fun m!393743 () Bool)

(assert (=> b!399893 m!393743))

(declare-fun m!393745 () Bool)

(assert (=> b!399898 m!393745))

(assert (=> bm!28071 m!393717))

(declare-fun m!393747 () Bool)

(assert (=> bm!28071 m!393747))

(declare-fun m!393749 () Bool)

(assert (=> b!399899 m!393749))

(check-sat (not b!399887) (not b!399894) (not b_next!9145) (not b!399885) b_and!16505 tp_is_empty!10027 (not start!38594) (not b!399899) (not b!399897) (not bm!28072) (not mapNonEmpty!16662) (not b!399898) (not b!399893) (not bm!28071) (not b!399886) (not b!399901))
(check-sat b_and!16505 (not b_next!9145))
