; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35784 () Bool)

(assert start!35784)

(declare-fun b!359517 () Bool)

(declare-fun res!199843 () Bool)

(declare-fun e!220225 () Bool)

(assert (=> b!359517 (=> (not res!199843) (not e!220225))))

(declare-datatypes ((array!20038 0))(
  ( (array!20039 (arr!9512 (Array (_ BitVec 32) (_ BitVec 64))) (size!9864 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20038)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20038 (_ BitVec 32)) Bool)

(assert (=> b!359517 (= res!199843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!359518 () Bool)

(declare-fun res!199842 () Bool)

(assert (=> b!359518 (=> (not res!199842) (not e!220225))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((V!11979 0))(
  ( (V!11980 (val!4170 Int)) )
))
(declare-datatypes ((ValueCell!3782 0))(
  ( (ValueCellFull!3782 (v!6365 V!11979)) (EmptyCell!3782) )
))
(declare-datatypes ((array!20040 0))(
  ( (array!20041 (arr!9513 (Array (_ BitVec 32) ValueCell!3782)) (size!9865 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20040)

(assert (=> b!359518 (= res!199842 (and (= (size!9865 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9864 _keys!1456) (size!9865 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359519 () Bool)

(declare-fun e!220227 () Bool)

(declare-fun tp_is_empty!8251 () Bool)

(assert (=> b!359519 (= e!220227 tp_is_empty!8251)))

(declare-fun mapIsEmpty!13884 () Bool)

(declare-fun mapRes!13884 () Bool)

(assert (=> mapIsEmpty!13884 mapRes!13884))

(declare-fun res!199841 () Bool)

(assert (=> start!35784 (=> (not res!199841) (not e!220225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35784 (= res!199841 (validMask!0 mask!1842))))

(assert (=> start!35784 e!220225))

(assert (=> start!35784 true))

(declare-fun e!220224 () Bool)

(declare-fun array_inv!7032 (array!20040) Bool)

(assert (=> start!35784 (and (array_inv!7032 _values!1208) e!220224)))

(declare-fun array_inv!7033 (array!20038) Bool)

(assert (=> start!35784 (array_inv!7033 _keys!1456)))

(declare-fun mapNonEmpty!13884 () Bool)

(declare-fun tp!27951 () Bool)

(assert (=> mapNonEmpty!13884 (= mapRes!13884 (and tp!27951 e!220227))))

(declare-fun mapRest!13884 () (Array (_ BitVec 32) ValueCell!3782))

(declare-fun mapValue!13884 () ValueCell!3782)

(declare-fun mapKey!13884 () (_ BitVec 32))

(assert (=> mapNonEmpty!13884 (= (arr!9513 _values!1208) (store mapRest!13884 mapKey!13884 mapValue!13884))))

(declare-fun b!359520 () Bool)

(declare-fun e!220226 () Bool)

(assert (=> b!359520 (= e!220224 (and e!220226 mapRes!13884))))

(declare-fun condMapEmpty!13884 () Bool)

(declare-fun mapDefault!13884 () ValueCell!3782)

(assert (=> b!359520 (= condMapEmpty!13884 (= (arr!9513 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3782)) mapDefault!13884)))))

(declare-fun b!359521 () Bool)

(assert (=> b!359521 (= e!220226 tp_is_empty!8251)))

(declare-fun b!359522 () Bool)

(assert (=> b!359522 (= e!220225 false)))

(declare-fun lt!166382 () Bool)

(declare-datatypes ((List!5381 0))(
  ( (Nil!5378) (Cons!5377 (h!6233 (_ BitVec 64)) (t!10523 List!5381)) )
))
(declare-fun arrayNoDuplicates!0 (array!20038 (_ BitVec 32) List!5381) Bool)

(assert (=> b!359522 (= lt!166382 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5378))))

(assert (= (and start!35784 res!199841) b!359518))

(assert (= (and b!359518 res!199842) b!359517))

(assert (= (and b!359517 res!199843) b!359522))

(assert (= (and b!359520 condMapEmpty!13884) mapIsEmpty!13884))

(assert (= (and b!359520 (not condMapEmpty!13884)) mapNonEmpty!13884))

(get-info :version)

(assert (= (and mapNonEmpty!13884 ((_ is ValueCellFull!3782) mapValue!13884)) b!359519))

(assert (= (and b!359520 ((_ is ValueCellFull!3782) mapDefault!13884)) b!359521))

(assert (= start!35784 b!359520))

(declare-fun m!357255 () Bool)

(assert (=> b!359517 m!357255))

(declare-fun m!357257 () Bool)

(assert (=> start!35784 m!357257))

(declare-fun m!357259 () Bool)

(assert (=> start!35784 m!357259))

(declare-fun m!357261 () Bool)

(assert (=> start!35784 m!357261))

(declare-fun m!357263 () Bool)

(assert (=> mapNonEmpty!13884 m!357263))

(declare-fun m!357265 () Bool)

(assert (=> b!359522 m!357265))

(check-sat (not start!35784) (not b!359517) tp_is_empty!8251 (not mapNonEmpty!13884) (not b!359522))
(check-sat)
