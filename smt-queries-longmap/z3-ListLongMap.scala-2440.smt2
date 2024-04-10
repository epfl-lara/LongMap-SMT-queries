; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38460 () Bool)

(assert start!38460)

(declare-fun b!396866 () Bool)

(declare-fun e!240096 () Bool)

(assert (=> b!396866 (= e!240096 false)))

(declare-fun lt!187217 () Bool)

(declare-datatypes ((array!23671 0))(
  ( (array!23672 (arr!11285 (Array (_ BitVec 32) (_ BitVec 64))) (size!11637 (_ BitVec 32))) )
))
(declare-fun lt!187216 () array!23671)

(declare-datatypes ((List!6535 0))(
  ( (Nil!6532) (Cons!6531 (h!7387 (_ BitVec 64)) (t!11709 List!6535)) )
))
(declare-fun arrayNoDuplicates!0 (array!23671 (_ BitVec 32) List!6535) Bool)

(assert (=> b!396866 (= lt!187217 (arrayNoDuplicates!0 lt!187216 #b00000000000000000000000000000000 Nil!6532))))

(declare-fun b!396867 () Bool)

(declare-fun res!227768 () Bool)

(declare-fun e!240095 () Bool)

(assert (=> b!396867 (=> (not res!227768) (not e!240095))))

(declare-fun _keys!709 () array!23671)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23671 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396867 (= res!227768 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!396868 () Bool)

(declare-fun res!227761 () Bool)

(assert (=> b!396868 (=> (not res!227761) (not e!240095))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396868 (= res!227761 (or (= (select (arr!11285 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11285 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396869 () Bool)

(declare-fun res!227764 () Bool)

(assert (=> b!396869 (=> (not res!227764) (not e!240095))))

(assert (=> b!396869 (= res!227764 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11637 _keys!709))))))

(declare-fun b!396870 () Bool)

(declare-fun res!227767 () Bool)

(assert (=> b!396870 (=> (not res!227767) (not e!240095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396870 (= res!227767 (validKeyInArray!0 k0!794))))

(declare-fun b!396871 () Bool)

(declare-fun e!240094 () Bool)

(declare-fun tp_is_empty!9879 () Bool)

(assert (=> b!396871 (= e!240094 tp_is_empty!9879)))

(declare-fun b!396872 () Bool)

(declare-fun e!240092 () Bool)

(declare-fun e!240091 () Bool)

(declare-fun mapRes!16440 () Bool)

(assert (=> b!396872 (= e!240092 (and e!240091 mapRes!16440))))

(declare-fun condMapEmpty!16440 () Bool)

(declare-datatypes ((V!14277 0))(
  ( (V!14278 (val!4984 Int)) )
))
(declare-datatypes ((ValueCell!4596 0))(
  ( (ValueCellFull!4596 (v!7231 V!14277)) (EmptyCell!4596) )
))
(declare-datatypes ((array!23673 0))(
  ( (array!23674 (arr!11286 (Array (_ BitVec 32) ValueCell!4596)) (size!11638 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23673)

(declare-fun mapDefault!16440 () ValueCell!4596)

(assert (=> b!396872 (= condMapEmpty!16440 (= (arr!11286 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4596)) mapDefault!16440)))))

(declare-fun b!396873 () Bool)

(declare-fun res!227766 () Bool)

(assert (=> b!396873 (=> (not res!227766) (not e!240095))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396873 (= res!227766 (validMask!0 mask!1025))))

(declare-fun b!396874 () Bool)

(assert (=> b!396874 (= e!240091 tp_is_empty!9879)))

(declare-fun mapIsEmpty!16440 () Bool)

(assert (=> mapIsEmpty!16440 mapRes!16440))

(declare-fun b!396875 () Bool)

(declare-fun res!227765 () Bool)

(assert (=> b!396875 (=> (not res!227765) (not e!240095))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23671 (_ BitVec 32)) Bool)

(assert (=> b!396875 (= res!227765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396876 () Bool)

(declare-fun res!227762 () Bool)

(assert (=> b!396876 (=> (not res!227762) (not e!240095))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!396876 (= res!227762 (and (= (size!11638 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11637 _keys!709) (size!11638 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396877 () Bool)

(assert (=> b!396877 (= e!240095 e!240096)))

(declare-fun res!227760 () Bool)

(assert (=> b!396877 (=> (not res!227760) (not e!240096))))

(assert (=> b!396877 (= res!227760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187216 mask!1025))))

(assert (=> b!396877 (= lt!187216 (array!23672 (store (arr!11285 _keys!709) i!563 k0!794) (size!11637 _keys!709)))))

(declare-fun mapNonEmpty!16440 () Bool)

(declare-fun tp!32235 () Bool)

(assert (=> mapNonEmpty!16440 (= mapRes!16440 (and tp!32235 e!240094))))

(declare-fun mapKey!16440 () (_ BitVec 32))

(declare-fun mapValue!16440 () ValueCell!4596)

(declare-fun mapRest!16440 () (Array (_ BitVec 32) ValueCell!4596))

(assert (=> mapNonEmpty!16440 (= (arr!11286 _values!549) (store mapRest!16440 mapKey!16440 mapValue!16440))))

(declare-fun b!396878 () Bool)

(declare-fun res!227769 () Bool)

(assert (=> b!396878 (=> (not res!227769) (not e!240095))))

(assert (=> b!396878 (= res!227769 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6532))))

(declare-fun res!227763 () Bool)

(assert (=> start!38460 (=> (not res!227763) (not e!240095))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38460 (= res!227763 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11637 _keys!709))))))

(assert (=> start!38460 e!240095))

(assert (=> start!38460 true))

(declare-fun array_inv!8274 (array!23673) Bool)

(assert (=> start!38460 (and (array_inv!8274 _values!549) e!240092)))

(declare-fun array_inv!8275 (array!23671) Bool)

(assert (=> start!38460 (array_inv!8275 _keys!709)))

(assert (= (and start!38460 res!227763) b!396873))

(assert (= (and b!396873 res!227766) b!396876))

(assert (= (and b!396876 res!227762) b!396875))

(assert (= (and b!396875 res!227765) b!396878))

(assert (= (and b!396878 res!227769) b!396869))

(assert (= (and b!396869 res!227764) b!396870))

(assert (= (and b!396870 res!227767) b!396868))

(assert (= (and b!396868 res!227761) b!396867))

(assert (= (and b!396867 res!227768) b!396877))

(assert (= (and b!396877 res!227760) b!396866))

(assert (= (and b!396872 condMapEmpty!16440) mapIsEmpty!16440))

(assert (= (and b!396872 (not condMapEmpty!16440)) mapNonEmpty!16440))

(get-info :version)

(assert (= (and mapNonEmpty!16440 ((_ is ValueCellFull!4596) mapValue!16440)) b!396871))

(assert (= (and b!396872 ((_ is ValueCellFull!4596) mapDefault!16440)) b!396874))

(assert (= start!38460 b!396872))

(declare-fun m!392335 () Bool)

(assert (=> b!396867 m!392335))

(declare-fun m!392337 () Bool)

(assert (=> b!396877 m!392337))

(declare-fun m!392339 () Bool)

(assert (=> b!396877 m!392339))

(declare-fun m!392341 () Bool)

(assert (=> mapNonEmpty!16440 m!392341))

(declare-fun m!392343 () Bool)

(assert (=> b!396873 m!392343))

(declare-fun m!392345 () Bool)

(assert (=> b!396868 m!392345))

(declare-fun m!392347 () Bool)

(assert (=> b!396866 m!392347))

(declare-fun m!392349 () Bool)

(assert (=> b!396870 m!392349))

(declare-fun m!392351 () Bool)

(assert (=> b!396875 m!392351))

(declare-fun m!392353 () Bool)

(assert (=> start!38460 m!392353))

(declare-fun m!392355 () Bool)

(assert (=> start!38460 m!392355))

(declare-fun m!392357 () Bool)

(assert (=> b!396878 m!392357))

(check-sat (not b!396870) (not b!396875) (not start!38460) (not b!396873) tp_is_empty!9879 (not b!396866) (not b!396867) (not mapNonEmpty!16440) (not b!396877) (not b!396878))
(check-sat)
