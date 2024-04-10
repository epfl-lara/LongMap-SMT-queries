; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37636 () Bool)

(assert start!37636)

(declare-fun b_free!8763 () Bool)

(declare-fun b_next!8763 () Bool)

(assert (=> start!37636 (= b_free!8763 (not b_next!8763))))

(declare-fun tp!31004 () Bool)

(declare-fun b_and!16005 () Bool)

(assert (=> start!37636 (= tp!31004 b_and!16005)))

(declare-fun b!385314 () Bool)

(declare-fun res!219791 () Bool)

(declare-fun e!233845 () Bool)

(assert (=> b!385314 (=> (not res!219791) (not e!233845))))

(declare-datatypes ((array!22723 0))(
  ( (array!22724 (arr!10830 (Array (_ BitVec 32) (_ BitVec 64))) (size!11182 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22723)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22723 (_ BitVec 32)) Bool)

(assert (=> b!385314 (= res!219791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!385315 () Bool)

(declare-fun res!219793 () Bool)

(assert (=> b!385315 (=> (not res!219793) (not e!233845))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385315 (= res!219793 (or (= (select (arr!10830 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10830 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!385316 () Bool)

(declare-fun res!219795 () Bool)

(assert (=> b!385316 (=> (not res!219795) (not e!233845))))

(declare-datatypes ((List!6235 0))(
  ( (Nil!6232) (Cons!6231 (h!7087 (_ BitVec 64)) (t!11385 List!6235)) )
))
(declare-fun arrayNoDuplicates!0 (array!22723 (_ BitVec 32) List!6235) Bool)

(assert (=> b!385316 (= res!219795 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6232))))

(declare-fun b!385317 () Bool)

(declare-fun res!219792 () Bool)

(assert (=> b!385317 (=> (not res!219792) (not e!233845))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13653 0))(
  ( (V!13654 (val!4750 Int)) )
))
(declare-datatypes ((ValueCell!4362 0))(
  ( (ValueCellFull!4362 (v!6947 V!13653)) (EmptyCell!4362) )
))
(declare-datatypes ((array!22725 0))(
  ( (array!22726 (arr!10831 (Array (_ BitVec 32) ValueCell!4362)) (size!11183 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22725)

(assert (=> b!385317 (= res!219792 (and (= (size!11183 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11182 _keys!658) (size!11183 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!385318 () Bool)

(declare-fun e!233850 () Bool)

(declare-fun tp_is_empty!9411 () Bool)

(assert (=> b!385318 (= e!233850 tp_is_empty!9411)))

(declare-fun b!385319 () Bool)

(declare-fun e!233848 () Bool)

(declare-fun e!233852 () Bool)

(assert (=> b!385319 (= e!233848 (not e!233852))))

(declare-fun res!219789 () Bool)

(assert (=> b!385319 (=> res!219789 e!233852)))

(declare-fun lt!181565 () Bool)

(assert (=> b!385319 (= res!219789 (or (and (not lt!181565) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181565) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181565)))))

(assert (=> b!385319 (= lt!181565 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6400 0))(
  ( (tuple2!6401 (_1!3211 (_ BitVec 64)) (_2!3211 V!13653)) )
))
(declare-datatypes ((List!6236 0))(
  ( (Nil!6233) (Cons!6232 (h!7088 tuple2!6400) (t!11386 List!6236)) )
))
(declare-datatypes ((ListLongMap!5313 0))(
  ( (ListLongMap!5314 (toList!2672 List!6236)) )
))
(declare-fun lt!181569 () ListLongMap!5313)

(declare-fun zeroValue!472 () V!13653)

(declare-fun minValue!472 () V!13653)

(declare-fun getCurrentListMap!2067 (array!22723 array!22725 (_ BitVec 32) (_ BitVec 32) V!13653 V!13653 (_ BitVec 32) Int) ListLongMap!5313)

(assert (=> b!385319 (= lt!181569 (getCurrentListMap!2067 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181564 () array!22723)

(declare-fun lt!181567 () ListLongMap!5313)

(declare-fun lt!181571 () array!22725)

(assert (=> b!385319 (= lt!181567 (getCurrentListMap!2067 lt!181564 lt!181571 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181563 () ListLongMap!5313)

(declare-fun lt!181566 () ListLongMap!5313)

(assert (=> b!385319 (and (= lt!181563 lt!181566) (= lt!181566 lt!181563))))

(declare-fun lt!181572 () ListLongMap!5313)

(declare-fun lt!181570 () tuple2!6400)

(declare-fun +!1007 (ListLongMap!5313 tuple2!6400) ListLongMap!5313)

(assert (=> b!385319 (= lt!181566 (+!1007 lt!181572 lt!181570))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13653)

(assert (=> b!385319 (= lt!181570 (tuple2!6401 k0!778 v!373))))

(declare-datatypes ((Unit!11888 0))(
  ( (Unit!11889) )
))
(declare-fun lt!181568 () Unit!11888)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!225 (array!22723 array!22725 (_ BitVec 32) (_ BitVec 32) V!13653 V!13653 (_ BitVec 32) (_ BitVec 64) V!13653 (_ BitVec 32) Int) Unit!11888)

(assert (=> b!385319 (= lt!181568 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!225 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!901 (array!22723 array!22725 (_ BitVec 32) (_ BitVec 32) V!13653 V!13653 (_ BitVec 32) Int) ListLongMap!5313)

(assert (=> b!385319 (= lt!181563 (getCurrentListMapNoExtraKeys!901 lt!181564 lt!181571 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!385319 (= lt!181571 (array!22726 (store (arr!10831 _values!506) i!548 (ValueCellFull!4362 v!373)) (size!11183 _values!506)))))

(assert (=> b!385319 (= lt!181572 (getCurrentListMapNoExtraKeys!901 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!385320 () Bool)

(declare-fun res!219790 () Bool)

(assert (=> b!385320 (=> (not res!219790) (not e!233845))))

(declare-fun arrayContainsKey!0 (array!22723 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385320 (= res!219790 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!385321 () Bool)

(assert (=> b!385321 (= e!233845 e!233848)))

(declare-fun res!219788 () Bool)

(assert (=> b!385321 (=> (not res!219788) (not e!233848))))

(assert (=> b!385321 (= res!219788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181564 mask!970))))

(assert (=> b!385321 (= lt!181564 (array!22724 (store (arr!10830 _keys!658) i!548 k0!778) (size!11182 _keys!658)))))

(declare-fun b!385322 () Bool)

(declare-fun res!219796 () Bool)

(assert (=> b!385322 (=> (not res!219796) (not e!233845))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!385322 (= res!219796 (validKeyInArray!0 k0!778))))

(declare-fun b!385323 () Bool)

(declare-fun e!233847 () Bool)

(assert (=> b!385323 (= e!233852 e!233847)))

(declare-fun res!219787 () Bool)

(assert (=> b!385323 (=> res!219787 e!233847)))

(assert (=> b!385323 (= res!219787 (not (= (+!1007 lt!181569 lt!181570) lt!181567)))))

(assert (=> b!385323 (= lt!181567 lt!181563)))

(declare-fun b!385324 () Bool)

(declare-fun e!233846 () Bool)

(declare-fun e!233851 () Bool)

(declare-fun mapRes!15681 () Bool)

(assert (=> b!385324 (= e!233846 (and e!233851 mapRes!15681))))

(declare-fun condMapEmpty!15681 () Bool)

(declare-fun mapDefault!15681 () ValueCell!4362)

(assert (=> b!385324 (= condMapEmpty!15681 (= (arr!10831 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4362)) mapDefault!15681)))))

(declare-fun b!385325 () Bool)

(declare-fun res!219797 () Bool)

(assert (=> b!385325 (=> (not res!219797) (not e!233845))))

(assert (=> b!385325 (= res!219797 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11182 _keys!658))))))

(declare-fun mapIsEmpty!15681 () Bool)

(assert (=> mapIsEmpty!15681 mapRes!15681))

(declare-fun b!385326 () Bool)

(assert (=> b!385326 (= e!233847 (bvsle #b00000000000000000000000000000000 (size!11182 _keys!658)))))

(declare-fun b!385327 () Bool)

(assert (=> b!385327 (= e!233851 tp_is_empty!9411)))

(declare-fun b!385328 () Bool)

(declare-fun res!219794 () Bool)

(assert (=> b!385328 (=> (not res!219794) (not e!233848))))

(assert (=> b!385328 (= res!219794 (arrayNoDuplicates!0 lt!181564 #b00000000000000000000000000000000 Nil!6232))))

(declare-fun res!219786 () Bool)

(assert (=> start!37636 (=> (not res!219786) (not e!233845))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37636 (= res!219786 (validMask!0 mask!970))))

(assert (=> start!37636 e!233845))

(declare-fun array_inv!7972 (array!22725) Bool)

(assert (=> start!37636 (and (array_inv!7972 _values!506) e!233846)))

(assert (=> start!37636 tp!31004))

(assert (=> start!37636 true))

(assert (=> start!37636 tp_is_empty!9411))

(declare-fun array_inv!7973 (array!22723) Bool)

(assert (=> start!37636 (array_inv!7973 _keys!658)))

(declare-fun mapNonEmpty!15681 () Bool)

(declare-fun tp!31005 () Bool)

(assert (=> mapNonEmpty!15681 (= mapRes!15681 (and tp!31005 e!233850))))

(declare-fun mapKey!15681 () (_ BitVec 32))

(declare-fun mapRest!15681 () (Array (_ BitVec 32) ValueCell!4362))

(declare-fun mapValue!15681 () ValueCell!4362)

(assert (=> mapNonEmpty!15681 (= (arr!10831 _values!506) (store mapRest!15681 mapKey!15681 mapValue!15681))))

(assert (= (and start!37636 res!219786) b!385317))

(assert (= (and b!385317 res!219792) b!385314))

(assert (= (and b!385314 res!219791) b!385316))

(assert (= (and b!385316 res!219795) b!385325))

(assert (= (and b!385325 res!219797) b!385322))

(assert (= (and b!385322 res!219796) b!385315))

(assert (= (and b!385315 res!219793) b!385320))

(assert (= (and b!385320 res!219790) b!385321))

(assert (= (and b!385321 res!219788) b!385328))

(assert (= (and b!385328 res!219794) b!385319))

(assert (= (and b!385319 (not res!219789)) b!385323))

(assert (= (and b!385323 (not res!219787)) b!385326))

(assert (= (and b!385324 condMapEmpty!15681) mapIsEmpty!15681))

(assert (= (and b!385324 (not condMapEmpty!15681)) mapNonEmpty!15681))

(get-info :version)

(assert (= (and mapNonEmpty!15681 ((_ is ValueCellFull!4362) mapValue!15681)) b!385318))

(assert (= (and b!385324 ((_ is ValueCellFull!4362) mapDefault!15681)) b!385327))

(assert (= start!37636 b!385324))

(declare-fun m!381955 () Bool)

(assert (=> b!385322 m!381955))

(declare-fun m!381957 () Bool)

(assert (=> mapNonEmpty!15681 m!381957))

(declare-fun m!381959 () Bool)

(assert (=> b!385319 m!381959))

(declare-fun m!381961 () Bool)

(assert (=> b!385319 m!381961))

(declare-fun m!381963 () Bool)

(assert (=> b!385319 m!381963))

(declare-fun m!381965 () Bool)

(assert (=> b!385319 m!381965))

(declare-fun m!381967 () Bool)

(assert (=> b!385319 m!381967))

(declare-fun m!381969 () Bool)

(assert (=> b!385319 m!381969))

(declare-fun m!381971 () Bool)

(assert (=> b!385319 m!381971))

(declare-fun m!381973 () Bool)

(assert (=> b!385328 m!381973))

(declare-fun m!381975 () Bool)

(assert (=> b!385316 m!381975))

(declare-fun m!381977 () Bool)

(assert (=> b!385321 m!381977))

(declare-fun m!381979 () Bool)

(assert (=> b!385321 m!381979))

(declare-fun m!381981 () Bool)

(assert (=> b!385323 m!381981))

(declare-fun m!381983 () Bool)

(assert (=> b!385315 m!381983))

(declare-fun m!381985 () Bool)

(assert (=> b!385314 m!381985))

(declare-fun m!381987 () Bool)

(assert (=> start!37636 m!381987))

(declare-fun m!381989 () Bool)

(assert (=> start!37636 m!381989))

(declare-fun m!381991 () Bool)

(assert (=> start!37636 m!381991))

(declare-fun m!381993 () Bool)

(assert (=> b!385320 m!381993))

(check-sat (not b!385323) tp_is_empty!9411 (not b!385319) (not b!385321) b_and!16005 (not start!37636) (not b!385320) (not b!385322) (not b_next!8763) (not b!385314) (not mapNonEmpty!15681) (not b!385316) (not b!385328))
(check-sat b_and!16005 (not b_next!8763))
