; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81772 () Bool)

(assert start!81772)

(declare-fun b!953837 () Bool)

(declare-fun e!537342 () Bool)

(declare-fun tp_is_empty!20841 () Bool)

(assert (=> b!953837 (= e!537342 tp_is_empty!20841)))

(declare-fun mapIsEmpty!33214 () Bool)

(declare-fun mapRes!33214 () Bool)

(assert (=> mapIsEmpty!33214 mapRes!33214))

(declare-fun b!953838 () Bool)

(declare-fun e!537344 () Bool)

(assert (=> b!953838 (= e!537344 (and e!537342 mapRes!33214))))

(declare-fun condMapEmpty!33214 () Bool)

(declare-datatypes ((V!32771 0))(
  ( (V!32772 (val!10471 Int)) )
))
(declare-datatypes ((ValueCell!9939 0))(
  ( (ValueCellFull!9939 (v!13025 V!32771)) (EmptyCell!9939) )
))
(declare-datatypes ((array!57789 0))(
  ( (array!57790 (arr!27777 (Array (_ BitVec 32) ValueCell!9939)) (size!28256 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57789)

(declare-fun mapDefault!33214 () ValueCell!9939)

(assert (=> b!953838 (= condMapEmpty!33214 (= (arr!27777 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9939)) mapDefault!33214)))))

(declare-fun mapNonEmpty!33214 () Bool)

(declare-fun tp!63603 () Bool)

(declare-fun e!537340 () Bool)

(assert (=> mapNonEmpty!33214 (= mapRes!33214 (and tp!63603 e!537340))))

(declare-fun mapValue!33214 () ValueCell!9939)

(declare-fun mapKey!33214 () (_ BitVec 32))

(declare-fun mapRest!33214 () (Array (_ BitVec 32) ValueCell!9939))

(assert (=> mapNonEmpty!33214 (= (arr!27777 _values!1197) (store mapRest!33214 mapKey!33214 mapValue!33214))))

(declare-fun b!953839 () Bool)

(declare-fun e!537343 () Bool)

(declare-datatypes ((array!57791 0))(
  ( (array!57792 (arr!27778 (Array (_ BitVec 32) (_ BitVec 64))) (size!28257 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57791)

(assert (=> b!953839 (= e!537343 (and (bvsle #b00000000000000000000000000000000 (size!28257 _keys!1441)) (bvsge (size!28257 _keys!1441) #b01111111111111111111111111111111)))))

(declare-fun res!638761 () Bool)

(assert (=> start!81772 (=> (not res!638761) (not e!537343))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81772 (= res!638761 (validMask!0 mask!1823))))

(assert (=> start!81772 e!537343))

(assert (=> start!81772 true))

(declare-fun array_inv!21565 (array!57789) Bool)

(assert (=> start!81772 (and (array_inv!21565 _values!1197) e!537344)))

(declare-fun array_inv!21566 (array!57791) Bool)

(assert (=> start!81772 (array_inv!21566 _keys!1441)))

(declare-fun b!953840 () Bool)

(assert (=> b!953840 (= e!537340 tp_is_empty!20841)))

(declare-fun b!953841 () Bool)

(declare-fun res!638760 () Bool)

(assert (=> b!953841 (=> (not res!638760) (not e!537343))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57791 (_ BitVec 32)) Bool)

(assert (=> b!953841 (= res!638760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!953842 () Bool)

(declare-fun res!638759 () Bool)

(assert (=> b!953842 (=> (not res!638759) (not e!537343))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!953842 (= res!638759 (and (= (size!28256 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28257 _keys!1441) (size!28256 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(assert (= (and start!81772 res!638761) b!953842))

(assert (= (and b!953842 res!638759) b!953841))

(assert (= (and b!953841 res!638760) b!953839))

(assert (= (and b!953838 condMapEmpty!33214) mapIsEmpty!33214))

(assert (= (and b!953838 (not condMapEmpty!33214)) mapNonEmpty!33214))

(get-info :version)

(assert (= (and mapNonEmpty!33214 ((_ is ValueCellFull!9939) mapValue!33214)) b!953840))

(assert (= (and b!953838 ((_ is ValueCellFull!9939) mapDefault!33214)) b!953837))

(assert (= start!81772 b!953838))

(declare-fun m!885759 () Bool)

(assert (=> mapNonEmpty!33214 m!885759))

(declare-fun m!885761 () Bool)

(assert (=> start!81772 m!885761))

(declare-fun m!885763 () Bool)

(assert (=> start!81772 m!885763))

(declare-fun m!885765 () Bool)

(assert (=> start!81772 m!885765))

(declare-fun m!885767 () Bool)

(assert (=> b!953841 m!885767))

(check-sat (not start!81772) (not b!953841) (not mapNonEmpty!33214) tp_is_empty!20841)
(check-sat)
(get-model)

(declare-fun d!115735 () Bool)

(assert (=> d!115735 (= (validMask!0 mask!1823) (and (or (= mask!1823 #b00000000000000000000000000000111) (= mask!1823 #b00000000000000000000000000001111) (= mask!1823 #b00000000000000000000000000011111) (= mask!1823 #b00000000000000000000000000111111) (= mask!1823 #b00000000000000000000000001111111) (= mask!1823 #b00000000000000000000000011111111) (= mask!1823 #b00000000000000000000000111111111) (= mask!1823 #b00000000000000000000001111111111) (= mask!1823 #b00000000000000000000011111111111) (= mask!1823 #b00000000000000000000111111111111) (= mask!1823 #b00000000000000000001111111111111) (= mask!1823 #b00000000000000000011111111111111) (= mask!1823 #b00000000000000000111111111111111) (= mask!1823 #b00000000000000001111111111111111) (= mask!1823 #b00000000000000011111111111111111) (= mask!1823 #b00000000000000111111111111111111) (= mask!1823 #b00000000000001111111111111111111) (= mask!1823 #b00000000000011111111111111111111) (= mask!1823 #b00000000000111111111111111111111) (= mask!1823 #b00000000001111111111111111111111) (= mask!1823 #b00000000011111111111111111111111) (= mask!1823 #b00000000111111111111111111111111) (= mask!1823 #b00000001111111111111111111111111) (= mask!1823 #b00000011111111111111111111111111) (= mask!1823 #b00000111111111111111111111111111) (= mask!1823 #b00001111111111111111111111111111) (= mask!1823 #b00011111111111111111111111111111) (= mask!1823 #b00111111111111111111111111111111)) (bvsle mask!1823 #b00111111111111111111111111111111)))))

(assert (=> start!81772 d!115735))

(declare-fun d!115737 () Bool)

(assert (=> d!115737 (= (array_inv!21565 _values!1197) (bvsge (size!28256 _values!1197) #b00000000000000000000000000000000))))

(assert (=> start!81772 d!115737))

(declare-fun d!115739 () Bool)

(assert (=> d!115739 (= (array_inv!21566 _keys!1441) (bvsge (size!28257 _keys!1441) #b00000000000000000000000000000000))))

(assert (=> start!81772 d!115739))

(declare-fun bm!41669 () Bool)

(declare-fun call!41672 () Bool)

(assert (=> bm!41669 (= call!41672 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1441 mask!1823))))

(declare-fun b!953869 () Bool)

(declare-fun e!537367 () Bool)

(assert (=> b!953869 (= e!537367 call!41672)))

(declare-fun b!953870 () Bool)

(declare-fun e!537366 () Bool)

(assert (=> b!953870 (= e!537366 call!41672)))

(declare-fun b!953871 () Bool)

(declare-fun e!537368 () Bool)

(assert (=> b!953871 (= e!537368 e!537366)))

(declare-fun c!99860 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953871 (= c!99860 (validKeyInArray!0 (select (arr!27778 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun b!953872 () Bool)

(assert (=> b!953872 (= e!537366 e!537367)))

(declare-fun lt!429837 () (_ BitVec 64))

(assert (=> b!953872 (= lt!429837 (select (arr!27778 _keys!1441) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32087 0))(
  ( (Unit!32088) )
))
(declare-fun lt!429836 () Unit!32087)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57791 (_ BitVec 64) (_ BitVec 32)) Unit!32087)

(assert (=> b!953872 (= lt!429836 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1441 lt!429837 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953872 (arrayContainsKey!0 _keys!1441 lt!429837 #b00000000000000000000000000000000)))

(declare-fun lt!429838 () Unit!32087)

(assert (=> b!953872 (= lt!429838 lt!429836)))

(declare-fun res!638775 () Bool)

(declare-datatypes ((SeekEntryResult!9185 0))(
  ( (MissingZero!9185 (index!39111 (_ BitVec 32))) (Found!9185 (index!39112 (_ BitVec 32))) (Intermediate!9185 (undefined!9997 Bool) (index!39113 (_ BitVec 32)) (x!82127 (_ BitVec 32))) (Undefined!9185) (MissingVacant!9185 (index!39114 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57791 (_ BitVec 32)) SeekEntryResult!9185)

(assert (=> b!953872 (= res!638775 (= (seekEntryOrOpen!0 (select (arr!27778 _keys!1441) #b00000000000000000000000000000000) _keys!1441 mask!1823) (Found!9185 #b00000000000000000000000000000000)))))

(assert (=> b!953872 (=> (not res!638775) (not e!537367))))

(declare-fun d!115741 () Bool)

(declare-fun res!638776 () Bool)

(assert (=> d!115741 (=> res!638776 e!537368)))

(assert (=> d!115741 (= res!638776 (bvsge #b00000000000000000000000000000000 (size!28257 _keys!1441)))))

(assert (=> d!115741 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823) e!537368)))

(assert (= (and d!115741 (not res!638776)) b!953871))

(assert (= (and b!953871 c!99860) b!953872))

(assert (= (and b!953871 (not c!99860)) b!953870))

(assert (= (and b!953872 res!638775) b!953869))

(assert (= (or b!953869 b!953870) bm!41669))

(declare-fun m!885779 () Bool)

(assert (=> bm!41669 m!885779))

(declare-fun m!885781 () Bool)

(assert (=> b!953871 m!885781))

(assert (=> b!953871 m!885781))

(declare-fun m!885783 () Bool)

(assert (=> b!953871 m!885783))

(assert (=> b!953872 m!885781))

(declare-fun m!885785 () Bool)

(assert (=> b!953872 m!885785))

(declare-fun m!885787 () Bool)

(assert (=> b!953872 m!885787))

(assert (=> b!953872 m!885781))

(declare-fun m!885789 () Bool)

(assert (=> b!953872 m!885789))

(assert (=> b!953841 d!115741))

(declare-fun mapNonEmpty!33220 () Bool)

(declare-fun mapRes!33220 () Bool)

(declare-fun tp!63609 () Bool)

(declare-fun e!537374 () Bool)

(assert (=> mapNonEmpty!33220 (= mapRes!33220 (and tp!63609 e!537374))))

(declare-fun mapKey!33220 () (_ BitVec 32))

(declare-fun mapRest!33220 () (Array (_ BitVec 32) ValueCell!9939))

(declare-fun mapValue!33220 () ValueCell!9939)

(assert (=> mapNonEmpty!33220 (= mapRest!33214 (store mapRest!33220 mapKey!33220 mapValue!33220))))

(declare-fun b!953879 () Bool)

(assert (=> b!953879 (= e!537374 tp_is_empty!20841)))

(declare-fun b!953880 () Bool)

(declare-fun e!537373 () Bool)

(assert (=> b!953880 (= e!537373 tp_is_empty!20841)))

(declare-fun condMapEmpty!33220 () Bool)

(declare-fun mapDefault!33220 () ValueCell!9939)

(assert (=> mapNonEmpty!33214 (= condMapEmpty!33220 (= mapRest!33214 ((as const (Array (_ BitVec 32) ValueCell!9939)) mapDefault!33220)))))

(assert (=> mapNonEmpty!33214 (= tp!63603 (and e!537373 mapRes!33220))))

(declare-fun mapIsEmpty!33220 () Bool)

(assert (=> mapIsEmpty!33220 mapRes!33220))

(assert (= (and mapNonEmpty!33214 condMapEmpty!33220) mapIsEmpty!33220))

(assert (= (and mapNonEmpty!33214 (not condMapEmpty!33220)) mapNonEmpty!33220))

(assert (= (and mapNonEmpty!33220 ((_ is ValueCellFull!9939) mapValue!33220)) b!953879))

(assert (= (and mapNonEmpty!33214 ((_ is ValueCellFull!9939) mapDefault!33220)) b!953880))

(declare-fun m!885791 () Bool)

(assert (=> mapNonEmpty!33220 m!885791))

(check-sat (not b!953872) tp_is_empty!20841 (not mapNonEmpty!33220) (not bm!41669) (not b!953871))
(check-sat)
