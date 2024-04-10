; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81758 () Bool)

(assert start!81758)

(declare-fun b!953763 () Bool)

(declare-fun res!638728 () Bool)

(declare-fun e!537280 () Bool)

(assert (=> b!953763 (=> (not res!638728) (not e!537280))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!57775 0))(
  ( (array!57776 (arr!27771 (Array (_ BitVec 32) (_ BitVec 64))) (size!28250 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57775)

(declare-datatypes ((V!32763 0))(
  ( (V!32764 (val!10468 Int)) )
))
(declare-datatypes ((ValueCell!9936 0))(
  ( (ValueCellFull!9936 (v!13022 V!32763)) (EmptyCell!9936) )
))
(declare-datatypes ((array!57777 0))(
  ( (array!57778 (arr!27772 (Array (_ BitVec 32) ValueCell!9936)) (size!28251 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57777)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!953763 (= res!638728 (and (= (size!28251 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28250 _keys!1441) (size!28251 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33202 () Bool)

(declare-fun mapRes!33202 () Bool)

(assert (=> mapIsEmpty!33202 mapRes!33202))

(declare-fun b!953764 () Bool)

(declare-fun e!537283 () Bool)

(declare-fun e!537282 () Bool)

(assert (=> b!953764 (= e!537283 (and e!537282 mapRes!33202))))

(declare-fun condMapEmpty!33202 () Bool)

(declare-fun mapDefault!33202 () ValueCell!9936)

(assert (=> b!953764 (= condMapEmpty!33202 (= (arr!27772 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9936)) mapDefault!33202)))))

(declare-fun b!953765 () Bool)

(assert (=> b!953765 (= e!537280 (bvsgt #b00000000000000000000000000000000 (size!28250 _keys!1441)))))

(declare-fun b!953766 () Bool)

(declare-fun res!638726 () Bool)

(assert (=> b!953766 (=> (not res!638726) (not e!537280))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57775 (_ BitVec 32)) Bool)

(assert (=> b!953766 (= res!638726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!953768 () Bool)

(declare-fun e!537284 () Bool)

(declare-fun tp_is_empty!20835 () Bool)

(assert (=> b!953768 (= e!537284 tp_is_empty!20835)))

(declare-fun mapNonEmpty!33202 () Bool)

(declare-fun tp!63591 () Bool)

(assert (=> mapNonEmpty!33202 (= mapRes!33202 (and tp!63591 e!537284))))

(declare-fun mapValue!33202 () ValueCell!9936)

(declare-fun mapRest!33202 () (Array (_ BitVec 32) ValueCell!9936))

(declare-fun mapKey!33202 () (_ BitVec 32))

(assert (=> mapNonEmpty!33202 (= (arr!27772 _values!1197) (store mapRest!33202 mapKey!33202 mapValue!33202))))

(declare-fun res!638727 () Bool)

(assert (=> start!81758 (=> (not res!638727) (not e!537280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81758 (= res!638727 (validMask!0 mask!1823))))

(assert (=> start!81758 e!537280))

(assert (=> start!81758 true))

(declare-fun array_inv!21559 (array!57777) Bool)

(assert (=> start!81758 (and (array_inv!21559 _values!1197) e!537283)))

(declare-fun array_inv!21560 (array!57775) Bool)

(assert (=> start!81758 (array_inv!21560 _keys!1441)))

(declare-fun b!953767 () Bool)

(assert (=> b!953767 (= e!537282 tp_is_empty!20835)))

(assert (= (and start!81758 res!638727) b!953763))

(assert (= (and b!953763 res!638728) b!953766))

(assert (= (and b!953766 res!638726) b!953765))

(assert (= (and b!953764 condMapEmpty!33202) mapIsEmpty!33202))

(assert (= (and b!953764 (not condMapEmpty!33202)) mapNonEmpty!33202))

(get-info :version)

(assert (= (and mapNonEmpty!33202 ((_ is ValueCellFull!9936) mapValue!33202)) b!953768))

(assert (= (and b!953764 ((_ is ValueCellFull!9936) mapDefault!33202)) b!953767))

(assert (= start!81758 b!953764))

(declare-fun m!885715 () Bool)

(assert (=> b!953766 m!885715))

(declare-fun m!885717 () Bool)

(assert (=> mapNonEmpty!33202 m!885717))

(declare-fun m!885719 () Bool)

(assert (=> start!81758 m!885719))

(declare-fun m!885721 () Bool)

(assert (=> start!81758 m!885721))

(declare-fun m!885723 () Bool)

(assert (=> start!81758 m!885723))

(check-sat (not start!81758) (not b!953766) (not mapNonEmpty!33202) tp_is_empty!20835)
(check-sat)
(get-model)

(declare-fun d!115725 () Bool)

(assert (=> d!115725 (= (validMask!0 mask!1823) (and (or (= mask!1823 #b00000000000000000000000000000111) (= mask!1823 #b00000000000000000000000000001111) (= mask!1823 #b00000000000000000000000000011111) (= mask!1823 #b00000000000000000000000000111111) (= mask!1823 #b00000000000000000000000001111111) (= mask!1823 #b00000000000000000000000011111111) (= mask!1823 #b00000000000000000000000111111111) (= mask!1823 #b00000000000000000000001111111111) (= mask!1823 #b00000000000000000000011111111111) (= mask!1823 #b00000000000000000000111111111111) (= mask!1823 #b00000000000000000001111111111111) (= mask!1823 #b00000000000000000011111111111111) (= mask!1823 #b00000000000000000111111111111111) (= mask!1823 #b00000000000000001111111111111111) (= mask!1823 #b00000000000000011111111111111111) (= mask!1823 #b00000000000000111111111111111111) (= mask!1823 #b00000000000001111111111111111111) (= mask!1823 #b00000000000011111111111111111111) (= mask!1823 #b00000000000111111111111111111111) (= mask!1823 #b00000000001111111111111111111111) (= mask!1823 #b00000000011111111111111111111111) (= mask!1823 #b00000000111111111111111111111111) (= mask!1823 #b00000001111111111111111111111111) (= mask!1823 #b00000011111111111111111111111111) (= mask!1823 #b00000111111111111111111111111111) (= mask!1823 #b00001111111111111111111111111111) (= mask!1823 #b00011111111111111111111111111111) (= mask!1823 #b00111111111111111111111111111111)) (bvsle mask!1823 #b00111111111111111111111111111111)))))

(assert (=> start!81758 d!115725))

(declare-fun d!115727 () Bool)

(assert (=> d!115727 (= (array_inv!21559 _values!1197) (bvsge (size!28251 _values!1197) #b00000000000000000000000000000000))))

(assert (=> start!81758 d!115727))

(declare-fun d!115729 () Bool)

(assert (=> d!115729 (= (array_inv!21560 _keys!1441) (bvsge (size!28250 _keys!1441) #b00000000000000000000000000000000))))

(assert (=> start!81758 d!115729))

(declare-fun b!953795 () Bool)

(declare-fun e!537308 () Bool)

(declare-fun call!41669 () Bool)

(assert (=> b!953795 (= e!537308 call!41669)))

(declare-fun b!953796 () Bool)

(declare-fun e!537306 () Bool)

(declare-fun e!537307 () Bool)

(assert (=> b!953796 (= e!537306 e!537307)))

(declare-fun c!99857 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953796 (= c!99857 (validKeyInArray!0 (select (arr!27771 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun b!953797 () Bool)

(assert (=> b!953797 (= e!537307 e!537308)))

(declare-fun lt!429829 () (_ BitVec 64))

(assert (=> b!953797 (= lt!429829 (select (arr!27771 _keys!1441) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32085 0))(
  ( (Unit!32086) )
))
(declare-fun lt!429828 () Unit!32085)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57775 (_ BitVec 64) (_ BitVec 32)) Unit!32085)

(assert (=> b!953797 (= lt!429828 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1441 lt!429829 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57775 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953797 (arrayContainsKey!0 _keys!1441 lt!429829 #b00000000000000000000000000000000)))

(declare-fun lt!429827 () Unit!32085)

(assert (=> b!953797 (= lt!429827 lt!429828)))

(declare-fun res!638742 () Bool)

(declare-datatypes ((SeekEntryResult!9184 0))(
  ( (MissingZero!9184 (index!39107 (_ BitVec 32))) (Found!9184 (index!39108 (_ BitVec 32))) (Intermediate!9184 (undefined!9996 Bool) (index!39109 (_ BitVec 32)) (x!82116 (_ BitVec 32))) (Undefined!9184) (MissingVacant!9184 (index!39110 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57775 (_ BitVec 32)) SeekEntryResult!9184)

(assert (=> b!953797 (= res!638742 (= (seekEntryOrOpen!0 (select (arr!27771 _keys!1441) #b00000000000000000000000000000000) _keys!1441 mask!1823) (Found!9184 #b00000000000000000000000000000000)))))

(assert (=> b!953797 (=> (not res!638742) (not e!537308))))

(declare-fun b!953798 () Bool)

(assert (=> b!953798 (= e!537307 call!41669)))

(declare-fun bm!41666 () Bool)

(assert (=> bm!41666 (= call!41669 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1441 mask!1823))))

(declare-fun d!115731 () Bool)

(declare-fun res!638743 () Bool)

(assert (=> d!115731 (=> res!638743 e!537306)))

(assert (=> d!115731 (= res!638743 (bvsge #b00000000000000000000000000000000 (size!28250 _keys!1441)))))

(assert (=> d!115731 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823) e!537306)))

(assert (= (and d!115731 (not res!638743)) b!953796))

(assert (= (and b!953796 c!99857) b!953797))

(assert (= (and b!953796 (not c!99857)) b!953798))

(assert (= (and b!953797 res!638742) b!953795))

(assert (= (or b!953795 b!953798) bm!41666))

(declare-fun m!885735 () Bool)

(assert (=> b!953796 m!885735))

(assert (=> b!953796 m!885735))

(declare-fun m!885737 () Bool)

(assert (=> b!953796 m!885737))

(assert (=> b!953797 m!885735))

(declare-fun m!885739 () Bool)

(assert (=> b!953797 m!885739))

(declare-fun m!885741 () Bool)

(assert (=> b!953797 m!885741))

(assert (=> b!953797 m!885735))

(declare-fun m!885743 () Bool)

(assert (=> b!953797 m!885743))

(declare-fun m!885745 () Bool)

(assert (=> bm!41666 m!885745))

(assert (=> b!953766 d!115731))

(declare-fun mapNonEmpty!33208 () Bool)

(declare-fun mapRes!33208 () Bool)

(declare-fun tp!63597 () Bool)

(declare-fun e!537313 () Bool)

(assert (=> mapNonEmpty!33208 (= mapRes!33208 (and tp!63597 e!537313))))

(declare-fun mapKey!33208 () (_ BitVec 32))

(declare-fun mapValue!33208 () ValueCell!9936)

(declare-fun mapRest!33208 () (Array (_ BitVec 32) ValueCell!9936))

(assert (=> mapNonEmpty!33208 (= mapRest!33202 (store mapRest!33208 mapKey!33208 mapValue!33208))))

(declare-fun b!953805 () Bool)

(assert (=> b!953805 (= e!537313 tp_is_empty!20835)))

(declare-fun mapIsEmpty!33208 () Bool)

(assert (=> mapIsEmpty!33208 mapRes!33208))

(declare-fun b!953806 () Bool)

(declare-fun e!537314 () Bool)

(assert (=> b!953806 (= e!537314 tp_is_empty!20835)))

(declare-fun condMapEmpty!33208 () Bool)

(declare-fun mapDefault!33208 () ValueCell!9936)

(assert (=> mapNonEmpty!33202 (= condMapEmpty!33208 (= mapRest!33202 ((as const (Array (_ BitVec 32) ValueCell!9936)) mapDefault!33208)))))

(assert (=> mapNonEmpty!33202 (= tp!63591 (and e!537314 mapRes!33208))))

(assert (= (and mapNonEmpty!33202 condMapEmpty!33208) mapIsEmpty!33208))

(assert (= (and mapNonEmpty!33202 (not condMapEmpty!33208)) mapNonEmpty!33208))

(assert (= (and mapNonEmpty!33208 ((_ is ValueCellFull!9936) mapValue!33208)) b!953805))

(assert (= (and mapNonEmpty!33202 ((_ is ValueCellFull!9936) mapDefault!33208)) b!953806))

(declare-fun m!885747 () Bool)

(assert (=> mapNonEmpty!33208 m!885747))

(check-sat (not bm!41666) (not b!953797) tp_is_empty!20835 (not b!953796) (not mapNonEmpty!33208))
(check-sat)
