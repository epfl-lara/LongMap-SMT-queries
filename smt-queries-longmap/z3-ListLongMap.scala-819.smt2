; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19984 () Bool)

(assert start!19984)

(declare-fun b!195718 () Bool)

(declare-fun res!92317 () Bool)

(declare-fun e!128824 () Bool)

(assert (=> b!195718 (=> (not res!92317) (not e!128824))))

(declare-datatypes ((array!8289 0))(
  ( (array!8290 (arr!3897 (Array (_ BitVec 32) (_ BitVec 64))) (size!4223 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8289)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8289 (_ BitVec 32)) Bool)

(assert (=> b!195718 (= res!92317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!7847 () Bool)

(declare-fun mapRes!7847 () Bool)

(assert (=> mapIsEmpty!7847 mapRes!7847))

(declare-fun b!195719 () Bool)

(declare-fun res!92319 () Bool)

(assert (=> b!195719 (=> (not res!92319) (not e!128824))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5681 0))(
  ( (V!5682 (val!2307 Int)) )
))
(declare-datatypes ((ValueCell!1919 0))(
  ( (ValueCellFull!1919 (v!4270 V!5681)) (EmptyCell!1919) )
))
(declare-datatypes ((array!8291 0))(
  ( (array!8292 (arr!3898 (Array (_ BitVec 32) ValueCell!1919)) (size!4224 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8291)

(assert (=> b!195719 (= res!92319 (and (= (size!4224 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4223 _keys!825) (size!4224 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!195720 () Bool)

(assert (=> b!195720 (= e!128824 (and (bvsle #b00000000000000000000000000000000 (size!4223 _keys!825)) (bvsge (size!4223 _keys!825) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!7847 () Bool)

(declare-fun tp!17135 () Bool)

(declare-fun e!128821 () Bool)

(assert (=> mapNonEmpty!7847 (= mapRes!7847 (and tp!17135 e!128821))))

(declare-fun mapRest!7847 () (Array (_ BitVec 32) ValueCell!1919))

(declare-fun mapValue!7847 () ValueCell!1919)

(declare-fun mapKey!7847 () (_ BitVec 32))

(assert (=> mapNonEmpty!7847 (= (arr!3898 _values!649) (store mapRest!7847 mapKey!7847 mapValue!7847))))

(declare-fun b!195722 () Bool)

(declare-fun e!128823 () Bool)

(declare-fun e!128820 () Bool)

(assert (=> b!195722 (= e!128823 (and e!128820 mapRes!7847))))

(declare-fun condMapEmpty!7847 () Bool)

(declare-fun mapDefault!7847 () ValueCell!1919)

(assert (=> b!195722 (= condMapEmpty!7847 (= (arr!3898 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1919)) mapDefault!7847)))))

(declare-fun b!195723 () Bool)

(declare-fun tp_is_empty!4525 () Bool)

(assert (=> b!195723 (= e!128821 tp_is_empty!4525)))

(declare-fun res!92318 () Bool)

(assert (=> start!19984 (=> (not res!92318) (not e!128824))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19984 (= res!92318 (validMask!0 mask!1149))))

(assert (=> start!19984 e!128824))

(assert (=> start!19984 true))

(declare-fun array_inv!2525 (array!8291) Bool)

(assert (=> start!19984 (and (array_inv!2525 _values!649) e!128823)))

(declare-fun array_inv!2526 (array!8289) Bool)

(assert (=> start!19984 (array_inv!2526 _keys!825)))

(declare-fun b!195721 () Bool)

(assert (=> b!195721 (= e!128820 tp_is_empty!4525)))

(assert (= (and start!19984 res!92318) b!195719))

(assert (= (and b!195719 res!92319) b!195718))

(assert (= (and b!195718 res!92317) b!195720))

(assert (= (and b!195722 condMapEmpty!7847) mapIsEmpty!7847))

(assert (= (and b!195722 (not condMapEmpty!7847)) mapNonEmpty!7847))

(get-info :version)

(assert (= (and mapNonEmpty!7847 ((_ is ValueCellFull!1919) mapValue!7847)) b!195723))

(assert (= (and b!195722 ((_ is ValueCellFull!1919) mapDefault!7847)) b!195721))

(assert (= start!19984 b!195722))

(declare-fun m!222729 () Bool)

(assert (=> b!195718 m!222729))

(declare-fun m!222731 () Bool)

(assert (=> mapNonEmpty!7847 m!222731))

(declare-fun m!222733 () Bool)

(assert (=> start!19984 m!222733))

(declare-fun m!222735 () Bool)

(assert (=> start!19984 m!222735))

(declare-fun m!222737 () Bool)

(assert (=> start!19984 m!222737))

(check-sat (not b!195718) (not start!19984) (not mapNonEmpty!7847) tp_is_empty!4525)
(check-sat)
(get-model)

(declare-fun b!195768 () Bool)

(declare-fun e!128863 () Bool)

(declare-fun e!128861 () Bool)

(assert (=> b!195768 (= e!128863 e!128861)))

(declare-fun c!35403 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!195768 (= c!35403 (validKeyInArray!0 (select (arr!3897 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19743 () Bool)

(declare-fun call!19746 () Bool)

(assert (=> bm!19743 (= call!19746 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!195769 () Bool)

(declare-fun e!128862 () Bool)

(assert (=> b!195769 (= e!128862 call!19746)))

(declare-fun b!195770 () Bool)

(assert (=> b!195770 (= e!128861 e!128862)))

(declare-fun lt!97363 () (_ BitVec 64))

(assert (=> b!195770 (= lt!97363 (select (arr!3897 _keys!825) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5888 0))(
  ( (Unit!5889) )
))
(declare-fun lt!97361 () Unit!5888)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8289 (_ BitVec 64) (_ BitVec 32)) Unit!5888)

(assert (=> b!195770 (= lt!97361 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!97363 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!195770 (arrayContainsKey!0 _keys!825 lt!97363 #b00000000000000000000000000000000)))

(declare-fun lt!97362 () Unit!5888)

(assert (=> b!195770 (= lt!97362 lt!97361)))

(declare-fun res!92343 () Bool)

(declare-datatypes ((SeekEntryResult!702 0))(
  ( (MissingZero!702 (index!4978 (_ BitVec 32))) (Found!702 (index!4979 (_ BitVec 32))) (Intermediate!702 (undefined!1514 Bool) (index!4980 (_ BitVec 32)) (x!20812 (_ BitVec 32))) (Undefined!702) (MissingVacant!702 (index!4981 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8289 (_ BitVec 32)) SeekEntryResult!702)

(assert (=> b!195770 (= res!92343 (= (seekEntryOrOpen!0 (select (arr!3897 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!702 #b00000000000000000000000000000000)))))

(assert (=> b!195770 (=> (not res!92343) (not e!128862))))

(declare-fun b!195771 () Bool)

(assert (=> b!195771 (= e!128861 call!19746)))

(declare-fun d!57395 () Bool)

(declare-fun res!92342 () Bool)

(assert (=> d!57395 (=> res!92342 e!128863)))

(assert (=> d!57395 (= res!92342 (bvsge #b00000000000000000000000000000000 (size!4223 _keys!825)))))

(assert (=> d!57395 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!128863)))

(assert (= (and d!57395 (not res!92342)) b!195768))

(assert (= (and b!195768 c!35403) b!195770))

(assert (= (and b!195768 (not c!35403)) b!195771))

(assert (= (and b!195770 res!92343) b!195769))

(assert (= (or b!195769 b!195771) bm!19743))

(declare-fun m!222759 () Bool)

(assert (=> b!195768 m!222759))

(assert (=> b!195768 m!222759))

(declare-fun m!222761 () Bool)

(assert (=> b!195768 m!222761))

(declare-fun m!222763 () Bool)

(assert (=> bm!19743 m!222763))

(assert (=> b!195770 m!222759))

(declare-fun m!222765 () Bool)

(assert (=> b!195770 m!222765))

(declare-fun m!222767 () Bool)

(assert (=> b!195770 m!222767))

(assert (=> b!195770 m!222759))

(declare-fun m!222769 () Bool)

(assert (=> b!195770 m!222769))

(assert (=> b!195718 d!57395))

(declare-fun d!57397 () Bool)

(assert (=> d!57397 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!19984 d!57397))

(declare-fun d!57399 () Bool)

(assert (=> d!57399 (= (array_inv!2525 _values!649) (bvsge (size!4224 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!19984 d!57399))

(declare-fun d!57401 () Bool)

(assert (=> d!57401 (= (array_inv!2526 _keys!825) (bvsge (size!4223 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!19984 d!57401))

(declare-fun b!195778 () Bool)

(declare-fun e!128869 () Bool)

(assert (=> b!195778 (= e!128869 tp_is_empty!4525)))

(declare-fun b!195779 () Bool)

(declare-fun e!128868 () Bool)

(assert (=> b!195779 (= e!128868 tp_is_empty!4525)))

(declare-fun mapNonEmpty!7856 () Bool)

(declare-fun mapRes!7856 () Bool)

(declare-fun tp!17144 () Bool)

(assert (=> mapNonEmpty!7856 (= mapRes!7856 (and tp!17144 e!128869))))

(declare-fun mapValue!7856 () ValueCell!1919)

(declare-fun mapKey!7856 () (_ BitVec 32))

(declare-fun mapRest!7856 () (Array (_ BitVec 32) ValueCell!1919))

(assert (=> mapNonEmpty!7856 (= mapRest!7847 (store mapRest!7856 mapKey!7856 mapValue!7856))))

(declare-fun mapIsEmpty!7856 () Bool)

(assert (=> mapIsEmpty!7856 mapRes!7856))

(declare-fun condMapEmpty!7856 () Bool)

(declare-fun mapDefault!7856 () ValueCell!1919)

(assert (=> mapNonEmpty!7847 (= condMapEmpty!7856 (= mapRest!7847 ((as const (Array (_ BitVec 32) ValueCell!1919)) mapDefault!7856)))))

(assert (=> mapNonEmpty!7847 (= tp!17135 (and e!128868 mapRes!7856))))

(assert (= (and mapNonEmpty!7847 condMapEmpty!7856) mapIsEmpty!7856))

(assert (= (and mapNonEmpty!7847 (not condMapEmpty!7856)) mapNonEmpty!7856))

(assert (= (and mapNonEmpty!7856 ((_ is ValueCellFull!1919) mapValue!7856)) b!195778))

(assert (= (and mapNonEmpty!7847 ((_ is ValueCellFull!1919) mapDefault!7856)) b!195779))

(declare-fun m!222771 () Bool)

(assert (=> mapNonEmpty!7856 m!222771))

(check-sat (not bm!19743) (not b!195770) (not mapNonEmpty!7856) (not b!195768) tp_is_empty!4525)
(check-sat)
