; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19984 () Bool)

(assert start!19984)

(declare-fun mapIsEmpty!7847 () Bool)

(declare-fun mapRes!7847 () Bool)

(assert (=> mapIsEmpty!7847 mapRes!7847))

(declare-fun mapNonEmpty!7847 () Bool)

(declare-fun tp!17135 () Bool)

(declare-fun e!128946 () Bool)

(assert (=> mapNonEmpty!7847 (= mapRes!7847 (and tp!17135 e!128946))))

(declare-fun mapKey!7847 () (_ BitVec 32))

(declare-datatypes ((V!5681 0))(
  ( (V!5682 (val!2307 Int)) )
))
(declare-datatypes ((ValueCell!1919 0))(
  ( (ValueCellFull!1919 (v!4277 V!5681)) (EmptyCell!1919) )
))
(declare-fun mapValue!7847 () ValueCell!1919)

(declare-datatypes ((array!8295 0))(
  ( (array!8296 (arr!3901 (Array (_ BitVec 32) ValueCell!1919)) (size!4226 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8295)

(declare-fun mapRest!7847 () (Array (_ BitVec 32) ValueCell!1919))

(assert (=> mapNonEmpty!7847 (= (arr!3901 _values!649) (store mapRest!7847 mapKey!7847 mapValue!7847))))

(declare-fun b!195912 () Bool)

(declare-fun e!128949 () Bool)

(declare-fun tp_is_empty!4525 () Bool)

(assert (=> b!195912 (= e!128949 tp_is_empty!4525)))

(declare-fun b!195913 () Bool)

(declare-fun res!92435 () Bool)

(declare-fun e!128948 () Bool)

(assert (=> b!195913 (=> (not res!92435) (not e!128948))))

(declare-datatypes ((array!8297 0))(
  ( (array!8298 (arr!3902 (Array (_ BitVec 32) (_ BitVec 64))) (size!4227 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8297)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8297 (_ BitVec 32)) Bool)

(assert (=> b!195913 (= res!92435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!195914 () Bool)

(declare-fun e!128947 () Bool)

(assert (=> b!195914 (= e!128947 (and e!128949 mapRes!7847))))

(declare-fun condMapEmpty!7847 () Bool)

(declare-fun mapDefault!7847 () ValueCell!1919)

(assert (=> b!195914 (= condMapEmpty!7847 (= (arr!3901 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1919)) mapDefault!7847)))))

(declare-fun b!195915 () Bool)

(assert (=> b!195915 (= e!128948 (and (bvsle #b00000000000000000000000000000000 (size!4227 _keys!825)) (bvsge (size!4227 _keys!825) #b01111111111111111111111111111111)))))

(declare-fun b!195916 () Bool)

(assert (=> b!195916 (= e!128946 tp_is_empty!4525)))

(declare-fun res!92433 () Bool)

(assert (=> start!19984 (=> (not res!92433) (not e!128948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!19984 (= res!92433 (validMask!0 mask!1149))))

(assert (=> start!19984 e!128948))

(assert (=> start!19984 true))

(declare-fun array_inv!2523 (array!8295) Bool)

(assert (=> start!19984 (and (array_inv!2523 _values!649) e!128947)))

(declare-fun array_inv!2524 (array!8297) Bool)

(assert (=> start!19984 (array_inv!2524 _keys!825)))

(declare-fun b!195917 () Bool)

(declare-fun res!92434 () Bool)

(assert (=> b!195917 (=> (not res!92434) (not e!128948))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!195917 (= res!92434 (and (= (size!4226 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4227 _keys!825) (size!4226 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!19984 res!92433) b!195917))

(assert (= (and b!195917 res!92434) b!195913))

(assert (= (and b!195913 res!92435) b!195915))

(assert (= (and b!195914 condMapEmpty!7847) mapIsEmpty!7847))

(assert (= (and b!195914 (not condMapEmpty!7847)) mapNonEmpty!7847))

(get-info :version)

(assert (= (and mapNonEmpty!7847 ((_ is ValueCellFull!1919) mapValue!7847)) b!195916))

(assert (= (and b!195914 ((_ is ValueCellFull!1919) mapDefault!7847)) b!195912))

(assert (= start!19984 b!195914))

(declare-fun m!223527 () Bool)

(assert (=> mapNonEmpty!7847 m!223527))

(declare-fun m!223529 () Bool)

(assert (=> b!195913 m!223529))

(declare-fun m!223531 () Bool)

(assert (=> start!19984 m!223531))

(declare-fun m!223533 () Bool)

(assert (=> start!19984 m!223533))

(declare-fun m!223535 () Bool)

(assert (=> start!19984 m!223535))

(check-sat (not start!19984) (not b!195913) (not mapNonEmpty!7847) tp_is_empty!4525)
(check-sat)
(get-model)

(declare-fun d!57617 () Bool)

(assert (=> d!57617 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!19984 d!57617))

(declare-fun d!57619 () Bool)

(assert (=> d!57619 (= (array_inv!2523 _values!649) (bvsge (size!4226 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!19984 d!57619))

(declare-fun d!57621 () Bool)

(assert (=> d!57621 (= (array_inv!2524 _keys!825) (bvsge (size!4227 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!19984 d!57621))

(declare-fun b!195962 () Bool)

(declare-fun e!128988 () Bool)

(declare-fun e!128987 () Bool)

(assert (=> b!195962 (= e!128988 e!128987)))

(declare-fun lt!97601 () (_ BitVec 64))

(assert (=> b!195962 (= lt!97601 (select (arr!3902 _keys!825) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5924 0))(
  ( (Unit!5925) )
))
(declare-fun lt!97602 () Unit!5924)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8297 (_ BitVec 64) (_ BitVec 32)) Unit!5924)

(assert (=> b!195962 (= lt!97602 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!97601 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8297 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!195962 (arrayContainsKey!0 _keys!825 lt!97601 #b00000000000000000000000000000000)))

(declare-fun lt!97603 () Unit!5924)

(assert (=> b!195962 (= lt!97603 lt!97602)))

(declare-fun res!92459 () Bool)

(declare-datatypes ((SeekEntryResult!690 0))(
  ( (MissingZero!690 (index!4930 (_ BitVec 32))) (Found!690 (index!4931 (_ BitVec 32))) (Intermediate!690 (undefined!1502 Bool) (index!4932 (_ BitVec 32)) (x!20801 (_ BitVec 32))) (Undefined!690) (MissingVacant!690 (index!4933 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8297 (_ BitVec 32)) SeekEntryResult!690)

(assert (=> b!195962 (= res!92459 (= (seekEntryOrOpen!0 (select (arr!3902 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!690 #b00000000000000000000000000000000)))))

(assert (=> b!195962 (=> (not res!92459) (not e!128987))))

(declare-fun b!195963 () Bool)

(declare-fun call!19758 () Bool)

(assert (=> b!195963 (= e!128987 call!19758)))

(declare-fun d!57623 () Bool)

(declare-fun res!92458 () Bool)

(declare-fun e!128986 () Bool)

(assert (=> d!57623 (=> res!92458 e!128986)))

(assert (=> d!57623 (= res!92458 (bvsge #b00000000000000000000000000000000 (size!4227 _keys!825)))))

(assert (=> d!57623 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!128986)))

(declare-fun bm!19755 () Bool)

(assert (=> bm!19755 (= call!19758 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!195964 () Bool)

(assert (=> b!195964 (= e!128988 call!19758)))

(declare-fun b!195965 () Bool)

(assert (=> b!195965 (= e!128986 e!128988)))

(declare-fun c!35442 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!195965 (= c!35442 (validKeyInArray!0 (select (arr!3902 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!57623 (not res!92458)) b!195965))

(assert (= (and b!195965 c!35442) b!195962))

(assert (= (and b!195965 (not c!35442)) b!195964))

(assert (= (and b!195962 res!92459) b!195963))

(assert (= (or b!195963 b!195964) bm!19755))

(declare-fun m!223557 () Bool)

(assert (=> b!195962 m!223557))

(declare-fun m!223559 () Bool)

(assert (=> b!195962 m!223559))

(declare-fun m!223561 () Bool)

(assert (=> b!195962 m!223561))

(assert (=> b!195962 m!223557))

(declare-fun m!223563 () Bool)

(assert (=> b!195962 m!223563))

(declare-fun m!223565 () Bool)

(assert (=> bm!19755 m!223565))

(assert (=> b!195965 m!223557))

(assert (=> b!195965 m!223557))

(declare-fun m!223567 () Bool)

(assert (=> b!195965 m!223567))

(assert (=> b!195913 d!57623))

(declare-fun condMapEmpty!7856 () Bool)

(declare-fun mapDefault!7856 () ValueCell!1919)

(assert (=> mapNonEmpty!7847 (= condMapEmpty!7856 (= mapRest!7847 ((as const (Array (_ BitVec 32) ValueCell!1919)) mapDefault!7856)))))

(declare-fun e!128993 () Bool)

(declare-fun mapRes!7856 () Bool)

(assert (=> mapNonEmpty!7847 (= tp!17135 (and e!128993 mapRes!7856))))

(declare-fun mapIsEmpty!7856 () Bool)

(assert (=> mapIsEmpty!7856 mapRes!7856))

(declare-fun mapNonEmpty!7856 () Bool)

(declare-fun tp!17144 () Bool)

(declare-fun e!128994 () Bool)

(assert (=> mapNonEmpty!7856 (= mapRes!7856 (and tp!17144 e!128994))))

(declare-fun mapValue!7856 () ValueCell!1919)

(declare-fun mapRest!7856 () (Array (_ BitVec 32) ValueCell!1919))

(declare-fun mapKey!7856 () (_ BitVec 32))

(assert (=> mapNonEmpty!7856 (= mapRest!7847 (store mapRest!7856 mapKey!7856 mapValue!7856))))

(declare-fun b!195973 () Bool)

(assert (=> b!195973 (= e!128993 tp_is_empty!4525)))

(declare-fun b!195972 () Bool)

(assert (=> b!195972 (= e!128994 tp_is_empty!4525)))

(assert (= (and mapNonEmpty!7847 condMapEmpty!7856) mapIsEmpty!7856))

(assert (= (and mapNonEmpty!7847 (not condMapEmpty!7856)) mapNonEmpty!7856))

(assert (= (and mapNonEmpty!7856 ((_ is ValueCellFull!1919) mapValue!7856)) b!195972))

(assert (= (and mapNonEmpty!7847 ((_ is ValueCellFull!1919) mapDefault!7856)) b!195973))

(declare-fun m!223569 () Bool)

(assert (=> mapNonEmpty!7856 m!223569))

(check-sat (not b!195965) (not bm!19755) (not mapNonEmpty!7856) (not b!195962) tp_is_empty!4525)
(check-sat)
