; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108524 () Bool)

(assert start!108524)

(declare-fun b!1279729 () Bool)

(declare-fun e!731119 () Bool)

(declare-datatypes ((List!28776 0))(
  ( (Nil!28773) (Cons!28772 (h!29990 (_ BitVec 64)) (t!42308 List!28776)) )
))
(declare-fun contains!7767 (List!28776 (_ BitVec 64)) Bool)

(assert (=> b!1279729 (= e!731119 (contains!7767 Nil!28773 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!51797 () Bool)

(declare-fun mapRes!51797 () Bool)

(assert (=> mapIsEmpty!51797 mapRes!51797))

(declare-fun b!1279730 () Bool)

(declare-fun e!731118 () Bool)

(declare-fun tp_is_empty!33499 () Bool)

(assert (=> b!1279730 (= e!731118 tp_is_empty!33499)))

(declare-fun b!1279731 () Bool)

(declare-fun res!849849 () Bool)

(declare-fun e!731120 () Bool)

(assert (=> b!1279731 (=> (not res!849849) (not e!731120))))

(declare-datatypes ((array!84123 0))(
  ( (array!84124 (arr!40562 (Array (_ BitVec 32) (_ BitVec 64))) (size!41113 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84123)

(assert (=> b!1279731 (= res!849849 (and (bvsle #b00000000000000000000000000000000 (size!41113 _keys!1741)) (bvslt (size!41113 _keys!1741) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!51797 () Bool)

(declare-fun tp!98771 () Bool)

(declare-fun e!731122 () Bool)

(assert (=> mapNonEmpty!51797 (= mapRes!51797 (and tp!98771 e!731122))))

(declare-datatypes ((V!49769 0))(
  ( (V!49770 (val!16824 Int)) )
))
(declare-datatypes ((ValueCell!15851 0))(
  ( (ValueCellFull!15851 (v!19418 V!49769)) (EmptyCell!15851) )
))
(declare-fun mapValue!51797 () ValueCell!15851)

(declare-datatypes ((array!84125 0))(
  ( (array!84126 (arr!40563 (Array (_ BitVec 32) ValueCell!15851)) (size!41114 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84125)

(declare-fun mapRest!51797 () (Array (_ BitVec 32) ValueCell!15851))

(declare-fun mapKey!51797 () (_ BitVec 32))

(assert (=> mapNonEmpty!51797 (= (arr!40563 _values!1445) (store mapRest!51797 mapKey!51797 mapValue!51797))))

(declare-fun b!1279732 () Bool)

(declare-fun res!849850 () Bool)

(assert (=> b!1279732 (=> (not res!849850) (not e!731120))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279732 (= res!849850 (and (= (size!41114 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41113 _keys!1741) (size!41114 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1279733 () Bool)

(assert (=> b!1279733 (= e!731122 tp_is_empty!33499)))

(declare-fun b!1279734 () Bool)

(declare-fun res!849853 () Bool)

(assert (=> b!1279734 (=> (not res!849853) (not e!731120))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84123 (_ BitVec 32)) Bool)

(assert (=> b!1279734 (= res!849853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!849852 () Bool)

(assert (=> start!108524 (=> (not res!849852) (not e!731120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108524 (= res!849852 (validMask!0 mask!2175))))

(assert (=> start!108524 e!731120))

(assert (=> start!108524 true))

(declare-fun e!731121 () Bool)

(declare-fun array_inv!31001 (array!84125) Bool)

(assert (=> start!108524 (and (array_inv!31001 _values!1445) e!731121)))

(declare-fun array_inv!31002 (array!84123) Bool)

(assert (=> start!108524 (array_inv!31002 _keys!1741)))

(declare-fun b!1279735 () Bool)

(declare-fun res!849851 () Bool)

(assert (=> b!1279735 (=> (not res!849851) (not e!731120))))

(declare-fun noDuplicate!2070 (List!28776) Bool)

(assert (=> b!1279735 (= res!849851 (noDuplicate!2070 Nil!28773))))

(declare-fun b!1279736 () Bool)

(assert (=> b!1279736 (= e!731120 e!731119)))

(declare-fun res!849848 () Bool)

(assert (=> b!1279736 (=> res!849848 e!731119)))

(assert (=> b!1279736 (= res!849848 (contains!7767 Nil!28773 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1279737 () Bool)

(assert (=> b!1279737 (= e!731121 (and e!731118 mapRes!51797))))

(declare-fun condMapEmpty!51797 () Bool)

(declare-fun mapDefault!51797 () ValueCell!15851)

(assert (=> b!1279737 (= condMapEmpty!51797 (= (arr!40563 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15851)) mapDefault!51797)))))

(assert (= (and start!108524 res!849852) b!1279732))

(assert (= (and b!1279732 res!849850) b!1279734))

(assert (= (and b!1279734 res!849853) b!1279731))

(assert (= (and b!1279731 res!849849) b!1279735))

(assert (= (and b!1279735 res!849851) b!1279736))

(assert (= (and b!1279736 (not res!849848)) b!1279729))

(assert (= (and b!1279737 condMapEmpty!51797) mapIsEmpty!51797))

(assert (= (and b!1279737 (not condMapEmpty!51797)) mapNonEmpty!51797))

(get-info :version)

(assert (= (and mapNonEmpty!51797 ((_ is ValueCellFull!15851) mapValue!51797)) b!1279733))

(assert (= (and b!1279737 ((_ is ValueCellFull!15851) mapDefault!51797)) b!1279730))

(assert (= start!108524 b!1279737))

(declare-fun m!1175345 () Bool)

(assert (=> b!1279734 m!1175345))

(declare-fun m!1175347 () Bool)

(assert (=> b!1279735 m!1175347))

(declare-fun m!1175349 () Bool)

(assert (=> start!108524 m!1175349))

(declare-fun m!1175351 () Bool)

(assert (=> start!108524 m!1175351))

(declare-fun m!1175353 () Bool)

(assert (=> start!108524 m!1175353))

(declare-fun m!1175355 () Bool)

(assert (=> mapNonEmpty!51797 m!1175355))

(declare-fun m!1175357 () Bool)

(assert (=> b!1279736 m!1175357))

(declare-fun m!1175359 () Bool)

(assert (=> b!1279729 m!1175359))

(check-sat (not b!1279735) tp_is_empty!33499 (not b!1279736) (not b!1279734) (not mapNonEmpty!51797) (not start!108524) (not b!1279729))
(check-sat)
(get-model)

(declare-fun d!140993 () Bool)

(declare-fun lt!576359 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!641 (List!28776) (InoxSet (_ BitVec 64)))

(assert (=> d!140993 (= lt!576359 (select (content!641 Nil!28773) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!731163 () Bool)

(assert (=> d!140993 (= lt!576359 e!731163)))

(declare-fun res!849895 () Bool)

(assert (=> d!140993 (=> (not res!849895) (not e!731163))))

(assert (=> d!140993 (= res!849895 ((_ is Cons!28772) Nil!28773))))

(assert (=> d!140993 (= (contains!7767 Nil!28773 #b1000000000000000000000000000000000000000000000000000000000000000) lt!576359)))

(declare-fun b!1279796 () Bool)

(declare-fun e!731164 () Bool)

(assert (=> b!1279796 (= e!731163 e!731164)))

(declare-fun res!849894 () Bool)

(assert (=> b!1279796 (=> res!849894 e!731164)))

(assert (=> b!1279796 (= res!849894 (= (h!29990 Nil!28773) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1279797 () Bool)

(assert (=> b!1279797 (= e!731164 (contains!7767 (t!42308 Nil!28773) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!140993 res!849895) b!1279796))

(assert (= (and b!1279796 (not res!849894)) b!1279797))

(declare-fun m!1175393 () Bool)

(assert (=> d!140993 m!1175393))

(declare-fun m!1175395 () Bool)

(assert (=> d!140993 m!1175395))

(declare-fun m!1175397 () Bool)

(assert (=> b!1279797 m!1175397))

(assert (=> b!1279729 d!140993))

(declare-fun d!140995 () Bool)

(assert (=> d!140995 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108524 d!140995))

(declare-fun d!140997 () Bool)

(assert (=> d!140997 (= (array_inv!31001 _values!1445) (bvsge (size!41114 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108524 d!140997))

(declare-fun d!140999 () Bool)

(assert (=> d!140999 (= (array_inv!31002 _keys!1741) (bvsge (size!41113 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108524 d!140999))

(declare-fun d!141001 () Bool)

(declare-fun lt!576360 () Bool)

(assert (=> d!141001 (= lt!576360 (select (content!641 Nil!28773) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!731165 () Bool)

(assert (=> d!141001 (= lt!576360 e!731165)))

(declare-fun res!849897 () Bool)

(assert (=> d!141001 (=> (not res!849897) (not e!731165))))

(assert (=> d!141001 (= res!849897 ((_ is Cons!28772) Nil!28773))))

(assert (=> d!141001 (= (contains!7767 Nil!28773 #b0000000000000000000000000000000000000000000000000000000000000000) lt!576360)))

(declare-fun b!1279798 () Bool)

(declare-fun e!731166 () Bool)

(assert (=> b!1279798 (= e!731165 e!731166)))

(declare-fun res!849896 () Bool)

(assert (=> b!1279798 (=> res!849896 e!731166)))

(assert (=> b!1279798 (= res!849896 (= (h!29990 Nil!28773) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1279799 () Bool)

(assert (=> b!1279799 (= e!731166 (contains!7767 (t!42308 Nil!28773) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!141001 res!849897) b!1279798))

(assert (= (and b!1279798 (not res!849896)) b!1279799))

(assert (=> d!141001 m!1175393))

(declare-fun m!1175399 () Bool)

(assert (=> d!141001 m!1175399))

(declare-fun m!1175401 () Bool)

(assert (=> b!1279799 m!1175401))

(assert (=> b!1279736 d!141001))

(declare-fun b!1279808 () Bool)

(declare-fun e!731173 () Bool)

(declare-fun call!62781 () Bool)

(assert (=> b!1279808 (= e!731173 call!62781)))

(declare-fun bm!62778 () Bool)

(assert (=> bm!62778 (= call!62781 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1279810 () Bool)

(declare-fun e!731175 () Bool)

(assert (=> b!1279810 (= e!731175 e!731173)))

(declare-fun c!124438 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1279810 (= c!124438 (validKeyInArray!0 (select (arr!40562 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1279811 () Bool)

(declare-fun e!731174 () Bool)

(assert (=> b!1279811 (= e!731173 e!731174)))

(declare-fun lt!576368 () (_ BitVec 64))

(assert (=> b!1279811 (= lt!576368 (select (arr!40562 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42358 0))(
  ( (Unit!42359) )
))
(declare-fun lt!576369 () Unit!42358)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!84123 (_ BitVec 64) (_ BitVec 32)) Unit!42358)

(assert (=> b!1279811 (= lt!576369 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!576368 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!84123 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1279811 (arrayContainsKey!0 _keys!1741 lt!576368 #b00000000000000000000000000000000)))

(declare-fun lt!576367 () Unit!42358)

(assert (=> b!1279811 (= lt!576367 lt!576369)))

(declare-fun res!849903 () Bool)

(declare-datatypes ((SeekEntryResult!9967 0))(
  ( (MissingZero!9967 (index!42239 (_ BitVec 32))) (Found!9967 (index!42240 (_ BitVec 32))) (Intermediate!9967 (undefined!10779 Bool) (index!42241 (_ BitVec 32)) (x!113308 (_ BitVec 32))) (Undefined!9967) (MissingVacant!9967 (index!42242 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!84123 (_ BitVec 32)) SeekEntryResult!9967)

(assert (=> b!1279811 (= res!849903 (= (seekEntryOrOpen!0 (select (arr!40562 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!9967 #b00000000000000000000000000000000)))))

(assert (=> b!1279811 (=> (not res!849903) (not e!731174))))

(declare-fun d!141003 () Bool)

(declare-fun res!849902 () Bool)

(assert (=> d!141003 (=> res!849902 e!731175)))

(assert (=> d!141003 (= res!849902 (bvsge #b00000000000000000000000000000000 (size!41113 _keys!1741)))))

(assert (=> d!141003 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!731175)))

(declare-fun b!1279809 () Bool)

(assert (=> b!1279809 (= e!731174 call!62781)))

(assert (= (and d!141003 (not res!849902)) b!1279810))

(assert (= (and b!1279810 c!124438) b!1279811))

(assert (= (and b!1279810 (not c!124438)) b!1279808))

(assert (= (and b!1279811 res!849903) b!1279809))

(assert (= (or b!1279809 b!1279808) bm!62778))

(declare-fun m!1175403 () Bool)

(assert (=> bm!62778 m!1175403))

(declare-fun m!1175405 () Bool)

(assert (=> b!1279810 m!1175405))

(assert (=> b!1279810 m!1175405))

(declare-fun m!1175407 () Bool)

(assert (=> b!1279810 m!1175407))

(assert (=> b!1279811 m!1175405))

(declare-fun m!1175409 () Bool)

(assert (=> b!1279811 m!1175409))

(declare-fun m!1175411 () Bool)

(assert (=> b!1279811 m!1175411))

(assert (=> b!1279811 m!1175405))

(declare-fun m!1175413 () Bool)

(assert (=> b!1279811 m!1175413))

(assert (=> b!1279734 d!141003))

(declare-fun d!141005 () Bool)

(declare-fun res!849908 () Bool)

(declare-fun e!731180 () Bool)

(assert (=> d!141005 (=> res!849908 e!731180)))

(assert (=> d!141005 (= res!849908 ((_ is Nil!28773) Nil!28773))))

(assert (=> d!141005 (= (noDuplicate!2070 Nil!28773) e!731180)))

(declare-fun b!1279816 () Bool)

(declare-fun e!731181 () Bool)

(assert (=> b!1279816 (= e!731180 e!731181)))

(declare-fun res!849909 () Bool)

(assert (=> b!1279816 (=> (not res!849909) (not e!731181))))

(assert (=> b!1279816 (= res!849909 (not (contains!7767 (t!42308 Nil!28773) (h!29990 Nil!28773))))))

(declare-fun b!1279817 () Bool)

(assert (=> b!1279817 (= e!731181 (noDuplicate!2070 (t!42308 Nil!28773)))))

(assert (= (and d!141005 (not res!849908)) b!1279816))

(assert (= (and b!1279816 res!849909) b!1279817))

(declare-fun m!1175415 () Bool)

(assert (=> b!1279816 m!1175415))

(declare-fun m!1175417 () Bool)

(assert (=> b!1279817 m!1175417))

(assert (=> b!1279735 d!141005))

(declare-fun b!1279825 () Bool)

(declare-fun e!731187 () Bool)

(assert (=> b!1279825 (= e!731187 tp_is_empty!33499)))

(declare-fun mapIsEmpty!51806 () Bool)

(declare-fun mapRes!51806 () Bool)

(assert (=> mapIsEmpty!51806 mapRes!51806))

(declare-fun condMapEmpty!51806 () Bool)

(declare-fun mapDefault!51806 () ValueCell!15851)

(assert (=> mapNonEmpty!51797 (= condMapEmpty!51806 (= mapRest!51797 ((as const (Array (_ BitVec 32) ValueCell!15851)) mapDefault!51806)))))

(assert (=> mapNonEmpty!51797 (= tp!98771 (and e!731187 mapRes!51806))))

(declare-fun b!1279824 () Bool)

(declare-fun e!731186 () Bool)

(assert (=> b!1279824 (= e!731186 tp_is_empty!33499)))

(declare-fun mapNonEmpty!51806 () Bool)

(declare-fun tp!98780 () Bool)

(assert (=> mapNonEmpty!51806 (= mapRes!51806 (and tp!98780 e!731186))))

(declare-fun mapValue!51806 () ValueCell!15851)

(declare-fun mapKey!51806 () (_ BitVec 32))

(declare-fun mapRest!51806 () (Array (_ BitVec 32) ValueCell!15851))

(assert (=> mapNonEmpty!51806 (= mapRest!51797 (store mapRest!51806 mapKey!51806 mapValue!51806))))

(assert (= (and mapNonEmpty!51797 condMapEmpty!51806) mapIsEmpty!51806))

(assert (= (and mapNonEmpty!51797 (not condMapEmpty!51806)) mapNonEmpty!51806))

(assert (= (and mapNonEmpty!51806 ((_ is ValueCellFull!15851) mapValue!51806)) b!1279824))

(assert (= (and mapNonEmpty!51797 ((_ is ValueCellFull!15851) mapDefault!51806)) b!1279825))

(declare-fun m!1175419 () Bool)

(assert (=> mapNonEmpty!51806 m!1175419))

(check-sat (not b!1279811) (not bm!62778) (not mapNonEmpty!51806) tp_is_empty!33499 (not b!1279797) (not b!1279810) (not d!141001) (not b!1279816) (not b!1279817) (not d!140993) (not b!1279799))
(check-sat)
