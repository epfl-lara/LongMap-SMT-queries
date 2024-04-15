; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81766 () Bool)

(assert start!81766)

(declare-fun b!953656 () Bool)

(declare-fun e!537239 () Bool)

(declare-fun e!537237 () Bool)

(declare-fun mapRes!33223 () Bool)

(assert (=> b!953656 (= e!537239 (and e!537237 mapRes!33223))))

(declare-fun condMapEmpty!33223 () Bool)

(declare-datatypes ((V!32777 0))(
  ( (V!32778 (val!10473 Int)) )
))
(declare-datatypes ((ValueCell!9941 0))(
  ( (ValueCellFull!9941 (v!13026 V!32777)) (EmptyCell!9941) )
))
(declare-datatypes ((array!57760 0))(
  ( (array!57761 (arr!27762 (Array (_ BitVec 32) ValueCell!9941)) (size!28243 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57760)

(declare-fun mapDefault!33223 () ValueCell!9941)

(assert (=> b!953656 (= condMapEmpty!33223 (= (arr!27762 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9941)) mapDefault!33223)))))

(declare-fun mapIsEmpty!33223 () Bool)

(assert (=> mapIsEmpty!33223 mapRes!33223))

(declare-fun res!638678 () Bool)

(declare-fun e!537238 () Bool)

(assert (=> start!81766 (=> (not res!638678) (not e!537238))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81766 (= res!638678 (validMask!0 mask!1823))))

(assert (=> start!81766 e!537238))

(assert (=> start!81766 true))

(declare-fun array_inv!21611 (array!57760) Bool)

(assert (=> start!81766 (and (array_inv!21611 _values!1197) e!537239)))

(declare-datatypes ((array!57762 0))(
  ( (array!57763 (arr!27763 (Array (_ BitVec 32) (_ BitVec 64))) (size!28244 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57762)

(declare-fun array_inv!21612 (array!57762) Bool)

(assert (=> start!81766 (array_inv!21612 _keys!1441)))

(declare-fun b!953657 () Bool)

(declare-fun res!638677 () Bool)

(assert (=> b!953657 (=> (not res!638677) (not e!537238))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!953657 (= res!638677 (and (= (size!28243 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28244 _keys!1441) (size!28243 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!953658 () Bool)

(declare-fun res!638676 () Bool)

(assert (=> b!953658 (=> (not res!638676) (not e!537238))))

(assert (=> b!953658 (= res!638676 (and (bvsle #b00000000000000000000000000000000 (size!28244 _keys!1441)) (bvslt (size!28244 _keys!1441) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!33223 () Bool)

(declare-fun tp!63613 () Bool)

(declare-fun e!537241 () Bool)

(assert (=> mapNonEmpty!33223 (= mapRes!33223 (and tp!63613 e!537241))))

(declare-fun mapRest!33223 () (Array (_ BitVec 32) ValueCell!9941))

(declare-fun mapValue!33223 () ValueCell!9941)

(declare-fun mapKey!33223 () (_ BitVec 32))

(assert (=> mapNonEmpty!33223 (= (arr!27762 _values!1197) (store mapRest!33223 mapKey!33223 mapValue!33223))))

(declare-fun b!953659 () Bool)

(declare-datatypes ((List!19379 0))(
  ( (Nil!19376) (Cons!19375 (h!20537 (_ BitVec 64)) (t!27731 List!19379)) )
))
(declare-fun noDuplicate!1366 (List!19379) Bool)

(assert (=> b!953659 (= e!537238 (not (noDuplicate!1366 Nil!19376)))))

(declare-fun b!953660 () Bool)

(declare-fun tp_is_empty!20845 () Bool)

(assert (=> b!953660 (= e!537241 tp_is_empty!20845)))

(declare-fun b!953661 () Bool)

(declare-fun res!638675 () Bool)

(assert (=> b!953661 (=> (not res!638675) (not e!537238))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57762 (_ BitVec 32)) Bool)

(assert (=> b!953661 (= res!638675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!953662 () Bool)

(assert (=> b!953662 (= e!537237 tp_is_empty!20845)))

(assert (= (and start!81766 res!638678) b!953657))

(assert (= (and b!953657 res!638677) b!953661))

(assert (= (and b!953661 res!638675) b!953658))

(assert (= (and b!953658 res!638676) b!953659))

(assert (= (and b!953656 condMapEmpty!33223) mapIsEmpty!33223))

(assert (= (and b!953656 (not condMapEmpty!33223)) mapNonEmpty!33223))

(get-info :version)

(assert (= (and mapNonEmpty!33223 ((_ is ValueCellFull!9941) mapValue!33223)) b!953660))

(assert (= (and b!953656 ((_ is ValueCellFull!9941) mapDefault!33223)) b!953662))

(assert (= start!81766 b!953656))

(declare-fun m!885035 () Bool)

(assert (=> start!81766 m!885035))

(declare-fun m!885037 () Bool)

(assert (=> start!81766 m!885037))

(declare-fun m!885039 () Bool)

(assert (=> start!81766 m!885039))

(declare-fun m!885041 () Bool)

(assert (=> mapNonEmpty!33223 m!885041))

(declare-fun m!885043 () Bool)

(assert (=> b!953659 m!885043))

(declare-fun m!885045 () Bool)

(assert (=> b!953661 m!885045))

(check-sat (not b!953661) (not b!953659) tp_is_empty!20845 (not mapNonEmpty!33223) (not start!81766))
(check-sat)
(get-model)

(declare-fun b!953713 () Bool)

(declare-fun e!537279 () Bool)

(declare-fun e!537278 () Bool)

(assert (=> b!953713 (= e!537279 e!537278)))

(declare-fun c!99798 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953713 (= c!99798 (validKeyInArray!0 (select (arr!27763 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun b!953714 () Bool)

(declare-fun e!537280 () Bool)

(assert (=> b!953714 (= e!537278 e!537280)))

(declare-fun lt!429609 () (_ BitVec 64))

(assert (=> b!953714 (= lt!429609 (select (arr!27763 _keys!1441) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31960 0))(
  ( (Unit!31961) )
))
(declare-fun lt!429611 () Unit!31960)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57762 (_ BitVec 64) (_ BitVec 32)) Unit!31960)

(assert (=> b!953714 (= lt!429611 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1441 lt!429609 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57762 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953714 (arrayContainsKey!0 _keys!1441 lt!429609 #b00000000000000000000000000000000)))

(declare-fun lt!429610 () Unit!31960)

(assert (=> b!953714 (= lt!429610 lt!429611)))

(declare-fun res!638707 () Bool)

(declare-datatypes ((SeekEntryResult!9181 0))(
  ( (MissingZero!9181 (index!39095 (_ BitVec 32))) (Found!9181 (index!39096 (_ BitVec 32))) (Intermediate!9181 (undefined!9993 Bool) (index!39097 (_ BitVec 32)) (x!82128 (_ BitVec 32))) (Undefined!9181) (MissingVacant!9181 (index!39098 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57762 (_ BitVec 32)) SeekEntryResult!9181)

(assert (=> b!953714 (= res!638707 (= (seekEntryOrOpen!0 (select (arr!27763 _keys!1441) #b00000000000000000000000000000000) _keys!1441 mask!1823) (Found!9181 #b00000000000000000000000000000000)))))

(assert (=> b!953714 (=> (not res!638707) (not e!537280))))

(declare-fun bm!41646 () Bool)

(declare-fun call!41649 () Bool)

(assert (=> bm!41646 (= call!41649 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1441 mask!1823))))

(declare-fun b!953715 () Bool)

(assert (=> b!953715 (= e!537278 call!41649)))

(declare-fun b!953716 () Bool)

(assert (=> b!953716 (= e!537280 call!41649)))

(declare-fun d!115547 () Bool)

(declare-fun res!638708 () Bool)

(assert (=> d!115547 (=> res!638708 e!537279)))

(assert (=> d!115547 (= res!638708 (bvsge #b00000000000000000000000000000000 (size!28244 _keys!1441)))))

(assert (=> d!115547 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823) e!537279)))

(assert (= (and d!115547 (not res!638708)) b!953713))

(assert (= (and b!953713 c!99798) b!953714))

(assert (= (and b!953713 (not c!99798)) b!953715))

(assert (= (and b!953714 res!638707) b!953716))

(assert (= (or b!953716 b!953715) bm!41646))

(declare-fun m!885071 () Bool)

(assert (=> b!953713 m!885071))

(assert (=> b!953713 m!885071))

(declare-fun m!885073 () Bool)

(assert (=> b!953713 m!885073))

(assert (=> b!953714 m!885071))

(declare-fun m!885075 () Bool)

(assert (=> b!953714 m!885075))

(declare-fun m!885077 () Bool)

(assert (=> b!953714 m!885077))

(assert (=> b!953714 m!885071))

(declare-fun m!885079 () Bool)

(assert (=> b!953714 m!885079))

(declare-fun m!885081 () Bool)

(assert (=> bm!41646 m!885081))

(assert (=> b!953661 d!115547))

(declare-fun d!115549 () Bool)

(assert (=> d!115549 (= (validMask!0 mask!1823) (and (or (= mask!1823 #b00000000000000000000000000000111) (= mask!1823 #b00000000000000000000000000001111) (= mask!1823 #b00000000000000000000000000011111) (= mask!1823 #b00000000000000000000000000111111) (= mask!1823 #b00000000000000000000000001111111) (= mask!1823 #b00000000000000000000000011111111) (= mask!1823 #b00000000000000000000000111111111) (= mask!1823 #b00000000000000000000001111111111) (= mask!1823 #b00000000000000000000011111111111) (= mask!1823 #b00000000000000000000111111111111) (= mask!1823 #b00000000000000000001111111111111) (= mask!1823 #b00000000000000000011111111111111) (= mask!1823 #b00000000000000000111111111111111) (= mask!1823 #b00000000000000001111111111111111) (= mask!1823 #b00000000000000011111111111111111) (= mask!1823 #b00000000000000111111111111111111) (= mask!1823 #b00000000000001111111111111111111) (= mask!1823 #b00000000000011111111111111111111) (= mask!1823 #b00000000000111111111111111111111) (= mask!1823 #b00000000001111111111111111111111) (= mask!1823 #b00000000011111111111111111111111) (= mask!1823 #b00000000111111111111111111111111) (= mask!1823 #b00000001111111111111111111111111) (= mask!1823 #b00000011111111111111111111111111) (= mask!1823 #b00000111111111111111111111111111) (= mask!1823 #b00001111111111111111111111111111) (= mask!1823 #b00011111111111111111111111111111) (= mask!1823 #b00111111111111111111111111111111)) (bvsle mask!1823 #b00111111111111111111111111111111)))))

(assert (=> start!81766 d!115549))

(declare-fun d!115551 () Bool)

(assert (=> d!115551 (= (array_inv!21611 _values!1197) (bvsge (size!28243 _values!1197) #b00000000000000000000000000000000))))

(assert (=> start!81766 d!115551))

(declare-fun d!115553 () Bool)

(assert (=> d!115553 (= (array_inv!21612 _keys!1441) (bvsge (size!28244 _keys!1441) #b00000000000000000000000000000000))))

(assert (=> start!81766 d!115553))

(declare-fun d!115555 () Bool)

(declare-fun res!638713 () Bool)

(declare-fun e!537285 () Bool)

(assert (=> d!115555 (=> res!638713 e!537285)))

(assert (=> d!115555 (= res!638713 ((_ is Nil!19376) Nil!19376))))

(assert (=> d!115555 (= (noDuplicate!1366 Nil!19376) e!537285)))

(declare-fun b!953721 () Bool)

(declare-fun e!537286 () Bool)

(assert (=> b!953721 (= e!537285 e!537286)))

(declare-fun res!638714 () Bool)

(assert (=> b!953721 (=> (not res!638714) (not e!537286))))

(declare-fun contains!5220 (List!19379 (_ BitVec 64)) Bool)

(assert (=> b!953721 (= res!638714 (not (contains!5220 (t!27731 Nil!19376) (h!20537 Nil!19376))))))

(declare-fun b!953722 () Bool)

(assert (=> b!953722 (= e!537286 (noDuplicate!1366 (t!27731 Nil!19376)))))

(assert (= (and d!115555 (not res!638713)) b!953721))

(assert (= (and b!953721 res!638714) b!953722))

(declare-fun m!885083 () Bool)

(assert (=> b!953721 m!885083))

(declare-fun m!885085 () Bool)

(assert (=> b!953722 m!885085))

(assert (=> b!953659 d!115555))

(declare-fun b!953730 () Bool)

(declare-fun e!537292 () Bool)

(assert (=> b!953730 (= e!537292 tp_is_empty!20845)))

(declare-fun mapNonEmpty!33232 () Bool)

(declare-fun mapRes!33232 () Bool)

(declare-fun tp!63622 () Bool)

(declare-fun e!537291 () Bool)

(assert (=> mapNonEmpty!33232 (= mapRes!33232 (and tp!63622 e!537291))))

(declare-fun mapKey!33232 () (_ BitVec 32))

(declare-fun mapValue!33232 () ValueCell!9941)

(declare-fun mapRest!33232 () (Array (_ BitVec 32) ValueCell!9941))

(assert (=> mapNonEmpty!33232 (= mapRest!33223 (store mapRest!33232 mapKey!33232 mapValue!33232))))

(declare-fun mapIsEmpty!33232 () Bool)

(assert (=> mapIsEmpty!33232 mapRes!33232))

(declare-fun condMapEmpty!33232 () Bool)

(declare-fun mapDefault!33232 () ValueCell!9941)

(assert (=> mapNonEmpty!33223 (= condMapEmpty!33232 (= mapRest!33223 ((as const (Array (_ BitVec 32) ValueCell!9941)) mapDefault!33232)))))

(assert (=> mapNonEmpty!33223 (= tp!63613 (and e!537292 mapRes!33232))))

(declare-fun b!953729 () Bool)

(assert (=> b!953729 (= e!537291 tp_is_empty!20845)))

(assert (= (and mapNonEmpty!33223 condMapEmpty!33232) mapIsEmpty!33232))

(assert (= (and mapNonEmpty!33223 (not condMapEmpty!33232)) mapNonEmpty!33232))

(assert (= (and mapNonEmpty!33232 ((_ is ValueCellFull!9941) mapValue!33232)) b!953729))

(assert (= (and mapNonEmpty!33223 ((_ is ValueCellFull!9941) mapDefault!33232)) b!953730))

(declare-fun m!885087 () Bool)

(assert (=> mapNonEmpty!33232 m!885087))

(check-sat tp_is_empty!20845 (not b!953714) (not b!953721) (not bm!41646) (not b!953722) (not mapNonEmpty!33232) (not b!953713))
(check-sat)
