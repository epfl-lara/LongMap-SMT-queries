; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37072 () Bool)

(assert start!37072)

(declare-fun b_free!8199 () Bool)

(declare-fun b_next!8199 () Bool)

(assert (=> start!37072 (= b_free!8199 (not b_next!8199))))

(declare-fun tp!29313 () Bool)

(declare-fun b_and!15441 () Bool)

(assert (=> start!37072 (= tp!29313 b_and!15441)))

(declare-fun b!372920 () Bool)

(declare-fun e!227403 () Bool)

(declare-fun tp_is_empty!8847 () Bool)

(assert (=> b!372920 (= e!227403 tp_is_empty!8847)))

(declare-fun mapNonEmpty!14835 () Bool)

(declare-fun mapRes!14835 () Bool)

(declare-fun tp!29312 () Bool)

(assert (=> mapNonEmpty!14835 (= mapRes!14835 (and tp!29312 e!227403))))

(declare-datatypes ((V!12901 0))(
  ( (V!12902 (val!4468 Int)) )
))
(declare-datatypes ((ValueCell!4080 0))(
  ( (ValueCellFull!4080 (v!6665 V!12901)) (EmptyCell!4080) )
))
(declare-datatypes ((array!21635 0))(
  ( (array!21636 (arr!10286 (Array (_ BitVec 32) ValueCell!4080)) (size!10638 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21635)

(declare-fun mapKey!14835 () (_ BitVec 32))

(declare-fun mapRest!14835 () (Array (_ BitVec 32) ValueCell!4080))

(declare-fun mapValue!14835 () ValueCell!4080)

(assert (=> mapNonEmpty!14835 (= (arr!10286 _values!506) (store mapRest!14835 mapKey!14835 mapValue!14835))))

(declare-fun res!209938 () Bool)

(declare-fun e!227400 () Bool)

(assert (=> start!37072 (=> (not res!209938) (not e!227400))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37072 (= res!209938 (validMask!0 mask!970))))

(assert (=> start!37072 e!227400))

(declare-fun e!227401 () Bool)

(declare-fun array_inv!7584 (array!21635) Bool)

(assert (=> start!37072 (and (array_inv!7584 _values!506) e!227401)))

(assert (=> start!37072 tp!29313))

(assert (=> start!37072 true))

(assert (=> start!37072 tp_is_empty!8847))

(declare-datatypes ((array!21637 0))(
  ( (array!21638 (arr!10287 (Array (_ BitVec 32) (_ BitVec 64))) (size!10639 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21637)

(declare-fun array_inv!7585 (array!21637) Bool)

(assert (=> start!37072 (array_inv!7585 _keys!658)))

(declare-fun b!372921 () Bool)

(declare-fun res!209939 () Bool)

(assert (=> b!372921 (=> (not res!209939) (not e!227400))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21637 (_ BitVec 32)) Bool)

(assert (=> b!372921 (= res!209939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372922 () Bool)

(declare-fun e!227405 () Bool)

(assert (=> b!372922 (= e!227405 (not (bvsle #b00000000000000000000000000000000 (size!10639 _keys!658))))))

(declare-fun lt!171009 () array!21637)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5924 0))(
  ( (tuple2!5925 (_1!2973 (_ BitVec 64)) (_2!2973 V!12901)) )
))
(declare-datatypes ((List!5770 0))(
  ( (Nil!5767) (Cons!5766 (h!6622 tuple2!5924) (t!10920 List!5770)) )
))
(declare-datatypes ((ListLongMap!4837 0))(
  ( (ListLongMap!4838 (toList!2434 List!5770)) )
))
(declare-fun lt!171013 () ListLongMap!4837)

(declare-fun zeroValue!472 () V!12901)

(declare-fun lt!171014 () array!21635)

(declare-fun minValue!472 () V!12901)

(declare-fun getCurrentListMap!1877 (array!21637 array!21635 (_ BitVec 32) (_ BitVec 32) V!12901 V!12901 (_ BitVec 32) Int) ListLongMap!4837)

(assert (=> b!372922 (= lt!171013 (getCurrentListMap!1877 lt!171009 lt!171014 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171011 () ListLongMap!4837)

(declare-fun lt!171010 () ListLongMap!4837)

(assert (=> b!372922 (and (= lt!171011 lt!171010) (= lt!171010 lt!171011))))

(declare-fun v!373 () V!12901)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun lt!171012 () ListLongMap!4837)

(declare-fun +!780 (ListLongMap!4837 tuple2!5924) ListLongMap!4837)

(assert (=> b!372922 (= lt!171010 (+!780 lt!171012 (tuple2!5925 k0!778 v!373)))))

(declare-datatypes ((Unit!11466 0))(
  ( (Unit!11467) )
))
(declare-fun lt!171015 () Unit!11466)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!35 (array!21637 array!21635 (_ BitVec 32) (_ BitVec 32) V!12901 V!12901 (_ BitVec 32) (_ BitVec 64) V!12901 (_ BitVec 32) Int) Unit!11466)

(assert (=> b!372922 (= lt!171015 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!35 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!711 (array!21637 array!21635 (_ BitVec 32) (_ BitVec 32) V!12901 V!12901 (_ BitVec 32) Int) ListLongMap!4837)

(assert (=> b!372922 (= lt!171011 (getCurrentListMapNoExtraKeys!711 lt!171009 lt!171014 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372922 (= lt!171014 (array!21636 (store (arr!10286 _values!506) i!548 (ValueCellFull!4080 v!373)) (size!10638 _values!506)))))

(assert (=> b!372922 (= lt!171012 (getCurrentListMapNoExtraKeys!711 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!14835 () Bool)

(assert (=> mapIsEmpty!14835 mapRes!14835))

(declare-fun b!372923 () Bool)

(assert (=> b!372923 (= e!227400 e!227405)))

(declare-fun res!209931 () Bool)

(assert (=> b!372923 (=> (not res!209931) (not e!227405))))

(assert (=> b!372923 (= res!209931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171009 mask!970))))

(assert (=> b!372923 (= lt!171009 (array!21638 (store (arr!10287 _keys!658) i!548 k0!778) (size!10639 _keys!658)))))

(declare-fun b!372924 () Bool)

(declare-fun res!209935 () Bool)

(assert (=> b!372924 (=> (not res!209935) (not e!227400))))

(declare-fun arrayContainsKey!0 (array!21637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372924 (= res!209935 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!372925 () Bool)

(declare-fun res!209934 () Bool)

(assert (=> b!372925 (=> (not res!209934) (not e!227400))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372925 (= res!209934 (validKeyInArray!0 k0!778))))

(declare-fun b!372926 () Bool)

(declare-fun res!209936 () Bool)

(assert (=> b!372926 (=> (not res!209936) (not e!227400))))

(assert (=> b!372926 (= res!209936 (and (= (size!10638 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10639 _keys!658) (size!10638 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372927 () Bool)

(declare-fun res!209932 () Bool)

(assert (=> b!372927 (=> (not res!209932) (not e!227400))))

(declare-datatypes ((List!5771 0))(
  ( (Nil!5768) (Cons!5767 (h!6623 (_ BitVec 64)) (t!10921 List!5771)) )
))
(declare-fun arrayNoDuplicates!0 (array!21637 (_ BitVec 32) List!5771) Bool)

(assert (=> b!372927 (= res!209932 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5768))))

(declare-fun b!372928 () Bool)

(declare-fun res!209937 () Bool)

(assert (=> b!372928 (=> (not res!209937) (not e!227400))))

(assert (=> b!372928 (= res!209937 (or (= (select (arr!10287 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10287 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372929 () Bool)

(declare-fun res!209930 () Bool)

(assert (=> b!372929 (=> (not res!209930) (not e!227405))))

(assert (=> b!372929 (= res!209930 (arrayNoDuplicates!0 lt!171009 #b00000000000000000000000000000000 Nil!5768))))

(declare-fun b!372930 () Bool)

(declare-fun e!227402 () Bool)

(assert (=> b!372930 (= e!227402 tp_is_empty!8847)))

(declare-fun b!372931 () Bool)

(assert (=> b!372931 (= e!227401 (and e!227402 mapRes!14835))))

(declare-fun condMapEmpty!14835 () Bool)

(declare-fun mapDefault!14835 () ValueCell!4080)

(assert (=> b!372931 (= condMapEmpty!14835 (= (arr!10286 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4080)) mapDefault!14835)))))

(declare-fun b!372932 () Bool)

(declare-fun res!209933 () Bool)

(assert (=> b!372932 (=> (not res!209933) (not e!227400))))

(assert (=> b!372932 (= res!209933 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10639 _keys!658))))))

(assert (= (and start!37072 res!209938) b!372926))

(assert (= (and b!372926 res!209936) b!372921))

(assert (= (and b!372921 res!209939) b!372927))

(assert (= (and b!372927 res!209932) b!372932))

(assert (= (and b!372932 res!209933) b!372925))

(assert (= (and b!372925 res!209934) b!372928))

(assert (= (and b!372928 res!209937) b!372924))

(assert (= (and b!372924 res!209935) b!372923))

(assert (= (and b!372923 res!209931) b!372929))

(assert (= (and b!372929 res!209930) b!372922))

(assert (= (and b!372931 condMapEmpty!14835) mapIsEmpty!14835))

(assert (= (and b!372931 (not condMapEmpty!14835)) mapNonEmpty!14835))

(get-info :version)

(assert (= (and mapNonEmpty!14835 ((_ is ValueCellFull!4080) mapValue!14835)) b!372920))

(assert (= (and b!372931 ((_ is ValueCellFull!4080) mapDefault!14835)) b!372930))

(assert (= start!37072 b!372931))

(declare-fun m!368751 () Bool)

(assert (=> b!372922 m!368751))

(declare-fun m!368753 () Bool)

(assert (=> b!372922 m!368753))

(declare-fun m!368755 () Bool)

(assert (=> b!372922 m!368755))

(declare-fun m!368757 () Bool)

(assert (=> b!372922 m!368757))

(declare-fun m!368759 () Bool)

(assert (=> b!372922 m!368759))

(declare-fun m!368761 () Bool)

(assert (=> b!372922 m!368761))

(declare-fun m!368763 () Bool)

(assert (=> b!372927 m!368763))

(declare-fun m!368765 () Bool)

(assert (=> start!37072 m!368765))

(declare-fun m!368767 () Bool)

(assert (=> start!37072 m!368767))

(declare-fun m!368769 () Bool)

(assert (=> start!37072 m!368769))

(declare-fun m!368771 () Bool)

(assert (=> b!372925 m!368771))

(declare-fun m!368773 () Bool)

(assert (=> b!372921 m!368773))

(declare-fun m!368775 () Bool)

(assert (=> b!372923 m!368775))

(declare-fun m!368777 () Bool)

(assert (=> b!372923 m!368777))

(declare-fun m!368779 () Bool)

(assert (=> b!372929 m!368779))

(declare-fun m!368781 () Bool)

(assert (=> b!372924 m!368781))

(declare-fun m!368783 () Bool)

(assert (=> mapNonEmpty!14835 m!368783))

(declare-fun m!368785 () Bool)

(assert (=> b!372928 m!368785))

(check-sat (not b!372927) (not b!372922) (not start!37072) (not b!372923) (not b!372924) (not b!372925) (not b_next!8199) (not b!372921) (not mapNonEmpty!14835) b_and!15441 (not b!372929) tp_is_empty!8847)
(check-sat b_and!15441 (not b_next!8199))
