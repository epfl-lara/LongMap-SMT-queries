; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37770 () Bool)

(assert start!37770)

(declare-fun b_free!8887 () Bool)

(declare-fun b_next!8887 () Bool)

(assert (=> start!37770 (= b_free!8887 (not b_next!8887))))

(declare-fun tp!31413 () Bool)

(declare-fun b_and!16103 () Bool)

(assert (=> start!37770 (= tp!31413 b_and!16103)))

(declare-fun b!387730 () Bool)

(declare-fun res!221679 () Bool)

(declare-fun e!234980 () Bool)

(assert (=> b!387730 (=> (not res!221679) (not e!234980))))

(declare-datatypes ((array!22997 0))(
  ( (array!22998 (arr!10967 (Array (_ BitVec 32) (_ BitVec 64))) (size!11320 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22997)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387730 (= res!221679 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387731 () Bool)

(declare-fun res!221680 () Bool)

(assert (=> b!387731 (=> (not res!221680) (not e!234980))))

(declare-datatypes ((List!6304 0))(
  ( (Nil!6301) (Cons!6300 (h!7156 (_ BitVec 64)) (t!11445 List!6304)) )
))
(declare-fun arrayNoDuplicates!0 (array!22997 (_ BitVec 32) List!6304) Bool)

(assert (=> b!387731 (= res!221680 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6301))))

(declare-fun b!387732 () Bool)

(declare-fun e!234976 () Bool)

(declare-datatypes ((V!13851 0))(
  ( (V!13852 (val!4824 Int)) )
))
(declare-datatypes ((tuple2!6460 0))(
  ( (tuple2!6461 (_1!3241 (_ BitVec 64)) (_2!3241 V!13851)) )
))
(declare-datatypes ((List!6305 0))(
  ( (Nil!6302) (Cons!6301 (h!7157 tuple2!6460) (t!11446 List!6305)) )
))
(declare-datatypes ((ListLongMap!5363 0))(
  ( (ListLongMap!5364 (toList!2697 List!6305)) )
))
(declare-fun lt!181940 () ListLongMap!5363)

(declare-fun lt!181938 () ListLongMap!5363)

(assert (=> b!387732 (= e!234976 (not (= lt!181940 lt!181938)))))

(assert (=> b!387732 (= lt!181938 lt!181940)))

(declare-fun v!373 () V!13851)

(declare-fun lt!181937 () ListLongMap!5363)

(declare-fun +!1017 (ListLongMap!5363 tuple2!6460) ListLongMap!5363)

(assert (=> b!387732 (= lt!181940 (+!1017 lt!181937 (tuple2!6461 k0!778 v!373)))))

(declare-datatypes ((Unit!11876 0))(
  ( (Unit!11877) )
))
(declare-fun lt!181941 () Unit!11876)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13851)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4436 0))(
  ( (ValueCellFull!4436 (v!7015 V!13851)) (EmptyCell!4436) )
))
(declare-datatypes ((array!22999 0))(
  ( (array!23000 (arr!10968 (Array (_ BitVec 32) ValueCell!4436)) (size!11321 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22999)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!13851)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!228 (array!22997 array!22999 (_ BitVec 32) (_ BitVec 32) V!13851 V!13851 (_ BitVec 32) (_ BitVec 64) V!13851 (_ BitVec 32) Int) Unit!11876)

(assert (=> b!387732 (= lt!181941 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!228 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181939 () array!22997)

(declare-fun getCurrentListMapNoExtraKeys!937 (array!22997 array!22999 (_ BitVec 32) (_ BitVec 32) V!13851 V!13851 (_ BitVec 32) Int) ListLongMap!5363)

(assert (=> b!387732 (= lt!181938 (getCurrentListMapNoExtraKeys!937 lt!181939 (array!23000 (store (arr!10968 _values!506) i!548 (ValueCellFull!4436 v!373)) (size!11321 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!387732 (= lt!181937 (getCurrentListMapNoExtraKeys!937 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387733 () Bool)

(declare-fun e!234979 () Bool)

(declare-fun e!234977 () Bool)

(declare-fun mapRes!15903 () Bool)

(assert (=> b!387733 (= e!234979 (and e!234977 mapRes!15903))))

(declare-fun condMapEmpty!15903 () Bool)

(declare-fun mapDefault!15903 () ValueCell!4436)

(assert (=> b!387733 (= condMapEmpty!15903 (= (arr!10968 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4436)) mapDefault!15903)))))

(declare-fun b!387735 () Bool)

(declare-fun res!221686 () Bool)

(assert (=> b!387735 (=> (not res!221686) (not e!234976))))

(assert (=> b!387735 (= res!221686 (arrayNoDuplicates!0 lt!181939 #b00000000000000000000000000000000 Nil!6301))))

(declare-fun mapNonEmpty!15903 () Bool)

(declare-fun tp!31412 () Bool)

(declare-fun e!234978 () Bool)

(assert (=> mapNonEmpty!15903 (= mapRes!15903 (and tp!31412 e!234978))))

(declare-fun mapRest!15903 () (Array (_ BitVec 32) ValueCell!4436))

(declare-fun mapKey!15903 () (_ BitVec 32))

(declare-fun mapValue!15903 () ValueCell!4436)

(assert (=> mapNonEmpty!15903 (= (arr!10968 _values!506) (store mapRest!15903 mapKey!15903 mapValue!15903))))

(declare-fun b!387736 () Bool)

(declare-fun res!221685 () Bool)

(assert (=> b!387736 (=> (not res!221685) (not e!234980))))

(assert (=> b!387736 (= res!221685 (and (= (size!11321 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11320 _keys!658) (size!11321 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387737 () Bool)

(declare-fun res!221681 () Bool)

(assert (=> b!387737 (=> (not res!221681) (not e!234980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387737 (= res!221681 (validKeyInArray!0 k0!778))))

(declare-fun b!387738 () Bool)

(declare-fun tp_is_empty!9559 () Bool)

(assert (=> b!387738 (= e!234977 tp_is_empty!9559)))

(declare-fun b!387739 () Bool)

(declare-fun res!221682 () Bool)

(assert (=> b!387739 (=> (not res!221682) (not e!234980))))

(assert (=> b!387739 (= res!221682 (or (= (select (arr!10967 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10967 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387740 () Bool)

(assert (=> b!387740 (= e!234980 e!234976)))

(declare-fun res!221678 () Bool)

(assert (=> b!387740 (=> (not res!221678) (not e!234976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22997 (_ BitVec 32)) Bool)

(assert (=> b!387740 (= res!221678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181939 mask!970))))

(assert (=> b!387740 (= lt!181939 (array!22998 (store (arr!10967 _keys!658) i!548 k0!778) (size!11320 _keys!658)))))

(declare-fun b!387741 () Bool)

(declare-fun res!221683 () Bool)

(assert (=> b!387741 (=> (not res!221683) (not e!234980))))

(assert (=> b!387741 (= res!221683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!221684 () Bool)

(assert (=> start!37770 (=> (not res!221684) (not e!234980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37770 (= res!221684 (validMask!0 mask!970))))

(assert (=> start!37770 e!234980))

(declare-fun array_inv!8066 (array!22999) Bool)

(assert (=> start!37770 (and (array_inv!8066 _values!506) e!234979)))

(assert (=> start!37770 tp!31413))

(assert (=> start!37770 true))

(assert (=> start!37770 tp_is_empty!9559))

(declare-fun array_inv!8067 (array!22997) Bool)

(assert (=> start!37770 (array_inv!8067 _keys!658)))

(declare-fun b!387734 () Bool)

(assert (=> b!387734 (= e!234978 tp_is_empty!9559)))

(declare-fun b!387742 () Bool)

(declare-fun res!221687 () Bool)

(assert (=> b!387742 (=> (not res!221687) (not e!234980))))

(assert (=> b!387742 (= res!221687 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11320 _keys!658))))))

(declare-fun mapIsEmpty!15903 () Bool)

(assert (=> mapIsEmpty!15903 mapRes!15903))

(assert (= (and start!37770 res!221684) b!387736))

(assert (= (and b!387736 res!221685) b!387741))

(assert (= (and b!387741 res!221683) b!387731))

(assert (= (and b!387731 res!221680) b!387742))

(assert (= (and b!387742 res!221687) b!387737))

(assert (= (and b!387737 res!221681) b!387739))

(assert (= (and b!387739 res!221682) b!387730))

(assert (= (and b!387730 res!221679) b!387740))

(assert (= (and b!387740 res!221678) b!387735))

(assert (= (and b!387735 res!221686) b!387732))

(assert (= (and b!387733 condMapEmpty!15903) mapIsEmpty!15903))

(assert (= (and b!387733 (not condMapEmpty!15903)) mapNonEmpty!15903))

(get-info :version)

(assert (= (and mapNonEmpty!15903 ((_ is ValueCellFull!4436) mapValue!15903)) b!387734))

(assert (= (and b!387733 ((_ is ValueCellFull!4436) mapDefault!15903)) b!387738))

(assert (= start!37770 b!387733))

(declare-fun m!383261 () Bool)

(assert (=> b!387741 m!383261))

(declare-fun m!383263 () Bool)

(assert (=> b!387732 m!383263))

(declare-fun m!383265 () Bool)

(assert (=> b!387732 m!383265))

(declare-fun m!383267 () Bool)

(assert (=> b!387732 m!383267))

(declare-fun m!383269 () Bool)

(assert (=> b!387732 m!383269))

(declare-fun m!383271 () Bool)

(assert (=> b!387732 m!383271))

(declare-fun m!383273 () Bool)

(assert (=> b!387740 m!383273))

(declare-fun m!383275 () Bool)

(assert (=> b!387740 m!383275))

(declare-fun m!383277 () Bool)

(assert (=> b!387730 m!383277))

(declare-fun m!383279 () Bool)

(assert (=> start!37770 m!383279))

(declare-fun m!383281 () Bool)

(assert (=> start!37770 m!383281))

(declare-fun m!383283 () Bool)

(assert (=> start!37770 m!383283))

(declare-fun m!383285 () Bool)

(assert (=> b!387735 m!383285))

(declare-fun m!383287 () Bool)

(assert (=> b!387739 m!383287))

(declare-fun m!383289 () Bool)

(assert (=> b!387737 m!383289))

(declare-fun m!383291 () Bool)

(assert (=> b!387731 m!383291))

(declare-fun m!383293 () Bool)

(assert (=> mapNonEmpty!15903 m!383293))

(check-sat b_and!16103 (not b!387740) (not start!37770) (not b!387741) (not b!387732) (not b!387735) (not b!387731) (not b!387737) (not b_next!8887) tp_is_empty!9559 (not b!387730) (not mapNonEmpty!15903))
(check-sat b_and!16103 (not b_next!8887))
