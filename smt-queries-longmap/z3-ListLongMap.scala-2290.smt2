; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37204 () Bool)

(assert start!37204)

(declare-fun b_free!8331 () Bool)

(declare-fun b_next!8331 () Bool)

(assert (=> start!37204 (= b_free!8331 (not b_next!8331))))

(declare-fun tp!29709 () Bool)

(declare-fun b_and!15573 () Bool)

(assert (=> start!37204 (= tp!29709 b_and!15573)))

(declare-fun b!375891 () Bool)

(declare-fun e!228968 () Bool)

(assert (=> b!375891 (= e!228968 true)))

(declare-datatypes ((V!13077 0))(
  ( (V!13078 (val!4534 Int)) )
))
(declare-datatypes ((tuple2!6036 0))(
  ( (tuple2!6037 (_1!3029 (_ BitVec 64)) (_2!3029 V!13077)) )
))
(declare-datatypes ((List!5877 0))(
  ( (Nil!5874) (Cons!5873 (h!6729 tuple2!6036) (t!11027 List!5877)) )
))
(declare-datatypes ((ListLongMap!4949 0))(
  ( (ListLongMap!4950 (toList!2490 List!5877)) )
))
(declare-fun lt!174161 () ListLongMap!4949)

(declare-fun lt!174154 () ListLongMap!4949)

(declare-fun lt!174159 () tuple2!6036)

(declare-fun +!836 (ListLongMap!4949 tuple2!6036) ListLongMap!4949)

(assert (=> b!375891 (= lt!174161 (+!836 lt!174154 lt!174159))))

(declare-fun v!373 () V!13077)

(declare-fun lt!174156 () ListLongMap!4949)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun zeroValue!472 () V!13077)

(declare-datatypes ((Unit!11578 0))(
  ( (Unit!11579) )
))
(declare-fun lt!174165 () Unit!11578)

(declare-fun addCommutativeForDiffKeys!252 (ListLongMap!4949 (_ BitVec 64) V!13077 (_ BitVec 64) V!13077) Unit!11578)

(assert (=> b!375891 (= lt!174165 (addCommutativeForDiffKeys!252 lt!174156 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun res!212318 () Bool)

(declare-fun e!228973 () Bool)

(assert (=> start!37204 (=> (not res!212318) (not e!228973))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37204 (= res!212318 (validMask!0 mask!970))))

(assert (=> start!37204 e!228973))

(declare-datatypes ((ValueCell!4146 0))(
  ( (ValueCellFull!4146 (v!6731 V!13077)) (EmptyCell!4146) )
))
(declare-datatypes ((array!21891 0))(
  ( (array!21892 (arr!10414 (Array (_ BitVec 32) ValueCell!4146)) (size!10766 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21891)

(declare-fun e!228969 () Bool)

(declare-fun array_inv!7676 (array!21891) Bool)

(assert (=> start!37204 (and (array_inv!7676 _values!506) e!228969)))

(assert (=> start!37204 tp!29709))

(assert (=> start!37204 true))

(declare-fun tp_is_empty!8979 () Bool)

(assert (=> start!37204 tp_is_empty!8979))

(declare-datatypes ((array!21893 0))(
  ( (array!21894 (arr!10415 (Array (_ BitVec 32) (_ BitVec 64))) (size!10767 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21893)

(declare-fun array_inv!7677 (array!21893) Bool)

(assert (=> start!37204 (array_inv!7677 _keys!658)))

(declare-fun b!375892 () Bool)

(declare-fun e!228970 () Bool)

(declare-fun mapRes!15033 () Bool)

(assert (=> b!375892 (= e!228969 (and e!228970 mapRes!15033))))

(declare-fun condMapEmpty!15033 () Bool)

(declare-fun mapDefault!15033 () ValueCell!4146)

(assert (=> b!375892 (= condMapEmpty!15033 (= (arr!10414 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4146)) mapDefault!15033)))))

(declare-fun b!375893 () Bool)

(declare-fun res!212307 () Bool)

(assert (=> b!375893 (=> (not res!212307) (not e!228973))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375893 (= res!212307 (or (= (select (arr!10415 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10415 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375894 () Bool)

(declare-fun e!228971 () Bool)

(declare-fun e!228972 () Bool)

(assert (=> b!375894 (= e!228971 (not e!228972))))

(declare-fun res!212316 () Bool)

(assert (=> b!375894 (=> res!212316 e!228972)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375894 (= res!212316 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!174162 () ListLongMap!4949)

(declare-fun minValue!472 () V!13077)

(declare-fun getCurrentListMap!1924 (array!21893 array!21891 (_ BitVec 32) (_ BitVec 32) V!13077 V!13077 (_ BitVec 32) Int) ListLongMap!4949)

(assert (=> b!375894 (= lt!174162 (getCurrentListMap!1924 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174160 () array!21893)

(declare-fun lt!174163 () ListLongMap!4949)

(declare-fun lt!174153 () array!21891)

(assert (=> b!375894 (= lt!174163 (getCurrentListMap!1924 lt!174160 lt!174153 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174155 () ListLongMap!4949)

(declare-fun lt!174164 () ListLongMap!4949)

(assert (=> b!375894 (and (= lt!174155 lt!174164) (= lt!174164 lt!174155))))

(assert (=> b!375894 (= lt!174164 (+!836 lt!174156 lt!174159))))

(assert (=> b!375894 (= lt!174159 (tuple2!6037 k0!778 v!373))))

(declare-fun lt!174158 () Unit!11578)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!82 (array!21893 array!21891 (_ BitVec 32) (_ BitVec 32) V!13077 V!13077 (_ BitVec 32) (_ BitVec 64) V!13077 (_ BitVec 32) Int) Unit!11578)

(assert (=> b!375894 (= lt!174158 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!82 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!758 (array!21893 array!21891 (_ BitVec 32) (_ BitVec 32) V!13077 V!13077 (_ BitVec 32) Int) ListLongMap!4949)

(assert (=> b!375894 (= lt!174155 (getCurrentListMapNoExtraKeys!758 lt!174160 lt!174153 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375894 (= lt!174153 (array!21892 (store (arr!10414 _values!506) i!548 (ValueCellFull!4146 v!373)) (size!10766 _values!506)))))

(assert (=> b!375894 (= lt!174156 (getCurrentListMapNoExtraKeys!758 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375895 () Bool)

(declare-fun res!212310 () Bool)

(assert (=> b!375895 (=> (not res!212310) (not e!228973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21893 (_ BitVec 32)) Bool)

(assert (=> b!375895 (= res!212310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375896 () Bool)

(declare-fun res!212311 () Bool)

(assert (=> b!375896 (=> (not res!212311) (not e!228973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375896 (= res!212311 (validKeyInArray!0 k0!778))))

(declare-fun b!375897 () Bool)

(declare-fun res!212309 () Bool)

(assert (=> b!375897 (=> (not res!212309) (not e!228973))))

(assert (=> b!375897 (= res!212309 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10767 _keys!658))))))

(declare-fun mapNonEmpty!15033 () Bool)

(declare-fun tp!29708 () Bool)

(declare-fun e!228974 () Bool)

(assert (=> mapNonEmpty!15033 (= mapRes!15033 (and tp!29708 e!228974))))

(declare-fun mapKey!15033 () (_ BitVec 32))

(declare-fun mapRest!15033 () (Array (_ BitVec 32) ValueCell!4146))

(declare-fun mapValue!15033 () ValueCell!4146)

(assert (=> mapNonEmpty!15033 (= (arr!10414 _values!506) (store mapRest!15033 mapKey!15033 mapValue!15033))))

(declare-fun b!375898 () Bool)

(assert (=> b!375898 (= e!228974 tp_is_empty!8979)))

(declare-fun b!375899 () Bool)

(declare-fun res!212315 () Bool)

(assert (=> b!375899 (=> (not res!212315) (not e!228973))))

(declare-datatypes ((List!5878 0))(
  ( (Nil!5875) (Cons!5874 (h!6730 (_ BitVec 64)) (t!11028 List!5878)) )
))
(declare-fun arrayNoDuplicates!0 (array!21893 (_ BitVec 32) List!5878) Bool)

(assert (=> b!375899 (= res!212315 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5875))))

(declare-fun b!375900 () Bool)

(assert (=> b!375900 (= e!228970 tp_is_empty!8979)))

(declare-fun b!375901 () Bool)

(declare-fun res!212308 () Bool)

(assert (=> b!375901 (=> (not res!212308) (not e!228971))))

(assert (=> b!375901 (= res!212308 (arrayNoDuplicates!0 lt!174160 #b00000000000000000000000000000000 Nil!5875))))

(declare-fun b!375902 () Bool)

(assert (=> b!375902 (= e!228973 e!228971)))

(declare-fun res!212314 () Bool)

(assert (=> b!375902 (=> (not res!212314) (not e!228971))))

(assert (=> b!375902 (= res!212314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!174160 mask!970))))

(assert (=> b!375902 (= lt!174160 (array!21894 (store (arr!10415 _keys!658) i!548 k0!778) (size!10767 _keys!658)))))

(declare-fun b!375903 () Bool)

(declare-fun res!212317 () Bool)

(assert (=> b!375903 (=> (not res!212317) (not e!228973))))

(assert (=> b!375903 (= res!212317 (and (= (size!10766 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10767 _keys!658) (size!10766 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15033 () Bool)

(assert (=> mapIsEmpty!15033 mapRes!15033))

(declare-fun b!375904 () Bool)

(assert (=> b!375904 (= e!228972 e!228968)))

(declare-fun res!212312 () Bool)

(assert (=> b!375904 (=> res!212312 e!228968)))

(assert (=> b!375904 (= res!212312 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!375904 (= lt!174163 lt!174161)))

(declare-fun lt!174157 () tuple2!6036)

(assert (=> b!375904 (= lt!174161 (+!836 lt!174164 lt!174157))))

(assert (=> b!375904 (= lt!174162 lt!174154)))

(assert (=> b!375904 (= lt!174154 (+!836 lt!174156 lt!174157))))

(assert (=> b!375904 (= lt!174163 (+!836 lt!174155 lt!174157))))

(assert (=> b!375904 (= lt!174157 (tuple2!6037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375905 () Bool)

(declare-fun res!212313 () Bool)

(assert (=> b!375905 (=> (not res!212313) (not e!228973))))

(declare-fun arrayContainsKey!0 (array!21893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375905 (= res!212313 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37204 res!212318) b!375903))

(assert (= (and b!375903 res!212317) b!375895))

(assert (= (and b!375895 res!212310) b!375899))

(assert (= (and b!375899 res!212315) b!375897))

(assert (= (and b!375897 res!212309) b!375896))

(assert (= (and b!375896 res!212311) b!375893))

(assert (= (and b!375893 res!212307) b!375905))

(assert (= (and b!375905 res!212313) b!375902))

(assert (= (and b!375902 res!212314) b!375901))

(assert (= (and b!375901 res!212308) b!375894))

(assert (= (and b!375894 (not res!212316)) b!375904))

(assert (= (and b!375904 (not res!212312)) b!375891))

(assert (= (and b!375892 condMapEmpty!15033) mapIsEmpty!15033))

(assert (= (and b!375892 (not condMapEmpty!15033)) mapNonEmpty!15033))

(get-info :version)

(assert (= (and mapNonEmpty!15033 ((_ is ValueCellFull!4146) mapValue!15033)) b!375898))

(assert (= (and b!375892 ((_ is ValueCellFull!4146) mapDefault!15033)) b!375900))

(assert (= start!37204 b!375892))

(declare-fun m!372555 () Bool)

(assert (=> b!375891 m!372555))

(declare-fun m!372557 () Bool)

(assert (=> b!375891 m!372557))

(declare-fun m!372559 () Bool)

(assert (=> start!37204 m!372559))

(declare-fun m!372561 () Bool)

(assert (=> start!37204 m!372561))

(declare-fun m!372563 () Bool)

(assert (=> start!37204 m!372563))

(declare-fun m!372565 () Bool)

(assert (=> b!375899 m!372565))

(declare-fun m!372567 () Bool)

(assert (=> mapNonEmpty!15033 m!372567))

(declare-fun m!372569 () Bool)

(assert (=> b!375896 m!372569))

(declare-fun m!372571 () Bool)

(assert (=> b!375894 m!372571))

(declare-fun m!372573 () Bool)

(assert (=> b!375894 m!372573))

(declare-fun m!372575 () Bool)

(assert (=> b!375894 m!372575))

(declare-fun m!372577 () Bool)

(assert (=> b!375894 m!372577))

(declare-fun m!372579 () Bool)

(assert (=> b!375894 m!372579))

(declare-fun m!372581 () Bool)

(assert (=> b!375894 m!372581))

(declare-fun m!372583 () Bool)

(assert (=> b!375894 m!372583))

(declare-fun m!372585 () Bool)

(assert (=> b!375901 m!372585))

(declare-fun m!372587 () Bool)

(assert (=> b!375904 m!372587))

(declare-fun m!372589 () Bool)

(assert (=> b!375904 m!372589))

(declare-fun m!372591 () Bool)

(assert (=> b!375904 m!372591))

(declare-fun m!372593 () Bool)

(assert (=> b!375895 m!372593))

(declare-fun m!372595 () Bool)

(assert (=> b!375905 m!372595))

(declare-fun m!372597 () Bool)

(assert (=> b!375893 m!372597))

(declare-fun m!372599 () Bool)

(assert (=> b!375902 m!372599))

(declare-fun m!372601 () Bool)

(assert (=> b!375902 m!372601))

(check-sat (not b!375901) (not b!375904) b_and!15573 tp_is_empty!8979 (not b_next!8331) (not b!375899) (not b!375902) (not b!375895) (not b!375896) (not mapNonEmpty!15033) (not b!375891) (not b!375894) (not start!37204) (not b!375905))
(check-sat b_and!15573 (not b_next!8331))
