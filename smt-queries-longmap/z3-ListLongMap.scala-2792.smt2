; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40626 () Bool)

(assert start!40626)

(declare-fun b_free!10651 () Bool)

(declare-fun b_next!10651 () Bool)

(assert (=> start!40626 (= b_free!10651 (not b_next!10651))))

(declare-fun tp!37772 () Bool)

(declare-fun b_and!18633 () Bool)

(assert (=> start!40626 (= tp!37772 b_and!18633)))

(declare-fun b!448546 () Bool)

(declare-fun e!263107 () Bool)

(declare-fun e!263108 () Bool)

(assert (=> b!448546 (= e!263107 e!263108)))

(declare-fun res!266714 () Bool)

(assert (=> b!448546 (=> (not res!266714) (not e!263108))))

(declare-datatypes ((array!27783 0))(
  ( (array!27784 (arr!13337 (Array (_ BitVec 32) (_ BitVec 64))) (size!13690 (_ BitVec 32))) )
))
(declare-fun lt!204008 () array!27783)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27783 (_ BitVec 32)) Bool)

(assert (=> b!448546 (= res!266714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204008 mask!1025))))

(declare-fun _keys!709 () array!27783)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448546 (= lt!204008 (array!27784 (store (arr!13337 _keys!709) i!563 k0!794) (size!13690 _keys!709)))))

(declare-fun b!448547 () Bool)

(assert (=> b!448547 (= e!263108 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17091 0))(
  ( (V!17092 (val!6039 Int)) )
))
(declare-datatypes ((tuple2!7932 0))(
  ( (tuple2!7933 (_1!3977 (_ BitVec 64)) (_2!3977 V!17091)) )
))
(declare-datatypes ((List!7995 0))(
  ( (Nil!7992) (Cons!7991 (h!8847 tuple2!7932) (t!13748 List!7995)) )
))
(declare-datatypes ((ListLongMap!6835 0))(
  ( (ListLongMap!6836 (toList!3433 List!7995)) )
))
(declare-fun lt!204007 () ListLongMap!6835)

(declare-fun minValue!515 () V!17091)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5651 0))(
  ( (ValueCellFull!5651 (v!8288 V!17091)) (EmptyCell!5651) )
))
(declare-datatypes ((array!27785 0))(
  ( (array!27786 (arr!13338 (Array (_ BitVec 32) ValueCell!5651)) (size!13691 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27785)

(declare-fun zeroValue!515 () V!17091)

(declare-fun v!412 () V!17091)

(declare-fun getCurrentListMapNoExtraKeys!1631 (array!27783 array!27785 (_ BitVec 32) (_ BitVec 32) V!17091 V!17091 (_ BitVec 32) Int) ListLongMap!6835)

(assert (=> b!448547 (= lt!204007 (getCurrentListMapNoExtraKeys!1631 lt!204008 (array!27786 (store (arr!13338 _values!549) i!563 (ValueCellFull!5651 v!412)) (size!13691 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204009 () ListLongMap!6835)

(assert (=> b!448547 (= lt!204009 (getCurrentListMapNoExtraKeys!1631 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!448549 () Bool)

(declare-fun res!266707 () Bool)

(assert (=> b!448549 (=> (not res!266707) (not e!263107))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448549 (= res!266707 (validKeyInArray!0 k0!794))))

(declare-fun b!448550 () Bool)

(declare-fun res!266718 () Bool)

(assert (=> b!448550 (=> (not res!266718) (not e!263107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448550 (= res!266718 (validMask!0 mask!1025))))

(declare-fun b!448551 () Bool)

(declare-fun res!266711 () Bool)

(assert (=> b!448551 (=> (not res!266711) (not e!263107))))

(assert (=> b!448551 (= res!266711 (or (= (select (arr!13337 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13337 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448552 () Bool)

(declare-fun res!266717 () Bool)

(assert (=> b!448552 (=> (not res!266717) (not e!263107))))

(assert (=> b!448552 (= res!266717 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13690 _keys!709))))))

(declare-fun mapNonEmpty!19617 () Bool)

(declare-fun mapRes!19617 () Bool)

(declare-fun tp!37773 () Bool)

(declare-fun e!263105 () Bool)

(assert (=> mapNonEmpty!19617 (= mapRes!19617 (and tp!37773 e!263105))))

(declare-fun mapValue!19617 () ValueCell!5651)

(declare-fun mapRest!19617 () (Array (_ BitVec 32) ValueCell!5651))

(declare-fun mapKey!19617 () (_ BitVec 32))

(assert (=> mapNonEmpty!19617 (= (arr!13338 _values!549) (store mapRest!19617 mapKey!19617 mapValue!19617))))

(declare-fun b!448553 () Bool)

(declare-fun res!266712 () Bool)

(assert (=> b!448553 (=> (not res!266712) (not e!263108))))

(declare-datatypes ((List!7996 0))(
  ( (Nil!7993) (Cons!7992 (h!8848 (_ BitVec 64)) (t!13749 List!7996)) )
))
(declare-fun arrayNoDuplicates!0 (array!27783 (_ BitVec 32) List!7996) Bool)

(assert (=> b!448553 (= res!266712 (arrayNoDuplicates!0 lt!204008 #b00000000000000000000000000000000 Nil!7993))))

(declare-fun b!448554 () Bool)

(declare-fun e!263106 () Bool)

(declare-fun tp_is_empty!11989 () Bool)

(assert (=> b!448554 (= e!263106 tp_is_empty!11989)))

(declare-fun mapIsEmpty!19617 () Bool)

(assert (=> mapIsEmpty!19617 mapRes!19617))

(declare-fun res!266716 () Bool)

(assert (=> start!40626 (=> (not res!266716) (not e!263107))))

(assert (=> start!40626 (= res!266716 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13690 _keys!709))))))

(assert (=> start!40626 e!263107))

(assert (=> start!40626 tp_is_empty!11989))

(assert (=> start!40626 tp!37772))

(assert (=> start!40626 true))

(declare-fun e!263103 () Bool)

(declare-fun array_inv!9722 (array!27785) Bool)

(assert (=> start!40626 (and (array_inv!9722 _values!549) e!263103)))

(declare-fun array_inv!9723 (array!27783) Bool)

(assert (=> start!40626 (array_inv!9723 _keys!709)))

(declare-fun b!448548 () Bool)

(declare-fun res!266708 () Bool)

(assert (=> b!448548 (=> (not res!266708) (not e!263107))))

(assert (=> b!448548 (= res!266708 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7993))))

(declare-fun b!448555 () Bool)

(assert (=> b!448555 (= e!263103 (and e!263106 mapRes!19617))))

(declare-fun condMapEmpty!19617 () Bool)

(declare-fun mapDefault!19617 () ValueCell!5651)

(assert (=> b!448555 (= condMapEmpty!19617 (= (arr!13338 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5651)) mapDefault!19617)))))

(declare-fun b!448556 () Bool)

(assert (=> b!448556 (= e!263105 tp_is_empty!11989)))

(declare-fun b!448557 () Bool)

(declare-fun res!266709 () Bool)

(assert (=> b!448557 (=> (not res!266709) (not e!263107))))

(declare-fun arrayContainsKey!0 (array!27783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448557 (= res!266709 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!448558 () Bool)

(declare-fun res!266710 () Bool)

(assert (=> b!448558 (=> (not res!266710) (not e!263108))))

(assert (=> b!448558 (= res!266710 (bvsle from!863 i!563))))

(declare-fun b!448559 () Bool)

(declare-fun res!266713 () Bool)

(assert (=> b!448559 (=> (not res!266713) (not e!263107))))

(assert (=> b!448559 (= res!266713 (and (= (size!13691 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13690 _keys!709) (size!13691 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448560 () Bool)

(declare-fun res!266715 () Bool)

(assert (=> b!448560 (=> (not res!266715) (not e!263107))))

(assert (=> b!448560 (= res!266715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40626 res!266716) b!448550))

(assert (= (and b!448550 res!266718) b!448559))

(assert (= (and b!448559 res!266713) b!448560))

(assert (= (and b!448560 res!266715) b!448548))

(assert (= (and b!448548 res!266708) b!448552))

(assert (= (and b!448552 res!266717) b!448549))

(assert (= (and b!448549 res!266707) b!448551))

(assert (= (and b!448551 res!266711) b!448557))

(assert (= (and b!448557 res!266709) b!448546))

(assert (= (and b!448546 res!266714) b!448553))

(assert (= (and b!448553 res!266712) b!448558))

(assert (= (and b!448558 res!266710) b!448547))

(assert (= (and b!448555 condMapEmpty!19617) mapIsEmpty!19617))

(assert (= (and b!448555 (not condMapEmpty!19617)) mapNonEmpty!19617))

(get-info :version)

(assert (= (and mapNonEmpty!19617 ((_ is ValueCellFull!5651) mapValue!19617)) b!448556))

(assert (= (and b!448555 ((_ is ValueCellFull!5651) mapDefault!19617)) b!448554))

(assert (= start!40626 b!448555))

(declare-fun m!432511 () Bool)

(assert (=> start!40626 m!432511))

(declare-fun m!432513 () Bool)

(assert (=> start!40626 m!432513))

(declare-fun m!432515 () Bool)

(assert (=> mapNonEmpty!19617 m!432515))

(declare-fun m!432517 () Bool)

(assert (=> b!448551 m!432517))

(declare-fun m!432519 () Bool)

(assert (=> b!448560 m!432519))

(declare-fun m!432521 () Bool)

(assert (=> b!448557 m!432521))

(declare-fun m!432523 () Bool)

(assert (=> b!448548 m!432523))

(declare-fun m!432525 () Bool)

(assert (=> b!448553 m!432525))

(declare-fun m!432527 () Bool)

(assert (=> b!448546 m!432527))

(declare-fun m!432529 () Bool)

(assert (=> b!448546 m!432529))

(declare-fun m!432531 () Bool)

(assert (=> b!448550 m!432531))

(declare-fun m!432533 () Bool)

(assert (=> b!448549 m!432533))

(declare-fun m!432535 () Bool)

(assert (=> b!448547 m!432535))

(declare-fun m!432537 () Bool)

(assert (=> b!448547 m!432537))

(declare-fun m!432539 () Bool)

(assert (=> b!448547 m!432539))

(check-sat (not b!448549) (not b!448548) (not b!448550) (not b!448560) (not b!448547) (not start!40626) (not b_next!10651) (not b!448553) (not b!448557) (not mapNonEmpty!19617) tp_is_empty!11989 b_and!18633 (not b!448546))
(check-sat b_and!18633 (not b_next!10651))
