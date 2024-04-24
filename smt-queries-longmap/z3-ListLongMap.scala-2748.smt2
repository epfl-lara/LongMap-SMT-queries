; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40312 () Bool)

(assert start!40312)

(declare-fun b!442868 () Bool)

(declare-fun res!262381 () Bool)

(declare-fun e!260625 () Bool)

(assert (=> b!442868 (=> (not res!262381) (not e!260625))))

(declare-datatypes ((array!27264 0))(
  ( (array!27265 (arr!13080 (Array (_ BitVec 32) (_ BitVec 64))) (size!13432 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27264)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442868 (= res!262381 (or (= (select (arr!13080 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13080 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442869 () Bool)

(declare-fun res!262378 () Bool)

(assert (=> b!442869 (=> (not res!262378) (not e!260625))))

(declare-datatypes ((List!7751 0))(
  ( (Nil!7748) (Cons!7747 (h!8603 (_ BitVec 64)) (t!13501 List!7751)) )
))
(declare-fun arrayNoDuplicates!0 (array!27264 (_ BitVec 32) List!7751) Bool)

(assert (=> b!442869 (= res!262378 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7748))))

(declare-fun b!442870 () Bool)

(declare-fun e!260628 () Bool)

(declare-fun e!260629 () Bool)

(declare-fun mapRes!19212 () Bool)

(assert (=> b!442870 (= e!260628 (and e!260629 mapRes!19212))))

(declare-fun condMapEmpty!19212 () Bool)

(declare-datatypes ((V!16739 0))(
  ( (V!16740 (val!5907 Int)) )
))
(declare-datatypes ((ValueCell!5519 0))(
  ( (ValueCellFull!5519 (v!8159 V!16739)) (EmptyCell!5519) )
))
(declare-datatypes ((array!27266 0))(
  ( (array!27267 (arr!13081 (Array (_ BitVec 32) ValueCell!5519)) (size!13433 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27266)

(declare-fun mapDefault!19212 () ValueCell!5519)

(assert (=> b!442870 (= condMapEmpty!19212 (= (arr!13081 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5519)) mapDefault!19212)))))

(declare-fun b!442871 () Bool)

(declare-fun res!262382 () Bool)

(assert (=> b!442871 (=> (not res!262382) (not e!260625))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442871 (= res!262382 (validKeyInArray!0 k0!794))))

(declare-fun b!442872 () Bool)

(declare-fun e!260627 () Bool)

(assert (=> b!442872 (= e!260627 false)))

(declare-fun lt!203282 () Bool)

(declare-fun lt!203283 () array!27264)

(assert (=> b!442872 (= lt!203282 (arrayNoDuplicates!0 lt!203283 #b00000000000000000000000000000000 Nil!7748))))

(declare-fun b!442873 () Bool)

(declare-fun res!262373 () Bool)

(assert (=> b!442873 (=> (not res!262373) (not e!260625))))

(declare-fun arrayContainsKey!0 (array!27264 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442873 (= res!262373 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!442875 () Bool)

(declare-fun e!260630 () Bool)

(declare-fun tp_is_empty!11725 () Bool)

(assert (=> b!442875 (= e!260630 tp_is_empty!11725)))

(declare-fun mapNonEmpty!19212 () Bool)

(declare-fun tp!37194 () Bool)

(assert (=> mapNonEmpty!19212 (= mapRes!19212 (and tp!37194 e!260630))))

(declare-fun mapKey!19212 () (_ BitVec 32))

(declare-fun mapValue!19212 () ValueCell!5519)

(declare-fun mapRest!19212 () (Array (_ BitVec 32) ValueCell!5519))

(assert (=> mapNonEmpty!19212 (= (arr!13081 _values!549) (store mapRest!19212 mapKey!19212 mapValue!19212))))

(declare-fun b!442876 () Bool)

(assert (=> b!442876 (= e!260629 tp_is_empty!11725)))

(declare-fun b!442877 () Bool)

(declare-fun res!262380 () Bool)

(assert (=> b!442877 (=> (not res!262380) (not e!260625))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442877 (= res!262380 (validMask!0 mask!1025))))

(declare-fun res!262377 () Bool)

(assert (=> start!40312 (=> (not res!262377) (not e!260625))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40312 (= res!262377 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13432 _keys!709))))))

(assert (=> start!40312 e!260625))

(assert (=> start!40312 true))

(declare-fun array_inv!9556 (array!27266) Bool)

(assert (=> start!40312 (and (array_inv!9556 _values!549) e!260628)))

(declare-fun array_inv!9557 (array!27264) Bool)

(assert (=> start!40312 (array_inv!9557 _keys!709)))

(declare-fun b!442874 () Bool)

(assert (=> b!442874 (= e!260625 e!260627)))

(declare-fun res!262379 () Bool)

(assert (=> b!442874 (=> (not res!262379) (not e!260627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27264 (_ BitVec 32)) Bool)

(assert (=> b!442874 (= res!262379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203283 mask!1025))))

(assert (=> b!442874 (= lt!203283 (array!27265 (store (arr!13080 _keys!709) i!563 k0!794) (size!13432 _keys!709)))))

(declare-fun b!442878 () Bool)

(declare-fun res!262375 () Bool)

(assert (=> b!442878 (=> (not res!262375) (not e!260625))))

(assert (=> b!442878 (= res!262375 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13432 _keys!709))))))

(declare-fun b!442879 () Bool)

(declare-fun res!262376 () Bool)

(assert (=> b!442879 (=> (not res!262376) (not e!260625))))

(assert (=> b!442879 (= res!262376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!19212 () Bool)

(assert (=> mapIsEmpty!19212 mapRes!19212))

(declare-fun b!442880 () Bool)

(declare-fun res!262374 () Bool)

(assert (=> b!442880 (=> (not res!262374) (not e!260625))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!442880 (= res!262374 (and (= (size!13433 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13432 _keys!709) (size!13433 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!40312 res!262377) b!442877))

(assert (= (and b!442877 res!262380) b!442880))

(assert (= (and b!442880 res!262374) b!442879))

(assert (= (and b!442879 res!262376) b!442869))

(assert (= (and b!442869 res!262378) b!442878))

(assert (= (and b!442878 res!262375) b!442871))

(assert (= (and b!442871 res!262382) b!442868))

(assert (= (and b!442868 res!262381) b!442873))

(assert (= (and b!442873 res!262373) b!442874))

(assert (= (and b!442874 res!262379) b!442872))

(assert (= (and b!442870 condMapEmpty!19212) mapIsEmpty!19212))

(assert (= (and b!442870 (not condMapEmpty!19212)) mapNonEmpty!19212))

(get-info :version)

(assert (= (and mapNonEmpty!19212 ((_ is ValueCellFull!5519) mapValue!19212)) b!442875))

(assert (= (and b!442870 ((_ is ValueCellFull!5519) mapDefault!19212)) b!442876))

(assert (= start!40312 b!442870))

(declare-fun m!429603 () Bool)

(assert (=> start!40312 m!429603))

(declare-fun m!429605 () Bool)

(assert (=> start!40312 m!429605))

(declare-fun m!429607 () Bool)

(assert (=> b!442871 m!429607))

(declare-fun m!429609 () Bool)

(assert (=> b!442869 m!429609))

(declare-fun m!429611 () Bool)

(assert (=> b!442879 m!429611))

(declare-fun m!429613 () Bool)

(assert (=> b!442868 m!429613))

(declare-fun m!429615 () Bool)

(assert (=> b!442872 m!429615))

(declare-fun m!429617 () Bool)

(assert (=> b!442873 m!429617))

(declare-fun m!429619 () Bool)

(assert (=> b!442874 m!429619))

(declare-fun m!429621 () Bool)

(assert (=> b!442874 m!429621))

(declare-fun m!429623 () Bool)

(assert (=> mapNonEmpty!19212 m!429623))

(declare-fun m!429625 () Bool)

(assert (=> b!442877 m!429625))

(check-sat (not start!40312) (not b!442869) (not b!442879) (not b!442871) (not b!442873) (not b!442877) tp_is_empty!11725 (not b!442874) (not b!442872) (not mapNonEmpty!19212))
(check-sat)
