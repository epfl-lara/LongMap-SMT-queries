; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81752 () Bool)

(assert start!81752)

(declare-fun res!638641 () Bool)

(declare-fun e!537178 () Bool)

(assert (=> start!81752 (=> (not res!638641) (not e!537178))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81752 (= res!638641 (validMask!0 mask!1823))))

(assert (=> start!81752 e!537178))

(assert (=> start!81752 true))

(declare-datatypes ((V!32769 0))(
  ( (V!32770 (val!10470 Int)) )
))
(declare-datatypes ((ValueCell!9938 0))(
  ( (ValueCellFull!9938 (v!13023 V!32769)) (EmptyCell!9938) )
))
(declare-datatypes ((array!57746 0))(
  ( (array!57747 (arr!27756 (Array (_ BitVec 32) ValueCell!9938)) (size!28237 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57746)

(declare-fun e!537180 () Bool)

(declare-fun array_inv!21607 (array!57746) Bool)

(assert (=> start!81752 (and (array_inv!21607 _values!1197) e!537180)))

(declare-datatypes ((array!57748 0))(
  ( (array!57749 (arr!27757 (Array (_ BitVec 32) (_ BitVec 64))) (size!28238 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57748)

(declare-fun array_inv!21608 (array!57748) Bool)

(assert (=> start!81752 (array_inv!21608 _keys!1441)))

(declare-fun b!953580 () Bool)

(declare-fun res!638640 () Bool)

(assert (=> b!953580 (=> (not res!638640) (not e!537178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57748 (_ BitVec 32)) Bool)

(assert (=> b!953580 (= res!638640 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapIsEmpty!33211 () Bool)

(declare-fun mapRes!33211 () Bool)

(assert (=> mapIsEmpty!33211 mapRes!33211))

(declare-fun b!953581 () Bool)

(declare-fun e!537179 () Bool)

(declare-fun tp_is_empty!20839 () Bool)

(assert (=> b!953581 (= e!537179 tp_is_empty!20839)))

(declare-fun b!953582 () Bool)

(declare-fun res!638642 () Bool)

(assert (=> b!953582 (=> (not res!638642) (not e!537178))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!953582 (= res!638642 (and (= (size!28237 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28238 _keys!1441) (size!28237 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!953583 () Bool)

(assert (=> b!953583 (= e!537178 (and (bvsle #b00000000000000000000000000000000 (size!28238 _keys!1441)) (bvsge (size!28238 _keys!1441) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!33211 () Bool)

(declare-fun tp!63601 () Bool)

(assert (=> mapNonEmpty!33211 (= mapRes!33211 (and tp!63601 e!537179))))

(declare-fun mapRest!33211 () (Array (_ BitVec 32) ValueCell!9938))

(declare-fun mapKey!33211 () (_ BitVec 32))

(declare-fun mapValue!33211 () ValueCell!9938)

(assert (=> mapNonEmpty!33211 (= (arr!27756 _values!1197) (store mapRest!33211 mapKey!33211 mapValue!33211))))

(declare-fun b!953584 () Bool)

(declare-fun e!537177 () Bool)

(assert (=> b!953584 (= e!537180 (and e!537177 mapRes!33211))))

(declare-fun condMapEmpty!33211 () Bool)

(declare-fun mapDefault!33211 () ValueCell!9938)

(assert (=> b!953584 (= condMapEmpty!33211 (= (arr!27756 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9938)) mapDefault!33211)))))

(declare-fun b!953585 () Bool)

(assert (=> b!953585 (= e!537177 tp_is_empty!20839)))

(assert (= (and start!81752 res!638641) b!953582))

(assert (= (and b!953582 res!638642) b!953580))

(assert (= (and b!953580 res!638640) b!953583))

(assert (= (and b!953584 condMapEmpty!33211) mapIsEmpty!33211))

(assert (= (and b!953584 (not condMapEmpty!33211)) mapNonEmpty!33211))

(get-info :version)

(assert (= (and mapNonEmpty!33211 ((_ is ValueCellFull!9938) mapValue!33211)) b!953581))

(assert (= (and b!953584 ((_ is ValueCellFull!9938) mapDefault!33211)) b!953585))

(assert (= start!81752 b!953584))

(declare-fun m!884991 () Bool)

(assert (=> start!81752 m!884991))

(declare-fun m!884993 () Bool)

(assert (=> start!81752 m!884993))

(declare-fun m!884995 () Bool)

(assert (=> start!81752 m!884995))

(declare-fun m!884997 () Bool)

(assert (=> b!953580 m!884997))

(declare-fun m!884999 () Bool)

(assert (=> mapNonEmpty!33211 m!884999))

(check-sat (not b!953580) (not start!81752) (not mapNonEmpty!33211) tp_is_empty!20839)
(check-sat)
(get-model)

(declare-fun bm!41643 () Bool)

(declare-fun call!41646 () Bool)

(assert (=> bm!41643 (= call!41646 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1441 mask!1823))))

(declare-fun b!953630 () Bool)

(declare-fun e!537218 () Bool)

(assert (=> b!953630 (= e!537218 call!41646)))

(declare-fun b!953631 () Bool)

(declare-fun e!537219 () Bool)

(assert (=> b!953631 (= e!537219 e!537218)))

(declare-fun c!99795 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953631 (= c!99795 (validKeyInArray!0 (select (arr!27757 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun b!953632 () Bool)

(declare-fun e!537220 () Bool)

(assert (=> b!953632 (= e!537220 call!41646)))

(declare-fun b!953633 () Bool)

(assert (=> b!953633 (= e!537218 e!537220)))

(declare-fun lt!429600 () (_ BitVec 64))

(assert (=> b!953633 (= lt!429600 (select (arr!27757 _keys!1441) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31958 0))(
  ( (Unit!31959) )
))
(declare-fun lt!429601 () Unit!31958)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57748 (_ BitVec 64) (_ BitVec 32)) Unit!31958)

(assert (=> b!953633 (= lt!429601 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1441 lt!429600 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57748 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953633 (arrayContainsKey!0 _keys!1441 lt!429600 #b00000000000000000000000000000000)))

(declare-fun lt!429602 () Unit!31958)

(assert (=> b!953633 (= lt!429602 lt!429601)))

(declare-fun res!638665 () Bool)

(declare-datatypes ((SeekEntryResult!9180 0))(
  ( (MissingZero!9180 (index!39091 (_ BitVec 32))) (Found!9180 (index!39092 (_ BitVec 32))) (Intermediate!9180 (undefined!9992 Bool) (index!39093 (_ BitVec 32)) (x!82117 (_ BitVec 32))) (Undefined!9180) (MissingVacant!9180 (index!39094 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57748 (_ BitVec 32)) SeekEntryResult!9180)

(assert (=> b!953633 (= res!638665 (= (seekEntryOrOpen!0 (select (arr!27757 _keys!1441) #b00000000000000000000000000000000) _keys!1441 mask!1823) (Found!9180 #b00000000000000000000000000000000)))))

(assert (=> b!953633 (=> (not res!638665) (not e!537220))))

(declare-fun d!115537 () Bool)

(declare-fun res!638666 () Bool)

(assert (=> d!115537 (=> res!638666 e!537219)))

(assert (=> d!115537 (= res!638666 (bvsge #b00000000000000000000000000000000 (size!28238 _keys!1441)))))

(assert (=> d!115537 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823) e!537219)))

(assert (= (and d!115537 (not res!638666)) b!953631))

(assert (= (and b!953631 c!99795) b!953633))

(assert (= (and b!953631 (not c!99795)) b!953630))

(assert (= (and b!953633 res!638665) b!953632))

(assert (= (or b!953632 b!953630) bm!41643))

(declare-fun m!885021 () Bool)

(assert (=> bm!41643 m!885021))

(declare-fun m!885023 () Bool)

(assert (=> b!953631 m!885023))

(assert (=> b!953631 m!885023))

(declare-fun m!885025 () Bool)

(assert (=> b!953631 m!885025))

(assert (=> b!953633 m!885023))

(declare-fun m!885027 () Bool)

(assert (=> b!953633 m!885027))

(declare-fun m!885029 () Bool)

(assert (=> b!953633 m!885029))

(assert (=> b!953633 m!885023))

(declare-fun m!885031 () Bool)

(assert (=> b!953633 m!885031))

(assert (=> b!953580 d!115537))

(declare-fun d!115539 () Bool)

(assert (=> d!115539 (= (validMask!0 mask!1823) (and (or (= mask!1823 #b00000000000000000000000000000111) (= mask!1823 #b00000000000000000000000000001111) (= mask!1823 #b00000000000000000000000000011111) (= mask!1823 #b00000000000000000000000000111111) (= mask!1823 #b00000000000000000000000001111111) (= mask!1823 #b00000000000000000000000011111111) (= mask!1823 #b00000000000000000000000111111111) (= mask!1823 #b00000000000000000000001111111111) (= mask!1823 #b00000000000000000000011111111111) (= mask!1823 #b00000000000000000000111111111111) (= mask!1823 #b00000000000000000001111111111111) (= mask!1823 #b00000000000000000011111111111111) (= mask!1823 #b00000000000000000111111111111111) (= mask!1823 #b00000000000000001111111111111111) (= mask!1823 #b00000000000000011111111111111111) (= mask!1823 #b00000000000000111111111111111111) (= mask!1823 #b00000000000001111111111111111111) (= mask!1823 #b00000000000011111111111111111111) (= mask!1823 #b00000000000111111111111111111111) (= mask!1823 #b00000000001111111111111111111111) (= mask!1823 #b00000000011111111111111111111111) (= mask!1823 #b00000000111111111111111111111111) (= mask!1823 #b00000001111111111111111111111111) (= mask!1823 #b00000011111111111111111111111111) (= mask!1823 #b00000111111111111111111111111111) (= mask!1823 #b00001111111111111111111111111111) (= mask!1823 #b00011111111111111111111111111111) (= mask!1823 #b00111111111111111111111111111111)) (bvsle mask!1823 #b00111111111111111111111111111111)))))

(assert (=> start!81752 d!115539))

(declare-fun d!115541 () Bool)

(assert (=> d!115541 (= (array_inv!21607 _values!1197) (bvsge (size!28237 _values!1197) #b00000000000000000000000000000000))))

(assert (=> start!81752 d!115541))

(declare-fun d!115543 () Bool)

(assert (=> d!115543 (= (array_inv!21608 _keys!1441) (bvsge (size!28238 _keys!1441) #b00000000000000000000000000000000))))

(assert (=> start!81752 d!115543))

(declare-fun b!953640 () Bool)

(declare-fun e!537226 () Bool)

(assert (=> b!953640 (= e!537226 tp_is_empty!20839)))

(declare-fun mapNonEmpty!33220 () Bool)

(declare-fun mapRes!33220 () Bool)

(declare-fun tp!63610 () Bool)

(assert (=> mapNonEmpty!33220 (= mapRes!33220 (and tp!63610 e!537226))))

(declare-fun mapKey!33220 () (_ BitVec 32))

(declare-fun mapRest!33220 () (Array (_ BitVec 32) ValueCell!9938))

(declare-fun mapValue!33220 () ValueCell!9938)

(assert (=> mapNonEmpty!33220 (= mapRest!33211 (store mapRest!33220 mapKey!33220 mapValue!33220))))

(declare-fun b!953641 () Bool)

(declare-fun e!537225 () Bool)

(assert (=> b!953641 (= e!537225 tp_is_empty!20839)))

(declare-fun mapIsEmpty!33220 () Bool)

(assert (=> mapIsEmpty!33220 mapRes!33220))

(declare-fun condMapEmpty!33220 () Bool)

(declare-fun mapDefault!33220 () ValueCell!9938)

(assert (=> mapNonEmpty!33211 (= condMapEmpty!33220 (= mapRest!33211 ((as const (Array (_ BitVec 32) ValueCell!9938)) mapDefault!33220)))))

(assert (=> mapNonEmpty!33211 (= tp!63601 (and e!537225 mapRes!33220))))

(assert (= (and mapNonEmpty!33211 condMapEmpty!33220) mapIsEmpty!33220))

(assert (= (and mapNonEmpty!33211 (not condMapEmpty!33220)) mapNonEmpty!33220))

(assert (= (and mapNonEmpty!33220 ((_ is ValueCellFull!9938) mapValue!33220)) b!953640))

(assert (= (and mapNonEmpty!33211 ((_ is ValueCellFull!9938) mapDefault!33220)) b!953641))

(declare-fun m!885033 () Bool)

(assert (=> mapNonEmpty!33220 m!885033))

(check-sat (not bm!41643) (not b!953631) (not mapNonEmpty!33220) tp_is_empty!20839 (not b!953633))
(check-sat)
